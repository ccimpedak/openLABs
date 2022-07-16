object frmLogin: TfrmLogin
  Left = 0
  Top = 0
  ClientHeight = 174
  ClientWidth = 384
  Caption = 'Login'
  BorderStyle = bsDialog
  Position = poDesktopCenter
  OldCreateOrder = False
  BorderIcons = [biSystemMenu, biMinimize]
  MonitoredKeys.Keys = <>
  Font.Height = -16
  OnAfterShow = UniFormAfterShow
  PixelsPerInch = 96
  TextHeight = 19
  object UniLabel1: TUniLabel
    Left = 40
    Top = 40
    Width = 71
    Height = 19
    Hint = ''
    Caption = 'Username'
    TabOrder = 0
  end
  object UniLabel2: TUniLabel
    Left = 41
    Top = 80
    Width = 67
    Height = 19
    Hint = ''
    Caption = 'Password'
    TabOrder = 4
  end
  object edUser: TUniEdit
    Left = 128
    Top = 40
    Width = 193
    Hint = ''
    Text = ''
    TabOrder = 1
  end
  object edPass: TUniEdit
    Left = 128
    Top = 80
    Width = 193
    Hint = ''
    PasswordChar = '*'
    Text = ''
    TabOrder = 2
    OnKeyPress = edPassKeyPress
  end
  object btnLogin: TUniButton
    Left = 271
    Top = 129
    Width = 105
    Height = 33
    Hint = ''
    Caption = 'Login'
    TabOrder = 3
    Default = True
    OnClick = btnLoginClick
  end
  object lblAlert: TUniLabel
    Left = 41
    Top = 104
    Width = 290
    Height = 19
    Hint = ''
    Visible = False
    Caption = 'username dan/atau password tidak valid.'
    ParentFont = False
    Font.Color = clRed
    Font.Height = -16
    Font.Style = [fsItalic]
    TabOrder = 5
  end
  object QLogin: TFDQuery
    Connection = UniMainModule.FDConnection1
    Left = 344
    Top = 64
  end
  object QParameters: TFDQuery
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select value_char,value_num from parameters where name = :name')
    Left = 344
    Top = 16
    ParamData = <
      item
        Name = 'NAME'
        DataType = ftString
        ParamType = ptInput
        Value = '-'
      end>
  end
end
