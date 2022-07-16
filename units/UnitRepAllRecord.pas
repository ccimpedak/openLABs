unit UnitRepAllRecord;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniButton, uniDateTimePicker, uniGUIBaseClasses,
  uniLabel, UnitReportDisplay, UnitJasper, uniEdit, uniBitBtn, uniSpeedButton;

type
  TUniRepAllRecord = class(TUniFrame)
    UniLabel1: TUniLabel;
    UniLabel2: TUniLabel;
    dtDari: TUniDateTimePicker;
    dtSampai: TUniDateTimePicker;
    UniSpeedButton2: TUniSpeedButton;
    UniSpeedButton1: TUniSpeedButton;
    procedure expXLSXClick(Sender: TObject);
    procedure UniButton2Click(Sender: TObject);
    procedure UniFrameReady(Sender: TObject);
    procedure UniSpeedButton2Click(Sender: TObject);
    procedure UniSpeedButton1Click(Sender: TObject);
    procedure UniFrameCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TUniRepAllRecord.expXLSXClick(Sender: TObject);
var
  Result: string;
  nama_report: string;
begin
  nama_report := 'laporan_all_record';
  ShowMask('Loading');
  UniSession.Synchronize();
  Result := reportExecutionRequest('xlsx', nama_report,
    FormatDateTime('YYYY-MM-DD', dtDari.DateTime), FormatDateTime('YYYY-MM-DD',
    dtSampai.DateTime), '', '', '');
  UniSession.SendFile(Result);

  HideMask;
end;

procedure TUniRepAllRecord.UniButton2Click(Sender: TObject);
var
  Result: string;
  nama_report: string;
begin
  nama_report := 'laporan_all_record';

  ShowMask('Loading');
  UniSession.Synchronize();
  frmReportDisplay.UniURLFrame1.URL := reportExecutionRequest('pdf',
    nama_report, FormatDateTime('YYYY-MM-DD', dtDari.DateTime),
    FormatDateTime('YYYY-MM-DD', dtSampai.DateTime), '', '', '');
  frmReportDisplay.ShowModal();
  HideMask;

end;

procedure TUniRepAllRecord.UniFrameCreate(Sender: TObject);
begin
  dtDari.DateTime := Now;
  dtSampai.DateTime := Now;
end;

procedure TUniRepAllRecord.UniFrameReady(Sender: TObject);
var
  thn, bln, tgl: word;
  sThn, sBln, Stgl: string;
begin
  decodeDate(Now, thn, bln, tgl);
  sThn := IntToStr(thn);
  if bln < 10 then
    sBln := '0' + IntToStr(bln)
  else
    sBln := IntToStr(bln);
  if tgl < 10 then
    Stgl := '0' + IntToStr(tgl)
  else
    Stgl := IntToStr(tgl);

  dtDari.DateTime := Now;
  dtSampai.DateTime := Now;
end;

procedure TUniRepAllRecord.UniSpeedButton1Click(Sender: TObject);
var
  Result: string;
  nama_report: string;
begin
  nama_report := 'laporan_all_record';

  ShowMask('Loading');
  UniSession.Synchronize();
  frmReportDisplay.UniURLFrame1.URL := reportExecutionRequest('pdf',
    nama_report, FormatDateTime('YYYY-MM-DD', dtDari.DateTime),
    FormatDateTime('YYYY-MM-DD', dtSampai.DateTime), '', '', '');
  frmReportDisplay.ShowModal();
  HideMask;

end;

procedure TUniRepAllRecord.UniSpeedButton2Click(Sender: TObject);
var
  Result: string;
  nama_report: string;
begin
  nama_report := 'laporan_all_record';
  ShowMask('Loading');
  UniSession.Synchronize();
  Result := reportExecutionRequest('xlsx', nama_report,
    FormatDateTime('YYYY-MM-DD', dtDari.DateTime), FormatDateTime('YYYY-MM-DD',
    dtSampai.DateTime), '', '', '');
  UniSession.SendFile(Result);

  HideMask;
end;

initialization

RegisterClass(TUniRepAllRecord);

end.
