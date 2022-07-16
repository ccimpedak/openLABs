unit UnitAnsuransiBaru;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.Comp.Client, uniButton,
  uniBitBtn, uniSpeedButton, uniLabel, uniGUIBaseClasses, uniEdit;

type
  TfrmAnsuransiBaru = class(TUniForm)
    edKode: TUniEdit;
    UniLabel1: TUniLabel;
    UniLabel2: TUniLabel;
    edNama: TUniEdit;
    UniSpeedButton1: TUniSpeedButton;
    cmdInsert: TFDCommand;
    procedure UniSpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function frmAnsuransiBaru: TfrmAnsuransiBaru;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, UnitCariAnsuransi;

function frmAnsuransiBaru: TfrmAnsuransiBaru;
begin
  Result := TfrmAnsuransiBaru(UniMainModule.GetFormInstance(TfrmAnsuransiBaru));
end;

procedure TfrmAnsuransiBaru.UniSpeedButton1Click(Sender: TObject);
begin
  if edKode.Text = '' then
  begin
    ShowMessage('Kode masih kosong.');
    edKode.SetFocus;
    exit;
  end;

  if edNama.Text = '' then
  begin
    ShowMessage('Nama masih kosong.');
    edNama.SetFocus;
    exit;
  end;
  ShowMask('Loading');
  UniSession.Synchronize();
  // simpan
  if cmdInsert.Active then
    cmdInsert.Active := False;
  cmdInsert.CommandText.Text :=
    'insert into ansuransi_pasien (kode,nama) values (:kode,:nama)';
  cmdInsert.Params.Clear;
  cmdInsert.Params.Add.Name := 'kode';
  cmdInsert.Params.Add.Name := 'nama';

  cmdInsert.ParamByName('kode').Value := edKode.Text;
  cmdInsert.ParamByName('nama').Value := edNama.Text;

  cmdInsert.Execute();

  if frmCariAnsuransi.QAnsuransi.Active then
    frmCariAnsuransi.QAnsuransi.Active := False;
  frmCariAnsuransi.QAnsuransi.Active := True;
  HideMask;
  Close;
end;

end.
