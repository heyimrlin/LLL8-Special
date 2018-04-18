unit u_validtime;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, jpeg;

type
  Tfrm_validtime = class(TForm)
    Image8: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    date_valid: TDateTimePicker;
    edit_cardNO: TEdit;
    edit_name: TEdit;
    btn_ok: TButton;
    btn_cancel: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btn_okClick(Sender: TObject);
    procedure btn_cancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_validtime: Tfrm_validtime;

implementation

{$R *.dfm}

procedure Tfrm_validtime.FormCreate(Sender: TObject);
begin
  date_valid.DateTime:=Now();
end;

procedure Tfrm_validtime.btn_okClick(Sender: TObject);
begin
  ModalResult:=mrOK;
end;

procedure Tfrm_validtime.btn_cancelClick(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

end.
