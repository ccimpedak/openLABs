unit UnitCariPasien;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Jpeg,
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
    QFoto: TFDQuery;
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
  MainModule, uniGUIApplication, UnitFODaftar, UnitPasienBaru,
  UnitFOHomeService, UnitUtils, ServerModule;

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
    + ',FLOOR( TIMESTAMPDIFF( DAY, p.tanggal_lahir, now() ) % 30.4375 )) as umur, p.catatan, p.email  '
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
    ShowMask('Loading');
    UniSession.Synchronize();
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
      ',FLOOR( TIMESTAMPDIFF( DAY, p.tanggal_lahir, now() ) % 30.4375 )) as umur, p.catatan, p.email  '
      + 'from pasien p, prefix pf, jenis_kelamin k where p.prefix_id = pf.id ' +
      'and p.jenis_kelamin_id=k.id and CONCAT(p.nama,p.telepon,p.hp) like ' +
      QuotedStr('%' + edText.Text + '%') + ' order by p.nama';
    QPasien.Active := True;

    HideMask();
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
var
  blob: TStream;
  Bmp: TBitmap;
  Jpg: TJPEGImage;
  tgl_histori, hasil: string;
  LDestNode: TUniTreeNode;
begin
  if QPasien.RecordCount > 0 then
  begin
    ShowMask('Loading');
    UniSession.Synchronize();
    // Query foto
    if QFoto.Active then
      QFoto.Active := False;
    QFoto.SQL.Text := 'select * from pasien_photo where pasien_id = ' +
      QPasien.FieldByName('id').AsString;
    QFoto.Active := True;

    // home service call
    if call_form = 'home_service' then
    begin
      frmFOHomeService.edPasienId.Text := QPasien.FieldByName('id').AsString;
      frmFOHomeService.edNama.Text := QPasien.FieldByName('nama').AsString;
      frmFOHomeService.edKelamin.Text := QPasien.FieldByName('kelamin')
        .AsString;
      frmFOHomeService.edUmur.Text := QPasien.FieldByName('umur').AsString;
      frmFOHomeService.edAlamat.Text := QPasien.FieldByName('alamat').AsString;
      frmFOHomeService.edTelepon.Text := QPasien.FieldByName('tlp').AsString;
      frmFOHomeService.edNoReg.Text := QPasien.FieldByName('noreg').AsString;
      frmFOHomeService.btnSave.Enabled := True;

    end
    else
    begin
      // form pendaftaran call
      if QPasien.Active then
      begin
        if QPasien.RecordCount > 0 then
        begin
          frmFODaftar.imFotoPasien.Picture.LoadFromFile
            (UniServerModule.FilesFolderPath + 'foto-kosong.jpg');
          frmFODaftar.edNama.Text := QPasien.FieldByName('nama').AsString;
          frmFODaftar.edKelamin.Text := QPasien.FieldByName('kelamin').AsString;
          frmFODaftar.edUmur.Text := QPasien.FieldByName('umur').AsString;
          frmFODaftar.edAlamat.Text := QPasien.FieldByName('alamat').AsString;
          frmFODaftar.edTelp.Text := QPasien.FieldByName('telepon').AsString;
          frmFODaftar.edHp.Text := QPasien.FieldByName('hp').AsString;
          frmFODaftar.edPatientID.Text := QPasien.FieldByName('noreg').AsString;
          frmFODaftar.edPasienId.Text := QPasien.FieldByName('id').AsString;
          frmFODaftar.edJenisKelaminId.Text :=
            QPasien.FieldByName('jenis_kelamin_id').AsString;
          frmFODaftar.jenis_kelamin_id :=
            QPasien.FieldByName('jenis_kelamin_id').AsString;
          frmFODaftar.edHasilEmail.Text := QPasien.FieldByName('email')
            .AsString;
          frmFODaftar.edHasilWa.Text := QPasien.FieldByName('hp').AsString;
          frmFODaftar.mmCatatanPasien.Lines.Text :=
            QPasien.FieldByName('catatan').AsString;

          frmFODaftar.pcPasien.Pages[0].TabVisible := True;
          frmFODaftar.pcPasien.Pages[1].TabVisible := True;
          frmFODaftar.pcPasien.Pages[2].TabVisible := True;

          // histori
          if frmFODaftar.QPasien.Active then
            frmFODaftar.QPasien.Active := False;
          frmFODaftar.QPasien.SQL.Text :=
            'select oh.id,od.id as detail_id,t.nama, od.hasil, od.flg_valid,left(oh.tanggal,16) tanggal,oh.catatan from order_header oh, order_detail od, test t where t.ada_hasil='
            + QuotedStr('Y') +
            ' and oh.id = od.header_id and od.test_id = t.id and oh.flgBatal=' +
            QuotedStr('N') + ' and oh.pasien_id = ' +
            QuotedStr(QPasien.FieldByName('id').AsString) +
            ' and left(oh.tanggal,10) < left(now(),10) order by oh.tanggal desc ';
          frmFODaftar.QPasien.Active := True;
          // tgl_histori := frmFODaftar.QPasien.FieldByName('tanggal').AsString;

          // add
          frmFODaftar.QPasien.First;
          tgl_histori := '';
          frmFODaftar.tvHistori.Items.Clear;
          while not frmFODaftar.QPasien.Eof do
          begin
            if tgl_histori <> frmFODaftar.QPasien.FieldByName('tanggal').AsString
            then
            begin
              frmFODaftar.tvHistori.Items.Add(nil,
                frmFODaftar.QPasien.FieldByName('tanggal').AsString);
              tgl_histori := frmFODaftar.QPasien.FieldByName('tanggal')
                .AsString;
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
              if frmFODaftar.QPasien.FieldByName('flg_valid').AsString = 'Y'
              then
                hasil := frmFODaftar.QPasien.FieldByName('hasil').AsString
              else
                hasil := 'Validasi';
            end;
            frmFODaftar.tvHistori.Items.AddChild(LDestNode,
              frmFODaftar.QPasien.FieldByName('nama').AsString + ' : ' + hasil);
            frmFODaftar.QPasien.Next;

          end;

          if QFoto.RecordCount > 0 then
          begin
            Bmp := TBitmap.Create;
            blob := QFoto.CreateBlobStream(QFoto.FieldByName('photo'), bmRead);
            try
              Jpg := TJPEGImage.Create;
              try
                Jpg.LoadFromStream(blob);
                Bmp.Assign(Jpg);
                frmFODaftar.imFotoPasien.Assign(Bmp);

              finally
                Jpg.Free;
              end;
            finally
              blob.Free;
            end;
            Bmp.Free;
          end;
        end;

      end;

    end;
    HideMask();

    close;
  end;
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
    + ',FLOOR( TIMESTAMPDIFF( DAY, p.tanggal_lahir, now() ) % 30.4375 )) as umur, p.catatan, p.email  '
    + 'from pasien p, prefix pf, jenis_kelamin k where p.prefix_id = pf.id ' +
    'and p.jenis_kelamin_id=k.id and p.no_ktp like ' +
    QuotedStr('%' + edText.Text + '%') + ' order by p.nama';
  QPasien.Active := True;
  grdPasien.SetFocus;
end;

procedure TfrmCariPasien.UniButton3Click(Sender: TObject);
begin
  frmPasienBaru.ShowModal;
  frmPasienBaru.call_form := call_form;
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
