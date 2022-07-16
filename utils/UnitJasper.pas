unit UnitJasper;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniButton, uniMultiItem, uniComboBox,
  uniDateTimePicker, uniGUIBaseClasses, uniLabel, IdHTTP, IdCookieManager,
  System.JSON, System.NetEncoding,
  uniMemo, IPPeerClient, REST.Client, Data.Bind.Components,
  Data.Bind.ObjectScope, IdBaseComponent, IdComponent, IdTCPConnection, idUri,
  IdTCPClient, REST.Authenticator.Basic, uniPanel, uniHTMLFrame,
  UnitReportDisplay, System.IniFiles;

type
  TfrmLapPenjualan = class(TUniForm)
    // function frmLapPenjualan: TfrmLapPenjualan;
  private
    { Private declarations }
    // jasperPort: integer;
  public
    { Public declarations }
  end;

function reportExecutionRequest(file_type: String; report_name: string;
  start_date: string; end_date: string; param1: string; param2: string;
  param3: string): string;
function reportExecutionRequestParam(file_type: String; report_name: string;
  start_date: string; end_date: string; param1: string; param2: string;
  param3: string): string;
function ExecReportParams(file_type: String; report_name: string;
  param1: string; param2: string; param3: string; param4: string;
  param5: string; param6: string): string;
function reportExecReqParams(file_type: String; report_name: string;
  param1: string; param2: string; param3: string; param4: string;
  param5: string; param6: string): string;
function reportExecReqFileParams(file_type: String; report_name: string;
  param1: string; param2: string; param3: string; param4: string;
  param5: string; param6: string; out status: boolean): string;
function reportExecutionRequestFilter(file_type: String; report_name: string;
  start_date: string; end_date: string; filter1: string; filter2: string;
  filter3: string): string;

implementation

uses
  MainModule, uniGUIApplication, ServerModule;

function getJasperPort: integer;
var
  Ini: TIniFile;
begin
  Ini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'OpenLab.ini');
  try
    Result := Ini.ReadInteger('Settings', 'JasperPort', 7000);
  finally
    Ini.Free;
  end;
end;

function postWs(S: TStringList; route: string; file_type: string): string;
var
  HTTP: TIdHTTP;
  FUrl, filename, token, ResponseBody, fullpath: string;
  cookie: TIdCookieManager;
  JSON: TJSONObject;
begin
  try
    HTTP := TIdHTTP.Create;
    token := 'amFzcGVyYWRtaW46UEBzc3cwcmQ=';
    HTTP.Request.Accept := 'application/json';

    HTTP.AllowCookies := True;
    HTTP.HandleRedirects := True;

    cookie := TIdCookieManager.Create(nil);

    HTTP.CookieManager := cookie;

    HTTP.Request.ContentType := 'text/xml';
    HTTP.HTTPOptions := [hoWaitForUnexpectedData, hoTreat302Like303];
    HTTP.Request.CustomHeaders.AddValue('Authorization', 'Basic ' + token);

    OutputDebugString(PChar(IntToStr(getJasperPort)));

    ResponseBody := HTTP.Post('http://localhost:' + IntToStr(getJasperPort) +
      '/' + route + '/', S);

    FUrl := UniServerModule.FilesFolderURL + 'jasper/';

    JSON := TJSONObject.ParseJSONValue(ResponseBody) as TJSONObject;

    filename := (JSON.Get('filename').JsonValue as TJSONString).Value;
    fullpath := (JSON.Get('fullpath').JsonValue as TJSONString).Value;

    if (file_type = 'pdf') or (file_type = 'PDF') then
    begin
      Result := FUrl + filename;
    end
    else
    begin
      Result := fullpath;
    end;

  finally
    S.Free;
  end;
end;

function reportExecutionRequestFilter(file_type: String; report_name: string;
  start_date: string; end_date: string; filter1: string; filter2: string;
  filter3: string): string;
var
  S: TStringList;
begin
  S := TStringList.Create;
  S.Add('{"reportExecutionRequest": {"fileType": "' + file_type +
    '","reportName": "' + report_name + '","startDate": "' + start_date +
    '","endDate": "' + end_date + '","filter1": "' + filter1 + '","filter2": "'
    + filter2 + '","filter3": "' + filter3 + '"}}');

  Result := postWs(S, 'reportExecutions', file_type);
end;

function reportExecutionRequest(file_type: String; report_name: string;
  start_date: string; end_date: string; param1: string; param2: string;
  param3: string): string;
var
  S: TStringList;
begin
  S := TStringList.Create;
  S.Add('{"reportExecutionRequest": {"fileType": "' + file_type +
    '","reportName": "' + report_name + '","startDate": "' + start_date +
    '","endDate": "' + end_date + '","param1": "' + param1 + '","param2": "' +
    param2 + '","param3": "' + param3 + '"}}');

  Result := postWs(S, 'reportExecutions', file_type);
end;

function reportExecutionRequestParam(file_type: String; report_name: string;
  start_date: string; end_date: string; param1: string; param2: string;
  param3: string): string;
var
  S: TStringList;
begin

  S := TStringList.Create;
  S.Add('{"reportExecutionRequest": {"fileType": "' + file_type +
    '","reportName": "' + report_name + '","startDate": "' + start_date +
    '","endDate": "' + end_date + '","param1": "' + param1 + '","param2": "' +
    param2 + '","param3": "' + param3 + '"}}');

  Result := postWs(S, 'reportExecutions', file_type);
end;

function ExecReportParams(file_type: String; report_name: string;
  param1: string; param2: string; param3: string; param4: string;
  param5: string; param6: string): string;
var
  S: TStringList;
begin
  S := TStringList.Create;
  S.Add('{"reportExecReqParams": {"fileType": "' + file_type +
    '","reportName": "' + report_name + '","param1": "' + param1 +
    '","param2": "' + param2 + '","param3": "' + param3 + '","param4": "' +
    param4 + '","param5": "' + param5 + '","param6": "' + param6 + '"}}');

  Result := postWs(S, 'reportExecParams', file_type);

end;

function reportExecReqParams(file_type: String; report_name: string;
  param1: string; param2: string; param3: string; param4: string;
  param5: string; param6: string): string;
var
  S: TStringList;
begin
  S := TStringList.Create;
  S.Add('{"reportExecReqParams": {"fileType": "' + file_type +
    '","reportName": "' + report_name + '","param1": "' + param1 +
    '","param2": "' + param2 + '","param3": "' + param3 + '","param4": "' +
    param4 + '","param5": "' + param5 + '","param6": "' + param6 + '"}}');

  Result := postWs(S, 'reportExecParams', file_type);
end;

function reportExecReqFileParams(file_type: String; report_name: string;
  param1: string; param2: string; param3: string; param4: string;
  param5: string; param6: string; out status: boolean): string;
var
  S: TStringList;
begin
  S := TStringList.Create;
  S.Add('{"reportExecReqParams": {"fileType": "' + file_type +
    '","reportName": "' + report_name + '","param1": "' + param1 +
    '","param2": "' + param2 + '","param3": "' + param3 + '","param4": "' +
    param4 + '","param5": "' + param5 + '","param6": "' + param6 + '"}}');

  Result := postWs(S, 'reportExecParams', file_type);
end;

end.
