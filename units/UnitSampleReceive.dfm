object uniSampleReceive: TuniSampleReceive
  Left = 0
  Top = 0
  Width = 895
  Height = 703
  OnReady = UniFrameReady
  Font.Height = -13
  Font.Name = 'Roboto'
  TabOrder = 0
  object UniContainerPanel1: TUniContainerPanel
    Left = 0
    Top = 0
    Width = 895
    Height = 65
    Hint = ''
    ParentColor = False
    Align = alTop
    TabOrder = 0
    object edSampleID: TUniEdit
      Left = 176
      Top = 21
      Width = 177
      Hint = ''
      Text = ''
      TabOrder = 1
      OnKeyPress = edSampleIDKeyPress
    end
    object UniLabel1: TUniLabel
      Left = 16
      Top = 24
      Width = 140
      Height = 15
      Hint = ''
      Caption = 'ID Sampel / No. Barcode'
      TabOrder = 2
    end
    object btnCekData: TUniButton
      Left = 359
      Top = 20
      Width = 82
      Height = 25
      Hint = ''
      Caption = 'Check data'
      TabOrder = 3
      Default = True
      OnClick = btnCekDataClick
    end
    object cbAuto: TUniCheckBox
      Left = 447
      Top = 26
      Width = 97
      Height = 17
      Hint = ''
      Caption = 'Auto receive'
      TabOrder = 4
    end
  end
  object UniContainerPanel2: TUniContainerPanel
    Left = 0
    Top = 65
    Width = 895
    Height = 168
    Hint = ''
    ParentColor = False
    Align = alTop
    TabOrder = 1
    object UniGroupBox1: TUniGroupBox
      Left = 16
      Top = 3
      Width = 705
      Height = 150
      Hint = ''
      Caption = 'Informasi Sampel'
      TabOrder = 1
      object UniLabel2: TUniLabel
        Left = 16
        Top = 24
        Width = 59
        Height = 15
        Hint = ''
        Caption = 'ID Sample'
        TabOrder = 1
      end
      object UniDBEdit1: TUniDBEdit
        Left = 113
        Top = 21
        Width = 138
        Height = 22
        Hint = ''
        DataField = 'sid'
        DataSource = dsSample
        TabOrder = 2
        Color = clInfoBk
        ReadOnly = True
      end
      object UniLabel3: TUniLabel
        Left = 18
        Top = 49
        Width = 89
        Height = 15
        Hint = ''
        Caption = 'No Pendaftaran'
        TabOrder = 3
      end
      object UniDBEdit2: TUniDBEdit
        Left = 113
        Top = 49
        Width = 138
        Height = 22
        Hint = ''
        DataField = 'no_pendaftaran'
        DataSource = dsSample
        TabOrder = 4
        Color = clInfoBk
        ReadOnly = True
      end
      object UniLabel4: TUniLabel
        Left = 16
        Top = 77
        Width = 57
        Height = 15
        Hint = ''
        Caption = 'Spesimen'
        TabOrder = 5
      end
      object UniDBEdit3: TUniDBEdit
        Left = 113
        Top = 77
        Width = 138
        Height = 22
        Hint = ''
        DataField = 'tube'
        DataSource = dsSample
        TabOrder = 6
        Color = clInfoBk
        ReadOnly = True
      end
      object UniLabel5: TUniLabel
        Left = 16
        Top = 105
        Width = 82
        Height = 15
        Hint = ''
        Caption = 'Spesimen Info'
        TabOrder = 7
      end
      object UniDBEdit4: TUniDBEdit
        Left = 113
        Top = 105
        Width = 224
        Height = 22
        Hint = ''
        DataField = 'sid_desc'
        DataSource = dsSample
        TabOrder = 8
        Color = clInfoBk
        ReadOnly = True
      end
      object UniLabel6: TUniLabel
        Left = 288
        Top = 24
        Width = 76
        Height = 15
        Hint = ''
        Caption = 'Nama Pasien'
        TabOrder = 9
      end
      object UniDBEdit5: TUniDBEdit
        Left = 385
        Top = 21
        Width = 304
        Height = 22
        Hint = ''
        DataField = 'nama'
        DataSource = dsSample
        TabOrder = 10
        Color = clInfoBk
        ReadOnly = True
      end
      object UniLabel7: TUniLabel
        Left = 288
        Top = 52
        Width = 84
        Height = 15
        Hint = ''
        Caption = 'Waktu layanan'
        TabOrder = 11
      end
      object UniDBEdit6: TUniDBEdit
        Left = 385
        Top = 49
        Width = 304
        Height = 22
        Hint = ''
        DataField = 'tanggal_terima'
        DataSource = dsSample
        TabOrder = 12
        Color = clInfoBk
        ReadOnly = True
      end
      object btnReceive: TUniButton
        Left = 614
        Top = 112
        Width = 75
        Height = 25
        Hint = ''
        Enabled = False
        Caption = 'Receive'
        TabOrder = 13
        OnClick = btnReceiveClick
      end
    end
  end
  object UniContainerPanel3: TUniContainerPanel
    Left = 0
    Top = 233
    Width = 895
    Height = 470
    Hint = ''
    ParentColor = False
    Align = alClient
    TabOrder = 2
    ExplicitTop = 239
    object UniDBGrid1: TUniDBGrid
      Left = 0
      Top = 0
      Width = 895
      Height = 470
      Hint = ''
      DataSource = dsReceiveLast
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgAutoRefreshRow]
      ReadOnly = True
      WebOptions.Paged = False
      WebOptions.FetchAll = True
      LoadMask.Message = 'Loading data...'
      EnableColumnHide = False
      Align = alClient
      TabOrder = 1
      Columns = <
        item
          FieldName = 'sample_id'
          Title.Caption = 'Sample ID'
          Width = 152
          Font.Name = 'Roboto'
        end
        item
          FieldName = 'tube'
          Title.Caption = 'Tube'
          Width = 153
          Font.Name = 'Roboto'
        end
        item
          FieldName = 'nama'
          Title.Caption = 'Nama'
          Width = 249
          Font.Name = 'Roboto'
          ReadOnly = True
        end
        item
          FieldName = 'receive_dt'
          Title.Caption = 'Received at'
          Width = 183
          Font.Name = 'Roboto'
        end
        item
          FieldName = 'user'
          Title.Caption = 'Received by'
          Width = 354
          Font.Name = 'Roboto'
          ReadOnly = True
        end>
    end
  end
  object QSample: TFDQuery
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      
        'select distinct concat(d.no_pendaftaran, tb.kode) sid,d.no_penda' +
        'ftaran, tb.kode, CONCAT(d.no_pendaftaran,'#39'-'#39', tb.kode,'#39' '#39',tb.nam' +
        'a) sid_desc, h.nama,'
      
        'concat(DATE_FORMAT(left(h.tanggal_terima,10), '#39'%d/%m/%Y'#39'),'#39' - '#39',' +
        'h.rujukan) tanggal_terima, '
      
        'CONCAT(DATE_FORMAT(h.tanggal_lahir, '#39'%d/%m/%Y'#39'),'#39' - '#39', TIMESTAMP' +
        'DIFF(YEAR, h.tanggal_lahir, NOW()), '#39'th '#39', TIMESTAMPDIFF(MONTH, ' +
        'h.tanggal_lahir, NOW()) % 12, '#39'bln '#39') usia,'
      'tb.nama tube'
      'FROM'
      'worklist_tindakan d'
      'LEFT JOIN test t ON t.kode = d.kd_tindakan'
      'LEFT JOIN tubes tb ON t.tube_id = tb.id'
      
        'LEFT JOIN worklist_header h ON d.no_pendaftaran = h.no_pendaftar' +
        'an'
      'WHERE'
      'concat(d.no_pendaftaran, tb.kode) = :no_sid')
    Left = 752
    Top = 8
    ParamData = <
      item
        Name = 'NO_SID'
        DataType = ftString
        ParamType = ptInput
        Value = '012204050194S'
      end>
  end
  object dsSample: TDataSource
    DataSet = QSample
    Left = 784
    Top = 8
  end
  object cmdRcv: TFDCommand
    Connection = UniMainModule.FDConnection1
    CommandText.Strings = (
      'delete from sample_receive where sample_id = :sample_id ;'
      
        'insert into sample_receive (sample_id,no_pendaftaran,tube,user_i' +
        'd) values (:sample_id,:no_pendaftaran,:tube,:user_id) ;')
    ParamData = <
      item
        Name = 'SAMPLE_ID'
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'NO_PENDAFTARAN'
        ParamType = ptInput
      end
      item
        Name = 'TUBE'
        ParamType = ptInput
      end
      item
        Name = 'USER_ID'
        ParamType = ptInput
      end>
    Left = 736
    Top = 177
  end
  object QReceiveLast: TFDQuery
    Active = True
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      
        'SELECT sr.sample_id,sr.tube, sr.no_pendaftaran,h.norm,h.nama,h.r' +
        'uangan,sr.receive_dt,u.nama user'
      'FROM'
      'sample_receive sr'
      
        'LEFT JOIN worklist_header h ON sr.no_pendaftaran = h.no_pendafta' +
        'ran'
      'left join aguser u on sr.user_id = u.id'
      'ORDER BY receive_dt DESC'
      'LIMIT 100')
    Left = 576
    Top = 321
  end
  object dsReceiveLast: TDataSource
    DataSet = QReceiveLast
    Left = 656
    Top = 321
  end
end
