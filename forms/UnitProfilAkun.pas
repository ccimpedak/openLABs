unit UnitProfilAkun;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniPanel, uniBasicGrid,
  uniDBGrid, uniButton, uniBitBtn, uniSpeedButton, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uniDBNavigator;

type
  TfrmProfilAkun = class(TUniForm)
    UniContainerPanel1: TUniContainerPanel;
    UniContainerPanel2: TUniContainerPanel;
    UniContainerPanel3: TUniContainerPanel;
    UniContainerPanel4: TUniContainerPanel;
    UniContainerPanel6: TUniContainerPanel;
    UniDBGrid1: TUniDBGrid;
    TblUserProfile: TFDTable;
    DSUserProfile: TDataSource;
    UniContainerPanel5: TUniContainerPanel;
    UniDBGrid2: TUniDBGrid;
    UniContainerPanel7: TUniContainerPanel;
    UniDBGrid3: TUniDBGrid;
    UniSpeedButton1: TUniSpeedButton;
    UniSpeedButton2: TUniSpeedButton;
    UniSpeedButton3: TUniSpeedButton;
    QRights: TFDQuery;
    dsRight: TDataSource;
    UniSpeedButton4: TUniSpeedButton;
    cmd: TFDCommand;
    QMenus: TFDQuery;
    dsMenu: TDataSource;
    UniSpeedButton5: TUniSpeedButton;
    UniContainerPanel8: TUniContainerPanel;
    UniDBGrid4: TUniDBGrid;
    UniSpeedButton6: TUniSpeedButton;
    UniSpeedButton7: TUniSpeedButton;
    QAsal: TFDQuery;
    dsAsal: TDataSource;
    QProfil: TFDQuery;
    procedure UniFormBeforeShow(Sender: TObject);
    procedure UniSpeedButton2Click(Sender: TObject);
    procedure UniSpeedButton4Click(Sender: TObject);
    procedure UniSpeedButton5Click(Sender: TObject);
    procedure UniSpeedButton3Click(Sender: TObject);
    procedure UniSpeedButton7Click(Sender: TObject);
    procedure UniSpeedButton6Click(Sender: TObject);
    procedure UniSpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function frmProfilAkun: TfrmProfilAkun;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, UnitRightBaru, UnitProfileMenuBaru,
  UnitProfilAsalBaru, UnitProfileBaru;

function frmProfilAkun: TfrmProfilAkun;
begin
  Result := TfrmProfilAkun(UniMainModule.GetFormInstance(TfrmProfilAkun));
end;

procedure TfrmProfilAkun.UniFormBeforeShow(Sender: TObject);
begin
  // TblUserProfile.Open();
  if QProfil.Active then
    QProfil.Active := False;
  QProfil.ParamByName('organisasi_id').Value := UniApplication.Cookies.GetCookie
    ('OrganisasiId');
  QProfil.Active := True;

  QRights.Open();
  QMenus.Open();
  QAsal.Open();
end;

procedure TfrmProfilAkun.UniSpeedButton1Click(Sender: TObject);
begin
  frmProfileBaru.ShowModal;
end;

procedure TfrmProfilAkun.UniSpeedButton2Click(Sender: TObject);
begin
  frmRightBaru.user_profile_id := QProfil.FieldByName('id').AsInteger;
  frmRightBaru.ShowModal;
end;

procedure TfrmProfilAkun.UniSpeedButton3Click(Sender: TObject);
begin
  frmProfileMenuBaru.user_profile_id := QProfil.FieldByName('id')
    .AsInteger;
  frmProfileMenuBaru.ShowModal;
end;

procedure TfrmProfilAkun.UniSpeedButton4Click(Sender: TObject);
begin
  if cmd.Active then
    cmd.Active := False;

  cmd.Params.Clear;
  cmd.Params.Add.Name := 'id';
  cmd.ParamByName('id').Value := QRights.FieldByName('id').AsInteger;
  cmd.CommandText.Text := 'delete from user_profile_rights where id=:id';
  cmd.Execute();

  if QRights.Active then
    QRights.Active := False;
  QRights.Active := True;

end;

procedure TfrmProfilAkun.UniSpeedButton5Click(Sender: TObject);
begin
  if cmd.Active then
    cmd.Active := False;

  cmd.Params.Clear;
  cmd.Params.Add.Name := 'id';
  cmd.ParamByName('id').Value := QMenus.FieldByName('id').AsInteger;
  cmd.CommandText.Text := 'delete from user_profile_menus where id=:id';
  cmd.Execute();

  if QMenus.Active then
    QMenus.Active := False;
  QMenus.Active := True;
end;

procedure TfrmProfilAkun.UniSpeedButton6Click(Sender: TObject);
begin
  frmProfilAsalBaru.user_profile_id := QProfil.FieldByName('id')
    .AsInteger;
  frmProfilAsalBaru.ShowModal;
end;

procedure TfrmProfilAkun.UniSpeedButton7Click(Sender: TObject);
begin
  if cmd.Active then
    cmd.Active := False;

  cmd.Params.Clear;
  cmd.Params.Add.Name := 'id';
  cmd.ParamByName('id').Value := QAsal.FieldByName('id').AsInteger;
  cmd.CommandText.Text := 'delete from user_profile_asal where id=:id';
  cmd.Execute();

  if QAsal.Active then
    QAsal.Active := False;
  QAsal.Active := True;
end;

end.
