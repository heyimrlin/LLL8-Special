unit u_phone;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IdBaseComponent, IdComponent, IdTCPServer, StdCtrls, ComCtrls,
  Menus, ExtCtrls, StrUtils;

type
  Tf_phone = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    memo_info: TMemo;
    TabSheet2: TTabSheet;
    memo_record: TMemo;
    Server: TIdTCPServer;
    Timer1: TTimer;
    procedure N11Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure ServerDisconnect(AThread: TIdPeerThread);
    procedure ServerExecute(AThread: TIdPeerThread);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    RcvStr:string;

    procedure ShowInfo(s:string);
    { Public declarations }
  end;

var
  f_phone: Tf_phone;

implementation

uses u_main, u_public, u_config;

{$R *.dfm}

procedure Tf_phone.N11Click(Sender: TObject);
begin
  Server.DefaultPort:=StrToInt(port);
  Server.Active:=true;
  ShowMessage('服务已开启！');
end;

procedure Tf_phone.N12Click(Sender: TObject);
begin
  {Server.Active:=false;
  ShowMessage('服务已关闭！');}
end;

procedure Tf_phone.N13Click(Sender: TObject);
begin
  {f_config :=Tf_config.Create(nil);
  if f_config.ShowModal=mrOK then
  begin
    Server.DefaultPort:=StrToInt(port);
    Server.Active:=true;
  end;}
end;

procedure Tf_phone.ServerDisconnect(AThread: TIdPeerThread);
var
  i:integer;
begin
  try
    with Server.Threads.LockList do
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
    Server.Threads.UnlockList;
    Server.Active:=false;
  end;
end;

procedure Tf_phone.ServerExecute(AThread: TIdPeerThread);
begin
  RcvStr:=RcvStr+IntToHex(Ord(AThread.Connection.ReadChar),2);
end;

procedure Tf_phone.Timer1Timer(Sender: TObject);
begin
  if RcvStr<>'' then
  begin
    ShowInfo(RcvStr);
    RcvStr:='';
  end;
end;

procedure Tf_phone.ShowInfo(s:string);
var
  check,version,serial,code,len,data:string;
  s1,s2,s3,s4:string;
  codeInt,lenInt:integer;
  DevStr:string;
begin
  memo_record.Lines.Add('接收:'+s);

  check:=LeftStr(s,4);

  version:=MidStr(s,5,4);

  serial:=MidStr(s,9,8);

  code:=MidStr(s,17,8);
  s1:=LeftStr(code,2);
  s2:=MidStr(code,3,2);
  s3:=MidStr(code,5,2);
  s4:=RightStr(code,2);
  codeInt:=StrToInt('$'+s4+s3+s2+s1);

  len:=MidStr(s,25,8);
  s1:=LeftStr(len,2);
  s2:=MidStr(len,3,2);
  s3:=MidStr(len,5,2);
  s4:=RightStr(len,2);
  lenInt:=StrToInt('$'+s4+s3+s2+s1);

  data:=MidStr(s,33,lenInt*2);
  while data<>'' do
  begin
    DevStr:=DevStr+chr(strtoint('$'+LeftStr(data,2)));
    delete(data,1,2);
  end;

  if codeInt=102 then
  begin
    if DevStr='' then
    begin
      memo_info.Lines.Add('接收到指令:'+IntToStr(codeInt)+'  应答成功');
      memo_info.Lines.Add('主机号:'+DevStr);
      memo_info.Lines.Add('下载失败！');
    end
    else begin
      if MainForm.OpenDoor(DevStr)=true then
      begin
        memo_info.Lines.Add('接收到指令:'+IntToStr(codeInt)+'  应答成功');
        memo_info.Lines.Add('主机号:'+DevStr);
        memo_info.Lines.Add('下载成功！');
      end
      else begin
        memo_info.Lines.Add('接收到指令:'+IntToStr(codeInt)+'  应答成功');
        memo_info.Lines.Add('主机号:'+DevStr);
        memo_info.Lines.Add('下载失败！');
      end;
    end;
  end
  else begin
    memo_info.Lines.Add('接收到指令:'+IntToStr(codeInt)+'  应答失败');
  end;
end;

end.
