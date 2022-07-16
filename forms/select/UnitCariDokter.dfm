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
  Font.Height = -13
  Font.Name = 'Roboto'
  PixelsPerInch = 96
  TextHeight = 15
  object UniPanel1: TUniPanel
    Left = 0
    Top = 0
    Width = 595
    Height = 65
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
      TabOrder = 1
    end
    object edText: TUniEdit
      Left = 16
      Top = 32
      Width = 211
      Hint = ''
      Text = ''
      TabOrder = 2
      OnKeyDown = edTextKeyDown
      OnKeyPress = edTextKeyPress
    end
  end
  object UniPanel2: TUniPanel
    Left = 0
    Top = 504
    Width = 595
    Height = 44
    Hint = ''
    Align = alBottom
    TabOrder = 1
    Caption = ''
    object btnPilih: TUniButton
      Left = 3
      Top = 6
      Width = 105
      Height = 31
      Hint = 'F1'
      Caption = 'Pilih'
      TabOrder = 1
      OnClick = btnPilihClick
    end
    object UniButton3: TUniButton
      Left = 114
      Top = 6
      Width = 105
      Height = 31
      Hint = 'F2'
      Caption = 'Baru'
      TabOrder = 2
      OnClick = UniButton3Click
    end
    object btnExit: TUniButton
      Left = 225
      Top = 6
      Width = 105
      Height = 31
      Hint = 'F3'
      Caption = 'Exit'
      TabOrder = 3
      OnClick = btnExitClick
    end
  end
  object grdPasien: TUniDBGrid
    Left = 0
    Top = 65
    Width = 595
    Height = 439
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
      
        'select * from dokter where nama like :cari and organisasi_id = :' +
        'organisasi_id order by nama limit 0,100')
    Left = 344
    Top = 8
    ParamData = <
      item
        Name = 'CARI'
        DataType = ftString
        ParamType = ptInput
        Value = '0'
      end
      item
        Name = 'ORGANISASI_ID'
        DataType = ftString
        ParamType = ptInput
        Value = '0'
      end>
  end
  object DSPasien: TDataSource
    DataSet = QDokter
    Left = 392
    Top = 8
  end
end
