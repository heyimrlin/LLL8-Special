unit u_addr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Spin, jpeg, ExtCtrls, StrUtils;

type
  Tf_addr = class(TForm)
    Image8: TImage;
    Label6: TLabel;
    cmbAddrType: TComboBox;
    Label2: TLabel;
    edit_DevNO: TEdit;
    Label1: TLabel;
    spEdit_Building: TSpinEdit;
    Label3: TLabel;
    spEdit_Unit: TSpinEdit;
    Label4: TLabel;
    spEdit_Floor: TSpinEdit;
    Label5: TLabel;
    spEdit_Room: TSpinEdit;
    Label8: TLabel;
    edit_AddrName: TEdit;
    Label7: TLabel;
    memo_addr: TMemo;
    btn_ok: TButton;
    btn_cancel: TButton;
    procedure cmbAddrTypeChange(Sender: TObject);
    procedure btn_okClick(Sender: TObject);
    procedure btn_cancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    AddrType:integer;
    AddrName,AddrNO,FatherAddr,DevNO,Memo:string;
    { Public declarations }
  end;

var
  f_addr: Tf_addr;

implementation

{$R *.dfm}

uses u_lang,u_main,u_public;

procedure Tf_addr.cmbAddrTypeChange(Sender: TObject);
begin
  case cmbAddrType.ItemIndex of
  0:begin
      spEdit_Unit.Visible:=false;
      Label4.Visible :=false;
      spEdit_Floor.Visible:=false;
      Label5.Visible :=false;
      spEdit_Room.Visible :=false;
      Label8.Visible :=false;
    end;
  1:begin
      spEdit_Unit.Visible:=true;
      Label4.Visible :=true;
      spEdit_Floor.Visible:=false;
      Label5.Visible :=false;
      spEdit_Room.Visible :=false;
      Label8.Visible :=false;
    end;
  2:begin
      spEdit_Unit.Visible:=true;
      Label4.Visible :=true;
      spEdit_Floor.Visible:=true;
      Label5.Visible :=true;
      spEdit_Room.Visible :=true;
      Label8.Visible :=true;
    end;
  end;
end;

procedure Tf_addr.btn_okClick(Sender: TObject);
begin
  case cmbAddrType.ItemIndex of
  0:begin
      AddrType:=0;
      FatherAddr:=lang_msg_None;
      AddrName := spEdit_Building.Text + Label3.Caption;
      AddrNO := RightStr('000'+spEdit_Building.Text,bBit);
      DevNO:=edit_DevNO.Text;
      Memo:=memo_addr.Text;
    end;
  1:begin
      AddrType:=1;
      FatherAddr:=spEdit_Building.Text + Label3.Caption;
      AddrName := FatherAddr + spEdit_Unit.Text + Label4.Caption;
      AddrNO := RightStr('000'+spEdit_Building.Text,bBit) + RightStr('000'+spEdit_Unit.Text,uBit);
      DevNO:=edit_DevNO.Text;
      Memo:=memo_addr.Text;
    end;
  2:begin
      AddrType:=2;
      FatherAddr:=spEdit_Building.Text + Label3.Caption + spEdit_Unit.Text + Label4.Caption;
      AddrName := FatherAddr + spEdit_Floor.Text + RightStr('0'+spEdit_Room.Text,2) + Label8.Caption;
      AddrNO := RightStr('000'+spEdit_Building.Text,bBit) + RightStr('000'+spEdit_Unit.Text,uBit) + RightStr('000'+spEdit_Floor.Text,fBit) + RightStr('000'+spEdit_Room.Text,hBit);
      DevNO:=edit_DevNO.Text;
      Memo:=memo_addr.Text;
    end;
  end;
  ModalResult:=mrOK;
end;

procedure Tf_addr.btn_cancelClick(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

procedure Tf_addr.FormCreate(Sender: TObject);
begin
  Label6.Caption :=lang_labType;

  Label2.Caption :=lang_labDevNON;

  Label1.Caption :=lang_labAddr;
  Label3.Caption :=MainForm.cmbBName.Text;
  Label4.Caption :=MainForm.cmbUName.Text;
  Label5.Caption :=MainForm.cmbFName.Text;
  Label8.Caption :=MainForm.cmbHName.Text;

  Label7.Caption :=lang_labMemo;

  btn_ok.Caption :=lang_btnOK;
  btn_cancel.Caption:=lang_btnCancel;
  
  cmbAddrType.Items.Clear;
  cmbAddrType.Items.Add('楼栋');
  cmbAddrType.Items.Add('单元');
  cmbAddrType.Items.Add('住户');
  cmbAddrType.ItemIndex:=0;

  case StrToInt(MainForm.cmbBbit.Text) of
        1:spEdit_Building.MaxValue := 9;
        2:spEdit_Building.MaxValue := 99;
        3:spEdit_Building.MaxValue := 999;
        end;

  case StrToInt(MainForm.cmbUbit.Text) of
        1:spEdit_Unit.MaxValue := 9;
        2:spEdit_Unit.MaxValue := 99;
        3:spEdit_Unit.MaxValue := 999;
        end;

  case StrToInt(MainForm.cmbFbit.Text) of
        1:spEdit_Floor.MaxValue := 9;
        2:spEdit_Floor.MaxValue := 99;
        3:spEdit_Floor.MaxValue := 999;
        end;

  case StrToInt(MainForm.cmbHbit.Text) of
        1:spEdit_Room.MaxValue := 9;
        2:spEdit_Room.MaxValue := 99;
        3:spEdit_Room.MaxValue := 999;
        end;
end;

end.
