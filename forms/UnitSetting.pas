unit UnitSetting;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniPanel, uniPageControl, uniGUIBaseClasses,
  uniBasicGrid, uniDBGrid, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uniButton, uniBitBtn,
  uniSpeedButton, uniEdit, uniLabel, uniGroupBox, uniMemo, uniHTMLMemo;

type
  TfrmSetting = class(TUniForm)
    UniPageControl1: TUniPageControl;
    UniTabSheet1: TUniTabSheet;
    UniContainerPanel1: TUniContainerPanel;
    UniDBGrid1: TUniDBGrid;
    QUser: TFDQuery;
    DSUser: TDataSource;
    btnTambah: TUniSpeedButton;
    btnEdit: TUniSpeedButton;
    UniSpeedButton1: TUniSpeedButton;
    cmdExec: TFDCommand;
    UniTabSheet2: TUniTabSheet;
    UniGroupBox1: TUniGroupBox;
    UniLabel1: TUniLabel;
    edMailServer: TUniEdit;
    UniLabel2: TUniLabel;
    UniLabel3: TUniLabel;
    edPort: TUniNumberEdit;
    edName: TUniEdit;
    UniLabel4: TUniLabel;
    edUsername: TUniEdit;
    UniSpeedButton2: TUniSpeedButton;
    UniGroupBox2: TUniGroupBox;
    UniLabel5: TUniLabel;
    edPassword: TUniEdit;
    UniLabel6: TUniLabel;
    edSubject: TUniEdit;
    mmBody: TUniHTMLMemo;
    UniSpeedButton3: TUniSpeedButton;
    UniLabel7: TUniLabel;
    QParams: TFDQuery;
    cmdUpdate: TFDCommand;
    procedure UniFormBeforeShow(Sender: TObject);
    procedure btnTambahClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure UniSpeedButton1Click(Sender: TObject);
    procedure UniFormAfterShow(Sender: TObject);
    procedure UniSpeedButton2Click(Sender: TObject);
    procedure UniSpeedButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function frmSetting: TfrmSetting;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, UnitUserAdd;

function frmSetting: TfrmSetting;
begin
  Result := TfrmSetting(UniMainModule.GetFormInstance(TfrmSetting));
end;

procedure TfrmSetting.btnEditClick(Sender: TObject);
begin
  frmUserAdd.user_id := QUser.FieldByName('id').AsInteger;
  frmUserAdd.Caption := 'Edit [' + QUser.FieldByName('nama').AsString + ']';
  frmUserAdd.ShowModal;
end;

procedure TfrmSetting.btnTambahClick(Sender: TObject);
begin
  frmUserAdd.user_id := 0;
  frmUserAdd.ShowModal;
end;

procedure TfrmSetting.UniFormAfterShow(Sender: TObject);
begin
  UniPageControl1.ActivePage.PageIndex := 1;
end;

procedure TfrmSetting.UniFormBeforeShow(Sender: TObject);
begin
  QUser.Open();

  if QParams.Active then
    QParams.Active := False;
  QParams.ParamByName('name').Value := 'MAIL_HOST';
  QParams.Active := True;
  edMailServer.Text := QParams.FieldByName('value_char').AsString;

  if QParams.Active then
    QParams.Active := False;
  QParams.ParamByName('name').Value := 'MAIL_HOST_PORT';
  QParams.Active := True;
  edPort.Text := QParams.FieldByName('value_num').AsString;

  if QParams.Active then
    QParams.Active := False;
  QParams.ParamByName('name').Value := 'MAIL_NAME';
  QParams.Active := True;
  edName.Text := QParams.FieldByName('value_char').AsString;

  if QParams.Active then
    QParams.Active := False;
  QParams.ParamByName('name').Value := 'MAIL_USERNAME';
  QParams.Active := True;
  edUsername.Text := QParams.FieldByName('value_char').AsString;

  if QParams.Active then
    QParams.Active := False;
  QParams.ParamByName('name').Value := 'MAIL_PASSWORD';
  QParams.Active := True;
  edPassword.Text := QParams.FieldByName('value_char').AsString;

  if QParams.Active then
    QParams.Active := False;
  QParams.ParamByName('name').Value := 'MAIL_SUBJECT_FORMAT';
  QParams.Active := True;
  edSubject.Text := QParams.FieldByName('value_char').AsString;

  if QParams.Active then
    QParams.Active := False;
  QParams.ParamByName('name').Value := 'MAIL_BODY_FORMAT';
  QParams.Active := True;
  mmBody.Lines.Text := QParams.FieldByName('value_text').AsString;

end;

