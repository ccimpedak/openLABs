object frmHasil: TfrmHasil
  Left = 0
  Top = 0
  ClientHeight = 575
  ClientWidth = 893
  Caption = 'Hasil'
  BorderStyle = bsDialog
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  Font.Height = -13
  Font.Name = 'Roboto'
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
      Top = 40
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
      Top = 68
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
      Top = 96
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
  end
  object UniContainerPanel2: TUniContainerPanel
    Left = 0
    Top = 153
    Width = 893
    Height = 378
    Hint = ''
    ParentColor = False
    Align = alClient
    TabOrder = 1
  end
  object UniContainerPanel5: TUniContainerPanel
    Left = 0
    Top = 531
    Width = 893
    Height = 44
    Hint = ''
    ParentColor = False
    Align = alBottom
    TabOrder = 2
    object btnPDF: TUniSpeedButton
      Left = 769
      Top = 6
      Width = 121
      Height = 33
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
      Caption = 'Download Hasil'
      ParentColor = False
      Color = clWindow
      TabOrder = 1
      OnClick = btnPDFClick
    end
    object btnEmail: TUniSpeedButton
      Left = 642
      Top = 6
      Width = 121
      Height = 33
      Hint = ''
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
      TabOrder = 2
      OnClick = btnEmailClick
    end
    object UniLabel3: TUniLabel
      Left = 16
      Top = 16
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
      TabOrder = 3
    end
  end
  object UniDBGrid1: TUniDBGrid
    Left = 0
    Top = 153
    Width = 893
    Height = 378
    Hint = ''
    DataSource = DSDtl
    Options = [dgTitles, dgColumnResize, dgRowLines, dgConfirmDelete, dgAutoRefreshRow]
    WebOptions.Paged = False
    LoadMask.Message = 'Loading data...'
    Align = alClient
    TabOrder = 3
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
  object QHdr: TFDQuery
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      
        'select distinct order_header.pasien_id,order_header.id,order_hea' +
        'der.nomor,order_header.tanggal,asal_pasien.nama asal_pasien,'
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
      
        'select distinct result_detail.TEST_CD,result_detail.TEST_NM,resu' +
        'lt_detail.RESULT_VALUE,result_detail.UNIT,result_detail.FLAG,res' +
        'ult_detail.REF_RANGE,'
      'result_detail.VALIDATE_BY,'
      'CONCAT('
      'STR_TO_DATE(LEFT(result_detail.VALIDATE_ON,8),'#39'%Y%m%D'#39') ,'#39' '#39','
      'STR_TO_DATE(RIGHT(result_detail.VALIDATE_ON,6),'#39'%H%i%s'#39')'
      ') validasi_pada'
      'from'
      'order_header'
      'left join result_detail on order_header.nomor = result_detail.ID'
      'left join test_grup on result_detail.DISP_SEQ = test_grup.kode'
      'left join grup on test_grup.grup_id = grup.id'
      'left join test_urut on test_grup.kode = test_urut.kode'
      'where'
      'order_header.id = :header_id'
      'order by IFNULL(test_urut.show_order,result_detail.DISP_SEQ)')
    Left = 192
    Top = 264
    ParamData = <
      item
        Name = 'HEADER_ID'
        DataType = ftString
        ParamType = ptInput
        Value = '25918'
      end>
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
end
