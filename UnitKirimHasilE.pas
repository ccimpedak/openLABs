unit UnitKirimHasilE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniFileUpload, uniButton,
  uniMemo, uniLabel, uniEdit;

type
  TfrmKirimHasilE = class(TUniForm)
    UniEdit1: TUniEdit;
    UniLabel1: TUniLabel;
    UniEdit2: TUniEdit;
    UniLabel2: TUniLabel;
    UniLabel3: TUniLabel;
    UniEdit3: TUniEdit;
    UniLabel4: TUniLabel;
    UniEdit4: TUniEdit;
    UniLabel5: TUniLabel;
    UniEdit5: TUniEdit;
    UniMemo1: TUniMemo;
    UniLabel6: TUniLabel;
    UniMemo2: TUniMemo;
    UniButton1: TUniButton;
    UniFileUpload1: TUniFileUpload;
    UniLabel7: TUniLabel;
    UniEdit6: TUniEdit;
    UniButton2: TUniButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function frmKirimHasilE: TfrmKirimHasilE;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function frmKirimHasilE: TfrmKirimHasilE;
begin
  Result := TfrmKirimHasilE(UniMainModule.GetFormInstance(TfrmKirimHasilE));
end;

end.
