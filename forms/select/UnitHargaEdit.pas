unit UnitHargaEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniButton, uniBitBtn, uniSpeedButton, uniEdit,
  uniLabel, uniGUIBaseClasses, uniMultiItem, uniComboBox, uniDBComboBox,
  uniDBLookupComboBox, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmHargaEdit = class(TUniForm)
    cbTipePasien: TUniDBLookupComboBox;
    UniLabel1: TUniLabel;
    UniLabel2: TUniLabel;
    edHarga: TUniNumberEdit;
    btnSimpan: TUniSpeedButton;
    QTipePasien: TFDQuery;
    DSTipePasien: TDataSource;
    cmdExe: TFDCommand;
    procedure UniFormBeforeShow(Sender: TObject);
    procedure btnSimpanClick(Sender: TObject);
    procedure UniFormAfterShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    test_id: integer;
    action: string;
  end;

function frmHargaEdit: TfrmHargaEdit;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, UnitHarga;

function frmHargaEdit: TfrmHargaEdit;
begin
  Result := TfrmHargaEdit(UniMainModule.GetFormInstance(TfrmHargaEdit));
end;

procedure TfrmHargaEdit.btnSimpanClick(Sender: TObject);
begin
  if cbTipePasien.Text = '' then
  begin
    ShowMessage('Tipe pasien belum dipilih.');
    cbTipePasien.SetFocus;
    exit;
  end;
  if cmdExe.Active then
    cmdExe.Active := False;
  cmdExe.ParamByName('test_id').Value := test_id;
  cmdExe.ParamByName('tipe_pasien_id').Value := QTipePasien.FieldByName('id')
    .AsInteger;
  cmdExe.ParamByName('harga').Value := edHarga.Value;
  cmdExe.Execute();

  if frmHarga.QHarga.Active then
    frmHarga.QHarga.Active := False;
  frmHarga.QHarga.Active := True;
  Close;

end;

procedure TfrmHargaEdit.UniFormAfterShow(Sender: TObject);
begin
  if action = 'edit' then
  begin
    cbTipePasien.ItemIndex := cbTipePasien.Items.IndexOf
      (frmHarga.QHarga.FieldByName('tipe_pasien').AsString);
    edHarga.Value := frmHarga.QHarga.FieldByName('harga').AsInteger;
  end;
end;

procedure TfrmHargaEdit.UniFormBeforeShow(Sender: TObject);
begin
  QTipePasien.Open();
end;

end.
