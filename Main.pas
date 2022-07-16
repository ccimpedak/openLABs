unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIRegClasses, uniGUIForm, Vcl.Menus, uniMainMenu,
  uniPageControl, uniGUIBaseClasses, uniPanel, uniTreeView, uniSplitter,
  uniImageList, uniToolBar, uniMultiItem, uniComboBox, uniStatusBar, uniLabel,
  UniGUIFrame, uniMemo, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.ExtCtrls, uniButton, uniBitBtn,
  uniSpeedButton, uniMenuButton, uniBasicGrid, uniDBGrid, uniTimer,
  UnitKDayList, UnitKMedVal;

type
  TMainForm = class(TUniForm)
    UniNativeImageList2: TUniNativeImageList;
    UniNativeImageList1: TUniNativeImageList;
    UniStatusBar1: TUniStatusBar;
    UniPanel1: TUniPanel;
    NavTree: TUniTreeView;
    UniToolBar1: TUniToolBar;
    UniToolButton1: TUniToolButton;
    UniToolButton2: TUniToolButton;
    UniToolButton3: TUniToolButton;
    UniToolButton4: TUniToolButton;
    SearchEdit: TUniComboBox;
    UniSplitter1: TUniSplitter;
    UniContainerPanel2: TUniContainerPanel;
    UniPageControl1: TUniPageControl;
    UniTabSheet1: TUniTabSheet;
    UniLabel2: TUniLabel;
    UniContainerPanel1: TUniContainerPanel;
    QMenu: TFDQuery;
    QMenuClass: TFDQuery;
    Header: TUniContainerPanel;
    UniPopupMenu1: TUniPopupMenu;
    Logout1: TUniMenuItem;
    btnAkun: TUniMenuButton;
    Gantipassword2: TUniMenuItem;
    UniContainerPanel3: TUniContainerPanel;
    lblTaskHead: TUniLabel;
    lblTaskNotif: TUniLabel;
    lblNotif: TUniLabel;
    btnNotif: TUniButton;
    QNotif: TFDQuery;
    QNotifList: TFDQuery;
    QNotifAct: TFDQuery;
    DataSource1: TDataSource;
    cmdUpd: TFDCommand;
    btnSetting: TUniButton;
    QTimeout: TFDQuery;
    DataSource2: TDataSource;
    DataSource3: TDataSource;
    QParameter: TFDQuery;
    btnLokasi: TUniMenuButton;
    upmLokasi: TUniPopupMenu;
    UniContainerPanel4: TUniContainerPanel;
    UniContainerPanel5: TUniContainerPanel;
    lblOrganisasi: TUniLabel;
    procedure Exit1Click(Sender: TObject);
    procedure Pendaftara1Click(Sender: TObject);
    procedure StatushasilPembayaran1Click(Sender: TObject);
    procedure LaporanHarian1Click(Sender: TObject);
    procedure UniFormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Gantipassword1Click(Sender: TObject);
    procedure Rilisnote1Click(Sender: TObject);
    procedure HomeService1Click(Sender: TObject);
    procedure Systemlog1Click(Sender: TObject);
    procedure User1Click(Sender: TObject);
    procedure mnPermDarahClick(Sender: TObject);
    procedure mnLapJualClick(Sender: TObject);
    procedure mnRegisterBatchMCUClick(Sender: TObject);
    procedure Automailer1Click(Sender: TObject);
    procedure est1Click(Sender: TObject);
    procedure SearchEditChange(Sender: TObject);
    procedure SearchTree(const AText: string);
    procedure UniToolButton1Click(Sender: TObject);
    procedure UniToolButton2Click(Sender: TObject);
    procedure UniToolButton4Click(Sender: TObject);
    procedure NavTreeClick(Sender: TObject);
    procedure UniTabSheet1Close(Sender: TObject; var AllowClose: Boolean);
    procedure UniFormCreate(Sender: TObject);
    procedure Navigate1Click(Sender: TObject);
    procedure TabSheetClose(Sender: TObject; var AllowClose: Boolean);
    procedure UniFormBeforeShow(Sender: TObject);
    procedure UniFormAfterShow(Sender: TObject);
    procedure mnSettingClick(Sender: TObject);
    procedure Logout1Click(Sender: TObject);
    procedure Gantipassword2Click(Sender: TObject);
    procedure btnNotifClick(Sender: TObject);
    procedure tmCekTimer(Sender: TObject);
    procedure UniTimer1Timer(Sender: TObject);
    procedure btnSettingClick(Sender: TObject);
  private
    FileNames: TStrings;
    PSString: string;
    procedure RefreshTime;
    procedure ConstructNavigator;
    function CreateImageIndex(filename: string): Integer;
    // procedure ConstructNavigator;
    procedure AddToSubMenu(ANode: TUniTreeNode);

  public
    { Public declarations }
    frmDayList: TUniKDayList;
    frmMedVal: TUniKMedVal;
  end;

