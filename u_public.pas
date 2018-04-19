unit u_public;

interface

uses  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, ExtCtrls, Db, DBTables, Menus,ComCtrls,CheckLst,Spin,
  Mask,registry,ADODB,StrUtils, Math, IniFiles, DateUtils, IdTCPConnection;

  procedure delay(msecs: integer);
  procedure RefreshRec(AdoQry:TAdoQuery;SqlStr:string);
  function Get_RecCount(SqlStr:string):integer;overload;
  function Get_RecCount(SqlStr:string;AdoCn:TADOConnection):integer;overload;
  procedure ExecSql(SqlStr:string);
  function Get_CurDir():string;
  function Encrypt(S:String):String;
  function Uncrypt(S:String):String;
  function StrDelHeadTail(sSrc,sSub:string):string;
  function StringAddSpace(str: string): string;
  function GetCmdTime(tStr:string):String;
  function GetRegTime(tStr:string):string;
  function GetComPortList():TStringList;
  function GetComStatus(port:string):string;
  function Get_SQLDataPathFromReg():string;
  function HexToBinary(hexStr:string):string;
var
  sqlSelect:string;   //筛选的sql语句
  com_port:string;    //通信端口
  com_sender:string;  //发卡器端口
  com_writer:string;  //写卡器端口
  sys_user:string;
  sys_permit:string;

  intHand:Integer; //握手次数
  intRcv:Integer;  //收到指令条数
  intSend:Integer; //发送指令条数
  intOK:Integer;   //有效指令
  intErr:Integer;  //无效指令

  //以下为栋、梯、楼、层的位数，编号顺序
  bBit:integer;
  uBit:integer;
  fBit:integer;
  hBit:integer;

  bOrd:Integer;
  uOrd:Integer;
  fOrd:Integer;
  hOrd:Integer;

  //其他全局量
  AppName:string;
  DataDocking:string;
  PoliceDocking:string;
  Test:string;
  PhoneDoor:string;

  port:string;
  ip:string;

  ComType:Integer;
  LocalIP:string;
  ManageNumber:string;
  NetIP:string;
  ReceivePort:string;
  SendPort:string;
  ClientIP:string;

  RcvString:string;
  RcvStream:string;
  CurrentID:Integer;
  ConnectedIP:String;
  ConnectedPort:Integer;
  Connection:TIdTCPConnection;

  pcType:Boolean;
  MinNO:string;
  MaxNO:string;

  //状态标识
  isClear:Boolean;
  isRead:Boolean;
  isExtract:Boolean;
  isAddCard:Boolean;
  isImport:Boolean;
  preCmd:string;
  isSend:Boolean;
  isReading:Boolean;
  isBatch:Boolean;

implementation

uses u_main, u_lang;

procedure delay(msecs: integer);
var
  FirstTickCount:longint;
begin
  FirstTickCount:=GetTickCount;
  repeat
    Application.ProcessMessages;  //此句关键，保证其它线程不受影响
  until ((longint(GetTickCount)-longint(FirstTickCount)) >= longint(msecs));
end;

procedure RefreshRec(AdoQry:TAdoQuery;SqlStr:string);
begin
  if AdoQry.Active then
  begin
    AdoQry.Recordset.Close;
    AdoQry.Close;
  end;
  AdoQry.SQL.Clear;
  AdoQry.SQL.Add(SqlStr);
  AdoQry.Active:=true;
end;

function Get_RecCount(SqlStr:string):integer;overload;
var
  Rs:_RecordSet;
begin
  Rs:=MainForm.AdoCon.Execute(SqlStr);
  Result:=Rs.RecordCount;
  Rs.Close;
end;

function Get_RecCount(SqlStr:string;AdoCn:TADOConnection):integer;overload;
var
  Rs:_RecordSet;
begin
  Rs:=AdoCn.Execute(SqlStr);
  Result:=Rs.RecordCount;
  Rs.Close;
end;

procedure ExecSql(SqlStr:string);
begin
  MainForm.AdoCon.Execute(SqlStr);
end;

function Get_CurDir():string;
var
  curDir:string;
begin
  SetLength(curDir,144);
  if GetCurrentDirectory(144,PChar(curDir))<>0 then
    SetLength(curDir,StrLen(PChar(curDir)))
  else
  begin
    curDir:='';
    ShowMessage('发生意外错误!请退出重新执行程序!');
  end;
  result:=curDir;
end;

//-----加密函数-----
function Encrypt(S:String):String;
var
  i,j,k:Integer;
  OrgStr,OrdStr,ReverseStr,LastStr:String;
begin
  OrgStr:='';
  OrdStr:='';
  For i:=1 to Length(S) do
  begin
    OrgStr:=inttostr(ord(S[i]));
    while length(OrgStr)<3 do
    begin
      OrgStr:='0'+OrgStr;
    end;
    OrdStr:=OrdStr+OrgStr;
  end;
  ReverseStr:='';
  for j:=length(OrdStr) downto 1 do
  begin
    ReverseStr:=ReverseStr+OrdStr[j];
  end;

  LastStr:='';
  for k:=1 to length(ReverseStr) do
  begin
      if ReverseStr[k]<>'0' then
        LastStr:=LastStr+char(ord(strtoint(ReverseStr[k])))
      else
        LastStr:=LastStr+char(30);
  end;
  Result:=LastStr;
end;

//-----解密函数-----
function Uncrypt(S:String):String;
var
  i,j,k:Integer;
  OrdStr,ReverseStr,LastOrd,LastStr:String;
