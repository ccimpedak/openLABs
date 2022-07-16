object frmNotifAdd: TfrmNotifAdd
  Left = 0
  Top = 0
  ClientHeight = 205
  ClientWidth = 332
  Caption = 'Tambah Notifikasi'
  BorderStyle = bsDialog
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  Font.Height = -13
  Font.Name = 'Roboto'
  PixelsPerInch = 96
  TextHeight = 15
  object UniLabel1: TUniLabel
    Left = 47
    Top = 13
    Width = 41
    Height = 15
    Hint = ''
    Caption = 'No. MR'
    TabOrder = 0
  end
  object UniDBEdit1: TUniDBEdit
    Left = 94
    Top = 8
    Width = 107
    Height = 22
    Hint = ''
    DataField = 'noreg'
    DataSource = dsPasien
    TabOrder = 1
    ReadOnly = True
  end
  object UniLabel2: TUniLabel
    Left = 54
    Top = 39
    Width = 34
    Height = 15
    Hint = ''
    Caption = 'Nama'
    TabOrder = 2
  end
  object UniDBEdit2: TUniDBEdit
    Left = 94
    Top = 36
    Width = 219
    Height = 22
    Hint = ''
    DataField = 'nama'
    DataSource = dsPasien
    TabOrder = 3
    ReadOnly = True
  end
  object UniLabel3: TUniLabel
    Left = 8
    Top = 69
    Width = 80
    Height = 15
    Hint = ''
    Caption = 'Jenis Kelamin'
    TabOrder = 4
  end
  object UniDBEdit3: TUniDBEdit
    Left = 94
    Top = 64
    Width = 107
    Height = 22
    Hint = ''
    DataField = 'jenis_kelamin'
    DataSource = dsPasien
    TabOrder = 5
    ReadOnly = True
  end
  object UniLabel4: TUniLabel
    Left = 63
    Top = 94
    Width = 25
    Height = 15
    Hint = ''
    Caption = 'Usia'
    TabOrder = 6
  end
  object UniDBEdit4: TUniDBEdit
    Left = 94
    Top = 92
    Width = 35
    Height = 22
    Hint = ''
    DataField = 'usia'
    DataSource = dsPasien
    Alignment = taCenter
    TabOrder = 7
    ReadOnly = True
  end
  object UniCheckBox1: TUniCheckBox
    Left = 16
    Top = 120
    Width = 161
    Height = 17
    Hint = ''
    Enabled = False
    Checked = True
    Caption = 'Notifikasi Aplikasi'
    TabOrder = 8
    ReadOnly = True
  end
  object cbEmail: TUniCheckBox
    Left = 16
    Top = 146
    Width = 81
    Height = 17
    Hint = ''
    Enabled = False
    Caption = 'email ke :'
    TabOrder = 9
    OnChange = cbEmailChange
  end
  object edEmail: TUniEdit
    Left = 94
    Top = 143
    Width = 219
    Hint = ''
    Enabled = False
    Text = ''
    TabOrder = 10
  end
  object UniButton1: TUniButton
    Left = 249
    Top = 171
    Width = 75
    Height = 25
    Hint = ''
    Caption = 'Tambah'
    TabOrder = 11
    OnClick = UniButton1Click
  end
  object UniLabel5: TUniLabel
    Left = 133
    Top = 94
    Width = 32
    Height = 15
    Hint = ''
    Caption = 'tahun'
    TabOrder = 12
  end
  object QPasienAdd: TFDQuery
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
      'pasien.noreg = :noreg'
      'limit 1')
    Left = 216
    Top = 96
    ParamData = <
      item
        Name = 'NOREG'
        DataType = ftString
        ParamType = ptInput
        Value = '1'
      end>
  end
  object dsPasien: TDataSource
    DataSet = QPasienAdd
    Left = 264
    Top = 96
  end
  object cmdAdd: TFDCommand
    Connection = UniMainModule.FDConnection1
    Left = 256
    Top = 56
  end
  object QLastResId: TFDQuery
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'SELECT MAX(validate_on) last_val'
      'FROM result_detail'
      'WHERE '
      'id IN '
      '('
      'SELECT nomor'
      'FROM order_header'
      'WHERE pasien_id IN ('
      'SELECT id'
      'FROM pasien'
      'WHERE noreg = :noreg))')
    Left = 208
    Top = 56
    ParamData = <
      item
        Name = 'NOREG'
        ParamType = ptInput
        Value = Null
      end>
  end
end
