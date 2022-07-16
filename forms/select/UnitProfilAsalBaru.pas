unit UnitProfilAsalBaru;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, uniButton, uniBitBtn,
  uniSpeedButton, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  uniMultiItem, uniComboBox, uniDBComboBox, uniDBLookupComboBox,
  uniGUIBaseClasses, uniLabel;

type
  TfrmProfilAsalBaru = class(TUniForm)
    UniLabel1: TUniLabel;
    cbAsal: TUniDBLookupComboBox;
    cmd: TFDCommand;
    QAsal: TFDQuery;
    dsAsal: TDataSource;
    btnSimpan: TUniSpeedButton;
    procedure UniFormBeforeShow(Sender: TObject);
    procedure btnSimpanClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    user_profile_id:integer;
  end;

function frmProfilAsalBaru: TfrmProfilAsalBaru;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, UnitProfilAkun;

function frmProfilAsalBaru: TfrmProfilAsalBaru;
begin
  Result := TfrmProfilAsalBaru(UniMainModule.GetFormInstance(TfrmProfilAsalBaru));
end;

procedure TfrmProfilAsalBaru.btnSimpanClick(Sender: TObject);
begin
  if cbAsal.Text <> '' then
  begin

    if cmd.Active then
      cmd.Active := False;
    cmd.Params.Clear;
    cmd.Params.Add.Name := 'user_profile_id';
    cmd.ParamByName('user_profile_id').Value := user_profile_id;
    cmd.Params.Add.Name := 'asal_pasien_id';
    cmd.ParamByName('asal_pasien_id').Value := QAsal.FieldByName('id').AsInteger;
    cmd.CommandText.Text :=
      'delete from user_profile_asal where user_profile_id=:user_profile_id and asal_pasien_id=:asal_pasien_id; ';

    cmd.Execute();

    cmd.CommandText.Text :=
      'insert into user_profile_asal (user_profile_id,asal_pasien_id) values (:user_profile_id,:asal_pasien_id);';

    cmd.Execute();

    if frmProfilAkun.QAsal.Active then
      frmProfilAkun.QAsal.Active := False;
    frmProfilAkun.QAsal.Active := True;
    close;
  end;
end;

procedure TfrmProfilAsalBaru.UniFormBeforeShow(Sender: TObject);
begin
QAsal.Open();
end;

end.
