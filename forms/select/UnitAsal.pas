unit UnitAsal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniBasicGrid, uniDBGrid, uniEdit, uniLabel,
  uniGUIBaseClasses, uniPanel, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmCariAsal = class(TUniForm)
    UniContainerPanel1: TUniContainerPanel;
    UniLabel1: TUniLabel;
    edCari: TUniEdit;
    grdAsal: TUniDBGrid;
    QAsal: TFDQuery;
    dsAsal: TDataSource;
    procedure edCariKeyPress(Sender: TObject; var Key: Char);
    procedure grdAsalDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function frmCariAsal: TfrmCariAsal;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function frmCariAsal: TfrmCariAsal;
begin
  Result := TfrmCariAsal(UniMainModule.GetFormInstance(TfrmCariAsal));
end;

procedure TfrmCariAsal.edCariKeyPress(Sender: TObject; var Key: Char);
begin
  if Ord(Key) = VK_RETURN then
  begin
    // find pasien
    if QAsal.Active then
      QAsal.Active := False;
    QAsal.ParamByName('cari').Value := edCari.Text;
    QAsal.Active := True;
    grdAsal.SetFocus;
  end;
end;

procedure TfrmCariAsal.grdAsalDblClick(Sender: TObject);
begin
  Close;
  Self.ModalResult := mrOK;
end;

end.
