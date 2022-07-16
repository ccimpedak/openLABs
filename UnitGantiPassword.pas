unit UnitGantiPassword;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniButton, uniEdit, uniGUIBaseClasses, uniLabel,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.Comp.Client, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet;

type
  TfrmGantiPassword = class(TUniForm)
    UniLabel1: TUniLabel;
    UniLabel2: TUniLabel;
    UniLabel3: TUniLabel;
    UniLabel4: TUniLabel;
    UniLabel5: TUniLabel;
    edUser: TUniEdit;
    edPassLama: TUniEdit;
    edPassBaru: TUniEdit;
    edPassKonfirm: TUniEdit;
    UniButton1: TUniButton;
    UniButton2: TUniButton;
    updQuery: TFDQuery;
    procedure UniButton2Click(Sender: TObject);
    procedure UniFormAfterShow(Sender: TObject);
    procedure UniButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function frmGantiPassword: TfrmGantiPassword;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function frmGantiPassword: TfrmGantiPassword;
begin
  Result := TfrmGantiPassword(UniMainModule.GetFormInstance(TfrmGantiPassword));
end;

procedure TfrmGantiPassword.UniButton1Click(Sender: TObject);
begin
if edPassLama.Text='' then
begin
  ShowMessage('Password lama perlu diisi.');
  edPassLama.SetFocus;
  exit;
end;
if edPassBaru.Text='' then
begin
  ShowMessage('Password baru perlu diisi.');
  edPassBaru.SetFocus;
  exit;
end;
if edPassKonfirm.Text='' then
begin
  ShowMessage('Password konfirmasi perlu diisi.');
  edPassKonfirm.SetFocus;
  exit;
end;
if edPassBaru.Text<>edPassKonfirm.Text then
begin
  showmessage('password konfirmasi tidak cocok denga password baru.');
  edPassKonfirm.SetFocus;
  exit;
end;

if updQuery.Active then updQuery.Active:=False;
updQuery.ParamByName('pass_lama').Value := edPassLama.Text;
updQuery.ParamByName('pass_baru').Value := edPassBaru.Text;
updQuery.ParamByName('user_id').Value := UniApplication.Cookies.GetCookie('UserId');
updQuery.ExecSQL;

if updQuery.RowsAffected>0 then
begin
  ShowMessage('Password sudah berubah.');
  close;
end
else
begin
  ShowMessage('Gagal update password.');
  close;
end;

end;

procedure TfrmGantiPassword.UniButton2Click(Sender: TObject);
begin
Close;
end;

procedure TfrmGantiPassword.UniFormAfterShow(Sender: TObject);
begin
edUser.Text := UniApplication.Cookies.GetCookie('UserName');
edPassLama.Clear;
edPassBaru.Clear;
edPassKonfirm.Clear;
end;

end.
