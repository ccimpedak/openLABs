unit UnitPendaftaran;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniEdit, uniLabel, uniGUIBaseClasses, uniPanel,
  uniBasicGrid, uniDBGrid, uniButton, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uniMultiItem, uniComboBox,
  uniDBComboBox, uniDBLookupComboBox, uniMemo, uniStringGrid, frxClass,
  frxDBSet, frxExportPDF;

type
  TfrmPendaftaran = class(TUniForm)
    UniPanel1: TUniPanel;
    UniPanel2: TUniPanel;
    UniPanel3: TUniPanel;
    UniLabel1: TUniLabel;
    edNama: TUniEdit;
    edKelamin: TUniEdit;
    UniLabel2: TUniLabel;
    edUmur: TUniEdit;
    UniLabel3: TUniLabel;
    edAlamat: TUniEdit;
    UniLabel4: TUniLabel;
    edTelp: TUniEdit;
    UniLabel5: TUniLabel;
    edPatientID: TUniEdit;
    UniPanel4: TUniPanel;
    uniDBGrid: TUniDBGrid;
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
    UniPanel5: TUniPanel;
    UniLabel6: TUniLabel;
    UniLabel7: TUniLabel;
    edDokter: TUniEdit;
    QTipePasien: TFDQuery;
    DSTipePasien: TDataSource;
    cbTipePasien: TUniDBLookupComboBox;
    UniLabel8: TUniLabel;
    UniLabel9: TUniLabel;
    cbTipeHasil: TUniDBLookupComboBox;
    cbCito: TUniDBLookupComboBox;
    QTipeHasil: TFDQuery;
    DSTipeHasil: TDataSource;
    QCito: TFDQuery;
    DSCito: TDataSource;
    mmDiagnosis: TUniMemo;
    UniPanel6: TUniPanel;
    UniPanel7: TUniPanel;
    UniLabel10: TUniLabel;
    edCariTest: TUniEdit;
    pnlSumary: TUniPanel;
    UniLabel11: TUniLabel;
    edSubTotal: TUniEdit;
    edDiscAmount: TUniEdit;
    edTotal: TUniEdit;
    UniLabel12: TUniLabel;
    UniLabel13: TUniLabel;
    GrdPemeriksaan: TUniStringGrid;
    QCheckTest: TFDQuery;
    edHp: TUniEdit;
    edDokterId: TUniEdit;
    edPasienId: TUniEdit;
    edJenisKelaminId: TUniEdit;
    cbAsal: TUniDBLookupComboBox;
    UniLabel14: TUniLabel;
    UniLabel15: TUniLabel;
    cbPenjamin: TUniDBLookupComboBox;
    dsAsal: TDataSource;
    QAsal: TFDQuery;
    qAnsuransi: TFDQuery;
    dsAnsuransi: TDataSource;
    UniLabel16: TUniLabel;
    cbRuangan: TUniDBLookupComboBox;
    mmInternalNote: TUniMemo;
    qRuangan: TFDQuery;
    dsRuangan: TDataSource;
    edDiscount: TUniFormattedNumberEdit;
    lblUangMuka: TUniLabel;
    edUangMuka: TUniEdit;
    QEditPasien: TFDQuery;
    btnEditPasien: TUniButton;
    btnPTerakhir: TUniButton;
    QPTerakhir: TFDQuery;
    QPTerakhirDtl: TFDQuery;
    btnTglSelesai: TUniButton;
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
    procedure UniFormAfterShow(Sender: TObject);
    procedure edDiscountChange(Sender: TObject);
    procedure btnCariDokterClick(Sender: TObject);
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
  private
    { Private declarations }
    procedure DeleteTestCallback(Sender: TComponent; Res: Integer);
  public
    { Public declarations }
    // procedure clear_fields();
  var
    pasien_id, tipe_pasien, urgency, asal, penjamin, ruangan, tipe_hasil,
      call_form: string;
    b_clear: boolean;
    order_hdr_id:string;
    tgl_hasil: TDateTime;
    catatan_hasil: string;
  end;

function frmPendaftaran: TfrmPendaftaran;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, UnitCariPasien, UnitCariDokter, UnitBayar,
  UnitPasienBaru, UnitTanggalSelesai, ServerModule, UnitReportDisplay;

procedure clear_fields();
var
  I, J: Integer;
