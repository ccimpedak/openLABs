object UniFOWorklist: TUniFOWorklist
  Left = 0
  Top = 0
  Width = 988
  Height = 569
  OnBeforeReady = UniFrameBeforeReady
  Font.Height = -13
  Font.Name = 'Roboto'
  TabOrder = 0
  ParentFont = False
  object UniContainerPanel1: TUniContainerPanel
    Left = 0
    Top = 0
    Width = 988
    Height = 140
    Hint = ''
    ParentColor = False
    Align = alTop
    TabOrder = 0
    object UniLabel1: TUniLabel
      Left = 16
      Top = 16
      Width = 75
      Height = 15
      Hint = ''
      Caption = 'Nama printer'
      TabOrder = 1
    end
    object edNamaPrinter: TUniEdit
      Left = 107
      Top = 16
      Width = 262
      Hint = ''
      Text = ''
      TabOrder = 2
    end
    object btnSimpan: TUniSpeedButton
      Left = 375
      Top = 16
      Width = 82
      Height = 26
      Hint = ''
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000DADADA3E3E3E
        0505050000000000000000000000000000000000000000000000000000000000
        000505053F3F3FDBDBDB3C3C3C0B0B0B60606014141414141466666666666666
        66666666666666666666661414141414146060600B0B0B3D3D3D040404616161
        FFFFFF333333333333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3333333333
        33FFFFFF606060040404000000666666FFFFFF333333333333FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF333333333333FFFFFF666666000000000000666666
        FFFFFF333333333333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3333333333
        33FFFFFF666666000000000000666666FFFFFF333333333333FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF333333333333FFFFFF666666000000000000666666
        FFFFFF3333331414146666666666666666666666666666666666661414143333
        33FFFFFF666666000000000000666666FFFFFF59595900000000000000000000
        0000000000000000000000000000595959FFFFFF666666000000000000666666
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF666666000000000000666666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF666666000000000000666666
        FFFFFFA9A9A9666666666666666666666666666666666666747474F7F7F7FFFF
        FFFFFFFF636363000000000000666666FFFFFF34343400000000000000000000
        00000000000000000F0F0FE6E6E6FFFFFFB9B9B9090909222222000000666666
        FFFFFF333333333333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBABA
        BA0909091C1C1CDBDBDB040404616161FFFFFF333333333333FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFB9B9B90909091D1D1DDCDCDCFFFFFF3B3B3B0B0B0B
        6161611414141414146666666666666666666666666666666363630808081D1D
        1DDCDCDCFFFFFFFFFFFFDADADA3D3D3D05050500000000000000000000000000
        0000000000000000000000232323DCDCDCFFFFFFFFFFFFFFFFFF}
      Caption = 'Simpan'
      ParentColor = False
      Color = clWindow
      TabOrder = 3
      OnClick = btnSimpanClick
    end
    object btnStar: TUniSpeedButton
      Left = 495
      Top = 16
      Width = 82
      Height = 26
      Hint = ''
      Glyph.Data = {
        B6020000424DB60200000000000036000000280000000D000000100000000100
        18000000000080020000C40E0000C40E000000000000000000002727274B4B4B
        DFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF000000000000000B0B0B8D8D8DFCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF000000003B3B3B323232000000333333CDCDCDFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000606060FBFBFB9090900C0C
        0C0404046E6E6EF3F3F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000606060
        FFFFFFFFFFFFE4E4E4505050000000202020B7B7B7FFFFFFFFFFFFFFFFFFFFFF
        FF00000000606060FFFFFFFFFFFFFFFFFFFFFFFFB2B2B21B1B1B000000555555
        E9E9E9FFFFFFFFFFFF00000000606060FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEF
        EFEF6E6E6E020202101010909090FDFDFD00000000606060FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBF2626260000004B4B4B00000000606060
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBF2626260000004B4B
        4B00000000606060FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEF6E6E6E020202
        101010909090FDFDFD00000000606060FFFFFFFFFFFFFFFFFFFFFFFFB2B2B21B
        1B1B000000555555E9E9E9FFFFFFFFFFFF00000000606060FFFFFFFFFFFFE4E4
        E4505050000000202020B7B7B7FFFFFFFFFFFFFFFFFFFFFFFF00000000606060
        FBFBFB9090900C0C0C0404046E6E6EF3F3F3FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF000000003B3B3B323232000000333333CDCDCDFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF000000000000000B0B0B8D8D8DFCFCFCFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF002727274B4B4BDFDFDFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00}
      Caption = 'Start'
      ParentColor = False
      Color = clWindow
      TabOrder = 4
      OnClick = btnStarClick
    end
    object btnStop: TUniSpeedButton
      Left = 583
      Top = 16
      Width = 82
      Height = 26
      Hint = ''
      Enabled = False
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFD4D4D47171712C2C2C0C0C0C0C0C0C2C2C2C727272D5D5D5FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F96C6C6C0303031010105757577F
        7F7F7F7F7F5656561010100303036E6E6EF9F9F9FFFFFFFFFFFFFFFFFFF9F9F9
        4242420303037E7E7EF4F4F4FFFFFFFFFFFFFFFFFFFFFFFFF3F3F37C7C7C0303
        03444444FAFAFAFFFFFFFFFFFF6B6B6B030303B1B1B1FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFB0B0B00303036E6E6EFFFFFFD4D4D4030303
        7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF7C7C7C030303D5D5D5707070111111F4F4F4FFFFFFFFFFFF4C4C4C11111111
        11111111111111114C4C4CFFFFFFFFFFFFF3F3F30F0F0F7272722A2A2A595959
        FFFFFFFFFFFFFFFFFF171717363636777777777777363636171717FFFFFFFFFF
        FFFFFFFF5757572C2C2C0C0C0C7F7F7FFFFFFFFFFFFFFFFFFF171717757575FF
        FFFFFFFFFF757575171717FFFFFFFFFFFFFFFFFF7D7D7D0E0E0E0C0C0C808080
        FFFFFFFFFFFFFFFFFF171717757575FFFFFFFFFFFF757575171717FFFFFFFFFF
        FFFFFFFF7E7E7E0D0D0D2A2A2A595959FFFFFFFFFFFFFFFFFF17171736363677
        7777777777363636171717FFFFFFFFFFFFFFFFFF5858582C2C2C6F6F6F111111
        F5F5F5FFFFFFFFFFFF4C4C4C1111111111111111111111114C4C4CFFFFFFFFFF
        FFF4F4F4101010717171D3D3D3030303818181FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7E7E7E030303D5D5D5FFFFFF6A6A6A
        040404B2B2B2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB1B1
        B10303036D6D6DFFFFFFFFFFFFF9F9F9424242040404818181F5F5F5FFFFFFFF
        FFFFFFFFFFFFFFFFF4F4F47F7F7F030303424242F9F9F9FFFFFFFFFFFFFFFFFF
        F9F9F96A6A6A0202021111115959597F7F7F7F7F7F5959591111110303036C6C
        6CF9F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3D3D36F6F6F2A2A2A0B
        0B0B0B0B0B2B2B2B707070D4D4D4FFFFFFFFFFFFFFFFFFFFFFFF}
      Caption = 'Stop'
      ParentColor = False
      Color = clWindow
      TabOrder = 5
      OnClick = btnStopClick
    end
    object UniLabel3: TUniLabel
      Left = 16
      Top = 72
      Width = 46
      Height = 15
      Hint = ''
      Caption = 'Rujukan'
      TabOrder = 6
    end
    object cbESCPOS: TUniCheckBox
      Left = 527
      Top = 59
      Width = 97
      Height = 17
      Hint = ''
      Caption = 'ESCPOS'
      TabOrder = 7
    end
    object UniLabel4: TUniLabel
      Left = 16
      Top = 114
      Width = 86
      Height = 15
      Hint = ''
      Caption = 'Last Transaksi'
      TabOrder = 8
    end
    object UniSpeedButton2: TUniSpeedButton
      Left = 82
      Top = 66
      Width = 23
      Height = 22
      Hint = ''
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFFF2E2D7FFFFFFFDFBF9C2762FCB7E26C97C24BE702CFDFBF9FFFFFFEFDF
        D5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEED8C9C97E37DDB18FFCF7F3D1872CE8
        AB2AE7A725CD8125FBF7F3D5A98CBA6C29E9D4C7FFFFFFFFFFFFFFFFFFF1DDCD
        CE8534EBB443DA9935D28B36E1A235E4A833E3A62EDE9A28CB802AD1871FE19A
        1EBF6F21ECD8CBFFFFFFF3E3D3D08936ECBD4FEAB84BEAB848EBB846E5AC3EDE
        9C35DC9831E0A030E8AC2FE5A62AE09E25E29D22BE6D23EFDDD0FEFCFAE5BD95
        E3AD4BECC055EAB94EE3A73EDEA03CE1A23BDE9D38D0862ECD8127E4A734E6A9
        30D7902ADAAF8EFEFCFAFEFBF7FEFBF7DDA349F0C860E8B148E7B249E5AE45DA
        973AD08732D89434D38F33C97C25EAB23AD08934FDF9F7FDFAF7E0A854E5AD4E
        ECC15BEDC15CE9B64CEABA4FE1A343F6E5D3F3E1D1B9672BD38F31C97D29DC9C
        35E4A83BD69137CB8138F1D79DF8E4A9F3D68BEDC464ECC159E9B44AF9EAD2FF
        FFFFFFFFFFEDD8C9B6621CDA9430CD8227ECBA46EDB942D69236F2DCAAFAECC7
        F7E7BEF4DFA9F5DEA7F0D189FFFFFFFFFFFFFFFFFFFFFFFFC17A39E3B35FD8A2
        54F2D481F2D489E9C788F0D7A2F2DCABF7E5B7F6E1AFF4DEAAF4DCA7F6E9CFFF
        FFFFFFFFFFEFDCC3E5C58DE9CC94EBD199F3DEAAECD199E8C891FFFEFBFFFDFB
        F2DBA8F9E9C1F2D9A0F5E1AFEFD49AF4E4C5F1DFC1E3BE85EED49FE0B97FF5E0
        AEECD19AFEFDFBFEFDFBFFFEFDF8ECCFF7E4B5F9EBC5F6E4B6EFD59CF1DCA8F2
        DCA9F1D8A5EED59FE2BE86F0D9A6F7E5B5F1D8A5F3E2C4FFFEFDFCF7EAF3DBA5
        FAEDC6F9EAC3FAEBC5FAE9C3F2DCAAEBCF98E9CB94EDD3A0F6E5B9F8E8BCF6E3
        B6F6E4B5EBCD94FAF3E7FFFFFFFCF5E6F4DFA9FAEEC8F6E4B6F5E0AEF9EAC1FB
        EDC7FAEDC6F8E8BDF3DBA8F4DFADF8E7BAEED49BFAF2E3FFFFFFFFFFFFFFFFFF
        FCF5E5F5DFABF8EACCFFFDFAF6E3B3FAEDCBFBEDC9F4E1AFFFFDFAF6E7C7F1D8
        A1FAF2E2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDF8ECFFFFFFFFFEFDF5E1AEF6
        E4B3F6E3B2F4DEAAFFFEFDFFFFFFFCF6EBFFFFFFFFFFFFFFFFFF}
      Caption = ''
      ParentColor = False
      Color = clWindow
      TabOrder = 9
      OnClick = UniSpeedButton2Click
    end
    object lblRjk: TUniLabel
      Left = 107
      Top = 69
      Width = 881
      Height = 15
      Hint = ''
      AutoSize = False
      Caption = '<empty>'
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Roboto'
      Font.Style = [fsBold]
      TabOrder = 10
    end
    object edLastNo: TUniEdit
      Left = 107
      Top = 112
      Width = 262
      Hint = ''
      Text = ''
      TabOrder = 11
    end
    object Like: TUniCheckBox
      Left = 107
      Top = 91
      Width = 106
      Height = 17
      Hint = ''
      Caption = 'No Urut like'
      TabOrder = 12
      OnChange = LikeChange
    end
    object edLike: TUniEdit
      Left = 212
      Top = 87
      Width = 57
      Hint = ''
      Enabled = False
      Text = '%'
      TabOrder = 13
    end
    object cbPrintLabel: TUniCheckBox
      Left = 527
      Top = 82
      Width = 97
      Height = 17
      Hint = ''
      Caption = 'Print Label'
      TabOrder = 14
    end
  end
  object UniContainerPanel2: TUniContainerPanel
    Left = 0
    Top = 140
    Width = 988
    Height = 56
    Hint = ''
    ParentColor = False
    Align = alTop
    TabOrder = 1
    object UniLabel2: TUniLabel
      Left = 16
      Top = 20
      Width = 80
      Height = 15
      Hint = ''
      Caption = 'No. Transaksi'
      TabOrder = 1
    end
    object edNoTrans: TUniEdit
      Left = 106
      Top = 16
      Width = 262
      Hint = ''
      Text = ''
      TabOrder = 2
    end
    object btnPreview: TUniSpeedButton
      Left = 374
      Top = 16
      Width = 82
      Height = 26
      Hint = ''
      Glyph.Data = {
        B6020000424DB60200000000000036000000280000000D000000100000000100
        18000000000080020000C40E0000C40E00000000000000000000C7C7C7292929
        0000000000000000000000000000000000000000000000000000002B2B2BC9C9
        C900292929303030888888888888888888888888888888888888888888888888
        8888882E2E2E2D2D2D000101018D8D8DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF8B8B8B030303000000008D8D8DFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8B8B8B020202000000008D8D8D
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8B8B8B0202
        02000000008D8D8DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF8B8B8B020202000000008D8D8DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF8B8B8B020202000000008D8D8DFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8B8B8B020202000000008D8D8D
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8B8B8B0202
        02000000008D8D8DFFFFFFFFFFFFFFFFFFFFFFFFD7D7D7777777777777777777
        777777404040010101000000008D8D8DFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F01
        01011111111111110E0E0E0202020A0A0A000000008D8D8DFFFFFFFFFFFFFFFF
        FFFFFFFF7E7E7E101010FFFFFFD8D8D81919191F1F1FDFDFDF000000008D8D8D
        FFFFFFFFFFFFFFFFFFFFFFFF7E7E7E101010D9D9D91A1A1A1F1F1FDFDFDFFFFF
        FF000101018D8D8DFFFFFFFFFFFFFFFFFFFFFFFF7E7E7E0D0D0D191919212121
        E1E1E1FFFFFFFFFFFF002929292F2F2F88888888888888888888888843434302
        0202202020E0E0E0FFFFFFFFFFFFFFFFFF00C7C7C72B2B2B0101010000000000
        00000000000000070707DFDFDFFFFFFFFFFFFFFFFFFFFFFFFF00}
      Caption = 'Perview'
      ParentColor = False
      Color = clWindow
      TabOrder = 3
      OnClick = btnPreviewClick
    end
    object btnCetak: TUniSpeedButton
      Left = 462
      Top = 16
      Width = 82
      Height = 26
      Hint = ''
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        F5F5F51414140000000000000000000000000000000000000000000000001414
        14F5F5F5FFFFFFFFFFFFFFFFFFFFFFFFE8E8E800000057575788888888888888
        8888888888888888888888575757000000E8E8E8FFFFFFFFFFFFFFFFFFFDFDFD
        D9D9D9000000A2A2A2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA2A2A20000
        00D9D9D9FDFDFDFFFFFFB8B8B8141414000000000000777777FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF777777000000000000151515BABABA2222223A3A3A
        9898980000009C9C9CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9C9C9C0000
        009898983939392222220000008B8B8BE8E8E8000000828282CCCCCCCCCCCCCC
        CCCCCCCCCCCCCCCCCCCCCC828282000000E8E8E88B8B8B0000000000008B8B8B
        EFEFEF0101010000000000000000000000000000000000000000000000000101
        01EFEFEF8B8B8B0000000000008B8B8BFFFFFFCDCDCDBBBBBBBBBBBBBBBBBBBB
        BBBBBBBBBBBBBBBBBBBBBBBBBBBBCDCDCDFFFFFF8B8B8B0000000202028A8A8A
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF8989890202023131312323237676764242426D6D6D77777777777777
        77777777777777777777776D6D6D424242767676222222323232D3D3D33F3F3F
        1111110000000B0B0B1111111111111111111111111111111111110B0B0B0000
        00111111404040D4D4D4FFFFFFFFFFFFE8E8E8000000A2A2A2FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFA2A2A2000000E8E8E8FFFFFFFFFFFFFFFFFFFFFFFF
        E8E8E8000000A2A2A2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA2A2A20000
        00E8E8E8FFFFFFFFFFFFFFFFFFFFFFFFE8E8E8000000A2A2A2FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFA2A2A2000000E8E8E8FFFFFFFFFFFFFFFFFFFFFFFF
        E8E8E80000005757578888888888888888888888888888888888885757570000
        00E8E8E8FFFFFFFFFFFFFFFFFFFFFFFFF5F5F514141400000000000000000000
        0000000000000000000000000000141414F5F5F5FFFFFFFFFFFF}
      Caption = 'Cetak'
      ParentColor = False
      Color = clWindow
      TabOrder = 4
      OnClick = btnCetakClick
    end
    object UniSpeedButton1: TUniSpeedButton
      Left = 661
      Top = 16
      Width = 163
      Height = 26
      Hint = ''
      Glyph.Data = {
        7E000000424D7E000000000000003E0000002800000010000000100000000100
        01000000000040000000C40E0000C40E0000020000000000000000000000FFFF
        FF00FFDF0000FF9F0000FF8F0000FF0F0000FF6F0000FE670000FEE70000F877
        0000E23300008F1300000F8B0000C1C10000F8210000FF010000FFE00000FFFC
        0000}
      Caption = 'Kirim ulang ke LIS'
      ParentColor = False
      Color = clWindow
      TabOrder = 5
      OnClick = UniSpeedButton1Click
    end
    object btnLabel: TUniSpeedButton
      Left = 550
      Top = 16
      Width = 105
      Height = 26
      Hint = ''
      Glyph.Data = {
        0E060000424D0E06000000000000360000002800000016000000160000000100
        180000000000D8050000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        0000FFFFFFF3F3F3F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5
        F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F4F4F4F3F3
        F3FFFFFF00008E8E8EA9A9A99D9D9DA1A1A19F9F9FA2A2A2A2A2A2A2A2A2A2A2
        A29E9E9EA2A2A2A1A1A19E9E9EA1A1A19E9E9EA1A1A1A2A2A2A2A2A29D9D9DA7
        A7A7ABABAB8D8D8D00000B0B0BA3A3A3A7A7A79393939C9C9C90909092929292
        92928E8E8EA6A6A68E8E8E969696A2A2A2919191A1A1A19191919292928E8E8E
        A5A5A57A7A7AA3A3A30B0B0B0000464646969696F3F3F3A9A9A9CACACA999999
        A1A1A1A5A5A5929292EDEDED959595B1B1B1DCDCDC9F9F9FDEDEDEA2A2A29F9F
        9F939393FBFBFB4949498D8D8D4A4A4A0000434343747474EEEEEED0D0D0DBDB
        DBCECECECDCDCDC7C7C7D0D0D0E3E3E3CFCFCFD0D0D0EEEEEECCCCCCE4E4E4CF
        CFCFD4D4D4C4C4C4FFFFFF2424246E6E6E47474700004343437C7C7CD8D8D870
        7070646464ACACAC999999282828CDCDCD424242B0B0B0535353F4F4F4858585
        676767616161A4A4A46E6E6ED1D1D12E2E2E74747448484800004343437E7E7E
        CECECE4242423636368C8C8C757575000000BABABA0404049494941F1F1FEEEE
        EE5D5D5D3C3C3C2E2E2E848484353535B9B9B932323275757548484800004343
        437D7D7DD1D1D14C4C4C4141419292927C7C7C000000C1C1C10D0D0D9B9B9B2A
        2A2AF2F2F26666664747473939398D8D8D3D3D3DBDBDBD323232757575484848
        00004343437D7D7DD1D1D14B4B4B4040409292927C7C7C000000C0C0C00D0D0D
        9B9B9B2A2A2AEAEAEA5C5C5C4747473939398C8C8C3C3C3CBDBDBD3232327575
        7548484800004343437D7D7DD1D1D14B4B4B4040409292927C7C7C000000C0C0
        C00D0D0D9B9B9B242424FFFFFF9D9D9D3B3B3B3939398C8C8C3C3C3CBDBDBD32
        323275757548484800004343437D7D7DD1D1D14B4B4B4040409292927C7C7C00
        0000C0C0C00D0D0D9B9B9B252525FFFFFF9999993B3B3B3939398C8C8C3C3C3C
        BDBDBD32323275757548484800004343437D7D7DD1D1D14B4B4B404040929292
        7C7C7C000000C0C0C00D0D0D9B9B9B292929EAEAEA5C5C5C4747473939398C8C
        8C3C3C3CBDBDBD32323275757548484800004343437E7E7ED1D1D14C4C4C4040
        409292927C7C7C000000C1C1C10D0D0D9B9B9B2A2A2AF1F1F166666646464639
        39398C8C8C3C3C3CBDBDBD33333375757548484800004343437A7A7ACFCFCF47
        47473B3B3B8F8F8F787878000000BDBDBD060606979797242424EFEFEF626262
        4141413333338888883A3A3ABBBBBB2D2D2D7070704747470000474747909090
        DCDCDC5555555151519F9F9F878787040404CECECE212121A6A6A63C3C3CFFFF
        FF7575755656564A4A4A9A9A9A4F4F4FC7C7C74646468686864A4A4A00000F0F
        0FACACACCDCDCDA1A1A18282829C9C9C959595717171ADADAD7A7A7AA0A0A081
        8181B9B9B99090908989898686869D9D9D848484A7A7A7848484ACACAC111111
        0000828282A4A4A4C6C6C6C6C6C69898989C9C9C9D9D9DA5A5A59A9A9AA3A3A3
        9C9C9CA1A1A19696969E9E9EA0A0A0A1A1A19D9D9DA1A1A19A9A9AA0A0A0A6A6
        A68383830000FBFBFBEFEFEFF7F7F7F5F5F5EEEEEEF0F0F0F0F0F0F0F0F0F0F0
        F0F0F0F0F0F0F0F0F0F0F1F1F1F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
        F0F0EFEFEFFBFBFB0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000}
      Caption = 'Print Label'
      ParentColor = False
      Color = clWindow
      TabOrder = 6
      OnClick = btnLabelClick
    end
  end
  object UniURLFrame1: TUniURLFrame
    Left = 0
    Top = 196
    Width = 988
    Height = 373
    Hint = ''
    Align = alClient
    TabOrder = 2
    ParentColor = False
    Color = clBtnFace
    object stBar: TUniStatusBar
      Left = 0
      Top = 351
      Width = 988
      Hint = ''
      Panels = <
        item
          Width = 50
        end>
      SizeGrip = False
      Align = alBottom
      ParentColor = False
      Color = clWindow
    end
  end
  object UniLabel5: TUniLabel
    Left = 16
    Top = 43
    Width = 72
    Height = 15
    Hint = ''
    Caption = 'Label printer'
    TabOrder = 3
  end
  object edPrinterLabel: TUniEdit
    Left = 107
    Top = 41
    Width = 262
    Hint = ''
    Text = ''
    TabOrder = 4
  end
  object QData: TFDQuery
    Connection = UniMainModule.FDConnection1
    Left = 848
    Top = 65
  end
  object cmdExe: TFDCommand
    Connection = UniMainModule.FDConnection1
    Left = 904
    Top = 73
  end
  object QHdr: TFDQuery
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'SELECT no_pendaftaran,nama '
      'FROM worklist_header '
      'WHERE '
      'print_status = 0'
      'and rujukan in :rujukan'
      '')
    Left = 688
    Top = 16
    ParamData = <
      item
        Name = 'RUJUKAN'
        ParamType = ptInput
        Value = Null
      end>
  end
  object UniTimer1: TUniTimer
    Interval = 3000
    Enabled = False
    ClientEvent.Strings = (
      'function(sender)'
      '{'
      ' '
      '}')
    OnTimer = UniTimer1Timer
    Left = 752
    Top = 17
  end
  object QRec: TFDQuery
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'SELECT no_pendaftaran '
      'FROM worklist_header '
      'WHERE print_status = 0 '
      ''
      'and  STR_TO_DATE(tanggal_terima, "%d/%m/%Y %H:%i:%s")  >= now()')
    Left = 816
    Top = 24
  end
  object QGrup: TFDQuery
    Connection = UniMainModule.FDConnection1
    Left = 792
    Top = 95
  end
  object QDtl: TFDQuery
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select nama grup,nm_tindakan'
      'from'
      'worklist_tindakan'
      
        'left join test_grup on worklist_tindakan.kd_tindakan = test_grup' +
        '.kode'
      'left join grup on  test_grup.grup_id = grup.id'
      'where'
      'no_pendaftaran = :no_pendaftaran '
      'and test_grup.grup_id = :grup_id ')
    Left = 712
    Top = 63
    ParamData = <
      item
        Name = 'NO_PENDAFTARAN'
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'GRUP_ID'
        ParamType = ptInput
      end>
  end
  object QLabel: TFDQuery
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      
        'select distinct d.no_pendaftaran, tb.kode, CONCAT(d.no_pendaftar' +
        'an,'#39'-'#39', tb.kode,'#39' '#39',tb.nama) sid_desc, h.nama,'
      
        'IFNULL( concat(DATE_FORMAT(left(h.tanggal_terima,10), '#39'%d/%m/%Y'#39 +
        '),'#39' - '#39',h.rujukan) ,CONCAT(left(h.tanggal_terima,10),'#39' - '#39',h.ruj' +
        'ukan) ) tanggal_terima, '
      
        'CONCAT(DATE_FORMAT(h.tanggal_lahir, '#39'%d/%m/%Y'#39'),'#39' - '#39', TIMESTAMP' +
        'DIFF(YEAR, h.tanggal_lahir, NOW()), '#39'th '#39', TIMESTAMPDIFF(MONTH, ' +
        'h.tanggal_lahir, NOW()) % 12, '#39'bln '#39') usia,'
      'tb.print_qty,h.tanggal_terima'
      'FROM'
      'worklist_tindakan d'
      'LEFT JOIN test t ON t.kode = d.kd_tindakan'
      'LEFT JOIN tubes tb ON t.tube_id = tb.id'
      
        'LEFT JOIN worklist_header h ON d.no_pendaftaran = h.no_pendaftar' +
        'an'
      'WHERE'
      'd.no_pendaftaran =  :no_pendaftaran '
      'AND tb.kode IS NOT NULL')
    Left = 760
    Top = 316
    ParamData = <
      item
        Name = 'NO_PENDAFTARAN'
        DataType = ftString
        ParamType = ptInput
        Value = '202111020436'
      end>
  end
end
