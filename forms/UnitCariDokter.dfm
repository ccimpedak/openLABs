object frmCariDokter: TfrmCariDokter
  Left = 0
  Top = 0
  ClientHeight = 548
  ClientWidth = 595
  Caption = 'Cari Dokter/Perujuk'
  BorderStyle = bsDialog
  OldCreateOrder = False
  OnActivate = UniFormActivate
  OnKeyDown = UniFormKeyDown
  KeyPreview = True
  MonitoredKeys.Enabled = True
  MonitoredKeys.KeyHandleAll = False
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
      Width = 163
      Height = 15
      Hint = ''
      Caption = 'Find by Nama / Telp / Alamat'
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Roboto'
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
    end
    object btnCari: TUniButton
      Left = 16
      Top = 64
      Width = 137
      Height = 33
      Hint = ''
      Caption = 'F4 by Alamat'
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Roboto'
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
      Left = 11
      Top = 6
      Width = 105
      Height = 31
      Hint = ''
      Caption = 'Pilih (F1)'
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Roboto'
      TabOrder = 1
      OnClick = btnPilihClick
    end
    object UniButton3: TUniButton
      Left = 122
      Top = 6
      Width = 105
      Height = 31
      Hint = ''
      Caption = 'Baru (F2)'
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Roboto'
      TabOrder = 2
      OnClick = UniButton3Click
    end
    object btnExit: TUniButton
      Left = 233
      Top = 6
      Width = 105
      Height = 31
      Hint = ''
      Caption = 'Exit (F3)'
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Roboto'
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
    TitleFont.Height = -13
    TitleFont.Name = 'Roboto'
    DataSource = DSPasien
    Options = [dgTitles, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgAutoRefreshRow]
    ReadOnly = True
    WebOptions.Paged = False
    LoadMask.Message = 'Loading data...'
    Align = alClient
    Font.Height = -13
    Font.Name = 'Roboto'
    ParentFont = False
    TabOrder = 2
    OnDblClick = grdPasienDblClick
    Columns = <
      item
        FieldName = 'nama'
        Title.Caption = 'Nama'
        Title.Font.Height = -13
        Title.Font.Name = 'Roboto'
        Width = 227
        Font.Name = 'Roboto'
      end
      item
        FieldName = 'alamat'
        Title.Caption = 'Alamat'
        Title.Font.Height = -13
        Title.Font.Name = 'Roboto'
        Width = 200
        Font.Name = 'Roboto'
      end
      item
        FieldName = 'tlp'
        Title.Caption = 'Telpon'
        Title.Font.Height = -13
        Title.Font.Name = 'Roboto'
        Width = 150
        Font.Name = 'Roboto'
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
