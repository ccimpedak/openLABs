unit UnitSyslog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniButton, uniEdit, uniGUIBaseClasses, uniLabel,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt,  Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmSysLog = class(TUniForm)
    UniLabel1: TUniLabel;
    edNomor: TUniEdit;
    UniButton1: TUniButton;
    UniButton2: TUniButton;
    qSyslog: TFDQuery;
    procedure UniButton2Click(Sender: TObject);
    procedure UniButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function frmSysLog: TfrmSysLog;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, ServerModule, UnitReportDisplay;

function frmSysLog: TfrmSysLog;
begin
  Result := TfrmSysLog(UniMainModule.GetFormInstance(TfrmSysLog));
end;

procedure TfrmSysLog.UniButton1Click(Sender: TObject);
var
Result: string;
begin

  if qSyslog.Active then
    qSyslog.Active := False;
  qSyslog.ParamByName('nomor').AsString := edNomor.Text;
  qSyslog.Active := True;

//  frxSyslog.PrintOptions.ShowDialog := False;
//  frxSyslog.ShowProgress := False;
//
//  frxSyslog.EngineOptions.SilentMode := True;
//  frxSyslog.EngineOptions.DestroyForms := False;
//
//  frxPDFExport1.Background := True;
//  frxPDFExport1.ShowProgress := False;
//  frxPDFExport1.ShowDialog := False;
//  frxPDFExport1.FileName := UniServerModule.NewCacheFileUrl(False, 'pdf', '',
//    '', Result, True);
//  frxPDFExport1.DefaultPath := '';
//
//  frxSyslog.PreviewOptions.AllowEdit := False;
//  frxSyslog.PrepareReport;
//  frxSyslog.Export(frxPDFExport1);

  frmReportDisplay.UniURLFrame1.URL := Result;
  frmReportDisplay.ShowModal();

end;

procedure TfrmSysLog.UniButton2Click(Sender: TObject);
begin
Close;
end;

end.
