unit UnitFotoPasien;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniPanel, uniHTMLFrame,
  uniImage, uniButton, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmFotoPasien = class(TUniForm)
    frmWebcam: TUniHTMLFrame;
    imFoto: TUniImage;
    btnBatal: TUniButton;
    btnSave: TUniButton;
    QFoto: TFDQuery;
    procedure frmWebcamAjaxEvent(Sender: TComponent; EventName: string;
      Params: TUniStrings);
    procedure btnBatalClick(Sender: TObject);
    procedure UniFormBeforeShow(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
  private
    { Private declarations }
  var
    FN: String; // FileName
  public
    { Public declarations }
  var
    pasien_id: integer;
    call_from: string;
  end;

function frmFotoPasien: TfrmFotoPasien;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, EncdDecd, ServerModule, UnitFODaftar,
  UnitPasienBaru,System.NetEncoding;

function frmFotoPasien: TfrmFotoPasien;
begin
  Result := TfrmFotoPasien(UniMainModule.GetFormInstance(TfrmFotoPasien));
end;

procedure TfrmFotoPasien.btnSaveClick(Sender: TObject);
begin
  ShowMask('Loading');
  UniSession.Synchronize();
  if QFoto.Active then
    QFoto.Active := False;
  QFoto.Params.Clear;
  QFoto.Params.Add.Name := 'blobVal';
  QFoto.Params.ParamByName('blobVal').LoadFromFile(FN, ftBlob);
  QFoto.Params.Add.Name := 'pasien_id';
  QFoto.Params.ParamByName('pasien_id').Value := pasien_id;
  QFoto.SQL.Text :=
    'delete from pasien_photo where pasien_id = :pasien_id; insert pasien_photo (pasien_id,photo) values (:pasien_id,:blobVal);';
  QFoto.ExecSQL;

  if call_from = 'pendaftaran' then
    frmFODaftar.imFotoPasien.Picture.LoadFromFile(FN);

  if (call_from = 'pasien_baru') or (call_from = 'pasien_edit') then
  begin
    frmPasienBaru.imFoto.Picture.LoadFromFile(FN);
    frmPasienBaru.foto_fn := FN;
  end;

  HideMask();

  Close;

end;

procedure TfrmFotoPasien.frmWebcamAjaxEvent(Sender: TComponent;
  EventName: string; Params: TUniStrings);
var
  SS: TStringStream; // String-Stream (base64 encoded)
  MS: TMemoryStream; // Memory-/Binary-Stream
begin
  SS := TStringStream.Create(Params.Values['img']);
  try
    MS := TMemoryStream.Create();
    try
      DecodeStream(SS, MS);
      FN := UniServerModule.LocalCachePath + 'MyPic.jpg';
      MS.SaveToFile(FN);
      imFoto.Picture.LoadFromFile(FN);
      btnSave.Enabled := True;
    finally
      MS.Free;
    end;
  finally
    SS.Free;
  end;
end;

procedure TfrmFotoPasien.UniFormBeforeShow(Sender: TObject);
begin
  imFoto.Picture.LoadFromFile(UniServerModule.FilesFolderPath +
    'foto-kosong.jpg');
  if call_from = 'pendaftaran' then
    imFoto.Picture := frmFODaftar.imFotoPasien.Picture;
  if call_from = 'pasien_edit' then
    imFoto.Picture := frmPasienBaru.imFoto.Picture;

end;

procedure TfrmFotoPasien.btnBatalClick(Sender: TObject);
begin
  Close;
end;

end.

