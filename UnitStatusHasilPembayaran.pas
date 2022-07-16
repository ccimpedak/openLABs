unit UnitStatusHasilPembayaran;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniPanel, uniBasicGrid,
  uniDBGrid, uniButton, uniEdit, uniLabel, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmStatusHasilPembayaran = class(TUniForm)
    UniContainerPanel1: TUniContainerPanel;
    UniContainerPanel2: TUniContainerPanel;
    UniContainerPanel3: TUniContainerPanel;
    UniLabel1: TUniLabel;
    edTgl: TUniEdit;
    edNomor: TUniEdit;
    edNama: TUniEdit;
    btnSearch: TUniButton;
    UniLabel2: TUniLabel;
    UniLabel3: TUniLabel;
    UniDBGrid1: TUniDBGrid;
    edDtl: TUniButton;
    edBayar: TUniButton;
    btnAmbilHasil: TUniButton;
    edBatal: TUniButton;
    edExit: TUniButton;
    edLbl: TUniButton;
    edPrint: TUniButton;
    edKuitansi: TUniButton;
    UniButton1: TUniButton;
    qStatus: TFDQuery;
    DSStatusHasil: TDataSource;
    QPasien: TFDQuery;
    DSPasien: TDataSource;
    qDetail: TFDQuery;
    qKuintansi: TFDQuery;
    qKuintansinomor: TStringField;
    qKuintansinoreg: TStringField;
    qKuintansinama: TStringField;
    qKuintansijumlah: TBCDField;
    qKuintansitipe_bayar: TStringField;
    qKuintansiuser: TStringField;
    qKuintansitanggal: TDateTimeField;
    qKuintansino_kuitansi: TStringField;
    qKuintansitipe_pasien: TStringField;
    qKuintansidokter: TStringField;
    qKuintansialamat: TStringField;
    qKuintansitelepon: TStringField;
    qKuintansitagihan: TBCDField;
    qKuintansiusia: TStringField;
    cmdAmbilHasil: TFDCommand;
    qKuintansihp: TStringField;
    qKuintansitanggal_lahir: TDateField;
    qKuintansiprefix: TStringField;
    qKuintansijenis_kelamin: TStringField;
    lblStatus: TUniLabel;

    QPrinterLabel: TFDQuery;
    QSampling: TFDQuery;
    QSample: TFDQuery;
    btnSerahTerimaHasil: TUniButton;
    btnCopyNota: TUniButton;
    DSPrint: TDataSource;
    qPrint: TFDQuery;
    qPrintheader_id: TIntegerField;
    qPrintlevel: TIntegerField;
    qPrintpemeriksaan: TStringField;
    qPrintharga: TBCDField;
    qPrintcetak_nota: TStringField;
    qPrintada_harga: TStringField;
    qPrintnomor: TStringField;
    qPrintnama: TStringField;
    qPrinttelepon: TStringField;
    qPrintdokter: TStringField;
    qPrinttipe_pasien: TStringField;
    qPrintalamat: TStringField;
    qPrintjumlah: TBCDField;
    qPrintid_pasien: TStringField;
    qPrintcatatan: TStringField;
    qPrintasal: TStringField;
    qPrintansuransi: TStringField;
    qPrintuser_name: TStringField;
    qPrinttanggal: TDateTimeField;
    qPrintdiskon: TBCDField;
    qPrintharga_total: TFMTBCDField;
    qPrintdisc_pct: TBCDField;
    qPrintflgLunas: TStringField;
    qPrinthp: TStringField;
    qPrintdisc_amount: TBCDField;
    qPrintsub_total: TBCDField;
    qPrinttagihan: TBCDField;
    procedure UniFormAfterShow(Sender: TObject);
    procedure edTglKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edNomorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edNamaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnSearchClick(Sender: TObject);
    procedure edDtlClick(Sender: TObject);
    procedure edBayarClick(Sender: TObject);
    procedure edKuitansiClick(Sender: TObject);
    procedure edExitClick(Sender: TObject);
    procedure UniFormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure UniDBGrid1SelectionChange(Sender: TObject);
    procedure edLblClick(Sender: TObject);
    procedure btnAmbilHasilClick(Sender: TObject);
    procedure UniDBGrid1CellClick(Column: TUniDBGridColumn);
    procedure UniButton1Click(Sender: TObject);
    procedure btnSerahTerimaHasilClick(Sender: TObject);
    procedure UniButton2Click(Sender: TObject);
    procedure btnCopyNotaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function frmStatusHasilPembayaran: TfrmStatusHasilPembayaran;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, UnitPendaftaran, UnitBayar, UnitKuitansi,
  ServerModule, UnitReportDisplay, UnitJasper;