begin
  frmPendaftaran.edDokter.Text := '-';
  frmPendaftaran.cbTipePasien.ItemIndex :=
    frmPendaftaran.cbTipePasien.Items.IndexOf('REGULER');
  frmPendaftaran.cbTipeHasil.ItemIndex :=
    frmPendaftaran.cbTipeHasil.Items.IndexOf('-');
  frmPendaftaran.cbCito.ItemIndex := frmPendaftaran.cbCito.Items.IndexOf
    ('NORMAL');
  frmPendaftaran.cbAsal.ItemIndex := frmPendaftaran.cbAsal.Items.IndexOf('-');
  frmPendaftaran.cbPenjamin.ItemIndex :=
    frmPendaftaran.cbPenjamin.Items.IndexOf('-');
  frmPendaftaran.cbRuangan.ItemIndex :=
    frmPendaftaran.cbPenjamin.Items.IndexOf('-');
  frmPendaftaran.edSubTotal.Text := '0';
  frmPendaftaran.edDiscount.Text := '0.00';
  frmPendaftaran.edDiscAmount.Text := '0';
  frmPendaftaran.edTotal.Text := '0';

  // pasien
  frmPendaftaran.edPasienId.Clear;
  frmPendaftaran.edNama.Clear;
  frmPendaftaran.edJenisKelaminId.Clear;
  frmPendaftaran.edKelamin.Clear;
  frmPendaftaran.edUmur.Clear;
  frmPendaftaran.edAlamat.Clear;
  frmPendaftaran.edTelp.Clear;
  frmPendaftaran.edHp.Clear;
  frmPendaftaran.edPatientID.Clear;

  // memo
  frmPendaftaran.mmDiagnosis.Clear;
  frmPendaftaran.mmInternalNote.Clear;

  frmPendaftaran.edCariTest.Clear;
  if frmPendaftaran.QTest.Active then
    frmPendaftaran.QTest.Active := False;
  frmPendaftaran.QTest.SQL.Text :=
    'SELECT id,kode,nama FROM TEST WHERE ada_harga=' + QuotedStr('Y') +
    ' AND UPPER(nama) LIKE ' +
    QuotedStr('%' + UpperCase(frmPendaftaran.edCariTest.Text) + '%') +
    ' ORDER BY kode';
  frmPendaftaran.QTest.Active := True;

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
  frmPendaftaran.GrdPemeriksaan.ColWidths[0] := 100;
  frmPendaftaran.GrdPemeriksaan.ColWidths[1] := 300;
  frmPendaftaran.GrdPemeriksaan.ColWidths[2] := 100;
  frmPendaftaran.GrdPemeriksaan.ColWidths[3] := 50;

end;

procedure calculate_total();
var
  I: Integer;
  fTotal: Currency;
  tmpStr: String;
begin
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
  tmpStr := frmPendaftaran.edDiscount.Text;
  tmpStr := StringReplace(tmpStr, ',', '', [rfReplaceAll]);
  frmPendaftaran.edDiscAmount.Text := FormatFloat('#,##0.00',
    (fTotal * (StrToFloat(tmpStr) / 100)));
  frmPendaftaran.edTotal.Text := FormatFloat('#,##0.00',
    StrToFloat(StringReplace(frmPendaftaran.edSubTotal.Text, ',', '',
    [rfReplaceAll])) - StrToFloat
    (StringReplace(frmPendaftaran.edDiscAmount.Text, ',', '', [rfReplaceAll])));

end;

procedure AddTest();
var
  I, id_tes: Integer;
  fTotal: Currency;
  tmpStr: String;
  formatSettings: TFormatSettings;
