unit u_reg_batch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls, Spin, DB, ADODB, StrUtils;

type
  Tfrm_reg_batch = class(TForm)
    Image3: TImage;
    Label37: TLabel;
    seNo: TSpinEdit;
    Label1: TLabel;
    edt_UnitMac: TEdit;
    edt_unit: TEdit;
    edt_user: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    edt_ANUM: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    edt_NO: TEdit;
    edt_AName: TEdit;
    edt_CNUM: TEdit;
    AdoQryAddress: TADOQuery;
    AdoQryAddressID: TAutoIncField;
    AdoQryAddressAddrType: TIntegerField;
    AdoQryAddressAddrName: TStringField;
    AdoQryAddressAddrNO: TStringField;
    AdoQryAddressFatherAddr: TStringField;
    AdoQryAddressDevNO: TStringField;
    AdoQryAddressMemo: TStringField;
    edt_CardNO: TEdit;
    edt_unit_room: TEdit;
    Label9: TLabel;
    edt_user_room: TEdit;
    AdoQryCard_Room: TADOQuery;
    AdoQryCard_RoomID: TAutoIncField;
    AdoQryCard_RoomPersonName: TStringField;
    AdoQryCard_RoomCardType: TIntegerField;
    AdoQryCard_RoomCardNO: TStringField;
    AdoQryCard_RoomCardState: TIntegerField;
    AdoQryCard_RoomCardHex: TStringField;
    AdoQryCard_RoomunitMac: TStringField;
    AdoQryCard_RoomuserMac: TStringField;
    AdoQryCard_Roomuser6: TStringField;
    AdoQryCard_RoomisWall: TIntegerField;
    AdoQryCard_RoomCardMemo: TStringField;
    AdoQryCard_RoomValidTime: TStringField;
    btn_start: TButton;
    btn_end: TButton;
    Label10: TLabel;
    procedure edt_UnitMacDblClick(Sender: TObject);
    procedure edt_CardNOChange(Sender: TObject);
    procedure btn_startClick(Sender: TObject);
    procedure btn_endClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edt_UnitMacChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_reg_batch: Tfrm_reg_batch;

implementation

uses u_treedevice,u_main,u_public,u_lang;

{$R *.dfm}

procedure Tfrm_reg_batch.edt_UnitMacDblClick(Sender: TObject);
var
  i:Integer;
begin
  f_treedevice := Tf_treedevice.Create(nil);
  f_treedevice.TreeType:=2;
  if f_treedevice.ShowModal=mrOK then
  begin
    edt_UnitMac.Text := f_treedevice.DevName;
    edt_unit.Text := f_treedevice.UnitStr;
    edt_user.Text := f_treedevice.UserStr;

    RefreshRec(AdoQryAddress,'select * from t_addr where AddrType=2 and DevNO like'+QuotedStr(edt_unit.Text+'-'+'%'));
    edt_ANUM.Text := IntToStr(AdoQryAddress.RecordCount);

    AdoQryAddress.First;
    i:=1;
    edt_NO.Text := IntToStr(i);
    edt_ANAME.Text := AdoQryAddress.FieldByName('AddrName').AsString;
    edt_unit_room.Text := LeftStr(AdoQryAddress.FieldByName('DevNO').AsString,4);
    edt_user_room.Text := RightStr(AdoQryAddress.FieldByName('DevNO').AsString,4);

    RefreshRec(AdoQryCard_Room,'select * from t_card where unitMac='+QuotedStr(edt_unit_room.Text)+' and userMac='+QuotedStr(edt_user_room.Text));
    edt_CNUM.Text := IntToStr(AdoQryCard_Room.RecordCount);
    while (StrToInt(edt_CNUM.Text)>=StrToInt(seNO.Text)) and (StrToInt(edt_NO.Text)<StrToInt(edt_ANUM.Text)) do
    begin
      AdoQryAddress.Next;
      i := i+1;
      edt_NO.Text := IntToStr(i);
      edt_ANAME.Text := AdoQryAddress.FieldByName('AddrName').AsString;
      edt_unit_room.Text := LeftStr(AdoQryAddress.FieldByName('DevNO').AsString,4);
      edt_user_room.Text := RightStr(AdoQryAddress.FieldByName('DevNO').AsString,4);

      RefreshRec(AdoQryCard_Room,'select * from t_card where unitMac='+QuotedStr(edt_unit_room.Text)+' and userMac='+QuotedStr(edt_user_room.Text));
      edt_CNUM.Text := IntToStr(AdoQryCard_Room.RecordCount);
    end;
  end;
