unit u_recqry;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, jpeg, ExtCtrls, StrUtils;

type
  Tf_recqry = class(TForm)
    Image8: TImage;
    btn_cancel: TButton;
    btn_ok: TButton;
    dt1: TDateTimePicker;
    Label4: TLabel;
    dt0: TDateTimePicker;
    Label3: TLabel;
    Label5: TLabel;
    edit_recDev: TEdit;
    cmbCardType: TComboBox;
    Label1: TLabel;
    edit_cardNO: TEdit;
    Label2: TLabel;
    procedure btn_okClick(Sender: TObject);
    procedure btn_cancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    CardType:integer;
    CardNO,RecDev,RecTime0,RecTime1:string;
    { Public declarations }
  end;

var
  f_recqry: Tf_recqry;

implementation

{$R *.dfm}
uses u_public, u_lang;

procedure Tf_recqry.btn_okClick(Sender: TObject);
begin
  CardType:=cmbCardType.ItemIndex;
  CardNO:=edit_cardNO.Text;
  RecDev:=edit_recDev.Text;
  RecTime0:=LeftStr(GetRegTime(FormatDateTime('YYYYMMDD',dt0.DateTime)),10)+' 00:00';
  RecTime1:=LeftStr(GetRegTime(FormatDateTime('YYYYMMDD',dt1.DateTime)),10)+' 23:59';
  ModalResult:=mrOK;
end;

procedure Tf_recqry.btn_cancelClick(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

procedure Tf_recqry.FormCreate(Sender: TObject);
begin
  {Label1.Caption :=lang_dgCardRecColum1;
  Label2.Caption :=lang_dgCardRecColum2;
  Label5.Caption :=lang_dgCardRecColum3;
  Label3.Caption :=lang_dgCardRecColum4;}
  Label4.Caption :=lang_labTo;
  btn_ok.Caption :=lang_btnOK;
  btn_cancel.Caption:=lang_btnCancel;
  cmbCardType.Items.Clear;
  cmbCardType.Items.Add(lang_cardTypeV+'/'+lang_cardTypeC);
  cmbCardType.Items.Add(lang_cardTypeV+'/'+lang_cardType3);
  cmbCardType.Items.Add(lang_cardTypeX+'/'+lang_cardTypeC);
  cmbCardType.Items.Add(lang_cardTypeX+'/'+lang_cardType3);
  cmbCardType.Items.Add('主机密码开门');
  cmbCardType.Items.Add('主机呼叫(抓拍)');
  cmbCardType.Items.Add('主机呼叫(振铃)');
  cmbCardType.Items.Add('主机呼叫(摘机)');
  cmbCardType.Items.Add('主机呼叫(开门)');
  cmbCardType.ItemIndex:=0;

  dt0.DateTime:=Now();
  dt1.DateTime:=Now();
end;

end.
