unit ServerMethodsUnit1;

interface

uses System.SysUtils, System.Classes, System.Json,
    Datasnap.DSServer, Datasnap.DSAuth,
    System.StrUtils, Rest.JSON;

type
{$METHODINFO ON}
  Ty = class(TDataModule)
  private
    { Private declarations }
  public
    { Public declarations }
    function EchoString(Value: string): string;
    function ReverseString(Value: string): string;
    function updateDebito(nome: String): TJSONValue;
    function acceptDebito(nome: String): TJSONValue;
    procedure chamarGarcom(mesa: Integer);
    procedure pedirCerveja(mesa: Integer);
    function fecharConta(mesa: Integer): string;
    function cardapioDia: string;
  end;
{$METHODINFO OFF}

TDevedor = class
    private
      FNome: String;
      FValor: String;
    public
      property nome:  String read FNome  write FNome;
      property valor:  String read FValor  write FValor;
  end;


implementation

{$R *.dfm}

uses FormUnit1;

function Ty.EchoString(Value: string): string;
begin
  Result := Value;
end;

function Ty.updateDebito(nome: String): TJSONValue; //POST
var
  devedor: TDevedor;
begin
  devedor := TDevedor.Create;
  devedor.FValor := '25';
  devedor.FNome  := nome;
  result := TJSON.ObjectToJsonObject(devedor);
  Form1.mMensagem.Lines.Add(result.ToJSON);
  devedor.Free;
end;


function Ty.acceptDebito(nome: String): TJSONValue; //PUT
var
  devedor: TDevedor;
begin
  devedor := TDevedor.Create;
  devedor.FValor := '88';
  devedor.FNome  := nome;
  result := TJSON.ObjectToJsonObject(devedor);
  Form1.mMensagem.Lines.Add(result.ToJSON);
  devedor.Free;
end;

function Ty.fecharConta(mesa: Integer): string;
var
  total: Double;
  nome: string;
begin
  total := 0;
  case mesa of
    1: nome := 'Camila';
    2: nome := 'Bruno';
    3: nome := 'Sileide';
  end;
  Form1.mMensagem.Lines.Add('A mesa '+mesa.ToString+' pediu o fechamento da conta.');
  result := ' Débitos finalizados no valor de '+total.ToString+' reais. Deseja uma saideira? Press 1 = SIM. Press 2 = Não ';
end;

function Ty.cardapioDia: string;
var
  cardapio: string;
begin
  case dayofweek(now) of
    1: cardapio := 'Feijoada';
    2: cardapio := 'Rabada';
    3: cardapio := 'Ensopado';
    4: cardapio := 'Cozido';
    5: cardapio := 'Comida Baiana';
  end;
  result := cardapio;
end;

procedure Ty.chamarGarcom(mesa: Integer);
begin
  Form1.mMensagem.Lines.Add('Mesa '+mesa.ToString+' solicita atendimento do garçom!');
  Form1.mMensagem.Lines.Add('Existem pedidos pendentes para esta mesa');
  //Form1.mMensagem.Lines.Add('Não existem pedidos pendentes para esta mesa');
end;

procedure Ty.pedirCerveja(mesa: Integer);
var
  cerveja: string;
begin
  case mesa of
    1: cerveja := 'Heineken';
    2: cerveja := 'Heineken';
    3: cerveja := 'Stella';
  end;
  Form1.mMensagem.Lines.Add('Levar uma cerveja <'+cerveja+'> para a mesa '+mesa.ToString);
end;

function Ty.ReverseString(Value: string): string;
begin
  Result := System.StrUtils.ReverseString(Value);
end;

end.

