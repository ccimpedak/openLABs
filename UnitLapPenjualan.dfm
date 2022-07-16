object frmLapPenjualan: TfrmLapPenjualan
  Left = 0
  Top = 0
  ClientHeight = 198
  ClientWidth = 428
  Caption = 'Laporan Penjualan'
  BorderStyle = bsDialog
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  Font.Height = -16
  OnBeforeShow = UniFormBeforeShow
  PixelsPerInch = 96
  TextHeight = 19
  object UniLabel1: TUniLabel
    Left = 32
    Top = 32
    Width = 57
    Height = 19
    Hint = ''
    Caption = 'Tanggal'
    TabOrder = 0
  end
  object dtStart: TUniDateTimePicker
    Left = 95
    Top = 32
    Width = 120
    Hint = ''
    DateTime = 43649.000000000000000000
    DateFormat = 'dd/MM/yyyy'
    TimeFormat = 'HH:mm:ss'
    TabOrder = 1
  end
  object UniLabel2: TUniLabel
    Left = 221
    Top = 32
    Width = 22
    Height = 19
    Hint = ''
    Caption = 's/d'
    TabOrder = 2
  end
  object dtEnd: TUniDateTimePicker
    Left = 249
    Top = 32
    Width = 120
    Hint = ''
    DateTime = 43649.000000000000000000
    DateFormat = 'dd/MM/yyyy'
    TimeFormat = 'HH:mm:ss'
    TabOrder = 3
  end
  object UniLabel3: TUniLabel
    Left = 32
    Top = 72
    Width = 57
    Height = 19
    Hint = ''
    Caption = 'Laporan'
    TabOrder = 4
  end
  object cbTipeLap: TUniComboBox
    Left = 95
    Top = 72
    Width = 274
    Height = 27
    Hint = ''
    Text = 'cbTipeLap'
    Items.Strings = (
      'Kelompok Test'
      'Test'
      'Marketing'
      'Tipe Pasien'
      'Gender'
      'Kelompok Umur'
      'Wilayah Pasien'
      'Tipe Pasien 2'
      'Dokter Spesialis')
    ItemIndex = 0
    TabOrder = 5
    ForceSelection = False
  end
  object expXLSX: TUniButton
    Left = 32
    Top = 128
    Width = 129
    Height = 41
    Hint = ''
    Caption = 'Export XLSX'
    TabOrder = 6
    OnClick = expXLSXClick
  end
  object UniButton2: TUniButton
    Left = 167
    Top = 128
    Width = 98
    Height = 41
    Hint = ''
    Caption = 'View'
    TabOrder = 7
    OnClick = UniButton2Click
  end
  object UniButton3: TUniButton
    Left = 271
    Top = 128
    Width = 106
    Height = 41
    Hint = ''
    Caption = 'Batal'
    TabOrder = 8
    OnClick = UniButton3Click
  end
  object RESTClient1: TRESTClient
    Authenticator = HTTPBasicAuthenticator1
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'UTF-8, *;q=0.8'
    AcceptEncoding = 'identity'
    BaseURL = 'http://localhost:8080/jasperserver/rest_v2/reportExecutions'
    ContentType = 'application/x-www-form-urlencoded'
    Params = <>
    HandleRedirects = True
    Left = 248
    Top = 112
  end
  object RESTRequest1: TRESTRequest
    Client = RESTClient1
    Method = rmPOST
    Params = <
      item
        Kind = pkHTTPHEADER
        name = 'Authorization'
        Value = 'Basic amFzcGVyYWRtaW46UEBzc3cwcmQ='
      end>
    Response = RESTResponse1
    SynchronizedEvents = False
    Left = 336
    Top = 112
  end
  object RESTResponse1: TRESTResponse
    ContentType = 'text/html'
    Left = 392
    Top = 80
  end
  object HTTPBasicAuthenticator1: THTTPBasicAuthenticator
    Username = 'P@ssw0rd'
    Password = 'jasperadmin'
    Left = 120
    Top = 96
  end
  object HTTPx: TIdHTTP
    AllowCookies = True
    HandleRedirects = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = -1
    Request.ContentRangeStart = -1
    Request.ContentRangeInstanceLength = -1
    Request.Accept = 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    Request.Ranges.Units = 'bytes'
    Request.Ranges = <>
    HTTPOptions = [hoForceEncodeParams, hoWaitForUnexpectedData, hoTreat302Like303]
    Left = 192
    Top = 96
  end
  object IdCookieManager1: TIdCookieManager
    Left = 392
    Top = 24
  end
end
