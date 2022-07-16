object frmUser: TfrmUser
  Left = 0
  Top = 0
  ClientHeight = 547
  ClientWidth = 853
  Caption = 'User'
  BorderStyle = bsDialog
  OldCreateOrder = False
  OnKeyDown = UniFormKeyDown
  MonitoredKeys.Keys = <>
  Font.Height = -16
  OnAfterShow = UniFormAfterShow
  PixelsPerInch = 96
  TextHeight = 19
  object UniContainerPanel1: TUniContainerPanel
    Left = 0
    Top = 0
    Width = 328
    Height = 547
    Hint = ''
    ParentColor = False
    Align = alClient
    TabOrder = 0
    object grdUser: TUniDBGrid
      Left = 0
      Top = 0
      Width = 328
      Height = 257
      Hint = ''
      DataSource = DSUser
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgAutoRefreshRow]
      ReadOnly = True
      WebOptions.Paged = False
      WebOptions.FetchAll = True
      LoadMask.Message = 'Loading data...'
      Align = alTop
      TabOrder = 1
      Columns = <
        item
          FieldName = 'user_name'
          Title.Caption = 'User'
          Width = 111
        end
        item
          FieldName = 'nama'
          Title.Caption = 'Nama'
          Width = 176
        end>
    end
    object tvMenu: TUniTreeView
      Left = 0
      Top = 257
      Width = 328
      Height = 290
      Hint = ''
      Items.NodeData = {
        0305000000340000000000000000000000FFFFFFFFFFFFFFFF00000000000000
        0005000000010B4D0065006E0075002000530079007300740065006D00320000
        000000000000000000FFFFFFFFFFFFFFFF000000000000000000000000010A4D
        0065006E00750020004C006F00670069006E00340000000000000000000000FF
        FFFFFFFFFFFFFF000000000000000000000000010B4D0065006E00750020004C
        006F0067006F0066006600440000000000000000000000FFFFFFFFFFFFFFFF00
        000000000000000000000001134D0065006E0075002000470061006E00740069
        002000500061007300730077006F00720064003C0000000000000000000000FF
        FFFFFFFFFFFFFF000000000000000000000000010F4D0065006E007500200053
        0079007300740065006D0020004C006F0067003C0000000000000000000000FF
        FFFFFFFFFFFFFF000000000000000000000000010F4B0065006C007500610072
        002000410070006C0069006B00610073006900360000000000000000000000FF
        FFFFFFFFFFFFFF000000000000000006000000010C460072006F006E00740020
        004F0066006600690063006500340000000000000000000000FFFFFFFFFFFFFF
        FF000000000000000000000000010B500065006E006400610066007400610072
        0061006E004C0000000000000000000000FFFFFFFFFFFFFFFF00000000000000
        00000000000117530074006100740075007300200048006100730069006C002F
        00500065006D006200610079006100720061006E003800000000000000000000
        00FFFFFFFFFFFFFFFF000000000000000000000000010D4C00610070006F0072
        0061006E002000530068006900660074004C0000000000000000000000FFFFFF
        FFFFFFFFFF00000000000000000000000001174C00610070006F00720061006E
        0020005400720061006E00730061006B00730069002000530068006900660074
        00360000000000000000000000FFFFFFFFFFFFFFFF0000000000000000000000
        00010C48006F006D006500200053006500720076006900630065003A00000000
        00000000000000FFFFFFFFFFFFFFFF000000000000000000000000010E430068
        00650063006B007500700020004B00680075007300750073002A000000000000
        0000000000FFFFFFFFFFFFFFFF0000000000000000050000000106500072006F
        007300650073002E0000000000000000000000FFFFFFFFFFFFFFFF0000000000
        000000000000000108530061006D0070006C0069006E0067002C000000000000
        0000000000FFFFFFFFFFFFFFFF0000000000000000000000000107520075006A
        0075006B0061006E002E0000000000000000000000FFFFFFFFFFFFFFFF000000
        000000000000000000010857006F0072006B006C006900730074003000000000
        00000000000000FFFFFFFFFFFFFFFF0000000000000000030000000109490073
        006900200048006100730069006C00360000000000000000000000FFFFFFFFFF
        FFFFFF000000000000000000000000010C4200790020004E006F006D006F0072
        0020004C00610062003A0000000000000000000000FFFFFFFFFFFFFFFF000000
        000000000000000000010E420079002000500065006D006500720069006B0073
        00610061006E002C0000000000000000000000FFFFFFFFFFFFFFFF0000000000
        00000000000000010753007500730075006C0061006E00340000000000000000
        000000FFFFFFFFFFFFFFFF000000000000000000000000010B43006500740061
        006B00200048006100730069006C002C0000000000000000000000FFFFFFFFFF
        FFFFFF00000000000000000E00000001074C00610070006F00720061006E0030
        0000000000000000000000FFFFFFFFFFFFFFFF00000000000000000000000001
        09500065006E006A00750061006C0061006E00320000000000000000000000FF
        FFFFFFFFFFFFFF000000000000000000000000010A500065006E006400610070
        006100740061006E002A0000000000000000000000FFFFFFFFFFFFFFFF000000
        000000000000000000010644006F006B007400650072002C0000000000000000
        000000FFFFFFFFFFFFFFFF000000000000000000000000010750006900750074
        0061006E006700300000000000000000000000FFFFFFFFFFFFFFFF0000000000
        000000000000000109500065006E00610067006900680061006E002A00000000
        00000000000000FFFFFFFFFFFFFFFF0000000000000000000000000106520065
        006100670065006E00360000000000000000000000FFFFFFFFFFFFFFFF000000
        000000000000000000010C520065006B0061007000200044006F006B00740065
        007200340000000000000000000000FFFFFFFFFFFFFFFF000000000000000000
        000000010B500065006E00670061006E0074006100720061006E003600000000
        00000000000000FFFFFFFFFFFFFFFF000000000000000000000000010C4C0061
        0062002E002000520075006A0075006B0061006E004800000000000000000000
        00FFFFFFFFFFFFFFFF00000000000000000000000001154C00610070006F0072
        0061006E002000500065006D00610073006100720061006E0020004C00610062
        00440000000000000000000000FFFFFFFFFFFFFFFF0000000000000000000000
        0001134C00610070006F00720061006E00200044006F006B0074006500720020
        0042006100720075004E0000000000000000000000FFFFFFFFFFFFFFFF000000
        00000000000000000001184C00610070006F00720061006E00200044006F006B
        007400650072002000500065006D00620061006300610061006E004800000000
        00000000000000FFFFFFFFFFFFFFFF0000000000000000000000000115430068
        00650063006B006C0069007300740020004B006900720069006D002000480061
        00730069006C00460000000000000000000000FFFFFFFFFFFFFFFF0000000000
        00000000000000011448006100730069006C0020004200790020005400690070
        0065002000500061007300690065006E00360000000000000000000000FFFFFF
        FFFFFFFFFF00000000000000000F000000010C410064006D0069006E00690073
        0074007200610073006900460000000000000000000000FFFFFFFFFFFFFFFF00
        000000000000000000000001144D0065006E007500200054006100620065006C
        0020005200650066006500720065006E00730069003000000000000000000000
        00FFFFFFFFFFFFFFFF00000000000000000000000001094D0065006E00750020
        005500730065007200340000000000000000000000FFFFFFFFFFFFFFFF000000
        000000000000000000010B4D0065006E0075002000560065006E0064006F0072
        00300000000000000000000000FFFFFFFFFFFFFFFF0000000000000000000000
        0001094D0065006E007500200041006C00610074003400000000000000000000
        00FFFFFFFFFFFFFFFF000000000000000000000000010B4D0065006E00750020
        0044006F006B00740065007200300000000000000000000000FFFFFFFFFFFFFF
        FF00000000000000000700000001094D0065006E007500200054006500730074
        00320000000000000000000000FFFFFFFFFFFFFFFF0000000000000000020000
        00010A4400720061006600740020004C00690073007400300000000000000000
        000000FFFFFFFFFFFFFFFF00000000000000000000000001094C006900730074
        00200054006500730074003C0000000000000000000000FFFFFFFFFFFFFFFF00
        0000000000000000000000010F4C006900730074002000540065007300740020
        0048006100720067006100260000000000000000000000FFFFFFFFFFFFFFFF00
        0000000000000000000000010454006500730074003600000000000000000000
        00FFFFFFFFFFFFFFFF000000000000000000000000010C540065007300740020
        0049006E00670067007200690073002E0000000000000000000000FFFFFFFFFF
        FFFFFF00000000000000000000000001085400650073007400200053002F0049
        00320000000000000000000000FFFFFFFFFFFFFFFF0000000000000000000000
        00010A4800610072006700610020005400650073007400400000000000000000
        000000FFFFFFFFFFFFFFFF000000000000000000000000011148006100720067
        00610020004C00610062002000520075006A0075006B0061006E003400000000
        00000000000000FFFFFFFFFFFFFFFF000000000000000000000000010B540065
        007300740020004E006F0072006D0061006C002A0000000000000000000000FF
        FFFFFFFFFFFFFF0000000000000000000000000106500061007300690065006E
        00360000000000000000000000FFFFFFFFFFFFFFFF0000000000000000000000
        00010C43006500740061006B00200044006F006B007400650072003600000000
        00000000000000FFFFFFFFFFFFFFFF000000000000000000000000010C430065
        00740061006B002000500061007300690065006E003800000000000000000000
        00FFFFFFFFFFFFFFFF000000000000000000000000010D4C00610070006F0072
        0061006E00200055006C007400610068002A0000000000000000000000FFFFFF
        FFFFFFFFFF0000000000000000060000000106520065006100670065006E0036
        0000000000000000000000FFFFFFFFFFFFFFFF00000000000000000000000001
        0C410064006D0069006E00690073007400720061007300690032000000000000
        0000000000FFFFFFFFFFFFFFFF000000000000000000000000010A410064006A
        007500730074006D0065006E0074002C0000000000000000000000FFFFFFFFFF
        FFFFFF000000000000000000000000010750006F007300740069006E0067002C
        0000000000000000000000FFFFFFFFFFFFFFFF00000000000000000000000001
        074C00610070006F00720061006E002E0000000000000000000000FFFFFFFFFF
        FFFFFF000000000000000000000000010849006E0063006F006D0069006E0067
        00320000000000000000000000FFFFFFFFFFFFFFFF0000000000000000000000
        00010A410073007300690067006E006D0065006E0074002A0000000000000000
        000000FFFFFFFFFFFFFFFF000000000000000000000000010652006500770061
        0072006400380000000000000000000000FFFFFFFFFFFFFFFF00000000000000
        0000000000010D4500780070006F0072007400200044006F006B007400650072
        00380000000000000000000000FFFFFFFFFFFFFFFF0000000000000000000000
        00010D4500780070006F00720074002000500061007300690065006E00480000
        000000000000000000FFFFFFFFFFFFFFFF000000000000000000000000011541
        0064006D0069006E002000480061007200670061002000500065006D00620061
        006300610061006E00}
      Items.FontData = {
        0105000000FFFFFFFF05000000FFFFFFFF00000000FFFFFFFF00000000FFFFFF
        FF00000000FFFFFFFF00000000FFFFFFFF00000000FFFFFFFF06000000FFFFFF
        FF00000000FFFFFFFF00000000FFFFFFFF00000000FFFFFFFF00000000FFFFFF
        FF00000000FFFFFFFF00000000FFFFFFFF05000000FFFFFFFF00000000FFFFFF
        FF00000000FFFFFFFF00000000FFFFFFFF03000000FFFFFFFF00000000FFFFFF
        FF00000000FFFFFFFF00000000FFFFFFFF00000000FFFFFFFF0E000000FFFFFF
        FF00000000FFFFFFFF00000000FFFFFFFF00000000FFFFFFFF00000000FFFFFF
        FF00000000FFFFFFFF00000000FFFFFFFF00000000FFFFFFFF00000000FFFFFF
        FF00000000FFFFFFFF00000000FFFFFFFF00000000FFFFFFFF00000000FFFFFF
        FF00000000FFFFFFFF00000000FFFFFFFF0F000000FFFFFFFF00000000FFFFFF
        FF00000000FFFFFFFF00000000FFFFFFFF00000000FFFFFFFF00000000FFFFFF
        FF07000000FFFFFFFF02000000FFFFFFFF00000000FFFFFFFF00000000FFFFFF
        FF00000000FFFFFFFF00000000FFFFFFFF00000000FFFFFFFF00000000FFFFFF
        FF00000000FFFFFFFF00000000FFFFFFFF00000000FFFFFFFF00000000FFFFFF
        FF00000000FFFFFFFF00000000FFFFFFFF06000000FFFFFFFF00000000FFFFFF
        FF00000000FFFFFFFF00000000FFFFFFFF00000000FFFFFFFF00000000FFFFFF
        FF00000000FFFFFFFF00000000FFFFFFFF00000000FFFFFFFF00000000FFFFFF
        FF00000000}
      Align = alClient
      TabOrder = 2
      Color = clWindow
      UseCheckBox = True
    end
  end
  object UniContainerPanel2: TUniContainerPanel
    Left = 328
    Top = 0
    Width = 525
    Height = 547
    Hint = ''
    ParentColor = False
    Align = alRight
    TabOrder = 1
    ExplicitLeft = 334
    ExplicitTop = -40
    object dtTglLahir: TUniDateTimePicker
      Left = 103
      Top = 61
      Width = 209
      Hint = ''
      DateTime = 43598.000000000000000000
      TabOrder = 1
      UseSystemFormats = True
    end
    object edNoPeg: TUniEdit
      Left = 103
      Top = 5
      Width = 209
      Hint = ''
      Text = ''
      TabOrder = 2
    end
    object edNama: TUniEdit
      Left = 103
      Top = 33
      Width = 209
      Hint = ''
      Text = ''
      TabOrder = 3
    end
    object UniLabel1: TUniLabel
      Left = 14
      Top = 7
      Width = 46
      Height = 19
      Hint = ''
      Caption = 'NoPeg'
      TabOrder = 4
    end
    object UniLabel2: TUniLabel
      Left = 14
      Top = 34
      Width = 41
      Height = 19
      Hint = ''
      Caption = 'Nama'
      TabOrder = 5
    end
    object UniLabel3: TUniLabel
      Left = 14
      Top = 62
      Width = 63
      Height = 19
      Hint = ''
      Caption = 'Tgl Lahir'
      TabOrder = 6
    end
    object UniLabel8: TUniLabel
      Left = 13
      Top = 92
      Width = 56
      Height = 19
      Hint = ''
      Caption = 'Kelamin'
      TabOrder = 7
    end
    object cbKelamin: TUniDBLookupComboBox
      Left = 103
      Top = 89
      Width = 209
      Height = 27
      Hint = ''
      ListSource = DSKelamin
      KeyField = 'nama'
      ListFieldIndex = 0
      TabOrder = 8
      Color = clWindow
      ForceSelection = False
    end
    object UniLabel4: TUniLabel
      Left = 14
      Top = 132
      Width = 50
      Height = 19
      Hint = ''
      Caption = 'Alamat'
      TabOrder = 9
    end
    object mmAlamat: TUniMemo
      Left = 103
      Top = 122
      Width = 209
      Height = 89
      Hint = ''
      TabOrder = 10
    end
    object UniLabel5: TUniLabel
      Left = 14
      Top = 218
      Width = 57
      Height = 19
      Hint = ''
      Caption = 'Telepon'
      TabOrder = 11
    end
    object edTelp: TUniEdit
      Left = 103
      Top = 217
      Width = 209
      Hint = ''
      Text = ''
      TabOrder = 12
    end
    object edHp: TUniEdit
      Left = 103
      Top = 244
      Width = 209
      Hint = ''
      Text = ''
      TabOrder = 13
    end
    object UniLabel6: TUniLabel
      Left = 14
      Top = 245
      Width = 20
      Height = 19
      Hint = ''
      Caption = 'Hp'
      TabOrder = 14
    end
    object UniLabel7: TUniLabel
      Left = 14
      Top = 273
      Width = 39
      Height = 19
      Hint = ''
      Caption = 'Email'
      TabOrder = 15
    end
    object edEmail: TUniEdit
      Left = 103
      Top = 272
      Width = 209
      Hint = ''
      Text = ''
      TabOrder = 16
    end
    object UniLabel9: TUniLabel
      Left = 13
      Top = 303
      Width = 50
      Height = 19
      Hint = ''
      Caption = 'Agama'
      TabOrder = 17
    end
    object cbAgama: TUniDBLookupComboBox
      Left = 103
      Top = 300
      Width = 209
      Height = 27
      Hint = ''
      ListSource = DSAgama
      KeyField = 'nama'
      ListFieldIndex = 0
      TabOrder = 18
      Color = clWindow
      ForceSelection = False
    end
    object dtTglGabung: TUniDateTimePicker
      Left = 103
      Top = 333
      Width = 146
      Hint = ''
      DateTime = 43598.000000000000000000
      TabOrder = 19
      UseSystemFormats = True
    end
    object UniLabel10: TUniLabel
      Left = 14
      Top = 336
      Width = 83
      Height = 19
      Hint = ''
      Caption = 'Tgl Gabung'
      TabOrder = 20
    end
    object UniLabel11: TUniLabel
      Left = 15
      Top = 367
      Width = 38
      Height = 19
      Hint = ''
      Caption = 'Dept.'
      TabOrder = 21
    end
    object cbDept: TUniDBLookupComboBox
      Left = 103
      Top = 361
      Width = 146
      Height = 27
      Hint = ''
      ListSource = DSDept
      KeyField = 'nama'
      ListFieldIndex = 0
      TabOrder = 22
      Color = clWindow
      ForceSelection = False
    end
    object UniLabel12: TUniLabel
      Left = 15
      Top = 395
      Width = 78
      Height = 19
      Hint = ''
      Caption = 'User Name'
      TabOrder = 23
    end
    object edUserName: TUniEdit
      Left = 104
      Top = 394
      Width = 145
      Hint = ''
      Text = ''
      TabOrder = 24
    end
    object grpPassword: TUniGroupBox
      Left = 255
      Top = 333
      Width = 267
      Height = 116
      Hint = ''
      Caption = ''
      TabOrder = 25
      object UniLabel13: TUniLabel
        Left = 13
        Top = 26
        Width = 67
        Height = 19
        Hint = ''
        Caption = 'Password'
        TabOrder = 1
      end
      object edPassword: TUniEdit
        Left = 96
        Top = 23
        Width = 145
        Hint = ''
        PasswordChar = '*'
        Text = ''
        TabOrder = 2
      end
      object UniLabel14: TUniLabel
        Left = 13
        Top = 54
        Width = 75
        Height = 19
        Hint = ''
        Caption = 'Konfirmasi'
        TabOrder = 3
      end
      object edKonfirmasi: TUniEdit
        Left = 96
        Top = 51
        Width = 145
        Hint = ''
        PasswordChar = '*'
        Text = ''
        TabOrder = 4
      end
      object btnGantiPassword: TUniButton
        Left = 120
        Top = 76
        Width = 121
        Height = 38
        Hint = ''
        Enabled = False
        Caption = 'Ganti Password'
        TabOrder = 5
        OnClick = btnGantiPasswordClick
      end
    end
    object btnSave: TUniButton
      Left = 344
      Top = 452
      Width = 90
      Height = 38
      Hint = ''
      Enabled = False
      Caption = 'Save'
      TabOrder = 26
      OnClick = btnSaveClick
    end
    object btnCancel: TUniButton
      Left = 440
      Top = 452
      Width = 82
      Height = 38
      Hint = ''
      Enabled = False
      Caption = 'Cancel'
      TabOrder = 27
      OnClick = btnCancelClick
    end
    object cEditHasilAlat: TUniCheckBox
      Left = 318
      Top = 10
      Width = 204
      Height = 17
      Hint = ''
      Caption = 'Edit Hasil Interface'
      TabOrder = 28
    end
    object cValidasi: TUniCheckBox
      Left = 318
      Top = 33
      Width = 204
      Height = 17
      Hint = ''
      Caption = 'Validasi Hasil'
      TabOrder = 29
    end
    object cPembatalan: TUniCheckBox
      Left = 318
      Top = 56
      Width = 204
      Height = 17
      Hint = ''
      Caption = 'Pembatalan'
      TabOrder = 30
    end
    object cRetur: TUniCheckBox
      Left = 318
      Top = 79
      Width = 204
      Height = 17
      Hint = ''
      Caption = 'Retur'
      TabOrder = 31
    end
    object cEditDokter: TUniCheckBox
      Left = 318
      Top = 102
      Width = 204
      Height = 17
      Hint = ''
      Caption = 'Edit Dokter'
      TabOrder = 32
    end
    object cTipePasien: TUniCheckBox
      Left = 318
      Top = 125
      Width = 204
      Height = 17
      Hint = ''
      Caption = 'Edit Tipe Pasien'
      TabOrder = 33
    end
    object cNormal: TUniCheckBox
      Left = 318
      Top = 148
      Width = 204
      Height = 17
      Hint = ''
      Caption = 'Edit Nilai Normal'
      TabOrder = 34
    end
    object cAddDokter: TUniCheckBox
      Left = 318
      Top = 171
      Width = 204
      Height = 17
      Hint = ''
      Caption = 'Add Dokter'
      TabOrder = 35
    end
    object cPrintKuitansi: TUniCheckBox
      Left = 318
      Top = 194
      Width = 204
      Height = 17
      Hint = ''
      Caption = 'Print Kuitansi'
      TabOrder = 36
    end
    object cCopyKuitansi: TUniCheckBox
      Left = 318
      Top = 217
      Width = 204
      Height = 17
      Hint = ''
      Caption = 'Copy Kuitansi'
      TabOrder = 37
    end
    object btnAdd: TUniButton
      Left = 6
      Top = 506
      Width = 90
      Height = 38
      Hint = ''
      Caption = 'F1 Add'
      TabOrder = 38
      OnClick = btnAddClick
    end
    object btnEdit: TUniButton
      Left = 102
      Top = 506
      Width = 90
      Height = 38
      Hint = ''
      Caption = 'F2 Edit'
      TabOrder = 39
      OnClick = btnEditClick
    end
    object btnDel: TUniButton
      Left = 198
      Top = 506
      Width = 90
      Height = 38
      Hint = ''
      Caption = 'F3 Del'
      TabOrder = 40
      OnClick = btnDelClick
    end
    object btnExit: TUniButton
      Left = 294
      Top = 506
      Width = 90
      Height = 38
      Hint = ''
      Caption = 'F4 Exit'
      TabOrder = 41
      OnClick = btnExitClick
    end
  end
  object btnBrwsData: TUniButton
    Left = 334
    Top = 452
    Width = 123
    Height = 38
    Hint = ''
    Caption = 'F5 Brws. Data'
    TabOrder = 2
    OnClick = btnBrwsDataClick
  end
  object edUserId: TUniEdit
    Left = 376
    Top = 8
    Width = 45
    Hint = ''
    Visible = False
    Text = ''
    TabOrder = 3
  end
  object QUser: TFDQuery
    Active = True
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id,user_name,nama from aguser order by id')
    Left = 96
    Top = 104
  end
  object DSUser: TDataSource
    DataSet = QUser
    Left = 144
    Top = 104
  end
  object QKelamin: TFDQuery
    Active = True
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id,nama'
      'from'
      'jenis_kelamin')
    Left = 264
    Top = 144
  end
  object DSKelamin: TDataSource
    DataSet = QKelamin
    Left = 304
    Top = 144
  end
  object QAgama: TFDQuery
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id,nama'
      'from'
      'agama')
    Left = 256
    Top = 200
  end
  object DSAgama: TDataSource
    DataSet = QAgama
    Left = 296
    Top = 200
  end
  object DSDept: TDataSource
    DataSet = QDept
    Left = 296
    Top = 248
  end
  object QDept: TFDQuery
    Active = True
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id,nama'
      'from'
      'departement')
    Left = 256
    Top = 248
  end
  object QEdit: TFDQuery
    Connection = UniMainModule.FDConnection1
    Left = 256
    Top = 312
  end
  object QMenu: TFDQuery
    Connection = UniMainModule.FDConnection1
    Left = 256
    Top = 376
  end
  object CmdSave: TFDCommand
    Connection = UniMainModule.FDConnection1
    Left = 648
    Top = 416
  end
  object QSave: TFDQuery
    Connection = UniMainModule.FDConnection1
    Left = 616
    Top = 472
  end
  object CmdDel: TFDCommand
    Connection = UniMainModule.FDConnection1
    Left = 536
    Top = 472
  end
end
