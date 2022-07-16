unit UnitLapPenjualanFilter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniGUIBaseClasses, uniPanel, uniDateTimePicker,
  uniLabel, uniMultiItem, uniComboBox, uniDBComboBox, uniDBLookupComboBox,
  uniButton, uniBitBtn, uniSpeedButton, uniURLFrame, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, UnitJasper;

type
  TUniLapPenjualanFilter = class(TUniFrame)
    UniContainerPanel1: TUniContainerPanel;
    cReport: TUniContainerPanel;
    UniLabel1: TUniLabel;
    dtDari: TUniDateTimePicker;
    UniLabel2: TUniLabel;
    dtSampai: TUniDateTimePicker;
    UniLabel3: TUniLabel;
    cbOrigin: TUniDBLookupComboBox;
    UniLabel4: TUniLabel;
    cbPhysician: TUniDBLookupComboBox;
    cbInsurance: TUniDBLookupComboBox;
    UniLabel5: TUniLabel;
    UniContainerPanel3: TUniContainerPanel;
    UniURLFrame1: TUniURLFrame;
    UniSpeedButton1: TUniSpeedButton;
    QOrigin: TFDQuery;
    DSOrigin: TDataSource;
    QPhysician: TFDQuery;
    DSPhysician: TDataSource;
    DSInsurance: TDataSource;
    QInsurance: TFDQuery;
    UniSpeedButton2: TUniSpeedButton;
    UniSpeedButton3: TUniSpeedButton;
    procedure UniFrameReady(Sender: TObject);
    procedure UniSpeedButton1Click(Sender: TObject);
    procedure UniSpeedButton2Click(Sender: TObject);
    procedure UniSpeedButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TUniLapPenjualanFilter.UniFrameReady(Sender: TObject);
begin
  QOrigin.Open();
  QInsurance.Open();
  QPhysician.Open();
  dtDari.DateTime := Now;
  dtSampai.DateTime := Now;
end;

procedure TUniLapPenjualanFilter.UniSpeedButton1Click(Sender: TObject);
var
  Result, filter1, filter2, filter3: string;
  nama_report: string;
begin
  nama_report := 'laporan_penjualan_filter';

  filter1 := '';
  filter2 := '';
  filter3 := '';

  if cbOrigin.Text <> '' then
    filter1 := QOrigin.FieldByName('id').AsString;
  if cbPhysician.Text <> '' then
    filter2 := QPhysician.FieldByName('id').AsString;
  if cbInsurance.Text <> '' then
    filter3 := QInsurance.FieldByName('id').AsString;

  ShowMask('Loading');
  UniSession.Synchronize();
  // UniURLFrame1.URL := reportExecutionRequestFilter('pdf', nama_report,
  // FormatDateTime('YYYY-MM-DD', dtDari.DateTime), FormatDateTime('YYYY-MM-DD',
  // dtSampai.DateTime), filter1, filter2, filter3);

//  UniURLFrame1.URL := reportExecutionRequestParam('pdf', nama_report,
//    FormatDateTime('YYYY-MM-DD', dtDari.DateTime), FormatDateTime('YYYY-MM-DD',
//    dtSampai.DateTime), filter1);
  cReport.Visible := True;
  HideMask;
end;

procedure TUniLapPenjualanFilter.UniSpeedButton2Click(Sender: TObject);
var
  Result, filter1, filter2, filter3: string;
  nama_report: string;
begin

  nama_report := 'laporan_penjualan_filter';

  filter1 := '';
  filter2 := '';
  filter3 := '';

  if cbOrigin.Text <> '' then
    filter1 := QOrigin.FieldByName('id').AsString;
  if cbPhysician.Text <> '' then
    filter2 := QPhysician.FieldByName('id').AsString;
  if cbInsurance.Text <> '' then
    filter3 := QInsurance.FieldByName('id').AsString;

  nama_report := 'laporan_penjualan_filter';
  ShowMask('Loading');
  UniSession.Synchronize();
  // Result := reportExecutionRequestFilter('xlsx', nama_report,
  // FormatDateTime('YYYY-MM-DD', dtDari.DateTime), FormatDateTime('YYYY-MM-DD',
  // dtSampai.DateTime), filter1, filter2, filter3);

//  UniURLFrame1.URL := reportExecutionRequestParam('xlsx', nama_report,
//    FormatDateTime('YYYY-MM-DD', dtDari.DateTime), FormatDateTime('YYYY-MM-DD',
//    dtSampai.DateTime), filter1);
  UniSession.SendFile(Result);

  HideMask;
end;

procedure TUniLapPenjualanFilter.UniSpeedButton3Click(Sender: TObject);
begin
  cbOrigin.Text := '';
  cbPhysician.Text := '';
  cbInsurance.Text := '';
end;

initialization

RegisterClass(TUniLapPenjualanFilter);

end.
