object FPrincipal: TFPrincipal
  Left = 0
  Top = 0
  Caption = 'FPrincipal'
  ClientHeight = 208
  ClientWidth = 362
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object edtDadosEnviados: TEdit
    Left = 16
    Top = 43
    Width = 129
    Height = 21
    TabOrder = 0
  end
  object edtDadosRecebidos: TEdit
    Left = 16
    Top = 85
    Width = 264
    Height = 21
    TabOrder = 1
  end
  object btnEnviarDados: TButton
    Left = 151
    Top = 41
    Width = 129
    Height = 25
    Caption = 'EnviarDados'
    TabOrder = 2
    OnClick = btnEnviarDadosClick
  end
  object ComPort1: TComPort
    Connected = True
    BaudRate = br115200
    Port = 'COM14'
    Parity.Bits = prNone
    StopBits = sbOneStopBit
    DataBits = dbEight
    DiscardNull = True
    Events = [evRxChar, evTxEmpty, evRxFlag, evRing, evBreak, evCTS, evDSR, evError, evRLSD, evRx80Full]
    Buffer.InputSize = 8
    Buffer.OutputSize = 4024
    FlowControl.OutCTSFlow = False
    FlowControl.OutDSRFlow = False
    FlowControl.ControlDTR = dtrDisable
    FlowControl.ControlRTS = rtsDisable
    FlowControl.XonXoffOut = False
    FlowControl.XonXoffIn = False
    StoredProps = [spBasic]
    TriggersOnRxChar = False
    SyncMethod = smNone
    Left = 120
    Top = 144
  end
  object ComDataPacket1: TComDataPacket
    ComPort = ComPort1
    CaseInsensitive = True
    IncludeStrings = True
    MaxBufferSize = 4024
    OnPacket = ComDataPacket1Packet
    Left = 40
    Top = 144
  end
end
