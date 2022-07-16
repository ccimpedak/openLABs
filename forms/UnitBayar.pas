unit UnitBayar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniPanel, uniLabel, uniButton,
  uniEdit, uniMultiItem, uniComboBox, uniDBComboBox, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  uniDBLookupComboBox, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  uniBasicGrid, uniDBGrid,
  uniMemo, UnitJasper, uniRadioButton, uniRadioGroup;

type
  TfrmBayar = class(TUniForm)
    UniContainerPanel1: TUniContainerPanel;
    LblStatusLunas: TUniLabel;
    UniPanel1: TUniPanel;
    lblNoLab: TUniLabel;
    UniLabel1: TUniLabel;
    UniLabel2: TUniLabel;
    UniLabel3: TUniLabel;
    UniLabel4: TUniLabel;
    UniLabel5: TUniLabel;
    UniLabel6: TUniLabel;
    UniLabel7: TUniLabel;
    edCharge: TUniEdit;
    edTotalBayar: TUniEdit;
    edTOtal: TUniEdit;
    edPembayaran: TUniEdit;
    edSisa: TUniEdit;
    edTagihan: TUniEdit;
    edSave: TUniButton;
    edCancel: TUniButton;
    edPrint: TUniButton;
    btnExit: TUniButton;
    qJenisPemb: TFDQuery;
    dsJenisPemb: TDataSource;
    cbJenis: TUniDBLookupComboBox;
    FDcmd: TFDCommand;
    FDQuery: TFDQuery;

    qPrint: TFDQuery;
    DSPrint: TDataSource;
    qCharge: TFDQuery;
    btnKuitansi: TUniButton;
    qKuintansi: TFDQuery;
    DataSource1: TDataSource;

    qTmp: TFDQuery;
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
    btnBayarPenuh: TUniButton;
    btnLabel: TUniButton;
    qKuintansiusia: TStringField;
    qKuintansiprefix: TStringField;
    qKuintansihp: TStringField;
    qKuintansitanggal_lahir: TDateField;
    qKuintansijenis_kelamin: TStringField;
    cmdCallForm: TFDCommand;
    cmdLogging: TFDCommand;
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
    qPrintperujuk: TStringField;
    qPrinttanggal: TDateTimeField;
    qPrintdiskon: TBCDField;
    qPrintdisc_amount: TBCDField;
    qPrintsub_total: TBCDField;
    qPrinttagihan: TBCDField;
    qPrintharga_total: TFMTBCDField;
    qPrintdisc_pct: TBCDField;
    qPrintflgLunas: TStringField;
    qPrinthp: TStringField;
    qPrintcatatan_pasien: TMemoField;
    qPrintuang_muka: TFMTBCDField;
    QSave: TFDQuery;
    QSave2: TFDQuery;
    QSave3: TFDQuery;
    Qzpl: TFDQuery;
    QCek: TFDQuery;
    QTubes: TFDQuery;
    rbNomor: TUniRadioGroup;
    rbAuto: TUniRadioButton;
    rbManual: TUniRadioButton;
    edNoLab: TUniEdit;
    QNoLabCari: TFDQuery;
    procedure cbJenisChange(Sender: TObject);
    procedure edChargeKeyPress(Sender: TObject; var Key: Char);
    procedure UniFormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edSaveClick(Sender: TObject);
    procedure edPrintClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure edCancelClick(Sender: TObject);
    procedure cbJenisKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cbJenisKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edTotalBayarKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edPembayaranKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edTagihanKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnKuitansiClick(Sender: TObject);
    procedure frxRepKuitansiGetValue(const VarName: string; var Value: Variant);
    procedure btnBayarPenuhClick(Sender: TObject);
    procedure btnLabelClick(Sender: TObject);
    procedure UniFormClose(Sender: TObject; var Action: TCloseAction);
    procedure edChargeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edTOtalKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edSisaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure UniFormAfterShow(Sender: TObject);
    procedure rbManualClick(Sender: TObject);
  private
    { Private declarations }
  var
    order_hdr_id: integer;

  public
    { Public declarations }
  var
    call_form: string;
    jenis_kelamin_id: string;
    p_order_header_id: integer;

  var
    order_id: integer;

  end;

function frmBayar: TfrmBayar;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, UnitFODaftar, ServerModule,
  UnitReportDisplay, UnitFOHomeService, UnitQz, System.NetEncoding;

procedure insert_pembayaran(flg_first: string);
var
  xnow, pf1, pf2, pf1_NoNota, pf2_NoNota, NoNota_length, NoNota_max,
    reset_nonota, last_nonota, nomor_nota: string;
  pembayaran_id: integer;
begin
  with frmBayar do
  begin
    // Nota
    QSave.SQL.Text := 'lock tables penomoran write';
    QSave.ExecSQL;

    if QSave.Active then
      QSave.Active := False;
    QSave.SQL.Text :=
      'select pf1_NoNota,pf2_NoNota,NoNota_length,NoNota_max,reset_nonota,left(last_nonota,10) as last_nonota,left(now(),10) as xnow '
      + ' from penomoran';
    QSave.Active := True;
    pf1_NoNota := QSave.FieldByName('pf1_NoNota').AsString;
    pf2_NoNota := QSave.FieldByName('pf2_NoNota').AsString;
    NoNota_length := QSave.FieldByName('NoNota_length').AsString;
    NoNota_max := QSave.FieldByName('NoNota_max').AsString;
    reset_nonota := QSave.FieldByName('reset_nonota').AsString;
    last_nonota := QSave.FieldByName('last_nonota').AsString;
    xnow := QSave.FieldByName('xnow').AsString;

    if last_nonota <> xnow then
    begin
      FDcmd.CommandText.Text :=
        'update penomoran set NoNota_max = 1,last_nonota=now(),reset_nonota = '
        + NoNota_max;
      FDcmd.Execute();
      NoNota_max := '1';
    end;

    if QSave.Active then
      QSave.Active := False;
    QSave.SQL.Text := 'select ' + pf2_NoNota + ' as pf2';
    QSave.Active := True;
    pf2 := QSave.FieldByName('pf2').AsString;

    nomor_nota := pf1 + pf2 + Format('%.*d', [StrToInt(NoNota_length),
      StrToInt(NoNota_max)]);

    FDcmd.CommandText.Text := 'update penomoran set NoNota_max = ' +
      IntToSTr(StrToInt(NoNota_max) + 1) + ',last_nonota=now()';
    FDcmd.Execute();

    QSave.SQL.Text := 'unlock tables';
    QSave.ExecSQL;

    if QSave.Active then
      QSave.Active := False;
    QSave.Params.Clear;
    QSave.Params.Add.Name := 'user_id';
    QSave.Params.Add.Name := 'order_header_id';
    QSave.Params.Add.Name := 'tipe_bayar_id';
    QSave.Params.Add.Name := 'jumlah';
    QSave.Params.Add.Name := 'charge';
    QSave.Params.Add.Name := 'nomor';
    QSave.Params.Add.Name := 'flg_first';
    QSave.Params.Add.Name := 'tagihan';
    QSave.SQL.Text :=
      'insert into pembayaran(tanggal,user_id,order_header_id,tipe_bayar_id,jumlah,charge,nomor,flg_first,tagihan) '
      + ' values(now(),:user_id,:order_header_id,:tipe_bayar_id,:jumlah,:charge,:nomor,:flg_first,:tagihan)';
    QSave.ParamByName('user_id').Value := UniApplication.Cookies.GetCookie
      ('UserId');
    QSave.ParamByName('order_header_id').Value := order_hdr_id;
    QSave.ParamByName('tipe_bayar_id').Value := qJenisPemb.FieldByName('id')
      .AsInteger;
    QSave.ParamByName('jumlah').Value :=
      StrToFloat(StringReplace(edPembayaran.Text, ',', '', [rfReplaceAll]));
    QSave.ParamByName('charge').Value :=
      StrToFloat(StringReplace(edCharge.Text, ',', '', [rfReplaceAll]));
    QSave.ParamByName('nomor').Value := nomor_nota;
    QSave.ParamByName('flg_first').Value := flg_first;
    QSave.ParamByName('tagihan').Value :=
      StrToFloat(StringReplace(edTagihan.Text, ',', '', [rfReplaceAll]));
    QSave.ExecSQL;

    if QSave.Active then
      QSave.Active := False;
    QSave.Params.Clear;
    QSave.SQL.Text := 'select last_insert_id() as lid  from pembayaran';
    QSave.Active := True;
    pembayaran_id := QSave.FieldByName('lid').AsInteger;

    if QSave.Active then
      QSave.Active := True;
    QSave.Params.Clear;
    QSave.Params.Add.Name := 'pembayaran_id';
    QSave.Params.Add.Name := 'tagihan';
    QSave.Params.Add.Name := 'flgLunas';
    QSave.Params.Add.Name := 'id';
    QSave.SQL.Text :=
      'update order_header set pembayaran_id = :pembayaran_id,tagihan = :tagihan, flgLunas = :flgLunas where id = :id ';
    QSave.ParamByName('pembayaran_id').Value := pembayaran_id;
    QSave.ParamByName('tagihan').Value :=
      StrToFloat(StringReplace(edTagihan.Text, ',', '', [rfReplaceAll]));
    QSave.ParamByName('flgLunas').Value := 'N';
    if edTagihan.Text = '0.00' then
      QSave.ParamByName('flgLunas').Value := 'Y';
    QSave.ParamByName('id').Value := order_hdr_id;
    QSave.ExecSQL;

    QSave.Params.Clear;
    QSave.Params.Add.Name := 'id';
    QSave.SQL.Text := 'update order_header set status_id=1 where id = :id ';
    QSave.ParamByName('id').Value := order_hdr_id;
    QSave.ExecSQL;

    QSave.Params.Clear;
    QSave.Params.Add.Name := 'header_id';
    QSave.SQL.Text :=
      'update order_detail set status_id=1 where header_id = :header_id ';
    QSave.ParamByName('header_id').Value := order_hdr_id;
    QSave.ExecSQL;

    QSave.Params.Clear;
    QSave.Params.Add.Name := 'order_header_id';
    QSave.Params.Add.Name := 'order_status_id';
    QSave.Params.Add.Name := 'user_id';
    QSave.Params.Add.Name := 'keterangan';
    QSave.SQL.Text :=
      'insert into order_status_time (order_header_id,tanggal,order_status_id,user_id,keterangan) '
      + ' values (:order_header_id,now(),:order_status_id,:user_id,:keterangan )';
    QSave.ParamByName('order_header_id').Value := order_hdr_id;
    QSave.ParamByName('order_status_id').Value := '1';
    QSave.ParamByName('user_id').Value := UniApplication.Cookies.GetCookie
      ('UserId');
    QSave.ParamByName('keterangan').Value := 'disc : ' +
      FloatToStr(StrToFloat(StringReplace(frmFODaftar.edDiscount.Text, ',', '',
      [rfReplaceAll]))) + '%';
    QSave.ExecSQL;

    QSave.Params.Clear;
    QSave.Params.Add.Name := 'id';
    QSave.SQL.Text :=
      'update pasien set tanggal_akhir_periksa=now(),jumlah_periksa=jumlah_periksa+1,jumlah_amount=jumlah_amount + '
      + FloatToStr(StrToFloat(StringReplace(edPembayaran.Text, ',', '',
      [rfReplaceAll]))) + ' where id = :id ';
    QSave.ParamByName('id').Value := frmFODaftar.edPasienId.Text;
    QSave.ExecSQL;

    QSave.Params.Clear;
    QSave.Params.Add.Name := 'id';
    QSave.SQL.Text :=
      'update dokter set tanggal_pasien_terakhir=now(),total_pasien=total_pasien+1, total_amount=total_amount + '
      + FloatToStr(StrToFloat(StringReplace(edPembayaran.Text, ',', '',
      [rfReplaceAll]))) + ' where id = :id ';
    QSave.ParamByName('id').Value := frmFODaftar.edDokterId.Text;
    QSave.ExecSQL;

    QSave.Params.Clear;
    QSave.Params.Add.Name := 'id';
    QSave.SQL.Text :=
      'UPDATE order_header h, dokter d SET h.dokter_discount = d.discount WHERE h.dokter_id = d.id and h.id = :id ';
    QSave.ParamByName('id').Value := order_hdr_id;
    QSave.ExecSQL;
  end;