function MainForm: TMainForm;

implementation

{$R *.dfm}

uses
  uniGUIVars, MainModule, uniGUIApplication, UnitPendaftaran,
  UnitStatusHasilPembayaran, UnitLaporanHarian, UnitGantiPassword,
  UnitReleaseNotes, UnitHomeService, UnitSyslog, UnitUser, UnitPermDarah,
  UnitLapPenjualan, UnitRegisterMCU, UnitElektronikHasil, UnitAdmTest,
  ServerModule, UniGUIJSUtils, uniStrUtils, IniFiles, UnitSetting,
  UnitSetingNotif;

function MainForm: TMainForm;
begin
  Result := TMainForm(UniMainModule.GetFormInstance(TMainForm));
end;

procedure TMainForm.TabSheetClose(Sender: TObject; var AllowClose: Boolean);
var
  Ts: TUniTabSheet;
  Nd: TUniTreeNode;
begin
  Ts := Sender as TUniTabSheet;
  Nd := Pointer(Ts.Tag);
  if Assigned(Nd) then
  begin
    Nd.Data := nil;
    if NavTree.Selected = Nd then
      NavTree.Selected := nil;
  end;
end;

procedure TMainForm.Navigate1Click(Sender: TObject);
var
  Nd: TUniTreeNode;
begin
  Nd := Pointer((Sender as TUniMenuItem).Tag);
  if Assigned(Nd) then
  begin
    NavTree.Selected := Nd;
    NavTreeClick(Nd);
  end;
end;

procedure TMainForm.AddToSubMenu(ANode: TUniTreeNode);
var
  M: TUniMenuItem;
begin
  // if Assigned(ANode) then
  // begin
  // M := TUniMenuItem.Create(Self);
  // M.Caption := ANode.Text;
  // M.Tag := UniInteger(ANode);
  // M.ImageIndex := ANode.ImageIndex;
  // M.OnClick := Navigate1Click;
  // Favorites1.Add(M);
  // end;
end;

procedure TMainForm.RefreshTime;
begin
  // UniStatusBar1.Panels[0].Text := FormatDateTime('dd/mm/yyyy hh:nn:ss', Now);
  // Timer1.Enabled := True;
end;

function TMainForm.CreateImageIndex(filename: string): Integer;
begin
  Result := UniNativeImageList2.AddIconFile(filename);
end;

procedure TMainForm.ConstructNavigator;
var
  RawS: RawByteString;
  S, S1, Path, SubS: string;
  sr: TSearchRec;
  Ls: TStringList;
  Txt: TextFile;
  I, iPos, index, groupindex, mainindex: Integer;
  Nd: TUniTreeNode;
  iconfile, groupIconFile, mainIconFile: string;

