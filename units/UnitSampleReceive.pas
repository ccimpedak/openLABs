unit UnitSampleReceive;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniGUIBaseClasses, uniPanel, uniLabel, uniEdit,
  uniButton, uniGroupBox, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uniDBEdit, uniCheckBox,
  uniBasicGrid, uniDBGrid;

type
  TuniSampleReceive = class(TUniFrame)
    UniContainerPanel1: TUniContainerPanel;
    edSampleID: TUniEdit;
    UniLabel1: TUniLabel;
    btnCekData: TUniButton;
    UniContainerPanel2: TUniContainerPanel;
    UniContainerPanel3: TUniContainerPanel;
    UniGroupBox1: TUniGroupBox;
    QSample: TFDQuery;
    UniLabel2: TUniLabel;
    UniDBEdit1: TUniDBEdit;
    dsSample: TDataSource;
    UniLabel3: TUniLabel;
    UniDBEdit2: TUniDBEdit;
    UniLabel4: TUniLabel;
    UniDBEdit3: TUniDBEdit;
    UniLabel5: TUniLabel;
    UniDBEdit4: TUniDBEdit;
    UniLabel6: TUniLabel;
    UniDBEdit5: TUniDBEdit;
    UniLabel7: TUniLabel;
    UniDBEdit6: TUniDBEdit;
    btnReceive: TUniButton;
    cbAuto: TUniCheckBox;
    cmdRcv: TFDCommand;
    UniDBGrid1: TUniDBGrid;
    QReceiveLast: TFDQuery;
    dsReceiveLast: TDataSource;
    procedure UniFrameReady(Sender: TObject);
    procedure btnCekDataClick(Sender: TObject);
    procedure btnReceiveClick(Sender: TObject);
    procedure edSampleIDKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TuniSampleReceive.btnReceiveClick(Sender: TObject);
begin
  // receive sample
  if QSample.RecordCount > 0 then
  begin
    if cmdRcv.Active then
      cmdRcv.Active := False;
    cmdRcv.ParamByName('sample_id').Value := edSampleID.Text;
    cmdRcv.ParamByName('no_pendaftaran').Value :=
      QSample.FieldByName('no_pendaftaran').AsString;
    cmdRcv.ParamByName('user_id').Value := UniApplication.Cookies.GetCookie
      ('UserId');
    cmdRcv.ParamByName('tube').Value := QSample.FieldByName('tube').AsString;
    cmdRcv.Execute();

    UniSession.AddJS('Ext.toast({html: "Sampel [' + edSampleID.Text + '] a.n ['
      + QSample.FieldByName('nama').AsString +
      '] berhasil diterima.",  header: false, autoCloseDelay: 7 })');

    QSample.Active := False;
    edSampleID.clear;
    edSampleID.SetFocus;
    QReceiveLast.Refresh;
  end;
end;

procedure TuniSampleReceive.edSampleIDKeyPress(Sender: TObject; var Key: Char);
begin
  if Ord(Key) = VK_RETURN then
    btnCekDataClick(self);
end;

procedure TuniSampleReceive.btnCekDataClick(Sender: TObject);
begin
  ShowMask('Loading');
  UniSession.Synchronize();
  if edSampleID.Text <> '' then
  begin
    //
    if QSample.Active then
      QSample.Active := False;
    QSample.ParamByName('no_sid').Value := edSampleID.Text;
    QSample.Active := True;

    btnReceive.Enabled := False;

    if QSample.RecordCount = 0 then
    begin
      ShowMessage('No Sampel / Barcode [' + edSampleID.Text +
        '] tidak ditemukan.');
      edSampleID.clear;
      edSampleID.SetFocus;
    end
    else
    begin
      btnReceive.Enabled := True;
      if cbAuto.Checked then
        btnReceiveClick(self);
    end;

  end;

  HideMask;
end;

procedure TuniSampleReceive.UniFrameReady(Sender: TObject);
begin
  edSampleID.SetFocus;
  QReceiveLast.Open();
end;

initialization

RegisterClass(TuniSampleReceive);

end.
