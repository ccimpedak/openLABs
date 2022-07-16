unit UnitProfileMenuBaru;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniLabel, uniGUIBaseClasses, uniMultiItem,
  uniComboBox, uniDBComboBox, uniDBLookupComboBox, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uniButton, uniBitBtn,
  uniSpeedButton;

type
  TfrmProfileMenuBaru = class(TUniForm)
    cbMenu: TUniDBLookupComboBox;
    UniLabel1: TUniLabel;
    btnSimpan: TUniSpeedButton;
    QMenu: TFDQuery;
    dsmenu: TDataSource;
    cmd: TFDCommand;
    procedure UniFormBeforeShow(Sender: TObject);
    procedure btnSimpanClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    user_profile_id: integer;
  end;

function frmProfileMenuBaru: TfrmProfileMenuBaru;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, UnitProfilAkun;

function frmProfileMenuBaru: TfrmProfileMenuBaru;
begin
  Result := TfrmProfileMenuBaru
    (UniMainModule.GetFormInstance(TfrmProfileMenuBaru));
end;

procedure TfrmProfileMenuBaru.btnSimpanClick(Sender: TObject);
begin
  if cbMenu.Text <> '' then
  begin

    if cmd.Active then
      cmd.Active := False;
    cmd.Params.Clear;
    cmd.Params.Add.Name := 'user_profile_id';
    cmd.ParamByName('user_profile_id').Value := user_profile_id;
    cmd.Params.Add.Name := 'menu_child_id';
    cmd.ParamByName('menu_child_id').Value := QMenu.FieldByName('id').AsInteger;
    cmd.CommandText.Text :=
      'delete from user_profile_menus where user_profile_id=:user_profile_id and menu_child_id=:menu_child_id; ';

    cmd.Execute();

    cmd.CommandText.Text :=
      'insert into user_profile_menus (user_profile_id,menu_child_id) values (:user_profile_id,:menu_child_id);';

    cmd.Execute();

    if frmProfilAkun.QMenus.Active then
      frmProfilAkun.QMenus.Active := False;
    frmProfilAkun.QMenus.Active := True;
    close;
  end;
end;

procedure TfrmProfileMenuBaru.UniFormBeforeShow(Sender: TObject);
begin
  QMenu.Open();
end;

end.
