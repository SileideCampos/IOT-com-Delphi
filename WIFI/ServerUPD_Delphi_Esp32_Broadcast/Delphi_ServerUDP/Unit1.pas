unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Edit, IdBaseComponent, IdComponent,
  IdCustomTCPServer, IdTCPServer, IdUDPServer, IdGlobal, IdSocketHandle,
  IdUDPBase, FMX.ScrollBox, FMX.Memo, System.Actions, FMX.ActnList, IdIntercept,
  FMX.Layouts;

type
  TForm1 = class(TForm)
    mDadosRecebidos: TMemo;
    Layout1: TLayout;
    edtPorta: TEdit;
    btnAbrirConexao: TButton;
    lblTitulo: TLabel;
    IdUDPServer: TIdUDPServer;
    procedure btnAbrirConexaoClick(Sender: TObject);
    procedure IdUDPServerUDPRead(AThread: TIdUDPListenerThread;
      const AData: TIdBytes; ABinding: TIdSocketHandle);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.btnAbrirConexaoClick(Sender: TObject);
begin
  IdUDPServer.DefaultPort := edtPorta.Text.ToInteger;
  IdUDPServer.Active := True;
end;

procedure TForm1.IdUDPServerUDPRead(AThread: TIdUDPListenerThread;
  const AData: TIdBytes; ABinding: TIdSocketHandle);
begin
  mDadosRecebidos.Lines.Add(BytesToString(AData));
end;

end.
