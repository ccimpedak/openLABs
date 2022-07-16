unit UnitFOWorklist;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniGUIBaseClasses, uniPanel, uniButton, uniBitBtn,
  uniSpeedButton, uniEdit, uniLabel, UnitReportDisplay, UnitQz,
  System.NetEncoding, uniURLFrame, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, MainModule,
  uniGUIApplication, uniStatusBar, Vcl.ExtCtrls, uniTimer, uniMultiItem,
  uniComboBox, uniDBComboBox, uniDBLookupComboBox, uniCheckBox,
  System.StrUtils, System.Types, uniMemo;

type
  TUniFOWorklist = class(TUniFrame)
    UniContainerPanel1: TUniContainerPanel;
    UniLabel1: TUniLabel;
    edNamaPrinter: TUniEdit;
    btnSimpan: TUniSpeedButton;
    UniContainerPanel2: TUniContainerPanel;
    UniLabel2: TUniLabel;
    edNoTrans: TUniEdit;
    btnPreview: TUniSpeedButton;
    btnCetak: TUniSpeedButton;
    btnStar: TUniSpeedButton;
    btnStop: TUniSpeedButton;
    UniURLFrame1: TUniURLFrame;
    QData: TFDQuery;
    cmdExe: TFDCommand;
    QHdr: TFDQuery;
    stBar: TUniStatusBar;
    UniTimer1: TUniTimer;
    UniSpeedButton1: TUniSpeedButton;
    UniLabel3: TUniLabel;
    cbESCPOS: TUniCheckBox;
    UniLabel4: TUniLabel;
    UniSpeedButton2: TUniSpeedButton;
    lblRjk: TUniLabel;
    edLastNo: TUniEdit;
    QRec: TFDQuery;
    QGrup: TFDQuery;
    QDtl: TFDQuery;
    Like: TUniCheckBox;
    edLike: TUniEdit;
    btnLabel: TUniSpeedButton;
    UniLabel5: TUniLabel;
    edPrinterLabel: TUniEdit;
    QLabel: TFDQuery;
    cbPrintLabel: TUniCheckBox;
    procedure btnCetakClick(Sender: TObject);
    procedure btnPreviewClick(Sender: TObject);
    procedure UniFrameBeforeReady(Sender: TObject);
    procedure btnSimpanClick(Sender: TObject);
    procedure btnStarClick(Sender: TObject);
    procedure btnStopClick(Sender: TObject);
    procedure UniTimer1Timer(Sender: TObject);
    procedure UniSpeedButton1Click(Sender: TObject);
    procedure UniSpeedButton2Click(Sender: TObject);
    procedure UniButton1Click(Sender: TObject);
    procedure LikeChange(Sender: TObject);
    procedure btnLabelClick(Sender: TObject);
  private
    { Private declarations }
    procedure cetakWorklist(no_transaksi: String);
    procedure cetakWorklistESCPOS(no_transaksi: String);
    procedure printLabel(no_pendaftaran: string);
    function sqlStr(): string;

  var
    LastNo: String;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses UnitPilihRujukan, UnitReportJasper;

function TUniFOWorklist.sqlStr(): string;
var
  rjkArr: TStringDynArray;
  sqlStr, sRjk: string;
begin
  rjkArr := SplitString(lblRjk.Caption, ',');
  sqlStr := '';
  for sRjk in rjkArr do
  begin
    if sqlStr <> '' then
      sqlStr := sqlStr + ',';
    sqlStr := sqlStr + QuotedStr(sRjk);
  end;
  Result := '(' + sqlStr + ')';
end;

procedure TUniFOWorklist.cetakWorklist(no_transaksi: String);
var
  filename, printer: string;
  status: boolean;
