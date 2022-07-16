unit ViewerHasilByMR;

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
    QPasien: TFDQuery;
    DSPasien: TDataSource;
    UniContainerPanel3: TUniContainerPanel;
    UniContainerPanel4: TUniContainerPanel;
    UniContainerPanel5: TUniContainerPanel;
    btnHistori: TUniButton;
    btnHasil: TUniButton;
    UniDBGrid2: TUniDBGrid;
    QOrder: TFDQuery;
    DSOrder: TDataSource;
    procedure UniDBGrid1ClearFilters(Sender: TObject);
    procedure UniDBGrid1ColumnFilter(Sender: TUniDBGrid;
      const Column: TUniDBGridColumn; const Value: Variant);
    procedure btnHasilClick(Sender: TObject);
    procedure btnHistoriClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses UnitHasil, UnitPasienHistori;

procedure TUniVHasilByMR.btnHasilClick(Sender: TObject);
begin
  frmHasil.order_id := QOrder.FieldByName('id').AsInteger;
  frmHasil.ShowModal();
end;

procedure TUniVHasilByMR.btnHistoriClick(Sender: TObject);
begin
  frmPasienHistori.pasien_id := QPasien.FieldByName('id').AsInteger;
  frmPasienHistori.ShowModal;
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
    QOrder.Active := False;
  QOrder.Active := True;

  // if QOrder.RecordCount = 0 then
  // btnHasil.Enabled := False
  // else
  // btnHasil.Enabled := True;

end;

initialization

RegisterClass(TUniVHasilByMR);

end.
