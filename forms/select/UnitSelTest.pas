unit UnitSelTest;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniLabel, uniButton, uniGUIBaseClasses,
  uniMultiItem, uniComboBox, uniDBComboBox, uniDBLookupComboBox,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TfrmSelTest = class(TUniForm)
    cbTest: TUniDBLookupComboBox;
    UniButton1: TUniButton;
    UniLabel1: TUniLabel;
    QTest: TFDQuery;
    dsTest: TDataSource;
    cmdTambah: TFDCommand;
    procedure UniFormBeforeShow(Sender: TObject);
    procedure UniButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  var
    exclude: integer;
    parent_test_id: integer;
  end;

function frmSelTest: TfrmSelTest;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, UnitAdmTest;

function frmSelTest: TfrmSelTest;
begin
  Result := TfrmSelTest(UniMainModule.GetFormInstance(TfrmSelTest));
end;

procedure TfrmSelTest.UniButton1Click(Sender: TObject);
begin
  if cbTest.Text <> '' then
  begin
    if cmdTambah.Active then
      cmdTambah.Active := false;
    cmdTambah.ParamByName('parent_test_id').Value := parent_test_id;
    cmdTambah.ParamByName('child_test_id').Value := QTest.FieldByName('id')
      .AsInteger;
    cmdTambah.Execute();

    if frmAdmTest.QConTest.Active then
      frmAdmTest.QConTest.Active := false;
    frmAdmTest.QConTest.Active := True;

    Close;

  end;
end;

procedure TfrmSelTest.UniFormBeforeShow(Sender: TObject);
begin
  if QTest.Active then
    QTest.Active := false;
  QTest.ParamByName('exclude_id').Value := exclude;
  QTest.ParamByName('organisasi_id').Value := UniApplication.Cookies.GetCookie
    ('OrganisasiId');
  QTest.Active := True;
end;

end.
