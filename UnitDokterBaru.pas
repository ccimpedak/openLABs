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
    UniButton1: TUniButton;
    UniBitBtn1: TUniBitBtn;
    QKelamin: TFDQuery;
    DSKelamin: TDataSource;
    cmdInsert: TFDCommand;
    edUmur: TUniSpinEdit;
    QLastInsId: TFDQuery;
    procedure UniButton1Click(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    procedure UniBitBtn1Click(Sender: TObject);
    procedure edUmurChange(Sender: TObject);
    procedure edTglLahirChange(Sender: TObject);
    procedure edTglLahirEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    dokter_id: integer;
  end;

function frmDokterBaru: TfrmDokterBaru;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, UnitPendaftaran, UnitCariDokter;

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

procedure TfrmDokterBaru.edTglLahirChange(Sender: TObject);
var
  dob: tdate;
  thn, bln, hr: word;
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

procedure TfrmDokterBaru.UniBitBtn1Click(Sender: TObject);
var
  iLastInsId: integer;
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
    cmdInsert.ParamByName('organisasi_id').AsString :=
      UniApplication.Cookies.GetCookie('OrganisasiId');
    cmdInsert.Open();

    frmCariDokter.Close;

    if QLastInsId.Active then
      QLastInsId.Active := False;
    QLastInsId.Active := True;

    iLastInsId := QLastInsId.FieldByName('last_insert_id').AsInteger;

    UniMainModule.FDConnection1.Commit;

    dokter_id := iLastInsId;

    Self.ModalResult := mrOK;
    Close;

  except
    UniMainModule.FDConnection1.Rollback;
    Raise;
  end;
end;

procedure TfrmDokterBaru.UniButton1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmDokterBaru.UniFormCreate(Sender: TObject);
begin
  QKelamin.Open();
  cbKelamin.KeyValue := 1;
end;

end.
