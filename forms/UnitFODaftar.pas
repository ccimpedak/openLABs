unit UnitFODaftar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniEdit, uniLabel, uniGUIBaseClasses, uniPanel,
  uniBasicGrid, uniDBGrid, uniButton, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uniMultiItem, uniComboBox,
  uniDBComboBox, uniDBLookupComboBox, uniMemo, uniStringGrid, Vcl.Imaging.jpeg,
  uniImage, uniPageControl,
  uniCheckBox, uniDateTimePicker, DateUtils, uniTreeView;

type
  TSArray = array of String;

  TfrmFODaftar = class(TUniForm)
    UniPanel1: TUniPanel;
    btnCariPasien: TUniButton;
    btnCariDokter: TUniButton;
    edTest: TUniButton;
    btnDetail: TUniButton;
    btnDelete: TUniButton;
    btnDiscount: TUniButton;
    btnBayar: TUniButton;
    btnClear: TUniButton;
    btnNoReg: TUniButton;
    QTest: TFDQuery;
    DSTest: TDataSource;
    QCheckTest: TFDQuery;
    QEditPasien: TFDQuery;
    btnEditPasien: TUniButton;
    btnPTerakhir: TUniButton;
    QPTerakhir: TFDQuery;
    QPTerakhirDtl: TFDQuery;
    QNotaCopy: TFDQuery;
    QPaket: TFDQuery;
    DSPaket: TDataSource;
    QPaketDetail: TFDQuery;
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
    QNotaCopydisc_amount: TBCDField;
    QNotaCopysub_total: TBCDField;
    QNotaCopytagihan: TBCDField;
    QNotaCopyharga_total: TFMTBCDField;
    QNotaCopydisc_pct: TBCDField;
    QNotaCopyflgLunas: TStringField;
    QNotaCopyhp: TStringField;
    QNotaCopyket_tgl_selesai_date: TDateTimeField;
    QNotaCopyperujuk: TStringField;
    QNotaCopycatatan_pasien: TMemoField;
    QTmp: TFDQuery;
    pnlHeader: TUniContainerPanel;
    pnlPasien: TUniPanel;
    pnlOrderDem: TUniPanel;
    edDokter: TUniEdit;
    UniLabel6: TUniLabel;
    edDokterId: TUniEdit;
    mmInternalNote: TUniMemo;
    UniContainerPanel2: TUniContainerPanel;
    cbTest: TUniDBLookupComboBox;
    cbPaket: TUniDBLookupComboBox;
    UniLabel19: TUniLabel;
    UniLabel20: TUniLabel;
    UniContainerPanel3: TUniContainerPanel;
    UniContainerPanel5: TUniContainerPanel;
    UniContainerPanel4: TUniContainerPanel;
    UniLabel11: TUniLabel;
    edSubTotal: TUniEdit;
    edDiscAmount: TUniEdit;
    edDiscount: TUniFormattedNumberEdit;
    UniLabel12: TUniLabel;
    UniLabel13: TUniLabel;
    edTotal: TUniEdit;
    lblUangMuka: TUniLabel;
    edUangMuka: TUniEdit;
    UniContainerPanel6: TUniContainerPanel;
    pcPasien: TUniPageControl;
    tsDemog: TUniTabSheet;
    pnlFoto: TUniContainerPanel;
    imFotoPasien: TUniImage;
    pnlPasienData: TUniContainerPanel;
    UniLabel1: TUniLabel;
    edPasienId: TUniEdit;
    edNama: TUniEdit;
    UniLabel2: TUniLabel;
    edJenisKelaminId: TUniEdit;
    edKelamin: TUniEdit;
    UniLabel3: TUniLabel;
    edAlamat: TUniEdit;
    UniLabel4: TUniLabel;
    edTelp: TUniEdit;
    edHp: TUniEdit;
    UniLabel5: TUniLabel;
    edPatientID: TUniEdit;
    edUmur: TUniEdit;
    UniTabSheet2: TUniTabSheet;
    pnlOrderKirimHasil: TUniContainerPanel;
    cbHasilEmail: TUniCheckBox;
    cbHasilWa: TUniCheckBox;
    edHasilEmail: TUniEdit;
    edHasilWa: TUniEdit;
    dtJanjiHasil: TUniDateTimePicker;
    UniLabel8: TUniLabel;
    UniContainerPanel1: TUniContainerPanel;
    UniContainerPanel7: TUniContainerPanel;
    GrdPemeriksaan: TUniStringGrid;
    grdInterview: TUniStringGrid;
    mmCatatanPasien: TUniMemo;
    UniTabSheet1: TUniTabSheet;
    UniButton1: TUniButton;
    tvHistori: TUniTreeView;
    QPasien: TFDQuery;
    QInt: TFDQuery;
    cbJanjiHasil: TUniCheckBox;
    pcOrder: TUniPageControl;
    UniTabSheet3: TUniTabSheet;
    utInternal: TUniTabSheet;
    cbKirimPerujuk: TUniCheckBox;
    cbKirimRumah: TUniCheckBox;
    cbHasilAmbil: TUniCheckBox;
    QOrder: TFDQuery;
    UniContainerPanel8: TUniContainerPanel;
    cmdTmp: TFDCommand;
    btnIntUpd: TUniButton;
    btnUpdate: TUniButton;
    FDcmd: TFDCommand;
    cmdLogging: TFDCommand;
    cmdExe: TFDCommand;
    FDQuery1: TFDQuery;
    cbTipePasien: TUniDBLookupComboBox;
    UniLabel7: TUniLabel;
    QTipePasien: TFDQuery;
    DSTipePasien: TDataSource;
    cbTipeSample: TUniDBLookupComboBox;
    UniLabel9: TUniLabel;
    QTipeSample: TFDQuery;
    dsTipeSample: TDataSource;
    procedure UniFormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnClearClick(Sender: TObject);
    procedure btnCariPasienClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    procedure edCariTestChange(Sender: TObject);
    procedure edCariTestKeyPress(Sender: TObject; var Key: Char);
    procedure GrdPemeriksaanDrawCell(Sender: TObject; ACol, ARow: Integer;
      var Value: string; Attribs: TUniCellAttribs);
    procedure edDiscountKeyPress(Sender: TObject; var Key: Char);
    procedure edDiscountChange(Sender: TObject);
    procedure edTestClick(Sender: TObject);
    procedure btnDetailClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnDiscountClick(Sender: TObject);
    procedure btnBayarClick(Sender: TObject);
    procedure uniDBGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnNoRegClick(Sender: TObject);
    procedure edPatientIDKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edDiscAmountChange(Sender: TObject);
    procedure edDiscAmountKeyPress(Sender: TObject; var Key: Char);
    procedure btnEditPasienClick(Sender: TObject);
    procedure btnPTerakhirClick(Sender: TObject);
    procedure btnTglSelesaiClick(Sender: TObject);
    procedure cbPaketSelect(Sender: TObject);
    procedure UniFormBeforeShow(Sender: TObject);
    procedure cbTestKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cbHasilEmailChange(Sender: TObject);
    procedure cbHasilWaChange(Sender: TObject);
    procedure pnlFotoClick(Sender: TObject);
    procedure pnlFotoMouseEnter(Sender: TObject);
    procedure edPasienIdChange(Sender: TObject);
    procedure UniButton1Click(Sender: TObject);
    procedure cbJanjiHasilChange(Sender: TObject);
    procedure btnIntUpdClick(Sender: TObject);
    procedure btnUpdateClick(Sender: TObject);
    procedure btnCariDokterClick(Sender: TObject);
    procedure UniFormAfterShow(Sender: TObject);
    procedure cbTipePasienChangeValue(Sender: TObject);

  private
    { Private declarations }
    procedure DeleteTestCallback(Sender: TComponent; Res: Integer);
    procedure ClearTestCallback(Sender: TComponent; Res: Integer);
    procedure insertLog(order_id: Integer; keterangan: string);
    procedure CekReturOrBayar;

  var
    // interviewArr: TSArray;
    // interviewArrStr: TSArray;
    // interviewArrValue: TSArray;
    length_arr: Integer;

  public
    { Public declarations }
  var
    pasien_id, order_id, tipe_pasien, urgency, asal, penjamin, ruangan,
      tipe_hasil, call_form: string;
    b_clear: boolean;
    order_hdr_id: string;
    home_service_id: Integer;
    tgl_hasil: TDateTime;
    catatan_hasil: string;
    perujuk: string;
    jenis_kelamin_id: string;
  end;

function frmFODaftar: TfrmFODaftar;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, UnitCariPasien, UnitBayar,
  UnitPasienBaru, UnitTanggalSelesai, ServerModule, UnitReportDisplay, UnitQz,
  UnitFotoPasien, UnitUtils, UnitFOStatus, UnitPasien, UnitCariDokter;

procedure TfrmFODaftar.CekReturOrBayar;
var
  fTotal, fUangMuka: Currency;
begin
  // cek jika dipanggil dari monitoring screen
  // jika total < uang muka maka Retur
  // jika total > uang muka maka bayar
  // jika total = uang muka maka disabled
  if call_form = 'fo_status' then
  begin
    fTotal := StrToFloat(StringReplace(edTotal.Text, ',', '', [rfReplaceAll]));
    fUangMuka := StrToFloat(StringReplace(edUangMuka.Text, ',', '',
      [rfReplaceAll]));
    if fTotal = fUangMuka then
    begin
      btnBayar.Caption := 'Bayar';
      btnBayar.Enabled := False;
    end
    else if fTotal < fUangMuka then
    begin
      btnBayar.Caption := 'Retur';
      btnBayar.Enabled := True;
    end
    else
    begin
      btnBayar.Caption := 'Bayar';
      btnBayar.Enabled := True;
    end;
  end;
end;

procedure TfrmFODaftar.insertLog(order_id: Integer; keterangan: string);
begin
  // logging
  if cmdLogging.Active then
    cmdLogging.Active := False;
  cmdLogging.ParamByName('order_header_id').Value := order_id;
  cmdLogging.ParamByName('order_status_id').Value := 1;
  cmdLogging.ParamByName('user_id').Value := UniApplication.Cookies.GetCookie
    ('UserId');
  cmdLogging.ParamByName('keterangan').Value := keterangan;
  cmdLogging.Execute();
end;

procedure getPasienHistori;
var
  tgl_histori, hasil: string;
  LDestNode: TUniTreeNode;
