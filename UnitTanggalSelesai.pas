unit UnitTanggalSelesai;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniDateTimePicker, uniGUIBaseClasses, uniLabel,
  uniButton, uniMemo;

type
  TfrmTanggalSelesai = class(TUniForm)
    UniLabel1: TUniLabel;
    dtTanggal: TUniDateTimePicker;
    mmCatatan: TUniMemo;
    UniButton1: TUniButton;
    UniButton2: TUniButton;
    procedure UniFormAfterShow(Sender: TObject);
    procedure UniButton2Click(Sender: TObject);
    procedure UniButton1Click(Sender: TObject);
    procedure UniFormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function frmTanggalSelesai: TfrmTanggalSelesai;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, UnitPendaftaran;

function frmTanggalSelesai: TfrmTanggalSelesai;
begin
  Result := TfrmTanggalSelesai(UniMainModule.GetFormInstance
    (TfrmTanggalSelesai));
end;

procedure TfrmTanggalSelesai.UniButton1Click(Sender: TObject);
begin
  frmPendaftaran.tgl_hasil := dtTanggal.DateTime;
  frmPendaftaran.catatan_hasil := mmCatatan.Lines.Text;
  Close;
end;

procedure TfrmTanggalSelesai.UniButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmTanggalSelesai.UniFormAfterShow(Sender: TObject);
begin
  dtTanggal.DateTime := Now();
  dtTanggal.DateTime := frmPendaftaran.tgl_hasil;
  mmCatatan.Lines.Text := frmPendaftaran.catatan_hasil;
end;

procedure TfrmTanggalSelesai.UniFormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Close;
end;

end.