begin
  // ShowMask('Loading');
  try
    // UniSession.Synchronize();
    // filename := reportExecReqPrinterParams(edNamaPrinter.Text, 'pdf',
    // 'worklist', no_transaksi, '', '', status);
    filename := reportExecReqFileParams('pdf', 'worklist', no_transaksi, '',
      '', status);

    if status then
    begin
      UniSession.AddJS(printKePrinter(edNamaPrinter.Text, filename));
      if cmdExe.Active then
        cmdExe.Active := False;
      cmdExe.Params.Clear;
      cmdExe.Params.Add.Name := 'no_pendaftaran';
      cmdExe.ParamByName('no_pendaftaran').Value := no_transaksi;
      cmdExe.CommandText.Text :=
        'UPDATE worklist_header set print_status = 1 WHERE no_pendaftaran=:no_pendaftaran ';
      cmdExe.Execute();

      // update parameters
      if no_transaksi <> '' then
      begin
        if cmdExe.Active then
          cmdExe.Active := False;
        cmdExe.Params.Clear;
        cmdExe.Params.Add.Name := 'name';
        cmdExe.ParamByName('name').Value := 'WORKLIST_LASTNO';
        cmdExe.Params.Add.Name := 'no_pendaftaran';
        cmdExe.ParamByName('no_pendaftaran').Value := no_transaksi;
        cmdExe.Params.Add.Name := 'user_id';
        cmdExe.ParamByName('user_id').Value := UniApplication.Cookies.GetCookie
          ('UserId');
        cmdExe.CommandText.Text :=
          'UPDATE user_parameters set value = :no_pendaftaran WHERE name=:name and user_id=:user_id ';
        cmdExe.Execute();
      end;

    end
    else
      showMessage(filename);
  except
    on E: Exception do
    begin
      showMessage(E.ClassName + ' error raised, with message : ' + E.Message);
    end;
  end;

  // HideMask;
end;

procedure TUniFOWorklist.cetakWorklistESCPOS(no_transaksi: String);
var
  filename, printer, headerTemplate, grupTemplate, detailTemplate, headerPrint,
    grupPrint, detailPrint: string;
  status: boolean;
begin
  try
    UniSession.Synchronize();

    // header template
    if QData.Active then
      QData.Active := False;
    QData.SQL.Text := 'select value_text from parameters where name = ' +
      QuotedStr('ESCPOS_WORKLIST_HEADER') + '';
    QData.Active := True;
    headerTemplate := QData.FieldByName('value_text').AsString;

    // grup template
    if QData.Active then
      QData.Active := False;
    QData.SQL.Text := 'select value_text from parameters where name = ' +
      QuotedStr('ESCPOS_WORKLIST_GRUP') + '';
    QData.Active := True;
    grupTemplate := QData.FieldByName('value_text').AsString;

    // detail template
    if QData.Active then
      QData.Active := False;
    QData.SQL.Text := 'select value_text from parameters where name = ' +
      QuotedStr('ESCPOS_WORKLIST_DETAIL') + '';
    QData.Active := True;
    detailTemplate := QData.FieldByName('value_text').AsString;

    // Header
    if QData.Active then
      QData.Active := False;
    QData.SQL.Text :=
      'select no_urutlab,nama,no_pendaftaran,tanggal_lahir,kd_jenis_kelamin,norm,ruangan,tanggal_terima,cara_bayar,diagnosa from worklist_header where no_pendaftaran = '
      + QuotedStr(no_transaksi) + '';
    QData.Active := True;

    headerPrint := headerTemplate;
    headerPrint := StringReplace(headerPrint, '<no_urutlab>',
      QData.FieldByName('no_urutlab').AsString, [rfReplaceAll]);
    headerPrint := StringReplace(headerPrint, '<nama>',
      QData.FieldByName('nama').AsString, [rfReplaceAll]);
    headerPrint := StringReplace(headerPrint, '<no_pendaftaran>',
      QData.FieldByName('no_pendaftaran').AsString, [rfReplaceAll]);
    headerPrint := StringReplace(headerPrint, '<tanggal_lahir>',
      QData.FieldByName('tanggal_lahir').AsString, [rfReplaceAll]);
    headerPrint := StringReplace(headerPrint, '<kd_jenis_kelamin>',
      QData.FieldByName('kd_jenis_kelamin').AsString, [rfReplaceAll]);
    headerPrint := StringReplace(headerPrint, '<norm>',
      QData.FieldByName('norm').AsString, [rfReplaceAll]);
    headerPrint := StringReplace(headerPrint, '<ruangan>',
      QData.FieldByName('ruangan').AsString, [rfReplaceAll]);
    headerPrint := StringReplace(headerPrint, '<tanggal_terima>',
      QData.FieldByName('tanggal_terima').AsString, [rfReplaceAll]);
    headerPrint := StringReplace(headerPrint, '<cara_bayar>',
      QData.FieldByName('cara_bayar').AsString, [rfReplaceAll]);
    headerPrint := StringReplace(headerPrint, '<diagnosa>',
      QData.FieldByName('diagnosa').AsString, [rfReplaceAll]);

    // print berdasarkan grup
    if QGrup.Active then
      QGrup.Active := False;
    QGrup.SQL.Text :=
      'select distinct grup_id,grup.nama grup from worklist_tindakan left join test_grup on worklist_tindakan.kd_tindakan = test_grup.kode left join grup on  test_grup.grup_id = grup.id where no_pendaftaran = '
      + QuotedStr(no_transaksi) + '';
    QGrup.Active := True;

    QGrup.First;
    while not QGrup.Eof do
    begin
      if QDtl.Active then
        QDtl.Active := False;
      QDtl.ParamByName('no_pendaftaran').Value := no_transaksi;
      QDtl.ParamByName('grup_id').Value := QGrup.FieldByName('grup_id')
        .AsInteger;
      QDtl.Active := True;

      // grup template
      grupPrint := grupTemplate;
      grupPrint := StringReplace(grupPrint, '<grup>', QGrup.FieldByName('grup')
        .AsString, [rfReplaceAll]);

      // detail template
      detailPrint := '';

      QDtl.First;
      while not QDtl.Eof do
      begin
        detailPrint := detailPrint + StringReplace(detailTemplate,
          '<nm_tindakan>', QDtl.FieldByName('nm_tindakan').AsString,
          [rfReplaceAll]);
        QDtl.Next;
      end;

      // printing disini
      UniSession.AddJS(printKePrinterESCPOS(edNamaPrinter.Text, headerPrint,
        grupPrint, detailPrint));

      QGrup.Next;

    end;

  except
    on E: Exception do
    begin
      showMessage(E.ClassName + ' error raised, with message : ' + E.Message);
    end;
  end;

  // HideMask;