procedure refreshData();
begin
  if frmStatusHasilPembayaran.qStatus.Active then
    frmStatusHasilPembayaran.qStatus.Active := False;
  frmStatusHasilPembayaran.qStatus.SQL.Text :=
    'select order_header.id,order_header.nomor,pasien.nama,pasien.telepon, ' +
    'pasien.alamat,dokter.nama dokter,order_header.flgLunas lunas, ' +
    'order_header.tagihan,flg_ambil_hasil ambil_hasil,cetak, ' +
    'order_header.ket_tgl_selesai,order_header.ket_tgl_selesai_date ' +
    'from order_header left join pasien on order_header.pasien_id = pasien.id '
    + 'left join dokter on order_header.dokter_id = dokter.id ' +
    'where order_header.tanggal like ' +
    QuotedStr(frmStatusHasilPembayaran.edTgl.Text + '%') +
    ' and order_header.nomor like ' +
    QuotedStr('%' + frmStatusHasilPembayaran.edNomor.Text) +
    ' and pasien.nama like ' +
    QuotedStr('%' + frmStatusHasilPembayaran.edNama.Text + '%') +
    ' order by order_header.nomor';
  frmStatusHasilPembayaran.qStatus.Active := True;

end;

function frmStatusHasilPembayaran: TfrmStatusHasilPembayaran;
begin
  Result := TfrmStatusHasilPembayaran
    (UniMainModule.GetFormInstance(TfrmStatusHasilPembayaran));
end;

procedure TfrmStatusHasilPembayaran.btnAmbilHasilClick(Sender: TObject);
begin
  MessageDlg('Ambil hasil : ' + qStatus.FieldByName('nomor').AsString + ' ?',
    mtConfirmation, mbYesNo,
    procedure(Sender: TComponent; Res: Integer)
    begin
      case Res of
        mrYes:
          begin
            if cmdAmbilHasil.Active then
              cmdAmbilHasil.Active := False;
            cmdAmbilHasil.ParamByName('id').AsInteger :=
              qStatus.FieldByName('id').AsInteger;
            cmdAmbilHasil.ParamByName('user_ambil_hasil').AsString :=
              UniApplication.Cookies.GetCookie('UserId');
            cmdAmbilHasil.Active := True;
            refreshData();
          end;
      end;
    end);
end;

procedure TfrmStatusHasilPembayaran.btnCopyNotaClick(Sender: TObject);
var
  RepUrl, Result: string;
begin
  ShowMask('Loading');
  if qPrint.Active then
    qPrint.Active := False;

  qPrint.ParamByName('header_id').AsInteger := qStatus.FieldByName('id')
    .AsInteger;
  qPrint.Active := True;

  // frxRepNota.PrintOptions.ShowDialog := False;
  // frxRepNota.ShowProgress := False;
  //
  // frxRepNota.EngineOptions.SilentMode := True;
  // frxRepNota.EngineOptions.DestroyForms := False;
  //
  // frxPDFExport1.Background := True;
  // frxPDFExport1.ShowProgress := False;
  // frxPDFExport1.ShowDialog := False;
  // frxPDFExport1.FileName := UniServerModule.NewCacheFileUrl(False, 'pdf', '',
  // '', Result, True);
  // frxPDFExport1.DefaultPath := '';
  //
  // frxRepNota.PreviewOptions.AllowEdit := False;
  // frxRepNota.PrepareReport;
  // frxRepNota.Export(frxPDFExport1);

  frmReportDisplay.UniURLFrame1.URL := Result;
  HideMask;
  frmReportDisplay.ShowModal();

