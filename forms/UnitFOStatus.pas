unit UnitFOStatus;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniPanel, uniBasicGrid,
  uniDBGrid, uniButton, uniEdit, uniLabel, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uniMemo, UnitJasper;

type
  TfrmFOStatus = class(TUniForm)
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
    QNotaCopy: TFDQuery;
    QNotaCopyheader_id: TIntegerField;
    QNotaCopylevel: TIntegerField;
    QNotaCopypemeriksaan: TStringField;
    QNotaCopyharga: TBCDField;
    QNotaCopycetak_nota: TStringField;
    QNotaCopyada_harga: TStringField;
    QNotaCopynomor: TStringField;
    QNotaCopynama: TStringField;
    QNotaCopytelepon: TStringField;
    QNotaCopydokter: TStringField;
    QNotaCopytipe_pasien: TStringField;
    QNotaCopyalamat: TStringField;
    QNotaCopyjumlah: TBCDField;
    QNotaCopyid_pasien: TStringField;
    QNotaCopycatatan: TStringField;
    QNotaCopyasal: TStringField;
    QNotaCopyansuransi: TStringField;
    QNotaCopyuser_name: TStringField;
    QNotaCopytanggal: TDateTimeField;
    QNotaCopydiskon: TBCDField;
    QNotaCopyharga_total: TFMTBCDField;
    QNotaCopydisc_pct: TBCDField;
    QNotaCopyflgLunas: TStringField;
    QNotaCopyhp: TStringField;
    QNotaCopydisc_amount: TBCDField;
    QNotaCopysub_total: TBCDField;
    QNotaCopytagihan: TBCDField;
    btnCopyNota: TUniButton;
    UniButton1: TUniButton;
    QNotaCopyperujuk: TStringField;
    QNotaCopycatatan_pasien: TMemoField;
    Qzpl: TFDQuery;
    QTubes: TFDQuery;
    UniButton2: TUniButton;
    cmdIns: TFDCommand;
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
    procedure btnCopyNotaClick(Sender: TObject);
    procedure UniButton1Click(Sender: TObject);
    procedure edPrintClick(Sender: TObject);
    procedure UniButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function frmFOStatus: TfrmFOStatus;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, UnitFODaftar, UnitBayar, UnitKuitansi,
  ServerModule, UnitReportDisplay, UnitQz;

procedure refreshData();
begin
  if frmFOStatus.qStatus.Active then
    frmFOStatus.qStatus.Active := False;
  frmFOStatus.qStatus.SQL.Text :=
    'select order_header.id,order_header.nomor,pasien.nama,pasien.telepon, ' +
    'pasien.alamat,dokter.nama dokter,order_header.flgLunas lunas, ' +
    'order_header.tagihan,flg_ambil_hasil ambil_hasil,cetak, ' +
    'order_header.ket_tgl_selesai,order_header.ket_tgl_selesai_date ' +
    'from order_header left join pasien on order_header.pasien_id = pasien.id '
    + 'left join dokter on order_header.dokter_id = dokter.id ' +
    'where order_header.tanggal like ' + QuotedStr(frmFOStatus.edTgl.Text + '%')
    + ' and order_header.nomor like ' +
    QuotedStr('%' + frmFOStatus.edNomor.Text) + ' and pasien.nama like ' +
    QuotedStr('%' + frmFOStatus.edNama.Text + '%') +
    ' and order_header.flgBatal = ' + QuotedStr('N') +
    ' order by order_header.nomor';
  frmFOStatus.qStatus.Active := True;

end;

function frmFOStatus: TfrmFOStatus;
begin
  Result := TfrmFOStatus(UniMainModule.GetFormInstance(TfrmFOStatus));
end;

procedure TfrmFOStatus.btnAmbilHasilClick(Sender: TObject);
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

procedure TfrmFOStatus.btnCopyNotaClick(Sender: TObject);
var
  filename: string;
  status: boolean;
begin

  ShowMask('Loading');
  uniSession.Synchronize();
  frmReportDisplay.UniURLFrame1.URL := ExecReportParams('pdf', 'print_nota',
    qStatus.FieldByName('id').AsString, '', '', '', '', '');
  frmReportDisplay.ShowModal();

  HideMask;
  // ShowMask('Loading');
  // uniSession.Synchronize();
  // filename := reportExecReqFileParams('pdf', 'print_nota',
  // qStatus.FieldByName('id').AsString, '1', '', status);

  // if status then
  // begin
  // uniSession.AddJS(printKuitansi(filename));
  // end
  // else
  // showMessage(filename);

  // HideMask;
