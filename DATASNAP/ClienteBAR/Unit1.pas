unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.ScrollBox, FMX.Memo, Datasnap.DSClientRest,
  ClientClassesUnit1, FMX.Edit, FMX.Layouts, FMX.EditBox, FMX.SpinBox;

type
  TfrmPrincipal = class(TForm)
    DSRestConnection1: TDSRestConnection;
    mMensagem: TMemo;
    Layout1: TLayout;
    btnFecharConta: TButton;
    btnChamarGarcon: TButton;
    btnPedirCerveja: TButton;
    lblMesa: TLabel;
    edtMesa: TSpinBox;
    procedure btnPedirCervejaClick(Sender: TObject);
    procedure btnChamarGarconClick(Sender: TObject);
    procedure btnFecharContaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    server: TyClient;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.fmx}

procedure TfrmPrincipal.btnPedirCervejaClick(Sender: TObject);
begin
  server.pedirCerveja(edtMesa.Text.ToInteger);
  mMensagem.Lines.Clear;
end;

procedure TfrmPrincipal.btnChamarGarconClick(Sender: TObject);
begin
  if mMensagem.Text.LastIndexOf('Débitos finalizados') <= 0 then
  begin
    server.chamarGarcom(edtMesa.Text.ToInteger);
    mMensagem.Lines.Clear;
  end;
end;

procedure TfrmPrincipal.btnFecharContaClick(Sender: TObject);
begin
  mMensagem.Text := server.fecharConta(edtMesa.Text.ToInteger);
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  server := TyClient.Create(DSRestConnection1);
end;

end.
