object frmCariPasien: TfrmCariPasien
  Left = 0
  Top = 0
  ClientHeight = 527
  ClientWidth = 809
  Caption = 'Cari Pasien'
  OnShow = UniFormShow
  BorderStyle = bsDialog
  OldCreateOrder = False
  OnKeyDown = UniFormKeyDown
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
    Width = 809
    Height = 105
    Hint = ''
    Align = alTop
    TabOrder = 0
    Caption = ''
    object UniLabel1: TUniLabel
      Left = 16
      Top = 11
      Width = 285
      Height = 19
      Hint = ''
      Caption = 'Find by Nama / Telp / Alamat / No. KTP'
      TabOrder = 1
    end
    object edText: TUniEdit
      Left = 16
      Top = 36
      Width = 285
      Hint = ''
      Text = ''
      TabOrder = 2
      OnKeyDown = UniFormKeyDown
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
    object btnNoKTP: TUniButton
      Left = 164
      Top = 64
      Width = 137
      Height = 33
      Hint = ''
      Caption = 'F5 by No. KTP'
      TabOrder = 4
      OnClick = btnNoKTPClick
    end
  end
  object UniPanel2: TUniPanel
    Left = 0
    Top = 466
    Width = 809
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
    Width = 809
    Height = 361
    Hint = ''
    DataSource = DSPasien
    Options = [dgTitles, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgAutoRefreshRow]
    ReadOnly = True
    WebOptions.Paged = False
    LoadMask.Message = 'Loading data...'
    Align = alClient
    TabOrder = 2
    OnKeyDown = grdPasienKeyDown
    Columns = <
      item
        FieldName = 'nama'
        Title.Caption = 'Nama'
        Title.Font.Height = -16
        Width = 227
        ReadOnly = True
      end
      item
        FieldName = 'no_ktp'
        Title.Caption = 'No. KTP'
        Title.Font.Height = -16
        Width = 196
      end
      item
        FieldName = 'tlp'
        Title.Caption = 'Telpon/Hp'
        Title.Font.Height = -16
        Width = 150
        ReadOnly = True
      end
      item
        FieldName = 'alamat'
        Title.Caption = 'Alamat'
        Title.Font.Height = -16
        Width = 200
      end>
  end
  object QPasien: TFDQuery
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      
        'select p.id,p.jenis_kelamin_id,CONCAT(pf.nama,'#39' '#39', p.nama) nama,' +
        'p.wilayah,CONCAT(p.telepon,'#39'/'#39',p.hp) tlp,p.alamat,'
      'p.no_ktp,'
      
        'CONCAT(TIMESTAMPDIFF( YEAR, p.tanggal_lahir, now() ),'#39' th '#39',TIME' +
        'STAMPDIFF( MONTH, p.tanggal_lahir, now() ) % 12,'#39' bl '#39',FLOOR( TI' +
        'MESTAMPDIFF( DAY, p.tanggal_lahir, now() ) % 30.4375 )) as umur,'
      'jk.nama kelamin'
      
        'from pasien p, prefix pf,jenis_kelamin jk where p.prefix_id = pf' +
        '.id and p.jenis_kelamin_id = jk.id and p.nama like '#39'%tes%'#39' order' +
        ' by p.nama')
    Left = 312
    Top = 64
  end
  object DSPasien: TDataSource
    DataSet = QPasien
    Left = 360
    Top = 64
  end
end
