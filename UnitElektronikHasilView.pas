unit UnitElektronikHasilView;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniPanel, uniButton,
  uniPageControl, uniMemo, uniDBMemo, uniEdit, uniDBEdit, uniLabel,
  uniBasicGrid, uniDBGrid, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uniHTMLMemo;

type
  TfrmElektronikHasilView = class(TUniForm)
    UniContainerPanel1: TUniContainerPanel;
    UniButton1: TUniButton;
    pcDetailsData: TUniPageControl;
    utDetails: TUniTabSheet;
    utLog: TUniTabSheet;
    UniLabel1: TUniLabel;
    UniLabel2: TUniLabel;
    UniLabel3: TUniLabel;
    UniLabel4: TUniLabel;
    UniDBGrid1: TUniDBGrid;
    edSubject: TUniEdit;
    edReceipt: TUniEdit;
    QDetails: TFDQuery;
    dsLog: TDataSource;
    QLog: TFDQuery;
    btnKirim: TUniButton;
    btnSimpan: TUniButton;
    cmdSimpan: TFDCommand;
    pnlAttachment: TUniPanel;
    UniLabel5: TUniLabel;
    lblPass: TUniLabel;
    mmMessage: TUniHTMLMemo;
    QParam: TFDQuery;
    QKirim: TFDQuery;
    cmd: TFDCommand;
    procedure UniButton1Click(Sender: TObject);
    procedure UniFormBeforeShow(Sender: TObject);
    procedure btnKirimClick(Sender: TObject);
    procedure edSubjectChangeValue(Sender: TObject);
    procedure edReceiptChangeValue(Sender: TObject);
    procedure mmMessageChangeValue(Sender: TObject);
    procedure btnSimpanClick(Sender: TObject);
    procedure edSubjectChange(Sender: TObject);
    procedure pnlAttachmentClick(Sender: TObject);
  private
    updated: boolean;
    procedure SimpanCallback(Sender: TComponent; Res: Integer);
    // procedure kirim_by_nomor(nomor: string);
  public
    id: Integer;
    nomor: String;
  end;

function frmElektronikHasilView: TfrmElektronikHasilView;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, ServerModule, UnitEmail;

function frmElektronikHasilView: TfrmElektronikHasilView;
begin
  Result := TfrmElektronikHasilView
    (UniMainModule.GetFormInstance(TfrmElektronikHasilView));
end;

procedure kirim_by_nomor(nomor: string);
var
  status, host, username, password, sender_name: string;
  I, port, i_status, jum_antri: Integer;
  antri: array of Integer;
