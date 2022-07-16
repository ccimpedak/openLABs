unit UnitPasienHistori;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniPanel, uniBasicGrid,
  uniDBGrid, uniDBPivotGrid, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uniStringGrid, uniMemo, uniButton,
  uniBitBtn, uniSpeedButton, uniLabel, StrUtils;

type
  TfrmPasienHistori = class(TUniForm)
    UniContainerPanel1: TUniContainerPanel;
    UniContainerPanel2: TUniContainerPanel;
    QHistori: TFDQuery;
    DSHistori: TDataSource;
    strGrd: TUniStringGrid;
    QData: TFDQuery;
    UniButton1: TUniButton;
    btnEnvChart: TUniSpeedButton;
    UniLabel1: TUniLabel;
    QConfidential: TFDQuery;
    QRole: TFDQuery;
    QData2: TFDQuery;
    QLen: TFDQuery;
    UniButton2: TUniButton;
    procedure UniFormBeforeShow(Sender: TObject);
    procedure strGrdDrawCell(Sender: TObject; ACol, ARow: Integer;
      var Value: string; Attribs: TUniCellAttribs);
    procedure UniButton1Click(Sender: TObject);
    procedure strGrdFrDrawCell(Sender: TObject; ACol, ARow: Integer;
      var Value: string; Attribs: TUniCellAttribs);
    procedure UniFormCreate(Sender: TObject);
    procedure btnEnvChartClick(Sender: TObject);
    procedure UniButton2Click(Sender: TObject);
    procedure strGrdClick(Sender: TObject);
    procedure strGrdSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  var
    pasien_id: Integer;
  end;

function frmPasienHistori: TfrmPasienHistori;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, UnitEnvChart;

function frmPasienHistori: TfrmPasienHistori;
begin
  Result := TfrmPasienHistori(UniMainModule.GetFormInstance(TfrmPasienHistori));
end;

procedure TfrmPasienHistori.strGrdClick(Sender: TObject);
begin
  ShowMask('Loading');
  UniSession.Synchronize();
  if strGrd.Cells[2, strGrd.Row] <> '' then
  begin
    btnEnvChart.Caption := 'Evol. Chart [' + strGrd.Cells[2, strGrd.Row] + ']';
    btnEnvChart.Enabled := True;
  end
  else
  begin
    btnEnvChart.Caption := 'Evol. Chart';
    btnEnvChart.Enabled := False;
  end;
  HideMask;
end;

procedure TfrmPasienHistori.strGrdDrawCell(Sender: TObject; ACol, ARow: Integer;
  var Value: string; Attribs: TUniCellAttribs);
begin
  if (ACol >= 3) then
    Attribs.Style.Style := 'text-align: center;';
end;

procedure TfrmPasienHistori.strGrdFrDrawCell(Sender: TObject;
  ACol, ARow: Integer; var Value: string; Attribs: TUniCellAttribs);
begin
  if (ACol >= 3) then
    Attribs.Style.Style := 'text-align: center;';
end;

procedure TfrmPasienHistori.strGrdSelectCell(Sender: TObject;
  ACol, ARow: Integer; var CanSelect: Boolean);
begin
  ShowMask('Loading');
  UniSession.Synchronize();
  if strGrd.Cells[2, strGrd.Row] <> '' then
  begin
    btnEnvChart.Caption := 'Evol. Chart [' + strGrd.Cells[2, strGrd.Row] + ']';
    btnEnvChart.Enabled := True;
  end
  else
  begin
    btnEnvChart.Caption := 'Evol. Chart';
    btnEnvChart.Enabled := False;
  end;
  HideMask;
end;

procedure TfrmPasienHistori.UniButton1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmPasienHistori.UniButton2Click(Sender: TObject);
begin
  UniSession.AddJS
    ('Ext.toast({html: "Hasil pasien TEST : albumin <strong>354</strong>", header: false, autoCloseDelay: 2000});');
end;

