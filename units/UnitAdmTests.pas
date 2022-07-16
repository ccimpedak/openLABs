unit UnitAdmTests;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniGUIBaseClasses, uniButton;

type
  TUniAdmTests = class(TUniFrame)
    UniButton1: TUniButton;
    UniButton2: TUniButton;
    UniButton3: TUniButton;
    procedure UniButton2Click(Sender: TObject);
    procedure UniButton3Click(Sender: TObject);
    procedure UniButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses UnitMasterSpecimen, UnitMasterTube, UnitAdmTest;

procedure TUniAdmTests.UniButton1Click(Sender: TObject);
begin
  // frmAdmTest.ShowModal;
   frmAdmTest.ShowModal;
end;

procedure TUniAdmTests.UniButton2Click(Sender: TObject);
begin
  frmMasterSpecimen.ShowModal;
end;

procedure TUniAdmTests.UniButton3Click(Sender: TObject);
begin
  frmMasterTube.ShowModal;
end;

initialization

RegisterClass(TUniAdmTests);

end.
