unit UnitElektronikHasil;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniPanel, uniPageControl, uniGUIBaseClasses,
  uniButton, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uniBasicGrid, uniDBGrid, uniMemo, uniDateTimePicker,
  uniLabel;

type
  TfrmElektronikHasil = class(TUniForm)
    pcHasil: TUniPageControl;
    pgPending: TUniTabSheet;
    UniContainerPanel1: TUniContainerPanel;
    btnKirim: TUniButton;
    grdPending: TUniDBGrid;
    DSPending: TDataSource;
    QPending: TFDQuery;
    QParam: TFDQuery;
    QKirim: TFDQuery;
    cmd: TFDCommand;
    pgGagal: TUniTabSheet;
    btnViewPending: TUniButton;
    QGagal: TFDQuery;
    DSGagal: TDataSource;
    UniDBGrid1: TUniDBGrid;
    UniContainerPanel2: TUniContainerPanel;
    btnResetGagal: TUniButton;
    btnViewGagal: TUniButton;
    pgSukses: TUniTabSheet;
    UniContainerPanel3: TUniContainerPanel;
    UniContainerPanel4: TUniContainerPanel;
    btnViewSukses: TUniButton;
    UniDBGrid2: TUniDBGrid;
    Tanggal: TUniLabel;
    dtTgl: TUniDateTimePicker;
    QSukses: TFDQuery;
    dsSukses: TDataSource;
    btnResetSukses: TUniButton;
    procedure btnKirimClick(Sender: TObject);
    procedure UniFormAfterShow(Sender: TObject);
    procedure btnViewPendingClick(Sender: TObject);
    procedure UniFormBeforeShow(Sender: TObject);
    procedure btnResetGagalClick(Sender: TObject);
    procedure btnViewGagalClick(Sender: TObject);
    procedure grdPendingBodyDblClick(Sender: TObject);
    procedure UniDBGrid1BodyDblClick(Sender: TObject);
    procedure dtTglChange(Sender: TObject);
    procedure btnViewSuksesClick(Sender: TObject);
  private
    { Private declarations }

  public
    procedure kirim_by_nomor(nomor: string);
    // antri: array of Integer;
    // host: String;
    // port: Integer;
    // username: String;
    // password: String;
    // sender_name: String;

  end;

function frmElektronikHasil: TfrmElektronikHasil;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, UnitEmail, UnitElektronikHasilView;

function frmElektronikHasil: TfrmElektronikHasil;
begin
  Result := TfrmElektronikHasil
    (UniMainModule.GetFormInstance(TfrmElektronikHasil));
end;

procedure aturView();
begin
  with frmElektronikHasil do
  begin
    if QPending.Active then
      QPending.Active := False;
    QPending.Active := True;
    if QPending.RecordCount = 0 then
    begin
      btnKirim.Enabled := False;
      btnViewPending.Enabled := False;
    end
    else
    begin
      btnKirim.Enabled := True;
      btnViewPending.Enabled := True;
    end;
    pgPending.Caption := 'Pending (' + IntToStr(QPending.RecordCount) + ')';
    // gagal
    if QGagal.Active then
      QGagal.Active := False;
    QGagal.Active := True;
    if QGagal.RecordCount = 0 then
    begin
      btnResetGagal.Enabled := False;
      btnViewGagal.Enabled := False;
    end
    else
    begin
      btnResetGagal.Enabled := True;
      btnViewGagal.Enabled := True;
    end;
    pgGagal.Caption := 'Gagal (' + IntToStr(QGagal.RecordCount) + ')';

    // sukses
    if QSukses.Active then
      QSukses.Active := False;
    QSukses.ParamByName('TANGGAL').Value := dtTgl.DateTime;
    QSukses.Active := True;
    if QSukses.RecordCount = 0 then
    begin
      btnResetSukses.Enabled := False;
      btnViewSukses.Enabled := False;
    end
    else
    begin
      btnResetSukses.Enabled := True;
      btnViewSukses.Enabled := True;
    end;
    pgSukses.Caption := 'Sukses (' + IntToStr(QSukses.RecordCount) + ')';

  end;
end;

procedure TfrmElektronikHasil.kirim_by_nomor(nomor: string);
var
  status, host, username, password, sender_name: string;
  I, port, i_status, jum_antri: integer;
  antri: array of integer;
begin
  with frmElektronikHasil do
  begin
    // cek parameters
    // host
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
      aturView();
    end;
  end;
end;

procedure TfrmElektronikHasil.btnKirimClick(Sender: TObject);
var
  status, host, username, password, sender_name: string;
  I, port, i_status, jum_antri: integer;
  antri: array of integer;