end;

procedure Tfrm_reg_batch.edt_CardNOChange(Sender: TObject);
var
  i:Integer;
begin
  if (StrToInt(edt_NO.Text)>=StrToInt(edt_ANUM.Text)) and (StrToInt(edt_CNUM.Text)>=StrToInt(seNO.Text)) then
  begin
    ShowMessage(edt_UnitMac.Text+'：批量发卡已完成！');
    Exit;
  end;

  with MainForm.DBGridPerson.DataSource.DataSet do
  begin
    Open;
    Append;
    FieldByName('PersonName').AsString:=lang_labDefaultName;
    FieldByName('CardType').AsInteger:=0;
    FieldByName('CardNO').AsString:=edt_CardNO.Text;
    FieldByName('CardState').AsInteger:=0;
    FieldByName('ValidTime').AsString:='2050-12-31 24:00:00';
    FieldByName('unitMac').AsString:=edt_unit_room.Text;
    FieldByName('userMac').AsString:=edt_user_room.Text;
    FieldByName('isWall').AsInteger:=0;
    Post;

    MainForm.card_download.Click;
  end;

  AdoQryAddress.First;
  i:=1;
  edt_NO.Text := IntToStr(i);
  edt_ANAME.Text := AdoQryAddress.FieldByName('AddrName').AsString;
  edt_unit_room.Text := LeftStr(AdoQryAddress.FieldByName('DevNO').AsString,4);
  edt_user_room.Text := RightStr(AdoQryAddress.FieldByName('DevNO').AsString,4);

  RefreshRec(AdoQryCard_Room,'select * from t_card where unitMac='+QuotedStr(edt_unit_room.Text)+' and userMac='+QuotedStr(edt_user_room.Text));
  edt_CNUM.Text := IntToStr(AdoQryCard_Room.RecordCount);
  while (StrToInt(edt_CNUM.Text)>=StrToInt(seNO.Text)) and (StrToInt(edt_NO.Text)<StrToInt(edt_ANUM.Text)) do
  begin
    AdoQryAddress.Next;
    i := i+1;
    edt_NO.Text := IntToStr(i);
    edt_ANAME.Text := AdoQryAddress.FieldByName('AddrName').AsString;
    edt_unit_room.Text := LeftStr(AdoQryAddress.FieldByName('DevNO').AsString,4);
    edt_user_room.Text := RightStr(AdoQryAddress.FieldByName('DevNO').AsString,4);

    RefreshRec(AdoQryCard_Room,'select * from t_card where unitMac='+QuotedStr(edt_unit_room.Text)+' and userMac='+QuotedStr(edt_user_room.Text));
    edt_CNUM.Text := IntToStr(AdoQryCard_Room.RecordCount);
  end;
end;

procedure Tfrm_reg_batch.btn_startClick(Sender: TObject);
begin
  isBatch := true;
  btn_start.Enabled := false;
  btn_end.Enabled := true;
  seNO.Enabled := false;
end;

procedure Tfrm_reg_batch.btn_endClick(Sender: TObject);
begin
  isBatch := false;
  btn_start.Enabled := true;
  btn_end.Enabled := false;
  seNO.Enabled := true;
end;

procedure Tfrm_reg_batch.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  isBatch := false;
  btn_start.Enabled := true;
  btn_end.Enabled := false;
  seNO.Enabled := true;
end;

procedure Tfrm_reg_batch.edt_UnitMacChange(Sender: TObject);
begin
  if edt_UnitMac.Text<>'' then
  begin
    btn_start.Enabled := true;
  end
  else begin
    btn_start.Enabled := false;
  end;
end;

end.
