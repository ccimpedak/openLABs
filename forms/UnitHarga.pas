unit UnitHarga;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniPanel, uniBasicGrid,
  uniDBGrid, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uniButton, uniBitBtn, uniSpeedButton;

type
  TfrmHarga = class(TUniForm)
    UniContainerPanel1: TUniContainerPanel;
    UniContainerPanel2: TUniContainerPanel;
    UniDBGrid1: TUniDBGrid;
    QHarga: TFDQuery;
    dsHarga: TDataSource;
    spTambah: TUniSpeedButton;
    UniSpeedButton1: TUniSpeedButton;
    UniSpeedButton2: TUniSpeedButton;
    procedure UniSpeedButton2Click(Sender: TObject);
    procedure UniFormBeforeShow(Sender: TObject);
    procedure spTambahClick(Sender: TObject);
    procedure UniSpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    test_id: integer;
  end;

function frmHarga: TfrmHarga;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, UnitHargaEdit;

function frmHarga: TfrmHarga;
begin
  Result := TfrmHarga(UniMainModule.GetFormInstance(TfrmHarga));
end;

procedure TfrmHarga.spTambahClick(Sender: TObject);
begin
  frmHargaEdit.test_id := frmHarga.test_id;
  frmHargaEdit.action := 'new';
  frmHargaEdit.ShowModal;
end;

procedure TfrmHarga.UniFormBeforeShow(Sender: TObject);
begin
  if QHarga.Active then
    QHarga.Active := False;
  QHarga.ParamByName('test_id').Value := test_id;
  QHarga.Active := True;
end;

procedure TfrmHarga.UniSpeedButton1Click(Sender: TObject);
begin

  frmHargaEdit.edHarga.Value := QHarga.FieldByName('harga').AsInteger;
  frmHargaEdit.cbTipePasien.ItemIndex := frmHargaEdit.cbTipePasien.Items.IndexOf
    (QHarga.FieldByName('tipe_pasien').AsString);
  frmHargaEdit.action := 'edit';
  frmHargaEdit.ShowModal;
end;

procedure TfrmHarga.UniSpeedButton2Click(Sender: TObject);
begin
  Close;
end;

end.
