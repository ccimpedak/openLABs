unit KirimEmail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.Client,
  Data.DB, FireDAC.Comp.DataSet, uniMultiItem, uniComboBox, uniDateTimePicker,
  uniLabel, uniBasicGrid, uniDBGrid, uniButton, uniPanel, uniPageControl,
  uniGUIBaseClasses;

type
  TUniVKirimEmail = class(TUniFrame)
    pcHasil: TUniPageControl;
    pgPending: TUniTabSheet;
    UniContainerPanel1: TUniContainerPanel;
    btnKirim: TUniButton;
    btnViewPending: TUniButton;
    grdPending: TUniDBGrid;
    UniContainerPanel5: TUniContainerPanel;
    UniLabel1: TUniLabel;
    dtPending: TUniDateTimePicker;
    UniButton1: TUniButton;
    UniLabel2: TUniLabel;
    cbStatusHasil: TUniComboBox;
    pgGagal: TUniTabSheet;
    UniDBGrid1: TUniDBGrid;
    UniContainerPanel2: TUniContainerPanel;
    btnResetGagal: TUniButton;
    btnViewGagal: TUniButton;
    pgSukses: TUniTabSheet;
    UniContainerPanel3: TUniContainerPanel;
    Tanggal: TUniLabel;
    dtTgl: TUniDateTimePicker;
    UniContainerPanel4: TUniContainerPanel;
    btnViewSukses: TUniButton;
    btnResetSukses: TUniButton;
    UniDBGrid2: TUniDBGrid;
    DSPending: TDataSource;
    QPending: TFDQuery;
    QParam: TFDQuery;
    QKirim: TFDQuery;
    cmd: TFDCommand;
    QGagal: TFDQuery;
    DSGagal: TDataSource;
    QSukses: TFDQuery;
    dsSukses: TDataSource;
    cmdKirim: TFDCommand;
    QKirimTmp: TFDQuery;
    UniButton2: TUniButton;
    UniButton3: TUniButton;
    // procedure UniFrameCreate(Sender: TObject);
    procedure UniFrameReady(Sender: TObject);
    procedure aturView();
    procedure dtPendingChange(Sender: TObject);
    procedure cbStatusHasilChange(Sender: TObject);
    procedure UniButton1Click(Sender: TObject);
    procedure dtTglChange(Sender: TObject);
    procedure grdPendingBodyDblClick(Sender: TObject);
    procedure grdPendingCellClick(Column: TUniDBGridColumn);
    procedure btnViewPendingClick(Sender: TObject);
    procedure btnViewGagalClick(Sender: TObject);
    procedure btnResetGagalClick(Sender: TObject);
    procedure btnResetSuksesClick(Sender: TObject);
    procedure btnViewSuksesClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure kirim_by_nomor(nomor: string; mail_receipt: string;
      mail_subject: string; mail_body: string; mail_file_pdf: string);
  end;

implementation

{$R *.dfm}

uses uniGUIApplication, UnitElektronikHasilView, UnitEmail;

procedure TUniVKirimEmail.kirim_by_nomor(nomor: string; mail_receipt: string;
  mail_subject: string; mail_body: string; mail_file_pdf: string);
var
  status, host, username, password, sender_name: string;
  I, port, i_status, jum_antri: integer;
  antri: array of integer;
begin
  // with KirimEmail do
  // begin
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


  // insert ke pengiriman

  // ,:noreg,:nama_pasien,:mail_receipt,:mail_subject,:mail_body,:mail_file_pdf)
  if cmdKirim.Active then
    cmdKirim.Active := False;
  cmdKirim.ParamByName('nomor').Value := nomor;
  cmdKirim.ParamByName('noreg').Value := QPending.FieldByName('noreg').AsString;
  cmdKirim.ParamByName('nama_pasien').Value :=
    QPending.FieldByName('nama_pasien').AsString;
  cmdKirim.ParamByName('mail_receipt').Value := mail_receipt;
  cmdKirim.ParamByName('mail_subject').Value := mail_subject;
  cmdKirim.ParamByName('mail_body').Value := mail_body;
  cmdKirim.ParamByName('mail_file_pdf').Value := mail_file_pdf;
  cmdKirim.Execute();

  // begin
  // ShowMask('Loading');
  // UniSession.Synchronize();

  // exit;

  if QKirimTmp.Active then
    QKirimTmp.Active := False;
  QKirimTmp.ParamByName('nomor').Value := nomor;
  QKirimTmp.Active := True;

  try
    status := kirim(host, port, username, password, sender_name,
      QKirimTmp.FieldByName('mail_receipt').AsString,
      QKirimTmp.FieldByName('mail_subject').AsString,
      QKirimTmp.FieldByName('mail_body').AsString,
      QKirimTmp.FieldByName('mail_file_pdf').AsString);
  except
    exit;
  end;

  if cmd.Active then
    cmd.Active := False;
  cmd.Params.Clear;
  cmd.Params.Add.name := 'id';
  cmd.ParamByName('id').Value := QKirimTmp.FieldByName('id').AsInteger;
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
    ',last_update_by = :last_update_by, last_update = NOW() where id = :id ';
  cmd.Execute();

  cmd.Params.Add.name := 'deskripsi';
  cmd.ParamByName('deskripsi').Value := status;
  // cmd.Params.Add.name := 'nomor';
  // cmd.ParamByName('nomor').Value := nomor;

  cmd.CommandText.Text :=
    'insert into kirim_hasil_log(status,nomor,deskripsi,audit_user) ' +
    ' VALUES(' + IntToStr(i_status) + ',' + QuotedStr(nomor) +
    ',:deskripsi,:last_update_by) ';
  cmd.Execute();

  // HideMask;

  // refresh
  aturView();
  // end;
