object frmPermDarahBaru: TfrmPermDarahBaru
  Left = 0
  Top = 0
  ClientHeight = 381
  ClientWidth = 501
  Caption = 'Permintaan Darah Baru'
  BorderStyle = bsDialog
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  Font.Height = -16
  PixelsPerInch = 96
  TextHeight = 19
  object UniGroupBox1: TUniGroupBox
    Left = 8
    Top = 8
    Width = 485
    Height = 137
    Hint = ''
    Caption = 'Pasien'
    TabOrder = 0
    object UniLabel2: TUniLabel
      Left = 16
      Top = 49
      Width = 41
      Height = 19
      Hint = ''
      Caption = 'Nama'
      TabOrder = 1
    end
    object UniLabel3: TUniLabel
      Left = 16
      Top = 74
      Width = 56
      Height = 19
      Hint = ''
      Caption = 'Kelamin'
      TabOrder = 2
    end
    object UniLabel4: TUniLabel
      Left = 16
      Top = 99
      Width = 30
      Height = 19
      Hint = ''
      Caption = 'Usia'
      TabOrder = 3
    end
    object UniLabel5: TUniLabel
      Left = 96
      Top = 24
      Width = 52
      Height = 19
      Hint = ''
      Caption = 'No. MR'
      TabOrder = 4
    end
    object UniLabel6: TUniLabel
      Left = 96
      Top = 49
      Width = 52
      Height = 19
      Hint = ''
      Caption = 'No. MR'
      TabOrder = 5
    end
    object UniLabel7: TUniLabel
      Left = 96
      Top = 74
      Width = 52
      Height = 19
      Hint = ''
      Caption = 'No. MR'
      TabOrder = 6
    end
    object UniLabel8: TUniLabel
      Left = 96
      Top = 99
      Width = 52
      Height = 19
      Hint = ''
      Caption = 'No. MR'
      TabOrder = 7
    end
    object UniButton1: TUniButton
      Left = 373
      Top = 24
      Width = 84
      Height = 33
      Hint = ''
      Caption = '&Cari'
      TabOrder = 8
    end
    object UniLabel1: TUniLabel
      Left = 18
      Top = 24
      Width = 52
      Height = 19
      Hint = ''
      Caption = 'No. MR'
      TabOrder = 9
    end
  end
  object UniGroupBox2: TUniGroupBox
    Left = 8
    Top = 151
    Width = 485
    Height = 178
    Hint = ''
    Caption = 'Permintaan Darah'
    TabOrder = 1
    object UniLabel9: TUniLabel
      Left = 24
      Top = 30
      Width = 115
      Height = 19
      Hint = ''
      Caption = 'Golongan Darah'
      TabOrder = 1
    end
    object UniLabel10: TUniLabel
      Left = 24
      Top = 63
      Width = 50
      Height = 19
      Hint = ''
      Caption = 'Rhesus'
      TabOrder = 2
    end
    object UniLabel11: TUniLabel
      Left = 24
      Top = 98
      Width = 31
      Height = 19
      Hint = ''
      Caption = 'Tipe'
      TabOrder = 3
    end
    object cbPenjamin: TUniDBLookupComboBox
      Left = 160
      Top = 96
      Width = 203
      Height = 27
      Hint = ''
      ListSource = dsAnsuransi
      KeyField = 'nama'
      ListFieldIndex = 0
      DataField = 'id'
      TabOrder = 4
      Color = clWindow
      ForceSelection = True
    end
    object UniDBLookupComboBox1: TUniDBLookupComboBox
      Left = 160
      Top = 63
      Width = 203
      Height = 27
      Hint = ''
      ListSource = dsAnsuransi
      KeyField = 'nama'
      ListFieldIndex = 0
      DataField = 'id'
      TabOrder = 5
      Color = clWindow
      ForceSelection = True
    end
    object UniDBLookupComboBox2: TUniDBLookupComboBox
      Left = 160
      Top = 30
      Width = 203
      Height = 27
      Hint = ''
      ListSource = dsAnsuransi
      KeyField = 'nama'
      ListFieldIndex = 0
      DataField = 'id'
      TabOrder = 6
      Color = clWindow
      ForceSelection = True
    end
  end
  object UniButton2: TUniButton
    Left = 289
    Top = 335
    Width = 99
    Height = 38
    Hint = ''
    Caption = 'Simpan'
    TabOrder = 2
  end
  object UniButton3: TUniButton
    Left = 394
    Top = 335
    Width = 99
    Height = 38
    Hint = ''
    Caption = 'Batal'
    TabOrder = 3
    OnClick = UniButton3Click
  end
  object qAnsuransi: TFDQuery
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'SELECT id,nama'
      'FROM'
      'asal_pasien'
      'ORDER BY id')
    Left = 449
    Top = 232
  end
  object dsAnsuransi: TDataSource
    DataSet = qAnsuransi
    Left = 433
    Top = 272
  end
end
