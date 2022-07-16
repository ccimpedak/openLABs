object UniViewerCriticalMon: TUniViewerCriticalMon
  Left = 0
  Top = 0
  Width = 1099
  Height = 624
  OnCreate = UniFrameCreate
  OnReady = UniFrameReady
  Font.Height = -13
  Font.Name = 'Roboto'
  TabOrder = 0
  ParentFont = False
  object UniPageControl1: TUniPageControl
    Left = 0
    Top = 0
    Width = 1099
    Height = 624
    Hint = ''
    ActivePage = tsValidated
    Align = alClient
    TabOrder = 0
    object tsAlarm: TUniTabSheet
      Hint = ''
      Caption = 'Hasil Kritis Dari Alat'
      object UniContainerPanel1: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 1091
        Height = 40
        Hint = ''
        ParentColor = False
        Align = alTop
        TabOrder = 0
        object lblInfo: TUniLabel
          Left = 256
          Top = 0
          Width = 579
          Height = 40
          Hint = ''
          Alignment = taCenter
          AutoSize = False
          Caption = 'Monitoring...'
          Align = alClient
          ParentFont = False
          Font.Height = -31
          Font.Name = 'Roboto'
          TabOrder = 1
        end
        object UniContainerPanel3: TUniContainerPanel
          Left = 835
          Top = 0
          Width = 256
          Height = 40
          Hint = ''
          ParentColor = False
          Align = alRight
          TabOrder = 2
          object UniButton1: TUniButton
            Left = 112
            Top = 0
            Width = 144
            Height = 40
            Hint = ''
            Caption = 'Hapus alarm'
            Align = alRight
            TabOrder = 1
            OnClick = UniButton1Click
          end
        end
        object UniContainerPanel4: TUniContainerPanel
          Left = 0
          Top = 0
          Width = 256
          Height = 40
          Hint = ''
          ParentColor = False
          Align = alLeft
          TabOrder = 3
          object UniHTMLFrame1: TUniHTMLFrame
            Left = 3
            Top = 0
            Width = 256
            Height = 44
            Hint = ''
            HTML.Strings = (
              '<audio id="myAudio">'
              '  <source src="files/sound/alarm.ogg" type="audio/ogg">'
              '  <source src="files/sound/alarm.mp3" type="audio/mpeg">'
              '  Your browser does not support the audio element.'
              '</audio>'
              ''
              ''
              '<audio id="myAudio_cito">'
              '  <source src="files/sound/alarm_cito.ogg" type="audio/ogg">'
              '  <source src="files/sound/alarm_cito.mp3" type="audio/mpeg">'
              '  Your browser does not support the audio element.'
              '</audio>'
              '')
          end
        end
      end
      object UniContainerPanel2: TUniContainerPanel
        Left = 0
        Top = 40
        Width = 1091
        Height = 554
        Hint = ''
        ParentColor = False
        Align = alClient
        TabOrder = 1
        object UniDBGrid1: TUniDBGrid
          Left = 0
          Top = 0
          Width = 1091
          Height = 554
          Hint = ''
          TitleFont.Name = 'Roboto'
          DataSource = DSHasil
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgAutoRefreshRow]
          WebOptions.Paged = False
          Grouping.FieldName = 'nomor'
          Grouping.Enabled = True
          LoadMask.Message = 'Loading data...'
          Align = alClient
          TabOrder = 1
          OnColumnSort = UniDBGrid1ColumnSort
          OnDrawColumnCell = UniDBGrid1DrawColumnCell
          Columns = <
            item
              FieldName = 'nomor'
              Title.Caption = 'Nomor Lab'
              Title.Font.Name = 'Roboto'
              Width = 110
              Font.Name = 'Roboto'
            end
            item
              FieldName = 'nama_pasien'
              Title.Caption = 'Nama'
              Title.Font.Name = 'Roboto'
              Width = 169
              Font.Name = 'Roboto'
            end
            item
              FieldName = 'asal'
              Title.Caption = 'Asal'
              Title.Font.Name = 'Roboto'
              Width = 192
              Font.Name = 'Roboto'
            end
            item
              FieldName = 'dokter'
              Title.Caption = 'Dokter'
              Title.Font.Name = 'Roboto'
              Width = 235
              Font.Name = 'Roboto'
            end
            item
              FieldName = 'test'
              Title.Caption = 'Pemeriksaan'
              Width = 120
              Font.Name = 'Roboto'
            end
            item
              FieldName = 'hasil'
              Title.Alignment = taCenter
              Title.Caption = 'Hasil'
              Title.Color = clBlack
              Title.Font.Name = 'Roboto'
              Width = 135
              Font.Color = clBlack
              Font.Name = 'Roboto'
              Alignment = taCenter
            end
            item
              FieldName = 'lab'
              Title.Alignment = taCenter
              Title.Caption = 'Lab'
              Width = 80
              Font.Name = 'Roboto'
              Alignment = taCenter
            end>
        end
      end
    end
    object tsValidated: TUniTabSheet
      Hint = ''
      Caption = 'Hasil Kiritis yang Sudah ter-validasi'
      object UniContainerPanel5: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 1091
        Height = 44
        Hint = ''
        ParentColor = False
        Align = alTop
        TabOrder = 0
        object btnRefreshValid: TUniButton
          Left = 11
          Top = 9
          Width = 78
          Height = 25
          Hint = ''
          Caption = 'Refresh'
          TabOrder = 1
          OnClick = btnRefreshValidClick
        end
        object btnLaporkan: TUniBitBtn
          Left = 111
          Top = 8
          Width = 105
          Height = 26
          Hint = ''
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFF6DFBEEFC781EAB54FEBB74EECB84FEAB34EEFC882F6E0C1FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEBBD79EEC35AF6DA78F7E185F8
            E389FFEF91FFF18FF9DF7AF0C65CECBF7DFFFFFEFFFFFFFFFFFFFFFFFFFFFFFE
            E9B76FF3D270F7DD7EF3D575F9DE7BFFDE6DE1A93FC19139CFA64FD2A94FF2CE
            66E7B367FFFFFEFFFFFFFFFFFFE5B375F3D069F6D675F1CE6AFFE073ECB04295
            5F269D857AB6A6A6CEBFBDCAB0AABD8C63EBC05AE4B071FFFFFFF4E1CEE6B14D
            F6D56DEFC860FED666D89D34815E4BCEBFBDF5FFFFFFFFFFFFFFFFFFFFFFFFFF
            FFCB8F4AE5AD48F2DAC3E1B179F3CA59EFC55BF8CF5EDC9B2A7F685CCEBFBDFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F0EDCA852EF1C454E0AE75D38B41F6D267
            ECB84BF2AF358C664ACEBFBDFFFFFFD5D1CDCC6A04A26B4AFFFFFFF7F0EDC46B
            10F4C247F7D36BD28C41D08B40F9E394F6BD41A46A1CCEBFBDFBFFFFD5D1CDD4
            830DF8CC52E29B25A46235C0721AF3BC3CE9B447F6DC8BD49246C67E32F8E28D
            EEBE5FAC9D8EEEF8FFF7F0EDD27600ECB73CE4A836EAB139EBA421EDB234E8BA
            54EBC976F7DF8AC98338C27838FAD979D3A958F1F5FDFDFFFFD5D1CDD58F27E4
            A22AE3A735E5AA3BE8B752EAC265EBC873EAC167F6D87CC37839CE966CEFCD7C
            DBB86CF1F5FDFFFFFFF1F5FDD4D2CEE6B666E9BC5AEAC063EAC166E9C063E9BB
            58EDC362EBCB7FCF9870EAD4C7CF934CE8D081F1F5FDF1F5FDF1F5FDF1F5FDE6
            B55FE6B34BE7B652E6B44DE5B248E6B752F8E391CC914BEAD4C7FFFFFFC48C6C
            E3B561E5D8ABFAFFFEF7F7FCE5BA6DE1A428E2AB35E2AD3AE3B144E7BD5CF5E1
            93E2B76ACA987BFFFFFFFFFFFFFFFFFFC7947FDFAE57F6E3A8F5D891E7BF58E8
            C15EE8C160EAC566EFD47AF7E38ADFB15DC89375FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFC99985C27D2CE4BB5CF4DA7FF5DE88F5DF89F4D97EE7C065C68437BF86
            6EFFFEFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7D4CDC69477A95C29AC
            6022AB6022A95A26C49072E6D2CBFFFFFFFFFFFFFFFFFFFFFFFF}
          Caption = 'Laporkan'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Roboto'
          TabOrder = 2
          Images = UniNativeImageList1
          OnClick = btnLaporkanClick
        end
      end
      object UniDBGrid2: TUniDBGrid
        Left = 0
        Top = 44
        Width = 1091
        Height = 550
        Hint = ''
        TitleFont.Name = 'Roboto'
        DataSource = DSValid
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgAutoRefreshRow]
        WebOptions.Paged = False
        Grouping.FieldName = 'nomor'
        Grouping.Enabled = True
        LoadMask.Message = 'Loading data...'
        Align = alClient
        TabOrder = 1
        OnColumnSort = UniDBGrid2ColumnSort
        OnDrawColumnCell = UniDBGrid2DrawColumnCell
        Columns = <
          item
            FieldName = 'nomor'
            Title.Caption = 'Nomor Lab'
            Title.Font.Name = 'Roboto'
            Width = 110
            Font.Name = 'Roboto'
          end
          item
            FieldName = 'nama_pasien'
            Title.Caption = 'Nama'
            Title.Font.Name = 'Roboto'
            Width = 169
            Font.Name = 'Roboto'
          end
          item
            FieldName = 'asal'
            Title.Caption = 'Asal'
            Title.Font.Name = 'Roboto'
            Width = 192
            Font.Name = 'Roboto'
          end
          item
            FieldName = 'dokter'
            Title.Caption = 'Dokter'
            Title.Font.Name = 'Roboto'
            Width = 242
            Font.Name = 'Roboto'
          end
          item
            FieldName = 'test'
            Title.Caption = 'Pemeriksaan'
            Width = 120
            Font.Name = 'Roboto'
          end
          item
            FieldName = 'hasil'
            Title.Alignment = taCenter
            Title.Caption = 'Hasil'
            Title.Color = clBlack
            Title.Font.Name = 'Roboto'
            Width = 135
            Font.Color = clBlack
            Font.Name = 'Roboto'
            Alignment = taCenter
          end
          item
            FieldName = 'lab'
            Title.Alignment = taCenter
            Title.Caption = 'Lab'
            Width = 100
            Font.Name = 'Roboto'
            Alignment = taCenter
          end>
      end
    end
    object tsReported: TUniTabSheet
      Hint = ''
      Caption = 'Hasil Kritis yang Sudah Dilaporkan'
      object UniContainerPanel6: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 1091
        Height = 44
        Hint = ''
        ParentColor = False
        Align = alTop
        TabOrder = 0
        object UniLabel1: TUniLabel
          Left = 11
          Top = 15
          Width = 58
          Height = 13
          Hint = ''
          Caption = 'Dari tanggal'
          TabOrder = 1
        end
        object dtStart: TUniDateTimePicker
          Left = 90
          Top = 12
          Width = 103
          Hint = ''
          DateTime = 44447.000000000000000000
          DateFormat = 'dd/MM/yyyy'
          TimeFormat = 'HH:mm:ss'
          TabOrder = 2
        end
        object UniLabel2: TUniLabel
          Left = 200
          Top = 15
          Width = 15
          Height = 13
          Hint = ''
          Caption = 's/d'
          TabOrder = 3
        end
        object dtEnd: TUniDateTimePicker
          Left = 225
          Top = 12
          Width = 103
          Hint = ''
          DateTime = 44447.000000000000000000
          DateFormat = 'dd/MM/yyyy'
          TimeFormat = 'HH:mm:ss'
          TabOrder = 4
        end
        object UniSpeedButton1: TUniSpeedButton
          Left = 334
          Top = 10
          Width = 91
          Height = 25
          Hint = ''
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
            94713B94713B94713B96713B96713B96713B96713B96713B96713B94713B9471
            3B5D3E242F5B912F5B91FFFFFFFFFFFF94713BFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFC2D1F62F5B91C1FFFF005FDEFFFFFFFFFFFF
            A38453FAEEEEB98361B88160BC8767C5916FC89674BE8B6BCC8F64714B4B2F5B
            91B6FFFF005FDEFFFFFFFFFFFFFFFFFFA38453FFFFFFF8F8F5FFFFFFECF1F798
            7771987771925B4CD9E4EB2F5B91AEFBFF005FDE543B21FFFFFFFFFFFFFFFFFF
            A38453F3E3DEC8906E8F513A724535DCD09FF6F5C5FFFFFD925B4C597097005F
            DEB8C0C6754605FFFFFFFFFFFFFFFFFFAD9060FFFFFFF3F9F9987771F8D69EFB
            EBC0FFFAD9FFFFFDFFFFFFA9614BD2DFEBFFFBE7754605FFFFFFFFFFFFFFFFFF
            AD9060F9E9E18D5B4AC48962F2C69AECD2B0FEF8DAFAF5DEFFFFFFDBD0CEBF88
            75F8F9F2784706FFFFFFFFFFFFFFFFFFAC9167FFFFFFC3B6B8C4835AF6D8ACF0
            DABEF8EAD0FEF8DEFFFDE3E9E4D1BEB0B1FAF6EE784A08FFFFFFFFFFFFFFFFFF
            B19F7CFCEDE7A77D6CBA7455FCDEABFFFFFFF1DEBFF2E0BBFFFDD3CCBC98AC87
            7DEDE5D77A4C0BFFFFFFFFFFFFFFFFFFBAA180FFFFFFFFFFFFA57668D68952FB
            E0A9F2DAAEF6D9A1F6D9A18E6A62DCD1CDD9CDB57D5010FFFFFFFFFFFFFFFFFF
            C6B191F5E8E3C28A69B98E7BB0897FB8714FCC8C63D09D77A0786C874B2DAD7A
            51C0AC88815518FFFFFFFFFFFFFFFFFFC4B192FFFFFFFCFFFFFFFFFFF8FBFACF
            C6C2C6B5B6B3A19ACCBA9EF9F8F0E5E1D0B3976D865A1DFFFFFFFFFFFFFFFFFF
            C8B89AF2E6DFBD8563BE8664BC8563BB8563BF84639C623DCDBA99E5E1D0CCB6
            9B9C7741FFFFFFFFFFFFFFFFFFFFFFFFC8B89AFFFFFFFFFFFFFFFFFFFCFCFAED
            EDEAEBE5D9D3C0A1B9A883D4C5AF946D31FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            C8BA9DFFFFFFFFFFFFF8F6F5F0E5DEDED5C4D5C2AABEA57E9A7B449D7741FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC8B89ACCB89CC6B497C3AF90C2AE90BF
            A780BBA077A991608D652DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          Caption = 'View'
          ParentColor = False
          Color = clWindow
          TabOrder = 5
          OnClick = UniSpeedButton1Click
        end
        object btnDownload: TUniSpeedButton
          Left = 431
          Top = 10
          Width = 138
          Height = 25
          Hint = ''
          Enabled = False
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
          OnClick = btnDownloadClick
        end
      end
      object UniContainerPanel7: TUniContainerPanel
        Left = 0
        Top = 560
        Width = 1091
        Height = 34
        Hint = ''
        ParentColor = False
        Align = alBottom
        TabOrder = 1
      end
      object UniURLFrame1: TUniURLFrame
        Left = 0
        Top = 44
        Width = 1091
        Height = 516
        Hint = ''
        Align = alClient
        TabOrder = 2
        ParentColor = False
        Color = clBtnFace
      end
    end
  end
  object DSHasil: TDataSource
    DataSet = QHasil
    Left = 56
    Top = 136
  end
  object tmHasilAlarm: TUniTimer
    Interval = 6000
    ClientEvent.Strings = (
      'function(sender)'
      '{'
      ' '
      '}')
    OnTimer = tmHasilAlarmTimer
    Left = 48
    Top = 272
  end
  object tmLabel: TUniTimer
    Interval = 3000
    ClientEvent.Strings = (
      'function(sender)'
      '{'
      ' '
      '}')
    OnTimer = tmLabelTimer
    Left = 48
    Top = 224
  end
  object UniNativeImageList1: TUniNativeImageList
    Left = 800
    Top = 32
    Images = {
      01000000FFFFFF1F04FA03000089504E470D0A1A0A0000000D49484452000000
      18000000180806000000E0773DF8000003C1494441544889AD954D685C5514C7
      FFE7BE37F3DECC642699997C8D092533A4082529C4A65A09596417281AA5E2C6
      859B22D66E9468F163E3AA94EE1208528B5D3450A87BC1D68248534752D07C68
      4C5A4869536BE6C32633939979F33ECE7193049A26513A3D9B7BB81CEE8FFF3D
      FF732F6133CE36376328164BB99A763A24F2F1F0D2926445506F6800F0452C86
      B752A9A1D0A143BFEAA6F9AA103575DBF6F7DF95CB7503A88908E99E9E262F99
      5C5B999A822885687737CCF575DF2B8B8BAE5D27401D330C20163BF7D7EDDB20
      C360D275DEC8E5E03634BC371208D4AD403111D61E3E3CCC22F0449447A4AAC5
      226CA277072391FA018E08EC4A659A89204410667844D8C8E55E3688EA074C5B
      167C44175D11B822EC1141801F02B5DA8165CBAA1B4000F0553C8E4E5D9F7381
      5E97D989689AFF9D6C1679E6FA1500C085621126F089E379301B1B7D8DC9646B
      42A9BA0FDF06CC380E1EB8EE35229A2FE4F3A078FCCA586FEF7301685BC95DC7
      C16BC1E04F55E6D39665A5E25D5D77BB2B95F91BA5D2F301E49991D2F55C42D7
      9B4A6B6BC7426D6D270EC6E3171F67B3A53F1DE799014FF9F0DB580C15A2F95A
      B5DAD33B3CFC4832998E0FD269CC3263A2AF0F7ED7C51F990C26B259FC1FACB6
      73236DDB1831CD4B9652A732F7EEB5BD70E4C8EB83A6F9755F348AE1818113E1
      4060E1705797F58669DEBA93CBE1D17F386DD7497AC9E7C3A7E17073DE75EF6B
      8611EC3F7E7C25DADC7C79FAFAF5D1FB0B0B66A2BB1B2FF6F7CF169797072ECF
      CF9727F7E9D39EA33A641838190CB6FFE379771CDB0EEBA609D7B6857C3E788E
      2342A40646462AD6EA6ADF95B9B93BDFE4F3BB9EB3A7D97FACD530512EAF4694
      3AA019C6DF1E3348D3484444745D31C037AE5E0DBABA3E9B6C6FDF53C1BED3F4
      B36DE35CA9B4DE00740830E512C1632611019452BA69E2B79B374F2EAFAE3E1B
      0000163D0FA3C5A2B0C8A05F6414008B0820F2BB887CC444D72EED713DC03E3D
      D82D86001C540A1A802C33FAFCFE41A5694B93B55A3640044B040B3B5CF50420
      140AA1B5B5159148048140007EBF1FE17018B2F937D700789BB9A36978736545
      9516163EF4390EF440A0D320FAFCB34AE58937781B303E3E8E542A458EE38498
      392C2241002111D10034EE1023205A7700AF96C914B950E095F3E7CF4AB1F8A0
      BDA5E5CB53998CBB55A86F251D1D1D28140AEF8BC8DBCCDCA5948A000830B3AE
      94F26DD53133945260665B29C5BE6874032D2D8F3BCF9C29FB13895B95B1B104
      329995A700E9741AFDFDFD175CD79D041006D000C0B7B91ABBB4A40AA00A668B
      2DAB642693259F52D55F8E1E056666B68BFE053F56B8F5386B49450000000049
      454E44AE426082}
  end
  object QParameters: TFDQuery
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select value_char,value_num from parameters where name = :name')
    Left = 768
    Top = 32
    ParamData = <
      item
        Name = 'NAME'
        DataType = ftString
        ParamType = ptInput
        Value = '-'
      end>
  end
  object DSValid: TDataSource
    DataSet = QValid
    Left = 52
    Top = 402
  end
  object QValid: TFDQuery
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      
        'SELECT `result_detail`.`ID` AS `nomor`,`pasien`.`nama` AS `nama_' +
        'pasien`,`asal_pasien`.`nama` AS `asal`,`dokter`.`nama` AS `dokte' +
        'r`,`result_detail`.`TEST_NM` AS `test`,`result_detail`.`RESULT_V' +
        'ALUE` AS `hasil`,`result_detail`.`TEST_CD` AS `test_code`, '
      'CONCAT(`result_detail`.`ID`,`result_detail`.`TEST_CD`) AS `ID`,'
      
        'case when  `worklist_header`.no_urutlab  LIKE '#39'%D'#39' or `worklist_' +
        'header`.no_urutlab  LIKE '#39'%H'#39' then '#39'CITO'#39' ELSE '#39'INDUK'#39' end AS la' +
        'b'
      'FROM `result_detail`'
      
        'LEFT JOIN `order_header` ON `result_detail`.`ID` = `order_header' +
        '`.`nomor`'
      'LEFT JOIN `pasien` ON `order_header`.`pasien_id` = `pasien`.`id`'
      
        'LEFT JOIN `asal_pasien` ON `order_header`.`asal_pasien_id` = `as' +
        'al_pasien`.`id`'
      'LEFT JOIN `dokter` ON `order_header`.`dokter_id` = `dokter`.`id`'
      
        'LEFT JOIN `worklist_header`  ON `result_detail`.ID = `worklist_h' +
        'eader`.no_pendaftaran'
      
        'WHERE ISNULL(`result_detail`.`lapor_waktu`) AND ISNULL(`result_d' +
        'etail`.`lapor_user`) AND `result_detail`.`FLAG` in ('#39'KRITIS HIGH' +
        #39','#39'KRITIS LOW'#39','#39'KRITIS'#39') AND `result_detail`.`status` IS NOT NUL' +
        'L'
      '')
    Left = 52
    Top = 362
  end
  object QHasil: TFDQuery
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'SELECT *'
      'FROM'
      '('
      
        'SELECT `result_detail`.`ID` AS `nomor`,`pasien`.`nama` AS `nama_' +
        'pasien`,`asal_pasien`.`nama` AS `asal`,`dokter`.`nama` AS `dokte' +
        'r`,`result_detail`.`TEST_NM` AS `test`,`result_detail`.`RESULT_V' +
        'ALUE` AS `hasil`,`result_detail`.`TEST_CD` AS `test_code`, '
      'CONCAT(`result_detail`.`ID`,`result_detail`.`TEST_CD`) AS `ID`,'
      
        'case when  left(`worklist_header`.no_urutlab,4)  LIKE '#39'%D'#39' or le' +
        'ft(`worklist_header`.no_urutlab,4)  LIKE '#39'%H'#39' then '#39'CITO'#39' ELSE '#39 +
        'INDUK'#39' end AS lab,'
      
        'case when  ( left(`worklist_header`.no_urutlab,4)  LIKE '#39'%D'#39' or ' +
        'left(`worklist_header`.no_urutlab,4)  LIKE '#39'%H'#39' ) AND '
      
        'EXISTS (SELECT * FROM user_profile_rights WHERE VALUE = '#39'ROLE_CI' +
        'TO'#39' AND user_profile_id = ( SELECT user_profile_id FROM aguser W' +
        'HERE user_name = :user)) then 1  '
      
        ' when  left(`worklist_header`.no_urutlab,4)  not LIKE '#39'%D'#39' and l' +
        'eft(`worklist_header`.no_urutlab,4)  not LIKE '#39'%H'#39' AND '
      
        ' EXISTS (SELECT * FROM user_profile_rights WHERE VALUE = '#39'ROLE_R' +
        'UTINE'#39' AND user_profile_id = ( SELECT user_profile_id FROM aguse' +
        'r WHERE user_name = :user)) then 1'
      'ELSE 0 END v'
      'FROM `result_detail`'
      
        'LEFT JOIN `order_header` ON `result_detail`.`ID` = `order_header' +
        '`.`nomor`'
      'LEFT JOIN `pasien` ON `order_header`.`pasien_id` = `pasien`.`id`'
      
        'LEFT JOIN `asal_pasien` ON `order_header`.`asal_pasien_id` = `as' +
        'al_pasien`.`id`'
      'LEFT JOIN `dokter` ON `order_header`.`dokter_id` = `dokter`.`id`'
      
        'LEFT JOIN `worklist_header`  ON `result_detail`.ID = `worklist_h' +
        'eader`.no_pendaftaran'
      
        'WHERE ISNULL(`result_detail`.`lapor_waktu`) AND ISNULL(`result_d' +
        'etail`.`lapor_user`) AND `result_detail`.`FLAG` in ('#39'KRITIS HIGH' +
        #39','#39'KRITIS LOW'#39','#39'KRITIS'#39') AND `result_detail`.`status` IS  NULL'
      ') d WHERE v = 1')
    Left = 52
    Top = 178
    ParamData = <
      item
        Name = 'USER'
        DataType = ftString
        ParamType = ptInput
        Value = 'yose'
      end>
  end
  object cmdHapus: TFDCommand
    Connection = UniMainModule.FDConnection1
    CommandText.Strings = (
      'update result_detail set status = '#39'P'#39' where id = :nomor')
    ParamData = <
      item
        Name = 'NOMOR'
        ParamType = ptInput
        Value = Null
      end>
    Left = 668
    Top = 50
  end
  object QTipeAlaram: TFDQuery
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'SELECT SUM(cito) cito, SUM(rutin) rutin'
      'FROM'
      '('
      
        'SELECT order_header.id, CASE WHEN (`worklist_header`.no_urutlab ' +
        'LIKE '#39'%D'#39' OR `worklist_header`.no_urutlab LIKE '#39'%H'#39') AND EXISTS ' +
        '('
      'SELECT *'
      'FROM user_profile_rights'
      'WHERE VALUE = '#39'ROLE_CITO'#39' AND user_profile_id = ('
      'SELECT user_profile_id'
      'FROM aguser'
      
        'WHERE user_name = :user)) THEN 1 ELSE 0 END AS cito, CASE WHEN (' +
        '`worklist_header`.no_urutlab NOT LIKE '#39'%D'#39' AND `worklist_header`' +
        '.no_urutlab NOT LIKE '#39'%H'#39') AND EXISTS ('
      'SELECT *'
      'FROM user_profile_rights'
      'WHERE VALUE = '#39'ROLE_RUTINE'#39' AND user_profile_id = ('
      'SELECT user_profile_id'
      'FROM aguser'
      'WHERE user_name = :user)) THEN 1 ELSE 0 END AS rutin'
      'FROM `result_detail`'
      
        'LEFT JOIN `order_header` ON `result_detail`.`ID` = `order_header' +
        '`.`nomor`'
      'LEFT JOIN `pasien` ON `order_header`.`pasien_id` = `pasien`.`id`'
      
        'LEFT JOIN `asal_pasien` ON `order_header`.`asal_pasien_id` = `as' +
        'al_pasien`.`id`'
      'LEFT JOIN `dokter` ON `order_header`.`dokter_id` = `dokter`.`id`'
      
        'LEFT JOIN `worklist_header` ON `result_detail`.ID = `worklist_he' +
        'ader`.no_pendaftaran'
      
        'WHERE ISNULL(`result_detail`.`lapor_waktu`) AND ISNULL(`result_d' +
        'etail`.`lapor_user`) AND `result_detail`.`FLAG` in ('#39'KRITIS HIGH' +
        #39','#39'KRITIS LOW'#39','#39'KRITIS'#39') AND `result_detail`.`status` IS NULL'
      ') d')
    Left = 116
    Top = 186
    ParamData = <
      item
        Name = 'USER'
        DataType = ftString
        ParamType = ptInput
        Value = 'yose'
      end>
  end
end
