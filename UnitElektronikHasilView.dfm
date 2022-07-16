object frmElektronikHasilView: TfrmElektronikHasilView
  Left = 0
  Top = 0
  ClientHeight = 425
  ClientWidth = 733
  Caption = 'Detail Hasil Elektronik'
  BorderStyle = bsDialog
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  Font.Height = -16
  Font.Name = 'Calibri'
  OnBeforeShow = UniFormBeforeShow
  PixelsPerInch = 96
  TextHeight = 19
  object UniContainerPanel1: TUniContainerPanel
    Left = 0
    Top = 385
    Width = 733
    Height = 40
    Hint = ''
    ParentColor = False
    Align = alBottom
    TabOrder = 0
    object UniButton1: TUniButton
      Left = 648
      Top = 4
      Width = 75
      Height = 33
      Hint = ''
      Caption = 'Close'
      ParentFont = False
      Font.Height = -16
      Font.Name = 'Calibri'
      TabOrder = 1
      Default = True
      OnClick = UniButton1Click
    end
    object btnKirim: TUniButton
      Left = 567
      Top = 4
      Width = 75
      Height = 33
      Hint = ''
      Caption = 'Kirim'
      ParentFont = False
      Font.Height = -16
      Font.Name = 'Calibri'
      TabOrder = 2
      Default = True
      OnClick = btnKirimClick
    end
    object btnSimpan: TUniButton
      Left = 486
      Top = 4
      Width = 75
      Height = 33
      Hint = ''
      Enabled = False
      Caption = 'Simpan'
      ParentFont = False
      Font.Height = -16
      Font.Name = 'Calibri'
      TabOrder = 3
      Default = True
      OnClick = btnSimpanClick
    end
  end
  object pcDetailsData: TUniPageControl
    Left = 0
    Top = 0
    Width = 733
    Height = 385
    Hint = ''
    ActivePage = utDetails
    Align = alClient
    TabOrder = 1
    object utDetails: TUniTabSheet
      Hint = ''
      Caption = 'Details'
      object UniLabel1: TUniLabel
        Left = 16
        Top = 16
        Width = 47
        Height = 19
        Hint = ''
        Caption = 'Subject'
        TabOrder = 0
      end
      object UniLabel2: TUniLabel
        Left = 16
        Top = 41
        Width = 49
        Height = 19
        Hint = ''
        Caption = 'Receipt'
        TabOrder = 1
      end
      object UniLabel3: TUniLabel
        Left = 16
        Top = 69
        Width = 59
        Height = 19
        Hint = ''
        Caption = 'Message'
        TabOrder = 2
      end
      object UniLabel4: TUniLabel
        Left = 3
        Top = 293
        Width = 75
        Height = 19
        Hint = ''
        Caption = 'Attachment'
        TabOrder = 3
      end
      object edReceipt: TUniEdit
        Left = 88
        Top = 44
        Width = 601
        Hint = ''
        Text = ''
        TabOrder = 4
        OnChangeValue = edReceiptChangeValue
      end
      object edSubject: TUniEdit
        Left = 88
        Top = 16
        Width = 601
        Hint = ''
        Text = 'edSubject'
        TabOrder = 5
        OnChange = edSubjectChange
        OnChangeValue = edSubjectChangeValue
      end
      object pnlAttachment: TUniPanel
        Left = 88
        Top = 289
        Width = 601
        Height = 32
        Cursor = crHandPoint
        Hint = ''
        ParentFont = False
        Font.Height = -16
        Font.Name = 'Calibri'
        Font.Style = [fsItalic, fsUnderline]
        TabOrder = 6
        Alignment = taLeftJustify
        Caption = 'pnlAttachment'
        OnClick = pnlAttachmentClick
      end
      object UniLabel5: TUniLabel
        Left = 3
        Top = 324
        Width = 62
        Height = 19
        Hint = ''
        Caption = 'Password'
        TabOrder = 7
      end
      object lblPass: TUniLabel
        Left = 88
        Top = 324
        Width = 62
        Height = 19
        Hint = ''
        Caption = 'Password'
        TabOrder = 8
      end
      object mmMessage: TUniHTMLMemo
        Left = 88
        Top = 72
        Width = 601
        Height = 211
        Hint = ''
        Lines.Strings = (
          'mmMessage')
        Color = clWindow
        TabOrder = 9
      end
    end
    object utLog: TUniTabSheet
      Hint = ''
      Caption = 'Log'
      object UniDBGrid1: TUniDBGrid
        Left = 0
        Top = 0
        Width = 725
        Height = 351
        Hint = ''
        DataSource = dsLog
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgAutoRefreshRow]
        LoadMask.Message = 'Loading data...'
        Align = alClient
        TabOrder = 0
        Columns = <
          item
            FieldName = 'status'
            Title.Caption = 'Status'
            Title.Font.Height = -13
            Title.Font.Name = 'Calibri'
            Width = 64
            Font.Name = 'Calibri'
          end
          item
            FieldName = 'deskripsi'
            Title.Caption = 'Deskripsi'
            Title.Font.Height = -13
            Title.Font.Name = 'Calibri'
            Width = 394
            Font.Name = 'Calibri'
            DisplayMemo = True
          end
          item
            FieldName = 'audit_date'
            Title.Caption = 'Audit date'
            Title.Font.Height = -13
            Title.Font.Name = 'Calibri'
            Width = 138
            Font.Name = 'Calibri'
          end
          item
            FieldName = 'user_name'
            Title.Caption = 'Audit user'
            Title.Font.Height = -13
            Title.Font.Name = 'Calibri'
            Width = 103
            Font.Name = 'Calibri'
          end>
      end
    end
  end
  object QDetails: TFDQuery
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      
        'select SUBSTRING_INDEX(h.mail_file_pdf, '#39'\\'#39', -1) mail_file_name' +
        ','
      
        'h.id,h.tanggal,h.nomor,h.nama_pasien,ifnull(p.email,h.mail_recei' +
        'pt) mail_receipt,h.mail_subject,h.mail_body,'
      'p.tanggal_lahir,'
      'DATE_FORMAT(p.tanggal_lahir,'#39'%d%m%y'#39') password_pdf,'
      'h.status, h.mail_file_pdf,p.email'
      'from'
      'kirim_hasil h'
      'left join order_header oh on h.nomor = oh.nomor'
      'left join pasien p on oh.pasien_id = p.id'
      'where h.nomor = :nomor')
    Left = 584
    Top = 336
    ParamData = <
      item
        Name = 'NOMOR'
        DataType = ftString
        ParamType = ptInput
        Value = '1'
      end>
  end
  object dsLog: TDataSource
    DataSet = QLog
    Left = 672
    Top = 336
  end
  object QLog: TFDQuery
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select kirim_hasil_log.id,'
      'case  '
      'when kirim_hasil_log.status = 0 then '#39'Pending'#39
      'when kirim_hasil_log.status = 1 then '#39'Sukses'#39
      'when kirim_hasil_log.status = 9 then '#39'Gagal'#39
      'else '#39'-'#39
      'end as status,'
      'kirim_hasil_log.nomor,'
      'kirim_hasil_log.deskripsi,'
      'kirim_hasil_log.audit_date,'
      'aguser.user_name'
      'from'
      'kirim_hasil_log '
      
        'left join aguser aguser on kirim_hasil_log.audit_user = aguser.i' +
        'd '
      'where'
      'kirim_hasil_log.nomor =:nomor'
      'order by kirim_hasil_log.id ')
    Left = 624
    Top = 336
    ParamData = <
      item
        Name = 'NOMOR'
        DataType = ftString
        ParamType = ptInput
        Value = '123'
      end>
  end
  object cmdSimpan: TFDCommand
    Connection = UniMainModule.FDConnection1
    Left = 536
    Top = 336
  end
  object QParam: TFDQuery
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select *'
      'from'
      'parameters'
      'where'
      'name = :name')
    Left = 464
    Top = 344
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
    Left = 344
    Top = 360
    ParamData = <
      item
        Name = 'NOMOR'
        ParamType = ptInput
        Value = Null
      end>
  end
  object cmd: TFDCommand
    Connection = UniMainModule.FDConnection1
    Left = 384
    Top = 360
  end
end
