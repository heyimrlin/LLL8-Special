object f_phone: Tf_phone
  Left = 303
  Top = 237
  Width = 306
  Height = 485
  Caption = #31532#19977#26041#25509#21475#25511#21046#21488
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 289
    Height = 426
    ActivePage = TabSheet1
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #36890#35759#20449#24687
      object memo_info: TMemo
        Left = 0
        Top = 0
        Width = 281
        Height = 400
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
    object TabSheet2: TTabSheet
      Caption = #25509#25910#35760#24405
      ImageIndex = 1
      object memo_record: TMemo
        Left = 0
        Top = 0
        Width = 281
        Height = 400
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
  end
  object MainMenu1: TMainMenu
    Left = 24
    Top = 48
    object N1: TMenuItem
      Caption = #31995#32479#35774#32622'(&S)'
      object N11: TMenuItem
        Caption = #24320#21551#26381#21153'(&O)'
        OnClick = N11Click
      end
      object N12: TMenuItem
        Caption = #20851#38381#26381#21153'(&E)'
        Visible = False
        OnClick = N12Click
      end
      object N13: TMenuItem
        Caption = #26381#21153#22120#37197#32622'(&C)'
        Visible = False
        OnClick = N13Click
      end
    end
  end
  object Server: TIdTCPServer
    Bindings = <>
    CommandHandlers = <>
    DefaultPort = 0
    Greeting.NumericCode = 0
    MaxConnectionReply.NumericCode = 0
    OnExecute = ServerExecute
    OnDisconnect = ServerDisconnect
    ReplyExceptionCode = 0
    ReplyTexts = <>
    ReplyUnknownCommand.NumericCode = 0
    Left = 24
    Top = 88
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 24
    Top = 136
  end
end
