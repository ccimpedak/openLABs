unit UnitCariDokter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uniBasicGrid, uniDBGrid, uniButton,
  uniEdit, uniLabel, uniGUIBaseClasses, uniPanel;

type
  TfrmCariDokter = class(TUniForm)
    UniPanel1: TUniPanel;
    UniLabel1: TUniLabel;
    edText: TUniEdit;
    UniPanel2: TUniPanel;
    btnPilih: TUniButton;
    UniButton3: TUniButton;
    btnExit: TUniButton;
    grdPasien: TUniDBGrid;
    QDokter: TFDQuery;
    DSPasien: TDataSource;
    procedure edTextKeyPress(Sender: TObject; var Key: Char);
    procedure btnCariClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure btnPilihClick(Sender: TObject);
    procedure UniButton3Click(Sender: TObject);
    procedure grdPasienDblClick(Sender: TObject);
    procedure UniFormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure UniFormActivate(Sender: TObject);
    procedure edTextKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    call_form: string;
    dokter_id: integer;
  end;

function frmCariDokter: TfrmCariDokter;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, UnitPendaftaran, UnitDokterBaru;

function frmCariDokter: TfrmCariDokter;
begin
  Result := TfrmCariDokter(UniMainModule.GetFormInstance(TfrmCariDokter));
end;

procedure TfrmCariDokter.btnCariClick(Sender: TObject);
begin
  if length(edText.Text) < 3 then
  begin
    ShowMessage('Pencarian minimum 3 huruf/angka');
    exit;
  end;
  // find pasien
  if QDokter.Active then
    QDokter.Active := False;
  QDokter.SQL.Text := 'select * from dokter where alamat like ' +
    QuotedStr('%' + edText.Text + '%') + ' order by alamat';
  QDokter.Active := True;
  grdPasien.SetFocus;
end;

procedure TfrmCariDokter.btnExitClick(Sender: TObject);
begin
  Close();
end;

procedure TfrmCariDokter.btnPilihClick(Sender: TObject);
begin
  if QDokter.RecordCount > 0 then
  begin
    // if call_form <> 'TUniPatologiAnatomiCase' then
    // begin
    // frmPendaftaran.edDokterId.Text := QDokter.FieldByName('id').AsString;
    // frmPendaftaran.edDokter.Text := QDokter.FieldByName('nama').AsString;
    // end;
    dokter_id := QDokter.FieldByName('id').AsInteger;
    Self.ModalResult := mrOK;
    Close;
  end;
end;

procedure TfrmCariDokter.edTextKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F1 then
    btnPilihClick(Self);
  if Key = VK_F2 then
    frmDokterBaru.Show();
  if Key = VK_F3 then
    btnExitClick(Self);
  if Key = VK_F4 then
    btnCariClick(Self);
  if Key = VK_ESCAPE then
    Close;
end;

procedure TfrmCariDokter.edTextKeyPress(Sender: TObject; var Key: Char);
begin
  if Ord(Key) = VK_RETURN then
  begin
    // find pasien
    if QDokter.Active then
      QDokter.Active := False;
    QDokter.ParamByName('cari').Value := '%' + edText.Text + '%';
    QDokter.ParamByName('organisasi_id').Value :=
      UniApplication.Cookies.GetCookie('OrganisasiId');
    QDokter.Active := True;
    grdPasien.SetFocus;
  end;
end;

procedure TfrmCariDokter.grdPasienDblClick(Sender: TObject);
begin
  btnPilihClick(Self);
end;

procedure TfrmCariDokter.UniButton3Click(Sender: TObject);
begin
  if frmDokterBaru.ShowModal() = mrOK then
  begin
    if QDokter.Active then
      QDokter.Active := False;
    QDokter.SQL.Text := 'select * from dokter where id = ' +
      IntToStr(frmDokterBaru.dokter_id);
    QDokter.Active := True;
    btnPilihClick(Self);
  end;
end;

procedure TfrmCariDokter.UniFormActivate(Sender: TObject);
begin
  edText.SetFocus;
end;

procedure TfrmCariDokter.UniFormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F1 then
    btnPilihClick(Self);
  if Key = VK_F2 then
    frmDokterBaru.Show();
  if Key = VK_F3 then
    btnExitClick(Self);
  if Key = VK_F4 then
    btnCariClick(Self);
  if Key = VK_ESCAPE then
    Close;
end;

end.
