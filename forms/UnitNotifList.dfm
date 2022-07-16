object frmNotifList: TfrmNotifList
  Left = 0
  Top = 0
  ClientHeight = 454
  ClientWidth = 443
  Caption = 'List Notifikasi'
  BorderStyle = bsDialog
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  Font.Height = -13
  Font.Name = 'Roboto'
  PixelsPerInch = 96
  TextHeight = 15
  object UniDBGrid1: TUniDBGrid
    Left = 0
    Top = 0
    Width = 443
    Height = 414
    Hint = ''
    DataSource = dsList
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgAutoRefreshRow]
    WebOptions.Paged = False
    WebOptions.FetchAll = True
    LoadMask.Message = 'Loading data...'
    Align = alClient
    TabOrder = 0
    Columns = <
      item
        FieldName = 'noreg'
        Title.Caption = 'No. MR'
        Width = 85
        Font.Name = 'Roboto'
      end
      item
        FieldName = 'nama'
        Title.Caption = 'Nama'
        Width = 199
        Font.Name = 'Roboto'
        ReadOnly = True
      end
      item
        FieldName = 'notifikasi_receiver'
        Title.Caption = 'Penerima'
        Width = 108
        Font.Name = 'Roboto'
      end>
  end
  object UniContainerPanel1: TUniContainerPanel
    Left = 0
    Top = 414
    Width = 443
    Height = 40
    Hint = ''
    ParentColor = False
    Align = alBottom
    TabOrder = 1
    ExplicitWidth = 561
    object UniButton1: TUniButton
      Left = 3
      Top = 6
      Width = 86
      Height = 27
      Hint = ''
      Caption = 'Clear All'
      TabOrder = 1
      OnClick = UniButton1Click
    end
    object UniButton2: TUniButton
      Left = 363
      Top = 6
      Width = 75
      Height = 25
      Hint = ''
      Caption = 'Delete'
      TabOrder = 2
      OnClick = UniButton2Click
    end
  end
  object QNotifList: TFDQuery
    Active = True
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'SELECT * FROM'
      'notifikasi n'
      'LEFT JOIN pasien p ON n.noreg = p.noreg'
      'WHERE'
      'user_id = :user_id')
    Left = 176
    Top = 208
    ParamData = <
      item
        Name = 'USER_ID'
        DataType = ftString
        ParamType = ptInput
        Value = '1'
      end>
  end
  object dsList: TDataSource
    DataSet = QNotifList
    Left = 288
    Top = 256
  end
  object cmdExec: TFDCommand
    Connection = UniMainModule.FDConnection1
    Left = 184
    Top = 280
  end
end
