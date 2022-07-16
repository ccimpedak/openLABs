object DatModule: TDatModule
  OldCreateOrder = False
  Height = 468
  Width = 666
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
    Left = 24
    Top = 16
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
  object QOrder: TFDQuery
    IndexFieldNames = 'pasien_id'
    MasterFields = 'id'
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      
        'select order_header.pasien_id,order_header.id,order_header.nomor' +
        ','
      'DATE_FORMAT(order_header.tanggal, '#39'%Y-%m-%d %H:%m:%s'#39') tanggal,'
      'asal_pasien.nama asal_pasien,'
      'dokter.nama dokter'
      'from'
      'order_header'
      
        'left join asal_pasien on order_header.asal_pasien_id = asal_pasi' +
        'en.id '
      'left join dokter on order_header.dokter_id = dokter.id'
      
        'order by DATE_FORMAT(order_header.tanggal, '#39'%Y-%m-%d %H:%m:%s'#39') ' +
        ' desc')
    Left = 24
    Top = 73
  end
  object QOrderTests: TFDQuery
    IndexFieldNames = 'no_pendaftaran'
    MasterFields = 'nomor'
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'SELECT * FROM'
      'worklist_tindakan'
      'order by kd_tindakan')
    Left = 16
    Top = 130
  end
end