begin
  frmFODaftar.pcPasien.Pages[0].TabVisible := True;
  frmFODaftar.pcPasien.Pages[1].TabVisible := True;
  frmFODaftar.pcPasien.Pages[2].TabVisible := True;

  if frmFODaftar.QPasien.Active then
    frmFODaftar.QPasien.Active := False;
  frmFODaftar.QPasien.Params.Clear;
  frmFODaftar.QPasien.Params.Add.Name := 'id';
  frmFODaftar.QPasien.SQL.Text :=
    'SELECT id,catatan FROM pasien WHERE id = :id ';
  frmFODaftar.QPasien.ParamByName('id').Value := frmFODaftar.edPasienId.Text;
  frmFODaftar.QPasien.Active := True;

  frmFODaftar.mmCatatanPasien.Lines.Text := frmFODaftar.QPasien.FieldByName
    ('catatan').AsString;

  // histori
  if frmFODaftar.QPasien.Active then
    frmFODaftar.QPasien.Active := False;
  frmFODaftar.QPasien.SQL.Text :=
    'select oh.id,od.id as detail_id,t.nama, od.hasil, od.flg_valid,left(oh.tanggal,16) tanggal,oh.catatan from order_header oh, order_detail od, test t where t.ada_hasil='
    + QuotedStr('Y') +
    ' and oh.id = od.header_id and od.test_id = t.id and oh.flgBatal=' +
    QuotedStr('N') + ' and oh.pasien_id = ' +
    QuotedStr(frmFODaftar.edPasienId.Text) +
    ' and left(oh.tanggal,10) < left(now(),10) order by oh.tanggal desc ';
  frmFODaftar.QPasien.Active := True;
  // tgl_histori := frmFODaftar.QPasien.FieldByName('tanggal').AsString;

  // add
  frmFODaftar.QPasien.First;
  tgl_histori := '';
  frmFODaftar.tvHistori.Items.Clear;
  while not frmFODaftar.QPasien.Eof do
  begin
    if tgl_histori <> frmFODaftar.QPasien.FieldByName('tanggal').AsString then
    begin
      frmFODaftar.tvHistori.Items.Add(nil,
        frmFODaftar.QPasien.FieldByName('tanggal').AsString);
      tgl_histori := frmFODaftar.QPasien.FieldByName('tanggal').AsString;
    end;

    frmFODaftar.QPasien.Next;
  end;
  frmFODaftar.QPasien.First;
  while not frmFODaftar.QPasien.Eof do
  begin
    LDestNode := FindRootNode(frmFODaftar.QPasien.FieldByName('tanggal')
      .AsString, frmFODaftar.tvHistori);
    if LDestNode <> nil then
    begin
      if frmFODaftar.QPasien.FieldByName('flg_valid').AsString = 'Y' then
        hasil := frmFODaftar.QPasien.FieldByName('hasil').AsString
      else
        hasil := 'Validasi';
    end;
    frmFODaftar.tvHistori.Items.AddChild(LDestNode,
      frmFODaftar.QPasien.FieldByName('nama').AsString + ' : ' + hasil);
    frmFODaftar.QPasien.Next;

  end;
end;

function checkInterviewKosong: boolean;
var
  I, countKosong: Integer;
begin
  countKosong := 0;
  // cek semua kode test
  for I := 1 to frmFODaftar.grdInterview.rowcount do
  begin
    if frmFODaftar.grdInterview.Cells[0, I] <> '' then
    begin
      if frmFODaftar.grdInterview.Cells[1, I] = '' then
      begin
        countKosong := countKosong + 1;
      end
      else
    end;
  end;
  if countKosong > 0 then
    Result := True
  else
    Result := False;
end;

procedure loadInterview;
var
  I, J: Integer;
begin
  if not frmFODaftar.QInt.Active then
    frmFODaftar.QInt.Active := True;

  // kosongkan
  for I := 1 to frmFODaftar.grdInterview.rowcount do
  begin
    for J := 0 to frmFODaftar.grdInterview.ColCount do
      frmFODaftar.grdInterview.Cells[J, I] := '';

  end;

  if frmFODaftar.QInt.RecordCount > 0 then
  begin
    frmFODaftar.grdInterview.rowcount := 2;
    // cek semua kode test
    for I := 1 to frmFODaftar.GrdPemeriksaan.rowcount do
    begin
      frmFODaftar.QInt.First;
      while not frmFODaftar.QInt.Eof do
      begin
        if frmFODaftar.QInt.FieldByName('kode')
          .AsString = frmFODaftar.GrdPemeriksaan.Cells[0, I] then
        begin
          // tambah kan ke grid interview
          frmFODaftar.grdInterview.rowcount :=
            frmFODaftar.grdInterview.rowcount + 1;
          frmFODaftar.grdInterview.Cells[0, frmFODaftar.grdInterview.rowcount -
            2] := frmFODaftar.QInt.FieldByName('pertanyaan').AsString;
          frmFODaftar.grdInterview.Cells[1, frmFODaftar.grdInterview.rowcount -
            2] := '?';
        end;
        frmFODaftar.QInt.Next;
      end;

    end;
  end;
end;

procedure clear_fields();
var
  I, J: Integer;
begin
  frmFODaftar.edDokter.Text := '-';
  frmFODaftar.edSubTotal.Text := '0';
  frmFODaftar.edDiscount.Text := '0.00';
  frmFODaftar.edDiscAmount.Text := '0';
  frmFODaftar.edTotal.Text := '0';

  // pasien
  frmFODaftar.edPasienId.Clear;
  frmFODaftar.edNama.Clear;
  frmFODaftar.edJenisKelaminId.Clear;
  frmFODaftar.edKelamin.Clear;
  frmFODaftar.edUmur.Clear;
  frmFODaftar.edAlamat.Clear;
  frmFODaftar.edTelp.Clear;
  frmFODaftar.edHp.Clear;
  frmFODaftar.edPatientID.Clear;

  // memo
  // frmFODaftar.mmCatatanPasien.Clear;
  frmFODaftar.mmInternalNote.Clear;

  if frmFODaftar.QTest.Active then
    frmFODaftar.QTest.Active := False;
  frmFODaftar.QTest.Active := True;

  for I := 0 to frmFODaftar.GrdPemeriksaan.rowcount do
  begin
    for J := 0 to frmFODaftar.GrdPemeriksaan.ColCount do
      frmFODaftar.GrdPemeriksaan.Cells[J, I] := '';
  end;

  frmFODaftar.GrdPemeriksaan.ColCount := 4;
  frmFODaftar.GrdPemeriksaan.rowcount := 2;
  frmFODaftar.GrdPemeriksaan.Cells[0, 0] := 'Kode';
  frmFODaftar.GrdPemeriksaan.Cells[1, 0] := 'Pemeriksaan';
  frmFODaftar.GrdPemeriksaan.Cells[2, 0] := 'Harga';
  frmFODaftar.GrdPemeriksaan.Cells[3, 0] := 'Cito';
  frmFODaftar.GrdPemeriksaan.ColWidths[0] := 100;
  frmFODaftar.GrdPemeriksaan.ColWidths[1] := 300;
  frmFODaftar.GrdPemeriksaan.ColWidths[2] := 100;
  frmFODaftar.GrdPemeriksaan.ColWidths[3] := 50;

end;

procedure calculate_total();
var
  I: Integer;
  fTotal: Currency;
  tmpStr: String;
begin
  // calculate total
  fTotal := 0;
  for I := 1 to frmFODaftar.GrdPemeriksaan.rowcount do
  begin
    tmpStr := frmFODaftar.GrdPemeriksaan.Cells[2, I];
    tmpStr := StringReplace(tmpStr, ',', '', [rfReplaceAll]);
    if tmpStr <> '' then
      fTotal := fTotal + StrToFloat(tmpStr);
  end;

  frmFODaftar.edSubTotal.Text := FormatFloat('#,##0.00', fTotal);

  // discount
  tmpStr := frmFODaftar.edDiscount.Text;
  tmpStr := StringReplace(tmpStr, ',', '', [rfReplaceAll]);
  frmFODaftar.edDiscAmount.Text := FormatFloat('#,##0.00',
    (fTotal * (StrToFloat(tmpStr) / 100)));
  frmFODaftar.edTotal.Text := FormatFloat('#,##0.00',
    StrToFloat(StringReplace(frmFODaftar.edSubTotal.Text, ',', '',
    [rfReplaceAll])) - StrToFloat(StringReplace(frmFODaftar.edDiscAmount.Text,
    ',', '', [rfReplaceAll])));

  // jika sudah tidak ada sisa tidak perlu bayar
  frmFODaftar.btnBayar.Enabled := True;
  if frmFODaftar.edTotal.Text = frmFODaftar.edUangMuka.Text then
    frmFODaftar.btnBayar.Enabled := False;

  frmFODaftar.CekReturOrBayar;

end;

procedure AddTest();
var
  I, id_tes: Integer;
  fTotal: Currency;
  tmpStr: String;
  formatSettings: TFormatSettings;
begin
  frmFODaftar.ShowMask('Loading');
  frmFODaftar.UniSession.Synchronize();
  // enable tes
  if frmFODaftar.btnBayar.Enabled = False then
    frmFODaftar.btnBayar.Enabled := True;

  GetLocaleFormatSettings(LOCALE_SYSTEM_DEFAULT, formatSettings);

  // cek apakah sudah ada
  for I := 1 to frmFODaftar.GrdPemeriksaan.rowcount do
  begin
    if frmFODaftar.GrdPemeriksaan.Cells[0, I] = frmFODaftar.QTest.FieldByName
      ('kode').AsString then
    begin
      frmFODaftar.showMessage('Pemeriksaan sudah ada');
      exit;
    end;
  end;

  // dapatkan idnya
  if frmFODaftar.QCheckTest.Active then
    frmFODaftar.QCheckTest.Active := False;
  frmFODaftar.QCheckTest.SQL.Text := ' SELECT id FROM test WHERE kode = ' +
    QuotedStr(frmFODaftar.QTest.FieldByName('kode').AsString);
  frmFODaftar.QCheckTest.Active := True;

  // tambahkan ke grid
  frmFODaftar.GrdPemeriksaan.rowcount :=
    frmFODaftar.GrdPemeriksaan.rowcount + 1;
  frmFODaftar.GrdPemeriksaan.Cells[0, frmFODaftar.GrdPemeriksaan.rowcount - 2]
    := frmFODaftar.QTest.FieldByName('kode').AsString;
  frmFODaftar.GrdPemeriksaan.Cells[1, frmFODaftar.GrdPemeriksaan.rowcount - 2]
    := frmFODaftar.QTest.FieldByName('nama').AsString;

  // // ambil harga
  if frmFODaftar.QCheckTest.Active then
    frmFODaftar.QCheckTest.Active := False;
  frmFODaftar.QCheckTest.SQL.Text :=
    ' SELECT harga.id,IFNULL(harga.harga,0) harga FROM harga LEFT JOIN tipe_pasien ON harga.tipe_pasien_id = tipe_pasien.id LEFT JOIN urgency ON harga.urgency_id = urgency.id WHERE '
    + ' test_id = ' + QuotedStr(frmFODaftar.QTest.FieldByName('id').AsString) +
    ' AND tipe_pasien.id = ' + frmFODaftar.QTipePasien.FieldByName('id')
    .AsString + '  AND urgency.id = 1';
  frmFODaftar.QCheckTest.Active := True;

  if frmFODaftar.QCheckTest.RecordCount > 0 then
  begin

    // tambahkan ke grid
    frmFODaftar.GrdPemeriksaan.Cells[2, frmFODaftar.GrdPemeriksaan.rowcount - 2]
      := FormatFloat('#,##0.00',
      StrToFloat(frmFODaftar.QCheckTest.FieldByName('harga').AsString));
    frmFODaftar.GrdPemeriksaan.Cells[3, frmFODaftar.GrdPemeriksaan.rowcount -
      2] := 'N';
  end
  else
  begin
    frmFODaftar.GrdPemeriksaan.Cells[2, frmFODaftar.GrdPemeriksaan.rowcount - 2]
      := '0.00';
    frmFODaftar.GrdPemeriksaan.Cells[3, frmFODaftar.GrdPemeriksaan.rowcount -
      2] := 'N';
  end;

  // calculate total
  fTotal := 0;
  for I := 1 to frmFODaftar.GrdPemeriksaan.rowcount do
  begin
    tmpStr := frmFODaftar.GrdPemeriksaan.Cells[2, I];
    tmpStr := StringReplace(tmpStr, ',', '', [rfReplaceAll]);
    if tmpStr <> '' then
      fTotal := fTotal + StrToFloat(tmpStr);
  end;

  frmFODaftar.edSubTotal.Text := FormatFloat('#,##0.00', fTotal);

  // discount
  tmpStr := frmFODaftar.edDiscount.Text;
  tmpStr := StringReplace(tmpStr, ',', '', [rfReplaceAll]);
  frmFODaftar.edDiscAmount.Text := FormatFloat('#,##0.00',
    (fTotal * (StrToFloat(tmpStr) / 100)));
  frmFODaftar.edTotal.Text := FormatFloat('#,##0.00',
    StrToFloat(StringReplace(frmFODaftar.edSubTotal.Text, ',', '',
    [rfReplaceAll])) - StrToFloat(StringReplace(frmFODaftar.edDiscAmount.Text,
    ',', '', [rfReplaceAll])));

  loadInterview;
  frmFODaftar.CekReturOrBayar;

  frmFODaftar.HideMask;
