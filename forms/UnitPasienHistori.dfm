object frmPasienHistori: TfrmPasienHistori
  Left = 0
  Top = 0
  ClientHeight = 508
  ClientWidth = 1056
  Caption = 'Pasien Histori'
  BorderStyle = bsDialog
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  Font.Height = -13
  Font.Name = 'Roboto'
  OnBeforeShow = UniFormBeforeShow
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 15
  object UniContainerPanel1: TUniContainerPanel
    Left = 0
    Top = 0
    Width = 1056
    Height = 465
    Hint = ''
    ParentColor = False
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 888
    object strGrd: TUniStringGrid
      Left = 0
      Top = 0
      Width = 1056
      Height = 465
      Hint = ''
      ShowHint = True
      ParentShowHint = False
      FixedCols = 4
      Options = [goVertLine, goHorzLine, goRowSelect]
      LockFixedCols = True
      Columns = <>
      OnDrawCell = strGrdDrawCell
      OnSelectCell = strGrdSelectCell
      OnDblClick = strGrdClick
      OnClick = strGrdClick
      Align = alClient
      TabOrder = 1
      ExplicitLeft = -680
      ExplicitTop = 152
    end
  end
  object UniContainerPanel2: TUniContainerPanel
    Left = 0
    Top = 465
    Width = 1056
    Height = 43
    Hint = ''
    ParentColor = False
    Align = alBottom
    TabOrder = 1
    ExplicitWidth = 888
    object UniButton1: TUniButton
      Left = 956
      Top = 3
      Width = 97
      Height = 30
      Hint = ''
      Caption = 'Tutup'
      TabOrder = 1
      OnClick = UniButton1Click
    end
    object btnEnvChart: TUniSpeedButton
      Left = 504
      Top = 6
      Width = 153
      Height = 30
      Hint = ''
      Enabled = False
      Caption = 'Evol. chart'
      ParentColor = False
      Color = clWindow
      TabOrder = 2
      OnClick = btnEnvChartClick
    end
    object UniLabel1: TUniLabel
      Left = 16
      Top = 16
      Width = 470
      Height = 15
      Hint = ''
      Caption = 
        'Hasil yang valid adalah hasil yang sudah di tanda tangani oleh p' +
        'etugas laboratorium'
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Roboto'
      Font.Style = [fsItalic]
      TabOrder = 3
    end
    object UniButton2: TUniButton
      Left = 776
      Top = 6
      Width = 75
      Height = 25
      Hint = ''
      Visible = False
      Caption = 'UniButton2'
      TabOrder = 4
      OnClick = UniButton2Click
    end
  end
  object QHistori: TFDQuery
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      
        'select result_detail.id,result_detail.test_nm,result_detail.disp' +
        '_seq,result_detail.test_nm,result_detail.result_value,result_det' +
        'ail.flag,result_detail.test_comment,'
      
        'result_detail.unit,result_detail.ref_range,grup.nama,IFNULL(test' +
        '_urut.show_order,result_detail.DISP_SEQ) show_order'
      'from'
      'result_detail'
      'left join test_grup on result_detail.DISP_SEQ = test_grup.kode'
      'left join grup on test_grup.grup_id = grup.id'
      'left join test_urut on test_grup.kode = test_urut.kode'
      'where'
      'result_detail.id in ('
      'select nomor'
      'from'
      'order_header'
      'where'
      'pasien_id = :pasien_id'
      ')'
      
        'order by result_detail.id,IFNULL(test_urut.show_order,result_det' +
        'ail.DISP_SEQ)')
    Left = 560
    Top = 384
    ParamData = <
      item
        Name = 'PASIEN_ID'
        ParamType = ptInput
        Value = Null
      end>
  end
  object DSHistori: TDataSource
    DataSet = QHistori
    Left = 608
    Top = 384
  end
  object QData: TFDQuery
    Connection = UniMainModule.FDConnection1
    FetchOptions.AssignedValues = [evRowsetSize]
    FetchOptions.RowsetSize = 1000
    SQL.Strings = (
      
        'SELECT result_detail.id,result_detail.test_nm,result_detail.disp' +
        '_seq,result_detail.test_nm, CASE WHEN ('
      'SELECT COUNT(*)'
      'FROM'
      'user_profile_rights'
      'WHERE'
      
        'value = '#39'ROLE_VIEW_CONFIDENTIAL_RESULT'#39' AND user_profile_id = :u' +
        'ser_profile_id ) AND test.flg_confidential > 0 THEN '#39'*****'#39' ELSE' +
        ' result_detail.result_value END AS result_value,'
      'result_detail.flag,result_detail.test_comment,'
      
        'result_detail.unit,result_detail.ref_range,grup.nama, IFNULL(tes' +
        't_urut.show_order,result_detail.DISP_SEQ) show_order'
      'FROM'
      'result_detail'
      'LEFT JOIN test_grup ON result_detail.DISP_SEQ = test_grup.kode'
      'LEFT JOIN grup ON test_grup.grup_id = grup.id'
      'LEFT JOIN test_urut ON test_grup.kode = test_urut.kode'
      'LEFT JOIN test ON result_detail.test_cd = test.id'
      'WHERE'
      'result_detail.id IN ('
      'SELECT nomor'
      'FROM'
      'order_header'
      'WHERE'
      'pasien_id = :pasien_id '
      ')'
      
        'ORDER BY result_detail.id, IFNULL(test_urut.show_order,result_de' +
        'tail.DISP_SEQ)')
    Left = 448
    Top = 424
    ParamData = <
      item
        Name = 'USER_PROFILE_ID'
        DataType = ftString
        ParamType = ptInput
        Value = '2'
      end
      item
        Name = 'PASIEN_ID'
        DataType = ftString
        ParamType = ptInput
        Value = '1911'
      end>
  end
  object QConfidential: TFDQuery
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select flg_confidential from test where kode = :kode')
    Left = 696
    Top = 384
    ParamData = <
      item
        Name = 'KODE'
        DataType = ftString
        ParamType = ptInput
        Value = '1'
      end>
  end
  object QRole: TFDQuery
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select * from'
      'user_profile_rights'
      'where'
      'value = '#39'ROLE_VIEW_CONFIDENTIAL_RESULT'#39
      'and user_profile_id = :user_profile_id ')
    Left = 784
    Top = 384
    ParamData = <
      item
        Name = 'USER_PROFILE_ID'
        DataType = ftString
        ParamType = ptInput
        Value = '2'
      end>
  end
  object QData2: TFDQuery
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'SELECT CASE WHEN '
      '('
      'SELECT COUNT(*)'
      'FROM user_profile_rights'
      'WHERE'
      
        'value = '#39'ROLE_VIEW_CONFIDENTIAL_RESULT'#39' AND user_profile_id = :u' +
        'ser_profile_id '
      ') = 0 AND test.flg_confidential > 0 THEN '#39'*****'#39' ELSE'
      
        'result_detail.RESULT_VALUE END as RESULT_VALUE , CASE WHEN resul' +
        't_detail.flag = '#39#39' THEN '#39#39' ELSE '#39'*'#39' END AS flag'
      'FROM result_detail'
      'LEFT JOIN test ON result_detail.TEST_CD = test.id'
      'WHERE result_detail.id = :nomor AND test_cd = :test_cd ')
    Left = 456
    Top = 344
    ParamData = <
      item
        Name = 'USER_PROFILE_ID'
        DataType = ftString
        ParamType = ptInput
        Value = '1'
      end
      item
        Name = 'NOMOR'
        DataType = ftString
        ParamType = ptInput
        Value = '2012180412'
      end
      item
        Name = 'TEST_CD'
        DataType = ftString
        ParamType = ptInput
        Value = '7027'
      end>
  end
  object QLen: TFDQuery
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      
        'SELECT length(nomor) as len FROM order_header WHERE  pasien_id =' +
        ' :pasien_id ')
    Left = 328
    Top = 384
    ParamData = <
      item
        Name = 'PASIEN_ID'
        DataType = ftString
        ParamType = ptInput
        Value = '1911'
      end>
  end
end
