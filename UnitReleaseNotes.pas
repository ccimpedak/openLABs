unit UnitReleaseNotes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniButton, uniMemo, uniGUIBaseClasses, uniPanel,
  uniBitBtn;

type
  TfrmReleaseNote = class(TUniForm)
    UniContainerPanel1: TUniContainerPanel;
    UniContainerPanel2: TUniContainerPanel;
    UniMemo1: TUniMemo;
    UniButton1: TUniButton;
    UniBitBtn1: TUniBitBtn;
    UniButton2: TUniButton;
    procedure UniButton1Click(Sender: TObject);
    procedure UniBitBtn1Click(Sender: TObject);
    procedure UniButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function frmReleaseNote: TfrmReleaseNote;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, Main;

function frmReleaseNote: TfrmReleaseNote;
begin
  Result := TfrmReleaseNote(UniMainModule.GetFormInstance(TfrmReleaseNote));
end;

procedure TfrmReleaseNote.UniBitBtn1Click(Sender: TObject);
begin
ShowMask('Loading');
  UniSession.Synchronize();
  // ATable.Open;

end;

procedure TfrmReleaseNote.UniButton1Click(Sender: TObject);
begin
Close;
end;

procedure TfrmReleaseNote.UniButton2Click(Sender: TObject);
begin
MainForm.HideMask;
end;

end.
