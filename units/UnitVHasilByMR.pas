unit UnitVHasilByMR;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniSplitter, uniGUIBaseClasses, uniPanel,
  uniDBNavigator, uniMultiItem, uniComboBox, uniDBComboBox, uniDBLookupComboBox,
  uniEdit, uniBasicGrid, uniDBGrid, uniLabel, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uniButton, Vcl.ExtCtrls;

type
  TUniVHasilByMR = class(TUniFrame)
    UniContainerPanel1: TUniContainerPanel;
    UniSplitter1: TUniSplitter;
    UniContainerPanel2: TUniContainerPanel;
    UniDBGrid1: TUniDBGrid;
    UniHiddenPanel1: TUniHiddenPanel;
    edNoreg: TUniEdit;
    edNama: TUniEdit;
    edAlamat: TUniEdit;
    edHp: TUniEdit;
    UniEdit5: TUniEdit;
    UniEdit6: TUniEdit;
    UniEdit7: TUniEdit;
    UniDBLookupComboBox1: TUniDBLookupComboBox;
    UniContainerPanel3: TUniContainerPanel;
    UniContainerPanel4: TUniContainerPanel;
    UniContainerPanel5: TUniContainerPanel;
    btnHistori: TUniButton;
    btnHasil: TUniButton;
    UniDBGrid2: TUniDBGrid;
    UniButton1: TUniButton;
    UniButton2: TUniButton;
    UniButton3: TUniButton;
    UniContainerPanel6: TUniContainerPanel;
    UniDBGrid3: TUniDBGrid;
    DSPasien: TDataSource;
    DSOrder: TDataSource;
    DSOrderTests: TDataSource;
    QPasien: TFDQuery;
    QOrder: TFDQuery;
    QOrderTests: TFDQuery;
    procedure UniDBGrid1ClearFilters(Sender: TObject);
    procedure UniDBGrid1ColumnFilter(Sender: TUniDBGrid;
      const Column: TUniDBGridColumn; const Value: Variant);
    procedure btnHasilClick(Sender: TObject);
    procedure btnHistoriClick(Sender: TObject);
    procedure UniButton1Click(Sender: TObject);
    procedure UniButton2Click(Sender: TObject);
    procedure UniButton3Click(Sender: TObject);
    procedure UniDBGrid2DblClick(Sender: TObject);
    procedure QOrderAfterScroll(DataSet: TDataSet);
    procedure QPasienAfterScroll(DataSet: TDataSet);
    procedure UniDBGrid2CellClick(Column: TUniDBGridColumn);
    procedure UniButton4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses UnitHasil, UnitPasienHistori, UnitNotifList, UnitNotifAdd;

procedure TUniVHasilByMR.btnHasilClick(Sender: TObject);
begin
  if QOrder.RecordCount > 0 then
  begin
    frmHasil.order_id := QOrder.FieldByName('id').AsInteger;
    frmHasil.ShowModal();
  end;
end;

procedure TUniVHasilByMR.btnHistoriClick(Sender: TObject);
begin
  ShowMask('Loading');
  UniSession.Synchronize();
  frmPasienHistori.pasien_id := QPasien.FieldByName('id').AsInteger;
  frmPasienHistori.ShowModal;
  HideMask;
end;

procedure TUniVHasilByMR.QOrderAfterScroll(DataSet: TDataSet);
begin
  if QOrderTests.Active then
    QOrderTests.Active := False;
  QOrderTests.ParamByName('no_pendaftaran').Value :=
    QOrder.FieldByName('nomor').AsString;
  QOrderTests.Active := True;
end;

procedure TUniVHasilByMR.QPasienAfterScroll(DataSet: TDataSet);
begin
  QOrderTests.Active := False;

  if QOrder.Active then
    QOrder.Active := False;
  QOrder.ParamByName('pasien_id').Value := QPasien.FieldByName('id').AsInteger;
  QOrder.Active := True;

  QOrderTests.Active := True;
end;

procedure TUniVHasilByMR.UniButton1Click(Sender: TObject);
begin
  if QPasien.Active then
    QPasien.Active := False;
  QPasien.Active := True;

  if QOrder.Active then
    QOrder.Active := False;
  QOrder.Active := True;

end;

procedure TUniVHasilByMR.UniButton2Click(Sender: TObject);
begin
  ShowMask('Loading');
  UniSession.Synchronize();
  with frmNotifList do
  begin
    if QNotifList.Active then
      QNotifList.Active := False;
    QNotifList.ParamByName('user_id').Value := UniApplication.Cookies.GetCookie
      ('UserId');
    QNotifList.Active := True;
    ShowModal;
  end;
  HideMask;
end;

procedure TUniVHasilByMR.UniButton3Click(Sender: TObject);
begin
  if QPasien.RecordCount > 0 then
  begin
    ShowMask('Loading');
    UniSession.Synchronize();
    with frmNotifAdd do
    begin
      if QPasienAdd.Active then
        QPasien.Active := False;
      QPasienAdd.ParamByName('NOREG').Value :=
        QPasien.FieldByName('NOREG').AsString;
      QPasienAdd.Active := True;
      ShowModal;
    end;
    HideMask;
  end;
end;

procedure TUniVHasilByMR.UniButton4Click(Sender: TObject);
begin
  if QOrderTests.Active then
    QOrderTests.Active := False;
  QOrderTests.ParamByName('no_pendaftaran').Value :=
    QOrder.FieldByName('nomor').AsString;
  QOrderTests.Active := True;
end;

procedure TUniVHasilByMR.UniDBGrid1ClearFilters(Sender: TObject);
var
  I: Integer;
begin
  if QPasien.Active then
  begin
    QPasien.Active := False;
  end;
  for I := 0 to QPasien.Params.Count - 1 do
    QPasien.Params[I].Value := '%%';
  QPasien.Active := True;

  if QOrder.Active then
    QOrder.Active := False;

end;

procedure TUniVHasilByMR.UniDBGrid1ColumnFilter(Sender: TUniDBGrid;
  const Column: TUniDBGridColumn; const Value: Variant);
var
  V: Variant;
  I: Integer;
begin
  ShowMask('Loading');
  UniSession.Synchronize();

  if QPasien.Active then
  begin
    QPasien.Active := False;
  end;
  for I := 0 to Sender.Columns.Count - 1 do
    if Sender.Columns[I].Filtering.Enabled then
    begin
      V := Sender.Columns[I].Filtering.VarValue;
      QPasien.ParamByName(Sender.Columns[I].FieldName).Value := '%' + V + '%';
    end;
  QPasien.Active := True;

  if QPasien.RecordCount = 0 then
    btnHistori.Enabled := False
  else
    btnHistori.Enabled := True;

  if not QOrder.Active then
    // QOrder.Active := False;
    QOrder.Active := True;

  // if not TblOrderTests.Active then
  // QOrderTests.Active := False;
  // TblOrderTests.Active := True;

  HideMask;

  // if QOrder.RecordCount = 0 then
  // btnHasil.Enabled := False
  // else
  // btnHasil.Enabled := True;

end;

procedure TUniVHasilByMR.UniDBGrid2CellClick(Column: TUniDBGridColumn);
begin
  if QOrderTests.Active then
    QOrderTests.Active := False;
  QOrderTests.ParamByName('no_pendaftaran').Value :=
    QOrder.FieldByName('nomor').AsString;
  QOrderTests.Active := True;
end;

procedure TUniVHasilByMR.UniDBGrid2DblClick(Sender: TObject);
begin
  btnHasilClick(self);
end;

initialization

RegisterClass(TUniVHasilByMR);

end.