end;

procedure TfrmStatusHasilPembayaran.btnSearchClick(Sender: TObject);
begin
  refreshData();
  lblStatus.Text := '';
  UniDBGrid1SelectionChange(self);
end;

procedure TfrmStatusHasilPembayaran.btnSerahTerimaHasilClick(Sender: TObject);
var
  Result: string;
  nama_report: string;
begin
  nama_report := 'laporan_serah_terima_hasil';

  ShowMask('Loading');
  UniSession.Synchronize();
  frmReportDisplay.UniURLFrame1.URL := reportExecutionRequest('pdf',
    nama_report, edTgl.Text, edTgl.Text, '', '', '');
  frmReportDisplay.ShowModal();
  HideMask;
end;

procedure TfrmStatusHasilPembayaran.edBayarClick(Sender: TObject);
begin

  frmBayar.ShowModal;
  frmBayar.p_order_header_id := qStatus.FieldByName('id').AsInteger;
  // refresh data
  // if qStatus.Active then qStatus.Active:=False;
  // qStatus.Active := True;

  // showmessage(IntToStr(frmBayar.p_order_header_id));
  if frmBayar.qJenisPemb.Active then
    frmBayar.qJenisPemb.Active := False;
  frmBayar.qJenisPemb.Active := True;
  frmBayar.cbJenis.ItemIndex := 0;
  frmBayar.edCharge.Text := '0';
  frmBayar.edTotalBayar.Text := FormatFloat('#,##0.00',
    qStatus.FieldByName('tagihan').AsFloat);
  frmBayar.edTotal.Text := FormatFloat('#,##0.00',
    qStatus.FieldByName('tagihan').AsFloat);
  frmBayar.edPembayaran.Text := '0';
  frmBayar.edSisa.Text := '0';
  frmBayar.edTagihan.Text := FormatFloat('#,##0.00',
    qStatus.FieldByName('tagihan').AsFloat);

  frmBayar.lblNoLab.Caption := 'No Lab : ' + qStatus.FieldByName
    ('nomor').AsString;

end;

procedure TfrmStatusHasilPembayaran.edDtlClick(Sender: TObject);
var
  I, J: Integer;
  fTotal, fSubTotal, fDiscAmount: Currency;
  tmpStr: String;
