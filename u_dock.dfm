object f_dock: Tf_dock
  Left = 403
  Top = 222
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #25968#25454#23545#25509
  ClientHeight = 169
  ClientWidth = 174
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = -4
    Width = 174
    Height = 173
    TabOrder = 0
    object btn_create: TButton
      Left = 38
      Top = 24
      Width = 97
      Height = 25
      BiDiMode = bdLeftToRight
      Caption = #21019#24314#25968#25454#24211
      Enabled = False
      ParentBiDiMode = False
      TabOrder = 0
      OnClick = btn_createClick
    end
    object btn_restore: TButton
      Left = 38
      Top = 76
      Width = 97
      Height = 25
      Caption = #24674#22797#25968#25454
      TabOrder = 1
      OnClick = btn_restoreClick
    end
    object btn_backup: TButton
      Left = 38
      Top = 128
      Width = 97
      Height = 25
      Caption = #22791#20221#25968#25454
      TabOrder = 2
      OnClick = btn_backupClick
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 139
    Top = 70
  end
  object SaveDialog1: TSaveDialog
    Left = 140
    Top = 121
  end
end
