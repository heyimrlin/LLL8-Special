unit u_AppName;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls;

type
  Tf_AppName = class(TForm)
    Image8: TImage;
    Label1: TLabel;
    edit_AppName: TEdit;
    btn_save: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btn_saveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_AppName: Tf_AppName;

implementation

{$R *.dfm}
uses u_main, u_lang;

procedure Tf_AppName.FormCreate(Sender: TObject);
begin
  Label1.Caption  :=lang_labName;
  btn_save.Caption:=lang_btnSave;
  edit_AppName.Text:=MainForm.Panel2.Caption;
end;

procedure Tf_AppName.btn_saveClick(Sender: TObject);
begin
  ModalResult:=mrOK;
end;

end.
