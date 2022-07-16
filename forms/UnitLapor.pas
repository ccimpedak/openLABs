unit UnitLapor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniButton, uniMemo, uniEdit, uniGUIBaseClasses,
  uniLabel, uniDBText, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.Comp.Client, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, uniBasicGrid, uniStringGrid, uniDateTimePicker;

type
  TfrmLapor = class(TUniForm)
    UniLabel1: TUniLabel;
    UniLabel2: TUniLabel;
    edPenerima: TUniEdit;
    txtCatatan: TUniMemo;
    UniButton1: TUniButton;
    UniLabel3: TUniLabel;
    UniLabel4: TUniLabel;
    UniLabel5: TUniLabel;
    UniLabel6: TUniLabel;
    UniDBText1: TUniDBText;
    UniDBText2: TUniDBText;
    UniDBText3: TUniDBText;
    UniDBText4: TUniDBText;
    cmdLapor: TFDCommand;
    QHasil: TFDQuery;
    DSHasil: TDataSource;
    grdHasil: TUniStringGrid;
    QHasilDtl: TFDQuery;
    dtWaktu: TUniDateTimePicker;
    UniLabel7: TUniLabel;
    dtValidasi: TUniDateTimePicker;
    UniLabel8: TUniLabel;
    UniLabel9: TUniLabel;
    edPelapor: TUniEdit;
    procedure UniFormAfterShow(Sender: TObject);
    procedure UniButton2Click(Sender: TObject);
    procedure UniButton1Click(Sender: TObject);
    procedure grdHasilDrawCell(Sender: TObject; ACol, ARow: Integer;
      var Value: string; Attribs: TUniCellAttribs);
    procedure UniFormBeforeShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  var
    id_user: string;
    fullname: string;
    result_id: Integer;
    nomor_lab: string;
  end;

function frmLapor: TfrmLapor;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, Main;

function frmLapor: TfrmLapor;
begin
  Result := TfrmLapor(UniMainModule.GetFormInstance(TfrmLapor));
end;

procedure TfrmLapor.UniButton1Click(Sender: TObject);
var
  I: Integer;
begin
  ShowMask('Loading');
  UniSession.Synchronize();
  if edPenerima.Text <> '' then
  begin
    try
      UniMainModule.FDConnection1.StartTransaction;

      for I := 0 to grdHasil.rowcount do
      begin
        cmdLapor.Params.Clear;
        cmdLapor.Params.Add.Name := 'ID';
        cmdLapor.Params.Add.Name := 'test_code';
        cmdLapor.Params.Add.Name := 'lapor_user';
        cmdLapor.Params.Add.Name := 'lapor_penerima';
        cmdLapor.Params.Add.Name := 'lapor_catatan';
        cmdLapor.Params.Add.Name := 'lapor_oleh';
        cmdLapor.CommandText.Text :=
          'UPDATE result_detail SET lapor_waktu = :lapor_waktu,lapor_user = :lapor_user, lapor_penerima = :lapor_penerima, lapor_catatan = :lapor_catatan , tgl_validasi = :tgl_validasi , lapor_oleh = :lapor_oleh WHERE ID = :ID AND TEST_CD = :test_code ';
        cmdLapor.ParamByName('ID').Value := nomor_lab;
        cmdLapor.ParamByName('test_code').Value := grdHasil.Cells[0, I];
        cmdLapor.ParamByName('lapor_user').Value := id_user;
        cmdLapor.ParamByName('lapor_penerima').Value := edPenerima.Text;
        cmdLapor.ParamByName('lapor_waktu').Value := dtWaktu.DateTime;
        cmdLapor.ParamByName('lapor_catatan').Value := txtCatatan.Lines.Text;
        cmdLapor.ParamByName('tgl_validasi').Value := dtValidasi.DateTime;
        cmdLapor.ParamByName('lapor_oleh').Value := edPelapor.Text;
        cmdLapor.Execute();

        // cmdLapor.Params.Clear;
        // cmdLapor.Params.Add.Name := 'id';
        // cmdLapor.CommandText.Text :=
        // 'UPDATE hasil SET status = 1 WHERE id = :id ';
        // cmdLapor.ParamByName('id').Value := result_id;
        // cmdLapor.Execute();

        UniMainModule.FDConnection1.Commit;

        hidemask();
      end;

      ShowMessage('Laporan disimpan.');
      Close;

    except
      UniMainModule.FDConnection1.Rollback;
      hidemask();
    end;
  end
  else
  begin
    ShowMessage('Penerima tidak boleh kosong.');
    edPenerima.SetFocus;
  end;

end;

procedure TfrmLapor.UniButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmLapor.UniFormAfterShow(Sender: TObject);
begin
  ShowMask('Loading');
  UniSession.Synchronize();
  frmLapor.Caption := 'Buat laporan [ ' + fullname + ' ] ' + nomor_lab;
  edPenerima.SetFocus;
  if QHasil.Active then
    QHasil.Active := False;
  QHasil.ParamByName('nomor').Value := nomor_lab;
  QHasil.Active := True;

  // grid
  grdHasil.ColCount := 3;
  grdHasil.rowcount := 1;
  grdHasil.Cells[0, 0] := 'ID';
  grdHasil.Cells[1, 0] := 'Pemeriksaan';
  grdHasil.Cells[2, 0] := 'Hasil';
  grdHasil.ColWidths[0] := 70;
  grdHasil.ColWidths[1] := 250;
  grdHasil.ColWidths[2] := 100;

  // add test
  if QHasilDtl.Active then
    QHasilDtl.Active := False;
  // QHasilDtl.Params.Clear;
  // QHasilDtl.Params.Add.Name := 'nomor';
  // QHasilDtl.SQL.Text :=
  // 'SELECT id,test_code,test,hasil FROM v_critical_mon WHERE nomor = :nomor ORDER BY test_code';
  QHasilDtl.ParamByName('nomor').Value := nomor_lab;
  QHasilDtl.Active := True;

  grdHasil.rowcount := QHasilDtl.RecordCount + 1;
  QHasilDtl.First;
  while not QHasilDtl.Eof do
  begin
    grdHasil.Cells[0, QHasilDtl.RecNo] :=
      QHasilDtl.FieldByName('test_code').AsString;
    grdHasil.Cells[1, QHasilDtl.RecNo] := QHasilDtl.FieldByName('test')
      .AsString;
    grdHasil.Cells[2, QHasilDtl.RecNo] :=
      QHasilDtl.FieldByName('hasil').AsString;
    QHasilDtl.Next;
  end;

  hidemask();

end;

procedure TfrmLapor.UniFormBeforeShow(Sender: TObject);
begin
  dtValidasi.DateTime := Now;
  dtWaktu.DateTime := Now;
end;

procedure TfrmLapor.grdHasilDrawCell(Sender: TObject; ACol, ARow: Integer;
  var Value: string; Attribs: TUniCellAttribs);
begin
  if (ACol = 2) then
    Attribs.Style.Style := 'text-align: center';
end;

end.
