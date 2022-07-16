unit UnitProgramTB;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniPanel, uniPageControl, uniButton, uniBitBtn,
  uniSpeedButton, uniGUIBaseClasses, uniEdit, uniLabel, uniGroupBox,
  uniDateTimePicker, uniBasicGrid, uniDBGrid, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uniMultiItem, uniComboBox,
  uniURLFrame, UnitReportJasper;

type
  TUniProgramTB = class(TUniFrame)
    pcTB: TUniPageControl;
    tsDataPasien: TUniTabSheet;
    tsLihatData: TUniTabSheet;
    UniLabel1: TUniLabel;
    edNomor: TUniEdit;
    UniGroupBox1: TUniGroupBox;
    UniLabel2: TUniLabel;
    edTglTerima: TUniEdit;
    UniLabel3: TUniLabel;
    edJK: TUniEdit;
    UniLabel4: TUniLabel;
    edUmur: TUniEdit;
    UniLabel5: TUniLabel;
    edNama: TUniEdit;
    UniLabel6: TUniLabel;
    edAlamat: TUniEdit;
    UniPanel1: TUniPanel;
    UniPanel2: TUniPanel;
    UniPanel3: TUniPanel;
    UniPanel4: TUniPanel;
    UniPanel5: TUniPanel;
    UniPanel6: TUniPanel;
    UniPanel7: TUniPanel;
    UniPanel8: TUniPanel;
    UniPanel9: TUniPanel;
    UniPanel10: TUniPanel;
    edID: TUniEdit;
    edNamaUPK: TUniEdit;
    dtTglPeriksa: TUniDateTimePicker;
    edAlasanDiag: TUniEdit;
    edAlasanLanjut: TUniEdit;
    edHasilS1: TUniEdit;
    edHasilP: TUniEdit;
    edHasilS2: TUniEdit;
    UniLabel7: TUniLabel;
    edKet: TUniEdit;
    btnSimpan: TUniSpeedButton;
    UniGroupBox2: TUniGroupBox;
    UniDBGrid1: TUniDBGrid;
    btnEdit: TUniSpeedButton;
    QHasilTBHdr: TFDQuery;
    QHasilTBDtl: TFDQuery;
    dsDtl: TDataSource;
    cmdExec: TFDCommand;
    btnHapus: TUniSpeedButton;
    UniContainerPanel1: TUniContainerPanel;
    UniLabel8: TUniLabel;
    cbBln: TUniComboBox;
    UniLabel9: TUniLabel;
    btnShow: TUniSpeedButton;
    edThn: TUniNumberEdit;
    UniSpeedButton1: TUniSpeedButton;
    UniURLFrame1: TUniURLFrame;
    procedure edNomorKeyPress(Sender: TObject; var Key: Char);
    procedure UniFrameBeforeReady(Sender: TObject);
    procedure btnSimpanClick(Sender: TObject);
    procedure btnHapusClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnShowClick(Sender: TObject);
    procedure UniSpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
    procedure loadData();

  var
    dtl_id: integer;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TUniProgramTB.loadData();
