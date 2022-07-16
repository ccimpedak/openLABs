object frmLaporanHarian: TfrmLaporanHarian
  Left = 0
  Top = 0
  ClientHeight = 122
  ClientWidth = 342
  Caption = 'Laporan Harian'
  BorderStyle = bsDialog
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  Font.Height = -13
  Font.Name = 'Roboto'
  OnAfterShow = UniFormAfterShow
  PixelsPerInch = 96
  TextHeight = 15
  object UniLabel1: TUniLabel
    Left = 8
    Top = 16
    Width = 45
    Height = 15
    Hint = ''
    Caption = 'Tanggal'
    TabOrder = 0
  end
  object edTgl0: TUniEdit
    Left = 71
    Top = 16
    Width = 106
    Hint = ''
    Text = ''
    TabOrder = 1
  end
  object cbDgnTes: TUniCheckBox
    Left = 8
    Top = 44
    Width = 281
    Height = 17
    Hint = ''
    Caption = 'Dengan rincian pemeriksaan'
    TabOrder = 2
  end
  object UniLabel2: TUniLabel
    Left = 183
    Top = 16
    Width = 19
    Height = 15
    Hint = ''
    Caption = 's/d'
    TabOrder = 3
  end
  object edTgl1: TUniEdit
    Left = 211
    Top = 16
    Width = 110
    Hint = ''
    Text = ''
    TabOrder = 4
  end
  object UniSpeedButton1: TUniSpeedButton
    Left = 228
    Top = 79
    Width = 106
    Height = 26
    Hint = ''
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
      916D37A8895BB78D56AC8A56B69756AC8D57B58765AB875AA68A5BA79068A78B
      629C7A4B987545FFFFFFFFFFFFFFFFFFAB8E62FEFFFFFEFFFFFEFFFFFEFFFFFE
      FFFFFEFFFFEFF2E8EBE4DEEBE4DEEBE4DEEBE4DEA48659FFFFFFFFFFFFFFFFFF
      B4956AF5FCFF0097EEFFF7F00C00EECFD6E409E604EFF2E8F8D5C2DA9A42E19F
      41EBE8E0A58452FFFFFFFFFFFFFFFFFFBB9F76F4FBFF009CF0FFF7F05F59FFCF
      D6E402DF11EFF2E8FCDCC6EBE4DEEBE4DEEBE4DEA58452FFFFFFFFFFFFFFFFFF
      BEA47AF4FBFF009AF0FFF7F0FFFFEFEEF5E300D911EFF2E8FFDCCBDE9E41E19F
      41EAE6DFA58452FFFFFFFFFFFFFFFFFFBDA37AF4FBFF079FF0FFF7F0FFF7F0EA
      F1E300DC11EFF2E8FFDECEEBE4DEEBE4DEEAE6DEA58451FFFFFFFFFFFFFFFFFF
      BBA37AFEFFFFEBF0F0F1F0EDF7F2EEEAF0E300DB0EEFF2E8FFE2CFE19F41E19F
      41EBE7E1A58453FFFFFFFFFFFFFFFFFFBAA37FFFFFFFFBF6EFF6F2EDF9F3F1EF
      F2E808E11CEFF2E8FFE2D3DD9C41E19F41EBE4DEA68553FFFFFFFFFFFFFFFFFF
      BCAA8CFFFFFEFEFFFFFBFFFFFCFFFFFCFFFFF2FFFFF9FFFFF9FFFFEBE8E0EBE8
      E0EBE8E0A68553FFFFFFFFFFFFFFFFFFC5B397FDFAF5E6AC54E3A546E2A54AE3
      A54BE6A54DDEA148D9A04CD3994CD3994CD3C8B3A58553FFFFFFFFFFFFFFFFFF
      CCBB9FFCF9F4FCFFFFFCFFFFFCFFFFF9FDFBF5F6F7E4E0D9D0C2ADBFAB8BBFAB
      8BB69B71A48452FFFFFFFFFFFFFFFFFFCEBDA3FDFCFCFCFFFFFCFFFFFCFFFFF9
      FDFBF5F6F7E4E0D9D0C2ADEAE6E4DFD6C7B69B71A98857FFFFFFFFFFFFFFFFFF
      CFBDA6FDFCFBFBFDFEFCFCFCF6F6F1EEE8E1EDE2D9D3C1AACFBDA0FFFFFFCDB9
      9DBAA078F2EDE6FFFFFFFFFFFFFFFFFFD0C0A7FDFCFCFCFEFFFBF7F3F3EBE5E6
      DFD6E2D4C4CDB798BEAC8AD1C1A9B69B6EF9F7F3FFFFFFFFFFFFFFFFFFFFFFFF
      D1C3ABFDFCFBFEFEFEF6F2EFEDE4DADED5C4D6C4ADC0A984A38652BAA078FCFB
      F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCBBB9FD1C2A9D1C0A7CDBCA2CBBA9EC7
      B291C3AB86AD9364AF9367F9F7F3FFFFFFFFFFFFFFFFFFFFFFFF}
    Caption = 'View'
    ParentColor = False
    Color = clWindow
    TabOrder = 5
    OnClick = UniSpeedButton1Click
  end
  object UniSpeedButton2: TUniSpeedButton
    Left = 8
    Top = 79
    Width = 99
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
    Caption = 'Export'
    ParentColor = False
    Color = clWindow
    TabOrder = 6
    OnClick = UniSpeedButton2Click
  end
  object qHarian: TFDQuery
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select distinct h.tanggal,h.nomor,p.nama,h.sub_total,'
      'if(pb.flg_first='#39'Y'#39',h.disc_amount,0) as disc_amount,'
      'u.nama as user_nama,pb.tanggal as tgl_bayar,'
      'tp.nama as tp_nama,pb.jumlah * tp.biaya_pct * 0.01 as charge,'
      'pb.jumlah - pb.jumlah * tp.biaya_pct * 0.01 as jumlah,'
      'if(pb.flg_first='#39'Y'#39',h.tagihan,0) as tagihan,'
      
        'if(left(h.tanggal,10)=left(pb.tanggal,10),'#39'Y'#39','#39'N'#39') as flg_same_d' +
        'ay,'
      'u.user_name,dt.nama as dokter_nama,'
      'if(left(h.tanggal,10)=left(:tanggal,10),'#39'Y'#39','#39'N'#39') as flg_sales'
      ',pb.flg_first,'
      
        'h.disc_amount, (pb.jumlah - pb.jumlah * tp.biaya_pct) - h.disc_a' +
        'mount netto,'
      
        'pb.jumlah bayar,(pb.jumlah - pb.jumlah * tp.biaya_pct) - h.disc_' +
        'amount - pb.jumlah piutang,'
      #39#39' tests,h.id header_id,pf.nama prefix'
      'From'
      'order_header h'
      'left join dokter dt on h.dokter_id = dt.id and h.flgBatal='#39'N'#39
      'left join pasien p on h.pasien_id = p.id'
      'left join prefix pf on p.prefix_id = pf.id'
      'left join pembayaran pb on h.id = pb.order_header_id'
      'and left(pb.tanggal,10) = left(:tanggal,10)'
      'join aguser u on pb.user_id = u.id'
      'join tipe_pembayaran tp on pb.tipe_bayar_id = tp.id'
      'order by h.nomor')
    Left = 240
    Top = 32
    ParamData = <
      item
        Name = 'TANGGAL'
        DataType = ftString
        ParamType = ptInput
        Value = '2019-06-18'
      end>
    object qHariantanggal: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'tanggal'
      Origin = 'tanggal'
    end
    object qHariannomor: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nomor'
      Origin = 'nomor'
      Size = 30
    end
    object qHariannama: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nama'
      Origin = 'nama'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object qHariansub_total: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'sub_total'
      Origin = 'sub_total'
      Precision = 12
      Size = 2
    end
    object qHariandisc_amount: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'disc_amount'
      Origin = 'disc_amount'
      ProviderFlags = []
      ReadOnly = True
      Precision = 12
      Size = 2
    end
    object qHarianuser_nama: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'user_nama'
      Origin = 'nama'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object qHariantgl_bayar: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'tgl_bayar'
      Origin = 'tanggal'
      ProviderFlags = []
      ReadOnly = True
    end
    object qHariantp_nama: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tp_nama'
      Origin = 'nama'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object qHariancharge: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'charge'
      Origin = 'charge'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 6
    end
    object qHarianjumlah: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'jumlah'
      Origin = 'jumlah'
      ProviderFlags = []
      ReadOnly = True
      Precision = 19
      Size = 6
    end
    object qHariantagihan: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'tagihan'
      Origin = 'tagihan'
      ProviderFlags = []
      ReadOnly = True
      Precision = 12
      Size = 2
    end
    object qHarianflg_same_day: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'flg_same_day'
      Origin = 'flg_same_day'
      ProviderFlags = []
      ReadOnly = True
      Size = 1
    end
    object qHarianuser_name: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'user_name'
      Origin = 'user_name'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
    object qHariandokter_nama: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'dokter_nama'
      Origin = 'nama'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object qHarianflg_sales: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'flg_sales'
      Origin = 'flg_sales'
      ProviderFlags = []
      ReadOnly = True
      Size = 1
    end
    object qHarianflg_first: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'flg_first'
      Origin = 'flg_first'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object qHariandisc_amount_1: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'disc_amount_1'
      Origin = 'disc_amount'
      Precision = 12
      Size = 2
    end
    object qHariannetto: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'netto'
      Origin = 'netto'
      ProviderFlags = []
      ReadOnly = True
      Precision = 17
    end
    object qHarianbayar: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'bayar'
      Origin = 'jumlah'
      ProviderFlags = []
      ReadOnly = True
      Precision = 12
      Size = 2
    end
    object qHarianpiutang: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'piutang'
      Origin = 'piutang'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
    end
    object qHariantests: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tests'
      Origin = 'tests'
      ProviderFlags = []
      ReadOnly = True
      Size = 1024
    end
    object qHarianheader_id: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'header_id'
      Origin = 'header_id'
      ProviderFlags = []
      ReadOnly = True
    end
    object qHarianprefix: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'prefix'
      Origin = 'nama'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
  end
  object qHarianDgnTes: TFDQuery
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select distinct h.tanggal,h.nomor,p.nama,h.sub_total,'
      'if(pb.flg_first='#39'Y'#39',h.disc_amount,0) as disc_amount,'
      'u.nama as user_nama,pb.tanggal as tgl_bayar,'
      'tp.nama as tp_nama,pb.jumlah * tp.biaya_pct * 0.01 as charge,'
      'pb.jumlah - pb.jumlah * tp.biaya_pct * 0.01 as jumlah,'
      'if(pb.flg_first='#39'Y'#39',h.tagihan,0) as tagihan,'
      
        'if(left(h.tanggal,10)=left(pb.tanggal,10),'#39'Y'#39','#39'N'#39') as flg_same_d' +
        'ay,'
      'u.user_name,dt.nama as dokter_nama,'
      'if(left(h.tanggal,10)=left(:tanggal,10),'#39'Y'#39','#39'N'#39') as flg_sales'
      ',pb.flg_first,'
      
        'h.disc_amount, (pb.jumlah - pb.jumlah * tp.biaya_pct) - h.disc_a' +
        'mount netto,'
      
        'pb.jumlah bayar,(pb.jumlah - pb.jumlah * tp.biaya_pct) - h.disc_' +
        'amount - pb.jumlah piutang,'
      'jns_tes.tests,jns_tes.header_id,pf.nama prefix'
      'From'
      'order_header h'
      'left join dokter dt on h.dokter_id = dt.id and h.flgBatal='#39'N'#39
      'left join pasien p on h.pasien_id = p.id'
      'left join prefix pf on p.prefix_id = pf.id'
      'left join pembayaran pb on h.id = pb.order_header_id'
      'and left(pb.tanggal,10) = left(:tanggal,10)'
      'join aguser u on pb.user_id = u.id'
      'join tipe_pembayaran tp on pb.tipe_bayar_id = tp.id'
      'join ('
      'select  header_id,group_concat(nama_test)  tests'
      'from'
      'order_detail'
      'where'
      'cetak_nota = '#39'Y'#39
      'group by header_id'
      ') jns_tes on h.id = jns_tes.header_id'
      'order by h.nomor')
    Left = 176
    Top = 32
    ParamData = <
      item
        Name = 'TANGGAL'
        DataType = ftString
        ParamType = ptInput
        Value = '2019-04-30'
      end>
    object DateTimeField1: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'tanggal'
      Origin = 'tanggal'
    end
    object StringField1: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nomor'
      Origin = 'nomor'
      Size = 30
    end
    object StringField2: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nama'
      Origin = 'nama'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object BCDField1: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'sub_total'
      Origin = 'sub_total'
      Precision = 12
      Size = 2
    end
    object BCDField2: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'disc_amount'
      Origin = 'disc_amount'
      ProviderFlags = []
      ReadOnly = True
      Precision = 12
      Size = 2
    end
    object StringField3: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'user_nama'
      Origin = 'nama'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object DateTimeField2: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'tgl_bayar'
      Origin = 'tanggal'
      ProviderFlags = []
      ReadOnly = True
    end
    object StringField4: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tp_nama'
      Origin = 'nama'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object FMTBCDField1: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'charge'
      Origin = 'charge'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 6
    end
    object FMTBCDField2: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'jumlah'
      Origin = 'jumlah'
      ProviderFlags = []
      ReadOnly = True
      Precision = 19
      Size = 6
    end
    object BCDField3: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'tagihan'
      Origin = 'tagihan'
      ProviderFlags = []
      ReadOnly = True
      Precision = 12
      Size = 2
    end
    object StringField5: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'flg_same_day'
      Origin = 'flg_same_day'
      ProviderFlags = []
      ReadOnly = True
      Size = 1
    end
    object StringField6: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'user_name'
      Origin = 'user_name'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
    object StringField7: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'dokter_nama'
      Origin = 'nama'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object StringField8: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'flg_sales'
      Origin = 'flg_sales'
      ProviderFlags = []
      ReadOnly = True
      Size = 1
    end
    object StringField9: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'flg_first'
      Origin = 'flg_first'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object BCDField4: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'disc_amount_1'
      Origin = 'disc_amount'
      Precision = 12
      Size = 2
    end
    object BCDField5: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'netto'
      Origin = 'netto'
      ProviderFlags = []
      ReadOnly = True
      Precision = 17
    end
    object BCDField6: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'bayar'
      Origin = 'jumlah'
      ProviderFlags = []
      ReadOnly = True
      Precision = 12
      Size = 2
    end
    object BCDField7: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'piutang'
      Origin = 'piutang'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
    end
    object StringField10: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tests'
      Origin = 'tests'
      ProviderFlags = []
      ReadOnly = True
      Size = 1024
    end
    object IntegerField1: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'header_id'
      Origin = 'header_id'
      ProviderFlags = []
      ReadOnly = True
    end
    object StringField11: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'prefix'
      Origin = 'nama'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
  end
end
