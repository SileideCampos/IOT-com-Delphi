object Form1: TForm1
  Left = 271
  Top = 114
  Caption = 'Form1'
  ClientHeight = 310
  ClientWidth = 317
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 1
    Width = 20
    Height = 13
    Caption = 'Port'
  end
  object ButtonStart: TButton
    Left = 144
    Top = 18
    Width = 75
    Height = 25
    Caption = 'Start'
    TabOrder = 0
    OnClick = ButtonStartClick
  end
  object ButtonStop: TButton
    Left = 225
    Top = 18
    Width = 75
    Height = 25
    Caption = 'Stop'
    TabOrder = 1
    OnClick = ButtonStopClick
  end
  object editPort: TEdit
    Left = 16
    Top = 20
    Width = 121
    Height = 21
    TabOrder = 2
    Text = '8080'
  end
  object ButtonOpenBrowser: TButton
    Left = 16
    Top = 47
    Width = 284
    Height = 25
    Caption = 'Open Browser'
    TabOrder = 3
    OnClick = ButtonOpenBrowserClick
  end
  object mMensagem: TMemo
    Left = 0
    Top = 78
    Width = 317
    Height = 232
    Align = alBottom
    TabOrder = 4
  end
  object ApplicationEvents1: TApplicationEvents
    OnIdle = ApplicationEvents1Idle
    Left = 264
    Top = 105
  end
end
