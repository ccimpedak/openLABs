object frmHasil: TfrmHasil
  Left = 0
  Top = 0
  ClientHeight = 638
  ClientWidth = 893
  Caption = 'Hasil'
  BorderStyle = bsDialog
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  Font.Height = -13
  Font.Name = 'Roboto'
  OnBeforeShow = UniFormBeforeShow
  OnAfterShow = UniFormAfterShow
  PixelsPerInch = 96
  TextHeight = 15
  object UniContainerPanel1: TUniContainerPanel
    Left = 0
    Top = 0
    Width = 893
    Height = 153
    Hint = ''
    ParentColor = False
    Align = alTop
    TabOrder = 0
    object UniContainerPanel3: TUniContainerPanel
      Left = 0
      Top = 0
      Width = 441
      Height = 153
      Hint = ''
      ParentColor = False
      Align = alLeft
      TabOrder = 1
      object UniLabel1: TUniLabel
        Left = 11
        Top = 19
        Width = 74
        Height = 15
        Hint = ''
        Caption = 'Order details'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Roboto'
        Font.Style = [fsBold, fsUnderline]
        TabOrder = 1
      end
    end
    object UniContainerPanel4: TUniContainerPanel
      Left = 441
      Top = 0
      Width = 452
      Height = 153
      Hint = ''
      ParentColor = False
      Align = alClient
      TabOrder = 2
      object UniLabel2: TUniLabel
        Left = 11
        Top = 19
        Width = 80
        Height = 15
        Hint = ''
        Caption = 'Pasien details'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Roboto'
        Font.Style = [fsBold, fsUnderline]
        TabOrder = 1
      end
      object UniDBEdit4: TUniDBEdit
        Left = 16
        Top = 40
        Width = 201
        Height = 22
        Hint = ''
        DataField = 'noreg'
        DataSource = DSHdr
        TabOrder = 2
        TabStop = False
        ReadOnly = True
        FieldLabel = 'No. MR'
      end
      object UniDBEdit5: TUniDBEdit
        Left = 16
        Top = 68
        Width = 401
        Height = 22
        Hint = ''
        DataField = 'nama'
        DataSource = DSHdr
        TabOrder = 3
        TabStop = False
        ReadOnly = True
        FieldLabel = 'Nama'
      end
      object UniDBEdit6: TUniDBEdit
        Left = 16
        Top = 96
        Width = 201
        Height = 22
        Hint = ''
        DataField = 'jenis_kelamin'
        DataSource = DSHdr
        TabOrder = 4
        TabStop = False
        ReadOnly = True
        FieldLabel = 'Jns. Kelamin'
      end
      object UniDBEdit7: TUniDBEdit
        Left = 240
        Top = 96
        Width = 177
        Height = 22
        Hint = ''
        DataField = 'usia'
        DataSource = DSHdr
        TabOrder = 5
        TabStop = False
        ReadOnly = True
        FieldLabel = 'Usia'
      end
      object UniDBEdit8: TUniDBEdit
        Left = 16
        Top = 124
        Width = 401
        Height = 22
        Hint = ''
        DataField = 'alamat'
        DataSource = DSHdr
        TabOrder = 6
        TabStop = False
        ReadOnly = True
        FieldLabel = 'Alamat'
      end
    end
    object UniDBEdit1: TUniDBEdit
      Left = 11
      Top = 69
      Width = 374
      Height = 22
      Hint = ''
      DataField = 'nomor'
      DataSource = DSHdr
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Roboto'
      Font.Style = [fsBold]
      TabOrder = 3
      TabStop = False
      ReadOnly = True
      FieldLabel = 'Nomor Lab'
    end
    object UniDBEdit2: TUniDBEdit
      Left = 11
      Top = 97
      Width = 374
      Height = 22
      Hint = ''
      DataField = 'asal_pasien'
      DataSource = DSHdr
      TabOrder = 4
      TabStop = False
      ReadOnly = True
      FieldLabel = 'Asal'
    end
    object UniDBEdit3: TUniDBEdit
      Left = 11
      Top = 125
      Width = 374
      Height = 22
      Hint = ''
      DataField = 'dokter'
      DataSource = DSHdr
      TabOrder = 5
      TabStop = False
      ReadOnly = True
      FieldLabel = 'Dokter'
    end
    object UniDBEdit9: TUniDBEdit
      Left = 11
      Top = 40
      Width = 374
      Height = 22
      Hint = ''
      DataField = 'tanggal'
      DataSource = DSHdr
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Roboto'
      Font.Style = [fsBold]
      TabOrder = 6
      TabStop = False
      Color = clInfoBk
      ReadOnly = True
      FieldLabel = 'Tanggal'
    end
  end
  object UniContainerPanel2: TUniContainerPanel
    Left = 0
    Top = 153
    Width = 893
    Height = 438
    Hint = ''
    ParentColor = False
    Align = alClient
    TabOrder = 1
    ExplicitHeight = 378
    object UniPageControl1: TUniPageControl
      Left = 0
      Top = 0
      Width = 893
      Height = 438
      Hint = ''
      ActivePage = tsHasil
      Align = alClient
      TabOrder = 1
      object tsHasil: TUniTabSheet
        Hint = ''
        Caption = 'Hasil'
        object UniDBGrid1: TUniDBGrid
          Left = 0
          Top = 0
          Width = 885
          Height = 410
          Hint = ''
          DataSource = DSDtl
          Options = [dgTitles, dgColumnResize, dgRowLines, dgRowSelect, dgCheckSelect, dgCheckSelectCheckOnly, dgAlwaysShowSelection, dgConfirmDelete, dgMultiSelect, dgAutoRefreshRow]
          ReadOnly = True
          WebOptions.Paged = False
          LoadMask.Message = 'Loading data...'
          Align = alClient
          TabOrder = 0
          Exporter.Enabled = True
          OnSelectionChange = UniDBGrid1SelectionChange
          OnDrawColumnCell = UniDBGrid1DrawColumnCell
          Columns = <
            item
              FieldName = 'TEST_CD'
              Title.Caption = 'Kode Tes'
              Width = 86
              Font.Name = 'Roboto'
            end
            item
              FieldName = 'TEST_NM'
              Title.Caption = 'Nama Tes'
              Width = 190
              Font.Name = 'Roboto'
            end
            item
              FieldName = 'RESULT_VALUE'
              Title.Alignment = taCenter
              Title.Caption = 'Hasil'
              Width = 165
              Font.Name = 'Roboto'
              Alignment = taCenter
            end
            item
              FieldName = 'UNIT'
              Title.Caption = 'Satuan'
              Width = 100
              Font.Name = 'Roboto'
            end
            item
              FieldName = 'FLAG'
              Title.Caption = 'Flag'
              Width = 47
              Font.Name = 'Roboto'
            end
            item
              FieldName = 'REF_RANGE'
              Title.Alignment = taCenter
              Title.Caption = 'Nilai Normal'
              Width = 200
              Font.Name = 'Roboto'
              Alignment = taCenter
            end
            item
              FieldName = 'VALIDATE_BY'
              Title.Alignment = taCenter
              Title.Caption = 'Validasi Oleh'
              Width = 100
              Font.Name = 'Roboto'
              Alignment = taCenter
            end
            item
              FieldName = 'validasi_pada'
              Title.Alignment = taCenter
              Title.Caption = 'Validasi Pada'
              Width = 128
              Font.Name = 'Roboto'
              Alignment = taCenter
            end>
        end
      end
      object tsReportView: TUniTabSheet
        Hint = ''
        Caption = 'Report view'
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 289
        ExplicitHeight = 193
        object UniContainerPanel6: TUniContainerPanel
          Left = 0
          Top = 0
          Width = 885
          Height = 33
          Hint = ''
          ParentColor = False
          Align = alTop
          TabOrder = 0
          object UniLabel4: TUniLabel
            Left = 5
            Top = 7
            Width = 33
            Height = 13
            Hint = ''
            Caption = 'Report'
            TabOrder = 1
          end
          object cbTest: TUniDBLookupComboBox
            Left = 54
            Top = 3
            Width = 235
            Height = 23
            Hint = ''
            ListSource = DSReport
            KeyField = 'nama'
            ListFieldIndex = 0
            DataField = 'id'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Roboto'
            AnyMatch = True
            TabOrder = 2
            Color = clWindow
            Style = csDropDown
          end
          object UniSpeedButton1: TUniSpeedButton
            Left = 295
            Top = 3
            Width = 86
            Height = 22
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
            TabOrder = 3
            OnClick = UniSpeedButton1Click
          end
        end
        object UniURLFrame1: TUniURLFrame
          Left = 0
          Top = 33
          Width = 885
          Height = 339
          Hint = ''
          Align = alClient
          TabOrder = 1
          ParentColor = False
          Color = clBtnFace
        end
        object UniContainerPanel7: TUniContainerPanel
          Left = 0
          Top = 372
          Width = 885
          Height = 38
          Hint = ''
          ParentColor = False
          Align = alBottom
          TabOrder = 2
          object btnDownRep: TUniMenuButton
            Left = 729
            Top = 3
            Width = 153
            Height = 29
            Hint = ''
            DropdownMenu = UniPopupMenu1
            Caption = 'Download Report'
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
            TabOrder = 1
          end
        end
      end
    end
  end
  object UniContainerPanel5: TUniContainerPanel
    Left = 0
    Top = 591
    Width = 893
    Height = 47
    Hint = ''
    ParentColor = False
    Align = alBottom
    TabOrder = 2
    object btnPDF: TUniSpeedButton
      Left = 753
      Top = 6
      Width = 121
      Height = 33
      Hint = ''
      Visible = False
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
      Caption = 'Download Hasil'
      ParentColor = False
      Color = clWindow
      TabOrder = 1
      OnClick = btnPDFClick
    end
    object UniLabel3: TUniLabel
      Left = 11
      Top = 14
      Width = 470
      Height = 15
      Hint = ''
      Caption = 
        'Hasil yang valid adalah hasil yang sudah di tanda tangani oleh p' +
        'etugas laboratorium'
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Roboto'
      Font.Style = [fsItalic]
      TabOrder = 2
    end
    object btnEmail: TUniSpeedButton
      Left = 626
      Top = 6
      Width = 121
      Height = 33
      Hint = ''
      Visible = False
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000CD9358E0A240
        D8983ED7983ED8983ED8983ED8983ED8983ED8983ED8983ED8983ED8983ED798
        3ED8993FE0A13FBF7B42D39E55CB7710E3A027EAA826E5A025E5A125E5A125E5
        A125E5A125E5A125E5A125E5A025EBA826E5A125CC7E20C2731DE3B86AD17A00
        B66110CB7A0DE0970FD98E0ED78B0ED88C0ED88C0ED78B0ED98E0EE0970FCA7A
        0DB25C0DD4860DD58921E1B56BDF9206DF991BBE6C16B86513E39A1DE59E1DDC
        9319DC9319E59E1DE49A1DB86613BB6815DF971AE49E19D38727E5BA73DF9716
        E3A029E9A827D38E28AF560CD28414EEAD30EEAD30D38615AB520AD28A28EAA9
        29E49F28E4A228D79131E7BF7AE2A025E5AA3CECB33DD7890EB97532B37343BC
        6500BC6600B37543B56D31CC7807EEB43EE6AA3AE6AB38D99839E7C282ECB13C
        EFB542C46F06C79670F9FCFAFEFFFFC59064C8966AFCFFFFFCFFFDC18E6BB85E
        00EDB13CEEBD4EDE9E41F1D495E5A633B26821DBC2B1FFFFFFF4F2EDF3F0EBFC
        FFFFFAFFFFF3F0EBF3F2EDFFFFFFE1CFBEBA702AE8AF41E8AF51DBA660C66F08
        BF9F72F1FFFFF3E9DBE3D7C5E5D6C6E5D7C5E5D7C5E6D7C7E5D7C6E3D5C4FFFF
        FFA09192C6781BDB9940DCAE72FFE089CFAE77EBF1FFF5F0E7E8E0D5E8E2D5E8
        E2D5E8E2D6E8E2D6E8E3D5E6E0D3FFFFFFB3A49DF7CE65D79239F9EEDFF7D8A2
        D7C3A5ECEEF7F3EEE1E7DDD1E8DED2E8DED2E8E0D3E9E0D2E9DFD1E7DDD0FFFF
        FFBBAAA1E4AA4DF9ECDDFFFFFFFFFFFFCFBAA9FBFEFFF8F6EBEAE3DAECE4DEEC
        E5E0ECE4DFEBE1DBEAE2DDEBE3DBFFFFFFBDB1B0FFFFFFFFFFFFFFFFFFFFFFFF
        EFEDF0D8D1D3D4C7BDE0DCDEDACEC1D2C5B5C7BDB1C4BAB1C3B3A5B4A099B4AB
        B0B8AEB4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCF9F5F5D08DF8E7C0FB
        DD8BFDDD84F9D67AF4C066FDFAF6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFF7E2BCFBE7BEF5D27FF6DCB1FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6
        DDB1F4DAA3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      Caption = 'Kirim Email'
      ParentColor = False
      Color = clWindow
      TabOrder = 3
      OnClick = btnEmailClick
    end
  end
  object QHdr: TFDQuery
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      
        'select distinct order_header.tanggal, order_header.nomor,order_h' +
        'eader.pasien_id,order_header.id,order_header.nomor,asal_pasien.n' +
        'ama asal_pasien,'
      'dokter.nama dokter,'
      'pasien.noreg,pasien.nama,'
      'jenis_kelamin.nama jenis_kelamin,'
      'pasien.tanggal_lahir, '
      
        'YEAR(CURRENT_TIMESTAMP) - YEAR(pasien.tanggal_lahir) - (RIGHT(CU' +
        'RRENT_TIMESTAMP, 5) < RIGHT(pasien.tanggal_lahir, 5)) as usia,'
      'pasien.alamat, pasien.hp, pasien.email '
      'from'
      'order_header'
      'left join pasien on order_header.pasien_id = pasien.id'
      
        'left join asal_pasien on order_header.asal_pasien_id = asal_pasi' +
        'en.id '
      'left join dokter on order_header.dokter_id = dokter.id'
      
        'left join jenis_kelamin on pasien.jenis_kelamin_id = jenis_kelam' +
        'in.id'
      'where'
      'order_header.id = :header_id')
    Left = 280
    Top = 144
    ParamData = <
      item
        Name = 'HEADER_ID'
        DataType = ftString
        ParamType = ptInput
        Value = '0'
      end>
  end
  object DSHdr: TDataSource
    DataSet = QHdr
    Left = 312
    Top = 144
  end
  object QDtl: TFDQuery
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select distinct result_detail.TEST_CD,result_detail.TEST_NM,'
      'case when '
      '(select count(*) from user_profile_rights'
      'where'
      'value = '#39'ROLE_VIEW_CONFIDENTIAL_RESULT'#39
      'and user_profile_id = :user_profile_id '
      ') = 0 and test.flg_confidential > 0 then '#39'*****'#39
      'else result_detail.RESULT_VALUE '
      'end as RESULT_VALUE,'
      'result_detail.UNIT,result_detail.FLAG,result_detail.REF_RANGE,'
      'result_detail.VALIDATE_BY,'
      'CONCAT('
      'STR_TO_DATE(LEFT(result_detail.VALIDATE_ON,8),'#39'%Y%m%D'#39') ,'#39' '#39','
      'STR_TO_DATE(RIGHT(result_detail.VALIDATE_ON,6),'#39'%H%i%s'#39')'
      ') validasi_pada'
      'from'
      'order_header'
      'left join result_detail on order_header.nomor = result_detail.ID'
      'left join test_grup on result_detail.test_cd = test_grup.kode'
      'left join grup on test_grup.grup_id = grup.id'
      'left join test_urut on test_grup.kode = test_urut.kode'
      'left join test on result_detail.TEST_CD = test.id '
      'where'
      'order_header.id = :header_id'
      'and result_detail.VALIDATE_ON is not null'
      'order by IFNULL(test_urut.show_order,result_detail.TEST_CD)')
    Left = 192
    Top = 264
    ParamData = <
      item
        Name = 'USER_PROFILE_ID'
        DataType = ftString
        ParamType = ptInput
        Value = '0'
      end
      item
        Name = 'HEADER_ID'
        DataType = ftString
        ParamType = ptInput
        Value = '1954'
      end>
    object QDtlTEST_CD: TStringField
      FieldName = 'TEST_CD'
      Origin = 'TEST_CD'
      FixedChar = True
    end
    object QDtlTEST_NM: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'TEST_NM'
      Origin = 'TEST_NM'
      Size = 500
    end
    object QDtlRESULT_VALUE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'RESULT_VALUE'
      Origin = 'RESULT_VALUE'
      Size = 41
    end
    object QDtlUNIT: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'UNIT'
      Origin = 'UNIT'
      Size = 100
    end
    object QDtlFLAG: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'FLAG'
      Origin = 'FLAG'
      Size = 100
    end
    object QDtlREF_RANGE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'REF_RANGE'
      Origin = 'REF_RANGE'
      Size = 30
    end
    object QDtlVALIDATE_BY: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'VALIDATE_BY'
      Origin = 'VALIDATE_BY'
      Size = 60
    end
    object QDtlvalidasi_pada: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'validasi_pada'
      Origin = 'validasi_pada'
      Size = 21
    end
  end
  object DSDtl: TDataSource
    DataSet = QDtl
    Left = 232
    Top = 264
  end
  object QPDF: TFDQuery
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select * from result_pdf where nomor = :nomor')
    Left = 560
    Top = 376
    ParamData = <
      item
        Name = 'NOMOR'
        ParamType = ptInput
        Value = Null
      end>
  end
  object cmdExec: TFDCommand
    Connection = UniMainModule.FDConnection1
    CommandText.Strings = (
      
        'INSERT INTO order_pengiriman_hasil (header_id,metode,data) VALUE' +
        'S (:header_id,'#39'email'#39','#39#39');')
    ParamData = <
      item
        Name = 'HEADER_ID'
        ParamType = ptInput
        Value = Null
      end>
    Left = 688
    Top = 368
  end
  object QRole: TFDQuery
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select * from'
      'user_profile_rights'
      'where'
      'value = :role'
      'and user_profile_id = :user_profile_id')
    Left = 800
    Top = 432
    ParamData = <
      item
        Name = 'ROLE'
        DataType = ftString
        ParamType = ptInput
        Value = '-'
      end
      item
        Name = 'USER_PROFILE_ID'
        DataType = ftString
        ParamType = ptInput
        Value = '2'
      end>
  end
  object UniPopupMenu1: TUniPopupMenu
    Left = 440
    Top = 424
    object a1: TUniMenuItem
      Caption = 'a'
    end
  end
  object QData: TFDQuery
    Connection = UniMainModule.FDConnection1
    Left = 464
    Top = 336
  end
  object QReport: TFDQuery
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select * '
      'from report_hasil '
      'where '
      'flg_confidential = 0'
      'or'
      'flg_confidential = ('
      'select 1 from'
      'user_profile_rights'
      'where'
      'value = '#39'ROLE_VIEW_CONFIDENTIAL_RESULT'#39
      'and user_profile_id = 10'
      ')')
    Left = 424
    Top = 184
  end
  object DSReport: TDataSource
    DataSet = QReport
    Left = 456
    Top = 184
  end
  object QParameter: TFDQuery
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select value_text,value_num from parameters where name = :name ')
    Left = 672
    Top = 456
    ParamData = <
      item
        Name = 'NAME'
        ParamType = ptInput
        Value = Null
      end>
  end
  object DataSource1: TDataSource
    DataSet = QPDF
    Left = 505
    Top = 64
  end
end
