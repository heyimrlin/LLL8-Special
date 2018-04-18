unit u_treedevice;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, ImgList, StdCtrls, Buttons, StrUtils, jpeg;

type
  PNodeInfo=^TNodeInfo;
  TNodeInfo=record
    DType:Integer;
    ID:string;
    Name:string;
    NO:string;
  end;

type
  Tf_treedevice = class(TForm)
    Panel1: TPanel;
    TreeDevice: TTreeView;
    IconList: TImageList;
    Panel2: TPanel;
    Label1: TLabel;
    edit_DevNO: TEdit;
    Label2: TLabel;
    edit_Name: TEdit;
    spBtn_select: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure TreeDeviceClick(Sender: TObject);
    procedure spBtn_selectClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    TreeType:Integer;
    UnitStr,UserStr:string;
    DevName:string;
  end;

var
  f_treedevice: Tf_treedevice;

implementation

{$R *.dfm}
uses u_main;

procedure Tf_treedevice.FormCreate(Sender: TObject);
begin
  MainForm.CreateRoomTree(TreeDevice,'select * from t_addr where AddrType=0 order by AddrNO');
  TreeType:=1;
end;

procedure Tf_treedevice.TreeDeviceClick(Sender: TObject);
var
  SqlStr:string;
begin
  if PNodeInfo(TreeDevice.Selected.Data)^.DType=0 then
  begin
    SqlStr:='select * from t_addr where AddrType=1 and AddrNO like '+QuotedStr(PNodeInfo(TreeDevice.Selected.Data)^.ID+'%')+' order by AddrNO';
    TreeDevice.Selected.DeleteChildren;
    MainForm.CreateUnitTree(TreeDevice.Selected,TreeDevice,SqlStr);
    if TreeDevice.Selected.Expanded=false then
      TreeDevice.Selected.Expanded:=true;
  end
  else if (PNodeInfo(TreeDevice.Selected.Data)^.DType=1) then
  begin
    if TreeType=1 then
    begin
      SqlStr:='select * from t_addr where AddrType=2 and AddrNO like '+QuotedStr(PNodeInfo(TreeDevice.Selected.Data)^.ID+'%')+' order by AddrNO';
      TreeDevice.Selected.DeleteChildren;
      MainForm.CreateHouseTree(TreeDevice.Selected,TreeDevice,SqlStr);
      if TreeDevice.Selected.Expanded=false then
        TreeDevice.Selected.Expanded:=true;
    end;
    
    edit_DevNO.Text:=PNodeInfo(TreeDevice.Selected.Data)^.NO;
    edit_Name.Text:=PNodeInfo(TreeDevice.Selected.Data)^.Name;
  end
  else if (PNodeInfo(TreeDevice.Selected.Data)^.DType=2) then
  begin
    edit_DevNO.Text:=PNodeInfo(TreeDevice.Selected.Data)^.NO;
  end;
end;

procedure Tf_treedevice.spBtn_selectClick(Sender: TObject);
var
  DevStr:string;
begin
  if edit_DevNO.Text<>'' then
  begin
    DevStr:=edit_DevNO.Text;
    UnitStr:=LeftStr(DevStr,4);
    UserStr:=RightStr(DevStr,4);
    DevName:=edit_Name.Text;
    ModalResult:=mrOK;
  end;
end;

end.