end;

procedure TfrmFOStatus.btnSearchClick(Sender: TObject);
begin
  refreshData();
  lblStatus.Text := '';
  UniDBGrid1SelectionChange(self);
end;

procedure TfrmFOStatus.edBayarClick(Sender: TObject);
begin

  frmBayar.ShowModal;
  frmBayar.order_id := qStatus.FieldByName('id').AsInteger;
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

procedure TfrmFOStatus.edDtlClick(Sender: TObject);
// var
// I, J: Integer;
// fTotal: Currency;
// tmpStr: String;
begin

  frmFODaftar.call_form := 'fo_status';

  frmFODaftar.order_id := qStatus.FieldByName('id').AsString;
  frmFODaftar.ShowModal();

  // // pasien
  // if QPasien.Active then
  // QPasien.Active := False;
  // QPasien.SQL.Text :=
  // 'select p.id, rp.nama ruangan,oh.disc_pct, an.nama penjamin,ap.nama asal, u.nama urgency, th.nama tipe_hasil, p.jenis_kelamin_id, tp.nama tipe_pasien, oh.dokter_id, d.nama dokter, CONCAT(pf.nama,'
  // + QuotedStr(' ') +
  // ', p.nama) nama,k.nama kelamin,p.telepon,p.hp,p.noreg,p.wilayah,CONCAT(p.telepon,'
  // + QuotedStr('/') + ',p.hp) tlp ';
  // QPasien.SQL.Text := QPasien.SQL.Text +
  // ' , oh.catatan,oh.diagnosa,p.alamat, CONCAT(TIMESTAMPDIFF( YEAR, p.tanggal_lahir, now() ),'
  // + QuotedStr(' th ') +
  // ',TIMESTAMPDIFF( MONTH, p.tanggal_lahir, now() ) % 12,' + QuotedStr(' bl ')
  // + ',FLOOR( TIMESTAMPDIFF( DAY, p.tanggal_lahir, now() ) % 30.4375 )) as umur,p.catatan catatan_pasien, pr.nama perujuk  ';
  // QPasien.SQL.Text := QPasien.SQL.Text +
  // ' from order_header oh,perujuk pr,ruangan_pasien rp, ansuransi_pasien an, asal_pasien ap, urgency u,tipe_hasil th,tipe_pasien tp,dokter d,pasien p, prefix pf, jenis_kelamin k ';
  // QPasien.SQL.Text := QPasien.SQL.Text +
  // ' where oh.ruangan_pasien_id = rp.id and oh.ansuransi_pasien_id = an.id and oh.asal_pasien_id = ap.id and oh.urgency_id = u.id and p.prefix_id = pf.id and oh.perujuk_id = pr.id';
  // QPasien.SQL.Text := QPasien.SQL.Text +
  // 'and p.jenis_kelamin_id=k.id and oh.pasien_id = p.id and oh.dokter_id = d.id and oh.tipe_pasien_id = tp.id and oh.tipe_hasil_id = th.id and oh.id = '
  // + QuotedStr(frmFODaftar.order_id) + ' ';
  //
  // QPasien.Active := True;
  //
  // // isi data pasien
  // frmFODaftar.pasien_id := QPasien.FieldByName('id').AsString;
  // frmFODaftar.edPasienId.Text := QPasien.FieldByName('noreg').AsString;
  // frmFODaftar.edNama.Text := QPasien.FieldByName('nama').AsString;
  //
  // frmFODaftar.b_clear := False;
  //
  //
  // // frmFODaftar.tipe_pasien := QPasien.FieldByName('tipe_pasien').AsString;
  // // frmFODaftar.tipe_hasil := QPasien.FieldByName('tipe_hasil').AsString;
  // // frmFODaftar.urgency := QPasien.FieldByName('urgency').AsString;
  // // frmFODaftar.asal := QPasien.FieldByName('asal').AsString;
  // // frmFODaftar.penjamin := QPasien.FieldByName('penjamin').AsString;
  // // frmFODaftar.ruangan := QPasien.FieldByName('ruangan').AsString;
  // // frmFODaftar.perujuk := QPasien.FieldByName('perujuk').AsString;
  // //
  // // frmFODaftar.edPasienId.Text := QPasien.FieldByName('id').AsString;
  // // frmFODaftar.edNama.Text := QPasien.FieldByName('nama').AsString;
  // // frmFODaftar.edKelamin.Text := QPasien.FieldByName('kelamin').AsString;
  // // frmFODaftar.edUmur.Text := QPasien.FieldByName('umur').AsString;
  // // frmFODaftar.edAlamat.Text := QPasien.FieldByName('alamat').AsString;
  // // frmFODaftar.edTelp.Text := QPasien.FieldByName('telepon').AsString;
  // // frmFODaftar.edHp.Text := QPasien.FieldByName('hp').AsString;
  // // frmFODaftar.edPatientID.Text := QPasien.FieldByName('noreg').AsString;
  // // frmFODaftar.edJenisKelaminId.Text :=
  // // QPasien.FieldByName('jenis_kelamin_id').AsString;
  // //
  // // // dokter
  // // frmFODaftar.edDokterId.Text := QPasien.FieldByName('dokter_id').AsString;
  // // frmFODaftar.edDokter.Text := QPasien.FieldByName('dokter').AsString;
  // //
  // // frmFODaftar.mmInternalNote.Text := QPasien.FieldByName('catatan').AsString;
  // // // frmFODaftar.mmDiagnosis.Text := QPasien.FieldByName('diagnosa').AsString;
  //
  // // detail
  // if qDetail.Active then
  // qDetail.Active := False;
  // qDetail.ParamByName('header_id').Value := qStatus.FieldByName('id').AsString;
  // qDetail.Active := True;
  // // clear
  // for I := 0 to frmFODaftar.GrdPemeriksaan.RowCount do
  // begin
  // for J := 0 to frmFODaftar.GrdPemeriksaan.ColCount do
  // frmFODaftar.GrdPemeriksaan.Cells[J, I] := '';
  //
  // end;
  // frmFODaftar.GrdPemeriksaan.ColCount := 4;
  // frmFODaftar.GrdPemeriksaan.RowCount := 2;
  // frmFODaftar.GrdPemeriksaan.Cells[0, 0] := 'Kode';
  // frmFODaftar.GrdPemeriksaan.Cells[1, 0] := 'Pemeriksaan';
  // frmFODaftar.GrdPemeriksaan.Cells[2, 0] := 'Harga';
  // frmFODaftar.GrdPemeriksaan.Cells[3, 0] := 'Cito';
  // frmFODaftar.GrdPemeriksaan.ColWidths[0] := 150;
  // frmFODaftar.GrdPemeriksaan.ColWidths[1] := 300;
  // frmFODaftar.GrdPemeriksaan.ColWidths[2] := 100;
  // frmFODaftar.GrdPemeriksaan.ColWidths[3] := 50;
  //
  // I := 1;
  // qDetail.First;
  // while not qDetail.Eof do
  // begin
  // frmFODaftar.GrdPemeriksaan.RowCount :=
  // frmFODaftar.GrdPemeriksaan.RowCount + 1;
  // frmFODaftar.GrdPemeriksaan.Cells[0, I] :=
  // qDetail.FieldByName('test_kode').AsString;
  // frmFODaftar.GrdPemeriksaan.Cells[1, I] :=
  // qDetail.FieldByName('nama_test').AsString;
  // frmFODaftar.GrdPemeriksaan.Cells[2, I] :=
  // FormatFloat('#,##0.00', StrToFloat(qDetail.FieldByName('harga')
  // .AsString));
  // frmFODaftar.GrdPemeriksaan.Cells[3, I] :=
  // qDetail.FieldByName('cito').AsString;
  // qDetail.Next;
  // I := I + 1;
  // end;
  //
  // // calculate total
  // // calculate total
  // fTotal := 0;
  // for I := 1 to frmFODaftar.GrdPemeriksaan.RowCount do
  // begin
  // tmpStr := frmFODaftar.GrdPemeriksaan.Cells[2, I];
  // tmpStr := StringReplace(tmpStr, ',', '', [rfReplaceAll]);
  // if tmpStr <> '' then
  // fTotal := fTotal + StrToFloat(tmpStr);
  // end;
  //
  // frmFODaftar.edSubTotal.Text := FormatFloat('#,##0.00', fTotal);
  //
  // // discount
  // frmFODaftar.edDiscount.Text := FormatFloat('#,##0.00',
  // QPasien.FieldByName('disc_pct').AsFloat);
  //
  // fSubTotal := StrToFloat(StringReplace(frmFODaftar.edSubTotal.Text, ',', '',
  // [rfReplaceAll]));
  // fDiscAmount := fSubTotal * StrToFloat(frmFODaftar.edDiscount.Text) / 100;
  // frmFODaftar.edDiscAmount.Text := FormatFloat('#,##0.00', fDiscAmount);
  // frmFODaftar.edTotal.Text := FormatFloat('#,##0.00', fSubTotal - fDiscAmount);
  //
  // // uang muka
  // if QPasien.Active then
  // QPasien.Active := False;
  // QPasien.SQL.Text :=
  // 'select sum(jumlah) pembayaran from pembayaran where order_header_id = ' +
  // QuotedStr(qStatus.FieldByName('id').AsString) + ' ';
  // QPasien.Active := True;
  //
  // frmFODaftar.edUangMuka.Text := FormatFloat('#,##0.00',
  // QPasien.FieldByName('pembayaran').AsFloat);
  //
  // frmFODaftar.btnBayar.Enabled := False;
  //
  // frmFODaftar.btnPTerakhir.Caption := 'F10 Cetak Copy Nota';
  // frmFODaftar.order_hdr_id := qStatus.FieldByName('id').AsString;
  // frmFODaftar.tgl_hasil := qStatus.FieldByName('ket_tgl_selesai_date')
  // .AsDateTime;
  // frmFODaftar.catatan_hasil := qStatus.FieldByName('ket_tgl_selesai').AsString;
  //
  // // summary
  // // frmFODaftar.pnlSumary.Height := 114;
  // frmFODaftar.lblUangMuka.Visible := True;
  // frmFODaftar.edUangMuka.Visible := True;

