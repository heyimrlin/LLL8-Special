program L8C;

uses
  Forms,
  ActiveX,
  Controls,
  u_main in 'u_main.pas' {MainForm},
  u_addr in 'u_addr.pas' {f_addr},
  u_public in 'u_public.pas',
  u_dev in 'u_dev.pas' {f_dev},
  u_select15 in 'u_select15.pas' {f_select15},
  u_userAdmin in 'u_userAdmin.pas' {f_userAdmin},
  u_lang in 'u_lang.pas',
  login1 in 'login1.pas' {frm_login},
  u_alarmqry in 'u_alarmqry.pas' {f_alarmqry},
  u_recqry in 'u_recqry.pas' {f_recqry},
  u_AppName in 'u_AppName.pas' {f_AppName},
  u_dock in 'u_dock.pas' {f_dock},
  u_phone in 'u_phone.pas' {f_phone},
  u_config in 'u_config.pas' {f_config},
  u_treedevice in 'u_treedevice.pas' {f_treedevice},
  u_validtime in 'u_validtime.pas' {frm_validtime},
  u_screenshot in 'u_screenshot.pas' {frm_screenshot},
  u_reg_batch in 'u_reg_batch.pas' {frm_reg_batch},
  u_edit_unit in 'u_edit_unit.pas' {frm_edit_unit},
  u_valid_room in 'u_valid_room.pas' {frm_valid_room};

{$R *.res}

begin
  CoInitialize(nil);
  frm_login:=Tfrm_login.Create(Application);
  if frm_login.ShowModal = mrOK then
  begin
    Application.Initialize;
    Application.Title := 'LEELEN L8';
    Application.CreateForm(TMainForm, MainForm);
    frm_login.Close;
    CounInitialize;
    Application.Run;
  end
  else
    Application.Terminate;
end.