begin
  frmPendaftaran.call_form := 'status_hasil';
  // pasien
  if QPasien.Active then
    QPasien.Active := False;
  QPasien.SQL.Text :=
    'select p.id, rp.nama ruangan,oh.disc_pct, an.nama penjamin,ap.nama asal, u.nama urgency, th.nama tipe_hasil, p.jenis_kelamin_id, tp.nama tipe_pasien, oh.dokter_id, d.nama dokter, CONCAT(pf.nama,'
    + QuotedStr(' ') +
    ', p.nama) nama,k.nama kelamin,p.telepon,p.hp,p.noreg,p.wilayah,CONCAT(p.telepon,'
    + QuotedStr('/') + ',p.hp) tlp ';
  QPasien.SQL.Text := QPasien.SQL.Text +
    ' , oh.catatan,oh.diagnosa,p.alamat, CONCAT(TIMESTAMPDIFF( YEAR, p.tanggal_lahir, now() ),'
    + QuotedStr(' th ') +
    ',TIMESTAMPDIFF( MONTH, p.tanggal_lahir, now() ) % 12,' + QuotedStr(' bl ')
    + ',FLOOR( TIMESTAMPDIFF( DAY, p.tanggal_lahir, now() ) % 30.4375 )) as umur  ';
  QPasien.SQL.Text := QPasien.SQL.Text +
    ' from order_header oh,ruangan_pasien rp, ansuransi_pasien an, asal_pasien ap, urgency u,tipe_hasil th,tipe_pasien tp,dokter d,pasien p, prefix pf, jenis_kelamin k ';
  QPasien.SQL.Text := QPasien.SQL.Text +
    ' where oh.ruangan_pasien_id = rp.id and oh.ansuransi_pasien_id = an.id and oh.asal_pasien_id = ap.id and oh.urgency_id = u.id and p.prefix_id = pf.id ';
  QPasien.SQL.Text := QPasien.SQL.Text +
    'and p.jenis_kelamin_id=k.id and oh.pasien_id = p.id and oh.dokter_id = d.id and oh.tipe_pasien_id = tp.id and oh.tipe_hasil_id = th.id and oh.id = '
    + QuotedStr(qStatus.FieldByName('id').AsString) + ' ';

  QPasien.Active := True;

  frmPendaftaran.b_clear := False;

  frmPendaftaran.pasien_id := QPasien.FieldByName('id').AsString;
  frmPendaftaran.tipe_pasien := QPasien.FieldByName('tipe_pasien').AsString;
  frmPendaftaran.tipe_hasil := QPasien.FieldByName('tipe_hasil').AsString;
  frmPendaftaran.urgency := QPasien.FieldByName('urgency').AsString;
  frmPendaftaran.asal := QPasien.FieldByName('asal').AsString;
  frmPendaftaran.penjamin := QPasien.FieldByName('penjamin').AsString;
  frmPendaftaran.ruangan := QPasien.FieldByName('ruangan').AsString;

  // fix jika value = 0 maka set ke 1 untuk field baru
  if frmPendaftaran.asal = '0' then
    frmPendaftaran.asal := '1';
  if frmPendaftaran.penjamin = '0' then
    frmPendaftaran.penjamin := '1';
  if frmPendaftaran.ruangan = '0' then
    frmPendaftaran.ruangan := '1';

  //
  frmPendaftaran.edPasienId.Text := QPasien.FieldByName('id').AsString;
  frmPendaftaran.edNama.Text := QPasien.FieldByName('nama').AsString;
  frmPendaftaran.edKelamin.Text := QPasien.FieldByName('kelamin').AsString;
  frmPendaftaran.edUmur.Text := QPasien.FieldByName('umur').AsString;
  frmPendaftaran.edAlamat.Text := QPasien.FieldByName('alamat').AsString;
  frmPendaftaran.edTelp.Text := QPasien.FieldByName('telepon').AsString;
  frmPendaftaran.edHp.Text := QPasien.FieldByName('hp').AsString;
  frmPendaftaran.edPatientID.Text := QPasien.FieldByName('noreg').AsString;
  frmPendaftaran.edJenisKelaminId.Text :=
    QPasien.FieldByName('jenis_kelamin_id').AsString;

  // dokter
  frmPendaftaran.edDokterId.Text := QPasien.FieldByName('dokter_id').AsString;
  frmPendaftaran.edDokter.Text := QPasien.FieldByName('dokter').AsString;

  frmPendaftaran.mmInternalNote.Text := QPasien.FieldByName('catatan').AsString;
  frmPendaftaran.mmDiagnosis.Text := QPasien.FieldByName('diagnosa').AsString;

  // detail
  if qDetail.Active then
    qDetail.Active := False;
  qDetail.ParamByName('header_id').Value := qStatus.FieldByName('id').AsString;
  qDetail.Active := True;
  // clear
  for I := 0 to frmPendaftaran.GrdPemeriksaan.RowCount do
  begin
    for J := 0 to frmPendaftaran.GrdPemeriksaan.ColCount do
      frmPendaftaran.GrdPemeriksaan.Cells[J, I] := '';

  end;
  frmPendaftaran.GrdPemeriksaan.ColCount := 4;
  frmPendaftaran.GrdPemeriksaan.RowCount := 2;
  frmPendaftaran.GrdPemeriksaan.Cells[0, 0] := 'Kode';
  frmPendaftaran.GrdPemeriksaan.Cells[1, 0] := 'Pemeriksaan';
  frmPendaftaran.GrdPemeriksaan.Cells[2, 0] := 'Harga';
  frmPendaftaran.GrdPemeriksaan.Cells[3, 0] := 'Cito';
  frmPendaftaran.GrdPemeriksaan.ColWidths[0] := 150;
  frmPendaftaran.GrdPemeriksaan.ColWidths[1] := 300;
  frmPendaftaran.GrdPemeriksaan.ColWidths[2] := 100;
  frmPendaftaran.GrdPemeriksaan.ColWidths[3] := 50;

  I := 1;
  qDetail.First;
  while not qDetail.Eof do
  begin
    frmPendaftaran.GrdPemeriksaan.RowCount :=
      frmPendaftaran.GrdPemeriksaan.RowCount + 1;
    frmPendaftaran.GrdPemeriksaan.Cells[0, I] :=
      qDetail.FieldByName('test_kode').AsString;
    frmPendaftaran.GrdPemeriksaan.Cells[1, I] :=
      qDetail.FieldByName('nama_test').AsString;
    frmPendaftaran.GrdPemeriksaan.Cells[2, I] :=
      FormatFloat('#,##0.00', StrToFloat(qDetail.FieldByName('harga')
      .AsString));
    frmPendaftaran.GrdPemeriksaan.Cells[3, I] :=
      qDetail.FieldByName('cito').AsString;
    qDetail.Next;
    I := I + 1;
  end;

  // calculate total
  // calculate total
  fTotal := 0;
  for I := 1 to frmPendaftaran.GrdPemeriksaan.RowCount do
  begin
    tmpStr := frmPendaftaran.GrdPemeriksaan.Cells[2, I];
    tmpStr := StringReplace(tmpStr, ',', '', [rfReplaceAll]);
    if tmpStr <> '' then
      fTotal := fTotal + StrToFloat(tmpStr);
  end;

  frmPendaftaran.edSubTotal.Text := FormatFloat('#,##0.00', fTotal);

  // discount
  frmPendaftaran.edDiscount.Text := FormatFloat('#,##0.00',
    QPasien.FieldByName('disc_pct').AsFloat);

  fSubTotal := StrToFloat(StringReplace(frmPendaftaran.edSubTotal.Text, ',', '',
    [rfReplaceAll]));
  fDiscAmount := fSubTotal * StrToFloat(frmPendaftaran.edDiscount.Text) / 100;
  frmPendaftaran.edDiscAmount.Text := FormatFloat('#,##0.00', fDiscAmount);
  frmPendaftaran.edTotal.Text := FormatFloat('#,##0.00',
    fSubTotal - fDiscAmount);

  // uang muka
  if QPasien.Active then
    QPasien.Active := False;
  QPasien.SQL.Text :=
    'select sum(jumlah) pembayaran from pembayaran where order_header_id = ' +
    QuotedStr(qStatus.FieldByName('id').AsString) + ' ';
  QPasien.Active := True;

  frmPendaftaran.edUangMuka.Text := FormatFloat('#,##0.00',
    QPasien.FieldByName('pembayaran').AsFloat);

  frmPendaftaran.btnBayar.Enabled := False;

  frmPendaftaran.btnPTerakhir.Caption := 'F10 Cetak Copy Nota';
  frmPendaftaran.order_hdr_id := qStatus.FieldByName('id').AsString;
  frmPendaftaran.tgl_hasil := qStatus.FieldByName('ket_tgl_selesai_date')
    .AsDateTime;
  frmPendaftaran.catatan_hasil := qStatus.FieldByName
    ('ket_tgl_selesai').AsString;

  // summary
  frmPendaftaran.pnlSumary.Height := 114;
  frmPendaftaran.lblUangMuka.Visible := True;
  frmPendaftaran.edUangMuka.Visible := True;

  frmPendaftaran.ShowModal();

