{******************************************************}
{                                                      }
{           系统登入窗口,对用户身份进行验证            }
{          writed by rgx,xdp 2001/11-2002/08           }
{                      『网络版』                      }
{                                                      }
{******************************************************}

unit login1;
//系统登入表单          

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Db, DBTables, ExtCtrls, ADODB, ExtDlgs,
  IdBaseComponent, IdComponent, IdIPWatch, IniFiles, activeX, elitee;

type
  Tfrm_login = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edit_loginname: TEdit;
    edit_psw: TEdit;
    Panel2: TPanel;
    btn_ok: TBitBtn;
    btn_cancel: TBitBtn;
    AdoConUser: TADOConnection;
    AdoQryUser: TADOQuery;
    DSUser: TDataSource;
    procedure btn_okClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_login: Tfrm_login;

implementation

{$R *.DFM}

uses u_main,u_public,u_lang;

procedure Tfrm_login.btn_okClick(Sender: TObject);
var
  user_password,user_permission:string;
  ulShareMode,ulRet,ulRealLen:Cardinal;
  Context:ELE_DEVICE_CONTEXT;
  bResult:boolean;
  InputBufferLen,OutputBufferLen:Cardinal;
  NameBuffer,InputBuffer:PChar;
  OutputBuffer:array[0..50] of char;
