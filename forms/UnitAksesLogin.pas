unit UnitAksesLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm;

type
  TfrmAksesLogin = class(TUniForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function frmAksesLogin: TfrmAksesLogin;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function frmAksesLogin: TfrmAksesLogin;
begin
  Result := TfrmAksesLogin(UniMainModule.GetFormInstance(TfrmAksesLogin));
end;

end.