end;

function frmFODaftar: TfrmFODaftar;
begin
  Result := TfrmFODaftar(UniMainModule.GetFormInstance(TfrmFODaftar));
end;

procedure DeleteRow(ARowIndex: Integer; AGrid: TUniStringGrid);
var
  I, J, arr_idx: Integer;
  kode: String;
begin
  with AGrid do
  begin
    BeginUpdate;
    if (ARowIndex = rowcount) then
      rowcount := rowcount - 1
    else
    begin
      for I := ARowIndex to rowcount - 2 do
        for J := 0 to ColCount - 1 do
          Cells[J, I] := Cells[J, I + 1];

      rowcount := rowcount - 1;
    end;
    EndUpdate;
  end;
  calculate_total();
  loadInterview;
end;

procedure TfrmFODaftar.btnCariDokterClick(Sender: TObject);
begin
  //
  if frmCariDokter.ShowModal = mrOK then
  begin
    edDokter.Text := frmCariDokter.QDokter.FieldByName('nama').AsString;
    edDokterId.Text := frmCariDokter.QDokter.FieldByName('id').AsString;
  end;
end;

procedure TfrmFODaftar.btnCariPasienClick(Sender: TObject);
begin
  if frmPasien.ShowModal() = mrOK then
  begin
    // showMessage(IntToStr(frmPasien.pasien_id));
    edNama.Text := frmPasien.QPasien.FieldByName('nama').AsString;
    edKelamin.Text := frmPasien.QPasien.FieldByName('kelamin').AsString;
    edUmur.Text := frmPasien.QPasien.FieldByName('umur').AsString;
    edAlamat.Text := frmPasien.QPasien.FieldByName('alamat').AsString;
    edTelp.Text := frmPasien.QPasien.FieldByName('telepon').AsString;
    edHp.Text := frmPasien.QPasien.FieldByName('hp').AsString;
    edPatientID.Text := frmPasien.QPasien.FieldByName('noreg').AsString;
    edPasienId.Text := frmPasien.QPasien.FieldByName('id').AsString;
    edJenisKelaminId.Text := frmPasien.QPasien.FieldByName
      ('jenis_kelamin_id').AsString;
  end;
end;

procedure TfrmFODaftar.edCariTestChange(Sender: TObject);
begin
  { if edCariTest.Text <> '' then
    begin
    if QTest.Active then
    QTest.Active := False;
    QTest.SQL.Text := 'SELECT id,kode,nama FROM TEST WHERE ada_harga=' +
    QuotedStr('Y') + ' AND ( UPPER(nama) LIKE ' +
    QuotedStr('%' + UpperCase(edCariTest.Text) + '%') + ' OR kode LIKE ' +
    QuotedStr('%' + UpperCase(edCariTest.Text) + '%') + ' ) ORDER BY kode';
    QTest.Active := True;
    end;
  }
end;

procedure TfrmFODaftar.edCariTestKeyPress(Sender: TObject; var Key: Char);
begin

  {
    if Key=VK_F1 then btnCariPasienClick(self);
    if Key=VK_F2 then btnCariDokterClick(self);
    if Key=VK_F3 then edTestClick(self);
    if Key=VK_F4 then btnDetailClick(self);
    if Key=VK_F5 then btnDeleteClick(self);
    if Key=VK_F6 then btnDiscountClick(self);
    if Key=VK_F7 then btnBayarClick(self);
    if Key=VK_F8 then btnClearClick(self);
    if Key=VK_F9 then btnNoRegClick(self);
    if Key=VK_ESCAPE then frmFODaftar.Close;
  }
  if (Ord(Key) = VK_RETURN) then
  begin
    AddTest();
  end;

end;

procedure TfrmFODaftar.edDiscAmountChange(Sender: TObject);
var
  fSubTotal, fDiscAmount, fDiscPer: Currency;
begin
  if edDiscAmount.Text <> '' then
  begin
    fSubTotal := StrToFloat(StringReplace(edSubTotal.Text, ',', '',
      [rfReplaceAll]));
    fDiscAmount := StrToFloat(StringReplace(edDiscAmount.Text, ',', '',
      [rfReplaceAll]));
    fDiscPer := fDiscAmount / fSubTotal * 100;
    edDiscount.Text := FormatFloat('#,##0.00', fDiscPer);
    edTotal.Text := FormatFloat('#,##0.00', fSubTotal - fDiscAmount);
  end;
end;

procedure TfrmFODaftar.edDiscAmountKeyPress(Sender: TObject; var Key: Char);
begin
  if (Ord(Key) = VK_RETURN) then
  begin
    edDiscAmount.Text := FormatFloat('#,##0.00',
      StrToFloat(StringReplace(edDiscAmount.Text, ',', '', [rfReplaceAll])));
  end;
end;

procedure TfrmFODaftar.edDiscountChange(Sender: TObject);
var
  fSubTotal, fDiscAmount: Currency;
begin
  if edDiscount.Text <> '' then
  begin
    fSubTotal := StrToFloat(StringReplace(edSubTotal.Text, ',', '',
      [rfReplaceAll]));
    fDiscAmount := fSubTotal * StrToFloat(edDiscount.Text) / 100;
    edDiscAmount.Text := FormatFloat('#,##0.00', fDiscAmount);
    edTotal.Text := FormatFloat('#,##0.00', fSubTotal - fDiscAmount);
  end;
end;

procedure TfrmFODaftar.edDiscountKeyPress(Sender: TObject; var Key: Char);
begin
  {
    if Ord(Key)=VK_F1 then btnCariPasienClick(self);
    if Ord(Key)=VK_F2 then btnCariDokterClick(self);
    if Ord(Key)=VK_F3 then edTestClick(self);
    if Ord(Key)=VK_F4 then btnDetailClick(self);
    if Ord(Key)=VK_F5 then btnDeleteClick(self);
    if Ord(Key)=VK_F6 then btnDiscountClick(self);
    if Ord(Key)=VK_F7 then btnBayarClick(self);
    if Ord(Key)=VK_F8 then btnClearClick(self);
    if Ord(Key)=VK_F9 then btnNoRegClick(self);
    if Ord(Key)=VK_ESCAPE then frmFODaftar.Close;
  }

  if (Ord(Key) = VK_RETURN) then
  begin
    btnBayar.SetFocus;
  end;
end;

procedure TfrmFODaftar.edPasienIdChange(Sender: TObject);
begin
  if edPasienId.Text <> '' then
  begin
    pcPasien.Pages[1].Visible := True;
    pcPasien.Pages[2].Visible := True;
  end
  else
  begin
    pcPasien.Pages[1].Visible := False;
    pcPasien.Pages[2].Visible := False;
  end;
end;

procedure TfrmFODaftar.edPatientIDKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F1 then
    btnCariPasienClick(self);
  if Key = VK_F2 then
    btnCariDokterClick(self);
  if Key = VK_F3 then
    edTestClick(self);
  if Key = VK_F4 then
    btnDetailClick(self);
  if (Key = VK_F5) or (Key = VK_DELETE) then
    btnDeleteClick(self);
  if Key = VK_F6 then
    btnDiscountClick(self);
  if Key = VK_F7 then
    btnBayarClick(self);
  if Key = VK_F8 then
    btnClearClick(self);
  if Key = VK_F9 then
    btnNoRegClick(self);
  if Key = VK_ESCAPE then
    frmFODaftar.Close;
end;

procedure TfrmFODaftar.GrdPemeriksaanDrawCell(Sender: TObject;
  ACol, ARow: Integer; var Value: string; Attribs: TUniCellAttribs);
begin
  if (ACol = 2) and (ARow <> 0) then
    Attribs.Style.Style := 'text-align: right;';
end;

procedure TfrmFODaftar.pnlFotoClick(Sender: TObject);
begin
  if edPasienId.Text <> '' then
  begin
    frmFotoPasien.pasien_id := StrToInt(edPasienId.Text);
    frmFotoPasien.call_from := 'pendaftaran';
    frmFotoPasien.ShowModal();
  end;
end;

procedure TfrmFODaftar.pnlFotoMouseEnter(Sender: TObject);
begin
  if edPasienId.Text <> '' then
    pnlFoto.Cursor := crHandPoint
  else
    pnlFoto.Cursor := crDefault;
end;

procedure TfrmFODaftar.UniButton1Click(Sender: TObject);
begin
  ShowMask('Loading');
  UniSession.Synchronize();
  if QPasien.Active then
    QPasien.Active := False;

  QPasien.Params.Clear;
  QPasien.Params.Add.Name := 'catatan';
  QPasien.Params.Add.Name := 'pasien_id';
  QPasien.SQL.Text :=
    'update pasien set catatan = :catatan where id = :pasien_id ';
  QPasien.ParamByName('catatan').Value := mmCatatanPasien.Lines.Text;
  QPasien.ParamByName('pasien_id').Value := edPasienId.Text;
  QPasien.ExecSQL;

  HideMask();
end;

