{$define UNIGUI_VCL} // Comment out this line to turn this project into an ISAPI module

{$ifndef UNIGUI_VCL}
library
{$else}
program
{$endif}
  OpenLab;

uses
  uniGUIISAPI,
  Forms,
  ServerModule in 'ServerModule.pas' {UniServerModule: TUniGUIServerModule},
  MainModule in 'MainModule.pas' {UniMainModule: TUniGUIMainModule},
  Main in 'Main.pas' {MainForm: TUniForm},
  UnitLogin in 'UnitLogin.pas' {UniLoginForm1: TUniLoginForm},
  UnitDokterBaru in 'UnitDokterBaru.pas' {frmDokterBaru: TUniForm},
  UnitReportDisplay in 'UnitReportDisplay.pas' {frmReportDisplay: TUniForm},
  UnitKuitansi in 'UnitKuitansi.pas' {frmKuitansi: TUniForm},
  UnitUser in 'UnitUser.pas' {frmUser: TUniForm},
  UnitPermDarah in 'UnitPermDarah.pas' {frmPermDarah: TUniForm},
  UnitPermDarahBaru in 'UnitPermDarahBaru.pas' {frmPermDarahBaru: TUniForm},
  UnitLapPenjualan in 'UnitLapPenjualan.pas' {frmLapPenjualan: TUniForm},
  UnitRegisterMCU in 'UnitRegisterMCU.pas' {frmRegisterBatchMCU: TUniForm},
  UnitCase in 'units\UnitCase.pas' {frmPACase: TUniForm},
  PatologiAnatomiCase in 'units\PatologiAnatomiCase.pas' {UniPatologiAnatomiCase: TUniFrame},
  UnitVKirimEmail in 'units\UnitVKirimEmail.pas' {UniVKirimEmail: TUniFrame},
  UnitEmail in 'UnitEmail.pas',
  UnitSetting in 'UnitSetting.pas' {frmSetting: TUniForm},
  UnitUserAdd in 'UnitUserAdd.pas' {frmUserAdd: TUniForm},
  UnitFotoPasien in 'forms\UnitFotoPasien.pas' {frmFotoPasien: TUniForm},
  UnitFOHomeService in 'forms\UnitFOHomeService.pas' {frmFOHomeService: TUniForm},
  UnitBayar in 'forms\UnitBayar.pas' {frmBayar: TUniForm},
  UnitFODaftar in 'forms\UnitFODaftar.pas' {frmFODaftar: TUniForm},
  UnitFOStatus in 'forms\UnitFOStatus.pas' {frmFOStatus: TUniForm},
  UnitPasienBaru in 'forms\UnitPasienBaru.pas' {frmPasienBaru: TUniForm},
  UnitQz in 'utils\UnitQz.pas',
  UnitProfilAsalBaru in 'forms\select\UnitProfilAsalBaru.pas' {frmProfilAsalBaru: TUniForm},
  UnitProfileBaru in 'forms\select\UnitProfileBaru.pas' {frmProfileBaru: TUniForm},
  UnitProfileMenuBaru in 'forms\select\UnitProfileMenuBaru.pas' {frmProfileMenuBaru: TUniForm},
  UnitRightBaru in 'forms\select\UnitRightBaru.pas' {frmRightBaru: TUniForm},
  UnitFOWorklist in 'units\UnitFOWorklist.pas' {UniFOWorklist: TUniFrame},
  UnitFODaftarMainWin in 'units\UnitFODaftarMainWin.pas' {UniFODaftarMainWin: TUniFrame},
  UnitProgramTB in 'units\UnitProgramTB.pas' {UniProgramTB: TUniFrame},
  UnitUsers in 'units\UnitUsers.pas' {UniUsers: TUniFrame},
  UnitViewerCriticalMon in 'units\UnitViewerCriticalMon.pas' {UniViewerCriticalMon: TUniFrame},
  UnitRepAllRecord in 'units\UnitRepAllRecord.pas' {UniRepAllRecord: TUniFrame},
  UnitAdmTests in 'units\UnitAdmTests.pas' {UniAdmTests: TUniFrame},
  UnitVHasilByMR in 'units\UnitVHasilByMR.pas' {UniVHasilByMR: TUniFrame},
  UnitProfilAkun in 'forms\UnitProfilAkun.pas' {frmProfilAkun: TUniForm},
  UnitLapPenjualanFilter in 'units\UnitLapPenjualanFilter.pas' {UniLapPenjualanFilter: TUniFrame},
  UnitLapor in 'forms\UnitLapor.pas' {frmLapor: TUniForm},
  UnitSettingAsal in 'forms\UnitSettingAsal.pas' {frmAsal: TUniForm},
  UnitAksesLogin in 'forms\UnitAksesLogin.pas' {frmAksesLogin: TUniForm},
  UnitMasterTube in 'forms\UnitMasterTube.pas' {frmMasterTube: TUniForm},
  UnitMasterSpecimen in 'forms\UnitMasterSpecimen.pas' {frmMasterSpecimen: TUniForm},
  UnitHasil in 'forms\UnitHasil.pas' {frmHasil: TUniForm},
  UnitPasienHistori in 'forms\UnitPasienHistori.pas' {frmPasienHistori: TUniForm},
  UnitElektronikHasilView in 'forms\UnitElektronikHasilView.pas' {frmElektronikHasilView: TUniForm},
  UnitPasien in 'forms\select\UnitPasien.pas' {frmPasien: TUniForm},
  UnitCariDokter in 'forms\select\UnitCariDokter.pas' {frmCariDokter: TUniForm},
  UnitAsal in 'forms\select\UnitAsal.pas' {frmCariAsal: TUniForm},
  UnitPilihRujukan in 'forms\select\UnitPilihRujukan.pas' {frmPilihRujukan: TUniForm},
  UnitReportJasper in 'utils\UnitReportJasper.pas',
  UnitLaporanHarian in 'forms\UnitLaporanHarian.pas' {frmLaporanHarian: TUniForm},
  UnitCariPasien in 'UnitCariPasien.pas' {frmCariPasien: TUniForm},
  UnitAdmTest in 'forms\UnitAdmTest.pas' {frmAdmTest: TUniForm},
  UnitEnvChart in 'forms\UnitEnvChart.pas' {frmEnvChart: TUniForm},
  UnitNotifList in 'forms\UnitNotifList.pas' {frmNotifList: TUniForm},
  UnitNotifAdd in 'forms\UnitNotifAdd.pas' {frmNotifAdd: TUniForm},
  UnitValidatorFields in 'utils\UnitValidatorFields.pas',
  UnitSetingNotif in 'forms\UnitSetingNotif.pas' {frmSetingNotif: TUniForm},
  UnitJasper in 'utils\UnitJasper.pas',
  UnitHarga in 'forms\UnitHarga.pas' {frmHarga: TUniForm},
  UnitHargaEdit in 'forms\select\UnitHargaEdit.pas' {frmHargaEdit: TUniForm},
  UnitKDayList in 'units\UnitKDayList.pas' {UniKDayList: TUniFrame},
  UnitCariOrder in 'forms\select\UnitCariOrder.pas' {frmCariOrder: TUniForm},
  UnitIsiHasil in 'forms\UnitIsiHasil.pas' {frmIsiHasil: TUniForm},
  UnitSelTest in 'forms\select\UnitSelTest.pas' {frmSelTest: TUniForm},
  UnitKMedVal in 'units\UnitKMedVal.pas' {UniKMedVal: TUniFrame},
  UnitDataModule in 'UnitDataModule.pas' {DatModule: TDataModule},
  UnitParameters in 'utils\UnitParameters.pas',
  UnitDBHelper in 'utils\UnitDBHelper.pas',
  UnitSampleReceive in 'units\UnitSampleReceive.pas' {uniSampleReceive: TUniFrame},
  UnitNilaiNormal in 'forms\UnitNilaiNormal.pas' {frmNilaiNormal: TUniForm};

{$R *.res}

{$ifndef UNIGUI_VCL}
exports
  GetExtensionVersion,
  HttpExtensionProc,
  TerminateExtension;
{$endif}

begin
{$ifdef UNIGUI_VCL}
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  TUniServerModule.Create(Application);
  Application.Run;
{$endif}
end.
