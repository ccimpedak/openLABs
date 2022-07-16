unit UnitDBHelper;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, uniGUIForm,
  uniGUIFrame,
  MainModule,
  uniGUIApplication,
  FireDAC.Comp.Client;

function GetLastInsertId(Comp: TComponent): integer;

implementation

function GetLastInsertId(Comp: TComponent): integer;
var
  Q: TFDQuery;
begin
  Q := TFDQuery.Create(Comp);
  Q.Connection := UniMainModule.FDConnection1;
  Q.SQL.Text := 'SELECT LAST_INSERT_ID() last_id';
  Q.Open;
  Result := Q.FieldByName('last_id').AsInteger;
end;

end.
