program Project1;

uses
  System.StartUpCopy,
  FMX.Forms,
  Unit1 in 'Unit1.pas' {F_Wifi};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TF_Wifi, F_Wifi);
  Application.Run;
end.