begin
  // cek parameters
  // host
  if QParam.Active then
    QParam.Active := False;
  QParam.ParamByName('name').Value := 'MAIL_HOST';
  QParam.Active := True;
  if (QParam.RecordCount = 0) or (QParam.FieldByName('value_char').AsString = '')
  then
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
  if (QParam.RecordCount = 0) or (QParam.FieldByName('value_num').AsString = '')
  then
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
  if (QParam.RecordCount = 0) or (QParam.FieldByName('value_char').AsString = '')
  then
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
  if (QParam.RecordCount = 0) or (QParam.FieldByName('value_char').AsString = '')
  then
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
  if (QParam.RecordCount = 0) or (QParam.FieldByName('value_char').AsString = '')
  then
  begin
    ShowMessage
      ('MAIL_NAME tidak valid atau belum ada, cek konfigurasi parameter.');
    exit;
  end;
  sender_name := QParam.FieldByName('value_char').AsString;

  // data antrian array
  jum_antri := grdPending.SelectedRows.Count;
  SetLength(antri, jum_antri);

  for I := 0 to jum_antri - 1 do
  begin
    QPending.Bookmark := grdPending.SelectedRows[I];
    antri[I] := QPending.FieldByName('id').AsInteger;
  end;

  for I := 0 to jum_antri - 1 do
  begin
    ShowMask('Loading');
    UniSession.Synchronize();

    if QKirim.Active then
      QKirim.Active := False;
    QKirim.ParamByName('id').Value := antri[I];
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
    cmd.ParamByName('nomor').Value := QKirim.FieldByName('nomor').AsString;
    cmd.Params.Add.name := 'last_update_by';
    cmd.ParamByName('last_update_by').Value := UniApplication.Cookies.GetCookie
      ('UserId');

    // cek status
    if status = 'Message sent successfully!' then
      i_status := 1
    else
      i_status := 9;

    cmd.CommandText.Text := 'update  kirim_hasil set status = ' +
      IntToStr(i_status) +
      ',last_update_by = :last_update_by, last_update = NOW() where nomor = :nomor ';
    cmd.Execute();

    cmd.Params.Add.name := 'deskripsi';
    cmd.ParamByName('deskripsi').Value := status;

    cmd.CommandText.Text :=
      'insert into kirim_hasil_log(status,nomor,deskripsi,audit_user) ' +
      ' VALUES(' + IntToStr(i_status) + ',:nomor,:deskripsi,:last_update_by) ';
    cmd.Execute();

    HideMask;

  end;

  // refresh
  aturView();

end;

procedure TfrmElektronikHasil.btnResetGagalClick(Sender: TObject);
begin
  if cmd.Active then
    cmd.Active := False;
  cmd.Params.Clear;
  cmd.Params.Add.name := 'nomor';
  cmd.ParamByName('nomor').Value := QGagal.FieldByName('nomor').AsString;
  cmd.CommandText.Text :=
    'update kirim_hasil set status = 0 where nomor = :nomor ';
  cmd.Execute();
  aturView();
end;

procedure TfrmElektronikHasil.btnViewGagalClick(Sender: TObject);
begin
  frmElektronikHasilView.id := QGagal.FieldByName('id').AsInteger;
  frmElektronikHasilView.nomor := QGagal.FieldByName('nomor').AsString;
  frmElektronikHasilView.btnKirim.Visible := False;
  frmElektronikHasilView.ShowModal;
end;

procedure TfrmElektronikHasil.btnViewPendingClick(Sender: TObject);
begin
  frmElektronikHasilView.id := QPending.FieldByName('id').AsInteger;
  frmElektronikHasilView.nomor := QPending.FieldByName('nomor').AsString;
  frmElektronikHasilView.ShowModal;
end;

procedure TfrmElektronikHasil.btnViewSuksesClick(Sender: TObject);
begin
  frmElektronikHasilView.id := QSukses.FieldByName('id').AsInteger;
  frmElektronikHasilView.nomor := QSukses.FieldByName('nomor').AsString;
  frmElektronikHasilView.btnKirim.Visible := False;
  frmElektronikHasilView.edSubject.Enabled := False;
  frmElektronikHasilView.edReceipt.Enabled := False;
  frmElektronikHasilView.mmMessage.Enabled := False;
  frmElektronikHasilView.btnSimpan.Visible := False;
  frmElektronikHasilView.ShowModal;
end;

procedure TfrmElektronikHasil.dtTglChange(Sender: TObject);
begin
  aturView();
end;

procedure TfrmElektronikHasil.grdPendingBodyDblClick(Sender: TObject);
begin
  frmElektronikHasilView.id := QPending.FieldByName('id').AsInteger;
  frmElektronikHasilView.ShowModal;
end;

procedure TfrmElektronikHasil.UniDBGrid1BodyDblClick(Sender: TObject);
begin
  frmElektronikHasilView.id := QGagal.FieldByName('id').AsInteger;
  frmElektronikHasilView.ShowModal;
end;

procedure TfrmElektronikHasil.UniFormAfterShow(Sender: TObject);
begin
  dtTgl.DateTime := Now;
  aturView();
end;

procedure TfrmElektronikHasil.UniFormBeforeShow(Sender: TObject);
begin
  pcHasil.ActivePage := pgPending;
end;

end.
