object frmEnvChart: TfrmEnvChart
  Left = 0
  Top = 0
  ClientHeight = 553
  ClientWidth = 984
  Caption = 'Env. Chart'
  BorderStyle = bsDialog
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  Font.Height = -13
  Font.Name = 'Roboto'
  PixelsPerInch = 96
  TextHeight = 15
  object UniContainerPanel1: TUniContainerPanel
    Left = 0
    Top = 520
    Width = 984
    Height = 33
    Hint = ''
    ParentColor = False
    Align = alBottom
    TabOrder = 0
    object UniButton1: TUniButton
      Left = 906
      Top = 5
      Width = 75
      Height = 25
      Hint = ''
      Caption = 'Tutup'
      TabOrder = 1
      OnClick = UniButton1Click
    end
  end
  object UniChart1: TUniChart
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 978
    Height = 514
    Hint = ''
    Animate = True
    ClientEvents.UniEvents.Strings = (
      
        'chart.beforeInit=function chart.beforeInit(sender, config)'#13#10'{'#13#10' ' +
        ' config.innerPadding=20;'#13#10'  config.insetPadding=20;'#13#10'}'
      
        'store.beforeInit=function store.beforeInit(sender, config)'#13#10'{'#13#10#13 +
        #10'}')
    LayoutConfig.Padding = '15'
    LayoutConfig.BodyPadding = '0'
    LayoutConfig.RowSpan = 10
    LayoutConfig.ColSpan = 10
    ScreenMask.Enabled = True
    ScreenMask.WaitData = True
    Align = alClient
    object UniLineSeries1: TUniLineSeries
      Colors.Strings = (
        '#0000FF'
        '#00FF00'
        '#FF0000'
        '#00FFFF'
        '#FFFF00'
        '#FF00FF')
      Title = 'Albumin'
      SeriesLabel.Enabled = True
      SeriesLabel.Display = 'over'
      SeriesLabel.Font.Name = 'Roboto'
      SeriesLabel.Padding = 90
      DataSource = dsHist
      YValues.ValueSource = 'RESULT_VALUE'
      XLabelsSource = 'VALIDATE_ON'
    end
  end
  object QHistori: TFDQuery
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      
        'SELECT STR_TO_DATE(VALIDATE_ON,'#39'%Y%m%d%H%i%s'#39') VALIDATE_ON,RESUL' +
        'T_VALUE'
      'FROM'
      'result_detail'
      'WHERE'
      'test_cd = :test_id'
      
        'AND id IN (SELECT  nomor FROM order_header WHERE pasien_id = :pa' +
        'sien_id )'
      'AND VALIDATE_ON IS NOT NULL '
      'AND concat('#39#39',RESULT_VALUE * 1) = RESULT_VALUE'
      'ORDER BY VALIDATE_ON')
    Left = 112
    Top = 432
    ParamData = <
      item
        Name = 'TEST_ID'
        DataType = ftString
        ParamType = ptInput
        Value = '2107'
      end
      item
        Name = 'PASIEN_ID'
        DataType = ftString
        ParamType = ptInput
        Value = '88'
      end>
  end
  object dsHist: TDataSource
    DataSet = QHistori
    Left = 176
    Top = 424
  end
end
