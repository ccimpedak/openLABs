unit UnitSetingNotif;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniButton, uniEdit, uniGUIBaseClasses, uniLabel,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.Comp.Client, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet;

type
  TfrmSetingNotif = class(TUniForm)
    UniLabel1: TUniLabel;
    edTimeout: TUniNumberEdit;
    UniLabel2: TUniLabel;
    UniButton1: TUniButton;
    cmdUpdate: TFDCommand;
    QTimeout: TFDQuery;
    procedure UniButton1Click(Sender: TObject);
    procedure UniFormBeforeShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function frmSetingNotif: TfrmSetingNotif;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function frmSetingNotif: TfrmSetingNotif;
begin
  Result := TfrmSetingNotif(UniMainModule.GetFormInstance(TfrmSetingNotif));
end;

procedure TfrmSetingNotif.UniButton1Click(Sender: TObject);
begin
  if cmdUpdate.Active then
    cmdUpdate.Active := False;
  cmdUpdate.ParamByName('user_id').Value := UniApplication.Cookies.GetCookie
    ('UserId');
  cmdUpdate.ParamByName('value').Value := edTimeout.Value;
  cmdUpdate.Execute();
  UniSession.AddJS
    ('Ext.toast({html: "Berhasil diupdate notifikasi timeout ke <strong>' +
    edTimeout.Text +
    '</strong> detik.<br>Start dan stop task untuk update timeout.", header: false, autoCloseDelay: 2000});');
  Close;

end;

procedure TfrmSetingNotif.UniFormBeforeShow(Sender: TObject);
begin
  edTimeout.Value := 2;
  if QTimeout.Active then
    QTimeout.Active := False;
  QTimeout.ParamByName('user_id').Value := UniApplication.Cookies.GetCookie
    ('UserId');
  QTimeout.Active := True;
  if QTimeout.RecordCount > 0 then
    edTimeout.Value := QTimeout.FieldByName('value').AsInteger;
end;

end.
