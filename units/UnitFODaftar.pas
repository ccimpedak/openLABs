unit UnitFODaftar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.Client,
  Data.DB, frxClass, frxDBSet, frxExportPDF, FireDAC.Comp.DataSet, uniBasicGrid,
  uniStringGrid, uniEdit, uniMultiItem, uniComboBox, uniDBComboBox,
  uniDBLookupComboBox, uniDateTimePicker, uniCheckBox, uniTreeView, uniMemo,
  uniLabel, Vcl.Imaging.jpeg, uniImage, uniPageControl, uniPanel, uniButton,
  uniGUIBaseClasses, uniGUIApplication, ServerModule, UnitUtils;

type
  TUniFODaftarmain = class(TUniFrame)
    UniButton1: TUniButton;
    procedure btnCariPasienClick(Sender: TObject);
    procedure edTestClick(Sender: TObject);
    procedure btnDetailClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnDiscountClick(Sender: TObject);
    procedure btnBayarClick(Sender: TObject);
    procedure UniButton1Click(Sender: TObject);
  private
    { Private declarations }
    // procedure DeleteTestCallback(Sender: TComponent; Res: Integer);
    // procedure insertLog(order_id: Integer; keterangan: string);
    // procedure CekReturOrBayar;

  var
    length_arr: Integer;
  public
    { Public declarations }

  var
    pasien_id, order_id, tipe_pasien, urgency, asal, penjamin, ruangan,
      tipe_hasil, call_form: string;
    b_clear: boolean;
    order_hdr_id: string;
    home_service_id: Integer;
    tgl_hasil: TDateTime;
    catatan_hasil: string;
    perujuk: string;
    jenis_kelamin_id: string;
  end;

implementation

{$R *.dfm}

uses UnitCariPasien, UnitFOStatus;

procedure TUniFODaftarmain.UniButton1Click(Sender: TObject);
begin
  frmDaftar.ShowModal;
end;

initialization

RegisterClass(TUniFODaftarmain);

end.
