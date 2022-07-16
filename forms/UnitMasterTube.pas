unit UnitMasterTube;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uniLabel, uniButton, uniBitBtn,
  uniSpeedButton, uniEdit, uniBasicGrid, uniDBGrid, uniGUIBaseClasses, uniPanel,
  uniMultiItem, uniComboBox, uniDBComboBox, uniDBLookupComboBox;

type
  TfrmMasterTube = class(TUniForm)
    UniContainerPanel1: TUniContainerPanel;
    UniDBGrid1: TUniDBGrid;
    UniContainerPanel3: TUniContainerPanel;
    edCariNama: TUniEdit;
    UniContainerPanel7: TUniContainerPanel;
    btnHapus: TUniSpeedButton;
    UniSpeedButton1: TUniSpeedButton;
    UniContainerPanel2: TUniContainerPanel;
    UniLabel1: TUniLabel;
    edNama: TUniEdit;
    UniLabel3: TUniLabel;
    btnSave: TUniSpeedButton;
    edKode: TUniEdit;
    cmdExec: TFDCommand;
    QCek: TFDQuery;
    QTube: TFDQuery;
    DSTube: TDataSource;
    UniLabel2: TUniLabel;
    edPrintQty: TUniNumberEdit;
    UniLabel4: TUniLabel;
    cbSpecimen: TUniDBLookupComboBox;
    UniLabel5: TUniLabel;
    edSuffix: TUniEdit;
    QSpecimen: TFDQuery;
    DSSpecimen: TDataSource;
    procedure btnSaveClick(Sender: TObject);
    procedure btnHapusClick(Sender: TObject);
    procedure UniSpeedButton1Click(Sender: TObject);
    procedure UniDBGrid1CellClick(Column: TUniDBGridColumn);
    procedure UniFormShow(Sender: TObject);
    procedure UniFormBeforeShow(Sender: TObject);
  private
    { Private declarations }
    procedure DeleteTubeCallback(Sender: TComponent; Res: Integer);
    procedure DisplayValue();
    procedure edCariNamaChange(Sender: TObject);
    procedure LoadView();
  public
    { Public declarations }
  end;

function frmMasterTube: TfrmMasterTube;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function frmMasterTube: TfrmMasterTube;
begin
  Result := TfrmMasterTube(UniMainModule.GetFormInstance(TfrmMasterTube));
end;

procedure TfrmMasterTube.DeleteTubeCallback(Sender: TComponent; Res: Integer);
begin
  case Res of
    mrYes:
      begin
        if cmdExec.Active then
          cmdExec.Active := False;
        cmdExec.Params.Clear;
        cmdExec.Params.Add.Name := 'id';
        cmdExec.ParamByName('id').Value := QTube.FieldByName('id').AsInteger;
        cmdExec.CommandText.Text := ' delete from tubes where id = :id;';
        cmdExec.Execute();
        LoadView;
        DisplayValue;
      end;
  end;
end;

procedure TfrmMasterTube.btnHapusClick(Sender: TObject);
begin
  MessageDlg('Hapus : (' + QTube.FieldByName('kode').AsString + '|' +
    QTube.FieldByName('nama').AsString + ') ?', mtConfirmation, mbYesNo,
    DeleteTubeCallback);
end;

