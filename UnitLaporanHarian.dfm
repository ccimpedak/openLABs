object frmLaporanHarian: TfrmLaporanHarian
  Left = 0
  Top = 0
  ClientHeight = 160
  ClientWidth = 342
  Caption = 'Laporan Harian'
  BorderStyle = bsDialog
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  Font.Height = -16
  OnAfterShow = UniFormAfterShow
  PixelsPerInch = 96
  TextHeight = 19
  object UniLabel1: TUniLabel
    Left = 8
    Top = 16
    Width = 57
    Height = 19
    Hint = ''
    Caption = 'Tanggal'
    TabOrder = 0
  end
  object edTgl0: TUniEdit
    Left = 71
    Top = 16
    Width = 106
    Hint = ''
    Text = ''
    TabOrder = 1
  end
  object UniButton1: TUniButton
    Left = 8
    Top = 111
    Width = 105
    Height = 41
    Hint = ''
    Caption = 'Export'
    TabOrder = 2
    OnClick = UniButton1Click
  end
  object UniButton2: TUniButton
    Left = 119
    Top = 111
    Width = 106
    Height = 41
    Hint = ''
    Caption = 'View'
    TabOrder = 3
    OnClick = UniButton2Click
  end
  object UniButton3: TUniButton
    Left = 231
    Top = 111
    Width = 90
    Height = 41
    Hint = ''
    Caption = 'Batal'
    TabOrder = 4
    OnClick = UniButton3Click
  end
  object cbDgnTes: TUniCheckBox
    Left = 8
    Top = 64
    Width = 281
    Height = 17
    Hint = ''
    Caption = 'Dengan rincian pemeriksaan'
    TabOrder = 5
  end
  object UniLabel2: TUniLabel
    Left = 183
    Top = 16
    Width = 22
    Height = 19
    Hint = ''
    Caption = 's/d'
    TabOrder = 6
  end
  object edTgl1: TUniEdit
    Left = 211
    Top = 16
    Width = 110
    Hint = ''
    Text = ''
    TabOrder = 7
  end
  object qHarian: TFDQuery
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select distinct h.tanggal,h.nomor,p.nama,h.sub_total,'
      'if(pb.flg_first='#39'Y'#39',h.disc_amount,0) as disc_amount,'
      'u.nama as user_nama,pb.tanggal as tgl_bayar,'
      'tp.nama as tp_nama,pb.jumlah * tp.biaya_pct * 0.01 as charge,'
      'pb.jumlah - pb.jumlah * tp.biaya_pct * 0.01 as jumlah,'
      'if(pb.flg_first='#39'Y'#39',h.tagihan,0) as tagihan,'
      
        'if(left(h.tanggal,10)=left(pb.tanggal,10),'#39'Y'#39','#39'N'#39') as flg_same_d' +
        'ay,'
      'u.user_name,dt.nama as dokter_nama,'
      'if(left(h.tanggal,10)=left(:tanggal,10),'#39'Y'#39','#39'N'#39') as flg_sales'
      ',pb.flg_first,'
      
        'h.disc_amount, (pb.jumlah - pb.jumlah * tp.biaya_pct) - h.disc_a' +
        'mount netto,'
      
        'pb.jumlah bayar,(pb.jumlah - pb.jumlah * tp.biaya_pct) - h.disc_' +
        'amount - pb.jumlah piutang,'
      #39#39' tests,h.id header_id,pf.nama prefix'
      'From'
      'order_header h'
      'left join dokter dt on h.dokter_id = dt.id and h.flgBatal='#39'N'#39
      'left join pasien p on h.pasien_id = p.id'
      'left join prefix pf on p.prefix_id = pf.id'
      'left join pembayaran pb on h.id = pb.order_header_id'
      'and left(pb.tanggal,10) = left(:tanggal,10)'
      'join aguser u on pb.user_id = u.id'
      'join tipe_pembayaran tp on pb.tipe_bayar_id = tp.id'
      'order by h.nomor')
    Left = 224
    Top = 72
    ParamData = <
      item
        Name = 'TANGGAL'
        DataType = ftString
        ParamType = ptInput
        Value = '2019-06-18'
      end>
    object qHariantanggal: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'tanggal'
      Origin = 'tanggal'
    end
    object qHariannomor: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nomor'
      Origin = 'nomor'
      Size = 30
    end
    object qHariannama: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nama'
      Origin = 'nama'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object qHariansub_total: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'sub_total'
      Origin = 'sub_total'
      Precision = 12
      Size = 2
    end
    object qHariandisc_amount: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'disc_amount'
      Origin = 'disc_amount'
      ProviderFlags = []
      ReadOnly = True
      Precision = 12
      Size = 2
    end
    object qHarianuser_nama: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'user_nama'
      Origin = 'nama'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object qHariantgl_bayar: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'tgl_bayar'
      Origin = 'tanggal'
      ProviderFlags = []
      ReadOnly = True
    end
    object qHariantp_nama: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tp_nama'
      Origin = 'nama'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object qHariancharge: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'charge'
      Origin = 'charge'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 6
    end
    object qHarianjumlah: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'jumlah'
      Origin = 'jumlah'
      ProviderFlags = []
      ReadOnly = True
      Precision = 19
      Size = 6
    end
    object qHariantagihan: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'tagihan'
      Origin = 'tagihan'
      ProviderFlags = []
      ReadOnly = True
      Precision = 12
      Size = 2
    end
    object qHarianflg_same_day: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'flg_same_day'
      Origin = 'flg_same_day'
      ProviderFlags = []
      ReadOnly = True
      Size = 1
    end
    object qHarianuser_name: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'user_name'
      Origin = 'user_name'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
    object qHariandokter_nama: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'dokter_nama'
      Origin = 'nama'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object qHarianflg_sales: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'flg_sales'
      Origin = 'flg_sales'
      ProviderFlags = []
      ReadOnly = True
      Size = 1
    end
    object qHarianflg_first: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'flg_first'
      Origin = 'flg_first'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object qHariandisc_amount_1: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'disc_amount_1'
      Origin = 'disc_amount'
      Precision = 12
      Size = 2
    end
    object qHariannetto: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'netto'
      Origin = 'netto'
      ProviderFlags = []
      ReadOnly = True
      Precision = 17
    end
    object qHarianbayar: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'bayar'
      Origin = 'jumlah'
      ProviderFlags = []
      ReadOnly = True
      Precision = 12
      Size = 2
    end
    object qHarianpiutang: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'piutang'
      Origin = 'piutang'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
    end
    object qHariantests: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tests'
      Origin = 'tests'
      ProviderFlags = []
      ReadOnly = True
      Size = 1024
    end
    object qHarianheader_id: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'header_id'
      Origin = 'header_id'
      ProviderFlags = []
      ReadOnly = True
    end
    object qHarianprefix: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'prefix'
      Origin = 'nama'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
  end
  object frxDBDSHarian: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    FieldAliases.Strings = (
      'tanggal=tanggal'
      'nomor=nomor'
      'nama=nama'
      'sub_total=sub_total'
      'disc_amount=disc_amount'
      'user_nama=user_nama'
      'tgl_bayar=tgl_bayar'
      'tp_nama=tp_nama'
      'charge=charge'
      'jumlah=jumlah'
      'tagihan=tagihan'
      'flg_same_day=flg_same_day'
      'user_name=user_name'
      'dokter_nama=dokter_nama'
      'flg_sales=flg_sales'
      'flg_first=flg_first'
      'disc_amount_1=disc_amount_1'
      'netto=netto'
      'bayar=bayar'
      'piutang=piutang'
      'tests=tests'
      'header_id=header_id'
      'prefix=prefix')
    DataSet = qHarian
    BCDToCurrency = False
    Left = 264
    Top = 8
  end
  object frxPDFExport1: TfrxPDFExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    PrintOptimized = False
    Outline = False
    Background = False
    HTMLTags = True
    Quality = 95
    Author = 'FastReport'
    Subject = 'FastReport PDF export'
    ProtectionFlags = [ePrint, eModify, eCopy, eAnnot]
    HideToolbar = False
    HideMenubar = False
    HideWindowUI = False
    FitWindow = False
    CenterWindow = False
    PrintScaling = False
    Left = 184
    Top = 96
  end
  object frxXLSXExport1: TfrxXLSXExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    ChunkSize = 0
    PictureType = gpPNG
    Left = 224
    Top = 72
  end
  object qHarianDgnTes: TFDQuery
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select distinct h.tanggal,h.nomor,p.nama,h.sub_total,'
      'if(pb.flg_first='#39'Y'#39',h.disc_amount,0) as disc_amount,'
      'u.nama as user_nama,pb.tanggal as tgl_bayar,'
      'tp.nama as tp_nama,pb.jumlah * tp.biaya_pct * 0.01 as charge,'
      'pb.jumlah - pb.jumlah * tp.biaya_pct * 0.01 as jumlah,'
      'if(pb.flg_first='#39'Y'#39',h.tagihan,0) as tagihan,'
      
        'if(left(h.tanggal,10)=left(pb.tanggal,10),'#39'Y'#39','#39'N'#39') as flg_same_d' +
        'ay,'
      'u.user_name,dt.nama as dokter_nama,'
      'if(left(h.tanggal,10)=left(:tanggal,10),'#39'Y'#39','#39'N'#39') as flg_sales'
      ',pb.flg_first,'
      
        'h.disc_amount, (pb.jumlah - pb.jumlah * tp.biaya_pct) - h.disc_a' +
        'mount netto,'
      
        'pb.jumlah bayar,(pb.jumlah - pb.jumlah * tp.biaya_pct) - h.disc_' +
        'amount - pb.jumlah piutang,'
      'jns_tes.tests,jns_tes.header_id,pf.nama prefix'
      'From'
      'order_header h'
      'left join dokter dt on h.dokter_id = dt.id and h.flgBatal='#39'N'#39
      'left join pasien p on h.pasien_id = p.id'
      'left join prefix pf on p.prefix_id = pf.id'
      'left join pembayaran pb on h.id = pb.order_header_id'
      'and left(pb.tanggal,10) = left(:tanggal,10)'
      'join aguser u on pb.user_id = u.id'
      'join tipe_pembayaran tp on pb.tipe_bayar_id = tp.id'
      'join ('
      'select  header_id,group_concat(nama_test)  tests'
      'from'
      'order_detail'
      'where'
      'cetak_nota = '#39'Y'#39
      'group by header_id'
      ') jns_tes on h.id = jns_tes.header_id'
      'order by h.nomor')
    Left = 104
    Top = 64
    ParamData = <
      item
        Name = 'TANGGAL'
        DataType = ftString
        ParamType = ptInput
        Value = '2019-04-30'
      end>
    object DateTimeField1: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'tanggal'
      Origin = 'tanggal'
    end
    object StringField1: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nomor'
      Origin = 'nomor'
      Size = 30
    end
    object StringField2: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nama'
      Origin = 'nama'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object BCDField1: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'sub_total'
      Origin = 'sub_total'
      Precision = 12
      Size = 2
    end
    object BCDField2: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'disc_amount'
      Origin = 'disc_amount'
      ProviderFlags = []
      ReadOnly = True
      Precision = 12
      Size = 2
    end
    object StringField3: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'user_nama'
      Origin = 'nama'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object DateTimeField2: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'tgl_bayar'
      Origin = 'tanggal'
      ProviderFlags = []
      ReadOnly = True
    end
    object StringField4: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tp_nama'
      Origin = 'nama'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object FMTBCDField1: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'charge'
      Origin = 'charge'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 6
    end
    object FMTBCDField2: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'jumlah'
      Origin = 'jumlah'
      ProviderFlags = []
      ReadOnly = True
      Precision = 19
      Size = 6
    end
    object BCDField3: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'tagihan'
      Origin = 'tagihan'
      ProviderFlags = []
      ReadOnly = True
      Precision = 12
      Size = 2
    end
    object StringField5: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'flg_same_day'
      Origin = 'flg_same_day'
      ProviderFlags = []
      ReadOnly = True
      Size = 1
    end
    object StringField6: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'user_name'
      Origin = 'user_name'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
    object StringField7: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'dokter_nama'
      Origin = 'nama'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object StringField8: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'flg_sales'
      Origin = 'flg_sales'
      ProviderFlags = []
      ReadOnly = True
      Size = 1
    end
    object StringField9: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'flg_first'
      Origin = 'flg_first'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object BCDField4: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'disc_amount_1'
      Origin = 'disc_amount'
      Precision = 12
      Size = 2
    end
    object BCDField5: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'netto'
      Origin = 'netto'
      ProviderFlags = []
      ReadOnly = True
      Precision = 17
    end
    object BCDField6: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'bayar'
      Origin = 'jumlah'
      ProviderFlags = []
      ReadOnly = True
      Precision = 12
      Size = 2
    end
    object BCDField7: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'piutang'
      Origin = 'piutang'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
    end
    object StringField10: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tests'
      Origin = 'tests'
      ProviderFlags = []
      ReadOnly = True
      Size = 1024
    end
    object IntegerField1: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'header_id'
      Origin = 'header_id'
      ProviderFlags = []
      ReadOnly = True
    end
    object StringField11: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'prefix'
      Origin = 'nama'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
  end
  object frxReport1: TfrxReport
    Version = '5.2.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43541.751192314800000000
    ReportOptions.LastChange = 43634.417421631900000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 200
    Top = 104
    Datasets = <
      item
        DataSet = frxDBDSHarian
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <
      item
        Name = ' New Category1'
        Value = Null
      end
      item
        Name = 'tanggal'
        Value = Null
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 279.400000000000000000
      PaperHeight = 215.900000000000000000
      PaperSize = 1
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      BackPicturePrintable = False
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Height = 84.102350000000000000
        Top = 18.897650000000000000
        Width = 980.410082000000000000
        object Memo15: TfrxMemoView
          Left = 331.598640000000000000
          Top = 9.677180000000000000
          Width = 325.039580000000000000
          Height = 46.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            ''
            'LAPORAN PENDAPATAN HARIAN')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Left = 335.000000000000000000
          Top = 56.322820000000000000
          Width = 322.000000000000000000
          Height = 20.220470000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Tanggal : [tanggal]')
          ParentFont = False
        end
      end
      object Header1: TfrxHeader
        FillType = ftBrush
        Height = 18.897650000000000000
        Top = 162.519790000000000000
        Width = 980.410082000000000000
        object Memo1: TfrxMemoView
          Width = 30.236240000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'No.')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 30.236240000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Staff')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 90.708720000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Nomor Lab')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 253.228510000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Tanggal')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 355.275820000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Penjualan')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 642.520100000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Jenis Bayar')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 710.551640000000000000
          Width = 268.346630000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Dokter')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Left = 154.960730000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Nama Pasien')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Left = 427.086890000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Diskon')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 498.897960000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Netto')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          Left = 570.709030000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Piutang')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 18.897650000000000000
        Top = 204.094620000000000000
        Width = 980.410082000000000000
        DataSet = frxDBDSHarian
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        Stretched = True
        object frxDBDataset1nama: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 30.236240000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'user_nama'
          DataSet = frxDBDSHarian
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[frxDBDataset1."user_nama"]')
          ParentFont = False
        end
        object frxDBDataset1jumlah: TfrxMemoView
          Left = 90.708720000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'nomor'
          DataSet = frxDBDSHarian
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset1."nomor"]')
          ParentFont = False
        end
        object frxDBDataset1disc_amount: TfrxMemoView
          Left = 253.228510000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'tanggal'
          DataSet = frxDBDSHarian
          DataSetName = 'frxDBDataset1'
          DisplayFormat.FormatStr = 'dd.mm.yyyy hh:mm:ss'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[frxDBDataset1."tanggal"]')
          ParentFont = False
        end
        object frxDBDataset1tgl_bayar: TfrxMemoView
          Left = 355.275820000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'jumlah'
          DataSet = frxDBDSHarian
          DataSetName = 'frxDBDataset1'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset1."jumlah"]')
          ParentFont = False
        end
        object frxDBDataset1user_name: TfrxMemoView
          Left = 642.520100000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'tp_nama'
          DataSet = frxDBDSHarian
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[frxDBDataset1."tp_nama"]')
          ParentFont = False
        end
        object frxDBDataset1dokter_nama: TfrxMemoView
          Left = 710.551640000000000000
          Width = 268.346630000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'dokter_nama'
          DataSet = frxDBDSHarian
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[frxDBDataset1."dokter_nama"]')
          ParentFont = False
        end
        object Line: TfrxMemoView
          Width = 30.236240000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[Line#]')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 154.960730000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = frxDBDSHarian
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[frxDBDataset1."nama"], [frxDBDataset1."prefix"]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 427.086890000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'disc_amount'
          DataSet = frxDBDSHarian
          DataSetName = 'frxDBDataset1'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset1."disc_amount"]')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 498.897960000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'netto'
          DataSet = frxDBDSHarian
          DataSetName = 'frxDBDataset1'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset1."netto"]')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 570.709030000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'piutang'
          DataSet = frxDBDSHarian
          DataSetName = 'frxDBDataset1'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset1."piutang"]')
          ParentFont = False
        end
      end
      object ReportSummary1: TfrxReportSummary
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 283.464750000000000000
        Width = 980.410082000000000000
        object SysMemo1: TfrxSysMemoView
          Left = 355.275820000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frxDBDataset1."jumlah">,MasterData1)]')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 253.228510000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Total :')
          ParentFont = False
        end
        object SysMemo2: TfrxSysMemoView
          Left = 427.086890000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frxDBDataset1."disc_amount">,MasterData1)]')
          ParentFont = False
        end
        object SysMemo3: TfrxSysMemoView
          Left = 498.897960000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frxDBDataset1."netto">,MasterData1)]')
          ParentFont = False
        end
        object SysMemo4: TfrxSysMemoView
          Left = 570.709030000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frxDBDataset1."piutang">,MasterData1)]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 328.819110000000000000
        Width = 980.410082000000000000
        object SysMemo5: TfrxSysMemoView
          Left = 884.410020000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = [fsItalic]
          HAlign = haCenter
          Memo.UTF8W = (
            '[PAGE#] of [TOTALPAGES#]')
          ParentFont = False
        end
      end
    end
  end
  object repHarianDgnTes: TfrxReport
    Version = '5.2.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43541.751192314800000000
    ReportOptions.LastChange = 43634.427726701400000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 160
    Top = 64
    Datasets = <
      item
        DataSet = frxDBDSHarian
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <
      item
        Name = ' New Category1'
        Value = Null
      end
      item
        Name = 'tanggal'
        Value = Null
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 279.400000000000000000
      PaperHeight = 215.900000000000000000
      PaperSize = 1
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      BackPicturePrintable = False
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Height = 84.102350000000000000
        Top = 18.897650000000000000
        Width = 980.410082000000000000
        object Memo15: TfrxMemoView
          Left = 331.598640000000000000
          Top = 9.677180000000000000
          Width = 325.039580000000000000
          Height = 46.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'LAPORAN PENDAPATAN HARIAN'
            '( dengan rincian )')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Left = 335.000000000000000000
          Top = 56.322820000000000000
          Width = 322.000000000000000000
          Height = 20.220470000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Tanggal : [tanggal]')
          ParentFont = False
        end
      end
      object Header1: TfrxHeader
        FillType = ftBrush
        Height = 18.897650000000000000
        Top = 162.519790000000000000
        Width = 980.410082000000000000
        object Memo1: TfrxMemoView
          Width = 30.236240000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'No.')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 30.236240000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Staff')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 90.708720000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Nomor Lab')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 253.228510000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Tanggal')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 355.275820000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Penjualan')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 642.520100000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Jenis Bayar')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 857.953310000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Dokter')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 710.551640000000000000
          Width = 147.401670000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Jenis Test')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Left = 154.960730000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Nama Pasien')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Left = 427.086890000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Diskon')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 498.897960000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Netto')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          Left = 570.709030000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Piutang')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 18.897650000000000000
        Top = 204.094620000000000000
        Width = 980.410082000000000000
        DataSet = frxDBDSHarian
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        Stretched = True
        object frxDBDataset1nama: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 30.236240000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'user_nama'
          DataSet = frxDBDSHarian
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[frxDBDataset1."user_nama"]')
          ParentFont = False
        end
        object frxDBDataset1jumlah: TfrxMemoView
          Left = 90.708720000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'nomor'
          DataSet = frxDBDSHarian
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset1."nomor"]')
          ParentFont = False
        end
        object frxDBDataset1disc_amount: TfrxMemoView
          Left = 253.228510000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'tanggal'
          DataSet = frxDBDSHarian
          DataSetName = 'frxDBDataset1'
          DisplayFormat.FormatStr = 'dd.mm.yyyy hh:mm:ss'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[frxDBDataset1."tanggal"]')
          ParentFont = False
        end
        object frxDBDataset1tgl_bayar: TfrxMemoView
          Left = 355.275820000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'jumlah'
          DataSet = frxDBDSHarian
          DataSetName = 'frxDBDataset1'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset1."jumlah"]')
          ParentFont = False
        end
        object frxDBDataset1user_name: TfrxMemoView
          Left = 642.520100000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'tp_nama'
          DataSet = frxDBDSHarian
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[frxDBDataset1."tp_nama"]')
          ParentFont = False
        end
        object frxDBDataset1tp_nama: TfrxMemoView
          Left = 710.551640000000000000
          Width = 147.401670000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'tests'
          DataSet = frxDBDSHarian
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[frxDBDataset1."tests"]')
          ParentFont = False
        end
        object frxDBDataset1dokter_nama: TfrxMemoView
          Left = 857.953310000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'dokter_nama'
          DataSet = frxDBDSHarian
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[frxDBDataset1."dokter_nama"]')
          ParentFont = False
        end
        object Line: TfrxMemoView
          Width = 30.236240000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[Line#]')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 154.960730000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = frxDBDSHarian
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[frxDBDataset1."nama"], [frxDBDataset1."prefix"]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 427.086890000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'disc_amount'
          DataSet = frxDBDSHarian
          DataSetName = 'frxDBDataset1'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset1."disc_amount"]')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 498.897960000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'netto'
          DataSet = frxDBDSHarian
          DataSetName = 'frxDBDataset1'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset1."netto"]')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 570.709030000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'piutang'
          DataSet = frxDBDSHarian
          DataSetName = 'frxDBDataset1'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset1."piutang"]')
          ParentFont = False
        end
      end
      object ReportSummary1: TfrxReportSummary
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 283.464750000000000000
        Width = 980.410082000000000000
        object SysMemo1: TfrxSysMemoView
          Left = 355.275820000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frxDBDataset1."jumlah">,MasterData1)]')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 253.228510000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Total :')
          ParentFont = False
        end
        object SysMemo2: TfrxSysMemoView
          Left = 427.086890000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frxDBDataset1."disc_amount">,MasterData1)]')
          ParentFont = False
        end
        object SysMemo3: TfrxSysMemoView
          Left = 498.897960000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frxDBDataset1."netto">,MasterData1)]')
          ParentFont = False
        end
        object SysMemo4: TfrxSysMemoView
          Left = 570.709030000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frxDBDataset1."piutang">,MasterData1)]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 328.819110000000000000
        Width = 980.410082000000000000
        object SysMemo5: TfrxSysMemoView
          Left = 884.410020000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = [fsItalic]
          HAlign = haCenter
          Memo.UTF8W = (
            '[PAGE#] of [TOTALPAGES#]')
          ParentFont = False
        end
      end
    end
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    FieldAliases.Strings = (
      'tanggal=tanggal'
      'nomor=nomor'
      'nama=nama'
      'sub_total=sub_total'
      'disc_amount=disc_amount'
      'user_nama=user_nama'
      'tgl_bayar=tgl_bayar'
      'tp_nama=tp_nama'
      'charge=charge'
      'jumlah=jumlah'
      'tagihan=tagihan'
      'flg_same_day=flg_same_day'
      'user_name=user_name'
      'dokter_nama=dokter_nama'
      'flg_sales=flg_sales'
      'flg_first=flg_first'
      'disc_amount_1=disc_amount_1'
      'netto=netto'
      'bayar=bayar'
      'piutang=piutang'
      'tests=tests'
      'header_id=header_id'
      'prefix=prefix')
    DataSet = qHarianDgnTes
    BCDToCurrency = False
    Left = 200
    Top = 72
  end
end
