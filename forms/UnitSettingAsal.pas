unit UnitSettingAsal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniBasicGrid, uniDBGrid, uniPanel,
  uniGUIBaseClasses, uniButton, uniEdit, uniLabel, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmAsal = class(TUniForm)
    UniContainerPanel1: TUniContainerPanel;
    UniContainerPanel2: TUniContainerPanel;
    UniContainerPanel3: TUniContainerPanel;
    UniContainerPanel4: TUniContainerPanel;
    UniContainerPanel5: TUniContainerPanel;
    UniDBGrid1: TUniDBGrid;
    UniDBGrid2: TUniDBGrid;
    btnSembunyikan: TUniButton;
    btnTampilkan: TUniButton;
    UniLabel1: TUniLabel;
    edShow: TUniEdit;
    UniLabel2: TUniLabel;
    UniEdit2: TUniEdit;
    QShow: TFDQuery;
    DSShow: TDataSource;
    QHide: TFDQuery;
    DSHide: TDataSource;
    cmdUpdate: TFDCommand;
    procedure edShowChange(Sender: TObject);
    procedure UniEdit2Change(Sender: TObject);
    procedure UniFormAfterShow(Sender: TObject);
    procedure btnSembunyikanClick(Sender: TObject);
    procedure btnTampilkanClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function frmAsal: TfrmAsal;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

procedure updateSemuaGrid();
begin
  if frmAsal.QShow.Active then
    frmAsal.QShow.Active := False;
  frmAsal.QShow.Active := True;
  if frmAsal.QHide.Active then
    frmAsal.QHide.Active := False;
  frmAsal.QHide.Active := True;
end;

function frmAsal: TfrmAsal;
begin
  Result := TfrmAsal(UniMainModule.GetFormInstance(TfrmAsal));
end;

procedure TfrmAsal.btnTampilkanClick(Sender: TObject);
begin
 if QHide.RecordCount > 0 then
  begin
    cmdUpdate.Params.Clear;
    cmdUpdate.Params.Add.Name := 'id';
    cmdUpdate.CommandText.Text :=
      'UPDATE asal SET flg_tampilkan = 1 WHERE id = :id ';
    cmdUpdate.ParamByName('id').Value := QHide.FieldByName('id').AsInteger;
    cmdUpdate.Execute();
    updateSemuaGrid();
  end;
end;

procedure TfrmAsal.btnSembunyikanClick(Sender: TObject);
begin
  if QShow.RecordCount > 0 then
  begin
    cmdUpdate.Params.Clear;
    cmdUpdate.Params.Add.Name := 'id';
    cmdUpdate.CommandText.Text :=
      'UPDATE asal SET flg_tampilkan = 0 WHERE id = :id ';
    cmdUpdate.ParamByName('id').Value := QShow.FieldByName('id').AsInteger;
    cmdUpdate.Execute();
    updateSemuaGrid();
  end;
end;

procedure TfrmAsal.edShowChange(Sender: TObject);
begin
  if QShow.Active then
    QShow.Active := False;
  QShow.SQL.Text := 'SELECT * FROM asal WHERE flg_tampilkan = 1 ';
  if edShow.Text <> '' then
    QShow.SQL.Text := QShow.SQL.Text + ' AND deskripsi LIKE ' +
      QuotedStr('%' + edShow.Text + '%');
  QShow.SQL.Text := QShow.SQL.Text + ' ORDER BY deskripsi ';
  QShow.Active := True;
end;

procedure TfrmAsal.UniEdit2Change(Sender: TObject);
begin
  if QHide.Active then
    QHide.Active := False;
  QHide.SQL.Text := 'SELECT * FROM asal WHERE flg_tampilkan = 0 ';
  if QHide.Text <> '' then
    QHide.SQL.Text := QHide.SQL.Text + ' AND deskripsi LIKE ' +
      QuotedStr('%' + QHide.Text + '%');
  QHide.SQL.Text := QHide.SQL.Text + ' ORDER BY deskripsi ';
  QHide.Active := True;
end;

procedure TfrmAsal.UniFormAfterShow(Sender: TObject);
begin
  if QShow.Active then
    QShow.Active := False;
  QShow.Active := True;
  if QHide.Active then
    QHide.Active := False;
  QHide.Active := True;
end;

end.
