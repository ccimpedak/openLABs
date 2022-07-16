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
  uniMultiItem, uniComboBox, uniDBComboBox, uniDBLookupComboBox, uniBitBtn,
  uniSpeedButton, uniCheckBox, uniMemo, uniGroupBox, uniPageControl;

type
  TfrmAdmTest = class(TUniForm)
    UniContainerPanel1: TUniContainerPanel;
    UniDBGrid1: TUniDBGrid;
    UniContainerPanel3: TUniContainerPanel;
    edCariNama: TUniEdit;
    QTubes: TFDQuery;
    DSTubes: TDataSource;
    UniContainerPanel7: TUniContainerPanel;
    cmdExec: TFDCommand;
    UniContainerPanel2: TUniContainerPanel;
    UniLabel1: TUniLabel;
    edNama: TUniEdit;
    UniLabel3: TUniLabel;
    QCek: TFDQuery;
    btnHapus: TUniSpeedButton;
    QTest: TFDQuery;
    DSTest: TDataSource;
    UniSpeedButton1: TUniSpeedButton;
    btnSave: TUniSpeedButton;
    btnHarga: TUniSpeedButton;
    QConTest: TFDQuery;
    dsCon: TDataSource;
    pcAddConf: TUniPageControl;
    tsGeneral: TUniTabSheet;
    tsConTest: TUniTabSheet;
    UniGroupBox1: TUniGroupBox;
    UniContainerPanel4: TUniContainerPanel;
    UniSpeedButton2: TUniSpeedButton;
    UniSpeedButton3: TUniSpeedButton;
    UniDBGrid2: TUniDBGrid;
    UniLabel2: TUniLabel;
    cbTube: TUniDBLookupComboBox;
    UniLabel4: TUniLabel;
    edAbbr: TUniEdit;
    cbConfidential: TUniCheckBox;
    edKode: TUniEdit;
    procedure UniFormBeforeShow(Sender: TObject);
    procedure edCariNamaChange(Sender: TObject);
    procedure UniDBGrid1CellClick(Column: TUniDBGridColumn);
    procedure UniButton3Click(Sender: TObject);
    procedure UniButton2Click(Sender: TObject);
    procedure btnHapusClick(Sender: TObject);
    procedure UniSpeedButton1Click(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnHargaClick(Sender: TObject);
    procedure UniSpeedButton2Click(Sender: TObject);
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
  MainModule, uniGUIApplication, UnitHarga, UnitSelTest;

procedure TfrmAdmTest.btnHargaClick(Sender: TObject);
begin
  frmHarga.test_id := QTest.FieldByName('id').AsInteger;
  frmHarga.ShowModal;
end;

procedure TfrmAdmTest.btnSaveClick(Sender: TObject);
var
  confidential: Integer;
begin

  confidential := 0;

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
  // if edHarga.Text = '' then
  // begin
  // ShowMessage('Harga tidak boleh kosong.');
  // edHarga.SetFocus;
  // exit;
  // end;

  if cbTube.Text = '' then
  begin
    ShowMessage('Specimen tidak boleh kosong.');
    cbTube.SetFocus;
    exit;
  end;

  // if edAbbr.Text = '' then
  // begin
  // ShowMessage('Abbreviation tidak boleh kosong.');
  // edAbbr.SetFocus;
  // exit;
  // end;

  if btnSave.Caption = 'Simpan' then
  begin
    if QCek.Active then
      QCek.Active := False;
    QCek.ParamByName('kode').Value := edKode.Text;
    QCek.ParamByName('organisasi_id').Value := UniApplication.Cookies.GetCookie
      ('OrganisasiId');
    QCek.Active := True;
    if QCek.RecordCount > 0 then
    begin
      ShowMessage('Kode test sudah terpakai [' + QCek.FieldByName('nama')
        .AsString + ']');
      edKode.SetFocus;
      exit;
    end;
    // add new test
    if cmdExec.Active then
      cmdExec.Active := False;
    cmdExec.Params.Clear;
    cmdExec.Params.Add.Name := 'kode';
    cmdExec.Params.Add.Name := 'nama';
    cmdExec.Params.Add.Name := 'organisasi_id';
    cmdExec.CommandText.Text :=
      'INSERT INTO test (id,kode,nama,organisasi_id) VALUES (:kode,:kode,:nama,:organisasi_id)';
    cmdExec.ParamByName('kode').Value := edKode.Text;
    cmdExec.ParamByName('nama').Value := edNama.Text;
    cmdExec.ParamByName('organisasi_id').Value :=
      UniApplication.Cookies.GetCookie('OrganisasiId');
    cmdExec.execute();
  end;

  // ShowMessage(QTubes.FieldByName('id').AsString);
  // exit;

  if cbConfidential.Checked then
    confidential := 1;

  if cmdExec.Active then
    cmdExec.Active := False;
  cmdExec.Params.Clear;
  // // cmdExec.Params.Add.Name := 'id';
  cmdExec.Params.Add.Name := 'kode';
  cmdExec.Params.Add.Name := 'nama';
  // // cmdExec.Params.Add.Name := 'harga';
  cmdExec.Params.Add.Name := 'tube_id';
  cmdExec.Params.Add.Name := 'abbreviation';
  cmdExec.Params.Add.Name := 'flg_confidential';
  cmdExec.Params.Add.Name := 'organisasi_id';
  // cmdExec.ParamByName('id').Value := edKode.Value;

  // cmdExec.CommandText.Text :=
  // 'delete from test where kode = :kode and organisasi_id = :organisasi_id; insert into test(kode,nama,cetak_nota,ada_harga,tube_id,abbreviation,flg_confidential,organisasi_id) values (:kode,:nama,'
  // + QuotedStr('Y') + ',' + QuotedStr('Y') +
  // ',:tube_id,:abbreviation,:flg_confidential,:organisasi_id); ';
  // cmdExec.CommandText.Text := '';
  // cmdExec.CommandText.Text :=
  // 'update test set tube_id = :tube_id, abbreviation = :abbreviation, nama = :nama, flg_confidential = :flg_confidential where kode = :kode and organisasi_id = :organisasi_id';
  // cmdExec.Prepare();

  cmdExec.CommandText.Text :=
    'update test set tube_id = :tube_id, abbreviation = :abbreviation, nama = :nama, flg_confidential = :flg_confidential where kode = :kode and organisasi_id = :organisasi_id';

  cmdExec.ParamByName('kode').Value := edKode.Text;
  cmdExec.ParamByName('nama').Value := edNama.Text;
  // cmdExec.ParamByName('harga').Value := edHarga.Value;
  cmdExec.ParamByName('tube_id').Value := QTubes.FieldByName('id').AsString;
  cmdExec.ParamByName('abbreviation').Value := edAbbr.Text;
  cmdExec.ParamByName('flg_confidential').Value := confidential;
  cmdExec.ParamByName('organisasi_id').Value := UniApplication.Cookies.GetCookie
    ('OrganisasiId');

  // ShowMessage(cmdExec.CommandText.Text);
  cmdExec.execute();
  LoadView;
  QTest.Refresh;
  DisplayValue;
end;

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
        cmdExec.execute();
        LoadView;
        DisplayValue;
      end;
  end;
end;

procedure TfrmAdmTest.btnHapusClick(Sender: TObject);
begin
  MessageDlg('Hapus : (' + QTest.FieldByName('kode').AsString + '|' +
    QTest.FieldByName('nama').AsString + '|' + QTest.FieldByName('harga')
    .AsString + ') ?', mtConfirmation, mbYesNo, DeleteHargaCallback);

end;

procedure TfrmAdmTest.DisplayValue();
begin

  if QTest.RecordCount > 0 then
  begin
    btnSave.Caption := 'Update';
    edKode.Text := QTest.FieldByName('kode').AsString;
    edNama.Text := QTest.FieldByName('nama').AsString;
    // edHarga.Value := QTest.FieldByName('harga').AsInteger;
    cbTube.ItemIndex := cbTube.Items.IndexOf(QTest.FieldByName('tube')
      .AsString);
    edAbbr.Text := QTest.FieldByName('abbreviation').AsString;
    cbConfidential.Checked := False;
    if QTest.FieldByName('flg_confidential').AsInteger > 0 then
      cbConfidential.Checked := True;

    if QConTest.Active then
      QConTest.Active := False;
    QConTest.ParamByName('test_id').Value := QTest.FieldByName('id').AsString;
    QConTest.Active := True;

    pcAddConf.ActivePage := tsGeneral;
  end;

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
  QTest.ParamByName('organisasi_id').Value := UniApplication.Cookies.GetCookie
    ('OrganisasiId');
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
  // edHarga.Text := '';
  edAbbr.Text := '';
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
  if QTubes.Active then
    QTubes.Active := False;
  QTubes.ParamByName('organisasi_id').Value := UniApplication.Cookies.GetCookie
    ('OrganisasiId');
  QTubes.Active := True;

  // frmAdmTest.Caption := UniApplication.Cookies.GetCookie('OrganisasiId');
end;

procedure TfrmAdmTest.UniSpeedButton1Click(Sender: TObject);
begin
  btnSave.Caption := 'Simpan';
  edKode.Text := '';
  edNama.Text := '';
  // edHarga.Text := '';
  edAbbr.Text := '';
  edKode.SetFocus;
end;

procedure TfrmAdmTest.UniSpeedButton2Click(Sender: TObject);
begin
  frmSelTest.exclude := QTest.FieldByName('id').AsInteger;
  frmSelTest.parent_test_id := QTest.FieldByName('id').AsInteger;
  frmSelTest.ShowModal;
end;

end.
