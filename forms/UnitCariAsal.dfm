object frmCariAsal: TfrmCariAsal
  Left = 0
  Top = 0
  ClientHeight = 442
  ClientWidth = 516
  Caption = 'Cari Asal'
  BorderStyle = bsDialog
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  Font.Height = -13
  Font.Name = 'Roboto'
  PixelsPerInch = 96
  TextHeight = 15
  object UniPanel1: TUniPanel
    Left = 0
    Top = 0
    Width = 516
    Height = 73
    Hint = ''
    Align = alTop
    TabOrder = 0
    Caption = ''
    object UniLabel1: TUniLabel
      Left = 16
      Top = 11
      Width = 77
      Height = 15
      Hint = ''
      Caption = 'Find by Nama'
      TabOrder = 1
    end
    object edText: TUniEdit
      Left = 16
      Top = 36
      Width = 211
      Hint = ''
      Text = ''
      TabOrder = 2
      OnKeyPress = edTextKeyPress
    end
    object btnCari: TUniButton
      Left = 233
      Top = 36
      Width = 72
      Height = 22
      Hint = ''
      Caption = 'Cari'
      TabOrder = 3
      OnClick = btnCariClick
    end
  end
  object UniPanel2: TUniPanel
    Left = 0
    Top = 400
    Width = 516
    Height = 42
    Hint = ''
    Align = alBottom
    TabOrder = 1
    Caption = ''
    object btnPilih: TUniButton
      Left = 3
      Top = 6
      Width = 78
      Height = 31
      Hint = ''
      Caption = 'Pilih (F1)'
      TabOrder = 1
      OnClick = btnPilihClick
    end
    object UniButton3: TUniButton
      Left = 87
      Top = 6
      Width = 82
      Height = 31
      Hint = ''
      Caption = 'Baru (F2)'
      TabOrder = 2
      OnClick = UniButton3Click
    end
    object btnExit: TUniButton
      Left = 175
      Top = 6
      Width = 82
      Height = 31
      Hint = ''
      Caption = 'Exit (F3)'
      TabOrder = 3
      OnClick = btnExitClick
    end
  end
  object grdPasien: TUniDBGrid
    Left = 0
    Top = 73
    Width = 516
    Height = 327
    Hint = ''
    DataSource = DSAsal
    Options = [dgTitles, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgAutoRefreshRow]
    ReadOnly = True
    WebOptions.Paged = False
    LoadMask.Message = 'Loading data...'
    Align = alClient
    TabOrder = 2
    OnDblClick = btnPilihClick
    Columns = <
      item
        FieldName = 'kode'
        Title.Caption = 'Kode'
        Width = 165
        Font.Name = 'Roboto'
      end
      item
        FieldName = 'nama'
        Title.Caption = 'Nama'
        Title.Font.Height = -13
        Title.Font.Name = 'Roboto'
        Width = 317
        Font.Name = 'Roboto'
      end>
  end
  object QAsal: TFDQuery
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select * from asal_pasien order by nama limit 0,100')
    Left = 312
    Top = 64
  end
  object DSAsal: TDataSource
    DataSet = QAsal
    Left = 360
    Top = 64
  end
end
