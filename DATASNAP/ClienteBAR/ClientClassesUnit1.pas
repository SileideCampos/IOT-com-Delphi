//
// Created by the DataSnap proxy generator.
// 27/10/2020 18:20:42
//

unit ClientClassesUnit1;

interface

uses System.JSON, Datasnap.DSProxyRest, Datasnap.DSClientRest, Data.DBXCommon, Data.DBXClient, Data.DBXDataSnap, Data.DBXJSON, Datasnap.DSProxy, System.Classes, System.SysUtils, Data.DB, Data.SqlExpr, Data.DBXDBReaders, Data.DBXCDSReaders, Data.DBXJSONReflect;

type
  TyClient = class(TDSAdminRestClient)
  private
    FEchoStringCommand: TDSRestCommand;
    FReverseStringCommand: TDSRestCommand;
    FchamarGarcomCommand: TDSRestCommand;
    FpedirCervejaCommand: TDSRestCommand;
    FfecharContaCommand: TDSRestCommand;
    FcardapioDiaCommand: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function EchoString(Value: string; const ARequestFilter: string = ''): string;
    function ReverseString(Value: string; const ARequestFilter: string = ''): string;
    procedure chamarGarcom(mesa: Integer);
    procedure pedirCerveja(mesa: Integer);
    function fecharConta(mesa: Integer; const ARequestFilter: string = ''): string;
    function cardapioDia(const ARequestFilter: string = ''): string;
  end;

const
  Ty_EchoString: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'Value'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  Ty_ReverseString: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'Value'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  Ty_chamarGarcom: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: 'mesa'; Direction: 1; DBXType: 6; TypeName: 'Integer')
  );

  Ty_pedirCerveja: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: 'mesa'; Direction: 1; DBXType: 6; TypeName: 'Integer')
  );

  Ty_fecharConta: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'mesa'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  Ty_cardapioDia: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

implementation

function TyClient.EchoString(Value: string; const ARequestFilter: string): string;
begin
  if FEchoStringCommand = nil then
  begin
    FEchoStringCommand := FConnection.CreateCommand;
    FEchoStringCommand.RequestType := 'GET';
    FEchoStringCommand.Text := 'Ty.EchoString';
    FEchoStringCommand.Prepare(Ty_EchoString);
  end;
  FEchoStringCommand.Parameters[0].Value.SetWideString(Value);
  FEchoStringCommand.Execute(ARequestFilter);
  Result := FEchoStringCommand.Parameters[1].Value.GetWideString;
end;

function TyClient.ReverseString(Value: string; const ARequestFilter: string): string;
begin
  if FReverseStringCommand = nil then
  begin
    FReverseStringCommand := FConnection.CreateCommand;
    FReverseStringCommand.RequestType := 'GET';
    FReverseStringCommand.Text := 'Ty.ReverseString';
    FReverseStringCommand.Prepare(Ty_ReverseString);
  end;
  FReverseStringCommand.Parameters[0].Value.SetWideString(Value);
  FReverseStringCommand.Execute(ARequestFilter);
  Result := FReverseStringCommand.Parameters[1].Value.GetWideString;
end;

procedure TyClient.chamarGarcom(mesa: Integer);
begin
  if FchamarGarcomCommand = nil then
  begin
    FchamarGarcomCommand := FConnection.CreateCommand;
    FchamarGarcomCommand.RequestType := 'GET';
    FchamarGarcomCommand.Text := 'Ty.chamarGarcom';
    FchamarGarcomCommand.Prepare(Ty_chamarGarcom);
  end;
  FchamarGarcomCommand.Parameters[0].Value.SetInt32(mesa);
  FchamarGarcomCommand.Execute;
end;

procedure TyClient.pedirCerveja(mesa: Integer);
begin
  if FpedirCervejaCommand = nil then
  begin
    FpedirCervejaCommand := FConnection.CreateCommand;
    FpedirCervejaCommand.RequestType := 'GET';
    FpedirCervejaCommand.Text := 'Ty.pedirCerveja';
    FpedirCervejaCommand.Prepare(Ty_pedirCerveja);
  end;
  FpedirCervejaCommand.Parameters[0].Value.SetInt32(mesa);
  FpedirCervejaCommand.Execute;
end;

function TyClient.fecharConta(mesa: Integer; const ARequestFilter: string): string;
begin
  if FfecharContaCommand = nil then
  begin
    FfecharContaCommand := FConnection.CreateCommand;
    FfecharContaCommand.RequestType := 'GET';
    FfecharContaCommand.Text := 'Ty.fecharConta';
    FfecharContaCommand.Prepare(Ty_fecharConta);
  end;
  FfecharContaCommand.Parameters[0].Value.SetInt32(mesa);
  FfecharContaCommand.Execute(ARequestFilter);
  Result := FfecharContaCommand.Parameters[1].Value.GetWideString;
end;

function TyClient.cardapioDia(const ARequestFilter: string): string;
begin
  if FcardapioDiaCommand = nil then
  begin
    FcardapioDiaCommand := FConnection.CreateCommand;
    FcardapioDiaCommand.RequestType := 'GET';
    FcardapioDiaCommand.Text := 'Ty.cardapioDia';
    FcardapioDiaCommand.Prepare(Ty_cardapioDia);
  end;
  FcardapioDiaCommand.Execute(ARequestFilter);
  Result := FcardapioDiaCommand.Parameters[0].Value.GetWideString;
end;

constructor TyClient.Create(ARestConnection: TDSRestConnection);
begin
  inherited Create(ARestConnection);
end;

constructor TyClient.Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ARestConnection, AInstanceOwner);
end;

destructor TyClient.Destroy;
begin
  FEchoStringCommand.DisposeOf;
  FReverseStringCommand.DisposeOf;
  FchamarGarcomCommand.DisposeOf;
  FpedirCervejaCommand.DisposeOf;
  FfecharContaCommand.DisposeOf;
  FcardapioDiaCommand.DisposeOf;
  inherited;
end;

end.