end;

procedure insert_order_detail(order_header_id: integer; kode: string);
var
  level, cetak_nota, cetak_hasil, ada_hasil, nama_test, nilai_normal,
    nilai_normal_auto, nilai_normal_min, nilai_normal_max, rujukan,
    ada_subtest: string;
  pasien_id, test_id: integer;
  harga: Currency;
begin
  with frmBayar do
  begin
    if QSave2.Active then
      QSave2.Active := False;
    QSave2.Params.Clear;
    QSave2.Params.Add.Name := 'order_header_id';
    QSave2.SQL.Text :=
      'select pasien_id from order_header where id = :order_header_id ';
    QSave2.ParamByName('order_header_id').Value := order_header_id;
    QSave2.Active := True;
    pasien_id := QSave2.FieldByName('pasien_id').AsInteger;

    if QSave2.Active then
      QSave2.Active := False;
    QSave2.Params.Clear;
    QSave2.Params.Add.Name := 'pasien_id';
    QSave2.SQL.Text :=
      'select p.*,k.nama as kelamin_nama,pf.nama as pf_nama from ' +
      ' pasien p, jenis_kelamin k, prefix pf ' +
      ' where p.id = :pasien_id and p.jenis_kelamin_id = k.id and p.prefix_id = pf.id';
    QSave2.ParamByName('pasien_id').Value := pasien_id;
    QSave2.Active := True;

    if QSave2.Active then
      QSave2.Active := False;
    QSave2.Params.Clear;
    QSave2.Params.Add.Name := 'kode';
    QSave2.SQL.Text :=
      'select id,level,cetak_nota,cetak_hasil,ada_hasil,nama,ada_subtest from test where kode = :kode ';
    QSave2.ParamByName('kode').Value := kode;
    QSave2.Active := True;
    test_id := QSave2.FieldByName('id').AsInteger;
    level := QSave2.FieldByName('level').AsString;
    cetak_nota := QSave2.FieldByName('cetak_nota').AsString;
    cetak_hasil := QSave2.FieldByName('cetak_hasil').AsString;
    ada_hasil := QSave2.FieldByName('ada_hasil').AsString;
    nama_test := QSave2.FieldByName('nama').AsString;
    ada_subtest := QSave2.FieldByName('ada_subtest').AsString;

    QSave2.Params.Clear;
    QSave2.Params.Add.Name := 'test_id';
    QSave2.SQL.Text :=
      'select harga from harga where test_id = :test_id and urgency_id = 1 and tipe_pasien_id = 1';
    QSave2.ParamByName('test_id').Value := test_id;
    QSave2.Active := True;
    harga := QSave2.FieldByName('harga').AsCurrency;

    if QSave2.Active then
      QSave2.Active := False;
    QSave2.Params.Clear;
    QSave2.Params.Add.Name := 'test_id';
    QSave2.Params.Add.Name := 'jenis_kelamin_id';
    QSave2.SQL.Text :=
      'select n.*,s.konversi from nilai_normal n  left join satuan_umur s on n.umur_satuan_id = s.id '
      + ' where test_id = :test_id and n.jenis_kelamin_id = :jenis_kelamin_id order by flg_kelamin_umur desc, flg_umur desc, flg_kelamin desc ,flg_text desc';
    QSave2.ParamByName('test_id').Value := test_id;
    QSave2.ParamByName('jenis_kelamin_id').Value :=
      frmFODaftar.edJenisKelaminId.Text;
    QSave2.Active := True;
    if QSave2.RecordCount > 0 then
    begin
      nilai_normal := QSave2.FieldByName('keterangan').AsString;
      nilai_normal_auto := QSave2.FieldByName('flg_auto').AsString;
      nilai_normal_min := QSave2.FieldByName('nilai_min').AsString;
      nilai_normal_max := QSave2.FieldByName('nilai_max').AsString;
      rujukan := QSave2.FieldByName('rujukan').AsString;
    end
    else
    begin
      nilai_normal := '';
      nilai_normal_auto := 'N';
      nilai_normal_min := '0';
      nilai_normal_max := '0';
      rujukan := '';
    end;

    QSave2.Params.Clear;
    QSave2.Params.Add.Name := 'header_id';
    QSave2.Params.Add.Name := 'test_id';
    QSave2.Params.Add.Name := 'test_kode';
    QSave2.Params.Add.Name := 'level';
    QSave2.Params.Add.Name := 'cetak_nota';
    QSave2.Params.Add.Name := 'cetak_hasil';
    QSave2.Params.Add.Name := 'ada_hasil';
    QSave2.Params.Add.Name := 'nama_test';
    QSave2.Params.Add.Name := 'harga';
    QSave2.Params.Add.Name := 'nilai_normal';
    QSave2.Params.Add.Name := 'hasil';
    QSave2.Params.Add.Name := 'hasil_si';
    QSave2.Params.Add.Name := 'flg_susul';
    // QSave2.Params.Add.Name := 'tanggal_susul';
    QSave2.Params.Add.Name := 'urgency_id';
    QSave2.Params.Add.Name := 'status_id';
    QSave2.Params.Add.Name := 'nilai_normal_auto';
    QSave2.Params.Add.Name := 'nilai_normal_min';
    QSave2.Params.Add.Name := 'nilai_normal_max';
    QSave2.Params.Add.Name := 'rujukan';
    QSave2.SQL.Text :=
      'insert into order_detail(header_id,test_id,test_kode,level,cetak_nota,cetak_hasil,ada_hasil,nama_test,harga,nilai_normal,hasil,hasil_si,flg_susul,tanggal_susul,urgency_id,status_id,nilai_normal_auto,nilai_normal_min,nilai_normal_max,rujukan) '
      + ' values (:header_id,:test_id,:test_kode,:level,:cetak_nota,:cetak_hasil,:ada_hasil,:nama_test,:harga,:nilai_normal,:hasil,:hasil_si,:flg_susul,NOW(),:urgency_id,:status_id,:nilai_normal_auto,:nilai_normal_min,:nilai_normal_max,:rujukan)';
    QSave2.ParamByName('header_id').Value := order_header_id;
    QSave2.ParamByName('test_id').Value := test_id;
    QSave2.ParamByName('test_kode').Value := kode;
    QSave2.ParamByName('level').Value := level;
    QSave2.ParamByName('cetak_nota').Value := cetak_nota;
    QSave2.ParamByName('cetak_hasil').Value := cetak_hasil;
    QSave2.ParamByName('ada_hasil').Value := ada_hasil;
    QSave2.ParamByName('nama_test').Value := nama_test;
    QSave2.ParamByName('harga').Value := harga;
    QSave2.ParamByName('nilai_normal').Value := nilai_normal;
    QSave2.ParamByName('hasil').Value := '';
    QSave2.ParamByName('hasil_si').Value := '';
    QSave2.ParamByName('flg_susul').Value := 'N';
    // QSave2.ParamByName('tanggal_susul').Value := '';
    QSave2.ParamByName('urgency_id').Value := '1';
    QSave2.ParamByName('status_id').Value := '1';
    QSave2.ParamByName('nilai_normal_auto').Value := nilai_normal_auto;
    QSave2.ParamByName('nilai_normal_min').Value := nilai_normal_min;
    QSave2.ParamByName('nilai_normal_max').Value := nilai_normal_max;
    QSave2.ParamByName('rujukan').Value := rujukan;
    QSave2.ExecSQL;
  end;
