unit UnitUserAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniEdit, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  uniMultiItem, uniComboBox, uniDBComboBox, uniDBLookupComboBox, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uniButton, uniBitBtn,
  uniSpeedButton, uniMemo;

type
  TfrmUserAdd = class(TUniForm)
    edAkun: TUniEdit;
    edNama: TUniEdit;
    edPassword: TUniEdit;
    edKonfimPass: TUniEdit;
    edEmail: TUniEdit;
    QProfil: TFDQuery;
    dsProfil: TDataSource;
    cbProfil: TUniDBLookupComboBox;
    btnTambah: TUniSpeedButton;
    cmdExec: TFDCommand;
    QUser: TFDQuery;
    cbLokasi: TUniDBLookupComboBox;
    QLokasi: TFDQuery;
    dsLokasi: TDataSource;
    QGet: TFDQuery;
    cmdIn: TFDCommand;
    procedure UniFormBeforeShow(Sender: TObject);
    procedure btnTambahClick(Sender: TObject);
    procedure UniFormAfterShow(Sender: TObject);
    procedure edPasswordChange(Sender: TObject);
  private
    { Private declarations }
    pass: string;
  public
    { Public declarations }
    user_id: integer;
  end;

function frmUserAdd: TfrmUserAdd;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, UnitSetting;

function frmUserAdd: TfrmUserAdd;
begin
  Result := TfrmUserAdd(UniMainModule.GetFormInstance(TfrmUserAdd));
end;

procedure TfrmUserAdd.btnTambahClick(Sender: TObject);
begin
  if edAkun.Text = '' then
  begin
    ShowMessage('Akun tidak boleh kosong.');
    edAkun.SetFocus;
    Exit;
  end;
  if edNama.Text = '' then
  begin
    ShowMessage('Nama tidak boleh kosong.');
    edNama.SetFocus;
    Exit;
  end;
  if edPassword.Text = '' then
  begin
    ShowMessage('Password tidak boleh kosong.');
    edPassword.SetFocus;
    Exit;
  end;
  if edKonfimPass.Text = '' then
  begin
    ShowMessage('Konfirm password tidak boleh kosong.');
    edKonfimPass.SetFocus;
    Exit;
  end;
  if edEmail.Text = '' then
  begin
    ShowMessage('Email tidak boleh kosong.');
    edEmail.SetFocus;
    Exit;
  end;
  if cbProfil.Text = '' then
  begin
    ShowMessage('Profil tidak boleh kosong.');
    cbProfil.SetFocus;
    Exit;
  end;

  if cbLokasi.Text = '' then
  begin
    ShowMessage('Lokasi tidak boleh kosong.');
    cbLokasi.SetFocus;
    Exit;
  end;
  if edKonfimPass.Text <> edPassword.Text then
  begin
    ShowMessage('Password dan konfirmasi tidak cocok.');
    edKonfimPass.SetFocus;
    Exit;
  end;

  ShowMask('Loading');
  UniSession.Synchronize();

  if cmdExec.Active then
    cmdExec.Active := False;

  cmdExec.Params.Clear;
  cmdExec.Params.Add.Name := 'user_name';
  cmdExec.ParamByName('user_name').Value := edAkun.Text;

  cmdExec.Params.Add.Name := 'nama';
  cmdExec.ParamByName('nama').Value := edNama.Text;

  cmdExec.Params.Add.Name := 'password';
  cmdExec.ParamByName('password').Value := edPassword.Text;

  cmdExec.Params.Add.Name := 'email';
  cmdExec.ParamByName('email').Value := edEmail.Text;

  cmdExec.Params.Add.Name := 'user_profile_id';
  cmdExec.ParamByName('user_profile_id').Value := QProfil.FieldByName('id')
    .AsInteger;

  cmdExec.Params.Add.Name := 'organisasi_id';
  cmdExec.ParamByName('organisasi_id').Value := UniApplication.Cookies.GetCookie
    ('OrganisasiId');

  // insert
  if user_id = 0 then
  begin
    if QUser.Active then
      QUser.Active := False;

    QUser.SQL.Text := 'SELECT id FROM aguser WHERE user_name = ' +
      QuotedStr(edAkun.Text) + ' ';
    QUser.Active := True;

    if QUser.RecordCount > 0 then
    begin
      // user sudah ada
      ShowMessage('Akun login [' + edAkun.Text + '] sudah digunakan.');
      edAkun.SetFocus;
      Exit;
    end;

    cmdExec.CommandText.Text :=
      ' insert into aguser (user_name,nama,password,email,user_profile_id,organisasi_id) values  (:user_name,:nama,password(:password),:email,:user_profile_id,:organisasi_id);';

  end
  else
  begin
    cmdExec.Params.Add.Name := 'id';
    cmdExec.ParamByName('id').Value := user_id;
    // update
    if edPassword.Color <> clWindow then
    begin
      // password ganti
      cmdExec.CommandText.Text :=
        ' update aguser set nama=:nama,password=password(:password),email=:email,user_profile_id=:user_profile_id where id=:id ';

    end
    else
    begin
      // password tidak ganti
      cmdExec.CommandText.Text :=
        ' update aguser set nama=:nama,email=:email,user_profile_id=:user_profile_id where id=:id ';

    end;
  end;
  cmdExec.Execute();

  // insert lokasi
  if user_id = 0 then
  begin
    if QGet.Active then
      QGet.Active := False;
    QGet.Params.Clear;
    QGet.Params.Add.Name := 'user_name';
    QGet.ParamByName('user_name').Value := edAkun.Text;
    QGet.SQL.Text := ' select id from aguser where user_name = :user_name ';
    QGet.Active := True;
    if QGet.RecordCount > 0 then
    begin
      cmdIn.Params.Clear;
      cmdIn.Params.Add.Name := 'user_id';
      cmdIn.ParamByName('user_id').Value := QGet.FieldByName('id').AsInteger;

      cmdIn.Params.Add.Name := 'lokasi_id';
      cmdIn.ParamByName('lokasi_id').Value := QLokasi.FieldByName('id')
        .AsInteger;

      cmdIn.CommandText.Text :=
        'insert into aguser_lokasi (user_id,lokasi_id,is_default) values (:user_id,:lokasi_id,1)';

      cmdIn.Execute();

    end;
  end;

  if frmSetting.QUser.Active then
    frmSetting.QUser.Active := False;
  frmSetting.QUser.Active := True;

  close;

  Hidemask;

