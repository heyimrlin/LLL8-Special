unit u_alarmqry;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, jpeg, ExtCtrls, StrUtils;

type
  Tf_alarmqry = class(TForm)
    Image8: TImage;
    Label1: TLabel;
    cmbAlarmType: TComboBox;
    Label2: TLabel;
    edit_devNO: TEdit;
    Label3: TLabel;
    dt0: TDateTimePicker;
    Label4: TLabel;
    dt1: TDateTimePicker;
    btn_ok: TButton;
    btn_cancel: TButton;
    Label5: TLabel;
    cmbAlarmStatus: TComboBox;
    Label6: TLabel;
    cmbAlarmSolved: TComboBox;
    procedure btn_okClick(Sender: TObject);
    procedure btn_cancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    AlarmType,AlarmStatus,AlarmSolved:Integer;
    DevNO,AlarmTime0,AlarmTime1:string;
    { Public declarations }
  end;

var
  f_alarmqry: Tf_alarmqry;

implementation

{$R *.dfm}
uses u_public, u_lang;

procedure Tf_alarmqry.btn_okClick(Sender: TObject);
begin
  AlarmType:=cmbAlarmType.ItemIndex;
  AlarmStatus:=cmbAlarmStatus.ItemIndex;
  AlarmSolved:=cmbAlarmSolved.ItemIndex;
  DevNO:=edit_devNO.Text;
  AlarmTime0:=LeftStr(GetRegTime(FormatDateTime('YYYYMMDD',dt0.DateTime)),10)+' 00:00';
  AlarmTime1:=LeftStr(GetRegTime(FormatDateTime('YYYYMMDD',dt1.DateTime)),10)+' 23:59';
  ModalResult:=mrOK;
end;

procedure Tf_alarmqry.btn_cancelClick(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

procedure Tf_alarmqry.FormCreate(Sender: TObject);
begin
  Label1.Caption :=lang_dgAlarmColum1;
  Label2.Caption :=lang_labAddr;
  Label3.Caption :=lang_dgAlarmColum4;
  Label4.Caption :=lang_labTo;
  btn_ok.Caption :=lang_btnOK;
  btn_cancel.Caption:=lang_btnCancel;

  cmbAlarmType.Items.Clear;
  cmbAlarmType.Items.Add(lang_alarmType0);
  cmbAlarmType.Items.Add('防区触发报警');
  cmbAlarmType.Items.Add('胁迫开门报警');
  cmbAlarmType.Items.Add('开门超时报警');
  cmbAlarmType.ItemIndex:=0;

  cmbAlarmStatus.Items.Clear;
  cmbAlarmStatus.Items.Add('未读');
  cmbAlarmStatus.Items.Add('已读');
  cmbAlarmStatus.ItemIndex:=0;

  cmbAlarmSolved.Items.Clear;
  cmbAlarmSolved.Items.Add('未处理');
  cmbAlarmSolved.Items.Add('已处理');
  cmbAlarmSolved.ItemIndex:=0;

  dt0.DateTime:=Now();
  dt1.DateTime:=Now();
end;

end.
