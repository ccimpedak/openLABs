unit UnitKDayList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniGUIBaseClasses, uniPanel, uniSplitter,
  uniBasicGrid, uniDBGrid, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Menus, uniMainMenu, uniButton;

type
  TUniKDayList = class(TUniFrame)
    pnlMenuHeader: TUniContainerPanel;
    pnlHeader: TUniContainerPanel;
    grdHeader: TUniDBGrid;
    UniSplitter1: TUniSplitter;
    pnlDetail: TUniContainerPanel;
    grdDtl: TUniDBGrid;
    QHeader: TFDQuery;
    DSHeader: TDataSource;
    QDtl: TFDQuery;
    DSDtl: TDataSource;
    popHdr: TUniPopupMenu;
    kriteriapencarian1: TUniMenuItem;
    popDtl: TUniPopupMenu;
    pmTechVal: TUniMenuItem;
    pmRerunTest: TUniMenuItem;
    cmdTechVal: TFDCommand;
    cmdRerunTest: TFDCommand;
    Reloadtable1: TUniMenuItem;
    Reloadtable2: TUniMenuItem;
    procedure grdHeaderCellContextClick(Column: TUniDBGridColumn;
      X, Y: Integer);
    procedure grdDtlKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure grdHeaderMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure kriteriapencarian1Click(Sender: TObject);
    procedure grdDtlMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure pmTechValClick(Sender: TObject);
    procedure popDtlPopup(Sender: TObject);
    procedure pmRerunTestClick(Sender: TObject);
    procedure UniFrameBeforeReady(Sender: TObject);
    procedure Reloadtable1Click(Sender: TObject);
    procedure Reloadtable2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses MainModule, UnitCariOrder, UnitIsiHasil;

procedure TUniKDayList.pmRerunTestClick(Sender: TObject);
begin
  if cmdRerunTest.Active then
    cmdRerunTest.Active := False;
  cmdRerunTest.ParamByName('id').Value :=
    QDtl.FieldByName('order_detail_result_id').AsInteger;
  cmdRerunTest.Execute();
  if QDtl.Active then
    QDtl.Active := False;
  QDtl.Active := True;
end;

procedure TUniKDayList.pmTechValClick(Sender: TObject);
begin
  if QDtl.FieldByName('hasil').AsString <> '' then
  begin
    if cmdTechVal.Active then
      cmdTechVal.Active := False;
    cmdTechVal.ParamByName('val_teknis_oleh').Value :=
      UniApplication.Cookies.GetCookie('UserId');
    cmdTechVal.ParamByName('id').Value :=
      QDtl.FieldByName('order_detail_result_id').AsInteger;
    cmdTechVal.Execute();
    if QDtl.Active then
      QDtl.Active := False;
    QDtl.Active := True;
  end
  else
    ShowMessage('Hasil masih kosong. teken ENTER untuk isi hasil.');
end;

procedure TUniKDayList.grdDtlKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    if QDtl.RecordCount > 0 then
    begin
      frmIsiHasil.caller_form := 'UnitKDayList';
      frmIsiHasil.order_detail_id := QDtl.FieldByName('id').AsInteger;
      frmIsiHasil.lbNamaTest.Caption := QDtl.FieldByName('nama_test').AsString;
      frmIsiHasil.cbHasil.Text := QDtl.FieldByName('hasil').AsString;
      frmIsiHasil.HasilAsli := QDtl.FieldByName('hasil').AsString;
      frmIsiHasil.ShowModal;
    end;
end;

procedure TUniKDayList.grdDtlMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbRight then
    if QDtl.RecordCount > 0 then
      popDtl.Popup(X, Y, grdDtl);
end;

procedure TUniKDayList.grdHeaderCellContextClick(Column: TUniDBGridColumn;
  X, Y: Integer);
begin
  popHdr.Popup(X, Y, grdHeader);
end;

procedure TUniKDayList.grdHeaderMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbRight then
    popHdr.Popup(X, Y, grdHeader);
end;

procedure TUniKDayList.kriteriapencarian1Click(Sender: TObject);
begin
  frmCariOrder.ShowModal();
end;

procedure TUniKDayList.popDtlPopup(Sender: TObject);
begin
  pmTechVal.Enabled := True;
  pmRerunTest.Enabled := True;
  if QDtl.FieldByName('val_teknis').AsInteger > 0 then
    pmTechVal.Enabled := False;
  if QDtl.FieldByName('hasil').AsString = '' then
    pmRerunTest.Enabled := False;

end;

procedure TUniKDayList.Reloadtable1Click(Sender: TObject);
begin
  if QHeader.Active then
    QHeader.Active := False;
  QHeader.Active := True;

end;

procedure TUniKDayList.Reloadtable2Click(Sender: TObject);
begin
  if QDtl.Active then
    QDtl.Active := False;
  QDtl.Active := True;

end;

procedure TUniKDayList.UniFrameBeforeReady(Sender: TObject);
var
  sSQL: string;
begin
  sSQL := 'SELECT oh.id,date(oh.tanggal) tanggal,oh.nomor,p.noreg,p.nama,p.tanggal_lahir,jk.nama jenis_kelamin,tp.nama tipe_pasien, '
    + 'ap.nama asal_pasien, anp.nama ansuransi_pasien,d.nama dokter,oh.tanggal tanggal_dt '
    + 'FROM order_header oh ' + 'LEFT JOIN pasien p ON oh.pasien_id = p.id ' +
    'LEFT JOIN jenis_kelamin jk ON p.jenis_kelamin_id = jk.id ' +
    'LEFT JOIN tipe_pasien tp ON oh.tipe_pasien_id = tp.id ' +
    'LEFT JOIN asal_pasien ap ON oh.asal_pasien_id = ap.id ' +
    'LEFT JOIN ansuransi_pasien anp ON oh.ansuransi_pasien_id = anp.id ' +
    'LEFT JOIN dokter d ON oh.dokter_id = d.id ';

  sSQL := sSQL + 'WHERE oh.tanggal between ' +
    QuotedStr(FormatDateTime('YYYY-MM-DD 00:00:00', now)) + ' and ' +
    QuotedStr(FormatDateTime('YYYY-MM-DD 23:59:59', now)) +
    ' and  oh.organisasi_id = ' + UniApplication.Cookies.GetCookie
    ('OrganisasiId') + ' and  oh.lokasi_id = ' +
    UniApplication.Cookies.GetCookie('LokasiId');

  // ShowMessage(sSQL);
  // exit;

  if QHeader.Active then
    QHeader.Active := False;
  QHeader.SQL.Text := sSQL;
  QHeader.Active := True;

  if QDtl.Active then
    QDtl.Active := False;
  QDtl.Active := True;
end;

initialization

RegisterClass(TUniKDayList);

end.
