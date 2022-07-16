unit UnitLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIRegClasses, uniGUIForm, uniPanel, uniGUIBaseClasses,
  uniButton, uniEdit, uniLabel, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TUniLoginForm1 = class(TUniLoginForm)
    UniButton1: TUniButton;
    btnLogin: TUniButton;
    UniPanel1: TUniPanel;
    UniLabel1: TUniLabel;
    UniLabel2: TUniLabel;
    edUser: TUniEdit;
    edPass: TUniEdit;
    qLogin: TFDQuery;
    procedure btnLoginClick(Sender: TObject);
    procedure UniButton1Click(Sender: TObject);
    procedure UniLoginFormAfterShow(Sender: TObject);
    procedure edUserKeyPress(Sender: TObject; var Key: Char);
    procedure edPassKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function UniLoginForm1: TUniLoginForm1;

implementation

{$R *.dfm}

uses
  uniGUIVars, MainModule, uniGUIApplication, Main;

function UniLoginForm1: TUniLoginForm1;
begin
  Result := TUniLoginForm1(UniMainModule.GetFormInstance(TUniLoginForm1));
end;

procedure TUniLoginForm1.edPassKeyPress(Sender: TObject; var Key: Char);
begin
  if Ord(Key) = VK_RETURN then
    btnLoginClick(self);
end;

procedure TUniLoginForm1.edUserKeyPress(Sender: TObject; var Key: Char);
begin
  if Ord(Key) = VK_RETURN then
    edPass.SetFocus;
end;

procedure TUniLoginForm1.UniButton1Click(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TUniLoginForm1.btnLoginClick(Sender: TObject);
var
  user_id: string;
begin
  ShowMask('Loading');
  UniSession.Synchronize();
  if qLogin.Active then
    qLogin.Active := False;
  qLogin.SQL.Text := 'select id,user_profile_id from aguser where user_name =' +
    quotedstr(edUser.Text) + ' and password=password(' + quotedstr(edPass.Text)
    + ') and flg_aktif = ' + quotedstr('Y') + '';
  qLogin.Active := True;

  if qLogin.RecordCount > 0 then
  begin
    ModalResult := mrOK;
    user_id := qLogin.FieldByName('id').AsString;
    UniApplication.Cookies.SetCookie('UserId', user_id);
    UniApplication.Cookies.SetCookie('UserName', edUser.Text);
    UniApplication.Cookies.SetCookie('user_profile_id',
      qLogin.FieldByName('user_profile_id').AsString);

    // lokasi
    if qLogin.Active then
      qLogin.Active := False;
    qLogin.SQL.Text :=
      ' SELECT organisasi.id organisasi_id,organisasi.nama organisasi,lokasi.id lokasi_id,lokasi.nama lokasi '
      + 'FROM aguser_lokasi LEFT JOIN lokasi ON aguser_lokasi.lokasi_id = lokasi.id '
      + ' LEFT JOIN organisasi ON lokasi.organisasi_id = organisasi.id WHERE user_id = '
      + quotedstr(user_id) + ' AND is_default = 1 ';
    qLogin.Active := True;

    UniApplication.Cookies.SetCookie('OrganisasiId',
      qLogin.FieldByName('organisasi_id').AsString);
    UniApplication.Cookies.SetCookie('OrganisasiNama',
      qLogin.FieldByName('organisasi').AsString);
    UniApplication.Cookies.SetCookie('LokasiId', qLogin.FieldByName('lokasi_id')
      .AsString);
    UniApplication.Cookies.SetCookie('LokasiNama', qLogin.FieldByName('lokasi')
      .AsString);

  end
  else
  begin
    ShowMessage('Akun dan/atau password tidak valid.!');
  end;
  HideMask;
end;

procedure TUniLoginForm1.UniLoginFormAfterShow(Sender: TObject);
begin
  edUser.SetFocus;
end;

initialization

RegisterAppFormClass(TUniLoginForm1);

end.
