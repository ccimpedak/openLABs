object frmElektronikHasil: TfrmElektronikHasil
  Left = 0
  Top = 0
  ClientHeight = 506
  ClientWidth = 810
  Caption = 'Hasil Elektronik'
  BorderStyle = bsDialog
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  Font.Height = -16
  Font.Name = 'Calibri'
  OnBeforeShow = UniFormBeforeShow
  OnAfterShow = UniFormAfterShow
  PixelsPerInch = 96
  TextHeight = 19
  object pcHasil: TUniPageControl
    Left = 0
    Top = 0
    Width = 810
    Height = 506
    Hint = ''
    ActivePage = pgPending
    Align = alClient
    TabOrder = 0
    object pgPending: TUniTabSheet
      Hint = ''
      Caption = 'Pending'
      object UniContainerPanel1: TUniContainerPanel
        Left = 0
        Top = 424
        Width = 802
        Height = 48
        Hint = ''
        ParentColor = False
        Align = alBottom
        TabOrder = 0
        object btnKirim: TUniButton
          Left = 716
          Top = 12
          Width = 83
          Height = 33
          Hint = ''
          Visible = False
          Caption = 'Kirim'
          TabOrder = 1
          OnClick = btnKirimClick
        end
        object btnViewPending: TUniButton
          Left = 5
          Top = 9
          Width = 75
          Height = 33
          Hint = ''
          Caption = 'View'
          TabOrder = 2
          OnClick = btnViewPendingClick
        end
      end
      object grdPending: TUniDBGrid
        Left = 0
        Top = 0
        Width = 802
        Height = 424
        Hint = ''
        ShowHint = True
        ParentShowHint = False
        DataSource = DSPending
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgMultiSelect]
        ReadOnly = True
        LoadMask.Message = 'Loading data...'
        Align = alClient
        Font.Height = -16
        Font.Name = 'Calibri'
        ParentFont = False
        TabOrder = 1
        OnBodyDblClick = btnViewPendingClick
        Columns = <
          item
            FieldName = 'tanggal'
            Title.Caption = 'Tanggal'
            Title.Font.Height = -13
            Title.Font.Name = 'Calibri'
            Width = 97
            Font.Name = 'Calibri'
          end
          item
            FieldName = 'nomor'
            Title.Caption = 'Nomor'
            Title.Font.Height = -13
            Title.Font.Name = 'Calibri'
            Width = 124
            Font.Name = 'Calibri'
          end
          item
            FieldName = 'noreg'
            Title.Caption = 'No.Reg'
            Title.Font.Height = -13
            Title.Font.Name = 'Calibri'
            Width = 133
            Font.Name = 'Calibri'
          end
          item
            FieldName = 'nama_pasien'
            Title.Caption = 'Nama Pasien'
            Title.Font.Height = -13
            Title.Font.Name = 'Calibri'
            Width = 211
            Font.Name = 'Calibri'
          end
          item
            FieldName = 'mail_receipt'
            Title.Caption = 'Email Penerima'
            Title.Font.Height = -13
            Title.Font.Name = 'Calibri'
            Width = 207
            Font.Name = 'Calibri'
          end>
      end
    end
    object pgGagal: TUniTabSheet
      Hint = ''
      Caption = 'Gagal'
      object UniDBGrid1: TUniDBGrid
        Left = 0
        Top = 0
        Width = 802
        Height = 424
        Hint = ''
        ShowHint = True
        ParentShowHint = False
        DataSource = DSGagal
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgMultiSelect]
        ReadOnly = True
        LoadMask.Message = 'Loading data...'
        Align = alClient
        Font.Height = -16
        Font.Name = 'Calibri'
        ParentFont = False
        TabOrder = 0
        OnBodyDblClick = btnViewGagalClick
        Columns = <
          item
            FieldName = 'tanggal'
            Title.Caption = 'Tanggal'
            Title.Font.Height = -13
            Title.Font.Name = 'Calibri'
            Width = 97
            Font.Name = 'Calibri'
          end
          item
            FieldName = 'nomor'
            Title.Caption = 'Nomor'
            Title.Font.Height = -13
            Title.Font.Name = 'Calibri'
            Width = 124
            Font.Name = 'Calibri'
          end
          item
            FieldName = 'noreg'
            Title.Caption = 'No.Reg'
            Title.Font.Height = -13
            Title.Font.Name = 'Calibri'
            Width = 133
            Font.Name = 'Calibri'
          end
          item
            FieldName = 'nama_pasien'
            Title.Caption = 'Nama Pasien'
            Title.Font.Height = -13
            Title.Font.Name = 'Calibri'
            Width = 211
            Font.Name = 'Calibri'
          end
          item
            FieldName = 'mail_receipt'
            Title.Caption = 'Email Penerima'
            Title.Font.Height = -13
            Title.Font.Name = 'Calibri'
            Width = 207
            Font.Name = 'Calibri'
          end>
      end
      object UniContainerPanel2: TUniContainerPanel
        Left = 0
        Top = 424
        Width = 802
        Height = 48
        Hint = ''
        ParentColor = False
        Align = alBottom
        TabOrder = 1
        object btnResetGagal: TUniButton
          Left = 716
          Top = 9
          Width = 83
          Height = 33
          Hint = ''
          Caption = 'Reset'
          TabOrder = 1
          OnClick = btnResetGagalClick
        end
        object btnViewGagal: TUniButton
          Left = 3
          Top = 6
          Width = 75
          Height = 33
          Hint = ''
          Caption = 'View'
          TabOrder = 2
          OnClick = btnViewGagalClick
        end
      end
    end
    object pgSukses: TUniTabSheet
      Hint = ''
      Caption = 'Sukses'
      object UniContainerPanel3: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 802
        Height = 43
        Hint = ''
        ParentColor = False
        Align = alTop
        TabOrder = 0
        object Tanggal: TUniLabel
          Left = 13
          Top = 12
          Width = 38
          Height = 13
          Hint = ''
          Caption = 'Tanggal'
          TabOrder = 1
        end
        object dtTgl: TUniDateTimePicker
          Left = 72
          Top = 11
          Width = 120
          Hint = ''
          DateTime = 43976.000000000000000000
          DateFormat = 'dd/MM/yyyy'
          TimeFormat = 'HH:mm:ss'
          TabOrder = 2
          OnChange = dtTglChange
        end
      end
      object UniContainerPanel4: TUniContainerPanel
        Left = 0
        Top = 430
        Width = 802
        Height = 42
        Hint = ''
        ParentColor = False
        Align = alBottom
        TabOrder = 1
        object btnViewSukses: TUniButton
          Left = 5
          Top = 3
          Width = 75
          Height = 33
          Hint = ''
          Caption = 'View'
          TabOrder = 1
          OnClick = btnViewSuksesClick
        end
        object btnResetSukses: TUniButton
          Left = 716
          Top = 5
          Width = 83
          Height = 33
          Hint = ''
          Caption = 'Reset'
          TabOrder = 2
          OnClick = btnResetGagalClick
        end
      end
      object UniDBGrid2: TUniDBGrid
        Left = 0
        Top = 43
        Width = 802
        Height = 387
        Hint = ''
        ShowHint = True
        ParentShowHint = False
        DataSource = dsSukses
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgMultiSelect]
        ReadOnly = True
        LoadMask.Message = 'Loading data...'
        Align = alClient
        Font.Height = -16
        Font.Name = 'Calibri'
        ParentFont = False
        TabOrder = 2
        OnBodyDblClick = btnViewSuksesClick
        Columns = <
          item
            FieldName = 'tanggal'
            Title.Caption = 'Tanggal'
            Title.Font.Height = -13
            Title.Font.Name = 'Calibri'
            Width = 97
            Font.Name = 'Calibri'
          end
          item
            FieldName = 'nomor'
            Title.Caption = 'Nomor'
            Title.Font.Height = -13
            Title.Font.Name = 'Calibri'
            Width = 124
            Font.Name = 'Calibri'
          end
          item
            FieldName = 'noreg'
            Title.Caption = 'No.Reg'
            Title.Font.Height = -13
            Title.Font.Name = 'Calibri'
            Width = 133
            Font.Name = 'Calibri'
          end
          item
            FieldName = 'nama_pasien'
            Title.Caption = 'Nama Pasien'
            Title.Font.Height = -13
            Title.Font.Name = 'Calibri'
            Width = 211
            Font.Name = 'Calibri'
          end
          item
            FieldName = 'mail_receipt'
            Title.Caption = 'Email Penerima'
            Title.Font.Height = -13
            Title.Font.Name = 'Calibri'
            Width = 207
            Font.Name = 'Calibri'
          end>
      end
    end
  end
  object DSPending: TDataSource
    DataSet = QPending
    Left = 308
  end
  object QPending: TFDQuery
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select * '
      'from'
      'kirim_hasil'
      'where'
      'status = 0')
    Left = 272
  end
  object QParam: TFDQuery
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select *'
      'from'
      'parameters'
      'where'
      'name = :name')
    Left = 216
    ParamData = <
      item
        Name = 'NAME'
        DataType = ftString
        ParamType = ptInput
        Value = ''
      end>
  end
  object QKirim: TFDQuery
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select * from kirim_hasil where nomor = :nomor')
    Left = 648
    ParamData = <
      item
        Name = 'NOMOR'
        ParamType = ptInput
        Value = Null
      end>
  end
  object cmd: TFDCommand
    Connection = UniMainModule.FDConnection1
    Left = 688
  end
  object QGagal: TFDQuery
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select * '
      'from'
      'kirim_hasil'
      'where'
      'status = 9')
    Left = 364
    Top = 65534
  end
  object DSGagal: TDataSource
    DataSet = QGagal
    Left = 400
  end
  object QSukses: TFDQuery
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select * '
      'from'
      'kirim_hasil'
      'where'
      'status = 1'
      'and tanggal = :tanggal')
    Left = 472
    Top = 8
    ParamData = <
      item
        Name = 'TANGGAL'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end>
  end
  object dsSukses: TDataSource
    DataSet = QSukses
    Left = 512
    Top = 8
  end
end
