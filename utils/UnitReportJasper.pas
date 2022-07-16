unit UnitReportJasper;

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
  UnitReportDisplay, MainModule, uniGUIApplication, ServerModule,
  System.IniFiles;

function reportExecReqFileParams(file_type: String; report_name: string;
  param1: string; param2: string; param3: string; out status: boolean): string;
function reportExecReqParams(file_type: String; report_name: string;
  param1: string; param2: string; param3: string): string;
function reportExecReqParamsDownload(file_type: String; report_name: string;
  param1: string; param2: string; param3: string): string;

implementation

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

function postData(file_type: string; Data: string): string;
var
  S: TStringList;
  HTTP: TIdHTTP;
  FUrl, filename, token, ResponseBody, fullpath: string;
  cookie: TIdCookieManager;
  JSON: TJSONObject;
begin
  try
    HTTP := TIdHTTP.Create;
    S := TStringList.Create;
    S.Add(Data);

    UniSession.Synchronize();
    token := 'amFzcGVyYWRtaW46UEBzc3cwcmQ=';
    HTTP.Request.Accept := 'application/json';

    HTTP.AllowCookies := True;
    HTTP.HandleRedirects := True;

    cookie := TIdCookieManager.Create(nil);

    HTTP.CookieManager := cookie;

    HTTP.Request.ContentType := 'text/xml';
    HTTP.HTTPOptions := [hoWaitForUnexpectedData, hoTreat302Like303];
    HTTP.Request.CustomHeaders.AddValue('Authorization', 'Basic ' + token);

    ResponseBody := HTTP.Post('http://localhost:' + IntToStr(getJasperPort) +
      '/reportExecParams/', S);

    FUrl := UniServerModule.FilesFolderURL + 'jasper/';

    JSON := TJSONObject.ParseJSONValue(ResponseBody) as TJSONObject;

    filename := (JSON.Get('filename').JsonValue as TJSONString).Value;
    fullpath := (JSON.Get('fullpath').JsonValue as TJSONString).Value;

    if (file_type = 'pdf') or (file_type = 'PDF') or (file_type = 'html') then
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

function postDataParam(file_type: string; Data: string;
  bDownload: boolean = false): string;
var
  S: TStringList;
  HTTP: TIdHTTP;
  FUrl, filename, token, ResponseBody, fullpath: string;
  cookie: TIdCookieManager;
  JSON: TJSONObject;
begin
  try
    HTTP := TIdHTTP.Create;
    S := TStringList.Create;
    S.Add(Data);

    UniSession.Synchronize();
    token := 'amFzcGVyYWRtaW46UEBzc3cwcmQ=';
    HTTP.Request.Accept := 'application/json';

    HTTP.AllowCookies := True;
    HTTP.HandleRedirects := True;

    cookie := TIdCookieManager.Create(nil);

    HTTP.CookieManager := cookie;

    HTTP.Request.ContentType := 'text/xml';
    HTTP.HTTPOptions := [hoWaitForUnexpectedData, hoTreat302Like303];
    HTTP.Request.CustomHeaders.AddValue('Authorization', 'Basic ' + token);

    ResponseBody := HTTP.Post('http://localhost:' + IntToStr(getJasperPort) +
      '/reportExecParams/', S);

    FUrl := UniServerModule.FilesFolderURL + 'jasper/';

    JSON := TJSONObject.ParseJSONValue(ResponseBody) as TJSONObject;

    filename := (JSON.Get('filename').JsonValue as TJSONString).Value;
    fullpath := (JSON.Get('fullpath').JsonValue as TJSONString).Value;

    // if (file_type = 'pdf') or (file_type = 'PDF') or (file_type = 'html') then
    // begin
    // Result := FUrl + filename;
    // end
    // else
    // begin
    // Result := fullpath;
    // end;

    if bDownload then
      Result := fullpath
    else
      Result := FUrl + filename;
  finally
    S.Free;
  end;
end;

function reportExecReqParams(file_type: String; report_name: string;
  param1: string; param2: string; param3: string): string;
begin
  Result := postData(file_type, '{"reportExecReqParams": {"fileType": "' +
    file_type + '","reportName": "' + report_name + '","param1": "' + param1 +
    '","param2": "' + param2 + '","param3": "' + param3 + '"}}');
end;

function reportExecReqParamsDownload(file_type: String; report_name: string;
  param1: string; param2: string; param3: string): string;
begin
  Result := postDataParam(file_type, '{"reportExecReqParams": {"fileType": "' +
    file_type + '","reportName": "' + report_name + '","param1": "' + param1 +
    '","param2": "' + param2 + '","param3": "' + param3 + '"}}', True);
end;

function reportExecReqFileParams(file_type: String; report_name: string;
  param1: string; param2: string; param3: string; out status: boolean): string;
var
  S: TStringList;
  HTTP: TIdHTTP;
  FUrl, filename, token, ResponseBody, fullpath, b_ok: string;
  cookie: TIdCookieManager;
  JSON: TJSONObject;
begin
  status := false;
  HTTP := TIdHTTP.Create;
  S := TStringList.Create;
  S.Add('{"reportExecReqParams": {"fileType": "' + file_type +
    '","reportName": "' + report_name + '","param1": "' + param1 +
    '","param2": "' + param2 + '","param3": "' + param3 + '"}}');
  try
    UniSession.Synchronize();
    token := 'amFzcGVyYWRtaW46UEBzc3cwcmQ=';
    HTTP.Request.Accept := 'application/json';
    HTTP.AllowCookies := True;
    HTTP.HandleRedirects := True;
    cookie := TIdCookieManager.Create(nil);
    HTTP.CookieManager := cookie;
    HTTP.Request.ContentType := 'text/xml';
    HTTP.HTTPOptions := [hoWaitForUnexpectedData, hoTreat302Like303];
    HTTP.Request.CustomHeaders.AddValue('Authorization', 'Basic ' + token);
    ResponseBody := HTTP.Post('http://localhost:' + IntToStr(getJasperPort) +
      '/reportExecParams/', S);
    FUrl := UniServerModule.FilesFolderURL + 'jasper/';
    JSON := TJSONObject.ParseJSONValue(ResponseBody) as TJSONObject;
    b_ok := (JSON.Get('status').JsonValue as TJSONString).Value;
    if b_ok = 'true' then
    begin
      filename := (JSON.Get('filename').JsonValue as TJSONString).Value;
      fullpath := (JSON.Get('fullpath').JsonValue as TJSONString).Value;
      Result := fullpath;
      status := True;
    end
    else
    begin
      status := false;
      Result := (JSON.Get('content').JsonValue as TJSONString).Value;
    end;
  finally
    S.Free;
  end;

end;

end.
