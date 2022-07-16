object frmPilihRujukan: TfrmPilihRujukan
  Left = 0
  Top = 0
  ClientHeight = 254
  ClientWidth = 336
  Caption = 'Pilh Rujukan'
  BorderStyle = bsDialog
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  Font.Height = -13
  Font.Name = 'Roboto'
  OnBeforeShow = UniFormBeforeShow
  PixelsPerInch = 96
  TextHeight = 15
  object lbRjk: TUniListBox
    Left = 8
    Top = 8
    Width = 313
    Height = 177
    Hint = ''
    Items.Strings = (
      'a'
      'b'
      'c'
      's'
      'sd'
      'sd'
      's')
    TabOrder = 0
    MultiSelect = True
    OnClick = lbRjkClick
  end
  object UniButton1: TUniButton
    Left = 253
    Top = 221
    Width = 75
    Height = 25
    Hint = ''
    Caption = 'Konfirm'
    TabOrder = 1
    OnClick = UniButton1Click
  end
  object UniLabel1: TUniLabel
    Left = 8
    Top = 191
    Width = 53
    Height = 15
    Hint = ''
    Caption = 'Selected:'
    TabOrder = 2
  end
  object lblSelected: TUniLabel
    Left = 67
    Top = 191
    Width = 254
    Height = 15
    Hint = ''
    AutoSize = False
    Caption = '<empty>'
    ParentFont = False
    Font.Height = -13
    Font.Name = 'Roboto'
    Font.Style = [fsBold]
    TabOrder = 3
  end
  object QRjk: TFDQuery
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select distinct rujukan'
      'from'
      'worklist_header'
      'where'
      'rujukan is not null'
      'order by rujukan')
    Left = 16
    Top = 208
  end
end
