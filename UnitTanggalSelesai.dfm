object frmTanggalSelesai: TfrmTanggalSelesai
  Left = 0
  Top = 0
  ClientHeight = 179
  ClientWidth = 362
  Caption = 'Tanggal Pengambilan Hasil'
  BorderStyle = bsDialog
  OldCreateOrder = False
  OnKeyDown = UniFormKeyDown
  MonitoredKeys.Keys = <>
  Font.Height = -16
  OnAfterShow = UniFormAfterShow
  PixelsPerInch = 96
  TextHeight = 19
  object UniLabel1: TUniLabel
    Left = 8
    Top = 8
    Width = 57
    Height = 19
    Hint = ''
    Caption = 'Tanggal'
    TabOrder = 0
  end
  object dtTanggal: TUniDateTimePicker
    Left = 71
    Top = 8
    Width = 113
    Hint = ''
    DateTime = 43598.000000000000000000
    TabOrder = 1
    UseSystemFormats = True
  end
  object mmCatatan: TUniMemo
    Left = 8
    Top = 36
    Width = 346
    Height = 89
    Hint = ''
    TabOrder = 2
  end
  object UniButton1: TUniButton
    Left = 198
    Top = 131
    Width = 75
    Height = 43
    Hint = ''
    Caption = 'Simpan'
    TabOrder = 3
    OnClick = UniButton1Click
  end
  object UniButton2: TUniButton
    Left = 279
    Top = 131
    Width = 75
    Height = 43
    Hint = ''
    Caption = 'Batal'
    TabOrder = 4
    OnClick = UniButton2Click
  end
end
