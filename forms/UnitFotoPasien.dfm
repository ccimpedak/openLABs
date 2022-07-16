object frmFotoPasien: TfrmFotoPasien
  Left = 0
  Top = 0
  ClientHeight = 295
  ClientWidth = 515
  Caption = 'Foto Pasien'
  BorderStyle = bsDialog
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  Font.Height = -16
  OnBeforeShow = UniFormBeforeShow
  PixelsPerInch = 96
  TextHeight = 19
  object frmWebcam: TUniHTMLFrame
    Left = 8
    Top = 8
    Width = 240
    Height = 280
    Hint = ''
    HTML.Strings = (
      '<div id="my_camera"></div>'#9
      ''
      '<script language="JavaScript">'
      #9#9'Webcam.set({'
      #9#9#9'width: 320,'
      #9#9#9'height: 240,'
      #9#9#9'dest_width: 320,'
      #9#9#9'dest_height: 240,'
      #9#9#9'crop_width: 240,'
      #9#9#9'crop_height: 240,'
      #9#9#9'image_format: '#39'jpeg'#39','
      #9#9#9'jpeg_quality: 90'
      #9#9'});'
      #9#9'Webcam.attach( '#39'#my_camera'#39' );'
      #9'</script>'
      #9
      #9'<form>'
      
        #9#9'<input type=button value="Ambil foto" onClick="take_snapshot()' +
        '">'
      #9'</form>'
      ''
      #9'<script language="JavaScript">'
      #9#9'function take_snapshot() {'
      #9#9#9'Webcam.snap( function(data_uri) {'
      
        '               var d = data_uri.slice(data_uri.indexOf(",") + 1)' +
        ';'
      
        #9#9#9#9#9'ajaxRequest(frmFotoPasien.frmWebcam, "saveimg", ["img="+d])' +
        '; '
      #9#9#9'} );'
      #9#9'}'
      #9#9
      #9'</script>')
    OnAjaxEvent = frmWebcamAjaxEvent
  end
  object imFoto: TUniImage
    Left = 254
    Top = 8
    Width = 249
    Height = 240
    Hint = ''
    Stretch = True
  end
  object btnBatal: TUniButton
    Left = 263
    Top = 254
    Width = 82
    Height = 34
    Hint = ''
    Caption = 'Batal'
    TabOrder = 2
    OnClick = btnBatalClick
  end
  object btnSave: TUniButton
    Left = 421
    Top = 254
    Width = 82
    Height = 34
    Hint = ''
    Enabled = False
    Caption = 'Simpan'
    TabOrder = 3
    OnClick = btnSaveClick
  end
  object QFoto: TFDQuery
    Connection = UniMainModule.FDConnection1
    Left = 408
    Top = 24
  end
end
