unit UnitEnvChart;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniButton, uniGUIBaseClasses, uniPanel, uniChart,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TfrmEnvChart = class(TUniForm)
    UniContainerPanel1: TUniContainerPanel;
    UniButton1: TUniButton;
    UniChart1: TUniChart;
    UniLineSeries1: TUniLineSeries;
    QHistori: TFDQuery;
    dsHist: TDataSource;
    procedure UniButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function frmEnvChart: TfrmEnvChart;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function frmEnvChart: TfrmEnvChart;
begin
  Result := TfrmEnvChart(UniMainModule.GetFormInstance(TfrmEnvChart));
end;

procedure TfrmEnvChart.UniButton1Click(Sender: TObject);
begin
  close;
end;

end.
