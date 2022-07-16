object frmAsal: TfrmAsal
  Left = 0
  Top = 0
  ClientHeight = 614
  ClientWidth = 828
  Caption = 'Asal Pasien'
  BorderStyle = bsDialog
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  Font.Height = -16
  OnAfterShow = UniFormAfterShow
  PixelsPerInch = 96
  TextHeight = 19
  object UniContainerPanel1: TUniContainerPanel
    Left = 0
    Top = 0
    Width = 377
    Height = 614
    Hint = ''
    ParentColor = False
    Align = alLeft
    TabOrder = 0
    ExplicitHeight = 551
    object UniContainerPanel4: TUniContainerPanel
      Left = 0
      Top = 0
      Width = 377
      Height = 57
      Hint = ''
      ParentColor = False
      Align = alTop
      TabOrder = 1
    end
    object UniDBGrid1: TUniDBGrid
      Left = 0
      Top = 57
      Width = 377
      Height = 557
      Hint = ''
      DataSource = DSShow
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgAutoRefreshRow]
      WebOptions.Paged = False
      WebOptions.FetchAll = True
      LoadMask.Message = 'Loading data...'
      Align = alClient
      Font.Height = -13
      ParentFont = False
      TabOrder = 2
      Columns = <
        item
          FieldName = 'deskripsi'
          Title.Caption = 'deskripsi'
          Width = 332
        end>
    end
    object UniLabel1: TUniLabel
      Left = 136
      Top = 3
      Width = 86
      Height = 19
      Hint = ''
      Caption = 'Tampilkan'
      ParentFont = False
      Font.Height = -16
      Font.Style = [fsBold]
      TabOrder = 3
    end
    object edShow: TUniEdit
      Left = 3
      Top = 28
      Width = 371
      Hint = ''
      Text = ''
      TabOrder = 4
      OnChange = edShowChange
    end
  end
  object UniContainerPanel2: TUniContainerPanel
    Left = 377
    Top = 0
    Width = 48
    Height = 614
    Hint = ''
    ParentColor = False
    Align = alLeft
    TabOrder = 1
    ExplicitLeft = 383
    ExplicitHeight = 553
    object btnSembunyikan: TUniButton
      Left = 9
      Top = 232
      Width = 33
      Height = 25
      Hint = ''
      Caption = '>'
      TabOrder = 1
      OnClick = btnSembunyikanClick
    end
    object btnTampilkan: TUniButton
      Left = 9
      Top = 263
      Width = 33
      Height = 25
      Hint = ''
      Caption = '<'
      TabOrder = 2
      OnClick = btnTampilkanClick
    end
  end
  object UniContainerPanel3: TUniContainerPanel
    Left = 425
    Top = 0
    Width = 403
    Height = 614
    Hint = ''
    ParentColor = False
    Align = alClient
    TabOrder = 2
    ExplicitLeft = 536
    ExplicitTop = 264
    ExplicitWidth = 256
    ExplicitHeight = 128
    object UniContainerPanel5: TUniContainerPanel
      Left = 0
      Top = 0
      Width = 403
      Height = 57
      Hint = ''
      ParentColor = False
      Align = alTop
      TabOrder = 1
      object UniLabel2: TUniLabel
        Left = 144
        Top = 3
        Width = 109
        Height = 19
        Hint = ''
        Caption = 'Sembunyikan'
        ParentFont = False
        Font.Height = -16
        Font.Style = [fsBold]
        TabOrder = 1
      end
      object UniEdit2: TUniEdit
        Left = 3
        Top = 29
        Width = 397
        Hint = ''
        Text = ''
        TabOrder = 2
        OnChange = UniEdit2Change
      end
    end
    object UniDBGrid2: TUniDBGrid
      Left = 0
      Top = 57
      Width = 403
      Height = 557
      Hint = ''
      DataSource = DSHide
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgAutoRefreshRow]
      WebOptions.Paged = False
      WebOptions.FetchAll = True
      LoadMask.Message = 'Loading data...'
      Align = alClient
      Font.Height = -13
      ParentFont = False
      TabOrder = 2
      Columns = <
        item
          FieldName = 'deskripsi'
          Title.Caption = 'deskripsi'
          Width = 359
        end>
    end
  end
  object QShow: TFDQuery
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'SELECT * FROM'
      'asal'
      'WHERE'
      'flg_tampilkan = 1'
      'ORDER BY deskripsi')
    Left = 96
    Top = 328
  end
  object DSShow: TDataSource
    DataSet = QShow
    Left = 96
    Top = 392
  end
  object QHide: TFDQuery
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'SELECT * FROM'
      'asal'
      'WHERE'
      'flg_tampilkan = 0'
      'ORDER BY deskripsi')
    Left = 592
    Top = 328
  end
  object DSHide: TDataSource
    DataSet = QHide
    Left = 592
    Top = 376
  end
  object cmdUpdate: TFDCommand
    Connection = UniMainModule.FDConnection1
    Left = 393
    Top = 368
  end
end
