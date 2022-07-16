unit UnitLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniLabel, uniButton, uniEdit,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, IdHTTP, IdCookieManager, IdBaseComponent, IdComponent,
  IdTCPConnection, idUri,
  IdTCPClient, System.JSON, System.NetEncoding, uniMemo;

type
  TfrmLogin = class(TUniForm)
    UniLabel1: TUniLabel;
    UniLabel2: TUniLabel;
    edUser: TUniEdit;
    edPass: TUniEdit;
    btnLogin: TUniButton;
    QLogin: TFDQuery;
    QParameters: TFDQuery;
    lblAlert: TUniLabel;
    procedure UniFormAfterShow(Sender: TObject);
    procedure btnLoginClick(Sender: TObject);
    procedure edPassKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  var
    result_id: integer;
    nomor_lab: string;
  end;

function frmLogin: TfrmLogin;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, UnitLapor;

function frmLogin: TfrmLogin;
begin
  Result := TfrmLogin(UniMainModule.GetFormInstance(TfrmLogin));
end;

procedure TfrmLogin.edPassKeyPress(Sender: TObject; var Key: Char);
begin
  if Ord(Key) = VK_RETURN then
    btnLoginClick(self);
end;

procedure TfrmLogin.btnLoginClick(Sender: TObject);
var
  inf_login: boolean;
  S: TStringList;
  // M: TStream;
  HTTP: TIdHTTP;
  ResponseBody, inf_login_url: string;
  // RequestBody: TStream;
  // res: TStringStream;
  cookie: TIdCookieManager;
  // uri: TIdURI;
  // JSON: TJSONObject;
  code: integer;
  dev_mode: boolean;
begin
  dev_mode := False;
  ShowMask('Loading');
  UniSession.Synchronize();
  lblAlert.Visible := False;
  inf_login_url := 'http://localhost/csp/acb/services/logon';

  inf_login := False;
  // cek parameters
  if QParameters.Active then
    QParameters.Active := False;
  QParameters.ParamByName('name').Value := 'INF_LOGIN';
  QParameters.Active := True;

  if QParameters.RecordCount > 0 then
    if QParameters.FieldByName('value_char').AsString = 'Y' then
      inf_login := True;

  if QParameters.Active then
    QParameters.Active := False;
  QParameters.ParamByName('name').Value := 'DEV';
  QParameters.Active := True;

  if QParameters.RecordCount > 0 then
    if QParameters.FieldByName('value_num').AsString = '1' then
      dev_mode := True;

  if inf_login then
  // INFINITY LOGIN
  begin
    if QParameters.Active then
      QParameters.Active := False;
    QParameters.ParamByName('name').Value := 'INF_LOGIN_URL';
    QParameters.Active := True;

    if QParameters.RecordCount > 0 then
      inf_login_url := QParameters.FieldByName('value_char').AsString;

    HTTP := TIdHTTP.Create;
    S := TStringList.Create;
    S.Add('UserName=' + edUser.Text);
    S.Add('UserPassword=' + edPass.Text);
    try
      HTTP.Request.Accept := 'application/json';

      HTTP.AllowCookies := True;
      HTTP.HandleRedirects := True;

      cookie := TIdCookieManager.Create(nil);

      HTTP.CookieManager := cookie;
      HTTP.Request.ContentType := 'application/x-www-form-urlencoded';
      HTTP.HTTPOptions := [hoWaitForUnexpectedData, hoTreat302Like303];

      if not dev_mode then
      begin

        ResponseBody := HTTP.Post(inf_login_url, S);
        code := HTTP.ResponseCode;
        if code = 200 then
        begin
          frmLapor.id_user := edUser.Text;
          frmLapor.fullname := edUser.Text;
          frmLapor.result_id := result_id;
          frmLapor.nomor_lab := nomor_lab;
          frmLapor.ShowModal();
          close;
        end;
        S.Free
      end
      else
      begin
        frmLapor.id_user := 'DEV';
        frmLapor.fullname := 'DEV';
        frmLapor.result_id := result_id;
        frmLapor.nomor_lab := nomor_lab;
        frmLapor.ShowModal();
        close;
      end;
    except
      on E: EIdHTTPProtocolException do
      begin
        // code := HTTP.ResponseCode; // or: code := E.ErrorCode;
        lblAlert.Visible := True;
      end;
    end;
  end
  else
  begin
    // Database LOGIN
    if QLogin.Active then
      QLogin.Active := False;
    QLogin.Params.Add.Name := 'username';
    QLogin.Params.Add.Name := 'password';
    QLogin.SQL.Text :=
      'SELECT * FROM user WHERE username = :username AND password = :password ';
    QLogin.ParamByName('username').Value := edUser.Text;
    QLogin.ParamByName('password').Value := edPass.Text;
    QLogin.Active := True;

    if QLogin.RecordCount > 0 then
    begin
      frmLapor.id_user := QLogin.FieldByName('id').AsString;
      frmLapor.fullname := QLogin.FieldByName('fullname').AsString;
      frmLapor.ShowModal();
      close;
    end
    else
    begin
      ShowMessage('Username dan/atau password tidak valid.');
    end;
  end;
  hidemask();

end;

procedure TfrmLogin.UniFormAfterShow(Sender: TObject);
begin
  frmLogin.Caption := 'Login [' + nomor_lab + ']';
  edUser.SetFocus;
end;

end.
