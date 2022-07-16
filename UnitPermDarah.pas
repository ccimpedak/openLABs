unit UnitPermDarah;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniPanel, uniBasicGrid,
  uniDBGrid, uniButton, uniEdit, uniLabel;

type
  TfrmPermDarah = class(TUniForm)
    UniContainerPanel1: TUniContainerPanel;
    UniContainerPanel2: TUniContainerPanel;
    UniContainerPanel3: TUniContainerPanel;
    UniDBGrid1: TUniDBGrid;
    UniLabel1: TUniLabel;
    UniEdit1: TUniEdit;
    UniLabel2: TUniLabel;
    UniEdit2: TUniEdit;
    UniButton1: TUniButton;
    UniButton2: TUniButton;
    procedure UniButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function frmPermDarah: TfrmPermDarah;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, UnitPermDarahBaru;

function frmPermDarah: TfrmPermDarah;
begin
  Result := TfrmPermDarah(UniMainModule.GetFormInstance(TfrmPermDarah));
end;

procedure TfrmPermDarah.UniButton2Click(Sender: TObject);
begin
frmPermDarahBaru.ShowModal();
end;

end.