procedure TfrmFODaftar.btnIntUpdClick(Sender: TObject);
begin
  if call_form = 'fo_status' then
  begin
    ShowMask('Loading');
    UniSession.Synchronize();
    if QPasien.Active then
      QPasien.Active := False;

    QPasien.Params.Clear;
    QPasien.Params.Add.Name := 'catatan';
    QPasien.Params.Add.Name := 'id';
    QPasien.SQL.Text :=
      'update order_header set catatan = :catatan where id = :id ';
    QPasien.ParamByName('catatan').Value := mmInternalNote.Lines.Text;
    QPasien.ParamByName('id').Value := order_id;
    QPasien.ExecSQL;

    HideMask();
  end;
end;

procedure TfrmFODaftar.uniDBGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F1 then
    btnCariPasienClick(self);
  if Key = VK_F2 then
    btnCariDokterClick(self);
  if Key = VK_F3 then
    edTestClick(self);
  if Key = VK_F4 then
    btnDetailClick(self);
  if (Key = VK_F5) or (Key = VK_DELETE) then
    btnDeleteClick(self);
  if Key = VK_F6 then
    btnDiscountClick(self);
  if Key = VK_F7 then
    btnBayarClick(self);
  if Key = VK_F8 then
    btnClearClick(self);
  if Key = VK_F9 then
    btnNoRegClick(self);
  if Key = VK_ESCAPE then
    frmFODaftar.Close;

  if Key = VK_RETURN then
    AddTest();

end;

procedure TfrmFODaftar.btnClearClick(Sender: TObject);
var
  I, J: Integer;
  thn, bln, tgl, jam, menit, detik, ms: Word;
begin
  decodetime(Now, jam, menit, detik, ms);
  edDokter.Text := '-';
  edSubTotal.Text := '0';
  edDiscount.Text := '0.00';
  edDiscAmount.Text := '0';
  edTotal.Text := '0';

  // pasien

  imFotoPasien.Picture.LoadFromFile(UniServerModule.FilesFolderPath +
    'foto-kosong.jpg');
  pcPasien.Pages[1].TabVisible := False;
  pcPasien.Pages[2].TabVisible := False;
  pcPasien.ActivePage.PageIndex := 0;
  edPasienId.Clear;
  edNama.Clear;
  edJenisKelaminId.Clear;
  edKelamin.Clear;
  edUmur.Clear;
  edAlamat.Clear;
  edTelp.Clear;
  edHp.Clear;
  edPatientID.Clear;

  // interview
  grdInterview.Cells[0, 0] := 'Pertanyaan';
  grdInterview.Cells[1, 0] := 'Jawaban';
  grdInterview.ColWidths[0] := 300;
  grdInterview.ColWidths[1] := 190;

  length_arr := 0;

  // order
  cbJanjiHasil.Checked := False;
  dtJanjiHasil.DateTime := IncDay(Now(), 1);
  dtJanjiHasil.Enabled := False;
  cbHasilEmail.Checked := False;
  edHasilEmail.Clear;
  edHasilEmail.Enabled := False;
  cbHasilWa.Checked := False;
  edHasilWa.Clear;
  edHasilWa.Enabled := False;
  mmInternalNote.Clear;

  cbTest.Text := '';
  cbPaket.Text := '';

  // test
  for I := 0 to GrdPemeriksaan.rowcount do
  begin
    for J := 0 to GrdPemeriksaan.ColCount do
      GrdPemeriksaan.Cells[J, I] := '';
  end;
  loadInterview;

  GrdPemeriksaan.ColCount := 4;
  GrdPemeriksaan.rowcount := 2;
  GrdPemeriksaan.Cells[0, 0] := 'Kode';
  GrdPemeriksaan.Cells[1, 0] := 'Pemeriksaan';
  GrdPemeriksaan.Cells[2, 0] := 'Harga';
  GrdPemeriksaan.Cells[3, 0] := 'Cito';
  GrdPemeriksaan.ColWidths[0] := 100;
  GrdPemeriksaan.ColWidths[1] := 300;
  GrdPemeriksaan.ColWidths[2] := 100;
  GrdPemeriksaan.ColWidths[3] := 50;

  // pnlSumary.Height := 90;
  lblUangMuka.Visible := False;
  edUangMuka.Visible := False;

  if jam > 14 then
    decodedatetime(IncDay(Now(), 1), thn, bln, tgl, jam, menit, detik, ms)
  else
    decodedatetime(Now(), thn, bln, tgl, jam, menit, detik, ms);
  dtJanjiHasil.DateTime := encodedatetime(thn, bln, tgl, 16, 0, 0, 0);

end;

procedure TfrmFODaftar.btnDetailClick(Sender: TObject);
begin
  GrdPemeriksaan.SetFocus;
  GrdPemeriksaan.Row := 1;
end;

procedure TfrmFODaftar.btnBayarClick(Sender: TObject);
var
  fTotal, fUangMuka: Currency;
begin

  frmBayar.Close;

  if edUangMuka.Text = '' then
    edUangMuka.Text := '0';

  fTotal := StrToFloat(StringReplace(edTotal.Text, ',', '', [rfReplaceAll]));
  fUangMuka := StrToFloat(StringReplace(edUangMuka.Text, ',', '',
    [rfReplaceAll]));

  if btnBayar.Caption = 'Batal' then
  begin
    // batal order
    if cmdExe.Active then
      cmdExe.Active := False;
    cmdExe.CommandText.Text := ' UPDATE order_header set flgBatal = ' +
      QuotedStr('Y') + ' WHERE id = ' + QuotedStr(order_id);
    cmdExe.Execute();
    frmFODaftar.Close;
    frmFOStatus.btnSearchClick(self);
    exit;

  end
  else if btnBayar.Caption = 'Retur' then
  begin
    frmBayar.call_form := call_form;

    if frmBayar.qJenisPemb.Active then
      frmBayar.qJenisPemb.Active := False;
    frmBayar.qJenisPemb.Active := True;
    frmBayar.cbJenis.ItemIndex := 0;
    frmBayar.edCharge.Text := '0';

    frmBayar.edTotalBayar.Text := FormatFloat('#,##0.00', fTotal - fUangMuka);
    frmBayar.edTotal.Text := FormatFloat('#,##0.00', fTotal - fUangMuka);
    frmBayar.edPembayaran.Text := '0';
    frmBayar.edSisa.Text := '0';
    frmBayar.edTagihan.Text := '0';

    // order sudah dibuat
    frmBayar.call_form := 'retur';
    if call_form = 'fo_status' then
    begin
      if QTmp.Active then
        QTmp.Active := False;
      QTmp.SQL.Text := ' SELECT * FROM order_header WHERE id = ' +
        QuotedStr(order_id);
      QTmp.Active := True;

      frmBayar.lblNoLab.Caption := 'No Lab : ' +
        QTmp.FieldByName('nomor').AsString;
      frmBayar.order_id := StrToInt(order_id);
      // frmBayar.order_hdr_id := StrToInt(order_id);
      frmBayar.call_form := 'fo_status';
    end;
    frmBayar.jenis_kelamin_id := jenis_kelamin_id;

    frmBayar.ShowModal;

  end
  else
  begin
    frmBayar.call_form := call_form;
    if frmBayar.qJenisPemb.Active then
      frmBayar.qJenisPemb.Active := False;
    frmBayar.qJenisPemb.Active := True;
    frmBayar.cbJenis.ItemIndex := 0;
    frmBayar.edCharge.Text := '0';

    if (edPasienId.Text <> '') and (edDokterId.Text <> '') then
    begin
      if (cbHasilEmail.Checked) and (edHasilEmail.Text = '') then
        showMessage('e-mail kosong.')
      else if (cbHasilWa.Checked) and (edHasilWa.Text = '') then
        showMessage('nomor whatsapp kosong.')
      else if checkInterviewKosong then
        showMessage('Jawaban interview masih kosong.')
      else if GrdPemeriksaan.rowcount > 2 then
      begin

        //
        // if edUangMuka.Text = '' then
        // edUangMuka.Text := '0';
        //
        // fTotal := StrToFloat(StringReplace(edTotal.Text, ',', '',
        // [rfReplaceAll]));
        // fUangMuka := StrToFloat(StringReplace(edUangMuka.Text, ',', '',
        // [rfReplaceAll]));

        // frmBayar.call_form := call_form;
        // if frmBayar.qJenisPemb.Active then
        // frmBayar.qJenisPemb.Active := False;
        // frmBayar.qJenisPemb.Active := True;
        // frmBayar.cbJenis.ItemIndex := 0;
        // frmBayar.edCharge.Text := '0';

        frmBayar.edTotalBayar.Text := FormatFloat('#,##0.00',
          fTotal - fUangMuka);
        frmBayar.edPembayaran.Text := '0';
        frmBayar.edSisa.Text := '0';
        frmBayar.edTagihan.Text := FormatFloat('#,##0.00', fUangMuka - fTotal);

        // order sudah dibuat
        frmBayar.call_form := 'fo_daftar';
        if call_form = 'fo_status' then
        begin
          if QTmp.Active then
            QTmp.Active := False;
          QTmp.SQL.Text := ' SELECT * FROM order_header WHERE id = ' +
            QuotedStr(order_id);
          QTmp.Active := True;

          frmBayar.lblNoLab.Caption := 'No Lab : ' +
            QTmp.FieldByName('nomor').AsString;
          frmBayar.order_id := StrToInt(order_id);
          // frmBayar.order_hdr_id := StrToInt(order_id);
          frmBayar.call_form := 'fo_status';
        end;
        frmBayar.jenis_kelamin_id := jenis_kelamin_id;

        frmBayar.ShowModal;
      end
      else
      begin
        showMessage('Pemeriksaan masih kosong.');
        // edCariTest.SetFocus;
      end;
    end
    else
    begin
      showMessage('Pasien dan/atau perujuk belum dipilih.');
    end;
  end;
end;

procedure TfrmFODaftar.edTestClick(Sender: TObject);
begin
  cbTest.SetFocus
end;

procedure TfrmFODaftar.btnDeleteClick(Sender: TObject);
begin
  if (GrdPemeriksaan.Row > 0) and
    (GrdPemeriksaan.Row < GrdPemeriksaan.rowcount - 1) then
  begin
    MessageDlg('Delete : ' + GrdPemeriksaan.Cells[0, GrdPemeriksaan.Row] + ' - '
      + GrdPemeriksaan.Cells[1, GrdPemeriksaan.Row], mtConfirmation, mbYesNo,
      DeleteTestCallback);
  end;
end;

procedure TfrmFODaftar.btnDiscountClick(Sender: TObject);
begin
  edDiscount.SetFocus;
end;

procedure TfrmFODaftar.btnEditPasienClick(Sender: TObject);
var
  blob: TStream;
  Bmp: TBitmap;
  Jpg: TJPEGImage;