end;

procedure TfrmFOStatus.edExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmFOStatus.edKuitansiClick(Sender: TObject);
begin

  if frmKuitansi.qKuintansiRows.Active then
    frmKuitansi.qKuintansiRows.Active := False;
  frmKuitansi.qKuintansiRows.ParamByName('header_id').Value :=
    qStatus.FieldByName('id').AsString;
  frmKuitansi.qKuintansiRows.Active := True;
  frmKuitansi.edNama.Text := qStatus.FieldByName('nama').AsString;

  frmKuitansi.ShowModal();

  // showmessage(qStatus.FieldByName('id').AsString);

end;

procedure TfrmFOStatus.edLblClick(Sender: TObject);
var
  js, zpl: string;
begin

  if qKuintansi.Active then
    qKuintansi.Active := False;

  qKuintansi.ParamByName('header_id').AsInteger := qStatus.FieldByName('id')
    .AsInteger;
  qKuintansi.Active := True;

  // ambil string zpl
  if Qzpl.Active then
    Qzpl.Active := False;
  Qzpl.SQL.Text := 'SELECT value_text FROM parameters WHERE name = ' +
    QuotedStr('ZPL_LABEL_ORDER');
  Qzpl.Active := True;
  zpl := Qzpl.FieldByName('value_text').AsString;

  // frxLabel.PrintOptions.ShowDialog := False;
  // frxLabel.ShowProgress := False;
  //
  // frxLabel.EngineOptions.SilentMode := True;
  // frxLabel.EngineOptions.DestroyForms := False;
  //
  // frxPDFExport1.Background := True;
  // frxPDFExport1.ShowProgress := False;
  // frxPDFExport1.ShowDialog := False;
  // frxPDFExport1.filename := UniServerModule.NewCacheFileUrl(False, 'pdf', '',
  // '', Result, True);
  // frxPDFExport1.DefaultPath := '';
  //
  // frxLabel.PreviewOptions.AllowEdit := False;
  // frxLabel.PrepareReport;
  // frxLabel.Export(frxPDFExport1);

  js := printLabel(qKuintansi.FieldByName('nomor').AsString,
    qKuintansi.FieldByName('prefix').AsString + qKuintansi.FieldByName('nama')
    .AsString, qKuintansi.FieldByName('usia').AsString,
    qKuintansi.FieldByName('tanggal_lahir').AsString,
    qKuintansi.FieldByName('alamat').AsString, qKuintansi.FieldByName('tanggal')
    .AsString, qKuintansi.FieldByName('hp').AsString,
    qKuintansi.FieldByName('dokter').AsString,
    qKuintansi.FieldByName('jenis_kelamin').AsString, zpl);

  // uniMemo1.Lines.Add(js);
  //
  uniSession.AddJS(js);
  sleep(100);

  // ambil string zpl
  if Qzpl.Active then
    Qzpl.Active := False;
  Qzpl.SQL.Text := 'SELECT value_text FROM parameters WHERE name = ' +
    QuotedStr('ZPL_LABEL_SAMPEL');
  Qzpl.Active := True;
  zpl := Qzpl.FieldByName('value_text').AsString;

  if QTubes.Active then
    QTubes.Active := False;
  QTubes.ParamByName('header_id').Value := qStatus.FieldByName('id').AsInteger;
  QTubes.Active := True;

  QTubes.First;
  while not QTubes.Eof do
  begin

    js := printTubeLabel(QTubes.FieldByName('nomor').AsString,
      QTubes.FieldByName('suffix').AsString, QTubes.FieldByName('nama')
      .AsString, QTubes.FieldByName('tanggal_lahir').AsString,
      QTubes.FieldByName('asal_pasien').AsString, QTubes.FieldByName('tube')
      .AsString, QTubes.FieldByName('noreg').AsString,
      QTubes.FieldByName('nomor_mr').AsString, QTubes.FieldByName('tests')
      .AsString, QTubes.FieldByName('jenis_kelamin').AsString, zpl);

    uniSession.AddJS(js);
    sleep(100);

    QTubes.Next;

  end;
