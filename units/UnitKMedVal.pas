unit UnitKMedVal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniSplitter, uniPanel, uniPageControl,
  uniGUIBaseClasses, uniLabel, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uniBasicGrid, uniDBGrid, uniButton,
  uniMultiItem, uniComboBox, uniDBComboBox, uniDBLookupComboBox, uniURLFrame,
  uniDateTimePicker, uniEdit, Vcl.Menus, uniMainMenu, uniBitBtn, uniSpeedButton;

type
  TUniKMedVal = class(TUniFrame)
    pnlAtas: TUniContainerPanel;
    pcAtas: TUniPageControl;
    tsOverview: TUniTabSheet;
    tsConfig: TUniTabSheet;
    UniSplitter1: TUniSplitter;
    pnlBawah: TUniContainerPanel;
    pcBawah: TUniPageControl;
    tsRepView: TUniTabSheet;
    tsResult: TUniTabSheet;
    UniContainerPanel1: TUniContainerPanel;
    UniLabel1: TUniLabel;
    lblDari: TUniLabel;
    UniLabel3: TUniLabel;
    lblSampai: TUniLabel;
    grdHeader: TUniDBGrid;
    QHeader: TFDQuery;
    DSHeader: TDataSource;
    grdDtl: TUniDBGrid;
    UniContainerPanel2: TUniContainerPanel;
    UniURLFrame1: TUniURLFrame;
    UniLabel2: TUniLabel;
    UniDBLookupComboBox1: TUniDBLookupComboBox;
    UniButton1: TUniButton;
    UniLabel4: TUniLabel;
    edNoMR: TUniEdit;
    UniLabel5: TUniLabel;
    edName: TUniEdit;
    UniLabel6: TUniLabel;
    dtTgl0: TUniDateTimePicker;
    UniLabel7: TUniLabel;
    dtTgl1: TUniDateTimePicker;
    cbTipepasien: TUniDBLookupComboBox;
    UniLabel8: TUniLabel;
    cbAsalPasien: TUniDBLookupComboBox;
    UniLabel9: TUniLabel;
    UniLabel10: TUniLabel;
    cbPerujuk: TUniDBLookupComboBox;
    UniLabel11: TUniLabel;
    cbAnsuransi: TUniDBLookupComboBox;
    UniLabel12: TUniLabel;
    NoLabDari: TUniEdit;
    UniLabel13: TUniLabel;
    NoLabSampai: TUniEdit;
    QTipePasien: TFDQuery;
    DSTipePasien: TDataSource;
    QAsalPasien: TFDQuery;
    DSAsalPasien: TDataSource;
    QPerujuk: TFDQuery;
    DSPerujuk: TDataSource;
    QAnsuransi: TFDQuery;
    DSAnsuransi: TDataSource;
    DSDtl: TDataSource;
    QDtl: TFDQuery;
    popDtl: TUniPopupMenu;
    pmMedVal: TUniMenuItem;
    pmRerunTest: TUniMenuItem;
    cmdMedVal: TFDCommand;
    cmdRerunTest: TFDCommand;
    QRep: TFDQuery;
    dsRep: TDataSource;
    btnPDF: TUniSpeedButton;
    mnTechVal: TUniMenuItem;
    cmdTechVal: TFDCommand;
    popHdr: TUniPopupMenu;
    Reloadtable1: TUniMenuItem;
    procedure UniFrameReady(Sender: TObject);
    procedure tsOverviewBeforeActivate(Sender: TObject;
      var AllowActivate: Boolean);
    procedure UniFrameBeforeReady(Sender: TObject);
    procedure pmMedValClick(Sender: TObject);
    procedure pmRerunTestClick(Sender: TObject);
    procedure grdDtlMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure popDtlPopup(Sender: TObject);
    procedure grdDtlKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure UniButton1Click(Sender: TObject);
    procedure btnPDFClick(Sender: TObject);
    procedure mnTechValClick(Sender: TObject);
    procedure Reloadtable1Click(Sender: TObject);
    procedure grdHeaderCellContextClick(Column: TUniDBGridColumn;
      X, Y: Integer);
  private
    { Private declarations }
    procedure refreshData;

  var
    sSQL: string;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses UnitIsiHasil, UnitReportJasper;

procedure TUniKMedVal.btnPDFClick(Sender: TObject);
begin
  try
    ShowMask('Loading');
    UniSession.Synchronize();
    UniSession.SendFile(reportExecReqParamsDownload('pdf',
      QRep.FieldByName('kode').AsString, QHeader.FieldByName('nomor').AsString,
      UniApplication.Cookies.GetCookie('OrganisasiId'),
      UniApplication.Cookies.GetCookie('LokasiId')),
      'PMI_PCR_REPORT_' + UpperCase(QHeader.FieldByName('nama').AsString)
      .Replace(' ', '_') + '.pdf');
  finally
    HideMask;
  end;
