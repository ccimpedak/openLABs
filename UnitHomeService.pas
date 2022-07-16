unit UnitHomeService;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniPanel, uniMemo, uniEdit,
  uniLabel, uniDateTimePicker, uniBasicGrid, uniDBGrid, uniButton,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.Comp.Client, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet;

type
  TfrmHomeService = class(TUniForm)
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
    UniButton2: TUniButton;
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
    procedure btnCariPasienClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure UniFormAfterShow(Sender: TObject);
    procedure UniButton2Click(Sender: TObject);
    procedure UniDBGrid1CellClick(Column: TUniDBGridColumn);
    procedure btnAddClick(Sender: TObject);
    procedure btnAmbilClick(Sender: TObject);
    procedure btnProsesClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnCetakClick(Sender: TObject);
    procedure UniFormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function frmHomeService: TfrmHomeService;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, UnitCariPasien, UnitPendaftaran, ServerModule,
  UnitReportDisplay;

procedure refreshData();
begin
  if frmHomeService.qPending.Active then
    frmHomeService.qPending.Active := False;
  frmHomeService.qPending.Active := True;
end;

function frmHomeService: TfrmHomeService;
begin
  Result := TfrmHomeService(UniMainModule.GetFormInstance(TfrmHomeService));
end;

procedure TfrmHomeService.btnCariPasienClick(Sender: TObject);
begin
  frmCariPasien.ShowModal();
  frmCariPasien.call_form := 'home_service';
end;

procedure TfrmHomeService.btnCetakClick(Sender: TObject);
var
  Result: string;
begin
  if qCetak.Active then
    qCetak.Active := False;

  qCetak.Active := True;

//  frxCetak.PrintOptions.ShowDialog := False;
//  frxCetak.ShowProgress := False;
//
//  frxCetak.EngineOptions.SilentMode := True;
//  frxCetak.EngineOptions.DestroyForms := False;
//
//  frxPDFExport1.Background := True;
//  frxPDFExport1.ShowProgress := False;
//  frxPDFExport1.ShowDialog := False;
//  frxPDFExport1.FileName := UniServerModule.NewCacheFileUrl(False, 'pdf', '',
//    '', Result, True);
//  frxPDFExport1.DefaultPath := '';
//
//  frxCetak.PreviewOptions.AllowEdit := False;
//  frxCetak.Variables['cetak'] := QuotedStr(UniApplication.Cookies.GetCookie('UserName'));
//  frxCetak.PrepareReport;
//  frxCetak.Export(frxPDFExport1);

  frmReportDisplay.UniURLFrame1.URL := Result;
  frmReportDisplay.ShowModal();


end;

procedure TfrmHomeService.btnDeleteClick(Sender: TObject);
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

procedure TfrmHomeService.btnProsesClick(Sender: TObject);
begin
  MessageDlg('Proses Home Service ?', mtConfirmation, mbYesNo,
    procedure(Sender: TComponent; Res: Integer)
    begin
      case Res of
        mrYes:
          begin
            frmPendaftaran.ShowModal();

            frmPendaftaran.edSubTotal.Text := '0';
            frmPendaftaran.edDiscount.Text := '0.00';
            frmPendaftaran.edDiscAmount.Text := '0';
            frmPendaftaran.edTotal.Text := '0';
            // show

            frmPendaftaran.call_form := 'home_service';
            frmPendaftaran.ShowModal();
            // pasien
            if QPasien.Active then
              QPasien.Active := False;
            QPasien.ParamByName('pasien_id').AsString :=
              qPending.FieldByName('pasien_id').AsString;
            QPasien.Active := True;

            // isi data pasien
            frmPendaftaran.edPasienId.Text :=
              QPasien.FieldByName('pasien_id').AsString;
            frmPendaftaran.edNama.Text := QPasien.FieldByName('nama').AsString;
            frmPendaftaran.edKelamin.Text :=
              QPasien.FieldByName('kelamin').AsString;
            frmPendaftaran.edUmur.Text := QPasien.FieldByName('umur').AsString;
            frmPendaftaran.edAlamat.Text :=
              QPasien.FieldByName('alamat').AsString;
            frmPendaftaran.edTelp.Text :=
              QPasien.FieldByName('telepon').AsString;
            frmPendaftaran.edHp.Text := QPasien.FieldByName('hp').AsString;
            frmPendaftaran.edPatientID.Text :=
              QPasien.FieldByName('noreg').AsString;
            frmPendaftaran.edJenisKelaminId.Text :=
              QPasien.FieldByName('jenis_kelamin_id').AsString;
          end;
      end;
    end);
end;

procedure TfrmHomeService.UniButton2Click(Sender: TObject);
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
  if cmdInsert.Active then
    cmdInsert.Active := False;
  cmdInsert.ParamByName('pasien_id').AsString := edPasienId.Text;
  cmdInsert.ParamByName('tanggal').AsString :=
    FormatDateTime('yyyy-MM-dd HH:mm:ss', dtpWaktuAmbil.DateTime);
  cmdInsert.ParamByName('catatan').AsString := mmIsiCatatan.Lines.Text;
  cmdInsert.ParamByName('isi_user_id').AsString :=
    UniApplication.Cookies.GetCookie('UserId');
  cmdInsert.Execute();
  refreshData();
  btnCancelClick(self);

end;

procedure TfrmHomeService.UniDBGrid1CellClick(Column: TUniDBGridColumn);
begin
  mmCatatan.Lines.Text := qPending.FieldByName('catatan').AsString;
  mmAlamat.Lines.Text := qPending.FieldByName('alamat').AsString + char(13) +
    'Telp. ' + qPending.FieldByName('telepon').AsString + char(13) + 'Hp. ' +
    qPending.FieldByName('hp').AsString;
end;

procedure TfrmHomeService.UniFormAfterShow(Sender: TObject);
begin
  btnCancelClick(self);
  refreshData();
end;

procedure TfrmHomeService.UniFormKeyDown(Sender: TObject; var Key: Word;
Shift: TShiftState);
begin
  if Key = VK_F1 then
    btnAddClick(self);
  if Key = VK_F2 then
    btnAmbilClick(self);
  if Key = VK_F3 then
    btnProsesClick(self);
  if Key = VK_F4 then
    btnCariPasienClick(self);
  if Key = VK_F6 then
    btnCetakClick(self);
  if Key = VK_F7 then
    btnDeleteClick(self);
  if Key = VK_ESCAPE then
    Close;
end;

procedure TfrmHomeService.btnAddClick(Sender: TObject);
begin
  mmIsiCatatan.SetFocus;
end;

procedure TfrmHomeService.btnAmbilClick(Sender: TObject);
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

procedure TfrmHomeService.btnCancelClick(Sender: TObject);
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
end;

end.
