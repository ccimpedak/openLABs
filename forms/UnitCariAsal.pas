unit UnitCariAsal;

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
  TfrmCariAsal = class(TUniForm)
    UniPanel1: TUniPanel;
    UniLabel1: TUniLabel;
    edText: TUniEdit;
    btnCari: TUniButton;
    UniPanel2: TUniPanel;
    btnPilih: TUniButton;
    UniButton3: TUniButton;
    btnExit: TUniButton;
    grdPasien: TUniDBGrid;
    DSAsal: TDataSource;
    QAsal: TFDQuery;
    procedure btnExitClick(Sender: TObject);
    procedure edTextKeyPress(Sender: TObject; var Key: Char);
    procedure btnPilihClick(Sender: TObject);
    procedure btnCariClick(Sender: TObject);
    procedure UniButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function frmCariAsal: TfrmCariAsal;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, UnitFODaftar, UnitAsalbaru;

function frmCariAsal: TfrmCariAsal;
begin
  Result := TfrmCariAsal(UniMainModule.GetFormInstance(TfrmCariAsal));
end;

procedure TfrmCariAsal.btnCariClick(Sender: TObject);
begin
  ShowMask('Loading');
  UniSession.Synchronize();
  if QAsal.Active then
    QAsal.Active := false;
  QAsal.SQL.Text := ' SELECT * FROM asal_pasien WHERE nama like ' +
    QuotedStr('%' + edText.Text + '%');
  QAsal.Active := True;
  grdPasien.SetFocus;
  Hidemask;
end;

procedure TfrmCariAsal.btnExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCariAsal.btnPilihClick(Sender: TObject);
begin
  if QAsal.RecordCount > 0 then
  begin
    frmFODaftar.asal_id := QAsal.FieldByName('id').AsInteger;
    frmFODaftar.edAsal.Text := QAsal.FieldByName('nama').AsString;

    // jika fo_status ordernya sudah ada dan update dokternya otomatis
    // if frmFODaftar.call_form = 'fo_status' then
    // begin
    // frmFODaftar.cmdTmp.Params.Clear;
    // frmFODaftar.cmdTmp.Params.Add.Name := 'id';
    // frmFODaftar.cmdTmp.Params.Add.Name := 'dokter_id';
    // frmFODaftar.cmdTmp.CommandText.Text :=
    // ' UPDATE order_header SET dokter_id = :dokter_id WHERE id = :id ';
    // frmFODaftar.cmdTmp.ParamByName('id').Value := frmFODaftar.order_id;
    // frmFODaftar.cmdTmp.ParamByName('dokter_id').Value :=
    // QDokter.FieldByName('id').AsString;
    // frmFODaftar.cmdTmp.Execute();
    // end;
    Close;
  end;
end;

procedure TfrmCariAsal.edTextKeyPress(Sender: TObject; var Key: Char);
begin
  if Ord(Key) = VK_RETURN then
  begin
    btnCariClick(self);
  end;
end;

procedure TfrmCariAsal.UniButton3Click(Sender: TObject);
begin
  frmAsalBaru.ShowModal;
end;

end.
