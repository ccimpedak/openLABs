unit UnitIsiHasil;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniLabel, uniEdit, uniMultiItem,
  uniComboBox, uniDBComboBox, uniDBLookupComboBox, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.Comp.Client;

type
  TfrmIsiHasil = class(TUniForm)
    UniLabel1: TUniLabel;
    lbNamaTest: TUniLabel;
    UniLabel3: TUniLabel;
    cbHasil: TUniComboBox;
    cmdHasil: TFDCommand;
    procedure UniFormAfterShow(Sender: TObject);
    procedure cbHasilKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  var
    order_detail_id: integer;
    HasilAsli, caller_form: string;
  end;

function frmIsiHasil: TfrmIsiHasil;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, Main, UnitDBHelper;

function frmIsiHasil: TfrmIsiHasil;
begin
  Result := TfrmIsiHasil(UniMainModule.GetFormInstance(TfrmIsiHasil));
end;

procedure TfrmIsiHasil.cbHasilKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  iValue, hasil_tipe, last_id: integer;
begin
  val(cbHasil.Text, iValue, hasil_tipe);
  if hasil_tipe <> 0 then
    hasil_tipe := 1;

  if Key = VK_RETURN then
  begin
    if HasilAsli <> cbHasil.Text then
    begin
      cmdHasil.Params.Clear;
      cmdHasil.Params.Add.Name := 'hasil_tipe';
      cmdHasil.ParamByName('hasil_tipe').Value := hasil_tipe;
      cmdHasil.Params.Add.Name := 'hasil_oleh';
      cmdHasil.ParamByName('hasil_oleh').Value :=
        UniApplication.Cookies.GetCookie('UserId');

      if hasil_tipe = 1 then
      begin
        cmdHasil.Params.Add.Name := 'result_char';
        cmdHasil.ParamByName('result_char').Value := cbHasil.Text;
        cmdHasil.CommandText.Text :=
          'insert into order_detail_result(hasil_tipe,result_char,hasil_oleh,hasil_dt) '
          + ' values (:hasil_tipe,:result_char,:hasil_oleh,NOW())';
        cmdHasil.Execute;
      end
      else
      begin
        cmdHasil.Params.Add.Name := 'result_num';
        cmdHasil.ParamByName('result_num').Value := cbHasil.Text;
        cmdHasil.CommandText.Text :=
          'insert into order_detail_result(hasil_tipe,result_num,hasil_oleh,hasil_dt) '
          + ' values (:hasil_tipe,:result_num,:hasil_oleh,NOW())';
        cmdHasil.Execute;
      end;

      last_id := GetLastInsertId(self);

      cmdHasil.Params.Add.Name := 'id';
      cmdHasil.ParamByName('id').Value := order_detail_id;
      cmdHasil.Params.Add.Name := 'order_detail_result_id';
      cmdHasil.ParamByName('order_detail_result_id').Value := last_id;
      cmdHasil.CommandText.Text :=
        'update order_detail set order_detail_result_id = :order_detail_result_id where id = :id';
      cmdHasil.Execute;

      if caller_form = 'UnitKDayList' then
      begin
        MainForm.frmDayList.QDtl.Active := False;
        MainForm.frmDayList.QDtl.Active := True;
      end;
      if caller_form = 'UnitKMedVal' then
      begin
        MainForm.frmMedVal.QDtl.Active := False;
        MainForm.frmMedVal.QDtl.Active := True;
      end;

      Close;
    end;
  end;
end;

procedure TfrmIsiHasil.UniFormAfterShow(Sender: TObject);
begin
  cbHasil.SetFocus;
end;

end.