end;

procedure TUniVKirimEmail.aturView();
begin
  // with KirimEmail do
  // begin
  if QPending.Active then
    QPending.Active := False;
  QPending.ParamByName('tanggal').Value := formatdatetime('yyyy-mm-dd',
    dtPending.DateTime);
  QPending.ParamByName('order_status').Value := cbStatusHasil.Text;
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

  // end;
end;

procedure TUniVKirimEmail.btnResetGagalClick(Sender: TObject);
begin
  if cmd.Active then
    cmd.Active := False;
  cmd.CommandText.Text := ' UPDATE kirim_hasil set status = 0 WHERE nomor = ' +
    QuotedStr(QGagal.FieldByName('nomor').AsString);
  cmd.Execute();
  aturView();
end;

procedure TUniVKirimEmail.btnResetSuksesClick(Sender: TObject);
begin
  if cmd.Active then
    cmd.Active := False;
  cmd.CommandText.Text := ' UPDATE kirim_hasil set status = 0 WHERE nomor = ' +
    QuotedStr(QSukses.FieldByName('nomor').AsString);
  cmd.Execute();
  aturView();
end;

procedure TUniVKirimEmail.btnViewGagalClick(Sender: TObject);
begin
  frmElektronikHasilView.nomor := QGagal.FieldByName('nomor').AsString;
  frmElektronikHasilView.btnKirim.Visible := False;
  frmElektronikHasilView.edSubject.Enabled := False;
  frmElektronikHasilView.edSubject.Color := clInactiveCaption;
  frmElektronikHasilView.edReceipt.Enabled := False;
  frmElektronikHasilView.edReceipt.Color := clInactiveCaption;
  frmElektronikHasilView.mmMessage.Enabled := False;
  frmElektronikHasilView.mmMessage.Color := clInactiveCaption;
  frmElektronikHasilView.btnSimpan.Visible := False;
  frmElektronikHasilView.btnKirim.Visible := False;
  frmElektronikHasilView.ShowModal;
end;

procedure TUniVKirimEmail.btnViewPendingClick(Sender: TObject);
begin
  frmElektronikHasilView.nomor := QPending.FieldByName('nomor').AsString;
  frmElektronikHasilView.ShowModal;
end;

procedure TUniVKirimEmail.btnViewSuksesClick(Sender: TObject);
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

procedure TUniVKirimEmail.cbStatusHasilChange(Sender: TObject);
begin
  aturView();
end;

procedure TUniVKirimEmail.dtPendingChange(Sender: TObject);
begin
  aturView();
end;

procedure TUniVKirimEmail.dtTglChange(Sender: TObject);
begin
  aturView();
end;

procedure TUniVKirimEmail.grdPendingBodyDblClick(Sender: TObject);
begin
  if QPending.FieldByName('res_status').Text = 'Ready.' then
  begin
    frmElektronikHasilView.nomor := QPending.FieldByName('nomor').AsString;
    frmElektronikHasilView.ShowModal;
  end;
end;

procedure TUniVKirimEmail.grdPendingCellClick(Column: TUniDBGridColumn);
begin
  if QPending.FieldByName('res_status').Text = 'Ready.' then
  begin
    if QPending.FieldByName('metode').AsString = 'email' then
      btnKirim.Enabled := True;
    btnViewPending.Enabled := True;
  end
  else
  begin
    btnKirim.Enabled := False;
    btnViewPending.Enabled := False;
  end;
end;

procedure TUniVKirimEmail.UniButton1Click(Sender: TObject);
begin
  aturView();
end;

procedure TUniVKirimEmail.UniFrameReady(Sender: TObject);
begin
  pcHasil.ActivePage := pgPending;
  dtTgl.DateTime := Now;
  dtPending.DateTime := Now;
  aturView();
end;

initialization

RegisterClass(TUniVKirimEmail);

end.
