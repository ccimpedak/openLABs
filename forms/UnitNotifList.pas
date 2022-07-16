unit UnitNotifList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniButton, uniPanel, uniGUIBaseClasses,
  uniBasicGrid, uniDBGrid, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmNotifList = class(TUniForm)
    UniDBGrid1: TUniDBGrid;
    UniContainerPanel1: TUniContainerPanel;
    UniButton1: TUniButton;
    UniButton2: TUniButton;
    QNotifList: TFDQuery;
    dsList: TDataSource;
    cmdExec: TFDCommand;
    procedure UniButton2Click(Sender: TObject);
    procedure UniButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function frmNotifList: TfrmNotifList;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function frmNotifList: TfrmNotifList;
begin
  Result := TfrmNotifList(UniMainModule.GetFormInstance(TfrmNotifList));
end;

procedure TfrmNotifList.UniButton1Click(Sender: TObject);
begin
  if QNotifList.RecordCount > 0 then
  begin
    if cmdExec.Active then
      cmdExec.Active := False;
    cmdExec.CommandText.Text := 'DELETE FROM notifikasi WHERE user_id = ' +
      QNotifList.FieldByName('user_id').AsString + ' ;';
    cmdExec.Execute();

    if QNotifList.Active then
      QNotifList.Active := False;
    QNotifList.Active := True;

  end;
end;

procedure TfrmNotifList.UniButton2Click(Sender: TObject);
begin
  if QNotifList.RecordCount > 0 then
  begin
    if cmdExec.Active then
      cmdExec.Active := False;
    cmdExec.CommandText.Text := 'DELETE FROM notifikasi WHERE user_id = ' +
      QNotifList.FieldByName('user_id').AsString + ' AND noreg = ' +
      QuotedStr(QNotifList.FieldByName('noreg').AsString) + ' ;';
    cmdExec.Execute();

    if QNotifList.Active then
      QNotifList.Active := False;
    QNotifList.Active := True;

  end;
end;

end.
