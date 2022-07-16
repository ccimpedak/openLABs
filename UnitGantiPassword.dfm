object frmGantiPassword: TfrmGantiPassword
  Left = 0
  Top = 0
  ClientHeight = 216
  ClientWidth = 323
  Caption = 'Ganti password'
  BorderStyle = bsDialog
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  Font.Height = -16
  OnAfterShow = UniFormAfterShow
  PixelsPerInch = 96
  TextHeight = 19
  object UniLabel1: TUniLabel
    Left = 24
    Top = 16
    Width = 32
    Height = 19
    Hint = ''
    Caption = 'User'
    TabOrder = 0
  end
  object UniLabel2: TUniLabel
    Left = 24
    Top = 56
    Width = 67
    Height = 19
    Hint = ''
    Caption = 'Password'
    TabOrder = 4
  end
  object UniLabel3: TUniLabel
    Left = 53
    Top = 81
    Width = 38
    Height = 19
    Hint = ''
    Caption = 'Lama'
    TabOrder = 5
  end
  object UniLabel4: TUniLabel
    Left = 53
    Top = 106
    Width = 32
    Height = 19
    Hint = ''
    Caption = 'Baru'
    TabOrder = 6
  end
  object UniLabel5: TUniLabel
    Left = 53
    Top = 131
    Width = 75
    Height = 19
    Hint = ''
    Caption = 'Konfirmasi'
    TabOrder = 7
  end
  object edUser: TUniEdit
    Left = 136
    Top = 16
    Width = 121
    Hint = ''
    Text = ''
    TabOrder = 8
    TabStop = False
    Color = clInactiveCaptionText
    ReadOnly = True
  end
  object edPassLama: TUniEdit
    Left = 136
    Top = 78
    Width = 121
    Hint = ''
    PasswordChar = '*'
    Text = ''
    TabOrder = 1
  end
  object edPassBaru: TUniEdit
    Left = 136
    Top = 106
    Width = 121
    Hint = ''
    PasswordChar = '*'
    Text = ''
    TabOrder = 2
  end
  object edPassKonfirm: TUniEdit
    Left = 136
    Top = 134
    Width = 121
    Hint = ''
    PasswordChar = '*'
    Text = ''
    TabOrder = 3
  end
  object UniButton1: TUniButton
    Left = 127
    Top = 176
    Width = 82
    Height = 32
    Hint = ''
    Caption = 'Ganti'
    TabOrder = 9
    Default = True
    OnClick = UniButton1Click
  end
  object UniButton2: TUniButton
    Left = 208
    Top = 176
    Width = 81
    Height = 32
    Hint = ''
    Caption = 'Batal'
    TabOrder = 10
    OnClick = UniButton2Click
  end
  object updQuery: TFDQuery
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      
        'update aguser set password= password(:pass_baru) where password=' +
        'password(:pass_lama) and id = :user_id')
    Left = 16
    Top = 128
    ParamData = <
      item
        Name = 'PASS_BARU'
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'PASS_LAMA'
        ParamType = ptInput
      end
      item
        Name = 'USER_ID'
        ParamType = ptInput
      end>
  end
end
