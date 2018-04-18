unit u_valid_room;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, ComCtrls, StdCtrls;

type
  Tfrm_valid_room = class(TForm)
    Image3: TImage;
    Label3: TLabel;
    date_valid: TDateTimePicker;
    Label1: TLabel;
    edit_name: TEdit;
    btn_ok: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btn_okClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_valid_room: Tfrm_valid_room;

implementation

{$R *.dfm}

procedure Tfrm_valid_room.FormCreate(Sender: TObject);
begin
  date_valid.DateTime := Now();
end;

procedure Tfrm_valid_room.btn_okClick(Sender: TObject);
begin
  ModalResult := mrOK;
end;

end.
