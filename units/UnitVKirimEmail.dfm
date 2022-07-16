object UniVKirimEmail: TUniVKirimEmail
  Left = 0
  Top = 0
  Width = 931
  Height = 676
  OnReady = UniFrameReady
  Font.Height = -13
  Font.Name = 'Roboto'
  TabOrder = 0
  ParentFont = False
  object pcHasil: TUniPageControl
    Left = 0
    Top = 0
    Width = 931
    Height = 676
    Hint = ''
    ActivePage = pgPending
    Align = alClient
    TabOrder = 0
    object pgPending: TUniTabSheet
      Hint = ''
      Caption = 'Pending'
      object UniContainerPanel1: TUniContainerPanel
        Left = 0
        Top = 604
        Width = 923
        Height = 42
        Hint = ''
        ParentColor = False
        Align = alBottom
        TabOrder = 0
        object btnKirim: TUniButton
          Left = 805
          Top = 6
          Width = 83
          Height = 33
          Hint = ''
          Visible = False
          Caption = 'Kirim'
          TabOrder = 1
        end
        object btnViewPending: TUniButton
          Left = 0
          Top = 0
          Width = 75
          Height = 42
          Hint = ''
          Caption = 'View'
          Align = alLeft
          TabOrder = 2
          OnClick = btnViewPendingClick
        end
      end
      object grdPending: TUniDBGrid
        Left = 0
        Top = 49
        Width = 923
        Height = 555
        Hint = ''
        ShowHint = True
        ParentShowHint = False
        DataSource = DSPending
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgMultiSelect]
        ReadOnly = True
        WebOptions.Paged = False
        WebOptions.FetchAll = True
        LoadMask.Message = 'Loading data...'
        Align = alClient
        Font.Height = -16
        Font.Name = 'Calibri'
        ParentFont = False
        TabOrder = 1
        OnBodyDblClick = grdPendingBodyDblClick
        OnCellClick = grdPendingCellClick
        Columns = <
          item
            FieldName = 'tanggal'
            Title.Caption = 'Tanggal'
            Title.Font.Height = -13
            Title.Font.Name = 'Calibri'
            Width = 93
            Font.Name = 'Calibri'
          end
          item
            FieldName = 'nomor'
            Title.Caption = 'Nomor'
            Title.Font.Height = -13
            Title.Font.Name = 'Calibri'
            Width = 89
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
            FieldName = 'email'
            Title.Caption = 'Email Penerima'
            Title.Font.Height = -13
            Title.Font.Name = 'Calibri'
            Width = 207
            Font.Name = 'Calibri'
          end
          item
            FieldName = 'res_status'
            Title.Caption = 'Status hasil'
            Width = 120
            Font.Name = 'Calibri'
          end>
      end
      object UniContainerPanel5: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 923
        Height = 49
        Hint = ''
        ParentColor = False
        Align = alTop
        TabOrder = 2
        object UniLabel1: TUniLabel
          Left = 13
          Top = 12
          Width = 51
          Height = 19
          Hint = ''
          Caption = 'Tanggal'
          ParentFont = False
          Font.Height = -16
          Font.Name = 'Calibri'
          TabOrder = 1
        end
        object dtPending: TUniDateTimePicker
          Left = 70
          Top = 15
          Width = 120
          Hint = ''
          DateTime = 43976.000000000000000000
          DateFormat = 'dd/MM/yyyy'
          TimeFormat = 'HH:mm:ss'
          TabOrder = 2
          OnChange = dtPendingChange
        end
        object UniButton1: TUniButton
          Left = 512
          Top = 10
          Width = 75
          Height = 25
          Hint = ''
          Caption = 'Refresh'
          ParentFont = False
          Font.Height = -16
          Font.Name = 'Calibri'
          TabOrder = 3
          OnClick = UniButton1Click
        end
      end
      object UniLabel2: TUniLabel
        Left = 232
        Top = 11
        Width = 67
        Height = 15
        Hint = ''
        Caption = 'Status hasil'
        TabOrder = 3
      end
      object cbStatusHasil: TUniComboBox
        Left = 305
        Top = 10
        Width = 160
        Height = 27
        Hint = ''
        Text = ''
        Items.Strings = (
          'Semua'
          'Dlm.Pengerjaan'
          'Dlm.Konfirmasi'
          'Ready.')
        ItemIndex = 0
        TabOrder = 4
        IconItems = <>
        OnChange = cbStatusHasilChange
      end
    end
    object pgGagal: TUniTabSheet
      Hint = ''
      Caption = 'Gagal'
      object UniDBGrid1: TUniDBGrid
        Left = 0
        Top = 0
        Width = 923
        Height = 610
        Hint = ''
        ShowHint = True
        ParentShowHint = False
        DataSource = DSGagal
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgMultiSelect]
        ReadOnly = True
        WebOptions.Paged = False
        WebOptions.FetchAll = True
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
        Top = 610
        Width = 923
        Height = 36
        Hint = ''
        ParentColor = False
        Align = alBottom
        TabOrder = 1
        object btnResetGagal: TUniButton
          Left = 840
          Top = 0
          Width = 83
          Height = 36
          Hint = ''
          Caption = 'Reset'
          Align = alRight
          TabOrder = 1
          OnClick = btnResetGagalClick
        end
        object btnViewGagal: TUniButton
          Left = 0
          Top = 0
          Width = 75
          Height = 36
          Hint = ''
          Caption = 'View'
          Align = alLeft
          TabOrder = 2
          OnClick = btnViewGagalClick
        end
        object UniButton3: TUniButton
          Left = 75
          Top = 0
          Width = 75
          Height = 36
          Hint = ''
          Caption = 'Refresh'
          Align = alLeft
          ParentFont = False
          Font.Height = -16
          Font.Name = 'Calibri'
          TabOrder = 3
          OnClick = UniButton1Click
        end
      end
    end
    object pgSukses: TUniTabSheet
      Hint = ''
      Caption = 'Sukses'
      object UniContainerPanel3: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 923
        Height = 43
        Hint = ''
        ParentColor = False
        Align = alTop
        TabOrder = 0
        object Tanggal: TUniLabel
          Left = 13
          Top = 12
          Width = 51
          Height = 19
          Hint = ''
          Caption = 'Tanggal'
          ParentFont = False
          Font.Height = -16
          Font.Name = 'Calibri'
          TabOrder = 1
        end
        object dtTgl: TUniDateTimePicker
          Left = 72
          Top = 10
          Width = 120
          Hint = ''
          DateTime = 43976.000000000000000000
          DateFormat = 'dd/MM/yyyy'
          TimeFormat = 'HH:mm:ss'
          TabOrder = 2
          ParentFont = False
          Font.Height = -16
          Font.Name = 'Calibri'
          OnChange = dtTglChange
        end
        object UniButton2: TUniButton
          Left = 198
          Top = 12
          Width = 75
          Height = 25
          Hint = ''
          Caption = 'Refresh'
          ParentFont = False
          Font.Height = -16
          Font.Name = 'Calibri'
          TabOrder = 3
          OnClick = UniButton1Click
        end
      end
      object UniContainerPanel4: TUniContainerPanel
        Left = 0
        Top = 604
        Width = 923
        Height = 42
        Hint = ''
        ParentColor = False
        Align = alBottom
        TabOrder = 1
        object btnViewSukses: TUniButton
          Left = 0
          Top = 0
          Width = 75
          Height = 42
          Hint = ''
          Caption = 'View'
          Align = alLeft
          TabOrder = 1
          OnClick = btnViewSuksesClick
        end
        object btnResetSukses: TUniButton
          Left = 840
          Top = 0
          Width = 83
          Height = 42
          Hint = ''
          Caption = 'Reset'
          Align = alRight
          TabOrder = 2
          OnClick = btnResetSuksesClick
        end
      end
      object UniDBGrid2: TUniDBGrid
        Left = 0
        Top = 43
        Width = 923
        Height = 561
        Hint = ''
        ShowHint = True
        ParentShowHint = False
        DataSource = dsSukses
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgMultiSelect]
        ReadOnly = True
        WebOptions.Paged = False
        WebOptions.FetchAll = True
        LoadMask.Message = 'Loading data...'
        Align = alClient
        Font.Height = -16
        Font.Name = 'Calibri'
        ParentFont = False
        TabOrder = 2
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
      
        'select date(left(order_header.tanggal,10)) tanggal,order_header.' +
        'nomor,'
      'pasien.noreg,concat(prefix.nama,'#39' '#39',pasien.nama) nama_pasien,'
      'order_pengiriman_hasil.`data` email,'
      'case when result_header.id is null then '#39'Dlm.Pengerjaan'#39
      'else result_header.ORDER_STATUS end as res_status,'
      'order_pengiriman_hasil.metode'
      'from'
      'order_pengiriman_hasil '
      
        'left join order_header on order_pengiriman_hasil.header_id = ord' +
        'er_header.id'
      'left join pasien on order_header.pasien_id = pasien.id'
      'left join prefix on pasien.prefix_id = prefix.id'
      'left join result_header on order_header.nomor = result_header.id'
      'where'
      
        '(order_pengiriman_hasil.metode = '#39'email'#39'  or order_pengiriman_ha' +
        'sil.metode = '#39'whatsapp'#39' )'
      'and left(order_header.tanggal,10) = :tanggal'
      
        'and ( IFNULL(result_header.ORDER_STATUS,'#39'Dlm.Pengerjaan'#39')  = :or' +
        'der_status or '#39'Semua'#39' = :order_status )'
      
        'and order_header.nomor not in ( select nomor from kirim_hasil  w' +
        'here status > 0)'
      'order by order_header.nomor desc')
    Left = 280
    Top = 32
    ParamData = <
      item
        Name = 'TANGGAL'
        DataType = ftString
        ParamType = ptInput
        Value = '0'
      end
      item
        Name = 'ORDER_STATUS'
        DataType = ftString
        ParamType = ptInput
        Value = '0'
      end>
  end
  object QParam: TFDQuery
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select *'
      'from'
      'parameters'
      'where'
      'name = :name')
    Left = 240
    Top = 65528
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
      'select * from kirim_hasil where id = :id')
    Left = 648
    ParamData = <
      item
        Name = 'ID'
        DataType = ftString
        ParamType = ptInput
        Value = '0'
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
  object cmdKirim: TFDCommand
    Connection = UniMainModule.FDConnection1
    CommandText.Strings = (
      
        'insert into kirim_hasil (tanggal,nomor,noreg,nama_pasien,mail_re' +
        'ceipt,mail_subject,mail_body,mail_file_pdf)'
      
        'values (now(),:nomor,:noreg,:nama_pasien,:mail_receipt,:mail_sub' +
        'ject,:mail_body,:mail_file_pdf)')
    ParamData = <
      item
        Name = 'NOMOR'
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'NOREG'
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'NAMA_PASIEN'
        ParamType = ptInput
      end
      item
        Name = 'MAIL_RECEIPT'
        ParamType = ptInput
      end
      item
        Name = 'MAIL_SUBJECT'
        ParamType = ptInput
      end
      item
        Name = 'MAIL_BODY'
        ParamType = ptInput
      end
      item
        Name = 'MAIL_FILE_PDF'
        ParamType = ptInput
      end>
    Left = 404
    Top = 462
  end
  object QKirimTmp: TFDQuery
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select * from kirim_hasil where nomor = :nomor')
    Left = 460
    Top = 462
    ParamData = <
      item
        Name = 'NOMOR'
        DataType = ftString
        ParamType = ptInput
        Value = '123'
      end>
  end
end