begin
  OrdStr:='';
  For i:=1 to Length(S) do
  begin
    if ord(S[i])<>30 then
      OrdStr:=OrdStr+inttostr(ord(s[i]))
    else
      OrdStr:=OrdStr+'0';
  end;
  ReverseStr:='';
  for j:=length(OrdStr) downto 1 do
  begin
    ReverseStr:=ReverseStr+OrdStr[j];
  end;
  LastOrd:='';
  LastStr:='';
  for k:=1 to length(ReverseStr) do
  begin
    LastOrd:=LastOrd+ReverseStr[k];
    if (k mod 3)=0 then
    begin
        LastStr:=LastStr+char(strtoint(LastOrd));
        LastOrd:='';
    end;  
  end;
  Result:=LastStr;
end;

function StrDelHeadTail(sSrc,sSub:string):string;
var
  s:string;
begin
  s := sSrc;
  while leftstr(s,length(sSub)) = sSub do
  begin
    Delete(s,1,length(sSub));
    if leftstr(s,length(sSub)) <> sSub then Break;
  end;

  while rightstr(s,length(sSub)) = sSub do
  begin
    Delete(s,length(s)-length(sSub)+1,length(sSub));
    if rightstr(s,length(sSub)) <> sSub then Break;
  end;

  Result := s;
end;

function StringAddSpace(str: string): string;
var
  j:Integer;
begin
  for j := 1 to Length(str) div 2 do
  begin
    if j = 1 then
      Result := LeftStr(str,2)
    else
      Result := Result+' '+MidStr(str,2*j-1,2);
  end;
end;

function GetCmdTime(tStr:string):String;
var
  yStr,mStr,dStr,hStr,fStr:string;
begin
  yStr:= LeftStr(tStr,4);
  mStr:= MidStr(tStr,6,1);
  mStr:=IntToStr(StrToInt('$'+mStr));
  if Length(mStr)=1 then mStr:='0'+mStr;
  dStr:=MidStr(tStr,7,2);
  if Length(dStr)=1 then dStr:='0'+dStr;
  hStr:=RightStr(tStr,2);
  fStr:=MidStr(tStr,9,2);

  Result := yStr+'-'+mStr+'-'+dStr+' '+hStr+':'+fStr;
end;

function GetRegTime(tStr:string):string;
var
  yStr,mStr,dStr,hStr,fStr,sStr:string;
begin
  yStr:=LeftStr(tStr,4);
  mStr:=MidStr(tStr,5,2);
  dStr:=MidStr(tStr,7,2);
  hStr:=MidStr(tStr,9,2);
  fStr:=MidStr(tStr,11,2);

  Result := yStr+'-'+mStr+'-'+dStr+' '+hStr+':'+fStr;
end;

function GetComPortList():TStringList;
var
  Reg:TRegistry; // 注: 要引用Registry单元
  sNameLst:TStringList;
  sComList:TStringList;
  i:integer;
begin
  sNameLst := TStringList.Create;
  sComList := TStringList.Create;
  Reg := TRegistry.Create;
  Reg.RootKey := HKEY_LOCAL_MACHINE;
  Reg.OpenKey('HARDWARE\DEVICEMAP\SERIALCOMM',true);
  Reg.GetValueNames(sNameLst);

  for i:=0 to sNameLst.Count-1 do
  begin
    sComList.Append(Reg.ReadString(sNamelst[i]));
  end;

  Result:=sComList;
  Reg.CloseKey;
  Reg.Free;
end;

//检查某个端口的状态:busy,none,avail(占用,不存在,可用)
function GetComStatus(port:string):string;
var
  hCOMM:cardinal;
  chkStr:string;
begin
  hCOMM :=  CreateFile(PChar(port),
                       GENERIC_READ or GENERIC_WRITE,
                       0, {not shared}
                       nil, {no security ??}
                       OPEN_EXISTING,
                       FILE_ATTRIBUTE_NORMAL or FILE_FLAG_OVERLAPPED,
                       0 {template} );
  if GetLastError = ERROR_ACCESS_DENIED then chkStr := 'busy'
  else if hCOMM <> INVALID_HANDLE_VALUE then chkStr := 'avail'
  else  chkStr := 'none';
  Result := chkStr;
  Closehandle(hCOMM);
end;

function Get_SQLDataPathFromReg():string;
var
  Reg:TRegistry;
  SQLPath:string;
begin
  Reg:=TRegistry.Create;
  try
    Reg.RootKey:=HKEY_LOCAL_MACHINE;
    if Reg.KeyExists('SOFTWARE\Microsoft\MSSQLServer\Setup') then
    begin
      Reg.OpenKeyReadOnly('SOFTWARE\Microsoft\MSSQLServer\Setup');
      SQLPath:=Reg.ReadString('SQLDataRoot');
      if SQLPath='' then
        ShowMessage(lang_msg_DBPathError)
      else
        Result:=SQLPath+'\DATA\';
    end;
    Reg.CloseKey;
  finally
    Reg.Free;
  end;
end;

function HexToBinary(hexStr:string):string;
const
  BCD: array [0..15] of string =
  ('0000', '0001', '0010', '0011', '0100', '0101', '0110', '0111',
  '1000', '1001', '1010', '1011', '1100', '1101', '1110', '1111');
var
  i: Integer;
begin
  for i := Length(hexStr) downto 1 do
    Result := BCD[StrToInt('$' + hexStr[i])] + Result;
end;

end.
