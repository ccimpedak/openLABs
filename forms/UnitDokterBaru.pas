unit UnitDokterBaru;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, DateUtils,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniMemo, uniMultiItem, uniComboBox, uniDBComboBox,
  uniDBLookupComboBox, uniGUIBaseClasses, uniEdit, uniBitBtn, uniButton,
  uniLabel, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uniSpinEdit;

type
  TfrmDokterBaru = class(TUniForm)
    edNama: TUniEdit;
    edTglLahir: TUniEdit;
    cbKelamin: TUniDBLookupComboBox;
    memoAlamat: TUniMemo;
    UniLabel1: TUniLabel;
    UniLabel2: TUniLabel;
    UniLabel3: TUniLabel;
    UniLabel4: TUniLabel;
    UniLabel5: TUniLabel;
    edTlp: TUniEdit;
    UniLabel6: TUniLabel;
    UniLabel7: TUniLabel;
    edHp: TUniEdit;
    edFax: TUniEdit;
    UniLabel8: TUniLabel;
    btnCancel: TUniButton;
    btnSave: TUniBitBtn;
    QKelamin: TFDQuery;
    DSKelamin: TDataSource;
    cmdInsert: TFDCommand;
    edUmur: TUniSpinEdit;
    QLastInsId: TFDQuery;
    procedure btnCancelClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure edUmurChange(Sender: TObject);
    procedure edTglLahirChange(Sender: TObject);
    procedure edTglLahirEnter(Sender: TObject);
    procedure UniFormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edNamaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure UniFormBeforeShow(Sender: TObject);
    procedure UniFormAfterShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function frmDokterBaru: TfrmDokterBaru;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, UnitFODaftar, UnitCariDokter;

function frmDokterBaru: TfrmDokterBaru;
begin
  Result := TfrmDokterBaru(UniMainModule.GetFormInstance(TfrmDokterBaru));
end;

procedure Split(Delimiter: Char; Str: string; ListOfStrings: TStrings);
begin
  ListOfStrings.Clear;
  ListOfStrings.Delimiter := Delimiter;
  ListOfStrings.StrictDelimiter := True; // Requires D2006 or newer.
  ListOfStrings.DelimitedText := Str;
end;

procedure TfrmDokterBaru.edNamaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F1 then
    btnSaveClick(self);
  if Key = VK_F3 then
    btnCancelClick(self);
  if Key = VK_ESCAPE then
    Close;
end;

procedure TfrmDokterBaru.edTglLahirChange(Sender: TObject);
var
  dob: tdate;
//  thn, bln, hr: Word;
  OutPutList: TStringList;
begin
  OutPutList := TStringList.Create;
  try
    Split('-', edTglLahir.Text, OutPutList);
    //
    dob := EncodeDate(OutPutList[0].ToInteger, OutPutList[1].ToInteger,
      OutPutList[2].ToInteger);
    edUmur.Text := IntToStr(YearsBetween(dob, Now));
  except
    Exit;
  end;
  OutPutList.Free;
end;

procedure TfrmDokterBaru.edTglLahirEnter(Sender: TObject);
begin
  if edTglLahir.Text = '' then
    edTglLahir.Text := FormatDateTime('yyyy-mm-dd', Now);
end;

procedure TfrmDokterBaru.edUmurChange(Sender: TObject);
var
  dob: tdate;
begin
  if edUmur.Text <> '' then
  begin
    dob := IncYear(Now, -StrToInt(edUmur.Text));
    edTglLahir.Text := FormatDateTime('yyyy-mm-dd', dob);
  end;
end;

procedure TfrmDokterBaru.btnSaveClick(Sender: TObject);
var
  iLastInsId: Integer;
begin
  if edTglLahir.Text = '' then
    edTglLahir.Text := FormatDateTime('yyyy-mm-dd', Now);

  UniMainModule.FDConnection1.StartTransaction;
  try
    cmdInsert.ParamByName('nama').AsString := edNama.Text;
    cmdInsert.ParamByName('umur').AsString := edUmur.Text;
    cmdInsert.ParamByName('tanggal_lahir').AsString := edTglLahir.Text;
    cmdInsert.ParamByName('jenis_kelamin_id').AsInteger :=
      QKelamin.FieldByName('id').AsInteger;
    cmdInsert.ParamByName('alamat').AsMemo := memoAlamat.Lines.Text;
    cmdInsert.ParamByName('telepon').AsString := edTlp.Text;
    cmdInsert.ParamByName('handphone').AsString := edHp.Text;
    cmdInsert.ParamByName('fax').AsString := edFax.Text;
    cmdInsert.Open();

    frmFODaftar.edDokter.Text := edNama.Text;

    frmCariDokter.Close;
    if QLastInsId.Active then
      QLastInsId.Active := False;
    QLastInsId.Active := True;
    iLastInsId := QLastInsId.FieldByName('last_insert_id').AsInteger;
    frmFODaftar.edDokterId.Text := IntToStr(iLastInsId);
    // frmFODaftar.cbTipePasien.SetFocus;
    UniMainModule.FDConnection1.Commit;

    Close;

  except
    UniMainModule.FDConnection1.Rollback;
    Raise;
  end;
end;

procedure TfrmDokterBaru.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmDokterBaru.UniFormAfterShow(Sender: TObject);
begin
  edNama.SetFocus;
end;

procedure TfrmDokterBaru.UniFormBeforeShow(Sender: TObject);
begin
  edNama.SetFocus;
end;

procedure TfrmDokterBaru.UniFormCreate(Sender: TObject);
begin
  QKelamin.Open();
  cbKelamin.KeyValue := 1;
end;

procedure TfrmDokterBaru.UniFormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F1 then
    btnSaveClick(self);
  if Key = VK_F3 then
    btnCancelClick(self);
  if Key = VK_ESCAPE then
    Close;
end;

end.