end;

procedure TfrmFOStatus.edNamaKeyDown(Sender: TObject; var Key: Word;
Shift: TShiftState);
begin
  if Ord(Key) = VK_RETURN then
    refreshData();
end;

procedure TfrmFOStatus.edNomorKeyDown(Sender: TObject; var Key: Word;
Shift: TShiftState);
begin
  if Ord(Key) = VK_RETURN then
    refreshData();

end;

procedure TfrmFOStatus.edPrintClick(Sender: TObject);
var
  tmpStr: String;
  // RepUrl: string;
begin
  ShowMask('Loading');
  uniSession.Synchronize();
  tmpStr := reportExecutionRequest('pdf', 'laporan_status_hasil', edTgl.Text,
    edTgl.Text, '', '', '');

  // print JS
  uniSession.AddJS('function print() { ' +
    ' var config = qz.configs.create("KUITANSIPRINTER"); ' +
    ' var data = [{ type: "pdf", data: "' + tmpStr + '" }]; ' +
    ' qz.print(config, data).catch(function(e) { console.error(e);}); ' + ' } '
    + '  if (qz.websocket.isActive()) {  print(); }  else { qz.websocket.connect().then(function() { print();});}  ');

  HideMask;
end;

procedure TfrmFOStatus.edTglKeyDown(Sender: TObject; var Key: Word;
Shift: TShiftState);
begin
  if Ord(Key) = VK_RETURN then
    refreshData();

