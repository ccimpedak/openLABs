unit PatologiAnatomiCase;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniGUIBaseClasses, uniButton, uniBitBtn,
  uniSpeedButton, uniToolBar, uniDateTimePicker, uniEdit, uniLabel, uniGroupBox,
  uniPanel, uniSplitter, uniMultiItem, uniComboBox, uniTreeView, uniBasicGrid,
  uniDBGrid, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uniMemo, uniPageControl, uniDBComboBox,
  uniDBLookupComboBox;

type
  TUniPatologiAnatomiCase = class(TUniFrame)
    UniToolBar1: TUniToolBar;
    UniSpeedButton1: TUniSpeedButton;
    UniSpeedButton2: TUniSpeedButton;
    UniSpeedButton3: TUniSpeedButton;
    UniSpeedButton4: TUniSpeedButton;
    UniPanel1: TUniPanel;
    UniSplitter1: TUniSplitter;
    UniContainerPanel1: TUniContainerPanel;
    UniContainerPanel2: TUniContainerPanel;
    SearchEdit: TUniComboBox;
    UniDBGrid1: TUniDBGrid;
    QCase: TFDQuery;
    DSCase: TDataSource;
    UniGroupBox1: TUniGroupBox;
    UniLabel1: TUniLabel;
    UniLabel2: TUniLabel;
    UniLabel3: TUniLabel;
    lblEdocaseExt: TUniLabel;
    UniLabel5: TUniLabel;
    edNomor: TUniEdit;
    dtAmbilSampel: TUniDateTimePicker;
    edJaringanPrimer: TUniEdit;
    edNoCaseExt: TUniEdit;
    edLokasiLab: TUniEdit;
    UniGroupBox2: TUniGroupBox;
    UniLabel6: TUniLabel;
    UniLabel7: TUniLabel;
    UniLabel8: TUniLabel;
    UniLabel9: TUniLabel;
    UniSpeedButton5: TUniSpeedButton;
    UniLabel10: TUniLabel;
    edPasienId: TUniEdit;
    UniLabel11: TUniLabel;
    edJK: TUniEdit;
    UniLabel12: TUniLabel;
    edDob: TUniEdit;
    UniLabel13: TUniLabel;
    edUsia: TUniEdit;
    UniLabel14: TUniLabel;
    mmKlinis: TUniMemo;
    UniGroupBox3: TUniGroupBox;
    UniLabel15: TUniLabel;
    UniLabel16: TUniLabel;
    UniComboBox1: TUniComboBox;
    UniLabel17: TUniLabel;
    UniLabel18: TUniLabel;
    UniSpeedButton7: TUniSpeedButton;
    UniLabel19: TUniLabel;
    UniSpeedButton8: TUniSpeedButton;
    UniLabel20: TUniLabel;
    UniSpeedButton9: TUniSpeedButton;
    pcCase: TUniPageControl;
    tsOrder: TUniTabSheet;
    tsSpecimen: TUniTabSheet;
    UniContainerPanel3: TUniContainerPanel;
    UniGroupBox4: TUniGroupBox;
    UniToolBar3: TUniToolBar;
    UniSpeedButton14: TUniSpeedButton;
    UniSpeedButton17: TUniSpeedButton;
    UniDBGrid2: TUniDBGrid;
    UniLabel21: TUniLabel;
    UniLabel22: TUniLabel;
    edNoSpec: TUniEdit;
    UniLabel23: TUniLabel;
    UniDateTimePicker1: TUniDateTimePicker;
    UniLabel24: TUniLabel;
    edjarPri: TUniEdit;
    UniLabel25: TUniLabel;
    UniLabel26: TUniLabel;
    edProsedur: TUniEdit;
    UniLabel29: TUniLabel;
    edBarcode: TUniEdit;
    mmDescSpec: TUniMemo;
    UniLabel30: TUniLabel;
    UniLabel31: TUniLabel;
    edSpeClient: TUniEdit;
    edDesSpClient: TUniEdit;
    UniLabel27: TUniLabel;
    UniLabel28: TUniLabel;
    edNamaPasien: TUniEdit;
    cbAsal: TUniDBLookupComboBox;
    QKlien: TFDQuery;
    DSKlien: TDataSource;
    cbDokterPerujuk: TUniDBLookupComboBox;
    QDokterPerujuk: TFDQuery;
    dsDokterPerujuk: TDataSource;
    QDokterRawat: TFDQuery;
    dsDokRawat: TDataSource;
    cbDokterRawat: TUniDBLookupComboBox;
    QPetugas: TFDQuery;
    dsPetugas: TDataSource;
    cbDokterPetugas: TUniDBLookupComboBox;
    tsInterpretasi: TUniTabSheet;
    UniLabel4: TUniLabel;
    UniMemo1: TUniMemo;
    UniLabel32: TUniLabel;
    UniMemo3: TUniMemo;
    UniLabel33: TUniLabel;
    UniMemo4: TUniMemo;
    UniLabel34: TUniLabel;
    UniMemo5: TUniMemo;
    tsChytology: TUniTabSheet;
    UniLabel35: TUniLabel;
    UniMemo6: TUniMemo;
    UniLabel36: TUniLabel;
    UniMemo7: TUniMemo;
    UniLabel37: TUniLabel;
    UniMemo8: TUniMemo;
    UniLabel38: TUniLabel;
    UniMemo9: TUniMemo;
    UniSpeedButton6: TUniSpeedButton;
    procedure UniFrameCreate(Sender: TObject);
    procedure SearchEditChange(Sender: TObject);
    procedure UniSpeedButton5Click(Sender: TObject);
    procedure UniSpeedButton7Click(Sender: TObject);
    procedure UniSpeedButton8Click(Sender: TObject);
    procedure UniSpeedButton9Click(Sender: TObject);
    procedure UniSpeedButton6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    pasien_id, dokter_perujuk, dokter_rawat, dokter_petugas: integer;
  end;

