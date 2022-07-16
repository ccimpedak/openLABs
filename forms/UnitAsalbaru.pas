unit UnitAsalbaru;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniLabel, uniGUIBaseClasses, uniEdit, uniButton,
  uniBitBtn, uniSpeedButton, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.Comp.Client;

type
  TfrmAsalBaru = class(TUniForm)
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

function frmAsalBaru: TfrmAsalBaru;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, UnitCariAsal;

function frmAsalBaru: TfrmAsalBaru;
begin
  Result := TfrmAsalBaru(UniMainModule.GetFormInstance(TfrmAsalBaru));
end;

procedure TfrmAsalBaru.UniSpeedButton1Click(Sender: TObject);
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
    'insert into asal_pasien (kode,nama) values (:kode,:nama)';
  cmdInsert.Params.Clear;
  cmdInsert.Params.Add.Name := 'kode';
  cmdInsert.Params.Add.Name := 'nama';

  cmdInsert.ParamByName('kode').Value := edKode.Text;
  cmdInsert.ParamByName('nama').Value := edNama.Text;

  cmdInsert.Execute();

  if frmCariAsal.QAsal.Active then
    frmCariAsal.QAsal.Active := False;
  frmCariAsal.QAsal.Active := True;
  HideMask;
  Close;

end;

end.
