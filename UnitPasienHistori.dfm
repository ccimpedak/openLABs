object frmPasienHistori: TfrmPasienHistori
  Left = 0
  Top = 0
  ClientHeight = 508
  ClientWidth = 888
  Caption = 'Pasien Histori'
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
    Top = 0
    Width = 888
    Height = 465
    Hint = ''
    ParentColor = False
    Align = alClient
    TabOrder = 0
    object strGrd: TUniStringGrid
      Left = 0
      Top = 0
      Width = 888
      Height = 465
      Hint = ''
      ShowHint = True
      ParentShowHint = False
      Options = [goVertLine, goHorzLine, goRowSelect]
      Columns = <>
      OnDrawCell = strGrdDrawCell
      Align = alClient
      TabOrder = 1
    end
  end
  object UniContainerPanel2: TUniContainerPanel
    Left = 0
    Top = 465
    Width = 888
    Height = 43
    Hint = ''
    ParentColor = False
    Align = alBottom
    TabOrder = 1
    object UniButton1: TUniButton
      Left = 788
      Top = 6
      Width = 97
      Height = 30
      Hint = ''
      Caption = 'Tutup'
      TabOrder = 1
      OnClick = UniButton1Click
    end
    object UniSpeedButton1: TUniSpeedButton
      Left = 552
      Top = 6
      Width = 105
      Height = 30
      Hint = ''
      Visible = False
      Caption = 'Evol. chart'
      ParentColor = False
      Color = clWindow
      TabOrder = 2
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
    Left = 464
    Top = 480
  end
end