begin
  if edPasienId.Text <> '' then
  begin
    frmPasienBaru.call_form := 'pendaftaran';
    if QEditPasien.Active then
      QEditPasien.Active := False;
    QEditPasien.SQL.Text :=
      'select p.*,k.nama as kelamin_nama,pf.nama as pf_nama, ag.nama agama, ';
    QEditPasien.SQL.Text := QEditPasien.SQL.Text +
      'TIMESTAMPDIFF( YEAR, p.tanggal_lahir, now() ) as th,TIMESTAMPDIFF( MONTH, p.tanggal_lahir, now() ) % 12 as bl,FLOOR( TIMESTAMPDIFF( DAY, p.tanggal_lahir, now() ) % 30.4375 ) as hr ';
    QEditPasien.SQL.Text := QEditPasien.SQL.Text +
      ' from  pasien p, jenis_kelamin k, prefix pf, agama ag where p.id = ' +
      edPasienId.Text +
      ' and p.jenis_kelamin_id = k.id and p.prefix_id = pf.id and p.agama_id = ag.id   ';

    // ShowMessage(QEditPasien.SQL.Text);

    QEditPasien.Active := True;

    frmPasienBaru.pasien_id := QEditPasien.FieldByName('id').AsString;
    frmPasienBaru.edNama.Text := QEditPasien.FieldByName('nama').AsString;
    frmPasienBaru.edTelepon.Text := QEditPasien.FieldByName('telepon').AsString;
    frmPasienBaru.edHp.Text := QEditPasien.FieldByName('hp').AsString;
    frmPasienBaru.edEmail.Text := QEditPasien.FieldByName('email').AsString;
    frmPasienBaru.edNoKTP.Text := QEditPasien.FieldByName('no_ktp').AsString;
    frmPasienBaru.memoAlamat.Lines.Text :=
      QEditPasien.FieldByName('alamat').AsString;
    frmPasienBaru.edGoldar.Text := QEditPasien.FieldByName('gol_darah')
      .AsString;
    frmPasienBaru.edRhesus.Text := QEditPasien.FieldByName('rhesus').AsString;
    frmPasienBaru.edTglLahir.DateTime := QEditPasien.FieldByName
      ('tanggal_lahir').AsDateTime;

    frmPasienBaru.edThn.Text := QEditPasien.FieldByName('th').AsString;
    frmPasienBaru.edBln.Text := QEditPasien.FieldByName('bl').AsString;
    frmPasienBaru.edHr.Text := QEditPasien.FieldByName('hr').AsString;

    // agama
    frmPasienBaru.QAgama.Open;
    frmPasienBaru.QWilayah.Open;

    // foto
    if frmPasienBaru.QFoto.Active then
      frmPasienBaru.QFoto.Active := False;
    frmPasienBaru.QFoto.Params.Clear;
    frmPasienBaru.QFoto.Params.Add.Name := 'pasien_id';
    frmPasienBaru.QFoto.SQL.Text :=
      'select photo from pasien_photo where pasien_id = :pasien_id ';
    frmPasienBaru.QFoto.ParamByName('pasien_id').Value :=
      QEditPasien.FieldByName('id').AsString;
    frmPasienBaru.QFoto.Active := True;

    if frmPasienBaru.QFoto.RecordCount > 0 then
    begin
      Bmp := TBitmap.Create;
      blob := frmPasienBaru.QFoto.CreateBlobStream
        (frmPasienBaru.QFoto.FieldByName('photo'), bmRead);
      try
        Jpg := TJPEGImage.Create;
        try
          Jpg.LoadFromStream(blob);
          Bmp.Assign(Jpg);
          frmPasienBaru.imFoto.Assign(Bmp);
        finally
          Jpg.Free;
        end;
      finally
        blob.Free;
      end;
      Bmp.Free;
    end;

    frmPasienBaru.mmCatatan.Lines.Text :=
      QEditPasien.FieldByName('catatan').AsString;

    if frmPasienBaru.QPrefik.Active then
      frmPasienBaru.QPrefik.Active := False;
    frmPasienBaru.QPrefik.Active := True;
    if frmPasienBaru.QKelamin.Active then
      frmPasienBaru.QKelamin.Active := False;
    frmPasienBaru.QKelamin.Active := True;

    frmPasienBaru.pf_nama := QEditPasien.FieldByName('pf_nama').AsString;
    frmPasienBaru.kelamin_nama := QEditPasien.FieldByName
      ('kelamin_nama').AsString;
    frmPasienBaru.agama_nama := QEditPasien.FieldByName('agama').AsString;
    frmPasienBaru.wilayah_nama := QEditPasien.FieldByName('wilayah').AsString;

    frmPasienBaru.ShowModal();

  end
  else
  begin
    showMessage('Pilih dulu pasien yang ingin di edit. (F1)');
    btnCariPasien.SetFocus;
  end;
end;

procedure TfrmFODaftar.btnNoRegClick(Sender: TObject);
begin
  edPatientID.SetFocus;
end;

procedure TfrmFODaftar.btnPTerakhirClick(Sender: TObject);
var
  I, J: Integer;
  mId: String;
  fTotal: Currency;
  tmpStr: String;
  RepUrl, Result: string;
  formatSettings: TFormatSettings;
begin
  ShowMask('Loading');
  UniSession.Synchronize();
  if btnPTerakhir.Caption = 'F10 Cetak Copy Nota' then
  begin

    if QNotaCopy.Active then
      QNotaCopy.Active := False;

    QNotaCopy.ParamByName('header_id').AsString := order_hdr_id;
    QNotaCopy.Active := True;

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

    // frmReportDisplay.UniURLFrame1.URL := Result;
    // frmReportDisplay.ShowModal();

    UniSession.AddJS(printKuitansi(Result));

  end
  else
  begin

    if edPasienId.Text <> '' then
    begin
      if QPTerakhir.Active then
        QPTerakhir.Active := False;
      QPTerakhir.SQL.Text :=
        'select max(id) as mId from order_header where pasien_id = ' +
        QuotedStr(edPasienId.Text) + ' and flgBatal = ' + QuotedStr('N') + ' ';
      QPTerakhir.Active := True;
      mId := QPTerakhir.FieldByName('mId').AsString;
      if mId <> '' then
      begin

        for I := 0 to frmFODaftar.GrdPemeriksaan.rowcount do
        begin
          for J := 0 to frmFODaftar.GrdPemeriksaan.ColCount do
            frmFODaftar.GrdPemeriksaan.Cells[J, I] := '';

        end;

        frmFODaftar.GrdPemeriksaan.ColCount := 4;
        frmFODaftar.GrdPemeriksaan.rowcount := 2;
        frmFODaftar.GrdPemeriksaan.Cells[0, 0] := 'Kode';
        frmFODaftar.GrdPemeriksaan.Cells[1, 0] := 'Pemeriksaan';
        frmFODaftar.GrdPemeriksaan.Cells[2, 0] := 'Harga';
        frmFODaftar.GrdPemeriksaan.Cells[3, 0] := 'Cito';
        frmFODaftar.GrdPemeriksaan.ColWidths[0] := 100;
        frmFODaftar.GrdPemeriksaan.ColWidths[1] := 300;
        frmFODaftar.GrdPemeriksaan.ColWidths[2] := 100;
        frmFODaftar.GrdPemeriksaan.ColWidths[3] := 50;

        if QPTerakhir.Active then
          QPTerakhir.Active := False;
        QPTerakhir.SQL.Text :=
          'select d.test_id from order_detail d, test t where d.test_id = t.id and t.ada_harga='
          + QuotedStr('Y') + ' and header_id = ' + QuotedStr(mId);
        QPTerakhir.Active := True;

        while not QPTerakhir.Eof do
        begin
          if QPTerakhirDtl.Active then
            QPTerakhirDtl.Active := False;
          QPTerakhirDtl.SQL.Text :=
            'select t.*,rt.flg_multi from test t left join ref_test rt on t.ref_test_id = rt.id where t.id = '
            + QPTerakhir.FieldByName('test_id').AsString + ' ';
          QPTerakhirDtl.Active := True;

          // tambahkan ke grid
          GrdPemeriksaan.rowcount := GrdPemeriksaan.rowcount + 1;
          GrdPemeriksaan.Cells[0, GrdPemeriksaan.rowcount - 2] :=
            QPTerakhirDtl.FieldByName('kode').AsString;
          frmFODaftar.GrdPemeriksaan.Cells[1, GrdPemeriksaan.rowcount - 2] :=
            QPTerakhirDtl.FieldByName('nama').AsString;

          if QPTerakhirDtl.Active then
            QPTerakhirDtl.Active := False;
          QPTerakhirDtl.SQL.Text :=
            'select * from harga where tipe_pasien_id = 1 and urgency_id = 1 and test_id = '
            + QPTerakhir.FieldByName('test_id').AsString + ' ';
          QPTerakhirDtl.Active := True;

          // tambahkan ke grid
          frmFODaftar.GrdPemeriksaan.Cells[2, GrdPemeriksaan.rowcount - 2] :=
            FormatFloat('#,##0.00',
            StrToFloat(QPTerakhirDtl.FieldByName('harga').AsString));
          // if cbCito.ItemIndex = frmFODaftar.cbCito.Items.IndexOf('NORMAL')
          // then
          GrdPemeriksaan.Cells[3, GrdPemeriksaan.rowcount - 2] := 'N';
          // else
          // GrdPemeriksaan.Cells[3, GrdPemeriksaan.RowCount - 2] := 'Y';

          // calculate total
          fTotal := 0;
          for I := 1 to GrdPemeriksaan.rowcount do
          begin
            tmpStr := GrdPemeriksaan.Cells[2, I];
            tmpStr := StringReplace(tmpStr, ',', '', [rfReplaceAll]);
            if tmpStr <> '' then
              fTotal := fTotal + StrToFloat(tmpStr);
          end;

          edSubTotal.Text := FormatFloat('#,##0.00', fTotal);

          // discount
          tmpStr := edDiscount.Text;
          tmpStr := StringReplace(tmpStr, ',', '', [rfReplaceAll]);
          edDiscAmount.Text := FormatFloat('#,##0.00',
            (fTotal * (StrToFloat(tmpStr) / 100)));
          edTotal.Text := FormatFloat('#,##0.00',
            StrToFloat(StringReplace(edSubTotal.Text, ',', '', [rfReplaceAll]))
            - StrToFloat(StringReplace(edDiscAmount.Text, ',', '',
            [rfReplaceAll])));

          // select n.*,s.konversi from nilai_normal n  left join satuan_umur s on n.umur_satuan_id = s.id  where test_id=207 order by flg_kelamin_umur desc, flg_umur desc, flg_kelamin desc ,flg_text desc
          // n.*,s.konversi from nilai_normal n  left join satuan_umur s on n.umur_satuan_id = s.id  where test_id=207 order by flg_kelamin_umur desc, flg_umur desc, flg_kelamin desc ,flg_text desc
          // select * from nilai_normal where id =207
          // select * from harga where tipe_pasien_id=1 and urgency_id=1 and test_id=207

          QPTerakhir.Next;
        end;

      end;
      loadInterview;
    end;

  end;
  HideMask;
