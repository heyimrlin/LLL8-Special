unit u_lang;

interface

var
  lang_app_title:string; // 应用程序标题
  lang_UserErr:string;   // 请输入正确的用户名和密码!

  //[msg]
  lang_msg_NoConfig:string; // 没有配置文件!
  lang_msg_NoLang:string;   // 没有语言文件!
  lang_msg_Comm:string;     // 通信:已连接
  lang_msg_NoComm:string;   // 通信:未连接

  lang_msg_GetAdminAuthor:string;  // 请取得管理员授权！
  lang_msg_UnexpectedError:string; // 发生意外错误!请退出重新执行程序!

  lang_msg_RoomDataClear:string;     // 确定要清空房屋数据吗？
  lang_msg_ClearFail:string;         // 清除失败!
  lang_msg_ClearFinish:string;       // 清除完成!
  lang_msg_Initialize:string;        // 正在努力初始化...
  lang_msg_InitializeFinish:string;  // 初始化完成!
  lang_msg_DelHaveChild:string;      // 有子项目,确定要全部删除吗？

  lang_UnitON:string; // 主机上电
  lang_UserON:string; // 分机上电

  lang_msg_Ready:string;    // 数据整理中，请稍候...
  lang_msg_StartReg:string; // 开始注册...
  lang_msg_RegOver:string;  // 注册完毕!

  lang_msg_SelectCmd:string;      // 请选择注册或注销命令！
  lang_msg_CardHaveCmd:string;    // 该卡有未完成的操作！
  lang_msg_InputUnit:string;      // 请输入正确的主机号码！
  lang_msg_InputUser:string;      // 请输入正确的分机号码！
  lang_msg_InputDevice:string;    // 请输入设备编号！
  lang_msg_InputDevRepeat:string; // 设备编号重复！
  lang_msg_Clearing:string;       // 数据清除中，请稍候...
  lang_msg_ClearOver:string;      // 数据清除完毕！

  lang_msg_SysPrompts:string;    // 系统提示
  lang_msg_ImportSuccess:string; // 数据导入成功！
  lang_msg_ImportFail:string;    // 数据导入失败！
  lang_msg_ExportSuccess:string; // 数据导出成功！
  lang_msg_ExportFail:string;    // 导出数据失败！请检查文件的格式是否正确！
  lang_msg_NoCmd:string;         // 没有指令需要执行
  lang_msg_CmdSending:string;    // 指令开始执行
  lang_msg_SentOK:string;        // 指令发送成功
  lang_msg_NeverSent:string;     // 指令未发送
  lang_msg_NoSent:string;        // 指令发送失败
  lang_msg_CmdSentOver:string;   // 指令执行完毕

  lang_msg_LinkTimeout:string;   // 连接超时！
  lang_msg_LinkFail:string;      // 通信未连接！

  lang_msg_Times:string;   // 耗时
  lang_msg_Reading:string; // 读取中...
  lang_msg_ReadOver:string;// 读取完毕

  lang_do0:string; // 未读
  lang_do1:string; // 已读
  lang_do2:string; // 已处理

  lang_msg_Del:string;        // 确实要删除该记录吗？
  lang_msg_DelAll:string;     // 确定要删除全部记录吗？
  lang_msg_Clear:string;      // 确定要对所选设备执行清除卡的操作吗？
  lang_msg_DelConfirm:string; // 确定要删除
  lang_msg_DelEnd:string;     // 吗？

  lang_msg_QueryWrong:string;  // 查询截止日期不能小于起始日期！
  lang_msg_AlertRecord:string; // 预警记录
  lang_msg_Data:string;        // 数据

  lang_msg_ConfigSuccess:string;  // 您的配置已经生效！
  lang_msg_UpdatingConfig:string; // 正在更新配置，请稍候...
  lang_msg_InstallSQL:string;     // 请先安装SQL Server
  lang_msg_ConfigError:string;    // 数据源配置出现意外错误,建议您手工配置!
  lang_msg_ConfigException:string;// 在配置数据源的过程中出现了未知的错误，请重试！

  lang_msg_SysCannotSet:string; // 系统没有正确安装ODBC,无法进行设置!
  lang_msg_DBPathError:string;  // 取数据库路径时出现错误,请与程序供应商联系!

  lang_msg_CloseTables:string;  // 请关闭其它还在使用的表单！
  lang_msg_NoDSN:string;        // 请先运行系统配置程序,配置系统运行参数后再运行程序!
  lang_msg_SelBupDB:string;     // 请选择需要备份的数据库！
  lang_msg_SelResDB:string;     // 请选择需要恢复的数据库！
  lang_msg_FileName:string;     // 文件名重复！
  lang_msg_Backuping:string;    // 正在备份数据库，请稍候！
  lang_msg_Restoring:string;    // 正在恢复数据库，请稍候！
  lang_msg_CreateFinish:string; // 创建成功！
  lang_msg_CreateFail:string;   // 创建失败！
  lang_msg_BackupFinish:string; // 备份成功！
  lang_msg_BackupFail:string;   // 备份失败！
  lang_msg_RestoreFinish:string;// 恢复成功！
  lang_msg_RestoreFail:string;  // 恢复失败！
  lang_msg_RestoreConfirm:string; // 需要将文件
  lang_msg_RestoreInto:string;    // 恢复成数据库

  lang_msg_UserNull:string;     // 用户名不能为空！
  lang_msg_UserExist:string;    // 用户名已存在，请重新输入！
  lang_msg_PswNull:string;      // 密码不能为空！
  lang_msg_PswDismatch:string;  // 密码不一致，请重新输入！

  lang_msg_EnterUser:string;    // 请输入用户名！
  lang_msg_EnterPsw:string;     // 请输入登录密码！
  lang_msg_ChoosePermit:string; // 请选择账号权限！
  lang_msg_UserNotExist:string; // 您输入的用户名不存在！

  lang_msg_NoSenseLock:string;  // 打开加密狗设备失败，错误代码为:
  lang_msg_ExecuteFail:string;  // 执行加密狗模块失败，错误代码为:

  lang_msg_OpenFail:string;        // 无法打开！
  lang_msg_MaxScreen:string;       // 分机最多只能存储32屏信息！
  lang_msg_InfoEmpty:string;       // 信息为空！
  lang_msg_OpenPort:string;        // 请打开通信端口！
  lang_msg_ReleaseComplete:string; // 信息发布完毕！
  lang_msg_SaveChanges:string;     // 是否保存修改?

  lang_msg_PortOpened:string;      // 通信端口已打开！
  lang_msg_PortNotOpened:string;   // 通信端口未打开！
  lang_msg_PortDisconnect:string;  // 通信端口已断开！
  lang_msg_ProvideCard:string;     // 请提供卡号！
  lang_msg_ProvideDevice:string;   // 请提供设备号！

  lang_msg_DownloadOK:string;      // 下载成功！
  lang_msg_ReadCardOK:string;      // 卡号读取成功！
  lang_msg_CommunicateFail:string; // 通信失败！
  lang_msg_NoCard:string;          // 无卡！
  lang_msg_OperateOK:string;       // 操作成功！
  lang_msg_OperateFail:string;     // 操作失败！
  lang_msg_NoAvailable:string;     // 无扇区可用！
  lang_msg_NotCorrespond:string;   // 卡号不对应！

  lang_msg_AddrExist:string; // 楼栋信息已存在，无法重复添加！
  lang_msg_DevExist:string;  // 该设备已存在，无法重复添加！
  lang_msg_UserMacAmount:string; // 该分机已注册15张卡，请重新选择分机进行注册！
  lang_msg_ChooseWall:string;    // 请选择需要注册的围墙机！
  lang_msg_SelUnitWall:string;   // 请选择需要注册的主机和围墙机！
  lang_msg_None:string; // 无
  lang_msg_Extracting:string;    // 提取中，请等待！
  lang_msg_ExcelInstall:string;  // 未安装EXCEL！

  //[note]
  lang_note_Receive:string;   // 接收
  lang_note_Error:string;     // 错误
  lang_note_Send:string;      // 发送

  lang_note_Call:string;    // 呼叫分机
  lang_note_Total:string;   // 共有
  lang_note_Records:string; // 多笔记录
  lang_note_Current:string; // 当前是第
  lang_note_Record:string;  // 一笔记录

  //[Caption]
  lang_menu1:string;  //楼栋信息
  lang_menu2:string;  //设备信息
  lang_menu3:string;  //门禁管理
  lang_menu31:string; //下载卡
  lang_menu32:string; //注销卡
  lang_menu33:string; //提取卡
  lang_menu34:string; //清除卡
  lang_menu35:string; //卡中心
  lang_menu36:string; //发卡器
  lang_menu37:string; //写卡器
  lang_menu4:string;  //报警中心
  lang_menu5:string;  //刷卡记录
  lang_menu6:string;  //设置
  
  lang_pMenuAddrAdd:string;    //增加楼栋
  lang_pMenuAddrEdit:string;   //编辑楼栋
  lang_pMenuAddrDel:string;    //删除楼栋
  lang_pMenuAddrRefresh:string;//刷新楼栋
  lang_pMenuAddrParam:string;  //楼栋参数

  lang_pMenuDevAdd:string; //增加设备
  lang_pMenuDevEdit:string;//编辑设备
  lang_pMenuDevDel:string; //删除设备
  lang_pMenuRefresh:string;//刷新设备

  lang_pMenuUserAdd:string; //添加账号
  lang_pMenuUserEdit:string;//编辑权限
  lang_pMenuUserDel:string; //删除账号

  lang_gbDev:string;      // 请选择设备
  lang_gbCardType:string; // 请选择注册卡类型
  lang_ckbBatch:string;   // 批量注册

  lang_gbServiceDoor:string; // 物业卡主机

  lang_gbCommandSending:string; //待发送指令框
  lang_gbCommandReceived:string;//接收指令框
  lang_gbCommand:string;        //指令框
  lang_gbCommandState:string;   //指令状态框

  lang_gbComLink:string;   //通信连接
  lang_gbOptions:string;   //选项
  lang_gbCardList:string;  //卡列表
  lang_gbDevNO:string;     //设备号码
  lang_gbOperateCmd:string;//操作命令

  lang_gbUserAdmin:string; //用户管理
  lang_gbPersonal:string;  //个人中心

  lang_cpCommunity:string; //小区

  //[DBGrid]
  lang_dgAddrColum1:string; //设备地址
  lang_dgAddrColum2:string; //上属楼栋
  lang_dgAddrColum3:string; //设备号码
  lang_dgAddrColum4:string; //备注

  lang_dgDevColum1:string; //设备类型
  lang_dgDevColum2:string; //设备号码
  lang_dgDevColum3:string; //设备地址
  lang_dgDevColum4:string; //备注

  lang_dgAlarmColum1:string; //报警类型
  lang_dgAlarmColum2:string; //设备地址
  lang_dgAlarmColum3:string; //状态
  lang_dgAlarmColum4:string; //报警时间
  lang_dgAlarmColum5:string; //报警内容
  lang_dgAlarmColum6:string; //处理情况

  lang_dgCardRecColum1:string; //卡类型
  lang_dgCardRecColum2:string; //卡号
  lang_dgCardRecColum3:string; //刷卡点
  lang_dgCardRecColum4:string; //刷卡时间

  lang_dgUserColum1:string; //账号名
  lang_dgUserColum2:string; //账号权限
  lang_dgUserColum3:string; //账号密码

  lang_dgCardColum1:string; //卡类型
  lang_dgCardColum2:string; //卡号
  lang_dgCardColum3:string; //主机
  lang_dgCardColum4:string; //分机
  lang_dgCardColum5:string; //卡状态
  lang_dgCardColum6:string; //围墙机
  lang_dgCardColum7:string; //属性
  lang_dgCardColum8:string; //姓名

  //[Label]
  lang_labType:string;    //类型
  lang_labAddr:string;    //地址
  lang_labDevNON:string;  //设备号码
  lang_labUnitMac:string; //主机
  lang_labUserMac:string; //分机
  lang_labAmount:string;  //数量
  lang_labCardNO:string;  //卡号
  lang_labCOM:string;     //通信端口
  lang_labWall:string;    //围墙机
  lang_labDeadLine:string;//期限
  lang_labMemo:string;    //备注
  lang_labTo:string;      //到
  lang_labName:string;    //名称
  lang_labUserName:string;//用户名:
  lang_labPassword:string;//登录密码:
  lang_labPermission:string;//用户权限:

  lang_labCardNOHex:string;   //卡号(十六进制)
  lang_labIndoorPhone:string; //分机号(6位)

  lang_labDefaultName:string; //某某

  lang_labCOMProperty:string; // 通讯属性
  lang_typeSerialPort:string; // 采用串行口通讯
  lang_typeProtocol:string;   // 采用网络通讯
  lang_labCenterNumber:string;// 管理中心号码
  lang_labReceivePort:string; // 接收端口
  lang_labSendPort:string;    // 发送端口

  lang_labUser:string;         //用户名:
  lang_labPsw:string;          //用户密码:
  lang_labNewUser:string;      //新用户名:
  lang_labNewPsw:string;       //请输入新密码:
  lang_labNewPswConfirm:string;//请确认新密码:

  //[UserParam]
  lang_gbUserP1:string; // 栋号
  lang_gbUserP2:string; // 单元
  lang_gbUserP3:string; // 层号
  lang_gbUserP4:string; // 房号

  lang_labNoLen:string;  // 编码位数
  lang_labFromTo:string; // 从 ... 到 ...
  lang_DateFromTo:string;// 日期从...到...
  lang_labNoName:string; // 编码名称
  lang_labNoOrd:string;  // 编码顺序

  lang_bName:string; // 栋,幢,号楼,#楼
  lang_uName:string; // 单元,梯,门
  lang_fName:string; // 楼,层,F
  lang_hName:string; // 室

  lang_ckbDev:string;    // 同时初始化设备
  lang_labID:string;     // 标识
  lang_labDevNO:string;  // 设备号
  lang_labDevName:string;// 名称

  lang_btnEG:string;   // 示例
  lang_btnUser:string; // 初始化

  //[Types]
  lang_devType0:string ; // 管理机
  lang_devType1:string ; // 主机
  lang_devType2:string ; // 副主机
  lang_devType3:string ; // 分机
  lang_devType4:string ; // 围墙机
  lang_devTypeA:string ; // 全部设备
  lang_devTypeN:string ; // 无设备

  lang_cardType0:string; // 住户卡
  lang_cardType1:string; // 物业卡
  lang_cardType2:string; // 系统卡
  lang_cardType3:string; // 巡更卡

  lang_cardTypeX:string; // 无效卡
  lang_cardTypeV:string; // 有效卡
  lang_cardTypeC:string; // 普通卡
  lang_cardTypeU:string; // 未知
  lang_cardTypeA:string; // 全部

  lang_alarmType0:string;  // 求助报警
  lang_alarmType1:string;  // 开门报警
  lang_alarmType2:string;  // 主机上电
  lang_alarmType3:string;  // 分机上电
  lang_alarmType4:string;  // 防区触发报警

  lang_alarmState0:string; // 未读
  lang_alarmState1:string; // 已读
  lang_alarmState2:string; // 未处理
  lang_alarmState3:string; // 已处理
  lang_alarmState4:string; // 全部

  lang_userType0:string; // 管理员
  lang_userType1:string; // 访客

  lang_chosenYes:string; // 是
  lang_chosenNo:string;  // 否

  lang_stateInvalid:string; // 无效
  lang_stateValid:string;   // 有效
  lang_stateUnknown:string; // 未知

  //[Button]
  lang_btnQry:string;        // 查询
  lang_btnOK:string;         // 确定
  lang_btnCancel:string;     // 取消
  lang_btnSel:string;        // 选取
  lang_btnImport:string;     // 导入Excel表格数据
  lang_btnExport:string;     // 导出Excel表格
  lang_btnDel:string;        // 删除
  lang_btnClear:string;      // 清除
  lang_btnDownLoad:string;   // 下载卡
  lang_btnExtract:string;    // 提取
  lang_btnConnect:string;    // 连接
  lang_btnDisCon:string;     // 断开
  lang_btnRead:string;       // 读取卡号
  lang_btnCancelCard:string; // 注销卡
  lang_btnEditTime:string;   // 修改时间
  lang_btnCardStatus:string; // 卡状态
  lang_btnRestoreCard:string;// 还原卡
  lang_btnRefresh:string;    // 刷新
  lang_btnSave:string;    // 保存
  lang_btnNew:string;     // 新建
  lang_btnEdit:string;    // 编辑
  lang_btnSubmit:string;  // 提交
  lang_btnMore:string;    // 高级
  lang_btnHide:string;    // 隐藏
  lang_btnBack:string;    // 返回

  lang_btnClose:string;   // 关闭
  lang_btnDefault:string; // 默认
  lang_btnAdd:string;     // 增加

  lang_btnOpenFiles:string;    // 打开文档
  lang_btnSinglePage:string;   // 单页传送
  lang_btnContiTransmit:string;// 连续传送
  lang_btnSimulative:string;   // 模拟演示
  lang_btnSaveConti:string;    // 保存后继续
  lang_btnListView:string;     // 列表视图

  //[sb_tips]
  lang_sb_tips0:string; // 通信
  lang_sb_tips1:string; // 未连接
  lang_sb_tips2:string; // 已连接
  lang_sb_tips3:string; // 握手
  lang_sb_tips4:string; // 发送
  lang_sb_tips5:string; // 接收
  lang_sb_tips6:string; // 有效
  lang_sb_tips7:string; // 无效
  lang_sb_tips8:string; // 用户:管理员
  lang_sb_tips9:string; // 用户:访客
  lang_sb_tipsTime:string; // 耗时

  //[Text]
  lang_strUserNo:string;   // 用户号
  lang_strCardType:string; // 卡类型
  lang_strCardNo:string;   // 卡号
  lang_strCard6:string;    // 属性

  lang_strRegisterCard:string; // 注册卡
  lang_strCardRecord:string;   // 刷卡记录
  lang_strRecordTime:string;   // 刷卡时间
  lang_strDeviceInfo:string;   // 设备信息

  //[Hint]
  lang_hintManagement:string;   // 点击鼠标右键进行管理！
  lang_hintAddCards:string;     // 双击操作,可以添加卡！
  lang_hintChooseCards:string;  // 双击操作,可以选取卡！
  lang_hintProcessState:string; // 双击操作,可以改变处理情况！

  //[login]
  lang_loginTitle:string;   // 请输入账号和密码
  lang_loginUser:string;    // 账号
  lang_loginPsw:string;     // 密码
  lang_loginVerify:string;  // 验证账号和密码...

  //[connect]
  lang_labConnectPort:string; // 通信端口
  lang_msgConnectF:string;    // 连接失败,请重新选择端口!
  lang_msgSaveParam:string;   // 参数设置成功!

implementation

end.
