unit UnitLaporanHarian;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniButton, uniEdit, uniGUIBaseClasses, uniLabel,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uniCheckBox,
  uniBitBtn, uniSpeedButton;

type
  TfrmLaporanHarian = class(TUniForm)
    UniLabel1: TUniLabel;
    edTgl0: TUniEdit;
    qHarian: TFDQuery;
    qHariantanggal: TDateTimeField;
    qHariannomor: TStringField;
    qHariannama: TStringField;
    qHariansub_total: TBCDField;
    qHariandisc_amount: TBCDField;
    qHarianuser_nama: TStringField;
    qHariantgl_bayar: TDateTimeField;
    qHariantp_nama: TStringField;
    qHariancharge: TFMTBCDField;
    qHarianjumlah: TFMTBCDField;
    qHariantagihan: TBCDField;
    qHarianflg_same_day: TStringField;
    qHarianuser_name: TStringField;
    qHariandokter_nama: TStringField;
    qHarianflg_sales: TStringField;
    qHarianflg_first: TStringField;
    qHariandisc_amount_1: TBCDField;
    qHariannetto: TBCDField;
    qHarianbayar: TBCDField;
    qHarianpiutang: TBCDField;
    qHariantests: TStringField;
    qHarianheader_id: TIntegerField;
    qHarianprefix: TStringField;
    qHarianDgnTes: TFDQuery;
    DateTimeField1: TDateTimeField;
    StringField1: TStringField;
    StringField2: TStringField;
    BCDField1: TBCDField;
    BCDField2: TBCDField;
    StringField3: TStringField;
    DateTimeField2: TDateTimeField;
    StringField4: TStringField;
    FMTBCDField1: TFMTBCDField;
    FMTBCDField2: TFMTBCDField;
    BCDField3: TBCDField;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    StringField8: TStringField;
    StringField9: TStringField;
    BCDField4: TBCDField;
    BCDField5: TBCDField;
    BCDField6: TBCDField;
    BCDField7: TBCDField;
    StringField10: TStringField;
    IntegerField1: TIntegerField;
    StringField11: TStringField;
    cbDgnTes: TUniCheckBox;
    UniLabel2: TUniLabel;
    edTgl1: TUniEdit;
    UniSpeedButton1: TUniSpeedButton;
    UniSpeedButton2: TUniSpeedButton;
    procedure UniFormAfterShow(Sender: TObject);
    procedure UniButton2Click(Sender: TObject);
    procedure UniButton1Click(Sender: TObject);
    procedure UniButton3Click(Sender: TObject);
    procedure UniSpeedButton1Click(Sender: TObject);
    procedure UniSpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function frmLaporanHarian: TfrmLaporanHarian;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, ServerModule, UnitReportDisplay,
  UnitJasper;

function frmLaporanHarian: TfrmLaporanHarian;
begin
  Result := TfrmLaporanHarian(UniMainModule.GetFormInstance(TfrmLaporanHarian));
end;

procedure TfrmLaporanHarian.UniButton1Click(Sender: TObject);
var
  Result: string;
  nama_report: string;
