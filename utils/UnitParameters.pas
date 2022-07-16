unit UnitParameters;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, uniGUIForm,
  uniGUIFrame,
  MainModule,
  uniGUIApplication,
  FireDAC.Comp.Client;

function GetParamsValue(name: string; mode_num: integer;
  Comp: TComponent): String;
procedure SetParamsValue(name: string; value: String; mode_num: integer;
  Comp: TComponent);

implementation

function GetParamsValue(name: string; mode_num: integer;
  Comp: TComponent): String;
var
  Q: TFDQuery;
begin
  Q := TFDQuery.Create(Comp);
  Q.Connection := UniMainModule.FDConnection1;
  Q.Params.Add.name := 'name';
  Q.Params.Add.name := 'organisasi_id';
  Q.ParamByName('name').value := name;
  Q.ParamByName('organisasi_id').value := UniApplication.Cookies.GetCookie
    ('OrganisasiId');
  Q.SQL.Text :=
    'select * from parameters where name = :name and organisasi_id = :organisasi_id ';
  Q.Open;
  if mode_num = 1 then
    Result := Q.FieldByName('value_num').AsString
  else if mode_num = 0 then
    Result := Q.FieldByName('value_char').AsString
  else
    Result := Q.FieldByName('value_text').AsString
end;

procedure SetParamsValue(name: string; value: String; mode_num: integer;
  Comp: TComponent);
var
  Q: TFDCommand;
begin
  Q := TFDCommand.Create(Comp);
  Q.Connection := UniMainModule.FDConnection1;
  Q.Params.Add.name := 'name';
  Q.Params.Add.name := 'value';
  Q.Params.Add.name := 'organisasi_id';
  Q.ParamByName('name').value := name;
  Q.ParamByName('value').value := value;
  Q.ParamByName('organisasi_id').value := UniApplication.Cookies.GetCookie
    ('OrganisasiId');
  if mode_num = 1 then
    Q.CommandText.Text :=
      'delete from parameters where name = :name and organisasi_id = :organisasi_id; '
      + 'insert parameters(name,value_num,organisasi_id) values (:name,:value,:organisasi_id)'
  else if mode_num = 0 then
    Q.CommandText.Text :=
      'delete from parameters where name = :name and organisasi_id = :organisasi_id; '
      + 'insert parameters(name,value_char,organisasi_id) values (:name,:value,:organisasi_id)'
  else
    Q.CommandText.Text :=
      'delete from parameters where name = :name and organisasi_id = :organisasi_id; '
      + 'insert parameters(name,value_text,organisasi_id) values (:name,:value,:organisasi_id)';
  Q.Execute;
end;

end.