end;

procedure TfrmFODaftar.btnTglSelesaiClick(Sender: TObject);
begin
  frmTanggalSelesai.ShowModal();
end;

procedure TfrmFODaftar.btnUpdateClick(Sender: TObject);
var
  I: Integer;
begin
  if call_form = 'fo_status' then
  begin
    ShowMask('Loading');
    UniSession.Synchronize();
    try
      UniMainModule.FDConnection1.StartTransaction;

      /// /////////////////////////////////////////////////////////
      /// Aditional informasi order: janji hasil dan interview
      /// ////////////////////////////////////////////////////////
      // catatan
      FDcmd.Params.Clear;
      FDcmd.Params.Add.Name := 'catatan';
      FDcmd.Params.Add.Name := 'id';
      FDcmd.CommandText.Text :=
        'UPDATE order_header SET catatan = :catatan WHERE id = :id ';
      FDcmd.ParamByName('catatan').Value :=
        frmFODaftar.mmInternalNote.Lines.Text;
      FDcmd.ParamByName('id').Value := order_id;
      FDcmd.Execute();

      if frmFODaftar.mmInternalNote.Lines.Text <> '' then
        insertLog(StrToInt(order_id), 'update catatan [' +
          frmFODaftar.mmInternalNote.Lines.Text + ']');

      // clear dulu jika ada yang sebelumnya
      FDcmd.Params.Clear;
      FDcmd.Params.Add.Name := 'header_id';
      FDcmd.CommandText.Text :=
        'DELETE FROM order_pengiriman_hasil WHERE header_id = :header_id ';
      FDcmd.ParamByName('header_id').Value := order_id;
      FDcmd.Execute();

      FDcmd.Params.Clear;
      FDcmd.Params.Add.Name := 'header_id';
      FDcmd.CommandText.Text :=
        'DELETE FROM order_interview WHERE header_id = :header_id ';
      FDcmd.ParamByName('header_id').Value := order_id;
      FDcmd.Execute();

      // janji hasil
      if frmFODaftar.cbJanjiHasil.Checked then
      begin
        FDcmd.Params.Clear;
        FDcmd.Params.Add.Name := 'tgl_ambil_hasil';
        FDcmd.Params.Add.Name := 'id';
        FDcmd.CommandText.Text :=
          'UPDATE order_header SET tgl_ambil_hasil = :tgl_ambil_hasil WHERE id = :id ';
        FDcmd.ParamByName('tgl_ambil_hasil').FDDataType := dtDateTimeStamp;
        FDcmd.ParamByName('tgl_ambil_hasil').Value :=
          frmFODaftar.dtJanjiHasil.DateTime;
        FDcmd.ParamByName('id').Value := order_id;
        FDcmd.Execute();
        // log
        insertLog(StrToInt(order_id), 'update tgl_ambil_hasil [' +
          formatdatetime('c', dtJanjiHasil.DateTime) + ']');
      end;

      // // email
      if frmFODaftar.cbHasilEmail.Checked then
      begin
        FDcmd.Params.Clear;
        FDcmd.Params.Add.Name := 'header_id';
        FDcmd.ParamByName('header_id').Value := order_id;
        FDcmd.Params.Add.Name := 'metode';
        FDcmd.Params.Add.Name := 'data';
        FDcmd.CommandText.Text :=
          'INSERT INTO order_pengiriman_hasil (header_id,metode,data) VALUES (:header_id,:metode,:data)';
        FDcmd.ParamByName('metode').Value := 'email';
        FDcmd.ParamByName('data').Value := frmFODaftar.edHasilEmail.Text;
        FDcmd.Execute();
        // log
        insertLog(StrToInt(order_id), 'update email [' +
          frmFODaftar.edHasilEmail.Text + ']');
      end;

      // whatsapp
      if frmFODaftar.cbHasilWa.Checked then
      begin
        FDcmd.Params.Clear;
        FDcmd.Params.Add.Name := 'header_id';
        FDcmd.ParamByName('header_id').Value := order_id;
        FDcmd.Params.Add.Name := 'metode';
        FDcmd.Params.Add.Name := 'data';
        FDcmd.CommandText.Text :=
          'INSERT INTO order_pengiriman_hasil (header_id,metode,data) VALUES (:header_id,:metode,:data)';
        FDcmd.ParamByName('metode').Value := 'whatsapp';
        FDcmd.ParamByName('data').Value := frmFODaftar.edHasilWa.Text;
        FDcmd.Execute();
        // log
        insertLog(StrToInt(order_id), 'update whatsapp [' +
          frmFODaftar.edHasilWa.Text + ']');
      end;

      // ambil sendiri
      if frmFODaftar.cbHasilAmbil.Checked then
      begin
        FDcmd.Params.Clear;
        FDcmd.Params.Add.Name := 'header_id';
        FDcmd.ParamByName('header_id').Value := order_id;
        FDcmd.Params.Add.Name := 'metode';
        FDcmd.Params.Add.Name := 'data';
        FDcmd.CommandText.Text :=
          'INSERT INTO order_pengiriman_hasil (header_id,metode,data) VALUES (:header_id,:metode,:data)';
        FDcmd.ParamByName('metode').Value := 'ambil';
        FDcmd.ParamByName('data').Value := '';
        FDcmd.Execute();
        // log
        insertLog(StrToInt(order_id), 'update ambil [True]');
      end;

      // perujuk
      if frmFODaftar.cbKirimPerujuk.Checked then
      begin
        FDcmd.Params.Clear;
        FDcmd.Params.Add.Name := 'header_id';
        FDcmd.ParamByName('header_id').Value := order_id;
        FDcmd.Params.Add.Name := 'metode';
        FDcmd.Params.Add.Name := 'data';
        FDcmd.CommandText.Text :=
          'INSERT INTO order_pengiriman_hasil (header_id,metode,data) VALUES (:header_id,:metode,:data)';
        FDcmd.ParamByName('metode').Value := 'perujuk';
        FDcmd.ParamByName('data').Value := frmFODaftar.edDokter.Text;
        FDcmd.Execute();
        // log
        insertLog(StrToInt(order_id), 'update perujuk [' + edDokter.Text + ']');
      end;

      // rumah
      if frmFODaftar.cbKirimRumah.Checked then
      begin
        FDcmd.Params.Clear;
        FDcmd.Params.Add.Name := 'header_id';
        FDcmd.ParamByName('header_id').Value := order_id;
        FDcmd.Params.Add.Name := 'metode';
        FDcmd.Params.Add.Name := 'data';
        FDcmd.CommandText.Text :=
          'INSERT INTO order_pengiriman_hasil (header_id,metode,data) VALUES (:header_id,:metode,:data)';
        FDcmd.ParamByName('metode').Value := 'rumah';
        FDcmd.ParamByName('data').Value := '';
        FDcmd.Execute();
        // log
        insertLog(StrToInt(order_id), 'update rumah [' + edDokter.Text + ']');
      end;

      // pasien
      if edPasienId.Text <> '' then
      begin
        FDcmd.Params.Clear;
        FDcmd.Params.Add.Name := 'header_id';
        FDcmd.ParamByName('header_id').Value := order_id;
        FDcmd.Params.Add.Name := 'pasien_id';
        FDcmd.ParamByName('pasien_id').Value := edPasienId.Text;
        FDcmd.CommandText.Text :=
          'update order_header set pasien_id = :pasien_id where id = :header_id ';
        FDcmd.Execute();
        // log
        insertLog(StrToInt(order_id), 'update pasien_id [' +
          edPasienId.Text + ']');
      end;

      // dokter
      if edDokterId.Text <> '' then
      begin
        FDcmd.Params.Clear;
        FDcmd.Params.Add.Name := 'header_id';
        FDcmd.ParamByName('header_id').Value := order_id;
        FDcmd.Params.Add.Name := 'dokter_id';
        FDcmd.ParamByName('dokter_id').Value := edPasienId.Text;
        FDcmd.CommandText.Text :=
          'update order_header set dokter_id = :dokter_id where id = :header_id ';
        FDcmd.Execute();
        // log
        insertLog(StrToInt(order_id), 'update dokter_id [' +
          edDokterId.Text + ']');
      end;

      // interview
      for I := 1 to frmFODaftar.grdInterview.rowcount do
      begin
        if frmFODaftar.grdInterview.Cells[0, I] <> '' then
        begin
          FDcmd.Params.Clear;
          FDcmd.Params.Add.Name := 'header_id';
          FDcmd.ParamByName('header_id').Value := order_id;
          FDcmd.Params.Add.Name := 'pertanyaan';
          FDcmd.Params.Add.Name := 'jawaban';
          FDcmd.Params.Add.Name := 'user_id';
          FDcmd.ParamByName('user_id').Value := UniApplication.Cookies.GetCookie
            ('UserId');
          FDcmd.CommandText.Text :=
            'INSERT INTO order_interview (header_id,pertanyaan,jawaban,user_id) VALUES (:header_id,:pertanyaan,:jawaban,:user_id)';
          FDcmd.ParamByName('pertanyaan').Value :=
            frmFODaftar.grdInterview.Cells[0, I];
          FDcmd.ParamByName('jawaban').Value :=
            frmFODaftar.grdInterview.Cells[1, I];
          FDcmd.Execute();
          // log
          insertLog(StrToInt(order_id), 'update interview [' +
            frmFODaftar.grdInterview.Cells[0, I] + '] [' +
            frmFODaftar.grdInterview.Cells[1, I] + ']');
        end;
      end;
      UniMainModule.FDConnection1.Commit;
      showMessage('Update sukses.');

    except
      UniMainModule.FDConnection1.Rollback;
      raise;

    end;
    HideMask;
  end;

end;

procedure TfrmFODaftar.cbTestKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    AddTest();
    cbTest.Text := '';
  end;
  if (Key = VK_F1) and btnCariPasien.Enabled then
    btnCariPasienClick(self);
  if Key = VK_F2 then
    btnCariDokterClick(self);
  if Key = VK_F3 then
    edTestClick(self);
  if Key = VK_F4 then
    btnDetailClick(self);
  if (Key = VK_F5) or (Key = VK_DELETE) then
    btnDeleteClick(self);
  if Key = VK_F6 then
    btnDiscountClick(self);
  if (Key = VK_F7) and btnBayar.Enabled then
    btnBayarClick(self);
  if Key = VK_F8 then
    btnClearClick(self);
  if Key = VK_F9 then
    btnNoRegClick(self);
  if Key = VK_F11 then
    btnEditPasienClick(self);
  if Key = VK_F12 then
    btnTglSelesaiClick(self);
  if Key = VK_ESCAPE then
    frmFODaftar.Close;
end;

procedure TfrmFODaftar.cbTipePasienChangeValue(Sender: TObject);
begin
  if not(call_form = 'fo_status') then
  begin
    if GrdPemeriksaan.rowcount > 2 then
    begin
      MessageDlg('Pergantian Tipe Pasien, harga akan di clear.', mtInformation,
        [mbOk], ClearTestCallback);
    end;
  end;

