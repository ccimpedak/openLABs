object frmPasienBaru: TfrmPasienBaru
  Left = 0
  Top = 0
  ClientHeight = 481
  ClientWidth = 440
  Caption = 'Pasien Baru'
  OnShow = UniFormShow
  BorderStyle = bsDialog
  OldCreateOrder = False
  OnKeyDown = UniFormKeyDown
  MonitoredKeys.Keys = <>
  Font.Height = -16
  OnAfterShow = UniFormAfterShow
  PixelsPerInch = 96
  TextHeight = 19
  object UniLabel1: TUniLabel
    Left = 17
    Top = 23
    Width = 40
    Height = 19
    Hint = ''
    Caption = 'Prefix'
    TabOrder = 0
  end
  object UniLabel2: TUniLabel
    Left = 16
    Top = 48
    Width = 41
    Height = 19
    Hint = ''
    Caption = 'Nama'
    TabOrder = 15
  end
  object edNama: TUniEdit
    Left = 96
    Top = 49
    Width = 233
    Hint = ''
    Text = ''
    TabOrder = 2
    OnKeyPress = edNamaKeyPress
  end
  object UniLabel3: TUniLabel
    Left = 17
    Top = 97
    Width = 40
    Height = 19
    Hint = ''
    Caption = 'Umur'
    TabOrder = 16
  end
  object UniLabel4: TUniLabel
    Left = 105
    Top = 73
    Width = 24
    Height = 19
    Hint = ''
    Caption = 'Th.'
    TabOrder = 17
  end
  object UniLabel5: TUniLabel
    Left = 161
    Top = 72
    Width = 27
    Height = 19
    Hint = ''
    Caption = 'Bln.'
    TabOrder = 18
  end
  object UniLabel6: TUniLabel
    Left = 214
    Top = 72
    Width = 29
    Height = 19
    Hint = ''
    Caption = 'Hari'
    TabOrder = 19
  end
  object UniLabel7: TUniLabel
    Left = 17
    Top = 124
    Width = 63
    Height = 19
    Hint = ''
    Caption = 'Tgl Lahir'
    TabOrder = 20
  end
  object UniLabel8: TUniLabel
    Left = 17
    Top = 159
    Width = 56
    Height = 19
    Hint = ''
    Caption = 'Kelamin'
    TabOrder = 21
  end
  object UniLabel9: TUniLabel
    Left = 17
    Top = 192
    Width = 58
    Height = 19
    Hint = ''
    Caption = 'No. KTP'
    TabOrder = 22
  end
  object UniLabel10: TUniLabel
    Left = 17
    Top = 219
    Width = 50
    Height = 19
    Hint = ''
    Caption = 'Alamat'
    TabOrder = 23
  end
  object memoAlamat: TUniMemo
    Left = 96
    Top = 219
    Width = 281
    Height = 89
    Hint = ''
    TabOrder = 8
  end
  object UniLabel11: TUniLabel
    Left = 17
    Top = 315
    Width = 57
    Height = 19
    Hint = ''
    Caption = 'Telepon'
    TabOrder = 24
  end
  object edTelepon: TUniEdit
    Left = 96
    Top = 314
    Width = 185
    Hint = ''
    Text = ''
    TabOrder = 9
    OnKeyPress = edTeleponKeyPress
  end
  object edHp: TUniEdit
    Left = 96
    Top = 342
    Width = 185
    Hint = ''
    Text = ''
    TabOrder = 10
    OnKeyPress = edHpKeyPress
  end
  object UniLabel12: TUniLabel
    Left = 17
    Top = 342
    Width = 20
    Height = 19
    Hint = ''
    Caption = 'Hp'
    TabOrder = 25
  end
  object edEmail: TUniEdit
    Left = 96
    Top = 370
    Width = 185
    Hint = ''
    Text = ''
    TabOrder = 11
    OnKeyPress = edEmailKeyPress
  end
  object UniLabel13: TUniLabel
    Left = 17
    Top = 372
    Width = 44
    Height = 19
    Hint = ''
    Caption = 'e-mail'
    TabOrder = 26
  end
  object UniLabel14: TUniLabel
    Left = 17
    Top = 398
    Width = 71
    Height = 19
    Hint = ''
    Caption = 'Gol Darah'
    TabOrder = 27
  end
  object edGoldar: TUniEdit
    Left = 143
    Top = 398
    Width = 83
    Hint = ''
    CharCase = ecUpperCase
    Text = ''
    TabOrder = 12
    OnKeyPress = edGoldarKeyPress
  end
  object edRhesus: TUniEdit
    Left = 232
    Top = 398
    Width = 49
    Hint = ''
    Text = ''
    TabOrder = 13
    OnKeyPress = edRhesusKeyPress
  end
  object btnSave: TUniButton
    Left = 232
    Top = 427
    Width = 90
    Height = 41
    Hint = ''
    Caption = 'Save'
    TabOrder = 14
    Default = True
    OnClick = btnSaveClick
  end
  object UniButton2: TUniButton
    Left = 328
    Top = 427
    Width = 97
    Height = 41
    Hint = ''
    Caption = 'Cancel'
    TabOrder = 28
    OnClick = UniButton2Click
  end
  object cbPrefix: TUniDBLookupComboBox
    Left = 96
    Top = 16
    Width = 159
    Height = 27
    Hint = ''
    ListSource = DSPrefik
    KeyField = 'nama'
    ListFieldIndex = 0
    DataField = 'nama'
    TabOrder = 1
    Color = clWindow
    ForceSelection = True
    OnChange = cbPrefixChange
  end
  object edThn: TUniSpinEdit
    Left = 96
    Top = 90
    Width = 49
    Height = 29
    Hint = ''
    TabOrder = 3
    OnChange = edThnChange
    OnKeyPress = edThnKeyPress
  end
  object edBln: TUniSpinEdit
    Left = 151
    Top = 90
    Width = 49
    Height = 29
    Hint = ''
    TabOrder = 4
    OnChange = edBlnChange
    OnKeyPress = edBlnKeyPress
  end
  object edHr: TUniSpinEdit
    Left = 206
    Top = 90
    Width = 49
    Height = 29
    Hint = ''
    TabOrder = 5
    OnChange = edHrChange
  end
  object edTglLahir: TUniDateTimePicker
    Left = 96
    Top = 125
    Width = 159
    Hint = ''
    DateTime = 43598.000000000000000000
    TabOrder = 6
    UseSystemFormats = True
    OnChange = edTglLahirChange
    OnKeyPress = edTglLahirKeyPress
  end
  object edNoKTP: TUniEdit
    Left = 96
    Top = 191
    Width = 281
    Hint = ''
    CharCase = ecUpperCase
    Text = ''
    TabOrder = 7
  end
  object cbKelamin: TUniDBLookupComboBox
    Left = 96
    Top = 153
    Width = 159
    Height = 27
    Hint = ''
    ListSource = DSKelamin
    KeyField = 'nama'
    ListFieldIndex = 0
    DataField = 'nama'
    TabOrder = 29
    Color = clWindow
    ForceSelection = True
  end
  object QPrefik: TFDQuery
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id,nama'
      'from'
      'prefix'
      'order by id')
    Left = 280
    Top = 16
  end
  object DSPrefik: TDataSource
    DataSet = QPrefik
    Left = 320
    Top = 16
  end
  object QKelamin: TFDQuery
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id,nama'
      'from'
      'jenis_kelamin')
    Left = 264
    Top = 144
  end
  object DSKelamin: TDataSource
    DataSet = QKelamin
    Left = 304
    Top = 144
  end
  object cmdSave: TFDCommand
    Connection = UniMainModule.FDConnection1
    Left = 104
    Top = 424
  end
  object QSave: TFDQuery
    Connection = UniMainModule.FDConnection1
    Left = 48
    Top = 424
  end
end
