object frmKuitansi: TfrmKuitansi
  Left = 0
  Top = 0
  ClientHeight = 326
  ClientWidth = 756
  Caption = 'Kuintansi'
  BorderStyle = bsDialog
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  Font.Height = -16
  PixelsPerInch = 96
  TextHeight = 19
  object UniContainerPanel1: TUniContainerPanel
    Left = 0
    Top = 0
    Width = 756
    Height = 216
    Hint = ''
    ParentColor = False
    Align = alClient
    TabOrder = 0
    object UniDBGrid1: TUniDBGrid
      Left = 0
      Top = 0
      Width = 756
      Height = 216
      Hint = ''
      DataSource = DataSource1
      Options = [dgEditing, dgTitles, dgColumnResize, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgAutoRefreshRow]
      LoadMask.Message = 'Loading data...'
      Align = alClient
      TabOrder = 1
      Columns = <
        item
          FieldName = 'tgl_bayar'
          Title.Caption = 'Tgl Bayar'
          Width = 100
        end
        item
          FieldName = 'tgl_periksa'
          Title.Caption = 'Tgl Periksa'
          Width = 99
        end
        item
          FieldName = 'nomor'
          Title.Caption = 'Nomor'
          Width = 108
        end
        item
          FieldName = 'kuitansi'
          Title.Caption = 'Kuintansi'
          Width = 105
        end
        item
          FieldName = 'nama'
          Title.Caption = 'Nama'
          Width = 213
        end
        item
          FieldName = 'jumlah'
          Title.Caption = 'Jumlah'
          Width = 98
        end>
    end
  end
  object UniContainerPanel2: TUniContainerPanel
    Left = 0
    Top = 216
    Width = 756
    Height = 110
    Hint = ''
    ParentColor = False
    Align = alBottom
    TabOrder = 1
    object UniButton1: TUniButton
      Left = 16
      Top = 70
      Width = 75
      Height = 37
      Hint = ''
      Caption = 'Print'
      ParentFont = False
      Font.Height = -16
      TabOrder = 1
      OnClick = UniButton1Click
    end
    object UniLabel1: TUniLabel
      Left = 16
      Top = 6
      Width = 41
      Height = 19
      Hint = ''
      Caption = 'Nama'
      ParentFont = False
      Font.Height = -16
      TabOrder = 2
    end
    object edNama: TUniEdit
      Left = 88
      Top = 6
      Width = 305
      Height = 27
      Hint = ''
      Text = ''
      ParentFont = False
      Font.Height = -16
      TabOrder = 3
    end
    object UniCheckBox1: TUniCheckBox
      Left = 16
      Top = 39
      Width = 153
      Height = 17
      Hint = ''
      Checked = True
      Caption = 'Copy kuitansi'
      ParentFont = False
      Font.Height = -16
      TabOrder = 4
    end
    object UniButton2: TUniButton
      Left = 97
      Top = 70
      Width = 75
      Height = 37
      Hint = ''
      Caption = 'Batal'
      ParentFont = False
      Font.Height = -16
      TabOrder = 5
      OnClick = UniButton2Click
    end
  end
  object qKuintansiRows: TFDQuery
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      
        'select pb.id id,date_format(pb.tanggal,'#39'%d-%m-%Y'#39') as tgl_bayar,' +
        ' date_format(h.tanggal,'#39'%d-%m-%Y'#39') as tgl_periksa, h.nomor,'
      
        'jumlah as jumlah, concat( pf.nama, '#39' '#39' , p.nama ) as nama,pb.nom' +
        'or kuitansi,pb.tagihan'
      'From order_header h'
      'join pembayaran pb on h.id = pb.order_header_id'
      'join pasien p on h.pasien_id = p.id'
      'join prefix pf on p.prefix_id = pf.id'
      'Where h.id = :header_id and pb.jumlah > 0 order by tgl_bayar')
    Left = 472
    Top = 232
    ParamData = <
      item
        Name = 'HEADER_ID'
        DataType = ftString
        ParamType = ptInput
        Value = '0'
      end>
  end
  object DataSource1: TDataSource
    DataSet = qKuintansiRows
    Left = 520
    Top = 232
  end
  object qKuintansi: TFDQuery
    Active = True
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      
        'select pb.nomor no_kuitansi,oh.nomor,p.noreg, p.nama, pb.jumlah,' +
        'tb.nama tipe_bayar, u.user_name user, pb.tanggal, tp.nama tipe_p' +
        'asien, d.nama dokter,p.alamat,p.telepon,'
      'pb.tagihan,p.hp'
      'from'
      'order_header oh,'
      'pembayaran pb,'
      'pasien p,'
      'tipe_pembayaran tb,'
      'aguser u,'
      'tipe_pasien tp,'
      'dokter d'
      'where'
      'oh.id = pb.order_header_id'
      'and oh.pasien_id = p.id'
      'and pb.tipe_bayar_id = tb.id'
      'and pb.user_id = u.id'
      'and oh.tipe_pasien_id = tp.id'
      'and oh.dokter_id = d.id'
      'and pb.id = :id')
    Left = 592
    Top = 226
    ParamData = <
      item
        Name = 'ID'
        DataType = ftString
        ParamType = ptInput
        Value = '37'
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
    object qKuintansihp: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'hp'
      Origin = 'hp'
    end
  end
end
