unit UnitElektronikHasilKirim;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniTimer, uniProgressBar,
  uniButton, uniMemo, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.Client,
  Data.DB, FireDAC.Comp.DataSet;

type
  TfrmElektronikHasilKirim = class(TUniForm)
    UniButton1: TUniButton;
    PrgBar: TUniProgressBar;
    CheckProgressTimer: TUniTimer;
    UniMemo1: TUniMemo;
    QParam: TFDQuery;
    QKirim: TFDQuery;
    cmd: TFDCommand;
    procedure UniFormClose(Sender: TObject; var Action: TCloseAction);
    procedure UniFormShow(Sender: TObject);
    procedure CheckProgressTimerTimer(Sender: TObject);
  private
    WorkerThread: TThread;
    host: String;
    port: Integer;
    username: String;
    password: String;
    sender_name: String;
    jum_antri: Integer;
    antri: array of Integer;

  public

  end;

function frmElektronikHasilKirim: TfrmElektronikHasilKirim;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, UnitElektronikHasil;

function frmElektronikHasilKirim: TfrmElektronikHasilKirim;
begin
  Result := TfrmElektronikHasilKirim
    (UniMainModule.GetFormInstance(TfrmElektronikHasilKirim));
end;

type
  TWorker = class(TThread)
  private
    FForm: TfrmElektronikHasilKirim;
    // f_antri: array of Integer;
    // f_host: String;
    // f_port: Integer;
    // f_username: String;
    // f_password: String;
    // f_sender_name: String;
  protected
    procedure Execute; override;
  public
    Position: Integer;
    constructor Create(Form: TfrmElektronikHasilKirim);
  end;

  { TWorker }

constructor TWorker.Create(Form: TfrmElektronikHasilKirim);
begin
  inherited Create(False);
  FForm := Form;
  // f_antri := antri;
  // f_host := host;
  // f_port := port;
  // f_username := username;
  // f_password := password;
  // f_sender_name := sender_name;
end;

procedure TWorker.Execute;
var
  Index: Integer;
  // var
  // status, host, username, password, sender_name: string;
  // I, port, i_status: Integer;
var
  I: Integer;
  f_antri: array of Integer;
begin
  inherited;

  // frmElektronikHasilKirim.UniMemo1.Lines.Add
  // ('Thread started with f_jum_antri = ' + IntToStr(f_jum_antri));
  for Index := 0 to FForm.jum_antri do
  begin
    // Always check for termination at regular intervals during Execute.
    if Terminated then
      Break;
    // Update position. Main thread can read this field to see how far the work
    // has progressed. Simple types are generally thread safe so can be read
    // directly by the main thread. When transfering strings and other more
    // complicated types, you need to protect the data using a locking mechanism.
    Position := Index;

    // Do some work
    // with frmElektronikHasilKirim do
    // begin
    // f_antri:= copy(FFrom.antri,
    for I := 0 to FForm.jum_antri - 1 do
    begin
      FForm.UniMemo1.Lines.Add(IntToStr(FForm.antri[I]));
      // if QKirim.Active then
      // QKirim.Active := False;
      // QKirim.ParamByName('id').Value := antri[I];
      // QKirim.Active := True;
      // UniMemo1.Lines.Add(QKirim.FieldByName('nomor').AsString);
    end;
    // //
    // end;

    Sleep(200);
  end;
end;

procedure TfrmElektronikHasilKirim.CheckProgressTimerTimer(Sender: TObject);
begin
  // Every time the timer triggers an asyncronous call is made to the web server
  // so don't do this too often, or else it might fail on slow networks.
  // ---
  // As stated earlier, the types used here are in themselves thread safe. It is
  // worth noting that the combination of pointer-dereference and field lookup
  // is NOT guaranteed to be thread safe, but this is only an issue if we need
  // accurate knowledge of what the Position variable is. We don't really care
  // in this case.
  UniMemo1.Lines.Add('On timer.');
  UniMemo1.Lines.Add('Thread Position = ' + IntToStr(TWorker(WorkerThread)
    .Position));
  UniMemo1.Lines.Add('jum_antri = ' + IntToStr(jum_antri));
  PrgBar.Position := TWorker(WorkerThread).Position;
  if PrgBar.Position >= jum_antri then
    ModalResult := mrOk;
end;

procedure TfrmElektronikHasilKirim.UniFormClose(Sender: TObject;

  var Action: TCloseAction);
begin
  CheckProgressTimer.Enabled := False;
  WorkerThread.Free;
  WorkerThread := nil;
end;

procedure TfrmElektronikHasilKirim.UniFormShow(Sender: TObject);
var
  I: Integer;
begin
  // Since the user can close the form at any time, you can not be sure that
  // the last thread has actually completed. This needs to be handled in some
  // way. One way is to create the form dynamically instead of using an application
  // form. Then the form can be garbage collected when the thread finishes.
  // Here I just check if the work has been completed.

  with frmElektronikHasil do
  begin
    // data antrian array
    jum_antri := grdPending.SelectedRows.Count;
    SetLength(antri, jum_antri);
    for I := 0 to jum_antri - 1 do
    begin
      antri[I] := QPending.FieldByName('id').AsInteger;;
    end;
  end;
  host := frmElektronikHasil.host;
  port := frmElektronikHasil.port;
  username := frmElektronikHasil.username;
  password := frmElektronikHasil.password;
  sender_name := frmElektronikHasil.sender_name;

  PrgBar.Max := jum_antri;

  UniMemo1.Lines.Clear;

  UniMemo1.Lines.Add('On show.');
  UniMemo1.Lines.Add('Jum antri = ' + IntToStr(jum_antri));
  UniMemo1.Lines.Add('host = ' + host);
  UniMemo1.Lines.Add('port = ' + IntToStr(port));
  UniMemo1.Lines.Add('username = ' + username);
  UniMemo1.Lines.Add('password = ' + password);
  UniMemo1.Lines.Add('sender_name = ' + sender_name);

  if not Assigned(WorkerThread) then
  begin
    UniMemo1.Lines.Add('create worker');
//    WorkerThread := TWorker.Create(jum_antri);
  end;
  UniMemo1.Lines.Add('Timer enable');
  CheckProgressTimer.Enabled := True;
end;

end.
