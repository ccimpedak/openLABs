object UniKDayList: TUniKDayList
  Left = 0
  Top = 0
  Width = 1194
  Height = 634
  OnBeforeReady = UniFrameBeforeReady
  Font.Height = -13
  Font.Name = 'Roboto'
  TabOrder = 0
  ParentFont = False
  object pnlMenuHeader: TUniContainerPanel
    Left = 0
    Top = 0
    Width = 1194
    Height = 25
    Hint = ''
    ParentColor = False
    Align = alTop
    TabOrder = 0
  end
  object pnlHeader: TUniContainerPanel
    Left = 0
    Top = 25
    Width = 1194
    Height = 200
    Hint = ''
    ParentColor = False
    Align = alTop
    TabOrder = 1
    object grdHeader: TUniDBGrid
      Left = 0
      Top = 0
      Width = 1194
      Height = 200
      Cursor = crHandPoint
      Hint = ''
      DataSource = DSHeader
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgAutoRefreshRow]
      WebOptions.Paged = False
      LoadMask.Message = 'Loading data...'
      Align = alClient
      TabOrder = 1
      OnMouseDown = grdHeaderMouseDown
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
  object pnlDetail: TUniContainerPanel
    Left = 0
    Top = 231
    Width = 1194
    Height = 403
    Hint = ''
    ParentColor = False
    Align = alClient
    TabOrder = 2
    object grdDtl: TUniDBGrid
      Left = 0
      Top = 0
      Width = 1194
      Height = 403
      Hint = ''
      TitleFont.Name = 'Roboto'
      DataSource = DSDtl
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgAutoRefreshRow]
      WebOptions.Paged = False
      LoadMask.Message = 'Loading data...'
      Align = alClient
      TabOrder = 1
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
          Title.Font.Name = 'Roboto'
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
          Title.Font.Name = 'Roboto'
          Width = 134
          Font.Name = 'Roboto'
          DisplayMemo = True
        end
        item
          FieldName = 'informasi'
          Title.Caption = 'Informasi spesial'
          Title.Font.Name = 'Roboto'
          Width = 154
          Font.Name = 'Roboto'
          DisplayMemo = True
        end
        item
          FieldName = 'graph'
          Title.Caption = 'Graph'
          Title.Font.Name = 'Roboto'
          Width = 65
          Font.Name = 'Roboto'
        end>
    end
  end
  object UniSplitter1: TUniSplitter
    Left = 0
    Top = 225
    Width = 1194
    Height = 6
    Cursor = crVSplit
    Hint = ''
    Align = alTop
    ParentColor = False
    Color = clBtnFace
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
      'and oh.lokasi_id = :lokasi_id')
    Left = 40
    Top = 105
    ParamData = <
      item
        Name = 'ORGANISASI_ID'
        DataType = ftString
        ParamType = ptInput
        Value = '1'
      end
      item
        Name = 'LOKASI_ID'
        DataType = ftString
        ParamType = ptInput
        Value = '1'
      end>
  end
  object DSHeader: TDataSource
    DataSet = QHeader
    Left = 88
    Top = 105
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
    Left = 64
    Top = 271
  end
  object DSDtl: TDataSource
    DataSet = QDtl
    Left = 32
    Top = 271
  end
  object popHdr: TUniPopupMenu
    Left = 448
    Top = 137
    object kriteriapencarian1: TUniMenuItem
      Caption = 'Kriteria pencarian'
      OnClick = kriteriapencarian1Click
    end
    object Reloadtable1: TUniMenuItem
      Caption = 'Reload table'
      OnClick = Reloadtable1Click
    end
  end
  object popDtl: TUniPopupMenu
    OnPopup = popDtlPopup
    Left = 664
    Top = 407
    object pmTechVal: TUniMenuItem
      Caption = 'Technical validation'
      OnClick = pmTechValClick
    end
    object pmRerunTest: TUniMenuItem
      Caption = 'Rerun test'
      OnClick = pmRerunTestClick
    end
    object Reloadtable2: TUniMenuItem
      Caption = 'Reload table'
      OnClick = Reloadtable2Click
    end
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
    Left = 720
    Top = 407
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
        ParamType = ptInput
        Value = Null
      end>
    Left = 720
    Top = 463
  end
end
