program KinoLib;

{$I cef.inc}

uses
  Vcl.Forms,
  KinoLib.Main in 'KinoLib.Main.pas' {FormMain},
  KinoLib.List in 'KinoLib.List.pas',
  SQLite3 in '..\SQLite\SQLite3.pas',
  SQLiteTable3 in '..\SQLite\SQLiteTable3.pas',
  SQLLang in '..\SQLite\SQLLang.pas',
  uCEFApplication;

{$R *.res}

function InitChrome:Boolean;
begin
  GlobalCEFApp:=TCefApplication.Create;
  GlobalCEFApp.FrameworkDirPath:= 'cef';
  GlobalCEFApp.ResourcesDirPath:= 'cef';
  GlobalCEFApp.LocalesDirPath  := 'cef\locales';
  //GlobalCEFApp.EnableGPU       := True;
  GlobalCEFApp.cache           := 'cef\cache';
  GlobalCEFApp.cookies         := 'cef\cookies';
  GlobalCEFApp.UserDataPath    := 'cef\User Data';
  GlobalCEFApp.SingleProcess   := True;
  GlobalCEFApp.FastUnload      := True;
  //GlobalCEFApp.ShutdownWaitTime:=5000;
  try
   Result:=GlobalCEFApp.StartMainProcess;
  except
   begin
    Result:=False;
    GlobalCEFApp.Free;
   end;
  end;
end;

begin
  InitChrome;

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'KinoLib';
  Application.CreateForm(TFormMain, FormMain);
  Application.Run;

  DestroyGlobalCEFApp;
end.
