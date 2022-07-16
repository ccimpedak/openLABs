object frmLapor: TfrmLapor
  Left = 0
  Top = 0
  ClientHeight = 487
  ClientWidth = 491
  Caption = 'Buat Laporan'
  OldCreateOrder = False
  BorderIcons = [biSystemMenu, biMinimize]
  MonitoredKeys.Keys = <>
  Font.Height = -13
  Font.Name = 'Roboto'
  OnBeforeShow = UniFormBeforeShow
  OnAfterShow = UniFormAfterShow
  PixelsPerInch = 96
  TextHeight = 15
  object UniLabel1: TUniLabel
    Left = 41
    Top = 270
    Width = 99
    Height = 15
    Hint = ''
    Caption = 'Penerima laporan'
    TabOrder = 0
  end
  object UniLabel2: TUniLabel
    Left = 96
    Top = 374
    Width = 44
    Height = 15
    Hint = ''
    Caption = 'Catatan'
    TabOrder = 7
  end
  object edPenerima: TUniEdit
    Left = 146
    Top = 266
    Width = 329
    Hint = ''
    Text = ''
    TabOrder = 1
  end
  object txtCatatan: TUniMemo
    Tag = 4
    Left = 146
    Top = 374
    Width = 329
    Height = 77
    Hint = ''
    TabOrder = 5
  end
  object UniButton1: TUniButton
    Tag = 5
    Left = 392
    Top = 457
    Width = 83
    Height = 26
    Hint = ''
    Caption = 'Submit'
    TabOrder = 6
    Default = True
    OnClick = UniButton1Click
  end
  object UniLabel3: TUniLabel
    Left = 8
    Top = 8
    Width = 62
    Height = 15
    Hint = ''
    Caption = 'Nomor Lab'
    TabOrder = 8
  end
  object UniLabel4: TUniLabel
    Left = 8
    Top = 33
    Width = 76
    Height = 15
    Hint = ''
    Caption = 'Nama Pasien'
    TabOrder = 9
  end
  object UniLabel5: TUniLabel
    Left = 8
    Top = 58
    Width = 25
    Height = 15
    Hint = ''
    Caption = 'Asal'
    TabOrder = 10
  end
  object UniLabel6: TUniLabel
    Left = 8
    Top = 82
    Width = 38
    Height = 15
    Hint = ''
    Caption = 'Dokter'
    TabOrder = 11
  end
  object UniDBText1: TUniDBText
    Left = 128
    Top = 8
    Width = 66
    Height = 15
    Hint = ''
    DataField = 'nomor'
    DataSource = DSHasil
  end
  object UniDBText2: TUniDBText
    Left = 128
    Top = 33
    Width = 66
    Height = 15
    Hint = ''
    DataField = 'nama_pasien'
    DataSource = DSHasil
  end
  object UniDBText3: TUniDBText
    Left = 128
    Top = 58
    Width = 66
    Height = 15
    Hint = ''
    DataField = 'asal'
    DataSource = DSHasil
  end
  object UniDBText4: TUniDBText
    Left = 128
    Top = 83
    Width = 66
    Height = 15
    Hint = ''
    DataField = 'dokter'
    DataSource = DSHasil
  end
  object grdHasil: TUniStringGrid
    Left = 8
    Top = 107
    Width = 467
    Height = 153
    Hint = ''
    FixedCols = 0
    RowCount = 2
    ColCount = 3
    Options = [goVertLine, goHorzLine]
    Columns = <>
    OnDrawCell = grdHasilDrawCell
    TabOrder = 16
  end
  object dtWaktu: TUniDateTimePicker
    Tag = 3
    Left = 146
    Top = 322
    Width = 183
    Hint = ''
    DateTime = 44533.419153449070000000
    DateFormat = 'dd/MM/yyyy'
    TimeFormat = 'HH:mm:ss'
    Kind = tUniDateTime
    TabOrder = 3
  end
  object UniLabel7: TUniLabel
    Left = 58
    Top = 301
    Width = 83
    Height = 15
    Hint = ''
    Caption = 'Waktu validasi'
    TabOrder = 17
  end
  object dtValidasi: TUniDateTimePicker
    Tag = 2
    Left = 146
    Top = 294
    Width = 183
    Hint = ''
    DateTime = 44533.419153449070000000
    DateFormat = 'dd/MM/yyyy'
    TimeFormat = 'HH:mm:ss'
    Kind = tUniDateTime
    TabOrder = 2
  end
  object UniLabel8: TUniLabel
    Left = 58
    Top = 325
    Width = 82
    Height = 15
    Hint = ''
    Caption = 'Waktu laporan'
    TabOrder = 18
  end
  object UniLabel9: TUniLabel
    Left = 97
    Top = 350
    Width = 43
    Height = 15
    Hint = ''
    Caption = 'Pelapor'
    TabOrder = 19
  end
  object edPelapor: TUniEdit
    Left = 146
    Top = 348
    Width = 329
    Hint = ''
    Text = ''
    TabOrder = 4
  end
  object cmdLapor: TFDCommand
    Connection = UniMainModule.FDConnection1
    Left = 264
    Top = 64
  end
  object QHasil: TFDQuery
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      
        'SELECT DISTINCT `result_detail`.`ID` AS `nomor`,`pasien`.`nama` ' +
        'AS `nama_pasien`,`asal_pasien`.`nama` AS `asal`,`dokter`.`nama` ' +
        'AS `dokter`'
      'FROM `result_detail`'
      
        'LEFT JOIN `order_header` ON `result_detail`.`ID` = `order_header' +
        '`.`nomor`'
      'LEFT JOIN `pasien` ON `order_header`.`pasien_id` = `pasien`.`id`'
      
        'LEFT JOIN `asal_pasien` ON `order_header`.`asal_pasien_id` = `as' +
        'al_pasien`.`id`'
      'LEFT JOIN `dokter` ON `order_header`.`dokter_id` = `dokter`.`id`'
      
        'WHERE ISNULL(`result_detail`.`lapor_waktu`) AND ISNULL(`result_d' +
        'etail`.`lapor_user`) '
      
        'AND `result_detail`.`FLAG` in ('#39'KRITIS HIGH'#39','#39'KRITIS LOW'#39','#39'KRITI' +
        'S'#39') '
      'AND `result_detail`.`id` = :nomor')
    Left = 310
    Top = 24
    ParamData = <
      item
        Name = 'NOMOR'
        DataType = ftString
        ParamType = ptInput
        Value = '1'
      end>
  end
  object DSHasil: TDataSource
    DataSet = QHasil
    Left = 414
    Top = 32
  end
  object QHasilDtl: TFDQuery
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      
        'SELECT `result_detail`.`ID` AS `nomor`,`pasien`.`nama` AS `nama_' +
        'pasien`,`asal_pasien`.`nama` AS `asal`,`dokter`.`nama` AS `dokte' +
        'r`,`result_detail`.`TEST_NM` AS `test`,`result_detail`.`RESULT_V' +
        'ALUE` AS `hasil`,`result_detail`.`TEST_CD` AS `test_code`, CONCA' +
        'T(`result_detail`.`ID`,`result_detail`.`TEST_CD`) AS `ID`'
      'FROM `result_detail`'
      
        'LEFT JOIN `order_header` ON `result_detail`.`ID` = `order_header' +
        '`.`nomor`'
      'LEFT JOIN `pasien` ON `order_header`.`pasien_id` = `pasien`.`id`'
      
        'LEFT JOIN `asal_pasien` ON `order_header`.`asal_pasien_id` = `as' +
        'al_pasien`.`id`'
      'LEFT JOIN `dokter` ON `order_header`.`dokter_id` = `dokter`.`id`'
      
        'WHERE ISNULL(`result_detail`.`lapor_waktu`) AND ISNULL(`result_d' +
        'etail`.`lapor_user`) '
      
        'AND `result_detail`.`FLAG` in ('#39'KRITIS HIGH'#39','#39'KRITIS LOW'#39','#39'KRITI' +
        'S'#39') '
      'AND `result_detail`.`id` = :nomor'
      '')
    Left = 360
    Top = 24
    ParamData = <
      item
        Name = 'NOMOR'
        ParamType = ptInput
        Value = Null
      end>
  end
end