end;

procedure TUniFOWorklist.LikeChange(Sender: TObject);
begin
  edLike.Enabled := False;
  if Like.Checked then
  begin
    edLike.Enabled := True;
  end;
end;

procedure TUniFOWorklist.UniButton1Click(Sender: TObject);
begin
  showMessage(sqlStr);
end;

procedure TUniFOWorklist.UniFrameBeforeReady(Sender: TObject);
begin
  if QData.Active then
    QData.Active := False;
  QData.SQL.Text := 'SELECT value FROM user_parameters WHERE name = ' +
    QuotedStr('WORKLIST_PRINTER') + ' AND user_id = ' +
    UniApplication.Cookies.GetCookie('UserId');
  QData.Active := True;
  if QData.RecordCount > 0 then
    edNamaPrinter.Text := QData.FieldByName('value').AsString;

  if QData.Active then
    QData.Active := False;
  QData.SQL.Text := 'SELECT value FROM user_parameters WHERE name = ' +
    QuotedStr('LABEL_PRINTER') + ' AND user_id = ' +
    UniApplication.Cookies.GetCookie('UserId');
  QData.Active := True;
  if QData.RecordCount > 0 then
    edPrinterLabel.Text := QData.FieldByName('value').AsString
  else
    edPrinterLabel.Text := 'LABEL';

  if QData.Active then
    QData.Active := False;
  QData.SQL.Text := 'SELECT value FROM user_parameters WHERE name = ' +
    QuotedStr('LABEL_PRINTER_CHECKED') + ' AND user_id = ' +
    UniApplication.Cookies.GetCookie('UserId');
  QData.Active := True;
  if QData.RecordCount > 0 then
  begin
    cbPrintLabel.Checked := False;
    if QData.FieldByName('value').AsString = '1' then
      cbPrintLabel.Checked := True;
  end;

  if QData.Active then
    QData.Active := False;
  QData.SQL.Text := 'SELECT value FROM user_parameters WHERE name = ' +
    QuotedStr('WORKLIST_LASTNO') + ' AND user_id = ' +
    UniApplication.Cookies.GetCookie('UserId');
  QData.Active := True;
  if QData.RecordCount > 0 then
    edLastNo.Text := QData.FieldByName('value').AsString;

  if QData.Active then
    QData.Active := False;
  QData.SQL.Text := 'SELECT value FROM user_parameters WHERE name = ' +
    QuotedStr('WORKLIST_RUJUKAN') + ' AND user_id = ' +
    UniApplication.Cookies.GetCookie('UserId');
  QData.Active := True;
  if QData.RecordCount > 0 then
    lblRjk.Caption := QData.FieldByName('value').AsString;

  if QData.Active then
    QData.Active := False;
  QData.SQL.Text := 'SELECT value FROM user_parameters WHERE name = ' +
    QuotedStr('WORKLIST_LIKE') + ' AND user_id = ' +
    UniApplication.Cookies.GetCookie('UserId');
  QData.Active := True;
  if QData.RecordCount > 0 then
    edLike.Text := QData.FieldByName('value').AsString;

  if QData.Active then
    QData.Active := False;
  QData.SQL.Text := 'SELECT value FROM user_parameters WHERE name = ' +
    QuotedStr('WORKLIST_LIKE_CHECKED') + ' AND user_id = ' +
    UniApplication.Cookies.GetCookie('UserId');
  QData.Active := True;
  if QData.RecordCount > 0 then
  begin
    Like.Checked := False;
    if QData.FieldByName('value').AsString = '1' then
    begin
      Like.Checked := True;
      edLike.Enabled := True;
    End;

  end;

