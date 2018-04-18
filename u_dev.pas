unit u_dev;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Spin, jpeg, ExtCtrls, StrUtils;

type
  Tf_dev = class(TForm)
    Image8: TImage;
    Label6: TLabel;
    cmbDevType: TComboBox;
    Label2: TLabel;
    edit_DevNO: TEdit;
    Label1: TLabel;
    Label9: TLabel;
    edit_DevIP: TEdit;
    Label7: TLabel;
    memo_dev: TMemo;
    btn_ok: TButton;
    btn_cancel: TButton;
    spEdit_Building: TSpinEdit;
    Label3: TLabel;
    spEdit_Unit: TSpinEdit;
    Label4: TLabel;
    spEdit_Floor: TSpinEdit;
    Label5: TLabel;
    spEdit_Room: TSpinEdit;
    Label8: TLabel;
    edit_AddrName: TEdit;
    Label10: TLabel;
    procedure cmbDevTypeChange(Sender: TObject);
    procedure btn_okClick(Sender: TObject);
    procedure btn_cancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    DevType:integer;
    AddrName,AddrNO,DevNO,DevIP,Memo:string;
    { Public declarations }
  end;

var
  f_dev: Tf_dev;

implementation

{$R *.dfm}

uses u_lang,u_public,u_main;

procedure Tf_dev.cmbDevTypeChange(Sender: TObject);
begin
  case cmbDevType.ItemIndex of
  0:begin
    Label1.Visible:=true;
    spEdit_Building.Visible:=true;
    Label3.Visible:=true;
    spEdit_Unit.Visible:=false;
    Label4.Visible :=false;
    spEdit_Floor.Visible:=false;
    Label5.Visible :=false;
    spEdit_Room.Visible:=false;
    Label8.Visible :=false;
    end;
  1,2:begin
    Label1.Visible:=true;
    spEdit_Building.Visible:=true;
    Label3.Visible:=true;
    spEdit_Unit.Visible:=true;
    Label4.Visible :=true;
    spEdit_Floor.Visible:=false;
    Label5.Visible :=false;
    spEdit_Room.Visible:=false;
    Label8.Visible :=false;
    end;
  3:begin
    Label1.Visible:=true;
    spEdit_Building.Visible:=true;
    Label3.Visible:=true;
    spEdit_Unit.Visible:=true;
    Label4.Visible :=true;
    spEdit_Floor.Visible:=true;
    Label5.Visible :=true;
    spEdit_Room.Visible:=true;
    Label8.Visible :=true;
    end;
  4:begin
    Label1.Visible:=false;
    spEdit_Building.Visible:=false;
    Label3.Visible:=false;
    spEdit_Unit.Visible:=false;
    Label4.Visible :=false;
    spEdit_Floor.Visible:=false;
    Label5.Visible :=false;
    spEdit_Room.Visible:=false;
    Label8.Visible :=false;
    end;
  end;
end;

procedure Tf_dev.btn_okClick(Sender: TObject);
begin
  case cmbDevType.ItemIndex of
  0:begin
      DevType:=0;
      AddrName:=spEdit_Building.Text + Label3.Caption;
      AddrNO:=RightStr('000'+spEdit_Building.Text,bBit);
      DevNO:=edit_DevNO.Text;
      Memo:=memo_dev.Text;
    end;
  1:begin
      DevType:=1;
      AddrName := spEdit_Building.Text + Label3.Caption + spEdit_Unit.Text + Label4.Caption;
      AddrNO := RightStr('000'+spEdit_Building.Text,bBit) + RightStr('000'+spEdit_Unit.Text,uBit);
      DevNO:=edit_DevNO.Text;
      Memo:=memo_dev.Text;
    end;
  2:begin
      DevType:=2;
      AddrName := spEdit_Building.Text + Label3.Caption + spEdit_Unit.Text + Label4.Caption;
      AddrNO := RightStr('000'+spEdit_Building.Text,bBit) + RightStr('000'+spEdit_Unit.Text,uBit);
      DevNO:=edit_DevNO.Text;
      Memo:=memo_dev.Text;
    end;
  3:begin
      DevType:=3;
      AddrName := spEdit_Building.Text + Label3.Caption + spEdit_Unit.Text + Label4.Caption + spEdit_Floor.Text + RightStr('0'+spEdit_Room.Text,2) + Label8.Caption;
      AddrNO := RightStr('000'+spEdit_Building.Text,bBit) + RightStr('000'+spEdit_Unit.Text,uBit) + RightStr('000'+spEdit_Floor.Text,fBit) + RightStr('000'+spEdit_Room.Text,hBit);
      DevNO:=edit_DevNO.Text;
      Memo:=memo_dev.Text;
    end;
  4:begin
      DevType:=4;
      DevNO:=edit_DevNO.Text;
      Memo:=memo_dev.Text;
    end;
  else
  end;
  DevIP:=edit_DevIP.Text;
  ModalResult:=mrOK;
end;

procedure Tf_dev.btn_cancelClick(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

procedure Tf_dev.FormCreate(Sender: TObject);
begin
  Label6.Caption :=lang_labType;

  Label2.Caption :=lang_labDevNON;

  Label10.Caption :=lang_labAddr;
  Label3.Caption :=MainForm.cmbBName.Text;
  Label4.Caption :=MainForm.cmbUName.Text;
  Label5.Caption :=MainForm.cmbFName.Text;
  Label8.Caption :=MainForm.cmbHName.Text;

  Label7.Caption :=lang_labMemo;

  btn_ok.Caption :=lang_btnOK;
  btn_cancel.Caption:=lang_btnCancel;

  cmbDevType.Items.Clear;
  cmbDevType.Items.Add(lang_devType0);
  cmbDevType.Items.Add(lang_devType1);
  cmbDevType.Items.Add(lang_devType2);
  cmbDevType.Items.Add(lang_devType3);
  cmbDevType.Items.Add(lang_devType4);
  cmbDevType.ItemIndex:=0;

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