begin

  // cek parameters
  // host
  with frmElektronikHasilView do
  begin
    if QParam.Active then
      QParam.Active := False;
    QParam.ParamByName('name').Value := 'MAIL_HOST';
    QParam.Active := True;
    if (QParam.RecordCount = 0) or
      (QParam.FieldByName('value_char').AsString = '') then
    begin
      ShowMessage
        ('MAIL_HOST tidak valid atau belum ada, cek konfigurasi parameter.');
      exit;
    end;
    host := QParam.FieldByName('value_char').AsString;

    // port
    if QParam.Active then
      QParam.Active := False;
    QParam.ParamByName('name').Value := 'MAIL_HOST_PORT';
    QParam.Active := True;
    if (QParam.RecordCount = 0) or
      (QParam.FieldByName('value_num').AsString = '') then
    begin
      ShowMessage
        ('MAIL_HOST_PORT tidak valid atau belum ada, cek konfigurasi parameter.');
      exit;
    end;
    port := QParam.FieldByName('value_num').AsInteger;

    // username
    if QParam.Active then
      QParam.Active := False;
    QParam.ParamByName('name').Value := 'MAIL_USERNAME';
    QParam.Active := True;
    if (QParam.RecordCount = 0) or
      (QParam.FieldByName('value_char').AsString = '') then
    begin
      ShowMessage
        ('MAIL_USERNAME tidak valid atau belum ada, cek konfigurasi parameter.');
      exit;
    end;
    username := QParam.FieldByName('value_char').AsString;

    // password
    if QParam.Active then
      QParam.Active := False;
    QParam.ParamByName('name').Value := 'MAIL_PASSWORD';
    QParam.Active := True;
    if (QParam.RecordCount = 0) or
      (QParam.FieldByName('value_char').AsString = '') then
    begin
      ShowMessage
        ('MAIL_PASSWORD tidak valid atau belum ada, cek konfigurasi parameter.');
      exit;
    end;
    password := QParam.FieldByName('value_char').AsString;

    // name
    if QParam.Active then
      QParam.Active := False;
    QParam.ParamByName('name').Value := 'MAIL_NAME';
    QParam.Active := True;
    if (QParam.RecordCount = 0) or
      (QParam.FieldByName('value_char').AsString = '') then
    begin
      ShowMessage
        ('MAIL_NAME tidak valid atau belum ada, cek konfigurasi parameter.');
      exit;
    end;
    sender_name := QParam.FieldByName('value_char').AsString;

    begin
      ShowMask('Loading');
      UniSession.Synchronize();

      if QKirim.Active then
        QKirim.Active := False;
      QKirim.ParamByName('nomor').Value := nomor;
      QKirim.Active := True;

      try
        status := kirim(host, port, username, password, sender_name,
          QKirim.FieldByName('mail_receipt').AsString,
          QKirim.FieldByName('mail_subject').AsString,
          QKirim.FieldByName('mail_body').AsString,
          QKirim.FieldByName('mail_file_pdf').AsString);
      except
        exit;
      end;

      if cmd.Active then
        cmd.Active := False;
      cmd.Params.Clear;
      cmd.Params.Add.name := 'nomor';
      cmd.ParamByName('nomor').Value := nomor;
      cmd.Params.Add.name := 'last_update_by';
      cmd.ParamByName('last_update_by').Value :=
        UniApplication.Cookies.GetCookie('UserId');

      // cek status
      if status = 'Message sent successfully!' then
        i_status := 1
      else
        i_status := 9;

      cmd.Params.Add.name := 'status';
      cmd.ParamByName('status').Value := i_status;

      cmd.CommandText.Text :=
        'update  kirim_hasil set status = :status ,last_update_by = :last_update_by, last_update = NOW() where nomor = :nomor ';
      cmd.Execute();

      cmd.Params.Add.name := 'deskripsi';
      cmd.ParamByName('deskripsi').Value := status;

      cmd.CommandText.Text :=
        'insert into kirim_hasil_log(status,nomor,deskripsi,audit_user) ' +
        ' VALUES(:status,:nomor,:deskripsi,:last_update_by) ';
      cmd.Execute();

      HideMask;

      // refresh
      // aturView();
    end;
  end;
end;

procedure simpan_perubahan();
begin
  with frmElektronikHasilView do
  begin
    if cmdSimpan.Active then
      cmdSimpan.Active := False;
    cmdSimpan.Params.Clear;
    cmdSimpan.Params.Add.name := 'id';
    cmdSimpan.ParamByName('id').Value := QDetails.FieldByName('id').AsInteger;

    cmdSimpan.Params.Add.name := 'mail_subject';
    cmdSimpan.Params.Add.name := 'mail_receipt';
    cmdSimpan.Params.Add.name := 'mail_body';
    cmdSimpan.ParamByName('mail_subject').Value := edSubject.Text;
    cmdSimpan.ParamByName('mail_receipt').Value := edReceipt.Text;
    cmdSimpan.ParamByName('mail_body').Value := mmMessage.Lines.Text;

    cmdSimpan.CommandText.Text :=
      ' update kirim_hasil set mail_subject = :mail_subject ,mail_receipt = :mail_receipt,mail_body = :mail_body '
      + ' where id = :id ';
    cmdSimpan.Execute();

    // log
    if cmdSimpan.Active then
      cmdSimpan.Active := False;

    cmdSimpan.Params.Clear;
    cmdSimpan.Params.Add.name := 'status';
    cmdSimpan.ParamByName('status').Value := QDetails.FieldByName('status')
      .AsInteger;

    cmdSimpan.Params.Add.name := 'nomor';
    cmdSimpan.ParamByName('nomor').Value := nomor;

    cmdSimpan.Params.Add.name := 'deskripsi';
    cmdSimpan.ParamByName('deskripsi').Value := 'Ubah subject [' +
      edSubject.Text + '] ' + char(13) + 'receipt [' + edReceipt.Text + '] ' +
      char(13) + 'body [' + mmMessage.Lines.Text + ']';

    cmdSimpan.Params.Add.name := 'audit_user';
    cmdSimpan.ParamByName('audit_user').Value :=
      UniApplication.Cookies.GetCookie('UserId');

    cmdSimpan.CommandText.Text :=
      'insert into kirim_hasil_log(status,nomor,deskripsi,audit_user) ' +
      ' VALUES (:status,:nomor,:deskripsi,:audit_user) ';

    cmdSimpan.Execute();
  end;