end;

procedure TUniFOWorklist.UniSpeedButton1Click(Sender: TObject);
begin
  if QData.Active then
    QData.Active := False;
  QData.SQL.Text :=
    'SELECT count(*) jum FROM worklist_header WHERE no_pendaftaran = ' +
    QuotedStr(edNoTrans.Text);
  QData.Active := True;

  if QData.FieldByName('jum').AsInteger > 0 then
  begin

    if cmdExe.Active then
      cmdExe.Active := False;
    cmdExe.Params.Clear;
    cmdExe.Params.Add.Name := 'nomor';
    cmdExe.ParamByName('nomor').Value := edNoTrans.Text;
    cmdExe.Params.Add.Name := 'user_id';
    cmdExe.ParamByName('user_id').Value := UniApplication.Cookies.GetCookie
      ('UserId');
    cmdExe.CommandText.Text :=
      'insert into kirim_order (nomor,user_id) values (:nomor,:user_id)';
    cmdExe.Execute();
    showMessage('Pengiriman diproses.');
  end
  else
  begin
    showMessage('No pendaftaran [' + edNoTrans.Text + '] tidak ditemukan.');
  end;
end;

procedure TUniFOWorklist.UniSpeedButton2Click(Sender: TObject);
begin
  if frmPilihRujukan.ShowModal = mrOK then
  begin
    lblRjk.Caption := frmPilihRujukan.selectedRjk;
  end;
end;

