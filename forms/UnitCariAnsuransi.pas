unit UnitCariAnsuransi;

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
  TfrmCariAnsuransi = class(TUniForm)
    UniPanel1: TUniPanel;
    UniLabel1: TUniLabel;
    edText: TUniEdit;
    btnCari: TUniButton;
    UniPanel2: TUniPanel;
    btnPilih: TUniButton;
    UniButton3: TUniButton;
    btnExit: TUniButton;
    grdPasien: TUniDBGrid;
    QAnsuransi: TFDQuery;
    DSAnsuransi: TDataSource;
    procedure btnCariClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure btnPilihClick(Sender: TObject);
    procedure UniButton3Click(Sender: TObject);
    procedure edTextKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure grdPasienDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function frmCariAnsuransi: TfrmCariAnsuransi;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, UnitFODaftar, UnitAnsuransiBaru;

function frmCariAnsuransi: TfrmCariAnsuransi;
begin
  Result := TfrmCariAnsuransi(UniMainModule.GetFormInstance(TfrmCariAnsuransi));
end;

procedure TfrmCariAnsuransi.btnCariClick(Sender: TObject);
begin
  ShowMask('Loading');
  UniSession.Synchronize();
  if QAnsuransi.Active then
    QAnsuransi.Active := false;
  QAnsuransi.SQL.Text := ' SELECT * FROM ansuransi_pasien WHERE nama like ' +
    QuotedStr('%' + edText.Text + '%');
  QAnsuransi.Active := True;
  grdPasien.SetFocus;
  Hidemask
end;

procedure TfrmCariAnsuransi.btnExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCariAnsuransi.btnPilihClick(Sender: TObject);
begin
  if QAnsuransi.RecordCount > 0 then
  begin
    frmFODaftar.ansuransi_id := QAnsuransi.FieldByName('id').AsInteger;
    frmFODaftar.edAnsuransi.Text := QAnsuransi.FieldByName('nama').AsString;
    Close;
  end;
end;

procedure TfrmCariAnsuransi.edTextKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Ord(Key) = VK_RETURN then
  begin
    btnCariClick(self);
  end;
end;

procedure TfrmCariAnsuransi.grdPasienDblClick(Sender: TObject);
begin
  btnPilihClick(self);
end;

procedure TfrmCariAnsuransi.UniButton3Click(Sender: TObject);
begin
  frmAnsuransiBaru.ShowModal;
end;

end.