end;

procedure TfrmElektronikHasilView.SimpanCallback(Sender: TComponent;
  Res: Integer);
begin
  ShowMask('Loading');
  UniSession.Synchronize();
  if Res = mrYes then
  begin
    btnSimpanClick(self);
    UniSession.Synchronize();
  end;
  kirim_by_nomor(QDetails.FieldByName('nomor').AsString);
  UniSession.Synchronize();
  close;
  HideMask;

end;

procedure TfrmElektronikHasilView.btnKirimClick(Sender: TObject);
begin

  if edReceipt.Text <> '' then
  begin

    ShowMask('Loading');
    UniSession.Synchronize();

    btnSimpanClick(self);

    kirim_by_nomor(QDetails.FieldByName('nomor').AsString);

    ShowMessage
      ('Email dalam proses pengiriman. Buka menu "Kirim Email" untuk melihat status.');
    HideMask;
    close;
  end
  else
  begin
    ShowMessage('Email penerima masih kosong.');
    edReceipt.SetFocus;
  end;

end;

procedure TfrmElektronikHasilView.btnSimpanClick(Sender: TObject);
begin
  ShowMask('Loading');
  UniSession.Synchronize();

  if cmdSimpan.Active then
    cmdSimpan.Active := False;
  cmdSimpan.Params.Clear;
  cmdSimpan.Params.Add.name := 'id';
  cmdSimpan.ParamByName('id').Value := QDetails.FieldByName('id').AsInteger;

  cmdSimpan.Params.Add.name := 'mail_subject';
  cmdSimpan.Params.Add.name := 'mail_receipt';
  cmdSimpan.Params.Add.name := 'mail_body';
  cmdSimpan.ParamByName('mail_subject').Value := edSubject.Text;
  cmdSimpan.ParamByName('mail_receipt').Value := edReceipt.Text;
  cmdSimpan.ParamByName('mail_body').Value := mmMessage.Lines.Text;

  cmdSimpan.CommandText.Text :=
    ' update kirim_hasil set mail_subject = :mail_subject ,mail_receipt = :mail_receipt,mail_body = :mail_body,tanggal = NOW() '
    + ' where id = :id ';
  cmdSimpan.Execute();

  // log
  if cmdSimpan.Active then
    cmdSimpan.Active := False;

  cmdSimpan.Params.Clear;
  cmdSimpan.Params.Add.name := 'status';
  cmdSimpan.ParamByName('status').Value := QDetails.FieldByName('status')
    .AsInteger;

  cmdSimpan.Params.Add.name := 'nomor';
  cmdSimpan.ParamByName('nomor').Value := nomor;

  cmdSimpan.Params.Add.name := 'deskripsi';
  cmdSimpan.ParamByName('deskripsi').Value := 'Ubah subject [' + edSubject.Text
    + '] ' + char(13) + 'receipt [' + edReceipt.Text + '] ' + char(13) +
    'body [' + mmMessage.Lines.Text + ']';

  cmdSimpan.Params.Add.name := 'audit_user';
  cmdSimpan.ParamByName('audit_user').Value := UniApplication.Cookies.GetCookie
    ('UserId');

  cmdSimpan.CommandText.Text :=
    'insert into kirim_hasil_log(status,nomor,deskripsi,audit_user) ' +
    ' VALUES (:status,:nomor,:deskripsi,:audit_user) ';

  cmdSimpan.Execute();

  if QLog.Active then
    QLog.Active := False;
  QLog.Active := True;

  btnSimpan.Enabled := False;

  HideMask;

  // // update data
  // with frmElektronikHasil do
  // begin
  // if QPending.Active then
  // QPending.Active := False;
  // QPending.Active := True;
  // if QGagal.Active then
  // QGagal.Active := False;
  // QGagal.Active := True;
  // if QSukses.Active then
  // QSukses.Active := False;
  // QSukses.Active := True;
  //
  // end;