end;

procedure TfrmStatusHasilPembayaran.edExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmStatusHasilPembayaran.edKuitansiClick(Sender: TObject);
begin
  frmKuitansi.ShowModal();
  if frmKuitansi.qKuintansiRows.Active then
    frmKuitansi.qKuintansiRows.Active := False;
  frmKuitansi.qKuintansiRows.ParamByName('header_id').Value :=
    qStatus.FieldByName('id').AsString;
  frmKuitansi.qKuintansiRows.Active := True;
  frmKuitansi.edNama.Text := qStatus.FieldByName('nama').AsString;

  // showmessage(qStatus.FieldByName('id').AsString);

end;

procedure TfrmStatusHasilPembayaran.edLblClick(Sender: TObject);
var
  Result: string;
begin

  if qKuintansi.Active then
    qKuintansi.Active := False;

  qKuintansi.ParamByName('header_id').AsInteger := qStatus.FieldByName('id')
    .AsInteger;
  qKuintansi.Active := True;

  // frxLabel.PrintOptions.ShowDialog := False;
  // frxLabel.ShowProgress := False;
  //
  // frxLabel.EngineOptions.SilentMode := True;
  // frxLabel.EngineOptions.DestroyForms := False;
  //
  // frxPDFExport1.Background := True;
  // frxPDFExport1.ShowProgress := False;
  // frxPDFExport1.ShowDialog := False;
  // frxPDFExport1.FileName := UniServerModule.NewCacheFileUrl(False, 'pdf', '',
  // '', Result, True);
  // frxPDFExport1.DefaultPath := '';
  //
  // frxLabel.PreviewOptions.AllowEdit := False;
  // frxLabel.PrepareReport;
  // frxLabel.Export(frxPDFExport1);

  frmReportDisplay.UniURLFrame1.URL := Result;
  frmReportDisplay.ShowModal();

