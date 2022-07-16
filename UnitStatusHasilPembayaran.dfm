object frmStatusHasilPembayaran: TfrmStatusHasilPembayaran
  Left = 0
  Top = 0
  ClientHeight = 648
  ClientWidth = 964
  Caption = 'Status hasil dan pembayaran'
  BorderStyle = bsDialog
  OldCreateOrder = False
  OnKeyDown = UniFormKeyDown
  MonitoredKeys.Keys = <>
  Font.Height = -16
  OnAfterShow = UniFormAfterShow
  PixelsPerInch = 96
  TextHeight = 19
  object UniContainerPanel1: TUniContainerPanel
    Left = 0
    Top = 0
    Width = 964
    Height = 89
    Hint = ''
    ParentColor = False
    Align = alTop
    TabOrder = 0
    object UniLabel1: TUniLabel
      Left = 24
      Top = 16
      Width = 57
      Height = 19
      Hint = ''
      Caption = 'Tanggal'
      TabOrder = 1
    end
    object edTgl: TUniEdit
      Left = 87
      Top = 16
      Width = 122
      Hint = ''
      Text = ''
      TabOrder = 2
      OnKeyDown = edTglKeyDown
    end
    object edNomor: TUniEdit
      Left = 392
      Top = 16
      Width = 177
      Hint = ''
      Text = ''
      TabOrder = 3
      OnKeyDown = edNomorKeyDown
    end
    object edNama: TUniEdit
      Left = 392
      Top = 44
      Width = 177
      Hint = ''
      Text = ''
      TabOrder = 4
      OnKeyDown = edNamaKeyDown
    end
    object btnSearch: TUniButton
      Left = 87
      Top = 44
      Width = 122
      Height = 37
      Hint = ''
      Caption = 'F1 Search'
      TabOrder = 5
      OnClick = btnSearchClick
    end
    object UniLabel2: TUniLabel
      Left = 312
      Top = 16
      Width = 45
      Height = 19
      Hint = ''
      Caption = 'NoLab'
      TabOrder = 6
    end
    object UniLabel3: TUniLabel
      Left = 312
      Top = 47
      Width = 41
      Height = 19
      Hint = ''
      Caption = 'Nama'
      TabOrder = 7
    end
    object lblStatus: TUniLabel
      Left = 592
      Top = 16
      Width = 297
      Height = 50
      Hint = ''
      Alignment = taCenter
      AutoSize = False
      Caption = ''
      ParentFont = False
      Font.Color = clWhite
      Font.Height = -21
      Font.Style = [fsBold]
      TabOrder = 8
    end
  end
  object UniContainerPanel2: TUniContainerPanel
    Left = 0
    Top = 89
    Width = 964
    Height = 469
    Hint = ''
    ParentColor = False
    Align = alClient
    TabOrder = 1
  end
  object UniContainerPanel3: TUniContainerPanel
    Left = 0
    Top = 558
    Width = 964
    Height = 90
    Hint = ''
    ParentColor = False
    Align = alBottom
    TabOrder = 2
    object edDtl: TUniButton
      Left = 6
      Top = 6
      Width = 86
      Height = 33
      Hint = ''
      Caption = 'Detail (F2)'
      TabOrder = 1
      OnClick = edDtlClick
    end
    object edBayar: TUniButton
      Left = 98
      Top = 6
      Width = 86
      Height = 33
      Hint = ''
      Caption = 'Bayar (F3)'
      TabOrder = 2
      OnClick = edBayarClick
    end
    object btnAmbilHasil: TUniButton
      Left = 190
      Top = 6
      Width = 134
      Height = 33
      Hint = ''
      Caption = 'Ambil Hasil (F4)'
      TabOrder = 3
      OnClick = btnAmbilHasilClick
    end
    object edBatal: TUniButton
      Left = 330
      Top = 6
      Width = 82
      Height = 33
      Hint = ''
      Visible = False
      Caption = 'Batal (F5)'
      TabOrder = 4
    end
    object edExit: TUniButton
      Left = 418
      Top = 6
      Width = 74
      Height = 33
      Hint = ''
      Caption = 'Exit (F6)'
      TabOrder = 5
      OnClick = edExitClick
    end
    object edLbl: TUniButton
      Left = 498
      Top = 6
      Width = 82
      Height = 33
      Hint = ''
      Caption = 'Label (F7)'
      TabOrder = 6
      OnClick = edLblClick
    end
    object edPrint: TUniButton
      Left = 584
      Top = 6
      Width = 94
      Height = 33
      Hint = ''
      Visible = False
      Caption = 'Print (F10)'
      TabOrder = 7
    end
    object edKuitansi: TUniButton
      Left = 682
      Top = 6
      Width = 114
      Height = 33
      Hint = ''
      Caption = 'Kuitansi (F11)'
      TabOrder = 8
      OnClick = edKuitansiClick
    end
    object UniButton1: TUniButton
      Left = 802
      Top = 6
      Width = 114
      Height = 33
      Hint = ''
      Caption = 'Barcode'
      TabOrder = 9
      OnClick = UniButton1Click
    end
    object btnSerahTerimaHasil: TUniButton
      Left = 6
      Top = 45
      Width = 203
      Height = 36
      Hint = ''
      Caption = 'Form Serah Terima Hasil'
      TabOrder = 10
      OnClick = btnSerahTerimaHasilClick
    end
    object btnCopyNota: TUniButton
      Left = 215
      Top = 45
      Width = 109
      Height = 36
      Hint = ''
      Caption = 'Copy Nota'
      TabOrder = 11
      OnClick = btnCopyNotaClick
    end
  end
  object UniDBGrid1: TUniDBGrid
    Left = 0
    Top = 89
    Width = 964
    Height = 469
    Hint = ''
    DataSource = DSStatusHasil
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgAutoRefreshRow]
    WebOptions.Paged = False
    WebOptions.FetchAll = True
    LoadMask.Message = 'Loading data...'
    Align = alClient
    TabOrder = 3
    OnSelectionChange = UniDBGrid1SelectionChange
    OnCellClick = UniDBGrid1CellClick
    Columns = <
      item
        FieldName = 'nomor'
        Title.Caption = 'Nomor'
        Width = 99
      end
      item
        FieldName = 'nama'
        Title.Caption = 'Nama'
        Width = 196
      end
      item
        FieldName = 'telepon'
        Title.Caption = 'Telepon'
        Width = 123
      end
      item
        FieldName = 'alamat'
        Title.Caption = 'Alamat'
        Width = 199
      end
      item
        FieldName = 'dokter'
        Title.Caption = 'Dokter'
        Width = 174
      end
      item
        FieldName = 'Lunas'
        Title.Caption = 'Lunas'
        Width = 58
      end
      item
        FieldName = 'ambil_hasil'
        Title.Caption = 'Ambil hasil'
        Width = 67
      end>
  end
  object qStatus: TFDQuery
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      
        'select order_header.id,order_header.nomor,pasien.nama,pasien.tel' +
        'epon,pasien.alamat,dokter.nama dokter,order_header.flgLunas Luna' +
        's,flg_ambil_hasil ambil_hasil'
      'from'
      'order_header'
      'left join pasien on order_header.pasien_id = pasien.id'
      'left join dokter on order_header.dokter_id = dokter.id'
      'where'
      'order_header.tanggal like '#39'2019-03-17%'#39
      'order by order_header.nomor')
    Left = 656
    Top = 24
  end
  object DSStatusHasil: TDataSource
    DataSet = qStatus
    Left = 696
    Top = 24
  end
  object QPasien: TFDQuery
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      
        'select p.id,p.jenis_kelamin_id,CONCAT(pf.nama,'#39' '#39', p.nama) nama,' +
        'p.wilayah,CONCAT(p.telepon,'#39'/'#39',p.hp) tlp,p.alamat,'
      
        'CONCAT(TIMESTAMPDIFF( YEAR, p.tanggal_lahir, now() ),'#39' th '#39',TIME' +
        'STAMPDIFF( MONTH, p.tanggal_lahir, now() ) % 12,'#39' bl '#39',FLOOR( TI' +
        'MESTAMPDIFF( DAY, p.tanggal_lahir, now() ) % 30.4375 )) as umur'
      
        ' from pasien p, prefix pf where p.prefix_id = pf.id and p.nama l' +
        'ike '#39'%tes%'#39' order by p.nama')
    Left = 792
    Top = 8
  end
  object DSPasien: TDataSource
    DataSet = QPasien
    Left = 824
    Top = 8
  end
  object qDetail: TFDQuery
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      
        'select order_detail.id,order_detail.test_kode,order_detail.nama_' +
        'test,order_detail.harga,'
      'case when urgency.id = 1 then '#39'N'#39' else '#39'Y'#39' end cito'
      'from'
      'order_detail,'
      'urgency'
      'where'
      'order_detail.urgency_id = urgency.id and'
      'header_id = :header_id')
    Left = 864
    Top = 8
    ParamData = <
      item
        Name = 'HEADER_ID'
        DataType = ftString
        ParamType = ptInput
        Value = '14'
      end>
  end
  object qKuintansi: TFDQuery
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      
        'select pb.nomor no_kuitansi,oh.nomor,p.noreg, p.nama, pb.jumlah,' +
        'tb.nama tipe_bayar, u.nama user, pb.tanggal, tp.nama tipe_pasien' +
        ', d.nama dokter,p.alamat,p.telepon,p.hp,'
      
        'pb.tagihan,CONCAT(TIMESTAMPDIFF( YEAR, p.tanggal_lahir, now()),'#39 +
        ' th'#39') usia,p.tanggal_lahir,'
      'pf.nama prefix,jk.nama jenis_kelamin'
      'from'
      'order_header oh,'
      'pembayaran pb,'
      'pasien p,'
      'tipe_pembayaran tb,'
      'aguser u,'
      'tipe_pasien tp,'
      'dokter d,'
      'prefix pf,'
      'jenis_kelamin jk'
      'where'
      'oh.pembayaran_id = pb.id'
      'and oh.pasien_id = p.id'
      'and p.prefix_id = pf.id'
      'and p.jenis_kelamin_id = jk.id'
      'and pb.tipe_bayar_id = tb.id'
      'and pb.user_id = u.id'
      'and oh.tipe_pasien_id = tp.id'
      'and oh.dokter_id = d.id'
      'and oh.id = :header_id')
    Left = 48
    Top = 312
    ParamData = <
      item
        Name = 'HEADER_ID'
        DataType = ftString
        ParamType = ptInput
        Value = '816631'
      end>
    object qKuintansinomor: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nomor'
      Origin = 'nomor'
      Size = 30
    end
    object qKuintansinoreg: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'noreg'
      Origin = 'noreg'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
    object qKuintansinama: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nama'
      Origin = 'nama'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object qKuintansijumlah: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'jumlah'
      Origin = 'jumlah'
      ProviderFlags = []
      ReadOnly = True
      Precision = 12
      Size = 2
    end
    object qKuintansitipe_bayar: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tipe_bayar'
      Origin = 'nama'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object qKuintansiuser: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'user'
      Origin = 'nama'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object qKuintansitanggal: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'tanggal'
      Origin = 'tanggal'
      ProviderFlags = []
      ReadOnly = True
    end
    object qKuintansino_kuitansi: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'no_kuitansi'
      Origin = 'no_kuitansi'
      Size = 30
    end
    object qKuintansitipe_pasien: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tipe_pasien'
      Origin = 'tipe_pasien'
      Size = 50
    end
    object qKuintansidokter: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'dokter'
      Origin = 'dokter'
      Size = 50
    end
    object qKuintansialamat: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'alamat'
      Origin = 'alamat'
      Size = 100
    end
    object qKuintansitelepon: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'telepon'
      Origin = 'telepon'
    end
    object qKuintansitagihan: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'tagihan'
      Origin = 'tagihan'
      Precision = 12
      Size = 2
    end
    object qKuintansiusia: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'usia'
      Origin = 'usia'
      Size = 24
    end
    object qKuintansihp: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'hp'
      Origin = 'hp'
    end
    object qKuintansitanggal_lahir: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'tanggal_lahir'
      Origin = 'tanggal_lahir'
    end
    object qKuintansiprefix: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'prefix'
      Origin = 'prefix'
      Size = 50
    end
    object qKuintansijenis_kelamin: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'jenis_kelamin'
      Origin = 'jenis_kelamin'
      Size = 12
    end
  end
  object cmdAmbilHasil: TFDCommand
    Connection = UniMainModule.FDConnection1
    CommandText.Strings = (
      
        'update order_header set flg_ambil_hasil = '#39'Y'#39',user_ambil_hasil =' +
        ' :user_ambil_hasil where id = :id')
    ParamData = <
      item
        Name = 'USER_AMBIL_HASIL'
        DataType = ftString
        ParamType = ptInput
        Value = '0'
      end
      item
        Name = 'ID'
        ParamType = ptInput
      end>
    Left = 600
    Top = 24
  end
  object QPrinterLabel: TFDQuery
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select *'
      'from'
      'printer_label'
      'where'
      'id = 1')
    Left = 296
    Top = 376
  end
  object QSampling: TFDQuery
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      
        'select oh.id,oh.nomor,u.nama prioritas, concat(pf.nama,'#39' '#39',p.nam' +
        'a) nama,jk.nama kelamin,'
      'p.no_ktp,p.tanggal_lahir,'
      
        'CONCAT(TIMESTAMPDIFF( YEAR, p.tanggal_lahir, now() ),'#39' th '#39',TIME' +
        'STAMPDIFF( MONTH, p.tanggal_lahir, now() ) % 12,'#39' bl '#39',FLOOR( TI' +
        'MESTAMPDIFF( DAY, p.tanggal_lahir, now() ) % 30.4375 )) as umur,'
      'p.alamat,p.hp,'
      'p.noreg, d.nama dokter,'
      'tp.nama tipe_pasien,'
      'ap.nama asal_pasien,'
      'ans.nama ansuransi'
      'from'
      'order_header oh'
      'left join urgency u on oh.urgency_id = u.id '
      'left join pasien p on oh.pasien_id = p.id'
      'left join prefix pf on p.prefix_id = pf.id'
      'left join jenis_kelamin jk on p.jenis_kelamin_id = jk.id'
      'left join dokter d on oh.dokter_id = d.id'
      'left join tipe_pasien tp on oh.tipe_pasien_id = tp.id'
      'left join asal_pasien ap on oh.asal_pasien_id = ap.id'
      
        'left join ansuransi_pasien ans on oh.ansuransi_pasien_id = ans.i' +
        'd'
      'where'
      'oh.id = :id')
    Left = 336
    Top = 352
    ParamData = <
      item
        Name = 'ID'
        ParamType = ptInput
        Value = Null
      end>
  end
  object QSample: TFDQuery
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      
        'select distinct js.id,js.nama jenis_sampel,d.status_id ,concat(o' +
        'h.nomor,js.kode) nosample'
      'from '
      'order_detail d '
      'left join order_header oh on d.header_id = oh.id'
      'left join test t on d.test_id = t.id and t.ada_hasil ='#39'Y'#39' '
      'left join jenis_sample js on t.jenis_sample_id = js.id'
      'where '
      'd.header_id = :header_id'
      'and js.id is not null'
      'order by js.id,t.kode')
    Left = 360
    Top = 424
    ParamData = <
      item
        Name = 'HEADER_ID'
        DataType = ftString
        ParamType = ptInput
        Value = '10'
      end>
  end
  object DSPrint: TDataSource
    DataSet = qPrint
    Left = 504
    Top = 456
  end
  object qPrint: TFDQuery
    Active = True
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      
        'select od.header_id,t.level,t.nama as pemeriksaan,od.harga, od.c' +
        'etak_nota,t.ada_harga,'
      
        'oh.nomor,CONCAT(pr.nama,'#39' '#39',p.nama) nama,p.telepon,d.nama dokter' +
        ',tp.nama tipe_pasien,'
      
        'p.alamat, pb.jumlah,p.noreg id_pasien,oh.catatan,ap.nama asal, a' +
        'np.nama ansuransi, au.user_name'
      ',oh.tanggal,'
      'od.diskon,'
      'oh.disc_amount,'
      'oh.sub_total,'
      'oh.tagihan,'
      'od.harga - (od.harga * od.diskon/100) harga_total,'
      'oh.disc_pct,'
      'case oh.flgLunas when '#39'Y'#39' then '#39'LUNAS'#39
      'else '#39'BELUM LUNAS'#39
      'end flgLunas,'
      'p.hp'
      'from'
      'order_detail od,'
      'order_header oh,'
      'prefix pr,'
      'pasien p,'
      'dokter d,'
      'tipe_pasien tp,'
      'pembayaran pb,'
      'test t,'
      'asal_pasien ap,'
      'ansuransi_pasien anp,'
      'aguser au'
      'where'
      'od.test_id = t.id'
      'and od.header_id = oh.id'
      'and oh.pasien_id = p.id'
      'and p.prefix_id = pr.id'
      'and oh.dokter_id = d.id'
      'and oh.tipe_pasien_id = tp.id'
      'and oh.pembayaran_id = pb.id'
      'and oh.asal_pasien_id = ap.id'
      'and oh.ansuransi_pasien_id = anp.id'
      'and od.header_id = :header_id'
      'and pb.user_id = au.id'
      'order by t.kode')
    Left = 536
    Top = 472
    ParamData = <
      item
        Name = 'HEADER_ID'
        DataType = ftString
        ParamType = ptInput
        Value = '44'
      end>
    object qPrintheader_id: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'header_id'
      Origin = 'header_id'
    end
    object qPrintlevel: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'level'
      Origin = '`level`'
      ProviderFlags = []
      ReadOnly = True
    end
    object qPrintpemeriksaan: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pemeriksaan'
      Origin = 'nama'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object qPrintharga: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'harga'
      Origin = 'harga'
      Precision = 12
      Size = 2
    end
    object qPrintcetak_nota: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cetak_nota'
      Origin = 'cetak_nota'
      FixedChar = True
      Size = 1
    end
    object qPrintada_harga: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ada_harga'
      Origin = 'ada_harga'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object qPrintnomor: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nomor'
      Origin = 'nomor'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
    object qPrintnama: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nama'
      Origin = 'nama'
      ProviderFlags = []
      ReadOnly = True
      Size = 101
    end
    object qPrinttelepon: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'telepon'
      Origin = 'telepon'
      ProviderFlags = []
      ReadOnly = True
    end
    object qPrintdokter: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'dokter'
      Origin = 'nama'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object qPrinttipe_pasien: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tipe_pasien'
      Origin = 'nama'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object qPrintalamat: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'alamat'
      Origin = 'alamat'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object qPrintjumlah: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'jumlah'
      Origin = 'jumlah'
      ProviderFlags = []
      ReadOnly = True
      Precision = 12
      Size = 2
    end
    object qPrintid_pasien: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'id_pasien'
      Origin = 'noreg'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
    object qPrintcatatan: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'catatan'
      Origin = 'catatan'
      ProviderFlags = []
      ReadOnly = True
      Size = 150
    end
    object qPrintasal: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'asal'
      Origin = 'nama'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object qPrintansuransi: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ansuransi'
      Origin = 'nama'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object qPrintuser_name: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'user_name'
      Origin = 'nama'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object qPrinttanggal: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'tanggal'
      Origin = 'tanggal'
      ProviderFlags = []
      ReadOnly = True
    end
    object qPrintdiskon: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'diskon'
      Origin = 'diskon'
      Precision = 10
      Size = 2
    end
    object qPrintharga_total: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'harga_total'
      Origin = 'harga_total'
      ProviderFlags = []
      ReadOnly = True
      Precision = 27
    end
    object qPrintdisc_pct: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'disc_pct'
      Origin = 'disc_pct'
      ProviderFlags = []
      ReadOnly = True
      Precision = 4
      Size = 2
    end
    object qPrintflgLunas: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'flgLunas'
      Origin = 'flgLunas'
      ProviderFlags = []
      ReadOnly = True
      Size = 11
    end
    object qPrinthp: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'hp'
      Origin = 'hp'
      ProviderFlags = []
      ReadOnly = True
    end
    object qPrintdisc_amount: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'disc_amount'
      Origin = 'disc_amount'
      ProviderFlags = []
      ReadOnly = True
      Precision = 12
      Size = 2
    end
    object qPrintsub_total: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'sub_total'
      Origin = 'sub_total'
      ProviderFlags = []
      ReadOnly = True
      Precision = 12
      Size = 2
    end
    object qPrinttagihan: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'tagihan'
      Origin = 'tagihan'
      ProviderFlags = []
      ReadOnly = True
      Precision = 12
      Size = 2
    end
  end
end