end;

procedure TfrmFOStatus.UniButton1Click(Sender: TObject);
// var
// tmpStr: String;
// RepUrl: string;
begin
  ShowMask('Loading');
  uniSession.Synchronize();
  frmReportDisplay.UniURLFrame1.URL := reportExecutionRequest('pdf',
    'laporan_dahl', edTgl.Text, edTgl.Text, '', '', '');
  frmReportDisplay.ShowModal();
  HideMask;
end;

procedure TfrmFOStatus.UniButton2Click(Sender: TObject);
begin
  ShowMask('Loading');
  uniSession.Synchronize();
  if cmdIns.Active then
    cmdIns.Active := False;
  cmdIns.ParamByName('id').Value := qStatus.FieldByName('id').AsInteger;
  cmdIns.Execute;

  HideMask;
  uniSession.AddJS
    ('Ext.toast({html: "Proses pengiriman ke LIS berhasil.", header: false, autoCloseDelay: 3000});');
end;

procedure TfrmFOStatus.UniDBGrid1CellClick(Column: TUniDBGridColumn);
begin
  UniDBGrid1SelectionChange(self);
end;

procedure TfrmFOStatus.UniDBGrid1SelectionChange(Sender: TObject);
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

procedure TfrmFOStatus.UniFormAfterShow(Sender: TObject);
var
  thn, bln, tgl: Word;
  sThn, sBln, Stgl: string;
begin
  decodeDate(now, thn, bln, tgl);
  sThn := IntToSTr(thn);
  if bln < 10 then
    sBln := '0' + IntToSTr(bln)
  else
    sBln := IntToSTr(bln);
  if tgl < 10 then
    Stgl := '0' + IntToSTr(tgl)
  else
    Stgl := IntToSTr(tgl);

  edTgl.Text := sThn + '-' + sBln + '-' + Stgl;

  refreshData();

end;

procedure TfrmFOStatus.UniFormKeyDown(Sender: TObject; var Key: Word;
Shift: TShiftState);
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
