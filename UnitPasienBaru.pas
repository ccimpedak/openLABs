unit UnitPasienBaru;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniButton, uniMemo, uniEdit, uniMultiItem,
  uniComboBox, uniDBComboBox, uniGUIBaseClasses, uniLabel, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  uniDBLookupComboBox, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  uniSpinEdit, DateUtils, uniDateTimePicker, System.TimeSpan;

type
  TfrmPasienBaru = class(TUniForm)
    UniLabel1: TUniLabel;
    UniLabel2: TUniLabel;
    edNama: TUniEdit;
    UniLabel3: TUniLabel;
    UniLabel4: TUniLabel;
    UniLabel5: TUniLabel;
    UniLabel6: TUniLabel;
    UniLabel7: TUniLabel;
    UniLabel8: TUniLabel;
    UniLabel9: TUniLabel;
    UniLabel10: TUniLabel;
    memoAlamat: TUniMemo;
    UniLabel11: TUniLabel;
    edTelepon: TUniEdit;
    edHp: TUniEdit;
    UniLabel12: TUniLabel;
    edEmail: TUniEdit;
    UniLabel13: TUniLabel;
    UniLabel14: TUniLabel;
    edGoldar: TUniEdit;
    edRhesus: TUniEdit;
    btnSave: TUniButton;
    UniButton2: TUniButton;
    QPrefik: TFDQuery;
    DSPrefik: TDataSource;
    cbPrefix: TUniDBLookupComboBox;
    QKelamin: TFDQuery;
    DSKelamin: TDataSource;
    cmdSave: TFDCommand;
    QSave: TFDQuery;
    edThn: TUniSpinEdit;
    edBln: TUniSpinEdit;
    edHr: TUniSpinEdit;
    edTglLahir: TUniDateTimePicker;
    edNoKTP: TUniEdit;
    cbKelamin: TUniDBLookupComboBox;
    procedure UniButton2Click(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure edTglLahirEnter(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure edThnChange(Sender: TObject);
    procedure edBlnChange(Sender: TObject);
    procedure edHrChange(Sender: TObject);
    procedure edTglLahirChange(Sender: TObject);
    procedure cbPrefixChange(Sender: TObject);
    procedure edNamaKeyPress(Sender: TObject; var Key: Char);
    procedure edThnKeyPress(Sender: TObject; var Key: Char);
    procedure edBlnKeyPress(Sender: TObject; var Key: Char);
    procedure edTglLahirKeyPress(Sender: TObject; var Key: Char);
    procedure cbKelaminKeyPress(Sender: TObject; var Key: Char);
    procedure edTeleponKeyPress(Sender: TObject; var Key: Char);
    procedure edHpKeyPress(Sender: TObject; var Key: Char);
    procedure edEmailKeyPress(Sender: TObject; var Key: Char);
    procedure edGoldarKeyPress(Sender: TObject; var Key: Char);
    procedure edRhesusKeyPress(Sender: TObject; var Key: Char);
    procedure UniFormAfterShow(Sender: TObject);
    procedure UniFormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbKelaminChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  var
    call_form: string;
    pasien_id: string;
    pf_nama: string;
    kelamin_nama: string;
  end;

function frmPasienBaru: TfrmPasienBaru;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, UnitCariPasien, UnitPendaftaran,
  UnitHomeService;

procedure calc_dob();
var
  dob: TDateTime;
begin

  dob := IncYear(now, frmPasienBaru.edThn.Value * -1);
  dob := IncMonth(dob, frmPasienBaru.edBln.Value * -1);
  dob := IncDay(dob, frmPasienBaru.edHr.Value * -1);

  frmPasienBaru.edTglLahir.DateTime := dob;
end;

function frmPasienBaru: TfrmPasienBaru;
begin
  Result := TfrmPasienBaru(UniMainModule.GetFormInstance(TfrmPasienBaru));
end;

procedure TfrmPasienBaru.cbKelaminChange(Sender: TObject);
begin
  showmessage(QKelamin.FieldByName('id').AsString);
end;

procedure TfrmPasienBaru.cbKelaminKeyPress(Sender: TObject; var Key: Char);
begin
  if (Ord(Key) = VK_RETURN) then
    edNoKTP.SetFocus;
end;

procedure TfrmPasienBaru.cbPrefixChange(Sender: TObject);
begin
  if (cbPrefix.Text = 'Tn.') or (cbPrefix.Text = 'Mr.') then
  begin
    cbKelamin.ItemIndex := cbKelamin.Items.IndexOf('LAKI-LAKI');
  end;
  if (cbPrefix.Text = 'Ny.') or (cbPrefix.Text = 'Mrs.') or
    (cbPrefix.Text = 'Nn.') then
  begin
    cbKelamin.ItemIndex := cbKelamin.Items.IndexOf('PEREMPUAN');
  end;
end;

procedure TfrmPasienBaru.edBlnChange(Sender: TObject);
begin
  calc_dob();
end;

procedure TfrmPasienBaru.edBlnKeyPress(Sender: TObject; var Key: Char);
begin
  if (Ord(Key) = VK_RETURN) then
    edHr.SetFocus;
end;

procedure TfrmPasienBaru.edEmailKeyPress(Sender: TObject; var Key: Char);
begin
  if (Ord(Key) = VK_RETURN) then
    edGoldar.SetFocus;
end;

procedure TfrmPasienBaru.edGoldarKeyPress(Sender: TObject; var Key: Char);
begin
  if (Ord(Key) = VK_RETURN) then
    edRhesus.SetFocus;
end;

procedure TfrmPasienBaru.edHpKeyPress(Sender: TObject; var Key: Char);
begin
  if (Ord(Key) = VK_RETURN) then
    edEmail.SetFocus;
end;

procedure TfrmPasienBaru.edHrChange(Sender: TObject);
begin
  calc_dob();
end;

procedure TfrmPasienBaru.edNamaKeyPress(Sender: TObject; var Key: Char);
begin
  if (Ord(Key) = VK_RETURN) then
    edThn.SetFocus;
end;

procedure TfrmPasienBaru.edRhesusKeyPress(Sender: TObject; var Key: Char);
begin
  if (Ord(Key) = VK_RETURN) then
    btnSave.SetFocus;
end;

procedure TfrmPasienBaru.edTeleponKeyPress(Sender: TObject; var Key: Char);
begin
  if (Ord(Key) = VK_RETURN) then
    edHp.SetFocus;
end;

procedure TfrmPasienBaru.edTglLahirChange(Sender: TObject);
var
  y1, m1, d1, h1, mi1, s1, ms, y2, m2, d2, h2, mi2, s2, y, mo: Word;
  ts: TTimeSpan;
  dt1, dt2: TDateTime;
begin
  try
    dt2 := now;
    dt1 := edTglLahir.DateTime;
    DecodeDateTime(dt1, y1, m1, d1, h1, mi1, s1, ms);
    DecodeDateTime(dt2, y2, m2, d2, h2, mi2, s2, ms);
    ms := 12 * y2 + m2 - 12 * y1 - m1;
    if s1 + 60 * mi1 + 60 * 60 * h1 + 24 * 60 * 60 * d1 > s2 + 60 * mi2 + 60 *
      60 * h2 + 24 * 60 * 60 * d2 then
      ms := ms - 1;
    mo := ms mod 12;
    y := ms div 12; // years and months ready, now the rest
    dt1 := EncodeDateTime(y1 + y, m1 + mo, d1, h1, mi1, s1, 0);
    ts := TTimeSpan.Subtract(dt2, dt1);
    // Result:= Format('There has been "%d years, %d months, %d days, %d hours, %d minutes and %d seconds" between those dates',
    // [y,mo,ts.Days, ts.Hours, ts.Minutes, ts.Seconds]);
    edThn.Value := y;
    edBln.Value := mo;
    edHr.Value := ts.Days;
  except
    exit;
  end;
end;

procedure TfrmPasienBaru.edTglLahirEnter(Sender: TObject);
begin
  // edTglLahir.Text:=formatdatetime('dd-mm-yyyy',now());
end;

procedure TfrmPasienBaru.edTglLahirKeyPress(Sender: TObject; var Key: Char);
begin
  if (Ord(Key) = VK_RETURN) then
    cbKelamin.SetFocus;
end;

procedure TfrmPasienBaru.edThnChange(Sender: TObject);
begin
  calc_dob();
end;

procedure TfrmPasienBaru.edThnKeyPress(Sender: TObject; var Key: Char);
begin
  if (Ord(Key) = VK_RETURN) then
    edBln.SetFocus;
end;

procedure TfrmPasienBaru.btnSaveClick(Sender: TObject);
var
  pf1_noreg, pf2_noreg, noreg_max, pf2, noreg_length, lid: string;
  prefix_id, noreg, nama, umur, tanggal_lahir, jenis_kelamin_id, alamat,
    telepon, hp, fax, email, agama_id, tanggal_awal_periksa,
    tanggal_akhir_periksa, jumlah_periksa, jumlah_amount, keterangan, pangkat,
    kesatuan, gol_darah, rhesus, wilayah, no_ktp: string;
begin
  if cbKelamin.Text = 'LAKI-LAKI' then
  begin
    if QKelamin.Active then
      QKelamin.Active := False;
    QKelamin.SQL.Text := 'select id,nama from jenis_kelamin where id = 1';
    QKelamin.Active := True;
  end
  else if cbKelamin.Text = 'PEREMPUAN' then
  begin
    if QKelamin.Active then
      QKelamin.Active := False;
    QKelamin.SQL.Text := 'select id,nama from jenis_kelamin where id = 2';
    QKelamin.Active := True;
  end;

  if pasien_id <> '' then
  begin

    cmdSave.CommandText.Text := 'update pasien set prefix_id=' +
      QPrefik.FieldByName('id').AsString + ', nama=' + QuotedStr(edNama.Text) +
      ',tanggal_lahir=' + QuotedStr(formatdatetime('yyyy-mm-dd',
      edTglLahir.DateTime)) + ',jenis_kelamin_id = ' +
      QKelamin.FieldByName('id').AsString + ',alamat=' +
      QuotedStr(memoAlamat.Lines.Text) + ',telepon=' + QuotedStr(edTelepon.Text)
      + ',hp=' + QuotedStr(edHp.Text) + ',email=' + QuotedStr(edEmail.Text) +
      ',gol_darah=' + QuotedStr(edGoldar.Text) + ',rhesus=' +
      QuotedStr(edRhesus.Text) + ' where id = ' + QuotedStr(pasien_id);

    cmdSave.Execute();

    if call_form = 'pendaftaran' then
    begin
      frmPendaftaran.edNama.Text := edNama.Text;
      frmPendaftaran.edKelamin.Text := cbKelamin.Text;
      frmPendaftaran.edUmur.Text := edThn.Text + ' th ' + edBln.Text + ' bl ' +
        edHr.Text;
      frmPendaftaran.edAlamat.Text := memoAlamat.Lines.Text;
      frmPendaftaran.edTelp.Text := edTelepon.Text;
      frmPendaftaran.edHp.Text := edHp.Text;
      frmPendaftaran.edJenisKelaminId.Text :=
        QKelamin.FieldByName('id').AsString;
    end;

    Close;

  end
  else
  begin

    // cmd
    cmdSave.CommandText.Text := 'lock tables penomoran write';
    cmdSave.Execute();

    if QSave.Active then
      QSave.Active := False;
    QSave.SQL.Text :=
      'select pf1_noreg,pf2_noreg,noreg_length,noreg_max,reset_noreg,left(last_noreg,10) as last_noreg,left(now(),10) as xnow from penomoran';
    QSave.Active := True;
    pf1_noreg := QSave.FieldByName('pf1_noreg').AsString;
    pf2_noreg := QSave.FieldByName('pf2_noreg').AsString;
    noreg_max := QSave.FieldByName('noreg_max').AsString;
    noreg_length := QSave.FieldByName('noreg_length').AsString;

    //
    if QSave.Active then
      QSave.Active := False;
    QSave.SQL.Text := 'select ' + pf2_noreg + ' as pf2';
    QSave.Active := True;
    pf2 := QSave.FieldByName('pf2').AsString;

    //
    cmdSave.CommandText.Text := 'update penomoran set noreg_max =' +
      QuotedStr(IntToStr(StrToInt(noreg_max) + 1)) + ',last_noreg=now()';
    cmdSave.Execute();
    cmdSave.CommandText.Text := 'unlock tables';
    cmdSave.Execute();

    prefix_id := QPrefik.FieldByName('id').AsString;
    noreg := pf1_noreg + pf2 + Format('%.*d', [StrToInt(noreg_length),
      StrToInt(noreg_max)]);
    nama := edNama.Text;
    umur := '0';
    tanggal_lahir := formatdatetime('yyyy-mm-dd', edTglLahir.DateTime);
    jenis_kelamin_id := QKelamin.FieldByName('id').AsString;
    alamat := memoAlamat.Lines.Text;
    telepon := edTelepon.Text;
    hp := edHp.Text;
    fax := '';
    email := edEmail.Text;
    agama_id := '0';
    gol_darah := edGoldar.Text;
    rhesus := edRhesus.Text;
    // wilayah := cbWilayah.Text;
    no_ktp := edNoKTP.Text;

    // insert pasien
    cmdSave.CommandText.Text :=
      'insert into pasien(id,prefix_id,noreg,nama,umur,tanggal_lahir,jenis_kelamin_id,alamat,telepon,hp,fax,email,agama_id,tanggal_awal_periksa,tanggal_akhir_periksa,jumlah_periksa,jumlah_amount,keterangan,pangkat,kesatuan,gol_darah,rhesus,no_ktp) values'
      + '(null,' + QuotedStr(prefix_id) + ',' + QuotedStr(noreg) + ',' +
      QuotedStr(nama) + ',' + QuotedStr(umur) + ',' + QuotedStr(tanggal_lahir) +
      ',' + QuotedStr(jenis_kelamin_id) + ',' + QuotedStr(alamat) + ',' +
      QuotedStr(telepon) + ',' + QuotedStr(hp) + ',' + QuotedStr(fax) + ',' +
      QuotedStr(email) + ',' + QuotedStr(agama_id) + ',now(),now(),0,0,' +
      QuotedStr('') + ',' + QuotedStr('') + ',' + QuotedStr('') + ',' +
      QuotedStr(gol_darah) + ',' + QuotedStr(rhesus) + ',' +
      QuotedStr(no_ktp) + ')';

    cmdSave.Execute();

    if QSave.Active then
      QSave.Active := False;
    QSave.SQL.Text := 'select last_insert_id() lid from pasien';
    QSave.Active := True;
    lid := QSave.FieldByName('lid').AsString;

    // fill data
    if QSave.Active then
      QSave.Active := False;
    QSave.SQL.Text := 'select CONCAT(pf.nama,' + QuotedStr(' ') +
      ', p.nama) nama,k.nama kelamin,p.noreg,CONCAT(p.telepon,' +
      QuotedStr(' / ') + ',p.hp) telepon ,p.hp,p.wilayah,CONCAT(p.telepon,' +
      QuotedStr('/') +
      ',p.hp) tlp,p.alamat, CONCAT(TIMESTAMPDIFF( YEAR, p.tanggal_lahir, now() ),'
      + QuotedStr(' th ') +
      ',TIMESTAMPDIFF( MONTH, p.tanggal_lahir, now() ) % 12,' +
      QuotedStr(' bl ') +
      ',FLOOR( TIMESTAMPDIFF( DAY, p.tanggal_lahir, now() ) % 30.4375 )) as umur  from pasien p, prefix pf, jenis_kelamin k where p.prefix_id = pf.id and p.jenis_kelamin_id=k.id and p.id = '
      + QuotedStr(lid);
    QSave.Active := True;

    // home service call
    if call_form = 'home_service' then
    begin
      frmHomeService.edPasienId.Text := lid;
      frmHomeService.edNama.Text := QSave.FieldByName('nama').AsString;
      frmHomeService.edKelamin.Text := QSave.FieldByName('kelamin').AsString;
      frmHomeService.edUmur.Text := QSave.FieldByName('umur').AsString;
      frmHomeService.edAlamat.Text := QSave.FieldByName('alamat').AsString;
      frmHomeService.edTelepon.Text := QSave.FieldByName('tlp').AsString;
      frmHomeService.edNoReg.Text := QSave.FieldByName('noreg').AsString;
    end
    else
    begin
      frmPendaftaran.edPasienId.Text := lid;
      frmPendaftaran.edJenisKelaminId.Text := jenis_kelamin_id;
      frmPendaftaran.edNama.Text := QSave.FieldByName('nama').AsString;
      frmPendaftaran.edKelamin.Text := QSave.FieldByName('kelamin').AsString;
      frmPendaftaran.edUmur.Text := QSave.FieldByName('umur').AsString;
      frmPendaftaran.edAlamat.Text := QSave.FieldByName('alamat').AsString;
      frmPendaftaran.edTelp.Text := QSave.FieldByName('telepon').AsString;
      frmPendaftaran.edHp.Text := QSave.FieldByName('hp').AsString;
      frmPendaftaran.edPatientID.Text := QSave.FieldByName('noreg').AsString;
    end;

    Close;
    frmCariPasien.Close;

  end;

end;

procedure TfrmPasienBaru.UniButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmPasienBaru.UniFormAfterShow(Sender: TObject);
begin
  if pf_nama <> '' then
  begin
    cbPrefix.ItemIndex := cbPrefix.Items.IndexOf(pf_nama);
  end;
  if kelamin_nama <> '' then
  begin
    cbKelamin.ItemIndex := cbKelamin.Items.IndexOf(kelamin_nama);
  end;
end;

procedure TfrmPasienBaru.UniFormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Close;
end;

procedure TfrmPasienBaru.UniFormShow(Sender: TObject);
begin
  if QPrefik.Active then
    QPrefik.Active := False;
  QPrefik.Active := True;
  if QKelamin.Active then
    QKelamin.Active := False;
  QKelamin.Active := True;
  // if QWilayah.Active then
  // QWilayah.Active := False;
  // QWilayah.Active := True;

  if call_form <> 'pendaftaran' then
    edTglLahir.DateTime := now;

  if call_form = 'pendaftaran' then
    frmPasienBaru.Caption := 'Edit pasien';

end;

end.




