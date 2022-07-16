object frmSysLog: TfrmSysLog
  Left = 0
  Top = 0
  ClientHeight = 126
  ClientWidth = 295
  Caption = 'Syslog'
  BorderStyle = bsDialog
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  Font.Height = -16
  PixelsPerInch = 96
  TextHeight = 19
  object UniLabel1: TUniLabel
    Left = 24
    Top = 24
    Width = 55
    Height = 19
    Hint = ''
    Caption = 'No. Lab'
    TabOrder = 0
  end
  object edNomor: TUniEdit
    Left = 96
    Top = 24
    Width = 185
    Hint = ''
    Text = ''
    TabOrder = 1
  end
  object UniButton1: TUniButton
    Left = 109
    Top = 72
    Width = 83
    Height = 41
    Hint = ''
    Caption = 'View'
    TabOrder = 2
    Default = True
    OnClick = UniButton1Click
  end
  object UniButton2: TUniButton
    Left = 198
    Top = 72
    Width = 83
    Height = 41
    Hint = ''
    Caption = 'Batal'
    TabOrder = 3
    Default = True
    OnClick = UniButton2Click
  end
  object frxSyslog: TfrxReport
    Version = '5.2.3'
    DotMatrixReport = False
    EngineOptions.DoublePass = True
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43541.105095486100000000
    ReportOptions.LastChange = 43607.954139386600000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'procedure ReportSummary1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      
        '  //Engine.CurY := Engine.CurY + Engine.FreeSpace - ReportSummar' +
        'y1.Height - 1;                                                  ' +
        '                                                                ' +
        '                                                   '
      'end;'
      ''
      'begin'
      ''
      'end.')
    Left = 16
    Top = 72
    Datasets = <
      item
        DataSet = frxDBDataset2
        DataSetName = 'frxDBDataset2'
      end>
    Variables = <
      item
        Name = ' New Category1'
        Value = Null
      end
      item
        Name = 'terbilang'
        Value = Null
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 148.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 11
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Height = 41.574830000000000000
        Top = 18.897650000000000000
        Width = 559.370440000000000000
        object Memo1: TfrxMemoView
          Width = 555.590910000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'SysLog Report')
          ParentFont = False
        end
      end
      object Header1: TfrxHeader
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 120.944960000000000000
        Width = 559.370440000000000000
        Stretched = True
        object Memo2: TfrxMemoView
          Left = 7.559060000000000000
          Width = 26.456710000000000000
          Height = 18.897637800000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clScrollBar
          HAlign = haCenter
          Memo.UTF8W = (
            'NO')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          Left = 34.015770000000000000
          Width = 68.031540000000000000
          Height = 18.897637800000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clScrollBar
          HAlign = haCenter
          Memo.UTF8W = (
            'USER')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          Left = 102.047310000000000000
          Width = 68.031540000000000000
          Height = 18.897637800000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clScrollBar
          HAlign = haCenter
          Memo.UTF8W = (
            'NOLAB')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Left = 170.078850000000000000
          Width = 102.047310000000000000
          Height = 18.897637800000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clScrollBar
          HAlign = haCenter
          Memo.UTF8W = (
            'TANGGAL')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 272.126160000000000000
          Width = 279.685220000000000000
          Height = 18.897637800000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clScrollBar
          HAlign = haCenter
          Memo.UTF8W = (
            'KETERANGAN')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 166.299320000000000000
        Width = 559.370440000000000000
        DataSet = frxDBDataset2
        DataSetName = 'frxDBDataset2'
        RowCount = 0
        Stretched = True
        object SysMemo1: TfrxSysMemoView
          Left = 7.559060000000000000
          Width = 26.456710000000000000
          Height = 18.897637795275600000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[LINE#]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBDataset2user_name: TfrxMemoView
          Left = 34.015770000000000000
          Width = 68.031540000000000000
          Height = 18.897637795275600000
          StretchMode = smMaxHeight
          DataField = 'user_name'
          DataSet = frxDBDataset2
          DataSetName = 'frxDBDataset2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset2."user_name"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Left = 102.047310000000000000
          Width = 68.031540000000000000
          Height = 18.897637800000000000
          StretchMode = smMaxHeight
          DataField = 'nomor'
          DataSet = frxDBDataset2
          DataSetName = 'frxDBDataset2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset2."nomor"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 170.078850000000000000
          Width = 102.047310000000000000
          Height = 18.897637800000000000
          StretchMode = smMaxHeight
          DataField = 'tanggal'
          DataSet = frxDBDataset2
          DataSetName = 'frxDBDataset2'
          DisplayFormat.FormatStr = 'dd-mm-yyyy hh:mm:ss'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset2."tanggal"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 272.126160000000000000
          Width = 279.685220000000000000
          Height = 18.897637800000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            
              '<[<frxDBDataset2."status_nama">]>  [<frxDBDataset2."keterangan">' +
              ']')
          ParentFont = False
          VAlign = vaCenter
          Formats = <
            item
            end
            item
            end>
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 249.448980000000000000
        Width = 559.370440000000000000
        object SysMemo2: TfrxSysMemoView
          Left = 291.023810000000000000
          Width = 260.787570000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsItalic]
          HAlign = haRight
          Memo.UTF8W = (
            '[PAGE#] of [TOTALPAGES#]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
  end
  object qSyslog: TFDQuery
    Active = True
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      
        'select h.nomor,u.user_name,s.tanggal,s.keterangan, st.nama as st' +
        'atus_nama '
      'from order_status_time s '
      
        'join order_header h on s.order_header_id= h.id and h.nomor like ' +
        ':nomor'
      'join aguser u on s.user_id = u.id '
      'left join order_status st on s.order_status_id = st.id '
      'order by h.nomor, s.tanggal')
    Left = 88
    Top = 46
    ParamData = <
      item
        Name = 'NOMOR'
        DataType = ftString
        ParamType = ptInput
        Value = '190519020'
      end>
  end
  object frxDBDataset2: TfrxDBDataset
    UserName = 'frxDBDataset2'
    CloseDataSource = False
    FieldAliases.Strings = (
      'nomor=nomor'
      'user_name=user_name'
      'tanggal=tanggal'
      'keterangan=keterangan'
      'status_nama=status_nama')
    DataSet = qSyslog
    BCDToCurrency = False
    Left = 48
    Top = 70
  end
  object frxPDFExport1: TfrxPDFExport
    ExportNotPrintable = True
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    EmbeddedFonts = True
    PrintOptimized = True
    Outline = False
    Background = True
    HTMLTags = True
    Quality = 95
    Author = 'FastReport'
    Subject = 'FastReport PDF export'
    ProtectionFlags = [ePrint, eModify, eCopy, eAnnot]
    HideToolbar = True
    HideMenubar = True
    HideWindowUI = True
    FitWindow = True
    CenterWindow = True
    PrintScaling = True
    Left = 128
    Top = 46
  end
end
