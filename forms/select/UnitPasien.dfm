object frmPasien: TfrmPasien
  Left = 0
  Top = 0
  ClientHeight = 567
  ClientWidth = 726
  Caption = 'Pasien'
  BorderStyle = bsDialog
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  Font.Height = -16
  Font.Name = 'Roboto'
  PixelsPerInch = 96
  TextHeight = 19
  object UniContainerPanel1: TUniContainerPanel
    Left = 0
    Top = 0
    Width = 726
    Height = 528
    Hint = ''
    ParentColor = False
    Align = alClient
    TabOrder = 0
    object UniContainerPanel3: TUniContainerPanel
      Left = 0
      Top = 0
      Width = 726
      Height = 57
      Hint = ''
      ParentColor = False
      Align = alTop
      TabOrder = 1
    end
    object UniLabel1: TUniLabel
      Left = 16
      Top = 3
      Width = 147
      Height = 15
      Hint = ''
      Caption = 'Find Nama / Telp / Alamat'
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Roboto'
      TabOrder = 2
    end
    object edText: TUniEdit
      Left = 16
      Top = 20
      Width = 257
      Hint = ''
      Text = ''
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Roboto'
      TabOrder = 3
      OnKeyPress = edTextKeyPress
    end
    object grdPasien: TUniDBGrid
      Left = 0
      Top = 57
      Width = 726
      Height = 471
      Hint = ''
      DataSource = DSPasien
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgAutoRefreshRow]
      WebOptions.Paged = False
      LoadMask.Message = 'Loading data...'
      Align = alClient
      Font.Height = -13
      Font.Name = 'Roboto'
      ParentFont = False
      TabOrder = 4
      OnDblClick = grdPasienDblClick
      Columns = <
        item
          FieldName = 'nama'
          Title.Caption = 'Nama'
          Width = 191
          Font.Name = 'Roboto'
          ReadOnly = True
        end
        item
          FieldName = 'tlp'
          Title.Caption = 'Telepon'
          Width = 100
          Font.Name = 'Roboto'
          ReadOnly = True
        end
        item
          FieldName = 'alamat'
          Title.Caption = 'Alamat'
          Width = 388
          Font.Name = 'Roboto'
        end>
    end
  end
  object UniContainerPanel2: TUniContainerPanel
    Left = 0
    Top = 528
    Width = 726
    Height = 39
    Hint = ''
    ParentColor = False
    Align = alBottom
    TabOrder = 1
    object UniButton2: TUniButton
      Left = 16
      Top = 6
      Width = 81
      Height = 27
      Hint = ''
      Caption = 'Add'
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Roboto'
      TabOrder = 1
      OnClick = UniButton2Click
    end
    object UniButton3: TUniButton
      Left = 103
      Top = 6
      Width = 81
      Height = 27
      Hint = ''
      Caption = 'Edit'
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Roboto'
      TabOrder = 2
      OnClick = UniButton3Click
    end
  end
  object QPasien: TFDQuery
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select'
      #9'p.id,'
      #9'p.jenis_kelamin_id,'
      #9'CONCAT(pf.nama, '#39' '#39', p.nama) nama,'
      #9'k.nama kelamin,'
      #9'p.telepon,'
      #9'p.hp,'
      #9'p.noreg,'
      #9'p.wilayah,'
      #9'CONCAT(p.telepon, '#39'/'#39', p.hp) tlp,'
      #9'p.alamat,'
      
        #9'CONCAT(TIMESTAMPDIFF(year, p.tanggal_lahir, NOW()), '#39'th'#39', TIMES' +
        'TAMPDIFF(month, p.tanggal_lahir, NOW()) % 12, '#39' bl '#39' , FLOOR(TIM' +
        'ESTAMPDIFF(day, p.tanggal_lahir, NOW()) % 30.4375)) as umur,'
      #9'p.catatan,'
      #9'p.email,'
      #9'p.tanggal_lahir  '
      'from'
      #9'pasien p,'
      #9'prefix pf,'
      #9'jenis_kelamin k'
      'where'
      #9'p.prefix_id = pf.id'
      #9'and p.jenis_kelamin_id = k.id'
      
        #9'and CONCAT(IFNULL(p.nama, '#39#39'), IFNULL(p.telepon, '#39#39'), IFNULL(p.' +
        'hp, '#39#39')) like :cari'
      'and p.organisasi_id = :organisasi_id'
      'order by'
      #9'p.nama')
    Left = 304
    Top = 32
    ParamData = <
      item
        Name = 'CARI'
        DataType = ftString
        ParamType = ptInput
        Value = ' '
      end
      item
        Name = 'ORGANISASI_ID'
        DataType = ftString
        ParamType = ptInput
        Value = '0'
      end>
  end
  object DSPasien: TDataSource
    DataSet = QPasien
    Left = 352
    Top = 32
  end
  object QEditPasien: TFDQuery
    Connection = UniMainModule.FDConnection1
    Left = 498
    Top = 32
  end
end
