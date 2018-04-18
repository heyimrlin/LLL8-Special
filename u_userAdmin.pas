unit u_userAdmin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls;

type
  Tf_userAdmin = class(TForm)
    Image8: TImage;
    Label1: TLabel;
    edit_name: TEdit;
    Label2: TLabel;
    edit_psw: TEdit;
    Label3: TLabel;
    cbb_permit: TComboBox;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_userAdmin: Tf_userAdmin;

implementation

{$R *.dfm}

uses u_main, u_lang;

procedure Tf_userAdmin.Button1Click(Sender: TObject);
begin
  if edit_name.Text='' then
  begin
    ShowMessage(lang_msg_EnterUser);
    edit_name.SetFocus;
  end
  else if edit_psw.Text='' then
  begin
    ShowMessage(lang_msg_EnterPsw);
    edit_psw.SetFocus;
  end
  else if cbb_permit.Text='' then
  begin
    ShowMessage(lang_msg_ChoosePermit);
    cbb_permit.SetFocus;
  end
  else
    ModalResult:=mrOK;
end;

procedure Tf_userAdmin.FormCreate(Sender: TObject);
begin
  Label1.Caption :=lang_labUserName;
  Label2.Caption :=lang_labPassword;
  Label3.Caption :=lang_labPermission;
  Button1.Caption:=lang_btnOK;
  cbb_permit.Items.Clear;
  cbb_permit.Items.Add(lang_userType0);
  cbb_permit.Items.Add(lang_userType1);
end;

end.
