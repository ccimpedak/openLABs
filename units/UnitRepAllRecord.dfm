object UniRepAllRecord: TUniRepAllRecord
  Left = 0
  Top = 0
  Width = 648
  Height = 444
  OnCreate = UniFrameCreate
  OnReady = UniFrameReady
  Font.Height = -13
  Font.Name = 'Roboto'
  TabOrder = 0
  ParentFont = False
  object UniLabel1: TUniLabel
    Left = 32
    Top = 32
    Width = 45
    Height = 15
    Hint = ''
    Caption = 'Tanggal'
    TabOrder = 0
  end
  object UniLabel2: TUniLabel
    Left = 221
    Top = 32
    Width = 19
    Height = 15
    Hint = ''
    Caption = 's/d'
    TabOrder = 1
  end
  object dtDari: TUniDateTimePicker
    Left = 112
    Top = 29
    Width = 103
    Hint = ''
    DateTime = 44233.000000000000000000
    DateFormat = 'dd/MM/yyyy'
    TimeFormat = 'HH:mm:ss'
    TabOrder = 2
  end
  object dtSampai: TUniDateTimePicker
    Left = 246
    Top = 29
    Width = 103
    Hint = ''
    DateTime = 44233.000000000000000000
    DateFormat = 'dd/MM/yyyy'
    TimeFormat = 'HH:mm:ss'
    TabOrder = 3
  end
  object UniSpeedButton2: TUniSpeedButton
    Left = 56
    Top = 79
    Width = 99
    Height = 26
    Hint = ''
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC5600DC96511FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC45D0BDD
      963BEDBD65C76312FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFC45D0DDE922CF5D675F6BF29D27C16C96817FFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC25809E3931FFCDC6EF2
      B62BE68A00EF9B00CE720CC96818FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFC15707E59F2EFEE68CF2BD38EFA71BEDA418E68F02ED9E02D0730AC968
      19FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC15605E5A540FFF3B1F7D474F5BD36F3
      B534EFA921EC9C0EE48C00F0A90ED47608C9681AFFFFFFFFFFFFFFFFFFC15505
      E5A63FFFFCCCFDE9A2F8C947F6C951F4BD3CF1B02CEEA41AE99505E18B00F0AD
      15D57708C05500FFFFFFC15708E4A541FFFEC8FFFBC8FDDE67FBD463F7CD55F5
      C547F3B635EFA824ED9F12E99300E69101F4BA23D47A0BC05500DA8A26F8BE33
      F3B83BECA01AE7A33BFFF7C7FAD261F7C84EF5BF40F2B32FF3AB1CCA6709BE51
      00BE5100BF5400C05500FFFFFFFFFFFFFFFFFFFFFFFFE8A037FFFDD9FBD769F8
      CB55F6C749F4BD39F5B427C5610BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFEAA83DFFFCD8FBDC71F9D260F7C952F6C443F8BC33C5600AFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEBA83CFFFEDDFDE07AFB
      D769F9CF5CF7CA4DFCC63EC56009FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFECAA3DFFFFE0FEE380FCDC72F9D365F8CD56FDCD47C55F08FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDAB3EFFFFE3FEE789FD
      E17AFBDA6FFAD063FFD555C45E07FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFEEB144FFFFFAFFF49DFFF08EFFEB83FFE676FFE767C45E06FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEA42AF1BC5AEDAC38E9
      A231E3982EDE9128DC8C25CA6713FFFFFFFFFFFFFFFFFFFFFFFF}
    Caption = 'Export'
    ParentColor = False
    Color = clWindow
    TabOrder = 4
    OnClick = UniSpeedButton2Click
  end
  object UniSpeedButton1: TUniSpeedButton
    Left = 221
    Top = 79
    Width = 92
    Height = 26
    Hint = ''
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
      916D37A8895BB78D56AC8A56B69756AC8D57B58765AB875AA68A5BA79068A78B
      629C7A4B987545FFFFFFFFFFFFFFFFFFAB8E62FEFFFFFEFFFFFEFFFFFEFFFFFE
      FFFFFEFFFFEFF2E8EBE4DEEBE4DEEBE4DEEBE4DEA48659FFFFFFFFFFFFFFFFFF
      B4956AF5FCFF0097EEFFF7F00C00EECFD6E409E604EFF2E8F8D5C2DA9A42E19F
      41EBE8E0A58452FFFFFFFFFFFFFFFFFFBB9F76F4FBFF009CF0FFF7F05F59FFCF
      D6E402DF11EFF2E8FCDCC6EBE4DEEBE4DEEBE4DEA58452FFFFFFFFFFFFFFFFFF
      BEA47AF4FBFF009AF0FFF7F0FFFFEFEEF5E300D911EFF2E8FFDCCBDE9E41E19F
      41EAE6DFA58452FFFFFFFFFFFFFFFFFFBDA37AF4FBFF079FF0FFF7F0FFF7F0EA
      F1E300DC11EFF2E8FFDECEEBE4DEEBE4DEEAE6DEA58451FFFFFFFFFFFFFFFFFF
      BBA37AFEFFFFEBF0F0F1F0EDF7F2EEEAF0E300DB0EEFF2E8FFE2CFE19F41E19F
      41EBE7E1A58453FFFFFFFFFFFFFFFFFFBAA37FFFFFFFFBF6EFF6F2EDF9F3F1EF
      F2E808E11CEFF2E8FFE2D3DD9C41E19F41EBE4DEA68553FFFFFFFFFFFFFFFFFF
      BCAA8CFFFFFEFEFFFFFBFFFFFCFFFFFCFFFFF2FFFFF9FFFFF9FFFFEBE8E0EBE8
      E0EBE8E0A68553FFFFFFFFFFFFFFFFFFC5B397FDFAF5E6AC54E3A546E2A54AE3
      A54BE6A54DDEA148D9A04CD3994CD3994CD3C8B3A58553FFFFFFFFFFFFFFFFFF
      CCBB9FFCF9F4FCFFFFFCFFFFFCFFFFF9FDFBF5F6F7E4E0D9D0C2ADBFAB8BBFAB
      8BB69B71A48452FFFFFFFFFFFFFFFFFFCEBDA3FDFCFCFCFFFFFCFFFFFCFFFFF9
      FDFBF5F6F7E4E0D9D0C2ADEAE6E4DFD6C7B69B71A98857FFFFFFFFFFFFFFFFFF
      CFBDA6FDFCFBFBFDFEFCFCFCF6F6F1EEE8E1EDE2D9D3C1AACFBDA0FFFFFFCDB9
      9DBAA078F2EDE6FFFFFFFFFFFFFFFFFFD0C0A7FDFCFCFCFEFFFBF7F3F3EBE5E6
      DFD6E2D4C4CDB798BEAC8AD1C1A9B69B6EF9F7F3FFFFFFFFFFFFFFFFFFFFFFFF
      D1C3ABFDFCFBFEFEFEF6F2EFEDE4DADED5C4D6C4ADC0A984A38652BAA078FCFB
      F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCBBB9FD1C2A9D1C0A7CDBCA2CBBA9EC7
      B291C3AB86AD9364AF9367F9F7F3FFFFFFFFFFFFFFFFFFFFFFFF}
    Caption = 'View'
    ParentColor = False
    Color = clWindow
    TabOrder = 5
    OnClick = UniSpeedButton1Click
  end
end
