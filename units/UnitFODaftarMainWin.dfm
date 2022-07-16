object UniFODaftarMainWin: TUniFODaftarMainWin
  Left = 0
  Top = 0
  Width = 1164
  Height = 810
  Font.Height = -13
  Font.Name = 'Roboto'
  TabOrder = 0
  ParentFont = False
  object UniButton1: TUniButton
    Left = 24
    Top = 16
    Width = 75
    Height = 25
    Hint = ''
    Caption = 'Daftar'
    TabOrder = 0
    OnClick = UniButton1Click
  end
  object UniButton2: TUniButton
    Left = 128
    Top = 16
    Width = 89
    Height = 25
    Hint = ''
    Caption = 'Status'
    TabOrder = 1
    OnClick = UniButton2Click
  end
  object UniButton3: TUniButton
    Left = 240
    Top = 16
    Width = 129
    Height = 25
    Hint = ''
    Caption = 'Laporan Harian'
    TabOrder = 2
    OnClick = UniButton3Click
  end
end
