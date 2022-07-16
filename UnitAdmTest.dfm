object frmAdmTest: TfrmAdmTest
  Left = 0
  Top = 0
  ClientHeight = 546
  ClientWidth = 807
  Caption = 'Test'
  BorderStyle = bsDialog
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  Font.Height = -16
  Font.Name = 'Calibri'
  OnBeforeShow = UniFormBeforeShow
  PixelsPerInch = 96
  TextHeight = 19
  object UniContainerPanel1: TUniContainerPanel
    Left = 0
    Top = 0
    Width = 377
    Height = 546
    Hint = ''
    ParentColor = False
    Align = alLeft
    TabOrder = 0
    object UniDBGrid1: TUniDBGrid
      Left = 0
      Top = 41
      Width = 377
      Height = 461
      Cursor = crHandPoint
      Hint = ''
      DataSource = DSTest
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgAutoRefreshRow]
      WebOptions.Paged = False
      WebOptions.FetchAll = True
      LoadMask.Message = 'Loading data...'
      Align = alClient
      TabOrder = 1
      OnCellClick = UniDBGrid1CellClick
      Columns = <
        item
          FieldName = 'kode'
          Title.Caption = 'kode'
          Width = 66
          Font.Name = 'Calibri'
        end
        item
          FieldName = 'nama'
          Title.Caption = 'nama'
          Width = 270
          Font.Name = 'Calibri'
        end>
    end
    object UniContainerPanel3: TUniContainerPanel
      Left = 0
      Top = 0
      Width = 377
      Height = 41
      Hint = ''
      ParentColor = False
      Align = alTop
      TabOrder = 2
    end
    object edCariNama: TUniEdit
      Left = 4
      Top = 8
      Width = 368
      Hint = ''
      Text = ''
      TabOrder = 3
      OnChange = edCariNamaChange
    end
    object UniContainerPanel7: TUniContainerPanel
      Left = 0
      Top = 502
      Width = 377
      Height = 44
      Hint = ''
      ParentColor = False
      Align = alBottom
      TabOrder = 4
      object UniButton2: TUniButton
        Left = 210
        Top = 6
        Width = 75
        Height = 34
        Hint = ''
        Caption = 'Hapus'
        TabOrder = 1
        OnClick = UniButton2Click
      end
      object UniButton3: TUniButton
        Left = 291
        Top = 6
        Width = 75
        Height = 34
        Hint = ''
        Caption = 'Tambah'
        TabOrder = 2
        OnClick = UniButton3Click
      end
    end
  end
  object UniContainerPanel2: TUniContainerPanel
    Left = 377
    Top = 0
    Width = 430
    Height = 546
    Hint = ''
    ParentColor = False
    Align = alClient
    TabOrder = 1
    object UniLabel1: TUniLabel
      Left = 16
      Top = 24
      Width = 32
      Height = 19
      Hint = ''
      Caption = 'Kode'
      TabOrder = 5
    end
    object edKode: TUniNumberEdit
      Left = 72
      Top = 22
      Width = 129
      Hint = ''
      Alignment = taCenter
      TabOrder = 1
      DecimalSeparator = '.'
    end
    object edNama: TUniEdit
      Left = 72
      Top = 50
      Width = 345
      Hint = ''
      Text = 'edNama'
      TabOrder = 2
    end
    object btnSave: TUniButton
      Left = 344
      Top = 110
      Width = 75
      Height = 34
      Hint = ''
      Caption = 'Simpan'
      TabOrder = 4
      OnClick = btnSaveClick
    end
    object UniLabel6: TUniLabel
      Left = 16
      Top = 80
      Width = 39
      Height = 19
      Hint = ''
      Caption = 'Harga'
      TabOrder = 6
    end
    object edHarga: TUniNumberEdit
      Left = 73
      Top = 78
      Width = 169
      Hint = ''
      Alignment = taRightJustify
      TabOrder = 3
      DecimalSeparator = '.'
    end
    object UniLabel3: TUniLabel
      Left = 16
      Top = 52
      Width = 38
      Height = 19
      Hint = ''
      Caption = 'Nama'
      TabOrder = 7
    end
  end
  object QTest: TFDQuery
    Aggregates = <
      item
      end>
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select * from test'
      
        'left join harga on harga.test_id = test.id and harga.tipe_pasien' +
        '_id = 1 and harga.urgency_id = 1'
      'where'
      'nama like :nama')
    Left = 88
    Top = 176
    ParamData = <
      item
        Name = 'NAMA'
        DataType = ftString
        ParamType = ptInput
        Value = '%%'
      end>
  end
  object DSTest: TDataSource
    DataSet = QTest
    Left = 128
    Top = 176
  end
  object cmdExec: TFDCommand
    Connection = UniMainModule.FDConnection1
    Left = 280
    Top = 424
  end
  object QCek: TFDQuery
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select * from test where kode  = :kode')
    Left = 184
    Top = 432
    ParamData = <
      item
        Name = 'KODE'
        DataType = ftString
        ParamType = ptInput
        Value = '1'
      end>
  end
end
