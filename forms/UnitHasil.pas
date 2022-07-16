unit UnitHasil;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGroupBox, uniGUIBaseClasses, uniPanel, uniEdit,
  uniDBEdit, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdTime,
  IdUnixTime, uniLabel, uniButton, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uniBasicGrid, uniDBGrid, uniBitBtn,
  uniSpeedButton, Vcl.Menus, uniMainMenu, uniMenuButton, uniPageControl,
  uniMultiItem, uniComboBox, uniDBComboBox, uniDBLookupComboBox, uniURLFrame,
  uniListBox;

type
  TfrmHasil = class(TUniForm)
    UniContainerPanel1: TUniContainerPanel;
    UniContainerPanel2: TUniContainerPanel;
    UniContainerPanel3: TUniContainerPanel;
    UniContainerPanel4: TUniContainerPanel;
    UniLabel1: TUniLabel;
    UniLabel2: TUniLabel;
    UniContainerPanel5: TUniContainerPanel;
    QHdr: TFDQuery;
    UniDBEdit1: TUniDBEdit;
    DSHdr: TDataSource;
    UniDBEdit2: TUniDBEdit;
    UniDBEdit3: TUniDBEdit;
    UniDBEdit4: TUniDBEdit;
    UniDBEdit5: TUniDBEdit;
    UniDBEdit6: TUniDBEdit;
    UniDBEdit7: TUniDBEdit;
    UniDBEdit8: TUniDBEdit;
    UniDBGrid1: TUniDBGrid;
    QDtl: TFDQuery;
    DSDtl: TDataSource;
    QPDF: TFDQuery;
    btnPDF: TUniSpeedButton;
    cmdExec: TFDCommand;
    UniLabel3: TUniLabel;
    QRole: TFDQuery;
    btnEmail: TUniSpeedButton;
    UniPopupMenu1: TUniPopupMenu;
    a1: TUniMenuItem;
    QData: TFDQuery;
    QDtlTEST_CD: TStringField;
    QDtlTEST_NM: TStringField;
    QDtlRESULT_VALUE: TStringField;
    QDtlUNIT: TStringField;
    QDtlFLAG: TStringField;
    QDtlREF_RANGE: TStringField;
    QDtlVALIDATE_BY: TStringField;
    QDtlvalidasi_pada: TStringField;
    UniPageControl1: TUniPageControl;
    tsHasil: TUniTabSheet;
    tsReportView: TUniTabSheet;
    UniContainerPanel6: TUniContainerPanel;
    UniLabel4: TUniLabel;
    cbTest: TUniDBLookupComboBox;
    UniSpeedButton1: TUniSpeedButton;
    UniURLFrame1: TUniURLFrame;
    QReport: TFDQuery;
    DSReport: TDataSource;
    QParameter: TFDQuery;
    UniContainerPanel7: TUniContainerPanel;
    btnDownRep: TUniMenuButton;
    DataSource1: TDataSource;
    UniDBEdit9: TUniDBEdit;
    procedure UniFormAfterShow(Sender: TObject);
    procedure btnPDFClick(Sender: TObject);
    procedure btnEmailClick(Sender: TObject);
    procedure UniDBGrid1DrawColumnCell(Sender: TObject; ACol, ARow: Integer;
      Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
    procedure UniFormBeforeShow(Sender: TObject);
    procedure UniSpeedButton1Click(Sender: TObject);
    procedure UniDBGrid1SelectionChange(Sender: TObject);
  private
    { Private declarations }
    procedure reportView();

  var
    JASPER_RESULT: boolean;
    SelectedTest: string;
  public
    { Public declarations }
    order_id: Integer;
    procedure HandlePopupItem(Sender: TObject);
  end;

function frmHasil: TfrmHasil;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, UnitElektronikHasilView, UnitReportJasper,
  UnitReportDisplay;

function frmHasil: TfrmHasil;
begin
  Result := TfrmHasil(UniMainModule.GetFormInstance(TfrmHasil));
end;

procedure TfrmHasil.reportView();
begin
  UniURLFrame1.URL := reportExecReqParams('html', QReport.FieldByName('kode')
    .AsString, QHdr.FieldByName('nomor').AsString, '', '');
end;

procedure TfrmHasil.UniDBGrid1DrawColumnCell(Sender: TObject;
  ACol, ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
begin
  if ((UniDBGrid1.Columns[4].Field.AsString = 'H') or
    (UniDBGrid1.Columns[4].Field.AsString = 'L')) and (ACol = 2) then
  begin
    Attribs.Font.Color := clRed;
  end;

  if ((UniDBGrid1.Columns[4].Field.AsString = 'KRITIS HIGH') or
    (UniDBGrid1.Columns[4].Field.AsString = 'KRITIS LOW') or
    (UniDBGrid1.Columns[4].Field.AsString = 'KRITIS')) and (ACol = 2) then
  begin
    Attribs.Color := clRed;
  end;

  // Attribs.Font.Color := clRed;
  // if Column.Field.AsInteger > 1 then
  // begin
  // Attribs.Font.Color := clRed;
  // Attribs.Color := clWhite;
  // end
  // else
  // begin
  // Attribs.Font.Color := clYellow;
  // Attribs.Color := clblack;
  // end;
end;

procedure TfrmHasil.UniDBGrid1SelectionChange(Sender: TObject);
var
  i: Integer;
  DataSet: TDataSet;
begin
  // SelectedTest := '';
  // if UniDBGrid1.SelectedRows.Count > 0 then
  // begin
  // DataSet := UniDBGrid1.DataSource.DataSet;
  // try
  // DataSet.DisableControls;
  // for i := 0 to UniDBGrid1.SelectedRows.Count - 1 do
  // begin
  // DataSet.GotoBookmark(Pointer(UniDBGrid1.SelectedRows.Items[i]));
  // if (i > 0) then
  // SelectedTest := SelectedTest + ',' + DataSet.Fields[0].AsString
  // else
  // SelectedTest := DataSet.Fields[0].AsString;
  // end;
  // finally
  // DataSet.EnableControls;
  // end;
  // end;
end;

procedure TfrmHasil.UniFormAfterShow(Sender: TObject);
var
  user_profile_id: string;
  Item: TUniMenuItem;
  ROLE_RESULT_PDF_VIEW, ROLE_VIEW_CONFIDENTIAL_RESULT, ROLE_RESULT_PDF_EMAIL,
    file_pdf_exists: boolean;
begin

  ROLE_VIEW_CONFIDENTIAL_RESULT := False;
  ROLE_RESULT_PDF_VIEW := False;

  user_profile_id := UniApplication.Cookies.GetCookie('user_profile_id');

  if QRole.Active then
    QRole.Active := False;
  QRole.ParamByName('role').Value := 'ROLE_VIEW_CONFIDENTIAL_RESULT';
  QRole.ParamByName('user_profile_id').Value := user_profile_id;
  QRole.Active := True;
  if QRole.RecordCount > 0 then
    ROLE_VIEW_CONFIDENTIAL_RESULT := True;

  if QRole.Active then
    QRole.Active := False;
  QRole.ParamByName('role').Value := 'ROLE_RESULT_PDF_VIEW';
  QRole.ParamByName('user_profile_id').Value := user_profile_id;
  QRole.Active := True;
  if QRole.RecordCount > 0 then
    ROLE_RESULT_PDF_VIEW := True;

  if QRole.Active then
    QRole.Active := False;
  QRole.ParamByName('role').Value := 'ROLE_RESULT_PDF_EMAIL';
  QRole.ParamByName('user_profile_id').Value := user_profile_id;
  QRole.Active := True;
  if QRole.RecordCount > 0 then
    ROLE_RESULT_PDF_EMAIL := True;

  /// Get header data

  if QHdr.Active then
    QHdr.Active := False;
  QHdr.ParamByName('header_id').Value := order_id;
  QHdr.Active := True;

  if QPDF.Active then
    QPDF.Active := False;
  QPDF.ParamByName('nomor').Value := QHdr.FieldByName('nomor').AsString;
  QPDF.Active := True;

  btnPDF.Visible := False;
  btnEmail.Visible := False;

  // PDF report  BUTTON PDF AND EMAIL STATUS
  if QPDF.Active then
    QPDF.Active := False;
  QPDF.ParamByName('nomor').Value := QHdr.FieldByName('nomor').AsString;
  QPDF.Active := True;

  file_pdf_exists := False;
  file_pdf_exists := FileExists(QPDF.FieldByName('pdf_file').AsString);

  if ROLE_RESULT_PDF_EMAIL then
  begin
    btnEmail.Visible := True;
    btnEmail.Enabled := False;
    if (QPDF.RecordCount > 0) and (file_pdf_exists) then
    begin
      btnEmail.Enabled := True;
    end;
  end;

  if ROLE_RESULT_PDF_VIEW then
  begin
    btnPDF.Visible := True;
    if (QPDF.RecordCount > 0) and (file_pdf_exists) then
    begin
      btnPDF.Enabled := True;
    end;

  end;

  UniPopupMenu1.Items.Clear;

  // drop down menu
  if ROLE_VIEW_CONFIDENTIAL_RESULT then
  begin
    if QData.Active then
      QData.Active := False;

    QData.SQL.Text := 'SELECT * FROM report_hasil WHERE flg_confidential = 1 ';
    QData.Active := True;

    QData.First;
    while not QData.Eof do
    begin
      Item := TUniMenuItem.Create(UniPopupMenu1);
      Item.Name := 'mnuRep_' + QData.FieldByName('id').AsString;
      Item.Caption := QData.FieldByName('nama').AsString;
      Item.OnClick := HandlePopupItem;
      UniPopupMenu1.Items.Add(Item);
      QData.Next;
    end;
  end;
  if ROLE_RESULT_PDF_VIEW then
  begin
    if QData.Active then
      QData.Active := False;

    QData.SQL.Text := 'SELECT * FROM report_hasil WHERE flg_confidential = 0 ';
    QData.Active := True;

    QData.First;
    while not QData.Eof do
    begin
      Item := TUniMenuItem.Create(self);
      Item.Name := 'mnuRep_' + QData.FieldByName('id').AsString;
      Item.Caption := QData.FieldByName('nama').AsString;
      Item.OnClick := HandlePopupItem;
      UniPopupMenu1.Items.Add(Item);
      QData.Next;
    end;
  end;

  btnDownRep.DropdownMenu := UniPopupMenu1;

  if ROLE_VIEW_CONFIDENTIAL_RESULT or ROLE_RESULT_PDF_VIEW then
  begin
    btnDownRep.Visible := True;
  end
  else
    btnDownRep.Visible := False;

  // user_profile_id := UniApplication.Cookies.GetCookie('user_profile_id');

  // if QRole.Active then
  // QRole.Active := False;
  // QRole.ParamByName('user_profile_id').Value := 'ROLE_RESULT_PDF_VIEW';
  // QRole.ParamByName('user_profile_id').Value := user_profile_id;
  // QRole.Active := True;
  //
  // if QRole.RecordCount > 0 then
  // begin
  // btnPDF.Enabled := False;
  // end;
  //
  // if QRole.Active then
  // QRole.Active := False;
  // QRole.ParamByName('user_profile_id').Value := 'ROLE_RESULT_PDF_EMAIL';
  // QRole.ParamByName('user_profile_id').Value := user_profile_id;
  // QRole.Active := True;
  //
  // if QRole.RecordCount > 0 then
  // begin
  // btnEmail.Enabled := False;
  // end;

  if QDtl.Active then
    QDtl.Active := False;
  QDtl.ParamByName('header_id').Value := order_id;
  QDtl.ParamByName('user_profile_id').Value := UniApplication.Cookies.GetCookie
    ('user_profile_id');
  QDtl.Active := True;

  if JASPER_RESULT then
    reportView;
end;

procedure TfrmHasil.UniFormBeforeShow(Sender: TObject);
begin
  UniPageControl1.ActivePage := tsHasil;
  // cek apakah ada jasper koneksi untuk report viewer
  if QParameter.Active then
    QParameter.Active := False;
  QParameter.ParamByName('name').Value := 'JASPER_RESULT';
  QParameter.Active := True;

  JASPER_RESULT := False;

  if (QParameter.RecordCount > 0) and
    (QParameter.FieldByName('value_num').AsInteger = 1) then
    JASPER_RESULT := True;

  tsReportView.Visible := False;
  if JASPER_RESULT then
  begin
    QReport.Open();
    tsReportView.Visible := True;
  end;
end;

procedure TfrmHasil.UniSpeedButton1Click(Sender: TObject);
begin
  reportView();
end;

procedure TfrmHasil.HandlePopupItem(Sender: TObject);
var
  Result, filter1, filter2, filter3: string;
  nama_report, printer: string;
  status: boolean;
begin
  if QData.Active then
    QData.Active := False;
  QData.SQL.Text := 'select kode from report_hasil where nama = ' +
    QuotedStr(TMenuItem(Sender).Caption);
  QData.Active := True;

  ShowMask('Loading');
  UniSession.Synchronize();
  frmReportDisplay.UniURLFrame1.URL := reportExecReqParams('pdf',
    QData.FieldByName('kode').AsString, QHdr.FieldByName('nomor')
    .AsString, '', '');
  frmReportDisplay.ShowModal();
  HideMask;

end;

procedure TfrmHasil.btnEmailClick(Sender: TObject);
begin
  if QPDF.RecordCount > 0 then
  begin
    if cmdExec.Active then
      cmdExec.Active := False;
    cmdExec.ParamByName('header_id').Value := order_id;
    cmdExec.Execute();

    frmElektronikHasilView.id := order_id;
    frmElektronikHasilView.nomor := QHdr.FieldByName('nomor').AsString;
    frmElektronikHasilView.edReceipt.Text := QHdr.FieldByName('email').AsString;
    frmElektronikHasilView.ShowModal;

  end;
end;

procedure TfrmHasil.btnPDFClick(Sender: TObject);
begin
  UniSession.SendFile(QPDF.FieldByName('pdf_file').AsString);
end;

end.