begin
  if cbDgnTes.Checked then
    nama_report := 'laporan_pendapatan_harian_test'
  else
    nama_report := 'laporan_pendapatan_harian';
  ShowMask('Loading');
  UniSession.Synchronize();
  Result := reportExecutionRequest('xlsx', nama_report, edTgl0.Text,
    edTgl1.Text, '', '', '');
  UniSession.SendFile(Result);

  HideMask;
  { if cbDgnTes.Checked then
    begin
    if qHarianDgnTes.Active then
    qHarianDgnTes.Active := False;
    qHarianDgnTes.ParamByName('tanggal').AsString := edTgl.Text;
    qHarianDgnTes.Active := True;

    repHarianDgnTes.EngineOptions.SilentMode := True;
    repHarianDgnTes.EngineOptions.EnableThreadSafe := True;
    repHarianDgnTes.EngineOptions.DestroyForms := False;
    repHarianDgnTes.EngineOptions.UseGlobalDataSetList := False;

    repHarianDgnTes.PrintOptions.ShowDialog := False;
    repHarianDgnTes.ShowProgress := False;
    repHarianDgnTes.PreviewOptions.AllowEdit := False;

    frxXLSXExport1.ShowProgress := False;
    frxXLSXExport1.ShowDialog := False;

    frxXLSXExport1.FileName := UniServerModule.NewCacheFileUrl(False, 'xlsx',
    '', '', AUrl);
    frxXLSXExport1.DefaultPath := '';
    repHarianDgnTes.Variables['tanggal'] := QuotedStr(edTgl.Text);

    repHarianDgnTes.PrepareReport;
    repHarianDgnTes.Export(frxXLSXExport1);

    UniSession.SendFile(frxXLSXExport1.FileName);
    end
    else
    begin
    if qHarian.Active then
    qHarian.Active := False;
    qHarian.ParamByName('tanggal').AsString := edTgl.Text;
    qHarian.Active := True;

    frxReport1.EngineOptions.SilentMode := True;
    frxReport1.EngineOptions.EnableThreadSafe := True;
    frxReport1.EngineOptions.DestroyForms := False;
    frxReport1.EngineOptions.UseGlobalDataSetList := False;

    frxReport1.PrintOptions.ShowDialog := False;
    frxReport1.ShowProgress := False;
    frxReport1.PreviewOptions.AllowEdit := False;

    frxXLSXExport1.ShowProgress := False;
    frxXLSXExport1.ShowDialog := False;

    frxXLSXExport1.FileName := UniServerModule.NewCacheFileUrl(False, 'xlsx',
    '', '', AUrl);
    frxXLSXExport1.DefaultPath := '';
    frxReport1.Variables['tanggal'] := QuotedStr(edTgl.Text);

    frxReport1.PrepareReport;
    frxReport1.Export(frxXLSXExport1);

    UniSession.SendFile(frxXLSXExport1.FileName);
    end;
  }
end;

procedure TfrmLaporanHarian.UniButton2Click(Sender: TObject);
var
  Result: string;
  nama_report: string;
begin
  if cbDgnTes.Checked then
    nama_report := 'laporan_pendapatan_harian_test'
  else
    nama_report := 'laporan_pendapatan_harian';

  ShowMask('Loading');
  UniSession.Synchronize();
  frmReportDisplay.UniURLFrame1.URL := reportExecutionRequest('pdf',
    nama_report, edTgl0.Text, edTgl1.Text, '', '', '');
  frmReportDisplay.ShowModal();
  HideMask;
end;

procedure TfrmLaporanHarian.UniButton3Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmLaporanHarian.UniFormAfterShow(Sender: TObject);
var
  thn, bln, tgl: word;
  sThn, sBln, Stgl: string;
begin
  decodeDate(now, thn, bln, tgl);
  sThn := IntToStr(thn);
  if bln < 10 then
    sBln := '0' + IntToStr(bln)
  else
    sBln := IntToStr(bln);
  if tgl < 10 then
    Stgl := '0' + IntToStr(tgl)
  else
    Stgl := IntToStr(tgl);

  edTgl0.Text := sThn + '-' + sBln + '-' + Stgl;
  edTgl1.Text := sThn + '-' + sBln + '-' + Stgl;

end;

procedure TfrmLaporanHarian.UniSpeedButton1Click(Sender: TObject);
var
  Result: string;
  nama_report: string;
begin
  if cbDgnTes.Checked then
    nama_report := 'laporan_pendapatan_harian_test'
  else
    nama_report := 'laporan_pendapatan_harian';

  ShowMask('Loading');
  UniSession.Synchronize();
  frmReportDisplay.UniURLFrame1.URL := reportExecutionRequest('pdf',
    nama_report, edTgl0.Text, edTgl1.Text, '', '', '');
  frmReportDisplay.ShowModal();
  HideMask;

end;

procedure TfrmLaporanHarian.UniSpeedButton2Click(Sender: TObject);
var
  Result: string;
  nama_report: string;
begin
  if cbDgnTes.Checked then
    nama_report := 'laporan_pendapatan_harian_test'
  else
    nama_report := 'laporan_pendapatan_harian';
  ShowMask('Loading');
  UniSession.Synchronize();
  Result := reportExecutionRequest('xlsx', nama_report, edTgl0.Text,
    edTgl1.Text, '', '', '');
  UniSession.SendFile(Result);

  HideMask;

end;

end.
