object UniVHasilByMR: TUniVHasilByMR
  Left = 0
  Top = 0
  Width = 860
  Height = 654
  Font.Height = -13
  Font.Name = 'Roboto'
  TabOrder = 0
  ParentFont = False
  object UniContainerPanel1: TUniContainerPanel
    Left = 0
    Top = 0
    Width = 860
    Height = 283
    Hint = ''
    ParentColor = False
    Align = alTop
    TabOrder = 0
    object UniDBGrid1: TUniDBGrid
      Left = 0
      Top = 0
      Width = 860
      Height = 253
      Hint = ''
      DataSource = DSPasien
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgFilterClearButton, dgAutoRefreshRow]
      ReadOnly = True
      LoadMask.ShowMessage = False
      LoadMask.Message = 'Loading data...'
      LoadMask.Opacity = 0.400000005960464400
      TrackOver = False
      Align = alClient
      TabOrder = 1
      TabStop = False
      OnClearFilters = UniDBGrid1ClearFilters
      OnColumnFilter = UniDBGrid1ColumnFilter
      Columns = <
        item
          FieldName = 'noreg'
          Filtering.Enabled = True
          Filtering.Editor = edNoreg
          Title.Caption = 'No. MR'
          Width = 103
          Font.Name = 'Roboto'
        end
        item
          FieldName = 'nama'
          Filtering.Enabled = True
          Filtering.Editor = edNama
          Title.Caption = 'Nama'
          Width = 243
          Font.Name = 'Roboto'
        end
        item
          FieldName = 'jenis_kelamin'
          Title.Caption = 'Jenis Kelamin'
          Width = 76
          Font.Name = 'Roboto'
        end
        item
          FieldName = 'tanggal_lahir'
          Title.Caption = 'Tgl. Lahir'
          Width = 79
          Font.Name = 'Roboto'
        end
        item
          FieldName = 'usia'
          Title.Caption = 'Usia'
          Width = 50
          Font.Name = 'Roboto'
        end
        item
          FieldName = 'alamat'
          Filtering.Enabled = True
          Filtering.Editor = edAlamat
          Title.Caption = 'Alamat'
          Width = 458
          Font.Name = 'Roboto'
        end
        item
          FieldName = 'hp'
          Filtering.Enabled = True
          Filtering.Editor = edHp
          Title.Caption = 'Handphone'
          Width = 154
          Font.Name = 'Roboto'
        end>
    end
    object UniHiddenPanel1: TUniHiddenPanel
      Left = 600
      Top = 32
      Width = 209
      Height = 321
      Hint = ''
      Visible = True
      DesignSize = (
        209
        321)
      object edNoreg: TUniEdit
        Left = 16
        Top = 24
        Width = 121
        Hint = ''
        CharEOL = #13
        Text = 'edNoreg'
        Anchors = []
        TabOrder = 0
        EmptyText = 'No. MR ...'
        ClearButton = True
      end
      object edNama: TUniEdit
        Left = 16
        Top = 52
        Width = 121
        Hint = ''
        CharEOL = #13
        Text = 'edNama'
        Anchors = []
        TabOrder = 1
        EmptyText = 'Nama...'
        ClearButton = True
      end
      object edAlamat: TUniEdit
        Left = 16
        Top = 80
        Width = 121
        Hint = ''
        CharEOL = #13
        Text = 'edAlamat'
        Anchors = []
        TabOrder = 2
        EmptyText = 'Alamat...'
        ClearButton = True
      end
      object edHp: TUniEdit
        Left = 16
        Top = 108
        Width = 121
        Hint = ''
        CharEOL = #13
        Text = 'edHp'
        Anchors = []
        TabOrder = 3
        EmptyText = 'Handphone...'
        ClearButton = True
      end
      object UniEdit5: TUniEdit
        Left = 16
        Top = 136
        Width = 121
        Hint = ''
        CharEOL = #13
        Text = 'UniEdit5'
        Anchors = []
        TabOrder = 4
        EmptyText = 'City...'
        ClearButton = True
      end
      object UniEdit6: TUniEdit
        Left = 16
        Top = 164
        Width = 121
        Hint = ''
        CharEOL = #13
        Text = 'UniEdit6'
        Anchors = []
        TabOrder = 5
        EmptyText = 'Postal Code...'
        ClearButton = True
      end
      object UniEdit7: TUniEdit
        Left = 16
        Top = 220
        Width = 121
        Hint = ''
        CharEOL = #13
        Text = 'UniEdit7'
        Anchors = []
        TabOrder = 7
        EmptyText = 'Phone...'
        ClearButton = True
      end
      object UniDBLookupComboBox1: TUniDBLookupComboBox
        Left = 16
        Top = 192
        Width = 145
        Hint = ''
        ListField = 'Country'
        KeyField = 'Country'
        ListFieldIndex = 0
        Anchors = []
        EmptyText = 'Country...'
        TabOrder = 6
        Color = clWindow
      end
    end
    object UniContainerPanel5: TUniContainerPanel
      Left = 0
      Top = 253
      Width = 860
      Height = 30
      Hint = ''
      ParentColor = False
      Align = alBottom
      TabOrder = 3
      object btnHistori: TUniButton
        Left = 769
        Top = 0
        Width = 91
        Height = 30
        Hint = ''
        Enabled = False
        Caption = 'Histori'
        Align = alRight
        TabOrder = 1
        OnClick = btnHistoriClick
      end
    end
  end
  object UniSplitter1: TUniSplitter
    Left = 0
    Top = 283
    Width = 860
    Height = 6
    Cursor = crVSplit
    Hint = ''
    Align = alTop
    ParentColor = False
    Color = clBtnFace
  end
  object UniContainerPanel2: TUniContainerPanel
    Left = 0
    Top = 289
    Width = 860
    Height = 365
    Hint = ''
    ParentColor = False
    Align = alClient
    TabOrder = 2
    object UniContainerPanel3: TUniContainerPanel
      Left = 0
      Top = 0
      Width = 860
      Height = 335
      Hint = ''
      ParentColor = False
      Align = alClient
      TabOrder = 1
      object UniDBGrid2: TUniDBGrid
        Left = 0
        Top = 0
        Width = 860
        Height = 335
        Hint = ''
        DataSource = DSOrder
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgAutoRefreshRow]
        LoadMask.Message = 'Loading data...'
        Align = alClient
        TabOrder = 1
        Columns = <
          item
            FieldName = 'nomor'
            Title.Caption = 'Nomor'
            Width = 93
            Font.Name = 'Roboto'
          end
          item
            FieldName = 'tanggal'
            Title.Caption = 'Tanggal'
            Width = 154
            Font.Name = 'Roboto'
          end
          item
            FieldName = 'asal_pasien'
            Title.Caption = 'Asal Pasien'
            Width = 246
            Font.Name = 'Roboto'
          end
          item
            FieldName = 'dokter'
            Title.Caption = 'dokter'
            Width = 343
            Font.Name = 'Roboto'
          end>
      end
    end
    object UniContainerPanel4: TUniContainerPanel
      Left = 0
      Top = 335
      Width = 860
      Height = 30
      Hint = ''
      ParentColor = False
      Align = alBottom
      TabOrder = 2
      object btnHasil: TUniButton
        Left = 769
        Top = 0
        Width = 91
        Height = 30
        Hint = ''
        Caption = 'Hasil'
        Align = alRight
        TabOrder = 1
        OnClick = btnHasilClick
      end
    end
  end
  object QPasien: TFDQuery
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select distinct pasien.id,pasien.noreg,pasien.nama,'
      'jenis_kelamin.nama jenis_kelamin,'
      'pasien.tanggal_lahir, '
      
        'YEAR(CURRENT_TIMESTAMP) - YEAR(tanggal_lahir) - (RIGHT(CURRENT_T' +
        'IMESTAMP, 5) < RIGHT(tanggal_lahir, 5)) as usia,'
      'pasien.alamat,pasien.hp '
      'from '
      'pasien'
      
        'left join jenis_kelamin on pasien.jenis_kelamin_id = jenis_kelam' +
        'in.id'
      'where'
      'pasien.noreg like :noreg'
      'and pasien.nama like :nama'
      'and pasien.alamat like :alamat'
      'and hp like :hp'
      'order by pasien.noreg'
      'limit 100')
    Left = 80
    Top = 112
    ParamData = <
      item
        Name = 'NOREG'
        DataType = ftString
        ParamType = ptInput
        Value = '%'
      end
      item
        Name = 'NAMA'
        DataType = ftString
        ParamType = ptInput
        Value = '%'
      end
      item
        Name = 'ALAMAT'
        DataType = ftString
        ParamType = ptInput
        Value = '%'
      end
      item
        Name = 'HP'
        DataType = ftString
        ParamType = ptInput
        Value = '%'
      end>
  end
  object DSPasien: TDataSource
    DataSet = QPasien
    Left = 136
    Top = 112
  end
  object QOrder: TFDQuery
    IndexFieldNames = 'pasien_id'
    MasterSource = DSPasien
    MasterFields = 'id'
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      
        'select order_header.pasien_id,order_header.id,order_header.nomor' +
        ',order_header.tanggal,asal_pasien.nama asal_pasien,'
      'dokter.nama dokter'
      'from'
      'order_header'
      
        'left join asal_pasien on order_header.asal_pasien_id = asal_pasi' +
        'en.id '
      'left join dokter on order_header.dokter_id = dokter.id'
      'order by tanggal desc')
    Left = 64
    Top = 353
  end
  object DSOrder: TDataSource
    DataSet = QOrder
    Left = 112
    Top = 353
  end
end
