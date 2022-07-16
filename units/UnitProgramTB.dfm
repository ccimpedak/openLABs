object UniProgramTB: TUniProgramTB
  Left = 0
  Top = 0
  Width = 887
  Height = 538
  OnBeforeReady = UniFrameBeforeReady
  Font.Height = -13
  Font.Name = 'Roboto'
  TabOrder = 0
  ParentFont = False
  object pcTB: TUniPageControl
    Left = 0
    Top = 0
    Width = 887
    Height = 538
    Hint = ''
    ActivePage = tsLihatData
    Align = alClient
    TabOrder = 0
    object tsDataPasien: TUniTabSheet
      Hint = ''
      Caption = 'Isi Data pasien TB'
      object UniLabel1: TUniLabel
        Left = 16
        Top = 11
        Width = 119
        Height = 15
        Hint = ''
        Caption = 'No. Lab / No. Sampel'
        TabOrder = 0
      end
      object edNomor: TUniEdit
        Left = 145
        Top = 8
        Width = 156
        Hint = ''
        Text = ''
        TabOrder = 1
        OnKeyPress = edNomorKeyPress
      end
      object UniGroupBox1: TUniGroupBox
        Left = 16
        Top = 34
        Width = 609
        Height = 127
        Hint = ''
        Caption = 'Data Sampel'
        TabOrder = 2
        object UniLabel2: TUniLabel
          Left = 16
          Top = 24
          Width = 111
          Height = 15
          Hint = ''
          Caption = 'Tgl. Sedian diterima'
          TabOrder = 1
        end
        object edTglTerima: TUniEdit
          Left = 144
          Top = 22
          Width = 145
          Hint = ''
          Text = ''
          TabOrder = 2
          TabStop = False
          ReadOnly = True
        end
        object edJK: TUniEdit
          Left = 382
          Top = 22
          Width = 91
          Hint = ''
          Text = ''
          TabOrder = 3
          TabStop = False
          ReadOnly = True
        end
        object UniLabel3: TUniLabel
          Left = 296
          Top = 24
          Width = 80
          Height = 15
          Hint = ''
          Caption = 'Jenis Kelamin'
          TabOrder = 4
        end
        object edUmur: TUniEdit
          Left = 515
          Top = 22
          Width = 62
          Hint = ''
          Text = ''
          TabOrder = 5
          TabStop = False
          ReadOnly = True
        end
        object UniLabel4: TUniLabel
          Left = 479
          Top = 24
          Width = 30
          Height = 15
          Hint = ''
          Caption = 'Umur'
          TabOrder = 6
        end
        object UniLabel5: TUniLabel
          Left = 16
          Top = 54
          Width = 86
          Height = 15
          Hint = ''
          Caption = 'Nama Lengkap'
          TabOrder = 7
        end
        object edNama: TUniEdit
          Left = 144
          Top = 50
          Width = 433
          Hint = ''
          Text = ''
          TabOrder = 8
          TabStop = False
          ReadOnly = True
        end
        object edAlamat: TUniEdit
          Left = 144
          Top = 78
          Width = 433
          Hint = ''
          Text = ''
          TabOrder = 9
          TabStop = False
          ReadOnly = True
        end
        object UniLabel6: TUniLabel
          Left = 16
          Top = 81
          Width = 92
          Height = 15
          Hint = ''
          Caption = 'Alamat Lengkap'
          TabOrder = 10
        end
      end
      object UniPanel1: TUniPanel
        Left = 16
        Top = 167
        Width = 145
        Height = 36
        Hint = ''
        TabOrder = 3
        Caption = 'No. Identitas Sediaan'
      end
      object UniPanel2: TUniPanel
        Left = 161
        Top = 167
        Width = 112
        Height = 36
        Hint = ''
        TabOrder = 4
        Caption = 'Tgl. Pemeriksaan'
      end
      object UniPanel3: TUniPanel
        Left = 273
        Top = 167
        Width = 145
        Height = 36
        Hint = ''
        TabOrder = 5
        Caption = 'Nama UPK'
      end
      object UniPanel4: TUniPanel
        Left = 418
        Top = 167
        Width = 214
        Height = 18
        Hint = ''
        TabOrder = 6
        Caption = 'Alasan'
      end
      object UniPanel5: TUniPanel
        Left = 418
        Top = 185
        Width = 107
        Height = 18
        Hint = ''
        TabOrder = 7
        Caption = 'Untuk Diagnosis'
      end
      object UniPanel6: TUniPanel
        Left = 525
        Top = 185
        Width = 107
        Height = 18
        Hint = ''
        TabOrder = 8
        Caption = 'Utk tindak Lanjut'
      end
      object UniPanel7: TUniPanel
        Left = 632
        Top = 167
        Width = 210
        Height = 18
        Hint = ''
        TabOrder = 9
        Caption = 'Hasil Pemeriksaan'
      end
      object UniPanel8: TUniPanel
        Left = 632
        Top = 185
        Width = 70
        Height = 18
        Hint = ''
        TabOrder = 10
        Caption = 'S'
      end
      object UniPanel9: TUniPanel
        Left = 702
        Top = 185
        Width = 70
        Height = 18
        Hint = ''
        TabOrder = 11
        Caption = 'P'
      end
      object UniPanel10: TUniPanel
        Left = 772
        Top = 185
        Width = 70
        Height = 18
        Hint = ''
        TabOrder = 12
        Caption = 'S'
      end
      object edID: TUniEdit
        Left = 16
        Top = 203
        Width = 145
        Hint = ''
        Enabled = False
        Text = ''
        TabOrder = 13
      end
      object edNamaUPK: TUniEdit
        Left = 273
        Top = 203
        Width = 145
        Hint = ''
        Enabled = False
        Text = ''
        TabOrder = 15
        TabStop = False
        ReadOnly = True
      end
      object dtTglPeriksa: TUniDateTimePicker
        Left = 160
        Top = 203
        Width = 113
        Hint = ''
        Enabled = False
        DateTime = 44275.000000000000000000
        DateFormat = 'dd/MM/yyyy'
        TimeFormat = 'HH:mm:ss'
        TabOrder = 14
      end
      object edAlasanDiag: TUniEdit
        Left = 418
        Top = 203
        Width = 107
        Hint = ''
        Enabled = False
        Text = ''
        TabOrder = 16
      end
      object edAlasanLanjut: TUniEdit
        Left = 525
        Top = 203
        Width = 107
        Hint = ''
        Enabled = False
        Text = ''
        TabOrder = 17
      end
      object edHasilS1: TUniEdit
        Left = 632
        Top = 203
        Width = 70
        Hint = ''
        Enabled = False
        Text = ''
        TabOrder = 18
      end
      object edHasilP: TUniEdit
        Left = 702
        Top = 203
        Width = 70
        Hint = ''
        Enabled = False
        Text = ''
        TabOrder = 19
      end
      object edHasilS2: TUniEdit
        Left = 772
        Top = 203
        Width = 70
        Hint = ''
        Enabled = False
        Text = ''
        TabOrder = 20
      end
      object UniLabel7: TUniLabel
        Left = 17
        Top = 234
        Width = 65
        Height = 15
        Hint = ''
        Caption = 'Keterangan'
        TabOrder = 21
      end
      object edKet: TUniEdit
        Left = 88
        Top = 231
        Width = 330
        Hint = ''
        Enabled = False
        Text = ''
        TabOrder = 22
      end
      object btnSimpan: TUniSpeedButton
        Left = 753
        Top = 264
        Width = 89
        Height = 26
        Hint = ''
        Enabled = False
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
        ParentColor = False
        Color = clWindow
        TabOrder = 23
        OnClick = btnSimpanClick
      end
      object UniGroupBox2: TUniGroupBox
        Left = 17
        Top = 296
        Width = 825
        Height = 177
        Hint = ''
        Caption = 'Data TB'
        TabOrder = 24
        object UniDBGrid1: TUniDBGrid
          Left = 2
          Top = 17
          Width = 821
          Height = 158
          Hint = ''
          TitleFont.Name = 'Roboto'
          DataSource = dsDtl
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgAutoRefreshRow]
          WebOptions.Paged = False
          LoadMask.Message = 'Loading data...'
          Align = alClient
          TabOrder = 1
          Columns = <
            item
              FieldName = 'no_identitas'
              Title.Caption = 'No. Identitas Sediaan'
              Title.Font.Name = 'Roboto'
              Width = 114
              Font.Name = 'Roboto'
            end
            item
              FieldName = 'tanggal'
              Title.Caption = 'Tgl. Pemeriksaan'
              Title.Font.Name = 'Roboto'
              Width = 94
              Font.Name = 'Roboto'
            end
            item
              FieldName = 'nama_upk'
              Title.Caption = 'Nama UPK'
              Title.Font.Name = 'Roboto'
              Width = 124
              Font.Name = 'Roboto'
            end
            item
              FieldName = 'alasan_diag'
              Title.Caption = 'Alasan Diagnosis'
              Title.Font.Name = 'Roboto'
              Width = 96
              Font.Name = 'Roboto'
            end
            item
              FieldName = 'alasan_tindak'
              Title.Caption = 'Alasan Tindak Lanjut'
              Title.Font.Name = 'Roboto'
              Width = 110
              Font.Name = 'Roboto'
            end
            item
              FieldName = 'hasil_s1'
              Title.Caption = 'Hasil S'
              Title.Font.Name = 'Roboto'
              Width = 67
              Font.Name = 'Roboto'
            end
            item
              FieldName = 'hasil_p'
              Title.Caption = 'Hasil P'
              Title.Font.Name = 'Roboto'
              Width = 64
              Font.Name = 'Roboto'
            end
            item
              FieldName = 'hasil_s2'
              Title.Caption = 'Hasil S'
              Title.Font.Name = 'Roboto'
              Width = 58
              Font.Name = 'Roboto'
            end
            item
              FieldName = 'keterangan'
              Title.Caption = 'Keterangan'
              Title.Font.Name = 'Roboto'
              Width = 66
              Font.Name = 'Roboto'
            end>
        end
      end
      object btnEdit: TUniSpeedButton
        Left = 751
        Top = 479
        Width = 89
        Height = 26
        Hint = ''
        Enabled = False
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000000000000000000000000000000000000A2B95062082
          C3CCE7C2D6F5E1ECFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF8999CB0000584E9FDF4CBFF81467D4556FC6FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCCCEE68AADDC
          C3FFFF95EBFF58D0FD0773D93556BDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFBDCCEA92BAE5FFFFFF79DFFF0EA4EE0B6DD50E7FE033
          61C5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5D7ECF
          DBFFFF06DFFA00C3FC119EEA1272D70D80E13C6BCBFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFF4A5AC235B9E40AFFFF00D8F600C8FE119CEA12
          71D60D7FDF3767CBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          2F4DBF3AD2EC12FFFF00D9F600C8FE119CEA1271D50D80DE3E6FCFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3A52C339D4ED12FFFF00D8F600
          C8FE119CEA1271D50D7FDF386BD1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF3551C33AD1EC0CFFFD00D9F600C8FE119CEA126FD50C80DF4278
          D4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F5AC959F0F607
          FFFB00D8F600C8FE119CEA1371D60B7FE32562D2FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF4966CD67F6F803FFFA00D8F600C8FE0EA9F70052
          BE627590749ADBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF52
          6ED268F8F905FFFA00E6FF00A4E9627992FFFFE97976B8345CD6FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4D6CD266FFFF00E9E1639AA3FFFF
          FC6B6FAA0000DD0D27EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF4576D880B6BCFFFFFC6D7CAD0000DA0007FF0D26E8FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6089E884A6BC0C6C
          E21458FF0B21EDDCE1FBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF427BDB44AFF8388BEFE2E8FDFFFFFF}
        Caption = 'Edit'
        ParentColor = False
        Color = clWindow
        TabOrder = 25
        OnClick = btnEditClick
      end
      object btnHapus: TUniSpeedButton
        Left = 656
        Top = 479
        Width = 89
        Height = 26
        Hint = ''
        Enabled = False
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          1800000000000003000000000000000000000000000000000000FFFFFF5253FF
          0F11FD0F11FDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEF
          FD3B3BED8383EAFFFFFF4E47FF252DFF2A49FF1D31FE8684FCFCFBFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF3C3CE90C0EFA9E9EEFFFFFFF211AFF314CFF
          2E53FF2746FF131FFCBDBBFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC6C5F50C0B
          F90808E4CDCDF7FFFFFF6F6DFF495FFF3156FF2441FF1D36FF4646F6FFFFFFFF
          FFFFFFFFFFFFFFFFC3C1F21611EA0E0BFB7A7AEBFDFDFFFFFFFFC7C7FF3538FE
          4D6CFF203DFF1F3AFF131FFEC6C5F9FFFFFFFFFFFFC8C6F30F0AE40E07FF0A06
          F0B1B0EEFFFFFFFFFFFFFFFFFFC7C6FF4951FF405EFF1832FF1A2EFF191AEDCB
          C9F3CBC9F31611E40C07FF0E07FF332ED7E5E4F6FFFFFFFFFFFFFFFFFFFFFFFF
          A1A0FF4553FF314CFF1629FF141EFF0A07DD0D08E00F0AFF100AFF0702E38F8D
          E6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE6E6FF4643FC4B5CFE283EFF1521FF11
          15FD1111FF130FFF0D08F87674E3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFAF9FF5554F94652FD202CFF181CFF1615FF110FFD1A15DED3D2F6FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F3FF6566FB2A37FD242FFF19
          1EFF1615FF110EF3C0BFF3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          A8AAFF626BFF667CFF5D71FF545FFF6268FF5A5BFF302CFF4641EFA4A1EDFFFF
          FFFFFFFFFFFFFFFFFFFFD5D3FF979FFF7189FF718BFF687DFF6578FF7883FF76
          73F68481F88986FF635DFF4C45F2A6A4EDFFFFFFFFFFFFFFFFFF8F9AFF829EFF
          7C97FF7289FF7389FF8996FE7A78F8DAD8FCDBDAFC7A76F18F8BFC7C76FF5B59
          F7A2A1F2DCDBF7FFFFFF8F9AFF92B0FF849EFF8CA1FF939DFE746FF9D9D7FDFF
          FFFFFFFFFFDEDDFBAFADF48B86F19693FE888BFB7077EEDDDEF9BFBEFFA4AEFF
          A3AEFF9194FE716AF9D7D5FDFFFFFFFFFFFFFFFFFFFFFFFFF5F5FEDCDCF89E9C
          EB8685EB959BF07F85E8D6D4FFB9B8FFA09FFF8C88FEDBD9FDFEFEFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFE6E5FAA3A0EB8A89E07E82E6}
        Caption = 'Hapus'
        ParentColor = False
        Color = clWindow
        TabOrder = 26
        OnClick = btnHapusClick
      end
    end
    object tsLihatData: TUniTabSheet
      Hint = ''
      Caption = 'Lihat Data'
      object UniContainerPanel1: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 879
        Height = 52
        Hint = ''
        ParentColor = False
        Align = alTop
        TabOrder = 0
        object UniLabel8: TUniLabel
          Left = 6
          Top = 8
          Width = 26
          Height = 13
          Hint = ''
          Caption = 'Bulan'
          TabOrder = 1
        end
        object cbBln: TUniComboBox
          Left = 41
          Top = 5
          Width = 145
          Height = 23
          Hint = ''
          Text = 'cbBln'
          Items.Strings = (
            'Januari'
            'Februari'
            'Maret'
            'April'
            'Mei'
            'Juni'
            'Juli'
            'Agustus'
            'September'
            'Oktober'
            'November'
            'Desember')
          TabOrder = 2
          IconItems = <>
        end
        object UniLabel9: TUniLabel
          Left = 192
          Top = 8
          Width = 30
          Height = 13
          Hint = ''
          Caption = 'Tahun'
          TabOrder = 3
        end
        object btnShow: TUniSpeedButton
          Left = 307
          Top = 4
          Width = 89
          Height = 26
          Hint = ''
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
            9F804B9776419776419776419776419776419776419776419776419776419776
            41987343987343FFFFFFFFFFFFFFFFFFA07F50FFFFFFF9FFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8C6524FFFFFFFFFFFFFFFFFF
            AC8755E7FCFF0087FABBE4ECCB8C69BB8767BA8867B88665B78566B37B5AD2AD
            9CF5F7F08C6524FFFFFFFFFFFFFFFFFFAF9162FFFFFFFEF6F1FDF6F1FAF9F5FA
            FBF9FAFBF9FBFCF7F7FBF2F8F9F5FFFFFEF1EBE48C6524FFFFFFFFFFFFFFFFFF
            BB9869D9F4FF0087FABAE2E9CF906CBF8969C08C6CC08B6CC28C6EBD825FD7B3
            9FF5F3ED8C6524FFFFFFFFFFFFFFFFFFB09465FFFFFFFEF6F1FEF6F2FBF9F4F8
            FBF8FBFDFAFBFBFAFFFEFFFEFCFBFFFFFFF1ECE38C6524FFFFFFFFFFFFFFFFFF
            B99867D8F5FF0087FABAE2E8CE8E6BBE8869C38B6EC5916CC59172BF8362D5B0
            9AF6F6F08C6524FFFFFFFFFFFFFFFFFFB0946BFFFFFFFEF6EFFBF6F0F9F9F4FC
            FAFCFEFFFEFFFFFFFFFFFFF8F6F3F9F7F3F2EDE68C6524FFFFFFFFFFFFFFFFFF
            B9A17DE3F7FF0087FABFEAEDD1916FBF8B6CC28C6EC08C6EBB8764AE7554C6A3
            8DECE4D98C6524FFFFFFFFFFFFFFFFFFBCA686FFFFFFFFFFFEFFFFFCFFFFFFFE
            FFFFFFFFFFFAFEF8F6F8F4EDEBE5EAE3DCD8CDB78C6524FFFFFFFFFFFFFFFFFF
            CCB390E1F3FB0087FABEE8F3D09171C08C6ABF8A67BB8664A66C44985427AB7A
            56C3B08E8C6524FFFFFFFFFFFFFFFFFFC8B595FFFFFFFFFFFFFFFFFFFFFFFFFC
            FFF8F9FAF8E4DDD2D3C6A9F6F7F3E8E4D5B79D738C6524FFFFFFFFFFFFFFFFFF
            CFB69ADFF3F90087FAC0EAF1CA8C67B2795AB67B5C985E37CCB99CFFFFFFCFBA
            A0A07D46FBFAF7FFFFFFFFFFFFFFFFFFC7B79AFFFFFFFFFFFFFFFDF7FCFDFBEF
            F1EDEEE9DDD4C5A9BCAC89D7C9B5997335FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            CBBDA1FFFFFFFFFFFFF9F7F7F0E7DEDFD7C7D8C5B0C1AA85AA9161A17E47FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC4B292CEBDA3CCBBA0C9B69AC8B699C4
            AF8CC3AB84AA9161936C32FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          Caption = 'Tampilkan'
          ParentColor = False
          Color = clWindow
          TabOrder = 4
          OnClick = btnShowClick
        end
        object edThn: TUniNumberEdit
          Left = 233
          Top = 6
          Width = 68
          Hint = ''
          Alignment = taCenter
          TabOrder = 5
          DecimalSeparator = '.'
        end
        object UniSpeedButton1: TUniSpeedButton
          Left = 402
          Top = 3
          Width = 89
          Height = 26
          Hint = ''
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC5600DC96511FFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC45D0BDD
            963BEDBD65C76312FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFC45D0DDE922CF5D675F6BF29D27C16C96817FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC25809E3931FFCDC6EF2
            B62BE68A00EF9B00CE720CC96818FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFC15707E59F2EFEE68CF2BD38EFA71BEDA418E68F02ED9E02D0730AC968
            19FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC15605E5A540FFF3B1F7D474F5BD36F3
            B534EFA921EC9C0EE48C00F0A90ED47608C9681AFFFFFFFFFFFFFFFFFFC15505
            E5A63FFFFCCCFDE9A2F8C947F6C951F4BD3CF1B02CEEA41AE99505E18B00F0AD
            15D57708C05500FFFFFFC15708E4A541FFFEC8FFFBC8FDDE67FBD463F7CD55F5
            C547F3B635EFA824ED9F12E99300E69101F4BA23D47A0BC05500DA8A26F8BE33
            F3B83BECA01AE7A33BFFF7C7FAD261F7C84EF5BF40F2B32FF3AB1CCA6709BE51
            00BE5100BF5400C05500FFFFFFFFFFFFFFFFFFFFFFFFE8A037FFFDD9FBD769F8
            CB55F6C749F4BD39F5B427C5610BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFEAA83DFFFCD8FBDC71F9D260F7C952F6C443F8BC33C5600AFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEBA83CFFFEDDFDE07AFB
            D769F9CF5CF7CA4DFCC63EC56009FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFECAA3DFFFFE0FEE380FCDC72F9D365F8CD56FDCD47C55F08FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDAB3EFFFFE3FEE789FD
            E17AFBDA6FFAD063FFD555C45E07FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFEEB144FFFFFAFFF49DFFF08EFFEB83FFE676FFE767C45E06FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEA42AF1BC5AEDAC38E9
            A231E3982EDE9128DC8C25CA6713FFFFFFFFFFFFFFFFFFFFFFFF}
          Caption = 'Download'
          ParentColor = False
          Color = clWindow
          TabOrder = 6
          OnClick = UniSpeedButton1Click
        end
      end
      object UniURLFrame1: TUniURLFrame
        Left = 0
        Top = 52
        Width = 879
        Height = 456
        Hint = ''
        Align = alClient
        TabOrder = 1
        ParentColor = False
        Color = clBtnFace
      end
    end
  end
  object QHasilTBHdr: TFDQuery
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      
        'select STR_TO_DATE(tanggal_terima, "%d/%m/%Y") tanggal_terima,kd' +
        '_jenis_kelamin,YEAR(CURRENT_TIMESTAMP) - YEAR(worklist_header.ta' +
        'nggal_lahir) - (RIGHT(CURRENT_TIMESTAMP, 5) < RIGHT(worklist_hea' +
        'der.tanggal_lahir, 5)) umur,'
      
        'worklist_header.nama,worklist_header.alamat,worklist_header.ruan' +
        'gan'
      'from'
      'worklist_header'
      'left join order_header on nomor = no_pendaftaran'
      'left join pasien on order_header.pasien_id = pasien.id'
      'where'
      'no_pendaftaran = :nomor')
    Left = 772
    Top = 34
    ParamData = <
      item
        Name = 'NOMOR'
        ParamType = ptInput
        Value = Null
      end>
  end
  object QHasilTBDtl: TFDQuery
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select * from program_tb'
      'where nomor = :nomor')
    Left = 684
    Top = 474
    ParamData = <
      item
        Name = 'NOMOR'
        DataType = ftString
        ParamType = ptInput
        Value = '202103055641'
      end>
  end
  object dsDtl: TDataSource
    DataSet = QHasilTBDtl
    Left = 717
    Top = 474
  end
  object cmdExec: TFDCommand
    Connection = UniMainModule.FDConnection1
    Left = 756
    Top = 482
  end
end
