unit UnitRegisterMCU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniBasicGrid, uniStringGrid, uniGUIBaseClasses,
  uniPanel, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, uniMultiItem, uniComboBox, uniDBComboBox,
  uniDBLookupComboBox, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  uniEdit, uniLabel, uniButton;

type
  TfrmRegisterBatchMCU = class(TUniForm)
    UniContainerPanel1: TUniContainerPanel;
    UniContainerPanel2: TUniContainerPanel;
    UniContainerPanel3: TUniContainerPanel;
    UniContainerPanel4: TUniContainerPanel;
    UniContainerPanel5: TUniContainerPanel;
    UniLabel10: TUniLabel;
    edCariTest: TUniEdit;
    UniLabel17: TUniLabel;
    QPaket: TFDQuery;
    DSPaket: TDataSource;
    QPaketDetail: TFDQuery;
    cbPaket: TUniDBLookupComboBox;
    UniButton1: TUniButton;
    cbAsal: TUniDBLookupComboBox;
    UniLabel14: TUniLabel;
    QAsal: TFDQuery;
    dsAsal: TDataSource;
    grdPasien: TUniStringGrid;
    grdPemeriksaan: TUniStringGrid;
    procedure UniButton1Click(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function frmRegisterBatchMCU: TfrmRegisterBatchMCU;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, UnitCariPasien;

function frmRegisterBatchMCU: TfrmRegisterBatchMCU;
begin
  Result := TfrmRegisterBatchMCU
    (UniMainModule.GetFormInstance(TfrmRegisterBatchMCU));
end;

procedure TfrmRegisterBatchMCU.UniButton1Click(Sender: TObject);
begin
  frmCariPasien.ShowModal();
  frmCariPasien.call_form := 'register_mcu';
end;

procedure TfrmRegisterBatchMCU.UniFormCreate(Sender: TObject);
begin
  grdPasien.Cells[0, 0] := 'ID pasien';
  grdPasien.Cells[1, 0] := 'Nama';
  grdPasien.ColWidths[0] := 100;
  grdPasien.ColWidths[1] := 300;

  grdPemeriksaan.Cells[0, 0] := 'Kode';
  grdPemeriksaan.Cells[1, 0] := 'Pemeriksaan';
  grdPemeriksaan.Cells[2, 0] := 'Harga';
  grdPemeriksaan.ColWidths[0] := 100;
  grdPemeriksaan.ColWidths[1] := 300;
  grdPemeriksaan.ColWidths[2] := 100;

  QAsal.Open();
  QPaket.Open();

end;

end.
