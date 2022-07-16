object frmElektronikHasilKirim: TfrmElektronikHasilKirim
  Left = 0
  Top = 0
  ClientHeight = 309
  ClientWidth = 390
  Caption = 'Progres Kirim Hasil'
  OnShow = UniFormShow
  BorderStyle = bsDialog
  OldCreateOrder = False
  OnClose = UniFormClose
  MonitoredKeys.Keys = <>
  Font.Height = -16
  Font.Name = 'Calibri'
  PixelsPerInch = 96
  TextHeight = 19
  object UniButton1: TUniButton
    Left = 168
    Top = 88
    Width = 75
    Height = 25
    Hint = ''
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 0
  end
  object PrgBar: TUniProgressBar
    Left = 40
    Top = 48
    Width = 305
    Height = 17
    Hint = ''
    Max = 10
    Text = ''
    TabOrder = 1
  end
  object UniMemo1: TUniMemo
    Left = 16
    Top = 136
    Width = 353
    Height = 153
    Hint = ''
    Lines.Strings = (
      'UniMemo1')
    TabOrder = 2
  end
  object CheckProgressTimer: TUniTimer
    Enabled = False
    ClientEvent.Strings = (
      'function(sender)'
      '{'
      '   '
      '}')
    OnTimer = CheckProgressTimerTimer
    Left = 64
    Top = 8
  end
  object QParam: TFDQuery
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select *'
      'from'
      'parameters'
      'where'
      'name = :name')
    Left = 224
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
    Left = 306
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
    Left = 338
    Top = 8
  end
end
