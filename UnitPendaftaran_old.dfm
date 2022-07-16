object frmPendaftaran: TfrmPendaftaran
  Left = 0
  Top = 0
  ClientHeight = 628
  ClientWidth = 1075
  Caption = 'Pendaftaran'
  OldCreateOrder = False
  OnKeyDown = UniFormKeyDown
  BorderIcons = [biSystemMenu, biMinimize]
  MonitoredKeys.Enabled = True
  MonitoredKeys.KeyHandleAll = False
  MonitoredKeys.Keys = <
    item
      KeyStart = 112
      KeyEnd = 123
      HandleBrowser = False
    end>
  Font.Height = -16
  OnAfterShow = UniFormAfterShow
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 19
  object UniPanel2: TUniPanel
    Left = 0
    Top = 0
    Width = 450
    Height = 524
    Hint = ''
    Align = alLeft
    TabOrder = 0
    Caption = 'UniPanel2'
    object UniPanel4: TUniPanel
      Left = 1
      Top = 1
      Width = 448
      Height = 160
      Hint = ''
      Align = alTop
      TabOrder = 1
      Caption = ''
      object edNama: TUniEdit
        Left = 149
        Top = 7
        Width = 294
        Hint = ''
        Text = ''
        TabOrder = 1
        ReadOnly = True
      end
      object edKelamin: TUniEdit
        Left = 149
        Top = 35
        Width = 173
        Hint = ''
        Text = ''
        TabOrder = 2
        ReadOnly = True
      end
      object edUmur: TUniEdit
        Left = 328
        Top = 35
        Width = 115
        Hint = ''
        Text = ''
        TabOrder = 3
        ReadOnly = True
      end
      object edAlamat: TUniEdit
        Left = 149
        Top = 63
        Width = 294
        Hint = ''
        Text = ''
        TabOrder = 4
        ReadOnly = True
      end
      object edTelp: TUniEdit
        Left = 149
        Top = 91
        Width = 140
        Hint = ''
        Text = ''
        TabOrder = 5
        ReadOnly = True
      end
      object edPatientID: TUniEdit
        Left = 149
        Top = 119
        Width = 294
        Hint = ''
        Text = ''
        TabOrder = 6
        OnKeyDown = edPatientIDKeyDown
      end
      object UniLabel1: TUniLabel
        Left = 16
        Top = 9
        Width = 41
        Height = 19
        Hint = ''
        Caption = 'Nama'
        TabOrder = 7
      end
      object UniLabel2: TUniLabel
        Left = 16
        Top = 37
        Width = 112
        Height = 19
        Hint = ''
        Caption = 'Kelamin / Umur'
        TabOrder = 8
      end
      object UniLabel3: TUniLabel
        Left = 16
        Top = 65
        Width = 50
        Height = 19
        Hint = ''
        Caption = 'Alamat'
        TabOrder = 9
      end
      object UniLabel4: TUniLabel
        Left = 16
        Top = 93
        Width = 57
        Height = 19
        Hint = ''
        Caption = 'Telepon'
        TabOrder = 10
      end
      object UniLabel5: TUniLabel
        Left = 16
        Top = 121
        Width = 67
        Height = 19
        Hint = ''
        Caption = 'ID pasien'
        TabOrder = 11
      end
      object edHp: TUniEdit
        Left = 295
        Top = 91
        Width = 148
        Hint = ''
        Text = ''
        TabOrder = 12
        ReadOnly = True
      end
      object edPasienId: TUniEdit
        Left = 94
        Top = 9
        Width = 49
        Hint = ''
        Visible = False
        Text = ''
        TabOrder = 13
        ReadOnly = True
      end
      object edJenisKelaminId: TUniEdit
        Left = 94
        Top = 37
        Width = 49
        Height = 20
        Hint = ''
        Visible = False
        Text = ''
        TabOrder = 14
        ReadOnly = True
      end
    end
    object uniDBGrid: TUniDBGrid
      Left = 1
      Top = 161
      Width = 448
      Height = 362
      Hint = ''
      DataSource = DSTest
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgAutoRefreshRow]
      ReadOnly = True
      WebOptions.Paged = False
      LoadMask.Message = 'Loading data...'
      Align = alClient
      Font.Height = -16
      ParentFont = False
      TabOrder = 2
      OnKeyDown = uniDBGridKeyDown
      OnKeyPress = edCariTestKeyPress
      Columns = <
        item
          FieldName = 'kode'
          Title.Caption = 'kode'
          Title.Font.Height = -16
          Width = 95
        end
        item
          FieldName = 'nama'
          Title.Caption = 'Pemeriksaan'
          Title.Font.Height = -16
          Width = 328
        end>
    end
  end
  object UniPanel3: TUniPanel
    Left = 450
    Top = 0
    Width = 625
    Height = 524
    Hint = ''
    Align = alClient
    TabOrder = 1
    Caption = ''
    ExplicitLeft = 350
    ExplicitWidth = 519
    ExplicitHeight = 579
    object UniPanel5: TUniPanel
      Left = 1
      Top = 1
      Width = 623
      Height = 192
      Hint = ''
      Align = alTop
      TabOrder = 1
      Caption = ''
      object edDokter: TUniEdit
        Left = 74
        Top = 10
        Width = 200
        Hint = ''
        Text = '-'
        TabOrder = 1
        ReadOnly = True
      end
      object UniLabel6: TUniLabel
        Left = 8
        Top = 9
        Width = 47
        Height = 19
        Hint = ''
        Caption = 'Dokter'
        TabOrder = 2
      end
      object UniLabel7: TUniLabel
        Left = 8
        Top = 42
        Width = 45
        Height = 19
        Hint = ''
        Caption = 'Pasien'
        TabOrder = 3
      end
      object cbTipePasien: TUniDBLookupComboBox
        Left = 74
        Top = 38
        Width = 203
        Height = 27
        Hint = ''
        ListOnlyMode = lmFollowSource
        ListSource = DSTipePasien
        KeyField = 'nama'
        ListFieldIndex = 0
        DataField = 'id'
        TabOrder = 4
        Color = clWindow
      end
      object UniLabel8: TUniLabel
        Left = 325
        Top = 10
        Width = 34
        Height = 19
        Hint = ''
        Caption = 'Hasil'
        TabOrder = 5
      end
      object UniLabel9: TUniLabel
        Left = 325
        Top = 39
        Width = 28
        Height = 19
        Hint = ''
        Caption = 'Cito'
        TabOrder = 6
      end
      object cbTipeHasil: TUniDBLookupComboBox
        Left = 365
        Top = 4
        Width = 203
        Height = 27
        Hint = ''
        ListSource = DSTipeHasil
        KeyField = 'nama'
        ListFieldIndex = 0
        DataField = 'id'
        TabOrder = 7
        Color = clWindow
      end
      object cbCito: TUniDBLookupComboBox
        Left = 365
        Top = 37
        Width = 203
        Height = 27
        Hint = ''
        ListSource = DSCito
        KeyField = 'nama'
        ListFieldIndex = 0
        DataField = 'id'
        TabOrder = 8
        Color = clWindow
        ForceSelection = True
      end
      object mmDiagnosis: TUniMemo
        Left = 10
        Top = 127
        Width = 287
        Height = 33
        Hint = ''
        TabOrder = 9
        EmptyText = 'Diagnosa'
      end
      object edDokterId: TUniEdit
        Left = 5
        Top = 14
        Width = 49
        Hint = ''
        Visible = False
        Text = ''
        TabOrder = 11
        ReadOnly = True
      end
      object cbAsal: TUniDBLookupComboBox
        Left = 73
        Top = 67
        Width = 203
        Height = 27
        Hint = ''
        ListSource = dsAsal
        KeyField = 'nama'
        ListFieldIndex = 0
        DataField = 'id'
        TabOrder = 12
        Color = clWindow
      end
      object UniLabel14: TUniLabel
        Left = 5
        Top = 71
        Width = 30
        Height = 19
        Hint = ''
        Caption = 'Asal'
        TabOrder = 13
      end
      object UniLabel15: TUniLabel
        Left = 300
        Top = 75
        Width = 66
        Height = 19
        Hint = ''
        Caption = 'Penjamin'
        TabOrder = 14
      end
      object cbPenjamin: TUniDBLookupComboBox
        Left = 366
        Top = 70
        Width = 203
        Height = 27
        Hint = ''
        ListSource = dsAnsuransi
        KeyField = 'nama'
        ListFieldIndex = 0
        DataField = 'id'
        TabOrder = 15
        Color = clWindow
        ForceSelection = True
      end
      object UniLabel16: TUniLabel
        Left = 5
        Top = 99
        Width = 37
        Height = 19
        Hint = ''
        Caption = 'Form'
        TabOrder = 16
      end
      object cbRuangan: TUniDBLookupComboBox
        Left = 73
        Top = 95
        Width = 203
        Height = 27
        Hint = ''
        ListSource = dsRuangan
        KeyField = 'nama'
        ListFieldIndex = 0
        DataField = 'id'
        TabOrder = 17
        Color = clWindow
      end
      object mmInternalNote: TUniMemo
        Left = 311
        Top = 127
        Width = 293
        Height = 33
        Hint = ''
        TabOrder = 10
        EmptyText = 'Catatan internal'
      end
    end
    object UniPanel6: TUniPanel
      Left = 1
      Top = 193
      Width = 623
      Height = 216
      Hint = ''
      Align = alClient
      TabOrder = 2
      Caption = ''
      object UniPanel7: TUniPanel
        Left = 1
        Top = 1
        Width = 621
        Height = 8
        Hint = ''
        Align = alTop
        TabOrder = 1
        Caption = ''
      end
      object GrdPemeriksaan: TUniStringGrid
        Left = 1
        Top = 9
        Width = 621
        Height = 206
        Hint = ''
        FixedCols = 0
        RowCount = 2
        ColCount = 4
        Options = [goVertLine, goHorzLine, goRowSizing, goColSizing, goRowSelect]
        CustomizableCells = False
        Columns = <
          item
          end
          item
          end
          item
            Title.Alignment = taRightJustify
            Title.Caption = ' '
          end
          item
          end>
        ClientEvents.ExtEvents.Strings = (
          
            'reconfigure=function reconfigure(sender, store, columns, oldStor' +
            'e, the, eOpts)'#13#10'{'#13#10'  columns[0].align = '#39'center'#39';'#13#10'  columns[1].' +
            'align = '#39'left'#39';'#13#10'  columns[2].align = '#39'right'#39';'#13#10'  columns[3].ali' +
            'gn = '#39'right'#39';'#13#10'}')
        OnDrawCell = GrdPemeriksaanDrawCell
        Align = alClient
        TabOrder = 2
      end
    end
    object pnlSumary: TUniPanel
      Left = 1
      Top = 409
      Width = 623
      Height = 114
      Hint = ''
      Align = alBottom
      TabOrder = 3
      Caption = ''
      object UniLabel11: TUniLabel
        Left = 417
        Top = 5
        Width = 68
        Height = 19
        Hint = ''
        Caption = 'Sub Total'
        TabOrder = 1
      end
      object edSubTotal: TUniEdit
        Left = 488
        Top = 6
        Width = 121
        Hint = ''
        Alignment = taRightJustify
        Text = ''
        TabOrder = 2
        ReadOnly = True
      end
      object edDiscAmount: TUniEdit
        Left = 488
        Top = 34
        Width = 121
        Hint = ''
        Alignment = taRightJustify
        Text = ''
        TabOrder = 3
        OnChange = edDiscAmountChange
        OnKeyPress = edDiscAmountKeyPress
      end
      object edTotal: TUniEdit
        Left = 489
        Top = 62
        Width = 121
        Hint = ''
        Alignment = taRightJustify
        Text = ''
        TabOrder = 4
        ReadOnly = True
      end
      object UniLabel12: TUniLabel
        Left = 329
        Top = 35
        Width = 61
        Height = 19
        Hint = ''
        Caption = 'Discount'
        TabOrder = 5
      end
      object UniLabel13: TUniLabel
        Left = 434
        Top = 62
        Width = 51
        Height = 19
        Hint = ''
        Caption = 'TOTAL'
        TabOrder = 6
      end
      object edDiscount: TUniFormattedNumberEdit
        Left = 396
        Top = 34
        Width = 87
        Hint = ''
        Alignment = taRightJustify
        TabOrder = 7
        DecimalSeparator = '.'
        ThousandSeparator = ','
        OnChange = edDiscountChange
        OnKeyPress = edDiscountKeyPress
      end
      object lblUangMuka: TUniLabel
        Left = 405
        Top = 87
        Width = 79
        Height = 19
        Hint = ''
        Visible = False
        Caption = 'Uang Muka'
        TabOrder = 8
      end
      object edUangMuka: TUniEdit
        Left = 489
        Top = 87
        Width = 121
        Hint = ''
        Visible = False
        Alignment = taRightJustify
        Text = ''
        TabOrder = 9
        ReadOnly = True
      end
    end
  end
  object UniPanel1: TUniPanel
    Left = 0
    Top = 524
    Width = 1075
    Height = 104
    Hint = ''
    Align = alBottom
    TabOrder = 2
    Caption = ''
    object btnCariPasien: TUniButton
      Left = 5
      Top = 5
      Width = 124
      Height = 43
      Hint = ''
      Caption = 'F1 Cari Pasien'
      TabOrder = 1
      OnClick = btnCariPasienClick
    end
    object btnCariDokter: TUniButton
      Left = 135
      Top = 5
      Width = 124
      Height = 43
      Hint = ''
      Caption = 'F2 Cari Dokter'
      TabOrder = 2
      OnClick = btnCariDokterClick
    end
    object edTest: TUniButton
      Left = 265
      Top = 5
      Width = 124
      Height = 43
      Hint = ''
      Caption = 'F3 Test'
      TabOrder = 3
      OnClick = edTestClick
    end
    object btnDetail: TUniButton
      Left = 395
      Top = 5
      Width = 124
      Height = 43
      Hint = ''
      Caption = 'F4 Detail'
      TabOrder = 4
      OnClick = btnDetailClick
    end
    object btnDelete: TUniButton
      Left = 525
      Top = 5
      Width = 124
      Height = 43
      Hint = ''
      Caption = 'F5 Delete'
      TabOrder = 5
      OnClick = btnDeleteClick
    end
    object btnDiscount: TUniButton
      Left = 655
      Top = 5
      Width = 124
      Height = 43
      Hint = ''
      Caption = 'F6 Discount'
      TabOrder = 6
      OnClick = btnDiscountClick
    end
    object btnBayar: TUniButton
      Left = 785
      Top = 5
      Width = 88
      Height = 43
      Hint = ''
      Caption = 'F7 Bayar'
      TabOrder = 7
      OnClick = btnBayarClick
    end
    object btnClear: TUniButton
      Left = 879
      Top = 5
      Width = 90
      Height = 43
      Hint = ''
      Caption = 'F8 Clear'
      TabOrder = 8
      OnClick = btnClearClick
    end
    object btnNoReg: TUniButton
      Left = 975
      Top = 5
      Width = 90
      Height = 43
      Hint = ''
      Caption = 'F9 NoReg'
      TabOrder = 9
      OnClick = btnNoRegClick
    end
    object btnEditPasien: TUniButton
      Left = 213
      Top = 54
      Width = 132
      Height = 43
      Hint = ''
      Caption = 'F11 Edit Pasien'
      TabOrder = 10
      OnClick = btnEditPasienClick
    end
    object btnPTerakhir: TUniButton
      Left = 5
      Top = 54
      Width = 202
      Height = 43
      Hint = ''
      Caption = 'F10 Pemeriksaan Terakhir'
      TabOrder = 11
      OnClick = btnPTerakhirClick
    end
    object btnTglSelesai: TUniButton
      Left = 351
      Top = 54
      Width = 153
      Height = 43
      Hint = ''
      Caption = 'F12 Tanggal Selesai'
      TabOrder = 12
      OnClick = btnTglSelesaiClick
    end
  end
  object UniLabel10: TUniLabel
    Left = 459
    Top = 168
    Width = 82
    Height = 19
    Hint = ''
    Caption = 'Kode/Nama'
    TabOrder = 3
  end
  object edCariTest: TUniEdit
    Left = 547
    Top = 165
    Width = 270
    Hint = ''
    Text = ''
    TabOrder = 4
    OnChange = edCariTestChange
    OnKeyDown = UniFormKeyDown
    OnKeyPress = edCariTestKeyPress
  end
  object QTest: TFDQuery
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id,kode,nama '
      'from test '
      'where '
      'ada_harga='#39'Y'#39' '
      'order by kode')
    Left = 32
    Top = 464
  end
  object DSTest: TDataSource
    DataSet = QTest
    Left = 120
    Top = 472
  end
  object QTipePasien: TFDQuery
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'SELECT id,nama'
      'FROM'
      'tipe_pasien'
      'ORDER BY id')
    Left = 512
    Top = 24
  end
  object DSTipePasien: TDataSource
    DataSet = QTipePasien
    Left = 544
    Top = 32
  end
  object QTipeHasil: TFDQuery
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'SELECT id,nama'
      'FROM'
      'tipe_hasil'
      'ORDER BY id')
    Left = 984
    Top = 8
  end
  object DSTipeHasil: TDataSource
    DataSet = QTipeHasil
    Left = 1016
    Top = 8
  end
  object QCito: TFDQuery
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'SELECT id,nama'
      'FROM'
      'urgency'
      'ORDER BY id')
    Left = 984
    Top = 40
  end
  object DSCito: TDataSource
    DataSet = QCito
    Left = 1016
    Top = 40
  end
  object QCheckTest: TFDQuery
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'SELECT id,nama'
      'FROM'
      'tipe_pasien'
      'ORDER BY nama')
    Left = 480
    Top = 224
  end
  object dsAsal: TDataSource
    DataSet = QAsal
    Left = 552
    Top = 72
  end
  object QAsal: TFDQuery
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'SELECT id,nama'
      'FROM'
      'asal_pasien'
      'ORDER BY id')
    Left = 520
    Top = 64
  end
  object qAnsuransi: TFDQuery
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'SELECT id,nama'
      'FROM'
      'asal_pasien'
      'ORDER BY id')
    Left = 800
    Top = 72
  end
  object dsAnsuransi: TDataSource
    DataSet = qAnsuransi
    Left = 832
    Top = 80
  end
  object qRuangan: TFDQuery
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'SELECT id,nama'
      'FROM'
      'ruangan_pasien'
      'ORDER BY id')
    Left = 600
    Top = 88
  end
  object dsRuangan: TDataSource
    DataSet = qRuangan
    Left = 632
    Top = 96
  end
  object QEditPasien: TFDQuery
    Connection = UniMainModule.FDConnection1
    Left = 522
    Top = 416
  end
  object QPTerakhir: TFDQuery
    Connection = UniMainModule.FDConnection1
    Left = 464
    Top = 416
  end
  object QPTerakhirDtl: TFDQuery
    Connection = UniMainModule.FDConnection1
    Left = 464
    Top = 472
  end
  object QNotaCopy: TFDQuery
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
    Left = 616
    Top = 480
    ParamData = <
      item
        Name = 'HEADER_ID'
        DataType = ftString
        ParamType = ptInput
        Value = '44'
      end>
    object QNotaCopyheader_id: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'header_id'
      Origin = 'header_id'
    end
    object QNotaCopylevel: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'level'
      Origin = '`level`'
      ProviderFlags = []
      ReadOnly = True
    end
    object QNotaCopypemeriksaan: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pemeriksaan'
      Origin = 'nama'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object QNotaCopyharga: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'harga'
      Origin = 'harga'
      Precision = 12
      Size = 2
    end
    object QNotaCopycetak_nota: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cetak_nota'
      Origin = 'cetak_nota'
      FixedChar = True
      Size = 1
    end
    object QNotaCopyada_harga: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ada_harga'
      Origin = 'ada_harga'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object QNotaCopynomor: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nomor'
      Origin = 'nomor'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
    object QNotaCopynama: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nama'
      Origin = 'nama'
      ProviderFlags = []
      ReadOnly = True
      Size = 101
    end
    object QNotaCopytelepon: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'telepon'
      Origin = 'telepon'
      ProviderFlags = []
      ReadOnly = True
    end
    object QNotaCopydokter: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'dokter'
      Origin = 'nama'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object QNotaCopytipe_pasien: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tipe_pasien'
      Origin = 'nama'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object QNotaCopyalamat: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'alamat'
      Origin = 'alamat'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object QNotaCopyjumlah: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'jumlah'
      Origin = 'jumlah'
      ProviderFlags = []
      ReadOnly = True
      Precision = 12
      Size = 2
    end
    object QNotaCopyid_pasien: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'id_pasien'
      Origin = 'noreg'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
    object QNotaCopycatatan: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'catatan'
      Origin = 'catatan'
      ProviderFlags = []
      ReadOnly = True
      Size = 150
    end
    object QNotaCopyasal: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'asal'
      Origin = 'nama'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object QNotaCopyansuransi: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ansuransi'
      Origin = 'nama'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object QNotaCopyuser_name: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'user_name'
      Origin = 'nama'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object QNotaCopytanggal: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'tanggal'
      Origin = 'tanggal'
      ProviderFlags = []
      ReadOnly = True
    end
    object QNotaCopydiskon: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'diskon'
      Origin = 'diskon'
      Precision = 10
      Size = 2
    end
    object QNotaCopyharga_total: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'harga_total'
      Origin = 'harga_total'
      ProviderFlags = []
      ReadOnly = True
      Precision = 27
    end
    object QNotaCopydisc_pct: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'disc_pct'
      Origin = 'disc_pct'
      ProviderFlags = []
      ReadOnly = True
      Precision = 4
      Size = 2
    end
    object QNotaCopyflgLunas: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'flgLunas'
      Origin = 'flgLunas'
      ProviderFlags = []
      ReadOnly = True
      Size = 11
    end
    object QNotaCopyhp: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'hp'
      Origin = 'hp'
      ProviderFlags = []
      ReadOnly = True
    end
    object QNotaCopydisc_amount: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'disc_amount'
      Origin = 'disc_amount'
      ProviderFlags = []
      ReadOnly = True
      Precision = 12
      Size = 2
    end
    object QNotaCopysub_total: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'sub_total'
      Origin = 'sub_total'
      ProviderFlags = []
      ReadOnly = True
      Precision = 12
      Size = 2
    end
    object QNotaCopytagihan: TBCDField
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
