unit UnitUsers;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniGUIBaseClasses, uniButton;

type
  TUniUsers = class(TUniFrame)
    UniButton1: TUniButton;
    UniButton2: TUniButton;
    procedure UniButton2Click(Sender: TObject);
    procedure UniButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses UnitProfilAkun, UnitSetting;

procedure TUniUsers.UniButton1Click(Sender: TObject);
begin
frmSetting.ShowModal;
end;

procedure TUniUsers.UniButton2Click(Sender: TObject);
begin
  frmProfilAkun.ShowModal;
end;

initialization

RegisterClass(TUniUsers);

end.
