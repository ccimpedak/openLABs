unit UnitPilihRujukan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniMultiItem, uniListBox,
  uniButton, uniLabel, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmPilihRujukan = class(TUniForm)
    lbRjk: TUniListBox;
    UniButton1: TUniButton;
    UniLabel1: TUniLabel;
    lblSelected: TUniLabel;
    QRjk: TFDQuery;
    procedure lbRjkClick(Sender: TObject);
    procedure UniFormBeforeShow(Sender: TObject);
    procedure UniButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    selectedRjk: string;
  end;

function frmPilihRujukan: TfrmPilihRujukan;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function frmPilihRujukan: TfrmPilihRujukan;
begin
  Result := TfrmPilihRujukan(UniMainModule.GetFormInstance(TfrmPilihRujukan));
end;

procedure TfrmPilihRujukan.lbRjkClick(Sender: TObject);
var
  i: integer;
begin
  lblSelected.Text := '';
  for i := 0 to lbRjk.Count - 1 do
  begin
    if lbRjk.selected[i] then
    begin
      if lblSelected.Text <> '' then
        lblSelected.Text := lblSelected.Text + ',';
      lblSelected.Text := lblSelected.Text + lbRjk.items.Strings[i];
    end;
  end;
end;

procedure TfrmPilihRujukan.UniButton1Click(Sender: TObject);
begin
  self.ModalResult := mrOk;
  selectedRjk := lblSelected.Caption;
  Close;
end;

procedure TfrmPilihRujukan.UniFormBeforeShow(Sender: TObject);
begin
  if QRjk.Active then
    QRjk.Active := False;
  QRjk.Active := True;

  lbRjk.items.Clear;
  QRjk.First;
  while not QRjk.Eof do
  begin
    lbRjk.items.Add(QRjk.FieldByName('rujukan').AsString);
    QRjk.Next;
  end;

end;

end.