begin
  // cek validasi data commbo box
  if frmPendaftaran.cbCito.Text = '' then
  begin
    frmPendaftaran.showMessage('pilih tipe Cito.');
    frmPendaftaran.cbCito.SetFocus;
    exit;
  end;

  GetLocaleFormatSettings(LOCALE_SYSTEM_DEFAULT, formatSettings);

  // cek apakah sudah ada
  for I := 1 to frmPendaftaran.GrdPemeriksaan.RowCount do
  begin
    if frmPendaftaran.GrdPemeriksaan.Cells[0, I] = frmPendaftaran.QTest.
      FieldByName('kode').AsString then
    begin
      frmPendaftaran.showMessage('Pemeriksaan sudah ada');
      exit;
    end;
  end;

  // dapatkan idnya
  if frmPendaftaran.QCheckTest.Active then
    frmPendaftaran.QCheckTest.Active := False;
  frmPendaftaran.QCheckTest.SQL.Text := ' SELECT id FROM test WHERE kode = ' +
    QuotedStr(frmPendaftaran.QTest.FieldByName('kode').AsString);
  frmPendaftaran.QCheckTest.Active := True;

  // tambahkan ke grid
  frmPendaftaran.GrdPemeriksaan.RowCount :=
    frmPendaftaran.GrdPemeriksaan.RowCount + 1;
  frmPendaftaran.GrdPemeriksaan.Cells[0, frmPendaftaran.GrdPemeriksaan.RowCount
    - 2] := frmPendaftaran.QTest.FieldByName('kode').AsString;
  frmPendaftaran.GrdPemeriksaan.Cells[1, frmPendaftaran.GrdPemeriksaan.RowCount
    - 2] := frmPendaftaran.QTest.FieldByName('nama').AsString;

  //
  // id_tes := frmPendaftaran.QCheckTest.FieldByName('id').AsInteger;

  // ambil harga
  if frmPendaftaran.QCheckTest.Active then
    frmPendaftaran.QCheckTest.Active := False;
  frmPendaftaran.QCheckTest.SQL.Text :=
    ' SELECT harga.id,IFNULL(harga.harga,0) harga FROM harga LEFT JOIN tipe_pasien ON harga.tipe_pasien_id = tipe_pasien.id LEFT JOIN urgency ON harga.urgency_id = urgency.id WHERE '
    + ' test_id = ' + QuotedStr(frmPendaftaran.QTest.FieldByName('id').AsString)
    + ' AND tipe_pasien.nama = ' + QuotedStr(frmPendaftaran.cbTipePasien.Text) +
    ' AND urgency.nama = ' + QuotedStr(frmPendaftaran.cbCito.Text);
  frmPendaftaran.QCheckTest.Active := True;

  // tambahkan ke grid
  frmPendaftaran.GrdPemeriksaan.Cells[2, frmPendaftaran.GrdPemeriksaan.RowCount
    - 2] := FormatFloat('#,##0.00',
    StrToFloat(frmPendaftaran.QCheckTest.FieldByName('harga').AsString));
  if frmPendaftaran.cbCito.ItemIndex = frmPendaftaran.cbCito.Items.IndexOf
    ('NORMAL') then
    frmPendaftaran.GrdPemeriksaan.Cells
      [3, frmPendaftaran.GrdPemeriksaan.RowCount - 2] := 'N'
  else
    frmPendaftaran.GrdPemeriksaan.Cells
      [3, frmPendaftaran.GrdPemeriksaan.RowCount - 2] := 'Y';

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
  tmpStr := frmPendaftaran.edDiscount.Text;
  tmpStr := StringReplace(tmpStr, ',', '', [rfReplaceAll]);
  frmPendaftaran.edDiscAmount.Text := FormatFloat('#,##0.00',
    (fTotal * (StrToFloat(tmpStr) / 100)));
  frmPendaftaran.edTotal.Text := FormatFloat('#,##0.00',
    StrToFloat(StringReplace(frmPendaftaran.edSubTotal.Text, ',', '',
    [rfReplaceAll])) - StrToFloat
    (StringReplace(frmPendaftaran.edDiscAmount.Text, ',', '', [rfReplaceAll])));

  // clear edit
  frmPendaftaran.edCariTest.Clear;
  frmPendaftaran.edCariTest.SetFocus;
end;

procedure AddTest_old();
var
  I, iTmp: Integer;
  formatSettings: TFormatSettings;