end;

procedure TUniKMedVal.grdDtlKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    if QDtl.RecordCount > 0 then
    begin
      frmIsiHasil.caller_form := 'UnitKMedVal';
      frmIsiHasil.order_detail_id := QDtl.FieldByName('id').AsInteger;
      frmIsiHasil.lbNamaTest.Caption := QDtl.FieldByName('nama_test').AsString;
      frmIsiHasil.cbHasil.Text := QDtl.FieldByName('hasil').AsString;
      frmIsiHasil.HasilAsli := QDtl.FieldByName('hasil').AsString;
      frmIsiHasil.ShowModal;
    end;
end;

procedure TUniKMedVal.grdDtlMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbRight then
    if QDtl.RecordCount > 0 then
      popDtl.Popup(X, Y, grdDtl);
end;

procedure TUniKMedVal.grdHeaderCellContextClick(Column: TUniDBGridColumn;
  X, Y: Integer);
begin
  popHdr.Popup(X, Y, grdHeader);
end;

procedure TUniKMedVal.mnTechValClick(Sender: TObject);
begin
  if QDtl.FieldByName('hasil').AsString <> '' then
  begin
    if cmdTechVal.Active then
      cmdTechVal.Active := False;
    cmdTechVal.ParamByName('val_teknis_oleh').Value :=
      UniApplication.Cookies.GetCookie('UserId');
    cmdTechVal.ParamByName('id').Value :=
      QDtl.FieldByName('order_detail_result_id').AsInteger;
    cmdTechVal.Execute();
    if QDtl.Active then
      QDtl.Active := False;
    QDtl.Active := True;
  end
  else
    ShowMessage('Hasil masih kosong. teken ENTER untuk isi hasil.');
end;

procedure TUniKMedVal.pmMedValClick(Sender: TObject);
begin
  if QDtl.FieldByName('hasil').AsString <> '' then
  begin
    if cmdMedVal.Active then
      cmdMedVal.Active := False;
    cmdMedVal.ParamByName('val_medis_oleh').Value :=
      UniApplication.Cookies.GetCookie('UserId');
    cmdMedVal.ParamByName('id').Value :=
      QDtl.FieldByName('order_detail_result_id').AsInteger;
    cmdMedVal.Execute();
    if QDtl.Active then
      QDtl.Active := False;
    QDtl.Active := True;
  end
  else
    ShowMessage('Hasil masih kosong. teken ENTER untuk isi hasil.');
end;

procedure TUniKMedVal.pmRerunTestClick(Sender: TObject);
begin
  if cmdRerunTest.Active then
    cmdRerunTest.Active := False;
  cmdRerunTest.ParamByName('id').Value := QDtl.FieldByName('id').AsInteger;
  cmdRerunTest.Execute();
  if QDtl.Active then
    QDtl.Active := False;
  QDtl.Active := True;
end;

procedure TUniKMedVal.popDtlPopup(Sender: TObject);
begin
  mnTechVal.Enabled := False;
  pmMedVal.Enabled := False;
  pmRerunTest.Enabled := False;

  if QDtl.FieldByName('val_teknis').AsInteger = 0 then
    mnTechVal.Enabled := True;

  if (QDtl.FieldByName('val_teknis').AsInteger > 0) and
    (QDtl.FieldByName('val_medis').AsInteger = 0) then
    pmMedVal.Enabled := True;

  if QDtl.FieldByName('hasil').AsString <> '' then
    pmRerunTest.Enabled := True;
end;

procedure TUniKMedVal.refreshData;
var
  tmpSQL: string;
begin
  with QHeader do
  begin
    if Active then
      Active := False;

    tmpSQL := sSQL + ' AND oh.tanggal between ' +
      QuotedStr(FormatDateTime('YYYY-MM-DD 00:00:00', dtTgl0.DateTime)) +
      ' and ' + QuotedStr(FormatDateTime('YYYY-MM-DD 23:59:59',
      dtTgl1.DateTime));
    if edNoMR.Text <> '' then
      tmpSQL := tmpSQL + ' AND p.noreg like ' +
        QuotedStr('%' + edNoMR.Text + '%');
    if edName.Text <> '' then
      tmpSQL := tmpSQL + ' AND p.nama like ' +
        QuotedStr('%' + edName.Text + '%');

    if cbTipepasien.Text <> '' then
      tmpSQL := tmpSQL + ' AND tp.id = ' + QTipePasien.FieldByName
        ('id').AsString;

    if cbAsalPasien.Text <> '' then
      tmpSQL := tmpSQL + ' AND tp.id = ' + QAsalPasien.FieldByName
        ('id').AsString;

    if cbPerujuk.Text <> '' then
      tmpSQL := tmpSQL + ' AND tp.id = ' + QPerujuk.FieldByName('id').AsString;

    if cbAnsuransi.Text <> '' then
      tmpSQL := tmpSQL + ' AND tp.id = ' + QAnsuransi.FieldByName('id')
        .AsString;

    if (NoLabDari.Text <> '') and (NoLabSampai.Text <> '') then
      tmpSQL := tmpSQL + ' AND oh.nomor between  ' + QuotedStr(NoLabDari.Text) +
        ' and ' + QuotedStr(NoLabSampai.Text)
    else if (NoLabDari.Text <> '') and (NoLabSampai.Text = '') then
      tmpSQL := tmpSQL + ' AND oh.nomor =  ' + QuotedStr(NoLabDari.Text)
    else if (NoLabDari.Text = '') and (NoLabSampai.Text <> '') then
      tmpSQL := tmpSQL + ' AND oh.nomor <=  ' + QuotedStr(NoLabSampai.Text);

    // ShowMessage(tmpSQL);

    SQL.Text := tmpSQL;
    Active := True;

    lblDari.Caption := DateToStr(dtTgl0.DateTime);
    lblSampai.Caption := DateToStr(dtTgl1.DateTime);

    if QDtl.Active then
      QDtl.Active := False;
    QDtl.Active := True;

  end;

