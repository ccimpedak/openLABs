object frmHargaEdit: TfrmHargaEdit
  Left = 0
  Top = 0
  ClientHeight = 107
  ClientWidth = 379
  Caption = 'Edit harga'
  BorderStyle = bsDialog
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  Font.Height = -13
  Font.Name = 'Roboto'
  OnBeforeShow = UniFormBeforeShow
  OnAfterShow = UniFormAfterShow
  PixelsPerInch = 96
  TextHeight = 15
  object cbTipePasien: TUniDBLookupComboBox
    Left = 101
    Top = 8
    Width = 140
    Height = 23
    Hint = ''
    ListSource = DSTipePasien
    KeyField = 'nama'
    ListFieldIndex = 0
    DataField = 'id'
    ParentFont = False
    Font.Height = -13
    Font.Name = 'Roboto'
    AnyMatch = True
    TabOrder = 0
    Color = clWindow
    Style = csDropDown
  end
  object UniLabel1: TUniLabel
    Left = 16
    Top = 16
    Width = 67
    Height = 15
    Hint = ''
    Caption = 'Tipe Pasien'
    TabOrder = 1
  end
  object UniLabel2: TUniLabel
    Left = 16
    Top = 42
    Width = 34
    Height = 15
    Hint = ''
    Caption = 'Harga'
    TabOrder = 2
  end
  object edHarga: TUniNumberEdit
    Left = 101
    Top = 37
    Width = 140
    Hint = ''
    Alignment = taRightJustify
    TabOrder = 3
    DecimalSeparator = '.'
  end
  object btnSimpan: TUniSpeedButton
    Left = 266
    Top = 72
    Width = 105
    Height = 27
    Hint = ''
    Caption = 'Simpan'
    ParentColor = False
    Color = clWindow
    TabOrder = 4
    OnClick = btnSimpanClick
  end
  object QTipePasien: TFDQuery
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id,nama from tipe_pasien')
    Left = 57
    Top = 73
  end
  object DSTipePasien: TDataSource
    DataSet = QTipePasien
    Left = 113
    Top = 73
  end
  object cmdExe: TFDCommand
    Connection = UniMainModule.FDConnection1
    CommandText.Strings = (
      
        'delete from harga where test_id = :test_id and tipe_pasien_id = ' +
        ':tipe_pasien_id;'
      
        'insert into harga (test_id,tipe_pasien_id,harga) values (:test_i' +
        'd,:tipe_pasien_id,:harga);')
    ParamData = <
      item
        Name = 'TEST_ID'
        DataType = ftString
        ParamType = ptInput
        Value = '1'
      end
      item
        Name = 'TIPE_PASIEN_ID'
        DataType = ftString
        ParamType = ptInput
        Value = '1'
      end
      item
        Name = 'HARGA'
        DataType = ftString
        ParamType = ptInput
        Value = '1'
      end>
    Left = 296
    Top = 24
  end
end