end;

procedure TfrmFODaftar.cbHasilEmailChange(Sender: TObject);
begin
  if cbHasilEmail.Checked then
  begin
    edHasilEmail.Enabled := True;
  end
  else
  begin
    edHasilEmail.Enabled := False;
  end;
end;

procedure TfrmFODaftar.cbHasilWaChange(Sender: TObject);
begin
  if cbHasilWa.Checked then
  begin
    edHasilWa.Enabled := True;
  end
  else
  begin
    edHasilWa.Enabled := False;
  end;
end;

procedure TfrmFODaftar.cbJanjiHasilChange(Sender: TObject);
begin
  if cbJanjiHasil.Checked then
  begin
    dtJanjiHasil.Enabled := True;
  end
  else
  begin
    dtJanjiHasil.Enabled := False;
  end;
end;

procedure TfrmFODaftar.cbPaketSelect(Sender: TObject);
var
  I, J: Integer;
  fTotal: Currency;
  tmpStr: String;
  formatSettings: TFormatSettings;
begin
  ShowMask('Loading');
  UniSession.Synchronize();

  for I := 0 to frmFODaftar.GrdPemeriksaan.rowcount do
  begin
    for J := 0 to frmFODaftar.GrdPemeriksaan.ColCount do
      frmFODaftar.GrdPemeriksaan.Cells[J, I] := '';

  end;

  frmFODaftar.GrdPemeriksaan.ColCount := 4;
  frmFODaftar.GrdPemeriksaan.rowcount := 2;
  frmFODaftar.GrdPemeriksaan.Cells[0, 0] := 'Kode';
  frmFODaftar.GrdPemeriksaan.Cells[1, 0] := 'Pemeriksaan';
  frmFODaftar.GrdPemeriksaan.Cells[2, 0] := 'Harga';
  frmFODaftar.GrdPemeriksaan.Cells[3, 0] := 'Cito';
  frmFODaftar.GrdPemeriksaan.ColWidths[0] := 100;
  frmFODaftar.GrdPemeriksaan.ColWidths[1] := 300;
  frmFODaftar.GrdPemeriksaan.ColWidths[2] := 100;
  frmFODaftar.GrdPemeriksaan.ColWidths[3] := 50;

  if QPaketDetail.Active then
    QPaketDetail.Active := False;
  QPaketDetail.ParamByName('panel_header_id').Value := QPaket.FieldByName('id')
    .AsInteger;
  // QPaketDetail.ParamByName('urgency_id').Value := 1;
  // QPaketDetail.ParamByName('tipe_pasien_id').Value := 1;
  QPaketDetail.Active := True;

  GetLocaleFormatSettings(LOCALE_SYSTEM_DEFAULT, formatSettings);

  QPaketDetail.First;
  while not QPaketDetail.Eof do
  begin

    // tambahkan ke grid
    frmFODaftar.GrdPemeriksaan.rowcount :=
      frmFODaftar.GrdPemeriksaan.rowcount + 1;
    frmFODaftar.GrdPemeriksaan.Cells[0, frmFODaftar.GrdPemeriksaan.rowcount - 2]
      := QPaketDetail.FieldByName('kode').AsString;
    frmFODaftar.GrdPemeriksaan.Cells[1, frmFODaftar.GrdPemeriksaan.rowcount - 2]
      := QPaketDetail.FieldByName('nama').AsString;

    // tambahkan ke grid
    frmFODaftar.GrdPemeriksaan.Cells[2, frmFODaftar.GrdPemeriksaan.rowcount - 2]
      := FormatFloat('#,##0.00', StrToFloat(QPaketDetail.FieldByName('harga')
      .AsString));
    frmFODaftar.GrdPemeriksaan.Cells[3, frmFODaftar.GrdPemeriksaan.rowcount -
      2] := 'N';
    QPaketDetail.Next;
  end;
  // calculate total
  fTotal := 0;
  for I := 1 to frmFODaftar.GrdPemeriksaan.rowcount do
  begin
    tmpStr := frmFODaftar.GrdPemeriksaan.Cells[2, I];
    tmpStr := StringReplace(tmpStr, ',', '', [rfReplaceAll]);
    if tmpStr <> '' then
      fTotal := fTotal + StrToFloat(tmpStr);
  end;

  frmFODaftar.edSubTotal.Text := FormatFloat('#,##0.00', fTotal);

  if QPaket.FieldByName('disc_pct').AsInteger > 0 then
  begin
    edDiscount.Text := QPaket.FieldByName('disc_pct').AsString;
    calculate_total();
  end
  else

    if QPaket.FieldByName('disc_amount').AsInteger > 0 then
  begin
    edDiscAmount.Text := FormatFloat('#,##0.00',
      QPaket.FieldByName('disc_amount').AsFloat);
    edDiscAmountChange(self);
  end
  else
  begin
    edDiscount.Text := '0.00';
  end;

  loadInterview;
  calculate_total;
  HideMask;

end;

procedure TfrmFODaftar.UniFormAfterShow(Sender: TObject);
begin
  if call_form = 'fo_status' then
  begin
    cbTipePasien.ItemIndex := cbTipePasien.Items.IndexOf(tipe_pasien);
  end;

end;

procedure TfrmFODaftar.UniFormBeforeShow(Sender: TObject);
var
  blob: TStream;
  Bmp: TBitmap;
  Jpg: TJPEGImage;
  thn, bln, tgl, jam, menit, detik, ms: Word;
