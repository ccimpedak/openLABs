unit UnitNilaiNormal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniGroupBox, uniMultiItem,
  uniComboBox, uniDBComboBox, uniDBLookupComboBox, uniCheckBox, uniEdit,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uniMemo, uniButton;

type
  TfrmNilaiNormal = class(TUniForm)
    UniGroupBox1: TUniGroupBox;
    cbUmur: TUniDBLookupComboBox;
    edUmurMin: TUniEdit;
    edUmurMax: TUniEdit;
    cbAnyAge: TUniCheckBox;
    QUmur: TFDQuery;
    dsUmur: TDataSource;
    UniGroupBox2: TUniGroupBox;
    UniDBLookupComboBox1: TUniDBLookupComboBox;
    UniGroupBox3: TUniGroupBox;
    UniEdit1: TUniEdit;
    UniEdit2: TUniEdit;
    UniEdit3: TUniEdit;
    UniMemo1: TUniMemo;
    UniEdit4: TUniEdit;
    UniComboBox1: TUniComboBox;
    UniGroupBox4: TUniGroupBox;
    UniEdit5: TUniEdit;
    UniEdit6: TUniEdit;
    UniEdit7: TUniEdit;
    UniEdit8: TUniEdit;
    UniComboBox2: TUniComboBox;
    UniButton1: TUniButton;
    procedure UniFormBeforeShow(Sender: TObject);
    procedure cbAnyAgeChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function frmNilaiNormal: TfrmNilaiNormal;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function frmNilaiNormal: TfrmNilaiNormal;
begin
  Result := TfrmNilaiNormal(UniMainModule.GetFormInstance(TfrmNilaiNormal));
end;

procedure TfrmNilaiNormal.cbAnyAgeChange(Sender: TObject);
begin
  if not cbAnyAge.Checked then
  begin
    cbUmur.Enabled := True;
    edUmurMin.Enabled := True;
    edUmurMax.Enabled := True;
  end
  else
  begin
    cbUmur.Text := '';
    cbUmur.Enabled := False;
    edUmurMin.Clear;
    edUmurMin.Enabled := False;
    edUmurMax.Clear;
    edUmurMax.Enabled := False;
  end;
end;

procedure TfrmNilaiNormal.UniFormBeforeShow(Sender: TObject);
begin
  QUmur.Open();
end;

end.