end;

procedure TfrmElektronikHasilView.edReceiptChangeValue(Sender: TObject);
begin
  updated := True;
  btnSimpan.Enabled := True;
end;

procedure TfrmElektronikHasilView.edSubjectChange(Sender: TObject);
begin
  updated := True;
  btnSimpan.Enabled := True;
end;

procedure TfrmElektronikHasilView.edSubjectChangeValue(Sender: TObject);
begin
  updated := True;
  btnSimpan.Enabled := True;
end;

procedure TfrmElektronikHasilView.mmMessageChangeValue(Sender: TObject);
begin
  updated := True;
  btnSimpan.Enabled := True;
end;

procedure TfrmElektronikHasilView.pnlAttachmentClick(Sender: TObject);
var
  user_profile_id: string;
begin
  user_profile_id := UniApplication.Cookies.GetCookie('user_profile_id');
  if StrToInt(user_profile_id) < 1 then
  begin
    // log
    if cmdSimpan.Active then
      cmdSimpan.Active := False;

    cmdSimpan.Params.Clear;
    cmdSimpan.Params.Add.name := 'status';
    cmdSimpan.ParamByName('status').Value := QDetails.FieldByName('status')
      .AsInteger;

    cmdSimpan.Params.Add.name := 'nomor';
    cmdSimpan.ParamByName('nomor').Value := nomor;

    cmdSimpan.Params.Add.name := 'deskripsi';
    cmdSimpan.ParamByName('deskripsi').Value := 'Download file attachment [' +
      QDetails.FieldByName('mail_file_name').AsString + ']';

    cmdSimpan.Params.Add.name := 'audit_user';
    cmdSimpan.ParamByName('audit_user').Value :=
      UniApplication.Cookies.GetCookie('UserId');

    cmdSimpan.CommandText.Text :=
      'insert into kirim_hasil_log(status,nomor,deskripsi,audit_user) ' +
      ' VALUES (:status,:nomor,:deskripsi,:audit_user) ';

    cmdSimpan.Execute();

    if QLog.Active then
      QLog.Active := False;
    QLog.Active := True;

    UniSession.SendFile(QDetails.FieldByName('mail_file_pdf').AsString);
  end
  else
    ShowMessage('Tidak ada hak akses untuk download file PDF.');
end;

procedure TfrmElektronikHasilView.UniButton1Click(Sender: TObject);
begin
  close;
end;

procedure TfrmElektronikHasilView.UniFormBeforeShow(Sender: TObject);
var
  FName, user_profile_id: string;
begin
  pcDetailsData.ActivePage := utDetails;

  if QDetails.Active then
    QDetails.Active := True;
  QDetails.ParamByName('nomor').Value := nomor;
  QDetails.Active := True;

  edSubject.Text := QDetails.FieldByName('mail_subject').AsString;
  // edReceipt.Text := QDetails.FieldByName('mail_receipt').AsString;
  mmMessage.Lines.Text := QDetails.FieldByName('mail_body').AsString;

  // showMessage(pnlAttachment.Caption);

  pnlAttachment.Caption := QDetails.FieldByName('mail_file_name').AsString;
  user_profile_id := UniApplication.Cookies.GetCookie('user_profile_id');
  if StrToInt(user_profile_id) < 2 then
  begin
    lblPass.Caption := '****';
  end
  else
    lblPass.Caption := QDetails.FieldByName('password_pdf').AsString;

  if QLog.Active then
    QLog.Active := False;
  QLog.ParamByName('nomor').Value := QDetails.FieldByName('nomor').AsString;
  QLog.Active := True;

end;

end.
