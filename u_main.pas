unit u_main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, ToolWin, Buttons, DB, ADODB, StdCtrls, DBActns,
  StdActns, ActnList, ImgList, IniFiles, SPComm, DateUtils, StrUtils,
  ExtCtrls, jpeg, Grids, DBGrids, AppEvnts, ExtDlgs, Spin, ComObj,
  Excel2000, OleServer, CheckLst, DBCtrls, IdTCPServer, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdUDPBase, IdUDPServer, IdSocketHandle,
  IdUDPClient, IdIPMCastServer, IdIPMCastBase, IdIPMCastClient, IdIPWatch;

type
  PNodeInfo=^TNodeInfo;
  TNodeInfo=record
    DType:Integer;
    ID:string;
    Name:string;
    NO:string;
  end;

type
  TImageThread = class(TThread)
  private
    { Private declarations }
  protected
    procedure Execute;override;
    procedure Run;
  end;

type
  TMainForm = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    Panel1: TPanel;
    TabSheet5: TTabSheet;
    spBtn_addr: TSpeedButton;
    spBtn_dev: TSpeedButton;
    spBtn_door: TSpeedButton;
    spBtn_alarm: TSpeedButton;
    spBtn_credit: TSpeedButton;
    spBtn_set: TSpeedButton;
    TabSheet6: TTabSheet;
    Panel2: TPanel;
    sb_tips: TStatusBar;
    pMenu_addr: TPopupMenu;
    pMenu_dev: TPopupMenu;
    addr_Add: TMenuItem;
    addr_Edit: TMenuItem;
    addr_Del: TMenuItem;
    dev_Add: TMenuItem;
    dev_Edit: TMenuItem;
    dev_Del: TMenuItem;
    dev_Refresh: TMenuItem;
    spBtn_addrparam: TSpeedButton;
    TabSheet12: TTabSheet;
    PageControl2: TPageControl;
    TabSheet8: TTabSheet;
    TabSheet9: TTabSheet;
    TabSheet10: TTabSheet;
    TabSheet11: TTabSheet;
    TabSheet17: TTabSheet;
    gbDev3: TGroupBox;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    editUnitMac3: TEdit;
    editUserMac3: TEdit;
    editUser63: TEdit;
    DBGridAlarmRec: TDBGrid;
    DBGridCardRec: TDBGrid;
    addr_Param: TMenuItem;
    TabSheet18: TTabSheet;
    TabSheet19: TTabSheet;
    Comm1: TComm;
    Comm2: TComm;
    Comm3: TComm;
    spBtn_more: TSpeedButton;
    TabSheet20: TTabSheet;
    pMenu_user: TPopupMenu;
    user_Add: TMenuItem;
    user_Edit: TMenuItem;
    user_Del: TMenuItem;
    btn_more: TButton;
    GroupBox27: TGroupBox;
    DBGridUser: TDBGrid;
    GroupBox33: TGroupBox;
    btn_hide: TButton;
    AdoCon: TADOConnection;
    DSAddr: TDataSource;
    AdoQryAddr: TADOQuery;
    AdoQryAddrID: TAutoIncField;
    AdoQryAddrAddrType: TIntegerField;
    AdoQryAddrAddrName: TWideStringField;
    AdoQryAddrAddrNO: TWideStringField;
    AdoQryAddrFatherAddr: TWideStringField;
    AdoQryAddrDevNO: TWideStringField;
    AdoQryAddrMemo: TWideStringField;
    AdoQryDev: TADOQuery;
    DSDev: TDataSource;
    AdoQryDevID: TAutoIncField;
    AdoQryDevDevNO: TWideStringField;
    AdoQryDevDevType: TIntegerField;
    AdoQryDevAddrName: TWideStringField;
    AdoQryDevAddrNO: TWideStringField;
    AdoQryDevMemo: TWideStringField;
    addr_Refresh: TMenuItem;
    AdoQryRegCards: TADOQuery;
    DSRegCards: TDataSource;
    AdoQryCancelCards: TADOQuery;
    AdoQryReadCards: TADOQuery;
    AdoQryCard: TADOQuery;
    AdoQryWall: TADOQuery;
    DSCancelCards: TDataSource;
    DSReadCards: TDataSource;
    DSCard: TDataSource;
    DSWall: TDataSource;
    AdoQryRegCardsCardType: TIntegerField;
    AdoQryRegCardsCardNO: TWideStringField;
    AdoQryRegCardsunitMac: TWideStringField;
    AdoQryRegCardsuserMac: TWideStringField;
    AdoQryRegCardssent: TIntegerField;
    AdoQryCancelCardsID: TAutoIncField;
    AdoQryCancelCardsCardType: TIntegerField;
    AdoQryCancelCardsCardNO: TWideStringField;
    AdoQryCancelCardsunitMac: TWideStringField;
    AdoQryCancelCardsuserMac: TWideStringField;
    AdoQryCancelCardssent: TIntegerField;
    AdoQryReadCardsID: TAutoIncField;
    AdoQryReadCardsCardType: TIntegerField;
    AdoQryReadCardsCardNO: TWideStringField;
    AdoQryReadCardsCardHex: TWideStringField;
    AdoQryReadCardsunitMac: TWideStringField;
    AdoQryReadCardsuserMac: TWideStringField;
    AdoQryReadCardsuser6: TWideStringField;
    AdoQryCardID: TAutoIncField;
    AdoQryCardCardType: TIntegerField;
    AdoQryCardCardNO: TWideStringField;
    AdoQryCardCardHex: TWideStringField;
    AdoQryCardunitMac: TWideStringField;
    AdoQryCarduserMac: TWideStringField;
    AdoQryCarduser6: TWideStringField;
    AdoQryWallID: TAutoIncField;
    AdoQryWallWallNO: TWideStringField;
    AdoQryWallWallNum: TIntegerField;
    AdoQryWallWallChosen: TIntegerField;
    AdoQryUser: TADOQuery;
    DSUser: TDataSource;
    AdoQryUserID: TAutoIncField;
    AdoQryUserUserName: TWideStringField;
    AdoQryUserUserPermission: TWideStringField;
    AdoQryUserUserPassword: TWideStringField;
    GroupBox36: TGroupBox;
    Label49: TLabel;
    lab_UserName: TLabel;
    btn_EditPsw: TButton;
    Panel_EditPsw: TPanel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    btn_PswBack: TButton;
    edit_new: TEdit;
    edit_confirmnew: TEdit;
    btn_PswOK: TButton;
    edt_name: TEdit;
    AdoQryAlarm: TADOQuery;
    DSAlarm: TDataSource;
    AdoQryCardRec: TADOQuery;
    DSCardRec: TDataSource;
    AdoQryCardRecID: TAutoIncField;
    AdoQryCardRecCardType: TIntegerField;
    AdoQryCardRecCardNO: TWideStringField;
    AdoQryCardRecRecTime: TWideStringField;
    AdoQryCardRecMemo: TWideStringField;
    AdoQryAlarmID: TAutoIncField;
    AdoQryAlarmAlarmType: TIntegerField;
    AdoQryAlarmAddrName: TWideStringField;
    AdoQryAlarmAlarmTime: TWideStringField;
    AdoQryAlarmAlarmText: TWideStringField;
    AdoQryAlarmAlarmStatus: TIntegerField;
    AdoQryAlarmAlarmSolved: TIntegerField;
    AdoQryAlarmMemo: TWideStringField;
    OpenDialog1: TOpenDialog;
    AdoQryExcel: TADOQuery;
    ExcelApp: TExcelApplication;
    WorkBook: TExcelWorkbook;
    WorkSheet: TExcelWorksheet;
    ApplicationEvents1: TApplicationEvents;
    ApplicationEvents2: TApplicationEvents;
    ApplicationEvents3: TApplicationEvents;
    ApplicationEvents4: TApplicationEvents;
    ApplicationEvents5: TApplicationEvents;
    ApplicationEvents6: TApplicationEvents;
    ApplicationEvents7: TApplicationEvents;
    ApplicationEvents8: TApplicationEvents;
    AdoQryCardCardState: TIntegerField;
    AdoQryCardRecRecDev: TWideStringField;
    AdoQryCardCardMemo: TWideStringField;
    Panel3: TPanel;
    spBtn_register: TSpeedButton;
    spBtn_cancel: TSpeedButton;
    spBtn_read: TSpeedButton;
    spBtn_clear: TSpeedButton;
    spBtn_center: TSpeedButton;
    spBtn_CardSender: TSpeedButton;
    spBtn_WriteCard: TSpeedButton;
    Timer1: TTimer;
    AdoQryCmd: TADOQuery;
    AdoQryCmdID: TAutoIncField;
    AdoQryCmdcmdStr: TStringField;
    AdoQryCmdsent: TIntegerField;
    AdoQryUnitMac: TADOQuery;
    AdoQryUnitMacID: TAutoIncField;
    AdoQryUnitMacUnitNO: TWideStringField;
    AdoQryUnitMacUnitChosen: TIntegerField;
    btn_dock: TButton;
    AdoConDock: TADOConnection;
    AdoQryCardInfo: TADOQuery;
    AdoQryCardInfounitMac: TStringField;
    AdoQryCardInfouserMac: TStringField;
    btn_open: TBitBtn;
    Timer2: TTimer;
    AdoQryCmdcmdType: TIntegerField;
    IconList: TImageList;
    AdoQryPerson: TADOQuery;
    DSPerson: TDataSource;
    AdoQryPersonID: TAutoIncField;
    AdoQryPersonCardType: TIntegerField;
    AdoQryPersonCardNO: TStringField;
    AdoQryPersonCardState: TIntegerField;
    AdoQryPersonCardHex: TStringField;
    AdoQryPersonunitMac: TStringField;
    AdoQryPersonuserMac: TStringField;
    AdoQryPersonuser6: TStringField;
    AdoQryPersonCardMemo: TStringField;
    AdoQryPersonPersonName: TStringField;
    pMenu_card: TPopupMenu;
    pMenu_person: TPopupMenu;
    card_download: TMenuItem;
    card_cancel: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    btn_ClearOK1: TBitBtn;
    AdoQryDevIP: TStringField;
    TCPClient: TIdTCPClient;
    TCPServer: TIdTCPServer;
    GroupBox41: TGroupBox;
    Label55: TLabel;
    cmb_compro: TComboBox;
    PageControl6: TPageControl;
    TabSheet25: TTabSheet;
    GroupBox32: TGroupBox;
    Label6: TLabel;
    cbb_port: TComboBox;
    BitBtn24: TBitBtn;
    BitBtn25: TBitBtn;
    GroupBox40: TGroupBox;
    btn_SaveClose0: TBitBtn;
    BitBtn3: TBitBtn;
    TabSheet26: TTabSheet;
    GroupBox3: TGroupBox;
    GroupBox26: TGroupBox;
    btn_SaveClose1: TBitBtn;
    btn_DataClear: TBitBtn;
    Label56: TLabel;
    edit_receive: TEdit;
    Label57: TLabel;
    edit_send: TEdit;
    BitBtn2: TBitBtn;
    AdoQryIP: TADOQuery;
    AdoQryIPID: TAutoIncField;
    AdoQryIPDevNO: TStringField;
    AdoQryIPDevType: TIntegerField;
    AdoQryIPAddrName: TStringField;
    AdoQryIPAddrNO: TStringField;
    AdoQryIPIP: TStringField;
    AdoQryIPMemo: TStringField;
    AdoQryCmdunitMac: TStringField;
    AdoQryCmduserMac: TStringField;
    IPMCastClient: TIdIPMCastClient;
    IPMCastServer: TIdIPMCastServer;
    Timer3: TTimer;
    IPWatch: TIdIPWatch;
    Label58: TLabel;
    edit_center: TEdit;
    AdoQryRegCardsID: TAutoIncField;
    UDPServer: TIdUDPServer;
    Memo5: TMemo;
    Memo3: TMemo;
    btn_record: TBitBtn;
    TabSheet22: TTabSheet;
    DSSent: TDataSource;
    DSNotSent: TDataSource;
    AdoQrySent: TADOQuery;
    AdoQryNotSent: TADOQuery;
    AdoQryNotSentID: TAutoIncField;
    AdoQryNotSentcmdStr: TStringField;
    AdoQryNotSentunitMac: TStringField;
    AdoQryNotSentuserMac: TStringField;
    AdoQryNotSentsent: TIntegerField;
    AdoQryNotSentcmdType: TIntegerField;
    AdoQrySentID: TAutoIncField;
    AdoQrySentcmdStr: TStringField;
    AdoQrySentunitMac: TStringField;
    AdoQrySentuserMac: TStringField;
    AdoQrySentsent: TIntegerField;
    AdoQrySentcmdType: TIntegerField;
    AdoQrySentsendTime: TStringField;
    AdoQryCmdsendTime: TStringField;
    AdoQrySentCount: TIntegerField;
    AdoQryNotSentsendTime: TStringField;
    AdoQryNotSentCount: TIntegerField;
    Timer4: TTimer;
    ApplicationEvents9: TApplicationEvents;
    ApplicationEvents10: TApplicationEvents;
    AdoQryCardPersonName: TStringField;
    AdoQrySys: TADOQuery;
    AdoQrySysID: TIntegerField;
    AdoQrySysVillageName: TStringField;
    AdoQryCardWall: TADOQuery;
    AdoQryCardWallID: TAutoIncField;
    AdoQryCardWallPersonName: TStringField;
    AdoQryCardWallCardType: TIntegerField;
    AdoQryCardWallCardNO: TStringField;
    AdoQryCardWallCardState: TIntegerField;
    AdoQryCardWallCardHex: TStringField;
    AdoQryCardWallunitMac: TStringField;
    AdoQryCardWalluserMac: TStringField;
    AdoQryCardWalluser6: TStringField;
    AdoQryCardWallWallNO: TStringField;
    AdoQryCardWallCardMemo: TStringField;
    progressbar_cmd: TProgressBar;
    AdoQryPersonValidTime: TStringField;
    AdoQryCardValidTime: TStringField;
    card_validtime: TMenuItem;
    AdoQryReadCardsMemo: TStringField;
    AdoQryRegCardsPersonName: TStringField;
    AdoQryRegCardsCardMemo: TStringField;
    AdoQryCancelCardsPersonName: TStringField;
    AdoQryCancelCardsCardMemo: TStringField;
    AdoQryValidTime: TADOQuery;
    AutoIncField1: TAutoIncField;
    IntegerField1: TIntegerField;
    WideStringField1: TWideStringField;
    IntegerField2: TIntegerField;
    WideStringField2: TWideStringField;
    WideStringField3: TWideStringField;
    WideStringField4: TWideStringField;
    WideStringField5: TWideStringField;
    WideStringField6: TWideStringField;
    WideStringField7: TWideStringField;
    StringField1: TStringField;
    StringField2: TStringField;
    Timer5: TTimer;
    AdoQryCardRecScreenshot: TBlobField;
    AdoQryCardisWall: TIntegerField;
    AdoQryPersonisWall: TIntegerField;
    AdoQryCmdCardNO: TStringField;
    Image3: TImage;
    Label37: TLabel;
    cmbPort1: TComboBox;
    btn_connect1: TBitBtn;
    btn_disconnect1: TBitBtn;
    Label40: TLabel;
    edt_UnitMac: TEdit;
    Label3: TLabel;
    mm_cards: TMemo;
    Label41: TLabel;
    edt_UserMac: TEdit;
    Label42: TLabel;
    edt_WallNo: TEdit;
    Label39: TLabel;
    edt_CardNO1: TEdit;
    btn_CardSender: TButton;
    btn_CardReg: TButton;
    Label38: TLabel;
    cmbPort2: TComboBox;
    btn_connect2: TBitBtn;
    btn_disconnect2: TBitBtn;
    Label43: TLabel;
    cmbCardType: TComboBox;
    Label44: TLabel;
    dt1: TDateTimePicker;
    Label45: TLabel;
    edt_CardNO2: TEdit;
    btn_ReadCards: TBitBtn;
    btn_Register: TBitBtn;
    btn_EditTime: TBitBtn;
    btn_Cancel: TBitBtn;
    btn_Restore: TBitBtn;
    btn_CardState: TBitBtn;
    Label8: TLabel;
    mm_dev: TMemo;
    Label71: TLabel;
    mm_state: TMemo;
    Image1: TImage;
    spBtn_check: TSpeedButton;
    Label72: TLabel;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    cmb_interval: TComboBox;
    btn_card_export: TSpeedButton;
    Label13: TLabel;
    ComboBox3: TComboBox;
    Label14: TLabel;
    Edit2: TEdit;
    BitBtn19: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn1: TBitBtn;
    Label54: TLabel;
    edt_amount: TEdit;
    btn_refresh: TButton;
    DBGridCardsCenter: TDBGrid;
    Image2: TImage;
    Label2: TLabel;
    Label15: TLabel;
    editUnitMac2: TEdit;
    Label16: TLabel;
    editUserMac2: TEdit;
    Label53: TLabel;
    edt_Num: TEdit;
    btn_ReadOK: TBitBtn;
    btn_ReadClear: TBitBtn;
    btn_export: TBitBtn;
    DBGridReadCards: TDBGrid;
    Label17: TLabel;
    editUser62: TEdit;
    Label12: TLabel;
    edit_User: TEdit;
    btn_ReadQry: TButton;
    GroupBox2: TGroupBox;
    GroupBox42: TGroupBox;
    mm_Rcv: TMemo;
    mm_receivecard: TMemo;
    Memo4: TMemo;
    IconList1: TImageList;
    AdoQrypCard: TADOQuery;
    StringField3: TStringField;
    IntegerField3: TIntegerField;
    StringField4: TStringField;
    IntegerField4: TIntegerField;
    StringField6: TStringField;
    StringField7: TStringField;
    IntegerField5: TIntegerField;
    StringField9: TStringField;
    StringField10: TStringField;
    DSpCard: TDataSource;
    pMenu_pCard: TPopupMenu;
    pcard_download: TMenuItem;
    pcard_cancel: TMenuItem;
    pcard_validtime: TMenuItem;
    AdoQrypCardID: TAutoIncField;
    AdoQrypCardCardHex: TStringField;
    AdoQrypCarduser6: TStringField;
    Image4: TImage;
    GroupBox4: TGroupBox;
    btn_previous: TSpeedButton;
    SpinEdit1: TSpinEdit;
    btn_next: TSpeedButton;
    Label59: TLabel;
    panel_cardtype: TPanel;
    panel_device: TPanel;
    Label11: TLabel;
    editUser60: TEdit;
    panel_batch: TPanel;
    GroupBox10: TGroupBox;
    btn_RegOK: TBitBtn;
    panel_end: TPanel;
    Label67: TLabel;
    memo_message0: TMemo;
    PageControl3: TPageControl;
    TabSheet13: TTabSheet;
    TabSheet16: TTabSheet;
    clb_Dev0: TCheckListBox;
    TabSheet7: TTabSheet;
    clb_UnitMac0: TCheckListBox;
    Label63: TLabel;
    cbbCardType0: TComboBox;
    ckbBatch0: TCheckBox;
    DBGrid1: TDBGrid;
    btn_RegImport: TButton;
    btn_RegDel: TButton;
    btn_RegClear: TButton;
    btn_RegDo: TBitBtn;
    Label60: TLabel;
    editUnitMac0: TEdit;
    Label61: TLabel;
    editUserMac0: TEdit;
    Label64: TLabel;
    Image5: TImage;
    btn_CardRecQuery: TBitBtn;
    btn_CardRecRefresh: TBitBtn;
    btn_CardRecDel: TBitBtn;
    btn_CardRecClear: TBitBtn;
    Image6: TImage;
    btn_AlarmQuery: TBitBtn;
    btn_AlarmRefresh: TBitBtn;
    btn_AlarmDel: TBitBtn;
    btn_AlarmClear: TBitBtn;
    Label62: TLabel;
    Label65: TLabel;
    Label66: TLabel;
    Label74: TLabel;
    btn_save_sor: TBitBtn;
    Tree_pCard: TTreeView;
    DBGridpCard: TDBGrid;
    btn_c_add: TButton;
    btn_c_edit: TButton;
    btn_c_del: TButton;
    btn_c_save: TButton;
    btn_c_cancel: TButton;
    Image7: TImage;
    GroupBox1: TGroupBox;
    btn_previous1: TSpeedButton;
    btn_next1: TSpeedButton;
    Label9: TLabel;
    panel_device1: TPanel;
    Label10: TLabel;
    Label68: TLabel;
    Label69: TLabel;
    Label70: TLabel;
    editUser61: TEdit;
    SpinEdit2: TSpinEdit;
    panel_wall1: TPanel;
    Label73: TLabel;
    panel_end1: TPanel;
    Label75: TLabel;
    memo_message1: TMemo;
    PageControl4: TPageControl;
    TabSheet14: TTabSheet;
    TabSheet15: TTabSheet;
    clb_Dev1: TCheckListBox;
    btn_CancelOK: TBitBtn;
    GroupBox37: TGroupBox;
    Button1: TButton;
    Image8: TImage;
    DBGrid2: TDBGrid;
    btn_CancelImport: TButton;
    btn_CancelDel: TButton;
    btn_CancelClear: TButton;
    btn_CancelDo: TBitBtn;
    editUnitMac1: TEdit;
    editUserMac1: TEdit;
    btn_ClearOK: TBitBtn;
    Label76: TLabel;
    Label77: TLabel;
    BitBtn8: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn4: TBitBtn;
    btn_recordback: TBitBtn;
    PageControl7: TPageControl;
    TabSheet27: TTabSheet;
    DBGridSent: TDBGrid;
    TabSheet28: TTabSheet;
    DBGridNotSent: TDBGrid;
    Label78: TLabel;
    edt_pName: TEdit;
    Image9: TImage;
    btn_AddrBack: TButton;
    Label1: TLabel;
    cmbBbit: TComboBox;
    seB1: TSpinEdit;
    seB2: TSpinEdit;
    Label4: TLabel;
    cmbBName: TComboBox;
    Label5: TLabel;
    cmbBOrder: TComboBox;
    Label22: TLabel;
    cmbUbit: TComboBox;
    seU1: TSpinEdit;
    seU2: TSpinEdit;
    Label23: TLabel;
    cmbUName: TComboBox;
    Label24: TLabel;
    cmbUOrder: TComboBox;
    Label26: TLabel;
    cmbFbit: TComboBox;
    seF1: TSpinEdit;
    seF2: TSpinEdit;
    Label27: TLabel;
    cmbFName: TComboBox;
    Label28: TLabel;
    cmbFOrder: TComboBox;
    Label30: TLabel;
    cmbHbit: TComboBox;
    Label33: TLabel;
    seH1: TSpinEdit;
    seH2: TSpinEdit;
    Label31: TLabel;
    cmbHName: TComboBox;
    Label32: TLabel;
    cmbHOrder: TComboBox;
    GroupBox7: TGroupBox;
    GroupBox8: TGroupBox;
    GroupBox6: TGroupBox;
    Label79: TLabel;
    Label21: TLabel;
    Label25: TLabel;
    Label29: TLabel;
    Label80: TLabel;
    Label81: TLabel;
    Label82: TLabel;
    Label83: TLabel;
    Label84: TLabel;
    Label34: TLabel;
    Edit11: TEdit;
    Label35: TLabel;
    Edit13: TEdit;
    Label36: TLabel;
    Edit14: TEdit;
    ckbDev: TCheckBox;
    Button11: TButton;
    Button13: TButton;
    BitBtn17: TBitBtn;
    BitBtn18: TBitBtn;
    Label85: TLabel;
    Label86: TLabel;
    Label87: TLabel;
    Label88: TLabel;
    Image10: TImage;
    PageControl5: TPageControl;
    TabSheet23: TTabSheet;
    DBGridAddr: TDBGrid;
    TabSheet24: TTabSheet;
    DBGridPerson: TDBGrid;
    btn_p_add: TButton;
    btn_p_edit: TButton;
    btn_p_del: TButton;
    btn_p_save: TButton;
    btn_p_cancel: TButton;
    TreeHouse: TTreeView;
    Label47: TLabel;
    cmbAddrType: TComboBox;
    Label48: TLabel;
    edit_AddrName: TEdit;
    btn_AddrQry: TButton;
    Image11: TImage;
    DBGridDev: TDBGrid;
    Label7: TLabel;
    cmbDevType: TComboBox;
    Label46: TLabel;
    edit_DevNO: TEdit;
    btn_DevQry: TButton;
    btn_DevCL: TButton;
    Label90: TLabel;
    btn_Reg_Batch: TButton;
    pMenu_room: TPopupMenu;
    room_edit: TMenuItem;
    room_valid: TMenuItem;
    Label89: TLabel;
    Label91: TLabel;
    pMenu_p_card: TPopupMenu;
    p_card_valid: TMenuItem;
    cmb_qry_item: TComboBox;
    btn_card_import: TSpeedButton;
    N2: TMenuItem;
    N5: TMenuItem;
    btn_alarm_export: TSpeedButton;
    btn_credit_export: TSpeedButton;
    ApplicationEvents11: TApplicationEvents;
    N6: TMenuItem;
    Image12: TImage;
    mmSendCmd: TMemo;
    Label92: TLabel;
    mmRcvCmd: TMemo;
    Label93: TLabel;
    Memo1: TMemo;
    Label94: TLabel;
    Memo2: TMemo;
    Label95: TLabel;
    Image20: TImage;
    N7: TMenuItem;
    N8: TMenuItem;
    N1: TMenuItem;
    N9: TMenuItem;
    room_download: TMenuItem;
    dev_Download: TMenuItem;
    N10: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure spBtn_addrClick(Sender: TObject);
    procedure spBtn_devClick(Sender: TObject);
    procedure spBtn_doorClick(Sender: TObject);
    procedure spBtn_alarmClick(Sender: TObject);
    procedure spBtn_creditClick(Sender: TObject);
    procedure spBtn_setClick(Sender: TObject);
    procedure spBtn_registerClick(Sender: TObject);
    procedure spBtn_cancelClick(Sender: TObject);
    procedure spBtn_readClick(Sender: TObject);
    procedure spBtn_centerClick(Sender: TObject);
    procedure spBtn_CardSenderClick(Sender: TObject);
    procedure spBtn_WriteCardClick(Sender: TObject);
    procedure addr_ParamClick(Sender: TObject);
    procedure btn_moreClick(Sender: TObject);
    procedure btn_hideClick(Sender: TObject);
    procedure addr_AddClick(Sender: TObject);
    procedure addr_EditClick(Sender: TObject);
    procedure addr_DelClick(Sender: TObject);
    procedure dev_AddClick(Sender: TObject);
    procedure dev_EditClick(Sender: TObject);
    procedure dev_DelClick(Sender: TObject);
    procedure dev_RefreshClick(Sender: TObject);
    procedure AdoQryDevDevTypeGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure btn_DevQryClick(Sender: TObject);
    procedure addr_RefreshClick(Sender: TObject);
    procedure btn_AddrQryClick(Sender: TObject);
    procedure btn_RegOKClick(Sender: TObject);
    procedure btn_CancelOKClick(Sender: TObject);
    procedure btn_ReadOKClick(Sender: TObject);
    procedure btn_ClearOK1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure btn_RegSMClick(Sender: TObject);
    procedure AdoQryWallWallChosenGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure DBGrid4DblClick(Sender: TObject);
    procedure btn_RegDelClick(Sender: TObject);
    procedure btn_RegClearClick(Sender: TObject);
    procedure btn_RegCLClick(Sender: TObject);
    procedure btn_RegDoClick(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure btn_CancelSMClick(Sender: TObject);
    procedure btn_CancelDelClick(Sender: TObject);
    procedure btn_CancelClearClick(Sender: TObject);
    procedure btn_CancelDoClick(Sender: TObject);
    procedure btn_ReadQryClick(Sender: TObject);
    procedure btn_ReadClearClick(Sender: TObject);
    procedure BitBtn19Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn24Click(Sender: TObject);
    procedure BitBtn25Click(Sender: TObject);
    procedure btn_SaveClose0Click(Sender: TObject);
    procedure AdoQryUserUserPasswordGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure user_AddClick(Sender: TObject);
    procedure user_EditClick(Sender: TObject);
    procedure user_DelClick(Sender: TObject);
    procedure btn_EditPswClick(Sender: TObject);
    procedure btn_PswBackClick(Sender: TObject);
    procedure btn_PswOKClick(Sender: TObject);
    procedure Comm1ReceiveData(Sender: TObject; Buffer: Pointer;
      BufferLength: Word);
    procedure mmRcvCmdChange(Sender: TObject);
    procedure DBGridAlarmRecDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure DBGridAlarmRecCellClick(Column: TColumn);
    procedure DBGridAlarmRecDblClick(Sender: TObject);
    procedure AdoQryAlarmAlarmTypeGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure AdoQryAlarmAlarmStatusGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure AdoQryAlarmAlarmSolvedGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure AdoQryRegCardsCardTypeGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure btn_AlarmDelClick(Sender: TObject);
    procedure btn_AlarmClearClick(Sender: TObject);
    procedure btn_AlarmRefreshClick(Sender: TObject);
    procedure btn_AlarmQueryClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_CardRecDelClick(Sender: TObject);
    procedure btn_CardRecClearClick(Sender: TObject);
    procedure btn_CardRecRefreshClick(Sender: TObject);
    procedure btn_CardRecQueryClick(Sender: TObject);
    procedure btn_DataClearClick(Sender: TObject);
    procedure btn_connect1Click(Sender: TObject);
    procedure btn_disconnect1Click(Sender: TObject);
    procedure Comm3ReceiveData(Sender: TObject; Buffer: Pointer;
      BufferLength: Word);
    procedure mm_receivecardChange(Sender: TObject);
    procedure btn_CardRegClick(Sender: TObject);
    procedure btn_connect2Click(Sender: TObject);
    procedure btn_disconnect2Click(Sender: TObject);
    procedure Comm2ReceiveData(Sender: TObject; Buffer: Pointer;
      BufferLength: Word);
    procedure edt_CardNO2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_ReadCardsClick(Sender: TObject);
    procedure btn_RegisterClick(Sender: TObject);
    procedure btn_CancelClick(Sender: TObject);
    procedure btn_EditTimeClick(Sender: TObject);
    procedure btn_CardStateClick(Sender: TObject);
    procedure btn_RestoreClick(Sender: TObject);
    procedure mm_RcvChange(Sender: TObject);
    procedure btn_RegImportClick(Sender: TObject);
    procedure btn_CancelImportClick(Sender: TObject);
    procedure ApplicationEvents1Message(var Msg: tagMSG;
      var Handled: Boolean);
    procedure ApplicationEvents2Message(var Msg: tagMSG;
      var Handled: Boolean);
    procedure ApplicationEvents3Message(var Msg: tagMSG;
      var Handled: Boolean);
    procedure ApplicationEvents4Message(var Msg: tagMSG;
      var Handled: Boolean);
    procedure ApplicationEvents5Message(var Msg: tagMSG;
      var Handled: Boolean);
    procedure ApplicationEvents6Message(var Msg: tagMSG;
      var Handled: Boolean);
    procedure ApplicationEvents7Message(var Msg: tagMSG;
      var Handled: Boolean);
    procedure ApplicationEvents8Message(var Msg: tagMSG;
      var Handled: Boolean);
    procedure AdoQryCardRecCardTypeGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure mmSendCmdDblClick(Sender: TObject);
    procedure mmRcvCmdDblClick(Sender: TObject);
    procedure Memo1DblClick(Sender: TObject);
    procedure Memo2DblClick(Sender: TObject);
    procedure cmbBbitChange(Sender: TObject);
    procedure cmbUbitChange(Sender: TObject);
    procedure cmbFbitChange(Sender: TObject);
    procedure cmbHbitChange(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure BitBtn17Click(Sender: TObject);
    procedure btn_AddrBackClick(Sender: TObject);
    procedure BitBtn18Click(Sender: TObject);
    procedure CreateRoomTree(TreeView:TTreeView;SqlStr:string);
    procedure CreateBuildingTree(ParentNode:TTreeNode;TreeView:TTreeView;SqlStr:string);
    procedure CreateUnitTree(ParentNode:TTreeNode;TreeView:TTreeView;SqlStr:string);
    procedure CreateHouseTree(ParentNode:TTreeNode;TreeView:TTreeView;SqlStr:string);
    procedure CreatePersonTree(ParentNode:TTreeNode;TreeView:TTreeView;SqlStr:string);
    procedure c1Change(Sender: TObject);
    procedure btn_CardSenderClick(Sender: TObject);
    procedure AdoQryCardCardStateGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure BitBtn1Click(Sender: TObject);
    procedure Panel2Click(Sender: TObject);
    procedure clb_Dev0ClickCheck(Sender: TObject);
    procedure clb_Dev1ClickCheck(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure AdoQryUserUserPermissionGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure e2Exit(Sender: TObject);
    procedure clb_UnitMac0ClickCheck(Sender: TObject);
    procedure btn_dockClick(Sender: TObject);
    procedure btn_refreshClick(Sender: TObject);
    procedure btn_exportClick(Sender: TObject);
    procedure btn_openClick(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure TreeHouseClick(Sender: TObject);
    procedure AdoQryPersonCardStateGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure btn_p_addClick(Sender: TObject);
    procedure btn_p_editClick(Sender: TObject);
    procedure btn_p_saveClick(Sender: TObject);
    procedure btn_p_delClick(Sender: TObject);
    procedure btn_p_cancelClick(Sender: TObject);
    procedure card_cancelClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cmb_comproChange(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure btn_SaveClose1Click(Sender: TObject);
    procedure TCPServerDisconnect(AThread: TIdPeerThread);
    procedure TCPServerExecute(AThread: TIdPeerThread);
    procedure IPMCastClientIPMCastRead(Sender: TObject; AData: TStream;
      ABinding: TIdSocketHandle);
    procedure Timer3Timer(Sender: TObject);
    procedure UDPServerUDPRead(Sender: TObject; AData: TStream;
      ABinding: TIdSocketHandle);
    procedure btn_recordClick(Sender: TObject);
    procedure btn_recordbackClick(Sender: TObject);
    procedure DBGridSentDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure AdoQrySentcmdTypeGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure DBGridNotSentDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure AdoQryNotSentcmdTypeGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure BitBtn7Click(Sender: TObject);
    procedure PageControl7Change(Sender: TObject);
    procedure editUserMac2Change(Sender: TObject);
    procedure editUnitMac2Change(Sender: TObject);
    procedure TCPServerConnect(AThread: TIdPeerThread);
    procedure Timer4Timer(Sender: TObject);
    procedure ApplicationEvents9Message(var Msg: tagMSG;
      var Handled: Boolean);
    procedure ApplicationEvents10Message(var Msg: tagMSG;
      var Handled: Boolean);
    procedure SpinEdit1Change(Sender: TObject);
    procedure btn_nextClick(Sender: TObject);
    procedure btn_previousClick(Sender: TObject);
    procedure btn_next1Click(Sender: TObject);
    procedure btn_previous1Click(Sender: TObject);
    procedure SpinEdit2Change(Sender: TObject);
    procedure editUnitMac0DblClick(Sender: TObject);
    procedure editUnitMac1DblClick(Sender: TObject);
    procedure editUnitMac2DblClick(Sender: TObject);
    procedure DBGridPersonDblClick(Sender: TObject);
    procedure edt_UnitMacDblClick(Sender: TObject);
    procedure card_validtimeClick(Sender: TObject);
    procedure spBtn_checkClick(Sender: TObject);
    procedure btn_card_exportClick(Sender: TObject);
    procedure Timer5Timer(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure btn_DevCLClick(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure DBGridCardRecDblClick(Sender: TObject);
    procedure AdoQryCardRecScreenshotGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure AdoQryCardisWallGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure btn_c_addClick(Sender: TObject);
    procedure Tree_pCardClick(Sender: TObject);
    procedure btn_c_editClick(Sender: TObject);
    procedure btn_c_delClick(Sender: TObject);
    procedure btn_c_saveClick(Sender: TObject);
    procedure btn_c_cancelClick(Sender: TObject);
    procedure pcard_downloadClick(Sender: TObject);
    procedure pcard_validtimeClick(Sender: TObject);
    procedure DBGridpCardDblClick(Sender: TObject);
    procedure card_downloadClick(Sender: TObject);
    procedure pcard_cancelClick(Sender: TObject);
    procedure AdoQryReadCardsuserMacGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure AdoQryCarduserMacGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure AdoQryRegCardsuserMacGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure ckbBatch0Click(Sender: TObject);
    procedure btn_save_sorClick(Sender: TObject);
    procedure AdoQryCancelCardsuserMacGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure btn_Reg_BatchClick(Sender: TObject);
    procedure edt_CardNO1Change(Sender: TObject);
    procedure room_editClick(Sender: TObject);
    procedure room_validClick(Sender: TObject);
    procedure p_card_validClick(Sender: TObject);
    procedure Edit2DblClick(Sender: TObject);
    procedure cmb_qry_itemChange(Sender: TObject);
    procedure btn_card_importClick(Sender: TObject);
    procedure mm_cardsDblClick(Sender: TObject);
    procedure btn_alarm_exportClick(Sender: TObject);
    procedure btn_credit_exportClick(Sender: TObject);
    procedure ApplicationEvents11Message(var Msg: tagMSG;
      var Handled: Boolean);
    procedure room_downloadClick(Sender: TObject);
    procedure dev_DownloadClick(Sender: TObject);
    procedure pMenu_devPopup(Sender: TObject);
  private
    { Private declarations }
    function GetUserNO6(uStr: string): string;  //6位用户号
    function GetUserNO4(uStr: string): string;  //获取4位用户号

    function GetSendStr(bStr: string): string; //获取发送字符串
    function GetSumCheck(bStr: string): string; //获取校验和
    function GetCmdStr(regStr:string): string;//获取下发命令串
    function SendPacket(CmdStr:string):Boolean;
    function SendConfirm(Confirm:byte):Boolean;
    function ImageProcess(ImageString:string):Boolean;

    procedure SendCmd(CmdStr: String); //发送
    procedure SendFB;  //SendFB
    procedure SendFA;  //SendFA
    procedure SendF9;  //SendF9
    procedure SendFC;  //SendFC
    function GetSum(bStr:string):Byte; //检查字节和是否为0
    procedure ShowTips;

    procedure GetRegCards(devStr: string); //4408 读取注册卡
    procedure GetCardRec(devStr: string); //4508 读取刷卡记录
    procedure GetPwdOpenDoor(devStr:string); //主机密码开锁
    procedure GetUnitCallRing(devStr:string); //主机呼叫振铃
    procedure GetUnitCallOffLock(devStr:string); //主机呼叫摘机
    procedure GetUnitCallOpenDoor(devStr:string); //主机呼叫开锁
    procedure GetUnitCallManagement(devStr:string); //主机呼叫抓拍
    procedure GetDevReset(devStr: string); //主机/分机上电
    procedure GetAlarmRec(devStr:string); //读取报警记录
    procedure GetSetCancelAlarm(devStr:string); //分机布、撤防报警
    procedure GetSectorAlarm(devStr:string); //分机防区触发报警
    procedure GetStressOpenAlarm(devStr:string); //用户胁迫开门报警
    procedure GetOpenDoorOverTime(devStr:string); //主机开门超时报警

    procedure SendCommand1(cmdStr:string);
    procedure SendCommand(CmdStr: String);
    procedure ExtractCmd;

    function Card_Insert(PersonName,CardNO,CardHex,unitMac,userMac,user6,WallNO,CardMemo,ValidTime:Variant;CardType,CardState:Variant):Boolean;
    function D_Card_T_Wall(PersonName,CardNO,UserMac,CmdHead,ValidTime:string;CardType:Integer):Boolean;
    function D_Card_T_Unit(PersonName,CardNO,UserMac,CmdHead,ValidTime:string;CardType:Integer):Boolean;
    function C_Card_F_Device(CardNO,CmdHead:string;CardType:Integer):Boolean;

    function Reg_Import_ROP(unitM:string;cType:Integer):Boolean;
    function Reg_Import_SYS(cType:Integer):Boolean;
    function Reg_Import_SELF:Boolean;
  public
    { Public declarations }
    cmdStatus:(csSend,csRecv,csFree); //指令状态：发送，接收，空闲
    PortStatus:Boolean;                  
    cmdBusy:Boolean;

    function OpenDoor(DevStr:string): Boolean;
  end;

var
  MainForm: TMainForm;
  Bmp:TBitmap;
  ReceiveStream:TMemoryStream;

implementation

{$R *.dfm}
uses u_addr, u_dev, u_public, u_select15, u_userAdmin, login1, u_lang,
  u_alarmqry, u_recqry, u_AppName, u_dock, u_phone, u_treedevice, u_validtime, u_screenshot,
  u_reg_batch, u_edit_unit, u_valid_room;

//===============FormCreate===============

procedure TMainForm.FormCreate(Sender: TObject);
var
  fileStr:string;  //数据库文件路径
  connStr:string;  //数据库链接方式
  f:TIniFile;            //加载配置文件
  path_file_name:string; //配置文件路径
  i:integer;
  year,month,day,hour,minute,second:string;
  CmdStr:string;
  IDSH:TIdSocketHandle;
begin
  if AdoCon.Connected then AdoCon.Close;

  //-----链接数据库-----
  {=1=单机版链接方式}
  {fileStr:=Get_CurDir()+'\L8.rgx';
  connStr:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source='''+fileStr+''';Persist Security Info=True;Mode=Share Deny Read|Share Deny Write;Jet OLEDB:Database Password=''''';
  AdoCon.ConnectionString := connStr;
  AdoCon.Open;}
  {=2=服务器版链接方式}
  AdoCon.LoginPrompt:=false;
  AdoCon.KeepConnection:=true;
  AdoCon.ConnectionString:='FILE NAME='+Get_CurDir+'\LeeLenL8.udl';
  AdoCon.Connected:=true;
  //---链接数据库完毕----

  //--------------inifile加载初始化配置文件-------------
  path_file_name := Get_CurDir+'\config.ini';
  if not FileExists(path_file_name) then
  begin
    ShowMessage(lang_msg_NoConfig);  //'没有config文件!'
  end
  else begin
    f := TIniFile.Create(path_file_name);

    com_port  := f.ReadString('sysParam','ComPort','COM1');
    com_sender:= f.ReadString('sysParam','ComSender','COM2');
    com_writer:= f.ReadString('sysParam','ComWriter','COM3');
    bBit      := f.ReadInteger('UserParam','Bbit',2);
    uBit      := f.ReadInteger('UserParam','Ubit',2);
    fBit      := f.ReadInteger('UserParam','Fbit',2);
    hBit      := f.ReadInteger('UserParam','Hbit',2);

    bOrd      := f.ReadInteger('UserParam','BOrd',2);
    uOrd      := f.ReadInteger('UserParam','UOrd',2);
    fOrd      := f.ReadInteger('UserParam','FOrd',2);
    hOrd      := f.ReadInteger('UserParam','HOrdt',2);

    AppName     := f.ReadString('sysParam','AppName','LEELEN L8-xx小区管理软件');
    DataDocking := f.ReadString('sysParam','DataDocking','false');
    Test        := f.ReadString('sysParam','Test','false');
    PhoneDoor   := f.ReadString('sysParam','PhoneDoor','false');

    MinNO  := f.ReadString('propertyCard','MinNO','9990');
    MaxNO  := f.ReadString('propertyCard','MaxNO','9999');
    pcType := f.ReadBool('propertyCard','pcType',false);

    port   := f.ReadString('server','Port','17767');
    ip     := f.ReadString('server','IP','127.0.0.1');

    ComType := f.ReadInteger('ComProperty','Type',0);
    ManageNumber := f.ReadString('ComProperty','ManageNumber','9998-0002');
    NetIP   := f.ReadString('ComProperty','NetIP','127.0.0.1');
    ReceivePort := f.ReadString('ComProperty','ReceivePort','17701');
    SendPort    := f.ReadString('ComProperty','SendPort','17701');

    f.Free;
  end;
  //------------inifile加载初始化配置文件完毕---------------

  //---数据对接数据库配置---
  if DataDocking = 'true' then
  begin
    btn_dock.Visible:=true;
    
    MainForm.AdoConDock.LoginPrompt:=false;
    MainForm.AdoConDock.KeepConnection:=true;
    MainForm.AdoConDock.ConnectionString:='FILE NAME='+Get_CurDir+'\DataDock.udl';
    MainForm.AdoConDock.Connected:=true;
  end;
  //---数据对接数据库配置完毕---

  //---手机开锁功能配置---
  if PhoneDoor = 'true' then
  begin
    btn_open.Visible:=true;
  end;
  //---手机开锁功能配置完毕---

  //-----初始化通信连接信息-----
  intHand:=0; //握手次数
  intRcv:=0;  //收到指令条数
  intSend:=0; //发送指令条数
  intOK:=0;   //有效指令
  intErr:=0;  //无效指令

  cmdBusy := false;
  
  //------建立通信连接------
  if ComType=0 then
  begin
    try
      Comm1.CommName := com_port;
      Comm1.StartComm;
      ShowTips();
      cmdStatus := csFree;
      Timer1.Enabled:=false;
    except
      sb_tips.Panels[1].Text := lang_msg_NoComm; //'通信:未连接';
    end;
  end
  else if ComType=1 then
  begin
    try
      //Memo5.Lines.Add(IPWatch.LocalIP);
      IPMCastClient.MulticastGroup := '224.0.0.1';
      IPMCastClient.DefaultPort := 6789;
      IPMCastClient.Active := true;
      Memo5.Lines.Add('6789端口监听已开启!');
      TCPServer.DefaultPort := StrToInt(ReceivePort);
      TCPServer.Active := true;
      Memo5.Lines.Add('TCPServer 服务已打开!');
      sb_tips.Panels[1].Text := lang_msg_Comm; //'通信:已连接';
      Timer1.Enabled:=true;
    except
      sb_tips.Panels[1].Text := lang_msg_NoComm; //'通信:未连接';
      Timer1.Enabled:=false;
    end;
  end;

  //-----连接发卡器-----
  try
    Comm3.StopComm;
    Comm3.BaudRate := 1200;
    Comm3.CommName := com_sender;
    Comm3.StartComm;
    Label65.Caption := '（已连接）';
    btn_connect1.Enabled := false;
    btn_disconnect1.Enabled := true;
  except
    Label65.Caption := '（未连接）';
    btn_connect1.Enabled := true;
    btn_disconnect1.Enabled := false;
  end;

  //-----连接写卡器-----
  try
    Comm2.StopComm;
    Comm2.BaudRate := 2400;
    Comm2.CommName := com_writer;
    Comm2.StartComm;
    Label74.Caption := '（已连接）';
    btn_connect2.Enabled := false;
    btn_disconnect2.Enabled := true;
  except
    Label74.Caption := '（未连接）';
    btn_connect2.Enabled := true;
    btn_disconnect2.Enabled := false;
  end;
  
  //-----权限设定-----
  if sys_permit=lang_userType0 then
  begin
    GroupBox27.Visible:=true;
    GroupBox33.Visible:=false;
    GroupBox41.Top := 80;
    GroupBox27.Top := 254;
    sb_tips.Panels[0].Text := lang_sb_tips8;
  end
  else begin
    GroupBox41.Top := 80;
    GroupBox33.Top := 258;
    Panel2.Enabled := false;
    spBtn_addr.Enabled := false;
    spBtn_dev.Enabled := false;
    spBtn_door.Enabled := false;
    GroupBox41.Enabled := false;
    btn_more.Enabled := false;
    btn_record.Enabled := false;
    btn_AlarmDel.Enabled := false;
    btn_AlarmClear.Enabled := false;
    btn_CardRecDel.Enabled := false;
    btn_CardRecClear.Enabled := false;
    sb_tips.Panels[0].Text := lang_sb_tips9;
  end;

  //-----程序初始化-----
  isBatch:=false;
  Panel2.Caption:= AppName;
  Tree_pCard.Items[0].Text:=AppName;
  Tree_pCard.Items[0].Selected:=true;
  lab_UserName.Caption:=sys_user;

  for i:=0 to PageControl1.PageCount-1 do
  begin
    PageControl1.Pages[i].TabVisible:=false;
  end;

  for i:=0 to PageControl2.PageCount-1 do
  begin
    PageControl2.Pages[i].TabVisible:=false;
  end;

  for i:=0 to PageControl3.PageCount-1 do
  begin
    PageControl3.Pages[i].TabVisible:=false;
  end;

  for i:=0 to PageControl4.PageCount-1 do
  begin
    PageControl4.Pages[i].TabVisible:=false;
  end;

  for i:=0 to PageControl5.PageCount-1 do
  begin
    PageControl5.Pages[i].TabVisible:=false;
  end;

  for i:=0 to PageControl6.PageCount-1 do
  begin
    PageControl6.Pages[i].TabVisible:=false;
  end;

  if isSend=true then
  begin
    ExecSQL('update t_cmd set sent=0 where sent=2');
  end;

  RefreshRec(AdoQryAddr,'select * from t_addr order by AddrNO');
  RefreshRec(AdoQryDev, 'select * from t_dev  order by AddrNO');
  RefreshRec(AdoQryWall,'select * from t_wall order by WallNO');
  RefreshRec(AdoQryCard,'select * from t_card order by ID');
  edt_amount.Text:=IntToStr(AdoQryCard.RecordCount);
  RefreshRec(AdoQryAlarm,'select * from t_alarm order by AlarmTime DESC,ID DESC');
  RefreshRec(AdoQryCardRec,'select * from t_CardRec order by RecTime DESC,ID DESC');
  RefreshRec(AdoQryReadCards,'select * from t_ReadCards');
  RefreshRec(AdoQryCancelCards,'select * from t_CancelCmd');
  edt_Num.Text:=IntToStr(AdoQryReadCards.RecordCount);
  RefreshRec(AdoQryRegCards,'select * from t_RegCmd');

  spBtn_addr.Click;
  spBtn_CardSender.Click;
        
  {cmbBName.Items.Clear;
  cmbBName.Items.Add(lang_bName);
  cmbBName.ItemIndex:=0;
  cmbUName.Items.Clear;
  cmbUName.Items.Add(lang_uName);
  cmbUName.ItemIndex:=0;
  cmbFName.Items.Clear;
  cmbFName.Items.Add(lang_fName);
  cmbFName.ItemIndex:=0;
  cmbHName.Items.Clear;
  cmbHName.Items.Add(lang_hName);
  cmbHName.ItemIndex:=0;}
  
  //============楼栋参数=============
  cmbBbit.ItemIndex:=bBit-1;
  cmbUbit.ItemIndex:=uBit-1;
  cmbFbit.ItemIndex:=fBit-1;
  cmbHbit.ItemIndex:=hBit-1;

  cmbBOrder.Text := IntToStr(bOrd);
  cmbUOrder.Text := IntToStr(uOrd);
  cmbFOrder.Text := IntToStr(fOrd);
  cmbHOrder.Text := IntToStr(hOrd);


  //==========设置主窗体背景图片==============
  Bmp := TBitmap.Create;
  Bmp.LoadFromFile(Get_CurDir+'\image\background.bmp');
  Brush.Bitmap := Bmp;

  //==========与管理机进行时间同步===================
  if ComType=0 then
  begin
    year  := IntToStr(YearOf(Now()));
    month := IntToHex(MonthOf(Now()),2);
    day   := IntToStr(DayOf(Now()));
    day   := Rightstr('0'+day,2);

    hour  := IntToStr(HourOf(Now()));
    hour  := Rightstr('0'+hour,2);

    minute:= IntToStr(MinuteOf(Now()));
    minute:= Rightstr('0'+minute,2);

    second:= IntToStr(SecondOf(Now()));

    CmdStr:= '0000'+year+'00'+month+day+'00'+hour+minute+'000C';
    CmdStr:= GetSendStr(CmdStr);

    SendCmd(CmdStr);
  end;

end;

//===============FormShow===============

procedure TMainForm.FormShow(Sender: TObject);
begin
  cbb_port.Items:=GetComPortList();
  cbb_port.Text:=com_port;
  cmbPort1.Items:=GetComPortList();
  cmbPort1.ItemIndex:=0;
  cmbPort1.Text := com_sender;
  cmbPort2.Items:=GetComPortList();
  cmbPort2.ItemIndex:=0;
  cmbPort2.Text := com_writer;
  cmbBbit.OnChange(cmbBbit);
  cmbUbit.OnChange(cmbUbit);
  cmbFbit.OnChange(cmbFbit);
  cmbHbit.OnChange(cmbHbit);
  cmb_compro.ItemIndex:=ComType;
  cmb_compro.OnChange(self);
  edit_receive.Text:=ReceivePort;
  edit_send.Text:=SendPort;
  edit_center.Text:=ManageNumber;
end;

//===============FormDestroy===============

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  Bmp.Free;
end;



//===============1、设置小区名称===============

procedure TMainForm.Panel2Click(Sender: TObject);
var
  f:TIniFile;            //加载配置文件
  path_file_name:string; //配置文件路径
begin
  f_AppName:=Tf_AppName.Create(nil);
  f_AppName.Caption := lang_cpCommunity;
  if f_AppName.ShowModal=mrOK then
  begin
    Panel2.Caption:=f_AppName.edit_AppName.Text;
    AppName:=Panel2.Caption;

    Tree_pCard.Items[0].Text := AppName;

    path_file_name := Get_CurDir+'\config.ini';
    if not FileExists(path_file_name) then
    begin
      ShowMessage(lang_msg_NoConfig);
    end
    else begin
      f := TIniFile.Create(path_file_name);
      f.WriteString('sysParam','AppName',f_AppName.edit_AppName.Text);
      f.Free;
    end;

    CreateRoomTree(TreeHouse,'select * from t_addr where AddrType=0 order by AddrNO');
    //N7.Click;
  end;
end;



//===============2、房产管理模块===============

procedure TMainForm.spBtn_addrClick(Sender: TObject);
begin
  PageControl1.ActivePageIndex:=0;
  PageControl5.ActivePageIndex:=0;
  spBtn_addr.Down:=true;
  Panel3.Visible:=false;
  spBtn_alarm.Top :=123;
  spBtn_credit.Top:=164;
  spBtn_set.Top   :=205;

  CreateRoomTree(TreeHouse,'select * from t_addr where AddrType=0 order by AddrNO');
end;

//=====2.1 生成地址树=====

//==TreeHouseClick==
procedure TMainForm.TreeHouseClick(Sender: TObject);
var
  SqlStr:string;
begin
  if PNodeInfo(TreeHouse.Selected.Data)^.DType=-1 then
  begin
    RefreshRec(AdoQryAddr,'select * from t_addr order by AddrNO');
    PageControl5.ActivePageIndex:=0;

    room_edit.Enabled := false;
    room_valid.Enabled := false;
    room_download.Enabled := false;
  end
  else if PNodeInfo(TreeHouse.Selected.Data)^.DType=0 then
  begin
    SqlStr:='select * from t_addr where AddrType=1 and AddrNO like '+QuotedStr(PNodeInfo(TreeHouse.Selected.Data)^.ID+'%')+' order by AddrNO';
    TreeHouse.Selected.DeleteChildren;
    CreateUnitTree(TreeHouse.Selected,TreeHouse,SqlStr);

    room_edit.Enabled := false;
    room_valid.Enabled := false;
    room_download.Enabled := false;

    if TreeHouse.Selected.Expanded=false then
      TreeHouse.Selected.Expanded:=true;

    RefreshRec(AdoQryAddr,'select * from t_addr where AddrNO like '+QuotedStr(PNodeInfo(TreeHouse.Selected.Data)^.ID+'%')+' and AddrType<>0'+' order by AddrNO');
    PageControl5.ActivePageIndex:=0;
  end
  else if PNodeInfo(TreeHouse.Selected.Data)^.DType=1 then
  begin
    SqlStr:='select * from t_addr where AddrType=2 and AddrNO like '+QuotedStr(PNodeInfo(TreeHouse.Selected.Data)^.ID+'%')+' order by AddrNO';
    TreeHouse.Selected.DeleteChildren;
    CreateHouseTree(TreeHouse.Selected,TreeHouse,SqlStr);

    room_edit.Enabled := true;
    room_valid.Enabled := true;
    room_download.Enabled := true;

    if TreeHouse.Selected.Expanded=false then
      TreeHouse.Selected.Expanded:=true;

    PageControl5.ActivePageIndex:=0;
  end
  else if PNodeInfo(TreeHouse.Selected.Data)^.DType=2 then
  begin
    RefreshRec(AdoQryAddr,'select * from t_addr where DevNO='+QuotedStr(PNodeInfo(TreeHouse.Selected.Data)^.NO)+' order by AddrNO');
    PageControl5.ActivePageIndex:=1;
    SqlStr:='select * from t_card where unitMac='+QuotedStr(LeftStr(PNodeInfo(TreeHouse.Selected.Data)^.NO,4))+' and userMac='+QuotedStr(RightStr(PNodeInfo(TreeHouse.Selected.Data)^.NO,4));
    TreeHouse.Selected.DeleteChildren;
    CreatePersonTree(TreeHouse.Selected,TreeHouse,SqlStr);

    room_edit.Enabled := false;
    room_valid.Enabled := true;
    room_download.Enabled := true;

    if TreeHouse.Selected.Expanded=false then
      TreeHouse.Selected.Expanded:=true;

    btn_p_add.Enabled:=true;

  end
  else if PNodeInfo(TreeHouse.Selected.Data)^.DType=5 then
  begin
    PageControl5.ActivePageIndex:=1;
    RefreshRec(AdoQryPerson,'select * from t_card where CardNO='+QuotedStr(PNodeInfo(TreeHouse.Selected.Data)^.NO)+' and unitMac='+QuotedStr(LeftStr(PNodeInfo(TreeHouse.Selected.Parent.Data)^.NO,4)));

    btn_p_add.Enabled:=false;

    room_edit.Enabled := false;
    room_valid.Enabled := false;
    room_download.Enabled := false;
  end;
end;
//==CreateRoomTree==
procedure TMainForm.CreateRoomTree(TreeView:TTreeView;SqlStr:string);
var
  BootNode:TTreeNode;
  BootNodeInfo:PNodeInfo;
begin
  New(BootNodeInfo);
  BootNodeInfo.DType:=-1;
  BootNodeInfo.ID:='0';
  BootNodeInfo.Name := AppName;

  TreeView.Items.Clear;
  BootNode:=TreeView.Items.AddChildObject(nil,BootNodeInfo.Name,BootNodeInfo);
  BootNode.ImageIndex:=4;
  CreateBuildingTree(BootNode,TreeView,SqlStr);
  TreeView.FullExpand;
end;
//==CreateBuildingTree==
procedure TMainForm.CreateBuildingTree(ParentNode:TTreeNode;TreeView:TTreeView;SqlStr:string);
var
  BuildingNode:TTreeNode;
  BuildingNodeInfo:PNodeInfo;
begin
  with AdoQryAddr do
  begin
    SQL.Clear;
    SQL.Add(SqlStr);
    Open;

    First;
    while not EOF do
    begin
      New(BuildingNodeInfo);
      BuildingNodeInfo.DType:=FieldByName('AddrType').AsInteger;
      BuildingNodeInfo.ID:=FieldByName('AddrNO').AsString;
      BuildingNodeInfo.Name:=FieldByName('AddrName').AsString;
      BuildingNodeInfo.NO:=FieldByName('DevNO').AsString;
      BuildingNode:=TreeView.Items.AddChildObject(ParentNode,BuildingNodeInfo.Name,BuildingNodeInfo);
      BuildingNode.ImageIndex:=1;
      Next;
    end;
  end;
end;
//==CreateUnitTree==
procedure TMainForm.CreateUnitTree(ParentNode:TTreeNode;TreeView:TTreeView;SqlStr:string);
var
  UnitNode:TTreeNode;
  UnitNodeInfo:PNodeInfo;
begin
  with AdoQryAddr do
  begin
    SQL.Clear;
    SQL.Add(SqlStr);
    Open;

    First;
    while not EOF do
    begin
      New(UnitNodeInfo);
      UnitNodeInfo.DType:=FieldByName('AddrType').AsInteger;
      UnitNodeInfo.ID:=FieldByName('AddrNO').AsString;
      UnitNodeInfo.Name:=FieldByName('AddrName').AsString;
      UnitNodeInfo.NO:=FieldByName('DevNO').AsString;

      if TreeView.Name='TreeDevice' then
        UnitNodeInfo.Name := FieldByName('AddrName').AsString+'_'+FieldByName('DevNO').AsString;

      UnitNode:=TreeView.Items.AddChildObject(ParentNode,UnitNodeInfo.Name,UnitNodeInfo);
      UnitNode.ImageIndex:=2;
      Next;
    end;
  end;
end;
//==CreateHouseTree==
procedure TMainForm.CreateHouseTree(ParentNode:TTreeNode;TreeView:TTreeView;SqlStr:string);
var
  HouseNode:TTreeNode;
  HouseNodeInfo:PNodeInfo;
begin
  with AdoQryAddr do
  begin
    SQL.Clear;
    SQL.Add(SqlStr);
    Open;

    First;
    while not EOF do
    begin
      New(HouseNodeInfo);
      HouseNodeInfo.DType:=FieldByName('AddrType').AsInteger;
      HouseNodeInfo.ID:=FieldByName('AddrNO').AsString;
      HouseNodeInfo.Name:=FieldByName('AddrName').AsString;
      HouseNodeInfo.NO:=FieldByName('DevNO').AsString;

      if TreeView.Name='TreeDevice' then
        HouseNodeInfo.Name := FieldByName('AddrName').AsString+'_'+FieldByName('DevNO').AsString;

      HouseNode:=TreeView.Items.AddChildObject(ParentNode,HouseNodeInfo.Name,HouseNodeInfo);
      HouseNode.ImageIndex:=3;
      Next;
    end;
  end;
end;
//==CreatePersonTree==
procedure TMainForm.CreatePersonTree(ParentNode:TTreeNode;TreeView:TTreeView;SqlStr:string);
var
  PersonNode:TTreeNode;
  PersonNodeInfo:PNodeInfo;
begin
  with AdoQryPerson do
  begin
    SQL.Clear;
    SQL.Add(SqlStr);
    Open;

    First;
    while not EOF do
    begin
      New(PersonNodeInfo);
      PersonNodeInfo.DType:=5;//FieldByName('CardType').AsInteger
      PersonNodeInfo.Name:=FieldByName('PersonName').AsString;
      PersonNodeInfo.NO:=FieldByName('CardNo').AsString;
      PersonNodeInfo.ID:=IntToStr(FieldByName('CardState').AsInteger);
      PersonNode:=TreeView.Items.AddChildObject(ParentNode,PersonNodeInfo.Name,PersonNodeInfo);
      PersonNode.ImageIndex:=5;
      Next;
    end;
  end;
end;

//=====2.1.1 修改主机号码=====

procedure TMainForm.room_editClick(Sender: TObject);
var
  unitNO:string;
  userNO:string;
  destNO:string;
begin
  frm_edit_unit := Tfrm_edit_unit.Create(nil);
  unitNO := LeftStr(PNodeInfo(TreeHouse.Selected.Data)^.NO,4);
  frm_edit_unit.edit_unit_origin.Text := unitNO;
  if frm_edit_unit.ShowModal=mrOK then
  begin
    destNO := frm_edit_unit.edit_unit_dest.Text;
    if Get_RecCount('select * from t_addr where DevNO like '+QuotedStr(destNO+'-'+'%'))>0 then
    begin
      ShowMessage('该主机号已存在，修改失败！');
      Exit;
    end
    else begin
      //修改t_addr表
      RefreshRec(AdoQryAddr,'select * from t_addr where DevNO like '+QuotedStr(unitNO+'-'+'%'));
      with AdoQryAddr do
      begin
        First;
        while not EOF do
        begin
          userNO := RightStr(FieldByName('DevNO').AsString,4);
          Edit;
          FieldByName('DevNO').AsString := destNO+'-'+userNO;
          Post;
          Next;
        end;
      end;

      //修改t_dev表
      RefreshRec(AdoQryDev,'select * from t_dev where DevNO like '+QuotedStr(unitNO+'-'+'%'));
      with AdoQryDev do
      begin
        First;
        while not EOF do
        begin
          userNo := RightStr(FieldByName('DevNO').AsString,4);
          Edit;
          FieldByName('DevNO').AsString := destNO+'-'+userNO;
          Post;
          Next;
        end;
      end;                            

      //修改t_unit表
      ExecSQL('update t_unit set UnitNO='+QuotedStr(destNO)+' where UnitNO='+QuotedStr(unitNO));

      TreeHouse.OnClick(self);
      RefreshRec(AdoQryDev,'select * from t_dev order by AddrNO');
      ShowMessage('主机号码已修改！');
    end;
  end;
end;

//=====2.1.2 设置住户卡有效期=====

procedure TMainForm.room_validClick(Sender: TObject);
var
  ValidTime:string;
  unitM,userM:string;
begin
  frm_valid_room := Tfrm_valid_room.Create(nil);
  frm_valid_room.Caption := '设置住户卡有效期';

  //设置Label1
  if PNodeInfo(TreeHouse.Selected.Data)^.DType=1 then
  begin
    frm_valid_room.Label1.Caption := '单元：';
  end
  else if PNodeInfo(TreeHouse.Selected.Data)^.DType=2 then
  begin
    frm_valid_room.Label1.Caption := '住户：';
  end;

  frm_valid_room.edit_name.Text := PNodeInfo(TreeHouse.Selected.Data)^.Name;

  if frm_valid_room.ShowModal=mrOK then
  begin
    ValidTime := FormatDateTime('YYYY-MM-DD hh:mm:SS',frm_valid_room.date_valid.DateTime);
    unitM := LeftStr(PNodeInfo(TreeHouse.Selected.Data)^.NO,4);
    userM := RightStr(PNodeInfo(TreeHouse.Selected.Data)^.NO,4);

    if PNodeInfo(TreeHouse.Selected.Data)^.DType=1 then
    begin
      ExecSQL('update t_card set ValidTime='+QuotedStr(ValidTime)+' where unitMac='+QuotedStr(unitM)+' and userMac<'+QuotedStr(MinNO));
    end
    else if PNodeInfo(TreeHouse.Selected.Data)^.DType=2 then
    begin
      ExecSQL('update t_card set ValidTime='+QuotedStr(ValidTime)+' where unitMac='+QuotedStr(unitM)+' and userMac='+QuotedStr(userM));
    end;

    RefreshRec(AdoQryPerson,'select * from t_card where unitMac='+QuotedStr(AdoQryPerson.FieldByName('unitMac').AsString)+' and userMac='+QuotedStr(AdoQryPerson.FieldByName('userMac').AsString));
    RefreshRec(AdoQryCard,'select * from t_card');
  end;
end;

//=====2.1.3 重新发卡=====

procedure TMainForm.room_downloadClick(Sender: TObject);
var
  CardNO,UnitMac,UserMac:String;
  CardType:Integer;
  Temp,CmdStr:String;
begin
  UnitMac := LeftStr(PNodeInfo(TreeHouse.Selected.Data)^.NO,4);
  UserMac := RightStr(PNodeInfo(TreeHouse.Selected.Data)^.NO,4);

  if (Length(UnitMac)<>4) or (Length(UserMac)<>4) then
  begin
    ShowMessage('设备号码有误，请确认无误后重新操作！');
    Exit;
  end
  else begin
    if MessageDlg('执行此操作，将重新下发本单元或本住户下的所有卡！',mtConfirmation,[mbYes,mbNo],0) = mrYes then
    begin
      with AdoQryCard do
      begin
        SQL.Clear;
        if UserMac='0000' then
          SQL.Add('select * from t_card where unitMac='+QuotedStr(UnitMac)+' order by userMac')
        else
          SQL.Add('select * from t_card where unitMac='+QuotedStr(UnitMac)+' and userMac='+QuotedStr(UserMac)+' order by userMac');
        Active := true;
        First;
        while not EOF do
        begin
          CardType := FieldByName('CardType').AsInteger;
          CardNO := FieldByName('CardNO').AsString;
          UserMac := FieldByName('userMac').AsString;

          if CardType=2 then
            Temp := '0A903A'
          else
            Temp := GetUserNO6(UserMac);

          CmdStr := '0000'+IntToHex(StrToInt(CardNO),6)+UnitMac+Temp+'010A';
          CmdStr := GetSendStr(CmdStr);

          AdoCon.Execute('insert into t_cmd(CardNO,cmdStr,unitMac,userMac,sent,cmdType) values('+QuotedStr(CardNo)+','+QuotedStr(CmdStr)+','+QuotedStr(UnitMac)+','+QuotedStr(UserMac)+',0,0)');

          Next;
        end;
      end;
    end;
  end;
end;

//=====2.2 管理楼栋信息=====

//===2.2.1 添加楼栋===
procedure TMainForm.addr_AddClick(Sender: TObject);
begin
  f_addr:=Tf_addr.Create(nil);
  f_addr.Caption:=lang_pMenuAddrAdd;
  f_addr.edit_AddrName.Visible := false;
  f_addr.cmbAddrType.Enabled := true;

  if f_addr.ShowModal=mrOK then
  begin
    if Get_RecCount('select * from t_addr where AddrNO='+QuotedStr(f_addr.AddrNO))<1 then
    begin
      with AdoQryAddr do
      begin
        Open;
        Append;
        FieldByName('AddrType').AsInteger := f_addr.AddrType;
        FieldByName('AddrName').AsString  := f_addr.AddrName;
        FieldByName('AddrNO').AsString    := f_addr.AddrNO;
        FieldByName('FatherAddr').AsString:= f_addr.FatherAddr;
        FieldByName('DevNO').AsString     := f_addr.DevNO;
        FieldByName('Memo').AsString      := f_addr.Memo;
        Post;
      end;
      RefreshRec(AdoQryAddr,'select * from t_addr order by AddrNO');
    end
    else
      ShowMessage(lang_msg_AddrExist);
  end;

  CreateRoomTree(TreeHouse,'select * from t_addr where AddrType=0 order by AddrNO');
end;
//===2.2.2 编辑楼栋===
procedure TMainForm.addr_EditClick(Sender: TObject);
var
  addrNO:string;
  AddrName_Old,AddrName_New,ReplaceStr:string;
begin
  f_addr:=Tf_addr.Create(nil);
  f_addr.Caption:=lang_pMenuAddrEdit;

  f_addr.cmbAddrType.ItemIndex:=AdoQryAddr.FieldByName('AddrType').AsInteger;
  f_addr.cmbAddrType.OnChange(self);
  f_addr.cmbAddrType.Enabled := false;

  f_addr.edit_DevNO.Text:=AdoQryAddr.FieldByName('DevNO').AsString;
  f_addr.memo_addr.Text:=AdoQryAddr.FieldByName('Memo').AsString;

  AddrName_Old := AdoQryAddr.FieldByName('AddrName').AsString;
  f_addr.edit_AddrName.Visible := true;
  f_addr.edit_AddrName.Text := AddrName_Old;

  addrNO := LeftStr(AdoQryAddr.FieldByName('AddrNO').AsString+'00000000',8);
  f_addr.spEdit_Building.Value := StrToInt(LeftStr(addrNO,bBit));
  f_addr.spEdit_Unit.Value := StrToInt(MidStr(addrNO,bBit+1,uBit));
  f_addr.spEdit_Floor.Value := StrToInt(MidStr(addrNO,5,fBit));
  f_addr.spEdit_Room.Value := StrToInt(RightStr(addrNO,hBit));

  if f_addr.ShowModal=mrOK then
  begin
    AddrName_New := f_addr.edit_AddrName.Text;

    with AdoQryAddr do
    begin
      Open;
      Edit;
      FieldByName('AddrType').AsInteger := f_addr.AddrType;
      FieldByName('AddrName').AsString  := AddrName_New;
      FieldByName('AddrNO').AsString    := f_addr.AddrNO;
      FieldByName('FatherAddr').AsString:= f_addr.FatherAddr;
      FieldByName('DevNO').AsString     := f_addr.DevNO;
      FieldByName('Memo').AsString      := f_addr.Memo;
      Post;
    end;

    if not (AddrName_New=AddrName_Old) then
    begin
      with AdoQryAddr do
      begin
        SQL.Clear;
        SQL.Add('select * from t_addr where AddrName like'+QuotedStr(AddrName_Old+'%'));
        Active := true;
        First;
        while not EOF do
        begin
          ReplaceStr := StringReplace(FieldByName('AddrName').AsString,AddrName_Old,AddrName_New,[rfReplaceAll]);
          Edit;
          FieldByName('AddrName').AsString := ReplaceStr;
          Post;
          Next;
        end;
      end;

      with AdoQryDev do
      begin
        SQL.Clear;
        SQL.Add('select * from t_dev where AddrName like'+QuotedStr(AddrName_Old+'%'));
        Active := true;
        First;
        while not EOF do
        begin
          ReplaceStr := StringReplace(FieldByName('AddrName').AsString,AddrName_Old,AddrName_New,[rfReplaceAll]);
          Edit;
          FieldByName('AddrName').AsString := ReplaceStr;
          Post;
          Next;
        end;
      end;
    end;

    RefreshRec(AdoQryAddr,'select * from t_addr order by AddrNO');
    RefreshRec(AdoQryDev,'select * from t_dev order by AddrNO');
  end;

  CreateRoomTree(TreeHouse,'select * from t_addr where AddrType=0 order by AddrNO');
end;
//===2.2.3 删除楼栋===
procedure TMainForm.addr_DelClick(Sender: TObject);
begin
  if MessageDlg(lang_msg_Del,mtConfirmation,[mbYes,mbNo],0) = mrYes then
  begin
    with DBGridAddr.DataSource.DataSet do
    begin
      First;
      while not EOF do
      begin
        if DBGridAddr.SelectedRows.CurrentRowSelected then
        begin
          ExecSQL('delete from t_addr where AddrNO like '+QuotedStr(DBGridAddr.Columns.Items[3].Field.Value+'%'));
        end;
        Next;
      end;
    end;

  end;

  CreateRoomTree(TreeHouse,'select * from t_addr where AddrType=0 order by AddrNO');
end;
//===2.2.4 刷新楼栋===
procedure TMainForm.addr_RefreshClick(Sender: TObject);
begin
  RefreshRec(AdoQryAddr,'select * from t_addr order by AddrNO');
  CreateRoomTree(TreeHouse,'select * from t_addr where AddrType=0 order by AddrNO');
end;
//===2.2.5 查询楼栋===
procedure TMainForm.btn_AddrQryClick(Sender: TObject);
var
  addrType:integer;
  addrName:string;
begin
  addrType:=cmbAddrType.ItemIndex;
  addrName:=edit_AddrName.Text;
  if addrName<>'' then
    RefreshRec(AdoQryAddr,'select * from t_addr where AddrType='+IntToStr(addrType)+' and AddrName like '+QuotedStr('%'+addrName+'%')+' order by AddrNO')
  else
    RefreshRec(AdoQryAddr,'select * from t_addr where AddrType='+IntToStr(addrType)+' order by AddrNO');
end;
//===2.2.6 楼栋参数===
procedure TMainForm.addr_ParamClick(Sender: TObject);
begin
  PageControl1.ActivePageIndex:=7;
end;
//==示例==
procedure TMainForm.Button11Click(Sender: TObject);
var
  BNO,UNO,FNO,HNO:String;
  N1,N2,N3,N4:string;
begin
  case cmbBbit.ItemIndex of
    0:BNO := '1';
    1:BNO := '01';
    2:BNO := '001';
  end;

  case cmbUbit.ItemIndex of
    0:UNO := '2';
    1:UNO := '02';
    2:UNO := '002';
  end;

  case cmbFbit.ItemIndex of
    0:FNO := '3';
    1:FNO := '03';
    2:FNO := '003';
  end;

  case cmbHbit.ItemIndex of
    0:HNO := '4';
    1:HNO := '04';
    2:HNO := '004';
  end;

  case cmbBorder.ItemIndex of
    0:N1 := BNO;
    1:N2 := BNO;
    2:N3 := BNO;
    3:N4 := BNO;
  end;

  case cmbUorder.ItemIndex of
    0:N1 := UNO;
    1:N2 := UNO;
    2:N3 := UNO;
    3:N4 := UNO;
  end;

  case cmbForder.ItemIndex of
    0:N1 := FNO;
    1:N2 := FNO;
    2:N3 := FNO;
    3:N4 := FNO;
  end;

  case cmbHorder.ItemIndex of
    0:N1 := HNO;
    1:N2 := HNO;
    2:N3 := HNO;
    3:N4 := HNO;
  end;

  edit11.Text := BNO+UNO+FNO+HNO;
  edit13.Text := N1+N2+'-'+N3+N4;
  edit14.Text := '1'+cmbBName.Text+'2'+cmbUName.Text+'3'+cmbFName.Text+HNO+cmbHName.Text;
end;
//==保存==
procedure TMainForm.BitBtn17Click(Sender: TObject);
var
  f:TIniFile;
  path_file_name:string;
begin
  //--------------inifile-------------
  path_file_name := Get_CurDir+'\config.ini';
  if not FileExists(path_file_name) then
  begin
    ShowMessage(lang_msg_NoConfig);
  end
  else begin
    f := TIniFile.Create(path_file_name);
    f.WriteString('userParam','Bbit',cmbBbit.Text);
    f.WriteString('userParam','Ubit',cmbUbit.Text);
    f.WriteString('userParam','Fbit',cmbFbit.Text);
    f.WriteString('userParam','Hbit',cmbHbit.Text);

    f.WriteString('userParam','BOrd',cmbBOrder.Text);
    f.WriteString('userParam','UOrd',cmbUOrder.Text);
    f.WriteString('userParam','FOrd',cmbFOrder.Text);
    f.WriteString('userParam','HOrd',cmbHOrder.Text);
    f.Free;
  end;
  //---------------inifile-end----------
  ShowMessage(lang_msgSaveParam);
end;
//==初始化==
procedure TMainForm.BitBtn18Click(Sender: TObject);
var
  B,U,F,H:integer;
  N1,N2,N3,N4:string;
  //dvNo,qMemo:string; //地址编号,地址名称,设备号码
  bNo,uNo,fNo,hNo:string;
  iniF:TIniFile;
  path_file_name:string;
  addrType:integer;
  addrName,addrNO,fatherAddr,devNO,memo:string;
begin
  path_file_name := Get_CurDir+'\config.ini';
  iniF := TIniFile.Create(path_file_name);
  iniF.WriteString('userParam','Bbit',cmbBbit.Text);
  iniF.WriteString('userParam','Ubit',cmbUbit.Text);
  iniF.WriteString('userParam','Fbit',cmbFbit.Text);
  iniF.WriteString('userParam','Hbit',cmbHbit.Text);

  iniF.WriteString('userParam','BOrd',cmbBOrder.Text);
  iniF.WriteString('userParam','UOrd',cmbUOrder.Text);
  iniF.WriteString('userParam','FOrd',cmbFOrder.Text);
  iniF.WriteString('userParam','HOrd',cmbHOrder.Text);
  iniF.Free;

  bBit := StrToInt(cmbBbit.Text);
  uBit := StrToInt(cmbUbit.Text);
  fBit := StrToInt(cmbFbit.Text);
  hBit := StrToInt(cmbHbit.Text);

  for B := seB1.Value to seB2.Value do
  begin
    bNo := RightStr('000'+IntToStr(B),StrToInt(cmbBbit.Text));
    case cmbBorder.ItemIndex of
      0:N1 := bNO;
      1:N2 := bNO;
      2:N3 := bNO;
      3:N4 := bNO;
    end;

    addrType:=0;
    addrName:=IntToStr(B)+cmbBName.Text;
    {if Length(IntToStr(B))=1 then
      addrNO:='0'+IntToStr(B)
    else //if Length(IntToStr(B))=2 then
      addrNO:=IntToStr(B);}

    addrNO := bNo;

    fatherAddr:=lang_msg_None;
    devNO:='';
    memo:='';

    if Get_RecCount('select * from t_addr where AddrNO='+QuotedStr(addrNO))<1 then
    begin
    with AdoQryAddr do
    begin
      Open;
      Append;
      FieldByName('AddrType').AsInteger:=addrType;
      FieldByName('AddrName').AsString :=addrName;
      FieldByName('AddrNO').AsString :=addrNO;
      FieldByName('FatherAddr').AsString :=fatherAddr;
      FieldByName('DevNO').AsString :=devNO;
      FieldByName('Memo').AsString :=memo;
      Post;
    end;
    end;

    for U := seU1.Value to seU2.Value do
    begin
      uNo   := RightStr('000'+IntToStr(U),StrToInt(cmbUbit.Text));
      case cmbUorder.ItemIndex of
        0:N1 := uNO;
        1:N2 := uNO;
        2:N3 := uNO;
        3:N4 := uNO;
      end;

      addrType:=1;
      addrName:=IntToStr(B)+cmbBName.Text+IntToStr(U)+cmbUName.Text;
      {if Length(IntToStr(B))=1 then
        addrNO:='0'+IntToStr(B)
      else //if Length(IntToStr(B))=2 then
        addrNO:=IntToStr(B);}
      {if Length(IntToStr(U))=1 then
        addrNO:=addrNO+'0'+IntToStr(U)
      else //if Length(IntToStr(U))=2 then
        addrNO:=addrNO+IntToStr(U);}

      addrNO:=bNo+uNo;

      fatherAddr:=IntToStr(B)+cmbBName.Text;
      devNO := N1+N2+'-0000';  //主机
      memo:='';

      if Get_RecCount('select * from t_addr where AddrNO='+QuotedStr(addrNO))<1 then
      begin
      with AdoQryAddr do
      begin
        Open;
        Append;
        FieldByName('AddrType').AsInteger:=addrType;
        FieldByName('AddrName').AsString :=addrName;
        FieldByName('AddrNO').AsString :=addrNO;
        FieldByName('FatherAddr').AsString :=fatherAddr;
        FieldByName('DevNO').AsString :=devNO;
        FieldByName('Memo').AsString :=memo;
        Post;
      end;
      end;

      if (ckbDev.Checked=true) and (Get_RecCount('select * from t_dev where AddrNO='+QuotedStr(AddrNO))<1) then
      begin
        with AdoQryDev do
        begin
          Open;
          Append;
          FieldByName('DevNO').AsString   := devNO;
          FieldByName('DevType').AsInteger:= addrType;
          FieldByName('AddrName').AsString:= addrName;
          FieldByName('AddrNO').AsString  := addrNO;
          Post;
        end;
      end;

      if (ckbDev.Checked=true) and (Get_RecCount('select * from t_unit where UnitNO='+QuotedStr(LeftStr(devNO,4)))<1) then
      begin
        with AdoQryUnitMac do
        begin
          Open;
          Append;
          FieldByName('UnitNO').AsString      := LeftStr(devNO,4);
          FieldByName('UnitChosen').AsInteger := 0;
          Post;
        end;
      end;

      for F := seF1.Value to seF2.Value do
      begin
        fNo   := RightStr('000'+IntToStr(F),StrToInt(cmbFbit.Text));
        case cmbForder.ItemIndex of
          0:N1 := fNO;
          1:N2 := fNO;
          2:N3 := fNO;
          3:N4 := fNO;
        end;

        addrType:=2;
        addrName:=IntToStr(B)+cmbBName.Text+IntToStr(U)+cmbUName.Text+IntToStr(F)+cmbFName.Text;
        {if Length(IntToStr(B))=1 then
          addrNO:='0'+IntToStr(B)
        else //if Length(IntToStr(B))=2 then
          addrNO:=IntToStr(B);
        if Length(IntToStr(U))=1 then
          addrNO:=addrNO+'0'+IntToStr(U)
        else //if Length(IntToStr(U))=2 then
          addrNO:=addrNO+IntToStr(U);
        if Length(IntToStr(F))=1 then
          addrNO:=addrNO+'0'+IntToStr(F)
        else //if Length(IntToStr(F))=2 then
          addrNO:=addrNO+IntToStr(F);}

        addrNO := bNo+uNo+fNo;

        fatherAddr:=IntToStr(B)+cmbBName.Text+IntToStr(U)+cmbUName.Text;
        devNO:='';
        memo:='';

        for H := seH1.Value to seH2.Value do
        begin
          hNo   := RightStr('000'+IntToStr(H),StrToInt(cmbHbit.Text));
          case cmbHorder.ItemIndex of
            0:N1 := hNO;
            1:N2 := hNO;
            2:N3 := hNO;
            3:N4 := hNO;
          end;

          addrType:=2;

          if Length(IntToStr(H))=1 then
            addrName:=IntToStr(B)+cmbBName.Text+IntToStr(U)+cmbUName.Text+IntToStr(F)+'0'+IntToStr(H)+cmbHName.Text
          else
            addrName:=IntToStr(B)+cmbBName.Text+IntToStr(U)+cmbUName.Text+IntToStr(F)+IntToStr(H)+cmbHName.Text;
            
          {if Length(IntToStr(B))=1 then
            addrNO:='0'+IntToStr(B)
          else //if Length(IntToStr(B))=2 then
            addrNO:=IntToStr(B);
          if Length(IntToStr(U))=1 then
            addrNO:=addrNO+'0'+IntToStr(U)
          else //if Length(IntToStr(U))=2 then
            addrNO:=addrNO+IntToStr(U);
          if Length(IntToStr(F))=1 then
            addrNO:=addrNO+'0'+IntToStr(F)
          else //if Length(IntToStr(F))=2 then
            addrNO:=addrNO+IntToStr(F);
          if Length(IntToStr(H))=1 then
            addrNO:=addrNO+'0'+IntToStr(H)
          else //if Length(IntToStr(H))=2 then
            addrNO:=addrNO+IntToStr(H);}

          addrNO := bNo+uNo+fNo+hNo;

          fatherAddr:=IntToStr(B)+cmbBName.Text+IntToStr(U)+cmbUName.Text;
          devNo  := N1+N2+'-'+N3+N4; //分机
          memo:='';

          if Get_RecCount('select * from t_addr where AddrNO='+QuotedStr(addrNO))<1 then
          begin
          with AdoQryAddr do
          begin
            Open;
            Append;
            FieldByName('AddrType').AsInteger:=addrType;
            FieldByName('AddrName').AsString :=addrName;
            FieldByName('AddrNO').AsString :=addrNO;
            FieldByName('FatherAddr').AsString :=fatherAddr;
            FieldByName('DevNO').AsString :=devNO;
            FieldByName('Memo').AsString :=memo;
            Post;
          end;
          end;

          if (ckbDev.Checked=true) and (Get_RecCount('select * from t_dev where AddrNO='+QuotedStr(AddrNO))<1) then
          begin
            with AdoQryDev do
            begin
              Open;
              Append;
              FieldByName('DevNO').AsString   := devNO;
              FieldByName('DevType').AsInteger:= addrType+1;
              FieldByName('AddrName').AsString:= addrName;
              FieldByName('AddrNO').AsString  := addrNO;
              Post;
            end;
          end;

        end;
      end;
    end;
  end;

  btn_AddrBack.Click;
  spBtn_addr.Click;
end;
//==清空==
procedure TMainForm.Button13Click(Sender: TObject);
begin
  if MessageDlg(lang_msg_RoomDataClear,mtConfirmation,[mbYes,mbNo],0) = mrYes then
  begin
    try
      ExecSql('delete from t_addr where ID>0');
      ShowMessage(lang_msg_ClearFinish);
      RefreshRec(AdoQryAddr,'select * from t_addr');
      btn_AddrBack.Click;
      spBtn_addr.Click;
    except
      ShowMessage(lang_msg_ClearFail);
    end;
  end;
end;
//==返回==
procedure TMainForm.btn_AddrBackClick(Sender: TObject);
begin
  PageControl1.ActivePageIndex:=0;
end;

//==楼栋位数==
procedure TMainForm.cmbBbitChange(Sender: TObject);
begin
  case cmbBBit.ItemIndex of
  0:begin
      seB1.MaxLength := 1;
      seB1.MaxValue  := 9;

      seB2.MaxLength := 1;
      seB2.MaxValue  := 9;
      seB2.Value     := 9;

      cmbUbit.ItemIndex := 2;
      seU1.MaxLength := 3;
      seU1.MaxValue  := 999;
      seU1.Value     := 1;

      seU2.MaxLength := 3;
      seU2.MaxValue  := 999;
      seU2.Value     := 999;
    end;
  1:begin
      seB1.MaxLength := 2;
      seB1.MaxValue  := 99;

      seB2.MaxLength := 2;
      seB2.MaxValue  := 99;
      seB2.Value     := 99;

      cmbUbit.ItemIndex := 1;
      seU1.MaxLength := 2;
      seU1.MaxValue  := 99;
      seU1.Value     := 1;

      seU2.MaxLength := 2;
      seU2.MaxValue  := 99;
      seU2.Value     := 99;
    end;
  2:begin
      seB1.MaxLength := 3;
      seB1.MaxValue  := 999;

      seB2.MaxLength := 3;
      seB2.MaxValue  := 999;
      seB2.Value     := 999;

      cmbUbit.ItemIndex := 0;
      seU1.MaxLength := 1;
      seU1.MaxValue  := 9;
      seU1.Value     := 1;

      seU2.MaxLength := 1;
      seU2.MaxValue  := 9;
      seU2.Value     := 9;
    end;
  end;
end;
//==单元位数==
procedure TMainForm.cmbUbitChange(Sender: TObject);
begin
  case cmbUBit.ItemIndex of
    2:begin
        seB1.MaxLength := 1;
        seB1.MaxValue  := 9;

        seB2.MaxLength := 1;
        seB2.MaxValue  := 9;
        seB2.Value     := 9;

        cmbBbit.ItemIndex := 0;
        seU1.MaxLength := 3;
        seU1.MaxValue  := 999;
        seU1.Value     := 1;

        seU2.MaxLength := 3;
        seU2.MaxValue  := 999;
        seU2.Value     := 999;
      end;
    1:begin
        seB1.MaxLength := 2;
        seB1.MaxValue  := 99;

        seB2.MaxLength := 2;
        seB2.MaxValue  := 99;
        seB2.Value     := 99;

        cmbBbit.ItemIndex := 1;
        seU1.MaxLength := 2;
        seU1.MaxValue  := 99;
        seU1.Value     := 1;

        seU2.MaxLength := 2;
        seU2.MaxValue  := 99;
        seU2.Value     := 99;
      end;
    0:begin
        seB1.MaxLength := 3;
        seB1.MaxValue  := 999;

        seB2.MaxLength := 3;
        seB2.MaxValue  := 999;
        seB2.Value     := 999;

        cmbBbit.ItemIndex := 2;
        seU1.MaxLength := 1;
        seU1.MaxValue  := 9;
        seU1.Value     := 1;

        seU2.MaxLength := 1;
        seU2.MaxValue  := 9;
        seU2.Value     := 9;
      end;
    end;
end;
//==楼层位数==
procedure TMainForm.cmbFbitChange(Sender: TObject);
begin
  case cmbFBit.ItemIndex of
  0:begin
      seF1.MaxLength := 1;
      seF1.MaxValue  := 9;

      seF2.MaxLength := 1;
      seF2.MaxValue  := 9;
      seF2.Value     := 9;

      cmbHbit.ItemIndex := 2;
      seH1.MaxLength := 3;
      seH1.MaxValue  := 999;
      seH1.Value     := 1;

      seH2.MaxLength := 3;
      seH2.MaxValue  := 999;
      seH2.Value     := 999;
    end;
  1:begin
      seF1.MaxLength := 2;
      seF1.MaxValue  := 99;

      seF2.MaxLength := 2;
      seF2.MaxValue  := 99;
      seF2.Value     := 99;

      cmbHbit.ItemIndex := 1;
      seH1.MaxLength := 2;
      seH1.MaxValue  := 99;
      seH1.Value     := 1;

      seH2.MaxLength := 2;
      seH2.MaxValue  := 99;
      seH2.Value     := 99;
    end;
  2:begin
      seF1.MaxLength := 3;
      seF1.MaxValue  := 999;

      seF2.MaxLength := 3;
      seF2.MaxValue  := 999;
      seF2.Value     := 999;

      cmbHbit.ItemIndex := 0;
      seH1.MaxLength := 1;
      seH1.MaxValue  := 9;
      seH1.Value     := 1;

      seH2.MaxLength := 1;
      seH2.MaxValue  := 9;
      seH2.Value     := 9;
    end;
  end;
end;
//==房号位数==
procedure TMainForm.cmbHbitChange(Sender: TObject);
begin
  case cmbHBit.ItemIndex of
    2:begin
        seF1.MaxLength := 1;
        seF1.MaxValue  := 9;

        seF2.MaxLength := 1;
        seF2.MaxValue  := 9;
        seF2.Value     := 9;

        cmbFbit.ItemIndex := 0;
        seH1.MaxLength := 3;
        seH1.MaxValue  := 999;
        seH1.Value     := 1;

        seH2.MaxLength := 3;
        seH2.MaxValue  := 999;
        seH2.Value     := 999;
      end;
    1:begin
        seF1.MaxLength := 2;
        seF1.MaxValue  := 99;

        seF2.MaxLength := 2;
        seF2.MaxValue  := 99;
        seF2.Value     := 99;

        cmbFbit.ItemIndex := 1;
        seH1.MaxLength := 2;
        seH1.MaxValue  := 99;
        seH1.Value     := 1;

        seH2.MaxLength := 2;
        seH2.MaxValue  := 99;
        seH2.Value     := 99;
      end;
    0:begin
        seF1.MaxLength := 3;
        seF1.MaxValue  := 999;

        seF2.MaxLength := 3;
        seF2.MaxValue  := 999;
        seF2.Value     := 999;

        cmbFbit.ItemIndex := 2;
        seH1.MaxLength := 1;
        seH1.MaxValue  := 9;
        seH1.Value     := 1;

        seH2.MaxLength := 1;
        seH2.MaxValue  := 9;
        seH2.Value     := 9;
      end;
  end;
end;

//=====2.3 管理住户信息=====

//==修改==
procedure TMainForm.btn_p_editClick(Sender: TObject);
begin
  DBGridPerson.DataSource.DataSet.Edit;

  btn_p_save.Enabled:=true;
  btn_p_cancel.Enabled:=true;
  TreeHouse.Enabled:=false;
  btn_p_add.Enabled:=false;
  btn_p_edit.Enabled:=false;
  btn_p_del.Enabled:=false;
  Panel1.Enabled := false;
end;
//==删除==
procedure TMainForm.btn_p_delClick(Sender: TObject);
var
  cNO:string;
begin
  if MessageDlg(lang_msg_Del,mtConfirmation,[mbYes,mbNo],0) = mrYes then
  begin
    card_cancel.Click;

    cNO := AdoQryPerson.FieldByName('CardNO').AsString;
    ExecSQL('delete from t_card where CardNO='+QuotedStr(cNO));

    RefreshRec(AdoQryCard,'select * from t_card');
    RefreshRec(AdoQryPerson,'select * from t_card where CardNO='+QuotedStr(cNO)+' and unitMac='+QuotedStr(AdoQryPerson.FieldByName('unitMac').AsString)+' and userMac='+QuotedStr(AdoQryPerson.FieldByName('userMac').AsString));
    RefreshRec(AdoQrypCard,'select * from t_card as A where unitMac=(select Min(unitMac) from t_card where CardNO=A.CardNO) and userMac='+QuotedStr(AdoQryPerson.FieldByName('userMac').AsString));

    TreeHouse.OnClick(self);
  end;
end;
//==保存==
procedure TMainForm.btn_p_saveClick(Sender: TObject);
var
  cNO:Integer;
begin
  cNO:=StrToInt(DBGridPerson.DataSource.DataSet.FieldByName('CardNO').AsString);

  if (cNO > 0) and (cNO < 16777215) then
  begin
    DBGridPerson.DataSource.DataSet.Post;
  end
  else begin
    DBGridPerson.DataSource.DataSet.Cancel;
    ShowMessage('保存失败,卡号必须在0~16777215范围内！');
  end;

  btn_p_save.Enabled:=false;
  btn_p_cancel.Enabled:=false;
  TreeHouse.Enabled:=true;
  btn_p_add.Enabled:=true;
  btn_p_edit.Enabled:=true;
  btn_p_del.Enabled:=true;
  Panel1.Enabled := true;
end;
//==取消==
procedure TMainForm.btn_p_cancelClick(Sender: TObject);
begin
  DBGridPerson.DataSource.DataSet.Cancel;

  btn_p_save.Enabled:=false;
  btn_p_cancel.Enabled:=false;
  TreeHouse.Enabled:=true;
  btn_p_add.Enabled:=true;
  btn_p_edit.Enabled:=true;
  btn_p_del.Enabled:=true;
  Panel1.Enabled := true;
end;
//==新增(隐藏)==
procedure TMainForm.btn_p_addClick(Sender: TObject);
begin
  DBGridPerson.DataSource.DataSet.Append;
  DBGridPerson.DataSource.DataSet.FieldByName('PersonName').AsString:=lang_labDefaultName;
  DBGridPerson.DataSource.DataSet.FieldByName('CardType').AsInteger:=0;
  DBGridPerson.DataSource.DataSet.FieldByName('CardNO').AsString:='000000';
  DBGridPerson.DataSource.DataSet.FieldByName('CardState').AsInteger:=0;
  DBGridPerson.DataSource.DataSet.FieldByName('ValidTime').AsString:='2050-12-31 24:00:00';
  DBGridPerson.DataSource.DataSet.FieldByName('unitMac').AsString:=LeftStr(PNodeInfo(TreeHouse.Selected.Data)^.NO,4);
  DBGridPerson.DataSource.DataSet.FieldByName('userMac').AsString:=RightStr(PNodeInfo(TreeHouse.Selected.Data)^.NO,4);
  DBGridPerson.DataSource.DataSet.FieldByName('isWall').AsInteger:=0;

  btn_p_save.Enabled:=true;
  btn_p_cancel.Enabled:=true;
  TreeHouse.Enabled:=false;
  btn_p_add.Enabled:=false;
  btn_p_edit.Enabled:=false;
  btn_p_del.Enabled:=false;
  Panel1.Enabled := false;
end;
//==双击提取卡号==
procedure TMainForm.DBGridPersonDblClick(Sender: TObject);
begin
  if (btn_p_save.Enabled=true) and (edt_CardNO1.Text<>'') then
  begin
    AdoQryPerson.FieldByName('CardNO').AsString := edt_CardNO1.Text;
  end;
end;
//==下载为住户卡==
procedure TMainForm.card_downloadClick(Sender: TObject);
var
  pName:string;
  cNO:string;
  s:string;
  unitStr,userStr:string;
  ValidTime:string;
  cMemo:string;
begin
  pName := AdoQryPerson.FieldByName('PersonName').AsString;
  ValidTime := AdoQryPerson.FieldByName('ValidTime').AsString;
  cNO := AdoQryPerson.FieldByName('CardNO').AsString;
  unitStr:=AdoQryPerson.FieldByName('unitMac').AsString;
  userStr:=AdoQryPerson.FieldByName('userMac').AsString;
  cMemo:=AdoQryPerson.FieldByName('CardMemo').AsString;

  s := '0000'+IntToHex(StrToInt(cNO),6)+unitStr+GetUserNO6(userStr)+'010A';
  s := GetSendStr(s);

  ExecSQL('update t_card set CardType=0,userMac='+QuotedStr(userStr)+',PersonName='+QuotedStr(pName)+',ValidTime='+QuotedStr(ValidTime)+',CardMemo='+QuotedStr(cMemo)+' where CardNO='+QuotedStr(cNO)+' and unitMac='+QuotedStr(unitStr));

  AdoCon.Execute('insert into t_cmd(CardNO,cmdStr,unitMac,userMac,sent,cmdType) values('+QuotedStr(cNO)+','+QuotedStr(s)+','+QuotedStr(unitStr)+','+QuotedStr(userStr)+',0,0)');
  AdoCon.Execute('delete A from t_card A where exists(select 1 from t_card where CardNO=A.CardNO and unitMac=A.unitMac and userMac=A.userMac and ID<A.ID)');

  D_Card_T_Wall(pName,cNO,userStr,'0000',ValidTime,0);

  RefreshRec(AdoQryCard,'select * from t_card');

  isSend:=true;
  if ComType=1 then
  begin
    Timer1.Enabled:=true;
  end;
end;
//==注销住户卡==
procedure TMainForm.card_cancelClick(Sender: TObject);
var
  cNO:string;
  s:string;
begin
  cNO := AdoQryPerson.FieldByName('CardNO').AsString;

  C_Card_F_Device(cNO,'0000',0);

  RefreshRec(AdoQryCard,'select * from t_card');

  isSend:=true;
  if ComType=1 then
  begin
    Timer1.Enabled:=true;
  end;
end;
//==有效期==
procedure TMainForm.card_validtimeClick(Sender: TObject);
var
  ValidTime:string;
begin
  frm_validtime := Tfrm_validtime.Create(nil);
  frm_validtime.edit_name.Text := AdoQryPerson.FieldByName('PersonName').AsString;
  frm_validtime.edit_cardNO.Text := AdoQryPerson.FieldByName('CardNO').AsString;
  if frm_validtime.ShowModal=mrOK then
  begin
    ValidTime := FormatDateTime('YYYY-MM-DD hh:mm:SS',frm_validtime.date_valid.DateTime);
    ExecSQL('update t_card set ValidTime='+QuotedStr(ValidTime)+' where PersonName='+QuotedStr(frm_validtime.edit_name.Text)+' and CardNO='+QuotedStr(frm_validtime.edit_cardNO.Text));
    RefreshRec(AdoQryPerson,'select * from t_card where unitMac='+QuotedStr(AdoQryPerson.FieldByName('unitMac').AsString)+' and userMac='+QuotedStr(AdoQryPerson.FieldByName('userMac').AsString));
    RefreshRec(AdoQryCard,'select * from t_card');
  end;
end;



//===============3、设备管理模块===============

procedure TMainForm.spBtn_devClick(Sender: TObject);
begin
  PageControl1.ActivePageIndex:=1;
  Panel3.Visible:=false;
  spBtn_alarm.Top :=123;
  spBtn_credit.Top:=164;
  spBtn_set.Top   :=205;
end;

//=====3.1 添加设备=====

procedure TMainForm.dev_AddClick(Sender: TObject);
var
  AddrName:string;
begin
  f_dev:=Tf_dev.Create(nil);
  f_dev.Caption:=lang_pMenuDevAdd;
  f_dev.edit_AddrName.Visible := false;

  if f_dev.ShowModal=mrOK then
  begin
    RefreshRec(AdoQryAddr,'select * from t_addr where AddrNO='+QuotedStr(f_dev.AddrNO));
    AddrName := AdoQryAddr.FieldByName('AddrName').AsString;

    if AddrName='' then
    begin
      AddrName := f_dev.AddrName;
    end;

    if Get_RecCount('select * from t_dev where DevNO='+QuotedStr(f_dev.DevNO))<1 then
    begin
      with AdoQryDev do
      begin
        Open;
        Append;
        FieldByName('DevType').AsInteger := f_dev.DevType;
        FieldByName('DevNO').AsString    := f_dev.DevNO;
        FieldByName('AddrName').AsString := AddrName;
        FieldByName('AddrNO').AsString   := f_dev.AddrNO;
        FieldByName('IP').AsString       := f_dev.DevIP;
        FieldByName('Memo').AsString     := f_dev.Memo;
        Post;
      end;
      if (f_dev.DevType=4) and (Get_RecCount('select * from t_wall where WallNO='+QuotedStr(LeftStr(f_dev.DevNO,4)))<1) then
      begin
        with AdoQryWall do
        begin
          Open;
          Append;
          FieldByName('WallNO').AsString      := LeftStr(f_dev.DevNO,4);
          FieldByName('WallNum').AsInteger    := 0;
          FieldByName('WallChosen').AsInteger := 0;
          Post;
        end;
      end;
      if (f_dev.DevType=1) and (Get_RecCount('select * from t_unit where UnitNO='+QuotedStr(LeftStr(f_dev.DevNO,4)))<1) then
      begin
        with AdoQryUnitMac do
        begin
          Open;
          Append;
          FieldByName('UnitNO').AsString      := LeftStr(f_dev.DevNO,4);
          FieldByName('UnitChosen').AsInteger := 0;
          Post;
        end;
      end;
      RefreshRec(AdoQryWall,'select * from t_wall');
      RefreshRec(AdoQryUnitMac,'select * from t_unit');
      //RefreshRec(AdoQryDev,'select * from t_dev order by AddrNO');
    end
    else
      ShowMessage(lang_msg_DevExist);
  end;
end;

//=====3.2 编辑设备=====

procedure TMainForm.dev_EditClick(Sender: TObject);
var
  type_previous:Integer;
  unitNO_previous:string;
  addrNO,AddrName:string;
begin
  f_dev:=Tf_dev.Create(nil);
  f_dev.Caption:=lang_pMenuDevEdit;

  f_dev.cmbDevType.ItemIndex:=AdoQryDev.FieldByName('DevType').AsInteger;
  f_dev.cmbDevType.OnChange(self);
  type_previous := f_dev.cmbDevType.ItemIndex;

  f_dev.edit_DevNO.Text:=AdoQryDev.FieldByName('DevNO').AsString;
  unitNO_previous := f_dev.edit_DevNO.Text;

  f_dev.edit_DevIP.Text :=AdoQryDev.FieldByName('IP').AsString;
  f_dev.memo_dev.Text:=AdoQryDev.FieldByName('Memo').AsString;

  addrNO := LeftStr(AdoQryDev.FieldByName('AddrNO').AsString+'00000000',8);
  f_dev.spEdit_Building.Value := StrToInt(LeftStr(addrNO,bBit));
  f_dev.spEdit_Unit.Value := StrToInt(MidStr(addrNO,bBit+1,uBit));
  f_dev.spEdit_Floor.Value := StrToInt(MidStr(addrNO,5,fBit));
  f_dev.spEdit_Room.Value := StrToInt(RightStr(addrNO,hBit));

  if f_dev.ShowModal=mrOK then
  begin
    if (type_previous=1) and ((f_dev.DevType<>1) or (f_dev.DevNO<>unitNO_previous)) then
    begin
      AdoCon.Execute('delete from t_unit where UnitNO='+QuotedStr(LeftStr(unitNO_previous,4)));
    end;

    if (type_previous=4) and ((f_dev.DevType<>4) or (f_dev.DevNO<>unitNO_previous)) then
    begin
      AdoCon.Execute('delete from t_wall where WallNO='+QuotedStr(LeftStr(unitNO_previous,4)));
    end;

    RefreshRec(AdoQryAddr,'select * from t_addr where AddrNO='+QuotedStr(f_dev.AddrNO));
    AddrName := AdoQryAddr.FieldByName('AddrName').AsString;

    if AddrName='' then
    begin
      AddrName := f_dev.AddrName;
    end;

    with AdoQryDev do
    begin
      Open;
      Edit;
      FieldByName('DevType').AsInteger := f_dev.DevType;
      FieldByName('DevNO').AsString    := f_dev.DevNO;
      FieldByName('AddrName').AsString := AddrName;
      FieldByName('AddrNO').AsString   := f_dev.AddrNO;
      FieldByName('IP').AsString       := f_dev.DevIP;
      FieldByName('Memo').AsString     := f_dev.Memo;
      Post;
    end;
    if (f_dev.DevType=4) and (Get_RecCount('select * from t_wall where WallNO='+QuotedStr(LeftStr(f_dev.DevNO,4)))<1) then
    begin
      with AdoQryWall do
      begin
        Open;
        Append;
        FieldByName('WallNO').AsString      := LeftStr(f_dev.DevNO,4);
        FieldByName('WallNum').AsInteger    := 0;
        FieldByName('WallChosen').AsInteger := 0;
        Post;
      end;
    end;
    if (f_dev.DevType=1) and (Get_RecCount('select * from t_unit where UnitNO='+QuotedStr(LeftStr(f_dev.DevNO,4)))<1) then
    begin
      with AdoQryUnitMac do
      begin
        Open;
        Append;
        FieldByName('UnitNO').AsString      := LeftStr(f_dev.DevNO,4);
        FieldByName('UnitChosen').AsInteger := 0;
        Post;
      end;
    end;
    RefreshRec(AdoQryWall,'select * from t_wall');
    RefreshRec(AdoQryUnitMac,'select * from t_unit');
    //RefreshRec(AdoQryDev,'select * from t_dev order by AddrNO');
  end;
end;

//=====3.3 删除设备=====

procedure TMainForm.dev_DelClick(Sender: TObject);
begin
  if MessageDlg(lang_msg_Del,mtConfirmation,[mbYes,mbNo],0) = mrYes then
  begin
    with DBGridDev.DataSource.DataSet do
    begin
      First;
      while not EOF do
      begin
        if DBGridDev.SelectedRows.CurrentRowSelected then
        begin
          if DBGridDev.Columns.Items[1].Field.Value=4 then
            ExecSQL('delete from t_wall where WallNO='+QuotedStr(LeftStr(DBGridDev.Columns.Items[2].Field.Value,4)));
          if DBGridDev.Columns.Items[1].Field.Value=1 then
            ExecSQL('delete from t_unit where UnitNO='+QuotedStr(LeftStr(DBGridDev.Columns.Items[2].Field.Value,4)));

          ExecSQL('delete from t_dev where DevNO='+QuotedStr(DBGridDev.Columns.Items[2].Field.Value));
        end;
        Next;
      end;
    end;

    RefreshRec(AdoQryWall,'select * from t_wall');
    RefreshRec(AdoQryUnitMac,'select * from t_unit');
    RefreshRec(AdoQryDev,'select * from t_dev order by AddrNO');
  end;
end;

//=====3.4 刷新设备=====

procedure TMainForm.dev_RefreshClick(Sender: TObject);
begin
  RefreshRec(AdoQryDev,'select * from t_dev order by AddrNO');
end;

//=====3.5 查询设备=====

procedure TMainForm.btn_DevQryClick(Sender: TObject);
var
  devType:integer;
  devNO:string;
begin
  devType:=cmbDevType.ItemIndex;
  devNO  :=edit_DevNO.Text;
  if devNO<>'' then
    RefreshRec(AdoQryDev,'select * from t_dev where DevType='+IntToStr(devType)+' and DevNO like '+QuotedStr('%'+devNO+'%')+' order by AddrNO')
  else
    RefreshRec(AdoQryDev,'select * from t_dev where DevType='+IntToStr(devType)+' order by AddrNO');
end;

//=====3.6 清除设备=====

procedure TMainForm.btn_DevCLClick(Sender: TObject);
begin
  if MessageDlg(lang_msg_DelAll,mtConfirmation,[mbYes,mbNo],0) = mrYes then
  begin
    AdoCon.Execute('delete from t_dev where ID>0');
    AdoCOn.Execute('delete from t_unit where ID>0');
    AdoCon.Execute('delete from t_wall where ID>0');
    RefreshRec(AdoQryDev,'select * from t_dev');
  end;
end;

//=====3.7 重新发卡=====

procedure TMainForm.pMenu_devPopup(Sender: TObject);
begin
  case AdoQryDev.FieldByName('DevType').AsInteger of
        1,4:
                dev_Download.Enabled := true;
        else
                dev_DownLoad.Enabled := false;
        end;
end;
procedure TMainForm.dev_DownloadClick(Sender: TObject);
var
  CardNO,UnitMac,UserMac,DevNO:string;
  CardType:Integer;
  Temp,CmdStr:string;
begin
  DevNO := AdoQryDev.FieldByName('DevNO').AsString;
  UnitMac := LeftStr(DevNO,4);
  UserMac := RightStr(DevNO,4);

  if (Length(UnitMac)<>4) or (Length(UserMac)<>4) then
  begin
    ShowMessage('设备号码有误，请确认无误后重新操作！');
    Exit;
  end
  else begin
    if MessageDlg('执行此操作，将重新下发本设备下的所有卡！',mtConfirmation,[mbYes,mbNo],0) = mrYes then
    begin
      with AdoQryCard do
      begin
        SQL.Clear;
        SQL.Add('select * from t_card where unitMac='+QuotedStr(UnitMac)+' order by userMac');
        Active := true;
        First;
        while not EOF do
        begin
          CardType := FieldByName('CardType').AsInteger;
          CardNO := FieldByName('CardNO').AsString;
          UserMac := FieldByName('userMac').AsString;

          if CardType=2 then
            Temp := '0A903A'
          else
            Temp := GetUserNO6(UserMac);

          CmdStr := '0000'+IntToHex(StrToInt(CardNO),6)+UnitMac+Temp+'010A';
          CmdStr := GetSendStr(CmdStr);

          AdoCon.Execute('insert into t_cmd(CardNO,cmdStr,unitMac,userMac,sent,cmdType) values('+QuotedStr(CardNo)+','+QuotedStr(CmdStr)+','+QuotedStr(UnitMac)+','+QuotedStr(UserMac)+',0,0)');

          Next;
        end;
      end;
    end;
  end;
end;

//=====3.8 出入口管理=====

//===生成地址树===
//==CreateDoorTree==

//===双击重置门状态===



//===============4、门禁管理模块===============

procedure TMainForm.spBtn_doorClick(Sender: TObject);
begin
  PageControl1.ActivePageIndex:=2;
  if Panel3.Visible=false then
  begin
    Panel3.Visible:=true;
    Panel3.Top:=122;
    spBtn_alarm.Top :=330;
    spBtn_credit.Top:=371;
    spBtn_set.Top   :=412;
  end
  else begin
    Panel3.Visible:=false;
    spBtn_alarm.Top :=123;
    spBtn_credit.Top:=164;
    spBtn_set.Top   :=205;
  end;

  if spBtn_door.Caption='Access control' then
  begin
    spBtn_cancel.Left:=-26;
    spBtn_cancel.Width:=195;
    spBtn_read.Left:=-24;
    spBtn_read.Width:=193;
    spBtn_clear.Left:=-37;
    spBtn_clear.Width:=206;
    spBtn_center.Left:=-24;
    spBtn_center.Width:=193;
    spBtn_CardSender.Left:=-21;
    spBtn_CardSender.Width:=190;
    spBtn_WriteCard.Left:=-21;
    spBtn_WriteCard.Width:=190;
  end;

  if PageControl2.ActivePageIndex = 5 then
  begin
    spBtn_CardSender.Click;
  end;

  //ExecSQL('update t_wall set WallChosen=0');
  RefreshRec(AdoQryWall,'select * from t_wall order by WallNO');
  clb_Dev0.Items.Clear;
  clb_Dev1.Items.Clear;
  with AdoQryWall do
  begin
    Open;
    First;
    while not EOF do
    begin
      clb_Dev0.Items.Add(FieldByName('WallNO').AsString);
      clb_Dev1.Items.Add(FieldByName('WallNO').AsString);

      if FieldByName('WallChosen').AsInteger=1 then
      begin
        clb_Dev0.Checked[clb_Dev0.Items.Count-1] := true;
        clb_Dev1.Checked[clb_Dev1.Items.Count-1] := true;
      end;

      Next;
    end;
  end;

  //ExecSQL('update t_unit set UnitChosen=0');
  RefreshRec(AdoQryUnitMac,'select * from t_unit order by UnitNO');
  clb_UnitMac0.Items.Clear;
  with AdoQryUnitMac do
  begin
    Open;
    First;
    while not EOF do
    begin
      clb_UnitMac0.Items.Add(FieldByName('UnitNO').AsString);

      if FieldByName('UnitChosen').AsInteger=1 then
      begin
        clb_UnitMac0.Checked[clb_UnitMac0.Items.Count-1] := true;
      end;

      Next;
    end;
  end;
end;

//=====4.1 下载卡=====

procedure TMainForm.spBtn_registerClick(Sender: TObject);
begin
  PageControl2.ActivePageIndex:=0;
  PageControl3.ActivePageIndex:=0;
  spBtn_register.Font.Color  :=clRed;
  spBtn_cancel.Font.Color    :=clWindowText;
  spBtn_read.Font.Color      :=clWindowText;
  spBtn_clear.Font.Color     :=clWindowText;
  spBtn_center.Font.Color    :=clWindowText;
  spBtn_CardSender.Font.Color:=clWindowText;
  spBtn_WriteCard.Font.Color :=clWindowText;

  //ExecSQL('update t_wall set WallChosen=0');
  RefreshRec(AdoQryWall,'select * from t_wall order by WallNO');
  clb_Dev0.Items.Clear;
  with AdoQryWall do
  begin
    Open;
    First;
    while not EOF do
    begin
      clb_Dev0.Items.Add(FieldByName('WallNO').AsString);

      if FieldByName('WallChosen').AsInteger=1 then
      begin
        clb_Dev0.Checked[clb_Dev0.Items.Count-1] := true;
      end;
      
      Next;
    end;
  end;

  //ExecSQL('update t_unit set UnitChosen=0');
  RefreshRec(AdoQryUnitMac,'select * from t_unit order by UnitNO');
  clb_UnitMac0.Items.Clear;
  with AdoQryUnitMac do
  begin
    Open;
    First;
    while not EOF do
    begin
      clb_UnitMac0.Items.Add(FieldByName('UnitNO').AsString);

      if FieldByName('UnitChosen').AsInteger=1 then
      begin
        clb_UnitMac0.Checked[clb_UnitMac0.Items.Count-1] := true;
      end;

      Next;
    end;
  end;
end;

//===选择卡类型===

procedure TMainForm.c1Change(Sender: TObject);
begin
  case cbbCardType0.ItemIndex of
  0:begin
      editUnitMac0.Enabled := true;
      editUserMac0.Enabled := true;
      ckbBatch0.Enabled := true;
      Label60.Enabled := true;
      Label61.Enabled := true;
      Label64.Enabled := true;
    end;
  1,2,3,4:
    begin
      editUnitMac0.Text := '';
      editUserMac0.Text := '';
      ckbBatch0.Checked := false;
      editUnitMac0.Enabled := false;
      editUserMac0.Enabled := false;
      ckbBatch0.Enabled := false;
      Label60.Enabled := false;
      Label61.Enabled := false;
      Label64.Enabled := false;
    end;
  end;
end;

//===双击选择单元主机/住户号===

procedure TMainForm.editUnitMac0DblClick(Sender: TObject);
begin
  f_treedevice := Tf_treedevice.Create(nil);
  if f_treedevice.ShowModal=mrOK then
  begin
    editUnitMac0.Text := f_treedevice.UnitStr;
    editUserMac0.Text := f_treedevice.UserStr;
  end;
end;

//===批量注册警告===

procedure TMainForm.ckbBatch0Click(Sender: TObject);
begin
  if ckbBatch0.Checked=true then
    ShowMessage('执行批量注册将会先清除所选单元主机下的所有卡数据！');
end;

//===导入Excel表格数据===

procedure TMainForm.btn_RegImportClick(Sender: TObject);
begin
  case cbbCardType0.ItemIndex of
  0:begin
      if (editUnitMac0.Text<>'') and (editUserMac0.Text<>'') then
        Reg_Import_ROP(editUnitMac0.Text,0)
      else
        ShowMessage('请先选择单元主机或住户号！');
    end;
  1:begin
      Reg_Import_ROP(editUnitMac0.Text,1);
    end;
  2:begin
      Reg_Import_SYS(2);
    end;
  3:begin
      Reg_Import_SYS(3);
    end;
  4:begin
      Reg_Import_SELF;
    end;
  end;

  if Get_RecCount('select * from t_RegCmd where sent=0')>0 then
    cbbCardType0.Enabled := false;
end;
//==Reg_Import_ROP 导入住户卡或物业卡==
function TMainForm.Reg_Import_ROP(unitM:string;cType:Integer):Boolean;
const
  BeginRow=1;BeginCol=2;
var
  iRow,iCol:Integer;
  MsExcel:OleVariant;
  pName,cNO,userM,cMemo:string;
  Valid,Invalid:Integer;
begin
  if isImport=false then
  begin
    isImport := true;
  try
    if not OpenDialog1.Execute then
    begin
      isImport := false;
      Exit;
    end;

    MsExcel:=CreateOleObject('Excel.Application');
    MsExcel.Visible:=true;
    MsExcel.WorkBooks.Open(OpenDialog1.FileName);
    MsExcel.Visible:=false;
  except
    isImport := false;
    Exit;
  end;

  try
    Application.ProcessMessages;
    iRow:=BeginRow;
    iCol:=BeginCol;

    Valid:=0;
    Invalid:=0;

    while Trim(MsExcel.WorkSheets['sheet1'].Cells[iCol,iRow+1].Value)<>'' do
    begin
      //持卡人
      pName:=Trim(MsExcel.WorkSheets['sheet1'].Cells[iCol,iRow].Value);
      if pName='' then
      begin
        pName:=lang_labDefaultName;
      end;

      //卡号
      cNO:=Trim(MsExcel.WorkSheets['sheet1'].Cells[iCol,iRow+1].Value);

      //卡号>=16777215 or 卡号<=0
      if (StrToInt(cNO) <= 0) or (StrToInt(cNO) >= 16777215) then
      begin
        iCol:=iCol+1;
        inc(Invalid);
        continue;
      end;

      //分机号
      userM:=Trim(MsExcel.WorkSheets['sheet1'].Cells[iCol,iRow+2].Value);
      if userM='' then
      begin
        userM:=editUserMac0.Text;
      end;
      userM:=RightStr('0000'+userM,4);

      //备注
      cMemo:=Trim(MsExcel.WorkSheets['sheet1'].Cells[iCol,iRow+3].Value);

      //导入到t_RegCmd表
      with AdoQryRegCards do
      begin
        Open;
        Append;
        FieldByName('PersonName').AsString := pName;
        FieldByName('CardType').AsInteger := cType;
        FieldByName('CardNO').AsString := cNO;
        FieldByName('unitMac').AsString := unitM;
        FieldByName('userMac').AsString := userM;
        FieldByName('sent').AsInteger := 0;
        FieldByName('CardMemo').AsString := cMemo;
        Post;
      end;

      RefreshRec(AdoQryRegCards,'select * from t_RegCmd');
      iCol := iCol+1;
      Inc(Valid);
    end;
    MsExcel.Quit;
  except
    MessageBox(self.Handle,PChar(lang_msg_ImportFail),PChar(lang_msg_SysPrompts),0);
    MsExcel.Quit;
    isImport := false;
    Exit;
  end;

  AdoQryRegCards.First;
  MessageBox(self.Handle,PChar(lang_msg_ImportSuccess+'(有效卡:'+IntToStr(Valid)+'张,无效卡:'+IntToStr(Invalid)+'张)'),PChar(lang_msg_SysPrompts),0);
  Result := True;
  isImport := false;
  end
  else if isImport=true then
  begin
    ShowMessage('正在导入Excel表格数据，请稍候...');
  end;
end;
//==Reg_Import_SYS 导入系统卡==
function TMainForm.Reg_Import_SYS(cType:Integer):Boolean;
const
  BeginRow=1;BeginCol=2;
var
  iRow,iCol:Integer;
  MsExcel:OleVariant;
  pName,cNO,userM,cMemo:string;
  Valid,Invalid:Integer;
begin
  if isImport=false then
  begin
    isImport := true;
  try
    if not OpenDialog1.Execute then
    begin
      isImport := false;
      Exit;
    end;

    MsExcel:=CreateOleObject('Excel.Application');
    MsExcel.Visible:=true;
    MsExcel.WorkBooks.Open(OpenDialog1.FileName);
    MsExcel.Visible:=false;
  except
    isImport := false;
    Exit;
  end;

  try
    Application.ProcessMessages;
    iRow:=BeginRow;
    iCol:=BeginCol;

    Valid:=0;
    Invalid:=0;

    while Trim(MsExcel.WorkSheets['sheet1'].Cells[iCol,iRow+1].Value)<>'' do
    begin
      //持卡人
      pName:=Trim(MsExcel.WorkSheets['sheet1'].Cells[iCol,iRow].Value);
      if pName='' then
      begin
        pName:=lang_labDefaultName;
      end;

      //卡号
      cNO:=Trim(MsExcel.WorkSheets['sheet1'].Cells[iCol,iRow+1].Value);

      //卡号>=16777215 or 卡号<=0
      if (StrToInt(cNO) <= 0) or (StrToInt(cNO) >= 16777215) then
      begin
        iCol:=iCol+1;
        inc(Invalid);
        continue;
      end;

      //分机号
      if cType=2 then
        userM:='10000'
      else
        userM:='';

      //备注
      cMemo:=Trim(MsExcel.WorkSheets['sheet1'].Cells[iCol,iRow+2].Value);

      //导入到t_RegCmd表
      with AdoQryRegCards do
      begin
        Open;
        Append;
        FieldByName('PersonName').AsString := pName;
        FieldByName('CardType').AsInteger := cType;
        FieldByName('CardNO').AsString := cNO;
        FieldByName('unitMac').AsString := '';
        FieldByName('userMac').AsString := userM;
        FieldByName('sent').AsInteger := 0;
        FieldByName('CardMemo').AsString := cMemo;
        Post;
      end;

      RefreshRec(AdoQryRegCards,'select * from t_RegCmd');
      iCol := iCol+1;
      Inc(Valid);
    end;
    MsExcel.Quit;
  except
    MessageBox(self.Handle,PChar(lang_msg_ImportFail),PChar(lang_msg_SysPrompts),0);
    MsExcel.Quit;
    isImport := false;
    Exit;
  end;

  AdoQryRegCards.First;
  MessageBox(self.Handle,PChar(lang_msg_ImportSuccess+'(有效卡:'+IntToStr(Valid)+'张,无效卡:'+IntToStr(Invalid)+'张)'),PChar(lang_msg_SysPrompts),0);
  Result := True;
  isImport := false;
  end
  else if isImport=true then
  begin
    ShowMessage('正在导入Excel表格数据，请稍候...');
  end;
end;
//==Reg_Import_SELF 导入自定义卡==
function TMainForm.Reg_Import_SELF:Boolean; 
begin
  Result := True;
end;

//===双击选择卡中心数据===

procedure TMainForm.DBGrid1DblClick(Sender: TObject);
var
  cNO,pName,userM,cMemo:string;
begin
  if cbbCardType0.ItemIndex=0 then
  begin
    if (editUnitMac0.Text<>'') and (editUserMac0.Text<>'') then
      f_select15 := tf_select15.Create(nil)
    else begin
      ShowMessage('请先选择单元主机或住户号！');
      Exit;
    end;
  end
  else begin
    f_select15 := tf_select15.Create(nil);
  end;

  if f_select15.ShowModal = mrOK then
  begin
    f_select15.DBGrid1.DataSource.DataSet.First;
    while not f_select15.DBGrid1.DataSource.DataSet.EOF do
    begin
      if f_select15.DBGrid1.SelectedRows.CurrentRowSelected then
      begin
        cNO := f_select15.DBGrid1.Columns.Items[4].Field.Value;

        if Get_RecCount('select * from t_RegCmd where CardNO='+QuotedStr(cNO))>=1 then
        begin
          ShowMessage(lang_msg_CardHaveCmd);
          Exit;
        end;

        pName := f_select15.DBGrid1.Columns.Items[1].Field.Value;
        userM := f_select15.DBGrid1.Columns.Items[6].Field.Value;
        if f_select15.DBGrid1.Columns.Items[8].Field.Value<>null then
          cMemo := f_select15.DBGrid1.Columns.Items[8].Field.Value;

        case cbbCardType0.ItemIndex of
        0:begin
            with AdoQryRegCards do
            begin
              Open;
              Append;
              FieldByName('PersonName').AsString := pName;
              FieldByName('CardType').AsInteger := 0;
              FieldByName('CardNO').AsString := cNO;
              FieldByName('unitMac').AsString := editUnitMac0.Text;
              FieldByName('userMac').AsString := editUserMac0.Text;
              FieldByName('sent').AsInteger := 0;
              FieldByName('CardMemo').AsString := cMemo;
              Post;
            end;
          end;
        1:begin
            with AdoQryRegCards do
            begin
              Open;
              Append;
              FieldByName('PersonName').AsString := pName;
              FieldByName('CardType').AsInteger := 1;
              FieldByName('CardNO').AsString := cNO;
              FieldByName('unitMac').AsString := '';
              FieldByName('userMac').AsString := userM;
              FieldByName('sent').AsInteger := 0;
              FieldByName('CardMemo').AsString := cMemo;
              Post;
            end;
          end;
        2:begin
            with AdoQryRegCards do
            begin
              Open;
              Append;
              FieldByName('PersonName').AsString := pName;
              FieldByName('CardType').AsInteger := 2;
              FieldByName('CardNO').AsString := cNO;
              FieldByName('unitMac').AsString := '';
              FieldByName('userMac').AsString := '10000';
              FieldByName('sent').AsInteger := 0;
              FieldByName('CardMemo').AsString := cMemo;
              Post;
            end;
          end;
        3:begin
          end;
        end;
      end;

      f_select15.DBGrid1.DataSource.DataSet.Next;
    end;

    AdoQryRegCards.First;
    RefreshRec(AdoQryRegCards,'select * from t_RegCmd');

    if Get_RecCount('select * from t_RegCmd where sent=0')>0 then
      cbbCardType0.Enabled := false;
  end;
end;

//===删除===

procedure TMainForm.btn_RegDelClick(Sender: TObject);
begin
  if MessageDlg(lang_msg_Del,mtConfirmation,[mbYes,mbNo],0) = mrYes then
  begin
    if Get_RecCount('select * from t_RegCmd')>0 then
      DBGrid1.SelectedRows.Delete;
  end;

  if Get_RecCount('select * from t_RegCmd')<1 then
  begin
    btn_previous.Enabled := true;
    cbbCardType0.Enabled := true;
  end;
end;

//===清除===

procedure TMainForm.btn_RegClearClick(Sender: TObject);
begin
  if MessageDlg(lang_msg_DelAll,mtConfirmation,[mbYes,mbNo],0) = mrYes then
  begin
    ExecSQL('delete from t_RegCmd where ID>0');
    RefreshRec(AdoQryRegCards,'select * from t_RegCmd');
  end;

  btn_previous.Enabled := true;
  cbbCardType0.Enabled := true;
end;

//===下载卡===

procedure TMainForm.btn_RegDoClick(Sender: TObject);
var
  s,s0,s1:string;
  CmdHead:string;
  pName,cNO,unitStr,userStr,ValidTime:string;
begin
  if AdoQryRegcards.RecordCount < 1 then
  begin
    ShowMessage(lang_msg_NoCmd);
    Exit;
  end;

  sb_tips.Panels[2].Text := lang_msg_Ready;
  delay(100);

  ValidTime:='2050-12-31 24:00:00';

  case cbbCardType0.ItemIndex of
  0:begin
      if ckbBatch0.Checked=true then
      begin
        s0 := '0000000000'+editUnitMac0.Text+'FF0000020A';
        s1 := '0000000000'+editUnitMac0.Text+'FFFFFF020A';
        s0 := GetSendStr(s0);
        s1 := GetSendStr(s1);

        CmdHead:='0020';

        if Get_RecCount('select * from t_cmd where cmdStr='+QuotedStr(s0)+' and sent=0')<1 then
        begin
          ExecSQL('insert into t_cmd(cmdStr,unitMac,userMac,sent,cmdType) values('+QuotedStr(s0)+','+QuotedStr(editUnitMac0.Text)+','+QuotedStr('0000')+',0,31)');
        end;
      end
      else if ckbBatch0.Checked=false then
        CmdHead:='0000';


      with AdoQryRegCards do
      begin
        Open;
        SQL.Clear;
        SQL.Add('select * from t_RegCmd where sent=0');
        Active:=true;
        First;
        while not EOF do
        begin
          pName := FieldByName('PersonName').AsString;
          cNO := FieldByName('CardNO').AsString;
          unitStr := FieldByName('unitMac').AsString;
          userStr := FieldByName('userMac').AsString;

          s := CmdHead+IntToHex(StrToInt(cNO),6)+unitStr+GetUserNO6(userStr)+'010A';
          s := GetSendStr(s);
          AdoCon.Execute('insert into t_cmd(CardNO,cmdStr,unitMac,userMac,sent,cmdType) values('+QuotedStr(cNO)+','+QuotedStr(s)+','+QuotedStr(unitStr)+','+QuotedStr(userStr)+',0,0)');

          if Get_RecCount('select * from t_card where CardNO='+QuotedStr(cNO)+' and unitMac='+QuotedStr(unitStr))<1 then  //+' and userMac='+QuotedStr(userStr)
          begin
            Card_Insert(pName,cNO,IntToHex(StrToInt(cNO),6),unitStr,userStr,null,0,null,ValidTime,0,0);
          end
          else begin
            AdoCon.Execute('update t_card set CardType='+IntToStr(0)+',userMac='+QuotedStr(userStr)+' where CardNO='+QuotedStr(cNO)+' and unitMac='+QuotedStr(unitStr));
          end;

          D_Card_T_Wall(pName,cNO,userStr,'0000',ValidTime,0);
          RefreshRec(AdoQryCard,'select * from t_card');

          Edit;
          FieldByName('sent').AsInteger := 1;
          Post;
          
          Next;
        end;
      end;

      if ckbBatch0.Checked = true then
      begin
        if Get_RecCount('select * from t_cmd where cmdStr='+QuotedStr(s1)+' and sent=0')<1 then
        begin
          ExecSQL('insert into t_cmd(cmdStr,unitMac,userMac,sent,cmdType) values('+QuotedStr(s1)+','+QuotedStr(editUnitMac0.Text)+','+QuotedStr('0000')+',0,32)');
        end;
      end;
    end;
  1,2:begin
        CmdHead:='0000';

        with AdoQryRegCards do
        begin
          Open;
          SQL.Clear;
          SQL.Add('select * from t_RegCmd where sent=0');
          Active:=true;
          First;
          while not EOF do
          begin
            pName := FieldByName('PersonName').AsString;
            cNO := FieldByName('CardNO').AsString;
            unitStr := FieldByName('unitMac').AsString;
            userStr := FieldByName('userMac').AsString;

            D_Card_T_Wall(pName,cNO,userStr,CmdHead,ValidTime,cbbCardType0.ItemIndex);
            D_Card_T_Unit(pName,cNO,userStr,CmdHead,ValidTime,cbbCardType0.ItemIndex);
            RefreshRec(AdoQryCard,'select * from t_card');

            Edit;
            FieldByName('sent').AsInteger := 1;
            Post;

            Next;
          end;
        end;
      end;
  3:begin
    end;
  end;

  AdoCon.Execute('delete from t_RegCmd where sent=1');
  RefreshRec(AdoQryRegCards,'select * from t_RegCmd where sent=0');
  cbbCardType0.Enabled := true;

  sb_tips.Panels[2].Text := '等待下发...';
  delay(100);

  isSend:=true;
  if ComType=1 then
  begin
    Timer1.Enabled:=true;
  end;
end;

//=====4.2 注销卡=====

procedure TMainForm.spBtn_cancelClick(Sender: TObject);
begin
  PageControl2.ActivePageIndex:=1;
  PageControl4.ActivePageIndex:=0;
  spBtn_register.Font.Color  :=clWindowText;
  spBtn_cancel.Font.Color    :=clRed;
  spBtn_read.Font.Color      :=clWindowText;
  spBtn_clear.Font.Color     :=clWindowText;
  spBtn_center.Font.Color    :=clWindowText;
  spBtn_CardSender.Font.Color:=clWindowText;
  spBtn_WriteCard.Font.Color :=clWindowText;

  //ExecSQL('update t_wall set WallChosen=0');
  RefreshRec(AdoQryWall,'select * from t_wall order by WallNO');
  clb_Dev1.Items.Clear;
  with AdoQryWall do
  begin
    Open;
    First;
    while not EOF do
    begin
      clb_Dev1.Items.Add(FieldByName('WallNO').AsString);

      if FieldByName('WallChosen').AsInteger=1 then
      begin
        clb_Dev1.Checked[clb_Dev1.Items.Count-1] := true;
      end;

      Next;
    end;
  end;
end;

//===双击选择单元主机/住户号===

procedure TMainForm.editUnitMac1DblClick(Sender: TObject);
begin
  f_treedevice := Tf_treedevice.Create(nil);
  if f_treedevice.ShowModal=mrOK then
  begin
    editUnitMac1.Text := f_treedevice.UnitStr;
    editUserMac1.Text := f_treedevice.UserStr;
  end;
end;

//===清除卡===

procedure TMainForm.btn_ClearOK1Click(Sender: TObject);
var
  unitStr,userStr:string;
  devNO,u6:string;
  s0,s1:string;
begin
  if MessageDlg(lang_msg_Clear,mtConfirmation,[mbYes,mbNo],0) = mrYes then
  begin
  unitStr:=editUnitMac1.Text;
  userStr:=editUserMac1.Text;
  devNO  :=unitStr+'-0000';

  if userStr<>'0000' then
  begin
    ShowMessage('清除卡操作只对主机有效！请重新填写需要清除的主机设备！');
    editUserMac1.Text := '0000';
    Exit;
  end;

  if Get_RecCount('select * from t_dev where DevNO='+QuotedStr(devNO))<1 then
  begin
    ShowMessage(lang_msg_InputUnit);
    editUnitMac1.SetFocus;
    Exit;
  end;

  if userStr='' then
  begin
    ShowMessage(lang_msg_InputUser);
    editUserMac1.SetFocus;
    Exit;
  end;

  u6:=GetUserNO6(userStr);

  Screen.Cursor := crHourGlass;
  s0 := '0000000000'+unitStr+'FF0000020A';
  s1 := '0000000000'+unitStr+'FFFFFF020A';
  s0 := GetSendStr(s0);
  s1 := GetSendStr(s1);

  cmdStatus := csSend;

  ExecSQL('insert into t_cmd(cmdStr,unitMac,userMac,sent,cmdType) values('+QuotedStr(s0)+','+QuotedStr(unitStr)+','+QuotedStr('0000')+',0,31)');

  sb_tips.Panels[2].Text := lang_msg_Clearing;

  ExecSQL('insert into t_cmd(cmdStr,unitMac,userMac,sent,cmdType) values('+QuotedStr(s1)+','+QuotedStr(unitStr)+','+QuotedStr('0000')+',0,32)');

  sb_tips.Panels[2].Text := lang_msg_ClearOver;

  RefreshRec(AdoQryCard,'select * from t_card');

  screen.Cursor := crDefault;

  isSend:=true;
  if ComType=1 then
  begin
    Timer1.Enabled:=true;
  end;
  end;
end;

//===导入Excel表格数据===

procedure TMainForm.btn_CancelImportClick(Sender: TObject);
const
  BeginRow=1;BeginCol=2;
var
  iRow,iCol:integer;
  MsExcel:OleVariant;
  cType:Integer;
  cardT,cNO,cMemo:string;
  Valid,Invalid:Integer;
begin
  if isImport=false then
  begin
    isImport := true;
  try
    if not OpenDialog1.Execute then
    begin
      isImport := false;
      Exit;
    end;

    MsExcel:=CreateOleObject('Excel.Application');
    MsExcel.Visible:=true;
    MsExcel.WorkBooks.Open(OpenDialog1.FileName);
    MsExcel.Visible:=false;

  except
    isImport := false;
    Exit;
  end;

  try
    Application.ProcessMessages;
    iRow:=BeginRow;
    iCol:=BeginCol;

    Valid:=0;
    Invalid:=0;

    while Trim(MsExcel.WorkSheets['sheet1'].Cells[iCol,iRow+1].Value)<>'' do
    begin
      //卡号
      cNO:=Trim(MsExcel.WorkSheets['sheet1'].Cells[iCol,iRow+1].Value);

      //卡号>=16777215 or 卡号<=0
      if (StrToInt(cNO) <= 0) or (StrToInt(cNO) >= 16777215) then
      begin
        iCol:=iCol+1;
        inc(Invalid);
        continue;
      end;
      
      //卡类型
      if MsExcel.WorkSheets['sheet1'].Cells[iCol,iRow].Value='' then
        cType:=0
      else begin
        cardT:=Trim(MsExcel.WorkSheets['sheet1'].Cells[iCol,iRow].Value);
        if cardT='住户卡' then
          cType:=0
        else if cardT='物业卡' then
          cType:=1
        else if cardT='系统卡' then
          cType:=2
        else if cardT='巡更卡' then
          cType:=3;
      end;

      //备注
      cMemo:=Trim(MsExcel.WorkSheets['sheet1'].Cells[iCol,iRow+2].Value);

      //批量插入t_CancelCmd表
      with AdoQryCancelCards do
      begin
        Open;
        Append;
        FieldByName('CardType').AsInteger:= cType;
        FieldByName('CardNO').AsString  := cNO;
        FieldByName('sent').AsInteger    := 0;
        FieldByName('CardMemo').AsString:= cMemo;
        Post;
      end;

      RefreshRec(AdoQryCancelCards,'select * from t_CancelCmd');
      iCol := iCol+1;
      Inc(Valid);
    end;
    MsExcel.Quit;
  except
    MessageBox(self.Handle,PChar(lang_msg_ImportFail),PChar(lang_msg_SysPrompts),0);
    MsExcel.Quit;
    isImport := false;
    Exit;
  end;
  
  AdoQryCancelCards.First;
  MessageBox(self.Handle,PChar(lang_msg_ImportSuccess+'(有效卡:'+IntToStr(Valid)+'张,无效卡:'+IntToStr(Invalid)+'张)'),PChar(lang_msg_SysPrompts),0);
  isImport := false;
  end
  else if isImport=true then
  begin
    ShowMessage('正在导入Excel表格数据，请稍候...');
  end;
end;

//===双击选择卡中心数据===

procedure TMainForm.DBGrid2DblClick(Sender: TObject);
var
  cNO,unitM,userM:string;
  cType:Integer;
begin
  f_select15 := tf_select15.Create(nil);
  RefreshRec(f_select15.AdoQrySelect,'select * from t_card as A where unitMac=(select Min(unitMac) from t_card where CardNO=A.CardNO)');
  if f_select15.ShowModal = mrOK then
  begin
    f_select15.DBGrid1.DataSource.DataSet.First;
    while not f_select15.DBGrid1.DataSource.DataSet.EOF do
    begin
      if f_select15.DBGrid1.SelectedRows.CurrentRowSelected then
      begin
        cNO := f_select15.DBGrid1.Columns.Items[4].Field.Value;

        if Get_RecCount('select * from t_CancelCmd where CardNO='+QuotedStr(cNO))>=1 then
        begin
          ShowMessage(lang_msg_CardHaveCmd);
          Exit;
        end;

        cType := f_select15.DBGrid1.Columns.Items[3].Field.Value;
        unitM := f_select15.DBGrid1.Columns.Items[5].Field.Value;
        userM := f_select15.DBGrid1.Columns.Items[6].Field.Value;

        with AdoQryCancelCards do
        begin
          Open;
          Append;
          FieldByName('CardType').AsInteger := cType;
          FieldByName('CardNO').AsString := cNO;
          FieldByName('unitMac').AsString := unitM;
          FieldByName('userMac').AsString := userM;
          FieldByName('sent').AsInteger := 0;
          Post;
        end;
      end;

      f_select15.DBGrid1.DataSource.DataSet.Next;
    end;

    AdoQryCancelCards.First;
    RefreshRec(AdoQryCancelCards,'select * from t_CancelCmd');
  end;
end;

//===删除===

procedure TMainForm.btn_CancelDelClick(Sender: TObject);
begin
  if MessageDlg(lang_msg_Del,mtConfirmation,[mbYes,mbNo],0) = mrYes then
  begin
    if Get_RecCount('select * from t_CancelCmd')>0 then
      DBGrid2.SelectedRows.Delete;
  end;

  if Get_RecCount('select * from t_CancelCmd')<1 then
  begin
    btn_previous1.Enabled := true;
  end;
end;

//===清除===

procedure TMainForm.btn_CancelClearClick(Sender: TObject);
begin
  if MessageDlg(lang_msg_DelAll,mtConfirmation,[mbYes,mbNo],0) = mrYes then
  begin
    ExecSQL('delete from t_CancelCmd where ID>0');
    RefreshRec(AdoQryCancelCards,'select * from t_CancelCmd');
  end;

  btn_previous1.Enabled := true;
end;

//===注销卡===

procedure TMainForm.btn_CancelDoClick(Sender: TObject);
var
  CmdHead:string;
  cNO:string;
  cType:Integer;
begin
  if AdoQryCancelcards.RecordCount < 1 then
  begin
    ShowMessage(lang_msg_NoCmd);
    exit;
  end;

  sb_tips.Panels[2].Text := lang_msg_Ready;
  delay(100);

  CmdHead := '0000';

  with AdoQryCancelCards do
  begin
    Open;
    SQL.Clear;
    SQL.Add('select * from t_CancelCmd where sent=0');
    Active:=true;
    First;
    while not EOF do
    begin
      cNO  := FieldByName('CardNO').AsString;
      cType:= FieldByName('CardType').AsInteger;

      C_Card_F_Device(cNO,CmdHead,cType);
      RefreshRec(AdoQryCard,'select * from t_card');

      Edit;
      FieldByName('sent').AsInteger := 1;
      Post;

      Next;
    end;
  end;

  AdoCon.Execute('delete from t_CancelCmd where sent=1');
  RefreshRec(AdoQryCancelCards,'select * from t_CancelCmd where sent=0');

  sb_tips.Panels[2].Text := '等待下发...';
  delay(100);

  isSend:=true;
  if ComType=1 then
  begin
    Timer1.Enabled:=true;
  end;
end;

//=====4.3 提取卡=====

procedure TMainForm.spBtn_readClick(Sender: TObject);
begin
  PageControl2.ActivePageIndex:=2;
  spBtn_register.Font.Color  :=clWindowText;
  spBtn_cancel.Font.Color    :=clWindowText;
  spBtn_read.Font.Color      :=clRed;
  spBtn_clear.Font.Color     :=clWindowText;
  spBtn_center.Font.Color    :=clWindowText;
  spBtn_CardSender.Font.Color:=clWindowText;
  spBtn_WriteCard.Font.Color :=clWindowText;
end;

//===双击选择单元主机/住户号===

procedure TMainForm.editUnitMac2DblClick(Sender: TObject);
begin
  f_treedevice := Tf_treedevice.Create(nil);
  if f_treedevice.ShowModal=mrOK then
  begin
    editUnitMac2.Text := f_treedevice.UnitStr;
    editUserMac2.Text := f_treedevice.UserStr;
  end;
end;

//===主机号/分机号改变时刷新表数据===

procedure TMainForm.editUnitMac2Change(Sender: TObject);
begin
  Timer2.Enabled:=true;
end;
procedure TMainForm.editUserMac2Change(Sender: TObject);
begin
  Timer2.Enabled:=true;
end;
procedure TMainForm.Timer2Timer(Sender: TObject);
begin
  if editUnitMac2.Text='' then
    RefreshRec(AdoQryReadCards,'select * from t_ReadCards')
  else if editUserMac2.Text='' then
    RefreshRec(AdoQryReadCards,'select * from t_ReadCards where unitMac='+QuotedStr(editUnitMac2.Text))
  else if editUserMac2.Text='0000' then
    RefreshRec(AdOQryReadCards,'select * from t_ReadCards where unitMac='+QuotedStr(editUnitMac2.Text))
  else
    RefreshRec(AdoQryReadCards,'select * from t_ReadCards where unitMac='+QuotedStr(editUnitMac2.Text)+' and userMac='+QuotedStr(editUserMac2.Text));

  edt_Num.Text:=IntToStr(AdoQryReadCards.RecordCount);
  AdoQryReadCards.Last;
  Timer2.Enabled:=false;
end;

//===提取卡===

procedure TMainForm.btn_ReadOKClick(Sender: TObject);
var
  unitStr,userStr:string;
  devNO,u6:string;
  cmdStr:string;
begin
  unitStr:=editUnitMac2.Text;
  userStr:=editUserMac2.Text;
  devNO  :=unitStr+'-0000';

  if Get_RecCount('select * from t_dev where DevNO='+QuotedStr(devNO))<1 then
  begin
    ShowMessage(lang_msg_InputUnit);
    editUnitMac2.SetFocus;
    Exit;
  end;

  if userStr='' then
  begin
    ShowMessage(lang_msg_InputUser);
    editUserMac2.SetFocus;
    Exit;
  end;

  u6:=GetUserNO6(userStr);

  AdoQryReadCards.Filtered := false;
  cmdStr := '0000000000'+unitStr+u6+'030A';
  cmdStr := GetSendStr(cmdStr);

  if isReading=true then
  begin
    ShowMessage(lang_msg_Extracting);
  end
  else begin
    ExecSQL('insert into t_cmd(cmdStr,unitMac,userMac,sent,cmdType) values('+QuotedStr(cmdStr)+','+QuotedStr(editUnitMac2.Text)+','+QuotedStr(editUserMac2.Text)+',0,2)');
  end;

  if userStr='0000' then
    RefreshRec(AdoQryReadCards,'select * from t_ReadCards where unitMac='+QuotedStr(unitStr))
  else
    RefreshRec(AdoQryReadCards,'select * from t_ReadCards where unitMac='+QuotedStr(unitStr)+' and userMac='+QuotedStr(userStr));

  edt_Num.Text:=IntToStr(AdoQryReadCards.RecordCount);

  isSend:=true;
  if ComType=1 then
  begin
    Timer1.Enabled:=true;
  end;
end;

//==Timer4==
procedure TMainForm.Timer4Timer(Sender: TObject);
begin
  if isReading=true then
    isReading:=false;
end;

//===清除===

procedure TMainForm.btn_ReadClearClick(Sender: TObject);
begin
  if MessageDlg(lang_msg_DelAll,mtConfirmation,[mbYes,mbNo],0) = mrYes then
  begin
    ExecSql('delete from t_ReadCards where ID>0');
    RefreshRec(AdoQryReadCards,'select * from t_ReadCards');
  end;
end;

//===导出Excel表格===

procedure TMainForm.btn_exportClick(Sender: TObject);
var
  h,count:Integer;
  Excelid:OleVariant;
  i:Integer;
  cType:string;
begin
  try
    Excelid := CreateOLEObject('Excel.Application');
  except
    Application.MessageBox(PChar(lang_msg_ExcelInstall),PChar(lang_msg_SysPrompts),MB_OK+MB_ICONASTERISK+MB_DEFBUTTON1+MB_APPLMODAL);
    Exit;
  end;

  if editUserMac2.Text = '0000' then
  begin
    RefreshRec(AdoQryReadCards,'select * from t_ReadCards where unitMac = '+QuotedStr(editUnitMac2.Text));
  end
  else begin
    RefreshRec(AdoQryReadCards,'select * from t_ReadCards where unitMac = '+QuotedStr(editUnitMac2.Text) + ' and userMac = '+QuotedStr(editUserMac2.Text));
  end;

  try
    count:=AdoQryReadCards.RecordCount;
    Excelid.Visible := false;
    Excelid.WorkBooks.Add;
    Excelid.WorkSheets[1].Cells[1,1].Value := '持卡人';
    Excelid.WorkSheets[1].Cells[1,2].Value := lang_dgCardColum2;
    Excelid.WorkSheets[1].Cells[1,3].Value := lang_dgCardColum1;
    Excelid.WorkSheets[1].Cells[1,4].Value := lang_dgCardColum3;
    Excelid.WorkSheets[1].Cells[1,5].Value := lang_dgCardColum4;
    Excelid.WorkSheets[1].Cells[1,6].Value := lang_labMemo;

    for i:=1 to 6 do
    begin
      Excelid.WorkSheets[1].Columns[i].HorizontalAlignment := xlCenter;
      Excelid.WorkSheets[1].Columns[i].ColumnWidth :=12;
      Excelid.WorkSheets[1].Columns[i].NumberFormatLocal:='@';
    end;

    h:=2;
    AdoQryReadCards.First;
    while not AdoQryReadCards.EOF do
    begin
      cType:=AdoQryReadCards.FieldByName('CardType').AsString;
      if cType='0' then
        cType:='住户卡'
      else if cType='1' then
        cType:='物业卡'
      else if cType='2' then
        cType:='系统卡'
      else if cType='3' then
        cType:='巡更卡';
      
      Excelid.WorkSheets[1].Cells[h,1].Value := lang_labDefaultName;
      Excelid.WorkSheets[1].Cells[h,2].Value := AdoQryReadCards.FieldByName('CardNO').AsString;
      Excelid.WorkSheets[1].Cells[h,3].Value := cType;
      Excelid.WorkSheets[1].Cells[h,4].Value := AdoQryReadCards.FieldByName('unitMac').AsString;
      Excelid.WorkSheets[1].Cells[h,5].Value := AdoQryReadCards.FieldByName('userMac').AsString;
      Excelid.WorkSheets[1].Cells[h,6].Value := AdoQryReadCards.FieldByName('Memo').AsString;

      for i:=1 to 6 do
      begin
        Excelid.WorkSheets[1].Cells[h,i].Borders[1].LineStyle:=1;
        Excelid.WorkSheets[1].Cells[h,i].Borders[2].LineStyle:=1;
        Excelid.WorkSheets[1].Cells[h,i].Borders[3].LineStyle:=1;
        Excelid.WorkSheets[1].Cells[h,i].Borders[4].LineStyle:=1;
      end;

      Inc(h);
      AdoQryReadCards.Next;
    end;

    Excelid.Quit;
  except
    Application.MessageBox(PChar(lang_msg_ExportFail), PChar(lang_msg_SysPrompts), MB_OK+MB_ICONASTERISK+MB_DEFBUTTON1+MB_APPLMODAL);
  end;
    MessageBox(GetActiveWindow(),PChar(lang_msg_ExportSuccess), PChar(lang_msg_SysPrompts), MB_OK +MB_ICONWARNING);
end;

//=====4.4 卡中心=====

procedure TMainForm.spBtn_centerClick(Sender: TObject);
begin
  PageControl2.ActivePageIndex:=4;
  spBtn_register.Font.Color  :=clWindowText;
  spBtn_cancel.Font.Color    :=clWindowText;
  spBtn_read.Font.Color      :=clWindowText;
  spBtn_clear.Font.Color     :=clWindowText;
  spBtn_center.Font.Color    :=clRed;
  spBtn_CardSender.Font.Color:=clWindowText;
  spBtn_WriteCard.Font.Color :=clWindowText;

  RefreshRec(AdoQryCard,'select * from t_card');
  edt_amount.Text := IntToStr(AdoQryCard.RecordCount);
end;

//===4.1 有效期检验===

//==有效期检验==

procedure TMainForm.spBtn_checkClick(Sender: TObject);
var
  cNO,cNO6,unitStr,userStr,u6,s:string;
begin
  RefreshRec(AdoQryCard,'select * from t_card');
  with AdoQryCard do
  begin
    First;
    while not EOF do
    begin
      if (not FieldByName('ValidTime').IsNull) and (FieldByName('ValidTime').AsString<FormatDateTime('YYYY-MM-DD hh:mm:SS',Now())) then
      begin
        cNO := FieldByName('CardNO').AsString;
        cNO6:= IntToHex(StrToInt(cNO),6);
        unitStr:=FieldByName('unitMac').AsString;
        userStr:=FieldByName('userMac').AsString;
        u6  := GetUserNO6(userStr);
        s := '0000'+cNO6+unitStr+u6+'020A';
        s := GetSendStr(s);

        AdoCon.Execute('insert into t_cmd(cmdStr,unitMac,userMac,sent,cmdType) values('+QuotedStr(s)+','+QuotedStr(unitStr)+','+QuotedStr(userStr)+',0,1)');
        Edit;
        FieldByName('CardState').AsInteger:=0;
        Post;
      end;

      Next;
    end;
  end;
  RefreshRec(AdoQryCard,'select * from t_card');
end;

//==开启自动检验==

procedure TMainForm.SpeedButton2Click(Sender: TObject);
var
  Interval:Integer;
begin
  Interval:=(cmb_interval.ItemIndex+1)*60*60*1000;
  Timer5.Interval:=Interval;
  Timer5.Enabled:=true;
end;

//==关闭自动检验==

procedure TMainForm.SpeedButton3Click(Sender: TObject);
begin
  Timer5.Enabled:=false;
end;

//==Timer5==
procedure TMainForm.Timer5Timer(Sender: TObject);
begin
  spBtn_check.OnClick(self);
end;

//===4.2 导入/导出表格===

//==导入Excel表格==

procedure TMainForm.btn_card_importClick(Sender: TObject);
const
  BeginRow=1;BeginCol=2;
var
  iRow,iCol:Integer;
  MsExcel:OleVariant;
  pName,cNO,unitM,userM,ValidTime:string;
  cT,cS,iW:string;
  cType,cState,isWall:Integer;
  Valid,Invalid:Integer;
begin
  if isImport=false then
  begin
    isImport := true;
  try
    if not OpenDialog1.Execute then
    begin
      isImport := false;
      Exit;
    end;

    MsExcel:=CreateOleObject('Excel.Application');
    MsExcel.Visible:=true;
    MsExcel.WorkBooks.Open(OpenDialog1.FileName);
    MsExcel.Visible:=false;
  except
    isImport := false;
    Exit;
  end;

  try
    Application.ProcessMessages;
    iRow:=BeginRow;
    iCol:=BeginCol;

    Valid:=0;
    Invalid:=0;

    while Trim(MsExcel.WorkSheets['sheet1'].Cells[iCol,iRow+2].Value)<>'' do
    begin
      //持卡人
      pName:=Trim(MsExcel.WorkSheets['sheet1'].Cells[iCol,iRow].Value);
      if pName='' then
      begin
        pName:=lang_labDefaultName;
      end;

      //卡类型
      cT:=Trim(MsExcel.WorkSheets['sheet1'].Cells[iCol,iRow+1].Value);
      if cT='住户卡' then
        cType:=0
      else if cT='物业卡' then
        cType:=1
      else if cT='系统卡' then
        cType:=2
      else if cT='巡更卡' then
        cType:=3
      else
        cType:=4;

      //卡号
      cNO:=Trim(MsExcel.WorkSheets['sheet1'].Cells[iCol,iRow+2].Value);

      //卡号>=16777215 or 卡号<=0
      if (StrToInt(cNO) <= 0) or (StrToInt(cNO) >= 16777215) then
      begin
        iCol:=iCol+1;
        inc(Invalid);
        continue;
      end;

      //卡状态
      cS:=Trim(MsExcel.WorkSheets['sheet1'].Cells[iCol,iRow+3].Value);
      if cS='无效' then
        cState:=0
      else if cS='有效' then
        cState:=1
      else
        cState:=2;

      //主机号
      unitM:=Trim(MsExcel.WorkSheets['sheet1'].Cells[iCol,iRow+4].Value);
      unitM:=RightStr('0000'+unitM,4);
      if unitM='' then
      begin
        iCol:=iCol+1;
        inc(Invalid);
        continue;
      end;

      //分机号
      userM:=Trim(MsExcel.WorkSheets['sheet1'].Cells[iCol,iRow+5].Value);
      userM:=RightStr('0000'+userM,4);
      if userM='' then
      begin
        iCol:=iCol+1;
        inc(Invalid);
        continue;
      end;

      //是否围墙机
      iW:=Trim(MsExcel.WorkSheets['sheet1'].Cells[iCol,iRow+6].Value);
      if iW='否' then
        isWall:=0
      else if iW='是' then
        isWall:=1
      else
        isWall:=2;

      //有效时间
      ValidTime:=Trim(MsExcel.WorkSheets['sheet1'].Cells[iCol,iRow+7].Value);

      //导入到t_RegCmd表
      if Get_RecCount('select * from t_card where CardNO='+QuotedStr(cNO)+' and unitMac='+QuotedStr(unitM)+' and userMac='+QuotedStr(userM))<1 then
      begin
        with AdoQryCard do
        begin
          Open;
          Append;
          FieldByName('PersonName').AsString := pName;
          FieldByName('CardType').AsInteger := cType;
          FieldByName('CardNO').AsString := cNO;
          FieldByName('CardState').AsInteger := cState;
          FieldByName('unitMac').AsString := unitM;
          FieldByName('userMac').AsString := userM;
          FieldByName('isWall').AsInteger := isWall;
          FieldByName('ValidTime').AsString := ValidTime;
          Post;
        end;
      end
      else begin
        iCol:=iCol+1;
        inc(Invalid);
        continue;
      end;

      RefreshRec(AdoQryCard,'select * from t_card');
      iCol := iCol+1;
      Inc(Valid);
    end;
    MsExcel.Quit;
  except
    MessageBox(self.Handle,PChar(lang_msg_ImportFail),PChar(lang_msg_SysPrompts),0);
    MsExcel.Quit;
    isImport := false;
    Exit;
  end;

  AdoQryCard.First;
  MessageBox(self.Handle,PChar(lang_msg_ImportSuccess+'(有效:'+IntToStr(Valid)+',无效:'+IntToStr(Invalid)+')'),PChar(lang_msg_SysPrompts),0);
  isImport := false;
  end
  else if isImport=true then
  begin
    ShowMessage('正在导入Excel表格数据，请稍候...');
  end;
end;

//==导出Excel表格==

procedure TMainForm.btn_card_exportClick(Sender: TObject);
var
  h,count:Integer;
  Excelid:OleVariant;
  i:Integer;
  cType,cState,isWall:string;
begin
  try
    Excelid := CreateOLEObject('Excel.Application');
  except
    Application.MessageBox(PChar(lang_msg_ExcelInstall),PChar(lang_msg_SysPrompts),MB_OK+MB_ICONASTERISK+MB_DEFBUTTON1+MB_APPLMODAL);
    Exit;
  end;

  try
    count:=AdoQryCard.RecordCount;
    Excelid.Visible := false;
    Excelid.WorkBooks.Add;
    Excelid.WorkSheets[1].Cells[1,1].Value := '持卡人';
    Excelid.WorkSheets[1].Cells[1,2].Value := lang_dgCardColum1; //卡类型
    Excelid.WorkSheets[1].Cells[1,3].Value := lang_dgCardColum2; //卡号
    Excelid.WorkSheets[1].Cells[1,4].Value := lang_dgCardColum5; //卡状态
    Excelid.WorkSheets[1].Cells[1,5].Value := lang_dgCardColum3; //主机
    Excelid.WorkSheets[1].Cells[1,6].Value := lang_dgCardColum4; //分机
    Excelid.WorkSheets[1].Cells[1,7].Value := '是否围墙机';
    Excelid.WorkSheets[1].Cells[1,8].Value := '有效时间';

    for i:=1 to 8 do
    begin
      Excelid.WorkSheets[1].Columns[i].HorizontalAlignment := xlCenter;
      Excelid.WorkSheets[1].Columns[i].ColumnWidth :=12;
      Excelid.WorkSheets[1].Columns[i].NumberFormatLocal:='@';

      Excelid.WorkSheets[1].Cells[1,i].Borders[1].LineStyle:=1;
      Excelid.WorkSheets[1].Cells[1,i].Borders[2].LineStyle:=1;
      Excelid.WorkSheets[1].Cells[1,i].Borders[3].LineStyle:=1;
      Excelid.WorkSheets[1].Cells[1,i].Borders[4].LineStyle:=1;
    end;

    Excelid.WorkSheets[1].Columns[8].ColumnWidth :=24;

    h:=2;
    AdoQryCard.First;
    while not AdoQryCard.EOF do
    begin
      cType:=AdoQryCard.FieldByName('CardType').AsString;
      if cType='0' then
        cType:='住户卡'
      else if cType='1' then
        cType:='物业卡'
      else if cType='2' then
        cType:='系统卡'
      else if cType='3' then
        cType:='巡更卡';

      cState:=AdoQryCard.FieldByName('CardState').AsString;
      if cState='0' then
        cState:='无效'
      else if cState='1' then
        cState:='有效';

      isWall:=AdoQryCard.FieldByName('isWall').AsString;
      if isWall='0' then
        isWall:='否'
      else if isWall='1' then
        isWall:='是';

      Excelid.WorkSheets[1].Cells[h,1].Value := AdoQryCard.FieldByName('PersonName').AsString;
      Excelid.WorkSheets[1].Cells[h,2].Value := cType;
      Excelid.WorkSheets[1].Cells[h,3].Value := AdoQryCard.FieldByName('CardNO').AsString;
      Excelid.WorkSheets[1].Cells[h,4].Value := cState;
      Excelid.WorkSheets[1].Cells[h,5].Value := AdoQryCard.FieldByName('unitMac').AsString;
      Excelid.WorkSheets[1].Cells[h,6].Value := AdoQryCard.FieldByName('userMac').AsString;
      Excelid.WorkSheets[1].Cells[h,7].Value := isWall;
      Excelid.WorkSheets[1].Cells[h,8].Value := AdoQryCard.FieldByName('ValidTime').AsString;

      for i:=1 to 8 do
      begin
        Excelid.WorkSheets[1].Cells[h,i].Borders[1].LineStyle:=1;
        Excelid.WorkSheets[1].Cells[h,i].Borders[2].LineStyle:=1;
        Excelid.WorkSheets[1].Cells[h,i].Borders[3].LineStyle:=1;
        Excelid.WorkSheets[1].Cells[h,i].Borders[4].LineStyle:=1;
      end;

      Inc(h);
      AdoQryCard.Next;
    end;

    Excelid.Quit;
  except
    Application.MessageBox(PChar(lang_msg_ExportFail), PChar(lang_msg_SysPrompts), MB_OK+MB_ICONASTERISK+MB_DEFBUTTON1+MB_APPLMODAL);
  end;
    MessageBox(GetActiveWindow(),PChar(lang_msg_ExportSuccess), PChar(lang_msg_SysPrompts), MB_OK +MB_ICONWARNING);
end;

//===4.3 查询、删除、刷新===

//==查询==

//-提示信息-
procedure TMainForm.cmb_qry_itemChange(Sender: TObject);
begin
  if cmb_qry_item.ItemIndex=0 then
    Edit2.ShowHint := true
  else
    Edit2.ShowHint := false;
end;
//-双击提取卡号-
procedure TMainForm.Edit2DblClick(Sender: TObject);
begin
  if cmb_qry_item.ItemIndex=0 then
    Edit2.Text := edt_CardNO1.Text;
end;
//-查询-
procedure TMainForm.BitBtn19Click(Sender: TObject);
var
  selStr:string;
begin
  if (ComboBox3.Text<>'') and (Edit2.Text<>'') then
  begin
    if cmb_qry_item.ItemIndex=0 then
      selStr := 'select * from t_card where CardNO='+QuotedStr(Edit2.Text)
    else if cmb_qry_item.ItemIndex=1 then
      selStr := 'select * from t_card where unitMac='+QuotedStr(Edit2.Text)
    else if cmb_qry_item.ItemIndex=2 then
      selStr := 'select * from t_card where PersonName='+QuotedStr(Edit2.Text);

    selStr := selStr+' and CardType= '+IntToStr(ComboBox3.ItemIndex);
    RefreshRec(AdoQryCard,selStr);
  end
  else if (ComboBox3.Text='') and (Edit2.Text<>'') then
  begin
    if cmb_qry_item.ItemIndex=0 then
      selStr := 'select * from t_card where CardNO='+QuotedStr(Edit2.Text)
    else if cmb_qry_item.ItemIndex=1 then
      selStr := 'select * from t_card where unitMac='+QuotedStr(Edit2.Text)
    else if cmb_qry_item.ItemIndex=2 then
      selStr := 'select * from t_card where PersonName='+QuotedStr(Edit2.Text);
    
    RefreshRec(AdoQryCard,selStr);
  end
  else if (ComboBox3.Text<>'') and (Edit2.Text='') then
  begin
    selStr := 'select * from t_card where CardType='+IntToStr(ComboBox3.ItemIndex);
    RefreshRec(AdoQryCard,selStr);
  end
  else begin
    selStr := 'select * from t_card';
    RefreshRec(AdoQryCard,selStr);
  end;

  edt_amount.Text := IntToStr(AdoQryCard.RecordCount);
end;

//==删除==

procedure TMainForm.BitBtn6Click(Sender: TObject);
begin
  if MessageDlg(lang_msg_Del,mtConfirmation,[mbYes,mbNo],0) = mrYes then
  begin
    if Get_RecCount('select * from t_card')>0 then
      DBGridCardsCenter.SelectedRows.Delete;
  end;
end;

//==清除==

procedure TMainForm.BitBtn1Click(Sender: TObject);
begin
  if MessageDlg(lang_msg_DelAll,mtConfirmation,[mbYes,mbNo],0) = mrYes then
  begin
    ExecSQL('delete from t_card where ID>0');
    RefreshRec(AdoQryCard,'select * from t_card');
  end;
end;

//==刷新==

procedure TMainForm.btn_refreshClick(Sender: TObject);
begin
  RefreshRec(AdoQryCard,'select * from t_card');
  edt_amount.Text:=IntToStr(AdoQryCard.RecordCount);
end;

//=====4.5 物业卡=====

procedure TMainForm.spBtn_CardSenderClick(Sender: TObject);
var
  i:Integer;
  pcNode:TTreeNode;
begin
  PageControl2.ActivePageIndex:=5;
  spBtn_register.Font.Color  :=clWindowText;
  spBtn_cancel.Font.Color    :=clWindowText;
  spBtn_read.Font.Color      :=clWindowText;
  spBtn_clear.Font.Color     :=clWindowText;
  spBtn_center.Font.Color    :=clWindowText;
  spBtn_CardSender.Font.Color:=clRed;
  spBtn_WriteCard.Font.Color :=clWindowText;

  Tree_pCard.Items[0].DeleteChildren;
  for i:=StrToInt(MaxNO) downto StrToInt(MinNO) do
  begin
    pcNode:=Tree_pCard.Items.AddChildObjectFirst(Tree_pCard.Items[0],IntToStr(i),nil);
    pcNode.ImageIndex:=2;
  end;
  Tree_pCard.FullExpand;

  btn_c_save.Enabled:=false;
  btn_c_cancel.Enabled:=false;
  btn_c_add.Enabled:=false;
  btn_c_edit.Enabled:=false;
  btn_c_del.Enabled:=false;

  RefreshRec(AdoQrypCard,'select * from t_card as A where unitMac=(select Min(unitMac) from t_card where CardNO=A.CardNO) and userMac between '+QuotedStr(MinNO)+' and '+QuotedStr(MaxNO));
end;

//===4.5.1 生成地址树===

procedure TMainForm.Tree_pCardClick(Sender: TObject);
begin
  if Tree_pCard.Selected.ImageIndex=1 then
  begin
    RefreshRec(AdoQrypCard,'select * from t_card as A where unitMac=(select Min(unitMac) from t_card where CardNO=A.CardNO) and userMac between '+QuotedStr(MinNO)+' and '+QuotedStr(MaxNO));

    btn_c_save.Enabled:=false;
    btn_c_cancel.Enabled:=false;
    btn_c_add.Enabled:=false;
    btn_c_edit.Enabled:=false;
    btn_c_del.Enabled:=false;

    p_card_valid.Enabled := false;
  end
  else if Tree_pCard.Selected.ImageIndex=2 then
  begin
    RefreshRec(AdoQrypCard,'select * from t_card as A where unitMac=(select Min(unitMac) from t_card where CardNO=A.CardNO) and userMac='+QuotedStr(Tree_pCard.Selected.Text));

    btn_c_save.Enabled:=false;
    btn_c_cancel.Enabled:=false;
    btn_c_add.Enabled:=true;
    btn_c_edit.Enabled:=true;
    btn_c_del.Enabled:=true;

    p_card_valid.Enabled := true;
  end;
end;

//==设置物业卡有效期==

procedure TMainForm.p_card_validClick(Sender: TObject); 
var
  ValidTime:string;
  userM:string;
begin
  frm_valid_room := Tfrm_valid_room.Create(nil);
  frm_valid_room.Caption := '设置物业卡有效期';
  frm_valid_room.Label1.Caption := '分机号：';
  frm_valid_room.edit_name.Text := Tree_pCard.Selected.Text;

  if frm_valid_room.ShowModal=mrOK then
  begin
    ValidTime := FormatDateTime('YYYY-MM-DD hh:mm:SS',frm_valid_room.date_valid.DateTime);
    userM := Tree_pCard.Selected.Text;

    ExecSQL('update t_card set ValidTime='+QuotedStr(ValidTime)+' where userMac='+QuotedStr(userM));

    RefreshRec(AdoQryCard,'select * from t_card');
    Tree_pCard.OnClick(self);
  end;
end;

//===4.5.2 管理物业卡===

//==修改==
procedure TMainForm.btn_c_editClick(Sender: TObject);
begin
  DBGridpCard.DataSource.DataSet.Edit;

  btn_c_save.Enabled:=true;
  btn_c_cancel.Enabled:=true;
  Tree_pCard.Enabled:=false;
  btn_c_add.Enabled:=false;
  btn_c_edit.Enabled:=false;
  btn_c_del.Enabled:=false;
  Panel1.Enabled := false;
end;

//==删除==
procedure TMainForm.btn_c_delClick(Sender: TObject);
var
  cNO:string;
begin
  if MessageDlg(lang_msg_Del,mtConfirmation,[mbYes,mbNo],0) = mrYes then
  begin
    pcard_cancel.Click;

    cNO := AdoQrypCard.FieldByName('CardNO').AsString;
    ExecSQL('delete from t_card where CardNO='+QuotedStr(cNO));

    RefreshRec(AdoQryCard,'select * from t_card');
    RefreshRec(AdoQryPerson,'select * from t_card where CardNO='+QuotedStr(cNO)+' and unitMac='+QuotedStr(AdoQrypCard.FieldByName('unitMac').AsString)+' and userMac='+QuotedStr(AdoQrypCard.FieldByName('userMac').AsString));
    RefreshRec(AdoQrypCard,'select * from t_card as A where unitMac=(select Min(unitMac) from t_card where CardNO=A.CardNO) and userMac='+QuotedStr(AdoQrypCard.FieldByName('userMac').AsString));

    Tree_pCard.OnClick(self);
  end;
end;

//==保存==
procedure TMainForm.btn_c_saveClick(Sender: TObject);
var
  cNO:Integer;
begin
  cNO:=StrToInt(DBGridpCard.DataSource.DataSet.FieldByName('CardNO').AsString);

  if (cNO > 0) and (cNO < 16777215) then
  begin
    DBGridpCard.DataSource.DataSet.Post;
  end
  else begin
    DBGridpCard.DataSource.DataSet.Cancel;
    ShowMessage('保存失败,卡号必须在0~16777215范围内！');
  end;

  btn_c_save.Enabled:=false;
  btn_c_cancel.Enabled:=false;
  Tree_pCard.Enabled:=true;
  btn_c_add.Enabled:=true;
  btn_c_edit.Enabled:=true;
  btn_c_del.Enabled:=true;
  Panel1.Enabled := true;
end;

//==取消==
procedure TMainForm.btn_c_cancelClick(Sender: TObject);
begin
  DBGridpCard.DataSource.DataSet.Cancel;

  btn_c_save.Enabled:=false;
  btn_c_cancel.Enabled:=false;
  Tree_pCard.Enabled:=true;
  btn_c_add.Enabled:=true;
  btn_c_edit.Enabled:=true;
  btn_c_del.Enabled:=true;
  Panel1.Enabled := true;
end;

//==新增(隐藏)==
procedure TMainForm.btn_c_addClick(Sender: TObject);
begin
  DBGridpCard.DataSource.DataSet.Append;
  DBGridpCard.DataSource.DataSet.FieldByName('PersonName').AsString:=lang_labDefaultName;
  DBGridpCard.DataSource.DataSet.FieldByName('CardType').AsInteger:=1;
  DBGridpCard.DataSource.DataSet.FieldByName('CardNO').AsString:='000000';
  DBGridpCard.DataSource.DataSet.FieldByName('CardState').AsInteger:=0;
  DBGridpCard.DataSource.DataSet.FieldByName('ValidTime').AsString:='2050-12-31 24:00:00';
  DBGridpCard.DataSource.DataSet.FieldByName('unitMac').AsString:='0000';
  DBGridpCard.DataSource.DataSet.FieldByName('userMac').AsString:=Tree_pCard.Selected.Text;
  DBGridpCard.DataSource.DataSet.FieldByName('isWall').AsInteger:=0;

  btn_c_save.Enabled:=true;
  btn_c_cancel.Enabled:=true;
  Tree_pCard.Enabled:=false;
  btn_c_add.Enabled:=false;
  btn_c_edit.Enabled:=false;
  btn_c_del.Enabled:=false;
  Panel1.Enabled := false;
end;

//==双击提取卡号==
procedure TMainForm.DBGridpCardDblClick(Sender: TObject);
begin
  if (btn_c_save.Enabled=true) and (edt_CardNO1.Text<>'') then
  begin
    AdoQrypCard.FieldByName('CardNO').AsString := edt_CardNO1.Text;
  end;
end;

//==下载为物业卡==
procedure TMainForm.pcard_downloadClick(Sender: TObject);
var
  pName:string;
  cNO:string;
  unitStr,userStr:string;
  ValidTime:string;
begin
  pName := AdoQrypCard.FieldByName('PersonName').AsString;
  ValidTime := AdoQrypCard.FieldByName('ValidTime').AsString;
  cNO := AdoQrypCard.FieldByName('CardNO').AsString;
  unitStr:=AdoQrypCard.FieldByName('unitMac').AsString;
  userStr:=AdoQrypCard.FieldByName('userMac').AsString;

  D_Card_T_Wall(pName,cNO,userStr,'0000',ValidTime,1);
  D_Card_T_Unit(pName,cNO,userStr,'0000',ValidTime,1);

  ExecSQL('delete from t_card where unitMac=0000');
  RefreshRec(AdoQryCard,'select * from t_card');

  isSend:=true;
  if ComType=1 then
  begin
    Timer1.Enabled:=true;
  end;
end;

//==注销物业卡==
procedure TMainForm.pcard_cancelClick(Sender: TObject);
var
  cNO:string;
  s:string;
begin
  cNO := AdoQrypCard.FieldByName('CardNO').AsString;

  C_Card_F_Device(cNO,'0000',1);

  RefreshRec(AdoQryCard,'select * from t_card');

  isSend:=true;
  if ComType=1 then
  begin
    Timer1.Enabled:=true;
  end;
end;

//==有效期==
procedure TMainForm.pcard_validtimeClick(Sender: TObject);
var
  ValidTime:string;
begin
  frm_validtime := Tfrm_validtime.Create(nil);
  frm_validtime.edit_name.Text := AdoQrypCard.FieldByName('PersonName').AsString;
  frm_validtime.edit_cardNO.Text := AdoQrypCard.FieldByName('CardNO').AsString;
  if frm_validtime.ShowModal=mrOK then
  begin
    ValidTime := FormatDateTime('YYYY-MM-DD hh:mm:SS',frm_validtime.date_valid.DateTime);
    ExecSQL('update t_card set ValidTime='+QuotedStr(ValidTime)+' where PersonName='+QuotedStr(frm_validtime.edit_name.Text)+' and CardNO='+QuotedStr(frm_validtime.edit_cardNO.Text));
    RefreshRec(AdoQrypCard,'select * from t_card where userMac='+QuotedStr(AdoQrypCard.FieldByName('userMac').AsString));
    RefreshRec(AdoQryCard,'select * from t_card');
  end;
end;

//=====4.6 发/写卡器=====

procedure TMainForm.spBtn_WriteCardClick(Sender: TObject);
begin
  PageControl2.ActivePageIndex:=6;
  spBtn_register.Font.Color  :=clWindowText;
  spBtn_cancel.Font.Color    :=clWindowText;
  spBtn_read.Font.Color      :=clWindowText;
  spBtn_clear.Font.Color     :=clWindowText;
  spBtn_center.Font.Color    :=clWindowText;
  spBtn_CardSender.Font.Color:=clWindowText;
  spBtn_WriteCard.Font.Color :=clRed;
end;

//===4.6.1 发卡器===

//==(Comm3)==
procedure TMainForm.Comm3ReceiveData(Sender: TObject; Buffer: Pointer;
  BufferLength: Word);
var
  i,k:integer;
  RecvStr:string;
  rBuf:pchar;
  RecStr:string;
begin
  mm_receivecard.Clear;
  RecvStr:='';
  GetMem(rBuf,BufferLength+1);
  for k:=0 to BufferLength do
    rBuf[k]:=Char(0);

  Move(Buffer^,rBuf^,BufferLength);
  for i:=1 to BufferLength do
    RecvStr:=RecvStr+IntToHex(Byte(rBuf[i-1]),2);

  RecStr:=RecStr+RecvStr;
  mm_receivecard.Text:=RecStr;

  if Test='true' then
  begin
    Memo4.Visible:=true;
    Memo4.Lines.Add(RecStr);
  end;
end;

//==处理接收数据==
procedure TMainForm.mm_receivecardChange(Sender: TObject);
var
  tmp:string;
  j:integer;
begin
  tmp:=mm_receivecard.Text;
  if tmp='DA' then
  begin
    mm_receivecard.Clear;
    SendCommand1('');
  end
  else if Length(tmp)=20 then
  begin
    tmp:=MidStr(tmp,13,6);
    j:=StrToInt('$'+tmp);
    
    if isBatch=true then
    begin
      frm_reg_batch.edt_CardNO.Text := IntToStr(j);
    end
    else begin
      edt_CardNO1.Text:=IntToStr(j);
      mm_cards.Lines.Append(IntToStr(j));
    end;
  end
  else if (Length(tmp)>20) and (LeftStr(tmp,2)='DA') then
  begin
    tmp:=RightStr(tmp,20);
    tmp:=MidStr(tmp,13,6);
    j:=StrToInt('$'+tmp);

    if isBatch=true then
    begin
      frm_reg_batch.edt_CardNO.Text := IntToStr(j);
    end
    else begin
      edt_CardNO1.Text:=IntToStr(j);
      mm_cards.Lines.Append(IntToStr(j));
    end;
  end;
end;
procedure TMainForm.SendCommand1(cmdStr:string);//获取卡号
var
  SendBuf:array[1..25] of byte;
  SendStr:string;
begin
  SendBuf[1]:=Byte($D9);
  SendStr:='';
  Comm3.WriteCommData(@SendBuf[1],1);
end;

//==连接==
procedure TMainForm.btn_connect1Click(Sender: TObject);
begin
  try
    Comm3.StopComm;
    Comm3.BaudRate := 1200;
    Comm3.CommName := cmbPort1.Text;
    Comm3.StartComm;
    Label65.Caption := '（已连接）';
    btn_connect1.Enabled := false;
    btn_disconnect1.Enabled := true;
  except
    Label65.Caption := '（未连接）';
    btn_connect1.Enabled := true;
    btn_disconnect1.Enabled := false;
  end;
end;

//==断开==
procedure TMainForm.btn_disconnect1Click(Sender: TObject);
begin
  Comm3.StopComm;
  btn_connect1.Enabled := true;
  btn_disconnect1.Enabled := false;
  Label65.Caption := '（未连接）';
end;

//==双击选择单元主机/住户号==
procedure TMainForm.edt_UnitMacDblClick(Sender: TObject);
begin
  f_treedevice := Tf_treedevice.Create(nil);
  if f_treedevice.ShowModal=mrOK then
  begin
    edt_UnitMac.Text := f_treedevice.UnitStr;
    edt_UserMac.Text := f_treedevice.UserStr;
  end;
end;

//==下载卡==
procedure TMainForm.btn_CardRegClick(Sender: TObject);
var
  pName:string;
  cINO:Integer;
  cNO:string;
  s:string;
  unitStr,userStr:string;
  ValidTime,cMemo:string;
begin
  unitStr := edt_UnitMac.Text;
  userStr := edt_UserMac.Text;

  if (unitStr='') or (userStr='') then
  begin
    ShowMessage('请先选择单元主机或住户号！');
    Exit;
  end;

  pName := edt_pName.Text;
  if pName='' then
  begin
    pName := lang_labDefaultName;
  end;

  if edt_CardNO1.Text='' then
  begin
    ShowMessage('卡号不能为空！');
    Exit;
  end;

  cNO:= edt_CardNO1.Text;
  cINO:=StrToInt(cNO);
  if (cINO <= 0) or (cINO >= 16777215) then
  begin
    ShowMessage('卡号必须在0~16777215范围内！');
    Exit;
  end;

  ValidTime := '2050-12-31 24:00:00';

  s := '0000'+IntToHex(StrToInt(cNO),6)+unitStr+GetUserNO6(userStr)+'010A';
  s := GetSendStr(s);

  if Get_RecCount('select * from t_card where CardNO='+QuotedStr(cNO)+' and unitMac='+QuotedStr(unitStr))<1 then
  begin
    Card_Insert(pName,cNO,IntToHex(StrToInt(cNO),6),unitStr,userStr,null,0,null,ValidTime,0,0);
  end
  else begin
    ExecSQL('update t_card set CardType=0,userMac='+QuotedStr(userStr)+',PersonName='+QuotedStr(pName)+',ValidTime='+QuotedStr(ValidTime)+',CardMemo='+QuotedStr(cMemo)+' where CardNO='+QuotedStr(cNO)+' and unitMac='+QuotedStr(unitStr));
  end;

  AdoCon.Execute('insert into t_cmd(CardNO,cmdStr,unitMac,userMac,sent,cmdType) values('+QuotedStr(cNO)+','+QuotedStr(s)+','+QuotedStr(unitStr)+','+QuotedStr(userStr)+',0,0)');
  AdoCon.Execute('delete A from t_card A where exists(select 1 from t_card where CardNO=A.CardNO and unitMac=A.unitMac and userMac=A.userMac and ID<A.ID)');

  D_Card_T_Wall(pName,cNO,userStr,'0000',ValidTime,0);

  RefreshRec(AdoQryCard,'select * from t_card');

  isSend:=true;
  if ComType=1 then
  begin
    Timer1.Enabled:=true;
  end;
end;

//==批量发卡==
procedure TMainForm.btn_Reg_BatchClick(Sender: TObject);
begin
  frm_reg_batch := Tfrm_reg_batch.Create(nil);
  frm_reg_batch.ShowModal;
end;

//==双击清空历史记录==
procedure TMainForm.mm_cardsDblClick(Sender: TObject);
begin
  mm_cards.Clear;
end;

//==自动发卡==
procedure TMainForm.edt_CardNO1Change(Sender: TObject);
begin
  if (edt_CardNO1.Text<>'') and (spBtn_door.Down=true) and (spBtn_CardSender.Font.Color=clRed) and (PageControl2.ActivePageIndex=5) and (Tree_pCard.Selected.ImageIndex=2) then
  begin
    if AdoQrypCard.RecordCount<15 then
    begin
      with DBGridpCard.DataSource.DataSet do
      begin
        Append;
        FieldByName('PersonName').AsString:=lang_labDefaultName;
        FieldByName('CardType').AsInteger:=1;
        FieldByName('CardNO').AsString:=edt_CardNO1.Text;
        FieldByName('CardState').AsInteger:=0;
        FieldByName('ValidTime').AsString:='2050-12-31 24:00:00';
        FieldByName('unitMac').AsString:='0000';
        FieldByName('userMac').AsString:=Tree_pCard.Selected.Text;
        FieldByName('isWall').AsInteger:=0;
        Post;

        pcard_download.Click;

        edt_CardNO1.Text := '';
      end;
    end
    else begin
      ShowMessage('此号码已存储15张物业卡，无法继续添加！');  
    end;
  end;

  if (edt_CardNO1.Text<>'') and (spBtn_addr.Down=true) and (PNodeInfo(TreeHouse.Selected.Data)^.DType=2) and (PageControl5.ActivePageIndex=1) then
  begin
    if AdoQryPerson.RecordCount<15 then
    begin
      with DBGridPerson.DataSource.DataSet do
      begin
        Append;
        FieldByName('PersonName').AsString:=lang_labDefaultName;
        FieldByName('CardType').AsInteger:=0;
        FieldByName('CardNO').AsString:=edt_CardNO1.Text;
        FieldByName('CardState').AsInteger:=0;
        FieldByName('ValidTime').AsString:='2050-12-31 24:00:00';
        FieldByName('unitMac').AsString:=LeftStr(PNodeInfo(TreeHouse.Selected.Data)^.NO,4);
        FieldByName('userMac').AsString:=RightStr(PNodeInfo(TreeHouse.Selected.Data)^.NO,4);
        FieldByName('isWall').AsInteger:=0;
        Post;

        card_download.Click;
        delay(120);
        TreeHouse.OnClick(self);

        edt_CardNO1.Text := '';
      end;
    end
    else begin
      ShowMessage('该住户已分配15张住户卡，无法继续添加！');
    end;
  end;
end;

//===4.6.2 写卡器===

//==(Comm2)==
procedure TMainForm.Comm2ReceiveData(Sender: TObject; Buffer: Pointer;
  BufferLength: Word);
var
  i,k:integer;
  RecvStr:string;
  rBuf:pchar;
  ShowStr:string;
begin
  GetMem(rBuf,BufferLength+1);
  for k:=0 to BufferLength do
    rBuf[k]:=Char(0);

  Move(Buffer^,rBuf^,BufferLength);
  RecvStr:='';
  ShowStr:='';
  for i:=1 to BufferLength do
  begin
    RecvStr:=RecvStr+IntToHex(Byte(rBuf[i-1]),2);
    ShowStr:=ShowStr+IntToHex(Byte(rBuf[i-1]),2)+' ';
  end;
  mm_Rcv.Text := recvstr;
  Memo1.Lines.Append(lang_note_Receive+ShowStr);
end;

//==处理接收数据==
procedure TMainForm.mm_RcvChange(Sender: TObject);
var
  rcvType,rcvLen,devNum,j:integer;
  cardNO,devNO,devStr:string;
  ValidTime:string;
begin
  try
    devStr := mm_Rcv.Lines.Strings[0];
    rcvLen := Length(devStr);
    if rcvLen = 20 then
    begin
      rcvType:=StrToInt('$'+MidStr(devStr,7,2));
      case rcvType of
        7:sb_tips.Panels[2].Text:=lang_msg_DownloadOK;
        8:begin
          cardNO:=RightStr(devStr,6);
          cardNO:=IntToStr(StrToInt('$'+cardNO));
          edt_CardNO2.Text:=cardNO;
          sb_tips.Panels[2].Text:=lang_msg_ReadCardOK;
          end;
        9:sb_tips.Panels[2].Text:=lang_msg_CommunicateFail;
        10:sb_tips.Panels[2].Text:=lang_msg_NoCard;
        11:sb_tips.Panels[2].Text:=lang_msg_OperateFail;
        12:sb_tips.Panels[2].Text:=lang_msg_NoAvailable;
        13:sb_tips.Panels[2].Text:=lang_msg_NotCorrespond;
      else
      end;
      memo2.Lines.Append(sb_tips.Panels[2].Text);
    end
    else if rcvLen > 20 then
    begin
      rcvType:=StrToInt('$'+MidStr(devStr,7,2));
      ValidTime:=MidStr(devStr,21,12);
      ValidTime:=LeftStr(ValidTime,4)+'年'+MidStr(ValidTime,5,2)+'月'+MidStr(ValidTime,7,2)+'日'+MidStr(ValidTime,9,2)+'时'+MidStr(ValidTime,11,2)+'分';

      if rcvType = 4 then
      begin
        devNum := StrToInt('$'+MidStr(devStr,35,2));
        if devNum > 0 then
        begin
          mm_state.Clear;
          mm_state.Lines.Add('设备号码：');
          for j := 1 to devNum do
          begin
            devNO := MidStr(devStr,37+10*(j-1),4)+'-';
            devNO := devNO+GetUserNO4(MidStr(devStr,41+10*(j-1),6));
            mm_state.Lines.Append(devNO);
          end;
          mm_state.Lines.Add('有效期:');
          mm_state.Lines.Add(ValidTime);

          sb_tips.Panels[2].Text:=lang_msg_OperateOK;
        end;
      end;
    end;
  finally
    mm_Rcv.Lines.Delete(0);
  end;
end;

//==获取下载卡/注销卡指令==
function TMainForm.GetCmdStr(regStr:string):string;
var
  s01,s2,s3,s4,s5,s6,s789,s15,s16,s17:string;
  d1,d2,d3,d4,d5,d6,d7:string; // 7个设备
  s:string;
begin
  if edt_CardNO2.Text='' then
  begin
    ShowMessage(lang_msg_ProvideCard);
    Exit;
  end;

  if Length(mm_dev.Text)<1 then
  begin
    ShowMessage(lang_msg_ProvideDevice);
    Exit;
  end;

  s01 := 'F708';
  s2  := IntToHex(18+5*mm_dev.Lines.Count,2);
  s3  := '02';
  s5  := regStr;

  if cmbCardType.ItemIndex >1 then
    s6 := '10'
  else
    s6 := '00';

  s789 := IntToHex(StrToInt(edt_CardNO2.Text),6);
  s15  := FormatDateTime('YYYYMMDDhhmm',dt1.DateTime);

  if cmbCardType.ItemIndex =0 then
    s16 := '00'
  else
    s16 := '01';

  s17 := IntToHex(mm_dev.Lines.Count,2);

  if mm_dev.Lines.Strings[0] <> '' then
  begin
    d1 := mm_dev.Lines.Strings[0];
    d1 := LeftStr(d1,4)+GetUserNO6(RightStr(d1,4));
  end;

  if mm_dev.Lines.Strings[1] <> '' then
  begin
    d2 := mm_dev.Lines.Strings[1];
    d2 := LeftStr(d2,4)+GetUserNO6(RightStr(d2,4));
  end;

  if mm_dev.Lines.Strings[2] <> '' then
  begin
    d3 := mm_dev.Lines.Strings[2];
    d3 := LeftStr(d3,4)+GetUserNO6(RightStr(d3,4));
  end;

  if mm_dev.Lines.Strings[3] <> '' then
  begin
    d4 := mm_dev.Lines.Strings[3];
    d4 := LeftStr(d4,4)+GetUserNO6(RightStr(d4,4));
  end;

  if mm_dev.Lines.Strings[4] <> '' then
  begin
    d5 := mm_dev.Lines.Strings[4];
    d5 := LeftStr(d5,4)+GetUserNO6(RightStr(d5,4));
  end;

  if mm_dev.Lines.Strings[5] <> '' then
  begin
    d6 := mm_dev.Lines.Strings[5];
    d6 := LeftStr(d6,4)+GetUserNO6(RightStr(d6,4));
  end;

  if mm_dev.Lines.Strings[6] <> '' then
  begin
    d7 := mm_dev.Lines.Strings[6];
    d7 := LeftStr(d7,4)+GetUserNO6(RightStr(d7,4));
  end;

  s  := s2+s3+s5+s6+s789+s15+s16+s17+d1+d2+d3+d4+d5+d6+d7;
  s4 := GetSumCheck(s);
  s  := s01+s2+s3+s4+s5+s6+s789+s15+s16+s17+d1+d2+d3+d4+d5+d6+d7;
  Result := s;
end;

//==发卡器下发指令==
procedure TMainForm.SendCommand(CmdStr: String);
var
  TempCmdStr:string;
  i,j,k:Integer;
  SendBuf:array[1..128] of byte;
  sendstr:string;
begin
  if GetComStatus(cmbPort2.Text) <> 'busy' then
  begin
    ShowMessage(lang_msg_PortNotOpened);
    Exit;
  end;

  TempCmdStr:=StringReplace(CmdStr,' ','',[rfReplaceAll]);
  k := Length(TempCmdStr) div 2;

  for i:=1 to k do
  begin
    SendBuf[i]:=byte(StrToInt('$'+midstr(TempCmdStr,i*2-1,2)));
  end;

  sendstr:='';

  for j:=1 to k do
  begin
    if not Comm2.WriteCommData(@SendBuf[j],1) then
    begin
      sb_tips.Panels[2].Text:=lang_msg_NoSent;
      break;
    end;

    sendstr:=sendstr+IntTohex(SendBuf[j],2)+' ';
  end;

  if length(sendstr) < 1 then
  begin
    sb_tips.Panels[2].Text:=lang_msg_NeverSent;
  end
  else begin
    memo2.Lines.Append(lang_note_Send+sendstr);
    sb_tips.Panels[2].Text:=lang_msg_SentOK;
  end;
end;

//==连接==
procedure TMainForm.btn_connect2Click(Sender: TObject);
begin
  try
    Comm2.StopComm;
    Comm2.BaudRate := 2400;
    Comm2.CommName := cmbPort2.Text;
    Comm2.StartComm;
    Label74.Caption := '（已连接）';
    btn_connect2.Enabled := false;
    btn_disconnect2.Enabled := true;
  except
    Label74.Caption := '（未连接）';
    btn_connect2.Enabled := true;
    btn_disconnect2.Enabled := false;
  end;
end;

//==断开==
procedure TMainForm.btn_disconnect2Click(Sender: TObject);
begin
  Comm2.StopComm;
  Label74.Caption := '（未连接）';
  btn_connect2.Enabled := true;
  btn_disconnect2.Enabled := false;
end;

//==Enter键读取卡号==
procedure TMainForm.edt_CardNO2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=13 then btn_ReadCards.Click;
end;

//==读取卡号==
procedure TMainForm.btn_ReadCardsClick(Sender: TObject);
var
  SendStr:string;
begin
  SendStr:='F7080501'+GetSumCheck('0501');
  SendCommand(SendStr);
end;

//==下载卡==
procedure TMainForm.btn_RegisterClick(Sender: TObject);
var
  cardNo,unitMac,userMac,deadline:string;
  cardType,cNO:Integer;
begin
  SendCommand(GetCmdStr('01'));

  cardType:=cmbCardType.ItemIndex;

  cardNo:=edt_CardNO2.Text;
  cNO:=StrToInt(cardNO);
  if (cNO <= 0) or (cNO >= 16777215) then
  begin
    ShowMessage('卡号必须在0~16777215范围内！');
    Exit;
  end;

  deadline:=FormatDateTime('YYYYMMDDhhmm',dt1.DateTime);
  deadline:=GetRegTime(deadline);
  unitMac:=LeftStr(mm_dev.Lines[0],4);
  userMac:=RightStr(mm_dev.Lines[0],4);

  if Get_RecCount('select * from t_card where CardNO='+QuotedStr(cardNO))<1 then
    ExecSQL('insert into t_card(CardType,CardNO,CardState,unitMac,userMac,CardMemo) values('+IntToStr(cardType)+','+QuotedStr(cardNO)+','+IntToStr(1)+','+QuotedStr(unitMac)+','+QuotedStr(userMac)+','+QuotedStr(deadline)+')')
  else
    ExecSQL('update t_card set CardState=1,CardType='+IntToStr(cardType)+',unitMac='+QuotedStr(unitMac)+',userMac='+QuotedStr(userMac)+'where CardNO='+QuotedStr(cardNO));
  RefreshRec(AdoQryCard,'select * from t_card');
end;

//==注销卡==
procedure TMainForm.btn_CancelClick(Sender: TObject);
var
  cardNO,unitMac,userMac:string;
  cNO:Integer;
begin
  SendCommand(GetCmdStr('02'));

  cardNO:=edt_CardNO2.Text;
  cNO:=StrToInt(cardNO);
  if (cNO <= 0) or (cNO >= 16777215) then
  begin
    ShowMessage('卡号必须在0~16777215范围内！');
    Exit;
  end;

  unitMac:=LeftStr(mm_dev.Lines[0],4);
  userMac:=RightStr(mm_dev.Lines[0],4);
  ExecSQL('delete from t_card where CardNO='+QuotedStr(cardNO)+' and unitMac='+QuotedStr(unitMac)+' and userMac='+QuotedStr(userMac));
  RefreshRec(AdoQryCard,'select * from t_card');
end;

//==还原卡==
procedure TMainForm.btn_RestoreClick(Sender: TObject);
var
  SendStr:string;
begin
  mm_dev.Clear;
  SendStr := 'F7080505'+GetSumCheck('0505');
  SendCommand(SendStr);
end;

//==卡状态==
procedure TMainForm.btn_CardStateClick(Sender: TObject);
var
  SendStr:string;
begin
  mm_dev.Clear;
  SendStr := 'F7080504'+GetSumCheck('0504');
  SendCommand(SendStr);
end;

//==修改时间==
procedure TMainForm.btn_EditTimeClick(Sender: TObject);
var
  SendStr:string;
  CardNO,CardTime:string;
begin
  CardNO  := IntToHex(StrToInt(edt_CardNO2.Text),6);
  CardTime:= FormatDateTime('YYYYMMDDhhmm',dt1.DateTime);
  SendStr := '1003'+CardNO+CardTime;
  SendStr := 'F7081003'+GetSumCheck(SendStr)+'0000'+CardNO+CardTime;
  SendCommand(SendStr);
end;

//===4.6.3 保存配置===

procedure TMainForm.btn_save_sorClick(Sender: TObject);
var
  f:TIniFile;
  path_file_name:string;
begin
  //--------------inifile-------------
  path_file_name := Get_CurDir()+'\config.ini';
  if not FileExists(path_file_name) then
  begin
    ShowMessage(lang_msg_NoConfig);
  end
  else begin
    f := TIniFile.Create(path_file_name);

    f.WriteString('sysparam','ComSender',cmbPort1.Text);
    f.WriteString('sysparam','ComWriter',cmbPort2.Text);

    f.Free;
  end;
  //---------------inifile-end----------
  ShowMessage(lang_msgSaveParam);
end;



//===============5、报警中心模块===============

procedure TMainForm.spBtn_alarmClick(Sender: TObject);
begin
  PageControl1.ActivePageIndex:=3;
  Panel3.Visible:=false;
  spBtn_alarm.Top :=123;
  spBtn_credit.Top:=164;
  spBtn_set.Top   :=205;
end;

//==单击改变报警状态==

procedure TMainForm.DBGridAlarmRecCellClick(Column: TColumn);
begin
  if AdoQryAlarm.FieldByName('AlarmStatus').AsInteger=0 then
  begin
    ExecSQL('update t_alarm set AlarmStatus=1 where ID='+IntToStr(AdoQryAlarm.FieldByName('ID').AsInteger));
    RefreshRec(AdoQryAlarm,'select * from t_alarm order by AlarmTime DESC,ID DESC');
  end;
end;

//==双击改变处理情况==

procedure TMainForm.DBGridAlarmRecDblClick(Sender: TObject);
begin
  if AdoQryAlarm.FieldByName('AlarmSolved').AsInteger=0 then
  begin
    ExecSQL('update t_alarm set AlarmSolved=1 where ID='+IntToStr(AdoQryAlarm.FieldByName('ID').AsInteger));
    RefreshRec(AdoQryAlarm,'select * from t_alarm order by AlarmTime DESC,ID DESC');
  end;
end;

//==重绘表格==

procedure TMainForm.DBGridAlarmRecDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if AdoQryAlarm.FieldByName('AlarmStatus').AsInteger=0 then
    DbGridAlarmRec.Canvas.Brush.Color := clRed
  else if AdoQryAlarm.FieldByName('AlarmStatus').AsInteger=1 then
    DbGridAlarmRec.Canvas.Brush.Color := $00A5FF;

  DbGridAlarmRec.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

//===查询===

procedure TMainForm.btn_AlarmQueryClick(Sender: TObject);
begin
  f_alarmqry := Tf_alarmqry.Create(nil);
  f_alarmqry.Caption :=lang_btnQry;
  if f_alarmqry.ShowModal=mrOK then
  begin
    with AdoQryAlarm do
    begin
      SQL.Clear;
      SQL.Add('select * from t_alarm where AlarmType='+IntToStr(f_alarmqry.AlarmType)+' and (AlarmTime between :cTime0 and :cTime1)');
      if f_alarmqry.DevNO<>'' then
        SQL.Add(' and AddrName like '+QuotedStr('%'+f_alarmqry.DevNO+'%'));

      SQL.Add(' and AlarmStatus='+IntToStr(f_alarmqry.AlarmStatus)+' and AlarmSolved='+IntToStr(f_alarmqry.AlarmSolved));

      Parameters.ParamByName('cTime0').Value:=f_alarmqry.AlarmTime0;
      Parameters.ParamByName('cTime1').Value:=f_alarmqry.AlarmTime1;
      SQL.Add('order by ID DESC');
      Active:=true;
    end;
  end;
end;

//===刷新===

procedure TMainForm.btn_AlarmRefreshClick(Sender: TObject);
begin
  RefreshRec(AdoQryAlarm,'select * from t_alarm order by AlarmTime DESC,ID DESC');
end;

//===删除===

procedure TMainForm.btn_AlarmDelClick(Sender: TObject);
begin
  if MessageDlg(lang_msg_Del,mtConfirmation,[mbYes,mbNo],0) = mrYes then
  begin
    if Get_RecCount('select * from t_alarm')>0 then
      DBGridAlarmRec.SelectedRows.Delete;
  end;
end;

//===清除===

procedure TMainForm.btn_AlarmClearClick(Sender: TObject);
begin
  if MessageDlg(lang_msg_DelAll,mtConfirmation,[mbYes,mbNo],0) = mrYes then
  begin
    ExecSQL('delete from t_alarm where ID>0');
    RefreshRec(AdoQryAlarm,'select * from t_alarm order by AlarmTime DESC,ID DESC');
  end;
end;

//===导出Excel表格===

procedure TMainForm.btn_alarm_exportClick(Sender: TObject);
var
  h,count:Integer;
  Excelid:OleVariant;
  i:Integer;
  aType,aState,aSolved:string;
begin
  try
    Excelid := CreateOLEObject('Excel.Application');
  except
    Application.MessageBox(PChar(lang_msg_ExcelInstall),PChar(lang_msg_SysPrompts),MB_OK+MB_ICONASTERISK+MB_DEFBUTTON1+MB_APPLMODAL);
    Exit;
  end;

  try
    count:=AdoQryAlarm.RecordCount;
    Excelid.Visible := false;
    Excelid.WorkBooks.Add;
    Excelid.WorkSheets[1].Cells[1,1].Value := lang_dgAlarmColum1; // 报警类型
    Excelid.WorkSheets[1].Cells[1,2].Value := lang_dgAlarmColum2; // 设备地址
    Excelid.WorkSheets[1].Cells[1,3].Value := lang_dgAlarmColum3; // 状态
    Excelid.WorkSheets[1].Cells[1,4].Value := lang_dgAlarmColum4; // 报警时间
    Excelid.WorkSheets[1].Cells[1,5].Value := lang_dgAlarmColum5; // 报警内容
    Excelid.WorkSheets[1].Cells[1,6].Value := lang_dgAlarmColum6; // 处理情况

    for i:=1 to 6 do
    begin
      Excelid.WorkSheets[1].Columns[i].HorizontalAlignment := xlCenter;
      Excelid.WorkSheets[1].Columns[i].ColumnWidth :=12;
      Excelid.WorkSheets[1].Columns[i].NumberFormatLocal:='@';

      Excelid.WorkSheets[1].Cells[1,i].Borders[1].LineStyle:=1;
      Excelid.WorkSheets[1].Cells[1,i].Borders[2].LineStyle:=1;
      Excelid.WorkSheets[1].Cells[1,i].Borders[3].LineStyle:=1;
      Excelid.WorkSheets[1].Cells[1,i].Borders[4].LineStyle:=1;
    end;

    Excelid.WorkSheets[1].Columns[4].ColumnWidth :=20;
    Excelid.WorkSheets[1].Columns[5].ColumnWidth :=20;

    h:=2;
    AdoQryAlarm.First;
    while not AdoQryAlarm.EOF do
    begin
      aType:=AdoQryAlarm.FieldByName('AlarmType').AsString;
      if aType='0' then
        aType:=lang_alarmType0
      else if aType='1' then
        aType:=lang_alarmType4
      else if aType='2' then
        aType:='胁迫开门报警'
      else if aType='3' then
        aType:='开门超时报警'
      else
        aType:='未知';

      aState:=AdoQryAlarm.FieldByName('AlarmStatus').AsString;
      if aState='0' then
        aState:=lang_alarmState0
      else if aState='1' then
        aState:=lang_alarmState1
      else
        aState:='未知';

      aSolved:=AdoQryAlarm.FieldByName('AlarmSolved').AsString;
      if aSolved='0' then
        aSolved:=lang_alarmState2
      else if aSolved='1' then
        aSolved:=lang_alarmState3
      else
        aSolved:='未知';
      
      Excelid.WorkSheets[1].Cells[h,1].Value := aType;
      Excelid.WorkSheets[1].Cells[h,2].Value := AdoQryAlarm.FieldByName('AddrName').AsString;
      Excelid.WorkSheets[1].Cells[h,3].Value := aState;
      Excelid.WorkSheets[1].Cells[h,4].Value := AdoQryAlarm.FieldByName('AlarmTime').AsString;
      Excelid.WorkSheets[1].Cells[h,5].Value := AdoQryAlarm.FieldByName('AlarmText').AsString;
      Excelid.WorkSheets[1].Cells[h,6].Value := aSolved;

      for i:=1 to 6 do
      begin
        Excelid.WorkSheets[1].Cells[h,i].Borders[1].LineStyle:=1;
        Excelid.WorkSheets[1].Cells[h,i].Borders[2].LineStyle:=1;
        Excelid.WorkSheets[1].Cells[h,i].Borders[3].LineStyle:=1;
        Excelid.WorkSheets[1].Cells[h,i].Borders[4].LineStyle:=1;
      end;

      Inc(h);
      AdoQryAlarm.Next;
    end;

    Excelid.Quit;
  except
    Application.MessageBox(PChar(lang_msg_ExportFail), PChar(lang_msg_SysPrompts), MB_OK+MB_ICONASTERISK+MB_DEFBUTTON1+MB_APPLMODAL);
  end;
    MessageBox(GetActiveWindow(),PChar(lang_msg_ExportSuccess), PChar(lang_msg_SysPrompts), MB_OK +MB_ICONWARNING);
end;



//===============6、门禁记录模块===============

procedure TMainForm.spBtn_creditClick(Sender: TObject);
begin
  PageControl1.ActivePageIndex:=4;
  Panel3.Visible:=false;
  spBtn_alarm.Top :=123;
  spBtn_credit.Top:=164;
  spBtn_set.Top   :=205;
end;

//==显示抓拍图像==

procedure TMainForm.DBGridCardRecDblClick(Sender: TObject);
begin
  if not AdoQryCardRec.FieldByName('Screenshot').IsNull then
  begin
    frm_screenshot:=Tfrm_screenshot.Create(nil);
    frm_screenshot.ShowModal;
  end;
end;

//===查询===

procedure TMainForm.btn_CardRecQueryClick(Sender: TObject);
begin
  f_recqry:=Tf_recqry.Create(nil);
  f_recqry.Caption :=lang_btnQry;
  if f_recqry.ShowModal=mrOK then
  begin
    with AdoQryCardRec do
    begin
      SQL.Clear;
      SQL.Add('select * from t_CardRec where CardType='+IntToStr(f_recqry.CardType)+' and (RecTime between :cTime0 and :cTime1)');
      if f_recqry.CardNO<>'' then
        SQL.Add(' and CardNO like '+QuotedStr('%'+f_recqry.CardNO+'%'));
      if f_recqry.RecDev<>'' then
        SQL.Add(' and RecDev like '+QuotedStr('%'+f_recqry.RecDev+'%'));
      Parameters.ParamByName('cTime0').Value:=f_recqry.RecTime0;
      Parameters.ParamByName('cTime1').Value:=f_recqry.RecTime1;
      SQL.Add('order by ID DESC');
      Active:=true;
    end;
  end;
end;

//===刷新===

procedure TMainForm.btn_CardRecRefreshClick(Sender: TObject);
begin
  RefreshRec(AdoQryCardRec,'select * from t_CardRec order by RecTime DESC,ID DESC');
end;

//===删除===

procedure TMainForm.btn_CardRecDelClick(Sender: TObject);
begin
  if MessageDlg(lang_msg_Del,mtConfirmation,[mbYes,mbNo],0) = mrYes then
  begin
    if Get_RecCount('select * from t_CardRec')>0 then
    begin
      DBGridCardRec.SelectedRows.Delete;
    end;
  end;
end;

//===清除===

procedure TMainForm.btn_CardRecClearClick(Sender: TObject);
begin
  if MessageDlg(lang_msg_DelAll,mtConfirmation,[mbYes,mbNo],0) = mrYes then
  begin
    ExecSQL('delete from t_CardRec where ID>0');
    RefreshRec(AdoQryCardRec,'select * from t_CardRec order by RecTime DESC,ID DESC');
  end;
end;

//===导出Excel表格===

procedure TMainForm.btn_credit_exportClick(Sender: TObject);
var
  h,count:Integer;
  Excelid:OleVariant;
  i:Integer;
  cType:string;
begin
  try
    Excelid := CreateOLEObject('Excel.Application');
  except
    Application.MessageBox(PChar(lang_msg_ExcelInstall),PChar(lang_msg_SysPrompts),MB_OK+MB_ICONASTERISK+MB_DEFBUTTON1+MB_APPLMODAL);
    Exit;
  end;

  try
    count:=AdoQryCardRec.RecordCount;
    Excelid.Visible := false;
    Excelid.WorkBooks.Add;
    Excelid.WorkSheets[1].Cells[1,1].Value := '门禁类型';
    Excelid.WorkSheets[1].Cells[1,2].Value := '卡号/房号';
    Excelid.WorkSheets[1].Cells[1,3].Value := '门禁点';
    Excelid.WorkSheets[1].Cells[1,4].Value := '门禁记录时间';

    for i:=1 to 4 do
    begin
      Excelid.WorkSheets[1].Columns[i].HorizontalAlignment := xlCenter;
      Excelid.WorkSheets[1].Columns[i].ColumnWidth :=12;
      Excelid.WorkSheets[1].Columns[i].NumberFormatLocal:='@';

      Excelid.WorkSheets[1].Cells[1,i].Borders[1].LineStyle:=1;
      Excelid.WorkSheets[1].Cells[1,i].Borders[2].LineStyle:=1;
      Excelid.WorkSheets[1].Cells[1,i].Borders[3].LineStyle:=1;
      Excelid.WorkSheets[1].Cells[1,i].Borders[4].LineStyle:=1;
    end;

    Excelid.WorkSheets[1].Columns[1].ColumnWidth :=20;
    Excelid.WorkSheets[1].Columns[4].ColumnWidth :=20;

    h:=2;
    AdoQryCardRec.First;
    while not AdoQryCardRec.EOF do
    begin
      cType:=AdoQryCardRec.FieldByName('CardType').AsString;
      if cType='0' then
        cType:=lang_cardTypeV+'/'+lang_cardTypeC
      else if cType='1' then
        cType:=lang_cardTypeV+'/'+lang_cardType3
      else if cType='2' then
        cType:=lang_cardTypeX+'/'+lang_cardTypeC
      else if cType='3' then
        cType:=lang_cardTypeX+'/'+lang_cardType3
      else if cType='4' then
        cType:='主机密码开门'
      else if cType='5' then
        cType:='主机呼叫(抓拍)'
      else if cType='6' then
        cType:='主机呼叫(振铃)'
      else if cType='7' then
        cType:='主机呼叫(摘机)'
      else if cType='8' then
        cType:='主机呼叫(开门)'
      else
        cType:='未知';
      
      Excelid.WorkSheets[1].Cells[h,1].Value := cType;
      Excelid.WorkSheets[1].Cells[h,2].Value := AdoQryCardRec.FieldByName('CardNO').AsString;
      Excelid.WorkSheets[1].Cells[h,3].Value := AdoQryCardRec.FieldByName('RecDev').AsString;
      Excelid.WorkSheets[1].Cells[h,4].Value := AdoQryCardRec.FieldByName('RecTime').AsString;

      for i:=1 to 4 do
      begin
        Excelid.WorkSheets[1].Cells[h,i].Borders[1].LineStyle:=1;
        Excelid.WorkSheets[1].Cells[h,i].Borders[2].LineStyle:=1;
        Excelid.WorkSheets[1].Cells[h,i].Borders[3].LineStyle:=1;
        Excelid.WorkSheets[1].Cells[h,i].Borders[4].LineStyle:=1;
      end;

      Inc(h);
      AdoQryCardRec.Next;
    end;

    Excelid.Quit;
  except
    Application.MessageBox(PChar(lang_msg_ExportFail), PChar(lang_msg_SysPrompts), MB_OK+MB_ICONASTERISK+MB_DEFBUTTON1+MB_APPLMODAL);
  end;
    MessageBox(GetActiveWindow(),PChar(lang_msg_ExportSuccess), PChar(lang_msg_SysPrompts), MB_OK +MB_ICONWARNING);
end;



//===============7、设置模块===============

procedure TMainForm.spBtn_setClick(Sender: TObject);
begin
  PageControl1.ActivePageIndex:=5;
  RefreshRec(AdoQryUser,'select * from t_user');
  Panel3.Visible:=false;
  spBtn_alarm.Top :=123;
  spBtn_credit.Top:=164;
  spBtn_set.Top   :=205;
end;

//===7.1 通讯属性===

procedure TMainForm.cmb_comproChange(Sender: TObject);
begin
  case cmb_compro.ItemIndex of
        0:PageControl6.ActivePageIndex:=0;
        1:PageControl6.ActivePageIndex:=1;
        end;
end;

//==串口通讯==

procedure TMainForm.BitBtn24Click(Sender: TObject);//连接
var
  year,month,day,hour,minute,second,CmdStr:string;
begin
  Comm1.StopComm;
  TCPServer.Active:=false;
  IPMCastClient.Active := false;
  Timer1.Enabled:=false;
  try
    com_port:=cbb_port.Text;
    Comm1.CommName:=com_port;
    Comm1.StartComm;
    sb_tips.Panels[1].Text := lang_msg_Comm+'('+Comm1.CommName+')';
    ComType:=0;
  except
    ShowMessage(lang_msgConnectF);
  end;

  delay(120);

  //==========与管理机进行时间同步===================
  year  := IntToStr(YearOf(Now()));
  month := IntToHex(MonthOf(Now()),2);
  day   := IntToStr(DayOf(Now()));
  day   := Rightstr('0'+day,2);

  hour  := IntToStr(HourOf(Now()));
  hour  := Rightstr('0'+hour,2);

  minute:= IntToStr(MinuteOf(Now()));
  minute:= Rightstr('0'+minute,2);

  second:= IntToStr(SecondOf(Now()));

  CmdStr:= '0000'+year+'00'+month+day+'00'+hour+minute+'000C';
  CmdStr:= GetSendStr(CmdStr);

  SendCmd(CmdStr);
end;

procedure TMainForm.BitBtn25Click(Sender: TObject);//断开
begin
  Comm1.StopComm;
  PortStatus:=false;
  sb_tips.Panels[1].Text := lang_msg_NoComm;
end;
              
//==保存==
procedure TMainForm.btn_SaveClose0Click(Sender: TObject);
var
  f:TIniFile;
  path_file_name:string;
begin
  //--------------inifile-------------
  path_file_name := Get_CurDir()+'\config.ini';
  if not FileExists(path_file_name) then
  begin
    ShowMessage(lang_msg_NoConfig);
  end
  else begin
    f := TIniFile.Create(path_file_name);
    f.WriteString('sysparam','ComPort',cbb_port.Text);
    f.WriteInteger('ComProperty','Type',0);
    f.WriteString('ComProperty','ManageNumber',edit_center.Text);
    com_port := cbb_port.Text;
    ManageNumber:=edit_center.Text;

    f.Free;
  end;
  //---------------inifile-end----------
  ShowMessage(lang_msgSaveParam);
end;

//==网络通讯==

procedure TMainForm.BitBtn2Click(Sender: TObject);//连接
var
  IDSH:TIdSocketHandle;
begin
  Comm1.StopComm;
  try
    TCPServer.DefaultPort := StrToInt(ReceivePort);
    TCPServer.Active := true;

    IPMCastClient.MulticastGroup := '224.0.0.1';
    IPMCastClient.DefaultPort := 6789;
    IPMCastClient.Active := true;

    sb_tips.Panels[1].Text := lang_msg_Comm;
    ComType:=1;
    Timer1.Enabled:=true;
  except
    sb_tips.Panels[1].Text := lang_msg_NoComm;
  end;
end;

//==保存==
procedure TMainForm.btn_SaveClose1Click(Sender: TObject);
var
  f:TIniFile;
  path_file_name:string;
begin
  //--------------inifile-------------
  path_file_name := Get_CurDir()+'\config.ini';
  if not FileExists(path_file_name) then
  begin
    ShowMessage(lang_msg_NoConfig);
  end
  else begin
    f := TIniFile.Create(path_file_name);
    f.WriteString('ComProperty','ReceivePort',edit_receive.Text);
    f.WriteString('ComProperty','SendPort',edit_send.Text);
    f.WriteInteger('ComProperty','Type',1);
    f.WriteString('ComProperty','ManageNumber',edit_center.Text);

    ManageNumber:=edit_center.Text;
    ReceivePort:=edit_receive.Text;
    SendPort:=edit_send.Text;
    f.Free;
  end;
  //---------------inifile-end----------
  ShowMessage(lang_msgSaveParam);
end;

//===7.2 用户管理===

//==添加账号==
procedure TMainForm.user_AddClick(Sender: TObject);
var
  name,permit,password:string;
  sqlStr:string;
begin
  f_userAdmin:=Tf_userAdmin.Create(nil);
  f_userAdmin.Caption :=lang_pMenuUserAdd;

  if f_userAdmin.ShowModal=mrOK then
  begin
    name    :=f_userAdmin.edit_name.Text;
    permit  :=f_userAdmin.cbb_permit.Text;
    password:=Encrypt(f_userAdmin.edit_psw.Text);
    if Get_RecCount('select * from t_user where UserName='+QuotedStr(name))>0 then
      ShowMessage(lang_msg_UserExist)
    else begin
      sqlStr:='insert into t_user(UserName,UserPermission,UserPassword) values('+QuotedStr(name)+','+QuotedStr(permit)+','+QuotedStr(password)+')';
      with AdoQryUser do
      begin
        SQL.Clear;
        SQL.Add(sqlStr);
        ExecSQL;
      end;
      RefreshRec(AdoQryUser,'select * from t_user');
    end;
  end;
end;

//==编辑权限==
procedure TMainForm.user_EditClick(Sender: TObject);
var
  name,permit,password:string;
  previous_name,sqlStr:string;
begin
  f_userAdmin:=Tf_userAdmin.Create(nil);
  f_userAdmin.Caption :=lang_pMenuUserEdit;

  f_userAdmin.edit_name.Text :=AdoQryUser.FieldByName('UserName').AsString;
  f_userAdmin.edit_psw.Text  :=Uncrypt(MainForm.AdoQryUser.FieldByName('UserPassword').AsString);
  f_userAdmin.cbb_permit.Text:=MainForm.AdoQryUser.FieldByName('UserPermission').AsString;

  previous_name:=f_userAdmin.edit_name.Text;

  if f_userAdmin.ShowModal=mrOK then
  begin
    name    :=f_userAdmin.edit_name.Text;
    permit  :=f_userAdmin.cbb_permit.Text;
    password:=Encrypt(f_userAdmin.edit_psw.Text);
    sqlStr:='update t_user set UserName='+QuotedStr(name)+',UserPermission='+QuotedStr(permit)+',UserPassword='+QuotedStr(password)+' where UserName='+QuotedStr(previous_name);
    with AdoQryUser do
    begin
      SQL.Clear;
      SQL.Add(sqlStr);
      ExecSQL;
    end;
    RefreshRec(AdoQryUser,'select * from t_user');
  end;
end;

//==删除账户==
procedure TMainForm.user_DelClick(Sender: TObject);
begin
  if Get_RecCount('select * from t_user')>0 then
    MainForm.AdoQryUser.Delete;
end;

//===7.3 个人中心===

//==编辑==
procedure TMainForm.btn_EditPswClick(Sender: TObject);
begin
  Panel_EditPsw.Visible:=true;
  edt_name.Text:=sys_user;
end;

//==确认==
procedure TMainForm.btn_PswOKClick(Sender: TObject);
begin
  if edt_name.Text='' then
  begin
    ShowMessage(lang_msg_UserNull);
    edt_name.SetFocus;
  end
  else if (edt_name.Text<>sys_user) and (Get_RecCount('select * from t_user where UserName='+QuotedStr(edt_name.Text))>0) then
  begin
    ShowMessage(lang_msg_UserExist);
    edt_name.SetFocus;
  end
  else if edit_new.Text='' then
  begin
    ShowMessage(lang_msg_PswNull);
    edit_new.SetFocus;
  end
  else if edit_confirmnew.Text='' then
  begin
    ShowMessage(lang_msg_PswNull);
    edit_confirmnew.SetFocus;
  end
  else if edit_new.Text<>edit_confirmnew.Text then
  begin
    ShowMessage(lang_msg_PswDismatch);
    edit_confirmnew.Text:='';
    edit_confirmnew.SetFocus;
  end
  else begin
    with AdoQryUser do
    begin
      SQL.Clear;
      SQL.Add('update t_user set UserPassword='+QuotedStr(Encrypt(edit_new.Text))+',UserName='+QuotedStr(edt_name.Text)+'where UserName='+QuotedStr(sys_user));
      ExecSQL;
    end;
    sys_user:=edt_name.Text;
    lab_UserName.Caption:=sys_user;
    Panel_EditPsw.Visible:=false;
    edit_new.Text:='';
    edit_confirmnew.Text:='';
  end;
  RefreshRec(AdoQryUser,'select * from t_user');
end;

//==返回==
procedure TMainForm.btn_PswBackClick(Sender: TObject);
begin
  Panel_EditPsw.Visible:=false;
  edit_new.Text:='';
  edit_confirmnew.Text:='';
end;

//===7.4 下发记录===

procedure TMainForm.btn_recordClick(Sender: TObject); // 下发记
begin
  PageControl1.ActivePageIndex := 8;
  PageControl7.ActivePageIndex := 0;
  PageCOntrol7.OnChange(self);

  RefreshRec(AdoQrySent,'select * from t_cmd where sent = 1 order by sendTime DESC,ID DESC');
  RefreshRec(AdoQryNotSent,'select * from t_cmd where sent=0 or sent=2 order by ID');
end;

//==调整隐藏按钮==
procedure TMainForm.PageControl7Change(Sender: TObject);
begin
  if PageControl7.ActivePageIndex=0 then
  begin
    BitBtn7.Visible := false;
    BitBtn8.Visible := false;
  end
  else if PageControl7.ActivePageIndex=1 then
  begin
    BitBtn7.Visible := true;
    BitBtn8.Visible := true;
  end;
end;

//==重绘表格==

procedure TMainForm.DBGridSentDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState); //DBGridSent
begin
  if DSSent.DataSet.RecNo > 0 then
  begin
    if Column.Title.Caption = '序号' then
      DBGridSent.Canvas.TextOut(Rect.Left+2,Rect.Top,IntToStr(DSSent.DataSet.RecNo));
  end;
end;

procedure TMainForm.DBGridNotSentDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState); //DBGridNotSent
begin
  if DSNotSent.DataSet.RecNo > 0 then
  begin
    if Column.Title.Caption = '序号' then
      DBGridNotSent.Canvas.TextOut(Rect.Left+2,Rect.Top,IntToStr(DSNotSent.DataSet.RecNo));
  end;
end;

//==重新下发==

procedure TMainForm.BitBtn8Click(Sender: TObject);
begin
  ExecSQL('update t_cmd set sent=0 where sent=2');
  isSend:=true;
  if ComType=1 then
  begin
    Timer1.Enabled:=true;
  end; 
end;

//==删除==

procedure TMainForm.BitBtn7Click(Sender: TObject);
begin
  if MessageDlg(lang_msg_Del,mtConfirmation,[mbYes,mbNo],0) = mrYes then
  begin
    DBGridNotSent.SelectedRows.Delete;
  end;
end;

//==清除==

procedure TMainForm.BitBtn4Click(Sender: TObject);
begin
  if MessageDlg(lang_msg_DelAll,mtConfirmation,[mbYes,mbNo],0) = mrYes then
  begin
    if PageControl7.ActivePageIndex =0 then
    begin
      AdoCon.Execute('delete from t_cmd where sent=1');
      RefreshRec(AdoQrySent,'select * from t_cmd where sent=1 order by sendTime');
    end
    else if PageControl7.ActivePageIndex =1 then
    begin
      AdoCon.Execute('delete from t_cmd where sent=0 or sent=2');
      Refreshrec(AdoQryNotSent,'select * from t_cmd where sent=0 or sent=2 order by ID');
    end;
  end;
end;

//==刷新==

procedure TMainForm.BitBtn5Click(Sender: TObject);
begin
  RefreshRec(AdoQrySent,'select * from t_cmd where sent=1 order by sendTime DESC,ID DESC');
  RefreshRec(AdoQryNotSent,'select * from t_cmd where sent=0 or sent=2 order by ID');
end;

//==返回==

procedure TMainForm.btn_recordbackClick(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 5;
end;

//===7.5 高级===

procedure TMainForm.btn_moreClick(Sender: TObject);
begin
  PageControl1.ActivePageIndex:=6;
end;

//==隐藏==
procedure TMainForm.btn_hideClick(Sender: TObject);
begin
  spBtn_more.Visible:=false;
  spBtn_more.Down:=false;
  spBtn_set.Down:=true;
  PageControl1.ActivePageIndex:=5;
end;

//==双击清空待发送==
procedure TMainForm.mmSendCmdDblClick(Sender: TObject);
begin
  mmSendCmd.Clear;
end;

//==双击清空接收==
procedure TMainForm.mmRcvCmdDblClick(Sender: TObject);
begin
  mmRcvCmd.Clear;
end;

//==双击清空指令==
procedure TMainForm.Memo1DblClick(Sender: TObject);
begin
  Memo1.Clear;
end;

//==双击清空指令状态==
procedure TMainForm.Memo2DblClick(Sender: TObject);
begin
  Memo2.Clear;
end;


//==========处理接收数据==========

procedure TMainForm.mmRcvCmdChange(Sender: TObject);
var
  cStr,cType:string;
begin

    {R  44 08 读取注册卡
     R  45 08 刷卡记录
     R  46 08 开关门状态
     R  23 0C 主机呼叫振铃
     R  24 0C 主机呼叫摘机
     R  26 0C 主机呼叫开锁
     R  01 0B 主机呼叫抓拍
     R  47 0C 主机密码开锁
     R  02 0B 主机密码开锁抓拍
     R  2A 08 主机开门超时报警
     40 00 08 家居多路探头报警
     41 00 08 分机求助报警
     42 00 08 主机、分机上电
     43 00 08 分机布、撤防报警
     4C 00 08 用户胁迫开门报警
     }

  if cmdBusy = true then Exit;
  cStr := mmRcvCmd.Lines.Strings[0];
  if cStr = '' then exit;
  cType := MidStr(cStr,23,4);

  if cType = '4408' then
  begin
    cmdBusy := true;
    isReading := true;
    GetRegCards(cStr);    //4408 读取注册卡
    Timer2.Enabled:=true;
  end
  else if cType = '4508' then
  begin
    cmdBusy := true;
    isReading := false;
    GetCardRec(cStr);     //4508 刷卡记录
  end
  {else if cType = '4608' then
  begin
    cmdBusy := true;
    isReading := false;
    GetDoorState(cStr);    //4608 开关门状态
  end}
  else if cType = '230C' then
  begin
    cmdBusy := true;
    isReading := false;
    GetUnitCallRing(cStr);   //230C 主机呼叫振铃
  end
  else if cType = '240C' then
  begin
    cmdBusy := true;
    isReading := false;
    GetUnitCallOffLock(cStr);   //240C 主机呼叫摘机
  end
  else if cType = '260C' then
  begin
    cmdBusy := true;
    isReading := false;
    GetUnitCallOpenDoor(cStr);   //260C 主机呼叫开锁
  end
  else if cType = '010B' then
  begin
    cmdBusy := true;
    isReading := false;
    GetUnitCallManagement(cStr);  //010B 主机呼叫抓拍
  end
  else if cType = '2A08' then
  begin
    cmdBusy := true;
    isReading := false;
    GetOpenDoorOverTime(cStr); //2A08 主机开门超时报警
  end
  else if cType = '470C' then
  begin
    cmdBusy := true;
    isReading := false;
    GetPwdOpenDoor(cStr);   //470C 主机密码开锁
  end
  else if cType = '0008' then
  begin
    cmdBusy := true;
    isReading := false;
    if MidStr(cStr,21,2)='40' then
      GetSectorAlarm(cStr)  // 400008 家居多路探头报警
    else if MidStr(cStr,21,2)='41' then
      GetAlarmRec(cStr)   //410008 分机求助报警
    else if MidStr(cStr,21,2)='42' then
      GetDevReset(cStr)    //420008 主机、分机上电
    else if MidStr(cStr,21,2)='43' then
      GetSetCancelAlarm(cStr)  // 430008 分机布、撤防
    else if MidStr(cStr,21,2)='4C' then
      GetStressOpenAlarm(cStr);  // 4C0008 用户胁迫开门报警
  end
  else begin
    isReading := false;
    mmRcvCmd.Lines.Delete(0);
  end;
end;

//==4408 读取注册卡==

procedure TMainForm.GetRegCards(devStr: string);
var
  unitStr,userStr:string;
  cardType,cardNO:string;
  intCard,intCardType,isWall:Integer;
  intUserStr:Integer;
  ValidTime:string;
begin
  //4408 读取主机上的注册卡,有2种:普通卡/功能卡
  //注：用户号为0A903A时，表示系统卡(功能卡或单元巡更卡)
  try
    unitStr := MidStr(devStr,3,4);
    userStr := MidStr(devStr,7,6);
    if userStr <> '0A903A' then
      intUserStr := StrToInt(GetUserNO4(userStr));
    cardNO  := MidStr(devStr,17,6);
    intCard := StrToInt('$'+cardNO);
    cardType:= MidStr(devStr,15,1);
    ValidTime:='2050-12-31 24:00:00';

    isWall:=Get_RecCount('select * from t_wall where WallNO='+QuotedStr(unitStr));

    if cardType = '0' then
    begin
      cardType := lang_cardType0;  //住户卡
      intCardType:=0;

      if (intUserStr >= StrToInt(MinNO)) and (intUserStr <= StrToInt(MaxNO)) then
      begin
        cardType := lang_cardType1; //物业卡
        intCardType:=1;
      end
      else if userStr = '0A903A' then
      begin
        cardType := lang_cardType2; //系统卡
        intCardType:=2;
      end;
    end
    else if cardType = '1' then
    begin
      cardType := lang_cardType3;  //巡更卡
      intCardType:=3;
    end
    else begin
      cardType := lang_cardTypeU;  //未知卡
      intCardType:=4;
    end;

    if userStr = '0A903A' then  //系统卡
    begin
      userStr := '10000';
    end
    else if leftstr(userStr,4) = '0AAA' then
    begin
      userStr := Rightstr(userStr,2);
      userStr := IntToStr(StrToInt('$'+userStr));
      userStr := '000'+userStr;
      userStr := 'N'+Rightstr(userStr,3);
    end
    else
    begin
      userStr := GetUserNO4(userStr);
    end;

    Memo2.Lines.Append(lang_strRegisterCard+':'+lang_strUserNo+unitStr+'-'+userStr+','+lang_strCardNo+':'+IntToStr(intCard)+'('+cardNO+'),'+lang_strCardType+':'+cardType);

    if Get_RecCount('select * from t_card where cardNO='+QuotedStr(IntToStr(intCard))+' and unitMac='+QuotedStr(unitStr))<1 then
    begin
      Card_Insert(lang_labDefaultName,IntToStr(intCard),cardNO,unitStr,userStr,null,isWall,null,ValidTime,intCardType,1);
      RefreshRec(AdoQryCard,'select * from t_card');
    end
    else begin
      ExecSQL('update t_card set CardState=1,CardType='+IntToStr(intCardType)+',unitMac='+QuotedStr(unitStr)+',userMac='+QuotedStr(userStr)+',isWall='+IntToStr(isWall)+' where CardNO='+QuotedStr(IntToStr(intCard))+' and unitMac='+QuotedStr(unitSTr)+' and isWall='+IntToStr(isWall));
      RefreshRec(AdoQryCard,'select * from t_card');
    end;


    if Get_RecCount('select * from t_ReadCards where CardNO = '+QuotedStr(IntToStr(intCard))) < 1 then
    begin
      RefreshRec(AdoQryReadCards,'select * from t_ReadCards');
      AdoQryReadCards.Append;
      AdoQryReadCards.FieldByName('CardNO').AsString    := IntToStr(intCard);
      AdoQryReadCards.FieldByName('CardHex').AsString   := cardNO;
      AdoQryReadCards.FieldByName('CardType').AsInteger := intCardType;
      AdoQryReadCards.FieldByName('unitMac').AsString   := unitStr;
      AdoQryReadCards.FieldByName('userMac').AsString   := userStr;
      AdoQryReadCards.Post;
    end;
  finally
    cmdBusy := false;
    mmRcvCmd.Lines.Delete(0);
  end;
  edt_Num.Text:=IntToStr(AdoQryReadCards.RecordCount);
end;

//==4508 刷卡记录==

procedure TMainForm.GetCardRec(devStr: string);
var
  unitStr,userStr,recDev:string;
  cardNO,cardClass:string;
  intCard,intCardClass:integer;
  Card:string;
begin
  //4508
  try
    unitStr := MidStr(devStr,3,4);
    userStr := MidStr(devStr,7,6);
    userStr := GetUserNO4(userStr);
    recDev  := unitStr+'-'+userStr;

    RefreshRec(AdoQryAddr,'select * from t_addr where DevNO='+QuotedStr(recDev));
    recDev := AdoQryAddr.FieldByName('AddrName').AsString + '('+recDev+')';

    cardNO  := MidStr(devStr,17,6);
    intCard := StrToInt('$'+cardNO);

    RefreshRec(AdoQryCard,'select * from t_card where CardNO='+QuotedStr(IntToStr(intCard)));
    Card := AdoQryCard.FieldByName('PersonName').AsString + '('+IntToStr(intCard)+')';
    RefreshRec(AdoQryCard,'select * from t_card');

    cardClass := midStr(devStr,15,1);  //卡类型
    intCardClass:=StrToInt(cardClass);
    if cardClass = '0' then
      cardClass := lang_cardTypeV+'/'+lang_cardTypeC   //有效卡/普通卡
    else if cardClass = '1' then
      cardClass := lang_cardTypeV+'/'+lang_cardType3   //有效卡/巡更卡
    else if cardClass = '2' then
      cardClass := lang_cardTypeX+'/'+lang_cardTypeC   //无效卡/普通卡
    else if cardClass = '3' then
      cardClass := lang_cardTypeX+'/'+lang_cardType3   //无效卡/巡更卡
    else
      cardClass := lang_cardTypeU;                     //未知

    memo2.Lines.Append(lang_strCardRecord+':'+lang_strUserNo+unitStr+'-'+userStr+','+lang_strCardNo+':'+IntToStr(intCard)+'('+cardNO+'),'+lang_strCardType+':'+cardClass);

    RefreshRec(AdoQryCardRec,'select * from t_CardRec order by RecTime DESC,ID DESC');
    AdoQryCardRec.Append;
    AdoQryCardRec.FieldByName('CardNO').AsString   := Card;
    AdoQryCardRec.FieldByName('CardType').AsInteger:= intCardClass;
    AdoQryCardRec.FieldByName('RecDev').AsString   := recDev;
    if ComType=0 then
      AdoQryCardRec.FieldByName('RecTime').AsString  := GetCmdTime(MidStr(devStr,27,12))
    else if ComType=1 then
      AdoQryCardRec.FieldByName('RecTime').AsString  := FormatDateTime('YYYY-MM-DD hh:mm',Now());
    AdoQryCardRec.Post;
    RefreshRec(AdoQryCardRec,'select * from t_CardRec order by RecTime DESC,ID DESC');

    AdoQryCardRec.First;
    CurrentID:=AdoQryCardRec.FieldByName('ID').AsInteger;

    if (DataDocking='true') and (Get_RecCount('select * from master.dbo.sysdatabases where name='+QuotedStr('PoliceDataSystem'),AdoConDock)>0) then
    begin
      AdoConDock.DefaultDatabase:='PoliceDataSystem';
      RefreshRec(AdoQryCardInfo,'select unitMac,userMac from t_card where CardNO='+QuotedStr(IntToStr(intCard))+' and unitMac is not null');
      unitStr:=AdoQryCardInfo.FieldByName('unitMac').AsString;
      userStr:=AdoQryCardInfo.FieldByName('userMac').AsString;
      recDev :=unitStr+'-'+userStr;
      if Get_RecCount('select * from card where Cardcode='+IntToStr(intCard),AdoConDock)<1 then
        AdoConDock.Execute('insert into card(Cardcode,CarNumber) values('+InttoStr(intCard)+','+QuotedStr(recDev)+')');
      if Get_RecCount('select * from FixedCardInfo where CardCode='+IntToStr(intCard),AdoConDock)<1 then
        AdoConDock.Execute('insert into FixedCardInfo(CardCode,RoomCode) values('+InttoStr(intCard)+','+QuotedStr(recDev)+')');
      AdoConDock.Execute('insert into InPark(CardCode,RoomCode,CarNumber,InParkTime) values('+InttoStr(intCard)+','+QuotedStr(recDev)+','+QuotedStr(recDev)+','+QuotedStr(GetCmdTime(MidStr(devStr,27,12)))+')');
    end;

  finally
    cmdBusy := false;
    mmRcvCmd.Lines.Delete(0);
  end;
end;

//==4608 开关门状态==

{procedure TMainForm.GetDoorState(devStr:string);
var
  DoorState:Integer;
  unitStr,userStr,recDev:string;
begin
  try
    unitStr := MidStr(devStr,3,4);
    userStr := MidStr(devStr,7,6);
    userStr := GetUserNO4(userStr);
    recDev  := unitStr+'-'+userStr;
    DoorState := StrToInt(MidStr(devStr,21,2));

    ExecSQL('update t_dev set DoorState='+IntToStr(DoorState)+' where DevNO='+QuotedStr(RecDev));
    TreeDoor.OnClick(self);
  finally
    cmdBusy := false;
    mmRcvCmd.Lines.Delete(0);
  end;
end;}

//==230C 主机呼叫振铃==

procedure TMainForm.GetUnitCallRing(devStr:string);
var
  cardType:Integer;
  unitStr,userStr,recDev,roomDev:string;
begin
  try
    cardType:=6;
    unitStr := MidStr(devStr,3,4);
    userStr := MidStr(devStr,7,6);
    userStr := GetUserNO4(userStr);
    recDev  := unitStr+'-'+userStr;

    RefreshRec(AdoQryAddr,'select * from t_addr where DevNO='+QuotedStr(recDev));
    recDev := AdoQryAddr.FieldByName('AddrName').AsString + '('+recDev+')';

    unitStr := MidStr(devStr,13,4);
    userStr := MidStr(devStr,17,6);
    userStr := GetUserNO4(userStr);
    roomDev := unitStr+'-'+userStr;

    RefreshRec(AdoQryAddr,'select * from t_addr where DevNO='+QuotedStr(roomDev));
    roomDev := AdoQryAddr.FieldByName('AddrName').AsString + '('+roomDev+')';

    RefreshRec(AdoQryCardRec,'select * from t_CardRec order by RecTime DESC,ID DESC');
    AdoQryCardRec.Append;
    AdoQryCardRec.FieldByName('CardNO').AsString   := roomDev;
    AdoQryCardRec.FieldByName('CardType').AsInteger:= cardType;
    AdoQryCardRec.FieldByName('RecDev').AsString   := recDev;
    if ComType=0 then
      AdoQryCardRec.FieldByName('RecTime').AsString  := GetCmdTime(MidStr(devStr,27,12))
    else if ComType=1 then
      AdoQryCardRec.FieldByName('RecTime').AsString  := FormatDateTime('YYYY-MM-DD hh:mm',Now());
    AdoQryCardRec.Post;
    RefreshRec(AdoQryCardRec,'select * from t_CardRec order by RecTime DESC,ID DESC');

    AdoQryCardRec.First;
    CurrentID:=AdoQryCardRec.FieldByName('ID').AsInteger;
  finally
    cmdBusy := false;
    mmRcvCmd.Lines.Delete(0);
  end;
end;

//==240C 主机呼叫摘机==

procedure TMainForm.GetUnitCallOffLock(devStr:string);
var
  cardType:Integer;
  unitStr,userStr,recDev,roomDev:string;
begin
  try
    cardType:=7;
    unitStr := MidStr(devStr,3,4);
    userStr := MidStr(devStr,7,6);
    userStr := GetUserNO4(userStr);
    recDev  := unitStr+'-'+userStr;

    RefreshRec(AdoQryAddr,'select * from t_addr where DevNO='+QuotedStr(recDev));
    recDev := AdoQryAddr.FieldByName('AddrName').AsString + '('+recDev+')';

    unitStr := MidStr(devStr,13,4);
    userStr := MidStr(devStr,17,6);
    userStr := GetUserNO4(userStr);
    roomDev := unitStr+'-'+userStr;

    RefreshRec(AdoQryAddr,'select * from t_addr where DevNO='+QuotedStr(roomDev));
    roomDev := AdoQryAddr.FieldByName('AddrName').AsString + '('+roomDev+')';

    RefreshRec(AdoQryCardRec,'select * from t_CardRec order by RecTime DESC,ID DESC');
    AdoQryCardRec.Append;
    AdoQryCardRec.FieldByName('CardNO').AsString   := roomDev;
    AdoQryCardRec.FieldByName('CardType').AsInteger:= cardType;
    AdoQryCardRec.FieldByName('RecDev').AsString   := recDev;
    if ComType=0 then
      AdoQryCardRec.FieldByName('RecTime').AsString  := GetCmdTime(MidStr(devStr,27,12))
    else if ComType=1 then
      AdoQryCardRec.FieldByName('RecTime').AsString  := FormatDateTime('YYYY-MM-DD hh:mm',Now());
    AdoQryCardRec.Post;
    RefreshRec(AdoQryCardRec,'select * from t_CardRec order by RecTime DESC,ID DESC');

    AdoQryCardRec.First;
    CurrentID:=AdoQryCardRec.FieldByName('ID').AsInteger;
  finally
    cmdBusy := false;
    mmRcvCmd.Lines.Delete(0);
  end;
end;

//==260C 主机呼叫开锁==

procedure TMainForm.GetUnitCallOpenDoor(devStr:string);
var
  cardType:Integer;
  unitStr,userStr,recDev,roomDev:string;
begin
  try
    cardType:=8;
    unitStr := MidStr(devStr,3,4);
    userStr := MidStr(devStr,7,6);
    userStr := GetUserNO4(userStr);
    recDev  := unitStr+'-'+userStr;

    RefreshRec(AdoQryAddr,'select * from t_addr where DevNO='+QuotedStr(recDev));
    recDev := AdoQryAddr.FieldByName('AddrName').AsString + '('+recDev+')';

    unitStr := MidStr(devStr,13,4);
    userStr := MidStr(devStr,17,6);
    userStr := GetUserNO4(userStr);
    roomDev := unitStr+'-'+userStr;

    RefreshRec(AdoQryAddr,'select * from t_addr where DevNO='+QuotedStr(roomDev));
    roomDev := AdoQryAddr.FieldByName('AddrName').AsString + '('+roomDev+')';

    RefreshRec(AdoQryCardRec,'select * from t_CardRec order by RecTime DESC,ID DESC');
    AdoQryCardRec.Append;
    AdoQryCardRec.FieldByName('CardNO').AsString   := roomDev;
    AdoQryCardRec.FieldByName('CardType').AsInteger:= cardType;
    AdoQryCardRec.FieldByName('RecDev').AsString   := recDev;
    if ComType=0 then
      AdoQryCardRec.FieldByName('RecTime').AsString  := GetCmdTime(MidStr(devStr,27,12))
    else if ComType=1 then
      AdoQryCardRec.FieldByName('RecTime').AsString  := FormatDateTime('YYYY-MM-DD hh:mm',Now());
    AdoQryCardRec.Post;
    RefreshRec(AdoQryCardRec,'select * from t_CardRec order by RecTime DESC,ID DESC');

    AdoQryCardRec.First;
    CurrentID:=AdoQryCardRec.FieldByName('ID').AsInteger;
  finally
    cmdBusy := false;
    mmRcvCmd.Lines.Delete(0);
  end;
end;

//==010B 主机呼叫抓拍==

procedure TMainForm.GetUnitCallManagement(devStr:string);
var
  cardType:Integer;
  unitStr,userStr,recDev,roomDev:string;
begin
  try
    cardType:=5;
    unitStr := MidStr(devStr,3,4);
    userStr := MidStr(devStr,7,6);
    userStr := GetUserNO4(userStr);
    recDev  := unitStr+'-'+userStr;

    RefreshRec(AdoQryAddr,'select * from t_addr where DevNO='+QuotedStr(recDev));
    recDev := AdoQryAddr.FieldByName('AddrName').AsString + '('+recDev+')';

    unitStr := MidStr(devStr,13,4);
    userStr := MidStr(devStr,17,6);
    userStr := GetUserNO4(userStr);
    roomDev := unitStr+'-'+userStr;

    RefreshRec(AdoQryAddr,'select * from t_addr where DevNO='+QuotedStr(roomDev));
    roomDev := AdoQryAddr.FieldByName('AddrName').AsString + '('+roomDev+')';

    RefreshRec(AdoQryCardRec,'select * from t_CardRec order by RecTime DESC,ID DESC');
    AdoQryCardRec.Append;
    AdoQryCardRec.FieldByName('CardNO').AsString   := roomDev;
    AdoQryCardRec.FieldByName('CardType').AsInteger:= cardType;
    AdoQryCardRec.FieldByName('RecDev').AsString   := recDev;
    if ComType=0 then
      AdoQryCardRec.FieldByName('RecTime').AsString  := GetCmdTime(MidStr(devStr,27,12))
    else if ComType=1 then
      AdoQryCardRec.FieldByName('RecTime').AsString  := FormatDateTime('YYYY-MM-DD hh:mm',Now());
    AdoQryCardRec.Post;
    RefreshRec(AdoQryCardRec,'select * from t_CardRec order by RecTime DESC,ID DESC');

    AdoQryCardRec.First;
    CurrentID:=AdoQryCardRec.FieldByName('ID').AsInteger;
  finally
    cmdBusy := false;
    mmRcvCmd.Lines.Delete(0);
  end;
end;

//==2A08 主机开门超时报警==

procedure TMainForm.GetOpenDoorOverTime(devStr:string);
var
  unitStr,userStr:string;
  alarmAddr,alarmTime,alarmText:string;
  alarmType,alarmState,alarmHandled:Integer;
begin
  try
    unitStr := MidStr(devStr,3,4);
    userStr := MidStr(devStr,7,6);
    userStr := GetUserNO4(userStr);
    alarmType:=3;
    alarmAddr:=unitStr+'-'+userStr;

    RefreshRec(AdoQryAddr,'select * from t_addr where DevNO='+QuotedStr(alarmAddr));
    alarmAddr := AdoQryAddr.FieldByName('AddrName').AsString + '('+alarmAddr+')';

    alarmState:=0;
    if ComType=0 then
      alarmTime:=GetCmdTime(MidStr(devStr,27,12))
    else if ComType=1 then
      alarmTime:=FormatDateTime('YYYY-MM-DD hh:mm',Now());

    alarmText:=MidStr(devStr,21,2);
    if alarmText='00' then
      alarmText:='强制开门超时'
    else if alarmText='01' then
      alarmText:='对讲开门超时'
    else if alarmText='02' then
      alarmText:='密码开门超时'
    else if alarmText='03' then
      alarmText:='刷卡开门超时'
    else if alarmText='04' then
      alarmText:='按钮开门超时'
    else
      alarmText:='';

    alarmHandled:=0;

    ExecSQL('insert into t_alarm(AddrName,AlarmType,AlarmStatus,AlarmTime,AlarmText,AlarmSolved) values('+QuotedStr(alarmAddr)+','+IntToStr(alarmType)+','+IntToStr(alarmState)+','+QuotedStr(alarmTime)+','+QuotedStr(alarmText)+','+IntToStr(alarmHandled)+')');

    RefreshRec(AdoQryAlarm,'select * from t_alarm order by AlarmTime DESC,ID DESC');
  finally
    cmdBusy:=false;
    mmRcvCmd.Lines.Delete(0);
  end;
end;

//==470C 主机密码开锁==

procedure TMainForm.GetPwdOpenDoor(devStr:string);
var
  unitStr,userStr,recDev,roomDev:string;
  cardType:Integer;
begin
  try
    cardType:=4;
    unitStr := MidStr(devStr,3,4);
    userStr := MidStr(devStr,7,6);
    userStr := GetUserNO4(userStr);
    recDev  := unitStr+'-'+userStr;

    RefreshRec(AdoQryAddr,'select * from t_addr where DevNO='+QuotedStr(recDev));
    recDev := AdoQryAddr.FieldByName('AddrName').AsString + '('+recDev+')';

    unitStr := MidStr(devStr,13,4);
    userStr := MidStr(devStr,17,6);
    userStr := GetUserNO4(userStr);
    roomDev := unitStr+'-'+userStr;

    RefreshRec(AdoQryAddr,'select * from t_addr where DevNO='+QuotedStr(roomDev));
    roomDev := AdoQryAddr.FieldByName('AddrName').AsString + '('+roomDev+')';

    RefreshRec(AdoQryCardRec,'select * from t_CardRec order by RecTime DESC,ID DESC');
    AdoQryCardRec.Append;
    AdoQryCardRec.FieldByName('CardNO').AsString   := roomDev;
    AdoQryCardRec.FieldByName('CardType').AsInteger:= cardType;
    AdoQryCardRec.FieldByName('RecDev').AsString   := recDev;
    if ComType=0 then
      AdoQryCardRec.FieldByName('RecTime').AsString  := GetCmdTime(MidStr(devStr,27,12))
    else if ComType=1 then
      AdoQryCardRec.FieldByName('RecTime').AsString  := FormatDateTime('YYYY-MM-DD hh:mm',Now());
    AdoQryCardRec.Post;
    RefreshRec(AdoQryCardRec,'select * from t_CardRec order by RecTime DESC,ID DESC');

    AdoQryCardRec.First;
    CurrentID:=AdoQryCardRec.FieldByName('ID').AsInteger;
  finally
    cmdBusy := false;
    mmRcvCmd.Lines.Delete(0);
  end;
end;

//==400008 家居多路探头报警==

procedure TMainForm.GetSectorAlarm(devStr:string);
var
  i:Integer;
  unitStr,userStr:string;
  alarmAddr,alarmTime,alarmText,alarmTextDetail:string;
  alarmType,alarmState,alarmHandled:Integer;
begin
  try
    unitStr := MidStr(devStr,3,4);
    userStr := MidStr(devStr,7,6);
    userStr := GetUserNO4(userStr);

    alarmType:=1;
    alarmAddr:=unitStr+'-'+userStr;
    alarmState:=0;
    alarmHandled:=0;

    RefreshRec(AdoQryAddr,'select * from t_addr where DevNO='+QuotedStr(alarmAddr));
    alarmAddr := AdoQryAddr.FieldByName('AddrName').AsString + '('+alarmAddr+')';

    alarmText:=MidStr(devStr,15,2); //报警内容
    if alarmText='01' then
      alarmText:='过压报警'
    else if alarmText='02' then
      alarmText:='防移离报警'
    else if alarmText='10' then
      alarmText:='第1路无线防区探头欠压'
    else if alarmText='20' then
      alarmText:='第2路无线防区探头欠压'
    else if alarmText='30' then
      alarmText:='第3路无线防区探头欠压'
    else if alarmText='40' then
      alarmText:='第4路无线防区探头欠压'
    else if alarmText='50' then
      alarmText:='第5路无线防区探头欠压'
    else if alarmText='60' then
      alarmText:='第6路无线防区探头欠压'
    else if alarmText='70' then
      alarmText:='第7路无线防区探头欠压'
    else if alarmText='80' then
      alarmText:='第8路无线防区探头欠压'
    else if alarmText='F0' then
      alarmText:='市电正常'
    else if alarmText='E0' then
      alarmText:='市电断电'
    else if alarmText='D0' then
      alarmText:='电池正常'
    else if alarmText='C0' then
      alarmText:='电池低压'
    else if alarmText='00' then
    begin
      alarmText:='第';
      alarmTextDetail:=MidStr(devStr,17,4);
      alarmTextDetail:=HexToBinary(alarmTextDetail);
      for i:=Length(alarmTextDetail) downto 1 do
      begin
        if MidStr(alarmTextDetail,i,1)='1' then
        begin
          if alarmText<>'第' then
            alarmText:=alarmText+'、';
          alarmText:=alarmText+IntToStr(17-i);
        end;
      end;
      alarmText:=alarmText+'路防区触发报警';
    end
    else
      alarmText:='未知';

    if ComType=0 then
      alarmTime:=GetCmdTime(MidStr(devStr,27,12))
    else if ComType=1 then
      alarmTime:=FormatDateTime('YYYY-MM-DD hh:mm',Now());

    ExecSQL('insert into t_alarm(AddrName,AlarmType,AlarmStatus,AlarmTime,AlarmText,AlarmSolved) values('+QuotedStr(alarmAddr)+','+IntToStr(alarmType)+','+IntToStr(alarmState)+','+QuotedStr(alarmTime)+','+QuotedStr(alarmText)+','+IntToStr(alarmHandled)+')');
    RefreshRec(AdoQryAlarm,'select * from t_alarm order by AlarmTime DESC,ID DESC');
  finally
    cmdBusy:=false;
    mmRcvCmd.Lines.Delete(0);
  end;
end;

//==410008 分机求助报警==

procedure TMainForm.GetAlarmRec(devStr:string);
var
  unitStr,userStr:string;
  alarmAddr,alarmTime,alarmText:string;
  alarmType,alarmState,alarmHandled:integer;
begin
  try
    unitStr := MidStr(devStr,3,4);
    userStr := MidStr(devStr,7,6);
    userStr := GetUserNO4(userStr);
    alarmType:=0;
    alarmAddr:=unitStr+'-'+userStr;
    alarmState:=0;

    RefreshRec(AdoQryAddr,'select * from t_addr where DevNO='+QuotedStr(alarmAddr));
    alarmAddr := AdoQryAddr.FieldByName('AddrName').AsString + '('+alarmAddr+')';

    if ComType=0 then
      alarmTime:=GetCmdTime(MidStr(devStr,27,12))
    else if ComType=1 then
      alarmTime:=FormatDateTime('YYYY-MM-DD hh:mm',Now());
    alarmText:='';
    alarmHandled:=0;

    ExecSQL('insert into t_alarm(AddrName,AlarmType,AlarmStatus,AlarmTime,AlarmText,AlarmSolved) values('+QuotedStr(alarmAddr)+','+IntToStr(alarmType)+','+IntToStr(alarmState)+','+QuotedStr(alarmTime)+','+QuotedStr(alarmText)+','+IntToStr(alarmHandled)+')');

    RefreshRec(AdoQryAlarm,'select * from t_alarm order by AlarmTime DESC,ID DESC');
  finally
    cmdBusy := false;
    mmRcvCmd.Lines.Delete(0);
  end;
end;

//==420008 主机、分机上电==

procedure TMainForm.GetDevReset(devStr: string);
var
  S5,S3:string;
  unitStr,userStr,coreStr:string;//-单元主机、用户分机、中心管理机-
  m:integer;
begin
  //如果是分机上电，42前面是00则是分机上电，是01则是分机回复送号指令
  //分机上电:XX 主机XX XX 分机XX XX XX 00 00 00 00 42 00 08
  //主机上电:XX 主机XX XX 分机XX XX XX MM MM 00 00 42 00 08  [MM MM为管理机号码]
  try
    S5 := MidStr(devStr,13,10);
    S3 := MidStr(devStr,17,6);
    if S5 = '0000000042' then
    begin //分机上电
      unitStr := MidStr(devStr,3,4);
      userStr := MidStr(devStr,7,6);
      userStr := GetuserNO4(userStr);

      userStr := unitStr+'-'+userStr;
      memo2.Lines.Append(lang_UserON+':'+userStr);

      m := Get_RecCount('select * from t_dev where DevNO = '+QuotedStr(userStr));
      if m = 0 then ExecSql('insert into t_dev (DevNo,DevType) values ('+QuotedStr(userStr)+',3)');
    end
    else if S3 = '000042' then
    begin //主机上电
      unitStr := MidStr(devStr,3,4);
      userStr := MidStr(devStr,7,6);
      userStr := GetUserNO4(userStr);

      if Get_RecCount('select * from t_unit where UnitNO='+QuotedStr(unitStr))<1 then
        ExecSQL('insert into t_unit(UnitNO,UnitChosen) values('+QuotedStr(unitStr)+',0)');
      RefreshRec(AdoQryUnitMac,'select * from t_unit');

      unitStr := unitStr+'-'+userStr;
      coreStr := MidStr(devStr,13,4)+'-0000';
      memo2.Lines.Append(lang_UnitON+':'+unitStr+','+lang_devType0+':'+coreStr);

      m := Get_RecCount('select * from t_dev where DevNO = '+QuotedStr(unitStr));
      if m = 0 then ExecSql('insert into t_dev (DevNo,DevType) values ('+QuotedStr(unitStr)+',1)');

      m := Get_RecCount('select * from t_dev where DevNO = '+QuotedStr(coreStr));
      if m = 0 then ExecSql('insert into t_dev (DevNo,DevType) values ('+QuotedStr(coreStr)+',0)');
    end;

    RefreshRec(AdoQryDev,'select * from t_dev');
  finally
    cmdBusy := false;
    mmRcvCmd.Lines.Delete(0);
  end;
end;

//==430008 分机布、撤防报警==

procedure TMainForm.GetSetCancelAlarm(devStr:string);
begin
  cmdBusy:=false;
  Memo5.Lines.Add(devStr);
  mmRcvCmd.Lines.Delete(0);
end;

//==4C0008 用户胁迫开门报警==

procedure TMainForm.GetStressOpenAlarm(devStr:string);
var
  unitStr,userStr:string;
  alarmAddr,alarmTime,alarmText:string;
  alarmType,alarmState,alarmHandled:Integer;
begin
  try
    unitStr := MidStr(devStr,3,4);
    userStr := MidStr(devStr,7,6);
    userStr := GetUserNO4(userStr);
    alarmType:=2;
    alarmAddr:=unitStr+'-'+userStr;

    RefreshRec(AdoQryAddr,'select * from t_addr where DevNO='+QuotedStr(alarmAddr));
    alarmAddr := AdoQryAddr.FieldByName('AddrName').AsString + '('+alarmAddr+')';

    alarmState:=0;
    if ComType=0 then
      alarmTime:=GetCmdTime(MidStr(devStr,27,12))
    else if ComType=1 then
      alarmTime:=FormatDateTime('YYYY-MM-DD hh:mm',Now());
    alarmText:='';
    alarmHandled:=0;

    ExecSQL('insert into t_alarm(AddrName,AlarmType,AlarmStatus,AlarmTime,AlarmText,AlarmSolved) values('+QuotedStr(alarmAddr)+','+IntToStr(alarmType)+','+IntToStr(alarmState)+','+QuotedStr(alarmTime)+','+QuotedStr(alarmText)+','+IntToStr(alarmHandled)+')');

    RefreshRec(AdoQryAlarm,'select * from t_alarm order by AlarmTime DESC,ID DESC');
  finally
    cmdBusy:=false;
    mmRcvCmd.Lines.Delete(0);
  end;
end;



//===============8、其他模块===============

//=====8.1 通信过程=====

//===8.1.1 串口通讯===

//==(Comm1)==
procedure TMainForm.Comm1ReceiveData(Sender: TObject; Buffer: Pointer;BufferLength: Word);
var
  i,k:integer;
  recvstr:string;
  rbuf:pchar;
begin
  GetMem(rbuf,BufferLength+1);
  for k:=0 to BufferLength do
    rbuf[k]:=char(0);

  move(Buffer^,rbuf^,Bufferlength);
  recvstr:='';
  for i:=1 to Bufferlength do
  begin
    recvstr:=recvstr+IntToHex(byte(rbuf[i-1]),2);
  end;

  if (recvStr = 'EE') and (isClear=false) then
  begin
    if mmSendCmd.Lines.Strings[0] <> '' then
    begin
      SendCmd(mmSendCmd.Lines.Strings[0]);
    end
    else begin
      SendFB;
      mmSendCmd.Lines.Clear;
    end;

    Inc(intHand);

    {网络版}
    //Timer1.Enabled:=true;
    //if isSend = true then
    if (isExtract=false) and (isSend=true) then
      ExtractCmd;

  end

  else if recvstr = 'FA' then
  begin
    mmSendCmd.Lines.Delete(0);
    if mmSendCmd.Lines.Strings[0] <> '' then
      SendCmd(mmSendCmd.Lines.Strings[0]);
  end

  else if recvstr = 'F9' then
  begin
    SendCmd(mmSendCmd.Lines.Strings[0]);
  end

  else
  begin
    inc(intRcv);

    if Test='true' then
    begin
      Memo3.Visible:=true;
      Memo3.Lines.Append(recvstr);
    end;

    if Length(recvstr) > 38 then
      recvstr := StrDelHeadTail(recvstr,'EE');
    if length(recvStr) = 38 then
    begin
      //校验
      if GetSum(recvStr) = 0 then
      begin
        inc(intOK);
        mmRcvCmd.Lines.Append(recvstr);
        Memo1.Lines.Append(lang_note_Receive+StringAddSpace(recvstr));
        SendFA;
      end
      else begin
        inc(intErr);
        Memo1.Lines.Append(lang_note_Error+StringAddSpace(recvstr));
        SendF9;
      end;
    end;
  end;
  ShowTips;
end;

//==串口发送指令==
procedure TMainForm.SendCmd(CmdStr: String);
var
  TempCmdStr:string;
  i,j,k:Integer;
  SendBuf:array[1..128] of byte;
  sendstr:string;
begin
  TempCmdStr:=StringReplace(CmdStr,' ','',[rfReplaceAll]);
  k := Length(TempCmdStr) div 2;
  for i:=1 to k do
  begin
    SendBuf[i]:=byte(StrToInt('$'+midstr(TempCmdStr,i*2-1,2)));
  end;

  sendstr:='';

  for j := 1 to k do
  begin
    if not Comm1.WriteCommData(@SendBuf[j],1) then
    begin
      sb_tips.Panels[2].Text := lang_msg_NoSent;
      break;
    end;
    sendstr:=sendstr+IntTohex(SendBuf[j],2)+' ';
  end;
  inc(intSend);
  memo2.Lines.Append(lang_note_Send+sendstr);
end;

//==SendFB==
procedure TMainForm.SendFB; 
var
  SendBuf:array [1..2] of byte;
begin
  SendBuf[1] := byte($FB);
  Comm1.WriteCommData(@SendBuf[1],1);
end;

//==SendFA==
procedure TMainForm.SendFA;
var
  SendBuf:array [1..2] of byte;
begin
  SendBuf[1] := byte($FA);
  Comm1.WriteCommData(@SendBuf[1],1);
end;

//==SendF9==
procedure TMainForm.SendF9;
var
  SendBuf:array [1..2] of byte;
begin
  SendBuf[1] := byte($F9);
  Comm1.WriteCommData(@SendBuf[1],1);
end;

//==SendFC==
procedure TMainForm.SendFC;
var
  SendBuf:array [1..2] of byte;
begin
  SendBuf[1] := byte($FC);
  Comm1.WriteCommData(@SendBuf[1],1);
end;

//===8.1.2 网络通讯===

//==UDP广播--IPMCastClient(采用TIdIPMCastClient控件)==

//-接收广播消息并应答-
procedure TMainForm.IPMCastClientIPMCastRead(Sender: TObject;
  AData: TStream; ABinding: TIdSocketHandle);
var
  DataStringStream:TStringStream;
  RcvStr:string;
  UDPClient:TIdUDPClient;
begin
  LocalIP:=IPWatch.LocalIP;
  DataStringStream:=TStringStream.Create('');
  DataStringStream.CopyFrom(AData,AData.Size);
  RcvStr:=DataStringStream.DataString;
  if RcvStr=ManageNumber then
  begin
    //Memo5.Lines.Add(RcvStr);
    UDPClient:=TIdUDPClient.Create(nil);
    UDPClient.Host := ABinding.PeerIP;
    UDPClient.Port := ABinding.PeerPort;
    UDPClient.Active:=true;
    UDPClient.Send(LocalIP+'?16');
    UDPClient.Active:=false;
    UDPClient.Destroy;
  end;
end;

//==TCP通信--TCPServer(采用TIdTCPServer控件)==

//-客户端与TCPServer建立连接-
procedure TMainForm.TCPServerConnect(AThread: TIdPeerThread);
begin
  ConnectedIP   := AThread.Connection.Socket.Binding.PeerIP;
  ConnectedPort := AThread.Connection.Socket.Binding.PeerPort;
  if Connection=nil then
    Connection  := TIdTCPConnection.Create(nil);
  Connection  := AThread.Connection;
end;

//-TCPServer拆除与客户端的连接-
procedure TMainForm.TCPServerDisconnect(AThread: TIdPeerThread);
var
  i:integer;
begin
  {try
    with TCPServer.Threads.LockList do
    begin
      for i:=0 to Count-1 do
      begin
        try
          AThread := Items[i];
          AThread.Terminate;
          AThread.Connection.Disconnect;
        except
        end;
      end;
    end;
    ShowMessage('服务已关闭！');
  finally
    TCPServer.Threads.UnlockList;
    TCPServer.Active:=false;
  end;}
end;

//-TCPServer接收来自客户端的数据-
procedure TMainForm.TCPServerExecute(AThread: TIdPeerThread);
begin
  RcvString:=RcvString+IntToHex(Ord(AThread.Connection.ReadChar),2);
  TCPServer.Active:=true;
end;

//-实时处理TCPServer接收到的数据-
procedure TMainForm.Timer3Timer(Sender: TObject);
var
  LenStr:string;
  LenInt,RcvLen:Integer;
  CmdStr,DataType:string;
  Confirm:byte;
  SendStream,PacketData_stream:TmemoryStream;
  ImageBytes:array of byte;
  i:Integer;
  ID:THandle;
  ImageThread:TImageThread;
begin
  try
        if RcvString='00' then
        begin
                RcvStream:='';
                RcvString:='';
        end
        else if RcvString='01' then
        begin
                RcvStream:='';
                RcvString:='';
        end
        else if RcvString<>'' then
        begin
                DataType:=LeftStr(RcvString,2);
                LenStr:=MidStr(RcvString,19,2);
                LenInt:=StrToInt('$'+LenStr);
                RcvLen:=2*(LenInt+7);
                if (DataType='02') and (Length(RcvString)=RcvLen) then //L8系统串口数据包的数据上传
                begin
                        //Memo5.Lines.Add(RcvString);
                        CmdStr:=RightStr(RcvString,2*(LenInt-10));
                        CmdStr:=RightStr(CmdStr,2*(LenInt-10)-4);
                        //Memo5.Lines.Append(CmdStr);
                        mmRcvCmd.Lines.Append(CmdStr);

                        RcvStream:='';
                        RcvString:='';

                        Confirm:=$01;
                        SendStream:=TMemoryStream.Create;
                        SendStream.Write(Confirm,1);
                        Connection.WriteStream(SendStream,true,false);
                        SendStream.Free;
                end
                else if DataType='01' then //图像抓拍上传
                begin
                        LenStr:=MidStr(RcvString,9,2)+MidStr(RcvString,7,2)+MidStr(RcvString,5,2)+MidStr(RcvString,3,2);
                        LenInt:=2*StrToInt('$'+LenStr);

                        if Length(RcvString)=LenInt then
                        begin
                                CmdStr:=MidStr(RcvString,39,26);
                                mmRcvCmd.Lines.Append(CmdStr);

                                Confirm:=$01;
                                SendStream:=TMemoryStream.Create;
                                SendStream.Write(Confirm,1);
                                Connection.WriteStream(SendStream,true,false);
                                SendStream.Free;

                                ImageThread:=TImageThread.Create(false);
                                ImageThread.Execute;

                                RcvStream:='';
                                RcvString:='';

                                Timer3.Enabled:=true;
                        end;
                end;
        end;
  except
    TCPServer.Active:=true;
  end;
end;

//-启动图像处理线程-
procedure TImageThread.Execute;
begin
  Run;
end;

//-图像处理线程的具体操作(图像存储至数据库)-
procedure TImageThread.Run;
var
  i,j,LenInt,RecID,Times,Remain:Integer;
  ImageStr,TmpStr,LenStr:string;
  ImageBytes:array of byte;
  PacketStream:TMemoryStream;
begin
  try
        FreeOnTerminate:=true;

        RecID:=CurrentID;
        ImageStr:=RcvString;
        RcvString:='';

        LenStr:=MidStr(ImageStr,71,2)+MidStr(ImageStr,69,2)+MidStr(ImageStr,67,2)+MidStr(ImageStr,65,2);
  
        LenInt:=StrToInt('$'+LenStr);

        Times:=LenInt div 4096;
        Remain:=LenInt mod 4096;

        ImageStr:=RightStr(ImageStr,2*LenInt);

        SetLength(ImageBytes,4096);
        PacketStream:=TMemoryStream.Create;
        PacketStream.Position:=0;

        for i:=1 to Times do
        begin
                TmpStr:=LeftStr(ImageStr,4096*2);
                ImageStr:=MidStr(ImageStr,4096*2+1,2*(LenInt-4096));

                for j:=0 to 4096-1 do
                begin
                        Application.ProcessMessages;
                        ImageBytes[j]:=Byte(StrToInt('0x'+MidStr(TmpStr,j*2+1,2)));
                        PacketStream.Write(ImageBytes[j],1);
                end;
        end;

        SetLength(ImageBytes,0);
        SetLength(ImageBytes,Remain);

        for j:=0 to Remain-1 do
        begin
                Application.ProcessMessages;
                ImageBytes[j]:=Byte(StrToInt('0x'+MidStr(ImageStr,j*2+1,2)));
                PacketStream.Write(ImageBytes[j],1);
        end;

        SetLength(ImageBytes,0);
        ImageBYtes:=nil;

        PacketStream.Position:=0;

        with MainForm.AdoQryCardRec do
        begin
                Close;
                Open;
                SQL.Clear;
                SQL.Add('select * from t_CardRec where ID='+IntToStr(RecID)+' order by RecTime DESC,ID DESC');
                Active:=true;
                First;
                Edit;
                (FieldByName('Screenshot') as TBlobField).LoadFromStream(PacketStream);
                Post;
        end;

        RefreshRec(MainForm.AdoQryCardRec,'select * from t_CardRec order by RecTime DESC,ID DESC');
  except
    
  end;
end;

//-网络通讯发送数据包-
function TMainForm.SendPacket(CmdStr:string):Boolean;
var
  i,sum:integer;
  CmdType:byte;
  DataLen:integer;
  dest_id:string;
  command_s:array[0..14] of byte;
  packetdata:array[0..24] of byte;
  SendStream,PacketData_stream:TmemoryStream;
  PacketCount:integer;
  Client:TIdTCPClient;
begin
  CmdType:=$02;

  for i:=0 to 14 do
    command_s[i]:=byte(StrToInt('0x'+MidStr(CmdStr,i*2+1,2)));

  for i:=0 to 24 do
    packetdata[i]:=0;

  for i:=0 to 14 do
    packetdata[i+10]:=command_s[i];

  packetdata[0]:=$A1;
  packetdata[1]:=$01;
  packetdata[2]:=$19;
  packetdata[3]:=$A5;
  packetdata[4]:=$00;
  packetdata[5]:=command_s[8];
  packetdata[6]:=command_s[9];
  packetdata[7]:=command_s[10];
  packetdata[8]:=command_s[11];
  packetdata[9]:=command_s[12];

  sum:=0;
  for i:=0 to 9 do
    sum:=sum+Integer(packetdata[i]);
  packetdata[4]:=($FF)-byte(sum)+1;

  PacketData_Stream:=TMemoryStream.Create;
  PacketData_Stream.Write(packetdata,25);
  PacketCount:=1;
  DataLen:=PacketData_Stream.Size+7;

  SendStream:=TMemoryStream.Create;
  SendStream.Write(CmdType,1);
  SendStream.Write(DataLen,4);
  SendStream.Write(PacketCount,2);
  PacketData_Stream.Position:=0;
  SendStream.CopyFrom(PacketData_Stream,DataLen-7);
  PacketData_Stream.Free;

  Client:=TIdTCPClient.Create(nil);
  Client.Disconnect;
  Client.Host:=ClientIP;
  Client.Port:=StrToInt(SendPort);
  try
    Client.Connect(5000);
  except
    ShowMessage('目的IP地址'+ClientIP+'：'+lang_msg_LinkTimeout);
    Client.Free;
    Result:=false;
    Exit;
  end;

  if Client.Connected then
  begin
    try
      Client.WriteStream(SendStream,true,false);
      SendStream.Free;
      Result:=true;
      while IntToHex(Ord(Client.ReadChar),2)<>'01' do
      begin
        delay(120);
      end;
    except
      ShowMessage(lang_msg_NoSent);
      Result:=false;
      Client.Destroy;
      Exit;
    end;
  end
  else begin
    ShowMessage(lang_msg_LinkFail);
    Client.Destroy;
    Result:=false;
    Exit;
  end;
  Client.Destroy;
end;

//===8.1.3 提取数据库中的未发送指令===

//==实时监测,等待执行提取指令的操作==
procedure TMainForm.Timer1Timer(Sender: TObject);
begin
  if isSend = true then
    ExtractCmd;
end;

//==提取未发送指令==
procedure TMainForm.ExtractCmd;
var
  CmdStr:string;
  UnitStr:string;
  sendTime:string;
begin
  RefreshRec(AdoQryCmd,'select * from t_cmd where sent=0 order by unitMac,ID');

  if (AdoQryCmd.RecordCount>0) and (ComType=0) then
  begin
    progressbar_cmd.Visible := true;
    progressbar_cmd.Max := AdoQryCmd.RecordCount;
    progressbar_cmd.Position := 0;
    isExtract := true;

    with AdoQryCmd do
    begin
      First;
      while not EOF do
      begin
        while mmSendCmd.Lines.Count>0 do
        begin
          delay(60);
        end;

        sb_tips.Panels[2].Text := lang_msg_CmdSending;
        Screen.Cursor := crHourGlass;
        delay(1);
        sb_tips.Panels[2].Text := lang_msg_CmdSending+'.';
        delay(1);
        sb_tips.Panels[2].Text := lang_msg_CmdSending+'..';
        delay(1);
        sb_tips.Panels[2].Text := lang_msg_CmdSending+'...';
        delay(1);

        if AdoQryCmd.FieldByName('cmdType').AsInteger=31 then
        begin
          SendCmd(AdoQryCmd.FieldByName('cmdStr').AsString);
          sendTime:=FormatDateTime('YYYY-MM-DD hh:mm:SS',Now());

          Edit;
          AdoQryCmd.FieldByName('sent').AsInteger   :=1;
          AdoQryCmd.FieldByName('sendTime').AsString:=sendTime;
          Post;

          AdoCon.Execute('update t_card set CardState=0 where unitMac='+QuotedStr(AdoQryCmd.FieldByName('unitMac').AsString));

          RefreshRec(AdoQryCard,'select * from t_card');
          RefreshRec(AdoQryPerson,'select * from t_card where CardNO='+QuotedStr(FieldByName('CardNO').AsString)+' and unitMac='+QuotedStr(FieldByName('unitMac').AsString)+' and userMac='+QuotedStr(FieldByName('userMac').AsString));
          RefreshRec(AdoQrypCard,'select * from t_card as A where unitMac=(select Min(unitMac) from t_card where CardNO=A.CardNO) and userMac='+QuotedStr(FieldByName('userMac').AsString));
          RefreshRec(AdoQrySent,'select * from t_cmd where sent=1 order by sendTime DESC,ID DESC');
          RefreshRec(AdoQryNotSent,'select * from t_cmd where sent=0 or sent=2 order by ID');

          isClear:=true;
          delay(5000);
          delay(5000);
          delay(5000);
          isClear:=false;
        end
        else begin
          mmSendCmd.Lines.Append(AdoQryCmd.FieldByName('cmdStr').AsString);
          sendTime:=FormatDateTime('YYYY-MM-DD hh:mm:SS',Now());

          Edit;
          AdoQryCmd.FieldByName('sent').AsInteger   :=1;
          AdoQryCmd.FieldByName('sendTime').AsString:=sendTime;
          Post;

          if AdoQryCmd.FieldByName('cmdType').AsInteger=0 then
          begin
            AdoCon.Execute('update t_card set CardState=1 where CardNO='+QuotedStr(FieldByName('CardNO').AsString)+' and unitMac='+QuotedStr(FieldByName('unitMac').AsString)+' and userMac='+QuotedStr(FieldByName('userMac').AsString));
          end;

          if AdoQryCmd.FieldByName('cmdType').AsInteger=1 then
          begin
            AdoCon.Execute('update t_card set CardState=0 where CardNO='+QuotedStr(FieldByName('CardNO').AsString)+' and unitMac='+QuotedStr(FieldByName('unitMac').AsString)+' and userMac='+QuotedStr(FieldByName('userMac').AsString));
          end;

          RefreshRec(AdoQryCard,'select * from t_card');
          RefreshRec(AdoQryPerson,'select * from t_card where CardNO='+QuotedStr(FieldByName('CardNO').AsString)+' and unitMac='+QuotedStr(FieldByName('unitMac').AsString)+' and userMac='+QuotedStr(FieldByName('userMac').AsString));
          RefreshRec(AdoQrypCard,'select * from t_card as A where unitMac=(select Min(unitMac) from t_card where CardNO=A.CardNO) and userMac='+QuotedStr(FieldByName('userMac').AsString));
          RefreshRec(AdoQrySent,'select * from t_cmd where sent=1 order by sendTime DESC,ID DESC');
          RefreshRec(AdoQryNotSent,'select * from t_cmd where sent=0 or sent=2 order by ID');
        end;

        progressbar_cmd.Position := progressbar_cmd.Position+1;
        sb_tips.Panels[4].Text := IntToStr((100*progressbar_cmd.Position) div progressbar_cmd.Max)+'%';

        if AdoQryCmd.FieldByName('cmdType').AsInteger=2 then
        begin
          isRead:=true;
        end;

        while mmSendCmd.Lines.Count>0 do
        begin
          delay(60);
        end;

        Next;
      end;
      isExtract := false;
    end
  end
  else if (AdoQryCmd.RecordCount>0) and (ComType=1) then
  begin
    progressbar_cmd.Visible := true;
    progressbar_cmd.Max := AdoQryCmd.RecordCount;
    progressbar_cmd.Position := 0;

    with AdoQryCmd do
    begin
      First;
      Timer1.Enabled:=false;
      while not EOF do
      begin
        //delay(120);

        sb_tips.Panels[2].Text := lang_msg_CmdSending;
        Screen.Cursor := crHourGlass;
        delay(1);
        sb_tips.Panels[2].Text := lang_msg_CmdSending+'.';
        delay(1);
        sb_tips.Panels[2].Text := lang_msg_CmdSending+'..';
        delay(1);
        sb_tips.Panels[2].Text := lang_msg_CmdSending+'...';
        delay(1);

        CmdStr:=AdoQryCmd.FieldByName('cmdStr').AsString;
        UnitStr:=FieldByName('unitMac').AsString+'-0000';
        with MainForm.AdoQryIP do
        begin
          SQL.Clear;
          SQL.Add('select * from t_dev where DevNO='+QuotedStr(UnitStr));
          Open;
          ClientIP:=FieldByName('IP').AsString;
          if (ClientIP=null) or (ClientIP='') then
          begin
            Showmessage('设备'+UnitStr+'：IP地址为空！请先在设备信息页面中进行设置！');
            Screen.Cursor := crDefault;

            progressbar_cmd.Max := 0;
            progressbar_cmd.Position := 0;
            progressbar_cmd.Visible := false;
            sb_tips.Panels[4].Text := '';

            sb_tips.Panels[2].Text := lang_msg_NoSent;
            Exit;
          end;
        end;
        CmdStr:='F708'+MidStr(CmdStr,3,26);

        if AdoQryCmd.FieldByName('cmdType').AsInteger=31 then
        begin

          if SendPacket(CmdStr)=false then
          begin
            Screen.Cursor := crDefault;

            progressbar_cmd.Max := 0;
            progressbar_cmd.Position := 0;
            progressbar_cmd.Visible := false;
            sb_tips.Panels[4].Text := '';

            sb_tips.Panels[2].Text := lang_msg_NoSent;

            Exit;
          end;

          sendTime:=FormatDateTime('YYYY-MM-DD hh:mm:SS',Now());

          Edit;
          AdoQryCmd.FieldByName('sent').AsInteger   :=1;
          AdoQryCmd.FieldByName('sendTime').AsString:=sendTime;
          Post;

          if AdoQryCmd.FieldByName('cmdType').AsInteger=31 then
          begin
            AdoCon.Execute('update t_card set CardState=0 where unitMac='+QuotedStr(AdoQryCmd.FieldByName('unitMac').AsString));
          end;

          RefreshRec(AdoQryCard,'select * from t_card');
          RefreshRec(AdoQryPerson,'select * from t_card where CardNO='+QuotedStr(FieldByName('CardNO').AsString)+' and unitMac='+QuotedStr(FieldByName('unitMac').AsString)+' and userMac='+QuotedStr(FieldByName('userMac').AsString));
          RefreshRec(AdoQrypCard,'select * from t_card as A where unitMac=(select Min(unitMac) from t_card where CardNO=A.CardNO) and userMac='+QuotedStr(FieldByName('userMac').AsString));
          RefreshRec(AdoQrySent,'select * from t_cmd where sent=1 order by sendTime DESC,ID DESC');
          RefreshRec(AdoQryNotSent,'select * from t_cmd where sent=0 or sent=2 order by ID');

          delay(5000);
          delay(5000);
          delay(5000);
        end
        else begin

          if SendPacket(CmdStr)=false then
          begin
            Edit;
            AdoQryCmd.FieldByName('sent').AsInteger   :=2;
            AdoQryCmd.FieldByName('sendTime').AsString:='下发失败！';
            Post;

            AdoCon.Execute('update t_cmd set sent=2,sendTime='+QuotedStr('下发失败！')+' where unitMac='+QuotedStr(AdoQryCmd.FieldByName('unitMac').AsString));

            RefreshRec(AdoQrySent,'select * from t_cmd where sent=1 order by sendTime DESC,ID DESC');
            RefreshRec(AdoQryNotSent,'select * from t_cmd where sent=0 or sent=2 order by ID');
            Timer1.Enabled := true;
            Exit;
          end
          else begin

          sendTime:=FormatDateTime('YYYY-MM-DD hh:mm:SS',Now());

          Edit;
          AdoQryCmd.FieldByName('sent').AsInteger   :=1;
          AdoQryCmd.FieldByName('sendTime').AsString:=sendTime;
          Post;

          if AdoQryCmd.FieldByName('cmdType').AsInteger=0 then
          begin
            AdoCon.Execute('update t_card set CardState=1 where CardNO='+QuotedStr(FieldByName('CardNO').AsString)+' and unitMac='+QuotedStr(FieldByName('unitMac').AsString)+' and userMac='+QuotedStr(FieldByName('userMac').AsString));
          end;

          if AdoQryCmd.FieldByName('cmdType').AsInteger=1 then
          begin
            AdoCon.Execute('update t_card set CardState=0 where CardNO='+QuotedStr(FieldByName('CardNO').AsString)+' and unitMac='+QuotedStr(FieldByName('unitMac').AsString)+' and userMac='+QuotedStr(FieldByName('userMac').AsString));
          end;

          RefreshRec(AdoQryCard,'select * from t_card');
          RefreshRec(AdoQryPerson,'select * from t_card where CardNO='+QuotedStr(FieldByName('CardNO').AsString)+' and unitMac='+QuotedStr(FieldByName('unitMac').AsString)+' and userMac='+QuotedStr(FieldByName('userMac').AsString));
          RefreshRec(AdoQrypCard,'select * from t_card as A where unitMac=(select Min(unitMac) from t_card where CardNO=A.CardNO) and userMac='+QuotedStr(FieldByName('userMac').AsString));
          RefreshRec(AdoQrySent,'select * from t_cmd where sent=1 order by sendTime DESC,ID DESC');
          RefreshRec(AdoQryNotSent,'select * from t_cmd where sent=0 or sent=2 order by ID');

          end;
        end;

        progressbar_cmd.Position:=progressbar_cmd.Position+1;
        sb_tips.Panels[4].Text := IntToStr((100*progressbar_cmd.Position) div progressbar_cmd.Max)+'%';

        Next;
      end;
      Timer1.Enabled:=true;
    end;
  end
  else if AdoQryCmd.RecordCount<1 then
  begin
    sb_tips.Panels[2].Text := lang_msg_CmdSentOver;
    Screen.Cursor := crDefault;
  end;
  AdoCon.Execute('delete from t_cmd where cmdStr is null');
  RefreshRec(AdoQryCmd,'select * from t_cmd where sent=0 order by unitMac,ID');

  progressbar_cmd.Max := 0;
  progressbar_cmd.Position := 0;
  progressbar_cmd.Visible := false;
  sb_tips.Panels[4].Text := '';
end;

//=====8.2 数据转换事件(AdoQry)=====

//--AdoQryPerson--
procedure TMainForm.AdoQryPersonCardStateGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);//卡状态
begin
  if Sender.Value=0 then
    Text:=lang_stateInvalid
  else if Sender.Value=1 then
    Text:=lang_stateValid
  else
    Text:=lang_stateUnknown;
end;

//--AdoQryDev--
procedure TMainForm.AdoQryDevDevTypeGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);//设备类型
begin
  if Sender.Value=0 then
    Text:=lang_devType0
  else if Sender.Value=1 then
    Text:=lang_devType1
  else if Sender.Value=2 then
    Text:=lang_devType2
  else if Sender.Value=3 then
    Text:=lang_devType3
  else if Sender.Value=4 then
    Text:=lang_devType4
  else
    Text:='';
end;

//--AdoQryAlarm--
procedure TMainForm.AdoQryAlarmAlarmTypeGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);//报警类型
begin
  if Sender.Value=0 then
    Text:=lang_alarmType0
  else if Sender.Value=1 then
    Text:=lang_alarmType4
  else if Sender.Value=2 then
    Text:='胁迫开门报警'
  else if Sender.Value=3 then
    Text:='开门超时报警'
  else
    Text:='';
end;
procedure TMainForm.AdoQryAlarmAlarmStatusGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);//状态
begin
  if Sender.Value=0 then
    Text:=lang_alarmState0
  else if Sender.Value=1 then
    Text:=lang_alarmState1
  else
    Text:='';
end;
procedure TMainForm.AdoQryAlarmAlarmSolvedGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);//处理情况
begin
  if Sender.Value=0 then
    Text:=lang_alarmState2
  else if Sender.Value=1 then
    Text:=lang_alarmState3
  else
    Text:='';
end;

//--AdoQryCardRec--
procedure TMainForm.AdoQryCardRecCardTypeGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);//门禁类型
begin
  if Sender.Value<>null then
  begin
    case Sender.Value of
    0:Text:=lang_cardTypeV+'/'+lang_cardTypeC;
    1:Text:=lang_cardTypeV+'/'+lang_cardType3;
    2:Text:=lang_cardTypeX+'/'+lang_cardTypeC;
    3:Text:=lang_cardTypeX+'/'+lang_cardType3;
    4:Text:='主机密码开门';
    5:Text:='主机呼叫(抓拍)';
    6:Text:='主机呼叫(振铃)';
    7:Text:='主机呼叫(摘机)';
    8:Text:='主机呼叫(开门)';
    else
      Text:=lang_cardTypeU;
    end;
  end;
end;
procedure TMainForm.AdoQryCardRecScreenshotGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);//抓拍图像
begin
  if not AdoQryCardRec.FieldByName('Screenshot').IsNull then
    Text:='双击显示'
  else
    Text:='';
end;

//--AdoQryRegCards--
procedure TMainForm.AdoQryRegCardsCardTypeGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);//卡类型
begin
  if Sender.Value=0 then
    Text:=lang_cardType0
  else if Sender.Value=1 then
    Text:=lang_cardType1
  else if Sender.Value=2 then
    Text:=lang_cardType2
  else if Sender.Value=3 then
    Text:=lang_cardType3
  else
    Text:=lang_cardTypeU;
end;
procedure TMainForm.AdoQryRegCardsuserMacGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);//分机号
begin
  if Sender.Value='10000' then
    Text:='系统号'
  else if Sender.Value<>null then
    Text:=Sender.Value;
end;

//--AdoQryCancelCards--
procedure TMainForm.AdoQryCancelCardsuserMacGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);//分机号
begin
  if Sender.Value='10000' then
    Text:='系统号'
  else if Sender.Value<>null then
    Text:=Sender.Value;
end;

//--AdoQryReadCards--
procedure TMainForm.AdoQryReadCardsuserMacGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);//分机号
begin
  if Sender.Value='10000' then
    Text:='系统号'
  else if Sender.Value<>null then
    Text:=Sender.Value;
end;

//--AdoQryCard--
procedure TMainForm.AdoQryCardCardStateGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);//卡状态
begin
  if Sender.Value=0 then
    Text:=lang_stateInvalid
  else if Sender.Value=1 then
    Text:=lang_stateValid
  else
    Text:=lang_stateUnknown;
end;
procedure TMainForm.AdoQryCarduserMacGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);//分机号
begin
  if Sender.Value='10000' then
    Text:='系统号'
  else if Sender.Value<>null then
    Text:=Sender.Value;
end;
procedure TMainForm.AdoQryCardisWallGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);//是否围墙机
begin
  if Sender.Value=0 then
    Text:='否'
  else if Sender.Value=1 then
    Text:='是'
  else
    Text:='未知';
end;

//--AdoQryWall--
procedure TMainForm.AdoQryWallWallChosenGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);//是否选中
begin
  if Sender.Value=0 then
    Text:=lang_chosenYes
  else if Sender.Value=1 then
    Text:=lang_chosenNo
  else
    Text:='未知';
end;

//--AdoQryUser--
procedure TMainForm.AdoQryUserUserPermissionGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);//账号权限
begin
  if (Sender.Value='管理员') or (Sender.Value='administrator') then
    Text:=lang_userType0
  else if (Sender.Value='访客') or (Sender.Value='guest') then
    Text:=lang_userType1;
end;
procedure TMainForm.AdoQryUserUserPasswordGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);//账号密码
begin
  if Sender.Value<>null then
    Text:=Uncrypt(Sender.Value);
end;

//--AdoQrySent--
procedure TMainForm.AdoQrySentcmdTypeGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);//指令类型
begin
  if Sender.Value <> null then
  begin
    case Sender.Value of
        0:Text:='下载卡';
        1:Text:='注销卡';
        2:Text:='提取卡';
        31:Text:='清除卡开始';
        32:Text:='清除卡结束';
        end;
  end;
end;

//--AdoQryNotSent--
procedure TMainForm.AdoQryNotSentcmdTypeGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);//指令类型
begin
  if Sender.Value <> null then
  begin
    case Sender.Value of
        0:Text:='下载卡';
        1:Text:='注销卡';
        2:Text:='提取卡';
        31:Text:='清除卡开始';
        32:Text:='清除卡结束';
        end;
  end;
end;

//--AdoQryDoor--
{procedure TMainForm.AdoQryDoorDevTypeGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);//设备类型
begin
  if Sender.Value=1 then
    Text:='单元主门'
  else if Sender.Value=2 then
    Text:='单元副门'
  else if Sender.Value=4 then
    Text:='围墙大门'
  else
    Text:='未知';
end;
procedure TMainForm.AdoQryDoorDoorStateGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);//门状态
begin
  if Sender.Value<>null then
  begin
    case Sender.Value of
    0:Text:='强制开门';
    1:Text:='对讲开门';
    2:Text:='密码开门';
    3:Text:='刷卡开门';
    4:Text:='按钮开门';
    10:Text:='关门';
    else
      Text:='未知';
    end;
  end;
end;
procedure TMainForm.AdoQryDoorAddrNameGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);//设备地址
begin
  if Sender.Value<>null then
    Text := Sender.Value+'门';
end;}

//=====8.3 鼠标滚动事件(ApplicationEvents)=====

//--DBGridAddr--
procedure TMainForm.ApplicationEvents1Message(var Msg: tagMSG;
  var Handled: Boolean);
begin
  if  (DBGridAddr.Focused)  And  (Msg.message  =  WM_MOUSEWHEEL)  then
  begin
    if  Msg.wParam  >  0  then
      SendMessage(DBGridAddr.Handle,  WM_KEYDOWN,  VK_UP,  0)
    else
      SendMessage(DBGridAddr.Handle,  WM_KEYDOWN,  VK_DOWN,  0);
    Handled  :=  True;
  end;
end;
//--DBGridDev--
procedure TMainForm.ApplicationEvents2Message(var Msg: tagMSG;
  var Handled: Boolean);
begin
  if  (DBGridDev.Focused)  And  (Msg.message  =  WM_MOUSEWHEEL)  then
  begin
    if  Msg.wParam  >  0  then
      SendMessage(DBGridDev.Handle,  WM_KEYDOWN,  VK_UP,  0)
    else
      SendMessage(DBGridDev.Handle,  WM_KEYDOWN,  VK_DOWN,  0);
    Handled  :=  True;
  end;
end;
//--DBGrid1--
procedure TMainForm.ApplicationEvents3Message(var Msg: tagMSG;
  var Handled: Boolean);
begin
  if  (DBGrid1.Focused)  And  (Msg.message  =  WM_MOUSEWHEEL)  then
  begin
    if  Msg.wParam  >  0  then
      SendMessage(DBGrid1.Handle,  WM_KEYDOWN,  VK_UP,  0)
    else
      SendMessage(DBGrid1.Handle,  WM_KEYDOWN,  VK_DOWN,  0);
    Handled  :=  True;
  end;
end;
//--DBGrid2--
procedure TMainForm.ApplicationEvents4Message(var Msg: tagMSG;
  var Handled: Boolean);
begin
  if  (DBGrid2.Focused)  And  (Msg.message  =  WM_MOUSEWHEEL)  then
  begin
    if  Msg.wParam  >  0  then
      SendMessage(DBGrid2.Handle,  WM_KEYDOWN,  VK_UP,  0)
    else
      SendMessage(DBGrid2.Handle,  WM_KEYDOWN,  VK_DOWN,  0);
    Handled  :=  True;
  end;
end;
//--DBGridReadCards--
procedure TMainForm.ApplicationEvents5Message(var Msg: tagMSG;
  var Handled: Boolean);
begin
  if  (DBGridReadCards.Focused)  And  (Msg.message  =  WM_MOUSEWHEEL)  then
  begin
    if  Msg.wParam  >  0  then
      SendMessage(DBGridReadCards.Handle,  WM_KEYDOWN,  VK_UP,  0)
    else
      SendMessage(DBGridReadCards.Handle,  WM_KEYDOWN,  VK_DOWN,  0);
    Handled  :=  True;
  end;
end;
//--DBGridCardsCenter--
procedure TMainForm.ApplicationEvents6Message(var Msg: tagMSG;
  var Handled: Boolean);
begin
  if  (DBGridCardsCenter.Focused)  And  (Msg.message  =  WM_MOUSEWHEEL)  then
  begin
    if  Msg.wParam  >  0  then
      SendMessage(DBGridCardsCenter.Handle,  WM_KEYDOWN,  VK_UP,  0)
    else
      SendMessage(DBGridCardsCenter.Handle,  WM_KEYDOWN,  VK_DOWN,  0);
    Handled  :=  True;
  end;
end;
//--DBGridAlarmRec--
procedure TMainForm.ApplicationEvents7Message(var Msg: tagMSG;
  var Handled: Boolean);
begin
  if  (DBGridAlarmRec.Focused)  And  (Msg.message  =  WM_MOUSEWHEEL)  then
  begin
    if  Msg.wParam  >  0  then
      SendMessage(DBGridAlarmRec.Handle,  WM_KEYDOWN,  VK_UP,  0)
    else
      SendMessage(DBGridAlarmRec.Handle,  WM_KEYDOWN,  VK_DOWN,  0);
    Handled  :=  True;
  end;
end;
//--DBGridCardRec--
procedure TMainForm.ApplicationEvents8Message(var Msg: tagMSG;
  var Handled: Boolean);
begin
  if  (DBGridCardRec.Focused)  And  (Msg.message  =  WM_MOUSEWHEEL)  then
  begin
    if  Msg.wParam  >  0  then
      SendMessage(DBGridCardRec.Handle,  WM_KEYDOWN,  VK_UP,  0)
    else
      SendMessage(DBGridCardRec.Handle,  WM_KEYDOWN,  VK_DOWN,  0);
    Handled  :=  True;
  end;
end;
//--DBGridSent--
procedure TMainForm.ApplicationEvents9Message(var Msg: tagMSG;
  var Handled: Boolean);
begin
  if  (DBGridSent.Focused)  And  (Msg.message  =  WM_MOUSEWHEEL)  then
  begin
    if  Msg.wParam  >  0  then
      SendMessage(DBGridSent.Handle,  WM_KEYDOWN,  VK_UP,  0)
    else
      SendMessage(DBGridSent.Handle,  WM_KEYDOWN,  VK_DOWN,  0);
    Handled  :=  True;
  end;
end;
//--DBGridNotSent--
procedure TMainForm.ApplicationEvents10Message(var Msg: tagMSG;
  var Handled: Boolean);
begin
  if  (DBGridNotSent.Focused)  And  (Msg.message  =  WM_MOUSEWHEEL)  then
  begin
    if  Msg.wParam  >  0  then
      SendMessage(DBGridNotSent.Handle,  WM_KEYDOWN,  VK_UP,  0)
    else
      SendMessage(DBGridNotSent.Handle,  WM_KEYDOWN,  VK_DOWN,  0);
    Handled  :=  True;
  end;
end;
//--DBGridpCard--
procedure TMainForm.ApplicationEvents11Message(var Msg: tagMSG;
  var Handled: Boolean);
begin
  if  (DBGridpCard.Focused)  And  (Msg.message  =  WM_MOUSEWHEEL)  then
  begin
    if  Msg.wParam  >  0  then
      SendMessage(DBGridpCard.Handle,  WM_KEYDOWN,  VK_UP,  0)
    else
      SendMessage(DBGridpCard.Handle,  WM_KEYDOWN,  VK_DOWN,  0);
    Handled  :=  True;
  end;
end;
//--DBGridDoor--
{procedure TMainForm.ApplicationEvents12Message(var Msg: tagMSG;
  var Handled: Boolean);
begin
  if  (DBGridDoor.Focused)  And  (Msg.message  =  WM_MOUSEWHEEL)  then
  begin
    if  Msg.wParam  >  0  then
      SendMessage(DBGridDoor.Handle,  WM_KEYDOWN,  VK_UP,  0)
    else
      SendMessage(DBGridDoor.Handle,  WM_KEYDOWN,  VK_DOWN,  0);
    Handled  :=  True;
  end;
end;}

//=====8.4 功能函数=====

//==获取4位用户号==
function TMainForm.GetUserNO4(uStr: string): string;
var
  r2:string;
  u4:string;
  i2:byte;
begin
  r2 := Rightstr(uStr,2);
  i2 := StrToInt('$'+r2);
  u4 := Char(i2);
  Result := Midstr(uStr,2,3)+u4;
end;

//==获取6位用户号==
function TMainForm.GetUserNO6(uStr: string): string;
var
  u4:char;
begin
  u4 := uStr[4];
  Result :='0'+leftstr(uStr,3)+IntToHex(Ord(u4),2);
end;

//==获取校验和==
function TMainForm.GetSumCheck(bStr: string): string; 
var
  b:byte;
  i,j:integer;
  s:string;
begin
  b:=0;
  j:=Length(bStr) div 2;
  for i:=1 to j do
  begin
    s := MidStr(bStr,2*i -1,2);
    b := b+strtoint('$'+s);
  end;
  b:=(not b)+1;
  result := IntToHex(b,2);
end;

//==获取发送字符串==
function TMainForm.GetSendStr(bStr: string): string;
begin
  Result := 'FC'+GetSumCheck(bStr)+bStr;
end;

//==获取和(检查字节和是否为0)==
function TMainForm.GetSum(bStr: string): Byte;
var
  b:byte;
  i,j:integer;
  s:string;
begin
  b:=0;
  j:=Length(bStr) div 2;
  for i:=1 to j do
  begin
    s:=MidStr(bStr,2*i -1,2);
    b:=b+strtoint('$'+s);
  end;
  Result:=b;
end;

//==处理状态栏显示==
procedure TMainForm.ShowTips;
begin
  sb_tips.Panels[1].Text := lang_sb_tips0+':'+lang_sb_tips2+','+lang_sb_tips3+':'+IntToStr(intHand)+','+lang_sb_tips4+':'
    +IntTostr(intSend)+','+lang_sb_tips5+':'+IntToStr(intRcv)+'('+lang_sb_tips6+':'+IntToStr(intOK)+','+lang_sb_tips7+':'+IntToStr(intErr)+')';
end;

//==往数据库添加一条新的卡信息记录==
function TMainForm.Card_Insert(PersonName,CardNO,CardHex,unitMac,userMac,user6,WallNO,CardMemo,ValidTime:Variant;CardType,CardState:Variant):Boolean;
begin
  with AdoQryCard do
  begin
    Append;
    if PersonName<>null then
      FieldByName('PersonName').AsString := PersonName;

    if CardNO<>null then
      FieldByName('CardNO').AsString := CardNO;

    if CardHex<>null then
      FieldByName('CardHex').AsString := CardHex;

    if unitMac<>null then
      FieldByName('unitMac').AsString := unitMac;

    if userMac<>null then
      FieldByName('userMac').AsString := userMac;

    if user6<>null then
      FieldByName('user6').AsString := user6;

    if WallNO<>null then
      FieldByName('isWall').AsInteger := WallNO;

    if CardMemo<>null then
      FieldByName('CardMemo').AsString := CardMemo;

    if ValidTime<>null then
      FieldByName('ValidTime').AsString := ValidTime;

    if CardType<>null then
      FieldByName('CardType').AsInteger := CardType;

    if CardState<>null then
      FieldByName('CardState').AsInteger := CardState;

    Post;
  end;
  Result := True;
end;

//==往围墙机下载卡==
function TMainForm.D_Card_T_Wall(PersonName,CardNO,UserMac,CmdHead,ValidTime:string;CardType:Integer):Boolean;
var
  i:Integer;
  WallNO,temp,tp,s:string;
begin
  with AdoQryWall do
  begin
    Open;
    SQL.Clear;
    SQL.Add('select * from t_wall');
    Active:=true;
    First;
    while not EOF do
    begin
      WallNO:=FieldByName('WallNO').AsString;

      i:=((FieldByName('WallNum').AsInteger) div 15)+1;
      temp:='0000'+IntToStr(i);
      temp:=RightStr(temp,4);

      if (CardType=1) and (UserMac<>null) then
      begin
        temp:=UserMac;
      end;

      tp:=GetUserNO6(temp);

      if CardType=2 then
      begin
        temp:='10000';
        tp:='0A903A';
      end;

      s := CmdHead+IntToHex(StrToInt(CardNO),6)+WallNO+tp+'010A';
      s := GetSendStr(s);

      AdoCon.Execute('insert into t_cmd(CardNO,cmdStr,unitMac,userMac,sent,cmdType) values('+QuotedStr(CardNo)+','+QuotedStr(s)+','+QuotedStr(WallNO)+','+QuotedStr(temp)+',0,0)');

      if Get_RecCount('select * from t_card where CardNO='+QuotedStr(CardNO)+' and unitMac='+QuotedStr(WallNO))<1 then
      begin
        Card_Insert(PersonName,CardNO,IntToHex(StrToInt(CardNO),6),WallNO,temp,tp,1,null,ValidTime,CardType,0);
      end
      else begin
        AdoCon.Execute('update t_card set userMac='+QuotedStr(temp)+',PersonName='+QuotedStr(PersonName)+' where CardNO='+QuotedStr(CardNO)+' and unitMac='+QuotedStr(WallNO));
      end;

      Edit;
      FieldByName('WallNum').AsInteger:=FieldByName('WallNum').AsInteger+1;
      Post;

      Next;
    end;
  end;

  Result := True;
end;

//==往单元主机下载卡==
function TMainForm.D_Card_T_Unit(PersonName,CardNO,UserMac,CmdHead,ValidTime:string;CardType:Integer):Boolean;
var
  UnitNo,tp,s:string;
begin
  with AdoQryUnitMac do
  begin
    Open;
    SQL.Clear;
    SQL.Add('select * from t_unit');
    Active:=true;
    First;
    while not EOF do
    begin
      UnitNO:=FieldByName('UnitNO').AsString;
      if CardType=2 then
        tp:='0A903A'
      else
        tp:=GetUserNO6(UserMac);

      s := CmdHead+IntToHex(StrToInt(CardNO),6)+UnitNO+tp+'010A';
      s := GetSendStr(s);

      AdoCon.Execute('insert into t_cmd(CardNO,cmdStr,unitMac,userMac,sent,cmdType) values('+QuotedStr(CardNo)+','+QuotedStr(s)+','+QuotedStr(UnitNO)+','+QuotedStr(UserMac)+',0,0)');

      if Get_RecCount('select * from t_card where CardNO='+QuotedStr(CardNO)+' and unitMac='+QuotedStr(UnitNO))<1 then //+' and userMac='+QuotedStr(UserMac)
      begin
        Card_Insert(PersonName,CardNO,IntToHex(StrToInt(CardNO),6),UnitNO,UserMac,tp,0,null,ValidTime,CardType,0);
      end
      else begin
        AdoCon.Execute('update t_card set CardType='+IntToStr(CardType)+',userMac='+QuotedStr(UserMac)+' where CardNO='+QuotedStr(CardNO)+' and unitMac='+QuotedStr(UnitNO));
      end;

      Next;
    end;
  end;

  Result := true;
end;

//==从主机设备注销卡==
function TMainForm.C_Card_F_Device(CardNO,CmdHead:string;CardType:Integer):Boolean;
var
  unitStr,userStr:string;
  tp,s:string;
begin
  with AdoQryCard do
  begin
    Open;
    SQL.Clear;
    SQL.Add('select * from t_card where CardNO='+QuotedStr(CardNO)+' and CardType='+IntToStr(CardType));
    Active := true;
    First;
    while not EOF do
    begin
      unitStr:=FieldByName('unitMac').AsString;
      userStr:=FieldByName('userMac').AsString;
      tp:=GetUserNO6(userStr);

      if CardType=2 then
      begin
        tp:='0A903A';
      end;

      s := CmdHead+IntToHex(StrToInt(CardNO),6)+unitStr+tp+'020A';
      s := GetSendStr(s);

      AdoCon.Execute('insert into t_cmd(CardNO,cmdStr,unitMac,userMac,sent,cmdType) values('+QuotedStr(CardNo)+','+QuotedStr(s)+','+QuotedStr(unitStr)+','+QuotedStr(userStr)+',0,1)');

      Next;
    end;
  end;

  Result := true;
end;


//=====8.5 其他函数(不使用)=====

//===8.5.1 下载卡===

//==页面切换==
procedure TMainForm.SpinEdit1Change(Sender: TObject);
begin
  case SpinEdit1.Value of
  0:begin
      btn_previous.Enabled := false;
      panel_cardtype.Top := 36;
      panel_cardtype.Visible := true;
      panel_device.Visible := false;
      panel_batch.Visible := false;
      panel_end.Visible := false;
      PageControl3.Visible := false;
    end;
  1:begin
      btn_previous.Enabled := true;
      panel_device.Top := 36;
      panel_cardtype.Visible := false;
      panel_device.Visible := true;
      panel_batch.Visible := false;
      panel_end.Visible := false;
      PageControl3.Visible := false;
    end;
  2:begin
      panel_batch.Top := 36;
      panel_cardtype.Visible := false;
      panel_device.Visible := false;
      panel_batch.Visible := true;
      panel_end.Visible := false;
      PageControl3.Visible := false;
    end;
  3:begin
      btn_next.Enabled := false;
      panel_end.Top := 36;
      panel_cardtype.Visible := false;
      panel_device.Visible := false;
      panel_batch.Visible := false;
      panel_end.Visible := true;
      PageControl3.Visible := true;
      PageControl3.ActivePageIndex := 0;
    end;
  end;
end;

//==下一页==
procedure TMainForm.btn_nextClick(Sender: TObject);
var
  unitStr,userStr,devNO:string;
begin
  case SpinEdit1.Value of
  0:begin
      memo_message0.Lines.Add('卡类型：'+cbbCardType0.Text);
    end;
  1:begin
      unitStr:=editUnitMac0.Text;
      userStr:=editUserMac0.Text;
      devNO  :=unitStr+'-0000';

      if Get_RecCount('select * from t_dev where DevNO='+QuotedStr(devNO))<1 then
      begin
        ShowMessage(lang_msg_InputUnit);
        editUnitMac0.SetFocus;
        Exit;
      end;

      if userStr='' then
      begin
        ShowMessage(lang_msg_InputUser);
        editUserMac0.SetFocus;
        Exit;
      end;

      if (userStr<>'0000') and (Get_RecCount('select * from t_card where unitMac='+QuotedStr(unitStr)+' and userMac='+QuotedStr(userStr))>=15) then
      begin
        ShowMessage(lang_msg_UserMacAmount);
        editUserMac0.SetFocus;
        Exit;
      end;

      memo_message0.Lines.Add('主机号：'+editUnitMac0.Text);
      memo_message0.Lines.Add('分机号：'+editUserMac0.Text);

      RefreshRec(AdoQryRegCards,'select * from t_RegCmd');
    end;
  2:begin
      if ckbBatch0.Checked then
        memo_message0.Lines.Add('是否批量注册：是')
      else
        memo_message0.Lines.Add('是否批量注册：否');
    end;
  {3:begin
      memo_message0.Lines.Add('围墙机主机号：');
      RefreshRec(AdoQryWall,'select * from t_wall where WallChosen=1');
      with AdoQryWall do
      begin
        Open;
        First;
        while not EOF do
        begin
          memo_message0.Lines.Append(FieldByName('WallNO').AsString+',');
          Next;
        end;
      end;
    end;
  4:begin
      memo_message0.Lines.Add('物业卡主机：');
      RefreshRec(AdoQryUnitMac,'select * from t_unit where UnitChosen=1');
      with AdoQryUnitMac do
      begin
        Open;
        First;
        while not EOF do
        begin
          memo_message0.Lines.Append(FieldByName('UnitNO').AsString+',');
          Next;
        end;
      end;
    end;}
  end;

  if SpinEdit1.Value=0 then
  begin
    if cbbCardType0.ItemIndex=0 then
      SpinEdit1.Value := SpinEdit1.Value + 1
    else
      SpinEdit1.Value := SpinEdit1.Value + 3;
  end
  else begin
    SpinEdit1.Value := SpinEdit1.Value + 1;
  end;

end;

//==上一页==
procedure TMainForm.btn_previousClick(Sender: TObject);
var
  i,j:Integer;
begin
  if SpinEdit1.Value=5 then
  begin
    if cbbCardType0.ItemIndex=1 then
      SpinEdit1.Value := SpinEdit1.Value - 1
    else
      SpinEdit1.Value := SpinEdit1.Value - 2;
  end
  else begin
    SpinEdit1.Value := SpinEdit1.Value - 1;
  end;

  case SpinEdit1.Value of
  0:begin
      j := memo_message0.Lines.Count;
      memo_message0.Lines.Delete(j-1);
    end;
  1:begin
      j := memo_message0.Lines.Count;
      memo_message0.Lines.Delete(j-1);
      memo_message0.Lines.Delete(j-2);
    end;
  2:begin
      j := memo_message0.Lines.Count;
      memo_message0.Lines.Delete(j-1);
    end;
  3:begin
      j := memo_message0.Lines.Count;
      for i:=0 to Get_RecCount('select * from t_wall where WallChosen=1')+1 do
      begin
        memo_message0.Lines.Delete(j-i);
      end;
    end;
  4:begin
      j := memo_message0.Lines.Count;
      for i:=0 to Get_RecCount('select * from t_unit where UnitChosen=1')+1 do
      begin
        memo_message0.Lines.Delete(j-i);
      end;
    end;
  end;
end;

//==物业卡分机号(9990-9999)==
procedure TMainForm.e2Exit(Sender: TObject);
begin
  if cbbCardType0.ItemIndex=1 then
  begin
    if (StrToInt(editUserMac0.Text)<StrToInt(MinNO)) or (StrToInt(editUserMac0.Text)>StrToInt(MaxNO)) then
      editUserMac0.Text:=MinNO;
  end;
end;

//==选中围墙机设备==
procedure TMainForm.clb_Dev0ClickCheck(Sender: TObject);
begin
  if clb_Dev0.Checked[clb_Dev0.ItemIndex]=true then
  begin
    {if ckbBatch0.Checked then
      ExecSQL('update t_wall set WallNum=0 where WallNO='+QuotedStr(clb_Dev0.Items.Strings[clb_Dev0.ItemIndex]));}

    ExecSQL('update t_wall set WallChosen=1 where WallNO='+QuotedStr(clb_Dev0.Items.Strings[clb_Dev0.ItemIndex]));
    RefreshRec(AdoQryWall,'select * from t_wall order by WallNO');
  end
  else if clb_Dev0.Checked[clb_Dev0.ItemIndex]=false then
  begin
    ExecSQL('update t_wall set WallChosen=0 where WallNO='+QuotedStr(clb_Dev0.Items.Strings[clb_Dev0.ItemIndex]));
    RefreshRec(AdoQryWall,'select * from t_wall order by WallNO');
  end;
end;

//==选中主机设备==
procedure TMainForm.clb_UnitMac0ClickCheck(Sender: TObject);
begin
  if clb_UnitMac0.Checked[clb_UnitMac0.ItemIndex]=true then
  begin
    ExecSQL('update t_unit set UnitChosen=1 where UnitNO='+QuotedStr(clb_UnitMac0.Items.Strings[clb_UnitMac0.ItemIndex]));
    RefreshRec(AdoQryUnitMac,'select * from t_unit order by UnitNO');
  end
  else if clb_UnitMac0.Checked[clb_UnitMac0.ItemIndex]=false then
  begin
    ExecSQL('update t_unit set UnitChosen=0 where UnitNO='+QuotedStr(clb_UnitMac0.Items.Strings[clb_UnitMac0.ItemIndex]));
    RefreshRec(AdoQryUnitMac,'select * from t_unit order by UnitNO');
  end;
end;

//==清空数量==
procedure TMainForm.btn_RegCLClick(Sender: TObject);
begin
  ExecSQL('update t_wall set WallNum=0 where WallNO='+QuotedStr(AdoQryWall.FieldByName('WallNO').AsString));
  RefreshRec(AdoQryWall,'select * from t_wall');
end;

//==提交==
procedure TMainForm.btn_RegSMClick(Sender: TObject); //提交
begin
  PageControl3.ActivePageIndex:=0;
end;

//==下载卡==
procedure TMainForm.btn_RegOKClick(Sender: TObject);
var
  unitStr,userStr:string;
  devNO:string;
  u6:string;
begin

  if userStr='*90*' then
  begin
    editUser60.Text:='0A903A';
    cbbcardType0.ItemIndex := 2; //功能卡
    u6:=editUser60.Text;
  end
  else
    u6:=GetUserNO6(userStr);

  ExecSQl('update t_unit set UnitChosen=0');
  ExecSQL('update t_wall set WallChosen=0');

  if (userStr<>'0000') and (Get_RecCount('select * from t_card where unitMac='+QuotedStr(unitStr)+' and userMac='+QuotedStr(userStr))>=15) then
    ShowMessage(lang_msg_UserMacAmount)
  else begin
    if cbbCardType0.ItemIndex=1 then
    begin
      ShowMessage(lang_msg_SelUnitWall);
      PageControl3.ActivePageIndex:=2;

    end
    else
      ShowMessage(lang_msg_ChooseWall);
    RefreshRec(AdoQryWall,'select * from t_wall');
  end;

end;

//===8.5.2 注销卡==

//==页面切换==
procedure TMainForm.SpinEdit2Change(Sender: TObject);
begin
  case SpinEdit2.Value of
  0:begin
      btn_previous1.Enabled := false;
      panel_device1.Top := 36;
      panel_device1.Visible := true;
      panel_wall1.Visible := false;
      panel_end1.Visible := false;
      PageControl4.Visible := false;
    end;
  1:begin
      btn_previous1.Enabled := true;
      panel_wall1.Top := 36;
      panel_device1.Visible := false;
      panel_wall1.Visible := true;
      panel_end1.Visible := false;
      PageControl4.Visible := true;
      PageControl4.ActivePageIndex := 1;
      btn_next1.Enabled := true;
    end;
  2:begin
      btn_next1.Enabled := false;
      panel_end1.Top := 36;
      panel_device1.Visible := false;
      panel_wall1.Visible := false;
      panel_end1.Visible := true;
      PageControl4.Visible := true;
      PageControl4.ActivePageIndex := 0;
    end;
  end;
end;

//==下一页==
procedure TMainForm.btn_next1Click(Sender: TObject);
var
  unitStr,userStr,devNO:string;
begin
  case SpinEdit2.Value of
  0:begin
      unitStr:=editUnitMac1.Text;
      userStr:=editUserMac1.Text;
      devNO  :=unitStr+'-0000';

      if Get_RecCount('select * from t_dev where DevNO='+QuotedStr(devNO))<1 then
      begin
        ShowMessage(lang_msg_InputUnit);
        editUnitMac1.SetFocus;
        Exit;
      end;

      if userStr='' then
      begin
        ShowMessage(lang_msg_InputUser);
        editUserMac1.SetFocus;
        Exit;
      end;

      memo_message1.Lines.Add('主机号：'+editUnitMac1.Text);
      memo_message1.Lines.Add('分机号：'+editUserMac1.Text);

      RefreshRec(AdoQryCancelCards,'select * from t_CancelCmd');
    end;
  1:begin
      memo_message1.Lines.Add('围墙机主机号：');
      RefreshRec(AdoQryWall,'select * from t_wall where WallChosen=1');
      with AdoQryWall do
      begin
        Open;
        First;
        while not EOF do
        begin
          memo_message1.Lines.Append(FieldByName('WallNO').AsString+',');
          Next;
        end;
      end;
    end;
  end;

  SpinEdit2.Value := SpinEdit2.Value + 1;
end;

//==上一页==
procedure TMainForm.btn_previous1Click(Sender: TObject);
var
  i,j:Integer;
begin
  SpinEdit2.Value := SpinEdit2.Value - 1;

  case SpinEdit2.Value of
  0:begin
      j := memo_message1.Lines.Count;
      memo_message1.Lines.Delete(j-1);
      memo_message1.Lines.Delete(j-2);
    end;
  1:begin
      j := memo_message1.Lines.Count;
      for i:=0 to Get_RecCount('select * from t_wall where WallChosen=1')+1 do
      begin
        memo_message1.Lines.Delete(j-i);
      end;
    end;
  end;
end;

//==选中围墙机设备==
procedure TMainForm.clb_Dev1ClickCheck(Sender: TObject);
begin
  if clb_Dev1.Checked[clb_Dev1.ItemIndex]=true then
  begin
    ExecSQL('update t_wall set WallChosen=1 where WallNO='+QuotedStr(clb_Dev1.Items.Strings[clb_Dev1.ItemIndex]));
    RefreshRec(AdoQryWall,'select * from t_wall order by WallNO');
  end
  else if clb_Dev1.Checked[clb_Dev1.ItemIndex]=false then
  begin
    ExecSQL('update t_wall set WallChosen=0 where WallNO='+QuotedStr(clb_Dev1.Items.Strings[clb_Dev1.ItemIndex]));
    RefreshRec(AdoQryWall,'select * from t_wall order by WallNO');
  end;
end;

//==选择围墙机==
procedure TMainForm.DBGrid4DblClick(Sender: TObject);
begin
  if AdoQryWall.FieldByName('WallChosen').AsInteger=0 then
    ExecSQL('update t_wall set WallChosen=1 where WallNO='+QuotedStr(AdoQryWall.FieldByName('WallNO').AsString))
  else if AdoQryWall.FieldByName('WallChosen').AsInteger=1 then
    ExecSQL('update t_wall set WallChosen=0 where WallNO='+QuotedStr(AdoQryWall.FieldByName('WallNO').AsString));
  RefreshRec(AdoQryWall,'select * from t_wall order by WallNO');
end;

//==提交==
procedure TMainForm.btn_CancelSMClick(Sender: TObject);
begin
  PageControl4.ActivePageIndex:=0;
end;

//==注销卡==
procedure TMainForm.btn_CancelOKClick(Sender: TObject);
var
  unitStr,userStr:string;
  u6,devNO:string;
begin
  unitStr:=editUnitMac1.Text;
  userStr:=editUserMac1.Text;
  devNO  :=unitStr+'-0000';

  if Get_RecCount('select * from t_dev where DevNO='+QuotedStr(devNO))<1 then
  begin
    ShowMessage(lang_msg_InputUnit);
    editUnitMac1.SetFocus;
    Exit;
  end;

  if userStr='' then
  begin
    ShowMessage(lang_msg_InputUser);
    editUserMac1.SetFocus;
    Exit;
  end;

  u6:=GetUserNO6(userStr);

  ShowMessage(lang_msg_ChooseWall);
  RefreshRec(AdoQryWall,'select * from t_wall');
  RefreshRec(AdoQryCancelCards,'select * from t_CancelCmd');
end;

//===8.5.3 提取卡===

//==查询==
procedure TMainForm.btn_ReadQryClick(Sender: TObject);
begin
  if edit_User.Text <> '' then
  begin
    AdoQryReadCards.Filter := 'userMac = '+QuotedStr(edit_User.Text);
    AdoQryReadCards.Filtered := true;
  end
  else
    AdoQryReadCards.Filtered := false;
end;

//===8.5.4 发卡器===

//==发卡==
procedure TMainForm.btn_CardSenderClick(Sender: TObject);
var
  unitStr,userStr,cardNO,devNO:string;
  cardState,cardType:integer;
begin
  unitStr := edt_UnitMac.Text;
  userStr := edt_UserMac.Text;
  devNO   := unitStr+'-0000';
  cardState := 0;
  cardType  := 0;
  cardNO    := edt_CardNO1.Text;

  if Get_RecCount('select * from t_dev where devNO = '+QuotedStr(devNO)) < 1 then
  begin
    ShowMessage(lang_msg_InputUnit);
    edt_UnitMac.SetFocus;
    Exit;
  end;

  if userStr = '' then
  begin
    ShowMessage(lang_msg_InputUser);
    edt_UserMac.SetFocus;
    Exit;
  end;

  if Get_RecCount('select * from t_card where CardNO='+QuotedStr(cardNO))<1 then
  begin
    with AdoQryCard do
    begin
      Open;
      Append;
      FieldByName('CardType').AsInteger := cardType;
      FieldByName('CardNO').AsString    := cardNO;
      FieldByName('CardState').AsInteger:= cardState;
      FieldByName('unitMac').AsString   := unitStr;
      FieldByName('userMac').AsString   := userStr;
      Post;
    end;
  end;
  RefreshRec(AdoQryCard,'select * from t_card');
end;

//===8.5.5 设置===

//==清空数据==
procedure TMainForm.btn_DataClearClick(Sender: TObject);
begin
  if MessageDlg(lang_msg_DelAll,mtConfirmation,[mbYes,mbNo],0) = mrYes then
  begin
    ExecSQL('delete from t_addr where ID>0');
    RefreshRec(AdoQryAddr,'select * from t_addr order by AddrNO');

    ExecSQL('delete from t_dev where ID>0');
    RefreshRec(AdoQryDev, 'select * from t_dev  order by AddrNO');

    ExecSQL('delete from t_wall where ID>0');
    RefreshRec(AdoQryWall,'select * from t_wall order by WallNO');

    ExecSQL('delete from t_card where ID>0');
    RefreshRec(AdoQryCard,'select * from t_card');

    ExecSQL('delete from t_ReadCards where ID>0');
    RefreshRec(AdoQryReadCards,'select * from t_ReadCards');

    ExecSQL('delete from t_alarm where ID>0');
    RefreshRec(AdoQryAlarm,'select * from t_alarm order by AlarmTime DESC,ID DESC');

    ExecSQL('delete from t_CardRec where ID>0');
    RefreshRec(AdoQryCardRec,'select * from t_CardRec order by RecTime DESC,ID DESC');
  end;
end;

//==数据对接模块==
procedure TMainForm.btn_dockClick(Sender: TObject);
begin
  f_dock:=Tf_dock.Create(nil);
  if f_dock.ShowModal=mrOK then
  begin
    //
  end;
end;

//==手机开锁模块==
procedure TMainForm.btn_openClick(Sender: TObject);
begin
  if f_phone=nil then
    f_phone := Tf_phone.Create(nil);
  f_phone.Show;
end;

function TMainForm.OpenDoor(DevStr:string):Boolean;
var
  Cmd_Open:string;
  unitStr,userStr:string;
begin
  unitStr:=LeftStr(DevStr,4);
  userStr:=RightStr(DevStr,4);

  Cmd_Open:='0000000000'+unitStr+GetUserNO6(userStr)+'2604';
  Cmd_Open:=GetSendStr(Cmd_Open);
  mmSendCmd.Lines.Append(Cmd_Open);

  Result:=true;
end;

//===8.5.6 网络处理===

//==接收UDP广播并应答(采用TIdUDPServer控件)==
procedure TMainForm.UDPServerUDPRead(Sender: TObject; AData: TStream;
  ABinding: TIdSocketHandle);
var
  DataStringStream:TStringStream;
  RcvStr:string;
  UDPClient:TIdUDPClient;
begin
  LocalIP:=IPWatch.LocalIP;
  DataStringStream:=TStringStream.Create('');
  DataStringStream.CopyFrom(AData,AData.Size);
  RcvStr:=DataStringStream.DataString;
  if RcvStr=ManageNumber then
  begin
    //Memo5.Lines.Add(RcvStr);
    UDPClient:=TIdUDPClient.Create(nil);
    UDPClient.Host := ABinding.PeerIP;
    UDPClient.Port := ABinding.PeerPort;
    UDPClient.Active:=true;
    UDPClient.Send(LocalIP+'?16');
    UDPClient.Active:=false;
    UDPClient.Destroy;
  end;
end;

//==图像处理==
function TMainForm.ImageProcess(ImageString:string):Boolean;
var
  i:Integer;
  Image:TFileStream;
begin
  Image:=TFileStream.Create(Get_CurDir+'\screenshot.jpeg',fmcreate);
  Image.Size:=0;
  Image.Position:=0;
  for i:=1 to Length(ImageString) do
  begin
    Image.Write(ImageString[i],1);
  end;

  with AdoQryCardRec do
  begin
    Open;
    SQL.Clear;
    SQL.Add('select * from t_CardRec order by RecTime DESC,ID DESC');
    Active:=true;
    First;
    Edit;
    (FieldByName('Screenshot') as TBlobField).LoadFromStream(Image);
    Post;
  end;

  Image.Free;
end;

//==状态回复==
function TMainForm.SendConfirm(Confirm:byte):Boolean;
var
  SendStream:TMemoryStream;
  Client:TIdTCPClient;
begin
  SendStream := TMemoryStream.Create;
  SendStream.Write(Confirm,1);

  Client:=TIdTCPClient.Create(nil);
  Client.Disconnect;
  Client.Host:=ConnectedIP;
  Client.Port:=StrToInt(SendPort);
  try
    Client.Connect(5000);
  except
    ShowMessage(lang_msg_LinkTimeout);
    Client.Free;
    //Client.Destroy;
    Exit;
  end;

  if Client.Connected then
  begin
    try
      Client.WriteStream(SendStream,true,false);
      SendStream.Free;
      Result:=true;
    except
      ShowMessage(lang_msg_NoSent);
      Result:=false;
      Client.Destroy;
      Exit;
    end;
  end
  else begin
    ShowMessage(lang_msg_LinkFail);
    Client.Destroy;
    Result:=false;
    Exit;
  end;
  Client.Destroy;
end;

//==图像存储==

end.


