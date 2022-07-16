object frmUserAdd: TfrmUserAdd
  Left = 0
  Top = 0
  ClientHeight = 273
  ClientWidth = 354
  Caption = 'User'
  BorderStyle = bsDialog
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  Font.Height = -13
  Font.Name = 'Roboto'
  OnBeforeShow = UniFormBeforeShow
  OnAfterShow = UniFormAfterShow
  PixelsPerInch = 96
  TextHeight = 15
  object edAkun: TUniEdit
    Left = 32
    Top = 24
    Width = 185
    Hint = ''
    Text = ''
    TabOrder = 0
    FieldLabel = 'Akun'
  end
  object edNama: TUniEdit
    Left = 32
    Top = 52
    Width = 297
    Hint = ''
    Text = ''
    TabOrder = 1
    FieldLabel = 'Nama'
  end
  object edPassword: TUniEdit
    Left = 32
    Top = 80
    Width = 297
    Hint = ''
    PasswordChar = '*'
    Text = ''
    TabOrder = 2
    FieldLabel = 'Password'
    OnChange = edPasswordChange
  end
  object edKonfimPass: TUniEdit
    Left = 32
    Top = 108
    Width = 297
    Hint = ''
    PasswordChar = '*'
    Text = ''
    TabOrder = 3
    FieldLabel = 'Password konfirm'
    OnChange = edPasswordChange
  end
  object edEmail: TUniEdit
    Left = 32
    Top = 136
    Width = 297
    Hint = ''
    Text = ''
    TabOrder = 4
    FieldLabel = 'Email'
  end
  object cbProfil: TUniDBLookupComboBox
    Left = 32
    Top = 164
    Width = 297
    Height = 27
    Hint = ''
    ListSource = dsProfil
    KeyField = 'nama'
    ListFieldIndex = 0
    DataField = 'id'
    TabOrder = 5
    Color = clWindow
    FieldLabel = 'Profil'
  end
  object btnTambah: TUniSpeedButton
    Left = 260
    Top = 239
    Width = 94
    Height = 26
    Hint = ''
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      1800000000000003000000000000000000000000000000000000C1761BC27519
      BD6B13B96504B96504B96504BA6504BA6504BA6504BA6504BA6504BA6504BA65
      04BC690AB96A15C3791FD5933DEFB736CDC6C0E9F8FFDBE5F6DBE8F8DBE8F8DB
      E8F9DBE8F8DAE7F8DBE7F8D8E4F5E9F6FFCDC6C0EAA714C0761DCD9551E8AE3C
      DCD7D4ECE8E9ADA0A2A79B9E9E939594898C8A818583797C7B7276685F64ECE8
      E9DCD7D4E59E20C77B25D09653EAB447DCD7D4EFF0EFDFDEDCE1E0DFE0DFDEDF
      E0DDE0DFDDDFDEDDDFE0DEDBD9D9EDEDEDDCD7D4E7A62BC9802BD49B58EBB950
      DCD7D4ECE8E9A99D9FA4999E9A919492888B897F8582797C7A7177655C62ECE8
      E9DCD7D4E8AC37CC8531D69E5BEDBD5ADCD7D4FFFFFFFFFEFEFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCD7D4EAB340D08B34D9A45EF0C263
      DCD7D4ECE8E9A99D9FA4999E9A919492888B897F8582797C7A7177655C62ECE8
      E9DCD7D4EDB749D2903AD8A35CF0C66DDCD7D4FFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCD7D4EEBD54D7963EDEAC69F9D281
      C1975C9A7B6095775E97795D97795D97795D97795D97795C97795C95775E9A7A
      5EC19A64F7CA6BD99B44DDAB67F6D58BFFD056C0A887C8C5C9CEC6BFCDC6C0CD
      C6C0CDC6BFD6D0CAD6D3D0CFCED4C0A888FFD25DF3CC75DCA148DCA966F6D993
      FBC85DC2B4A2D7DEEBDDDDDDDCDDDEDCDBDDE7E8EAC8BAA7A29692C2B4A2C6BC
      A9FBCB63F3D07EE0A74CE5B973F6DA97FBCC62C8BAA7DDE0E9E1DFDDE0DFDEDF
      DDDCEFF3F99F886FE5AF479E9189C7BDB2FDCF6AF5D484E3AC51E9BC75F8DD9E
      FDCF69CEC0AFE3E7EFE7E5E3E6E5E4E5E4E2F1F6FFBAA386FFE873B5AB9ECAC0
      B8FFD26EF9DA8EE7B25BEAC079F8E09BFBD165D3C4AFEAEEF6ECEBE8ECEBE9EB
      E9E6FBFFFFA28E78DEAF4FA89C95D1C7B9FFDA78F5D889E2A442ECC47EFEF4D5
      FFE290DCD7D4F5FFFFF6FEFFF6FEFFF6FDFFFFFFFFDFDDDCC8BAA7DFDDDCE5E4
      E2FFDE88E4AA45FCF5ECECC681F0CA82F4CA7DE8C788EFCF94EFD498EDCF92EE
      D092EED093F2D396F7D79BF6D69BE6C48AEBB552FDF9F2FFFFFF}
    Caption = 'Simpan'
    ParentColor = False
    Color = clWindow
    TabOrder = 6
    OnClick = btnTambahClick
  end
  object cbLokasi: TUniDBLookupComboBox
    Left = 32
    Top = 197
    Width = 297
    Height = 27
    Hint = ''
    ListSource = dsLokasi
    KeyField = 'nama'
    ListFieldIndex = 0
    DataField = 'id'
    TabOrder = 7
    Color = clWindow
    FieldLabel = 'Lokasi'
  end
  object QProfil: TFDQuery
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'SELECT id,nama'
      'FROM'
      'user_profile'
      'ORDER BY id')
    Left = 318
    Top = 120
  end
  object dsProfil: TDataSource
    DataSet = QProfil
    Left = 318
    Top = 160
  end
  object cmdExec: TFDCommand
    Connection = UniMainModule.FDConnection1
    Left = 304
    Top = 200
  end
  object QUser: TFDQuery
    Connection = UniMainModule.FDConnection1
    Left = 264
    Top = 8
  end
  object QLokasi: TFDQuery
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'SELECT id,nama'
      'FROM'
      'lokasi'
      'where'
      'organisasi_id = :organisasi_id'
      'ORDER BY id')
    Left = 254
    Top = 112
    ParamData = <
      item
        Name = 'ORGANISASI_ID'
        DataType = ftString
        ParamType = ptInput
        Value = '0'
      end>
  end
  object dsLokasi: TDataSource
    DataSet = QLokasi
    Left = 254
    Top = 152
  end
  object QGet: TFDQuery
    Connection = UniMainModule.FDConnection1
    Left = 304
    Top = 8
  end
  object cmdIn: TFDCommand
    Connection = UniMainModule.FDConnection1
    Left = 176
    Top = 224
  end
end
