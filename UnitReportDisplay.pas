unit UnitReportDisplay;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniButton, uniGUIBaseClasses, uniURLFrame;

type
  TfrmReportDisplay = class(TUniForm)
    UniURLFrame1: TUniURLFrame;
    UniButton1: TUniButton;
    procedure UniButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function frmReportDisplay: TfrmReportDisplay;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function frmReportDisplay: TfrmReportDisplay;
begin
  Result := TfrmReportDisplay(UniMainModule.GetFormInstance(TfrmReportDisplay));
end;

procedure TfrmReportDisplay.UniButton1Click(Sender: TObject);
begin
Close;
end;

end.