procedure TfrmPasienHistori.UniFormBeforeShow(Sender: TObject);
var
  r, c: Integer;
  I: Integer;
  J: Integer;
  lenOrderId: Integer;
begin
  if QHistori.Active then
    QHistori.Active := False;
  QHistori.ParamByName('pasien_id').Value := pasien_id;
  QHistori.Active := True;

  if QLen.Active then
    QLen.Active := False;
  QLen.ParamByName('pasien_id').Value := pasien_id;
  QLen.Active := True;
  lenOrderId := QLen.FieldByName('len').AsInteger;

  // title
  strGrd.Cells[3, 0] := 'Ref.Ranges';
  // strGrdFr.Cells[3, 0] := 'Ref.Ranges';

  // Column
  if QData.Active then
    QData.Active := False;
  QData.SQL.Text := 'SELECT distinct CONCAT(result_detail.id,' + QuotedStr(' (')
    + ',left(order_header.tanggal,10),' + QuotedStr(')') + ') id FROM ' +
    'result_detail ' +
    ' left join order_header on result_detail.id = order_header.nomor ' +
    ' WHERE ' + ' result_detail.id IN ( ' + 'SELECT nomor ' + 'FROM ' +
    'order_header  ' + 'WHERE ' + 'pasien_id = ' + intToStr(pasien_id) + ' ) ' +
    'ORDER BY result_detail.id desc';
  QData.Active := True;
  // showMessage(QData.SQL.Text);

  strGrd.ColCount := QData.RecordCount + 4;

  r := 4;
  QData.First;
  while not QData.Eof do
  begin
    strGrd.Cells[r, 0] := QData.FieldByName('id').AsString;
    strGrd.ColWidths[r] := 200;
    QData.Next;
    r := r + 1;
  end;

  // Rows
  if QData.Active then
    QData.Active := False;

  QData.SQL.Text :=
    'SELECT DISTINCT result_detail.test_cd,result_detail.test_nm ,grup.nama grup '
    + 'FROM result_detail ' +
    'LEFT JOIN test_grup ON result_detail.TEST_CD = test_grup.kode ' +
    'LEFT JOIN grup ON test_grup.grup_id = grup.id ' +
    'LEFT JOIN test_urut ON test_grup.kode = test_urut.kode ' +
    'WHERE result_detail.id IN (' + 'SELECT nomor ' + 'FROM order_header ' +
    'WHERE pasien_id = ' + intToStr(pasien_id) + ' ) ' +
    'ORDER BY result_detail.test_cd';
  QData.Active := True;

  // strGrdFr.RowCount := QData.RecordCount + 1;
  strGrd.RowCount := QData.RecordCount + 1;

  r := 1;
  QData.First;
  while not QData.Eof do
  begin
    strGrd.Cells[0, r] := QData.FieldByName('test_cd').AsString;
    strGrd.Cells[1, r] := QData.FieldByName('grup').AsString;
    strGrd.Cells[2, r] := QData.FieldByName('test_nm').AsString;
    // strGrd.Cells[3, r] := QData.FieldByName('ref_range').AsString;
    strGrd.ColWidths[0] := 60;
    strGrd.ColWidths[1] := 110;
    strGrd.ColWidths[2] := 160;
    strGrd.ColWidths[3] := 100;

    QData.Next;
    r := r + 1;
  end;

  // isi ref ranges

  for J := 1 to strGrd.RowCount - 1 do
  begin
    // ref ranges
    if QData.Active then
      QData.Active := False;
    QData.SQL.Text := 'SELECT test_cd,GROUP_CONCAT(ref_range) ref_range ' +
      'FROM                                                                  ' +
      '(                                                                     ' +
      'SELECT DISTINCT result_detail.test_cd,result_detail.REF_RANGE         ' +
      'FROM result_detail                                                    ' +
      'LEFT JOIN test_grup ON result_detail.TEST_CD = test_grup.kode         ' +
      'LEFT JOIN grup ON test_grup.grup_id = grup.id                         ' +
      'LEFT JOIN test_urut ON test_grup.kode = test_urut.kode                ' +
      'WHERE result_detail.id IN (                                           ' +
      'SELECT nomor                                                          ' +
      'FROM order_header                                                     ' +
      'WHERE pasien_id = 3422 )                                              ' +
      ') d                                                                   ' +
      'WHERE test_cd = ' + QuotedStr(strGrd.Cells[0, J]) +
      'GROUP BY test_cd                                                      ' +
      'ORDER BY test_cd ';
    QData.Active := True;
    strGrd.Cells[3, J] := QData.FieldByName('ref_range').AsString;
  end;

  // isi cell nya
  for I := 4 to strGrd.ColCount - 1 do
  begin
    for J := 1 to strGrd.RowCount - 1 do
    begin
      // if QData.Active then
      // QData.Active := False;
      // QData.SQL.Text := 'select result_value,case when flag = ' + QuotedStr('')
      // + ' then ' + QuotedStr('') + ' else ' + QuotedStr('*') + ' end as flag '
      // + 'from result_detail ' + 'where id = ' +
      // QuotedStr(leftstr(strGrd.Cells[I, 0], 10)) + ' and test_cd = ' +
      // QuotedStr(strGrdFr.Cells[0, J]) + '';
      // QData.Active := True;

      if QData2.Active then
        QData2.Active := False;
      QData2.ParamByName('user_profile_id').Value :=
        UniApplication.Cookies.GetCookie('user_profile_id');
      QData2.ParamByName('nomor').Value := leftstr(strGrd.Cells[I, 0],
        lenOrderId);
      QData2.ParamByName('test_cd').Value := strGrd.Cells[0, J];
      QData2.Active := True;
      //
      if QData2.FieldByName('flag').AsString = '*' then
        strGrd.Cells[I, J] := '*  ' + QData2.FieldByName
          ('result_value').AsString
      else
        strGrd.Cells[I, J] := QData2.FieldByName('result_value').AsString;

      // UniMemo1.Lines.Add(leftstr(strGrd.Cells[I, 0], lenOrderId));
      // UniMemo1.Lines.Add(strGrd.Cells[0, J]);
      // UniMemo1.Lines.Add('I:' + intToStr(I) + ' J:' + intToStr(J) + ':');

      // // cek if confidential
      // if QConfidential.Active then
      // QConfidential.Active := False;
      // QConfidential.ParamByName('kode').Value := strGrdFr.Cells[0, J];
      // QConfidential.Active := True;
      //
      // if QConfidential.RecordCount > 0 then
      // begin
      // if QConfidential.FieldByName('flg_cofindential').AsInteger > 0 then
      // begin
      // // hide test if not have right
      // if QRole.Active then
      // QRole.Active := False;
      // QRole.ParamByName('user_profile_id').Value :=
      // UniApplication.Cookies.GetCookie('user_profile_id');
      // QRole.Active := True;
      // if QRole.RecordCount < 1 then
      // begin
      // strGrd.Cells[I, J] := '*****';
      // end;
      // end;
      // end;

    end;
  end;

end;

procedure TfrmPasienHistori.UniFormCreate(Sender: TObject);
begin
  strGrd.JSInterface.JSProperty('cellTip', ['tip']);
end;

procedure TfrmPasienHistori.btnEnvChartClick(Sender: TObject);
begin
  if strGrd.Cells[2, strGrd.Row] <> '' then
  begin
    ShowMask('Loading');
    UniSession.Synchronize();
    with frmEnvChart do
    begin
      UniLineSeries1.Title := '';
      UniLineSeries1.Title := strGrd.Cells[2, strGrd.Row];
      if QHistori.Active then
        QHistori.Active := False;
      QHistori.ParamByName('test_id').Value := strGrd.Cells[0, strGrd.Row];
      QHistori.ParamByName('pasien_id').Value := pasien_id;
      QHistori.Active := True;
      ShowModal;
    end;
    HideMask;
  end;
end;

end.