begin
  GetLocaleFormatSettings(LOCALE_SYSTEM_DEFAULT, formatSettings);

  if (frmPendaftaran.QTest.RecordCount > 0) then
  begin
    // cek apakah sudah ada
    for I := 1 to frmPendaftaran.GrdPemeriksaan.RowCount do
    begin
      if frmPendaftaran.GrdPemeriksaan.Cells[0, I]
        = frmPendaftaran.QTest.FieldByName('kode').AsString then
      begin
        frmPendaftaran.showMessage('Pemeriksaan sudah ada');
        exit;
      end;
    end;

    // cek apakah sudah ada induknya
    if frmPendaftaran.QCheckTest.Active then
      frmPendaftaran.QCheckTest.Active := False;
    frmPendaftaran.QCheckTest.SQL.Text :=
      ' SELECT kode,nama,ref_test_id FROM test WHERE kode = ' +
      QuotedStr(frmPendaftaran.QTest.FieldByName('kode').AsString);
    frmPendaftaran.QCheckTest.Active := True;

    iTmp := frmPendaftaran.QCheckTest.FieldByName('ref_test_id').AsInteger;

    if frmPendaftaran.QCheckTest.Active then
      frmPendaftaran.QCheckTest.Active := False;
    frmPendaftaran.QCheckTest.SQL.Text :=
      ' select kode,nama from test where id in ( select induk_kode_id from test where ref_test_id = '
      + IntToStr(iTmp) + '  ) ';
    frmPendaftaran.QCheckTest.Active := True;

    for I := 1 to frmPendaftaran.GrdPemeriksaan.RowCount do
    begin
      frmPendaftaran.QCheckTest.First;
      while not frmPendaftaran.QCheckTest.Eof do
      begin
        if frmPendaftaran.GrdPemeriksaan.Cells[0, I]
          = frmPendaftaran.QCheckTest.FieldByName('kode').AsString then
        begin
          frmPendaftaran.showMessage('Pemeriksaan sudah ada ' +
            frmPendaftaran.QTest.FieldByName('nama').AsString + ' = ' +
            frmPendaftaran.QCheckTest.FieldByName('nama').AsString);
          exit;
        end;
        frmPendaftaran.QCheckTest.Next;
      end;
    end;

    // cek apakah sudah ada anak sebelumnya
    if frmPendaftaran.QCheckTest.Active then
      frmPendaftaran.QCheckTest.Active := False;
    frmPendaftaran.QCheckTest.SQL.Text :=
      ' SELECT kode,nama,ref_test_id FROM test WHERE kode = ' +
      QuotedStr(frmPendaftaran.QTest.FieldByName('kode').AsString);
    frmPendaftaran.QCheckTest.Active := True;

    iTmp := frmPendaftaran.QCheckTest.FieldByName('ref_test_id').AsInteger;

    if frmPendaftaran.QCheckTest.Active then
      frmPendaftaran.QCheckTest.Active := False;
    frmPendaftaran.QCheckTest.SQL.Text :=
      ' SELECT kode,nama FROM test WHERE ref_test_id = ' + IntToStr(iTmp);
    frmPendaftaran.QCheckTest.Active := True;

    for I := 1 to frmPendaftaran.GrdPemeriksaan.RowCount do
    begin
      frmPendaftaran.QCheckTest.First;
      while not frmPendaftaran.QCheckTest.Eof do
      begin
        if frmPendaftaran.GrdPemeriksaan.Cells[0, I]
          = frmPendaftaran.QCheckTest.FieldByName('kode').AsString then
        begin
          frmPendaftaran.showMessage('Pemeriksaan sudah ada ' +
            frmPendaftaran.QTest.FieldByName('nama').AsString + ' = ' +
            frmPendaftaran.QCheckTest.FieldByName('nama').AsString);
          exit;
        end;
        frmPendaftaran.QCheckTest.Next;
      end;
    end;

    // tambah
    frmPendaftaran.GrdPemeriksaan.RowCount :=
      frmPendaftaran.GrdPemeriksaan.RowCount + 1;
    frmPendaftaran.GrdPemeriksaan.Cells
      [0, frmPendaftaran.GrdPemeriksaan.RowCount - 2] :=
      frmPendaftaran.QTest.FieldByName('kode').AsString;
    frmPendaftaran.GrdPemeriksaan.Cells
      [1, frmPendaftaran.GrdPemeriksaan.RowCount - 2] :=
      frmPendaftaran.QTest.FieldByName('nama').AsString;

    // harga =
    if frmPendaftaran.QCheckTest.Active then
      frmPendaftaran.QCheckTest.Active := False;
    frmPendaftaran.QCheckTest.SQL.Text :=
      ' SELECT harga.id,IFNULL(harga.harga,0) harga FROM harga LEFT JOIN tipe_pasien ON harga.tipe_pasien_id = tipe_pasien.id LEFT JOIN urgency ON harga.urgency_id = urgency.id WHERE '
      + ' test_id = ' + QuotedStr(frmPendaftaran.QTest.FieldByName('id')
      .AsString) + ' AND tipe_pasien.nama = ' +
      QuotedStr(frmPendaftaran.cbTipePasien.Text) + ' AND urgency.nama = ' +
      QuotedStr(frmPendaftaran.cbCito.Text);
    frmPendaftaran.QCheckTest.Active := True;

    frmPendaftaran.GrdPemeriksaan.Cells
      [2, frmPendaftaran.GrdPemeriksaan.RowCount - 2] :=
      FormatFloat('#,##0.00',
      StrToFloat(frmPendaftaran.QCheckTest.FieldByName('harga').AsString));
    if frmPendaftaran.cbCito.ItemIndex = frmPendaftaran.cbCito.Items.IndexOf
      ('NORMAL') then
      frmPendaftaran.GrdPemeriksaan.Cells
        [3, frmPendaftaran.GrdPemeriksaan.RowCount - 2] := 'N'
    else
      frmPendaftaran.GrdPemeriksaan.Cells
        [3, frmPendaftaran.GrdPemeriksaan.RowCount - 2] := 'Y';
    {
      // calculate total
      fTotal:=0;
      for I := 1 to frmPendaftaran.GrdPemeriksaan.RowCount do
      begin
      tmpStr:= frmPendaftaran.GrdPemeriksaan.Cells[2,I];
      tmpStr:=StringReplace(tmpStr,',','',[rfReplaceAll]);
      if tmpStr<>'' then
      fTotal:= fTotal + StrToFloat(tmpStr);
      end;

      frmPendaftaran.edSubTotal.Text:=FormatFloat('#,##0.00',fTotal);

      // discount
      tmpStr:=frmPendaftaran.edDiscount.Text;
      tmpStr:=StringReplace(tmpStr,',','',[rfReplaceAll]);
      frmPendaftaran.edDiscAmount.Text:=FormatFloat('#,##0.00',(fTotal * (StrToFloat(tmpStr)/100)));
      frmPendaftaran.edTotal.Text:=FormatFloat('#,##0.00',StrToFloat(StringReplace(frmPendaftaran.edSubTotal.Text,',','',[rfReplaceAll]))-StrToFloat(StringReplace(frmPendaftaran.edDiscAmount.Text,',','',[rfReplaceAll])));
    }
    calculate_total();

    // clear edit
    frmPendaftaran.edCariTest.Clear;
  end;