begin
  if QHasilTBHdr.Active then
    QHasilTBHdr.Active := False;
  QHasilTBHdr.ParamByName('nomor').Value := edNomor.Text;
  QHasilTBHdr.Active := True;

  btnSimpan.Caption := 'Simpan';

  // enable
  edID.Clear;
  dtTglPeriksa.DateTime := Now;
  edNamaUPK.Clear;
  edAlasanDiag.Clear;
  edAlasanLanjut.Clear;
  edHasilS1.Clear;
  edHasilP.Clear;
  edHasilS2.Clear;
  edKet.Clear;
  btnSimpan.Enabled := False;

  if QHasilTBHdr.RecordCount > 0 then
  begin
    edTglTerima.Text := QHasilTBHdr.FieldByName('tanggal_terima').AsString;
    edJK.Text := QHasilTBHdr.FieldByName('kd_jenis_kelamin').AsString;
    edUmur.Text := QHasilTBHdr.FieldByName('umur').AsString;
    edNama.Text := QHasilTBHdr.FieldByName('nama').AsString;
    edAlamat.Text := QHasilTBHdr.FieldByName('alamat').AsString;
    edNamaUPK.Text := QHasilTBHdr.FieldByName('ruangan').AsString;
    // enable
    edID.Enabled := True;
    dtTglPeriksa.Enabled := True;
    edNamaUPK.Enabled := True;
    edAlasanDiag.Enabled := True;
    edAlasanLanjut.Enabled := True;
    edHasilS1.Enabled := True;
    edHasilP.Enabled := True;
    edHasilS2.Enabled := True;
    edKet.Enabled := True;
    btnSimpan.Enabled := True;

    if QHasilTBDtl.Active then
      QHasilTBDtl.Active := False;
    QHasilTBDtl.ParamByName('nomor').Value := edNomor.Text;
    QHasilTBDtl.Active := True;

    btnHapus.Enabled := False;
    btnEdit.Enabled := False;
    if QHasilTBDtl.RecordCount > 0 then
    begin
      btnEdit.Enabled := True;
      btnHapus.Enabled := True;
    end;

    edID.SetFocus;
  end
  else
  begin
    showMessage('Data nomor [' + edNomor.Text + '] tidak ditemukan.');
    edNomor.SetFocus;
  end;
end;

procedure TUniProgramTB.btnEditClick(Sender: TObject);
begin
  if QHasilTBDtl.RecordCount > 0 then
  begin
    ShowMask('Loading');
    UniSession.Synchronize();
    dtl_id := QHasilTBDtl.FieldByName('id').AsInteger;
    btnSimpan.Caption := 'Update';
    edNomor.Text := QHasilTBDtl.FieldByName('nomor').AsString;
    edID.Text := QHasilTBDtl.FieldByName('no_identitas').AsString;
    dtTglPeriksa.DateTime := QHasilTBDtl.FieldByName('tanggal').AsDateTime;
    edNamaUPK.Text := QHasilTBDtl.FieldByName('nama_upk').AsString;
    edAlasanDiag.Text := QHasilTBDtl.FieldByName('alasan_diag').AsString;
    edAlasanLanjut.Text := QHasilTBDtl.FieldByName('alasan_tindak').AsString;
    edHasilS1.Text := QHasilTBDtl.FieldByName('hasil_s1').AsString;
    edHasilP.Text := QHasilTBDtl.FieldByName('hasil_p').AsString;
    edHasilS2.Text := QHasilTBDtl.FieldByName('hasil_s2').AsString;
    edKet.Text := QHasilTBDtl.FieldByName('keterangan').AsString;
    edNomor.SetFocus;
    HideMask;
  end;
end;

procedure TUniProgramTB.btnHapusClick(Sender: TObject);
begin
  if QHasilTBDtl.RecordCount > 0 then
  begin
    ShowMask('Loading');
    UniSession.Synchronize();
    if cmdExec.Active then
      cmdExec.Active := False;
    cmdExec.Params.Clear;
    cmdExec.CommandText.Text := 'delete from program_tb where id = :id ';
    cmdExec.ParamByName('id').Value := QHasilTBDtl.FieldByName('id').AsInteger;
    cmdExec.Execute();
    loadData();
    HideMask;
  end;
end;

procedure TUniProgramTB.btnShowClick(Sender: TObject);

var
  Result, filter1, filter2, filter3: string;
  nama_report, printer, bln: string;
  status: boolean;
begin
  case cbBln.ItemIndex of
    0:
      bln := '01';
    1:
      bln := '02';
    2:
      bln := '03';
    3:
      bln := '04';
    4:
      bln := '05';
    5:
      bln := '06';
    6:
      bln := '07';
    7:
      bln := '08';
    8:
      bln := '09';
    9:
      bln := '10';
    10:
      bln := '11';
    11:
      bln := '12';
  end;

  ShowMask('Loading');
  UniSession.Synchronize();
  UniURLFrame1.URL := reportExecReqParams('pdf', 'program_tb',
    edThn.Text, bln, '');
  HideMask;
end;

