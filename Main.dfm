object MainForm: TMainForm
  Left = 0
  Top = 0
  Width = 924
  Height = 725
  Caption = 'OpenLABs'
  OldCreateOrder = False
  OnKeyUp = UniFormKeyUp
  AutoScroll = True
  MonitoredKeys.Keys = <
    item
      KeyStart = 112
      KeyEnd = 123
      HandleBrowser = False
    end>
  Font.Height = -13
  Font.Name = 'Roboto'
  OnBeforeShow = UniFormBeforeShow
  OnAfterShow = UniFormAfterShow
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 15
  object UniStatusBar1: TUniStatusBar
    Left = 0
    Top = 667
    Width = 908
    Height = 19
    Hint = ''
    ShowHint = True
    ParentShowHint = False
    Panels = <
      item
        Alignment = taCenter
        Width = 200
      end
      item
        Width = 200
      end>
    SizeGrip = False
    Align = alBottom
    ParentColor = False
    Color = clWindow
  end
  object UniPanel1: TUniPanel
    Left = 0
    Top = 25
    Width = 240
    Height = 642
    Hint = ''
    Constraints.MaxWidth = 300
    Align = alLeft
    TabOrder = 1
    TitleAlign = taCenter
    Title = 'Navigate'
    Caption = 'UniPanel1'
    Collapsible = True
    CollapseDirection = cdLeft
    object NavTree: TUniTreeView
      Left = 1
      Top = 53
      Width = 238
      Height = 588
      Hint = ''
      Items.FontData = {0100000000}
      AutoExpand = True
      Align = alClient
      TabOrder = 1
      ScreenMask.ShowMessage = False
      ScreenMask.Target = Owner
      ScreenMask.Color = clWhite
      ScreenMask.Opacity = 0.200000002980232200
      Color = clWindow
      BorderStyle = ubsNone
      OnClick = NavTreeClick
    end
    object UniToolBar1: TUniToolBar
      Left = 1
      Top = 1
      Width = 238
      Height = 29
      Hint = ''
      ShowHint = True
      ParentShowHint = False
      ButtonHeight = 23
      Images = UniNativeImageList1
      BorderWidth = 1
      TabOrder = 2
      ParentColor = False
      Color = clBtnFace
      object UniToolButton1: TUniToolButton
        Left = 0
        Top = 0
        Hint = 'Expand All'
        ShowHint = True
        ImageIndex = 0
        Caption = 'UniToolButton1'
        TabOrder = 1
        OnClick = UniToolButton1Click
      end
      object UniToolButton2: TUniToolButton
        Left = 23
        Top = 0
        Hint = 'Collapse All'
        ShowHint = True
        ImageIndex = 1
        Caption = 'UniToolButton2'
        TabOrder = 2
        OnClick = UniToolButton2Click
      end
      object UniToolButton3: TUniToolButton
        Left = 46
        Top = 0
        Width = 8
        Hint = ''
        ShowHint = True
        Style = tbsSeparator
        Caption = 'UniToolButton3'
        TabOrder = 3
      end
      object UniToolButton4: TUniToolButton
        Left = 54
        Top = 0
        Hint = 'Close All Tabs'
        ShowHint = True
        ImageIndex = 2
        Caption = 'UniToolButton4'
        ScreenMask.Enabled = True
        ScreenMask.Message = 'Cleaning up...'
        ScreenMask.Target = Owner
        ScreenMask.Color = clWhite
        ScreenMask.Opacity = 0.349999994039535500
        TabOrder = 4
        OnClick = UniToolButton4Click
      end
    end
    object SearchEdit: TUniComboBox
      Left = 1
      Top = 30
      Width = 238
      Height = 23
      Hint = ''
      Text = ''
      Align = alTop
      TabOrder = 3
      MinQueryLength = 3
      CheckChangeDelay = 250
      ClearButton = True
      FieldLabelWidth = 250
      Triggers = <
        item
          ButtonId = 0
          IconCls = 'x-form-search-trigger'
          HandleClicks = True
        end>
      IconItems = <>
      OnChange = SearchEditChange
    end
  end
  object UniSplitter1: TUniSplitter
    Left = 240
    Top = 25
    Width = 6
    Height = 642
    Hint = ''
    Align = alLeft
    ParentColor = False
    Color = clBtnFace
  end
  object UniContainerPanel2: TUniContainerPanel
    Left = 246
    Top = 25
    Width = 662
    Height = 642
    Hint = ''
    ParentColor = False
    Align = alClient
    TabOrder = 3
    object UniPageControl1: TUniPageControl
      Left = 0
      Top = 0
      Width = 662
      Height = 642
      Hint = ''
      ActivePage = UniTabSheet1
      Align = alClient
      TabOrder = 1
      object UniTabSheet1: TUniTabSheet
        Hint = ''
        Caption = 'Home'
        OnClose = UniTabSheet1Close
        object UniLabel2: TUniLabel
          Left = 0
          Top = 594
          Width = 654
          Height = 20
          Hint = ''
          Alignment = taCenter
          AutoSize = False
          Caption = 'openlabs.sourceforge.io'
          Align = alBottom
          ParentFont = False
          Font.Color = clGray
          Font.Height = -13
          Font.Name = 'Roboto'
          Font.Style = [fsBold]
          ParentColor = False
          Color = clWhite
          TabOrder = 0
        end
        object UniContainerPanel1: TUniContainerPanel
          Left = 0
          Top = 0
          Width = 654
          Height = 594
          Hint = ''
          ParentColor = False
          Color = clWhite
          Align = alClient
          TabOrder = 1
          object UniContainerPanel3: TUniContainerPanel
            Left = 0
            Top = 0
            Width = 654
            Height = 128
            Hint = ''
            ParentColor = False
            Align = alTop
            TabOrder = 1
            object lblTaskHead: TUniLabel
              Left = 16
              Top = 16
              Width = 32
              Height = 15
              Hint = ''
              Visible = False
              Caption = 'Task:'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Roboto'
              Font.Style = [fsBold, fsUnderline]
              TabOrder = 1
            end
            object lblTaskNotif: TUniLabel
              Left = 32
              Top = 35
              Width = 54
              Height = 15
              Hint = ''
              Visible = False
              Caption = 'Notifikasi'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Roboto'
              TabOrder = 2
            end
            object lblNotif: TUniLabel
              Left = 132
              Top = 35
              Width = 93
              Height = 15
              Hint = ''
              Visible = False
              Alignment = taCenter
              AutoSize = False
              Caption = 'Non Aktif'
              ParentFont = False
              Font.Color = clRed
              Font.Height = -13
              Font.Name = 'Roboto'
              Font.Style = [fsBold]
              ParentColor = False
              Color = clInfoBk
              TabOrder = 3
            end
            object btnNotif: TUniButton
              Left = 248
              Top = 29
              Width = 75
              Height = 25
              Hint = ''
              Visible = False
              Caption = 'Start'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Roboto'
              TabOrder = 4
              OnClick = btnNotifClick
            end
            object btnSetting: TUniButton
              Left = 329
              Top = 29
              Width = 75
              Height = 25
              Hint = ''
              Visible = False
              Caption = 'Setting'
              TabOrder = 5
              OnClick = btnSettingClick
            end
          end
        end
      end
    end
  end
  object Header: TUniContainerPanel
    Left = 0
    Top = 0
    Width = 908
    Height = 25
    Hint = ''
    ParentColor = False
    Align = alTop
    TabOrder = 4
    object btnAkun: TUniMenuButton
      Left = 803
      Top = 0
      Width = 105
      Height = 25
      Hint = ''
      DropdownMenu = UniPopupMenu1
      Caption = 'Menu'
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000EEF2EDCAD7C9
        779973477D4725712A28712C27712B28712B28702B256E2738773A618D6085A2
        82BAC7B7E1E9E1FFFFFF5B8A5B4C985A2FBA5030C15332CF5D33CD5C32CD5C33
        CD5E33CD5E33CF5E32C55930BC522CAE4A279C40347335FFFFFF5F90616DBF89
        2DCB602BBA552DB8552DB8552DB8552BB8542DB8542DB8552DB9552DBD572FC3
        5B31CE62337435FFFFFF68966A65AA7745CF7D22B6522DBB5D2ABB5D2BBB5D2B
        BB5D2BBB5D2BBB5D2BBB5C2BBA5B2BC26329AE52528955FFFFFFBCD1BC598F5A
        7BDFAF1ABA5C24BA6126BB6627BB6628BE6628BC6527BB6528BB6527BC6529CA
        73208736BCD1BCFFFFFFFFFFFFBED6BF61AB7769E0B213BC6623C86524C96421
        C66327CD6626CD6A24BF7123CB7B21AA5A7DAE80FFFFFFFFFFFFFFFFFFFFFFFF
        A4CAA867B78471E4A715AC771980A01368B40C6B98189B6E26D77221AC5F63A7
        6AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3E9CF489A7D4080FF2983FF20
        8BFF1275FF0B53E5167D4C9ED89AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF4B89F249B8FF1C9BFC259DFC28A6FF28A4FF5386BEFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6DBEFF39AFFE27A3F92C
        A6FB30A7FC35B8FF2489EADBDCF3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFE3E7F490E1FF79E9FF63CAFF4ABBFD46BAFA49C6FF3FA3E0C6CCDCFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE8E5E4515C61609AB981D9FE87
        E4FF78CFFF86F3FF72B9C6AAA1A1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFE6E6E62014101B090022121388DEE7A4FFFF92EEFF33353C979290FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEEEE302C2B302C2B20100C4A
        5B5A5E80843435341D0F0B9D9B9BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF4D474737323136312F2C1E1E251311291C1A322C2CD0CFCFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2F2F256504F3A36344A
        444474706F595754C1BFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      Align = alRight
      TabOrder = 1
    end
    object btnLokasi: TUniMenuButton
      Left = 503
      Top = 0
      Width = 289
      Height = 25
      Hint = ''
      DropdownMenu = upmLokasi
      Caption = '<lokasi>'
      Align = alRight
      TabOrder = 2
    end
    object UniContainerPanel4: TUniContainerPanel
      Left = 792
      Top = 0
      Width = 11
      Height = 25
      Hint = ''
      ParentColor = False
      Align = alRight
      TabOrder = 3
    end
    object UniContainerPanel5: TUniContainerPanel
      Left = 0
      Top = 0
      Width = 497
      Height = 25
      Hint = ''
      ParentColor = False
      Align = alLeft
      TabOrder = 4
      object lblOrganisasi: TUniLabel
        Left = 0
        Top = 0
        Width = 4
        Height = 19
        Hint = ''
        Caption = ''
        Align = alClient
        ParentFont = False
        Font.Height = -16
        Font.Name = 'Roboto'
        TabOrder = 1
      end
    end
  end
  object UniNativeImageList2: TUniNativeImageList
    Left = 128
    Top = 128
  end
  object UniNativeImageList1: TUniNativeImageList
    Left = 136
    Top = 72
    Images = {
      04000000FFFFFF1F057E04000000000100010010100000010020006804000016
      0000002800000010000000200000000100200000000000000000000000000000
      000000000000000000000000000000000000008C7973FF000000000000000000
      00000063A65AFF848684FF848684FF848684FF848684FF848684FF848684FF84
      8684FF848684FF848684FF00000000000000008C7163FF00000000000000007B
      6152FF63A65AFF848684FFE7E7E7FFE7E7E7FFE7E7E7FFE7E7E7FFE7E7E7FFE7
      E7E7FFE7E7E7FF848684FF00000000000000008C7163FF8C7973FF8C7163FF31
      A631FF63A65AFF848684FFE7E7E7FFE7E7E7FFE7E7E7FF212021FFE7E7E7FFE7
      E7E7FFE7E7E7FF848684FF00000000000000008C7973FF000000000000000063
      A65AFF84B684FF848684FFF7F7EFFFF7F7EFFFF7F7EFFF212021FFF7F7EFFFF7
      F7EFFFF7F7EFFF848684FF00000000000000008C7163FF000000000000000000
      00000063A65AFF848684FFF7F7EFFF181818FF181818FF000000FF181818FF18
      1818FFF7F7EFFF848684FF00000000000000008C7973FF000000000000000000
      00000000000000848684FFFFF7F7FFFFF7F7FFFFF7F7FF081010FFFFF7F7FFFF
      F7F7FFFFF7F7FF848684FF00000000000000008C7163FF000000000000000000
      00000063A65AFF848684FFFFF7F7FFFFF7F7FFFFF7F7FF000000FFFFF7F7FFFF
      F7F7FFFFF7F7FF848684FF00000000000000008C7973FF000000000000000063
      A65AFF63A65AFF848684FFFFFFF7FFFFFFF7FFFFFFF7FFFFFFF7FFFFFFF7FFFF
      FFF7FFFFFFF7FF848684FF00000000000000008C7163FF8C7973FF8C7163FF31
      A631FF63A65AFF8C8E94FF848684FF848684FF848684FF848684FF848684FF84
      8684FF848684FF8C8E94FF00000000000000008C7163FF000000000000000063
      A65AFF63A65AFF84B684FF84B684FF63A65AFF00000000000000000000000000
      000000000000000000000000000000000000008C7163FF000000000000000000
      00000063A65AFF63A65AFF63A65AFF0000000000000000000000000000000000
      00000000000000000000000000000063A65AFF63A65AFF7B6152FF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000063A65AFF63A65AFF63A65AFF63A65AFF63A65AFF00
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000031A631FF63A65AFF63A65AFF84B684FF31A631FF00
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000063A65AFF63A65AFF9CDFA5FF63A65AFF63A65AFF00
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000063A65AFF63A65AFF63A65AFF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000DC00AC41D800AC41C000AC41D800AC41DC00AC41DE
      00AC41DC00AC41D800AC41C000AC41D83FAC41DC7FAC418FFFAC4107FFAC4107
      FFAC4107FFAC418FFFAC41FFFFFF1F057E040000000001000100101000000100
      2000680400001600000028000000100000002000000001002000000000000000
      00000000000000000000000000000000000000000000000000008C7973FF0000
      0000000000000000000063A65AFF848684FF848684FF848684FF848684FF8486
      84FF848684FF848684FF848684FF848684FF00000000000000008C7163FF0000
      0000000000007B6152FF63A65AFF848684FFE7E7E7FFE7E7E7FFE7E7E7FFE7E7
      E7FFE7E7E7FFE7E7E7FFE7E7E7FF848684FF00000000000000008C7163FF8C79
      73FF8C7163FF31A631FF63A65AFF848684FFE7E7E7FFE7E7E7FFE7E7E7FFE7E7
      E7FFE7E7E7FFE7E7E7FFE7E7E7FF848684FF00000000000000008C7973FF0000
      00000000000063A65AFF84B684FF848684FFF7F7EFFFF7F7EFFFF7F7EFFFF7F7
      EFFFF7F7EFFFF7F7EFFFF7F7EFFF848684FF00000000000000008C7163FF0000
      0000000000000000000063A65AFF848684FFF7F7EFFF181818FF181818FF0000
      00FF181818FF181818FFF7F7EFFF848684FF00000000000000008C7973FF0000
      0000000000000000000000000000848684FFFFF7F7FFFFF7F7FFFFF7F7FFFFF7
      F7FFFFF7F7FFFFF7F7FFFFF7F7FF848684FF00000000000000008C7163FF0000
      0000000000000000000063A65AFF848684FFFFF7F7FFFFF7F7FFFFF7F7FFFFF7
      F7FFFFF7F7FFFFF7F7FFFFF7F7FF848684FF00000000000000008C7973FF0000
      00000000000063A65AFF63A65AFF848684FFFFFFF7FFFFFFF7FFFFFFF7FFFFFF
      F7FFFFFFF7FFFFFFF7FFFFFFF7FF848684FF00000000000000008C7163FF8C79
      73FF8C7163FF31A631FF63A65AFF8C8E94FF848684FF848684FF848684FF8486
      84FF848684FF848684FF848684FF8C8E94FF00000000000000008C7163FF0000
      00000000000063A65AFF63A65AFF84B684FF84B684FF63A65AFF000000000000
      00000000000000000000000000000000000000000000000000008C7163FF0000
      0000000000000000000063A65AFF63A65AFF63A65AFF00000000000000000000
      0000000000000000000000000000000000000000000063A65AFF63A65AFF7B61
      52FF000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000063A65AFF63A65AFF63A65AFF63A6
      5AFF63A65AFF0000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000031A631FF63A65AFF63A65AFF84B6
      84FF31A631FF0000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000063A65AFF63A65AFF9CDFA5FF63A6
      5AFF63A65AFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000063A65AFF63A65AFF63A6
      5AFF000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DC00AC41D800AC41C000AC41D800
      AC41DC00AC41DE00AC41DC00AC41D800AC41C000AC41D83FAC41DC7FAC418FFF
      AC4107FFAC4107FFAC4107FFAC418FFFAC41FFFFFF1F040101000089504E470D
      0A1A0A0000000D49484452000000100000001008060000001FF3FF6100000009
      7048597300000EC300000EC301C76FA864000000B349444154388D6360A01030
      3EEF739BCFC0C09080437E8164D1AE444206FCC7A760E6272B9C720D0D0D8C2C
      849C585F5F8F55BCB1B191818181818165E6272BBC8AB0CB20004117C06C22CB
      005C2E43369889900B08018A0D2018065090C8C8C8B8806C03181919175C0B35
      C29A5E8875010303030383E6AAB30CEFB62D636060606010F28A62B81E664C9A
      0177B27D1914BB96C1D90C0CD40A444289050654A66E867B4165EA6686EB61C6
      0C8CC4DA842B1001A91430D225B86B260000000049454E44AE426082FFFFFF1F
      057E040000000001000100101000000100200068040000160000002800000010
      0000002000000001002000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000006AA361FF388D35FF1A
      7D1AFF1D7F1DFF3B8E38FF73A668FF0000000000000000000000000000000000
      0000000000000000000000000000007BAB70FF208121FF26912AFF26992CFF24
      9E2BFF219B27FF219527FF238E25FF1F801FFF93B583FF000000000000000000
      00000000000000000000003D8F39FF2F8F32FF3BAA46FF38AB42FF31A83BFF2D
      A535FF2BA433FF2DA535FF31A83BFF33A43CFF2A8B2CFF51984BFF0000000000
      000000000000007CAB70FF369539FF4BB558FF44B250FF3DAE49FF38AB43FF3C
      A342FF3DA141FF35A93FFF38AB43FF3DAE49FF44B250FF2F8D2FFF9AB88AFF00
      00000000000000248324FF52B760FF50B85EFF4AB557FF44B251FF46A94DFFE7
      E1DCFF4C9E4BFF3DAE48FF40AF4CFF44B251FF4AB557FF48AF54FF238222FF00
      00000073A769FF41A24AFF5CBE6CFF56BB65FF50B85FFF50AF59FFE7E1DCFFE7
      E1DCFF599B54FF53A254FF55A456FF57A559FF57AE5EFF56BB65FF38983DFF8C
      B17DFF499545FF58B768FF62C273FF5CBF6DFF5BB466FFE7E1DCFFE7E1DCFFE7
      E1DCFFE7E1DCFFE7E1DCFFE7E1DCFFF3EFEBFF61AA64FF5CBF6DFF4BAC56FF57
      9B51FF2D872CFF6CC67EFF68C57BFF66BA72FFE7E1DCFFE7E1DCFFE7E1DCFFE7
      E1DCFFE7E1DCFFE7E1DCFFE7E1DCFFF3EFEBFF66AD6AFF63C275FF5FBC6FFF27
      8426FF2A8529FF72CA86FF6FC983FFF3EFEBFFF3EFEBFFF3EFEBFFF3EFEBFFF3
      EFEBFFF3EFEBFFF3EFEBFFF3EFEBFFF3EFEBFF6CB071FF6AC67DFF65C076FF2D
      882CFF449341FF68BF79FF76CC8BFF71CA86FFFAF5F4FFFAF5F4FFFAF5F4FFFA
      F5F4FFFAF5F4FFFAF5F4FFFAF5F4FFFAF5F4FF72B378FF71CA86FF58B266FF59
      9B52FF71A667FF51AB5EFF7DD093FF79CE8FFF76CC8BFFFAF5F4FFF6F1F0FFF6
      F1F0FFFAF5F4FFFAF5F4FFFAF5F4FFFAF5F4FF77C386FF79CE8FFF459F4DFF8C
      B17EFF00000000268427FF7DCE92FF81D298FF7ED194FF7BCF91FFFAF5F4FFF6
      F1F0FF7AB781FF78CE8EFF79CE8FFF7BCF91FF7ED194FF71C585FF248324FF00
      000000000000007DAB71FF499E4FFF89D7A1FF86D59DFF83D49BFF82D399FFFA
      F5F4FF80C891FF81D297FF82D399FF83D49BFF86D59DFF3A923DFF9AB88AFF00
      000000000000000000000040903DFF439B49FF82CF98FF8CD8A4FF8AD7A3FF89
      D7A1FF89D7A1FF89D7A1FF8AD7A3FF7BCA8FFF3A933DFF559A4EFF0000000000
      0000000000000000000000000000007DAB71FF248324FF51A95DFF6EBF7FFF87
      D39EFF83D099FF6BBC7CFF4CA456FF218222FF93B584FF000000000000000000
      000000000000000000000000000000000000000000000075A86BFF4A9648FF28
      8527FF288527FF4B9648FF76A86BFF0000000000000000000000000000000000
      000000F81FAC41E007AC41C003AC418001AC418001AC410000AC410000AC4100
      00AC410000AC410000AC410000AC418001AC418001AC41C003AC41E007AC41F8
      1FAC41}
  end
  object QMenu: TFDQuery
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'SELECT mc.menu_id,mc.id,mc.description,m.description menu'
      'FROM menu_child mc'
      'LEFT JOIN menu m ON mc.menu_id = m.id'
      'WHERE mc.flg_active = 1 AND mc.id IN ('
      'SELECT menu_child_id'
      'FROM user_profile_menus'
      'WHERE user_profile_id = :user_profile_id  )'
      'ORDER BY m.id,mc.sort_seq')
    Left = 24
    Top = 72
    ParamData = <
      item
        Name = 'USER_PROFILE_ID'
        DataType = ftString
        ParamType = ptInput
        Value = '0'
      end>
  end
  object QMenuClass: TFDQuery
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id,name,description from menu_child where id = :id')
    Left = 26
    Top = 128
    ParamData = <
      item
        Name = 'ID'
        ParamType = ptInput
        Value = Null
      end>
  end
  object UniPopupMenu1: TUniPopupMenu
    Alignment = paRight
    Left = 859
    Top = 75
    object Gantipassword2: TUniMenuItem
      Caption = 'Ganti password'
      OnClick = Gantipassword2Click
    end
    object Logout1: TUniMenuItem
      Caption = 'Keluar'
      OnClick = Logout1Click
    end
  end
  object QNotif: TFDQuery
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'SELECT DISTINCT id,validate_on'
      'FROM'
      'result_detail'
      'WHERE'
      'id IN'
      '('
      'SELECT nomor'
      'FROM order_header'
      'WHERE pasien_id IN ('
      'SELECT id'
      'FROM pasien'
      'WHERE noreg = :noreg)) AND validate_on > ('
      'SELECT last_result_detail_id'
      'FROM notifikasi'
      'WHERE noreg = :noreg AND user_id = :user_id)')
    Left = 698
    Top = 79
    ParamData = <
      item
        Name = 'NOREG'
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'USER_ID'
        ParamType = ptInput
      end>
  end
  object QNotifList: TFDQuery
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'SELECT noreg,notifikasi_ke,notifikasi_receiver'
      'FROM notifikasi'
      'WHERE user_id = :user_id')
    Left = 746
    Top = 79
    ParamData = <
      item
        Name = 'USER_ID'
        ParamType = ptInput
        Value = Null
      end>
  end
  object QNotifAct: TFDQuery
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      
        'SELECT oh.nomor,oh.tanggal,p.noreg,p.nama,d.TEST_NM,d.RESULT_VAL' +
        'UE,d.REF_RANGE,d.Flag,d.UNIT,'
      'd.VALIDATE_ON,d.VALIDATE_BY'
      'FROM'
      'result_detail d'
      'LEFT JOIN order_header oh ON d.id = oh.nomor'
      'LEFT JOIN pasien p ON oh.pasien_id = p.id'
      'WHERE'
      'd.id = :id'
      'AND d.validate_on = :validate_on')
    Left = 794
    Top = 79
    ParamData = <
      item
        Name = 'ID'
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'VALIDATE_ON'
        ParamType = ptInput
      end>
  end
  object DataSource1: TDataSource
    DataSet = QNotif
    Left = 282
    Top = 199
  end
  object cmdUpd: TFDCommand
    Connection = UniMainModule.FDConnection1
    Left = 698
    Top = 127
  end
  object QTimeout: TFDQuery
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      
        'SELECT value FROM user_parameters WHERE name = '#39'NOTIFIKASI_TIMOU' +
        'T'#39' and user_id = :user_id;')
    Left = 744
    Top = 128
    ParamData = <
      item
        Name = 'USER_ID'
        ParamType = ptInput
        Value = Null
      end>
  end
  object DataSource2: TDataSource
    DataSet = QNotifList
    Left = 370
    Top = 207
  end
  object DataSource3: TDataSource
    DataSet = QNotifAct
    Left = 466
    Top = 215
  end
  object QParameter: TFDQuery
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      
        'select value_text,value_char,value_num from parameters where nam' +
        'e = :name')
    Left = 362
    Top = 111
    ParamData = <
      item
        Name = 'NAME'
        DataType = ftString
        ParamType = ptInput
        Value = 'x'
      end>
  end
  object upmLokasi: TUniPopupMenu
    Alignment = paRight
    Left = 843
    Top = 115
  end
end
