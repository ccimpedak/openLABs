unit UnitKuitansi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniBasicGrid, uniDBGrid,
  uniPanel, uniButton, uniCheckBox, uniEdit, uniLabel, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, frxClass, frxDBSet,
  frxBarcode, frxExportPDF;

type
  TfrmKuitansi = class(TUniForm)
    UniContainerPanel1: TUniContainerPanel;
    UniContainerPanel2: TUniContainerPanel;
    UniDBGrid1: TUniDBGrid;
    UniButton1: TUniButton;
    UniLabel1: TUniLabel;
    edNama: TUniEdit;
    cbCopy: TUniCheckBox;
    UniButton2: TUniButton;
    qKuintansiRows: TFDQuery;
    DataSource1: TDataSource;
    qKuintansi: TFDQuery;
    qKuintansinomor: TStringField;
    qKuintansinoreg: TStringField;
    qKuintansinama: TStringField;
    qKuintansijumlah: TBCDField;
    qKuintansitipe_bayar: TStringField;
    qKuintansiuser: TStringField;
    qKuintansitanggal: TDateTimeField;
    qKuintansino_kuitansi: TStringField;
    qKuintansitipe_pasien: TStringField;
    qKuintansidokter: TStringField;
    qKuintansialamat: TStringField;
    qKuintansitelepon: TStringField;
    qKuintansitagihan: TBCDField;
    qKuintansihp: TStringField;
    qKuintansiperujuk: TStringField;
    qKuintansicatatan_pasien: TMemoField;
    procedure UniButton1Click(Sender: TObject);
    procedure UniButton2Click(Sender: TObject);
    procedure frxRepKuitansiGetValue(const VarName: string; var Value: Variant);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function frmKuitansi: TfrmKuitansi;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, ServerModule, UnitReportDisplay, UnitQz,
  UnitJasper;

function terbilang(dNumber: Extended): string;
const
  aNum: array [1 .. 9] of String = ('satu', 'dua', 'tiga', 'empat', 'lima',
    'enam', 'tujuh', 'delapan', 'sembilan');
  aUnit: array [1 .. 5] of String = ('trilyun', 'milyar', 'juta', 'ribu', '');
var
  iCount, iDigit1, iDigit2, iDigit3: integer;
  sNum2Str, s3Digit, sWord: string;
begin

  Result := '';
  if (dNumber = 0) then
    Exit;
  sNum2Str := Copy(Format('%18.2f', [dNumber]), 1, 15);
  for iCount := 1 to 5 do
  begin
    s3Digit := Copy(sNum2Str, iCount * 3 - 2, 3);
    if (StrToIntDef(s3Digit, 0) <> 0) then
    begin
      sWord := '';
      iDigit1 := StrToIntDef(Copy(s3Digit, 1, 1), 0);
      iDigit2 := StrToIntDef(Copy(s3Digit, 2, 1), 0);
      iDigit3 := StrToIntDef(Copy(s3Digit, 3, 1), 0);
      case iDigit1 of
        2 .. 9:
          sWord := sWord + aNum[iDigit1] + ' ratus ';
        1:
          sWord := sWord + 'seratus ';
      end; { case }

      case iDigit2 of
        2 .. 9:
          sWord := sWord + aNum[iDigit2] + ' puluh ';
        1:
          case iDigit3 of
            2 .. 9:
              sWord := sWord + aNum[iDigit3] + ' belas ';
            1:
              sWord := sWord + 'sebelas ';
            0:
              sWord := sWord + 'sepuluh ';
          end; { case }
      end; { case }

      if (iDigit2 <> 1) then
        case iDigit3 of
          2 .. 9:
            sWord := sWord + aNum[iDigit3] + ' ';
          1:
            if (iCount = 4) and ((iDigit1 + iDigit2) = 0) then
              sWord := sWord + 'se'
            else
              sWord := sWord + 'satu ';
        end;
      Result := Result + sWord + aUnit[iCount] + ' ';
    end;
  end;
  while Result[Length(Result)] = ' ' do
    SetLength(Result, Length(Result) - 1);
end;

function frmKuitansi: TfrmKuitansi;
begin
  Result := TfrmKuitansi(UniMainModule.GetFormInstance(TfrmKuitansi));
end;

procedure TfrmKuitansi.frxRepKuitansiGetValue(const VarName: string;
  var Value: Variant);
begin
  if CompareText(VarName, 'terbilang') = 0 then
    Value := terbilang(qKuintansi.FieldByName('jumlah').AsCurrency);

  if CompareText(VarName, 'nama') = 0 then
    Value := edNama.Text;

end;

procedure TfrmKuitansi.UniButton1Click(Sender: TObject);
var
  filename, sCopy: string;
  status: boolean;
begin

  sCopy := '';
  if cbCopy.Checked then
    sCopy := '1';

  ShowMask('Loading');
  uniSession.Synchronize();
  filename := reportExecReqFileParams('pdf', 'print_kuitansi_pembayaran',
    qKuintansiRows.FieldByName('id').AsString, edNama.Text, sCopy, status);
  if status then
  begin
    uniSession.AddJS(printKuitansi(filename));
  end
  else
    showMessage(filename);

  HideMask;
end;

procedure TfrmKuitansi.UniButton2Click(Sender: TObject);
begin
  Close;
end;

end.