procedure TUniFOWorklist.btnSimpanClick(Sender: TObject);
begin
  ShowMask('Loading');
  if cmdExe.Active then
    cmdExe.Active := False;
  cmdExe.Params.Clear;
  cmdExe.Params.Add.Name := 'name';
  cmdExe.ParamByName('name').Value := 'WORKLIST_PRINTER';
  cmdExe.Params.Add.Name := 'value';
  cmdExe.ParamByName('value').Value := edNamaPrinter.Text;
  cmdExe.Params.Add.Name := 'user_id';
  cmdExe.ParamByName('user_id').Value := UniApplication.Cookies.GetCookie
    ('UserId');
  cmdExe.CommandText.Text :=
    'DELETE FROM user_parameters WHERE name=:name and user_id=:user_id; INSERT INTO user_parameters (user_id,name,value) VALUES (:user_id,:name,:value) ;';
  cmdExe.Execute();
  //
  ShowMask('Loading');
  if cmdExe.Active then
    cmdExe.Active := False;
  cmdExe.Params.Clear;
  cmdExe.Params.Add.Name := 'name';
  cmdExe.ParamByName('name').Value := 'LABEL_PRINTER';
  cmdExe.Params.Add.Name := 'value';
  cmdExe.ParamByName('value').Value := edPrinterLabel.Text;
  cmdExe.Params.Add.Name := 'user_id';
  cmdExe.ParamByName('user_id').Value := UniApplication.Cookies.GetCookie
    ('UserId');
  cmdExe.CommandText.Text :=
    'DELETE FROM user_parameters WHERE name=:name and user_id=:user_id; INSERT INTO user_parameters (user_id,name,value) VALUES (:user_id,:name,:value) ;';
  cmdExe.Execute();
  //
  if cmdExe.Active then
    cmdExe.Active := False;
  cmdExe.Params.Clear;
  cmdExe.Params.Add.Name := 'name';
  cmdExe.ParamByName('name').Value := 'WORKLIST_RUJUKAN';
  cmdExe.Params.Add.Name := 'value';
  cmdExe.ParamByName('value').Value := lblRjk.Caption;
  cmdExe.Params.Add.Name := 'user_id';
  cmdExe.ParamByName('user_id').Value := UniApplication.Cookies.GetCookie
    ('UserId');
  cmdExe.CommandText.Text :=
    'DELETE FROM user_parameters WHERE name=:name and user_id=:user_id; INSERT INTO user_parameters (user_id,name,value) VALUES (:user_id,:name,:value) ;';
  cmdExe.Execute();
  //

  if edLastNo.Text = '' then
  begin
    if QRec.Active then
      QRec.Active := False;
    QRec.SQL.Text :=
      'SELECT no_pendaftaran FROM worklist_header  WHERE print_status = 0 and rujukan in '
      + sqlStr() +
      'and  STR_TO_DATE(tanggal_terima, "%d/%m/%Y %H:%i:%s")  >= now() ';
    QRec.Active := True;
    QRec.First;
    edLastNo.Text := QRec.FieldByName('no_pendaftaran').AsString;
  end;
  //
  if cmdExe.Active then
    cmdExe.Active := False;
  cmdExe.Params.Clear;
  cmdExe.Params.Add.Name := 'name';
  cmdExe.ParamByName('name').Value := 'WORKLIST_LASTNO';
  cmdExe.Params.Add.Name := 'value';
  cmdExe.ParamByName('value').Value := edLastNo.Text;
  cmdExe.Params.Add.Name := 'user_id';
  cmdExe.ParamByName('user_id').Value := UniApplication.Cookies.GetCookie
    ('UserId');
  cmdExe.CommandText.Text :=
    'DELETE FROM user_parameters WHERE name=:name and user_id=:user_id; INSERT INTO user_parameters (user_id,name,value) VALUES (:user_id,:name,:value) ;';
  cmdExe.Execute();

  //
  if cmdExe.Active then
    cmdExe.Active := False;
  cmdExe.Params.Clear;
  cmdExe.Params.Add.Name := 'name';
  cmdExe.ParamByName('name').Value := 'WORKLIST_LIKE';
  cmdExe.Params.Add.Name := 'value';
  cmdExe.ParamByName('value').Value := edLike.Text;
  cmdExe.Params.Add.Name := 'user_id';
  cmdExe.ParamByName('user_id').Value := UniApplication.Cookies.GetCookie
    ('UserId');
  cmdExe.CommandText.Text :=
    'DELETE FROM user_parameters WHERE name=:name and user_id=:user_id; INSERT INTO user_parameters (user_id,name,value) VALUES (:user_id,:name,:value) ;';
  cmdExe.Execute();

  //
  if cmdExe.Active then
    cmdExe.Active := False;
  cmdExe.Params.Clear;
  cmdExe.Params.Add.Name := 'name';
  cmdExe.ParamByName('name').Value := 'WORKLIST_LIKE_CHECKED';
  cmdExe.Params.Add.Name := 'value';
  cmdExe.ParamByName('value').Value := '0';
  if Like.Checked then
    cmdExe.ParamByName('value').Value := '1';
  cmdExe.Params.Add.Name := 'user_id';
  cmdExe.ParamByName('user_id').Value := UniApplication.Cookies.GetCookie
    ('UserId');
  cmdExe.CommandText.Text :=
    'DELETE FROM user_parameters WHERE name=:name and user_id=:user_id; INSERT INTO user_parameters (user_id,name,value) VALUES (:user_id,:name,:value) ;';
  cmdExe.Execute();

  // print label
  if cmdExe.Active then
    cmdExe.Active := False;
  cmdExe.Params.Clear;
  cmdExe.Params.Add.Name := 'name';
  cmdExe.ParamByName('name').Value := 'PRINT_LABEL_CHECKED';
  cmdExe.Params.Add.Name := 'value';
  cmdExe.ParamByName('value').Value := '0';
  if cbPrintLabel.Checked then
    cmdExe.ParamByName('value').Value := '1';
  cmdExe.Params.Add.Name := 'user_id';
  cmdExe.ParamByName('user_id').Value := UniApplication.Cookies.GetCookie
    ('UserId');
  cmdExe.CommandText.Text :=
    'DELETE FROM user_parameters WHERE name=:name and user_id=:user_id; INSERT INTO user_parameters (user_id,name,value) VALUES (:user_id,:name,:value) ;';
  cmdExe.Execute();

  HideMask;
end;

procedure TUniFOWorklist.printLabel(no_pendaftaran: string);
var
  I: integer;