end;

procedure update_order_detail(lid: integer);
var
  I, baru_detail_id: integer;
  kode, test_id, test_kode, level, cetak_nota, cetak_hasil, ada_hasil,
    nama_test, harga, nilai_normal, hasil, hasil_si, flg_susul, status_id,
    nilai_normal_auto, nilai_normal_min, nilai_normal_max, rujukan, tmpSQL,
    urgency_id: string;
  b_baru: boolean;
begin
  urgency_id := '1';

  // // ambil header
  // if frmBayar.qTmp.Active then
  // frmBayar.qTmp.Active := False;
  // frmBayar.qTmp.Params.Clear;
  // frmBayar.qTmp.Params.Add.Name := 'id';
  // frmBayar.qTmp.SQL.Text := 'SELECT p.jenis_kelamin_id FROM order_header oh ' +
  // ' LEFT JOIN pasien p ON oh.pasien_id = p.id ' + ' WHERE oh.id = :id ';
  // frmBayar.qTmp.ParamByName('id').Value := frmBayar.order_id;
  // frmBayar.qTmp.Active := True;
  //
  // frmFODaftar.jenis_kelamin_id := frmBayar.qTmp.FieldByName('jenis_kelamin_id').AsString;

  // order_deatail
  try
    if frmBayar.qTmp.Active then
      frmBayar.qTmp.Active := False;
    frmBayar.qTmp.SQL.Text := 'SELECT * FROM order_detail WHERE header_id = ' +
      QuotedStr(IntToSTr(frmBayar.order_id));
    frmBayar.qTmp.Active := True;

    for I := 1 to frmFODaftar.GrdPemeriksaan.RowCount - 1 do
    begin
      kode := frmFODaftar.GrdPemeriksaan.Cells[0, I];
      if kode <> '' then
      begin
        // cek apakah sudah ada
        b_baru := True;
        baru_detail_id := 0;
        frmBayar.qTmp.First;
        while not frmBayar.qTmp.Eof do
        begin
          if kode = frmBayar.qTmp.FieldByName('test_kode').AsString then
            b_baru := False;
          baru_detail_id := frmBayar.qTmp.FieldByName('id').AsInteger;
          frmBayar.qTmp.Next;
        end;

        if frmBayar.FDQuery.Active then
          frmBayar.FDQuery.Active := False;
        frmBayar.FDQuery.SQL.Text :=
          'select id,level,cetak_nota,cetak_hasil,ada_hasil,nama from test where kode = '
          + QuotedStr(kode) + ' ';
        frmBayar.FDQuery.Active := True;

        // header_id := lid;
        test_id := frmBayar.FDQuery.FieldByName('id').AsString;
        test_kode := kode;
        level := frmBayar.FDQuery.FieldByName('level').AsString;
        cetak_nota := frmBayar.FDQuery.FieldByName('cetak_nota').AsString;
        cetak_hasil := frmBayar.FDQuery.FieldByName('cetak_hasil').AsString;
        ada_hasil := frmBayar.FDQuery.FieldByName('ada_hasil').AsString;
        nama_test := frmBayar.FDQuery.FieldByName('nama').AsString;
        harga := StringReplace(frmFODaftar.GrdPemeriksaan.Cells[2, I], ',', '',
          [rfReplaceAll]);
        nilai_normal := frmFODaftar.edKelamin.Text;
        hasil := '';
        hasil_si := '';
        flg_susul := 'N';
        status_id := '1';
        nilai_normal_auto := 'Y';

        if frmBayar.FDQuery.Active then
          frmBayar.FDQuery.Active := False;
        frmBayar.FDQuery.SQL.Text :=
          'select nilai_min,nilai_max,rujukan from nilai_normal where  test_id = '
          + test_id + ' and jenis_kelamin_id = ' + frmBayar.jenis_kelamin_id;

        frmBayar.FDQuery.Active := True;

        nilai_normal_min := '0';
        nilai_normal_max := '0';
        rujukan := ' ';

        if frmBayar.FDQuery.RecordCount > 0 then
        begin
          nilai_normal_min := frmBayar.FDQuery.FieldByName('nilai_min')
            .AsString;
          nilai_normal_max := frmBayar.FDQuery.FieldByName('nilai_max')
            .AsString;
          rujukan := frmBayar.FDQuery.FieldByName('rujukan').AsString;
        end;

        if b_baru then
        begin
          tmpSQL := 'insert into order_detail(id,header_id,test_id,test_kode,level,cetak_nota,cetak_hasil,ada_hasil,nama_test,harga,nilai_normal,hasil,hasil_si,flg_susul,tanggal_susul,urgency_id,status_id,nilai_normal_auto,nilai_normal_min,nilai_normal_max,rujukan) ';
          tmpSQL := tmpSQL + ' values(null,' +
            QuotedStr(IntToSTr(frmBayar.order_id)) + ',' + test_id + ',' +
            QuotedStr(test_kode) + ',' + level + ',' + QuotedStr(cetak_nota) +
            ',' + QuotedStr(cetak_hasil) + ',' + QuotedStr(ada_hasil) + ',' +
            QuotedStr(nama_test) + ',' + harga + ',' + QuotedStr(nilai_normal) +
            ',' + QuotedStr(hasil) + ',' + QuotedStr(hasil_si) + ',' +
            QuotedStr(flg_susul) + ',NOW(),' + urgency_id + ',' + status_id +
            ',' + QuotedStr(nilai_normal_auto) + ',' + nilai_normal_min + ',' +
            nilai_normal_max + ',' + QuotedStr(rujukan) + ')';
          frmBayar.FDcmd.CommandText.Text := tmpSQL;
          frmBayar.FDcmd.Execute();
          // showMessage(tmpSQL);

          // logging
          if frmBayar.cmdLogging.Active then
            frmBayar.cmdLogging.Active := False;
          frmBayar.cmdLogging.ParamByName('order_header_id').AsInteger :=
            frmBayar.order_id;
          frmBayar.cmdLogging.ParamByName('order_status_id').AsInteger := 1;
          // Baru
          frmBayar.cmdLogging.ParamByName('user_id').AsString :=
            UniApplication.Cookies.GetCookie('UserId');
          frmBayar.cmdLogging.ParamByName('keterangan').AsString :=
            'Tambah pemeriksaan : ' + test_kode + ' (' + nama_test + ')';
          frmBayar.cmdLogging.Execute();
        end
        else
        begin
          // update
          tmpSQL := 'update order_detail set urgency_id = ' +
            QuotedStr(urgency_id) + ',harga = ' + QuotedStr(harga) +
            ',nilai_normal=' + QuotedStr(nilai_normal) + ',cetak_nota=' +
            QuotedStr(cetak_nota) + ',cetak_hasil=' + QuotedStr(cetak_hasil) +
            ',ada_hasil=' + QuotedStr(ada_hasil) + ',nilai_normal_auto = ' +
            QuotedStr(nilai_normal_auto) + ',nilai_normal_min = ' +
            QuotedStr(nilai_normal_min) + ',nilai_normal_max = ' +
            QuotedStr(nilai_normal_max) + ',rujukan = ' + QuotedStr(rujukan) +
            ' where id = ' + QuotedStr(IntToSTr(baru_detail_id));

          // showMessage(tmpSQL);
          frmBayar.FDcmd.CommandText.Text := tmpSQL;
          frmBayar.FDcmd.Execute();

        end;
      end;

    end; // end for

    // update sub total, discount dan total
    frmBayar.FDcmd.Params.Clear;
    frmBayar.FDcmd.Params.Add.Name := 'id';
    frmBayar.FDcmd.Params.Add.Name := 'sub_total';
    frmBayar.FDcmd.Params.Add.Name := 'disc_pct';
    frmBayar.FDcmd.Params.Add.Name := 'disc_amount';
    frmBayar.FDcmd.Params.Add.Name := 'total';
    frmBayar.FDcmd.Params.Add.Name := 'tagihan';
    frmBayar.FDcmd.Params.Add.Name := 'flgLunas';
    frmBayar.FDcmd.CommandText.Text :=
      'UPDATE order_header SET sub_total=:sub_total,disc_pct=:disc_pct,disc_amount=:disc_amount,total=:total,tagihan=:tagihan,flgLunas=:flgLunas '
      + ' WHERE id = :id ';
    frmBayar.FDcmd.ParamByName('id').Value := lid;
    frmBayar.FDcmd.ParamByName('sub_total').Value :=
      StringReplace(frmFODaftar.edSubTotal.Text, ',', '', [rfReplaceAll]);
    frmBayar.FDcmd.ParamByName('disc_pct').Value :=
      StringReplace(frmFODaftar.edDiscount.Text, ',', '', [rfReplaceAll]);;
    frmBayar.FDcmd.ParamByName('disc_amount').Value :=
      StringReplace(frmFODaftar.edDiscAmount.Text, ',', '', [rfReplaceAll]);
    frmBayar.FDcmd.ParamByName('total').Value :=
      StringReplace(frmFODaftar.edTOtal.Text, ',', '', [rfReplaceAll]);
    frmBayar.FDcmd.ParamByName('tagihan').Value :=
      StringReplace(frmBayar.edTagihan.Text, ',', '', [rfReplaceAll]);
    if frmBayar.edTagihan.Text = '0.00' then
      frmBayar.FDcmd.ParamByName('flgLunas').Value := 'Y'
    else
      frmBayar.FDcmd.ParamByName('flgLunas').Value := 'N';
    frmBayar.FDcmd.Execute();
  except
    on E: Exception do
    begin
      frmBayar.showMessage(E.ClassName + ' error raised, with message : ' +
        E.Message);
      UniMainModule.FDConnection1.Rollback;
    end;

  end;