begin

  // UniMemo1.Lines.Clear;
  // UniMemo1.Lines.Add(UniServerModule.StartPath + 'units\');

  NavTree.Items.Clear;

  if QMenu.Active then
    QMenu.Active := False;
  QMenu.SQL.Text := ' select menu.id,name,description from user_menu ' +
    'left join menu on user_menu.menu_id = menu.id ' + ' where user_id =  ' +
    UniApplication.Cookies.GetCookie('UserId') + ' and parent_id = 0 ' +
    ' and menu.flg_aktif = ' + QuotedStr('Y') + ' ';

  QMenu.Active := True;

  QMenu.First;
  while not QMenu.Eof do
  begin
    Nd := NavTree.Items.Add(nil, QMenu.FieldByName('description').AsString);
    Nd.Tag := QMenu.FieldByName('id').AsInteger;
    // Nd.ImageIndex := -1;
  end;

  // UniMemo1.Lines.Add(QMenu.SQL.Text);

  // Path := ;

  // Ls := TStringList.Create;

  // try
  // if SysUtils.FindFirst(Path + '*.pas', faAnyFile, sr) = 0 then
  // begin
  // repeat
  // if (sr.Attr and faDirectory) = 0 then
  // begin
  // AssignFile(Txt, Path + sr.Name);
  // Reset(Txt);
  // ReadLn(Txt, RawS);
  // CloseFile(Txt);
  //
  // S := DecodeCharSet(RawS, 'utf-8');
  // iPos := Pos('//', S);
  // S := Trim(Copy(S, iPos + 2, MaxInt));
  // iPos := Pos('=', S);
  //
  // if iPos > 0 then
  // begin
  // S1 := Trim(Copy(S, 1, iPos - 1));
  // S := Trim(Copy(S, iPos + 1, MaxInt));
  // Ls.Add(S + '=' + S1);
  //
  // FileNames.Values[S1] := ExtractFileNameNoExt(sr.Name);
  // end;
  // end;
  // until FindNext(sr) <> 0;
  // FindClose(sr);
  // end;
  //
  // Ls.Sorted := True;
  //
  // for I := 0 to Ls.Count - 1 do
  // begin
  // S := Ls.Names[I];
  // SubS := Trim(Ls.ValueFromIndex[I]);
  // if S = '' then // Main
  // begin
  // Nd := NavTree.Items.Add(nil, SubS);
  // Nd.Data := UniTabSheet1;
  // mainIconFile := Path + 'Icons\main.ico';
  // if FileExists(mainIconFile) then
  // begin
  // mainindex := CreateImageIndex(mainIconFile);
  // end
  // else
  // mainindex := -1;
  // Nd.ImageIndex := mainindex;
  // UniTabSheet1.Caption := SubS;
  // UniTabSheet1.Tag := NativeInt(Nd);
  // UniTabSheet1.ImageIndex := mainindex;
  // NavTree.Selected := Nd;
  // end
  // else
  // begin
  // Nd := NavTree.Items.FindNodeByCaption(S);
  // if Nd = nil then
  // begin
  // Nd := NavTree.Items.Add(nil, S);
  // groupIconFile := Path + 'Icons\' + S + '.ico';
  // if FileExists(groupIconFile) then
  // begin
  // groupindex := CreateImageIndex(groupIconFile);
  // Nd.ImageIndex := groupindex;
  // end
  // else
  // Nd.ImageIndex := -1;
  // end;
  //
  // iconfile := Path + 'Icons\' + FileNames.Values[SubS] + '.ico';
  // if FileExists(iconfile) then
  // index := CreateImageIndex(iconfile)
  // else
  // index := -1;
  //
  // Nd := NavTree.Items.Add(Nd, SubS);
  // Nd.ImageIndex := index;
  //
  // end;
  //
  // end;
  // finally
  // Ls.Free;
  // end;
end;

procedure TMainForm.Automailer1Click(Sender: TObject);
begin
  frmElektronikHasil.ShowModal;
end;

procedure TMainForm.btnNotifClick(Sender: TObject);
begin
  // UniSession.Synchronize();
  // if btnNotif.Caption = 'Start' then
  // begin
  // tmCek.Enabled := True;
  // lblNotif.Caption := 'Aktif';
  // lblNotif.Font.Color := clGreen;
  // btnNotif.Caption := 'Stop';
  //
  // end
  // else
  // begin
  // tmCek.Enabled := False;
  // lblNotif.Caption := 'Non Aktif';
  // lblNotif.Font.Color := clRed;
  // btnNotif.Caption := 'Start'
  // end;
end;

procedure TMainForm.est1Click(Sender: TObject);
begin
  frmAdmTest.ShowModal;
end;

procedure TMainForm.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.Gantipassword1Click(Sender: TObject);
begin
  frmGantiPassword.ShowModal();
end;

procedure TMainForm.Gantipassword2Click(Sender: TObject);
begin
  frmGantiPassword.ShowModal();
end;

procedure TMainForm.HomeService1Click(Sender: TObject);
begin
  // frmHomeService.ShowModal();
end;

procedure TMainForm.LaporanHarian1Click(Sender: TObject);
begin
  frmLaporanHarian.ShowModal();
end;