end;

function frmPendaftaran: TfrmPendaftaran;
begin
  Result := TfrmPendaftaran(UniMainModule.GetFormInstance(TfrmPendaftaran));
end;

procedure DeleteRow(ARowIndex: Integer; AGrid: TUniStringGrid);
var
  I, J: Integer;
begin
  with AGrid do
  begin
    BeginUpdate;
    if (ARowIndex = RowCount) then
      RowCount := RowCount - 1
    else
    begin
      for I := ARowIndex to RowCount - 2 do
        for J := 0 to ColCount - 1 do
          Cells[J, I] := Cells[J, I + 1];

      RowCount := RowCount - 1;
    end;
    EndUpdate;
  end;
  calculate_total();
end;

procedure TfrmPendaftaran.btnCariPasienClick(Sender: TObject);
begin
  frmCariPasien.ShowModal();
end;

procedure TfrmPendaftaran.edCariTestChange(Sender: TObject);
begin
  if edCariTest.Text <> '' then
  begin
    if QTest.Active then
      QTest.Active := False;
    QTest.SQL.Text := 'SELECT id,kode,nama FROM TEST WHERE ada_harga=' +
      QuotedStr('Y') + ' AND ( UPPER(nama) LIKE ' +
      QuotedStr('%' + UpperCase(edCariTest.Text) + '%') + ' OR kode LIKE ' +
      QuotedStr('%' + UpperCase(edCariTest.Text) + '%') + ' ) ORDER BY kode';
    QTest.Active := True;
  end;
end;

procedure TfrmPendaftaran.edCariTestKeyPress(Sender: TObject; var Key: Char);
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
    if Key=VK_ESCAPE then frmPendaftaran.Close;
  }
  if (Ord(Key) = VK_RETURN) then
  begin
    AddTest();
  end;

end;

procedure TfrmPendaftaran.edDiscAmountChange(Sender: TObject);
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

procedure TfrmPendaftaran.edDiscAmountKeyPress(Sender: TObject; var Key: Char);
begin
  if (Ord(Key) = VK_RETURN) then
  begin
    edDiscAmount.Text := FormatFloat('#,##0.00',
      StrToFloat(StringReplace(edDiscAmount.Text, ',', '', [rfReplaceAll])));
  end;
end;

procedure TfrmPendaftaran.edDiscountChange(Sender: TObject);
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

procedure TfrmPendaftaran.edDiscountKeyPress(Sender: TObject; var Key: Char);
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
    if Ord(Key)=VK_ESCAPE then frmPendaftaran.Close;
  }

  if (Ord(Key) = VK_RETURN) then
  begin
    btnBayar.SetFocus;
  end;
end;