end;

procedure read_insert_detail();
var
  I, test_id: integer;
  kode: string;
begin
  with frmBayar do
  begin
    for I := 1 to frmFODaftar.GrdPemeriksaan.RowCount - 1 do
    begin
      kode := frmFODaftar.GrdPemeriksaan.Cells[0, I];
      if kode <> '' then
      begin

        // cek apakah sudah ada di detail, jika tidak ada insert
        if QCek.Active then
          QCek.Active := False;
        QCek.ParamByName('header_id').Value := order_hdr_id;
        QCek.ParamByName('test_kode').Value := kode;
        QCek.Active := True;
        if QCek.RecordCount = 0 then
          insert_order_detail(order_hdr_id, kode);

        // ada_subtest level 2
        if QSave.Active then
          QSave.Active := False;
        QSave.Params.Clear;
        QSave.Params.Add.Name := 'kode';
        QSave.SQL.Text := 'select id,ada_subtest from test where kode = :kode ';
        QSave.ParamByName('kode').Value := kode;
        QSave.Active := True;
        test_id := QSave.FieldByName('id').AsInteger;

        if QSave.FieldByName('ada_subtest').AsString = 'Y' then
        begin
          if QSave.Active then
            QSave.Active := False;
          QSave.Params.Clear;
          QSave.Params.Add.Name := 'test_id';
          QSave.SQL.Text :=
            'select * from test where induk_kode_id = :test_id and level = 2';
          QSave.ParamByName('test_id').Value := test_id;
          QSave.Active := True;
          QSave.First;

          while not QSave.Eof do
          begin
            insert_order_detail(order_hdr_id, QSave.FieldByName('kode')
              .AsString);

            // ada subtest level 3
            if QSave.FieldByName('ada_subtest').AsString = 'Y' then
            begin
              if QSave3.Active then
                QSave3.Active := False;
              QSave3.Params.Clear;
              QSave3.Params.Add.Name := 'test_id';
              QSave3.SQL.Text :=
                'select * from test where induk_kode_id = :test_id and level = 3';
              QSave3.ParamByName('test_id').Value := QSave.FieldByName('id')
                .AsInteger;
              QSave3.Active := True;
              QSave3.First;

              while not QSave3.Eof do
              begin
                insert_order_detail(order_hdr_id, QSave3.FieldByName('kode')
                  .AsString);
                QSave3.Next;
              end;
            end;

            QSave.Next;
          end;
        end;
      end;
    end;
  end;
end;

function terbilang(dNumber: Extended): string;
const
  aNum: array [1 .. 9] of String = ('satu', 'dua', 'tiga', 'empat', 'lima',
    'enam', 'tujuh', 'delapan', 'sembilan');
  aUnit: array [1 .. 5] of String = ('trilyun', 'milyar', 'juta', 'ribu', '');
var
  iCount, iDigit1, iDigit2, iDigit3: integer;
  sNum2Str, s3Digit, sWord: string;
begin

  Result := '';
  if (dNumber = 0) then
    Exit;
  sNum2Str := Copy(Format('%18.2f', [dNumber]), 1, 15);
  for iCount := 1 to 5 do
  begin
    s3Digit := Copy(sNum2Str, iCount * 3 - 2, 3);
    if (StrToIntDef(s3Digit, 0) <> 0) then
    begin
      sWord := '';
      iDigit1 := StrToIntDef(Copy(s3Digit, 1, 1), 0);
      iDigit2 := StrToIntDef(Copy(s3Digit, 2, 1), 0);
      iDigit3 := StrToIntDef(Copy(s3Digit, 3, 1), 0);
      case iDigit1 of
        2 .. 9:
          sWord := sWord + aNum[iDigit1] + ' ratus ';
        1:
          sWord := sWord + 'seratus ';
      end; { case }

      case iDigit2 of
        2 .. 9:
          sWord := sWord + aNum[iDigit2] + ' puluh ';
        1:
          case iDigit3 of
            2 .. 9:
              sWord := sWord + aNum[iDigit3] + ' belas ';
            1:
              sWord := sWord + 'sebelas ';
            0:
              sWord := sWord + 'sepuluh ';
          end; { case }
      end; { case }

      if (iDigit2 <> 1) then
        case iDigit3 of
          2 .. 9:
            sWord := sWord + aNum[iDigit3] + ' ';
          1:
            if (iCount = 4) and ((iDigit1 + iDigit2) = 0) then
              sWord := sWord + 'se'
            else
              sWord := sWord + 'satu ';
        end;
      Result := Result + sWord + aUnit[iCount] + ' ';
    end;
  end;
  while Result[Length(Result)] = ' ' do
    SetLength(Result, Length(Result) - 1);
end;

procedure Hitung();
var
  fCharge, fTotalBayar, fTotal, fBayar: Currency;
begin
  // isi dengan nol
  frmBayar.edSisa.Color := clWindow;
  frmBayar.edTagihan.Color := clWindow;
  if frmBayar.edCharge.Text = '' then
    frmBayar.edCharge.Text := '0';
  if frmBayar.edTOtal.Text = '' then
    frmBayar.edTOtal.Text := '0';
  if frmBayar.edPembayaran.Text = '' then
    frmBayar.edPembayaran.Text := '0';

  fCharge := StrToFloat(StringReplace(frmBayar.edCharge.Text, ',', '',
    [rfReplaceAll]));
  fTotalBayar := StrToFloat(StringReplace(frmBayar.edTotalBayar.Text, ',', '',
    [rfReplaceAll]));
  fTotal := fTotalBayar + fCharge;
  frmBayar.edTOtal.Text := FormatFloat('#,##0.00', fTotal);
  fBayar := StrToFloat(StringReplace(frmBayar.edPembayaran.Text, ',', '',
    [rfReplaceAll]));
  if fTotal < fBayar then
  begin
    frmBayar.edSisa.Text := FormatFloat('#,##0.00', fBayar - fTotal);
    frmBayar.edTagihan.Text := '0.00';
    frmBayar.edSisa.Color := clInfoBk;
    frmBayar.edTagihan.Color := clWindow;
  end
  else if fTotal > fBayar then
  begin
    frmBayar.edSisa.Text := '0.00';
    frmBayar.edTagihan.Text := FormatFloat('#,##0.00', fTotal - fBayar);
    frmBayar.edTagihan.Color := clInfoBk;
    frmBayar.edSisa.Color := clWindow;
  end
  else
  begin
    frmBayar.edTagihan.Text := '0.00';
    frmBayar.edSisa.Text := '0.00';
    frmBayar.edSisa.Color := clWindow;
    frmBayar.edTagihan.Color := clWindow;

  end;
  frmBayar.edPembayaran.Text := FormatFloat('#,##0.00', fBayar);
  frmBayar.edSave.SetFocus;
end;

procedure BayarPenuh();
begin
  Hitung();
  frmBayar.edPembayaran.Text := frmBayar.edTOtal.Text;
  frmBayar.edSisa.Text := '0.00';
  frmBayar.edTagihan.Text := '0.00';
end;

function frmBayar: TfrmBayar;
begin
  Result := TfrmBayar(UniMainModule.GetFormInstance(TfrmBayar));
end;

procedure TfrmBayar.btnKuitansiClick(Sender: TObject);
var
  filename: string;
  status: boolean;
