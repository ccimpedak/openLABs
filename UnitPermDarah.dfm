object frmPermDarah: TfrmPermDarah
  Left = 0
  Top = 0
  ClientHeight = 652
  ClientWidth = 976
  Caption = 'Permintaan Darah'
  BorderStyle = bsDialog
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  Font.Height = -16
  PixelsPerInch = 96
  TextHeight = 19
  object UniContainerPanel1: TUniContainerPanel
    Left = 0
    Top = 0
    Width = 976
    Height = 113
    Hint = ''
    ParentColor = False
    Align = alTop
    TabOrder = 0
    object UniLabel1: TUniLabel
      Left = 16
      Top = 11
      Width = 52
      Height = 19
      Hint = ''
      Caption = 'No. MR'
      TabOrder = 1
    end
    object UniEdit1: TUniEdit
      Left = 88
      Top = 11
      Width = 209
      Hint = ''
      Text = 'UniEdit1'
      TabOrder = 2
    end
    object UniLabel2: TUniLabel
      Left = 16
      Top = 39
      Width = 41
      Height = 19
      Hint = ''
      Caption = 'Nama'
      TabOrder = 3
    end
    object UniEdit2: TUniEdit
      Left = 88
      Top = 39
      Width = 209
      Hint = ''
      Text = 'UniEdit2'
      TabOrder = 4
    end
    object UniButton1: TUniButton
      Left = 168
      Top = 67
      Width = 129
      Height = 35
      Hint = ''
      Caption = 'Cari'
      TabOrder = 5
    end
  end
  object UniContainerPanel2: TUniContainerPanel
    Left = 0
    Top = 584
    Width = 976
    Height = 68
    Hint = ''
    ParentColor = False
    Align = alBottom
    TabOrder = 1
    object UniButton2: TUniButton
      Left = 16
      Top = 16
      Width = 105
      Height = 41
      Hint = ''
      Caption = 'Tambah'
      TabOrder = 1
      OnClick = UniButton2Click
    end
  end
  object UniContainerPanel3: TUniContainerPanel
    Left = 0
    Top = 113
    Width = 976
    Height = 471
    Hint = ''
    ParentColor = False
    Align = alClient
    TabOrder = 2
    ExplicitLeft = 312
    ExplicitTop = 232
    ExplicitWidth = 256
    ExplicitHeight = 128
  end
  object UniDBGrid1: TUniDBGrid
    Left = 0
    Top = 113
    Width = 976
    Height = 471
    Hint = ''
    LoadMask.Message = 'Loading data...'
    Align = alClient
    TabOrder = 3
  end
end
