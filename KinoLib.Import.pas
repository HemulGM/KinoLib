unit KinoLib.Import;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, LKDU.Button, Vcl.ExtCtrls, Vcl.Grids,
  Vcl.StdCtrls, HGM.Button;

type
  TFormImportExcel = class(TForm)
    StringGridXL: TStringGrid;
    Panel1: TPanel;
    Panel2: TPanel;
    ButtonFlatOpen: TButtonFlat;
    FileOpenDialogXLS: TFileOpenDialog;
    ButtonFlatImport: TButtonFlat;
    Label1: TLabel;
  private
    { Private declarations }
  public

  end;

var
  FormImportExcel: TFormImportExcel;

implementation
 uses ComObj, ActiveX, KinoLib.List, KinoLib.Main;

{$R *.dfm}

end.
