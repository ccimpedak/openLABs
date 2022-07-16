object UniTimerTimer: TUniTimerTimer
  Left = 0
  Top = 0
  Width = 561
  Height = 435
  TabOrder = 0
  ParentRTL = False
  DesignSize = (
    561
    435)
  object UniContainerPanel1: TUniContainerPanel
    Left = 0
    Top = 0
    Width = 558
    Height = 432
    Hint = ''
    ParentColor = False
    Anchors = []
    TabOrder = 0
    DesignSize = (
      558
      432)
    object UniPanel1: TUniPanel
      Left = 58
      Top = 82
      Width = 418
      Height = 267
      Hint = ''
      Anchors = []
      TabOrder = 0
      BorderStyle = ubsFrameLowered
      Caption = ''
      Color = clWhite
      DesignSize = (
        418
        267)
      object UniLabel1: TUniLabel
        Left = 200
        Top = 109
        Width = 18
        Height = 35
        Hint = ''
        Caption = '0'
        Anchors = []
        ParentFont = False
        Font.Charset = TURKISH_CHARSET
        Font.Color = clNavy
        Font.Height = -29
        Font.Name = 'Verdana'
        ParentColor = False
        Color = clBtnFace
        TabOrder = 1
      end
    end
  end
  object UniTimer1: TUniTimer
    ClientEvent.Strings = (
      'function(sender)'
      '{'
      ' '
      '}')
    OnTimer = UniTimer1Timer
    Left = 40
    Top = 48
  end
end
