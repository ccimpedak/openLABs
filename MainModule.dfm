object UniMainModule: TUniMainModule
  OldCreateOrder = False
  OnCreate = UniGUIMainModuleCreate
  DocumentKeyOptions = [dkDisableBackSpace]
  BrowserOptions = [boDisableMouseRightClick, boDisableChromeRefresh]
  MonitoredKeys.Keys = <>
  EnableSynchronousOperations = True
  Height = 356
  Width = 495
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=openlab'
      'User_Name=lisUsr'
      'Password=khsgs102938'
      'Server=localhost'
      'DriverID=MySQL')
    LoginPrompt = False
    Left = 72
    Top = 48
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    ScreenCursor = gcrNone
    Left = 144
    Top = 72
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    VendorLib = 'D:\libmysql.dll'
    Left = 56
    Top = 136
  end
  object FDConn: TFDConnection
    Params.Strings = (
      'Database=127.0.0.1/LIS'
      'User_Name=datos_prj'
      'Password=prj_bmg'
      'DriverID=Ora')
    LoginPrompt = False
    Left = 320
    Top = 96
  end
  object FDPhysOracleDriverLink1: TFDPhysOracleDriverLink
    VendorHome = 'Ora11204'
    Left = 376
    Top = 104
  end
end
