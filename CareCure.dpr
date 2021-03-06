program CareCure;
uses
  Forms,
  windows,
  inifiles,
  Messages,
  Dialogs,
  Graphics,
  Controls,
  StdCtrls,
  Mask,
  Buttons,
  SysUtils,
  PublicFunOrPro in 'PublicFunOrPro.pas',
  Unit_About in 'Unit_About.pas' {frm_about},
  Unit_AttendConfig in 'Unit_AttendConfig.pas' {frm_attendconfig},
  Unit_AttendManager in 'Unit_AttendManager.pas' {frm_attendmanager},
  Unit_Attenstat in 'Unit_Attenstat.pas' {frm_attendstat},
  Unit_CardManager in 'Unit_CardManager.pas' {frm_cardmanager},
  Unit_CardTrack in 'Unit_CardTrack.pas' {frm_cardtrack},
  Unit_ChooseEmployee in 'Unit_ChooseEmployee.pas' {frm_chooseemployee},
  Unit_CreateCard in 'Unit_CreateCard.pas' {frm_createcard},
  Unit_Customer in 'Unit_Customer.pas' {frm_customer},
  Unit_Dictionary in 'Unit_Dictionary.pas' {frm_dictionary},
  Unit_Empattendance in 'Unit_Empattendance.pas' {frm_empattend},
  Unit_FrontCheck in 'Unit_FrontCheck.pas' {frm_frontcheck},
  Unit_Main in 'Unit_Main.pas' {frm_main},
  Unit_SelectReason in 'Unit_SelectReason.pas' {frm_selectreason},
  Unit_ServiceBooking in 'Unit_ServiceBooking.pas' {frm_servicebooking},
  Unit_ServiceItem in 'Unit_ServiceItem.pas' {frm_ServiceItem},
  Unit_ServiceMeal in 'Unit_ServiceMeal.pas' {frm_servicemeal},
  Unit_SpecialAttend in 'Unit_SpecialAttend.pas' {frm_specialattend},
  Unit_TotalPublic in 'Unit_TotalPublic.pas',
  Unit_Unit in 'Unit_Unit.pas' {frm_unit},
  Unit_Editpassword in 'Unit_Editpassword.pas' {frm_editpassword},
  Unit_BasicSalary in 'Unit_BasicSalary.pas' {frm_basicsalary},
  Unit_SalaryItem in 'Unit_SalaryItem.pas' {frm_salaryitem},
  Unit_ServiceItemExtra in 'Unit_ServiceItemExtra.pas' {frm_serviceitemextra},
  Unit_DayStatistic in 'Unit_DayStatistic.pas' {frm_daystatistic},
  Unit_MonthStatistic in 'Unit_MonthStatistic.pas' {frm_monthstatistic},
  Unit_SysInitial in 'Unit_SysInitial.pas' {frm_SysInitial},
  Unit_SalaryManager in 'Unit_SalaryManager.pas' {frm_salarymanager},
  Unit_ServiceMealExtra in 'Unit_ServiceMealExtra.pas' {frm_servicemealextra},
  Unit_ChooseCustomer in 'Unit_ChooseCustomer.pas' {frm_choosecustomer},
  preview in 'PREVIEW.PAS' {myprevform},
  Unit_ReportCustomer in 'Unit_ReportCustomer.pas' {frm_ReportCustomer},
  Unit_ReportEmployee in 'Unit_ReportEmployee.pas' {frm_reportemployee},
  Unit_Employee in 'Unit_Employee.pas' {frm_employee},
  Unit_ReportBasicSalary in 'Unit_ReportBasicSalary.pas'
  {frm_reportbasicsalary},
  Unit_ReportAttendStatistic in 'Unit_ReportAttendStatistic.pas'
  {frm_reportattendstatistic},
  Unit_ReportCustomerCard in 'Unit_ReportCustomerCard.pas'
  {frm_reportCustomerCard},
  Unit_ReportServiceBooking in 'Unit_ReportServiceBooking.pas'
  {frm_ReportServiceBooking},
  Unit_ReportDayStatistic in 'Unit_ReportDayStatistic.pas'
  {frm_ReportDayStatistic},
  Unit_ReportMonthStatistic in 'Unit_ReportMonthStatistic.pas'
  {frm_ReportMonthStatistic},
  Unit_ReportReceipt in 'Unit_ReportReceipt.pas' {frm_ReportReceipt},
  Unit_ReportSalary in 'Unit_ReportSalary.pas' {frm_ReportSalary},
  Unit_CustomerRegister in 'Unit_CustomerRegister.pas' {frm_CustomerRegister},
  Unit_DBini in 'Unit_DBini.pas' {frm_DBini},
  Unit_Splash in 'Unit_Splash.pas' {frm_splash},
  Unit_GoodsLoss in 'Unit_GoodsLoss.pas' {frm_GoodsLoss},
  Unit_SalesStatistic in 'Unit_SalesStatistic.pas' {frm_SalesStatistic},
  Unit_ReceiptQuery in 'Unit_ReceiptQuery.pas' {frm_ReceiptQuery},
  Unit_DataModule in 'Unit_DataModule.pas' {DMod: TDataModule},
  Unit_StoreList in 'Unit_StoreList.pas' {frm_StoreList},
  Unit_StoreChanges in 'Unit_StoreChanges.pas' {frm_StoreChanges},
  Unit_UserLogin in 'Unit_UserLogin.pas' {frm_UserLogin},
  Unit_GoodsRetail in 'Unit_GoodsRetail.pas' {frm_GoodsRetail},
  Unit_StoreCheck in 'Unit_StoreCheck.pas' {frm_StoreCheck},
  Unit_GoodsWholeSale in 'Unit_GoodsWholeSale.pas' {frm_GoodsWholeSale},
  Upreview in 'Upreview.pas' {fpreview},
  Unit_GoodsCheckIn in 'Unit_GoodsCheckIn.pas' {frm_GoodsCheckIn},
  Unit_GoodsBizReturn in 'Unit_GoodsBizReturn.pas' {frm_GoodsBizReturn},
  Unit_UserManage in 'Unit_UserManage.pas' {frm_UserManage},
  Unit_UserProfile in 'Unit_UserProfile.pas' {frm_UserProfile},
  Unit_StoreLimite in 'Unit_StoreLimite.pas' {frm_StoreLimite},
  Unit_SalesProfit in 'Unit_SalesProfit.pas' {frm_SalesProfit},
  Unit_BizDictionary in 'Unit_BizDictionary.pas' {frm_BizDictionary},
  Unit_GoodsDictionary in 'Unit_GoodsDictionary.pas' {frm_GoodsDictionary},
  Unit_GoodsDetail in 'Unit_GoodsDetail.pas' {frm_GoodsDetail},
  Unit_AdjustSaleStat in 'Unit_AdjustSaleStat.pas' {frm_AdjustSaleStat},
  Unit_WholeSaleSummary in 'Unit_WholeSaleSummary.pas' {frm_WholeSaleSummary},
  Unit_MemberBuyQuery in 'Unit_MemberBuyQuery.pas' {frm_MemberBuyQuery},
  Unit_MdbManager in 'Unit_MdbManager.pas' {frm_MdbManager},
  Unit_DataInitial in 'Unit_DataInitial.pas' {frm_DataInitial},
  Unit_StyleSet in 'Unit_StyleSet.pas' {frm_StyleSet},
  Unit_BizInfo in 'Unit_BizInfo.pas' {frm_BizInfo},
  Unit_MainFunPro in 'Unit_MainFunPro.pas';