procedure TfrmMasterTube.btnSaveClick(Sender: TObject);
begin
  if edKode.Text = '' then
  begin
    ShowMessage('Kode tidak boleh kosong.');
    edKode.SetFocus;
    exit;
  end;
  if edNama.Text = '' then
  begin
    ShowMessage('Nama tidak boleh kosong.');
    edNama.SetFocus;
    exit;
  end;

  cmdExec.Params.Clear;
  cmdExec.Params.Add.Name := 'kode';
  cmdExec.Params.Add.Name := 'nama';
  cmdExec.Params.Add.Name := 'print_qty';
  cmdExec.Params.Add.Name := 'specimen_id';
  cmdExec.Params.Add.Name := 'suffix';
  cmdExec.Params.Add.Name := 'organisasi_id';

  if btnSave.Caption = 'Simpan' then
  begin
    if QCek.Active then
      QCek.Active := False;
    QCek.ParamByName('kode').Value := edKode.Text;
    QCek.Active := True;
    if QCek.RecordCount > 0 then
    begin
      ShowMessage('Kode tube sudah terpakai [' + QCek.FieldByName('nama')
        .AsString + ']');
      edKode.SetFocus;
      exit;
    end;
    cmdExec.CommandText.Text :=
      ' insert into tubes (kode,nama,print_qty,specimen_id,suffix,organisasi_id) values (:kode,:nama,:print_qty,:specimen_id,:suffix,:organisasi_id)';
  end
  else
  begin
    cmdExec.Params.Add.Name := 'id';
    cmdExec.ParamByName('id').Value := QTube.FieldByName('id').AsInteger;
    // update
    cmdExec.CommandText.Text :=
      ' update tubes set kode = :kode, nama = :nama, print_qty = :print_qty,specimen_id=:specimen_id,suffix=:suffix where id = :id and organisasi_id = :organisasi_id ';

  end;

  if cmdExec.Active then
    cmdExec.Active := False;
  cmdExec.ParamByName('kode').Value := edKode.Text;
  cmdExec.ParamByName('nama').Value := edNama.Text;
  cmdExec.ParamByName('print_qty').Value := edPrintQty.Value;
  cmdExec.ParamByName('specimen_id').Value := QSpecimen.FieldByName('id')
    .AsInteger;
  cmdExec.ParamByName('suffix').Value := edSuffix.Text;
  cmdExec.ParamByName('organisasi_id').Value := UniApplication.Cookies.GetCookie
    ('OrganisasiId');

  cmdExec.Execute();

  LoadView;
  DisplayValue;
end;

procedure TfrmMasterTube.DisplayValue();
begin
  if QTube.RecordCount > 0 then
  begin
    btnSave.Caption := 'Update';
    edKode.Text := QTube.FieldByName('kode').AsString;
    edNama.Text := QTube.FieldByName('nama').AsString;
    cbSpecimen.ItemIndex := cbSpecimen.Items.IndexOf
      (QTube.FieldByName('specimen').AsString);
    edSuffix.Text := QTube.FieldByName('suffix').AsString;
    edPrintQty.Value := QTube.FieldByName('print_qty').AsInteger;
  end;
end;

procedure TfrmMasterTube.edCariNamaChange(Sender: TObject);
begin
  LoadView;
end;

procedure TfrmMasterTube.LoadView();
begin
  if QTube.Active then
    QTube.Active := False;
  QTube.ParamByName('nama').Value := '%' + edCariNama.Text + '%';
  QTube.ParamByName('organisasi_id').Value := UniApplication.Cookies.GetCookie
    ('OrganisasiId');
  QTube.Active := True;
end;

procedure TfrmMasterTube.UniDBGrid1CellClick(Column: TUniDBGridColumn);
begin
  DisplayValue();
end;

procedure TfrmMasterTube.UniFormBeforeShow(Sender: TObject);
begin
  edCariNama.Clear;
  LoadView();
  DisplayValue();
  if QSpecimen.Active then
    QSpecimen.Active := False;

  QSpecimen.ParamByName('organisasi_id').Value :=
    UniApplication.Cookies.GetCookie('OrganisasiId');
  QSpecimen.Active := True;
end;

procedure TfrmMasterTube.UniFormShow(Sender: TObject);
begin
  if QSpecimen.Active then
    QSpecimen.Active := False;
  QSpecimen.ParamByName('organisasi_id').Value :=
    UniApplication.Cookies.GetCookie('OrganisasiId');
  QSpecimen.Active := True;
end;

procedure TfrmMasterTube.UniSpeedButton1Click(Sender: TObject);
begin
  btnSave.Caption := 'Simpan';
  edKode.Text := '';
  edNama.Text := '';
  cbSpecimen.Text := '';
  edSuffix.Text := '';
  edPrintQty.Value := 1;
  edKode.SetFocus;
end;

end.
