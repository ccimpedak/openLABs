unit ServerModule;

interface

uses
  Classes, SysUtils, uniGUIServer, uniGUIMainModule, uniGUIApplication,
  uIdCustomHTTPServer,
  uniGUITypes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Phys,
  FireDAC.Comp.Client, System.IniFiles;

type
  TUniServerModule = class(TUniGUIServerModule)
    FDManager1: TFDManager;
    procedure UniGUIServerModuleCreate(Sender: TObject);
    procedure UniGUIServerModuleDestroy(Sender: TObject);
    procedure UniGUIServerModuleBeforeInit(Sender: TObject);
  private
    { Private declarations }
  protected
    procedure FirstInit; override;
  public
    { Public declarations }
  end;

function UniServerModule: TUniServerModule;

implementation

{$R *.dfm}

uses
  UniGUIVars;

function UniServerModule: TUniServerModule;
begin
  Result := TUniServerModule(UniGUIServerInstance);
end;

procedure TUniServerModule.FirstInit;
begin
  InitServerModule(Self);
end;

procedure TUniServerModule.UniGUIServerModuleBeforeInit(Sender: TObject);
var
  Ini: TIniFile;
begin
  MimeTable.AddMimeType('ttf', 'application/font', False);

  Ini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'OpenLab.ini');
  try
    Port := Ini.ReadInteger('Settings', 'Port', 88);
  finally
    Ini.Free;
  end;
end;

procedure TUniServerModule.UniGUIServerModuleCreate(Sender: TObject);
begin
  MimeTable.AddMimeType('ttf', 'application/font', False);
  FDManager1.Active := True;
end;

procedure TUniServerModule.UniGUIServerModuleDestroy(Sender: TObject);
begin
  FDManager1.Active := False;
end;

initialization

RegisterServerModuleClass(TUniServerModule);

end.
