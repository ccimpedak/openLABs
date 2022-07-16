unit UnitProfileBaru;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.Comp.Client, uniButton,
  uniBitBtn, uniSpeedButton, uniEdit, uniGUIBaseClasses, uniLabel;

type
  TfrmProfileBaru = class(TUniForm)
    UniLabel1: TUniLabel;
    edProfil: TUniEdit;
    btnSimpan: TUniSpeedButton;
    cmd: TFDCommand;
    procedure btnSimpanClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function frmProfileBaru: TfrmProfileBaru;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, UnitProfilAkun;

function frmProfileBaru: TfrmProfileBaru;
begin
  Result := TfrmProfileBaru(UniMainModule.GetFormInstance(TfrmProfileBaru));
end;

procedure TfrmProfileBaru.btnSimpanClick(Sender: TObject);
begin
  if edProfil.Text <> '' then
  begin

    if cmd.Active then
      cmd.Active := False;
    cmd.Params.Clear;
    cmd.Params.Add.Name := 'nama';
    cmd.ParamByName('nama').Value := edProfil.Text;
    cmd.Params.Add.Name := 'organisasi_id';
    cmd.ParamByName('organisasi_id').Value := UniApplication.Cookies.GetCookie
      ('OrganisasiId');

    cmd.CommandText.Text :=
      'insert into user_profile (nama,organisasi_id) values (:nama,:organisasi_id);';

    cmd.Execute();

    if frmProfilAkun.TblUserProfile.Active then
      frmProfilAkun.TblUserProfile.Active := False;
    frmProfilAkun.TblUserProfile.Active := True;
    close;
  end;
end;

end.
