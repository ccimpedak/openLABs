unit UnitCariOrder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniEdit, uniGUIBaseClasses, uniLabel, uniButton,
  uniMultiItem, uniComboBox, uniDBComboBox, uniDBLookupComboBox,
  uniDateTimePicker, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uniGUIFrame;

type
  TfrmCariOrder = class(TUniForm)
    UniLabel1: TUniLabel;
    edNoMR: TUniEdit;
    UniLabel2: TUniLabel;
    edName: TUniEdit;
    UniLabel3: TUniLabel;
    dtTgl0: TUniDateTimePicker;
    UniLabel4: TUniLabel;
    dtTgl1: TUniDateTimePicker;
    cbTipepasien: TUniDBLookupComboBox;
    UniLabel5: TUniLabel;
    cbAsalPasien: TUniDBLookupComboBox;
    UniLabel6: TUniLabel;
    UniLabel7: TUniLabel;
    cbPerujuk: TUniDBLookupComboBox;
    UniLabel8: TUniLabel;
    cbAnsuransi: TUniDBLookupComboBox;
    UniLabel9: TUniLabel;
    NoLabDari: TUniEdit;
    UniLabel10: TUniLabel;
    NoLabSampai: TUniEdit;
    UniButton1: TUniButton;
    UniButton2: TUniButton;
    QTipePasien: TFDQuery;
    DSTipePasien: TDataSource;
    QAsalPasien: TFDQuery;
    DSAsalPasien: TDataSource;
    QPerujuk: TFDQuery;
    DSPerujuk: TDataSource;
    QAnsuransi: TFDQuery;
    DSAnsuransi: TDataSource;
    procedure UniButton2Click(Sender: TObject);
    procedure UniFormBeforeShow(Sender: TObject);
    procedure UniFormAfterShow(Sender: TObject);
    procedure UniButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function frmCariOrder: TfrmCariOrder;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, UnitKDayList, Main;

function frmCariOrder: TfrmCariOrder;
begin
  Result := TfrmCariOrder(UniMainModule.GetFormInstance(TfrmCariOrder));
end;

procedure TfrmCariOrder.UniButton1Click(Sender: TObject);
var
  sSQL: string;
begin
  with MainForm.frmDayList.QHeader do
  begin
    if Active then
      Active := False;

    sSQL := 'SELECT oh.id,date(oh.tanggal) tanggal,oh.nomor,p.noreg,p.nama,p.tanggal_lahir,jk.nama jenis_kelamin,tp.nama tipe_pasien, '
      + 'ap.nama asal_pasien, anp.nama ansuransi_pasien,d.nama dokter,oh.tanggal tanggal_dt '
      + 'FROM order_header oh ' + 'LEFT JOIN pasien p ON oh.pasien_id = p.id ' +
      'LEFT JOIN jenis_kelamin jk ON p.jenis_kelamin_id = jk.id ' +
      'LEFT JOIN tipe_pasien tp ON oh.tipe_pasien_id = tp.id ' +
      'LEFT JOIN asal_pasien ap ON oh.asal_pasien_id = ap.id ' +
      'LEFT JOIN ansuransi_pasien anp ON oh.ansuransi_pasien_id = anp.id ' +
      'LEFT JOIN dokter d ON oh.dokter_id = d.id ';

    sSQL := sSQL + 'WHERE oh.tanggal between ' +
      QuotedStr(FormatDateTime('YYYY-MM-DD 00:00:00', dtTgl0.DateTime)) +
      ' and ' + QuotedStr(FormatDateTime('YYYY-MM-DD 23:59:59', dtTgl1.DateTime)
      ) + ' and  oh.organisasi_id = ' + UniApplication.Cookies.GetCookie
      ('OrganisasiId') + ' and  oh.lokasi_id = ' +
      UniApplication.Cookies.GetCookie('LokasiId');
    if edNoMR.Text <> '' then
      sSQL := sSQL + ' AND p.noreg like ' + QuotedStr('%' + edNoMR.Text + '%');
    if edName.Text <> '' then
      sSQL := sSQL + ' AND p.nama like ' + QuotedStr('%' + edName.Text + '%');

    if cbTipepasien.Text <> '' then
      sSQL := sSQL + ' AND tp.id = ' + QTipePasien.FieldByName('id').AsString;

    if cbAsalPasien.Text <> '' then
      sSQL := sSQL + ' AND tp.id = ' + QAsalPasien.FieldByName('id').AsString;

    if cbPerujuk.Text <> '' then
      sSQL := sSQL + ' AND tp.id = ' + QPerujuk.FieldByName('id').AsString;

    if cbAnsuransi.Text <> '' then
      sSQL := sSQL + ' AND tp.id = ' + QAnsuransi.FieldByName('id').AsString;

    if (NoLabDari.Text <> '') and (NoLabSampai.Text <> '') then
      sSQL := sSQL + ' AND oh.nomor between  ' + QuotedStr(NoLabDari.Text) +
        ' and ' + QuotedStr(NoLabSampai.Text)
    else if (NoLabDari.Text <> '') and (NoLabSampai.Text = '') then
      sSQL := sSQL + ' AND oh.nomor =  ' + QuotedStr(NoLabDari.Text)
    else if (NoLabDari.Text = '') and (NoLabSampai.Text <> '') then
      sSQL := sSQL + ' AND oh.nomor <=  ' + QuotedStr(NoLabSampai.Text);

    SQL.Text := sSQL;

    // ShowMessage(sSQL);

    Active := True;

    if MainForm.frmDayList.QDtl.Active then
      MainForm.frmDayList.QDtl.Active := False;
    MainForm.frmDayList.QDtl.Active := True;
  end;

  Close;

end;

procedure TfrmCariOrder.UniButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmCariOrder.UniFormAfterShow(Sender: TObject);
begin
  edNoMR.SetFocus;
end;

procedure TfrmCariOrder.UniFormBeforeShow(Sender: TObject);
begin
  QTipePasien.Open();
  QAsalPasien.Open();
  QPerujuk.Open();
  QAnsuransi.Open();

  dtTgl0.DateTime := now;
  dtTgl1.DateTime := now;
end;

end.