{$R *.res}
var
  DBFile: Tinifile;
  DB_Source, DB_User, DB_Password: string;
  Frm_Dbini: Tfrm_DBini;
  //flash: tfrm_splash;
  conn: boolean;
begin

  Application.Initialize;

  //flash := tfrm_splash.Create(application);

  //flash.BitBtn1.Visible := false;
  //flash.Label4.Visible := true;
  //flash.Show;
  //flash.Update;
  //sleep(1000);

  Application.Title := '理疗保健智能管理系统';
  frm_splash := Tfrm_splash.Create(Application); //创建启动画面窗口
  frm_splash.Show; //显示启动窗口
  frm_splash.Update; //刷新窗口
  Application.CreateForm(TDMod, DMod); //创建工程窗口

  DBFile := tinifile.Create(extractfilepath(application.ExeName) +
    'CareCure.ini');
  DB_Source := DBFile.ReadString('caredata', 'DB_Source',
    'data/caremdb.mdb');
  DB_User := DBFile.ReadString('caredata', 'DB_User', 'admin');
  DB_Password := DBFile.ReadString('caredata', 'DB_Password', 'caredata');
  //读取设定界面风格
  Unit_MainFunPro.DefaultStyleSkin := DBFile.Readinteger('Style', 'DefaultSkin',
    0);
  Unit_MainFunPro.CustomStyleSkin := DBFile.ReadString('Style', 'CustomSkin',
    '0');
  //ClientHeight := DBFile.readinteger('WindowInfo', 'height', 400);
  //ClientWidth := DBFile.readinteger('WindowInfo', 'width', 400);
  //top := DBFile.readinteger('WindowInfo', 'top', 0);
  //left := DBFile.readinteger('WindowInfo', 'left', 0);
  DBFile.Free;

  DB_CONNString :=
    'Provider=Microsoft.Jet.OLEDB.4.0;Password="";' +
    'User ID=' + DB_User + ';Data Source=' + DB_Source + ';' +
    'Mode=Share Deny None;Extended Properties="";' +
    'Locale Identifier=1028;Jet OLEDB:System database="";' +
    'Jet OLEDB:Registry Path="";Jet OLEDB:' +
    'Database Password=' + DB_Password + ';Jet OLEDB:Engine Type=5;' +
    'Jet OLEDB:Database Locking Mode=1;' +
    'Jet OLEDB:Global Partial Bulk Ops=2;' +
    'Jet OLEDB:Global Bulk Transactions=1;' +
    'Jet OLEDB:New Database Password="";' +
    'Jet OLEDB:Create System Database=False;' +
    'Jet OLEDB:Encrypt Database=False;' +
    'Jet OLEDB:' +
    'Don' + '''t Copy Locale on Compact=False;' +
    'Jet OLEDB:Compact Without Replica Repair=False;' +
    'Jet OLEDB:SFP=False;';
  DMod.Adocon.ConnectionString := DB_CONNString;
  conn := true; //连接成功已否标志
  try
    DMod.Adocon.Connected := true;
  except
    conn := false;
  end;

  while not conn do
  begin
    if MessageBox(Application.Handle, '联接数据库服务器失败,是否重新配置连接?',
      '提示', MB_YESNO + mb_iconinformation) = 7 then
      break
    else
    begin
      Frm_DBini := TFrm_DBini.Create(nil);
      //nil表示该对象的创建和销毁都由自己完成
      Frm_DBini.ShowModal;
      Frm_DBini.Free;
      DBFile := tinifile.Create(extractfilepath(application.ExeName) +
        'CareCure.ini');
      DB_Source := DBFile.ReadString('caredata', 'DB_Source', 'caremdb.mdb');
      DB_User := DBFile.ReadString('caredata', 'DB_User', 'admin');
      DB_Password := DBFile.ReadString('caredata', 'DB_Password', '123456');
      //读取设定界面风格
      Unit_MainFunPro.DefaultStyleSkin := DBFile.Readinteger('Style',
        'DefaultSkin', 0);
      Unit_MainFunPro.CustomStyleSkin := DBFile.ReadString('Style',
        'CustomSkin',
        '0');
      //ClientHeight := DBFile.readinteger('WindowInfo', 'height', 400);
      //ClientWidth := DBFile.readinteger('WindowInfo', 'width', 400);
      //top := DBFile.readinteger('WindowInfo', 'top', 0);
      //left := DBFile.readinteger('WindowInfo', 'left', 0);
      DBFile.Free;
      DB_CONNString :=
        'Provider=Microsoft.Jet.OLEDB.4.0;Password="";' +
        'User ID=' + DB_User + ';Data Source=' + DB_Source + ';' +
        'Mode=Share Deny None;Extended Properties="";' +
        'Locale Identifier=1028;Jet OLEDB:System database="";' +
        'Jet OLEDB:Registry Path="";Jet OLEDB:' +
        'Database Password=' + DB_Password + ';Jet OLEDB:Engine Type=5;' +
        'Jet OLEDB:Database Locking Mode=1;' +
        'Jet OLEDB:Global Partial Bulk Ops=2;' +
        'Jet OLEDB:Global Bulk Transactions=1;' +
        'Jet OLEDB:New Database Password="";' +
        'Jet OLEDB:Create System Database=False;' +
        'Jet OLEDB:Encrypt Database=False;' +
        'Jet OLEDB:' +
        'Don' + '''t Copy Locale on Compact=False;' +
        'Jet OLEDB:Compact Without Replica Repair=False;' +
        'Jet OLEDB:SFP=False;';
      DMod.Adocon.ConnectionString := DB_CONNString;
      conn := true;
      try
        DMod.Adocon.Connected := true;
      except
        conn := false;
        //flash.Label4.Caption := '联接失败，请检验后台数据库状态！';
        //flash.Update;
        //sleep(500);
      end;
    end;
  end;

  if conn then
  begin
    DMod.toper.Open;
    DMod.tuser.Open;
    DMod.typzdk.Open;
    DMod.tkc.Open;
    //DMod.tyg.Open;
    DMod.tbm.Open;
    DMod.tdw.Open;
    //flash.Label4.Caption := '联接成功！请继续操作';
    //flash.Close;
    //flash.Free;
    Application.CreateForm(Tfrm_main, frm_main);

    frm_UserLogin := tfrm_UserLogin.Create(application);
    //Sleep(3000); //启动窗口延时3000=3秒钟
    frm_splash.Hide; //隐藏启动窗口
    frm_splash.Free; //释放启动窗口
    frm_UserLogin.ShowModal;
    //ShowModal表示显示一个独占焦点屏蔽其它窗口的可设置返回值的窗口，其关闭后才执行下面的语句。
    frm_UserLogin.Update;

    Application.Run;
  end
  else
    application.Terminate;
end.

