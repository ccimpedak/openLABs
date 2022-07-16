// Timer = Timer
unit TimerTimer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniGUIBaseClasses, uniPanel, uniTimer, uniLabel;

type
  TUniTimerTimer = class(TUniFrame)
    UniContainerPanel1: TUniContainerPanel;
    UniPanel1: TUniPanel;
    UniLabel1: TUniLabel;
    UniTimer1: TUniTimer;
    procedure UniTimer1Timer(Sender: TObject);
  private
    Count: Integer;
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}



procedure TUniTimerTimer.UniTimer1Timer(Sender: TObject);
begin
  Count := Count + 1;
  UniLabel1.Caption := IntToStr(Count) ;
end;

initialization
  RegisterClass(TUniTimerTimer);

end.
