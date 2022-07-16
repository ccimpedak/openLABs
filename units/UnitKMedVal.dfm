object UniKMedVal: TUniKMedVal
  Left = 0
  Top = 0
  Width = 1038
  Height = 695
  OnBeforeReady = UniFrameBeforeReady
  OnReady = UniFrameReady
  Font.Height = -13
  Font.Name = 'Roboto'
  TabOrder = 0
  ParentFont = False
  object pnlAtas: TUniContainerPanel
    Left = 0
    Top = 0
    Width = 1038
    Height = 313
    Hint = ''
    ParentColor = False
    Align = alTop
    TabOrder = 0
    object pcAtas: TUniPageControl
      Left = 0
      Top = 0
      Width = 1038
      Height = 313
      Hint = ''
      ActivePage = tsOverview
      Align = alClient
      TabOrder = 1
      object tsOverview: TUniTabSheet
        Hint = ''
        Caption = 'Overview'
        OnBeforeActivate = tsOverviewBeforeActivate
        object UniContainerPanel1: TUniContainerPanel
          Left = 0
          Top = 0
          Width = 1030
          Height = 33
          Hint = ''
          ParentColor = False
          Align = alTop
          TabOrder = 0
          object UniLabel1: TUniLabel
            Left = 16
            Top = 8
            Width = 88
            Height = 13
            Hint = ''
            Caption = 'Order dari tanggal'
            TabOrder = 1
          end
          object lblDari: TUniLabel
            Left = 123
            Top = 8
            Width = 86
            Height = 15
            Hint = ''
            Alignment = taCenter
            AutoSize = False
            Caption = '<dari>'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Roboto'
            Font.Style = [fsBold]
            TabOrder = 2
          end
          object UniLabel3: TUniLabel
            Left = 214
            Top = 8
            Width = 15
            Height = 13
            Hint = ''
            Caption = 's/d'
            TabOrder = 3
          end
          object lblSampai: TUniLabel
            Left = 235
            Top = 8
            Width = 86
            Height = 15
            Hint = ''
            Alignment = taCenter
            AutoSize = False
            Caption = '<sampai>'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Roboto'
            Font.Style = [fsBold]
            TabOrder = 4
          end
        end
        object grdHeader: TUniDBGrid
          Left = 0
          Top = 33
          Width = 1030
          Height = 252
          Cursor = crHandPoint
          Hint = ''
          DataSource = DSHeader
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgAutoRefreshRow]
          WebOptions.Paged = False
          LoadMask.Message = 'Loading data...'
          Align = alClient
          TabOrder = 1
          OnCellContextClick = grdHeaderCellContextClick
          Columns = <
            item
              FieldName = 'tanggal'
              Title.Caption = 'Tanggal'
              Title.Font.Name = 'Roboto'
              Width = 74
              Font.Name = 'Roboto'
              ReadOnly = True
            end
            item
              FieldName = 'nomor'
              Title.Caption = 'Nomor Lab.'
              Title.Font.Name = 'Roboto'
              Width = 87
              Font.Name = 'Roboto'
            end
            item
              FieldName = 'noreg'
              Title.Caption = 'No. MR'
              Title.Font.Name = 'Roboto'
              Width = 95
              Font.Name = 'Roboto'
              ReadOnly = True
            end
            item
              FieldName = 'nama'
              Title.Caption = 'Nama'
              Title.Font.Name = 'Roboto'
              Width = 178
              Font.Name = 'Roboto'
              ReadOnly = True
            end
            item
              FieldName = 'tanggal_lahir'
              Title.Caption = 'Tgl. lahir'
              Title.Font.Name = 'Roboto'
              Width = 74
              Font.Name = 'Roboto'
              ReadOnly = True
            end
            item
              FieldName = 'jenis_kelamin'
              Title.Caption = 'Jns. Kelamin'
              Title.Font.Name = 'Roboto'
              Width = 88
              Font.Name = 'Roboto'
              ReadOnly = True
            end
            item
              FieldName = 'tipe_pasien'
              Title.Caption = 'Tipe pasien'
              Title.Font.Name = 'Roboto'
              Width = 105
              Font.Name = 'Roboto'
              ReadOnly = True
            end
            item
              FieldName = 'asal_pasien'
              Title.Caption = 'Asal pasien'
              Title.Font.Name = 'Roboto'
              Width = 89
              Font.Name = 'Roboto'
              ReadOnly = True
            end
            item
              FieldName = 'dokter'
              Title.Caption = 'Perujuk'
              Title.Font.Name = 'Roboto'
              Width = 116
              Font.Name = 'Roboto'
              ReadOnly = True
            end
            item
              FieldName = 'ansuransi_pasien'
              Title.Caption = 'Ansuransi'
              Width = 90
              Font.Name = 'Roboto'
              ReadOnly = True
            end
            item
              FieldName = 'tanggal_dt'
              Title.Caption = 'Tgl/jam order'
              Title.Font.Name = 'Roboto'
              Width = 145
              Font.Name = 'Roboto'
            end>
        end
      end
      object tsConfig: TUniTabSheet
        Hint = ''
        Caption = 'Konfigurasi'
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 289
        ExplicitHeight = 193
        object UniLabel4: TUniLabel
          Left = 8
          Top = 15
          Width = 35
          Height = 13
          Hint = ''
          Caption = 'No. MR'
          TabOrder = 0
        end
        object edNoMR: TUniEdit
          Left = 60
          Top = 10
          Width = 116
          Hint = ''
          Text = ''
          TabOrder = 1
        end
        object UniLabel5: TUniLabel
          Left = 192
          Top = 15
          Width = 27
          Height = 13
          Hint = ''
          Caption = 'Nama'
          TabOrder = 2
        end
        object edName: TUniEdit
          Left = 231
          Top = 10
          Width = 138
          Hint = ''
          Text = ''
          TabOrder = 3
        end
        object UniLabel6: TUniLabel
          Left = 8
          Top = 48
          Width = 39
          Height = 13
          Hint = ''
          Caption = 'Tgl. dari'
          TabOrder = 4
        end
        object dtTgl0: TUniDateTimePicker
          Left = 60
          Top = 44
          Width = 106
          Hint = ''
          DateTime = 44462.000000000000000000
          DateFormat = 'dd/MM/yyyy'
          TimeFormat = 'HH:mm:ss'
          TabOrder = 5
        end
        object UniLabel7: TUniLabel
          Left = 170
          Top = 48
          Width = 15
          Height = 13
          Hint = ''
          Caption = 's/d'
          TabOrder = 6
        end
        object dtTgl1: TUniDateTimePicker
          Left = 192
          Top = 44
          Width = 106
          Hint = ''
          DateTime = 44462.000000000000000000
          DateFormat = 'dd/MM/yyyy'
          TimeFormat = 'HH:mm:ss'
          TabOrder = 7
        end
        object cbTipepasien: TUniDBLookupComboBox
          Left = 88
          Top = 106
          Width = 281
          Height = 23
          Hint = ''
          ListField = 'nama'
          ListSource = DSTipePasien
          KeyField = 'id'
          ListFieldIndex = 0
          TabOrder = 8
          Color = clWindow
        end
        object UniLabel8: TUniLabel
          Left = 8
          Top = 112
          Width = 54
          Height = 13
          Hint = ''
          Caption = 'Tipe pasien'
          TabOrder = 9
        end
        object cbAsalPasien: TUniDBLookupComboBox
          Left = 88
          Top = 135
          Width = 281
          Height = 23
          Hint = ''
          ListField = 'nama'
          ListSource = DSAsalPasien
          KeyField = 'id'
          ListFieldIndex = 0
          TabOrder = 10
          Color = clWindow
        end
        object UniLabel9: TUniLabel
          Left = 8
          Top = 141
          Width = 54
          Height = 13
          Hint = ''
          Caption = 'Asal pasien'
          TabOrder = 11
        end
        object UniLabel10: TUniLabel
          Left = 8
          Top = 170
          Width = 36
          Height = 13
          Hint = ''
          Caption = 'Perujuk'
          TabOrder = 12
        end
        object cbPerujuk: TUniDBLookupComboBox
          Left = 88
          Top = 164
          Width = 281
          Height = 23
          Hint = ''
          ListField = 'nama'
          ListSource = DSPerujuk
          KeyField = 'id'
          ListFieldIndex = 0
          TabOrder = 13
          Color = clWindow
        end
        object UniLabel11: TUniLabel
          Left = 8
          Top = 199
          Width = 47
          Height = 13
          Hint = ''
          Caption = 'Ansuransi'
          TabOrder = 14
        end
        object cbAnsuransi: TUniDBLookupComboBox
          Left = 88
          Top = 193
          Width = 281
          Height = 23
          Hint = ''
          ListField = 'nama'
          ListSource = DSAnsuransi
          KeyField = 'id'
          ListFieldIndex = 0
          TabOrder = 15
          Color = clWindow
        end
        object UniLabel12: TUniLabel
          Left = 8
          Top = 78
          Width = 76
          Height = 13
          Hint = ''
          Caption = 'Nomor Lab. dari'
          TabOrder = 16
        end
        object NoLabDari: TUniEdit
          Left = 103
          Top = 74
          Width = 116
          Hint = ''
          Text = ''
          TabOrder = 17
        end
        object UniLabel13: TUniLabel
          Left = 222
          Top = 78
          Width = 15
          Height = 13
          Hint = ''
          Caption = 's/d'
          TabOrder = 18
        end
        object NoLabSampai: TUniEdit
          Left = 244
          Top = 74
          Width = 116
          Hint = ''
          Text = ''
          TabOrder = 19
        end
      end
    end
  end
  object UniSplitter1: TUniSplitter
    Left = 0
    Top = 313
    Width = 1038
    Height = 8
    Cursor = crVSplit
    Hint = ''
    Align = alTop
    ParentColor = False
    Color = clBtnFace
  end
  object pnlBawah: TUniContainerPanel
    Left = 0
    Top = 321
    Width = 1038
    Height = 374
    Hint = ''
    ParentColor = False
    Align = alClient
    TabOrder = 2
    ExplicitLeft = 280
    ExplicitTop = 327
    ExplicitWidth = 600
    ExplicitHeight = 217
    object pcBawah: TUniPageControl
      Left = 0
      Top = 0
      Width = 1038
      Height = 374
      Hint = ''
      ActivePage = tsRepView
      Align = alClient
      TabOrder = 1
      object tsRepView: TUniTabSheet
        Hint = ''
        Caption = 'Tampilan laporan'
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 1038
        ExplicitHeight = 374
        object UniContainerPanel2: TUniContainerPanel
          Left = 0
          Top = 0
          Width = 1030
          Height = 33
          Hint = ''
          ParentColor = False
          Align = alTop
          TabOrder = 0
          object UniLabel2: TUniLabel
            Left = 16
            Top = 9
            Width = 59
            Height = 13
            Hint = ''
            Caption = 'Tipe laporan'
            TabOrder = 1
          end
          object UniDBLookupComboBox1: TUniDBLookupComboBox
            Left = 92
            Top = 5
            Width = 145
            Height = 23
            Hint = ''
            ListField = 'nama'
            ListSource = dsRep
            KeyField = 'id'
            ListFieldIndex = 0
            TabOrder = 2
            Color = clWindow
          end
          object UniButton1: TUniButton
            Left = 243
            Top = 3
            Width = 75
            Height = 25
            Hint = ''
            Caption = 'Pratinjau'
            TabOrder = 3
            OnClick = UniButton1Click
          end
          object btnPDF: TUniSpeedButton
            Left = 324
            Top = 3
            Width = 121
            Height = 25
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
            TabOrder = 4
            OnClick = btnPDFClick
          end
        end
        object UniURLFrame1: TUniURLFrame
          Left = 0
          Top = 33
          Width = 1030
          Height = 313
          Hint = ''
          Align = alClient
          TabOrder = 1
          ParentColor = False
          Color = clBtnFace
        end
      end
      object tsResult: TUniTabSheet
        Hint = ''
        Caption = 'Hasil test'
        object grdDtl: TUniDBGrid
          Left = 0
          Top = 0
          Width = 1030
          Height = 346
          Hint = ''
          DataSource = DSDtl
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgAutoRefreshRow]
          WebOptions.Paged = False
          LoadMask.Message = 'Loading data...'
          Align = alClient
          TabOrder = 0
          OnMouseDown = grdDtlMouseDown
          OnKeyDown = grdDtlKeyDown
          Columns = <
            item
              FieldName = 'val_medis'
              Title.Caption = 'Val. medis'
              Title.Font.Name = 'Roboto'
              Width = 60
              Font.Name = 'Roboto'
              Alignment = taRightJustify
              ReadOnly = True
              CheckBoxField.BooleanFieldOnly = False
              CheckBoxField.FieldValues = '1;0'
              CheckBoxField.DisplayValues = ';'
            end
            item
              FieldName = 'val_teknis'
              Title.Caption = 'Val. teknis'
              Title.Font.Name = 'roboto'
              Width = 59
              Font.Name = 'Roboto'
              Alignment = taRightJustify
              ReadOnly = True
              CheckBoxField.BooleanFieldOnly = False
              CheckBoxField.FieldValues = '1;0'
              CheckBoxField.DisplayValues = ';'
            end
            item
              FieldName = 'kode'
              Title.Caption = 'kode'
              Title.Font.Name = 'Roboto'
              Width = 102
              Font.Name = 'Roboto'
              ReadOnly = True
            end
            item
              FieldName = 'nama_test'
              Title.Caption = 'Nama test'
              Title.Font.Name = 'Roboto'
              Width = 222
              Font.Name = 'Roboto'
            end
            item
              FieldName = 'hasil'
              Title.Caption = 'Hasil'
              Title.Font.Name = 'Roboto'
              Width = 128
              Font.Name = 'Roboto'
            end
            item
              FieldName = 'satuan'
              Title.Caption = 'Satuan'
              Title.Font.Name = 'Roboto'
              Width = 56
              Font.Name = 'Roboto'
            end
            item
              FieldName = 'nilai_normal'
              Title.Caption = 'Nilai normal'
              Width = 134
              Font.Name = 'Roboto'
              DisplayMemo = True
            end
            item
              FieldName = 'informasi'
              Title.Caption = 'Informasi spesial'
              Title.Font.Name = 'Roboto'
              Width = 388
              Font.Name = 'Roboto'
              DisplayMemo = True
            end>
        end
      end
    end
  end
  object QHeader: TFDQuery
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      
        'SELECT oh.id,date(oh.tanggal) tanggal,oh.nomor,p.noreg,p.nama,p.' +
        'tanggal_lahir,jk.nama jenis_kelamin,tp.nama tipe_pasien,'
      
        'ap.nama asal_pasien, anp.nama ansuransi_pasien,d.nama dokter,oh.' +
        'tanggal tanggal_dt'
      'FROM'
      'order_header oh'
      'LEFT JOIN pasien p ON oh.pasien_id = p.id'
      'LEFT JOIN jenis_kelamin jk ON p.jenis_kelamin_id = jk.id'
      'LEFT JOIN tipe_pasien tp ON oh.tipe_pasien_id = tp.id'
      'LEFT JOIN asal_pasien ap ON oh.asal_pasien_id = ap.id'
      
        'LEFT JOIN ansuransi_pasien anp ON oh.ansuransi_pasien_id = anp.i' +
        'd'
      'LEFT JOIN dokter d ON oh.dokter_id = d.id'
      'where'
      'oh.organisasi_id = :organisasi_id'
      'and oh.lokasi_id = :lokasi_id'
      'order by date(oh.tanggal)')
    Left = 528
    Top = 57
    ParamData = <
      item
        Name = 'ORGANISASI_ID'
        DataType = ftString
        ParamType = ptInput
        Value = '0'
      end
      item
        Name = 'LOKASI_ID'
        DataType = ftString
        ParamType = ptInput
        Value = '0'
      end>
  end
  object DSHeader: TDataSource
    DataSet = QHeader
    Left = 576
    Top = 49
  end
  object QTipePasien: TFDQuery
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id,nama '
      'from tipe_pasien '
      'where organisasi_id = :organisasi_id'
      'order by nama')
    Left = 408
    Top = 88
    ParamData = <
      item
        Name = 'ORGANISASI_ID'
        DataType = ftString
        ParamType = ptInput
        Value = '0'
      end>
  end
  object DSTipePasien: TDataSource
    DataSet = QTipePasien
    Left = 440
    Top = 88
  end
  object QAsalPasien: TFDQuery
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      
        'select id,nama from asal_pasien where organisasi_id = :organisas' +
        'i_id order by nama')
    Left = 520
    Top = 136
    ParamData = <
      item
        Name = 'ORGANISASI_ID'
        DataType = ftString
        ParamType = ptInput
        Value = '0'
      end>
  end
  object DSAsalPasien: TDataSource
    DataSet = QAsalPasien
    Left = 552
    Top = 136
  end
  object QPerujuk: TFDQuery
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      
        'select id,nama from dokter where organisasi_id = :organisasi_id ' +
        'order by nama')
    Left = 432
    Top = 176
    ParamData = <
      item
        Name = 'ORGANISASI_ID'
        DataType = ftString
        ParamType = ptInput
        Value = '0'
      end>
  end
  object DSPerujuk: TDataSource
    DataSet = QPerujuk
    Left = 464
    Top = 176
  end
  object QAnsuransi: TFDQuery
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      
        'select id,nama from ansuransi_pasien where organisasi_id = :orga' +
        'nisasi_id order by nama')
    Left = 448
    Top = 256
    ParamData = <
      item
        Name = 'ORGANISASI_ID'
        DataType = ftString
        ParamType = ptInput
        Value = '0'
      end>
  end
  object DSAnsuransi: TDataSource
    DataSet = QAnsuransi
    Left = 480
    Top = 256
  end
  object DSDtl: TDataSource
    DataSet = QDtl
    Left = 696
    Top = 287
  end
  object QDtl: TFDQuery
    IndexFieldNames = 'header_id'
    MasterSource = DSHeader
    MasterFields = 'id'
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      
        'SELECT od.id,od.header_id,t.kode,od.test_id,od.nama_test,1 statu' +
        's_id, '
      
        'CASE WHEN r.id IS NULL THEN '#39#39' WHEN r.hasil_tipe = 0 THEN r.resu' +
        'lt_num WHEN r.hasil_tipe = 1 THEN r.result_char ELSE '#39#39' END AS h' +
        'asil, '
      'CASE WHEN r.id IS NULL THEN od.satuan ELSE r.satuan END satuan,'
      
        'CASE WHEN r.id IS NULL THEN od.nilai_normal ELSE r.nilai_normal ' +
        'END nilai_normal,'
      
        'CASE WHEN r.id IS NULL THEN od.informasi ELSE r.informasi END in' +
        'formasi,'
      'CASE WHEN r.id IS NULL THEN 0 ELSE r.val_teknis END val_teknis,'
      'CASE WHEN r.id IS NULL THEN 0 ELSE r.val_medis END val_medis,'
      'CASE WHEN r.id IS NULL THEN '#39#39' ELSE r.graph END graph,'
      'r.id order_detail_result_id'
      'FROM '
      'order_detail od'
      'LEFT JOIN test t ON od.test_id = t.id'
      
        'LEFT JOIN order_detail_result r ON od.order_detail_result_id = r' +
        '.id')
    Left = 728
    Top = 287
  end
  object popDtl: TUniPopupMenu
    OnPopup = popDtlPopup
    Left = 336
    Top = 439
    object mnTechVal: TUniMenuItem
      Caption = 'Techical validation'
      OnClick = mnTechValClick
    end
    object pmMedVal: TUniMenuItem
      Caption = 'Medical validation'
      OnClick = pmMedValClick
    end
    object pmRerunTest: TUniMenuItem
      Caption = 'Rerun test'
      OnClick = pmRerunTestClick
    end
  end
  object cmdMedVal: TFDCommand
    Connection = UniMainModule.FDConnection1
    CommandText.Strings = (
      'UPDATE order_detail_result SET val_medis = 1,'
      'val_medis_oleh = :val_medis_oleh ,'
      'val_medis_dt = NOW()'
      'WHERE'
      'id = :id')
    ParamData = <
      item
        Name = 'VAL_MEDIS_OLEH'
        DataType = ftString
        ParamType = ptInput
        Value = '0'
      end
      item
        Name = 'ID'
        DataType = ftString
        ParamType = ptInput
        Value = '0'
      end>
    Left = 424
    Top = 447
  end
  object cmdRerunTest: TFDCommand
    Connection = UniMainModule.FDConnection1
    CommandText.Strings = (
      'update order_detail set order_detail_result_id = null'
      'where'
      'id = :id')
    ParamData = <
      item
        Name = 'ID'
        DataType = ftString
        ParamType = ptInput
        Value = '0'
      end>
    Left = 416
    Top = 511
  end
  object QRep: TFDQuery
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id,nama,kode'
      'from'
      'report_hasil'
      'where'
      'organisasi_id = :organisasi_id'
      'order by sort')
    Left = 100
    Top = 404
    ParamData = <
      item
        Name = 'ORGANISASI_ID'
        DataType = ftString
        ParamType = ptInput
        Value = '1'
      end>
  end
  object dsRep: TDataSource
    DataSet = QRep
    Left = 148
    Top = 404
  end
  object cmdTechVal: TFDCommand
    Connection = UniMainModule.FDConnection1
    CommandText.Strings = (
      'UPDATE order_detail_result SET val_teknis = 1,'
      'val_teknis_oleh = :val_teknis_oleh ,'
      'val_teknis_dt = NOW()'
      'WHERE'
      'id = :id')
    ParamData = <
      item
        Name = 'VAL_TEKNIS_OLEH'
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'ID'
        ParamType = ptInput
      end>
    Left = 416
    Top = 399
  end
  object popHdr: TUniPopupMenu
    Left = 184
    Top = 153
    object Reloadtable1: TUniMenuItem
      Caption = 'Reload table'
      OnClick = Reloadtable1Click
    end
  end
end