begin
  // ShowMask('Loading');
  // try
  // uniSession.Synchronize();
  // filename := reportExecReqFileParams('pdf', 'print_kuitansi',
  // IntToSTr(order_hdr_id), '', '', status);

  // if status then
  // begin
  // uniSession.AddJS(printKuitansi(filename));
  // end
  // else
  // showMessage(filename);
  // except
  // on E: Exception do
  // begin
  // frmBayar.showMessage(E.ClassName + ' error raised, with message : ' +
  // E.Message);
  // UniMainModule.FDConnection1.Rollback;
  // end;
  // end;

  ShowMask('Loading');
  uniSession.Synchronize();
  frmReportDisplay.UniURLFrame1.URL := reportExecutionRequest('pdf',
    'print_kuitansi', IntToSTr(order_hdr_id), '', 'param1', 'param2', 'param3');
  frmReportDisplay.ShowModal();

  HideMask;

  // if qKuintansi.Active then
  // qKuintansi.Active := False;
  // if not(order_hdr_id > 0) then
  // order_hdr_id := p_order_header_id;
  // qKuintansi.ParamByName('header_id').AsInteger := order_hdr_id;
  // qKuintansi.Active := True;
  //
  // frxRepKuitansi.PrintOptions.ShowDialog := False;
  // frxRepKuitansi.ShowProgress := False;
  //
  // frxRepKuitansi.EngineOptions.SilentMode := True;
  // frxRepKuitansi.EngineOptions.DestroyForms := False;
  //
  // frxPDFExport1.Background := True;
  // frxPDFExport1.ShowProgress := False;
  // frxPDFExport1.ShowDialog := False;
  // frxPDFExport1.FileName := UniServerModule.NewCacheFileUrl(False, 'pdf', '',
  // '', Result, True);
  //
  // frxPDFExport1.DefaultPath := '';
  //
  // frxRepKuitansi.PreviewOptions.AllowEdit := False;
  // frxRepKuitansi.PrepareReport;
  // frxRepKuitansi.Export(frxPDFExport1);
  //
  // // frmReportDisplay.UniURLFrame1.URL := Result;
  // // frmReportDisplay.ShowModal();
  //
  // // print JS
  // // uniSession.AddJS('function print() { ' +
  // // ' var config = qz.configs.create("KUITANSIPRINTER"); ' +
  // // ' var data = [{ type: "pdf", data: "' + Result + '" }]; ' +
  // // ' qz.print(config, data).catch(function(e) { console.error(e);}); ' + ' } '
  // // + ' if (qz.websocket.isActive()) {  print(); }  else { qz.websocket.connect().then(function() { print();});}  ');
  // uniSession.AddJS(printKuitansi(Result));

end;

procedure TfrmBayar.cbJenisChange(Sender: TObject);
var
  cCharge: Currency;
begin

  if qCharge.Active then
    qCharge.Active := False;
  qCharge.SQL.Text := 'select biaya_pct from tipe_pembayaran where id = ' +
    QuotedStr(IntToSTr(cbJenis.Items.IndexOf(cbJenis.Text))) + ' ';
  qCharge.Active := True;

  cCharge := StrToFloat(StringReplace(edTotalBayar.Text, ',', '', [rfReplaceAll]
    )) * qCharge.FieldByName('biaya_pct').AsFloat / 100;
  edCharge.Text := FormatFloat('#,##0.00', cCharge);

  Hitung();
end;

procedure TfrmBayar.cbJenisKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F1 then
    edSaveClick(self);
  if Key = VK_F2 then
    edCancelClick(self);
  if Key = VK_F3 then
    edPrintClick(self);
  if Key = VK_F4 then
    btnExitClick(self);
  if Key = VK_F5 then
    btnBayarPenuhClick(self);
  if Key = VK_F7 then
    btnLabelClick(self);
  if Key = VK_F11 then
    btnKuitansiClick(self);
  if Key = VK_ESCAPE then
    Close;
end;

procedure TfrmBayar.cbJenisKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F5 then
    BayarPenuh();
  if Key = VK_F1 then
    edSaveClick(self);
  if Key = VK_F1 then
    edSaveClick(self);
  if Key = VK_ESCAPE then
    Close;
end;

procedure TfrmBayar.edCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmBayar.edChargeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F1 then
    edSaveClick(self);
  if Key = VK_F2 then
    edCancelClick(self);
  if Key = VK_F3 then
    edPrintClick(self);
  if Key = VK_F4 then
    btnExitClick(self);
  if Key = VK_F5 then
    btnBayarPenuhClick(self);
  if Key = VK_F7 then
    btnLabelClick(self);
  if Key = VK_F11 then
    btnKuitansiClick(self);
  if Key = VK_ESCAPE then
    Close;
end;

procedure TfrmBayar.edChargeKeyPress(Sender: TObject; var Key: Char);
// var
// fSubTotal, fDiscAmount, fTotal: Currency;
begin
  if (Ord(Key) = VK_RETURN) then
  begin
    { fSubTotal := StrToFloat(StringReplace(edTotalBayar.Text,',','',[rfReplaceAll]));
      fTotal := fSubTotal + StrToFloat(StringReplace(edCharge.Text,',','',[rfReplaceAll]));
      edTotal.Text:= FormatFloat('#,##0.00',fTotal);
      edCharge.Text := FormatFloat('#,##0.00',StrToFloat(StringReplace(edCharge.Text,',','',[rfReplaceAll]))); }
    Hitung();
  end;
end;

procedure TfrmBayar.edPembayaranKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) and (edPembayaran.Text <> '') then
    Hitung();

  if Key = VK_F1 then
    edSaveClick(self);
  if Key = VK_F2 then
    edCancelClick(self);
  if Key = VK_F3 then
    edPrintClick(self);
  if Key = VK_F4 then
    btnExitClick(self);
  if Key = VK_F5 then
    btnBayarPenuhClick(self);
  if Key = VK_F7 then
    btnLabelClick(self);
  if Key = VK_F11 then
    btnKuitansiClick(self);
  if Key = VK_ESCAPE then
    Close;
end;

procedure TfrmBayar.edPrintClick(Sender: TObject);
var
  filename: string;
  status: boolean;
begin
  // ShowMask('Loading');
  // try
  // uniSession.Synchronize();
  // filename := reportExecReqFileParams('pdf', 'print_nota',
  // IntToSTr(order_hdr_id), '', '', status);

  // if status then
  // begin
  // uniSession.AddJS(printKuitansi(filename));
  // end
  // else
  // showMessage(filename);
  // except
  // on E: Exception do
  // begin
  // frmBayar.showMessage(E.ClassName + ' error raised, with message : ' +
  // E.Message);
  // UniMainModule.FDConnection1.Rollback;
  // end;
  // end;

  // finally
  //
  // end;

  ShowMask('Loading');
  uniSession.Synchronize();
  frmReportDisplay.UniURLFrame1.URL := ExecReportParams('pdf', 'print_nota',
    IntToSTr(order_hdr_id), '', '', '', '', '');
  frmReportDisplay.ShowModal();

  HideMask;

  // if qPrint.Active then
  // qPrint.Active := False;
  //
  // if p_order_header_id > 0 then
  // order_hdr_id := p_order_header_id;
  //
  // qPrint.ParamByName('header_id').AsInteger := order_hdr_id;
  // qPrint.Active := True;
  //
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
  //
  //
  //
  // frxPDFExport1.DefaultPath := '';
  //
  // frxRepNota.PreviewOptions.AllowEdit := False;
  // frxRepNota.PrepareReport;
  // frxRepNota.Export(frxPDFExport1);

  // frmReportDisplay.UniURLFrame1.URL := Result;
  // btnLabel.SetFocus;
  // frmReportDisplay.ShowModal();

  // print JS
  // uniSession.AddJS('function print() { '+
  // ' var config = qz.configs.create("KUITANSIPRINTER"); '+
  // ' var data = [{ type: "pdf", data: "'+Result+'" }]; '+
  // ' qz.print(config, data).catch(function(e) { console.error(e);}); '+
  // ' } '+
  // '  if (qz.websocket.isActive()) {  print(); }  else { qz.websocket.connect().then(function() { print();});}  '
  // );

end;

procedure TfrmBayar.edSaveClick(Sender: TObject);
var
  pf1_nolab, pf2_nolab, nolab_length, nolab_max, reset_nolab, last_nolab, xnow,
    pf1, pf2, nomor: string;
  I, test_id, pembayaran_id: integer;
  fUangMuka: Currency;
