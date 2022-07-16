unit UnitCariPasien;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniBasicGrid, uniDBGrid, uniButton, uniEdit,
  uniLabel, uniGUIBaseClasses, uniPanel, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmCariPasien = class(TUniForm)
    UniPanel1: TUniPanel;
    UniLabel1: TUniLabel;
    edText: TUniEdit;
    btnCari: TUniButton;
    UniPanel2: TUniPanel;
    grdPasien: TUniDBGrid;
    btnPilih: TUniButton;
    UniButton3: TUniButton;
    btnExit: TUniButton;
    QPasien: TFDQuery;
    DSPasien: TDataSource;
    btnNoKTP: TUniButton;
    procedure UniFormShow(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure UniFormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edTextKeyPress(Sender: TObject; var Key: Char);
    procedure grdPasienKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnPilihClick(Sender: TObject);
    procedure UniButton3Click(Sender: TObject);
    procedure btnCariClick(Sender: TObject);
    procedure btnNoKTPClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  var
    call_form: string;
  end;

function frmCariPasien: TfrmCariPasien;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, UnitPendaftaran, UnitPasienBaru,
  UnitHomeService;

function frmCariPasien: TfrmCariPasien;
begin
  Result := TfrmCariPasien(UniMainModule.GetFormInstance(TfrmCariPasien));
end;

procedure TfrmCariPasien.btnCariClick(Sender: TObject);
begin
  if length(edText.Text) < 3 then
  begin
    ShowMessage('Pencarian minimum 3 huruf/angka');
    exit;
  end;
  // find pasien
  if QPasien.Active then
    QPasien.Active := False;
  QPasien.SQL.Text := 'select p.id,p.jenis_kelamin_id,CONCAT(pf.nama,' +
    QuotedStr(' ') +
    ', p.nama) nama,k.nama kelamin,p.telepon,p.hp,p.noreg,p.wilayah,CONCAT(p.telepon,'
    + QuotedStr('/') +
    ',p.hp) tlp,p.alamat, CONCAT(TIMESTAMPDIFF( YEAR, p.tanggal_lahir, now() ),'
    + QuotedStr(' th ') +
    ',TIMESTAMPDIFF( MONTH, p.tanggal_lahir, now() ) % 12,' + QuotedStr(' bl ')
    + ',FLOOR( TIMESTAMPDIFF( DAY, p.tanggal_lahir, now() ) % 30.4375 )) as umur  '
    + 'from pasien p, prefix pf, jenis_kelamin k where p.prefix_id = pf.id ' +
    'and p.jenis_kelamin_id=k.id and p.alamat like ' +
    QuotedStr('%' + edText.Text + '%') + ' order by p.nama';
  QPasien.Active := True;
  grdPasien.SetFocus;
end;

procedure TfrmCariPasien.btnExitClick(Sender: TObject);
begin
  close;
end;

procedure TfrmCariPasien.edTextKeyPress(Sender: TObject; var Key: Char);
begin
  if Ord(Key) = VK_RETURN then
  begin
    if length(edText.Text) < 3 then
    begin
      ShowMessage('Pencarian minimum 3 huruf/angka');
      exit;
    end;
    // find pasien
    if QPasien.Active then
      QPasien.Active := False;
    QPasien.SQL.Text := 'select p.id,p.jenis_kelamin_id,CONCAT(pf.nama,' +
      QuotedStr(' ') +
      ', p.nama) nama,k.nama kelamin,p.telepon,p.hp,p.noreg,p.wilayah,CONCAT(p.telepon,'
      + QuotedStr('/') +
      ',p.hp) tlp,p.alamat, CONCAT(TIMESTAMPDIFF( YEAR, p.tanggal_lahir, now() ),'
      + QuotedStr(' th ') +
      ',TIMESTAMPDIFF( MONTH, p.tanggal_lahir, now() ) % 12,' +
      QuotedStr(' bl ') +
      ',FLOOR( TIMESTAMPDIFF( DAY, p.tanggal_lahir, now() ) % 30.4375 )) as umur  '
      + 'from pasien p, prefix pf, jenis_kelamin k where p.prefix_id = pf.id ' +
      'and p.jenis_kelamin_id=k.id and CONCAT(p.nama,p.telepon,p.hp) like ' +
      QuotedStr('%' + edText.Text + '%') + ' order by p.nama';
    QPasien.Active := True;
    grdPasien.SetFocus;
  end;
end;

procedure TfrmCariPasien.grdPasienKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    btnPilihClick(self);
  end;

end;

procedure TfrmCariPasien.btnPilihClick(Sender: TObject);
begin
  // home service call
  if call_form = 'home_service' then
  begin
    frmHomeService.edPasienId.Text := QPasien.FieldByName('id').AsString;
    frmHomeService.edNama.Text := QPasien.FieldByName('nama').AsString;
    frmHomeService.edKelamin.Text := QPasien.FieldByName('kelamin').AsString;
    frmHomeService.edUmur.Text := QPasien.FieldByName('umur').AsString;
    frmHomeService.edAlamat.Text := QPasien.FieldByName('alamat').AsString;
    frmHomeService.edTelepon.Text := QPasien.FieldByName('tlp').AsString;
    frmHomeService.edNoReg.Text := QPasien.FieldByName('noreg').AsString;

  end
  else
  begin
    // form pendaftaran call
    if QPasien.Active then
    begin
      if QPasien.RecordCount > 0 then
      begin
        frmPendaftaran.edNama.Text := QPasien.FieldByName('nama').AsString;
        frmPendaftaran.edKelamin.Text := QPasien.FieldByName('kelamin')
          .AsString;
        frmPendaftaran.edUmur.Text := QPasien.FieldByName('umur').AsString;
        frmPendaftaran.edAlamat.Text := QPasien.FieldByName('alamat').AsString;
        frmPendaftaran.edTelp.Text := QPasien.FieldByName('telepon').AsString;
        frmPendaftaran.edHp.Text := QPasien.FieldByName('hp').AsString;
        frmPendaftaran.edPatientID.Text := QPasien.FieldByName('noreg')
          .AsString;
        frmPendaftaran.edPasienId.Text := QPasien.FieldByName('id').AsString;
        frmPendaftaran.edJenisKelaminId.Text :=
          QPasien.FieldByName('jenis_kelamin_id').AsString;
      end;

    end;
  end;

  close;
end;

procedure TfrmCariPasien.btnNoKTPClick(Sender: TObject);
begin
  if length(edText.Text) < 3 then
  begin
    ShowMessage('Pencarian minimum 3 huruf/angka');
    exit;
  end;
  // find pasien
  if QPasien.Active then
    QPasien.Active := False;
  QPasien.SQL.Text := 'select p.id,p.jenis_kelamin_id,CONCAT(pf.nama,' +
    QuotedStr(' ') +
    ', p.nama) nama,k.nama kelamin,p.telepon,p.hp,p.noreg,p.wilayah,CONCAT(p.telepon,'
    + QuotedStr('/') +
    ',p.hp) tlp,p.alamat, CONCAT(TIMESTAMPDIFF( YEAR, p.tanggal_lahir, now() ),'
    + QuotedStr(' th ') +
    ',TIMESTAMPDIFF( MONTH, p.tanggal_lahir, now() ) % 12,' + QuotedStr(' bl ')
    + ',FLOOR( TIMESTAMPDIFF( DAY, p.tanggal_lahir, now() ) % 30.4375 )) as umur  '
    + 'from pasien p, prefix pf, jenis_kelamin k where p.prefix_id = pf.id ' +
    'and p.jenis_kelamin_id=k.id and p.no_ktp like ' +
    QuotedStr('%' + edText.Text + '%') + ' order by p.nama';
  QPasien.Active := True;
  grdPasien.SetFocus;
end;

procedure TfrmCariPasien.UniButton3Click(Sender: TObject);
begin
  frmPasienBaru.ShowModal;
  frmPasienBaru.call_form:=call_form;
end;

procedure TfrmCariPasien.UniFormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F1 then
    btnPilihClick(self);
  if Key = VK_F2 then
    frmPasienBaru.ShowModal();
  if Key = VK_F3 then
    btnExitClick(self);
  if Key = VK_F4 then
    btnCariClick(self);
  if Key = VK_F5 then
    btnNoKTPClick(self);
  if Key = VK_ESCAPE then
    close;
end;

procedure TfrmCariPasien.UniFormShow(Sender: TObject);
begin
  edText.SetFocus;
end;

end.
