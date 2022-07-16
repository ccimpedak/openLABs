object frmIsiHasil: TfrmIsiHasil
  Left = 0
  Top = 0
  ClientHeight = 102
  ClientWidth = 316
  Caption = 'Entri hasil'
  BorderStyle = bsDialog
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  Font.Height = -13
  Font.Name = 'Roboto'
  OnAfterShow = UniFormAfterShow
  PixelsPerInch = 96
  TextHeight = 15
  object UniLabel1: TUniLabel
    Left = 24
    Top = 16
    Width = 65
    Height = 15
    Hint = ''
    Caption = 'Nama test :'
    TabOrder = 0
  end
  object lbNamaTest: TUniLabel
    Left = 104
    Top = 16
    Width = 73
    Height = 15
    Hint = ''
    Caption = '<Nama test>'
    ParentFont = False
    Font.Height = -13
    Font.Name = 'Roboto'
    Font.Style = [fsBold]
    TabOrder = 1
  end
  object UniLabel3: TUniLabel
    Left = 54
    Top = 48
    Width = 35
    Height = 15
    Hint = ''
    Caption = 'Hasil :'
    TabOrder = 2
  end
  object cbHasil: TUniComboBox
    Left = 104
    Top = 43
    Width = 185
    Height = 23
    Hint = ''
    Text = ''
    Items.Strings = (
      'Negative'
      'Positive')
    TabOrder = 3
    IconItems = <>
    OnKeyDown = cbHasilKeyDown
  end
  object cmdHasil: TFDCommand
    Connection = UniMainModule.FDConnection1
    CommandText.Strings = (
      
        'update order_detail set status_id = 0, hasil = :hasil where id =' +
        ' :id')
    ParamData = <
      item
        Name = 'HASIL'
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'ID'
        ParamType = ptInput
      end>
    Left = 32
    Top = 48
  end
end
