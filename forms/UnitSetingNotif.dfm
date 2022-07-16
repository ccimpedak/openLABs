object frmSetingNotif: TfrmSetingNotif
  Left = 0
  Top = 0
  ClientHeight = 93
  ClientWidth = 323
  Caption = 'Setting Notifikasi'
  BorderStyle = bsDialog
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  Font.Height = -13
  Font.Name = 'Roboto'
  OnBeforeShow = UniFormBeforeShow
  PixelsPerInch = 96
  TextHeight = 15
  object UniLabel1: TUniLabel
    Left = 24
    Top = 24
    Width = 102
    Height = 15
    Hint = ''
    Caption = 'Timeout notifikasi'
    TabOrder = 0
  end
  object edTimeout: TUniNumberEdit
    Left = 144
    Top = 17
    Width = 81
    Hint = ''
    Alignment = taCenter
    TabOrder = 1
    DecimalSeparator = '.'
  end
  object UniLabel2: TUniLabel
    Left = 239
    Top = 24
    Width = 28
    Height = 15
    Hint = ''
    Caption = 'detik'
    TabOrder = 2
  end
  object UniButton1: TUniButton
    Left = 231
    Top = 56
    Width = 75
    Height = 25
    Hint = ''
    Caption = 'Simpan'
    TabOrder = 3
    OnClick = UniButton1Click
  end
  object cmdUpdate: TFDCommand
    Connection = UniMainModule.FDConnection1
    CommandText.Strings = (
      
        'DELETE from user_parameters WHERE user_id = :user_id AND name = ' +
        #39'NOTIFIKASI_TIMOUT'#39';'
      
        'INSERT INTO user_parameters(user_id,name,value) VALUES (:user_id' +
        ','#39'NOTIFIKASI_TIMOUT'#39',:value);')
    ParamData = <
      item
        Name = 'USER_ID'
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'VALUE'
        ParamType = ptInput
      end>
    Left = 80
    Top = 48
  end
  object QTimeout: TFDQuery
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      
        'SELECT value FROM user_parameters WHERE name = '#39'NOTIFIKASI_TIMOU' +
        'T'#39' and user_id = :user_id;')
    Left = 168
    Top = 48
    ParamData = <
      item
        Name = 'USER_ID'
        ParamType = ptInput
        Value = Null
      end>
  end
end
