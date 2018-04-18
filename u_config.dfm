object f_config: Tf_config
  Left = 192
  Top = 130
  Width = 361
  Height = 196
  Caption = #26381#21153#22120#37197#32622
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = -8
    Width = 345
    Height = 166
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #24494#36719#38597#40657
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 59
      Top = 40
      Width = 99
      Height = 21
      Alignment = taRightJustify
      Caption = #26381#21153#22120'IP'#22320#22336':'
    end
    object Label2: TLabel
      Left = 74
      Top = 80
      Width = 84
      Height = 21
      Alignment = taRightJustify
      BiDiMode = bdLeftToRight
      Caption = #26381#21153#22120#31471#21475':'
      ParentBiDiMode = False
    end
    object edit_ip: TEdit
      Left = 169
      Top = 35
      Width = 121
      Height = 29
      ImeName = #20013#25991'('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
      TabOrder = 0
    end
    object btn_save: TButton
      Left = 168
      Top = 126
      Width = 75
      Height = 25
      Caption = #20445#23384
      TabOrder = 1
      OnClick = btn_saveClick
    end
    object edit_port: TEdit
      Left = 168
      Top = 75
      Width = 121
      Height = 29
      ImeName = #20013#25991'('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
      TabOrder = 2
    end
  end
end
