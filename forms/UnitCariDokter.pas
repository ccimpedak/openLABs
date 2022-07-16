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
    btnCari: TUniButton;
    UniPanel2: TUniPanel;
    btnPilih: TUniButton;
    UniButton3: TUniButton;
    btnExit: TUniButton;
    grdPasien: TUniDBGrid;
    QDokter: TFDQuery;
    DSPasien: TDataSource;
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
  end;

function frmCariDokter: TfrmCariDokter;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, UnitFODaftar, UnitDokterBaru;

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
    frmFODaftar.edDokterId.Text := QDokter.FieldByName('id').AsString;
    frmFODaftar.edDokter.Text := QDokter.FieldByName('nama').AsString;

    // jika fo_status ordernya sudah ada dan update dokternya otomatis
    if frmFODaftar.call_form = 'fo_status' then
    begin
      frmFODaftar.cmdTmp.Params.Clear;
      frmFODaftar.cmdTmp.Params.Add.Name := 'id';
      frmFODaftar.cmdTmp.Params.Add.Name := 'dokter_id';
      frmFODaftar.cmdTmp.CommandText.Text :=
        ' UPDATE order_header SET dokter_id = :dokter_id WHERE id = :id ';
      frmFODaftar.cmdTmp.ParamByName('id').Value := frmFODaftar.order_id;
      frmFODaftar.cmdTmp.ParamByName('dokter_id').Value :=
        QDokter.FieldByName('id').AsString;
      frmFODaftar.cmdTmp.Execute();
    end;
    Close;
  end;
end;

procedure TfrmCariDokter.edTextKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Ord(Key) = VK_RETURN then
  begin
    if length(edText.Text) < 3 then
    begin
      ShowMessage('Pencarian minimum 3 huruf/angka');
      exit;
    end;
    // find pasien
    if QDokter.Active then
      QDokter.Active := False;
    QDokter.SQL.Text := 'select * from dokter where nama like ' +
      QuotedStr('%' + edText.Text + '%') + ' order by nama';
    QDokter.Active := True;
    grdPasien.SetFocus;
  end;
  if Key = VK_F1 then
    btnPilihClick(self);
  if Key = VK_F2 then
    frmDokterBaru.Show();
  if Key = VK_F3 then
    btnExitClick(self);
  if Key = VK_F4 then
    btnCariClick(self);
  if Key = VK_ESCAPE then
    Close;
end;

procedure TfrmCariDokter.grdPasienDblClick(Sender: TObject);
begin
  btnPilihClick(self);
end;

procedure TfrmCariDokter.UniButton3Click(Sender: TObject);
begin
  frmDokterBaru.ShowModal();
end;

procedure TfrmCariDokter.UniFormActivate(Sender: TObject);
begin
  edText.SetFocus;
end;

procedure TfrmCariDokter.UniFormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F1 then
    btnPilihClick(self);
  if Key = VK_F2 then
    frmDokterBaru.Show();
  if Key = VK_F3 then
    btnExitClick(self);
  if Key = VK_F4 then
    btnCariClick(self);
  if Key = VK_ESCAPE then
    Close;
end;

end.