end;

procedure TfrmStatusHasilPembayaran.edNamaKeyDown(Sender: TObject;
var Key: Word; Shift: TShiftState);
begin
  if Ord(Key) = VK_RETURN then
    refreshData();
end;

procedure TfrmStatusHasilPembayaran.edNomorKeyDown(Sender: TObject;
var Key: Word; Shift: TShiftState);
begin
  if Ord(Key) = VK_RETURN then
    refreshData();

end;

procedure TfrmStatusHasilPembayaran.edTglKeyDown(Sender: TObject; var Key: Word;
Shift: TShiftState);
begin
  if Ord(Key) = VK_RETURN then
    refreshData();

end;

procedure TfrmStatusHasilPembayaran.UniButton1Click(Sender: TObject);
var
  zpl_text: String;
  BM, SelectedBM: TBookmark;
  I: Integer;
  hCommFile: THandle;
  NumberWritten, BytesRead, BytesToRead: LongWord;
  Data, port: String;
  Buffer: PChar;
  wideChars: array [0 .. 11] of WideChar;
begin

  // header
  if QSampling.Active then
    QSampling.Active := False;
  QSampling.ParamByName('id').Value := qStatus.FieldByName('id').AsString;
  QSampling.Active := True;

  // sample
  if QSample.Active then
    QSample.Active := False;
  QSample.ParamByName('header_id').Value := qStatus.FieldByName('id').AsString;
  QSample.Active := True;

  if QPrinterLabel.Active then
    QPrinterLabel.Active := False;
  QPrinterLabel.Active := True;

  if not QPrinterLabel.Active then
    QPrinterLabel.Active := True;

  port := QPrinterLabel.FieldByName('port').AsString;

  QSample.First;

  while not QSample.Eof do
  begin
    zpl_text := QPrinterLabel.FieldByName('zpl_text').AsString;
    zpl_text := StringReplace(zpl_text, '<order_number>',
      QSampling.FieldByName('nomor').AsString, [rfReplaceAll, rfIgnoreCase]);
    zpl_text := StringReplace(zpl_text, '<patient_name>',
      QSampling.FieldByName('nama').AsString, [rfReplaceAll, rfIgnoreCase]);
    zpl_text := StringReplace(zpl_text, '<origin_name>',
      QSampling.FieldByName('asal_pasien').AsString,
      [rfReplaceAll, rfIgnoreCase]);
    zpl_text := StringReplace(zpl_text, '<patient_id>',
      QSampling.FieldByName('noreg').AsString, [rfReplaceAll, rfIgnoreCase]);
    zpl_text := StringReplace(zpl_text, '<patient_dob>',
      QSampling.FieldByName('tanggal_lahir').AsString,
      [rfReplaceAll, rfIgnoreCase]);
    zpl_text := StringReplace(zpl_text, '<gender_ext_code>',
      QSampling.FieldByName('kelamin').AsString, [rfReplaceAll, rfIgnoreCase]);
    zpl_text := StringReplace(zpl_text, '<specimen_name>',
      QSample.FieldByName('jenis_sampel').AsString,
      [rfReplaceAll, rfIgnoreCase]);
    zpl_text := StringReplace(zpl_text, '<sample_no>',
      QSample.FieldByName('nosample').AsString, [rfReplaceAll, rfIgnoreCase]);
    // ComPort.WriteStr(zpl_text);
    Sleep(200);
    QSample.Next;

  end;

