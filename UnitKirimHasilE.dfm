object frmKirimHasilE: TfrmKirimHasilE
  Left = 0
  Top = 0
  ClientHeight = 293
  ClientWidth = 823
  Caption = 'Pengiriman hasil elektronik'
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  Font.Height = -16
  PixelsPerInch = 96
  TextHeight = 19
  object UniEdit1: TUniEdit
    Left = 64
    Top = 8
    Width = 225
    Hint = ''
    Text = 'UniEdit1'
    TabOrder = 0
  end
  object UniLabel1: TUniLabel
    Left = 16
    Top = 8
    Width = 32
    Height = 19
    Hint = ''
    Caption = 'Host'
    TabOrder = 1
  end
  object UniEdit2: TUniEdit
    Left = 450
    Top = 8
    Width = 359
    Hint = ''
    Text = 'UniEdit2'
    TabOrder = 2
  end
  object UniLabel2: TUniLabel
    Left = 392
    Top = 8
    Width = 52
    Height = 19
    Hint = ''
    Caption = 'Subject'
    TabOrder = 3
  end
  object UniLabel3: TUniLabel
    Left = 16
    Top = 48
    Width = 37
    Height = 19
    Hint = ''
    Caption = 'From'
    TabOrder = 4
  end
  object UniEdit3: TUniEdit
    Left = 64
    Top = 48
    Width = 225
    Hint = ''
    Text = 'UniEdit1'
    TabOrder = 5
  end
  object UniLabel4: TUniLabel
    Left = 16
    Top = 88
    Width = 19
    Height = 19
    Hint = ''
    Caption = 'To'
    TabOrder = 6
  end
  object UniEdit4: TUniEdit
    Left = 64
    Top = 88
    Width = 225
    Hint = ''
    Text = 'UniEdit1'
    TabOrder = 7
  end
  object UniLabel5: TUniLabel
    Left = 16
    Top = 128
    Width = 20
    Height = 19
    Hint = ''
    Caption = 'CC'
    TabOrder = 8
  end
  object UniEdit5: TUniEdit
    Left = 64
    Top = 128
    Width = 225
    Hint = ''
    Text = 'UniEdit1'
    TabOrder = 9
  end
  object UniMemo1: TUniMemo
    Left = 64
    Top = 168
    Width = 225
    Height = 89
    Hint = ''
    Lines.Strings = (
      'UniMemo1')
    TabOrder = 10
  end
  object UniLabel6: TUniLabel
    Left = 16
    Top = 168
    Width = 43
    Height = 19
    Hint = ''
    Caption = 'Status'
    TabOrder = 11
  end
  object UniMemo2: TUniMemo
    Left = 392
    Top = 72
    Width = 417
    Height = 89
    Hint = ''
    Lines.Strings = (
      'UniMemo2')
    TabOrder = 12
  end
  object UniButton1: TUniButton
    Left = 720
    Top = 168
    Width = 89
    Height = 33
    Hint = ''
    Caption = 'Send'
    TabOrder = 13
  end
  object UniLabel7: TUniLabel
    Left = 392
    Top = 36
    Width = 81
    Height = 19
    Hint = ''
    Caption = 'Attachment'
    TabOrder = 14
  end
  object UniEdit6: TUniEdit
    Left = 496
    Top = 36
    Width = 281
    Hint = ''
    Text = 'UniEdit6'
    TabOrder = 15
  end
  object UniButton2: TUniButton
    Left = 783
    Top = 36
    Width = 32
    Height = 25
    Hint = ''
    Caption = 'UniButton2'
    TabOrder = 16
  end
  object UniFileUpload1: TUniFileUpload
    Title = 'Upload'
    Messages.Uploading = 'Uploading...'
    Messages.PleaseWait = 'Please Wait'
    Messages.Cancel = 'Cancel'
    Messages.Processing = 'Processing...'
    Messages.UploadError = 'Upload Error'
    Messages.Upload = 'Upload'
    Messages.NoFileError = 'Please Select a File'
    Messages.BrowseText = 'Browse...'
    Left = 488
    Top = 176
  end
end
