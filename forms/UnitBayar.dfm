object frmBayar: TfrmBayar
  Left = 0
  Top = 0
  ClientHeight = 438
  ClientWidth = 412
  Caption = 'Pembayaran'
  BorderStyle = bsDialog
  OldCreateOrder = False
  OnClose = UniFormClose
  OnKeyDown = UniFormKeyDown
  MonitoredKeys.Enabled = True
  MonitoredKeys.KeyHandleAll = False
  MonitoredKeys.Keys = <
    item
      KeyStart = 112
      KeyEnd = 123
      HandleBrowser = False
    end>
  Font.Height = -13
  Font.Name = 'Roboto'
  OnAfterShow = UniFormAfterShow
  PixelsPerInch = 96
  TextHeight = 15
  object UniContainerPanel1: TUniContainerPanel
    Left = 0
    Top = 0
    Width = 412
    Height = 89
    Hint = ''
    ParentColor = False
    Align = alTop
    TabOrder = 0
    object UniPanel1: TUniPanel
      Left = 0
      Top = 0
      Width = 412
      Height = 89
      Hint = ''
      Align = alClient
      TabOrder = 1
      Caption = ''
      Color = clNavy
      object LblStatusLunas: TUniLabel
        Left = 3
        Top = 47
        Width = 396
        Height = 38
        Hint = ''
        Alignment = taCenter
        AutoSize = False
        Caption = 'Belum Lunas'
        ParentFont = False
        Font.Color = clWindow
        Font.Height = -32
        Font.Style = [fsBold]
        TabOrder = 1
      end
      object lblNoLab: TUniLabel
        Left = 3
        Top = 3
        Width = 406
        Height = 38
        Hint = ''
        Alignment = taCenter
        AutoSize = False
        Caption = 'No Lab :'
        ParentFont = False
        Font.Color = clWindow
        Font.Height = -32
        Font.Style = [fsBold]
        TabOrder = 2
      end
    end
  end
  object UniLabel1: TUniLabel
    Left = 16
    Top = 144
    Width = 32
    Height = 19
    Hint = ''
    Caption = 'Jenis'
    ParentFont = False
    Font.Height = -16
    Font.Name = 'Calibri'
    TabOrder = 1
  end
  object UniLabel2: TUniLabel
    Left = 16
    Top = 180
    Width = 46
    Height = 19
    Hint = ''
    Caption = 'Charge'
    ParentFont = False
    Font.Height = -16
    Font.Name = 'Calibri'
    TabOrder = 2
  end
  object UniLabel3: TUniLabel
    Left = 16
    Top = 208
    Width = 73
    Height = 19
    Hint = ''
    Caption = 'Total Bayar'
    ParentFont = False
    Font.Height = -16
    Font.Name = 'Calibri'
    TabOrder = 3
  end
  object UniLabel4: TUniLabel
    Left = 16
    Top = 236
    Width = 42
    Height = 19
    Hint = ''
    Caption = 'TOTAL'
    ParentFont = False
    Font.Height = -16
    Font.Name = 'Calibri'
    TabOrder = 4
  end
  object UniLabel5: TUniLabel
    Left = 16
    Top = 264
    Width = 80
    Height = 19
    Hint = ''
    Caption = 'Pembayaran'
    ParentFont = False
    Font.Height = -16
    Font.Name = 'Calibri'
    TabOrder = 5
  end
  object UniLabel6: TUniLabel
    Left = 16
    Top = 292
    Width = 25
    Height = 15
    Hint = ''
    Caption = 'Sisa'
    TabOrder = 6
  end
  object UniLabel7: TUniLabel
    Left = 16
    Top = 320
    Width = 51
    Height = 19
    Hint = ''
    Caption = 'Tagihan'
    ParentFont = False
    Font.Height = -16
    Font.Name = 'Calibri'
    TabOrder = 7
  end
  object edCharge: TUniEdit
    Left = 144
    Top = 177
    Width = 250
    Hint = ''
    Alignment = taRightJustify
    Text = '0'
    ParentFont = False
    Font.Height = -16
    Font.Name = 'Calibri'
    TabOrder = 8
    OnKeyDown = edChargeKeyDown
    OnKeyPress = edChargeKeyPress
  end
  object edTotalBayar: TUniEdit
    Left = 144
    Top = 205
    Width = 250
    Hint = ''
    Alignment = taRightJustify
    Text = '0'
    ParentFont = False
    Font.Height = -16
    Font.Name = 'Calibri'
    TabOrder = 9
    ReadOnly = True
    OnKeyDown = edTotalBayarKeyDown
  end
  object edTOtal: TUniEdit
    Left = 144
    Top = 233
    Width = 250
    Hint = ''
    Alignment = taRightJustify
    Text = '0'
    ParentFont = False
    Font.Height = -16
    Font.Name = 'Calibri'
    TabOrder = 10
    ReadOnly = True
    OnKeyDown = edTOtalKeyDown
  end
  object edPembayaran: TUniEdit
    Left = 144
    Top = 261
    Width = 250
    Hint = ''
    Alignment = taRightJustify
    Text = ''
    ParentFont = False
    Font.Height = -16
    Font.Name = 'Calibri'
    TabOrder = 11
    OnKeyDown = edPembayaranKeyDown
  end
  object edSisa: TUniEdit
    Left = 144
    Top = 289
    Width = 250
    Hint = ''
    Alignment = taRightJustify
    Text = ''
    ParentFont = False
    Font.Height = -16
    Font.Name = 'Calibri'
    TabOrder = 12
    ReadOnly = True
    OnKeyDown = edSisaKeyDown
  end
  object edTagihan: TUniEdit
    Left = 144
    Top = 317
    Width = 250
    Hint = ''
    Alignment = taRightJustify
    Text = ''
    ParentFont = False
    Font.Height = -16
    Font.Name = 'Calibri'
    TabOrder = 13
    ReadOnly = True
    OnKeyDown = edTagihanKeyDown
  end
  object edSave: TUniButton
    Left = 2
    Top = 362
    Width = 81
    Height = 36
    Hint = ''
    Caption = 'F1 Save'
    ParentFont = False
    Font.Height = -16
    Font.Name = 'Calibri'
    TabOrder = 14
    OnClick = edSaveClick
  end
  object edCancel: TUniButton
    Left = 84
    Top = 362
    Width = 80
    Height = 36
    Hint = ''
    Caption = 'F2 Cancel'
    ParentFont = False
    Font.Height = -16
    Font.Name = 'Calibri'
    TabOrder = 15
    OnClick = edCancelClick
  end
  object edPrint: TUniButton
    Left = 164
    Top = 362
    Width = 68
    Height = 36
    Hint = ''
    Enabled = False
    Caption = 'F3 Nota'
    ParentFont = False
    Font.Height = -16
    Font.Name = 'Calibri'
    TabOrder = 16
    OnClick = edPrintClick
  end
  object btnExit: TUniButton
    Left = 340
    Top = 362
    Width = 66
    Height = 36
    Hint = ''
    Caption = 'F4 Exit'
    ParentFont = False
    Font.Height = -16
    Font.Name = 'Calibri'
    TabOrder = 17
    OnClick = btnExitClick
  end
  object cbJenis: TUniDBLookupComboBox
    Left = 144
    Top = 144
    Width = 250
    Height = 27
    Hint = ''
    ListField = 'nama'
    ListSource = dsJenisPemb
    KeyField = 'nama'
    ListFieldIndex = 0
    DataField = 'id'
    ParentFont = False
    Font.Height = -16
    Font.Name = 'Calibri'
    TabOrder = 18
    Color = clWindow
    ForceSelection = True
    OnChange = cbJenisChange
    OnKeyDown = cbJenisKeyDown
    OnKeyUp = cbJenisKeyUp
  end
  object btnKuitansi: TUniButton
    Left = 233
    Top = 362
    Width = 106
    Height = 36
    Hint = ''
    Enabled = False
    Caption = 'F11 Kuitansi'
    ParentFont = False
    Font.Height = -16
    Font.Name = 'Calibri'
    TabOrder = 19
    OnClick = btnKuitansiClick
  end
  object btnBayarPenuh: TUniButton
    Left = 3
    Top = 399
    Width = 129
    Height = 36
    Hint = ''
    Caption = 'F5 Bayar Penuh'
    ParentFont = False
    Font.Height = -16
    Font.Name = 'Calibri'
    TabOrder = 20
    OnClick = btnBayarPenuhClick
  end
  object btnLabel: TUniButton
    Left = 133
    Top = 399
    Width = 89
    Height = 36
    Hint = ''
    Enabled = False
    Caption = 'F7 Label'
    ParentFont = False
    Font.Height = -16
    Font.Name = 'Calibri'
    TabOrder = 21
    OnClick = btnLabelClick
  end
  object rbNomor: TUniRadioGroup
    Left = 8
    Top = 88
    Width = 386
    Height = 50
    Hint = ''
    Caption = 'No. Lab'
    TabOrder = 22
  end
  object rbAuto: TUniRadioButton
    Left = 19
    Top = 112
    Width = 113
    Height = 17
    Hint = ''
    Checked = True
    Caption = 'Auto'
    TabOrder = 23
    OnClick = rbManualClick
  end
  object rbManual: TUniRadioButton
    Left = 138
    Top = 112
    Width = 71
    Height = 17
    Hint = ''
    Caption = 'Manual :'
    TabOrder = 24
    OnClick = rbManualClick
  end
  object edNoLab: TUniEdit
    Left = 215
    Top = 109
    Width = 170
    Hint = ''
    Enabled = False
    Text = ''
    TabOrder = 25
  end
  object qJenisPemb: TFDQuery
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id,kode,nama from tipe_pembayaran order by id')
    Left = 24
    Top = 8
  end
  object dsJenisPemb: TDataSource
    DataSet = qJenisPemb
    Left = 72
    Top = 16
  end
  object FDcmd: TFDCommand
    Connection = UniMainModule.FDConnection1
    Left = 200
    Top = 16
  end
  object FDQuery: TFDQuery
    Connection = UniMainModule.FDConnection1
    Left = 264
    Top = 16
  end
  object qPrint: TFDQuery
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      
        'select od.header_id,t.level,t.nama as pemeriksaan,od.harga, od.c' +
        'etak_nota,t.ada_harga,'
      
        'oh.nomor,CONCAT(pr.nama,'#39' '#39',p.nama) nama,p.telepon,d.nama dokter' +
        ',tp.nama tipe_pasien,'
      
        'p.alamat, pb.jumlah,p.noreg id_pasien,oh.catatan,ap.nama asal, a' +
        'np.nama ansuransi, au.user_name,'
      'prj.nama perujuk'
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
      'p.hp,'
      'p.catatan catatan_pasien,'
      'IFNULL(sum(um.uang_muka),0) uang_muka'
      'from'
      'order_detail od'
      'LEFT JOIN order_header oh ON od.header_id = oh.id'
      'LEFT JOIN'
      '('
      'select id,sum(jumlah) uang_muka'
      'from'
      'pembayaran'
      'where'
      'order_header_id = :header_id'
      'group by id'
      ') um ON  um.id <> oh.pembayaran_id'
      'LEFT JOIN pasien p ON  oh.pasien_id = p.id'
      'LEFT JOIN prefix pr ON  p.prefix_id = pr.id'
      ''
      'LEFT JOIN dokter d ON  oh.dokter_id = d.id'
      'LEFT JOIN tipe_pasien tp ON  oh.tipe_pasien_id = tp.id'
      'LEFT JOIN pembayaran pb ON oh.pembayaran_id = pb.id'
      'LEFT JOIN test t ON od.test_id = t.id'
      'LEFT JOIN asal_pasien ap ON oh.asal_pasien_id = ap.id'
      
        'LEFT JOIN ansuransi_pasien anp ON oh.ansuransi_pasien_id = anp.i' +
        'd'
      'LEFT JOIN aguser au ON pb.user_id = au.id'
      'LEFT JOIN perujuk prj ON oh.perujuk_id = prj.id'
      'where'
      'od.header_id = :header_id'
      
        'group by od.header_id,t.level,t.nama,od.harga, od.cetak_nota,t.a' +
        'da_harga,'
      'oh.nomor,CONCAT(pr.nama,'#39' '#39',p.nama),p.telepon,d.nama,tp.nama ,'
      
        'p.alamat, pb.jumlah,p.noreg ,oh.catatan,ap.nama , anp.nama , au.' +
        'user_name,'
      'prj.nama,oh.tanggal,'
      'od.diskon,'
      'oh.disc_amount,'
      'oh.sub_total,'
      'oh.tagihan'
      'order by t.kode')
    Left = 88
    Top = 144
    ParamData = <
      item
        Name = 'HEADER_ID'
        DataType = ftString
        ParamType = ptInput
        Value = '834478'
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
      Origin = 'user_name'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
    object qPrintperujuk: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'perujuk'
      Origin = 'nama'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
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
      Precision = 5
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
    object qPrintcatatan_pasien: TMemoField
      AutoGenerateValue = arDefault
      FieldName = 'catatan_pasien'
      Origin = 'catatan'
      ProviderFlags = []
      ReadOnly = True
      BlobType = ftMemo
    end
    object qPrintuang_muka: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'uang_muka'
      Origin = 'uang_muka'
      ProviderFlags = []
      ReadOnly = True
      Precision = 56
      Size = 2
    end
  end
  object DSPrint: TDataSource
    DataSet = qPrint
    Left = 56
    Top = 144
  end
  object qCharge: TFDQuery
    Connection = UniMainModule.FDConnection1
    Left = 144
    Top = 16
  end
  object qKuintansi: TFDQuery
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      
        'select pb.nomor no_kuitansi,oh.nomor,p.noreg, p.nama, pb.jumlah,' +
        'tb.nama tipe_bayar, u.user_name user, pb.tanggal,'
      ' tp.nama tipe_pasien, d.nama dokter,p.alamat,p.telepon,p.hp,'
      
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
    Left = 88
    Top = 224
    ParamData = <
      item
        Name = 'HEADER_ID'
        DataType = ftString
        ParamType = ptInput
        Value = '817008'
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
    object qKuintansiprefix: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'prefix'
      Origin = 'prefix'
      Size = 50
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
    object qKuintansijenis_kelamin: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'jenis_kelamin'
      Origin = 'jenis_kelamin'
      Size = 12
    end
  end
  object DataSource1: TDataSource
    DataSet = qKuintansi
    Left = 96
    Top = 264
  end
  object qTmp: TFDQuery
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'SELECT * FROM order_header WHERE id = :id')
    Left = 56
    Top = 296
    ParamData = <
      item
        Name = 'ID'
        DataType = ftString
        ParamType = ptInput
        Value = '0'
      end>
  end
  object cmdCallForm: TFDCommand
    Connection = UniMainModule.FDConnection1
    Left = 96
    Top = 304
  end
  object cmdLogging: TFDCommand
    Connection = UniMainModule.FDConnection1
    CommandText.Strings = (
      
        'INSERT INTO order_status_time (tanggal,order_header_id,order_sta' +
        'tus_id,user_id,keterangan)'
      
        'VALUES (NOW(),:order_header_id,:order_status_id,:user_id,:ketera' +
        'ngan)')
    ParamData = <
      item
        Name = 'ORDER_HEADER_ID'
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'ORDER_STATUS_ID'
        ParamType = ptInput
      end
      item
        Name = 'USER_ID'
        ParamType = ptInput
      end
      item
        Name = 'KETERANGAN'
        ParamType = ptInput
      end>
    Left = 192
    Top = 304
  end
  object QSave: TFDQuery
    Connection = UniMainModule.FDConnection1
    Left = 56
    Top = 184
  end
  object QSave2: TFDQuery
    Connection = UniMainModule.FDConnection1
    Left = 88
    Top = 184
  end
  object QSave3: TFDQuery
    Connection = UniMainModule.FDConnection1
    Left = 56
    Top = 264
  end
  object Qzpl: TFDQuery
    Connection = UniMainModule.FDConnection1
    Left = 144
    Top = 304
  end
  object QCek: TFDQuery
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      
        'select id from order_detail where header_id = :header_id and tes' +
        't_kode = :test_kode')
    Left = 328
    Top = 24
    ParamData = <
      item
        Name = 'HEADER_ID'
        DataType = ftString
        ParamType = ptInput
        Value = '0'
      end
      item
        Name = 'TEST_KODE'
        DataType = ftString
        ParamType = ptInput
        Value = '0'
      end>
  end
  object QTubes: TFDQuery
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'SELECT h.nomor,tb.suffix,p.nama,p.tanggal_lahir,'
      'p.nama,ap.nama asal_pasien,tb.nama tube,'
      
        'p.noreg,p.nomor_mr,jk.nama jenis_kelamin ,group_concat(t.nama , ' +
        #39' '#39') tests'
      'FROM'
      'order_detail d'
      'LEFT JOIN order_header h ON d.header_id = h.id'
      'LEFT JOIN test t ON d.test_id = t.id'
      'LEFT JOIN specimen sp ON t.specimen_id = sp.id'
      'LEFT JOIN tubes tb ON t.tube_id = tb.id'
      'LEFT JOIN pasien p ON h.pasien_id = p.id'
      'LEFT JOIN asal_pasien ap ON h.asal_pasien_id = ap.id'
      'LEFT JOIN jenis_kelamin jk ON p.jenis_kelamin_id = jk.id'
      'WHERE'
      'd.header_id = :header_id'
      'AND t.tube_id IS NOT NULL '
      'GROUP BY h.nomor,tb.suffix,p.nama,p.tanggal_lahir,'
      'p.nama,ap.nama ,tb.nama ,'
      'p.noreg,p.nomor_mr,jk.nama ')
    Left = 56
    Top = 224
    ParamData = <
      item
        Name = 'HEADER_ID'
        DataType = ftString
        ParamType = ptInput
        Value = '1'
      end>
  end
  object QNoLabCari: TFDQuery
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id from order_header where nomor = :nomor')
    Left = 376
    Top = 24
    ParamData = <
      item
        Name = 'NOMOR'
        DataType = ftString
        ParamType = ptInput
        Value = '23'
      end>
  end
end