begin
  ShowMask('Loading');
  UniSession.Synchronize();
  try
    if QLabel.Active then
      QLabel.Active := False;

    QLabel.ParamByName('no_pendaftaran').Value := no_pendaftaran;
    // QHdr.FieldByName('no_pendaftaran').AsString;
    QLabel.Active := True;
    QLabel.First;

    while not QLabel.Eof do
    begin
      for I := 0 to QLabel.FieldByName('print_qty').AsInteger do
      begin
        UniSession.AddJS(printKePrinterLabel(edPrinterLabel.Text,
          QLabel.FieldByName('no_pendaftaran').AsString,
          QLabel.FieldByName('kode').AsString, QLabel.FieldByName('sid_desc')
          .AsString, QLabel.FieldByName('nama').AsString,
          QLabel.FieldByName('tanggal_terima').AsString,
          QLabel.FieldByName('usia').AsString));
      end;
      QLabel.Next;
    end;
  except
    on E: Exception do
    begin
      showMessage(E.ClassName + ' error raised, with message : ' + E.Message);
    end;
  end;
  HideMask;
end;

procedure TUniFOWorklist.btnLabelClick(Sender: TObject);
var
  I: integer;
begin
  ShowMask('Loading');

  try
    if QLabel.Active then
      QLabel.Active := False;

    QLabel.ParamByName('no_pendaftaran').Value := edNoTrans.Text;
    // QHdr.FieldByName('no_pendaftaran').AsString;
    QLabel.Active := True;
    QLabel.First;
    UniSession.Synchronize();

    while not QLabel.Eof do
    begin
      for I := 0 to QLabel.FieldByName('print_qty').AsInteger do
      begin
        UniSession.AddJS(printKePrinterLabel(edPrinterLabel.Text,
          QLabel.FieldByName('no_pendaftaran').AsString,
          QLabel.FieldByName('kode').AsString, QLabel.FieldByName('sid_desc')
          .AsString, QLabel.FieldByName('nama').AsString,
          QLabel.FieldByName('tanggal_terima').AsString,
          QLabel.FieldByName('usia').AsString));
        Sleep(50);
      end;
      QLabel.Next;
    end;
    Sleep(500);
    UniSession.Synchronize();
  except
    on E: Exception do
    begin
      showMessage(E.ClassName + ' error raised, with message : ' + E.Message);
    end;
  end;
  HideMask;
end;

procedure TUniFOWorklist.btnPreviewClick(Sender: TObject);
var
  Result, filter1, filter2, filter3: string;
  nama_report, printer: string;
  status: boolean;
begin
  ShowMask('Loading');
  UniSession.Synchronize();
  UniURLFrame1.URL := reportExecReqParams('pdf', 'worklist',
    edNoTrans.Text, '', '');
  HideMask;

end;

procedure TUniFOWorklist.btnCetakClick(Sender: TObject);
var
  filename, printer: string;
  status: boolean;
begin
  ShowMask('Loading');
  try
    UniSession.Synchronize();

    if cbESCPOS.Checked then
    begin
      cetakWorklistESCPOS(edNoTrans.Text);
    end
    else
    begin
      filename := reportExecReqFileParams('html', 'worklist', edNoTrans.Text,
        '', '', status);
      if status then
      begin
        UniSession.AddJS(printKePrinter(edNamaPrinter.Text, filename));
      end
      else
        showMessage(filename);
    end;
  except
    on E: Exception do
    begin
      showMessage(E.ClassName + ' error raised, with message : ' + E.Message);
    end;
  end;

  HideMask;
end;

