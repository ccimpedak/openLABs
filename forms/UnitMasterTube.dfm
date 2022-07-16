object frmMasterTube: TfrmMasterTube
  Left = 0
  Top = 0
  ClientHeight = 482
  ClientWidth = 654
  Caption = 'Master Tube'
  OnShow = UniFormShow
  BorderStyle = bsDialog
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  Font.Height = -13
  Font.Name = 'Roboto'
  OnBeforeShow = UniFormBeforeShow
  PixelsPerInch = 96
  TextHeight = 15
  object UniContainerPanel1: TUniContainerPanel
    Left = 0
    Top = 0
    Width = 305
    Height = 482
    Hint = ''
    ParentColor = False
    Align = alLeft
    TabOrder = 0
    object UniDBGrid1: TUniDBGrid
      Left = 0
      Top = 41
      Width = 305
      Height = 397
      Cursor = crHandPoint
      Hint = ''
      DataSource = DSTube
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgAutoRefreshRow]
      WebOptions.Paged = False
      WebOptions.FetchAll = True
      LoadMask.Message = 'Loading data...'
      Align = alClient
      Font.Height = -13
      Font.Name = 'Roboto'
      ParentFont = False
      TabOrder = 1
      OnCellClick = UniDBGrid1CellClick
      Columns = <
        item
          FieldName = 'kode'
          Title.Caption = 'kode'
          Width = 56
          Font.Name = 'Roboto'
        end
        item
          FieldName = 'nama'
          Title.Caption = 'nama'
          Width = 184
          Font.Name = 'Roboto'
        end>
    end
    object UniContainerPanel3: TUniContainerPanel
      Left = 0
      Top = 0
      Width = 305
      Height = 41
      Hint = ''
      ParentColor = False
      Align = alTop
      TabOrder = 2
    end
    object edCariNama: TUniEdit
      Left = 4
      Top = 8
      Width = 253
      Hint = ''
      Text = ''
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Roboto'
      TabOrder = 3
    end
    object UniContainerPanel7: TUniContainerPanel
      Left = 0
      Top = 438
      Width = 305
      Height = 44
      Hint = ''
      ParentColor = False
      Align = alBottom
      TabOrder = 4
      object btnHapus: TUniSpeedButton
        Left = 96
        Top = 6
        Width = 89
        Height = 26
        Hint = ''
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          1800000000000003000000000000000000000000000000000000FFFFFF140EAE
          1711B8100BA1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF100B
          A11711B8140EAEFFFFFF1F1AB52522E92723F11F1BD1130EA6FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF130EA61F1BD12723F12522E91F1AB53D3AC84648F6
          2425F12A2BF32121D4140FADFFFFFFFFFFFFFFFFFFFFFFFF140FAD2121D42A2B
          F32425F14648F63D3AC8221CB66262E1444BF3262DEF2C33F22326D71812B3FF
          FFFFFFFFFF1812B32326D72C33F2262DEF474DF46262E1221CB6FFFFFF241DBB
          6566E34853F32934EF2F3BF2262BD91A13BA1A13BA262BD92F3BF22834EF4752
          F35F61DF241DBAFFFFFFFFFFFFFFFFFF2621C2656AE54756F32C3DF03041F12B
          36E42B36E43041F12D3DF04A59F35D5FE02119BFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF2721C66267E64356F23044F03448F23448F23044EF4255F26166E5221A
          C4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2C23CC4551E9354DF136
          4CEF364CEF354DF04251EA2B23CDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF1D14CE3240E63C54F23850F0384FF03B54F23445E91D15CEFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1F17D4313EE43E58F13953F045
          5EF2455FF23A53F03E57F0303AE31F15D3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          2018D93542E7425FF33D59F1556EF3737FF2737EF2566EF33D59F1425EF3313A
          E41F16D9FFFFFFFFFFFFFFFFFF2018DE3744E94663F2405DF15C77F36E76EF30
          28DF2E25DF7078F05D77F4405DF14562F2333DE82117DDFFFFFF221BE23947EC
          4A69F34462F25F7AF3686EF0271FE2FFFFFFFFFFFF2C23E2717AF1607BF44362
          F24A69F33846EB2019E24144EC5372F44464F26481F46E76F2271EE6FFFFFFFF
          FFFFFFFFFFFFFFFF2D25E7747CF26480F44564F25270F33D41EB4441ED7B8FF5
          7A94F6737BF32D24EAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2D24EA737C
          F37A93F67A8FF64441EDFFFFFF4845F05A59F22D24EDFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF2D24ED5959F24844F0FFFFFF}
        Caption = 'Hapus'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Roboto'
        ParentColor = False
        Color = clWindow
        TabOrder = 1
        OnClick = btnHapusClick
      end
      object UniSpeedButton1: TUniSpeedButton
        Left = 191
        Top = 6
        Width = 91
        Height = 26
        Hint = ''
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFBBE4C270CF8527B7471EBA401EBA4027B74770CF85BBE4C2FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFDFA4FB96219C1401FCE4C24DC5827
          DD5C27DD5C24DC581FCE4C19C1404FB962FAFDFAFFFFFFFFFFFFFFFFFFFBFDFB
          21A93A1ED04E22D55521D35503B82C00A71200A71203B82C21D35522D5551ED0
          4E21A93AFBFDFBFFFFFFFFFFFF4EB15B1ECE4D21D3541FCC4D0FCC4500AD13FF
          FFFFFFFFFF00AD130FCC451FCC4D21D3541ECE4D4EB15BFFFFFFBDDEBE17BA3F
          21DA5A1ECC5120D0530DC74200BE25FFFFFFFFFFFF00BE250DC74220D0531ECC
          5121DA5A17BA3FBDDEBE6ABC7417D15120D45F0BCC4A04CA4300C13300BC22FF
          FFFFFFFFFF00BD2700C23B10CA4B0ECC4C20D45F17D1516ABC7430A03F33E67A
          00B62D00AD1300AD1300AD1300AD13FFFFFFFFFFFF00AD1300BD2700BD2300AD
          1300B62D33E67A30A14130A34381FCC300AF21FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00AF2181FCC430A14223953785FDCC
          2AC262FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF2AC26285FDCC23953533933D7BFAC33CD07D71C7801EBF5921C05B0ABA4DFF
          FFFFFFFFFF10BC5122C05C1EBF5971C7803CD07D7BFAC333933D67AB668AE5B9
          65EAB050DF9756DF9C41DB8D22C05CFFFFFFFFFFFF22C05C49DC9356DF9C50DF
          9765EAB08AE5B967AB66B9D4B94EB068AFFFEA5EE0A156E19F45DE9766D589FF
          FFFFFFFFFF23C05B50E09E56E19F5EE0A1AFFFEA4EB068B9D4B9FFFFFF458945
          7BDCA8B6FFEF76E5B551DFA366D589FFFFFFFFFFFF24BF5956E2A876E5B5B6FF
          EF7BDCA8458945FFFFFFFFFFFFFAFDFA1572156DD6A3B7FFF5AAF7E370E0B022
          C05C22C05C74E2B3ABF7E4B7FFF56DD6A3157215FAFDFAFFFFFFFFFFFFFFFFFF
          F9FCF945864538A75E7FE1B8A9FFECB9FFFBB9FFFBA9FFEC7FE1B838A75E4586
          45F9FCF9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB7CEB767A567247D3328
          8738288738247D3367A567B7CEB7FFFFFFFFFFFFFFFFFFFFFFFF}
        Caption = 'Tambah'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Roboto'
        ParentColor = False
        Color = clWindow
        TabOrder = 2
        OnClick = UniSpeedButton1Click
      end
    end
  end
  object UniContainerPanel2: TUniContainerPanel
    Left = 305
    Top = 0
    Width = 349
    Height = 482
    Hint = ''
    ParentColor = False
    Align = alClient
    TabOrder = 1
    ExplicitLeft = 299
    ExplicitTop = -105
    ExplicitWidth = 318
    ExplicitHeight = 587
    object UniLabel1: TUniLabel
      Left = 16
      Top = 26
      Width = 29
      Height = 15
      Hint = ''
      Caption = 'Kode'
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Roboto'
      TabOrder = 6
    end
    object edNama: TUniEdit
      Left = 84
      Top = 50
      Width = 213
      Hint = ''
      Text = ''
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Roboto'
      TabOrder = 2
    end
    object UniLabel3: TUniLabel
      Left = 16
      Top = 54
      Width = 34
      Height = 15
      Hint = ''
      Caption = 'Nama'
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Roboto'
      TabOrder = 7
    end
    object btnSave: TUniSpeedButton
      Left = 212
      Top = 184
      Width = 97
      Height = 26
      Hint = ''
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000C1761BC27519
        BD6B13B96504B96504B96504BA6504BA6504BA6504BA6504BA6504BA6504BA65
        04BC690AB96A15C3791FD5933DEFB736CDC6C0E9F8FFDBE5F6DBE8F8DBE8F8DB
        E8F9DBE8F8DAE7F8DBE7F8D8E4F5E9F6FFCDC6C0EAA714C0761DCD9551E8AE3C
        DCD7D4ECE8E9ADA0A2A79B9E9E939594898C8A818583797C7B7276685F64ECE8
        E9DCD7D4E59E20C77B25D09653EAB447DCD7D4EFF0EFDFDEDCE1E0DFE0DFDEDF
        E0DDE0DFDDDFDEDDDFE0DEDBD9D9EDEDEDDCD7D4E7A62BC9802BD49B58EBB950
        DCD7D4ECE8E9A99D9FA4999E9A919492888B897F8582797C7A7177655C62ECE8
        E9DCD7D4E8AC37CC8531D69E5BEDBD5ADCD7D4FFFFFFFFFEFEFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCD7D4EAB340D08B34D9A45EF0C263
        DCD7D4ECE8E9A99D9FA4999E9A919492888B897F8582797C7A7177655C62ECE8
        E9DCD7D4EDB749D2903AD8A35CF0C66DDCD7D4FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCD7D4EEBD54D7963EDEAC69F9D281
        C1975C9A7B6095775E97795D97795D97795D97795D97795C97795C95775E9A7A
        5EC19A64F7CA6BD99B44DDAB67F6D58BFFD056C0A887C8C5C9CEC6BFCDC6C0CD
        C6C0CDC6BFD6D0CAD6D3D0CFCED4C0A888FFD25DF3CC75DCA148DCA966F6D993
        FBC85DC2B4A2D7DEEBDDDDDDDCDDDEDCDBDDE7E8EAC8BAA7A29692C2B4A2C6BC
        A9FBCB63F3D07EE0A74CE5B973F6DA97FBCC62C8BAA7DDE0E9E1DFDDE0DFDEDF
        DDDCEFF3F99F886FE5AF479E9189C7BDB2FDCF6AF5D484E3AC51E9BC75F8DD9E
        FDCF69CEC0AFE3E7EFE7E5E3E6E5E4E5E4E2F1F6FFBAA386FFE873B5AB9ECAC0
        B8FFD26EF9DA8EE7B25BEAC079F8E09BFBD165D3C4AFEAEEF6ECEBE8ECEBE9EB
        E9E6FBFFFFA28E78DEAF4FA89C95D1C7B9FFDA78F5D889E2A442ECC47EFEF4D5
        FFE290DCD7D4F5FFFFF6FEFFF6FEFFF6FDFFFFFFFFDFDDDCC8BAA7DFDDDCE5E4
        E2FFDE88E4AA45FCF5ECECC681F0CA82F4CA7DE8C788EFCF94EFD498EDCF92EE
        D092EED093F2D396F7D79BF6D69BE6C48AEBB552FDF9F2FFFFFF}
      Caption = 'Simpan'
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Roboto'
      ParentColor = False
      Color = clWindow
      TabOrder = 8
      OnClick = btnSaveClick
    end
    object edKode: TUniEdit
      Left = 84
      Top = 24
      Width = 121
      Hint = ''
      Text = ''
      TabOrder = 1
    end
    object UniLabel2: TUniLabel
      Left = 16
      Top = 142
      Width = 48
      Height = 15
      Hint = ''
      Caption = 'Qty Print'
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Roboto'
      TabOrder = 9
    end
    object edPrintQty: TUniNumberEdit
      Left = 84
      Top = 135
      Width = 121
      Hint = ''
      Alignment = taCenter
      TabOrder = 5
      DecimalSeparator = '.'
    end
    object UniLabel4: TUniLabel
      Left = 16
      Top = 86
      Width = 57
      Height = 15
      Hint = ''
      Caption = 'Specimen'
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Roboto'
      TabOrder = 10
    end
    object cbSpecimen: TUniDBLookupComboBox
      Left = 84
      Top = 78
      Width = 248
      Height = 23
      Hint = ''
      ListField = 'nama'
      ListSource = DSSpecimen
      KeyField = 'nama'
      ListFieldIndex = 0
      DataField = 'id'
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Roboto'
      AnyMatch = True
      TabOrder = 3
      Color = clWindow
      Style = csDropDown
    end
    object UniLabel5: TUniLabel
      Left = 16
      Top = 110
      Width = 32
      Height = 15
      Hint = ''
      Caption = 'Suffix'
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Roboto'
      TabOrder = 11
    end
    object edSuffix: TUniEdit
      Left = 84
      Top = 106
      Width = 213
      Hint = ''
      Text = ''
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Roboto'
      TabOrder = 4
    end
  end
  object cmdExec: TFDCommand
    Connection = UniMainModule.FDConnection1
    Left = 136
    Top = 352
  end
  object QCek: TFDQuery
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      
        'select * from test where kode  = :kode and organisasi_id = :orga' +
        'nisasi_id')
    Left = 80
    Top = 352
    ParamData = <
      item
        Name = 'KODE'
        DataType = ftString
        ParamType = ptInput
        Value = '1'
      end
      item
        Name = 'ORGANISASI_ID'
        DataType = ftString
        ParamType = ptInput
        Value = '1'
      end>
  end
  object QTube: TFDQuery
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      
        'select tubes.id,tubes.kode,tubes.nama,tubes.print_qty,tubes.suff' +
        'ix, specimen.nama specimen'
      'from'
      'tubes'
      'left join specimen on tubes.specimen_id=specimen.id'
      'where'
      'tubes.nama like :nama'
      'and tubes.organisasi_id = :organisasi_id'
      'order by tubes.nama')
    Left = 89
    Top = 264
    ParamData = <
      item
        Name = 'NAMA'
        DataType = ftString
        ParamType = ptInput
        Value = '%'
      end
      item
        Name = 'ORGANISASI_ID'
        DataType = ftString
        ParamType = ptInput
        Value = '0'
      end>
  end
  object DSTube: TDataSource
    DataSet = QTube
    Left = 137
    Top = 264
  end
  object QSpecimen: TFDQuery
    Aggregates = <
      item
      end>
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select * '
      'from specimen'
      'where'
      'organisasi_id = :organisasi_id'
      'order by nama')
    Left = 328
    Top = 200
    ParamData = <
      item
        Name = 'ORGANISASI_ID'
        DataType = ftString
        ParamType = ptInput
        Value = '0'
      end>
  end
  object DSSpecimen: TDataSource
    DataSet = QSpecimen
    Left = 384
    Top = 200
  end
end
