unit UnitViewerCriticalMon;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Vcl.Menus, uniMainMenu,
  uniImageList, uniGUIBaseClasses, uniTimer, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uniBasicGrid, uniDBGrid, uniButton, uniBitBtn, uniPanel,
  uniHTMLFrame, uniLabel, StrUtils, uniStrUtils, uniPageControl, uniSpeedButton,
  uniDateTimePicker, uniURLFrame, DateUtils;

type
  TUniViewerCriticalMon = class(TUniFrame)
    UniContainerPanel1: TUniContainerPanel;
    lblInfo: TUniLabel;
    UniHTMLFrame1: TUniHTMLFrame;
    UniContainerPanel2: TUniContainerPanel;
    DSHasil: TDataSource;
    tmHasilAlarm: TUniTimer;
    tmLabel: TUniTimer;
    UniNativeImageList1: TUniNativeImageList;
    QParameters: TFDQuery;
    UniPageControl1: TUniPageControl;
    tsAlarm: TUniTabSheet;
    tsValidated: TUniTabSheet;
    tsReported: TUniTabSheet;
    UniContainerPanel3: TUniContainerPanel;
    UniContainerPanel4: TUniContainerPanel;
    UniContainerPanel5: TUniContainerPanel;
    DSValid: TDataSource;
    QValid: TFDQuery;
    UniDBGrid2: TUniDBGrid;
    UniDBGrid1: TUniDBGrid;
    QHasil: TFDQuery;
    btnRefreshValid: TUniButton;
    btnLaporkan: TUniBitBtn;
    UniContainerPanel6: TUniContainerPanel;
    UniLabel1: TUniLabel;
    dtStart: TUniDateTimePicker;
    UniLabel2: TUniLabel;
    dtEnd: TUniDateTimePicker;
    UniContainerPanel7: TUniContainerPanel;
    UniSpeedButton1: TUniSpeedButton;
    UniURLFrame1: TUniURLFrame;
    btnDownload: TUniSpeedButton;
    UniButton1: TUniButton;
    cmdHapus: TFDCommand;
    QTipeAlaram: TFDQuery;
    procedure tmLabelTimer(Sender: TObject);
    procedure tmHasilAlarmTimer(Sender: TObject);
    procedure UniFrameReady(Sender: TObject);
    procedure UniDBGrid1MultiColumnSort(Columns: TUniDBGridColumnArr;
      Directions: TUniSortDirections);
    procedure btnLaporkanClick(Sender: TObject);
    procedure Ruangan1Click(Sender: TObject);
    procedure UniDBGrid2ColumnSort(Column: TUniDBGridColumn;
      Direction: Boolean);
    procedure UniFrameCreate(Sender: TObject);
    procedure UniDBGrid1ColumnSort(Column: TUniDBGridColumn;
      Direction: Boolean);
    procedure btnRefreshValidClick(Sender: TObject);
    procedure UniSpeedButton1Click(Sender: TObject);
    procedure btnDownloadClick(Sender: TObject);
    procedure UniButton1Click(Sender: TObject);
    procedure UniDBGrid1DrawColumnCell(Sender: TObject; ACol, ARow: Integer;
      Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
    procedure UniDBGrid2DrawColumnCell(Sender: TObject; ACol, ARow: Integer;
      Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses UnitAksesLogin, UnitSettingAsal, UnitLapor,
  uniGUIApplication, UnitReportJasper,
  UnitReportDisplay;

procedure TUniViewerCriticalMon.btnDownloadClick(Sender: TObject);
var
  start_date, end_date: string;
begin
  ShowMask('Loading');
  UniSession.Synchronize();
  start_date := FormatDateTime('YYYY-MM-dd', dtStart.DateTime);
  end_date := FormatDateTime('YYYY-MM-dd', dtEnd.DateTime);
  UniSession.SendFile(reportExecReqParams('xls', 'laporan_kritis', start_date,
    end_date, ''));
  HideMask;
end;

procedure TUniViewerCriticalMon.btnLaporkanClick(Sender: TObject);
begin
  if QValid.RecordCount > 0 then
  begin
    frmLapor.fullname := UniApplication.Cookies.GetCookie('UserName');
    frmLapor.id_user := UniApplication.Cookies.GetCookie('UserId');
    frmLapor.nomor_lab := QValid.FieldByName('nomor').AsString;
    frmLapor.ShowModal;
  end;
end;

procedure TUniViewerCriticalMon.Ruangan1Click(Sender: TObject);
begin
  frmAsal.ShowModal();
end;

procedure TUniViewerCriticalMon.tmHasilAlarmTimer(Sender: TObject);
begin
  if QHasil.Active then
    QHasil.Active := False;
  QHasil.ParamByName('user').Value := UniApplication.Cookies.GetCookie
    ('UserName');
  QHasil.Active := True;

  if QTipeAlaram.Active then
    QTipeAlaram.Active := False;
  QTipeAlaram.ParamByName('user').Value := UniApplication.Cookies.GetCookie
    ('UserName');
  QTipeAlaram.Active := True;

  if QHasil.RecordCount > 0 then
  begin
    if QTipeAlaram.FieldByName('rutin').AsInteger > 0 then
      UniSession.AddJS
        ('var x_rutin = document.getElementById("myAudio"); x_rutin.play();');
    if QTipeAlaram.FieldByName('cito').AsInteger > 0 then
      UniSession.AddJS
        ('var x_cito = document.getElementById("myAudio_cito"); x_cito.play();');
  end
  else
  begin
    if QTipeAlaram.FieldByName('rutin').AsInteger = 0 then
      UniSession.AddJS
        ('var x_rutin = document.getElementById("myAudio"); x_rutin.pause();');
    if QTipeAlaram.FieldByName('cito').AsInteger = 0 then
      UniSession.AddJS
        ('var x_cito = document.getElementById("myAudio_cito"); x_cito.pause();');
  end;
end;

procedure TUniViewerCriticalMon.tmLabelTimer(Sender: TObject);
begin
  if QHasil.RecordCount > 0 then
  begin
    if lblInfo.Font.Color = clRed then
      lblInfo.Font.Color := clBlue
    else
      lblInfo.Font.Color := clRed;
    lblInfo.Caption := 'KRITIS [ ' + IntToStr(QHasil.RecordCount) + ' ]';
  end
  else
  begin
    if lblInfo.Font.Color = clBlack then
      lblInfo.Font.Color := clGreen
    else
      lblInfo.Font.Color := clBlack;
    lblInfo.Caption := 'Monitoring...';
  end;

  tmLabel.Enabled := True;
end;

procedure TUniViewerCriticalMon.btnRefreshValidClick(Sender: TObject);
begin
  if QValid.Active then
    QValid.Active := False;
  QValid.Active := True
end;

procedure TUniViewerCriticalMon.UniButton1Click(Sender: TObject);
begin
  if cmdHapus.Active then
    cmdHapus.Active := False;
  cmdHapus.ParamByName('nomor').Value := QHasil.FieldByName('nomor').AsString;
  cmdHapus.Execute();

  if QHasil.Active then
    QHasil.Active := False;
  QHasil.ParamByName('user').Value := UniApplication.Cookies.GetCookie
    ('UserName');
  QHasil.Active := True;

end;

procedure TUniViewerCriticalMon.UniDBGrid1ColumnSort(Column: TUniDBGridColumn;
  Direction: Boolean);
begin
  if SameText(Column.FieldName, 'nomor') then
    QHasil.IndexName := 'NomorIndex';
end;

procedure TUniViewerCriticalMon.UniDBGrid1DrawColumnCell(Sender: TObject;
  ACol, ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
begin
  if ACol = 5 then
  begin
    Attribs.Color := clRed;
  end;
end;

procedure TUniViewerCriticalMon.UniDBGrid1MultiColumnSort
  (Columns: TUniDBGridColumnArr; Directions: TUniSortDirections);
var
  OrderStr: string;
  I: Integer;
begin
  // if QHasil.Active then
  // QHasil.Active := False;
  //
  // OrderStr := 'select * from v_critical_mon ' + ' order by ';
  //
  // for I := Low(Columns) to High(Columns) do
  // begin
  // OrderStr := OrderStr + '' + Columns[I].FieldName + ' ' +
  // IfThen(Directions[I], 'ASC', 'DESC') + ',';
  //
  // end;
  //
  // OrderStr := RemoveTrailingChar(OrderStr, ',');
  //
  // QHasil.SQL.Text := OrderStr;
  QHasil.Active := True;
end;

procedure TUniViewerCriticalMon.UniDBGrid2ColumnSort(Column: TUniDBGridColumn;
  Direction: Boolean);
begin
  if SameText(Column.FieldName, 'nomor') then
    QValid.IndexName := 'NomorIndex';
end;

procedure TUniViewerCriticalMon.UniDBGrid2DrawColumnCell(Sender: TObject;
  ACol, ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
begin
  if ACol = 5 then
  begin
    Attribs.Color := clRed;
  end;
end;

procedure TUniViewerCriticalMon.UniFrameCreate(Sender: TObject);
begin
  QValid.IndexDefs.Add('NomorIndex', 'nomor', []);
  QHasil.IndexDefs.Add('NomorIndex', 'nomor', []);
end;

procedure TUniViewerCriticalMon.UniFrameReady(Sender: TObject);
begin
  UniPageControl1.ActivePage := tsAlarm;

  dtStart.DateTime := EncodeDate(DateUtils.YearOf(Now),
    DateUtils.MonthOf(Now), 1);
  dtEnd.DateTime := Now;

  tmHasilAlarm.Enabled := True;
  if QParameters.Active then
    QParameters.Active := False;
  QParameters.ParamByName('name').Value := 'REFRESH_TIME';
  QParameters.Active := True;

  if QParameters.RecordCount > 0 then
    tmHasilAlarm.Interval := QParameters.FieldByName('value_num')
      .AsInteger * 1000;

  btnRefreshValidClick(self);

end;

procedure TUniViewerCriticalMon.UniSpeedButton1Click(Sender: TObject);
var
  start_date, end_date: string;
begin
  ShowMask('Loading');
  UniSession.Synchronize();
  start_date := FormatDateTime('YYYY-MM-dd', dtStart.DateTime);
  end_date := FormatDateTime('YYYY-MM-dd', dtEnd.DateTime);
  UniURLFrame1.URL := reportExecReqParams('html', 'laporan_kritis', start_date,
    end_date, '');

  btnDownload.Enabled := False;
  if UniURLFrame1.URL <> '' then
    btnDownload.Enabled := True;
  HideMask;

end;

initialization

RegisterClass(TUniViewerCriticalMon);

end.
