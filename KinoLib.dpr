program KinoLib;

uses
  Vcl.Forms,
  KinoLib.Main in 'KinoLib.Main.pas' {FormMain},
  KinoLib.List in 'KinoLib.List.pas',
  SQLite3 in '..\SQLite\SQLite3.pas',
  SQLiteTable3 in '..\SQLite\SQLiteTable3.pas',
  SQLLang in '..\SQLite\SQLLang.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'KinoLib';
  Application.CreateForm(TFormMain, FormMain);
  Application.Run;
end.