end;

procedure TUniKMedVal.Reloadtable1Click(Sender: TObject);
begin
  if QHeader.Active then
    QHeader.Active := False;
  QHeader.Active := True;

end;

procedure TUniKMedVal.tsOverviewBeforeActivate(Sender: TObject;
  var AllowActivate: Boolean);
begin
  refreshData;
end;

procedure TUniKMedVal.UniButton1Click(Sender: TObject);
begin
  try
    ShowMask('Loading');
    UniSession.Synchronize();
    UniURLFrame1.URL := reportExecReqParams('pdf', QRep.FieldByName('kode')
      .AsString, QHeader.FieldByName('nomor').AsString,
      UniApplication.Cookies.GetCookie('OrganisasiId'),
      UniApplication.Cookies.GetCookie('LokasiId'));
  finally
    HideMask;
  end;
end;

procedure TUniKMedVal.UniFrameBeforeReady(Sender: TObject);
begin
  sSQL := 'SELECT oh.id,date(oh.tanggal) tanggal,oh.nomor,p.noreg,p.nama,p.tanggal_lahir,jk.nama jenis_kelamin,tp.nama tipe_pasien, '
    + 'ap.nama asal_pasien, anp.nama ansuransi_pasien,d.nama dokter,oh.tanggal tanggal_dt '
    + 'FROM order_header oh ' + 'LEFT JOIN pasien p ON oh.pasien_id = p.id ' +
    'LEFT JOIN jenis_kelamin jk ON p.jenis_kelamin_id = jk.id ' +
    'LEFT JOIN tipe_pasien tp ON oh.tipe_pasien_id = tp.id ' +
    'LEFT JOIN asal_pasien ap ON oh.asal_pasien_id = ap.id ' +
    'LEFT JOIN ansuransi_pasien anp ON oh.ansuransi_pasien_id = anp.id ' +
    'LEFT JOIN dokter d ON oh.dokter_id = d.id ' + 'WHERE oh.organisasi_id = ' +
    UniApplication.Cookies.GetCookie('OrganisasiId') + ' AND oh.lokasi_id = ' +
    UniApplication.Cookies.GetCookie('LokasiId');

  dtTgl0.DateTime := now;
  dtTgl1.DateTime := now;
  refreshData;

  if QTipePasien.Active then
    QTipePasien.Active := False;
  QTipePasien.ParamByName('organisasi_id').Value :=
    UniApplication.Cookies.GetCookie('OrganisasiId');
  QTipePasien.Active := True;

  if QAsalPasien.Active then
    QAsalPasien.Active := False;
  QAsalPasien.ParamByName('organisasi_id').Value :=
    UniApplication.Cookies.GetCookie('OrganisasiId');
  QAsalPasien.Active := True;

  if QPerujuk.Active then
    QPerujuk.Active := False;
  QPerujuk.ParamByName('organisasi_id').Value :=
    UniApplication.Cookies.GetCookie('OrganisasiId');
  QPerujuk.Active := True;

  if QPerujuk.Active then
    QPerujuk.Active := False;
  QPerujuk.ParamByName('organisasi_id').Value :=
    UniApplication.Cookies.GetCookie('OrganisasiId');
  QPerujuk.Active := True;

  if QAnsuransi.Active then
    QAnsuransi.Active := False;
  QAnsuransi.ParamByName('organisasi_id').Value :=
    UniApplication.Cookies.GetCookie('OrganisasiId');
  QAnsuransi.Active := True;

  QRep.Open();

end;

procedure TUniKMedVal.UniFrameReady(Sender: TObject);
begin
  pcAtas.ActivePage := tsOverview;
  pcBawah.ActivePage := tsRepView;
end;

initialization

RegisterClass(TUniKMedVal);

end.
