unit UnitNotifAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniEdit, uniDBEdit, uniGUIBaseClasses, uniLabel,
  uniButton, uniCheckBox, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, UnitValidatorFields;

type
  TfrmNotifAdd = class(TUniForm)
    UniLabel1: TUniLabel;
    UniDBEdit1: TUniDBEdit;
    UniLabel2: TUniLabel;
    UniDBEdit2: TUniDBEdit;
    UniLabel3: TUniLabel;
    UniDBEdit3: TUniDBEdit;
    UniLabel4: TUniLabel;
    UniDBEdit4: TUniDBEdit;
    UniCheckBox1: TUniCheckBox;
    cbEmail: TUniCheckBox;
    edEmail: TUniEdit;
    UniButton1: TUniButton;
    QPasienAdd: TFDQuery;
    dsPasien: TDataSource;
    UniLabel5: TUniLabel;
    cmdAdd: TFDCommand;
    QLastResId: TFDQuery;
    procedure cbEmailChange(Sender: TObject);
    procedure UniButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function frmNotifAdd: TfrmNotifAdd;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function frmNotifAdd: TfrmNotifAdd;
begin
  Result := TfrmNotifAdd(UniMainModule.GetFormInstance(TfrmNotifAdd));
end;

procedure TfrmNotifAdd.cbEmailChange(Sender: TObject);
begin
  if cbEmail.Checked then
    edEmail.Enabled := True
  else
  begin
    edEmail.Enabled := False;
    edEmail.Clear;
  end;
end;

procedure TfrmNotifAdd.UniButton1Click(Sender: TObject);
begin

  if cbEmail.Checked then
    if edEmail.Text = '' then
    begin
      ShowMessage('isi email.');
      edEmail.SetFocus;
      exit;
    end
    else
    begin
      if not ValidEmail(edEmail.Text) then
      begin
        ShowMessage('email tidak valid.');
        edEmail.SetFocus;
        exit;
      end;

    end;

  ShowMask('Loading');
  UniSession.Synchronize();

  if QLastResId.Active then
    QLastResId.Active := False;
  QLastResId.ParamByName('noreg').Value :=
    QPasienAdd.FieldByName('noreg').AsString;
  QLastResId.Active := True;

  if cmdAdd.Active then
    cmdAdd.Active := False;

  cmdAdd.CommandText.Text := ' DELETE FROM notifikasi WHERE noreg = ' +
    QuotedStr(QPasienAdd.FieldByName('noreg').AsString) + ' AND user_id = ' +
    UniApplication.Cookies.GetCookie('UserId') + ';';
  cmdAdd.Execute;

  if cmdAdd.Active then
    cmdAdd.Active := False;
  if cbEmail.Checked then
    cmdAdd.CommandText.Text :=
      'INSERT INTO notifikasi (user_id,noreg,notifikasi_ke,notifikasi_receiver,last_result_detail_id) VALUES ( '
      + UniApplication.Cookies.GetCookie('UserId') + ',' +
      QuotedStr(QPasienAdd.FieldByName('noreg').AsString) + ',' +
      QuotedStr('email') + ',' + QuotedStr(edEmail.Text) + ',' +
      QuotedStr(QLastResId.FieldByName('last_val').AsString) + ');'
  else
    cmdAdd.CommandText.Text :=
      'INSERT INTO notifikasi (user_id,noreg,last_result_detail_id) VALUES ( ' +
      UniApplication.Cookies.GetCookie('UserId') + ',' +
      QuotedStr(QPasienAdd.FieldByName('noreg').AsString) + ',' +
      QuotedStr(QLastResId.FieldByName('last_val').AsString) + ');';

  cmdAdd.Execute;
  Close;
  HideMask;
  UniSession.AddJS('Ext.toast({html: "Notifikasi : ' + QPasienAdd.FieldByName
    ('noreg').AsString + ' ' + QPasienAdd.FieldByName('nama').AsString +
    ' ditambahkan di list.", header: false, autoCloseDelay: 2000});');

end;

end.