begin
  ShowMask('Loading');
  uniSession.Synchronize();

  if rbManual.Checked then
  begin
    if edNoLab.Text = '' then
    begin
      showMessage('No. Lab kosong.');
      edNoLab.SetFocus;
      Exit;
    end;

    if QNoLabCari.Active then
      QNoLabCari.Active := False;
    QNoLabCari.ParamByName('nomor').Value := edNoLab.Text;
    QNoLabCari.Active := True;
    if QNoLabCari.RecordCount > 0 then
    begin
      showMessage('No. Lab sudah digunakan.');
      edNoLab.SetFocus;
      Exit;
    end;
  end;

  if call_form = 'fo_daftar' then
  begin
    // simpan transaksi dari pendaftaran
    try
      UniMainModule.FDConnection1.StartTransaction;
      if QSave.Active then
        QSave.Active := False;
      QSave.SQL.Text := 'set autocommit=0';
      QSave.ExecSQL;
      QSave.SQL.Text :=
        'SET SESSION TRANSACTION ISOLATION LEVEL READ UNCOMMITTED';
      QSave.ExecSQL;

      if rbAuto.Checked then
      begin
        // Automatic No LAB
        if QSave.Active then
          QSave.Active := False;
        QSave.SQL.Text :=
          'select pf1_nolab, pf2_nolab,nolab_length,nolab_max, reset_nolab,left(last_nolab,10) as last_nolab,left(now(),10) as xnow '
          + ' from penomoran where organisasi_id = ' +
          UniApplication.Cookies.GetCookie('OrganisasiId');
        QSave.Active := True;

        pf1_nolab := QSave.FieldByName('pf1_nolab').AsString;
        pf2_nolab := QSave.FieldByName('pf2_nolab').AsString;
        nolab_length := QSave.FieldByName('nolab_length').AsString;
        nolab_max := QSave.FieldByName('nolab_max').AsString;
        reset_nolab := QSave.FieldByName('reset_nolab').AsString;
        last_nolab := QSave.FieldByName('last_nolab').AsString;
        xnow := QSave.FieldByName('xnow').AsString;

        if last_nolab <> xnow then
        begin
          FDcmd.CommandText.Text :=
            'update penomoran set nolab_max = 1,last_nolab=now(),reset_nolab = '
            + nolab_max + ' where organisasi_id = ' +
            UniApplication.Cookies.GetCookie('OrganisasiId');
          FDcmd.Execute();
          nolab_max := '1';
        end;

        pf1 := '';
        if pf1_nolab <> '' then
        begin
          if QSave.Active then
            QSave.Active := False;
          QSave.SQL.Text := 'select ' + pf1_nolab + ' as pf1';
          QSave.Active := True;
          pf1 := QSave.FieldByName('pf1').AsString;
        end;

        if QSave.Active then
          QSave.Active := False;
        QSave.SQL.Text := 'select ' + pf2_nolab + ' as pf2';
        QSave.Active := True;
        pf2 := QSave.FieldByName('pf2').AsString;

        QSave.SQL.Text := 'update penomoran set nolab_max = ' +
          IntToSTr(StrToInt(nolab_max) + 1) + ',last_nolab=now()' +
          ' where organisasi_id = ' + UniApplication.Cookies.GetCookie
          ('OrganisasiId');
        QSave.ExecSQL;
        QSave.SQL.Text := 'unlock tables';
        QSave.ExecSQL;

        nomor := pf1 + pf2 + Format('%.*d', [StrToInt(nolab_length),
          StrToInt(nolab_max)]);
      end
      else
      begin
        // Manual no Lab
        nomor := edNoLab.Text;
      end;

      QSave.Params.Clear;
      QSave.Params.Add.Name := 'pasien_id';
      QSave.Params.Add.Name := 'dokter_id';
      QSave.Params.Add.Name := 'tipe_pasien_id';
      QSave.Params.Add.Name := 'tipe_hasil_id';
      QSave.Params.Add.Name := 'nomor';
      QSave.Params.Add.Name := 'sub_total';
      QSave.Params.Add.Name := 'tagihan';
      QSave.Params.Add.Name := 'disc_pct';
      QSave.Params.Add.Name := 'disc_amount';
      QSave.Params.Add.Name := 'total';
      QSave.Params.Add.Name := 'flgLunas';
      QSave.Params.Add.Name := 'cetak';
      QSave.Params.Add.Name := 'urgency_id';
      QSave.Params.Add.Name := 'ket_tgl_selesai';
      QSave.SQL.Text :=
        'insert into order_header(tanggal,pasien_id,dokter_id,tipe_pasien_id,tipe_hasil_id,nomor,sub_total,tagihan,disc_pct,disc_amount,total,flgLunas,cetak,urgency_id,ket_tgl_selesai,organisasi_id,lokasi_id) '
        + ' values(now(),:pasien_id,:dokter_id,:tipe_pasien_id,:tipe_hasil_id,:nomor,:sub_total,:tagihan,:disc_pct,:disc_amount,:total,:flgLunas,:cetak,:urgency_id,:ket_tgl_selesai,:organisasi_id,:lokasi_id)';
      QSave.ParamByName('pasien_id').Value := frmFODaftar.edPasienId.Text;
      QSave.ParamByName('dokter_id').Value := frmFODaftar.edDokterId.Text;
      QSave.ParamByName('tipe_pasien_id').Value := '1';
      QSave.ParamByName('tipe_hasil_id').Value := '1';
      QSave.ParamByName('nomor').Value := nomor;
      QSave.ParamByName('sub_total').Value :=
        StrToFloat(StringReplace(frmFODaftar.edSubTotal.Text, ',', '',
        [rfReplaceAll]));
      QSave.ParamByName('tagihan').Value :=
        StrToFloat(StringReplace(edSisa.Text, ',', '', [rfReplaceAll]));
      QSave.ParamByName('disc_pct').Value :=
        StrToFloat(StringReplace(frmFODaftar.edDiscount.Text, ',', '',
        [rfReplaceAll]));
      QSave.ParamByName('disc_amount').Value :=
        StrToFloat(StringReplace(frmFODaftar.edDiscAmount.Text, ',', '',
        [rfReplaceAll]));
      QSave.ParamByName('total').Value :=
        StrToFloat(StringReplace(frmFODaftar.edTOtal.Text, ',', '',
        [rfReplaceAll]));
      QSave.ParamByName('flgLunas').Value := 'Y';
      if StrToFloat(StringReplace(edTagihan.Text, ',', '', [rfReplaceAll])) > 0
      then
        QSave.ParamByName('flgLunas').Value := 'N';
      QSave.ParamByName('cetak').Value := '0';
      QSave.ParamByName('urgency_id').Value := '1';
      QSave.ParamByName('ket_tgl_selesai').Value := '';
      QSave.ParamByName('organisasi_id').Value :=
        UniApplication.Cookies.GetCookie('OrganisasiId');
      QSave.ParamByName('lokasi_id').Value := UniApplication.Cookies.GetCookie
        ('LokasiId');
      QSave.ExecSQL;

      if QSave.Active then
        QSave.Active := False;
      QSave.Params.Clear;
      QSave.SQL.Text := 'select last_insert_id() as lid from order_header';
      QSave.Active := True;
      order_hdr_id := QSave.FieldByName('lid').AsInteger;
      read_insert_detail();

      // for I := 1 to frmFODaftar.GrdPemeriksaan.RowCount - 1 do
      // begin
      // kode := frmFODaftar.GrdPemeriksaan.Cells[0, I];
      // if kode <> '' then
      // begin
      // insert_order_detail(order_hdr_id, kode);
      //
      // // ada_subtest level 2
      // if QSave.Active then
      // QSave.Active := False;
      // QSave.Params.Clear;
      // QSave.Params.Add.Name := 'kode';
      // QSave.SQL.Text :=
      // 'select id,ada_subtest from test where kode = :kode ';
      // QSave.ParamByName('kode').Value := kode;
      // QSave.Active := True;
      // test_id := QSave.FieldByName('id').AsInteger;
      //
      // if QSave.FieldByName('ada_subtest').AsString = 'Y' then
      // begin
      // if QSave.Active then
      // QSave.Active := False;
      // QSave.Params.Clear;
      // QSave.Params.Add.Name := 'test_id';
      // QSave.SQL.Text :=
      // 'select * from test where induk_kode_id = :test_id and level = 2';
      // QSave.ParamByName('test_id').Value := test_id;
      // QSave.Active := True;
      // QSave.First;
      //
      // while not QSave.Eof do
      // begin
      // insert_order_detail(order_hdr_id, QSave.FieldByName('kode')
      // .AsString);
      //
      // // ada subtest level 3
      // if QSave.FieldByName('ada_subtest').AsString = 'Y' then
      // begin
      // if QSave3.Active then
      // QSave3.Active := False;
      // QSave3.Params.Clear;
      // QSave3.Params.Add.Name := 'test_id';
      // QSave3.SQL.Text :=
      // 'select * from test where induk_kode_id = :test_id and level = 3';
      // QSave3.ParamByName('test_id').Value := QSave.FieldByName('id')
      // .AsInteger;
      // QSave3.Active := True;
      // QSave3.First;
      //
      // while not QSave3.Eof do
      // begin
      // insert_order_detail(order_hdr_id, QSave3.FieldByName('kode')
      // .AsString);
      // QSave3.Next;
      // end;
      // end;
      //
      // QSave.Next;
      // end;
      // end;
      // end;
      // end;

      insert_pembayaran('Y');

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
      FDcmd.ParamByName('id').Value := order_hdr_id;
      FDcmd.Execute();

      // clear dulu jika ada yang sebelumnya
      FDcmd.Params.Clear;
      FDcmd.Params.Add.Name := 'header_id';
      FDcmd.CommandText.Text :=
        'DELETE FROM order_pengiriman_hasil WHERE header_id = :header_id ';
      FDcmd.ParamByName('header_id').Value := order_hdr_id;
      FDcmd.Execute();

      FDcmd.Params.Clear;
      FDcmd.Params.Add.Name := 'header_id';
      FDcmd.CommandText.Text :=
        'DELETE FROM order_interview WHERE header_id = :header_id ';
      FDcmd.ParamByName('header_id').Value := order_hdr_id;
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
        FDcmd.ParamByName('id').Value := order_hdr_id;
        FDcmd.Execute();
      end;

      // email
      if frmFODaftar.cbHasilEmail.Checked then
      begin
        FDcmd.Params.Clear;
        FDcmd.Params.Add.Name := 'header_id';
        FDcmd.ParamByName('header_id').Value := order_hdr_id;
        FDcmd.Params.Add.Name := 'metode';
        FDcmd.Params.Add.Name := 'data';
        FDcmd.CommandText.Text :=
          'INSERT INTO order_pengiriman_hasil (header_id,metode,data) VALUES (:header_id,:metode,:data)';
        FDcmd.ParamByName('metode').Value := 'email';
        FDcmd.ParamByName('data').Value := frmFODaftar.edHasilEmail.Text;
        FDcmd.Execute();
      end;

      // whatsapp
      if frmFODaftar.cbHasilWa.Checked then
      begin
        FDcmd.Params.Clear;
        FDcmd.Params.Add.Name := 'header_id';
        FDcmd.ParamByName('header_id').Value := order_hdr_id;
        FDcmd.Params.Add.Name := 'metode';
        FDcmd.Params.Add.Name := 'data';
        FDcmd.CommandText.Text :=
          'INSERT INTO order_pengiriman_hasil (header_id,metode,data) VALUES (:header_id,:metode,:data)';
        FDcmd.ParamByName('metode').Value := 'whatsapp';
        FDcmd.ParamByName('data').Value := frmFODaftar.edHasilWa.Text;
        FDcmd.Execute();
      end;

      // ambil sendiri
      if frmFODaftar.cbHasilAmbil.Checked then
      begin
        FDcmd.Params.Clear;
        FDcmd.Params.Add.Name := 'header_id';
        FDcmd.ParamByName('header_id').Value := order_hdr_id;
        FDcmd.Params.Add.Name := 'metode';
        FDcmd.Params.Add.Name := 'data';
        FDcmd.CommandText.Text :=
          'INSERT INTO order_pengiriman_hasil (header_id,metode,data) VALUES (:header_id,:metode,:data)';
        FDcmd.ParamByName('metode').Value := 'ambil';
        FDcmd.ParamByName('data').Value := '';
        FDcmd.Execute();
      end;

      // perujuk
      if frmFODaftar.cbKirimPerujuk.Checked then
      begin
        FDcmd.Params.Clear;
        FDcmd.Params.Add.Name := 'header_id';
        FDcmd.ParamByName('header_id').Value := order_hdr_id;
        FDcmd.Params.Add.Name := 'metode';
        FDcmd.Params.Add.Name := 'data';
        FDcmd.CommandText.Text :=
          'INSERT INTO order_pengiriman_hasil (header_id,metode,data) VALUES (:header_id,:metode,:data)';
        FDcmd.ParamByName('metode').Value := 'perujuk';
        FDcmd.ParamByName('data').Value := frmFODaftar.edDokter.Text;
        FDcmd.Execute();
      end;

      // rumah
      if frmFODaftar.cbKirimRumah.Checked then
      begin
        FDcmd.Params.Clear;
        FDcmd.Params.Add.Name := 'header_id';
        FDcmd.ParamByName('header_id').Value := order_hdr_id;
        FDcmd.Params.Add.Name := 'metode';
        FDcmd.Params.Add.Name := 'data';
        FDcmd.CommandText.Text :=
          'INSERT INTO order_pengiriman_hasil (header_id,metode,data) VALUES (:header_id,:metode,:data)';
        FDcmd.ParamByName('metode').Value := 'rumah';
        FDcmd.ParamByName('data').Value := '';
        FDcmd.Execute();
      end;

      // interview
      for I := 1 to frmFODaftar.grdInterview.RowCount do
      begin
        if frmFODaftar.grdInterview.Cells[0, I] <> '' then
        begin
          FDcmd.Params.Clear;
          FDcmd.Params.Add.Name := 'header_id';
          FDcmd.ParamByName('header_id').Value := order_hdr_id;
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
        end;
      end;

      // tipe sample
      FDcmd.Params.Clear;
      FDcmd.Params.Add.Name := 'header_id';
      FDcmd.ParamByName('header_id').Value := order_hdr_id;
      FDcmd.Params.Add.Name := 'tipe_sample_id';
      FDcmd.ParamByName('tipe_sample_id').Value := '1';
      if frmFODaftar.cbTipeSample.Text <> '' then
        FDcmd.ParamByName('tipe_sample_id').Value :=
          frmFODaftar.QTipeSample.FieldByName('id').AsInteger;

      FDcmd.CommandText.Text :=
        'update order_header set tipe_sample_id = :tipe_sample_id where id = :header_id';
      FDcmd.Execute();

      // tipe pasien
      FDcmd.Params.Clear;
      FDcmd.Params.Add.Name := 'header_id';
      FDcmd.ParamByName('header_id').Value := order_hdr_id;
      FDcmd.Params.Add.Name := 'tipe_pasien_id';
      FDcmd.ParamByName('tipe_pasien_id').Value := '1';
      if frmFODaftar.cbTipePasien.Text <> '' then
        FDcmd.ParamByName('tipe_pasien_id').Value :=
          frmFODaftar.QTipePasien.FieldByName('id').AsInteger;

      FDcmd.CommandText.Text :=
        'update order_header set tipe_pasien_id = :tipe_pasien_id where id = :header_id';
      FDcmd.Execute();

      // buttons
      edSave.Enabled := False;
      edCancel.Enabled := False;
      edPrint.Enabled := True;
      btnKuitansi.Enabled := True;
      btnLabel.Enabled := True;

      if not(StrToFloat(StringReplace(edTagihan.Text, ',', '', [rfReplaceAll])
        ) > 0) then
        LblStatusLunas.Caption := 'SUDAH LUNAS';
      lblNoLab.Caption := 'No. Lab : ' + nomor;

      // Clear fields
      frmFODaftar.tgl_hasil := Now();
      frmFODaftar.catatan_hasil := '';
      frmBayar.edPrint.SetFocus;

      // disable
      cbJenis.Enabled := False;
      edCharge.Enabled := False;
      edTotalBayar.Enabled := False;
      edTOtal.Enabled := False;
      edPembayaran.Enabled := False;
      edSisa.Enabled := False;
      edTagihan.Enabled := False;

      QSave.Params.Clear;
      QSave.SQL.Text := 'COMMIT';
      QSave.ExecSQL;

      QSave.Params.Clear;
      QSave.SQL.Text := 'SET AUTOCOMMIT = 1 ';
      QSave.ExecSQL;

      UniMainModule.FDConnection1.Commit;

    except
      UniMainModule.FDConnection1.Rollback;
      raise;

    end;

  end
  else if (call_form = 'fo_status') or (call_form = 'retur') then
  begin
    try
      order_hdr_id := order_id;

      // clear detail first
      FDcmd.Params.Clear;
      FDcmd.Params.Add.Name := 'header_id';
      FDcmd.ParamByName('header_id').Value := order_hdr_id;
      FDcmd.CommandText.Text :=
        'DELETE FROM order_detail WHERE header_id = :header_id';
      FDcmd.Execute();

      read_insert_detail();

      // update total
      FDcmd.Params.Clear;
      FDcmd.Params.Add.Name := 'id';
      FDcmd.Params.Add.Name := 'sub_total';
      FDcmd.Params.Add.Name := 'tagihan';
      FDcmd.Params.Add.Name := 'disc_pct';
      FDcmd.Params.Add.Name := 'disc_amount';
      FDcmd.Params.Add.Name := 'total';
      FDcmd.Params.Add.Name := 'flgLunas';
      FDcmd.ParamByName('id').Value := order_hdr_id;
      FDcmd.ParamByName('sub_total').Value :=
        StrToFloat(StringReplace(frmFODaftar.edSubTotal.Text, ',', '',
        [rfReplaceAll]));
      FDcmd.ParamByName('tagihan').Value :=
        StrToFloat(StringReplace(edSisa.Text, ',', '', [rfReplaceAll]));
      FDcmd.ParamByName('disc_pct').Value :=
        StrToFloat(StringReplace(frmFODaftar.edDiscount.Text, ',', '',
        [rfReplaceAll]));
      FDcmd.ParamByName('disc_amount').Value :=
        StrToFloat(StringReplace(frmFODaftar.edDiscAmount.Text, ',', '',
        [rfReplaceAll]));
      FDcmd.ParamByName('total').Value :=
        StrToFloat(StringReplace(frmFODaftar.edTOtal.Text, ',', '',
        [rfReplaceAll]));
      FDcmd.ParamByName('flgLunas').Value := 'Y';
      if StrToFloat(StringReplace(edTagihan.Text, ',', '', [rfReplaceAll])) > 0
      then
        FDcmd.ParamByName('flgLunas').Value := 'N';

      FDcmd.CommandText.Text :=
        ' UPDATE order_header SET sub_total=:sub_total, tagihan=:tagihan, disc_pct=:disc_pct, disc_amount=:disc_amount, total=:total, flgLunas=:flgLunas '
        + ' WHERE id=:id ';
      FDcmd.Execute();

      insert_pembayaran('N');

      // buttons
      edSave.Enabled := False;
      edCancel.Enabled := False;
      edPrint.Enabled := True;
      btnKuitansi.Enabled := True;
      btnLabel.Enabled := True;

      if not(StrToFloat(StringReplace(edTagihan.Text, ',', '', [rfReplaceAll])
        ) > 0) then
        LblStatusLunas.Caption := 'SUDAH LUNAS';


      // cek ada tes yang diturn atau tidak
      // with frmBayar do
      // begin
      // for I := 1 to frmFODaftar.GrdPemeriksaan.RowCount - 1 do
      // begin
      //
      // end;

      // Clear fields
      frmFODaftar.tgl_hasil := Now();
      frmFODaftar.catatan_hasil := '';
      frmBayar.edPrint.SetFocus;

      // disable
      cbJenis.Enabled := False;
      edCharge.Enabled := False;
      edTotalBayar.Enabled := False;
      edTOtal.Enabled := False;
      edPembayaran.Enabled := False;
      edSisa.Enabled := False;
      edTagihan.Enabled := False;

      rbNomor.Enabled := False;

      QSave.Params.Clear;
      QSave.SQL.Text := 'COMMIT';
      QSave.ExecSQL;

      QSave.Params.Clear;
      QSave.SQL.Text := 'SET AUTOCOMMIT = 1 ';
      QSave.ExecSQL;

      UniMainModule.FDConnection1.Commit;

      // update uang muka
      fUangMuka := StrToFloat(StringReplace(frmFODaftar.edUangMuka.Text, ',',
        '', [rfReplaceAll]));
      fUangMuka := fUangMuka + StrToFloat(StringReplace(edTOtal.Text, ',', '',
        [rfReplaceAll]));

      frmFODaftar.edUangMuka.Text := FormatFloat('#,##0.00', fUangMuka);

      // cek batal
      if (frmFODaftar.edUangMuka.Text = '0.00') and
        (frmFODaftar.edTOtal.Text = '0.00') then
        frmFODaftar.btnBayar.Caption := 'Batal';

    except
      UniMainModule.FDConnection1.Rollback;
      raise;

    end;
  end
  // else if call_form = 'retur' then
  // begin
  //
  // end
  else
    showMessage('Under development.');

  HideMask;

