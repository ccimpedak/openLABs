unit UnitPermDarahBaru;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniLabel, uniButton, uniGroupBox,
  uniEdit, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, uniMultiItem, uniComboBox, uniDBComboBox,
  uniDBLookupComboBox, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmPermDarahBaru = class(TUniForm)
    UniLabel1: TUniLabel;
    UniLabel2: TUniLabel;
    UniLabel3: TUniLabel;
    UniLabel4: TUniLabel;
    UniLabel5: TUniLabel;
    UniLabel6: TUniLabel;
    UniLabel7: TUniLabel;
    UniLabel8: TUniLabel;
    UniButton1: TUniButton;
    UniGroupBox1: TUniGroupBox;
    UniGroupBox2: TUniGroupBox;
    UniLabel9: TUniLabel;
    UniLabel10: TUniLabel;
    UniButton2: TUniButton;
    UniButton3: TUniButton;
    UniLabel11: TUniLabel;
    qAnsuransi: TFDQuery;
    dsAnsuransi: TDataSource;
    cbPenjamin: TUniDBLookupComboBox;
    UniDBLookupComboBox1: TUniDBLookupComboBox;
    UniDBLookupComboBox2: TUniDBLookupComboBox;
    procedure UniButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function frmPermDarahBaru: TfrmPermDarahBaru;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function frmPermDarahBaru: TfrmPermDarahBaru;
begin
  Result := TfrmPermDarahBaru(UniMainModule.GetFormInstance(TfrmPermDarahBaru));
end;

procedure TfrmPermDarahBaru.UniButton3Click(Sender: TObject);
begin
Close;
end;

end.
