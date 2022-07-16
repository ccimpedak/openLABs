object frmAdmTest: TfrmAdmTest
  Left = 0
  Top = 0
  ClientHeight = 546
  ClientWidth = 964
  Caption = 'Test'
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
    Width = 465
    Height = 546
    Hint = ''
    ParentColor = False
    Align = alLeft
    TabOrder = 0
    object UniDBGrid1: TUniDBGrid
      Left = 0
      Top = 41
      Width = 465
      Height = 461
      Cursor = crHandPoint
      Hint = ''
      DataSource = DSTest
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
          Title.Caption = 'Kode'
          Width = 93
          Font.Name = 'Roboto'
        end
        item
          FieldName = 'nama'
          Title.Caption = 'Nama'
          Width = 246
          Font.Name = 'Roboto'
        end
        item
          FieldName = 'tube'
          Title.Caption = 'Tabung'
          Width = 84
          Font.Name = 'Roboto'
          ReadOnly = True
        end>
    end
    object UniContainerPanel3: TUniContainerPanel
      Left = 0
      Top = 0
      Width = 465
      Height = 41
      Hint = ''
      ParentColor = False
      Align = alTop
      TabOrder = 2
      ExplicitWidth = 473
    end
    object edCariNama: TUniEdit
      Left = 4
      Top = 8
      Width = 368
      Hint = ''
      Text = ''
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Roboto'
      TabOrder = 3
      OnChange = edCariNamaChange
    end
    object UniContainerPanel7: TUniContainerPanel
      Left = 0
      Top = 502
      Width = 465
      Height = 44
      Hint = ''
      ParentColor = False
      Align = alBottom
      TabOrder = 4
      ExplicitWidth = 473
      object btnHapus: TUniSpeedButton
        Left = 248
        Top = 15
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
        Left = 359
        Top = 15
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
    Left = 465
    Top = 0
    Width = 499
    Height = 546
    Hint = ''
    ParentColor = False
    Align = alClient
    TabOrder = 1
    ExplicitLeft = 521
    ExplicitWidth = 437
    object UniLabel1: TUniLabel
      Left = 16
      Top = 24
      Width = 29
      Height = 15
      Hint = ''
      Caption = 'Kode'
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Roboto'
      TabOrder = 2
    end
    object edNama: TUniEdit
      Left = 88
      Top = 50
      Width = 335
      Hint = ''
      Text = ''
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Roboto'
      TabOrder = 1
    end
    object UniLabel3: TUniLabel
      Left = 16
      Top = 52
      Width = 34
      Height = 15
      Hint = ''
      Caption = 'Nama'
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Roboto'
      TabOrder = 3
    end
    object btnSave: TUniSpeedButton
      Left = 401
      Top = 517
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
      TabOrder = 4
      OnClick = btnSaveClick
    end
    object btnHarga: TUniSpeedButton
      Left = 6
      Top = 517
      Width = 97
      Height = 26
      Hint = ''
      Caption = 'Harga'
      ParentColor = False
      Color = clWindow
      TabOrder = 5
      OnClick = btnHargaClick
    end
    object pcAddConf: TUniPageControl
      Left = 6
      Top = 78
      Width = 490
      Height = 433
      Hint = ''
      ActivePage = tsGeneral
      TabOrder = 6
      object tsGeneral: TUniTabSheet
        Hint = ''
        Caption = 'General'
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 427
        ExplicitHeight = 218
        object UniLabel2: TUniLabel
          Left = 8
          Top = 8
          Width = 43
          Height = 15
          Hint = ''
          Caption = 'Tabung'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Roboto'
          TabOrder = 0
        end
        object cbTube: TUniDBLookupComboBox
          Left = 80
          Top = 3
          Width = 248
          Height = 23
          Hint = ''
          ListField = 'nama'
          ListSource = DSTubes
          KeyField = 'nama'
          ListFieldIndex = 0
          DataField = 'id'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Roboto'
          AnyMatch = True
          TabOrder = 1
          Color = clWindow
          Style = csDropDown
        end
        object UniLabel4: TUniLabel
          Left = 8
          Top = 32
          Width = 30
          Height = 15
          Hint = ''
          Caption = 'Abbr.'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Roboto'
          TabOrder = 2
        end
        object edAbbr: TUniEdit
          Left = 80
          Top = 32
          Width = 121
          Hint = ''
          Text = ''
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Roboto'
          TabOrder = 3
        end
        object cbConfidential: TUniCheckBox
          Left = 80
          Top = 60
          Width = 97
          Height = 17
          Hint = ''
          Caption = 'Confindential'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Roboto'
          TabOrder = 4
        end
        object cbAdaHarga: TUniCheckBox
          Left = 80
          Top = 83
          Width = 97
          Height = 17
          Hint = ''
          Caption = 'Ada harga'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Roboto'
          TabOrder = 5
        end
      end
      object tsConTest: TUniTabSheet
        Hint = ''
        Caption = 'Conc. Test'
        ExplicitWidth = 420
        object UniGroupBox1: TUniGroupBox
          Left = 0
          Top = 0
          Width = 482
          Height = 405
          Hint = ''
          Caption = 'Concurrent tests'
          Align = alClient
          TabOrder = 0
          ExplicitWidth = 420
          object UniContainerPanel4: TUniContainerPanel
            Left = 2
            Top = 15
            Width = 478
            Height = 32
            Hint = ''
            ParentColor = False
            Align = alTop
            TabOrder = 1
            ExplicitWidth = 416
            object UniSpeedButton2: TUniSpeedButton
              Left = 16
              Top = 4
              Width = 23
              Height = 22
              Hint = ''
              Glyph.Data = {
                36030000424D3603000000000000360000002800000010000000100000000100
                18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
                FFFFFFFFFFFFF5F5F5DADADACCCCCCCCCCCCCCCCCCCCCCCCDADADAF5F5F5FFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDDDDDDA3C0B3369D6E008C4B00
                8B4A008B4A008C4B369D6EA3C0B3E1E1E1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                E1E1E144A27700905001A16900AA7600AB7700AB7700AA7601A16900905055A8
                82E1E1E1FFFFFFFFFFFFFFFFFFF5F5F555A88200915202AC7700C38C00D69918
                DEA818DEA800D69900C38C01AB7600925355A882F5F5F5FFFFFFFFFFFFAECABE
                0090510FB48302D29900D69B00D193FFFFFFFFFFFF00D19300D69B00D19801AB
                76009050AECBBEFFFFFFFFFFFF369D6C16AB7811C99700D49A00D29700CD8EFF
                FFFFFFFFFF00CD8E00D29700D59B00C18C01A169369E6EFFFFFFFFFFFF008A48
                38C49C00D19800CD9200CB8E00C787FFFFFFFFFFFF00C78700CB8E00CE9300D0
                9A00AB76008C4BFFFFFFFFFFFF00894651D2AF12D4A3FFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFF00CF9700AD78008B4AFFFFFFFFFFFF008845
                66DDBE10D0A2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00CD
                9700AD78008B4AFFFFFFFFFFFF00884676E0C500CA9800C59000C48E00C187FF
                FFFFFFFFFF00C18700C48E00C79300CB9900AB76008C4BFFFFFFFFFFFF41A675
                59C9A449DEBC00C79400C79400C38EFFFFFFFFFFFF00C38E00C89600CB9A06C1
                9000A16840A878FFFFFFFFFFFFCCE8DB0A9458ADF8E918D0A700C49400C290FF
                FFFFFFFFFF00C39100C79905C89B18B787009050CCE8DBFFFFFFFFFFFFFFFFFF
                55B185199C63BCFFF75DE4C900C39700BF9000C09100C49822CAA231C2970393
                556ABC96FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6ABB940E965974D5B69FF3E092
                EFDA79E5CA5DD6B52EB58603915255B288FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFCCE8DB44A87700874400874300874400894644AA7ACCE8DBFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
              Caption = ''
              ParentColor = False
              Color = clWindow
              TabOrder = 1
              OnClick = UniSpeedButton2Click
            end
            object UniSpeedButton3: TUniSpeedButton
              Left = 352
              Top = 4
              Width = 23
              Height = 22
              Hint = ''
              Glyph.Data = {
                36030000424D3603000000000000360000002800000010000000100000000100
                18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
                FFFFFFFFFFFFE1E1E1CECECECCCCCCCCCCCCCCCCCCCECECEE1E1E1FFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1F1F1CCCCCC7079C63140C02B3BBE2B
                3ABE2B3BBE3140C07079C6CCCCCCF1F1F1FFFFFFFFFFFFFFFFFFFFFFFFF1F1F1
                A1A5C92B3BBE4A5BE26175FC697DFF697CFF697DFF6175FC4A5BE22B3BBEA1A5
                C9F1F1F1FFFFFFFFFFFFFFFFFFA1A5C92F3FC2596DF66276FF6074FE5F73FE5F
                73FD5F73FE6074FE6276FF596DF62F3FC2A1A5C9FFFFFFFFFFFFE1E1E12C3CBF
                5669F45D71FC5B6FFA5A6EF95A6EF95A6EF95A6EF95A6EF95B6FFA5D71FC5669
                F42C3CBFE1E1E1FFFFFF717AC74256DE576DFB5369F85268F75267F75267F752
                67F75267F75267F75268F75369F8576DFB4256DE717AC7FFFFFF3242C04E64F4
                4C63F7425AF43E56F43D55F43D55F43D55F43D55F43D55F43E56F4425AF44C63
                F74E64F43242C0FFFFFF2C3CBF5369F83E56F3FFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFF3E56F35369F82C3CBFFFFFFF2B3BBF6378F7
                334DF0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF334D
                F06378F72B3BBFFFFFFF2A39BF8696F82F4BEEFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFF2F4BEE8696F82A39BFFFFFFF2F3EC1A1ACF4
                3852ED2D48EC2B46EB2A46EB2A46EB2A46EB2A46EB2A46EB2B46EB2D48EC3852
                EDA1ACF42F3EC1FFFFFF838CDB6F7CDD8494F52E4AE9334DE9354FEA3650EA36
                50EA3650EA354FEA334DE92E4AE98494F56F7CDD838CDBFFFFFFFFFFFF2737BF
                9AA7F07F90F3324CE92D49E7304CE8314CE8304CE82D49E7324CE97F90F39AA7
                F02737BFFFFFFFFFFFFFFFFFFFC5CAEE2F3FC397A3EF9EACF76075ED3E57E924
                41E53E57E96075ED9EACF797A3EF2F3FC3C5CAEEFFFFFFFFFFFFFFFFFFFFFFFF
                C5C9EE2737BF6A77DC9EA9F2AFBAF8AFBBF8AFBAF89EA9F26A77DC2737BFC5C9
                EEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF838CDB2F3EC22737BF27
                37BF2737BF2F3EC2838CDBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
              Caption = ''
              ParentColor = False
              Color = clWindow
              TabOrder = 2
            end
          end
          object UniDBGrid2: TUniDBGrid
            Left = 2
            Top = 47
            Width = 478
            Height = 356
            Hint = ''
            DataSource = dsCon
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgAutoRefreshRow]
            WebOptions.Paged = False
            LoadMask.Message = 'Loading data...'
            Align = alClient
            TabOrder = 2
            Columns = <
              item
                FieldName = 'kode'
                Title.Caption = 'kode'
                Title.Font.Name = 'Roboto'
                Width = 74
                Font.Name = 'Roboto'
              end
              item
                FieldName = 'nama'
                Title.Caption = 'nama'
                Title.Font.Name = 'Roboto'
                Width = 303
                Font.Name = 'Roboto'
              end>
          end
        end
      end
      object UniTabSheet1: TUniTabSheet
        Hint = ''
        Caption = 'Nilai normal'
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 428
        ExplicitHeight = 433
        object UniContainerPanel5: TUniContainerPanel
          Left = 0
          Top = 0
          Width = 482
          Height = 41
          Hint = ''
          ParentColor = False
          Align = alTop
          TabOrder = 0
          ExplicitWidth = 420
          object UniButton1: TUniButton
            Left = 3
            Top = 10
            Width = 25
            Height = 25
            Hint = ''
            Caption = '^'
            TabOrder = 1
          end
          object UniButton2: TUniButton
            Left = 27
            Top = 10
            Width = 25
            Height = 25
            Hint = ''
            Caption = 'v'
            TabOrder = 2
          end
          object btnNNBaru: TUniButton
            Left = 430
            Top = 10
            Width = 49
            Height = 25
            Hint = ''
            Caption = 'Baru'
            TabOrder = 3
            OnClick = btnNNBaruClick
          end
          object UniButton4: TUniButton
            Left = 375
            Top = 10
            Width = 49
            Height = 25
            Hint = ''
            Caption = 'Hapus'
            TabOrder = 4
          end
        end
        object UniDBGrid3: TUniDBGrid
          Left = 0
          Top = 41
          Width = 482
          Height = 364
          Hint = ''
          DataSource = dsNilaiNormal
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgAutoRefreshRow]
          WebOptions.Paged = False
          LoadMask.Message = 'Loading data...'
          Align = alClient
          TabOrder = 1
          Columns = <
            item
              FieldName = 'priority'
              Title.Caption = 'Priority'
              Width = 50
            end
            item
              FieldName = 'umur_awal'
              Title.Caption = 'umur_awal'
              Width = 64
            end
            item
              FieldName = 'umur_akhir'
              Title.Caption = 'umur_akhir'
              Width = 64
            end
            item
              FieldName = 'umur_satuan'
              Title.Caption = 'umur_satuan'
              Width = 64
            end
            item
              FieldName = 'jenis_kelamin'
              Title.Caption = 'jenis_kelamin'
              Width = 64
            end
            item
              FieldName = 'nilai_normal'
              Title.Caption = 'nilai_normal'
              Width = 64
            end
            item
              FieldName = 'nilai_kritis'
              Title.Caption = 'nilai_kritis'
              Width = 64
            end>
        end
      end
    end
    object edKode: TUniEdit
      Left = 88
      Top = 22
      Width = 121
      Hint = ''
      Text = ''
      TabOrder = 7
    end
  end
  object QTubes: TFDQuery
    Aggregates = <
      item
      end>
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select * from tubes'
      'where'
      'organisasi_id = :organisasi_id'
      'order by nama')
    Left = 88
    Top = 176
    ParamData = <
      item
        Name = 'ORGANISASI_ID'
        DataType = ftString
        ParamType = ptInput
        Value = '1'
      end>
  end
  object DSTubes: TDataSource
    DataSet = QTubes
    Left = 128
    Top = 176
  end
  object cmdExec: TFDCommand
    Connection = UniMainModule.FDConnection1
    CommandText.Strings = (
      
        'update test set tube_id = :tube_id, abbreviation = :abbreviation' +
        ', nama = :nama, flg_confidential = :flg_confidential where kode ' +
        '= :kode and organisasi_id = :organisasi_id')
    ParamData = <
      item
        Name = 'TUBE_ID'
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'ABBREVIATION'
        ParamType = ptInput
      end
      item
        Name = 'NAMA'
        ParamType = ptInput
      end
      item
        Name = 'FLG_CONFIDENTIAL'
        ParamType = ptInput
      end
      item
        Name = 'KODE'
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'ORGANISASI_ID'
        ParamType = ptInput
      end>
    Left = 280
    Top = 424
  end
  object QCek: TFDQuery
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      
        'select * from test where kode  = :kode and organisasi_id = :orga' +
        'nisasi_id')
    Left = 184
    Top = 432
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
        Value = '0'
      end>
  end
  object QTest: TFDQuery
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select test.id,test.kode,test.nama,ifnull(harga.harga,0) harga,'
      'test.tube_id, '
      'tubes.nama tube,'
      'test.abbreviation,'
      'test.flg_confidential,'
      'test.ada_harga'
      'from '
      'test'
      'left join harga on test.id = harga.test_id'
      'left join tubes ON test.tube_id = tubes.id'
      'where test.nama LIKE  :nama'
      'and test.organisasi_id = :organisasi_id'
      'order by test.kode')
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
        Value = '1'
      end>
  end
  object DSTest: TDataSource
    DataSet = QTest
    Left = 121
    Top = 264
  end
  object QConTest: TFDQuery
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'SELECT t.id,t.kode,t.nama'
      'FROM'
      'test_concurrents tc'
      'LEFT JOIN test t ON  tc.child_test_id = t.id'
      'WHERE'
      'tc.parent_test_id = :test_id')
    Left = 353
    Top = 360
    ParamData = <
      item
        Name = 'TEST_ID'
        DataType = ftString
        ParamType = ptInput
        Value = '100'
      end>
  end
  object dsCon: TDataSource
    DataSet = QConTest
    Left = 353
    Top = 408
  end
  object QNilaiNormal: TFDQuery
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'SELECT *'
      'FROM'
      'v_nilai_normal'
      'WHERE'
      'test_id = :test_id'
      'order by priority')
    Left = 393
    Top = 368
    ParamData = <
      item
        Name = 'TEST_ID'
        DataType = ftString
        ParamType = ptInput
        Value = '100'
      end>
  end
  object dsNilaiNormal: TDataSource
    DataSet = QNilaiNormal
    Left = 393
    Top = 416
  end
end