begin
  Application.Initialize;

  if edit_loginname.Text='' then
  begin
    ShowMessage(lang_msg_EnterUser);
    edit_loginname.SetFocus;
  end
  else if edit_psw.Text='' then
  begin
    ShowMessage(lang_msg_EnterPsw);
    edit_psw.SetFocus;
  end
  else begin
    RefreshRec(AdoQryUser,'select UserPermission,UserPassword from t_user where UserName='+QuotedStr(edit_loginname.Text));
    if AdoQryUser.RecordCount<1 then
    begin
      ShowMessage(lang_msg_UserNotExist);
      edit_psw.Text:='';
      edit_loginname.SetFocus;
    end
    else begin
      sys_user:=edit_loginname.Text;

      //加密狗配置
      ulShareMode:=ELE_SHARE_MODE;
      Context.ulSize:=sizeof(ELE_DEVICE_CONTEXT);
      bResult:=EleOpenFirstDevice(nil,nil,nil,ulShareMode,@Context);
      if not bResult then
      begin
        ulRet:=EleGetLastError();
        ShowMessage(lang_msg_NoSenseLock+IntToStr(ulRet));
        Exit;
      end;
      user_password:=AdoQryUser.FieldByName('UserPassword').AsString;
      NameBuffer:=PChar('LeeLenL8');
      InputBuffer:=PChar(user_password);
      InputBufferLen :=Length(InputBuffer);
      OutputBufferLen:=50;
      bResult:=EleExecute(@Context,NameBuffer,InputBuffer,InputBufferLen,OutputBuffer,OutputBufferLen,ulRealLen);
      if not bResult then
      begin
        ulRet:=EleGetLastError();
        ShowMessage(lang_msg_ExecuteFail+IntToStr(ulRet));
        Exit;
      end
      else begin
        user_password:=OutputBuffer;
        //user_password:='1';
        user_permission:=AdoQryUser.FieldByName('UserPermission').AsString;
        if (user_permission='管理员') or (user_permission='administrator') then
          user_permission:=lang_userType0;
        if user_password<>edit_psw.Text then
        begin
          ShowMessage(lang_UserErr);
          edit_psw.Text:='';
          edit_psw.SetFocus;
        end
        else begin
          sys_permit:=user_permission;

          //==========初始化程序时，若数据库中存在未下发指令，选择直接下发或者删除==========
          if Get_RecCount('select * from t_cmd where sent =0 or sent=2',AdoConUser)>0 then
          begin
            if MessageDlg('数据库中存在未下发指令，是否重发?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
            begin
              isSend:=true;
            end
            else begin
              isSend:=false;
            end;
          end;

          ModalResult:=mrOK;
        end;
      end;
      EleClose(@Context);
    end;
  end;
end;

procedure Tfrm_login.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
  AdoConUser.Close;
end;


procedure Tfrm_login.FormCreate(Sender: TObject);
var
  f:TIniFile;
  path_file_name:string;
  fileStr,connStr:string;
begin
  {if not ExistODBCDSN('LeeLenL8') then
  begin
    ShowMessage('请先运行系统配置程序,配置系统运行参数后再运行程序!');

    f_configure:=Tf_configure.Create(nil);
    f_configure.ShowModal;

    Close;
  end
  else begin
    Get_CurServerInfo('LeeLenL8',svr_name,svr_user,svr_psw);
    AdoConUser.ConnectionString:='Provider=MSDASQL.1;Password='+svr_psw+';Persist Security Info=True;User ID='+svr_user+';Data Source=LeeLenL8;Initial Catalog=LeeLenL8';
  end;}

  isSend:=true;

  if AdoConUser.Connected then AdoConUser.Close;

  //-----链接数据库-----
  {=1=单机版链接方式}
  {fileStr:=Get_CurDir()+'\L8.rgx';
  connStr:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+QuotedStr(fileStr)+';Persist Security Info=True;Mode=Share Deny Read|Share Deny Write;Jet OLEDB:Database Password='+QuotedStr('');
  AdoConUser.ConnectionString := connStr;
  AdoConUser.Open;}
  {=2=服务器版链接方式}
  AdoConUser.LoginPrompt:=false;
  AdoConUser.KeepConnection:=true;
  AdoConUser.ConnectionString:='FILE NAME='+Get_CurDir+'\LeeLenL8.udl';
  AdoConUser.Connected:=true;
  //---链接数据库完毕----

  path_file_name := Get_CurDir+'\lang_cn.ini';
  if not FileExists(path_file_name) then
  begin
    ShowMessage('No language file!');
    exit;
  end
  else begin
    f := TIniFile.Create(path_file_name);
    //加载语言
    lang_app_title     := f.ReadString('L8','sysTitle','立林L8小区管理软件-C');
    lang_UserErr       := f.ReadString('L8','msgUserErr','请输入正确的用户名和密码!');

    //---message---
    lang_msg_NoConfig  := f.ReadString('L8','msgNoConfig','没有配置文件!');
    lang_msg_NoLang    := f.ReadString('L8','msgNoLang','没有语言文件!');
    lang_msg_Comm      := f.ReadString('L8','msgComm','通信:已连接');
    lang_msg_NoComm    := f.ReadString('L8','msgNoComm','通信:未连接');

    lang_msg_GetAdminAuthor   := f.ReadString('L8','msgGetAdminAuthor','请取得管理员授权！');
    lang_msg_UnexpectedError  := f.ReadString('L8','msgUnexpectedError','发生意外错误!请退出重新执行程序!');

    lang_msg_RoomDataClear      := f.ReadString('L8','msgRoomDataClear','确定要清空房屋数据吗？');
    lang_msg_ClearFinish        := f.ReadString('L8','msgClearFinish','清除完成!');
    lang_msg_ClearFail          := f.ReadString('L8','msgClearFail','清除失败!');
    lang_msg_Initialize         := f.ReadString('L8','msgInitialize','正在努力初始化...');
    lang_msg_InitializeFinish   := f.ReadString('L8','msgInitializeFinish','初始化完成!');
    lang_msg_DelHaveChild       := f.ReadString('L8','msgDelHaveChild','有子项目,确定要全部删除吗？');

    lang_UnitON        := f.ReadString('L8','msgUnitON','主机上电');
    lang_UserON        := f.ReadString('L8','msgUserON','分机上电');

    lang_msg_ready     := f.ReadString('L8','msgReady','数据整理中，请稍候...');
    lang_msg_StartReg  := f.ReadString('L8','msgStartReg','开始注册...');
    lang_msg_RegOver   := f.ReadString('L8','msgRegOver','注册完毕!');

    lang_msg_SelectCmd      := f.ReadString('L8','msgSelectCmd','请选择注册或注销命令!');
    lang_msg_CardHaveCmd    := f.ReadString('L8','msgCardHaveCmd','该卡有未完成的操作!');
    lang_msg_InputUnit      := f.ReadString('L8','msgInputUnit','请输入正确的主机号码!');
    lang_msg_InputUser      := f.ReadString('L8','msgInputUser','请输入正确的分机号码!');
    lang_msg_InputDevice    := f.ReadString('L8','msgInputDevice','请输入设备编号!');
    lang_msg_InputDevRepeat := f.ReadString('L8','msgInputDevRepeat','设备编号重复!');
    lang_msg_Clearing       := f.ReadString('L8','msgClearing','数据清除中，请稍候...');
    lang_msg_ClearOver      := f.ReadString('L8','msgClearOver','数据清除完毕!');

    lang_msg_SysPrompts    := f.ReadString('L8','msgSysPrompts','系统提示');
    lang_msg_ImportSuccess := f.ReadString('L8','msgImportSuccess','数据导入成功！');
    lang_msg_ImportFail    := f.ReadString('L8','msgImportFail','数据导入失败！');
    lang_msg_ExportSuccess := f.ReadString('L8','msgExportSuccess','数据导出成功！');
    lang_msg_ExportFail    := f.ReadString('L8','msgExportFail','导出数据失败！请检查文件的格式是否正确！');
    lang_msg_NoCmd         := f.ReadString('L8','msgNoCmd','没有指令需要执行!');
    lang_msg_CmdSending    := f.ReadString('L8','msgCmdSending','指令开始执行...');
    lang_msg_SentOK        := f.ReadString('L8','msgSentOK','指令发送成功!');
    lang_msg_NeverSent     := f.ReadString('L8','msgNeverSent','指令未发送!');
    lang_msg_NoSent        := f.ReadString('L8','msgNoSent','指令发送失败!');
    lang_msg_CmdSentOver   := f.ReadString('L8','msgCmdSentOver','指令执行完毕!');

    lang_msg_LinkTimeout   := f.ReadString('L8','msgLinkTimeout','连接超时！');
    lang_msg_LinkFail      := f.ReadString('L8','msgLinkFail','通信未连接！');

    lang_msg_Times     := f.ReadString('L8','msgTimes','耗时:');
    lang_msg_Reading   := f.ReadString('L8','msgReading','读取中...');
    lang_msg_ReadOver  := f.ReadString('L8','msgReadOver','读取完毕');

    lang_do0           := f.ReadString('L8','msgDo0','未读');
    lang_do1           := f.ReadString('L8','msgDo1','已读');
    lang_do2           := f.ReadString('L8','msgDo2','已处理');

    lang_msg_Del          := f.ReadString('L8','msgDel','确实要删除该记录吗？');
    lang_msg_DelAll       := f.ReadString('L8','msgDelAll','确实要删除全部记录吗？');
    lang_msg_Clear        := f.ReadString('L8','msgClear','确定要对所选设备执行清除卡的操作吗？');
    lang_msg_DelConfirm   := f.ReadString('L8','msgDelConfirm','确实要删除');
    lang_msg_DelEnd       := f.ReadString('L8','msgDelEnd','吗？');

    lang_msg_QueryWrong   := f.ReadString('L8','msgQueryWrong','查询截止日期不能小于起始日期！');
    lang_msg_AlertRecord  := f.ReadString('L8','msgAlertRecord','预警记录');
    lang_msg_Data         := f.ReadString('L8','msgData','数据');

    lang_msg_ConfigSuccess  := f.ReadString('L8','msgConfigSuccess','您的配置已经生效！');
    lang_msg_UpdatingConfig := f.ReadString('L8','msgUpdatingConfig','正在更新配置，请稍候...');
    lang_msg_InstallSQL     := f.ReadString('L8','msgInstallSQL','请先安装SQL Server！');
    lang_msg_ConfigError    := f.ReadString('L8','msgConfigError','数据源配置出现意外错误,建议您手工配置!');
    lang_msg_ConfigException:= f.ReadString('L8','msgConfigException','在配置数据源的过程中出现了未知的错误，请重试！');

    lang_msg_SysCannotSet   := f.ReadString('L8','msgSysCannotSet','系统没有正确安装ODBC,无法进行设置!');
    lang_msg_DBPathError    := f.ReadString('L8','msgDBPathError','取数据库路径时出现错误,请与程序供应商联系!');

    lang_msg_CloseTables     := f.ReadString('L8','msgCloseTables','请关闭其它还在使用的表单！');
    lang_msg_NoDSN           := f.ReadString('L8','msgNoDSN','请先运行系统配置程序,配置系统运行参数后再运行程序!');
    lang_msg_SelBupDB        := f.ReadString('L8','msgSelBupDB','请选择需要备份的数据库！');
    lang_msg_SelResDB        := f.ReadString('L8','msgSelResDB','请选择需要恢复的数据库！');
    lang_msg_FileName        := f.ReadString('L8','msgFileName','文件名重复！');
    lang_msg_Backuping       := f.ReadString('L8','msgBackuping','正在备份数据库，请稍候！');
    lang_msg_Restoring       := f.ReadString('L8','msgRestoring','正在还原数据库，请稍候！');
    lang_msg_CreateFinish    := f.ReadString('L8','msgCreateFinish','创建成功！');
    lang_msg_CreateFail      := f.ReadString('L8','msgCreateFail','创建失败！');
    lang_msg_BackupFinish    := f.ReadString('L8','msgBackupFinish','备份成功！');
    lang_msg_BackupFail      := f.ReadString('L8','msgBackupFail','备份失败！');
    lang_msg_RestoreFinish   := f.ReadString('L8','msgRestoreFinish','还原成功！');
    lang_msg_RestoreFail     := f.ReadString('L8','msgRestoreFail','还原失败！');
    lang_msg_RestoreConfirm  := f.ReadString('L8','msgRestoreConfirm','需要将文件');
    lang_msg_RestoreInto     := f.ReadString('L8','msgRestoreInto','还原成数据库');

    lang_msg_UserNull        := f.ReadString('L8','msgUserNull','用户名不能为空！');
    lang_msg_UserExist       := f.ReadString('L8','msgUserExist','用户名已存在，请重新输入！');
    lang_msg_PswNull         := f.ReadString('L8','msgPswNull','密码不能为空！');
    lang_msg_PswDismatch     := f.ReadString('L8','msgPswDismatch','密码不一致，请重新输入！');

    lang_msg_EnterUser       := f.ReadString('L8','msgEnterUser','请输入账号名！');
    lang_msg_EnterPsw        := f.ReadString('L8','msgEnterPsw','请输入登录密码！');
    lang_msg_ChoosePermit    := f.ReadString('L8','msgChoosePermission','请选择账号权限！');
    lang_msg_UserNotExist    := f.ReadString('L8','msgUserNotExist','您输入的用户名不存在！');

    lang_msg_NoSenseLock     := f.ReadString('L8','msgNoSenseLock','打开加密狗设备失败，错误代码为:');
    lang_msg_ExecuteFail     := f.ReadString('L8','msgExecuteFail','执行加密狗模块失败，错误代码为:');

    lang_msg_OpenFail        := f.ReadString('L8','msgOpenFail','无法打开！');
    lang_msg_MaxScreen       := f.ReadString('L8','msgMaxScreen','分机最多只能存储32屏信息！');
    lang_msg_InfoEmpty       := f.ReadString('L8','msgInfoEmpty','信息为空！');
    lang_msg_OpenPort        := f.ReadString('L8','msgOpenPort','请打开通信端口！');
    lang_msg_ReleaseComplete := f.ReadString('L8','msgReleaseComplete','信息发布完毕！');
    lang_msg_SaveChanges     := f.ReadString('L8','msgSaveChanges','是否保存修改?');

    lang_msg_PortOpened      := f.ReadString('L8','msgPortOpened','通信端口已打开！');
    lang_msg_PortNotOpened   := f.ReadString('L8','msgPortNotOpened','通信端口未打开！');
    lang_msg_PortDisconnect  := f.ReadString('L8','msgPortDisConnect','通信端口已断开！');
    lang_msg_ProvideCard     := f.ReadString('L8','msgProvideCard','请提供卡号！');
    lang_msg_ProvideDevice   := f.ReadString('L8','msgProvideDevice','请提供设备号！');

    lang_msg_DownloadOK      := f.ReadString('L8','msgDownloadOK','下载成功！');
    lang_msg_ReadCardOK      := f.ReadString('L8','msgReadCardOK','卡号读取成功！');
    lang_msg_CommunicateFail := f.ReadString('L8','msgCommunicateFail','通信失败！');
    lang_msg_NoCard          := f.ReadString('L8','msgNoCard','无卡！');
    lang_msg_OperateOK       := f.ReadString('L8','msgOperateOK','操作成功！');
    lang_msg_OperateFail     := f.ReadString('L8','msgOperateFail','操作失败！');
    lang_msg_NoAvailable     := f.ReadString('L8','msgNoAvailable','无扇区可用！');
    lang_msg_NotCorrespond   := f.ReadString('L8','msgNotCorrespond','卡号不对应！');

    lang_msg_AddrExist   := f.ReadString('L8','msgAddrExist','楼栋信息已存在，无法重复添加！');
    lang_msg_DevExist    := f.ReadString('L8','msgDevExist','该设备已存在，无法重复添加！');
    lang_msg_UserMacAmount  := f.ReadString('L8','msgUserMacAmount','该分机已注册15张卡，请重新选择分机进行注册！');
    lang_msg_ChooseWall     := f.ReadString('L8','msgChooseWall','请选择需要注册的围墙机！');
    lang_msg_SelUnitWall    := f.ReadString('L8','msgSelUnitWall','请选择需要注册的主机和围墙机！');
    lang_msg_None           := f.ReadString('L8','msgNone','无');
    lang_msg_Extracting     := f.ReadString('L8','msgExtracting','提取中，请等待！');
    lang_msg_ExcelInstall   := f.ReadString('L8','msgExcelInstall','未安装EXCEL！');

    //---note---
    lang_note_Receive     := f.ReadString('L8','noteReceive','接收:');
    lang_note_Error       := f.ReadString('L8','noteError','错误:');
    lang_note_Send        := f.ReadString('L8','noteSend','发送:');

    lang_note_Call        := f.ReadString('L8','noteCall','呼叫分机');
    lang_note_Total       := f.ReadString('L8','noteTotal','共有');
    lang_note_Records     := f.ReadString('L8','noteRecords','笔记录');
    lang_note_Current     := f.ReadString('L8','noteCurrent','当前是第');
    lang_note_Record      := f.ReadString('L8','noteRecord','笔记录');

    //---caption---
    lang_menu1        := f.ReadString('L8','menu1','房产管理');
    lang_menu2        := f.ReadString('L8','menu2','设备信息');
    lang_menu3        := f.ReadString('L8','menu3','门禁管理');
    lang_menu31       := f.ReadString('L8','menu31','下载卡');
    lang_menu32       := f.ReadString('L8','menu32','注销卡');
    lang_menu33       := f.ReadString('L8','menu33','提取卡');
    lang_menu34       := f.ReadString('L8','menu34','清除卡');
    lang_menu35       := f.ReadString('L8','menu35','卡中心');
    lang_menu36       := f.ReadString('L8','menu36','发卡器');
    lang_menu37       := f.ReadString('L8','menu37','写卡器');
    lang_menu4        := f.ReadString('L8','menu4','报警中心');
    lang_menu5        := f.ReadString('L8','menu5','刷卡记录');
    lang_menu6        := f.ReadString('L8','menu6','设置');

    lang_pMenuAddrAdd     := f.ReadString('L8','pMenuAddrAdd','增加楼栋');
    lang_pMenuAddrEdit    := f.ReadString('L8','pMenuAddrEdit','编辑楼栋');
    lang_pMenuAddrDel     := f.ReadString('L8','pMenuAddrDel','删除楼栋');
    lang_pMenuAddrRefresh := f.ReadString('L8','pMenuAddrRefresh','刷新楼栋');
    lang_pMenuAddrParam   := f.ReadString('L8','pMenuAddrParam','楼栋参数');

    lang_pMenuDevAdd   := f.ReadString('L8','pMenuDevAdd','增加设备');
    lang_pMenuDevEdit  := f.ReadString('L8','pMenuDevEdit','编辑设备');
    lang_pMenuDevDel   := f.ReadString('L8','pMenuDevDel','删除设备');
    lang_pMenuRefresh  := f.ReadString('L8','pMenuRefresh','刷新设备');

    lang_pMenuUserAdd   := f.ReadString('L8','pMenuUserAdd','添加账号');
    lang_pMenuUserEdit  := f.ReadString('L8','pMenuUserEdit','编辑权限');
    lang_pMenuUserDel   := f.ReadString('L8','pMenuUserDel','删除账号');

    lang_gbDev       := f.ReadString('L8','gbDev','请选择设备');
    lang_gbCardType  := f.ReadString('L8','gbCardType','请选择注册卡类型');
    lang_ckbBatch    := f.ReadString('L8','ckbBatch','批量注册');

    lang_gbServiceDoor := f.ReadString('L8','gbServiceDoor','物业卡主机');

    lang_gbCommandSending  := f.ReadString('L8','gbCommandSending','待发送指令框');
    lang_gbCommandReceived := f.ReadString('L8','gbCommandReceived','接收指令框');
    lang_gbCommand         := f.ReadString('L8','gbCommand','指令框');
    lang_gbCommandState    := f.ReadString('L8','gbCommandState','指令状态框');

    lang_gbComLink    := f.ReadString('L8','gbComLink','通信连接');
    lang_gbOptions    := f.ReadString('L8','gbOptions','选项');
    lang_gbCardList   := f.ReadString('L8','gbCardList','卡列表');
    lang_gbDevNO      := f.ReadString('L8','gbDevNO','设备号码');
    lang_gbOperateCmd := f.ReadString('L8','gbOperateCmd','操作命令');

    lang_gbUserAdmin := f.ReadString('L8','gbUserAdmin','用户管理');
    lang_gbPersonal  := f.ReadString('L8','gbPersonal','个人中心');

    lang_cpCommunity := f.ReadString('L8','cpCommunity','小区');

    //---DBGrid---
    lang_dgAddrColum1 := f.ReadString('L8','dgAddrColum1','设备地址');
    lang_dgAddrColum2 := f.ReadString('L8','dgAddrColum2','上属楼栋');
    lang_dgAddrColum3 := f.ReadString('L8','dgAddrColum3','设备号码');
    lang_dgAddrColum4 := f.ReadString('L8','dgAddrColum4','备注');

    lang_dgDevColum1  := f.ReadString('L8','dgDevColum1','设备类型');
    lang_dgDevColum2  := f.ReadString('L8','dgDevColum2','设备号码');
    lang_dgDevColum3  := f.ReadString('L8','dgDevColum3','设备地址');
    lang_dgDevColum4  := f.ReadString('L8','dgDevColum4','备注');

    lang_dgAlarmColum1  := f.ReadString('L8','dgAlarmColum1','报警类型');
    lang_dgAlarmColum2  := f.ReadString('L8','dgAlarmColum2','设备地址');
    lang_dgAlarmColum3  := f.ReadString('L8','dgAlarmColum3','状态');
    lang_dgAlarmColum4  := f.ReadString('L8','dgAlarmColum4','报警时间');
    lang_dgAlarmColum5  := f.ReadString('L8','dgAlarmColum5','报警内容');
    lang_dgAlarmColum6  := f.ReadString('L8','dgAlarmColum6','处理情况');

    lang_dgCardRecColum1 := f.ReadString('L8','dgCardRecColum1','卡类型');
    lang_dgCardRecColum2 := f.ReadString('L8','dgCardRecColum2','卡号');
    lang_dgCardRecColum3 := f.ReadString('L8','dgCardRecColum3','刷卡点');
    lang_dgCardRecColum4 := f.ReadString('L8','dgCardRecColum4','刷卡时间');

    lang_dgUserColum1  := f.ReadString('L8','dgUserColum1','账号名');
    lang_dgUserColum2  := f.ReadString('L8','dgUserColum2','账号权限');
    lang_dgUserColum3  := f.ReadString('L8','dgUserColum3','账号密码');

    lang_dgCardColum1  := f.ReadString('L8','dgCardColum1','卡类型');
    lang_dgCardColum2  := f.ReadString('L8','dgCardColum2','卡号');
    lang_dgCardColum3  := f.ReadString('L8','dgCardColum3','主机');
    lang_dgCardColum4  := f.ReadString('L8','dgCardColum4','分机');
    lang_dgCardColum5  := f.ReadString('L8','dgCardColum5','卡状态');
    lang_dgCardColum6  := f.ReadString('L8','dgCardColum6','围墙机');
    lang_dgCardColum7  := f.ReadString('L8','dgCardColum7','属性');
    lang_dgCardColum8  := f.ReadString('L8','dgCardColum8','姓名');

    //---Label---
    lang_labType          := f.ReadString('L8','labType','类型');
    lang_labAddr          := f.ReadString('L8','labAddr','地址');
    lang_labDevNON         := f.ReadString('L8','labDevNo','设备号码');
    lang_labUnitMac       := f.ReadString('L8','labUnitMac','主机');
    lang_labUserMac       := f.ReadString('L8','labUserMac','分机');
    lang_labAmount        := f.ReadString('L8','labAmount','数量');
    lang_labCardNO        := f.ReadString('L8','labCardNo','卡号');
    lang_labCOM           := f.ReadString('L8','labCOM','通信端口');
    lang_labWall          := f.ReadString('L8','labWall','围墙机');
    lang_labDeadLine      := f.ReadString('L8','labDeadLine','期限');
    lang_labMemo          := f.ReadString('L8','labMemo','备注');
    lang_labTo            := f.ReadString('L8','labTo','到');
    lang_labName          := f.ReadString('L8','labName','名称');
    lang_labUserName      := f.ReadString('L8','labUserName','用户名:');
    lang_labPassword      := f.ReadString('L8','labPassword','登录密码:');
    lang_labPermission    := f.ReadString('L8','labPermission','用户权限:');

    lang_labCardNOHex     := f.ReadString('L8','labCardNOHex','卡号(十六进制)');
    lang_labIndoorPhone   := f.ReadString('L8','labIndoorPhone','分机号(6位)');

    lang_labDefaultName   := f.ReadString('L8','labDefaultName','某某');

    lang_labCOMProperty   := f.ReadString('L8','labCOMProperty','通讯属性');
    lang_typeSerialPort   := f.ReadString('L8','typeSerialPort','采用串行口(RS-232)通讯');
    lang_typeProtocol     := f.ReadString('L8','typeProtocol','采用网络(TCP/IP协议)通讯');
    lang_labCenterNumber  := f.ReadString('L8','labCenterNumber','管理中心号码');
    lang_labReceivePort   := f.ReadString('L8','labReceivePort','接收端口');
    lang_labSendPort      := f.ReadString('L8','labSendPort','发送端口');

    lang_labUser          := f.ReadString('L8','labUser','用户名:');
    lang_labPsw           := f.ReadString('L8','labPsw','用户密码:');
    lang_labNewUser       := f.ReadString('L8','labNewUser','新用户名:');
    lang_labNewPsw        := f.ReadString('L8','labNewPsw','请输入新密码:');
    lang_labNewPswConfirm := f.ReadString('L8','labNewPswConfirm','请确认新密码:');

    //---UserParam---
    lang_gbUserP1   := f.ReadString('L8','gbUserP1','栋号');
    lang_gbUserP2   := f.ReadString('L8','gbUserP2','单元');
    lang_gbUserP3   := f.ReadString('L8','gbUserP3','层号');
    lang_gbUserP4   := f.ReadString('L8','gbUserP4','房号');

    lang_labNoLen     := f.ReadString('L8','labNoLen','编码位数');
    lang_labFromTo    := f.ReadString('L8','labFromTo','从                       到');
    lang_DateFromTo   := f.ReadString('L8','labDateFromTo','日期从...到...');
    lang_labNoName    := f.ReadString('L8','labNoName','编码名称');
    lang_labNoOrd     := f.ReadString('L8','labNoOrd','编码顺序');

    lang_bName := f.ReadString('L8','bName','栋'); //栋,幢,号楼,#楼
    lang_uName := f.ReadString('L8','uName','单元'); //单元,梯,门
    lang_fName := f.ReadString('L8','fName','层'); //楼,层,F
    lang_hName := f.ReadString('L8','hName','室'); //室

    lang_ckbDev    := f.ReadString('L8','ckbDev','同时初始化设备');
    lang_labID     := f.ReadString('L8','labID','标识');
    lang_labDevNO  := f.ReadString('L8','labDevNO','设备号');
    lang_labDevName:= f.ReadString('L8','labDevName','名称');
    
    lang_btnEG     := f.ReadString('L8','btnEG','示例');
    lang_btnUser   := f.ReadString('L8','btnUser','初始化');

    //---Types---
    lang_devType0      := f.ReadString('L8','devType0','管理机');
    lang_devType1      := f.ReadString('L8','devType1','主机');
    lang_devType2      := f.ReadString('L8','devType2','副主机');
    lang_devType3      := f.ReadString('L8','devType3','分机');
    lang_devType4      := f.ReadString('L8','devType4','围墙机');
    lang_devTypeA      := f.ReadString('L8','devTypeA','全部设备');
    lang_devTypeN      := f.ReadString('L8','devTypeN','无设备');

    lang_cardType0     := f.ReadString('L8','cardType0','住户卡');
    lang_cardType1     := f.ReadString('L8','cardType1','物业卡');
    lang_cardType2     := f.ReadString('L8','cardType2','系统卡');
    lang_cardType3     := f.ReadString('L8','cardType3','巡更卡');

    lang_cardTypeX     := f.ReadString('L8','cardTypeX','无效卡');
    lang_cardTypeV     := f.ReadString('L8','cardTypeV','有效卡');
    lang_cardTypeC     := f.ReadString('L8','cardTypeC','普通卡');
    lang_cardTypeU     := f.ReadString('L8','cardTypeU','未知');
    lang_cardTypeA     := f.ReadString('L8','cardTypeA','全部');

    lang_alarmType0     := f.ReadString('L8','alarmType0','求助报警');
    lang_alarmType1     := f.ReadString('L8','alarmType1','开门报警');
    lang_alarmType2     := f.ReadString('L8','alarmType2','主机上电');
    lang_alarmType3     := f.ReadString('L8','alarmType3','分机上电');
    lang_alarmType4     := f.ReadString('L8','alarmType4','防区触发报警');

    lang_alarmState0    := f.ReadString('L8','alarmState0','未读');
    lang_alarmState1    := f.ReadString('L8','alarmState1','已读');
    lang_alarmState2    := f.ReadString('L8','alarmState2','未处理');
    lang_alarmState3    := f.ReadString('L8','alarmState3','已处理');
    lang_alarmState4    := f.ReadString('L8','alarmState4','全部');

    lang_userType0    := f.ReadString('L8','userType0','管理员');
    lang_userType1    := f.ReadString('L8','userType1','访客');

    lang_chosenYes    := f.ReadString('L8','chosenYes','是');
    lang_chosenNo     := f.ReadString('L8','chosenNo','否');

    lang_stateInvalid  := f.ReadString('L8','stateInvalid','无效');
    lang_stateValid    := f.ReadString('L8','stateValid','有效');
    lang_stateUnknown  := f.ReadString('L8','stateUnknown','未知');

    //---Button---
    lang_btnQry   := f.ReadString('L8','btnQry','查询');
    lang_btnOK    := f.ReadString('L8','btnOK','确定');
    lang_btnCancel:= f.ReadString('L8','btnCancel','取消');
    lang_btnSel   := f.ReadString('L8','btnSel','选取');
    lang_btnImport:= f.ReadString('L8','btnImport','导入Excel表格数据');
    lang_btnExport:= f.ReadString('L8','btnExport','导出Excel表格');
    lang_btnDel   := f.ReadString('L8','btnDel','删除');
    lang_btnClear := f.ReadString('L8','btnClear','清除');
    lang_btnDownLoad := f.ReadString('L8','btnDownLoad','下载卡');
    lang_btnExtract  := f.ReadString('L8','btnExtract','提取');
    lang_btnConnect  := f.ReadString('L8','btnConnect','连接');
    lang_btnDisCon   := f.ReadString('L8','btnDisCon','断开');
    lang_btnRead     := f.ReadString('L8','btnRead','读取卡号');
    lang_btnCancelCard := f.ReadString('L8','btnCancelCard','注销卡');
    lang_btnEditTime   := f.ReadString('L8','btnEditTime','修改时间');
    lang_btnCardStatus := f.ReadString('L8','btnCardStatus','卡状态');
    lang_btnRestoreCard:= f.ReadString('L8','btnRestoreCard','还原卡');
    lang_btnRefresh    := f.ReadString('L8','btnRefresh','刷新');
    lang_btnSave       := f.ReadString('L8','btnSave','保存');
    lang_btnNew        := f.ReadString('L8','btnNew','新建');
    lang_btnEdit       := f.ReadString('L8','btnEdit','编辑');
    lang_btnSubmit     := f.ReadString('L8','btnSubmit','提交');
    lang_btnMore       := f.ReadString('L8','btnMore','高级');
    lang_btnHide       := f.ReadString('L8','btnHide','隐藏');
    lang_btnBack       := f.ReadString('L8','btnBack','返回');

    lang_btnClose    := f.ReadString('L8','btnClose','关闭');
    lang_btnDefault  := f.ReadString('L8','btnDefault','默认');
    lang_btnAdd      := f.ReadString('L8','btnAdd','增加');

    lang_btnOpenFiles     := f.ReadString('L8','btnOpenFiles','打开文档');
    lang_btnSinglePage    := f.ReadString('L8','btnSinglePage','单页传送');
    lang_btnContiTransmit := f.ReadString('L8','btnContiTransmit','连续传送');
    lang_btnSimulative    := f.ReadString('L8','btnSimulative','模拟演示');
    lang_btnSaveConti     := f.ReadString('L8','btnSaveConti','保存并继续');
    lang_btnListView      := f.ReadString('L8','btnListView','列表视图');

    //---sb_tips---
    lang_sb_tips0     := f.ReadString('L8','sb_tips0','通信');
    lang_sb_tips1     := f.ReadString('L8','sb_tips1','未连接');
    lang_sb_tips2     := f.ReadString('L8','sb_tips2','已连接');
    lang_sb_tips3     := f.ReadString('L8','sb_tips3','握手');
    lang_sb_tips4     := f.ReadString('L8','sb_tips4','发送');
    lang_sb_tips5     := f.ReadString('L8','sb_tips5','接收');
    lang_sb_tips6     := f.ReadString('L8','sb_tips6','有效');
    lang_sb_tips7     := f.ReadString('L8','sb_tips7','无效');
    lang_sb_tips8     := f.ReadString('L8','sb_tips8','用户:管理员');
    lang_sb_tips9     := f.ReadString('L8','sb_tips9','用户:访客');
    lang_sb_tipsTime  := f.ReadString('L8','sb_tipsTime','耗时');

    //---Text---
    lang_strUserNo    := f.ReadString('L8','strUserNo','用户号');
    lang_strCardType  := f.ReadString('L8','strCardType','卡类型');
    lang_strCardNo    := f.ReadString('L8','strCardNo','卡号');
    lang_strCard6     := f.ReadString('L8','strCard6','属性');

    lang_strRegisterCard := f.ReadString('L8','strRegisterCard','注册卡');
    lang_strCardRecord   := f.ReadString('L8','strCardRecord','刷卡记录');
    lang_strRecordTime   := f.ReadString('L8','strRecordTime','刷卡时间');
    lang_strDeviceInfo   := f.ReadString('L8','strDeviceInfo','设备信息');

    //[Hint]
    lang_hintManagement  := f.ReadString('L8','hintManagement','点击鼠标右键进行管理！');
    lang_hintAddCards    := f.ReadString('L8','hintAddCards','双击操作,可以添加卡！');
    lang_hintChooseCards := f.ReadString('L8','hintChooseCards','双击操作,可以选取卡！');
    lang_hintProcessState:= f.ReadString('L8','hintProcessState','双击操作,可以改变处理情况！');

    //[login1]
    lang_loginTitle  := f.ReadString('L8','loginTitle','请输入账号和密码');
    lang_loginUser   := f.ReadString('L8','loginUser','账号'); //Account
    lang_loginPsw    := f.ReadString('L8','loginPsw','密码');
    lang_loginVerify := f.ReadString('L8','loginVerify','验证账号和密码...');

    //[connect]
    lang_labConnectPort := f.ReadString('L8','labConnectPort','通信端口');
    lang_msgConnectF    := f.ReadString('L8','msgConnectF','连接失败,请重新选择端口!');
    lang_msgSaveParam   := f.ReadString('L8','msgSaveParam','参数设置成功!');

    f.Free;
  end;
  Caption            :=  lang_loginTitle;
  label1.Caption     :=  lang_loginUser;
  label2.Caption     :=  lang_loginPsw;
  btn_ok.Caption     :=  lang_btnOK;
  btn_cancel.Caption :=  lang_btnCancel;
end;

procedure Tfrm_login.FormShow(Sender: TObject);
begin
  if edit_LoginName.Text='' then
    edit_LoginName.SetFocus
  else
    edit_psw.SetFocus;
end;

end.