begin
  // QTipePasien.Open;
  if QTipePasien.Active then
    QTipePasien.Active := False;
  QTipePasien.ParamByName('organisasi_id').Value :=
    UniApplication.Cookies.GetCookie('OrganisasiId');
  QTipePasien.Active := True;

  decodetime(Now, jam, menit, detik, ms);
  if jam > 14 then
    decodedatetime(IncDay(Now(), 1), thn, bln, tgl, jam, menit, detik, ms)
  else
    decodedatetime(Now(), thn, bln, tgl, jam, menit, detik, ms);
  dtJanjiHasil.DateTime := encodedatetime(thn, bln, tgl, 16, 0, 0, 0);

  imFotoPasien.Picture.LoadFromFile(UniServerModule.FilesFolderPath +
    'foto-kosong.jpg');
  pcPasien.Pages[1].TabVisible := False;
  pcPasien.Pages[2].TabVisible := False;
  pcPasien.ActivePage.PageIndex := 0;
  //
  grdInterview.Cells[0, 0] := 'Pertanyaan';
  grdInterview.Cells[1, 0] := 'Jawaban';
  grdInterview.ColWidths[0] := 300;
  grdInterview.ColWidths[1] := 190;

  length_arr := 0;
  btnIntUpd.Visible := False;

  tgl_hasil := Now;
  if call_form = 'home_service' then
  begin
    btnCariPasien.Enabled := False;
    edDokter.Text := '-';
    edSubTotal.Text := '0';
    edDiscount.Text := '0.00';
    edDiscAmount.Text := '0';
    edTotal.Text := '0';
  end
  else if call_form = 'fo_status' then
  begin
    btnUpdate.Visible := True;
    btnIntUpd.Visible := True;
    // demog
    if QPasien.Active then
      QPasien.Active := False;
    QPasien.Params.Clear;
    QPasien.Params.Add.Name := 'id';
    QPasien.SQL.Text :=
      'SELECT p.id,p.noreg,p.nama,p.jenis_kelamin_id,jk.nama kelamin,p.alamat,p.telepon,p.hp,'
      + 'CONCAT(TIMESTAMPDIFF( YEAR, p.tanggal_lahir, now() ),' +
      QuotedStr(' th ') +
      ',TIMESTAMPDIFF( MONTH, p.tanggal_lahir, now() ) % 12,' +
      QuotedStr(' bl ') +
      ',FLOOR( TIMESTAMPDIFF( DAY, p.tanggal_lahir, now() ) % 30.4375 )) as umur '
      + 'FROM order_header oh LEFT JOIN pasien p on oh.pasien_id = p.id ' +
      'LEFT JOIN jenis_kelamin jk ON p.jenis_kelamin_id = jk.id WHERE oh.id = :id';
    QPasien.ParamByName('id').Value := order_id;
    QPasien.Active := True;
    pasien_id := QPasien.FieldByName('id').AsString;
    edPasienId.Text := QPasien.FieldByName('id').AsString;
    edNama.Text := QPasien.FieldByName('nama').AsString;
    edKelamin.Text := QPasien.FieldByName('kelamin').AsString;
    edAlamat.Text := QPasien.FieldByName('alamat').AsString;
    edTelp.Text := QPasien.FieldByName('telepon').AsString;
    edHp.Text := QPasien.FieldByName('hp').AsString;
    edPatientID.Text := QPasien.FieldByName('noreg').AsString;
    edUmur.Text := QPasien.FieldByName('umur').AsString;
    jenis_kelamin_id := QPasien.FieldByName('jenis_kelamin_id').AsString;

    // foto
    if QPasien.Active then
      QPasien.Active := False;
    QPasien.Params.Clear;
    QPasien.Params.Add.Name := 'id';
    QPasien.SQL.Clear;
    QPasien.SQL.Text := 'SELECT photo FROM pasien_photo WHERE pasien_id = :id ';
    QPasien.ParamByName('id').Value := pasien_id;
    QPasien.Active := True;
    if QPasien.RecordCount > 0 then
    begin
      Bmp := TBitmap.Create;
      blob := QPasien.CreateBlobStream(QPasien.FieldByName('photo'), bmRead);
      try
        Jpg := TJPEGImage.Create;
        try
          Jpg.LoadFromStream(blob);
          Bmp.Assign(Jpg);
          imFotoPasien.Assign(Bmp);
        finally
          Jpg.Free;
        end;
      finally
        blob.Free;
      end;
      Bmp.Free;
    end;

    // order demog
    if QOrder.Active then
      QOrder.Active := False;
    QOrder.Params.Clear;
    QOrder.Params.Add.Name := 'id';
    QOrder.SQL.Clear;
    QOrder.SQL.Text :=
      'SELECT oh.id, oh.dokter_id, d.nama dokter, oh.sub_total, oh.disc_pct, oh.disc_amount,oh.total,oh.tgl_ambil_hasil,oh.catatan,oh.tipe_pasien_id, tp.nama tipe_pasien '
      + ' FROM order_header oh ' +
      ' LEFT JOIN dokter d ON oh.dokter_id = d.id left join tipe_pasien tp on oh.tipe_pasien_id = tp.id '
      + ' WHERE oh.id = :id ';
    QOrder.ParamByName('id').Value := order_id;
    QOrder.Active := True;
    tipe_pasien := QOrder.FieldByName('tipe_pasien').AsString;
    edDokterId.Text := QOrder.FieldByName('dokter_id').AsString;
    edDokter.Text := QOrder.FieldByName('dokter').AsString;
    edSubTotal.Text := FormatFloat('#,##0.00',
      StrToFloat(QOrder.FieldByName('sub_total').AsString));
    edDiscount.Text := FormatFloat('#,##0.00',
      StrToFloat(QOrder.FieldByName('disc_pct').AsString));
    edDiscAmount.Text := FormatFloat('#,##0.00',
      StrToFloat(QOrder.FieldByName('disc_amount').AsString));
    edTotal.Text := FormatFloat('#,##0.00',
      StrToFloat(QOrder.FieldByName('total').AsString));
    mmInternalNote.Lines.Text := QOrder.FieldByName('catatan').AsString;
    if QOrder.FieldByName('tgl_ambil_hasil').AsString > '0000-00-00 00:00:00'
    then
    begin
      cbJanjiHasil.Checked := True;
      dtJanjiHasil.Enabled := True;
      dtJanjiHasil.DateTime := QOrder.FieldByName('tgl_ambil_hasil').AsDateTime;
    end;

    // janji hasil
    if QOrder.Active then
      QOrder.Active := False;
    QOrder.Params.Clear;
    QOrder.Params.Add.Name := 'id';
    QOrder.SQL.Clear;
    QOrder.SQL.Text :=
      'SELECT metode,data FROM order_pengiriman_hasil WHERE header_id = :id ';
    QOrder.ParamByName('id').Value := order_id;
    QOrder.Active := True;
    QOrder.First;
    while not QOrder.Eof do
    begin
      if QOrder.FieldByName('metode').AsString = 'ambil' then
        cbHasilAmbil.Checked := True;
      if QOrder.FieldByName('metode').AsString = 'perujuk' then
        cbKirimPerujuk.Checked := True;
      if QOrder.FieldByName('metode').AsString = 'rumah' then
        cbKirimRumah.Checked := True;
      if QOrder.FieldByName('metode').AsString = 'email' then
      begin
        cbHasilEmail.Checked := True;
        edHasilEmail.Enabled := True;
        edHasilEmail.Text := QOrder.FieldByName('data').AsString;
      end;
      if QOrder.FieldByName('metode').AsString = 'whatsapp' then
      begin
        cbHasilWa.Checked := True;
        edHasilWa.Enabled := True;
        edHasilWa.Text := QOrder.FieldByName('data').AsString
      end;
      QOrder.Next;
    end;

    // uang muka
    if QOrder.Active then
      QOrder.Active := False;
    QOrder.Params.Clear;
    QOrder.Params.Add.Name := 'id';
    QOrder.SQL.Clear;
    QOrder.SQL.Text :=
      'SELECT IFNULL(SUM(jumlah),0) jumlah FROM pembayaran WHERE order_header_id = :id ';
    QOrder.ParamByName('id').Value := order_id;
    QOrder.Active := True;
    lblUangMuka.Visible := True;
    edUangMuka.Visible := True;
    edUangMuka.Text := FormatFloat('#,##0.00',
      StrToFloat(QOrder.FieldByName('jumlah').AsString));

    // jika sudah tidak ada sisa tidak perlu bayar
    btnBayar.Enabled := True;
    if edTotal.Text = edUangMuka.Text then
      btnBayar.Enabled := False;

    // jika uang muka lebih besar dari total munculkan retur
    if StrToFloat(StringReplace(edTotal.Text, ',', '', [rfReplaceAll])) <
      StrToFloat(StringReplace(edUangMuka.Text, ',', '', [rfReplaceAll])) then
      btnBayar.Caption := 'Retur';

    // jika total dan uang muka = 0 maka batal
    if (StrToFloat(StringReplace(edTotal.Text, ',', '', [rfReplaceAll])) = 0)
      and (StrToFloat(StringReplace(edUangMuka.Text, ',', '', [rfReplaceAll])
      ) = 0) then
    begin
      btnBayar.Caption := 'Batal';
      btnBayar.Enabled := True;
    end;

    // pemeriksaan
    if QOrder.Active then
      QOrder.Active := False;
    QOrder.Params.Clear;
    QOrder.Params.Add.Name := 'id';
    QOrder.SQL.Clear;
    QOrder.SQL.Text :=
      'SELECT test_kode,nama_test,harga FROM order_detail WHERE header_id = :id AND cetak_nota = '
      + QuotedStr('Y') + ' ';
    QOrder.ParamByName('id').Value := order_id;
    QOrder.Active := True;
    QOrder.First;
    while not QOrder.Eof do
    begin
      GrdPemeriksaan.rowcount := GrdPemeriksaan.rowcount + 1;
      GrdPemeriksaan.Cells[0, GrdPemeriksaan.rowcount - 2] :=
        QOrder.FieldByName('test_kode').AsString;
      GrdPemeriksaan.Cells[1, GrdPemeriksaan.rowcount - 2] :=
        QOrder.FieldByName('nama_test').AsString;
      GrdPemeriksaan.Cells[2, GrdPemeriksaan.rowcount - 2] :=
        FormatFloat('#,##0.00', StrToFloat(QOrder.FieldByName('harga')
        .AsString));
      GrdPemeriksaan.Cells[3, GrdPemeriksaan.rowcount - 2] := 'N';

      QOrder.Next;
    end;

    // interview
    if QOrder.Active then
      QOrder.Active := False;
    QOrder.Params.Clear;
    QOrder.Params.Add.Name := 'id';
    QOrder.SQL.Clear;
    QOrder.SQL.Text :=
      'SELECT pertanyaan,jawaban FROM order_interview WHERE header_id = :id ';
    QOrder.ParamByName('id').Value := order_id;
    QOrder.Active := True;
    QOrder.First;
    while not QOrder.Eof do
    begin
      grdInterview.rowcount := grdInterview.rowcount + 1;
      grdInterview.Cells[0, grdInterview.rowcount - 2] :=
        QOrder.FieldByName('pertanyaan').AsString;
      grdInterview.Cells[1, grdInterview.rowcount - 2] :=
        QOrder.FieldByName('jawaban').AsString;

      QOrder.Next;
    end;

    getPasienHistori;

  end
  else
  begin

    if (edPasienId.Text = '') and (edNama.Text = '') then
      btnClearClick(self)
    else
    begin
      // show data
      // cbTipePasien.ItemIndex := cbTipePasien.Items.IndexOf(tipe_pasien);
      // cbTipeHasil.ItemIndex := cbTipeHasil.Items.IndexOf(tipe_hasil);
      // cbCito.ItemIndex := cbCito.Items.IndexOf(urgency);
      // cbAsal.ItemIndex := cbAsal.Items.IndexOf(asal);
      // cbPenjamin.ItemIndex := cbPenjamin.Items.IndexOf(penjamin);
      // cbRuangan.ItemIndex := cbRuangan.Items.IndexOf(ruangan);
      // cbPerujuk.ItemIndex := cbPerujuk.Items.IndexOf(perujuk);
    end;
  end;

  // mmCatatanPasien.Top := 68;
  // mmCatatanPasien.Height := 90;
  // mmInternalNote.Top := 68;
  // mmInternalNote.Height := 90;
end;

procedure TfrmFODaftar.UniFormCreate(Sender: TObject);
begin
  GrdPemeriksaan.Cells[0, 0] := 'Kode';
  GrdPemeriksaan.Cells[1, 0] := 'Pemeriksaan';
  GrdPemeriksaan.Cells[2, 0] := 'Harga';
  GrdPemeriksaan.Cells[3, 0] := 'Cito';
  GrdPemeriksaan.ColWidths[0] := 100;
  GrdPemeriksaan.ColWidths[1] := 300;
  GrdPemeriksaan.ColWidths[2] := 100;
  GrdPemeriksaan.ColWidths[3] := 50;

  // database
  // QTest.Open();
  if QTest.Active then
    QTest.Active := False;
  QTest.ParamByName('organisasi_id').Value := UniApplication.Cookies.GetCookie
    ('OrganisasiId');
  QTest.Active := True;

  if QTipeSample.Active then
    QTipeSample.Active := False;
  QTipeSample.ParamByName('organisasi_id').Value :=
    UniApplication.Cookies.GetCookie('OrganisasiId');
  QTipeSample.Active := True;

  // QTipePasien.Open();
  // QTipeHasil.Open();
  // QCito.Open();
  // QAsal.Open();
  // qAnsuransi.Open();
  // qRuangan.Open();
  // QPaket.Open();

  if QPaket.Active then
    QPaket.Active := False;
  QPaket.ParamByName('organisasi_id').Value := UniApplication.Cookies.GetCookie
    ('OrganisasiId');
  QPaket.Active := True;
  // QPerujuk.Open();
  // uniDBGrid.SetFocus;

end;

procedure TfrmFODaftar.UniFormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Close;
  if (Key = VK_F1) and btnCariPasien.Enabled then
    btnCariPasienClick(self);
  if Key = VK_F2 then
    btnCariDokterClick(self);
  if Key = VK_F3 then
    edTestClick(self);
  if Key = VK_F4 then
    btnDetailClick(self);
  if (Key = VK_F5) or (Key = VK_DELETE) then
    btnDeleteClick(self);
  if Key = VK_F6 then
    btnDiscountClick(self);
  if (Key = VK_F7) and btnBayar.Enabled then
    btnBayarClick(self);
  if Key = VK_F8 then
    btnClearClick(self);
  if Key = VK_F9 then
    btnNoRegClick(self);
  if Key = VK_F11 then
    btnEditPasienClick(self);
  if Key = VK_F12 then
    btnTglSelesaiClick(self);

  if (Key = VK_DOWN) or (Key = VK_UP) then
  begin
    // uniDBGrid.SetFocus;
  end;

end;

procedure TfrmFODaftar.DeleteTestCallback(Sender: TComponent; Res: Integer);
begin
  case Res of
    mrYes:
      DeleteRow(GrdPemeriksaan.Row, GrdPemeriksaan);
    // mrNo : UniMemo1.Lines.Add('DResult: NO');
  end;
end;

procedure TfrmFODaftar.ClearTestCallback(Sender: TComponent; Res: Integer);
var
  I, J: Integer;
begin
  case Res of
    mrOK:
      begin
        // test
        for I := 0 to GrdPemeriksaan.rowcount do
        begin
          for J := 0 to GrdPemeriksaan.ColCount do
            GrdPemeriksaan.Cells[J, I] := '';
        end;
        loadInterview;

        GrdPemeriksaan.ColCount := 4;
        GrdPemeriksaan.rowcount := 2;
        GrdPemeriksaan.Cells[0, 0] := 'Kode';
        GrdPemeriksaan.Cells[1, 0] := 'Pemeriksaan';
        GrdPemeriksaan.Cells[2, 0] := 'Harga';
        GrdPemeriksaan.Cells[3, 0] := 'Cito';
        GrdPemeriksaan.ColWidths[0] := 100;
        GrdPemeriksaan.ColWidths[1] := 300;
        GrdPemeriksaan.ColWidths[2] := 100;
        GrdPemeriksaan.ColWidths[3] := 50;

        calculate_total();
      end
  end;
end;

end.
