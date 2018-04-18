unit u_dock;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  Tf_dock = class(TForm)
    GroupBox1: TGroupBox;
    btn_create: TButton;
    btn_restore: TButton;
    btn_backup: TButton;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    procedure FormCreate(Sender: TObject);
    procedure btn_createClick(Sender: TObject);
    procedure btn_restoreClick(Sender: TObject);
    procedure btn_backupClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_dock: Tf_dock;

implementation

{$R *.dfm}

uses u_main, u_public, u_lang;

procedure Tf_dock.FormCreate(Sender: TObject);
begin
  if Get_RecCount('select * from master.dbo.sysdatabases where name='+QuotedStr('PoliceDataSystem'),MainForm.AdoConDock)<1 then
    btn_create.Enabled:=true
  else
    btn_create.Enabled:=false;
end;

procedure Tf_dock.btn_createClick(Sender: TObject);
var
  sqlStr:string;
begin
  try
    sqlStr:='Create database PoliceDataSystem On Primary (name='+QuotedStr('PoliceDataSystem_data')+',filename='+QuotedStr(Get_SQLDataPathFromReg()+'PoliceDataSystem_Data.MDF')+',size=3,maxsize=unlimited,filegrowth=1) Log On (name='+QuotedStr('PoliceDataSystem_log')+',filename='+QuotedStr(Get_SQLDataPathFromReg()+'PoliceDataSystem_Log.LDF')+',size=1,maxsize=20,filegrowth=10%)';
    MainForm.AdoConDock.Execute(sqlStr);
    ShowMessage(lang_msg_CreateFinish);
    btn_create.Enabled:=false;
  except
    ShowMessage(lang_msg_CreateFail);
  end;
end;

procedure Tf_dock.btn_restoreClick(Sender: TObject);
var
  db_file:string;
  db_from,db_to,db_LogFrom,db_LogTo:string;
begin
  if OpenDialog1.Execute then
  begin
    db_file:=OpenDialog1.FileName;
    if Messagedlg(lang_msg_RestoreConfirm+db_file+lang_msg_RestoreInto+'PoliceDataSystem'+' '+lang_msg_DelEnd,mtConfirmation,[mbYes,mbNo],0)=mrYes then
    begin
      db_from:='PoliceDataSystem_Data';
      db_to:=Get_SQLDataPathFromReg()+'PoliceDataSystem_Data.MDF';
      db_LogFrom:='PoliceDataSystem_Log';
      db_LogTo:=Get_SQLDataPathFromReg()+'PoliceDataSystem_Log.LDF';

      try
        try
          with MainForm.AdoConDock do
          begin
            Execute('RESTORE DATABASE PoliceDataSystem from disk='+QuotedStr(db_file)+' WITH RECOVERY,'+
              'REPLACE,MOVE '+QuotedStr(db_from)+' TO '+QuotedStr(db_to)+',MOVE '+QuotedStr(db_LogFrom)+' TO '+QuotedStr(db_LogTo));
            ShowMessage(lang_msg_RestoreFinish);
            MainForm.AdoConDock.Close;
          end;
        finally
          MainForm.AdoConDock.Free;
        end;
      except
        ShowMessage(lang_msg_RestoreFail);
      end;
    end
    else begin
      Exit;
    end;
  end;
end;

procedure Tf_dock.btn_backupClick(Sender: TObject);
var
  nm:string;
begin
  if SaveDialog1.Execute then
  begin
    nm:=SaveDialog1.FileName;
    if FileExists(SaveDialog1.FileName) then
    begin
      ShowMessage(lang_msg_FileName);
      Exit;
    end
    else begin
      try
        MainForm.AdoConDock.Execute('backup database PoliceDataSystem to disk='+QuotedStr(nm));
        ShowMessage(lang_msg_BackupFinish);
      except
        ShowMessage(lang_msg_BackupFail);
      end;
    end;
  end;
end;

end.
