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
    UniSpeedButton1: TUniSpeedButton;
    UniLabel1: TUniLabel;
    procedure UniFormBeforeShow(Sender: TObject);
    procedure strGrdDrawCell(Sender: TObject; ACol, ARow: Integer;
      var Value: string; Attribs: TUniCellAttribs);
    procedure UniButton1Click(Sender: TObject);
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
  MainModule, uniGUIApplication;

function frmPasienHistori: TfrmPasienHistori;
begin
  Result := TfrmPasienHistori(UniMainModule.GetFormInstance(TfrmPasienHistori));
end;

procedure TfrmPasienHistori.strGrdDrawCell(Sender: TObject; ACol, ARow: Integer;
  var Value: string; Attribs: TUniCellAttribs);
begin
  if (ACol >= 3) then
    Attribs.Style.Style := 'text-align: center;';
end;

procedure TfrmPasienHistori.UniButton1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmPasienHistori.UniFormBeforeShow(Sender: TObject);
var
  r, c: Integer;
  I: Integer;
  J: Integer;
begin
  if QHistori.Active then
    QHistori.Active := False;
  QHistori.ParamByName('pasien_id').Value := pasien_id;
  QHistori.Active := True;

  // title
  strGrd.Cells[3, 0] := 'Ref.Ranges';

  // Column
  if QData.Active then
    QData.Active := False;
  QData.SQL.Text := 'SELECT distinct CONCAT(id,' + QuotedStr(' (20') +
    ',LEFT(id,2),' + QuotedStr('-') + ',SUBSTR(id,3,2),' + QuotedStr('-') +
    ',SUBSTR(id,5,2),' + QuotedStr(')') + ') id FROM ' + 'result_detail ' +
    ' WHERE ' + 'id IN ( ' + 'SELECT nomor ' + 'FROM ' + 'order_header ' +
    'WHERE ' + 'pasien_id = ' + intToStr(pasien_id) + ' ) ' + 'ORDER BY id ';
  QData.Active := True;

  strGrd.ColCount := QData.RecordCount + 4;

  r := 4;
  QData.First;
  while not QData.Eof do
  begin
    strGrd.Cells[r, 0] := QData.FieldByName('id').AsString;
    strGrd.ColWidths[r] := 170;
    QData.Next;
    r := r + 1;
  end;

  // Rows
  if QData.Active then
    QData.Active := False;
  QData.SQL.Text :=
    ' SELECT distinct result_detail.test_cd,result_detail.test_nm,result_detail.ref_range,result_detail.disp_seq '
    + ' ,grup.nama grup ' + ' FROM ' + ' result_detail ' +
    ' left join test_grup on result_detail.DISP_SEQ = test_grup.kode ' +
    ' left join grup on test_grup.grup_id = grup.id ' +
    ' left join test_urut on test_grup.kode = test_urut.kode ' +
    ' WHERE result_detail.id IN (SELECT nomor FROM order_header WHERE  pasien_id = '
    + intToStr(pasien_id) + ' ) ' +
    ' ORDER BY IFNULL(test_urut.show_order,result_detail.DISP_SEQ)';
  QData.Active := True;

  strGrd.RowCount := QData.RecordCount + 1;

  r := 1;
  QData.First;
  while not QData.Eof do
  begin
    strGrd.Cells[0, r] := QData.FieldByName('test_cd').AsString;
    strGrd.Cells[1, r] := QData.FieldByName('grup').AsString;
    strGrd.Cells[2, r] := QData.FieldByName('test_nm').AsString;
    strGrd.Cells[3, r] := QData.FieldByName('ref_range').AsString;
    strGrd.ColWidths[0] := 60;
    strGrd.ColWidths[1] := 110;
    strGrd.ColWidths[2] := 160;
    strGrd.ColWidths[3] := 100;

    QData.Next;
    r := r + 1;
  end;

  // isi cell nya
  for I := 4 to strGrd.ColCount - 1 do
  begin
    for J := 1 to strGrd.RowCount - 1 do
    begin
      if QData.Active then
        QData.Active := False;
      QData.SQL.Text := 'select result_value,case when flag = ' + QuotedStr('')
        + ' then ' + QuotedStr('') + ' else ' + QuotedStr('*') + ' end as flag '
        + 'from result_detail ' + 'where id = ' +
        QuotedStr(leftstr(strGrd.Cells[I, 0], 10)) + ' and test_cd = ' +
        QuotedStr(strGrd.Cells[0, J]) + '';
      QData.Active := True;
      if QData.FieldByName('flag').AsString = '*' then

        strGrd.Cells[I, J] := '*  ' + QData.FieldByName('result_value').AsString
      else
        strGrd.Cells[I, J] := QData.FieldByName('result_value').AsString
    end;
  end;

end;

end.
