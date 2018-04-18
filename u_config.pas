unit u_config;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Inifiles;

type
  Tf_config = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    edit_ip: TEdit;
    btn_save: TButton;
    edit_port: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure btn_saveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_config: Tf_config;

implementation

uses u_main, u_public;

{$R *.dfm}

procedure Tf_config.FormCreate(Sender: TObject);
begin
  edit_ip.Text   := ip;
  edit_port.Text := port;
end;

procedure Tf_config.btn_saveClick(Sender: TObject);
var
  path_file_name:string;
  f:TInifile;
begin
  path_file_name :=  GetCurrentDir+'\config.ini';
  if not FileExists(path_file_name) then
  begin
    ShowMessage('»±…Ÿ≈‰÷√Œƒº˛');
  end
  else begin
    f := TIniFile.Create(path_file_name);

    f.WriteString('server','IP',edit_ip.Text);
    f.WriteString('server','Port',edit_port.Text);

    ip:=edit_ip.Text;
    port:=edit_port.Text;

    f.Free;
  end;
  ModalResult:=mrOK;
end;

end.
