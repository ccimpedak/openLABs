object frmSelTest: TfrmSelTest
  Left = 0
  Top = 0
  ClientHeight = 53
  ClientWidth = 336
  Caption = 'Tambah test'
  BorderStyle = bsDialog
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  Font.Height = -13
  Font.Name = 'Roboto'
  OnBeforeShow = UniFormBeforeShow
  PixelsPerInch = 96
  TextHeight = 15
  object cbTest: TUniDBLookupComboBox
    Left = 56
    Top = 12
    Width = 177
    Height = 23
    Hint = ''
    ListField = 'nama'
    ListSource = dsTest
    KeyField = 'id'
    ListFieldIndex = 0
    TabOrder = 0
    Color = clWindow
  end
  object UniButton1: TUniButton
    Left = 246
    Top = 11
    Width = 75
    Height = 25
    Hint = ''
    Caption = 'Tambah'
    TabOrder = 1
    OnClick = UniButton1Click
  end
  object UniLabel1: TUniLabel
    Left = 25
    Top = 16
    Width = 25
    Height = 15
    Hint = ''
    Caption = 'Test'
    TabOrder = 2
  end
  object QTest: TFDQuery
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id,nama from test '
      'where'
      'id <> :exclude_id'
      'and organisasi_id = :organisasi_id'
      'order by kode,nama')
    Left = 16
    Top = 8
    ParamData = <
      item
        Name = 'EXCLUDE_ID'
        DataType = ftString
        ParamType = ptInput
        Value = '0'
      end
      item
        Name = 'ORGANISASI_ID'
        DataType = ftString
        ParamType = ptInput
        Value = '0'
      end>
  end
  object dsTest: TDataSource
    DataSet = QTest
    Left = 80
    Top = 8
  end
  object cmdTambah: TFDCommand
    Connection = UniMainModule.FDConnection1
    CommandText.Strings = (
      
        'delete from test_concurrents where parent_test_id = :parent_test' +
        '_id'
      'and child_test_id = :child_test_id;'
      ''
      'insert into test_concurrents (parent_test_id,child_test_id) '
      'values (:parent_test_id,:child_test_id) ;')
    ParamData = <
      item
        Name = 'PARENT_TEST_ID'
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'CHILD_TEST_ID'
        ParamType = ptInput
      end>
    Left = 136
    Top = 8
  end
end
