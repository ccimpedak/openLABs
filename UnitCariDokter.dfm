object frmCariDokter: TfrmCariDokter
  Left = 0
  Top = 0
  ClientHeight = 548
  ClientWidth = 595
  Caption = 'Cari Dokter'
  BorderStyle = bsDialog
  OldCreateOrder = False
  OnActivate = UniFormActivate
  OnKeyDown = UniFormKeyDown
  MonitoredKeys.Enabled = True
  MonitoredKeys.KeyHandleAll = False
  MonitoredKeys.KeyEnableAll = True
  MonitoredKeys.Keys = <
    item
      KeyStart = 112
      KeyEnd = 123
      HandleBrowser = False
    end>
  Font.Height = -16
  PixelsPerInch = 96
  TextHeight = 19
  object UniPanel1: TUniPanel
    Left = 0
    Top = 0
    Width = 595
    Height = 105
    Hint = ''
    Align = alTop
    TabOrder = 0
    Caption = ''
    object UniLabel1: TUniLabel
      Left = 16
      Top = 11
      Width = 211
      Height = 19
      Hint = ''
      Caption = 'Find by Nama / Telp / Alamat'
      TabOrder = 1
    end
    object edText: TUniEdit
      Left = 16
      Top = 36
      Width = 211
      Hint = ''
      Text = ''
      TabOrder = 2
      OnKeyDown = edTextKeyDown
      OnKeyPress = edTextKeyPress
    end
    object btnCari: TUniButton
      Left = 16
      Top = 64
      Width = 137
      Height = 33
      Hint = ''
      Caption = 'F4 by Alamat'
      TabOrder = 3
      OnClick = btnCariClick
    end
  end
  object UniPanel2: TUniPanel
    Left = 0
    Top = 487
    Width = 595
    Height = 61
    Hint = ''
    Align = alBottom
    TabOrder = 1
    Caption = ''
    object btnPilih: TUniButton
      Left = 3
      Top = 6
      Width = 105
      Height = 49
      Hint = ''
      Caption = 'Pilih (F1)'
      TabOrder = 1
      OnClick = btnPilihClick
    end
    object UniButton3: TUniButton
      Left = 114
      Top = 6
      Width = 105
      Height = 49
      Hint = ''
      Caption = 'Baru (F2)'
      TabOrder = 2
      OnClick = UniButton3Click
    end
    object btnExit: TUniButton
      Left = 225
      Top = 6
      Width = 105
      Height = 49
      Hint = ''
      Caption = 'Exit (F3)'
      TabOrder = 3
      OnClick = btnExitClick
    end
  end
  object grdPasien: TUniDBGrid
    Left = 0
    Top = 105
    Width = 595
    Height = 382
    Hint = ''
    DataSource = DSPasien
    Options = [dgTitles, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgAutoRefreshRow]
    ReadOnly = True
    WebOptions.Paged = False
    LoadMask.Message = 'Loading data...'
    Align = alClient
    TabOrder = 2
    OnDblClick = grdPasienDblClick
    Columns = <
      item
        FieldName = 'nama'
        Title.Caption = 'Nama'
        Title.Font.Height = -16
        Width = 227
      end
      item
        FieldName = 'alamat'
        Title.Caption = 'Alamat'
        Title.Font.Height = -16
        Width = 200
      end
      item
        FieldName = 'tlp'
        Title.Caption = 'Telpon'
        Title.Font.Height = -16
        Width = 150
      end>
  end
  object QDokter: TFDQuery
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select * from dokter  order by nama limit 0,100')
    Left = 312
    Top = 64
  end
  object DSPasien: TDataSource
    DataSet = QDokter
    Left = 360
    Top = 64
  end
end