implementation

{$R *.dfm}

uses UnitPasien, UnitCariDokter, UnitAsal;

procedure TUniPatologiAnatomiCase.SearchEditChange(Sender: TObject);
begin
  if QCase.Active then
    QCase.Active := False;
  QCase.ParamByName('number').Value := '%' + SearchEdit.Text + '%';
  QCase.Active := True;
end;

procedure TUniPatologiAnatomiCase.UniFrameCreate(Sender: TObject);
begin
  // if QCase.Active then
  // QCase.Active := False;
  // QCase.Active := True;
  dtAmbilSampel.DateTime := Now;

  QKlien.Open();
  QDokterPerujuk.Open();
  QDokterRawat.Open();
  QPetugas.Open();

  // FormRegion.aut.ExtControl.JsCode ('autoscroll: true');

  with UniContainerPanel1 do
    if AutoScroll then
      JSInterface.JSAddListener('painted',
        'function(){this.setScrollable(true)}');

  pcCase.ActivePage := tsOrder;

end;

procedure TUniPatologiAnatomiCase.UniSpeedButton5Click(Sender: TObject);

begin
  frmPasien.call_form := 'TUniPatologiAnatomiCase';
  if frmPasien.ShowModal = mrOK then
  begin
    edNamaPasien.Text := frmPasien.QPasien.FieldByName('nama').AsString;
    edPasienId.Text := frmPasien.QPasien.FieldByName('noreg').AsString;
    edJK.Text := frmPasien.QPasien.FieldByName('kelamin').AsString;
    edDob.Text := frmPasien.QPasien.FieldByName('tanggal_lahir').AsString;
    edUsia.Text := frmPasien.QPasien.FieldByName('umur').AsString;
    pasien_id := frmPasien.QPasien.FieldByName('id').AsInteger;
  end;
end;

procedure TUniPatologiAnatomiCase.UniSpeedButton6Click(Sender: TObject);
begin
  if frmCariAsal.ShowModal = mrOK then
  begin
    // frmCariA
  end;
end;

procedure TUniPatologiAnatomiCase.UniSpeedButton7Click(Sender: TObject);
begin
//  frmCariDokter.call_form := 'TUniPatologiAnatomiCase';
  if frmCariDokter.ShowModal = mrOK then
  begin
    dokter_perujuk := frmCariDokter.QDokter.FieldByName('id').AsInteger;

    if QDokterPerujuk.Active then
      QDokterPerujuk.Active := False;
    QDokterPerujuk.Active := True;

    cbDokterPerujuk.ItemIndex := cbDokterPerujuk.Items.IndexOf
      (frmCariDokter.QDokter.FieldByName('nama').AsString);

  end;
end;

procedure TUniPatologiAnatomiCase.UniSpeedButton8Click(Sender: TObject);
begin
//  frmCariDokter.call_form := 'TUniPatologiAnatomiCase';
  if frmCariDokter.ShowModal = mrOK then
  begin
    dokter_rawat := frmCariDokter.QDokter.FieldByName('id').AsInteger;

    if QDokterRawat.Active then
      QDokterRawat.Active := False;
    QDokterRawat.Active := True;

    cbDokterRawat.ItemIndex := cbDokterRawat.Items.IndexOf
      (frmCariDokter.QDokter.FieldByName('nama').AsString);

  end;
end;

procedure TUniPatologiAnatomiCase.UniSpeedButton9Click(Sender: TObject);
begin
//  frmCariDokter.call_form := 'TUniPatologiAnatomiCase';
  if frmCariDokter.ShowModal = mrOK then
  begin
    dokter_petugas := frmCariDokter.QDokter.FieldByName('id').AsInteger;

    if QPetugas.Active then
      QPetugas.Active := False;
    QPetugas.Active := True;

    cbDokterPetugas.ItemIndex := cbDokterPetugas.Items.IndexOf
      (frmCariDokter.QDokter.FieldByName('nama').AsString);

  end;
end;

initialization

RegisterClass(TUniPatologiAnatomiCase);

end.
