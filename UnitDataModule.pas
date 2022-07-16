unit UnitDataModule;

interface

uses
  SysUtils, Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TDatModule = class(TDataModule)
    QPasien: TFDQuery;
    QOrder: TFDQuery;
    QOrderTests: TFDQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function DatModule: TDatModule;

implementation

{$R *.dfm}

uses
  UniGUIVars, uniGUIMainModule, MainModule;

function DatModule: TDatModule;
begin
  Result := TDatModule(UniMainModule.GetModuleInstance(TDatModule));
end;

initialization
  RegisterModuleClass(TDatModule);

end.