procedure TMainForm.Logout1Click(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.mnLapJualClick(Sender: TObject);
begin
  frmLapPenjualan.ShowModal();
end;

procedure TMainForm.mnPermDarahClick(Sender: TObject);
begin
  frmPermDarah.ShowModal();
end;

procedure TMainForm.mnRegisterBatchMCUClick(Sender: TObject);
begin
  frmRegisterBatchMCU.ShowModal();
end;

procedure TMainForm.mnSettingClick(Sender: TObject);
begin
  // frmSetting.ShowModal;
end;

procedure TMainForm.NavTreeClick(Sender: TObject);
var
  Nd: TUniTreeNode;
  Ts: TUniTabSheet;
  FrC: TUniFrameClass;
  Fr: TUniFrame;
  FClassName, Path: string;
begin
  ShowMask('Loading');
  UniSession.Synchronize();

  Path := UniServerModule.StartPath + 'units\';
  Nd := NavTree.Selected;
  if Nd.Count = 0 then
  begin
    Ts := Nd.Data;
    if not Assigned(Ts) then
    begin
      Ts := TUniTabSheet.Create(self);
      Ts.PageControl := UniPageControl1;

      Ts.Closable := True;
      Ts.OnClose := TabSheetClose;
      Ts.Tag := NativeInt(Nd);
      Ts.Caption := Nd.Text;
      Ts.ImageIndex := Nd.ImageIndex;

      // Query Class name from DB
      if QMenuClass.Active then
        QMenuClass.Active := False;
      QMenuClass.ParamByName('id').Value := Nd.Tag;
      QMenuClass.Active := True;
      FClassName := QMenuClass.FieldByName('name').AsString;

      FrC := TUniFrameClass(FindClass(FClassName));

      Fr := FrC.Create(self);
      if FClassName = 'TUniKDayList' then
        frmDayList := Fr as TUniKDayList;

      if FClassName = 'TUniKMedVal' then
        frmMedVal := Fr as TUniKMedVal;

      Fr.Align := alClient;
      Fr.Parent := Ts;

      Nd.Data := Ts;
    end;
    UniPageControl1.ActivePage := Ts;
  end;

  HideMask;
end;

procedure TMainForm.Pendaftara1Click(Sender: TObject);
begin
  frmPendaftaran.ShowModal();
  frmPendaftaran.call_form := 'main';
end;

procedure TMainForm.Rilisnote1Click(Sender: TObject);
begin
  frmReleaseNote.Show();
end;

procedure TMainForm.SearchEditChange(Sender: TObject);
begin
  SearchTree(SearchEdit.Text);
end;

procedure TMainForm.SearchTree(const AText: string);
var
  S, SString: string;
  I: Integer;
  aExpand: Boolean;
begin
  SString := Trim(AText);
  if SString <> PSString then
  begin
    PSString := LowerCase(SString);
    if (Length(PSString) > 1) or (PSString = '') then
    begin
      aExpand := PSString <> '';
      NavTree.BeginUpdate;
      try
        NavTree.ResetData;
        for I := 0 to NavTree.Items.Count - 1 do
        begin
          S := LowerCase(NavTree.Items[I].Text);
          NavTree.Items[I].Visible := (Length(PSString) = 0) or
            (Pos(PSString, S) > 0);
          NavTree.Items[I].Expanded := aExpand;
        end;
      finally
        NavTree.EndUpdate;
      end;
    end;
  end;
end;

procedure TMainForm.StatushasilPembayaran1Click(Sender: TObject);
begin
  frmStatusHasilPembayaran.ShowModal();
end;

procedure TMainForm.Systemlog1Click(Sender: TObject);
begin
  frmSyslog.ShowModal();
end;

procedure TMainForm.btnSettingClick(Sender: TObject);
begin
  frmSetingNotif.ShowModal;
end;

procedure TMainForm.UniFormAfterShow(Sender: TObject);
var
  user_profile_id: string;
begin
  // ConstructNavigator;
  // disable selain admin
  user_profile_id := UniApplication.Cookies.GetCookie('user_profile_id');
  if StrToInt(user_profile_id) < 2 then
  begin
    // user biasa
    // mnSetting.Visible := False;
    // NavTree.Items[0].Visible := False;

  end;

  // disable menu tree jika
  if StrToInt(user_profile_id) <= 0 then
  begin
    try
      NavTree.Items[2].Destroy;
    except
      exit;
    end;
  end;

end;

procedure TMainForm.UniFormBeforeShow(Sender: TObject);
var
  CurrentMenuID, RecordMenuID: Integer;
  Node, MenuNode: TUniTreeNode;
begin

  lblOrganisasi.Caption := UniApplication.Cookies.GetCookie('OrganisasiNama');
  btnLokasi.Caption := UniApplication.Cookies.GetCookie('LokasiNama');

  CurrentMenuID := 0;
  NavTree.Items.Clear;
  MenuNode := nil;
  if QMenu.Active then
    QMenu.Active := False;

  QMenu.ParamByName('user_profile_id').Value := UniApplication.Cookies.GetCookie
    ('user_profile_id');
  QMenu.Active := True;

  try
    QMenu.First;
    while not QMenu.Eof do
    begin
      RecordMenuID := QMenu.FieldByName('menu_id').AsInteger;
      if (MenuNode = nil) or (RecordMenuID <> CurrentMenuID) then
      begin
        MenuNode := NavTree.Items.Add(nil, QMenu.FieldByName('menu').AsString);
        CurrentMenuID := RecordMenuID;
      end;
      Node := NavTree.Items.AddChild(MenuNode, QMenu.FieldByName('description')
        .AsString);
      Node.Tag := QMenu.FieldByName('id').AsInteger;
      QMenu.Next;
    end;
  finally
    QMenu.Close;
  end;

  // user
  btnAkun.Caption := UniApplication.Cookies.GetCookie('UserName');

  // cek param
  if QParameter.Active then
    QParameter.Active := False;
  QParameter.ParamByName('name').Value := 'ENABLE_TASK_MAIN';
  QParameter.Active := True;

  lblTaskHead.Visible := False;
  lblTaskNotif.Visible := False;
  lblNotif.Visible := False;
  btnNotif.Visible := False;
  btnSetting.Visible := False;

  if QParameter.FieldByName('value_char').AsString = 'Y' then
  begin
    lblTaskHead.Visible := True;
    lblTaskNotif.Visible := True;
    lblNotif.Visible := True;
    btnNotif.Visible := True;
    btnSetting.Visible := True;
  end;

end;

procedure TMainForm.UniFormCreate(Sender: TObject);
var
  I, Count: Integer;
  Ini: TIniFile;
begin

  UniTabSheet1.JSInterface.JSConfig('autoScroll', [True]);

  UniMainModule.Main := self;
  FileNames := TStringList.Create;
  RefreshTime;


  // FHomeUrl := '';

  SearchEdit.Text := '';

  // Favorites
  Ini := TIniFile.Create(UniServerModule.FilesFolderPath + 'Favorites.ini');
  try
    Count := Ini.ReadInteger('favorites', 'FavoritesCount', 0);
    for I := 0 to Count - 1 do
      AddToSubMenu(NavTree.Items.FindNodeByCaption(Ini.ReadString('favorites',
        IntToStr(I), '')));
  finally
    Ini.Free;
  end;

end;

procedure TMainForm.UniFormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = 65) and (Shift = [ssCtrl]) then
  begin
    frmPendaftaran.ShowModal();
  end;
  if (Key = 66) and (Shift = [ssCtrl]) then
  begin
    frmStatusHasilPembayaran.ShowModal();
  end;
