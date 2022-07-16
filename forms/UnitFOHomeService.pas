unit UnitFOHomeService;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniPanel, uniMemo, uniEdit,
  uniLabel, uniDateTimePicker, uniBasicGrid, uniDBGrid, uniButton,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.Comp.Client, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet,uniRadioButton,
  uniRadioGroup;

type
  TfrmFOHomeService = class(TUniForm)
    UniContainerPanel1: TUniContainerPanel;
    UniContainerPanel2: TUniContainerPanel;
    UniContainerPanel3: TUniContainerPanel;
    mmCatatan: TUniMemo;
    mmAlamat: TUniMemo;
    UniLabel1: TUniLabel;
    edNama: TUniEdit;
    edKelamin: TUniEdit;
    edUmur: TUniEdit;
    edAlamat: TUniEdit;
    edTelepon: TUniEdit;
    edNoReg: TUniEdit;
    mmIsiCatatan: TUniMemo;
    UniDBGrid1: TUniDBGrid;
    UniLabel2: TUniLabel;
    UniLabel3: TUniLabel;
    UniLabel4: TUniLabel;
    UniLabel5: TUniLabel;
    UniLabel6: TUniLabel;
    UniLabel7: TUniLabel;
    btnCariPasien: TUniButton;
    btnSave: TUniButton;
    btnCancel: TUniButton;
    edPasienId: TUniEdit;
    dtpWaktuAmbil: TUniDateTimePicker;
    cmdInsert: TFDCommand;
    qPending: TFDQuery;
    dsPending: TDataSource;
    btnAdd: TUniButton;
    btnAmbil: TUniButton;
    btnProses: TUniButton;
    btnCetak: TUniButton;
    btnDelete: TUniButton;
    cmdAmbil: TFDCommand;
    cmdProses: TFDCommand;
    QPasien: TFDQuery;
    cmdDelete: TFDCommand;
    qCetak: TFDQuery;
    UniContainerPanel4: TUniContainerPanel;
    UniContainerPanel5: TUniContainerPanel;
    edTgl: TUniEdit;
    rbTgl: TUniRadioButton;
    rbSemua: TUniRadioButton;
    UniLabel8: TUniLabel;
    btnEdit: TUniButton;
    QvPasien: TFDQuery;
    cmdUpdate: TFDCommand;
    procedure btnCariPasienClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure UniFormAfterShow(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure UniDBGrid1CellClick(Column: TUniDBGridColumn);
    procedure btnAddClick(Sender: TObject);
    procedure btnAmbilClick(Sender: TObject);
    procedure btnProsesClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnCetakClick(Sender: TObject);
    procedure UniFormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edTglKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure UniDBGrid1SelectionChange(Sender: TObject);
    procedure rbTglClick(Sender: TObject);
    procedure rbSemuaClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function frmFOHomeService: TfrmFOHomeService;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, UnitCariPasien, UnitFODaftar, ServerModule,
  UnitReportDisplay, UnitJasper;

procedure refreshData();
begin
  if frmFOHomeService.qPending.Active then
    frmFOHomeService.qPending.Active := False;
  if frmFOHomeService.rbTgl.Checked then
  begin
    frmFOHomeService.qPending.SQL.Text :=
      ' select h.id,p.nama,h.tanggal,h.catatan,h.flg_ambil,p.alamat ,p.telepon,p.hp,u.nama as user_nama,h.pasien_id,h.flg_proses '
      + ' from home_service h left join pasien p on h.pasien_id = p.id ' +
      ' left join aguser u on h.ambil_user_id = u.id ' +
      ' where left(h.tanggal,10) = ' + QuotedStr(frmFOHomeService.edTgl.Text) +
      ' order by h.tanggal ';
  end
  else
  begin
    frmFOHomeService.qPending.SQL.Text :=
      ' select h.id,p.nama,h.tanggal,h.catatan,h.flg_ambil,p.alamat ,p.telepon,p.hp,u.nama as user_nama,h.pasien_id,h.flg_proses '
      + ' from home_service h left join pasien p on h.pasien_id = p.id ' +
      ' left join aguser u on h.ambil_user_id = u.id  order by h.tanggal ';
  end;
  frmFOHomeService.qPending.Active := True;
  // frmFOHomeService.UniMemo1.Lines.Clear;
  // frmFOHomeService.UniMemo1.Lines.Text := frmFOHomeService.qPending.SQL.Text;
end;

function frmFOHomeService: TfrmFOHomeService;
begin
  Result := TfrmFOHomeService(UniMainModule.GetFormInstance(TfrmFOHomeService));
end;

procedure TfrmFOHomeService.btnCariPasienClick(Sender: TObject);
begin

  frmCariPasien.call_form := 'home_service';
  frmCariPasien.ShowModal();
end;

procedure TfrmFOHomeService.btnCetakClick(Sender: TObject);
// var
// tmpStr: String;
// Result: string;
begin
//  ShowMask('Loading');
//  uniSession.Synchronize();
//  if rbTgl.Checked then
//    frmReportDisplay.UniURLFrame1.URL := reportExecReqParams('pdf',
//      'report_home_service', edTgl.Text, '', '')
//  else
//    frmReportDisplay.UniURLFrame1.URL := reportExecReqParams('pdf',
//      'report_home_service', '', '', '');
//  frmReportDisplay.ShowModal();
//  HideMask;
  // if qCetak.Active then
  // qCetak.Active := False;
  // qCetak.ParamByName('tanggal').Value := edTgl.Text;
  // qCetak.Active := True;
  //
  // frxCetak.PrintOptions.ShowDialog := False;
  // frxCetak.ShowProgress := False;
  //
  // frxCetak.EngineOptions.SilentMode := True;
  // frxCetak.EngineOptions.DestroyForms := False;
  //
  // frxPDFExport1.Background := True;
  // frxPDFExport1.ShowProgress := False;
  // frxPDFExport1.ShowDialog := False;
  // frxPDFExport1.FileName := UniServerModule.NewCacheFileUrl(False, 'pdf', '',
  // '', Result, True);
  // frxPDFExport1.DefaultPath := '';
  //
  // frxCetak.PreviewOptions.AllowEdit := False;
  // frxCetak.Variables['cetak'] :=
  // QuotedStr(UniApplication.Cookies.GetCookie('UserName'));
  // frxCetak.PrepareReport;
  // frxCetak.Export(frxPDFExport1);
  //
  // frmReportDisplay.UniURLFrame1.URL := Result;
  // frmReportDisplay.ShowModal();

end;

procedure TfrmFOHomeService.btnDeleteClick(Sender: TObject);
begin
  MessageDlg('Delete Home Service ?', mtConfirmation, mbYesNo,
    procedure(Sender: TComponent; Res: Integer)
    begin
      case Res of
        mrYes:
          begin
            if cmdDelete.Active then
              cmdDelete.Active := False;
            cmdDelete.ParamByName('id').AsString :=
              qPending.FieldByName('id').AsString;
            cmdDelete.Execute();
            refreshData();
          end;
      end;
    end);
end;

procedure TfrmFOHomeService.btnEditClick(Sender: TObject);
begin
  if qPending.RecordCount > 0 then
  begin
    btnSave.Caption := 'Update';
    mmCatatan.Lines.Text := qPending.FieldByName('catatan').AsString;
    mmAlamat.Lines.Text := qPending.FieldByName('alamat').AsString + Char(13) +
      'Telp. ' + qPending.FieldByName('telepon').AsString + Char(13) + 'Hp. ' +
      qPending.FieldByName('hp').AsString;

    if QvPasien.Active then
      QvPasien.Active := False;
    QvPasien.ParamByName('pasien_id').Value := qPending.FieldByName('pasien_id')
      .AsInteger;
    QvPasien.Active := True;

    edPasienId.Text := QvPasien.FieldByName('id').AsString;
    edNama.Text := QvPasien.FieldByName('nama').AsString;
    edKelamin.Text := QvPasien.FieldByName('kelamin').AsString;
    edUmur.Text := QvPasien.FieldByName('umur').AsString;
    edAlamat.Text := QvPasien.FieldByName('alamat').AsString;
    edTelepon.Text := QvPasien.FieldByName('tlp').AsString;
    edNoReg.Text := QvPasien.FieldByName('noreg').AsString;

    mmIsiCatatan.Lines.Text := qPending.FieldByName('catatan').AsString;

    mmIsiCatatan.Enabled := True;
    dtpWaktuAmbil.Enabled := True;
    btnCancel.Enabled := True;
    btnSave.Enabled := True;
    mmIsiCatatan.SetFocus;
  end;
end;

procedure TfrmFOHomeService.btnProsesClick(Sender: TObject);
begin
  if qPending.FieldByName('nama').AsString <> '' then
  begin
    MessageDlg('Proses [' + qPending.FieldByName('nama').AsString +
      '] Home Service ?', mtConfirmation, mbYesNo,
      procedure(Sender: TComponent; Res: Integer)
      begin
        case Res of
          mrYes:
            begin
              if cmdProses.Active then
                cmdProses.Active := False;
              cmdProses.Params.Clear;
              cmdProses.Params.Add.Name := 'id';
              cmdProses.CommandText.Text :=
                'UPDATE home_service SET flg_proses = ' + QuotedStr('Y') +
                ' WHERE id = :id ';
              cmdProses.ParamByName('id').Value := qPending.FieldByName('id')
                .AsInteger;
              cmdProses.Execute();
              refreshData();
            end;
        end;
      end);
  end;
end;

procedure TfrmFOHomeService.edTglKeyDown(Sender: TObject; var Key: Word;
Shift: TShiftState);
begin
  if Key = VK_RETURN then
    refreshData();
end;

procedure TfrmFOHomeService.btnSaveClick(Sender: TObject);
begin
  if edPasienId.Text = '' then
  begin
    ShowMessage('Cari pasien.');
    exit;
  end;
  {
    if mmIsiCatatan.Lines.Text='' then
    begin
    ShowMessage('isi catatan.');
    mmIsiCatatan.SetFocus;
    exit;
    end;
  }

  if btnSave.Caption = 'Save' then
  begin

    if cmdInsert.Active then
      cmdInsert.Active := False;
    cmdInsert.ParamByName('pasien_id').AsString := edPasienId.Text;
    cmdInsert.ParamByName('tanggal').AsString :=
      FormatDateTime('yyyy-MM-dd HH:mm:ss', dtpWaktuAmbil.DateTime);
    cmdInsert.ParamByName('catatan').AsString := mmIsiCatatan.Lines.Text;
    cmdInsert.ParamByName('isi_user_id').AsString :=
      UniApplication.Cookies.GetCookie('UserId');
    cmdInsert.Execute();
  end
  else
  begin
    if cmdUpdate.Active then
      cmdUpdate.Active := False;
    cmdUpdate.ParamByName('pasien_id').AsString := edPasienId.Text;
    cmdUpdate.ParamByName('tanggal').AsString :=
      FormatDateTime('yyyy-MM-dd HH:mm:ss', dtpWaktuAmbil.DateTime);
    cmdUpdate.ParamByName('catatan').AsString := mmIsiCatatan.Lines.Text;
    cmdUpdate.ParamByName('isi_user_id').AsString :=
      UniApplication.Cookies.GetCookie('UserId');
    cmdUpdate.ParamByName('id').AsInteger := qPending.FieldByName('id')
      .AsInteger;

    cmdUpdate.Execute();
  end;

  refreshData();
  btnCancelClick(self);

end;

procedure TfrmFOHomeService.UniDBGrid1CellClick(Column: TUniDBGridColumn);
begin
  mmCatatan.Lines.Text := qPending.FieldByName('catatan').AsString;
  mmAlamat.Lines.Text := qPending.FieldByName('alamat').AsString + Char(13) +
    'Telp. ' + qPending.FieldByName('telepon').AsString + Char(13) + 'Hp. ' +
    qPending.FieldByName('hp').AsString;

  btnSave.Caption := 'Save';
  edPasienId.Clear;
  edNama.Clear;
  edKelamin.Clear;
  edUmur.Clear;
  edAlamat.Clear;
  edTelepon.Clear;
  edNoReg.Clear;

  mmIsiCatatan.Lines.Clear;

  mmIsiCatatan.Enabled := False;
  dtpWaktuAmbil.Enabled := False;
  btnCancel.Enabled := False;
  btnSave.Enabled := False;
end;

procedure TfrmFOHomeService.UniDBGrid1SelectionChange(Sender: TObject);
begin
  if qPending.FieldByName('flg_ambil').AsString = 'Y' then
    btnAmbil.Enabled := False
  else
    btnAmbil.Enabled := True;
  if qPending.FieldByName('flg_proses').AsString = 'Y' then
    btnProses.Enabled := False
  else
    btnProses.Enabled := True;
end;

procedure TfrmFOHomeService.UniFormAfterShow(Sender: TObject);
var
  thn, bln, tgl: Word;
  sThn, sBln, Stgl: string;
begin
  decodeDate(now, thn, bln, tgl);
  sThn := IntToSTr(thn);
  if bln < 10 then
    sBln := '0' + IntToSTr(bln)
  else
    sBln := IntToSTr(bln);
  if tgl < 10 then
    Stgl := '0' + IntToSTr(tgl)
  else
    Stgl := IntToSTr(tgl);

  edTgl.Text := sThn + '-' + sBln + '-' + Stgl;
  btnCancelClick(self);
  refreshData();
end;

procedure TfrmFOHomeService.UniFormKeyDown(Sender: TObject; var Key: Word;
Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Close;
  if Key = VK_F1 then
    btnAddClick(self);
  if Key = VK_F2 then
    btnAmbilClick(self);
  if Key = VK_F3 then
    btnProsesClick(self);
end;

procedure TfrmFOHomeService.rbSemuaClick(Sender: TObject);
begin
  if rbSemua.Checked then
    edTgl.Enabled := False
  else
    edTgl.Enabled := True;
  refreshData();
end;

procedure TfrmFOHomeService.rbTglClick(Sender: TObject);
begin
  if rbTgl.Checked then
  begin
    edTgl.Enabled := True;
  end
  else
    edTgl.Enabled := False;
  refreshData();
end;

procedure TfrmFOHomeService.btnAddClick(Sender: TObject);
begin
  mmIsiCatatan.Enabled := True;
  dtpWaktuAmbil.Enabled := True;
  btnCariPasien.Enabled := True;
  btnCancel.Enabled := True;
  btnSave.Caption := 'Save';
  mmIsiCatatan.SetFocus;
end;

procedure TfrmFOHomeService.btnAmbilClick(Sender: TObject);
begin
  MessageDlg('Ambil Home Service ?', mtConfirmation, mbYesNo,
    procedure(Sender: TComponent; Res: Integer)
    begin
      case Res of
        mrYes:
          begin
            if cmdAmbil.Active then
              cmdAmbil.Active := False;
            cmdAmbil.ParamByName('user_id').AsString :=
              UniApplication.Cookies.GetCookie('UserId');
            cmdAmbil.ParamByName('id').AsString :=
              qPending.FieldByName('id').AsString;
            cmdAmbil.Execute();
            refreshData();;
          end;
      end;
    end);

end;

procedure TfrmFOHomeService.btnCancelClick(Sender: TObject);
begin
  mmCatatan.Clear;
  mmAlamat.Clear;
  edPasienId.Clear;
  edNama.Clear;
  edKelamin.Clear;
  edUmur.Clear;
  edAlamat.Clear;
  mmIsiCatatan.Clear;
  edTelepon.Clear;
  edNoReg.Clear;
  dtpWaktuAmbil.DateTime := now;
  mmIsiCatatan.Enabled := False;
  dtpWaktuAmbil.Enabled := False;
  btnCariPasien.Enabled := False;
  btnSave.Enabled := False;
  btnCancel.Enabled := True;
end;

end.
