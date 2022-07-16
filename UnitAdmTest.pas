unit UnitAdmTest;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniEdit, uniBasicGrid, uniDBGrid,
  uniGUIBaseClasses, uniPanel, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uniButton, uniLabel,
  uniMultiItem, uniComboBox, uniDBComboBox, uniDBLookupComboBox;

type
  TfrmAdmTest = class(TUniForm)
    UniContainerPanel1: TUniContainerPanel;
    UniDBGrid1: TUniDBGrid;
    UniContainerPanel3: TUniContainerPanel;
    edCariNama: TUniEdit;
    QTest: TFDQuery;
    DSTest: TDataSource;
    UniContainerPanel7: TUniContainerPanel;
    UniButton2: TUniButton;
    UniButton3: TUniButton;
    cmdExec: TFDCommand;
    UniContainerPanel2: TUniContainerPanel;
    UniLabel1: TUniLabel;
    edKode: TUniNumberEdit;
    edNama: TUniEdit;
    btnSave: TUniButton;
    UniLabel6: TUniLabel;
    edHarga: TUniNumberEdit;
    UniLabel3: TUniLabel;
    QCek: TFDQuery;
    procedure UniFormBeforeShow(Sender: TObject);
    procedure edCariNamaChange(Sender: TObject);
    procedure UniDBGrid1CellClick(Column: TUniDBGridColumn);
    procedure UniButton3Click(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure UniButton2Click(Sender: TObject);
  private
    { Private declarations }
    procedure LoadView();
    procedure DisplayValue();
    procedure DeleteHargaCallback(Sender: TComponent; Res: Integer);
  public
    { Public declarations }
  end;

function frmAdmTest: TfrmAdmTest;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

procedure TfrmAdmTest.DeleteHargaCallback(Sender: TComponent; Res: Integer);
begin
  case Res of
    mrYes:
      begin
        if cmdExec.Active then
          cmdExec.Active := False;
        cmdExec.Params.Clear;
        cmdExec.Params.Add.Name := 'id';
        cmdExec.ParamByName('id').Value := QTest.FieldByName('id').AsInteger;
        cmdExec.CommandText.Text :=
          ' delete from harga where test_id = :id; delete from test where id = :id ;';
        cmdExec.Execute();
        LoadView;
        DisplayValue;
      end;
  end;
end;

procedure TfrmAdmTest.btnSaveClick(Sender: TObject);
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
  if edHarga.Text = '' then
  begin
    ShowMessage('Harga tidak boleh kosong.');
    edHarga.SetFocus;
    exit;
  end;

  if btnSave.Caption = 'Simpan' then
  begin
    if QCek.Active then
      QCek.Active := False;
    QCek.ParamByName('kode').Value := edKode.Text;
    QCek.Active := True;
    if QCek.RecordCount > 0 then
    begin
      ShowMessage('Kode test sudah terpakai [' + QCek.FieldByName('nama')
        .AsString + ']');
      edKode.SetFocus;
      exit;
    end;
  end;

  if cmdExec.Active then
    cmdExec.Active := False;
  cmdExec.Params.Clear;
  cmdExec.Params.Add.Name := 'id';
  cmdExec.Params.Add.Name := 'kode';
  cmdExec.Params.Add.Name := 'nama';
  cmdExec.Params.Add.Name := 'harga';
  cmdExec.ParamByName('id').Value := edKode.Value;
  cmdExec.ParamByName('kode').Value := edKode.Value;
  cmdExec.ParamByName('nama').Value := edNama.Text;
  cmdExec.ParamByName('harga').Value := edHarga.Value;

  cmdExec.CommandText.Text :=
    'delete from test where kode = :kode; insert into test(id,kode,nama,cetak_nota,ada_harga) values (:id,:kode,:nama,'
    + QuotedStr('Y') + ',' + QuotedStr('Y') + '); ' +
    ' delete from harga where test_id = :id; insert into harga(test_id,tipe_pasien_id, urgency_id, harga)values(:id, 1, 1, :harga);';

  cmdExec.Execute();

  LoadView;
  DisplayValue;

end;

procedure TfrmAdmTest.DisplayValue();
begin
  btnSave.Caption := 'Update';
  edKode.Value := QTest.FieldByName('kode').AsInteger;
  edNama.Text := QTest.FieldByName('nama').AsString;
  edHarga.Value := QTest.FieldByName('harga').AsInteger;
end;

procedure TfrmAdmTest.edCariNamaChange(Sender: TObject);
begin
  LoadView;
end;

procedure TfrmAdmTest.LoadView();
begin
  if QTest.Active then
    QTest.Active := False;
  QTest.ParamByName('nama').Value := '%' + edCariNama.Text + '%';
  QTest.Active := True;

end;

function frmAdmTest: TfrmAdmTest;
begin
  Result := TfrmAdmTest(UniMainModule.GetFormInstance(TfrmAdmTest));
end;

procedure TfrmAdmTest.UniButton2Click(Sender: TObject);
begin
  MessageDlg('Hapus : (' + QTest.FieldByName('kode').AsString + '|' +
    QTest.FieldByName('nama').AsString + '|' + QTest.FieldByName('harga')
    .AsString + ') ?', mtConfirmation, mbYesNo, DeleteHargaCallback);

end;

procedure TfrmAdmTest.UniButton3Click(Sender: TObject);
begin
  btnSave.Caption := 'Simpan';
  edKode.Text := '';
  edNama.Text := '';
  edHarga.Text := '';
  edKode.SetFocus;
end;

procedure TfrmAdmTest.UniDBGrid1CellClick(Column: TUniDBGridColumn);
begin
  DisplayValue();
end;

procedure TfrmAdmTest.UniFormBeforeShow(Sender: TObject);
begin
  edCariNama.Clear;
  LoadView();
  DisplayValue();
end;

end.
