unit u_edit_unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls;

type
  Tfrm_edit_unit = class(TForm)
    Image10: TImage;
    Label47: TLabel;
    edit_unit_origin: TEdit;
    Label1: TLabel;
    edit_unit_dest: TEdit;
    btn_ok: TButton;
    procedure btn_okClick(Sender: TObject);
    procedure edit_unit_destKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_edit_unit: Tfrm_edit_unit;

implementation

{$R *.dfm}

procedure Tfrm_edit_unit.btn_okClick(Sender: TObject);
begin
  if Length(edit_unit_dest.Text)=4 then
  begin
    if MessageDlg('执行此操作，将同时修改本单元主机下的所有分机的号码！',mtConfirmation,[mbYes,mbNo],0) = mrYes then
    begin
      ModalResult := mrOK;
    end;
  end
  else begin
    ShowMessage('请输入正确的主机号！');
  end;
end;

procedure Tfrm_edit_unit.edit_unit_destKeyPress(Sender: TObject;
  var Key: Char);
begin
   if not (Key in [#8, #13, #127,'0'..'9']) then Key := #0;
end;

end.