end;

procedure TMainForm.UniTabSheet1Close(Sender: TObject; var AllowClose: Boolean);
var
  Ts: TUniTabSheet;
  Nd: TUniTreeNode;
begin
  Ts := Sender as TUniTabSheet;
  Nd := Pointer(Ts.Tag);
  if Assigned(Nd) then
  begin
    Nd.Data := nil;
    if NavTree.Selected = Nd then
      NavTree.Selected := nil;
  end;
end;

procedure TMainForm.UniTimer1Timer(Sender: TObject);
begin
  UniStatusBar1.Panels[0].Text := formatdatetime('dd/mm/yyyy hh:nn:ss', now);
end;

procedure TMainForm.tmCekTimer(Sender: TObject);
var
  ValidateOn, HasilDisplay: string;
  Timeout: Integer;
begin
  Timeout := 2;
  if QTimeout.Active then
    QTimeout.Active := False;
  QTimeout.ParamByName('user_id').Value := UniApplication.Cookies.GetCookie
    ('UserId');
  QTimeout.Active := True;
  if QTimeout.RecordCount > 0 then
    Timeout := QTimeout.FieldByName('value').AsInteger;

  UniSession.Synchronize();

  if QNotifList.Active then
    QNotifList.Active := False;
  QNotifList.ParamByName('user_id').Value := UniApplication.Cookies.GetCookie
    ('UserId');
  QNotifList.Active := True;

  if QNotifList.RecordCount > 0 then
  begin
    // proses pesan
    QNotifList.First;
    while not QNotifList.Eof do
    begin
      if QNotif.Active then
        QNotif.Active := False;
      QNotif.ParamByName('user_id').Value := UniApplication.Cookies.GetCookie
        ('UserId');
      QNotif.ParamByName('noreg').Value :=
        QNotifList.FieldByName('noreg').AsString;
      QNotif.Active := True;

      // cek if ada yang baru
      if QNotif.RecordCount > 0 then
      begin
        QNotif.First;
        while not QNotif.Eof do
        begin
          if QNotifAct.Active then
            QNotifAct.Active := False;

          QNotifAct.ParamByName('ID').Value := QNotif.FieldByName('ID')
            .AsString;
          QNotifAct.ParamByName('VALIDATE_ON').Value :=
            QNotif.FieldByName('VALIDATE_ON').AsString;

          QNotifAct.Active := True;

          if QNotifAct.RecordCount > 0 then
          begin
            QNotifAct.First;
            if QNotifAct.FieldByName('flag').AsString = '' then
              UniSession.AddJS('Ext.toast({html: "Hasil pasien <strong>' +
                QNotifAct.FieldByName('NAMA').AsString + '</strong><div style='
                + QuotedStr('color:blue') + '> ' + QNotifAct.FieldByName
                ('test_nm').AsString + ' <strong>' + QNotifAct.FieldByName
                ('result_value').AsString + '</strong> ' +
                QNotifAct.FieldByName('unit').AsString + ' ref:' +
                QNotifAct.FieldByName('ref_range').AsString +
                '</div>", header: false, autoCloseDelay: ' +
                IntToStr(Timeout * 1000) + '})')
            else
              UniSession.AddJS('Ext.toast({html: "Hasil pasien <strong>' +
                QNotifAct.FieldByName('NAMA').AsString + '</strong><div style='
                + QuotedStr('color:red') + '> ' + QNotifAct.FieldByName
                ('test_nm').AsString + ' <strong>' + QNotifAct.FieldByName
                ('result_value').AsString + '</strong> ' +
                QNotifAct.FieldByName('unit').AsString + ' ref:' +
                QNotifAct.FieldByName('ref_range').AsString +
                '</div>", header: false, autoCloseDelay: ' +
                IntToStr(Timeout * 1000) + '})');

            UniSession.Synchronize();
            ValidateOn := QNotifAct.FieldByName('validate_on').AsString;
            QNotifAct.Next;
            sleep(2000);
          end;
          QNotif.Next;
        end;
      end;

      if ValidateOn <> '' then
      begin
        // update valiteon
        if cmdUpd.Active then
          cmdUpd.Active := False;
        cmdUpd.CommandText.Text :=
          'UPDATE notifikasi SET last_result_detail_id = ' +
          QuotedStr(ValidateOn) + ' WHERE user_id = ' +
          QuotedStr(UniApplication.Cookies.GetCookie('UserId')) +
          ' AND noreg = ' + QuotedStr(QNotifList.FieldByName('noreg')
          .AsString) + ' ;';
        cmdUpd.Execute();
      end;

      QNotifList.Next;
    end;
  end;
  // tmCek.Enabled := True;
end;

procedure TMainForm.UniToolButton1Click(Sender: TObject);
begin
  NavTree.FullExpand;
end;

procedure TMainForm.UniToolButton2Click(Sender: TObject);
begin
  NavTree.FullCollapse;
end;

procedure TMainForm.UniToolButton4Click(Sender: TObject);
var
  I: Integer;
  Ts: TUniTabSheet;
begin
  for I := UniPageControl1.PageCount - 1 downto 0 do
  begin
    Ts := UniPageControl1.Pages[I];
    if Ts.Closable then
      Ts.Close;
  end;

end;

procedure TMainForm.User1Click(Sender: TObject);
begin
  frmUser.ShowModal();
end;

initialization

RegisterAppFormClass(TMainForm);

end.