end;

procedure TfrmBayar.edSisaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F1 then
    edSaveClick(self);
  if Key = VK_F2 then
    edCancelClick(self);
  if Key = VK_F3 then
    edPrintClick(self);
  if Key = VK_F4 then
    btnExitClick(self);
  if Key = VK_F5 then
    btnBayarPenuhClick(self);
  if Key = VK_F7 then
    btnLabelClick(self);
  if Key = VK_F11 then
    btnKuitansiClick(self);
  if Key = VK_ESCAPE then
    Close;
end;

procedure TfrmBayar.edTotalBayarKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F1 then
    edSaveClick(self);
  if Key = VK_F2 then
    edCancelClick(self);
  if Key = VK_F3 then
    edPrintClick(self);
  if Key = VK_F4 then
    btnExitClick(self);
  if Key = VK_F5 then
    btnBayarPenuhClick(self);
  if Key = VK_F7 then
    btnLabelClick(self);
  if Key = VK_F11 then
    btnKuitansiClick(self);
  if Key = VK_ESCAPE then
    Close;
end;

procedure TfrmBayar.edTOtalKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F1 then
    edSaveClick(self);
  if Key = VK_F2 then
    edCancelClick(self);
  if Key = VK_F3 then
    edPrintClick(self);
  if Key = VK_F4 then
    btnExitClick(self);
  if Key = VK_F5 then
    btnBayarPenuhClick(self);
  if Key = VK_F7 then
    btnLabelClick(self);
  if Key = VK_F11 then
    btnKuitansiClick(self);
  if Key = VK_ESCAPE then
    Close;
