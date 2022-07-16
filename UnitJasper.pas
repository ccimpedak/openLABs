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
  UnitReportDisplay;

type
  TfrmLapPenjualan = class(TUniForm)
    // function frmLapPenjualan: TfrmLapPenjualan;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function DoSomething: string;
function reportExecutionRequest(file_type: String; report_name: string;
  start_date: string; end_date: string): string;

implementation

uses
  MainModule, uniGUIApplication, ServerModule;

function reportExecutionRequest(file_type: String; report_name: string;
  start_date: string; end_date: string): string;
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

    ResponseBody := HTTP.Post('http://localhost:7000/reportExecutions/', S);

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

function DoSomething: string;
begin
  Result := 'Something done';
end;

end.