procedure TfrmPendaftaran.edPatientIDKeyDown(Sender: TObject; var Key: Word;
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
  if Key = VK_F5 then
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
    frmPendaftaran.Close;
end;

procedure TfrmPendaftaran.GrdPemeriksaanDrawCell(Sender: TObject;
  ACol, ARow: Integer; var Value: string; Attribs: TUniCellAttribs);
begin
  if (ACol = 2) and (ARow <> 0) then
    Attribs.Style.Style := 'text-align: right;';
end;

procedure TfrmPendaftaran.uniDBGridKeyDown(Sender: TObject; var Key: Word;
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
  if Key = VK_F5 then
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
    frmPendaftaran.Close;

  if Key = VK_RETURN then
    AddTest();

end;

procedure TfrmPendaftaran.btnClearClick(Sender: TObject);
var
  I, J: Integer;
begin
  edDokter.Text := '-';
  cbTipePasien.ItemIndex := cbTipePasien.Items.IndexOf('REGULER');
  cbTipeHasil.ItemIndex := cbTipeHasil.Items.IndexOf('AMBIL SENDIRI');
  cbCito.ItemIndex := cbCito.Items.IndexOf('NORMAL');
  cbAsal.ItemIndex := cbAsal.Items.IndexOf('-');
  cbPenjamin.ItemIndex := cbPenjamin.Items.IndexOf('-');
  cbRuangan.ItemIndex := cbPenjamin.Items.IndexOf('-');
  edSubTotal.Text := '0';
  edDiscount.Text := '0.00';
  edDiscAmount.Text := '0';
  edTotal.Text := '0';

  // UniMemo1.Lines.Add('tipe_pasien_id '+frmPendaftaran.QTipePasien.FieldByName('id').AsString);
  // UniMemo1.Lines.Add('tipe_hasil_id '+frmPendaftaran.QTipeHasil.FieldByName('id').AsString);

  // pasien
  edPasienId.Clear;
  edNama.Clear;
  edJenisKelaminId.Clear;
  edKelamin.Clear;
  edUmur.Clear;
  edAlamat.Clear;
  edTelp.Clear;
  edHp.Clear;
  edPatientID.Clear;

  // memo
  mmDiagnosis.Clear;
  mmInternalNote.Clear;

  edCariTest.Clear;
  if QTest.Active then
    QTest.Active := False;
  QTest.SQL.Text := 'SELECT id,kode,nama FROM TEST WHERE ada_harga=' +
    QuotedStr('Y') + ' AND UPPER(nama) LIKE ' +
    QuotedStr('%' + UpperCase(edCariTest.Text) + '%') + ' ORDER BY kode';
  QTest.Active := True;

  for I := 0 to GrdPemeriksaan.RowCount do
  begin
    for J := 0 to GrdPemeriksaan.ColCount do
      GrdPemeriksaan.Cells[J, I] := '';

  end;

  GrdPemeriksaan.ColCount := 4;
  GrdPemeriksaan.RowCount := 2;
  GrdPemeriksaan.Cells[0, 0] := 'Kode';
  GrdPemeriksaan.Cells[1, 0] := 'Pemeriksaan';
  GrdPemeriksaan.Cells[2, 0] := 'Harga';
  GrdPemeriksaan.Cells[3, 0] := 'Cito';
  GrdPemeriksaan.ColWidths[0] := 100;
  GrdPemeriksaan.ColWidths[1] := 300;
  GrdPemeriksaan.ColWidths[2] := 100;
  GrdPemeriksaan.ColWidths[3] := 50;

  pnlSumary.Height := 90;
  lblUangMuka.Visible := False;
  edUangMuka.Visible := False;

end;

procedure TfrmPendaftaran.btnDetailClick(Sender: TObject);
begin
  GrdPemeriksaan.SetFocus;
  GrdPemeriksaan.Row := 1;
end;

procedure TfrmPendaftaran.btnBayarClick(Sender: TObject);
begin
  if (edPasienId.Text <> '') and (edDokterId.Text <> '') and (edDokter.Text<>'') then
  begin
    if GrdPemeriksaan.RowCount > 2 then
    begin

      frmBayar.call_form := call_form;
      if frmBayar.qJenisPemb.Active then
        frmBayar.qJenisPemb.Active := False;
      frmBayar.qJenisPemb.Active := True;
      frmBayar.cbJenis.ItemIndex := 0;
      frmBayar.edCharge.Text := '0';
      frmBayar.edTotalBayar.Text := edTotal.Text;
      frmBayar.edTotal.Text := edTotal.Text;
      frmBayar.edPembayaran.Text := '0';
      frmBayar.edSisa.Text := '0';
      frmBayar.edTagihan.Text := edTotal.Text;
      frmBayar.ShowModal;
    end
    else
    begin
      showMessage('Pemeriksaan masih kosong.');
      edCariTest.SetFocus;
    end;
  end
  else
  begin
    showMessage('Pasien dan/atau dokter belum dipilih.');
  end;
end;

procedure TfrmPendaftaran.btnCariDokterClick(Sender: TObject);
begin
  frmCariDokter.ShowModal();
end;

procedure TfrmPendaftaran.edTestClick(Sender: TObject);
begin
  edCariTest.SetFocus
end;

procedure TfrmPendaftaran.btnDeleteClick(Sender: TObject);
begin
  if (GrdPemeriksaan.Row > 0) and
    (GrdPemeriksaan.Row < GrdPemeriksaan.RowCount - 1) then
  begin
    MessageDlg('Delete : ' + GrdPemeriksaan.Cells[0, GrdPemeriksaan.Row] + ' - '
      + GrdPemeriksaan.Cells[1, GrdPemeriksaan.Row], mtConfirmation, mbYesNo,
      DeleteTestCallback);
  end;
end;

procedure TfrmPendaftaran.btnDiscountClick(Sender: TObject);
begin
  edDiscount.SetFocus;
end;

procedure TfrmPendaftaran.btnEditPasienClick(Sender: TObject);
begin
  if edPasienId.Text <> '' then
  begin
    frmPasienBaru.call_form := 'pendaftaran';
    if QEditPasien.Active then
      QEditPasien.Active := False;
    QEditPasien.SQL.Text :=
      'select p.*,k.nama as kelamin_nama,pf.nama as pf_nama, ';
    QEditPasien.SQL.Text := QEditPasien.SQL.Text +
      'TIMESTAMPDIFF( YEAR, p.tanggal_lahir, now() ) as th,TIMESTAMPDIFF( MONTH, p.tanggal_lahir, now() ) % 12 as bl,FLOOR( TIMESTAMPDIFF( DAY, p.tanggal_lahir, now() ) % 30.4375 ) as hr ';
    QEditPasien.SQL.Text := QEditPasien.SQL.Text +
      ' from  pasien p, jenis_kelamin k, prefix pf where p.id = ' +
      edPasienId.Text +
      ' and p.jenis_kelamin_id = k.id and p.prefix_id = pf.id ';

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

    if frmPasienBaru.QPrefik.Active then
      frmPasienBaru.QPrefik.Active := False;
    frmPasienBaru.QPrefik.Active := True;
    if frmPasienBaru.QKelamin.Active then
      frmPasienBaru.QKelamin.Active := False;
    frmPasienBaru.QKelamin.Active := True;

    frmPasienBaru.pf_nama := QEditPasien.FieldByName('pf_nama').AsString;
    frmPasienBaru.kelamin_nama := QEditPasien.FieldByName
      ('kelamin_nama').AsString;

    frmPasienBaru.ShowModal();

  end;
end;

procedure TfrmPendaftaran.btnNoRegClick(Sender: TObject);
begin
  edPatientID.SetFocus;
end;

procedure TfrmPendaftaran.btnPTerakhirClick(Sender: TObject);
var
  I, J: Integer;
  mId: String;
  fTotal: Currency;
  tmpStr: String;
  RepUrl, Result: string;
  formatSettings: TFormatSettings;
begin
  if btnPTerakhir.Caption = 'F10 Cetak Copy Nota' then
  begin

    if QNotaCopy.Active then
      QNotaCopy.Active := False;

    QNotaCopy.ParamByName('header_id').AsString := order_hdr_id;
    QNotaCopy.Active := True;

    frxRepNota.PrintOptions.ShowDialog := False;
    frxRepNota.ShowProgress := False;

    frxRepNota.EngineOptions.SilentMode := True;
    frxRepNota.EngineOptions.DestroyForms := False;

    frxPDFExport1.Background := True;
    frxPDFExport1.ShowProgress := False;
    frxPDFExport1.ShowDialog := False;
    frxPDFExport1.FileName := UniServerModule.NewCacheFileUrl(False, 'pdf', '',
      '', Result, True);
    frxPDFExport1.DefaultPath := '';

    frxRepNota.PreviewOptions.AllowEdit := False;
    frxRepNota.PrepareReport;
    frxRepNota.Export(frxPDFExport1);

    frmReportDisplay.UniURLFrame1.URL := Result;
    frmReportDisplay.ShowModal();

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
        frmPendaftaran.GrdPemeriksaan.ColWidths[0] := 100;
        frmPendaftaran.GrdPemeriksaan.ColWidths[1] := 300;
        frmPendaftaran.GrdPemeriksaan.ColWidths[2] := 100;
        frmPendaftaran.GrdPemeriksaan.ColWidths[3] := 50;

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
          GrdPemeriksaan.RowCount := GrdPemeriksaan.RowCount + 1;
          GrdPemeriksaan.Cells[0, GrdPemeriksaan.RowCount - 2] :=
            QPTerakhirDtl.FieldByName('kode').AsString;
          frmPendaftaran.GrdPemeriksaan.Cells[1, GrdPemeriksaan.RowCount - 2] :=
            QPTerakhirDtl.FieldByName('nama').AsString;

          if QPTerakhirDtl.Active then
            QPTerakhirDtl.Active := False;
          QPTerakhirDtl.SQL.Text :=
            'select * from harga where tipe_pasien_id = ' +
            QTipePasien.FieldByName('id').AsString + ' and urgency_id = ' +
            QCito.FieldByName('id').AsString + ' and test_id = ' +
            QPTerakhir.FieldByName('test_id').AsString + ' ';
          QPTerakhirDtl.Active := True;

          // tambahkan ke grid
          frmPendaftaran.GrdPemeriksaan.Cells[2, GrdPemeriksaan.RowCount - 2] :=
            FormatFloat('#,##0.00',
            StrToFloat(QPTerakhirDtl.FieldByName('harga').AsString));
          if cbCito.ItemIndex = frmPendaftaran.cbCito.Items.IndexOf('NORMAL')
          then
            GrdPemeriksaan.Cells[3, GrdPemeriksaan.RowCount - 2] := 'N'
          else
            GrdPemeriksaan.Cells[3, GrdPemeriksaan.RowCount - 2] := 'Y';

          // calculate total
          fTotal := 0;
          for I := 1 to GrdPemeriksaan.RowCount do
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
    end;

  end;
end;

procedure TfrmPendaftaran.btnTglSelesaiClick(Sender: TObject);
begin
  frmTanggalSelesai.ShowModal();
end;

procedure TfrmPendaftaran.UniFormAfterShow(Sender: TObject);
begin
  tgl_hasil := Now;
  if call_form = 'home_service' then
  begin
    btnCariPasien.Enabled := False;
    edDokter.Text := '-';
    cbTipePasien.ItemIndex := cbTipePasien.Items.IndexOf('REGULER');
    cbTipeHasil.ItemIndex := cbTipeHasil.Items.IndexOf('AMBIL SENDIRI');
    cbCito.ItemIndex := cbCito.Items.IndexOf('NORMAL');
    cbAsal.ItemIndex := cbAsal.Items.IndexOf('-');
    cbPenjamin.ItemIndex := cbPenjamin.Items.IndexOf('-');
    cbRuangan.ItemIndex := cbPenjamin.Items.IndexOf('-');
    edSubTotal.Text := '0';
    edDiscount.Text := '0.00';
    edDiscAmount.Text := '0';
    edTotal.Text := '0';
  end
  else
  begin

    if (edPasienId.Text = '') and (edNama.Text = '') then
      btnClearClick(self)
    else
    begin
      // show data
      cbTipePasien.ItemIndex := cbTipePasien.Items.IndexOf(tipe_pasien);
      cbTipeHasil.ItemIndex := cbTipeHasil.Items.IndexOf(tipe_hasil);
      cbCito.ItemIndex := cbCito.Items.IndexOf(urgency);
      cbAsal.ItemIndex := cbAsal.Items.IndexOf(asal);
      cbPenjamin.ItemIndex := cbPenjamin.Items.IndexOf(penjamin);
      cbRuangan.ItemIndex := cbRuangan.Items.IndexOf(ruangan);
    end;
  end;
end;

procedure TfrmPendaftaran.UniFormCreate(Sender: TObject);
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
  QTest.Open();
  QTipePasien.Open();
  QTipeHasil.Open();
  QCito.Open();
  QAsal.Open();
  qAnsuransi.Open();
  qRuangan.Open();
  uniDBGrid.SetFocus;

end;

procedure TfrmPendaftaran.UniFormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_F1) and btnCariPasien.Enabled then
    btnCariPasienClick(self);
  if Key = VK_F2 then
    btnCariDokterClick(self);
  if Key = VK_F3 then
    edTestClick(self);
  if Key = VK_F4 then
    btnDetailClick(self);
  if Key = VK_F5 then
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
    frmPendaftaran.Close;

  if (Key = VK_DOWN) or (Key = VK_UP) then
  begin
    uniDBGrid.SetFocus;
  end;

end;

procedure TfrmPendaftaran.DeleteTestCallback(Sender: TComponent; Res: Integer);
begin
  case Res of
    mrYes:
      DeleteRow(GrdPemeriksaan.Row, GrdPemeriksaan);
    // mrNo : UniMemo1.Lines.Add('DResult: NO');
  end;
end;

end.
