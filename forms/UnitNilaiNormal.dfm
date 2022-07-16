object frmNilaiNormal: TfrmNilaiNormal
  Left = 0
  Top = 0
  ClientHeight = 314
  ClientWidth = 732
  Caption = 'Nilai normal'
  BorderStyle = bsDialog
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  Font.Height = -13
  Font.Name = 'Roboto'
  OnBeforeShow = UniFormBeforeShow
  PixelsPerInch = 96
  TextHeight = 15
  object UniGroupBox1: TUniGroupBox
    Left = 8
    Top = 8
    Width = 185
    Height = 145
    Hint = ''
    Caption = 'Umur'
    TabOrder = 0
    object cbUmur: TUniDBLookupComboBox
      Left = 25
      Top = 19
      Width = 128
      Height = 23
      Hint = ''
      ListField = 'nama'
      ListSource = dsUmur
      KeyField = 'nama'
      ListFieldIndex = 0
      DataField = 'id'
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Roboto'
      AnyMatch = True
      TabOrder = 1
      Color = clWindow
      FieldLabel = 'Unit'
      FieldLabelWidth = 40
      Style = csDropDown
    end
    object edUmurMin: TUniEdit
      Left = 25
      Top = 48
      Width = 80
      Hint = ''
      Text = ''
      TabOrder = 2
      ClientEvents.ExtEvents.Strings = (
        
          'keydown=function keydown(sender, e, eOpts)'#13#10'{'#13#10' var event = e;'#13#10 +
          '    if (event.keyCode == 46 || event.keyCode == 8 || event.keyCo' +
          'de == 9 || event.keyCode == 27 || event.keyCode == 13 ||        ' +
          #13#10'        (event.keyCode == 65 && event.ctrlKey === true) ||    ' +
          '    '#13#10'        (event.keyCode >= 35 && event.keyCode <= 39)) {   ' +
          '     '#13#10'        return;'#13#10'    } else {        '#13#10'        if (event.' +
          'shiftKey || (event.keyCode < 48 || event.keyCode > 57) && (event' +
          '.keyCode < 96 || event.keyCode > 105)) {'#13#10'            event.prev' +
          'entDefault();'#13#10'        }'#13#10'    }'#13#10'}')
      FieldLabel = 'Dari'
      FieldLabelWidth = 40
    end
    object edUmurMax: TUniEdit
      Left = 25
      Top = 76
      Width = 80
      Hint = ''
      Text = ''
      TabOrder = 3
      ClientEvents.ExtEvents.Strings = (
        
          'keydown=function keydown(sender, e, eOpts)'#13#10'{'#13#10'   var event = e;' +
          #13#10'    if (event.keyCode == 46 || event.keyCode == 8 || event.key' +
          'Code == 9 || event.keyCode == 27 || event.keyCode == 13 ||      ' +
          '  '#13#10'        (event.keyCode == 65 && event.ctrlKey === true) ||  ' +
          '      '#13#10'        (event.keyCode >= 35 && event.keyCode <= 39)) { ' +
          '       '#13#10'        return;'#13#10'    } else {        '#13#10'        if (even' +
          't.shiftKey || (event.keyCode < 48 || event.keyCode > 57) && (eve' +
          'nt.keyCode < 96 || event.keyCode > 105)) {'#13#10'            event.pr' +
          'eventDefault();'#13#10'        }'#13#10'    }'#13#10'}')
      FieldLabel = 'Sampai'
      FieldLabelWidth = 40
    end
    object cbAnyAge: TUniCheckBox
      Left = 25
      Top = 112
      Width = 97
      Height = 17
      Hint = ''
      Caption = 'Semua umur'
      TabOrder = 4
      OnChange = cbAnyAgeChange
    end
  end
  object UniGroupBox2: TUniGroupBox
    Left = 199
    Top = 8
    Width = 258
    Height = 81
    Hint = ''
    Caption = 'Demografik pasien'
    TabOrder = 1
    object UniDBLookupComboBox1: TUniDBLookupComboBox
      Left = 16
      Top = 27
      Width = 225
      Height = 23
      Hint = ''
      ListField = 'nama'
      ListSource = dsUmur
      KeyField = 'nama'
      ListFieldIndex = 0
      DataField = 'id'
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Roboto'
      AnyMatch = True
      TabOrder = 1
      Color = clWindow
      FieldLabel = 'Jenis kelamin'
      FieldLabelWidth = 80
      Style = csDropDown
    end
  end
  object UniGroupBox3: TUniGroupBox
    Left = 199
    Top = 95
    Width = 258
    Height = 162
    Hint = ''
    Caption = 'Range nilai normal'
    TabOrder = 2
    object UniEdit1: TUniEdit
      Left = 16
      Top = 16
      Width = 217
      Hint = ''
      Text = ''
      TabOrder = 1
      ClientEvents.ExtEvents.Strings = (
        
          'keydown=function keydown(sender, e, eOpts)'#13#10'{'#13#10' var event = e;'#13#10 +
          '    if (event.keyCode == 46 || event.keyCode == 8 || event.keyCo' +
          'de == 9 || event.keyCode == 27 || event.keyCode == 13 ||        ' +
          #13#10'        (event.keyCode == 65 && event.ctrlKey === true) ||    ' +
          '    '#13#10'        (event.keyCode >= 35 && event.keyCode <= 39)) {   ' +
          '     '#13#10'        return;'#13#10'    } else {        '#13#10'        if (event.' +
          'shiftKey || (event.keyCode < 48 || event.keyCode > 57) && (event' +
          '.keyCode < 96 || event.keyCode > 105)) {'#13#10'            event.prev' +
          'entDefault();'#13#10'        }'#13#10'    }'#13#10'}')
      FieldLabel = 'Limit bawah'
    end
    object UniEdit2: TUniEdit
      Left = 16
      Top = 44
      Width = 217
      Hint = ''
      Text = ''
      TabOrder = 2
      ClientEvents.ExtEvents.Strings = (
        
          'keydown=function keydown(sender, e, eOpts)'#13#10'{'#13#10'   var event = e;' +
          #13#10'    if (event.keyCode == 46 || event.keyCode == 8 || event.key' +
          'Code == 9 || event.keyCode == 27 || event.keyCode == 13 ||      ' +
          '  '#13#10'        (event.keyCode == 65 && event.ctrlKey === true) ||  ' +
          '      '#13#10'        (event.keyCode >= 35 && event.keyCode <= 39)) { ' +
          '       '#13#10'        return;'#13#10'    } else {        '#13#10'        if (even' +
          't.shiftKey || (event.keyCode < 48 || event.keyCode > 57) && (eve' +
          'nt.keyCode < 96 || event.keyCode > 105)) {'#13#10'            event.pr' +
          'eventDefault();'#13#10'        }'#13#10'    }'#13#10'}')
      FieldLabel = 'Limit atas'
    end
    object UniEdit3: TUniEdit
      Left = 122
      Top = 72
      Width = 111
      Hint = ''
      Text = ''
      TabOrder = 3
      ClientEvents.ExtEvents.Strings = (
        
          'keydown=function keydown(sender, e, eOpts)'#13#10'{'#13#10'   var event = e;' +
          #13#10'    if (event.keyCode == 46 || event.keyCode == 8 || event.key' +
          'Code == 9 || event.keyCode == 27 || event.keyCode == 13 ||      ' +
          '  '#13#10'        (event.keyCode == 65 && event.ctrlKey === true) ||  ' +
          '      '#13#10'        (event.keyCode >= 35 && event.keyCode <= 39)) { ' +
          '       '#13#10'        return;'#13#10'    } else {        '#13#10'        if (even' +
          't.shiftKey || (event.keyCode < 48 || event.keyCode > 57) && (eve' +
          'nt.keyCode < 96 || event.keyCode > 105)) {'#13#10'            event.pr' +
          'eventDefault();'#13#10'        }'#13#10'    }'#13#10'}')
      FieldLabelWidth = 40
    end
    object UniEdit4: TUniEdit
      Left = 16
      Top = 101
      Width = 217
      Hint = ''
      Text = ''
      TabOrder = 4
      ClientEvents.ExtEvents.Strings = (
        
          'keydown=function keydown(sender, e, eOpts)'#13#10'{'#13#10'   var event = e;' +
          #13#10'    if (event.keyCode == 46 || event.keyCode == 8 || event.key' +
          'Code == 9 || event.keyCode == 27 || event.keyCode == 13 ||      ' +
          '  '#13#10'        (event.keyCode == 65 && event.ctrlKey === true) ||  ' +
          '      '#13#10'        (event.keyCode >= 35 && event.keyCode <= 39)) { ' +
          '       '#13#10'        return;'#13#10'    } else {        '#13#10'        if (even' +
          't.shiftKey || (event.keyCode < 48 || event.keyCode > 57) && (eve' +
          'nt.keyCode < 96 || event.keyCode > 105)) {'#13#10'            event.pr' +
          'eventDefault();'#13#10'        }'#13#10'    }'#13#10'}')
      FieldLabel = 'Nilai alfanumerik'
      FieldLabelWidth = 40
      FieldLabelAlign = laTop
    end
    object UniComboBox1: TUniComboBox
      Left = 16
      Top = 72
      Width = 97
      Height = 23
      Hint = ''
      Text = ''
      Items.Strings = (
        '>'
        '<'
        '>='
        '<=')
      TabOrder = 5
      FieldLabel = 'Nilai'
      FieldLabelWidth = 40
      IconItems = <>
    end
  end
  object UniMemo1: TUniMemo
    Left = 479
    Top = 8
    Width = 242
    Height = 81
    Hint = ''
    Lines.Strings = (
      'UniMemo1')
    TabOrder = 3
    FieldLabel = 'Info'
    FieldLabelWidth = 20
    FieldLabelAlign = laTop
  end
  object UniGroupBox4: TUniGroupBox
    Left = 463
    Top = 95
    Width = 258
    Height = 162
    Hint = ''
    Caption = 'Range nilai kritis'
    TabOrder = 4
    object UniEdit5: TUniEdit
      Left = 16
      Top = 16
      Width = 217
      Hint = ''
      Text = ''
      TabOrder = 1
      ClientEvents.ExtEvents.Strings = (
        
          'keydown=function keydown(sender, e, eOpts)'#13#10'{'#13#10' var event = e;'#13#10 +
          '    if (event.keyCode == 46 || event.keyCode == 8 || event.keyCo' +
          'de == 9 || event.keyCode == 27 || event.keyCode == 13 ||        ' +
          #13#10'        (event.keyCode == 65 && event.ctrlKey === true) ||    ' +
          '    '#13#10'        (event.keyCode >= 35 && event.keyCode <= 39)) {   ' +
          '     '#13#10'        return;'#13#10'    } else {        '#13#10'        if (event.' +
          'shiftKey || (event.keyCode < 48 || event.keyCode > 57) && (event' +
          '.keyCode < 96 || event.keyCode > 105)) {'#13#10'            event.prev' +
          'entDefault();'#13#10'        }'#13#10'    }'#13#10'}')
      FieldLabel = 'Limit bawah'
    end
    object UniEdit6: TUniEdit
      Left = 16
      Top = 44
      Width = 217
      Hint = ''
      Text = ''
      TabOrder = 2
      ClientEvents.ExtEvents.Strings = (
        
          'keydown=function keydown(sender, e, eOpts)'#13#10'{'#13#10'   var event = e;' +
          #13#10'    if (event.keyCode == 46 || event.keyCode == 8 || event.key' +
          'Code == 9 || event.keyCode == 27 || event.keyCode == 13 ||      ' +
          '  '#13#10'        (event.keyCode == 65 && event.ctrlKey === true) ||  ' +
          '      '#13#10'        (event.keyCode >= 35 && event.keyCode <= 39)) { ' +
          '       '#13#10'        return;'#13#10'    } else {        '#13#10'        if (even' +
          't.shiftKey || (event.keyCode < 48 || event.keyCode > 57) && (eve' +
          'nt.keyCode < 96 || event.keyCode > 105)) {'#13#10'            event.pr' +
          'eventDefault();'#13#10'        }'#13#10'    }'#13#10'}')
      FieldLabel = 'Limit atas'
    end
    object UniEdit7: TUniEdit
      Left = 122
      Top = 72
      Width = 111
      Hint = ''
      Text = ''
      TabOrder = 3
      ClientEvents.ExtEvents.Strings = (
        
          'keydown=function keydown(sender, e, eOpts)'#13#10'{'#13#10'   var event = e;' +
          #13#10'    if (event.keyCode == 46 || event.keyCode == 8 || event.key' +
          'Code == 9 || event.keyCode == 27 || event.keyCode == 13 ||      ' +
          '  '#13#10'        (event.keyCode == 65 && event.ctrlKey === true) ||  ' +
          '      '#13#10'        (event.keyCode >= 35 && event.keyCode <= 39)) { ' +
          '       '#13#10'        return;'#13#10'    } else {        '#13#10'        if (even' +
          't.shiftKey || (event.keyCode < 48 || event.keyCode > 57) && (eve' +
          'nt.keyCode < 96 || event.keyCode > 105)) {'#13#10'            event.pr' +
          'eventDefault();'#13#10'        }'#13#10'    }'#13#10'}')
      FieldLabelWidth = 40
    end
    object UniEdit8: TUniEdit
      Left = 16
      Top = 101
      Width = 217
      Hint = ''
      Text = ''
      TabOrder = 4
      ClientEvents.ExtEvents.Strings = (
        
          'keydown=function keydown(sender, e, eOpts)'#13#10'{'#13#10'   var event = e;' +
          #13#10'    if (event.keyCode == 46 || event.keyCode == 8 || event.key' +
          'Code == 9 || event.keyCode == 27 || event.keyCode == 13 ||      ' +
          '  '#13#10'        (event.keyCode == 65 && event.ctrlKey === true) ||  ' +
          '      '#13#10'        (event.keyCode >= 35 && event.keyCode <= 39)) { ' +
          '       '#13#10'        return;'#13#10'    } else {        '#13#10'        if (even' +
          't.shiftKey || (event.keyCode < 48 || event.keyCode > 57) && (eve' +
          'nt.keyCode < 96 || event.keyCode > 105)) {'#13#10'            event.pr' +
          'eventDefault();'#13#10'        }'#13#10'    }'#13#10'}')
      FieldLabel = 'Nilai alfanumerik'
      FieldLabelWidth = 40
      FieldLabelAlign = laTop
    end
    object UniComboBox2: TUniComboBox
      Left = 16
      Top = 72
      Width = 97
      Height = 23
      Hint = ''
      Text = ''
      Items.Strings = (
        '>'
        '<'
        '>='
        '<=')
      TabOrder = 5
      FieldLabel = 'Nilai'
      FieldLabelWidth = 40
      IconItems = <>
    end
  end
  object UniButton1: TUniButton
    Left = 649
    Top = 272
    Width = 75
    Height = 25
    Hint = ''
    Caption = 'Simpan'
    TabOrder = 5
  end
  object QUmur: TFDQuery
    Aggregates = <
      item
      end>
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select * from umur_satuan')
    Left = 24
    Top = 208
  end
  object dsUmur: TDataSource
    DataSet = QUmur
    Left = 64
    Top = 208
  end
end
