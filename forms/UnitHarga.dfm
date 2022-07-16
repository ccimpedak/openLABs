object frmHarga: TfrmHarga
  Left = 0
  Top = 0
  ClientHeight = 273
  ClientWidth = 364
  Caption = 'Harga'
  BorderStyle = bsDialog
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  Font.Height = -13
  Font.Name = 'Roboto'
  OnBeforeShow = UniFormBeforeShow
  PixelsPerInch = 96
  TextHeight = 15
  object UniContainerPanel1: TUniContainerPanel
    Left = 0
    Top = 234
    Width = 364
    Height = 39
    Hint = ''
    ParentColor = False
    Align = alBottom
    TabOrder = 0
    object spTambah: TUniSpeedButton
      Left = 3
      Top = 6
      Width = 102
      Height = 27
      Hint = ''
      Caption = 'Tambah / Ubah'
      ParentColor = False
      Color = clWindow
      TabOrder = 1
      OnClick = spTambahClick
    end
    object UniSpeedButton1: TUniSpeedButton
      Left = 143
      Top = 6
      Width = 78
      Height = 27
      Hint = ''
      Visible = False
      Caption = 'Edit'
      ParentColor = False
      Color = clWindow
      TabOrder = 2
      OnClick = UniSpeedButton1Click
    end
    object UniSpeedButton2: TUniSpeedButton
      Left = 283
      Top = 6
      Width = 78
      Height = 27
      Hint = ''
      Caption = 'Tutup'
      ParentColor = False
      Color = clWindow
      TabOrder = 3
      OnClick = UniSpeedButton2Click
    end
  end
  object UniContainerPanel2: TUniContainerPanel
    Left = 0
    Top = 0
    Width = 364
    Height = 234
    Hint = ''
    ParentColor = False
    Align = alClient
    TabOrder = 1
    ExplicitLeft = 232
    ExplicitTop = 168
    ExplicitWidth = 256
    ExplicitHeight = 128
    object UniDBGrid1: TUniDBGrid
      Left = 0
      Top = 0
      Width = 364
      Height = 234
      Hint = ''
      TitleFont.Name = 'Roboto'
      DataSource = dsHarga
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgMultiSelect, dgAutoRefreshRow]
      WebOptions.Paged = False
      WebOptions.FetchAll = True
      LoadMask.Message = 'Loading data...'
      Align = alClient
      TabOrder = 1
      Columns = <
        item
          FieldName = 'tipe_pasien'
          Title.Caption = 'Tipe Pasien'
          Title.Font.Name = 'Roboto'
          Width = 201
          Font.Name = 'Roboto'
          ReadOnly = True
        end
        item
          FieldName = 'harga'
          Title.Caption = 'Harga'
          Title.Font.Name = 'Roboto'
          Width = 95
          Font.Name = 'Roboto'
        end>
    end
  end
  object QHarga: TFDQuery
    Active = True
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select h.id,h.test_id, tp.nama tipe_pasien,h.harga'
      'from'
      'harga h'
      'left join tipe_pasien tp on h.tipe_pasien_id = tp.id'
      'where'
      'h.test_id = :test_id')
    Left = 32
    Top = 88
    ParamData = <
      item
        Name = 'TEST_ID'
        DataType = ftString
        ParamType = ptInput
        Value = '1001'
      end>
  end
  object dsHarga: TDataSource
    DataSet = QHarga
    Left = 96
    Top = 96
  end
end
