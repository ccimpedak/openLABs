unit UnitMasterSpecimen;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.Client,
  Data.DB, FireDAC.Comp.DataSet, uniMultiItem, uniComboBox, uniDBComboBox,
  uniDBLookupComboBox, uniEdit, uniLabel, uniButton, uniBitBtn, uniSpeedButton,
  uniBasicGrid, uniDBGrid, uniGUIBaseClasses, uniPanel;

type
  TfrmMasterSpecimen = class(TUniForm)
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
    cmdExec: TFDCommand;
    QCek: TFDQuery;
    QSpecimen: TFDQuery;
    DSSpecimen: TDataSource;
    edKode: TUniEdit;
    procedure UniSpeedButton1Click(Sender: TObject);
    procedure btnHapusClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure UniDBGrid1CellClick(Column: TUniDBGridColumn);
    procedure UniFormBeforeShow(Sender: TObject);
  private
    { Private declarations }
    procedure DeleteSpecimenCallback(Sender: TComponent; Res: Integer);
    procedure DisplayValue();
    procedure edCariNamaChange(Sender: TObject);
    procedure LoadView();
  public
    { Public declarations }

  end;

function frmMasterSpecimen: TfrmMasterSpecimen;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function frmMasterSpecimen: TfrmMasterSpecimen;
begin
  Result := TfrmMasterSpecimen(UniMainModule.GetFormInstance
    (TfrmMasterSpecimen));
end;

procedure TfrmMasterSpecimen.btnHapusClick(Sender: TObject);
begin
  MessageDlg('Hapus : (' + QSpecimen.FieldByName('kode').AsString + '|' +
    QSpecimen.FieldByName('nama').AsString + ') ?', mtConfirmation, mbYesNo,
    DeleteSpecimenCallback);
end;

procedure TfrmMasterSpecimen.btnSaveClick(Sender: TObject);
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

  if btnSave.Caption = 'Simpan' then
  begin
    if QCek.Active then
      QCek.Active := False;
    QCek.ParamByName('kode').Value := edKode.Text;
    QCek.Active := True;
    if QCek.RecordCount > 0 then
    begin
      ShowMessage('Kode specimen sudah terpakai [' + QCek.FieldByName('nama')
        .AsString + ']');
      edKode.SetFocus;
      exit;
    end;
    cmdExec.CommandText.Text :=
      ' insert into specimen (kode,nama,organisasi_id) values (:kode,:nama,:organisasi_id)';
  end
  else
  begin
    cmdExec.Params.Add.Name := 'id';
    cmdExec.ParamByName('id').Value := QSpecimen.FieldByName('id').AsInteger;
    // update
    cmdExec.CommandText.Text :=
      ' update specimen set kode = :kode, nama = :nama where id = :id ';
  end;

  if cmdExec.Active then
    cmdExec.Active := False;
  cmdExec.ParamByName('kode').Value := edKode.Text;
  cmdExec.ParamByName('nama').Value := edNama.Text;
  cmdExec.ParamByName('organisasi_id').Value := UniApplication.Cookies.GetCookie
    ('OrganisasiId');

  cmdExec.Execute();

  LoadView;
  DisplayValue;
end;

procedure TfrmMasterSpecimen.DeleteSpecimenCallback(Sender: TComponent;
  Res: Integer);
begin
  case Res of
    mrYes:
      begin
        if cmdExec.Active then
          cmdExec.Active := False;
        cmdExec.Params.Clear;
        cmdExec.Params.Add.Name := 'id';
        cmdExec.ParamByName('id').Value := QSpecimen.FieldByName('id')
          .AsInteger;
        cmdExec.CommandText.Text := ' delete from specimen where id = :id;';
        cmdExec.Execute();
        LoadView;
        DisplayValue;
      end;
  end;
end;

procedure TfrmMasterSpecimen.DisplayValue();
begin
  if QSpecimen.RecordCount > 0 then
  begin
    btnSave.Caption := 'Update';
    edKode.Text := QSpecimen.FieldByName('kode').AsString;
    edNama.Text := QSpecimen.FieldByName('nama').AsString;
  end;
end;

procedure TfrmMasterSpecimen.edCariNamaChange(Sender: TObject);
begin
  LoadView;
end;

procedure TfrmMasterSpecimen.LoadView();
begin
  if QSpecimen.Active then
    QSpecimen.Active := False;
  QSpecimen.ParamByName('nama').Value := '%' + edCariNama.Text + '%';
  QSpecimen.ParamByName('organisasi_id').Value :=
    UniApplication.Cookies.GetCookie('OrganisasiId');
  QSpecimen.Active := True;
end;

procedure TfrmMasterSpecimen.UniDBGrid1CellClick(Column: TUniDBGridColumn);
begin
  DisplayValue();
end;

procedure TfrmMasterSpecimen.UniFormBeforeShow(Sender: TObject);
begin
  edCariNama.Clear;
  LoadView();
  DisplayValue();
  QSpecimen.Open();
end;

procedure TfrmMasterSpecimen.UniSpeedButton1Click(Sender: TObject);
begin
  btnSave.Caption := 'Simpan';
  edKode.Text := '';
  edNama.Text := '';
  edKode.SetFocus;
end;

end.
