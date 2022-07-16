object frmRegisterBatchMCU: TfrmRegisterBatchMCU
  Left = 0
  Top = 0
  ClientHeight = 699
  ClientWidth = 938
  Caption = 'Register MCU'
  OldCreateOrder = False
  BorderIcons = [biSystemMenu, biMinimize]
  MonitoredKeys.Keys = <>
  Font.Height = -16
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 19
  object UniContainerPanel1: TUniContainerPanel
    Left = 0
    Top = 630
    Width = 938
    Height = 69
    Hint = ''
    ParentColor = False
    Align = alBottom
    TabOrder = 0
    ExplicitTop = 632
    ExplicitWidth = 907
    object UniButton1: TUniButton
      Left = 16
      Top = 24
      Width = 137
      Height = 34
      Hint = ''
      Caption = 'Tambah Pasien'
      TabOrder = 1
      OnClick = UniButton1Click
    end
  end
  object UniContainerPanel2: TUniContainerPanel
    Left = 0
    Top = 0
    Width = 329
    Height = 630
    Hint = ''
    ParentColor = False
    Align = alLeft
    TabOrder = 1
    ExplicitHeight = 632
    object grdPasien: TUniStringGrid
      Left = 0
      Top = 0
      Width = 329
      Height = 630
      Hint = ''
      FixedCols = 0
      ColCount = 2
      Options = [goVertLine, goHorzLine]
      Columns = <>
      Align = alClient
      TabOrder = 1
      ExplicitLeft = 9
      ExplicitTop = 76
      ExplicitWidth = 320
      ExplicitHeight = 240
    end
  end
  object UniContainerPanel3: TUniContainerPanel
    Left = 329
    Top = 0
    Width = 609
    Height = 630
    Hint = ''
    ParentColor = False
    Align = alClient
    TabOrder = 2
    ExplicitLeft = 352
    ExplicitTop = 65
    ExplicitWidth = 555
    ExplicitHeight = 567
    object UniContainerPanel4: TUniContainerPanel
      Left = 0
      Top = 70
      Width = 609
      Height = 560
      Hint = ''
      ParentColor = False
      Align = alBottom
      TabOrder = 1
      ExplicitTop = 72
      ExplicitWidth = 611
      object grdPemeriksaan: TUniStringGrid
        Left = 0
        Top = 0
        Width = 609
        Height = 560
        Hint = ''
        FixedCols = 0
        RowCount = 4
        ColCount = 4
        Options = [goVertLine, goHorzLine]
        Columns = <>
        Align = alClient
        TabOrder = 1
        ExplicitLeft = 289
        ExplicitTop = 192
        ExplicitWidth = 320
        ExplicitHeight = 240
      end
    end
    object UniContainerPanel5: TUniContainerPanel
      Left = 0
      Top = 0
      Width = 609
      Height = 70
      Hint = ''
      ParentColor = False
      Align = alClient
      TabOrder = 2
      ExplicitWidth = 611
      ExplicitHeight = 65
      object UniLabel10: TUniLabel
        Left = 6
        Top = 44
        Width = 82
        Height = 19
        Hint = ''
        Caption = 'Kode/Nama'
        TabOrder = 1
      end
      object edCariTest: TUniEdit
        Left = 94
        Top = 44
        Width = 232
        Hint = ''
        Text = ''
        TabOrder = 2
      end
      object UniLabel17: TUniLabel
        Left = 332
        Top = 44
        Width = 38
        Height = 19
        Hint = ''
        Caption = 'Paket'
        TabOrder = 3
      end
      object cbPaket: TUniDBLookupComboBox
        Left = 376
        Top = 39
        Width = 224
        Height = 27
        Hint = ''
        ListSource = DSPaket
        KeyField = 'nama'
        ListFieldIndex = 0
        DataField = 'id'
        TabOrder = 4
        Color = clWindow
        ForceSelection = True
      end
      object cbAsal: TUniDBLookupComboBox
        Left = 94
        Top = 11
        Width = 203
        Height = 27
        Hint = ''
        KeyField = 'nama'
        ListFieldIndex = 0
        DataField = 'id'
        TabOrder = 5
        Color = clWindow
      end
      object UniLabel14: TUniLabel
        Left = 6
        Top = 19
        Width = 81
        Height = 19
        Hint = ''
        Caption = 'Perusahaan'
        TabOrder = 6
      end
    end
  end
  object QPaket: TFDQuery
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'SELECT id,nama,disc_pct,disc_amount'
      'FROM'
      'panel_header'
      'WHERE flg_aktif = '#39'Y'#39
      'ORDER BY id')
    Left = 887
    Top = 24
  end
  object DSPaket: TDataSource
    DataSet = QPaket
    Left = 815
    Top = 24
  end
  object QPaketDetail: TFDQuery
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select distinct pd.test_id,t.kode,t.nama,h.harga'
      'from'
      'panel_detail pd'
      'left join test t on pd.test_id = t.id'
      'left join harga h on pd.test_id = h.test_id'
      'where'
      'pd.panel_header_id = :panel_header_id'
      'and h.urgency_id = :urgency_id'
      'and h.tipe_pasien_id = :tipe_pasien_id')
    Left = 847
    Top = 16
    ParamData = <
      item
        Name = 'PANEL_HEADER_ID'
        DataType = ftString
        ParamType = ptInput
        Value = '2'
      end
      item
        Name = 'URGENCY_ID'
        DataType = ftString
        ParamType = ptInput
        Value = '1'
      end
      item
        Name = 'TIPE_PASIEN_ID'
        DataType = ftString
        ParamType = ptInput
        Value = '1'
      end>
  end
  object QAsal: TFDQuery
    Active = True
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'SELECT id,nama'
      'FROM'
      'asal_pasien'
      'ORDER BY id')
    Left = 640
    Top = 8
  end
  object dsAsal: TDataSource
    DataSet = QAsal
    Left = 688
    Top = 8
  end
end
