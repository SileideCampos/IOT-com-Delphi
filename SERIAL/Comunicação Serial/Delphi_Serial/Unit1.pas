unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, CPort;

type
  TFPrincipal = class(TForm)
    ComPort1: TComPort;
    ComDataPacket1: TComDataPacket;
    edtDadosEnviados: TEdit;
    edtDadosRecebidos: TEdit;
    btnEnviarDados: TButton;
    procedure ComDataPacket1Packet(Sender: TObject; const Str: string);
    procedure btnEnviarDadosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
      tag: string;
  end;

var
  FPrincipal: TFPrincipal;


implementation

{$R *.dfm}

procedure TFPrincipal.btnEnviarDadosClick(Sender: TObject);
begin
  ComPort1.WriteStr(edtDadosEnviados.Text);
end;

procedure TFPrincipal.ComDataPacket1Packet(Sender: TObject; const Str: string);
begin
  Sleep(10);

  if (Trim(Str)='') then
    Exit;

  tag := tag + Str;
  edtDadosRecebidos.Text := tag;

  if Length(Trim(tag)) > 11 then
    tag := '';

end;

end.
