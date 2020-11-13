unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, IdBaseComponent, IdComponent,
  IdUDPBase, IdUDPClient, FMX.Edit, FMX.Colors, IdEchoUDP, FMX.Layouts,
  IdUDPServer, IdTCPConnection, IdTCPClient;

type
  TF_Wifi = class(TForm)
    udp: TIdUDPClient;
    btnLigar: TButton;
    btnDesligar: TButton;
    btnReceber: TButton;
    edtReceive: TEdit;
    layConfig: TLayout;
    lblTitulo: TLabel;
    edtIP: TEdit;
    edtPort: TEdit;
    btnConexao: TButton;
    ColorBox1: TColorBox;
    layEnviarTexto: TLayout;
    layEnvios: TLayout;
    edtEnvio: TEdit;
    btnEnviar: TButton;
    layReceber: TLayout;
    ColorBox2: TColorBox;
    procedure btnConexaoClick(Sender: TObject);
    procedure btnLigarClick(Sender: TObject);
    procedure btnDesligarClick(Sender: TObject);
    procedure btnReceberClick(Sender: TObject);
    procedure btnEnviarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Wifi: TF_Wifi;

implementation

{$R *.fmx}

procedure TF_Wifi.btnConexaoClick(Sender: TObject);
begin
  udp.Disconnect;
  udp.Host := edtIP.Text;
  udp.Port := edtPort.Text.ToInteger;
  udp.Connect;
  sleep(1000);
  if udp.Connected then
    ShowMessage('Conectado')
  else
    ShowMessage('Desconectado');
end;

procedure TF_Wifi.btnDesligarClick(Sender: TObject);
begin
  udp.Send('desligar');
end;

procedure TF_Wifi.btnEnviarClick(Sender: TObject);
begin
  udp.Send(edtEnvio.Text);
end;

procedure TF_Wifi.btnLigarClick(Sender: TObject);
begin
  udp.Send('ligar');
end;

procedure TF_Wifi.btnReceberClick(Sender: TObject);
begin
  udp.Send('TEMPE');
  edtReceive.Text := udp.ReceiveString(700);
end;

end.