procedure TUniFOWorklist.UniTimer1Timer(Sender: TObject);
begin
  UniSession.Synchronize();
  stBar.Panels[0].Text := 'Processing...';
  if QHdr.Active then
    QHdr.Active := False;

  if edLastNo.Text = '' then
  begin
    if QData.Active then
      QData.Active := False;
    QData.SQL.Text := 'SELECT value FROM user_parameters WHERE name = ' +
      QuotedStr('WORKLIST_LASTNO') + ' AND user_id = ' +
      UniApplication.Cookies.GetCookie('UserId');
    QData.Active := True;
    if QData.RecordCount > 0 then
      edLastNo.Text := QData.FieldByName('value').AsString;
  end;

  LastNo := edLastNo.Text;

  if QHdr.Active then
    QHdr.Active := False;
  if not Like.Checked then
  begin

    // clean up date sebelumnya
    // if cmdExe.Active then
    // cmdExe.Active := False;
    // cmdExe.Params.Clear;
    // cmdExe.CommandText.Text :=
    // 'update worklist_header set print_status = 1 WHERE print_status = 0 and rujukan in '
    // + sqlStr() + ' and  no_pendaftaran <= ' + QuotedStr(edLastNo.Text) + ' ';
    // cmdExe.Execute();

    // QHdr.SQL.Text :=
    // 'SELECT no_pendaftaran,nama  FROM worklist_header  WHERE print_status = 0 and rujukan in '
    // + sqlStr() + ' and  no_pendaftaran > ' + QuotedStr(edLastNo.Text) +
    // ' and ruangan NOT IN (' + QuotedStr('Induk - PMI') + ') ';

    QHdr.SQL.Text :=
      'SELECT no_pendaftaran,nama  FROM worklist_print  WHERE rujukan in ' +
      sqlStr() + ' and  no_pendaftaran > ' + QuotedStr(LastNo) + ' ';

  end
  else
  begin

    // clean up date sebelumnya
    // if cmdExe.Active then
    // cmdExe.Active := False;
    // cmdExe.Params.Clear;
    // cmdExe.CommandText.Text :=
    // 'update worklist_header set print_status = 1 WHERE print_status = 0 and no_urutlab like '
    // + QuotedStr(edLike.Text) + ' and  no_pendaftaran <= ' +
    // QuotedStr(edLastNo.Text) + ' ';
    // cmdExe.Execute();

    // cari berdasarkan Like nomor Urut
    // QHdr.SQL.Text :=
    // 'SELECT no_pendaftaran,nama  FROM worklist_header  WHERE print_status = 0 and no_urutlab like '
    // + QuotedStr(edLike.Text) + ' and  no_pendaftaran > ' +
    // QuotedStr(edLastNo.Text) + ' and ruangan NOT IN (' +
    // QuotedStr('Induk - PMI') + ') ';

    QHdr.SQL.Text :=
      'SELECT no_pendaftaran,nama  FROM worklist_print  WHERE  rujukan in ' +
      sqlStr() + ' and  no_pendaftaran > ' + QuotedStr(LastNo) +
      '  and no_urutlab like  ' + QuotedStr(edLike.Text);

  end;

  QHdr.Active := True;
  QHdr.First;
  while not QHdr.Eof do
  begin
    UniSession.Synchronize();
    stBar.Panels[0].Text := 'Proses no pendaftaran [' +
      QHdr.FieldByName('no_pendaftaran').AsString + '] nama pasien [' +
      QHdr.FieldByName('nama').AsString + '] ...';
    UniSession.Synchronize();
    stBar.Panels[0].Text := 'Printing...';
    if cbESCPOS.Checked then
      cetakWorklistESCPOS(QHdr.FieldByName('no_pendaftaran').AsString)
    else
      cetakWorklist(QHdr.FieldByName('no_pendaftaran').AsString);

    if cbPrintLabel.Checked then
      printLabel(QHdr.FieldByName('no_pendaftaran').AsString);

    if QHdr.FieldByName('no_pendaftaran').AsString <> '' then
      LastNo := QHdr.FieldByName('no_pendaftaran').AsString;

    Sleep(500);

    // update last no
    // if cmdExe.Active then
    // cmdExe.Active := False;
    // cmdExe.Params.Clear;
    // cmdExe.Params.Add.Name := 'name';
    // cmdExe.ParamByName('name').Value := 'WORKLIST_LASTNO';
    // cmdExe.Params.Add.Name := 'value';
    // cmdExe.ParamByName('value').Value :=
    // QHdr.FieldByName('no_pendaftaran').AsString;
    // cmdExe.Params.Add.Name := 'user_id';
    // cmdExe.ParamByName('user_id').Value := UniApplication.Cookies.GetCookie
    // ('UserId');
    // cmdExe.CommandText.Text :=
    // 'DELETE FROM user_parameters WHERE name=:name and user_id=:user_id; INSERT INTO user_parameters (user_id,name,value) VALUES (:user_id,:name,:value) ;';
    // cmdExe.Execute();

    // Clean up date sebelumnya
    // if not Like.Checked then
    // begin
    // // clean up date sebelumnya
    // if cmdExe.Active then
    // cmdExe.Active := False;
    // cmdExe.Params.Clear;
    // cmdExe.CommandText.Text :=
    // 'update worklist_header set print_status = 1 WHERE print_status = 0 and rujukan in '
    // + sqlStr() + ' and  no_pendaftaran <= ' +
    // QuotedStr(QHdr.FieldByName('no_pendaftaran').AsString) + ' ';
    // cmdExe.Execute();
    // end
    // else
    // begin
    // // clean up date sebelumnya
    // if cmdExe.Active then
    // cmdExe.Active := False;
    // cmdExe.Params.Clear;
    // cmdExe.CommandText.Text :=
    // 'update worklist_header set print_status = 1 WHERE print_status = 0 and no_urutlab like '
    // + QuotedStr(edLike.Text) + ' and  no_pendaftaran <= ' +
    // QuotedStr(QHdr.FieldByName('no_pendaftaran').AsString) + ' ';
    // cmdExe.Execute();
    // end;

    if cmdExe.Active then
      cmdExe.Active := False;
    cmdExe.Params.Clear;
    cmdExe.CommandText.Text :=
      'delete from worklist_print where no_pendaftaran = ' +
      QuotedStr(LastNo) + ' ';
    cmdExe.Execute();

    // edLastNo.Text := QHdr.FieldByName('no_pendaftaran').AsString;

    QHdr.Next;
  end;

  edLastNo.Text := LastNo;

  // ambil edit text
  // if QData.Active then
  // QData.Active := False;
  // QData.SQL.Text := 'SELECT value FROM user_parameters WHERE name = ' +
  // QuotedStr('WORKLIST_LASTNO') + ' AND user_id = ' +
  // UniApplication.Cookies.GetCookie('UserId');
  // QData.Active := True;
  // if QData.RecordCount > 0 then
  // edLastNo.Text := QData.FieldByName('value').AsString;

  Sleep(2000);
  UniSession.Synchronize();

  if btnStop.Enabled then
  begin
    UniTimer1.Enabled := True;
    UniSession.Synchronize();
    stBar.Panels[0].Text := 'Sleeping...';
  end
  else
  begin
    UniTimer1.Enabled := False;
    UniSession.Synchronize();
    stBar.Panels[0].Text := 'Stoped.';
  end;