end;

procedure TfrmBayar.frxRepKuitansiGetValue(const VarName: string;
  var Value: Variant);
begin
  if CompareText(VarName, 'terbilang') = 0 then

    Value := terbilang(qKuintansi.FieldByName('jumlah').AsCurrency);
end;

procedure TfrmBayar.rbManualClick(Sender: TObject);
begin
  if rbAuto.Checked then
  begin
    edNoLab.Clear;
    edNoLab.Enabled := False;
    cbJenis.SetFocus;
  end
  else
  begin
    edNoLab.Enabled := True;
    edNoLab.SetFocus;
  end;
end;

procedure TfrmBayar.btnBayarPenuhClick(Sender: TObject);
begin
  if edSave.Enabled then
    BayarPenuh();
end;

procedure TfrmBayar.btnLabelClick(Sender: TObject);
var
  js, zpl: string;
begin
  try
    if qKuintansi.Active then
      qKuintansi.Active := False;
    if not(order_hdr_id > 0) then
      order_hdr_id := order_id;
    qKuintansi.ParamByName('header_id').AsInteger := order_hdr_id;
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
      qKuintansi.FieldByName('alamat').AsString,
      qKuintansi.FieldByName('tanggal').AsString, qKuintansi.FieldByName('hp')
      .AsString, qKuintansi.FieldByName('dokter').AsString,
      qKuintansi.FieldByName('jenis_kelamin').AsString, zpl);

    uniSession.AddJS(js);
    sleep(100);


    // print tabung disini

    // ambil string zpl
    if Qzpl.Active then
      Qzpl.Active := False;
    Qzpl.SQL.Text := 'SELECT value_text FROM parameters WHERE name = ' +
      QuotedStr('ZPL_LABEL_SAMPEL');
    Qzpl.Active := True;
    zpl := Qzpl.FieldByName('value_text').AsString;

    if QTubes.Active then
      QTubes.Active := False;
    QTubes.ParamByName('header_id').Value := order_hdr_id;
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






    // js := printTubeLabel(no_lab: string; suffix_tube: string;
    // nama_pasien: string; tanggal_lahir: string; asal_pasien: string;
    // nama_tube: string; no_rm: string; no_rm1: string; test: string;
    // gender: string; zpl: string): string;

  except
    on E: Exception do
    begin
      frmBayar.showMessage(E.ClassName + ' error raised, with message : ' +
        E.Message);
      UniMainModule.FDConnection1.Rollback;
    end;
  end;
end;

procedure TfrmBayar.btnExitClick(Sender: TObject);
begin

  if call_form = 'home_service' then
  begin
    frmFODaftar.Close;
    if frmFOHomeService.qPending.Active then
      frmFOHomeService.qPending.Active := False;
    frmFOHomeService.qPending.Active := True;
  end;

  if not(order_id > 0) then
    frmFODaftar.btnClearClick(self);
  Close;
end;

procedure TfrmBayar.UniFormAfterShow(Sender: TObject);
begin
  if not qJenisPemb.Active then
    qJenisPemb.Active := True;
  cbJenis.ItemIndex := 0;
end;

procedure TfrmBayar.UniFormClose(Sender: TObject; var Action: TCloseAction);
begin
  // showmessage(call_form);
  if call_form = 'home_service' then
  begin
    if cmdCallForm.Active then
      cmdCallForm.Active := False;
    cmdCallForm.CommandText.Text := 'update home_service set flg_proses=' +
      QuotedStr('Y') +
      ',proses_user_id = :user_id,order_header_id = :order_header_id where  id = :id ';
    cmdCallForm.ParamByName('user_id').AsString :=
      UniApplication.Cookies.GetCookie('UserId');
    cmdCallForm.ParamByName('order_header_id').AsInteger := order_id;
    cmdCallForm.ParamByName('id').AsInteger := frmFODaftar.home_service_id;
    cmdCallForm.Active := True;
    frmFODaftar.Close;
    if frmFOHomeService.qPending.Active then
      frmFOHomeService.qPending.Active := False;
    frmFOHomeService.qPending.Active := True;
    Close;
  end;
  if call_form = 'pendaftaran' then
  begin
    frmFODaftar.btnClear.OnClick(self);
  end;
end;

procedure TfrmBayar.UniFormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F1 then
    edSaveClick(self);
  if Key = VK_F2 then
    edCancelClick(self);
  if Key = VK_F3 then
    edPrintClick(self);
  if Key = VK_F4 then
    btnExitClick(self);
  if Key = VK_F5 then
    btnBayarPenuhClick(self);
  if Key = VK_F7 then
    btnLabelClick(self);
  if Key = VK_F11 then
    btnKuitansiClick(self);
  if Key = VK_ESCAPE then
    Close;

end;

procedure TfrmBayar.edTagihanKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F1 then
    edSaveClick(self);
  if Key = VK_F2 then
    edCancelClick(self);
  if Key = VK_F3 then
    edPrintClick(self);
  if Key = VK_F4 then
    btnExitClick(self);
  if Key = VK_F5 then
    btnBayarPenuhClick(self);
  if Key = VK_F7 then
    btnLabelClick(self);
  if Key = VK_F11 then
    btnKuitansiClick(self);
  if Key = VK_ESCAPE then
    Close;
end;

end.
