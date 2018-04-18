unit u_screenshot;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Jpeg, DB;

type
  Tfrm_screenshot = class(TForm)
    Image: TImage;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_screenshot: Tfrm_screenshot;

implementation

{$R *.dfm}
uses u_main;

procedure Tfrm_screenshot.FormShow(Sender: TObject);
var
  Stream:TMemoryStream;
  Jpg:TJpegImage;
begin
  Stream:=TMemoryStream.Create;
  Jpg:=TJpegImage.Create;
  TBlobField(MainForm.AdoQryCardRec.FieldByName('Screenshot')).SaveToStream(Stream);
  Stream.Position:=0;
  Jpg.LoadFromStream(Stream);
  Image.Picture.Assign(Jpg);
  Stream.Free;
  Jpg.Free;
end;

end.
