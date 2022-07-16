unit UnitRightBaru;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniLabel, uniButton, uniBitBtn, uniSpeedButton,
  uniGUIBaseClasses, uniMultiItem, uniComboBox, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.Comp.Client;

type
  TfrmRightBaru = class(TUniForm)
    cbRight: TUniComboBox;
    btnSimpan: TUniSpeedButton;
    UniLabel1: TUniLabel;
    cmd: TFDCommand;
    procedure btnSimpanClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    user_profile_id: integer;
  end;

function frmRightBaru: TfrmRightBaru;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, UnitProfilAkun;

function frmRightBaru: TfrmRightBaru;
begin
  Result := TfrmRightBaru(UniMainModule.GetFormInstance(TfrmRightBaru));
end;

procedure TfrmRightBaru.btnSimpanClick(Sender: TObject);
begin
  if cbRight.Text <> '' then
  begin

    if cmd.Active then
      cmd.Active := False;
    cmd.Params.Clear;
    cmd.Params.Add.Name := 'user_profile_id';
    cmd.ParamByName('user_profile_id').Value := user_profile_id;
    cmd.Params.Add.Name := 'value';
    cmd.ParamByName('value').Value := cbRight.Text;
    cmd.CommandText.Text :=
      'delete from user_profile_rights where user_profile_id=:user_profile_id and value=:value; ';

    cmd.Execute();

    cmd.CommandText.Text :=
      'insert into user_profile_rights (user_profile_id,value) values (:user_profile_id,:value);';

    cmd.Execute();

    if frmProfilAkun.QRights.Active then
      frmProfilAkun.QRights.Active := False;
    frmProfilAkun.QRights.Active := True;
    close;
  end;

end;

end.
