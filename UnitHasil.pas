unit UnitHasil;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGroupBox, uniGUIBaseClasses, uniPanel, uniEdit,
  uniDBEdit, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdTime,
  IdUnixTime, uniLabel, uniButton, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uniBasicGrid, uniDBGrid, uniBitBtn,
  uniSpeedButton;

type
  TfrmHasil = class(TUniForm)
    UniContainerPanel1: TUniContainerPanel;
    UniContainerPanel2: TUniContainerPanel;
    UniContainerPanel3: TUniContainerPanel;
    UniContainerPanel4: TUniContainerPanel;
    UniLabel1: TUniLabel;
    UniLabel2: TUniLabel;
    UniContainerPanel5: TUniContainerPanel;
    QHdr: TFDQuery;
    UniDBEdit1: TUniDBEdit;
    DSHdr: TDataSource;
    UniDBEdit2: TUniDBEdit;
    UniDBEdit3: TUniDBEdit;
    UniDBEdit4: TUniDBEdit;
    UniDBEdit5: TUniDBEdit;
    UniDBEdit6: TUniDBEdit;
    UniDBEdit7: TUniDBEdit;
    UniDBEdit8: TUniDBEdit;
    UniDBGrid1: TUniDBGrid;
    QDtl: TFDQuery;
    DSDtl: TDataSource;
    QPDF: TFDQuery;
    btnPDF: TUniSpeedButton;
    btnEmail: TUniSpeedButton;
    cmdExec: TFDCommand;
    UniLabel3: TUniLabel;
    procedure UniFormAfterShow(Sender: TObject);
    procedure btnPDFClick(Sender: TObject);
    procedure btnEmailClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    order_id: integer;
  end;

function frmHasil: TfrmHasil;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, UnitElektronikHasilView;

function frmHasil: TfrmHasil;
begin
  Result := TfrmHasil(UniMainModule.GetFormInstance(TfrmHasil));
end;

procedure TfrmHasil.UniFormAfterShow(Sender: TObject);
var
  user_profile_id: string;
begin
  user_profile_id := UniApplication.Cookies.GetCookie('user_profile_id');
  // disable menu tree jika
  if StrToInt(user_profile_id) < 1 then
  begin
    btnEmail.Enabled := false;
  end;

  if StrToInt(user_profile_id) < 2 then
  begin
    btnPDF.Enabled := false;
  end;

  if QHdr.Active then
    QHdr.Active := false;
  QHdr.ParamByName('header_id').Value := order_id;
  QHdr.Active := True;

  if QPDF.Active then
    QPDF.Active := false;
  QPDF.ParamByName('nomor').Value := QHdr.FieldByName('nomor').AsString;
  QPDF.Active := True;

  if QPDF.RecordCount > 0 then
    btnPDF.Visible := True;

  if QDtl.Active then
    QDtl.Active := false;
  QDtl.ParamByName('header_id').Value := order_id;
  QDtl.Active := True;

end;

procedure TfrmHasil.btnEmailClick(Sender: TObject);
begin
  if QPDF.RecordCount > 0 then
  begin
    if cmdExec.Active then
      cmdExec.Active := false;
    cmdExec.ParamByName('header_id').Value := order_id;
    cmdExec.Execute();

    frmElektronikHasilView.id := order_id;
    frmElektronikHasilView.id := QHdr.FieldByName('id').AsInteger;
    frmElektronikHasilView.edReceipt.Text := QHdr.FieldByName('email').AsString;
    frmElektronikHasilView.ShowModal;

  end;
end;

procedure TfrmHasil.btnPDFClick(Sender: TObject);
begin
  UniSession.SendFile(QPDF.FieldByName('pdf_file').AsString);
end;

end.
