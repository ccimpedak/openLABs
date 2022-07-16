object frmReleaseNote: TfrmReleaseNote
  Left = 0
  Top = 0
  ClientHeight = 562
  ClientWidth = 651
  Caption = 'frmReleaseNote'
  BorderStyle = bsNone
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  Font.Height = -16
  PixelsPerInch = 96
  TextHeight = 19
  object UniContainerPanel1: TUniContainerPanel
    Left = 0
    Top = 480
    Width = 651
    Height = 82
    Hint = ''
    ParentColor = False
    Align = alBottom
    TabOrder = 0
    object UniButton1: TUniButton
      Left = 256
      Top = 24
      Width = 129
      Height = 41
      Hint = ''
      Caption = 'Close'
      ParentFont = False
      Font.Height = -16
      TabOrder = 1
      OnClick = UniButton1Click
    end
    object UniBitBtn1: TUniBitBtn
      Left = 504
      Top = 24
      Width = 75
      Height = 25
      Hint = ''
      Caption = 'UniBitBtn1'
      TabOrder = 2
      OnClick = UniBitBtn1Click
    end
    object UniButton2: TUniButton
      Left = 536
      Top = 56
      Width = 75
      Height = 25
      Hint = ''
      Caption = 'UniButton2'
      TabOrder = 3
      OnClick = UniButton2Click
    end
  end
  object UniContainerPanel2: TUniContainerPanel
    Left = 0
    Top = 0
    Width = 651
    Height = 480
    Hint = ''
    ParentColor = False
    Align = alClient
    TabOrder = 1
    object UniMemo1: TUniMemo
      Left = 0
      Top = 0
      Width = 651
      Height = 480
      Hint = ''
      Lines.Strings = (
        '[ 0.0.0.2 ]'
        '20190615'
        '- Tambahkan menu Administrasi > User'
        '[  0.0.0.1 ]'
        '20190613'
        '- Grid cari pasien hilangkan page number'
        '- Grid cari dokter hilangkan page number'
        
          '- tambahkan menu status hasil tanggal dan catatan pada form pend' +
          'aftaran'
        '- fix tambah dokter baru error di program lama'
        '- fix total sub_total dan diskon pada nota'
        '- Grid tes pada menu pendaftaran tanpa page number'
        '- Tambahkan tombol edit pasien pada form pendaftaran'
        '- tambahkan tombol hasil sebelumnya pada form pendaftaran'
        '20190612'
        '- fix shortkey pada memu pembayaran'
        '20190522'
        '- Layout Nota Detail - Font kecil dan antar baris lebih rapat'
        '- Format LHKP (laporan harian) sesuai dengan system lama'
        '- Format laporan Home Service sesuai dengan contoh system lama'
        '- tambah menu baru front office > system log'
        '- tambah event logging saat register baru'
        '20190519'
        '- tambahkan fitur baru Home Service'
        '20190518'
        '- tambahkan status pembayaran dan ambil hasil'
        '- label tambahkan tanggal lahir dan telp ganti ke hp'
        '- nota di rapatkan'
        '20190517'
        '- nota font di kecilkan'
        
          '- barcde label di penuhkan ke kanan, tambahkan usia dan pindah n' +
          'omor ke atas'
        '- tambahkan menu ambil hasil'
        '- grid status hasil di buat all row tampil'
        '- tambahkan label tombol di monitoring'
        '20190516'
        '- daftar order menu monitoring urut berdasarkan nomor lab'
        '- pendaftaran pasien baru,jenis kelamin otomatis dari sufix'
        '- tambahkan barcode nomor lab pada label'
        '- fix bug, cari pasien field tidak ditemukan'
        '20190515'
        '- tambahkan print label'
        '- input diskon bisa dengan masukan amount'
        '- layout nota di turunkan'
        '- fix prefix dan kelamin tidak tersimpan'
        '20190513'
        '- kode wilayah dihilangkan karena tdk relevan lagi'
        '- tambahkan No. KTP di demografik pasien'
        '- Fix pencarian nomor lab tidak jalan'
        '20190512'
        
          '- Fix form pendaftaran tambahkan field: Form dan origin serta pe' +
          'njamin'
        '- form pembayaran tambahkan cetak nota dan kuitansi'
        '- form Status monitoring hasil tambahkan cetak kuitansi'
        '- form rekap harian, tambahkan export ke excel')
      ParentFont = False
      Font.Height = -16
      Font.Name = 'Arial'
      Align = alClient
      ReadOnly = True
      TabOrder = 1
    end
  end
end
