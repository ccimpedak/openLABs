unit UnitPACase;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm;

type
  TfrmPACase = class(TUniForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function frmPACase: TfrmPACase;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function frmPACase: TfrmPACase;
begin
  Result := TfrmPACase(UniMainModule.GetFormInstance(TfrmPACase));
end;

end.