end;

procedure TfrmStatusHasilPembayaran.UniButton2Click(Sender: TObject);
begin
  // ComPort.port := 'COM10';
  // ComPort.Connected := True;
end;

procedure TfrmStatusHasilPembayaran.UniDBGrid1CellClick
  (Column: TUniDBGridColumn);
begin
  UniDBGrid1SelectionChange(self);
end;

procedure TfrmStatusHasilPembayaran.UniDBGrid1SelectionChange(Sender: TObject);
var
  sStatus: String;
begin
  sStatus := '';
  lblStatus.Font.Color := clBlue;
  if qStatus.FieldByName('lunas').AsString = 'N' then
  begin
    edBayar.Enabled := True;
    sStatus := 'BELUM LUNAS, ';
  end
  else
  begin
    edBayar.Enabled := False;
    sStatus := 'SUDAH LUNAS, ';
  end;

  if qStatus.FieldByName('ambil_hasil').AsString = 'N' then
  begin
    btnAmbilHasil.Enabled := True;
    sStatus := sStatus + 'HASIL BELUM DIAMBIL';
  end

  else
  begin
    btnAmbilHasil.Enabled := False;
    sStatus := sStatus + 'HASIL SUDAH DIAMBIL'
  end;

  lblStatus.Caption := sStatus;
  if qStatus.FieldByName('lunas').AsString = 'N' then
    lblStatus.Font.Color := clYellow;

end;

procedure TfrmStatusHasilPembayaran.UniFormAfterShow(Sender: TObject);
var
  thn, bln, tgl: Word;
  sThn, sBln, Stgl: string;
begin
  decodeDate(now, thn, bln, tgl);
  sThn := IntToStr(thn);
  if bln < 10 then
    sBln := '0' + IntToStr(bln)
  else
    sBln := IntToStr(bln);
  if tgl < 10 then
    Stgl := '0' + IntToStr(tgl)
  else
    Stgl := IntToStr(tgl);

  edTgl.Text := sThn + '-' + sBln + '-' + Stgl;

  refreshData();

end;

procedure TfrmStatusHasilPembayaran.UniFormKeyDown(Sender: TObject;
var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F2 then
    edDtlClick(self);
  if Key = VK_F3 then
    edBayarClick(self);
  if Key = VK_F3 then
    btnAmbilHasilClick(self);
  if Key = VK_F6 then
    edExitClick(self);
  if Key = VK_F7 then
    edLblClick(self);
  if Key = VK_F11 then
    edKuitansiClick(self);
  if Key = VK_ESCAPE then
    Close;
end;

end.