end;

procedure TfrmUserAdd.edPasswordChange(Sender: TObject);
begin
  if user_id > 0 then
  begin
    if pass <> edPassword.Text then
    begin
      edPassword.Color := clInfoBk;
      edKonfimPass.Color := clInfoBk;
    end
    else
    begin
      edPassword.Color := clWindow;
      edKonfimPass.Color := clWindow;
    end;
  end;
end;

procedure TfrmUserAdd.UniFormAfterShow(Sender: TObject);
begin

  if user_id > 0 then
  begin
    ShowMask('Loading');
    UniSession.Synchronize();
    if QUser.Active then
      QUser.Active := False;
    QUser.SQL.Text :=
      'SELECT aguser.id,aguser.user_name,aguser.nama,aguser.password,aguser.email,user_profile.nama user_profile,lokasi.nama lokasi '
      + 'FROM aguser left join user_profile on  aguser.user_profile_id = user_profile.id '
      + ' left join aguser_lokasi ON aguser_lokasi.user_id = ' +
      IntToStr(user_id) +
      ' LEFT JOIN lokasi ON aguser_lokasi.lokasi_id = lokasi.id  ' +
      'WHERE aguser.id = ' + IntToStr(user_id);
    QUser.Active := True;
    edAkun.Text := QUser.FieldByName('user_name').AsString;
    edAkun.ReadOnly := True;
    edAkun.Color := clInactiveBorder;
    edNama.Text := QUser.FieldByName('nama').AsString;
    edPassword.Text := QUser.FieldByName('password').AsString;
    edKonfimPass.Text := QUser.FieldByName('password').AsString;
    pass := QUser.FieldByName('password').AsString;
    edEmail.Text := QUser.FieldByName('email').AsString;

    cbProfil.ItemIndex := cbProfil.Items.IndexOf
      (QUser.FieldByName('user_profile').AsString);

    cbLokasi.ItemIndex := cbLokasi.Items.IndexOf(QUser.FieldByName('lokasi')
      .AsString);
    Hidemask;

    edPassword.Color := clWindow;
    edKonfimPass.Color := clWindow;
  end;

  edAkun.SetFocus;
end;

procedure TfrmUserAdd.UniFormBeforeShow(Sender: TObject);
begin
  QProfil.Open();

  if QLokasi.Active then
    QLokasi.Active := False;
  QLokasi.ParamByName('organisasi_id').Value := UniApplication.Cookies.GetCookie
    ('OrganisasiId');
  QLokasi.Active := True;

end;

end.
