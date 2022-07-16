object frmDokterBaru: TfrmDokterBaru
  Left = 0
  Top = 0
  ClientHeight = 383
  ClientWidth = 385
  Caption = 'Dokter Baru'
  BorderStyle = bsDialog
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  Font.Height = -16
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 19
  object edNama: TUniEdit
    Left = 96
    Top = 8
    Width = 265
    Hint = ''
    Text = ''
    TabOrder = 0
  end
  object edTglLahir: TUniEdit
    Left = 96
    Top = 64
    Width = 201
    Hint = ''
    Text = ''
    TabOrder = 2
    OnChange = edTglLahirChange
    OnEnter = edTglLahirEnter
  end
  object cbKelamin: TUniDBLookupComboBox
    Left = 96
    Top = 92
    Width = 201
    Height = 27
    Hint = ''
    ListField = 'nama'
    ListSource = DSKelamin
    KeyField = 'id'
    ListFieldIndex = 0
    TabOrder = 3
    Color = clWindow
  end
  object memoAlamat: TUniMemo
    Left = 96
    Top = 125
    Width = 265
    Height = 84
    Hint = ''
    TabOrder = 4
  end
  object UniLabel1: TUniLabel
    Left = 8
    Top = 10
    Width = 41
    Height = 19
    Hint = ''
    Caption = 'Nama'
    TabOrder = 9
  end
  object UniLabel2: TUniLabel
    Left = 8
    Top = 37
    Width = 40
    Height = 19
    Hint = ''
    Caption = 'Umur'
    TabOrder = 11
  end
  object UniLabel3: TUniLabel
    Left = 8
    Top = 66
    Width = 59
    Height = 19
    Hint = ''
    Caption = 'Tgl lahir'
    TabOrder = 12
  end
  object UniLabel4: TUniLabel
    Left = 8
    Top = 93
    Width = 56
    Height = 19
    Hint = ''
    Caption = 'Kelamin'
    TabOrder = 13
  end
  object UniLabel5: TUniLabel
    Left = 8
    Top = 125
    Width = 50
    Height = 19
    Hint = ''
    Caption = 'Alamat'
    TabOrder = 14
  end
  object edTlp: TUniEdit
    Left = 96
    Top = 215
    Width = 201
    Hint = ''
    Text = ''
    TabOrder = 5
  end
  object UniLabel6: TUniLabel
    Left = 8
    Top = 217
    Width = 57
    Height = 19
    Hint = ''
    Caption = 'Telepon'
    TabOrder = 15
  end
  object UniLabel7: TUniLabel
    Left = 8
    Top = 244
    Width = 20
    Height = 19
    Hint = ''
    Caption = 'Hp'
    TabOrder = 16
  end
  object edHp: TUniEdit
    Left = 96
    Top = 243
    Width = 201
    Hint = ''
    Text = ''
    TabOrder = 6
  end
  object edFax: TUniEdit
    Left = 96
    Top = 271
    Width = 201
    Hint = ''
    Text = ''
    TabOrder = 7
  end
  object UniLabel8: TUniLabel
    Left = 8
    Top = 273
    Width = 24
    Height = 19
    Hint = ''
    Caption = 'Fax'
    TabOrder = 17
  end
  object UniButton1: TUniButton
    Left = 279
    Top = 328
    Width = 97
    Height = 41
    Hint = ''
    Caption = 'Cancel'
    TabOrder = 10
    OnClick = UniButton1Click
  end
  object UniBitBtn1: TUniBitBtn
    Left = 168
    Top = 328
    Width = 97
    Height = 41
    Hint = ''
    Caption = 'Save'
    TabOrder = 8
    OnClick = UniBitBtn1Click
  end
  object edUmur: TUniSpinEdit
    Left = 96
    Top = 33
    Width = 89
    Height = 29
    Hint = ''
    TabOrder = 1
    OnChange = edUmurChange
  end
  object QKelamin: TFDQuery
    Active = True
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id,nama'
      'from'
      'jenis_kelamin')
    Left = 304
    Top = 72
  end
  object DSKelamin: TDataSource
    DataSet = QKelamin
    Left = 336
    Top = 72
  end
  object cmdInsert: TFDCommand
    Connection = UniMainModule.FDConnection1
    CommandText.Strings = (
      
        'INSERT INTO dokter (nama,umur,tanggal_lahir,jenis_kelamin_id,ala' +
        'mat,telepon,handphone,fax,agama_id,tanggal_pasien_pertama,total_' +
        'pasien,total_amount,organisasi_id) '
      
        'VALUE(:nama,:umur,:tanggal_lahir,:jenis_kelamin_id,:alamat,:tele' +
        'pon,:handphone,:fax,0,NOW(),0,0,:organisasi_id)')
    ParamData = <
      item
        Name = 'NAMA'
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'UMUR'
        ParamType = ptInput
      end
      item
        Name = 'TANGGAL_LAHIR'
        ParamType = ptInput
      end
      item
        Name = 'JENIS_KELAMIN_ID'
        ParamType = ptInput
      end
      item
        Name = 'ALAMAT'
        ParamType = ptInput
      end
      item
        Name = 'TELEPON'
        ParamType = ptInput
      end
      item
        Name = 'HANDPHONE'
        ParamType = ptInput
      end
      item
        Name = 'FAX'
        ParamType = ptInput
      end
      item
        Name = 'ORGANISASI_ID'
        DataType = ftString
        ParamType = ptInput
        Value = '0'
      end>
    Left = 72
    Top = 320
  end
  object QLastInsId: TFDQuery
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'SELECT LAST_INSERT_ID() last_insert_id;')
    Left = 112
    Top = 320
  end
end
