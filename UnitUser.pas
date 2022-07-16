unit UnitUser;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniPanel, uniTreeView,
  uniBasicGrid, uniDBGrid, uniButton, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uniEdit, uniLabel,
  uniDateTimePicker, uniMultiItem, uniComboBox, uniDBComboBox,
  uniDBLookupComboBox, uniMemo, uniGroupBox, uniCheckBox, uniListBox;

type
  TfrmUser = class(TUniForm)
    UniContainerPanel1: TUniContainerPanel;
    UniContainerPanel2: TUniContainerPanel;
    grdUser: TUniDBGrid;
    tvMenu: TUniTreeView;
    QUser: TFDQuery;
    DSUser: TDataSource;
    UniLabel1: TUniLabel;
    edNoPeg: TUniEdit;
    edNama: TUniEdit;
    UniLabel2: TUniLabel;
    UniLabel3: TUniLabel;
    dtTglLahir: TUniDateTimePicker;
    QKelamin: TFDQuery;
    DSKelamin: TDataSource;
    UniLabel8: TUniLabel;
    cbKelamin: TUniDBLookupComboBox;
    UniLabel4: TUniLabel;
    mmAlamat: TUniMemo;
    UniLabel5: TUniLabel;
    edTelp: TUniEdit;
    UniLabel6: TUniLabel;
    edHp: TUniEdit;
    UniLabel7: TUniLabel;
    edEmail: TUniEdit;
    QAgama: TFDQuery;
    DSAgama: TDataSource;
    UniLabel9: TUniLabel;
    cbAgama: TUniDBLookupComboBox;
    dtTglGabung: TUniDateTimePicker;
    UniLabel10: TUniLabel;
    UniLabel11: TUniLabel;
    cbDept: TUniDBLookupComboBox;
    DSDept: TDataSource;
    QDept: TFDQuery;
    UniLabel12: TUniLabel;
    edUserName: TUniEdit;
    UniLabel13: TUniLabel;
    edPassword: TUniEdit;
    UniLabel14: TUniLabel;
    edKonfirmasi: TUniEdit;
    btnGantiPassword: TUniButton;
    btnSave: TUniButton;
    btnCancel: TUniButton;
    cEditHasilAlat: TUniCheckBox;
    cValidasi: TUniCheckBox;
    cPembatalan: TUniCheckBox;
    cRetur: TUniCheckBox;
    cEditDokter: TUniCheckBox;
    cTipePasien: TUniCheckBox;
    cNormal: TUniCheckBox;
    cAddDokter: TUniCheckBox;
    cPrintKuitansi: TUniCheckBox;
    cCopyKuitansi: TUniCheckBox;
    btnBrwsData: TUniButton;
    btnAdd: TUniButton;
    btnEdit: TUniButton;
    btnDel: TUniButton;
    btnExit: TUniButton;
    grpPassword: TUniGroupBox;
    QEdit: TFDQuery;
    QMenu: TFDQuery;
    CmdSave: TFDCommand;
    edUserId: TUniEdit;
    QSave: TFDQuery;
    CmdDel: TFDCommand;
    procedure UniFormAfterShow(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnBrwsDataClick(Sender: TObject);
    procedure UniFormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnCancelClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnDelClick(Sender: TObject);
    procedure btnGantiPasswordClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function frmUser: TfrmUser;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function frmUser: TfrmUser;
begin
  Result := TfrmUser(UniMainModule.GetFormInstance(TfrmUser));
end;

procedure DeleteUser(Sender: TObject);
begin
  if frmUser.CmdDel.Active then
    frmUser.CmdDel.Active := False;
  frmUser.CmdDel.CommandText.Text := 'delete from aguser where id = ' +
    frmUser.QUser.FieldByName('id').AsString;
  frmUser.CmdDel.Execute();
  if frmUser.CmdDel.Active then
    frmUser.CmdDel.Active := False;
  frmUser.CmdDel.CommandText.Text := 'delete from user_menu where user_id = ' +
    frmUser.QUser.FieldByName('id').AsString;
  frmUser.CmdDel.Execute();
  frmUser.btnCancelClick(Sender);
end;

procedure TfrmUser.btnBrwsDataClick(Sender: TObject);
begin
  grdUser.SetFocus;
end;

procedure TfrmUser.btnCancelClick(Sender: TObject);
var
  i: Integer;
begin
  edNoPeg.Clear;
  edNama.Clear;
  dtTglLahir.DateTime := Now;
  cbKelamin.Text := '';
  mmAlamat.Clear;
  edTelp.Clear;
  edHp.Clear;
  edEmail.Clear;
  cbAgama.Text := '';
  dtTglGabung.DateTime := Now;
  cbDept.Text := '';
  edUserName.Clear;
  edPassword.Clear;
  edKonfirmasi.Clear;

  cEditHasilAlat.Checked := False;
  cValidasi.Checked := False;
  cPembatalan.Checked := False;
  cRetur.Checked := False;
  cEditDokter.Checked := False;
  cTipePasien.Checked := False;
  cNormal.Checked := False;
  cAddDokter.Checked := False;
  cPrintKuitansi.Checked := False;
  cCopyKuitansi.Checked := False;

  // menu
  for i := 0 to tvMenu.Items.Count - 1 do
  begin
    tvMenu.Items[i].Checked := False;
  end;

  if QUser.Active then
    QUser.Active := False;
  QUser.Active := True;
  if QKelamin.Active then
    QKelamin.Active := False;
  QKelamin.Active := True;
  if QAgama.Active then
    QAgama.Active := False;
  QAgama.Active := True;
  if QDept.Active then
    QDept.Active := False;
  QDept.Active := True;

  edUserId.Clear;

  btnSave.Enabled := False;
  btnCancel.Enabled := False;
  btnGantiPassword.Enabled := False;
  grdUser.SetFocus;
end;

procedure TfrmUser.btnEditClick(Sender: TObject);
var
  i: Integer;
begin
  edUserId.Text := QUser.FieldByName('id').AsString;
  if QEdit.Active then
    QEdit.Active := False;
  QEdit.SQL.Text :=
    'select u.*, jk.nama jenis_kelamin,a.nama agama,d.nama departement from aguser u,jenis_kelamin jk,agama a,departement d where u.id = '
    + QUser.FieldByName('id').AsString +
    ' and u.jenis_kelamin_id = jk.id and u.agama_id = a.id and u.departemen_id = d.id  ';
  QEdit.Active := True;
  edNoPeg.Text := QEdit.FieldByName('nopeg').AsString;
  edNama.Text := QEdit.FieldByName('nama').AsString;
  dtTglLahir.DateTime := QEdit.FieldByName('tanggal_lahir').AsDateTime;
  cbKelamin.Text := QEdit.FieldByName('jenis_kelamin').AsString;
  mmAlamat.Lines.Text := QEdit.FieldByName('alamat').AsString;
  edTelp.Text := QEdit.FieldByName('telepon').AsString;
  edHp.Text := QEdit.FieldByName('hp').AsString;
  edEmail.Text := QEdit.FieldByName('email').AsString;
  cbAgama.ItemIndex := cbAgama.Items.IndexOf(QEdit.FieldByName('agama')
    .AsString);
  dtTglGabung.DateTime := QEdit.FieldByName('tanggal_bergabung').AsDateTime;
  cbDept.ItemIndex := cbDept.Items.IndexOf(QEdit.FieldByName('departement')
    .AsString);
  edUserName.Text := QEdit.FieldByName('user_name').AsString;

  if QEdit.FieldByName('flg_editHasilAlat').AsString = 'Y' then
    cEditHasilAlat.Checked := True
  else
    cEditHasilAlat.Checked := False;
  if QEdit.FieldByName('flg_validasi').AsString = 'Y' then
    cValidasi.Checked := True
  else
    cValidasi.Checked := False;
  if QEdit.FieldByName('flg_pembatalan').AsString = 'Y' then
    cPembatalan.Checked := True
  else
    cPembatalan.Checked := False;

  if QEdit.FieldByName('flg_edit_tipe_bayar').AsString = 'Y' then
    cRetur.Checked := True
  else
    cRetur.Checked := False;

  if QEdit.FieldByName('flg_edit_dokter').AsString = 'Y' then
    cEditDokter.Checked := True
  else
    cEditDokter.Checked := False;
  if QEdit.FieldByName('flg_edit_tipe_pasien').AsString = 'Y' then
    cTipePasien.Checked := True
  else
    cTipePasien.Checked := False;
  if QEdit.FieldByName('flg_editNormal').AsString = 'Y' then
    cNormal.Checked := True
  else
    cNormal.Checked := False;
  if QEdit.FieldByName('flg_add_dokter').AsString = 'Y' then
    cAddDokter.Checked := True
  else
    cAddDokter.Checked := False;
  if QEdit.FieldByName('flg_print_kuitansi').AsString = 'Y' then
    cPrintKuitansi.Checked := True
  else
    cPrintKuitansi.Checked := False;
  if QEdit.FieldByName('flg_copy_kuitansi').AsString = 'Y' then
    cCopyKuitansi.Checked := True
  else
    cCopyKuitansi.Checked := False;

  if QMenu.Active then
    QMenu.Active := False;
  QMenu.SQL.Text :=
    'select um.menu_id,m.name,m.description from user_menu um,menu m where user_id = '
    + QUser.FieldByName('id').AsString +
    '  and um.menu_id = m.id order by menu_id ';
  QMenu.Active := True;

  // menu
  for i := 0 to tvMenu.Items.Count - 1 do
  begin
    tvMenu.Items[i].Checked := False;
  end;
  for i := 0 to tvMenu.Items.Count - 1 do
  begin
    QMenu.First;
    while not QMenu.Eof do
    begin
      if tvMenu.Items[i].Text = QMenu.FieldByName('description').AsString then
        tvMenu.Items[i].Checked := True;
      QMenu.Next;
    end;
  end;

  btnSave.Enabled := True;
  btnCancel.Enabled := True;
  btnGantiPassword.Enabled := True;

end;

procedure TfrmUser.btnGantiPasswordClick(Sender: TObject);
begin
  if edUserId.Text <> '' then
  begin
    if edPassword.Text = '' then
    begin
      ShowMessage('Password tidak boleh kosong.');
      edPassword.SetFocus;
      exit;
    end;
    if edKonfirmasi.Text = '' then
    begin
      ShowMessage('Password konfirmasi tidak boleh kosong.');
      edKonfirmasi.SetFocus;
      exit;
    end;
    if edPassword.Text <> edKonfirmasi.Text then
    begin
      ShowMessage('Password dan konfirmasi tidak cocok.');
      edKonfirmasi.SetFocus;
      exit;
    end;
    if CmdSave.Active then
      CmdSave.Active := False;
    CmdSave.CommandText.Text := ' update aguser set password = password(' +
      QuotedStr(edPassword.Text) + ') where id = ' + edUserId.Text;
    CmdSave.Execute();
    btnCancelClick(self);
  end;
end;

procedure TfrmUser.btnSaveClick(Sender: TObject);
var
  flg_editHasilAlat, flg_validasi, flg_pembatalan, flg_edit_tipe_bayar,
    flg_edit_dokter, flg_add_dokter, flg_edit_tipe_pasien, flg_print_kuitansi,
    flg_copy_kuitansi, flg_editNormal, lid: String;
  i: Integer;
begin
  flg_editHasilAlat := 'N';
  flg_validasi := 'N';
  flg_pembatalan := 'N';
  flg_edit_tipe_bayar := 'N';
  flg_edit_dokter := 'N';
  flg_add_dokter := 'N';
  flg_edit_tipe_pasien := 'N';
  flg_print_kuitansi := 'N';
  flg_copy_kuitansi := 'N';
  flg_editNormal := 'N';

  if cEditHasilAlat.Checked then
    flg_editHasilAlat := 'Y';
  if cValidasi.Checked then
    flg_validasi := 'Y';
  if cPembatalan.Checked then
    flg_pembatalan := 'Y';
  if cRetur.Checked then
    flg_edit_tipe_bayar := 'Y';
  if cEditDokter.Checked then
    flg_edit_dokter := 'Y';
  if cTipePasien.Checked then
    flg_edit_tipe_pasien := 'Y';
  if cNormal.Checked then
    flg_editNormal := 'Y';
  if cAddDokter.Checked then
    flg_add_dokter := 'Y';
  if cPrintKuitansi.Checked then
    flg_print_kuitansi := 'Y';
  if cCopyKuitansi.Checked then
    flg_copy_kuitansi := 'Y';
  if edUserId.Text <> '' then
  begin

    if CmdSave.Active then
      CmdSave.Active := False;
    CmdSave.CommandText.Text := 'update aguser set nama =' +
      QuotedStr(edNama.Text) + ',nopeg =' + QuotedStr(edNoPeg.Text) +
      ', tanggal_lahir = ' + QuotedStr(FormatDateTime('yyyy-mm-dd',
      dtTglLahir.DateTime)) + ',jenis_kelamin_id = ' +
      QuotedStr(QKelamin.FieldByName('id').AsString) + ' ,alamat = ' +
      QuotedStr(mmAlamat.Lines.Text) + ',telepon = ' + QuotedStr(edTelp.Text) +
      ', hp = ' + QuotedStr(edHp.Text) + ', email = ' + QuotedStr(edEmail.Text)
      + ',agama_id = ' + QuotedStr(QAgama.FieldByName('id').AsString) +
      ' , tanggal_bergabung = ' + QuotedStr(FormatDateTime('yyyy-mm-dd',
      dtTglGabung.DateTime)) + ',departemen_id = ' +
      QuotedStr(QDept.FieldByName('id').AsString) + ' ,  jabatan = ' +
      QuotedStr('') + ',user_name = ' + QuotedStr(edUserName.Text) +
      ',flg_editHasilAlat = ' + QuotedStr(flg_editHasilAlat) +
      ',flg_validasi = ' + QuotedStr(flg_validasi) + ', flg_pembatalan = ' +
      QuotedStr(flg_pembatalan) + ', flg_edit_tipe_bayar = ' +
      QuotedStr(flg_edit_tipe_bayar) + ', flg_edit_dokter = ' +
      QuotedStr(flg_edit_dokter) + ', flg_add_dokter = ' +
      QuotedStr(flg_add_dokter) + ', flg_edit_tipe_pasien = ' +
      QuotedStr(flg_edit_tipe_pasien) + ', flg_print_kuitansi = ' +
      QuotedStr(flg_print_kuitansi) + ', flg_copy_kuitansi = ' +
      QuotedStr(flg_copy_kuitansi) + ', flg_editNormal = ' +
      QuotedStr(flg_editNormal) + ' where id = ' +
      QuotedStr(edUserId.Text) + ' ';

    CmdSave.Execute();

    if CmdSave.Active then
      CmdSave.Active := False;
    CmdSave.CommandText.Text := 'delete from user_menu where user_id = ' +
      edUserId.Text;
    CmdSave.Execute();

    // menu
    for i := 0 to tvMenu.Items.Count - 1 do
    begin
      if tvMenu.Items[i].Checked then
      begin
        if QSave.Active then
          QSave.Active := False;
        QSave.SQL.Text := 'select id from menu where description = ' +
          QuotedStr(tvMenu.Items[i].Text);
        QSave.Active := True;
        if QSave.RecordCount > 0 then
        begin
          // insert
          if CmdSave.Active then
            CmdSave.Active := False;
          CmdSave.CommandText.Text :=
            'insert into user_menu(user_id,menu_id) values (' + edUserId.Text +
            ',' + QSave.FieldByName('id').AsString + ')';
          CmdSave.Execute();
        end;
      end;
    end;

    btnCancelClick(self);
  end
  else
  begin
    // baru
    if edNama.Text = '' then
    begin
      ShowMessage('Nama tidak boleh kosong.');
      edNama.SetFocus;
      exit;
    end;
    if cbKelamin.Text = '' then
    begin
      ShowMessage('Kelamin tidak boleh kosong.');
      cbKelamin.SetFocus;
      exit;
    end;
    if cbAgama.Text = '' then
    begin
      ShowMessage('Agama tidak boleh kosong.');
      cbAgama.SetFocus;
      exit;
    end;
    if cbDept.Text = '' then
    begin
      ShowMessage('Departement tidak boleh kosong.');
      cbDept.SetFocus;
      exit;
    end;
    if edUserName.Text = '' then
    begin
      ShowMessage('User name tidak boleh kosong.');
      edUserName.SetFocus;
      exit;
    end;
    if edPassword.Text = '' then
    begin
      ShowMessage('Password tidak boleh kosong.');
      edPassword.SetFocus;
      exit;
    end;
    if edKonfirmasi.Text = '' then
    begin
      ShowMessage('Password konfirmasi tidak boleh kosong.');
      edKonfirmasi.SetFocus;
      exit;
    end;
    if edPassword.Text <> edKonfirmasi.Text then
    begin
      ShowMessage('Password dan konfirmasi tidak sama.');
      edPassword.SetFocus;
      exit;
    end;
    // cek usernama apakah sudah ada
    if QSave.Active then
      QSave.Active := False;
    QSave.SQL.Text := 'select id from aguser where user_name=' +
      QuotedStr(edUserName.Text) + ' ';
    QSave.Active := True;
    if QSave.RecordCount > 0 then
    begin
      ShowMessage('User name [' + edUserName.Text +
        '] sudah ada yang menggunakan.');
      edUserName.SetFocus;
      exit;
    end;

    // insert process
    if CmdSave.Active then
      CmdSave.Active := False;
    CmdSave.CommandText.Text :=
      'insert into aguser(id,nama,nopeg,tanggal_lahir,jenis_kelamin_id,alamat,telepon,hp,email,agama_id,tanggal_bergabung,departemen_id,jabatan,user_name,password,'
      + 'flg_validasi,flg_editHasilAlat,flg_pembatalan, flg_edit_tipe_bayar,flg_edit_dokter,flg_add_dokter,flg_edit_tipe_pasien,flg_editNormal,flg_print_kuitansi, flg_copy_kuitansi) values(null,'
      + QuotedStr(edUserName.Text) + ',' + QuotedStr(edNoPeg.Text) + ',' +
      QuotedStr(FormatDateTime('yyyy-mm-dd', dtTglLahir.DateTime)) + ',' +
      QKelamin.FieldByName('id').AsString + ',' + QuotedStr(mmAlamat.Lines.Text)
      + ',' + QuotedStr(edTelp.Text) + ',' + QuotedStr(edHp.Text) + ',' +
      QuotedStr(edEmail.Text) + ',' + QAgama.FieldByName('id').AsString + ',' +
      QuotedStr(FormatDateTime('yyyy-mm-dd', dtTglGabung.DateTime)) + ',' +
      QDept.FieldByName('id').AsString + ',null,' + QuotedStr(edUserName.Text) +
      ',password(' + QuotedStr(edPassword.Text) + '),' + QuotedStr(flg_validasi)
      + ',' + QuotedStr(flg_editHasilAlat) + ',' + QuotedStr(flg_pembatalan) +
      ',' + QuotedStr(flg_edit_tipe_bayar) + ',' + QuotedStr(flg_edit_dokter) +
      ',' + QuotedStr(flg_add_dokter) + ',' + QuotedStr(flg_edit_tipe_pasien) +
      ',' + QuotedStr(flg_editNormal) + ',' + QuotedStr(flg_print_kuitansi) +
      ',' + QuotedStr(flg_copy_kuitansi) + ')';
    CmdSave.Execute();

    // last insert
    if QSave.Active then
      QSave.Active := False;
    QSave.Active := True;
    QSave.SQL.Text := 'select last_insert_id() lid  from aguser ';
    QSave.Active := True;

    lid := QSave.FieldByName('lid').AsString;

    // menu
    for i := 0 to tvMenu.Items.Count - 1 do
    begin
      if tvMenu.Items[i].Checked then
      begin
        if QSave.Active then
          QSave.Active := False;
        QSave.SQL.Text := 'select id from menu where description = ' +
          QuotedStr(tvMenu.Items[i].Text);
        QSave.Active := True;
        if QSave.RecordCount > 0 then
        begin
          // insert
          if CmdSave.Active then
            CmdSave.Active := False;
          CmdSave.CommandText.Text :=
            'insert into user_menu(user_id,menu_id) values (' + lid + ',' +
            QSave.FieldByName('id').AsString + ')';
          CmdSave.Execute();
        end;
      end;
    end;

    btnCancelClick(self);
  end;
end;

procedure TfrmUser.btnAddClick(Sender: TObject);
begin
  btnCancelClick(self);
  btnSave.Enabled := True;
  btnCancel.Enabled := True;
  edNoPeg.SetFocus;
end;

procedure TfrmUser.btnDelClick(Sender: TObject);
begin
  MessageDlg('Delete user ' + QUser.FieldByName('user_name').AsString + ' ?',
    mtConfirmation, mbYesNo,
    procedure(Sender: TComponent; Res: Integer)
    begin
      case Res of
        mrYes:
          DeleteUser(self);
      end;
    end);
end;

procedure TfrmUser.btnExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmUser.UniFormAfterShow(Sender: TObject);
begin
  if QUser.Active then
    QUser.Active := False;
  QUser.Active := True;
  if QKelamin.Active then
    QKelamin.Active := False;
  QKelamin.Active := True;
  if QAgama.Active then
    QAgama.Active := False;
  QAgama.Active := True;
  if QDept.Active then
    QDept.Active := False;
  QDept.Active := True;

  dtTglLahir.DateTime := Now;
  dtTglGabung.DateTime := Now;
end;

procedure TfrmUser.UniFormKeyDown(Sender: TObject; var Key: Word;
Shift: TShiftState);
begin
  if Key = VK_F1 then
    btnAddClick(self);
  if Key = VK_F2 then
    btnEditClick(self);
  if Key = VK_F3 then
    btnDelClick(self);
  if Key = VK_F4 then
    btnExitClick(self);
  if Key = VK_F5 then
    btnBrwsDataClick(self);
  if Key = VK_ESCAPE then
    Close;
end;

end.
