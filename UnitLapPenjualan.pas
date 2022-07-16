unit UnitLapPenjualan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniButton, uniMultiItem, uniComboBox,
  uniDateTimePicker, uniGUIBaseClasses, uniLabel, IdHTTP, IdCookieManager,
  System.JSON, System.NetEncoding,
  uniMemo, IPPeerClient, REST.Client, Data.Bind.Components,
  Data.Bind.ObjectScope, IdBaseComponent, IdComponent, IdTCPConnection, idUri,
  IdTCPClient, REST.Authenticator.Basic, uniPanel, uniHTMLFrame;

type
  TfrmLapPenjualan = class(TUniForm)
    UniLabel1: TUniLabel;
    dtStart: TUniDateTimePicker;
    UniLabel2: TUniLabel;
    dtEnd: TUniDateTimePicker;
    UniLabel3: TUniLabel;
    cbTipeLap: TUniComboBox;
    expXLSX: TUniButton;
    UniButton2: TUniButton;
    UniButton3: TUniButton;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    HTTPBasicAuthenticator1: THTTPBasicAuthenticator;
    HTTPx: TIdHTTP;
    IdCookieManager1: TIdCookieManager;
    procedure UniButton3Click(Sender: TObject);
    procedure UniButton2Click(Sender: TObject);
    procedure expXLSXClick(Sender: TObject);
    procedure UniFormBeforeShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function frmLapPenjualan: TfrmLapPenjualan;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, UnitReportDisplay, ServerModule;

function getReportName(): string;
begin
  if frmLapPenjualan.cbTipeLap.Text = 'Kelompok Test' then
    Result := 'laporan_penjualan_kelompok_test'
  else if frmLapPenjualan.cbTipeLap.Text = 'Test' then
    Result := 'laporan_penjualan_test'
  else if frmLapPenjualan.cbTipeLap.Text = 'Marketing' then
    Result := 'laporan_penjualan_marketing'
  else if frmLapPenjualan.cbTipeLap.Text = 'Tipe Pasien' then
    Result := 'laporan_penjualan_tipe_pasien'
  else if frmLapPenjualan.cbTipeLap.Text = 'Gender' then
    Result := 'laporan_penjualan_gender'
  else if frmLapPenjualan.cbTipeLap.Text = 'Kelompok Umur' then
    Result := 'laporan_penjualan_kelompok_umur'
  else if frmLapPenjualan.cbTipeLap.Text = 'Wilayah Pasien' then
    Result := 'laporan_penjualan_wilayah_pasien'
  else if frmLapPenjualan.cbTipeLap.Text = 'Tipe Pasien 2' then
    Result := 'laporan_penjualan_tipe_pasien_2'
  else if frmLapPenjualan.cbTipeLap.Text = 'Dokter Spesialis' then
    Result := 'laporan_penjualan_dokter_spesialis'
  else
    Result := '???';

end;

procedure reportExecutionRequest(file_type: String; report_name: string;
  start_date: string; end_date: string);
var
  S: TStringList;
  M: TStream;
  HTTP: TIdHTTP;
  FUrl, filename, token, Data, ResponseBody, fullpath: string;
  RequestBody: TStream;
  res: TStringStream;
  cookie: TIdCookieManager;
  uri: TIdURI;
  JSON: TJSONObject;
begin
  HTTP := TIdHTTP.Create;
  S := TStringList.Create;
  S.Add('{"reportExecutionRequest": {"fileType": "' + file_type +
    '","reportName": "' + report_name + '","startDate": "' + start_date +
    '","endDate": "' + end_date + '"}}');
  try
    token := 'amFzcGVyYWRtaW46UEBzc3cwcmQ=';
    HTTP.Request.Accept := 'application/json';

    HTTP.AllowCookies := True;
    HTTP.HandleRedirects := True;

    cookie := TIdCookieManager.Create(nil);

    HTTP.CookieManager := cookie;

    HTTP.Request.ContentType := 'text/xml';
    HTTP.HTTPOptions := [hoWaitForUnexpectedData, hoTreat302Like303];
    HTTP.Request.CustomHeaders.AddValue('Authorization', 'Basic ' + token);

    ResponseBody := HTTP.Post('http://localhost:7000/reportExecutions/', S);

    FUrl := UniServerModule.FilesFolderURL + 'jasper/';

    try
      JSON := TJSONObject.ParseJSONValue(ResponseBody) as TJSONObject;

      filename := (JSON.Get('filename').JsonValue as TJSONString).Value;
      fullpath := (JSON.Get('fullpath').JsonValue as TJSONString).Value;

      if file_type = 'pdf' then
      begin
        frmReportDisplay.UniURLFrame1.URL := FUrl + filename;
        frmReportDisplay.ShowModal();
      end
      else
      begin
        UniSession.SendFile(fullpath);
      end;
    except
      on E: Exception do
      begin
        frmLapPenjualan.ShowMessage(ResponseBody);
      end;
    end;

  finally
    S.Free;
  end;

end;

function frmLapPenjualan: TfrmLapPenjualan;
begin
  Result := TfrmLapPenjualan(UniMainModule.GetFormInstance(TfrmLapPenjualan));
end;

procedure TfrmLapPenjualan.expXLSXClick(Sender: TObject);
var
  nama_laporan, start_date, end_date: string;
begin
  nama_laporan := getReportName();

  if nama_laporan <> '???' then
  begin
    ShowMask('Loading');
    UniSession.Synchronize();

    start_date := FormatDateTime('YYYY-MM-dd', dtStart.DateTime);
    end_date := FormatDateTime('YYYY-MM-dd', dtEnd.DateTime);

    reportExecutionRequest('xlsx', nama_laporan, start_date, end_date);

    HideMask;
  end;
end;

procedure TfrmLapPenjualan.UniButton2Click(Sender: TObject);
var
  nama_laporan, start_date, end_date: string;
begin
  nama_laporan := getReportName();

  if nama_laporan <> '???' then
  begin
    ShowMask('Loading');
    UniSession.Synchronize();

    start_date := FormatDateTime('YYYY-MM-dd', dtStart.DateTime);
    end_date := FormatDateTime('YYYY-MM-dd', dtEnd.DateTime);

    reportExecutionRequest('pdf', nama_laporan, start_date, end_date);

    HideMask;
  end;
end;

procedure TfrmLapPenjualan.UniButton3Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmLapPenjualan.UniFormBeforeShow(Sender: TObject);
begin
dtStart.DateTime := Now;
dtEnd.DateTime := Now;
end;

end.
