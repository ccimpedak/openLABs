unit UnitCase;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniButton, uniLabel;

type
  TfrmPACase = class(TUniForm)
    UniButton1: TUniButton;
    UniLabel1: TUniLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  // function frmPACase: TfrmPACase;

implementation

{$R *.dfm}
// uses
// MainModule, uniGUIApplication;

// function frmPACase: TfrmPACase;
// begin
// Result := TfrmPACase(UniMainModule.GetFormInstance(TfrmPACase));
// end;

initialization

RegisterClass(TfrmPACase);

end.