procedure TUniProgramTB.btnSimpanClick(Sender: TObject);
begin
  ShowMask('Loading');
  UniSession.Synchronize();

  if cmdExec.Active then
    cmdExec.Active := False;
  cmdExec.Params.Clear;
  if btnSimpan.Caption = 'Simpan' then
  begin
    cmdExec.CommandText.Text :=
      'insert into program_tb (nomor,no_identitas,tanggal,nama_upk,alasan_diag,alasan_tindak,hasil_s1,hasil_p,hasil_s2,keterangan) values (:nomor,:no_identitas,:tanggal,:nama_upk,:alasan_diag,:alasan_tindak,:hasil_s1,:hasil_p,:hasil_s2,:keterangan)';
  end
  else
  begin
    // update
    cmdExec.CommandText.Text :=
      'update program_tb set nomor=:nomor,no_identitas=:no_identitas,tanggal=:tanggal ,nama_upk=:nama_upk,alasan_diag=:alasan_diag,alasan_tindak=:alasan_tindak,hasil_s1=:hasil_s1,hasil_p=:hasil_p,hasil_s2=:hasil_s2,keterangan=:keterangan where id=:id ;';
    cmdExec.ParamByName('id').Value := dtl_id;
  end;
  cmdExec.ParamByName('nomor').Value := edNomor.Text;
  cmdExec.ParamByName('no_identitas').Value := edID.Text;
  cmdExec.ParamByName('tanggal').Value := dtTglPeriksa.DateTime;
  cmdExec.ParamByName('nama_upk').Value := edNamaUPK.Text;
  cmdExec.ParamByName('alasan_diag').Value := edAlasanDiag.Text;
  cmdExec.ParamByName('alasan_tindak').Value := edAlasanLanjut.Text;
  cmdExec.ParamByName('hasil_s1').Value := edHasilS1.Text;
  cmdExec.ParamByName('hasil_p').Value := edHasilP.Text;
  cmdExec.ParamByName('hasil_s2').Value := edHasilS2.Text;
  cmdExec.ParamByName('keterangan').Value := edKet.Text;
  cmdExec.Execute();
  loadData();
  HideMask;
  btnSimpan.Caption := 'Simpan';
end;

procedure TUniProgramTB.edNomorKeyPress(Sender: TObject; var Key: Char);
begin
  if Ord(Key) = VK_RETURN then
  begin
    loadData();
  end;
end;

procedure TUniProgramTB.UniFrameBeforeReady(Sender: TObject);
var
  thn, bln, tgl: word;
begin
  dtTglPeriksa.DateTime := Now;
  pcTB.ActivePage := tsDataPasien;

  // isi periode
  DecodeDate(Now, thn, bln, tgl);

  case bln of
    1:
      cbBln.Text := 'Januari';
    2:
      cbBln.Text := 'Februari';
    3:
      cbBln.Text := 'Maret';
    4:
      cbBln.Text := 'April';
    5:
      cbBln.Text := 'Mei';
    6:
      cbBln.Text := 'Juni';
    7:
      cbBln.Text := 'Juli';
    8:
      cbBln.Text := 'Agustus';
    9:
      cbBln.Text := 'September';
    10:
      cbBln.Text := 'Oktober';
    11:
      cbBln.Text := 'November';
    12:
      cbBln.Text := 'Desember';
  end;

  edThn.Value := thn;

end;

procedure TUniProgramTB.UniSpeedButton1Click(Sender: TObject);
var
  Result: string;
  bln: string;
begin
  case cbBln.ItemIndex of
    0:
      bln := '01';
    1:
      bln := '02';
    2:
      bln := '03';
    3:
      bln := '04';
    4:
      bln := '05';
    5:
      bln := '06';
    6:
      bln := '07';
    7:
      bln := '08';
    8:
      bln := '09';
    9:
      bln := '10';
    10:
      bln := '11';
    11:
      bln := '12';

  end;
  ShowMask('Loading');
  UniSession.Synchronize();
  Result := reportExecReqParams('xlsx', 'program_tb', edThn.Text, bln, '');
  UniSession.SendFile(Result);

  HideMask;
end;

initialization

RegisterClass(TUniProgramTB);

end.
