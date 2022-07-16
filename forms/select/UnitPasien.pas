unit UnitPasien;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniBasicGrid, uniDBGrid, uniButton, uniEdit,
  uniLabel, uniGUIBaseClasses, uniPanel, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Imaging.jpeg, uniGUIFrame;

type
  TfrmPasien = class(TUniForm)
    UniContainerPanel1: TUniContainerPanel;
    UniContainerPanel3: TUniContainerPanel;
    UniLabel1: TUniLabel;
    edText: TUniEdit;
    grdPasien: TUniDBGrid;
    QPasien: TFDQuery;
    DSPasien: TDataSource;
    UniContainerPanel2: TUniContainerPanel;
    UniButton2: TUniButton;
    UniButton3: TUniButton;
    QEditPasien: TFDQuery;
    procedure edTextKeyPress(Sender: TObject; var Key: Char);
    procedure UniButton1Click(Sender: TObject);
    procedure UniButton2Click(Sender: TObject);
    procedure UniButton3Click(Sender: TObject);
    procedure grdPasienDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    call_form: string;
    pasien_id: integer;
  end;

function frmPasien: TfrmPasien;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, UnitPasienBaru, PatologiAnatomiCase;

function frmPasien: TfrmPasien;
begin
  Result := TfrmPasien(UniMainModule.GetFormInstance(TfrmPasien));
end;

procedure TfrmPasien.edTextKeyPress(Sender: TObject; var Key: Char);
begin
  if Ord(Key) = VK_RETURN then
  begin
    if length(edText.Text) < 1 then
    begin
      ShowMessage('Pencarian minimum 1 huruf/angka');
      exit;
    end;
    ShowMask('Loading');
    UniSession.Synchronize();
    // find pasien
    if QPasien.Active then
      QPasien.Active := False;
    QPasien.ParamByName('cari').Value := '%' + edText.Text + '%';
    QPasien.ParamByName('organisasi_id').Value :=
      UniApplication.Cookies.GetCookie('OrganisasiId');
    QPasien.Active := True;

    HideMask();
    grdPasien.SetFocus;
  end;
end;

procedure TfrmPasien.grdPasienDblClick(Sender: TObject);
begin
  pasien_id := QPasien.FieldByName('id').AsInteger;
  Self.ModalResult := mrOK;

  Close;
end;

procedure TfrmPasien.UniButton1Click(Sender: TObject);
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

procedure TfrmPasien.UniButton2Click(Sender: TObject);
begin
  frmPasienBaru.call_form := 'pasien';
  frmPasienBaru.ShowModal;
end;

procedure TfrmPasien.UniButton3Click(Sender: TObject);
var
  blob: TStream;
  Bmp: TBitmap;
  Jpg: TJPEGImage;
begin
  if QPasien.FieldCount > 0 then
  begin
    frmPasienBaru.call_form := 'pasien';
    if QEditPasien.Active then
      QEditPasien.Active := False;
    QEditPasien.SQL.Text :=
      'select p.*,k.nama as kelamin_nama,pf.nama as pf_nama, ag.nama agama, ';
    QEditPasien.SQL.Text := QEditPasien.SQL.Text +
      'TIMESTAMPDIFF( YEAR, p.tanggal_lahir, now() ) as th,TIMESTAMPDIFF( MONTH, p.tanggal_lahir, now() ) % 12 as bl,FLOOR( TIMESTAMPDIFF( DAY, p.tanggal_lahir, now() ) % 30.4375 ) as hr ';
    QEditPasien.SQL.Text := QEditPasien.SQL.Text +
      ' from  pasien p, jenis_kelamin k, prefix pf, agama ag where p.id = ' +
      QPasien.FieldByName('id').AsString +
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

  end;
end;

end.