procedure TfrmSetting.UniSpeedButton1Click(Sender: TObject);
begin
  if cmdExec.Active then
    cmdExec.Active := False;
  cmdExec.CommandText.Text := ' UPDATE aguser SET flg_aktif = ' + QuotedStr('N')
    + ' WHERE id = ' + QUser.FieldByName('id').AsString;
  cmdExec.Execute();

  if QUser.Active then
    QUser.Active := False;
  QUser.Active := True;

end;

procedure TfrmSetting.UniSpeedButton2Click(Sender: TObject);
begin

  ShowMask('Loading');
  UniSession.Synchronize();
  // server
  if cmdUpdate.Active then
    cmdUpdate.Active := False;
  cmdUpdate.Params.clear;
  cmdUpdate.Params.Add.Name := 'name';
  cmdUpdate.ParamByName('name').Value := 'MAIL_HOST';
  cmdUpdate.Params.Add.Name := 'value_char';
  cmdUpdate.ParamByName('value_char').Value := edMailServer.Text;
  cmdUpdate.CommandText.Text :=
    'UPDATE parameters SET value_char=:value_char WHERE name=:name ';
  cmdUpdate.Execute();

  // port
  if cmdUpdate.Active then
    cmdUpdate.Active := False;
  cmdUpdate.Params.clear;
  cmdUpdate.Params.Add.Name := 'name';
  cmdUpdate.ParamByName('name').Value := 'MAIL_HOST_PORT';
  cmdUpdate.Params.Add.Name := 'value_num';
  cmdUpdate.ParamByName('value_num').Value := edPort.Text;
  cmdUpdate.CommandText.Text :=
    'UPDATE parameters SET value_num=:value_num WHERE name=:name ';
  cmdUpdate.Execute();

  // name
  if cmdUpdate.Active then
    cmdUpdate.Active := False;
  cmdUpdate.Params.clear;
  cmdUpdate.Params.Add.Name := 'name';
  cmdUpdate.ParamByName('name').Value := 'MAIL_NAME';
  cmdUpdate.Params.Add.Name := 'value_char';
  cmdUpdate.ParamByName('value_char').Value := edName.Text;
  cmdUpdate.CommandText.Text :=
    'UPDATE parameters SET value_char=:value_char WHERE name=:name ';
  cmdUpdate.Execute();

  // user name
  if cmdUpdate.Active then
    cmdUpdate.Active := False;
  cmdUpdate.Params.clear;
  cmdUpdate.Params.Add.Name := 'name';
  cmdUpdate.ParamByName('name').Value := 'MAIL_USERNAME';
  cmdUpdate.Params.Add.Name := 'value_char';
  cmdUpdate.ParamByName('value_char').Value := edUsername.Text;
  cmdUpdate.CommandText.Text :=
    'UPDATE parameters SET value_char=:value_char WHERE name=:name ';
  cmdUpdate.Execute();

  // password
  if cmdUpdate.Active then
    cmdUpdate.Active := False;
  cmdUpdate.Params.clear;
  cmdUpdate.Params.Add.Name := 'name';
  cmdUpdate.ParamByName('name').Value := 'MAIL_PASSWORD';
  cmdUpdate.Params.Add.Name := 'value_char';
  cmdUpdate.ParamByName('value_char').Value := edPassword.Text;
  cmdUpdate.CommandText.Text :=
    'UPDATE parameters SET value_char=:value_char WHERE name=:name ';
  cmdUpdate.Execute();

  ShowMessage('SMTP setting update berhasil.');
  HideMask;

end;

procedure TfrmSetting.UniSpeedButton3Click(Sender: TObject);
begin
  ShowMask('Loading');
  UniSession.Synchronize();
  // subject
  if cmdUpdate.Active then
    cmdUpdate.Active := False;
  cmdUpdate.Params.clear;
  cmdUpdate.Params.Add.Name := 'name';
  cmdUpdate.ParamByName('name').Value := 'MAIL_SUBJECT_FORMAT';
  cmdUpdate.Params.Add.Name := 'value_char';
  cmdUpdate.ParamByName('value_char').Value := edSubject.Text;
  cmdUpdate.CommandText.Text :=
    'UPDATE parameters SET value_char=:value_char WHERE name=:name ';
  cmdUpdate.Execute();

  // body
  if cmdUpdate.Active then
    cmdUpdate.Active := False;
  cmdUpdate.Params.clear;
  cmdUpdate.Params.Add.Name := 'name';
  cmdUpdate.ParamByName('name').Value := 'MAIL_BODY_FORMAT';
  cmdUpdate.Params.Add.Name := 'value_text';
  cmdUpdate.ParamByName('value_text').Value := mmBody.Lines.Text;
  cmdUpdate.CommandText.Text :=
    'UPDATE parameters SET value_text=:value_text WHERE name=:name ';
  cmdUpdate.Execute();

  ShowMessage('Update message sukses.');
  HideMask;
end;

end.
