object frmCariAsal: TfrmCariAsal
  Left = 0
  Top = 0
  ClientHeight = 354
  ClientWidth = 414
  Caption = 'Pilih Asal'
  BorderStyle = bsDialog
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  Font.Height = -13
  Font.Name = 'Roboto'
  PixelsPerInch = 96
  TextHeight = 15
  object UniContainerPanel1: TUniContainerPanel
    Left = 0
    Top = 0
    Width = 414
    Height = 49
    Hint = ''
    ParentColor = False
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 640
    object UniLabel1: TUniLabel
      Left = 3
      Top = 16
      Width = 22
      Height = 15
      Hint = ''
      Caption = 'Cari'
      TabOrder = 1
    end
    object edCari: TUniEdit
      Left = 31
      Top = 14
      Width = 362
      Hint = ''
      Text = ''
      TabOrder = 2
      OnKeyPress = edCariKeyPress
    end
  end
  object grdAsal: TUniDBGrid
    Left = 0
    Top = 49
    Width = 414
    Height = 305
    Hint = ''
    DataSource = dsAsal
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgAutoRefreshRow]
    WebOptions.Paged = False
    LoadMask.Message = 'Loading data...'
    Align = alClient
    TabOrder = 1
    OnDblClick = grdAsalDblClick
    Columns = <
      item
        FieldName = 'nama'
        Title.Caption = 'Nama'
        Title.Font.Name = 'Roboto'
        Width = 374
        Font.Name = 'Roboto'
      end>
  end
  object QAsal: TFDQuery
    Active = True
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      
        'select  id,nama from asal_pasien where nama like :cari order by ' +
        'nama ')
    Left = 72
    Top = 160
    ParamData = <
      item
        Name = 'CARI'
        DataType = ftString
        ParamType = ptInput
        Value = '%'
      end>
  end
  object dsAsal: TDataSource
    DataSet = QAsal
    Left = 112
    Top = 160
  end
end