end;

procedure TUniFOWorklist.btnStarClick(Sender: TObject);
begin
  if lblRjk.Caption = '<empty>' then
  begin
    showMessage('Rujukan belum dipilih, pilih rujukan dan Simpan dahulu.');
    exit;
  end;

  if edLastNo.Text = '' then
  begin
    showMessage('Last nomor transaksi kosong isi transaksi terakhir.');
    edLastNo.SetFocus;
    exit;
  end;

  // simpan
  btnSimpanClick(self);

  stBar.Panels[0].Text := 'Starting with printer [' + edNamaPrinter.Text
    + '] ...';

  edNamaPrinter.Enabled := False;
  btnSimpan.Enabled := False;
  btnStop.Enabled := True;
  btnStar.Enabled := False;
  edLastNo.Enabled := False;

  stBar.Panels[0].Text := 'Starting timer...';
  UniTimer1.Enabled := True;

end;

procedure TUniFOWorklist.btnStopClick(Sender: TObject);
begin

  edNamaPrinter.Enabled := True;
  btnSimpan.Enabled := True;
  btnStop.Enabled := False;
  btnStar.Enabled := True;
  edLastNo.Enabled := True;
  UniSession.Synchronize();
  UniTimer1.Enabled := False;

  // simpan last no
  if QHdr.FieldByName('no_pendaftaran').AsString <> '' then
  begin
    if cmdExe.Active then
      cmdExe.Active := False;
    cmdExe.Params.Clear;
    cmdExe.Params.Add.Name := 'name';
    cmdExe.ParamByName('name').Value := 'WORKLIST_LASTNO';
    cmdExe.Params.Add.Name := 'value';
    cmdExe.ParamByName('value').Value :=
      QHdr.FieldByName('no_pendaftaran').AsString;
    cmdExe.Params.Add.Name := 'user_id';
    cmdExe.ParamByName('user_id').Value := UniApplication.Cookies.GetCookie
      ('UserId');
    cmdExe.CommandText.Text :=
      'DELETE FROM user_parameters WHERE name=:name and user_id=:user_id; INSERT INTO user_parameters (user_id,name,value) VALUES (:user_id,:name,:value) ;';
    cmdExe.Execute();
  end;

  stBar.Panels[0].Text := 'Stoped.';
end;

initialization

RegisterClass(TUniFOWorklist);

end.
