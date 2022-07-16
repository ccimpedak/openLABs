object UniAdmTests: TUniAdmTests
  Left = 0
  Top = 0
  Width = 715
  Height = 554
  Font.Height = -13
  Font.Name = 'Roboto'
  TabOrder = 0
  ParentFont = False
  object UniButton1: TUniButton
    Left = 152
    Top = 16
    Width = 89
    Height = 33
    Hint = ''
    Caption = 'Master Test'
    TabOrder = 0
    OnClick = UniButton1Click
  end
  object UniButton2: TUniButton
    Left = 3
    Top = 16
    Width = 134
    Height = 33
    Hint = ''
    Caption = 'Master Specimen'
    TabOrder = 1
    OnClick = UniButton2Click
  end
  object UniButton3: TUniButton
    Left = 256
    Top = 16
    Width = 97
    Height = 33
    Hint = ''
    Caption = 'Master Tube'
    TabOrder = 2
    OnClick = UniButton3Click
  end
end
