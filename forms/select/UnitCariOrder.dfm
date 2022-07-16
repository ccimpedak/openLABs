object frmCariOrder: TfrmCariOrder
  Left = 0
  Top = 0
  ClientHeight = 271
  ClientWidth = 381
  Caption = 'Pilihan'
  BorderStyle = bsDialog
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  Font.Height = -13
  Font.Name = 'Roboto'
  OnBeforeShow = UniFormBeforeShow
  OnAfterShow = UniFormAfterShow
  PixelsPerInch = 96
  TextHeight = 15
  object UniLabel1: TUniLabel
    Left = 8
    Top = 15
    Width = 41
    Height = 15
    Hint = ''
    Caption = 'No. MR'
    TabOrder = 0
  end
  object edNoMR: TUniEdit
    Left = 60
    Top = 10
    Width = 116
    Hint = ''
    Text = ''
    TabOrder = 1
  end
  object UniLabel2: TUniLabel
    Left = 192
    Top = 15
    Width = 34
    Height = 15
    Hint = ''
    Caption = 'Nama'
    TabOrder = 11
  end
  object edName: TUniEdit
    Left = 231
    Top = 10
    Width = 138
    Hint = ''
    Text = ''
    TabOrder = 2
  end
  object UniLabel3: TUniLabel
    Left = 8
    Top = 48
    Width = 44
    Height = 15
    Hint = ''
    Caption = 'Tgl. dari'
    TabOrder = 12
  end
  object dtTgl0: TUniDateTimePicker
    Left = 60
    Top = 44
    Width = 106
    Hint = ''
    DateTime = 44462.000000000000000000
    DateFormat = 'dd/MM/yyyy'
    TimeFormat = 'HH:mm:ss'
    TabOrder = 3
  end
  object UniLabel4: TUniLabel
    Left = 170
    Top = 48
    Width = 19
    Height = 15
    Hint = ''
    Caption = 's/d'
    TabOrder = 13
  end
  object dtTgl1: TUniDateTimePicker
    Left = 192
    Top = 44
    Width = 106
    Hint = ''
    DateTime = 44462.000000000000000000
    DateFormat = 'dd/MM/yyyy'
    TimeFormat = 'HH:mm:ss'
    TabOrder = 4
  end
  object cbTipepasien: TUniDBLookupComboBox
    Left = 88
    Top = 106
    Width = 281
    Height = 23
    Hint = ''
    ListField = 'nama'
    ListSource = DSTipePasien
    KeyField = 'id'
    ListFieldIndex = 0
    TabOrder = 7
    Color = clWindow
  end
  object UniLabel5: TUniLabel
    Left = 8
    Top = 112
    Width = 66
    Height = 15
    Hint = ''
    Caption = 'Tipe pasien'
    TabOrder = 14
  end
  object cbAsalPasien: TUniDBLookupComboBox
    Left = 88
    Top = 135
    Width = 281
    Height = 23
    Hint = ''
    ListField = 'nama'
    ListSource = DSAsalPasien
    KeyField = 'id'
    ListFieldIndex = 0
    TabOrder = 8
    Color = clWindow
  end
  object UniLabel6: TUniLabel
    Left = 8
    Top = 141
    Width = 66
    Height = 15
    Hint = ''
    Caption = 'Asal pasien'
    TabOrder = 15
  end
  object UniLabel7: TUniLabel
    Left = 8
    Top = 170
    Width = 43
    Height = 15
    Hint = ''
    Caption = 'Perujuk'
    TabOrder = 16
  end
  object cbPerujuk: TUniDBLookupComboBox
    Left = 88
    Top = 164
    Width = 281
    Height = 23
    Hint = ''
    ListField = 'nama'
    ListSource = DSPerujuk
    KeyField = 'id'
    ListFieldIndex = 0
    TabOrder = 9
    Color = clWindow
  end
  object UniLabel8: TUniLabel
    Left = 8
    Top = 199
    Width = 57
    Height = 15
    Hint = ''
    Caption = 'Ansuransi'
    TabOrder = 17
  end
  object cbAnsuransi: TUniDBLookupComboBox
    Left = 88
    Top = 193
    Width = 281
    Height = 23
    Hint = ''
    ListField = 'nama'
    ListSource = DSAnsuransi
    KeyField = 'id'
    ListFieldIndex = 0
    TabOrder = 10
    Color = clWindow
  end
  object UniLabel9: TUniLabel
    Left = 8
    Top = 78
    Width = 89
    Height = 15
    Hint = ''
    Caption = 'Nomor Lab. dari'
    TabOrder = 18
  end
  object NoLabDari: TUniEdit
    Left = 103
    Top = 74
    Width = 116
    Hint = ''
    Text = ''
    TabOrder = 5
  end
  object UniLabel10: TUniLabel
    Left = 222
    Top = 78
    Width = 19
    Height = 15
    Hint = ''
    Caption = 's/d'
    TabOrder = 19
  end
  object NoLabSampai: TUniEdit
    Left = 244
    Top = 74
    Width = 116
    Hint = ''
    Text = ''
    TabOrder = 6
  end
  object UniButton1: TUniButton
    Left = 192
    Top = 232
    Width = 89
    Height = 25
    Hint = ''
    Caption = 'Cari'
    TabOrder = 20
    Default = True
    OnClick = UniButton1Click
  end
  object UniButton2: TUniButton
    Left = 294
    Top = 232
    Width = 75
    Height = 25
    Hint = ''
    Caption = 'Batal'
    TabOrder = 21
    OnClick = UniButton2Click
  end
  object QTipePasien: TFDQuery
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id,nama from tipe_pasien order by nama')
    Left = 8
    Top = 80
  end
  object DSTipePasien: TDataSource
    DataSet = QTipePasien
    Left = 40
    Top = 80
  end
  object QAsalPasien: TFDQuery
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id,nama from asal_pasien order by nama')
    Left = 8
    Top = 120
  end
  object DSAsalPasien: TDataSource
    DataSet = QAsalPasien
    Left = 40
    Top = 120
  end
  object QPerujuk: TFDQuery
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id,nama from dokter order by nama')
    Left = 104
    Top = 160
  end
  object DSPerujuk: TDataSource
    DataSet = QPerujuk
    Left = 136
    Top = 160
  end
  object QAnsuransi: TFDQuery
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id,nama from ansuransi_pasien order by nama')
    Left = 80
    Top = 208
  end
  object DSAnsuransi: TDataSource
    DataSet = QAnsuransi
    Left = 112
    Top = 208
  end
end
