unit MainModule;

interface

uses
  uniGUIMainModule, SysUtils, Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.ConsoleUI.Wait, FireDAC.Comp.UI, Data.DB,
  FireDAC.Comp.Client, FireDAC.Phys.ODBC, FireDAC.Phys.ODBCDef,
  FireDAC.VCLUI.Wait, FireDAC.Phys.ODBCBase, Main, FireDAC.Phys.Oracle,
  FireDAC.Phys.OracleDef;

type
  TUniMainModule = class(TUniGUIMainModule)
    FDConnection1: TFDConnection;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
    FDConn: TFDConnection;
    FDPhysOracleDriverLink1: TFDPhysOracleDriverLink;
    procedure UniGUIMainModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Main: TMainForm;
  end;

function UniMainModule: TUniMainModule;

implementation

{$R *.dfm}

uses
  UniGUIVars, ServerModule, uniGUIApplication;

function UniMainModule: TUniMainModule;
begin
  Result := TUniMainModule(UniApplication.UniMainModule)
end;

procedure TUniMainModule.UniGUIMainModuleCreate(Sender: TObject);
begin
  FDPhysMySQLDriverLink1.VendorLib := 'libmysql.dll';
end;

initialization

RegisterMainModuleClass(TUniMainModule);

end.
