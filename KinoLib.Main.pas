unit KinoLib.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  System.Generics.Collections, Vcl.Grids, KinoLib.List, Vcl.ExtCtrls,
  HGM.Common.Settings, System.ImageList, Vcl.ImgList, Vcl.StdCtrls, Vcl.Buttons,
  IdSSLOpenSSL, HGM.Common.Utils, HGM.WinAPI.ShellDlg, IdHTTP, IdURI,
  System.UITypes, Vcl.Menus, HGM.Controls.PanelExt, HGM.Controls.VirtualTable,
  HGM.Button, acPNG, Vcl.ComCtrls, Vcl.OleCtrls, SHDocVw, uCEFChromium,
  uCEFApplication, uCEFWindowParent, uCEFInterfaces, uCEFConstants, uCEFTypes,
  uCEFWinControl, Vcl.WinXCtrls;

type
  TKinoElement = record
    Rating, Name, Year, Genre, Adv, KID: string;
  end;

  TKinoElements = TTableData<TKinoElement>;

  TFormMain = class(TForm)
    PanelMenu: TPanel;
    PanelList: TPanel;
    TableExList: TTableEx;
    ButtonFlatQuit: TButtonFlat;
    ButtonFlatSave: TButtonFlat;
    ShapeSplit: TShape;
    ButtonFlatImport: TButtonFlat;
    ImageListKType: TImageList;
    PanelFilter: TPanel;
    Shape2: TShape;
    ComboBoxFilterYear: TComboBox;
    ComboBoxFilterGenre: TComboBox;
    ComboBoxFilterRating: TComboBox;
    ButtonFlatFilter: TButtonFlat;
    ButtonFlat4: TButtonFlat;
    ImageListButtons: TImageList;
    Label1: TLabel;
    Label2: TLabel;
    Shape3: TShape;
    ButtonFlatStat: TButtonFlat;
    PanelStatistics: TPanel;
    PanelStatTop: TPanel;
    Label3: TLabel;
    ButtonFlatHideStat: TButtonFlat;
    ButtonFlatStatUpdate: TButtonFlat;
    PanelHead: TPanel;
    Panel2: TPanel;
    EditSearch: TEdit;
    ButtonSearch: TButtonFlat;
    Label4: TLabel;
    Image1: TImage;
    ButtonFlatSearchClear: TButtonFlat;
    Panel3: TPanel;
    ButtonFlatFilmAdd: TButtonFlat;
    ButtonFlatFilmDelete: TButtonFlat;
    ButtonFlatFilmFind: TButtonFlat;
    ButtonFlat2: TButtonFlat;
    ScrollBox1: TScrollBox;
    TableExStat: TTableEx;
    DrawPanelStat: TDrawPanel;
    PanelImport: TPanel;
    PanelImportTop: TPanel;
    Label5: TLabel;
    ButtonFlat3: TButtonFlat;
    FileOpenDialogXLS: TFileOpenDialog;
    StringGridXL: TStringGrid;
    ButtonFlatKSearch: TButtonFlat;
    ShapeSplitTop: TShape;
    PopupMenuList: TPopupMenu;
    N2: TMenuItem;
    N1: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    ButtonFlatFindFilmGoogle: TButtonFlat;
    Shape1: TShape;
    N5: TMenuItem;
    Shape4: TShape;
    PanelKSearch: TPanel;
    TableExKinoSearch: TTableEx;
    PanelKSearchTop: TPanel;
    LabelKSearch: TLabel;
    ButtonFlatKSearchClose: TButtonFlat;
    Shape5: TShape;
    ButtonFlatAutoFillKP: TButtonFlat;
    MenuItemSetKID: TMenuItem;
    N7: TMenuItem;
    PanelListTools: TPanel;
    Shape6: TShape;
    LabelListCount: TLabel;
    LabelListNotViewed: TLabel;
    ButtonFlat7: TButtonFlat;
    Shape7: TShape;
    Shape8: TShape;
    ButtonFlatSearchBoard: TButtonFlat;
    ButtonFlatListAll: TButtonFlat;
    ButtonFlatNeedToWatch: TButtonFlat;
    ButtonFlatNeedToRate: TButtonFlat;
    Shape9: TShape;
    PageControlImport: TPageControl;
    TabSheetImport: TTabSheet;
    TabSheetUpdateKP: TTabSheet;
    PanelImportCtrl: TPanel;
    Label6: TLabel;
    ButtonFlat6: TButtonFlat;
    ButtonFlat5: TButtonFlat;
    Panel1: TPanel;
    Label7: TLabel;
    ButtonFlat9: TButtonFlat;
    ButtonFlat10: TButtonFlat;
    Panel4: TPanel;
    ButtonFlatUpdateExcel: TButtonFlat;
    ButtonFlatImportExcel: TButtonFlat;
    Splitter: TSplitter;
    CEFWindowParent: TCEFWindowParent;
    Chromium: TChromium;
    TimerChrome: TTimer;
    ButtonFlatCloseBrowser: TButtonFlat;
    PanelLoading: TPanel;
    ActivityIndicatorLoading: TActivityIndicator;
    procedure TableExListGetData(FCol, FRow: Integer; var Value: string);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure TableExListEdit(Sender: TObject; var Data: TTableEditStruct; ACol, ARow: Integer; var Allow: Boolean);
    procedure TableExListEditOk(Sender: TObject; Value: string; ItemValue, ACol, ARow: Integer);
    procedure TableExListColumnClick(Sender: TObject; MouseButton: TMouseButton; const Index: Integer);
    procedure ButtonFlatSaveClick(Sender: TObject);
    procedure ButtonFlatImportClick(Sender: TObject);
    procedure ButtonFlatQuitClick(Sender: TObject);
    procedure TableExListDrawCellData(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure ComboBoxFilterYearChange(Sender: TObject);
    procedure ComboBoxFilterGenreChange(Sender: TObject);
    procedure ComboBoxFilterRatingChange(Sender: TObject);
    procedure ButtonSearchClick(Sender: TObject);
    procedure ButtonFlatFilterClick(Sender: TObject);
    procedure TableExListDrawColumnData(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure ButtonFlatStatClick(Sender: TObject);
    procedure ButtonFlatHideStatClick(Sender: TObject);
    procedure TableExStatGetData(FCol, FRow: Integer; var Value: string);
    procedure ButtonFlatStatUpdateClick(Sender: TObject);
    procedure ButtonFlat4Click(Sender: TObject);
    procedure DrawPanelStatPaint(Sender: TObject);
    procedure ButtonFlatSearchClearClick(Sender: TObject);
    procedure ButtonFlatFilmAddClick(Sender: TObject);
    procedure ButtonFlatFilmDeleteClick(Sender: TObject);
    procedure ButtonFlatFilmFindClick(Sender: TObject);
    procedure ButtonFlat2Click(Sender: TObject);
    procedure TableExListKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ButtonFlat5Click(Sender: TObject);
    procedure ButtonFlat6Click(Sender: TObject);
    procedure ButtonFlatKSearchClick(Sender: TObject);
    procedure PanelKSearchExit(Sender: TObject);
    procedure TableExKinoSearchGetData(FCol, FRow: Integer; var Value: string);
    procedure ButtonFlatKSearchCloseClick(Sender: TObject);
    procedure TableExKinoSearchEdit(Sender: TObject; var Data: TTableEditStruct; ACol, ARow: Integer; var Allow: Boolean);
    procedure TableExListMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure ButtonFlatFindFilmGoogleClick(Sender: TObject);
    procedure TableExListEditCancel(Sender: TObject; ACol, ARow: Integer);
    procedure TableExListItemColClick(Sender: TObject; MouseButton: TMouseButton; const Index: Integer);
    procedure EditSearchKeyPress(Sender: TObject; var Key: Char);
    procedure ButtonFlatAutoFillKPClick(Sender: TObject);
    procedure MenuItemSetKIDClick(Sender: TObject);
    procedure ButtonFlat7Click(Sender: TObject);
    procedure ButtonFlatListAllClick(Sender: TObject);
    procedure ButtonFlatNeedToWatchClick(Sender: TObject);
    procedure ButtonFlatNeedToRateClick(Sender: TObject);
    procedure ButtonFlatImportExcelClick(Sender: TObject);
    procedure ButtonFlatUpdateExcelClick(Sender: TObject);
    procedure PageControlImportChange(Sender: TObject);
    procedure ButtonFlat9Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure TimerChromeTimer(Sender: TObject);
    procedure ChromiumClose(Sender: TObject; const browser: ICefBrowser; out Result: Boolean);
    procedure ChromiumAfterCreated(Sender: TObject; const browser: ICefBrowser);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ChromiumBeforeClose(Sender: TObject; const browser: ICefBrowser);
    procedure ChromiumBeforePopup(Sender: TObject; const browser: ICefBrowser; const frame: ICefFrame; const targetUrl, targetFrameName: ustring; targetDisposition: TCefWindowOpenDisposition; userGesture: Boolean; const popupFeatures: TCefPopupFeatures; var windowInfo: TCefWindowInfo; var client: ICefClient; var settings: TCefBrowserSettings; var noJavascriptAccess, Result: Boolean);
    procedure SplitterPaint(Sender: TObject);
    procedure SplitterMoved(Sender: TObject);
    procedure ButtonFlatCloseBrowserClick(Sender: TObject);
    procedure EditSearchEnter(Sender: TObject);
    procedure EditSearchExit(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FSaveNotify: Boolean;
    FKinoList: TKinoItems;
    FStat: TKinoStatistics;
    FMainColor: TColor;
    FSettings: TSettingsIni;
    FSearchList: TKinoElements;
    FSearchID: Integer;
    FLoading: TDecoratePanel;
    procedure SetInterface;
    procedure SetMenuIconColor(Color: TColor);
    procedure SetMenuColor(Value: TColor);
    procedure FilmAdd;
    procedure FilmDelete;
    procedure FilmFindKinopoisk;
    procedure UpdateMenu;
    procedure LoadFile(FileName: string);
    function WebSearch(const Index: Integer): Integer;
    procedure UpdateFilterNotify;
    procedure UpdateStat;
    procedure UpdateGlobalFilter;
    procedure OpenImportPage(Tab: TTabSheet);
  protected
    FCanClose: boolean;  // Set to True in TChromium.OnBeforeClose
    FClosing: boolean;  // Set to True in the CloseQuery event.

    // You have to handle this two messages to call NotifyMoveOrResizeStarted or some page elements will be misaligned.
    procedure WMMove(var aMessage: TWMMove); message WM_MOVE;
    procedure WMMoving(var aMessage: TMessage); message WM_MOVING;
    // You also have to handle these two messages to set GlobalCEFApp.OsmodalLoop
    procedure WMEnterMenuLoop(var aMessage: TMessage); message WM_ENTERMENULOOP;
    procedure WMExitMenuLoop(var aMessage: TMessage); message WM_EXITMENULOOP;
    procedure BrowserCreatedMsg(var aMessage: TMessage); message CEF_AFTERCREATED;
    procedure BrowserDestroyMsg(var aMessage: TMessage); message CEF_DESTROY;
  public
    procedure LoadList;
    procedure SaveList;
    property KinoList: TKinoItems read FKinoList;
  end;

const
  BaseURL = 'https://www.kinopoisk.ru/index.php?kp_query=%s';

var
  FormMain: TFormMain;
  GlobalCEFApp: TCefApplication;

function GetHTMLTag(HTMLData, Tag, Param: string; FullTag: Boolean; var Offset: Integer): string; overload;

function GetHTMLTag(HTMLData, Tag, Param: string; FullTag: Boolean = False): string; overload;

implementation

uses
  ShellAPI, Direct2D, D2D1, ComObj, ActiveX, Math, MSHTML, System.StrUtils,
  Clipbrd;

{$R *.dfm}

procedure SetButtonSelected(Button: TButtonFlat; Selected: Boolean);
begin
  if Selected then
    Button.ColorNormal := $00B56D3E
  else
    Button.ColorNormal := $009A572B;
end;

function FillKinoItem(Item: TKinoItem; SearchRec: TKinoElement): Boolean;
var
  Year: Integer;
begin
  Result := True;
  Item.Caption := SearchRec.Name;
  Item.Genre := SearchRec.Genre;
  if TryStrToInt(SearchRec.Year, Year) then
    Item.Year := Year;
  Year := Pos('(сериал)', AnsiLowerCase(SearchRec.Name));
  if Year <> 0 then
  begin
    Item.Caption := Copy(SearchRec.Name, 1, Year - 2);
    Item.KinoType := ktSeries;
  end
  else
    Item.KinoType := ktFilm;
  if Item.Info = '' then
    Item.Info := SearchRec.Adv;
  if TryStrToInt(SearchRec.KID, Year) then
    Item.KID := Year;
end;

function HTMLTextToString(HTMLData: string): string;
begin
  Result := StringReplace(HTMLData, '&amp;', '&', [rfReplaceAll, rfIgnoreCase]);
  Result := StringReplace(Result, '&lt;', '<', [rfReplaceAll, rfIgnoreCase]);
  Result := StringReplace(Result, '&gt;', '>', [rfReplaceAll, rfIgnoreCase]);
  Result := StringReplace(Result, '&quot;', '"', [rfReplaceAll, rfIgnoreCase]);
  Result := StringReplace(Result, '&apos;', '''', [rfReplaceAll, rfIgnoreCase]);
  Result := StringReplace(Result, '&nbsp;', ' ', [rfReplaceAll, rfIgnoreCase]);
  Result := StringReplace(Result, '&ndash;', '–', [rfReplaceAll, rfIgnoreCase]);
  Result := StringReplace(Result, '&#38;', '&', [rfReplaceAll, rfIgnoreCase]);
  Result := StringReplace(Result, '&middot;', '·', [rfReplaceAll, rfIgnoreCase]);
  Result := StringReplace(Result, '&laquo;', '«', [rfReplaceAll, rfIgnoreCase]);
  Result := StringReplace(Result, '&raquo;', '»', [rfReplaceAll, rfIgnoreCase]);
end;

function GetTagPropValue(HTMLData, PropName: string; Offset: Integer = 1): string;
var
  HData: string;
  p, e: Integer;
begin
  Result := '';
  HTMLData := StringReplace(HTMLData, #13#10, ' ', [rfReplaceAll]);
  HTMLData := StringReplace(HTMLData, '  ', '', [rfReplaceAll]);
  HData := AnsiLowerCase(HTMLData);
  PropName := AnsiLowerCase(PropName) + '="';
  p := Pos(PropName, HData, Offset);
  if p <= 0 then
    Exit;
  e := Pos('"', HData, Offset + p + PropName.Length + 1);
  if p <= 0 then
    Exit;
  Result := Copy(HTMLData, p + PropName.Length, e - (p + PropName.Length));
end;

function ClearHTMLTags(HTMLData: string): string;
var
  i: Integer;
  Writing: Boolean;
begin
  Result := '';
  Writing := False;
  for i := 1 to HTMLData.Length do
  begin
    if HTMLData[i] = '<' then
      Writing := False;
    if Writing then
      Result := Result + HTMLData[i];
    if HTMLData[i] = '>' then
      Writing := True;
  end;
end;

function GetHTMLTag(HTMLData, Tag, Param: string; FullTag: Boolean; var Offset: Integer): string;
var
  HData, TagClose, TagOpen, WStr: string;
  p, TagCount, i: Integer;
  Writing: Boolean;
begin
  Result := '';
  HTMLData := StringReplace(HTMLData, #13#10, ' ', [rfReplaceAll]);
  HTMLData := StringReplace(HTMLData, '  ', '', [rfReplaceAll]);
  HData := AnsiLowerCase(HTMLData);
  TagClose := Format('</%s>', [AnsiLowerCase(Tag)]);
  TagOpen := Format('<%s', [AnsiLowerCase(Tag)]);
  if FullTag then
  begin
    if Param = '' then
      Exit;
    Tag := AnsiLowerCase(Param);
  end
  else
  begin
    if Param <> '' then
      Tag := Format('<%s class="%s">', [AnsiLowerCase(Tag), AnsiLowerCase(Param)])
    else
      Tag := Format('<%s', [AnsiLowerCase(Tag)]);
  end;
  p := Pos(Tag, HData, Offset);
  if p > 0 then
  begin
    p := p + Tag.Length;
    TagCount := 1;
    WStr := '';
    Writing := False;
    for i := p to HData.Length do
    begin
      if Writing then           //<p
      begin
        WStr := WStr + HData[i];
        if WStr = TagOpen then
          Inc(TagCount);
        if WStr = TagClose then
          Dec(TagCount);
      end;
      if HData[i] = '<' then
      begin
        Writing := True;
        WStr := '<';
        Continue;
      end;
      if HData[i] = '>' then
      begin
        if not Writing then
          p := i + 1;
        Writing := False;
        WStr := '';
      end;
      if TagCount <= 0 then
      begin
        Offset := i - p - TagClose.Length + 1;
        Result := Copy(HTMLData, p, Offset);
        Offset := p + Offset;
        Break;
      end;
    end;
  end;
end;

function GetHTMLTag(HTMLData, Tag, Param: string; FullTag: Boolean): string;
var
  Offset: Integer;
begin
  Offset := 1;
  Result := GetHTMLTag(HTMLData, Tag, Param, FullTag, Offset);
end;

procedure TFormMain.BrowserCreatedMsg(var aMessage: TMessage);
begin
  //Caption            := 'Simple Browser 2';
  //AddressPnl.Enabled := True;
  //GoBtn.Click;
  Chromium.LoadURL('about:blank');
end;

procedure TFormMain.BrowserDestroyMsg(var aMessage: TMessage);
begin
  CEFWindowParent.Free;
end;

procedure TFormMain.WMMove(var aMessage: TWMMove);
begin
  inherited;
  if (Chromium <> nil) then
    Chromium.NotifyMoveOrResizeStarted;
end;

procedure TFormMain.WMMoving(var aMessage: TMessage);
begin
  inherited;
  if (Chromium <> nil) then
    Chromium.NotifyMoveOrResizeStarted;
end;

procedure TFormMain.WMEnterMenuLoop(var aMessage: TMessage);
begin
  inherited;
  if (aMessage.wParam = 0) and (GlobalCEFApp <> nil) then
    GlobalCEFApp.OsmodalLoop := True;
end;

procedure TFormMain.WMExitMenuLoop(var aMessage: TMessage);
begin
  inherited;
  if (aMessage.wParam = 0) and (GlobalCEFApp <> nil) then
    GlobalCEFApp.OsmodalLoop := False;
end;

procedure TFormMain.ButtonFlatQuitClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFormMain.ButtonFlatSaveClick(Sender: TObject);
begin
  SaveList;
  LoadList;
  ButtonFlatSave.TimedText('Сохранено!', 4000);
end;

procedure TFormMain.ButtonFlatStatClick(Sender: TObject);
begin
  PanelStatistics.BringToFront;
end;

procedure TFormMain.ButtonFlatHideStatClick(Sender: TObject);
begin
  PanelList.BringToFront;
end;

procedure TFormMain.ButtonFlatStatUpdateClick(Sender: TObject);
begin
  UpdateStat;
end;

procedure TFormMain.ButtonFlatUpdateExcelClick(Sender: TObject);
begin
  OpenImportPage(TabSheetUpdateKP);
end;

procedure TFormMain.ButtonFlatSearchClearClick(Sender: TObject);
begin
  EditSearch.Clear;
end;

procedure TFormMain.UpdateStat;
begin
  FStat.UpdateStat(FKinoList);
  DrawPanelStat.Repaint;
  LabelListCount.Caption := 'Всего: ' + FStat.Items[0].Value;
  LabelListNotViewed.Caption := 'Нужно посмотреть: ' + FStat.Items[1].Value;
end;

procedure TFormMain.FilmDelete;
begin
  ButtonFlatHideStatClick(nil);
  if not IndexInList(TableExList.ItemIndex, FKinoList.Count) then
    Exit;
  if FKinoList[TableExList.ItemIndex].Caption <> '' then
  begin
    if not AskYesNo('Прошу ответить', 'Удалить "' + FKinoList[TableExList.ItemIndex].Caption + '" из списка?') then
      Exit
  end
  else
  begin
    if not AskYesNo('Прошу ответить', 'Удалить выбранный элемент из списка?') then
      Exit
  end;
  FKinoList.DeleteRecord(TableExList.ItemIndex);
  UpdateStat;
  ButtonFlatSave.NotifyVisible := True;
end;

procedure TFormMain.ButtonFlatFilmDeleteClick(Sender: TObject);
begin
  FilmDelete;
end;
 //https://rating.kinopoisk.ru/89515.xml.

procedure TFormMain.FilmFindKinopoisk;
var
  Str: string;
begin
  ButtonFlatHideStatClick(nil);
  if not IndexInList(TableExList.ItemIndex, FKinoList.Count) then
  begin
    if AskYesNo('Вопрос', 'Элемент не выбран. Открыть просто сайт Кинопоиск?') then
      Str := 'https://www.kinopoisk.ru';
  end
  else
  begin
    if FKinoList[TableExList.ItemIndex].KID > 1 then
      Str := 'https://www.kinopoisk.ru/film/' + IntToStr(FKinoList[TableExList.ItemIndex].KID)
    else
      Str := 'https://www.kinopoisk.ru/index.php?kp_query=' + FKinoList[TableExList.ItemIndex].Caption;
  end;

  if Chromium.Initialized then
  begin
    if CEFWindowParent.Width < 10 then
    begin
      CEFWindowParent.Width := PanelList.Width - 850;
      ButtonFlatCloseBrowser.Show;
    end;
    Chromium.LoadURL(Str);
  end
  else
    ShellExecute(Application.Handle, 'open', PChar(Str), nil, nil, SW_NORMAL);
end;

procedure TFormMain.ButtonFlatFilmFindClick(Sender: TObject);
begin
  FilmFindKinopoisk;
end;

procedure TFormMain.UpdateFilterNotify;
begin
  ButtonFlatFilter.NotifyVisible := (FKinoList.FilterYear >= 0) or (FKinoList.FilterGenre <> '') or (FKinoList.FilterRating >= 0);
end;

procedure TFormMain.UpdateMenu;
var
  i: Integer;
begin
  for i := 0 to PanelMenu.ControlCount - 1 do
  begin
    if PanelMenu.Controls[i] is TButtonFlat then
    begin
      if PanelMenu.Width <= 46 then
      begin
       //TODO Скрыть заголовоки
        (PanelMenu.Controls[i] as TButtonFlat).Shape := stCircle;
        (PanelMenu.Controls[i] as TButtonFlat).Margins.Left := 5;
        (PanelMenu.Controls[i] as TButtonFlat).ImageIndentLeft := 6;
      end
      else
      begin
        (PanelMenu.Controls[i] as TButtonFlat).Shape := stRoundRect;
        (PanelMenu.Controls[i] as TButtonFlat).Margins.Left := 0;
        (PanelMenu.Controls[i] as TButtonFlat).ImageIndentLeft := 6 + 5;
      end;
    end;
  end;

  ButtonFlatNeedToRate.VisibleSubText := (ButtonFlatNeedToRate.SubText <> '0') and (PanelMenu.Width > 46);
  ButtonFlatNeedToWatch.VisibleSubText := (ButtonFlatNeedToWatch.SubText <> '0') and (PanelMenu.Width > 46);
  ButtonFlatListAll.VisibleSubText := (ButtonFlatListAll.SubText <> '0') and (PanelMenu.Width > 46);
end;

procedure DeleteRow(Grid: TStringGrid; ARow: Integer);
var
  i: Integer;
begin
  for i := ARow to Grid.RowCount - 2 do
    Grid.Rows[i].Assign(Grid.Rows[i + 1]);
  Grid.RowCount := Grid.RowCount - 1;
end;

procedure TFormMain.Button1Click(Sender: TObject);
var
  i: Integer;
  Strs: TStringList;
begin
  Strs := TStringList.Create;
  for i := 0 to FKinoList.Count - 1 do
  begin
    if FKinoList[i].KPMarked then
      Strs.Add(FKinoList[i].Caption);
  end;
  Strs.SaveToFile('D:\list.txt');
  Strs.Free;
end;

procedure TFormMain.ButtonFlatAutoFillKPClick(Sender: TObject);
var
  i, r, j, p: Integer;
  Data: TKinoElement;
  CItem: TKinoItem;
begin
  if MessageBox(Handle, 'Выполнить заполнение данными по всем фильмам?', 'Вопрос', MB_ICONINFORMATION or MB_YESNO) <> ID_YES then
    Exit;
  LabelKSearch.Caption := 'Подождите, идёт поиск...';
  PanelKSearch.Show;
  PanelKSearch.BringToFront;
  PanelKSearch.SetFocus;
  Application.ProcessMessages;
  for i := 0 to FKinoList.Count - 1 do
  begin
    CItem := FKinoList[i];
   //if (FKinoList[i].KinoType = ktSeries) and (Pos('', )) then Continue;
   //if FKinoList[i].Year <= 0 then Continue;
    if CItem.KID > 1 then
      Continue;
    TableExList.ItemIndex := i;
    FSearchList.Clear;
    Application.ProcessMessages;
    r := WebSearch(i);
    if r > 0 then
    begin
      j := 0;
      r := -1;
      while (FSearchList.Count > 0) and (j < FSearchList.Count) do
      begin
        Data := FSearchList[j];
        if CItem.KinoType = ktSeries then
        begin
          p := Pos('(сериал)', AnsiLowerCase(Data.Name));
          if p = 0 then
          begin
            FSearchList.Delete(j);
            Continue;
          end;
          Data.Name := Copy(Data.Name, 1, p - 2);
        end;
        if Data.Name <> CItem.Caption then
        begin
          FSearchList.Delete(j);
          Continue;
        end;
        if Data.Year = CItem.Year.ToString then
        begin
          r := j;
          Break;
        end;
        Inc(j);
      end;
      if r < 0 then
        if FSearchList.Count = 1 then
          r := 0;
      if r >= 0 then
        FillKinoItem(CItem, FSearchList[r]);
    end;
    Application.ProcessMessages;
    if Application.Terminated then
      Break;
  end;
  ButtonFlatKSearchCloseClick(nil);
end;

procedure TFormMain.ButtonFlatCloseBrowserClick(Sender: TObject);
begin
  CEFWindowParent.Width := 0;
  ButtonFlatCloseBrowser.Hide;
end;

procedure TFormMain.ButtonFlat2Click(Sender: TObject);
begin
  if PanelMenu.Width > 46 then
    PanelMenu.Width := 46
  else
    PanelMenu.Width := 300;
  UpdateMenu;
end;

procedure TFormMain.ButtonFlat4Click(Sender: TObject);
begin
  ComboBoxFilterYear.ItemIndex := -1;
  ComboBoxFilterGenre.Text := '';
  ComboBoxFilterRating.ItemIndex := 0;
  FKinoList.FilterGenre := '';
  FKinoList.FilterYear := -1;
  FKinoList.FilterRating := -1;
  UpdateFilterNotify;
  PanelFilter.Hide;
end;

procedure TFormMain.ButtonFlat5Click(Sender: TObject);
begin
  if FileOpenDialogXLS.Execute then
  begin
    try
      StringGridXL.Enabled := False;
      ButtonFlatImport.Enabled := False;
      LoadFile(FileOpenDialogXLS.FileName);
    finally
      StringGridXL.Enabled := True;
      ButtonFlatImport.Enabled := True;
    end;
  end;
end;

procedure TFormMain.ButtonFlat6Click(Sender: TObject);
var
  R: Integer;
var
  Item: TKinoItem;
begin
  if StringGridXL.RowCount <= 0 then
    Exit;
  if not AskYesNo('Ответь', 'Добавить записи из этого списка в базу?') then
    Exit;

  for R := 0 to StringGridXL.RowCount - 1 do
  begin
    Item := TKinoItem.Create;
    try
      Item.Caption := StringGridXL.Cells[0, R];
      if StringGridXL.Cells[1, R] <> '' then
      try
        Item.Year := StrToInt(Copy(StringGridXL.Cells[1, R], 1, 4))
      except
        Item.Year := 0;
      end
      else
        Item.Year := 0;
      Item.Genre := StringGridXL.Cells[2, R];
      if StringGridXL.Cells[3, R] <> '' then
        Item.Rating := StrToInt(StringGridXL.Cells[3, R])
      else
        Item.Rating := 0;
      try
        Item.Date := StrToDateTime(StringGridXL.Cells[4, R]);
      except
        Item.Date := Now;
      end;
      Item.Viewed := True;
      Item.KPMarked := True;
      FormMain.KinoList.Add(Item);
    except
      Item.Free;
    end;
  end;
  FormMain.KinoList.Save;
end;

procedure TFormMain.ButtonFlat7Click(Sender: TObject);
var
  i, r: Integer;
begin
  Randomize;
  for i := 0 to 20 do
  begin
    repeat
      r := Random(FKinoList.Count);
    until IndexInList(r, FKinoList.Count) and (FKinoList[r].Viewed = False) and (FKinoList[r].KinoType = ktFilm);
    TableExList.ItemIndex := r;
    Application.ProcessMessages;
    Sleep(i * 10);
  end;
  if CEFWindowParent.Width > 10 then
    FilmFindKinopoisk;
end;

procedure TFormMain.ButtonFlat9Click(Sender: TObject);
var
  i, s, r, c, y: Integer;
  Item: TKinoItem;
begin
  DeleteRow(StringGridXL, 0);
  DeleteRow(StringGridXL, 0);
  i := 0;
  StringGridXL.ColCount := StringGridXL.ColCount + 1;
  c := StringGridXL.ColCount;
  while (StringGridXL.RowCount > 3) and (i < StringGridXL.RowCount) do
  begin
    if TryStrToInt(StringGridXL.Cells[7, i], r) then
    begin
      s := FKinoList.Search(StringGridXL.Cells[0, i], 0, True);
      if not TryStrToInt(Copy(StringGridXL.Cells[2, i], 1, 4), y) then
        y := FKinoList[s].Year;
      if (s >= 0) and (y = FKinoList[s].Year) then
      begin
        if FKinoList[s].Rating = r then
        begin
          DeleteRow(StringGridXL, i);
          Continue;
        end
        else
        begin
          FKinoList[s].Rating := r;
          StringGridXL.Cells[c, i] := 'Новая оценка - ' + IntToStr(r);
        end;
      end
      else
      begin
        Item := TKinoItem.Create;
        try
          Item.Caption := StringGridXL.Cells[0, i];

          if StringGridXL.Cells[2, i] <> '' then
          try
            Item.Year := StrToInt(Copy(StringGridXL.Cells[2, i], 1, 4))
          except
            Item.Year := 0;
          end
          else
            Item.Year := 0;

          Item.Genre := AnsiLowerCase(StringGridXL.Cells[5, i]);

          if StringGridXL.Cells[7, i] <> '' then
            Item.Rating := StrToInt(StringGridXL.Cells[7, i])
          else
            Item.Rating := 0;

          Item.Info := StringGridXL.Cells[1, i];
          if Item.Info <> '' then
            Item.Info := Item.Info + ', ';
          Item.Info := Item.Info + StringGridXL.Cells[6, i] + ' мин';

          try
            Item.Date := StrToDateTime(StringGridXL.Cells[19, i]);
          except
            Item.Date := Now;
          end;

          Item.Viewed := True;
          Item.KPMarked := True;
          FKinoList.Add(Item);
        except
          Item.Free;
        end;
      end;
    end
    else
    begin
      DeleteRow(StringGridXL, i);
      Continue;
    end;
    Inc(i)
  end;
  KinoList.Save;
end;

function TFormMain.WebSearch(const Index: Integer): Integer;
var
  RequestURL, tmp: string;
  HTTPObject: TIdHTTP;
  HTTPStream: TStringStream;
  IdSSLIOHandlerSocketOpenSSL: TIdSSLIOHandlerSocketOpenSSL;
  PageData: TStringList;
  p: Integer;
  Data: TKinoElement;
  Text: string;

  function GetElementData(Src: string): TKinoElement;
  var
    tempStr1: string;
    Ofs: Integer;
  begin
    Result.Name := '';
    if Src = '' then
      Exit;
    Result.Rating := GetHTMLTag(Src, 'div', 'right');
    Src := GetHTMLTag(Src, 'div', 'info');
    tempStr1 := Src;
    Src := GetHTMLTag(Src, 'p', 'name');
    Ofs := 1;
    Result.Name := HTMLTextToString(GetHTMLTag(Src, 'a', '', False, Ofs));
    Result.KID := GetTagPropValue(Src, 'data-id');
    Result.Year := Copy(HTMLTextToString(GetHTMLTag(Src, 'span', '', False, Ofs)), 1, 4);
    Ofs := 1;
    Result.Adv := HTMLTextToString(GetHTMLTag(tempStr1, 'span', 'gray', False, Ofs));
    Result.Genre := HTMLTextToString(GetHTMLTag(tempStr1, 'span', 'gray', False, Ofs));
    Ofs := Pos('/>(', Result.Genre) + 3;
    Result.Genre := StringReplace(Copy(Result.Genre, Ofs, Result.Genre.Length - Ofs), '...', '', [rfReplaceAll]);

    Result.Rating := HTMLTextToString(GetHTMLTag(Result.Rating, 'div', ''));
  end;

  function GetPageData(Src: string): TKinoElement;
  var
    tmp1: string;
    p1: Integer;
  begin
    Result.Name := '';
    if Src = '' then
      Exit;
    Result.Name := HTMLTextToString(ClearHTMLTags(GetHTMLTag(Src, 'h1', '')));
    Result.Adv := HTMLTextToString(ClearHTMLTags(GetHTMLTag(Src, 'span', '')));
    tmp1 := GetHTMLTag(Src, 'table', 'info');
    p1 := 1;
    Result.Year := Copy(HTMLTextToString(GetHTMLTag(tmp1, 'a', '', False, p1)), 1, 4);
    Result.Genre := HTMLTextToString(ClearHTMLTags(GetHTMLTag(tmp1, 'span', '<span itemprop="genre">', True, p1)));
    tmp1 := GetHTMLTag(Src, 'div', 'movie-buttons-container');
    Result.KID := GetTagPropValue(tmp1, 'data-kp-film-id');
  end;

begin
  Text := FKinoList[Index].Caption;
  RequestURL := TIdURI.URLEncode(Format(BaseURL, [Text]));
  RequestURL := TIdURI.PathEncode(Format(BaseURL, [Text]));
  HTTPObject := TIdHTTP.Create(nil);
  IdSSLIOHandlerSocketOpenSSL := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  HTTPObject.IOHandler := IdSSLIOHandlerSocketOpenSSL;
  HTTPObject.HandleRedirects := True;
  HTTPStream := TStringStream.Create;
  PageData := TStringList.Create;
  FSearchList.Clear;
  try
    HTTPObject.Get(RequestURL, HTTPStream);
    HTTPStream.Position := 0;

    PageData.Text := UTF8Decode(HTTPStream.DataString);
  //PageData.Text:=Memo1.Text;
    p := 1;
    Data := GetElementData(GetHTMLTag(PageData.Text, 'div', 'element most_wanted', False, p));
    if Data.Name <> '' then
      FSearchList.Add(Data);

    p := 1;
    GetHTMLTag(PageData.Text, 'div', 'search_results', False, p);
    tmp := GetHTMLTag(PageData.Text, 'div', '', False, p);
    p := 1;
    repeat
      Data := GetElementData(GetHTMLTag(tmp, 'div', 'element', False, p));
      if Data.Name <> '' then
        FSearchList.Add(Data);
    until (Data.Name = '');
    if FSearchList.Count <= 0 then
    begin
      p := 1;
      Data := GetPageData(GetHTMLTag(PageData.Text, 'div', '<div id="photoInfoTable" class="clearfix">', True, p));
      if Data.Name <> '' then
        FSearchList.Add(Data);
    end;
  except

  end;
  PageData.Free;
  IdSSLIOHandlerSocketOpenSSL.Free;
  HTTPObject.Free;
  HTTPStream.Free;
  LabelKSearch.Caption := 'Результаты поиска';
  Result := FSearchList.Count;
end;

procedure TFormMain.ButtonFlatKSearchClick(Sender: TObject);
begin
  FSearchID := TableExList.ItemIndex;
  if not IndexInList(FSearchID, FKinoList.Count) then
    Exit;
  LabelKSearch.Caption := 'Подождите, идёт поиск...';
  FSearchList.Clear;
  PanelKSearch.Show;
  PanelKSearch.BringToFront;
  PanelKSearch.SetFocus;
  Application.ProcessMessages;
  WebSearch(FSearchID);
end;

procedure TFormMain.LoadFile(FileName: string);
var
  Excel, Sheet: Variant;
  R, C, W: Integer;

  function ReadCellStr(aR, aC: Integer): string;
  begin
    try
      Result := Trim(Sheet.Cells[aR, aC]);
    except
      Result := '';
    end;
    if Result <> '' then
      Result[1] := AnsiUpperCase(Result[1])[1];
  end;

  procedure GridClear(SG: TStringGrid);
  var
    i: Integer;
  begin
    if SG.RowCount > 0 then
    begin
      for i := 0 to SG.RowCount - 1 do
        SG.Rows[i].Clear;
      SG.RowCount := 0;
    end;
  end;

begin
  GridClear(StringGridXL);
  Excel := CreateOleObject('Excel.Application');
  try
    Excel.Application.ScreenUpdating := False;
    Excel.Application.EnableEvents := False;
    Excel.Application.Interactive := True;
    Excel.Application.DisplayAlerts := False;
    Excel.Application.DisplayStatusBar := True;
    Excel.Visible := False;
    Excel.Workbooks.Open(FileName, False, False);
    Excel.Sheets[1].Select;
    Excel.Sheets[1].Cells.SpecialCells($0000000B, EmptyParam).Activate;

    Sheet := Excel.Workbooks[1].WorkSheets[1];
    StringGridXL.RowCount := Excel.ActiveCell.Row;
    StringGridXL.ColCount := 20;
    for R := 1 to StringGridXL.RowCount do
    begin
      for C := 1 to StringGridXL.ColCount do
      begin
        StringGridXL.Cells[C - 1, R - 1] := ReadCellStr(R, C);
        W := StringGridXL.Canvas.TextWidth(StringGridXL.Cells[C - 1, R - 1]);
        if W > StringGridXL.ColWidths[C - 1] then
          StringGridXL.ColWidths[C - 1] := W + 10;
      end;
      Application.ProcessMessages;
    end;
  finally
    Excel.Application.ScreenUpdating := True;
    Excel.Application.EnableEvents := True;
    Excel.Application.Interactive := True;
    Excel.Application.DisplayAlerts := True;
  {Закрываем процесс Excel}
    Excel.Quit;
    Excel := UnAssigned;
  end;
end;

procedure TFormMain.ButtonFlatImportClick(Sender: TObject);
begin
  PanelImport.BringToFront;
end;

procedure TFormMain.ButtonFlatImportExcelClick(Sender: TObject);
begin
  OpenImportPage(TabSheetImport);
end;

procedure TFormMain.ButtonFlatKSearchCloseClick(Sender: TObject);
begin
  PanelKSearch.Hide;
end;

procedure TFormMain.ButtonFlatListAllClick(Sender: TObject);
begin
  FKinoList.GlobalFilter := gfAll;
  FKinoList.Load;
  UpdateGlobalFilter;
end;

procedure TFormMain.ButtonFlatNeedToRateClick(Sender: TObject);
begin
  FKinoList.GlobalFilter := gfNeedToRate;
  FKinoList.Load;
  UpdateGlobalFilter;
end;

procedure TFormMain.ButtonFlatNeedToWatchClick(Sender: TObject);
begin
  FKinoList.GlobalFilter := gfNeedToWatch;
  FKinoList.Load;
  UpdateGlobalFilter;
end;

procedure TFormMain.UpdateGlobalFilter;
begin
  SetButtonSelected(ButtonFlatListAll, FKinoList.GlobalFilter = gfAll);
  SetButtonSelected(ButtonFlatNeedToWatch, FKinoList.GlobalFilter = gfNeedToWatch);
  SetButtonSelected(ButtonFlatNeedToRate, FKinoList.GlobalFilter = gfNeedToRate);
  UpdateStat;
end;

procedure TFormMain.FilmAdd;
var
  Item: TKinoItem;
begin
  ButtonFlatHideStatClick(nil);
  Item := TKinoItem.Create;
  FKinoList.Insert(0, Item);
  TableExList.ItemIndex := 0;
  TableExList.Edit(0, 1);
  UpdateStat;
  ButtonFlatSave.NotifyVisible := True;
end;

procedure TFormMain.ButtonFlatFilmAddClick(Sender: TObject);
begin
  FilmAdd;
end;

procedure TFormMain.ButtonFlatFilterClick(Sender: TObject);
begin
  ButtonFlatHideStatClick(nil);
  PanelFilter.Show;
end;

procedure TFormMain.ButtonFlatFindFilmGoogleClick(Sender: TObject);
var
  Str: string;
begin
  ButtonFlatHideStatClick(nil);
  if not IndexInList(TableExList.ItemIndex, FKinoList.Count) then
  begin                                           //https://www.google.ru/search?q=vvvv
    if AskYesNo('Вопрос', 'Элемент не выбран. Открыть просто сайт Google?') then
      ShellExecute(Application.Handle, 'open', PChar('https://www.google.ru'), nil, nil, SW_NORMAL);
    Exit;
  end;
  Str := FKinoList[TableExList.ItemIndex].Caption;
  ShellExecute(Application.Handle, 'open', PChar('https://www.google.ru/search?q=' + Str), nil, nil, SW_NORMAL);
end;

procedure TFormMain.ChromiumAfterCreated(Sender: TObject; const browser: ICefBrowser);
begin
  if Chromium.IsSameBrowser(browser) then
    PostMessage(Handle, CEF_AFTERCREATED, 0, 0)
  else
  begin
    SendMessage(browser.Host.WindowHandle, WM_SETICON, 1, application.Icon.Handle); // Use the same icon in the popup window
  end;
end;

procedure TFormMain.ChromiumBeforeClose(Sender: TObject; const browser: ICefBrowser);
begin
  if (Chromium.BrowserId = 0) then // The main browser is being destroyed
  begin
    FCanClose := True;
    PostMessage(Handle, WM_CLOSE, 0, 0);
  end;
end;

procedure TFormMain.ChromiumBeforePopup(Sender: TObject; const browser: ICefBrowser; const frame: ICefFrame; const targetUrl, targetFrameName: ustring; targetDisposition: TCefWindowOpenDisposition; userGesture: Boolean; const popupFeatures: TCefPopupFeatures; var windowInfo: TCefWindowInfo; var client: ICefClient; var settings: TCefBrowserSettings; var noJavascriptAccess, Result: Boolean);
begin
  windowInfo.x := Left + (Width div 2 - windowInfo.width div 2);
  windowInfo.y := Top + (Height div 2 - windowInfo.Height div 2);
end;

procedure TFormMain.ChromiumClose(Sender: TObject; const browser: ICefBrowser; out Result: Boolean);
begin
  if (browser <> nil) and (Chromium.BrowserId = browser.Identifier) then
  begin
    PostMessage(Handle, CEF_DESTROY, 0, 0);
    Result := True;
  end
  else
    Result := False;
end;

procedure TFormMain.ComboBoxFilterGenreChange(Sender: TObject);
begin
  FKinoList.FilterGenre := ComboBoxFilterGenre.Text;
  UpdateFilterNotify;
end;

procedure TFormMain.ComboBoxFilterRatingChange(Sender: TObject);
begin
  case ComboBoxFilterRating.ItemIndex of
    0:
      FKinoList.FilterRating := -1;
    1:
      FKinoList.FilterRating := 0;
    2..11:
      FKinoList.FilterRating := ComboBoxFilterRating.ItemIndex - 1;
  end;
  UpdateFilterNotify;
end;

procedure TFormMain.ComboBoxFilterYearChange(Sender: TObject);
var
  Year: Integer;
begin
  if TryStrToInt(ComboBoxFilterYear.Text, Year) then
  begin
    FKinoList.FilterYear := Year;
  end
  else
  begin
    ComboBoxFilterYear.Text := '';
    FKinoList.FilterYear := -1;
  end;
  UpdateFilterNotify;
end;

procedure TFormMain.DrawPanelStatPaint(Sender: TObject);
const
  SplitW = 5;
var
  Direct2D: TDirect2DCanvas;
  i: Integer;
  MaxV: Word;
  ItemRect: TRect;
  ItemW: Integer;
  FieldH: Integer;
  Str: string;
  RectText: TRect;
begin
  MaxV := 1;
  FieldH := DrawPanelStat.ClientHeight - 40;
  for i := 1 to 10 do
    if FStat.FRatingFilms[i] > MaxV then
      MaxV := FStat.FRatingFilms[i];
  ItemW := Round(((DrawPanelStat.ClientWidth - (SplitW * 10)) / 10));
  Direct2D := TDirect2DCanvas.Create(DrawPanelStat.Canvas, DrawPanelStat.ClientRect);
  with Direct2D do
  begin
    try
      BeginDraw;
      Brush.Color := FMainColor;
      FillRect(DrawPanelStat.ClientRect);
      Brush.Color := ColorLighter(FMainColor);
      Pen.Color := FMainColor;
      Font.Size := 12;
      for i := 1 to 10 do
      begin
        ItemRect.Left := SplitW + (i - 1) * (ItemW + SplitW);                   //x = 100%
        ItemRect.Right := ItemRect.Left + ItemW - SplitW;                   // 1 = x/100 %
        ItemRect.Bottom := DrawPanelStat.ClientHeight - 20; // GItems[i] / (MaxV / 100)
        ItemRect.Top := DrawPanelStat.ClientHeight - Round(FieldH * (((100 / MaxV) * FStat.FRatingFilms[i]) / 100)) - 20;
        Brush.Style := bsSolid;
        Rectangle(ItemRect);
        Brush.Style := bsClear;

        Font.Color := ColorLighter(FMainColor);
        Str := IntToStr(i);
        RectText := Rect(ItemRect.Left, ItemRect.Bottom, ItemRect.Right, ItemRect.Bottom + 20);
        RectText.Offset(0, 2);
        TextRect(RectText, Str, [tfCenter, tfSingleLine, tfVerticalCenter]);

        Font.Color := clWhite;
        Str := IntToStr(FStat.FRatingFilms[i]);
        RectText := Rect(ItemRect.Left, ItemRect.Top - 20, ItemRect.Right, ItemRect.Top);
        TextRect(RectText, Str, [tfCenter, tfSingleLine, tfVerticalCenter]);
      end;
      Pen.Color := ColorLighter(FMainColor);
      MoveTo(0, DrawPanelStat.ClientHeight - 20);
      LineTo(DrawPanelStat.ClientWidth, DrawPanelStat.ClientHeight - 20);
    finally
      EndDraw;
      Free;
    end;
  end;
end;

procedure TFormMain.EditSearchEnter(Sender: TObject);
begin
  ButtonFlatSearchBoard.BorderColor := $00AFA59E;
  ButtonFlatSearchBoard.BorderWidth := 2;
end;

procedure TFormMain.EditSearchExit(Sender: TObject);
begin
  ButtonFlatSearchBoard.BorderColor := $00E5E1DF;
  ButtonFlatSearchBoard.BorderWidth := 1;
end;

procedure TFormMain.EditSearchKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    ButtonSearchClick(Sender);
  end;
end;

procedure TFormMain.SetMenuIconColor(Color: TColor);
var
  i: Integer;
begin
  for i := 0 to ImageListButtons.Count - 1 do
    ColorImages(ImageListButtons, i, Color);
  ColorImages(ImageListKType, 4, Color);
  ColorImages(ImageListKType, 5, Color);
  ColorImages(ImageListKType, 6, Color);
  ColorImages(ImageListKType, 7, Color);
end;

procedure TFormMain.SplitterMoved(Sender: TObject);
begin
  if (Chromium <> nil) then
    Chromium.NotifyMoveOrResizeStarted;
end;

procedure TFormMain.SplitterPaint(Sender: TObject);
begin
  with Splitter.Canvas do
  begin
    Pen.Color := ColorDarker(Splitter.Color, 40);
    MoveTo((Splitter.Width div 4) * 1, Splitter.Height div 2 - 10);
    LineTo((Splitter.Width div 4) * 1, Splitter.Height div 2 + 10);
    MoveTo((Splitter.Width div 4) * 2, Splitter.Height div 2 - 10);
    LineTo((Splitter.Width div 4) * 2, Splitter.Height div 2 + 10);
    MoveTo((Splitter.Width div 4) * 3, Splitter.Height div 2 - 10);
    LineTo((Splitter.Width div 4) * 3, Splitter.Height div 2 + 10);
  end;
end;

type
  TColorControl = class(TWinControl)
  public
    property Color;
  end;

procedure TFormMain.SetMenuColor(Value: TColor);
type
  TControls = TList<TWinControl>;
var
  i, c: Integer;
  Group1: TControls; //
  Group2: TControls; // Заголовки с элементами управления
begin
  Group1 := TControls.Create;
  Group2 := TControls.Create;

  Group1.Add(PanelMenu);
  Group1.Add(PanelFilter);
  Group1.Add(PanelList);
  Group1.Add(PanelListTools);

  Group2.Add(PanelStatTop);
  Group2.Add(PanelImportTop);
  Group2.Add(PanelKSearchTop);
  Group2.Add(PanelImportCtrl);

  for c := 0 to Group1.Count - 1 do
    with TColorControl(Group1[c]) do
    begin
      Color := Value;
      ParentBackground := False;
      ParentColor := False;
      for i := 0 to ControlCount - 1 do
      begin
        if Controls[i] is TShape then
        begin
          (Controls[i] as TShape).Brush.Color := ColorLighter(Value, 10);
          (Controls[i] as TShape).Pen.Color := ColorLighter(Value, 10);
          (Controls[i] as TShape).Height := 1;
        end;
        if Controls[i] is TButtonFlat then
        begin
          (Controls[i] as TButtonFlat).ColorNormal := Value;
          (Controls[i] as TButtonFlat).ColorOver := ColorDarker(Value, 15);
          (Controls[i] as TButtonFlat).ColorPressed := ColorLighter(Value, 15);
        end;
        if Controls[i] is TLabel then
        begin
          (Controls[i] as TLabel).Font.Color := ColorDarker(clWhite, 10);
        end;
      end;
    end;
  for c := 0 to Group2.Count - 1 do
    with TColorControl(Group2[c]) do
    begin
      Color := Value;
      ParentBackground := False;
      ParentColor := False;
      for i := 0 to ControlCount - 1 do
      begin
        if Controls[i] is TLabel then
        begin
          (Controls[i] as TLabel).Font.Color := ColorDarker(clWhite, 10);
        end;
        if Controls[i] is TButtonFlat then
        begin
          (Controls[i] as TButtonFlat).ColorNormal := Value;
          (Controls[i] as TButtonFlat).ColorOver := ColorDarker(Value, 15);
          (Controls[i] as TButtonFlat).ColorPressed := ColorLighter(Value, 15);
        end;
      end;
    end;
  with ScrollBox1 do
  begin
    Color := Value;
    ParentBackground := False;
    ParentColor := False;
    for i := 0 to ControlCount - 1 do
    begin
      if Controls[i] is TTableEx then
      begin
        (Controls[i] as TTableEx).Font.Color := ColorDarker(clWhite, 10);
        (Controls[i] as TTableEx).FontHotLine.Color := ColorDarker(clWhite, 10);
        (Controls[i] as TTableEx).FontLine.Color := ColorDarker(clWhite, 10);
        (Controls[i] as TTableEx).FontSelLine.Color := ColorDarker(clWhite, 10);
        (Controls[i] as TTableEx).Color := Value;
        (Controls[i] as TTableEx).LineColor := Value;
        (Controls[i] as TTableEx).LineColorXor := Value;
        (Controls[i] as TTableEx).LineHotColor := Value;
        (Controls[i] as TTableEx).LineSelColor := Value;
      end;
      if Controls[i] is TLabel then
      begin
        (Controls[i] as TLabel).Font.Color := ColorDarker(clWhite, 10);
      end;
      if Controls[i] is TButtonFlat then
      begin
        (Controls[i] as TButtonFlat).ColorNormal := Value;
        (Controls[i] as TButtonFlat).ColorOver := ColorDarker(Value, 15);
        (Controls[i] as TButtonFlat).ColorPressed := ColorLighter(Value, 15);
      end;
    end;
  end;

  ShapeSplit.Brush.Color := ColorLighter(Value, 10);
  ShapeSplit.Pen.Color := ColorLighter(Value, 10);
  ShapeSplit.Width := 1;

  ShapeSplitTop.Brush.Color := ColorDarker(PanelHead.Color, 10);
  ShapeSplitTop.Pen.Color := ColorDarker(PanelHead.Color, 10);
  ShapeSplitTop.Height := 1;

  Shape4.Brush.Color := ColorDarker(PanelHead.Color, 10);
  Shape4.Pen.Color := ColorDarker(PanelHead.Color, 10);
  Shape4.Height := 1;
end;

procedure TFormMain.SetInterface;
begin
  FMainColor := $009A572B;
  SetMenuColor(FMainColor);
  SetMenuIconColor(ColorLighter(FMainColor, 50));
  PanelList.BringToFront;
  OpenImportPage(TabSheetImport);
  ButtonFlatCloseBrowserClick(nil);
end;

procedure TFormMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := FCanClose;
  if not FClosing then
  begin
    FClosing := True;
    Visible := False;
    Chromium.CloseBrowser(True);
  end;
end;

procedure TFormMain.FormCreate(Sender: TObject);
begin
  FLoading := TDecoratePanel.Create(Self, PanelLoading, False);
  ActivityIndicatorLoading.Animate := False;
  FCanClose := False;
  FClosing := False;
  FSaveNotify := False;
  SetInterface;
  FSettings := TSettingsIni.Create(ExtractFilePath(ParamStr(0)) + '\config.ini');
  with TableExList do
  begin
    BeginAddColumns;
    AddColumn('', 32);
    AddColumn('Заголовок', FSettings.GetInt('Columns', 'Caption', 200));
    AddColumn('Тип', FSettings.GetInt('Columns', 'Type', 100));
    AddColumn('Год', FSettings.GetInt('Columns', 'Year', 60));
    AddColumn('Жанр', FSettings.GetInt('Columns', 'Genre', 100));
    Columns[AddColumn('Оценка', FSettings.GetInt('Columns', 'Rating', 90))].Format := [tfCenter, tfSingleLine, tfVerticalCenter];
    Columns[AddColumn('Оценка 2', FSettings.GetInt('Columns', 'Rating2', 90))].Format := [tfCenter, tfSingleLine, tfVerticalCenter];
    Columns[AddColumn('', FSettings.GetInt('Columns', 'State', 36), True)].ShowButtonOnlySelect := False;
    Columns[AddColumn('', FSettings.GetInt('Columns', 'Kinopoisk', 36), True)].ShowButtonOnlySelect := False;
    AddColumn('Информация', FSettings.GetInt('Columns', 'Info', 150));
   //AddColumn('Дата добавления', FSettings.GetInt('Columns', 'Date', 120));
    AddColumn('', 10);
    EndAddColumns;
  end;
  FSettings.GetParamWindow('General', FormMain, [wpsAll]);
  FKinoList := TKinoItems.Create(TableExList, ExtractFilePath(ParamStr(0)) + 'data.db');
  FKinoList.GlobalFilter := gfAll;
  FKinoList.OrderBy := fnCaption;
  FKinoList.OrderDesc := False;
  try
    LoadList;
  except

  end;
  FStat := TKinoStatistics.Create(TableExStat);
  with TableExStat do
  begin
    BeginAddColumns;
    AddColumn('Параметр', 250);
    AddColumn('Значение', 100);
    EndAddColumns;
  end;
  UpdateStat;
  FSearchList := TKinoElements.Create(TableExKinoSearch);
  with TableExKinoSearch do
  begin
    BeginAddColumns;
    AddColumn('Заголовок', 250);
    AddColumn('Год', 100);
    AddColumn('Рейтинг', 50);
    AddColumn('Жанр', 200);
    AddColumn('Информация', 220);
    EndAddColumns;
  end;
  FSearchList.UpdateTable;
  PanelMenu.Width := 46;
  UpdateMenu;
  UpdateGlobalFilter;
  UpdateFilterNotify;
  if not Chromium.CreateBrowser(CEFWindowParent) then
    TimerChrome.Enabled := True;
  ActivityIndicatorLoading.Animate := True;
  FLoading.Open(False);
end;

procedure TFormMain.FormDestroy(Sender: TObject);
begin
  FSettings.SetInt('Columns', 'Caption', TableExList.Columns[1].Width);
  FSettings.SetInt('Columns', 'Type', TableExList.Columns[2].Width);
  FSettings.SetInt('Columns', 'Year', TableExList.Columns[3].Width);
  FSettings.SetInt('Columns', 'Genre', TableExList.Columns[4].Width);
  FSettings.SetInt('Columns', 'Rating', TableExList.Columns[5].Width);
  FSettings.SetInt('Columns', 'Rating2', TableExList.Columns[6].Width);
  FSettings.SetInt('Columns', 'State', TableExList.Columns[7].Width);
  FSettings.SetInt('Columns', 'Kinopoisk', TableExList.Columns[8].Width);
  FSettings.SetInt('Columns', 'Info', TableExList.Columns[9].Width);
  FSettings.SetInt('Columns', 'Date', TableExList.Columns[10].Width);
  FSettings.SetParamWindow('General', FormMain, [wpsAll]);
  SaveList;
end;

procedure TFormMain.FormResize(Sender: TObject);
begin
  if (Chromium <> nil) then
    Chromium.NotifyMoveOrResizeStarted;
  FLoading.UpdateSize;
end;

procedure TFormMain.FormShow(Sender: TObject);
begin
  FLoading.CloseDelay(3000,
    procedure
    begin
      ActivityIndicatorLoading.Animate := False;
    end);
end;

procedure TFormMain.LoadList;
var
  Items: TStringList;
  V: Integer;
begin
  FKinoList.Load;
  Items := TStringList.Create;
  FKinoList.GetGenres(Items);
  ComboBoxFilterGenre.Items.Assign(Items);

  FKinoList.GetYears(Items);
  ComboBoxFilterYear.Items.Assign(Items);

  Items.Free;

  V := FKinoList.ListCount(gfNeedToRate);
  ButtonFlatNeedToRate.NotifyVisible := V > 0;
  ButtonFlatNeedToRate.SubText := V.ToString;
  ButtonFlatNeedToRate.VisibleSubText := (V > 0) and (PanelMenu.Width > 46);

  V := FKinoList.ListCount(gfNeedToWatch);
  ButtonFlatNeedToWatch.NotifyVisible := V > 0;
  ButtonFlatNeedToWatch.SubText := V.ToString;
  ButtonFlatNeedToWatch.VisibleSubText := (V > 0) and (PanelMenu.Width > 46);

  V := FKinoList.ListCount(gfAll);
  ButtonFlatListAll.SubText := V.ToString;
  ButtonFlatListAll.VisibleSubText := (V > 0) and (PanelMenu.Width > 46);
end;

procedure TFormMain.MenuItemSetKIDClick(Sender: TObject);
var
  Num: string;
  NInt: Integer;
begin
  if not IndexInList(TableExList.ItemIndex, FKinoList.Count) then
    Exit;
  Num := '';
  if InputQuery('Номер фильма на Кинопоиске', 'Укажите номер фильма, например "418903"', Num) then
    if TryStrToInt(Num, NInt) then
    begin
      FKinoList[TableExList.ItemIndex].KID := NInt;
      FKinoList.UpdateRecord(TableExList.ItemIndex);
      TableExList.Repaint;
    end
    else
      MessageBox(Application.Handle, 'Необходимо указать номер фильма.', '', MB_ICONWARNING or MB_OK);
end;

procedure TFormMain.OpenImportPage(Tab: TTabSheet);
begin
  PageControlImport.ActivePage := Tab;
  SetButtonSelected(ButtonFlatImportExcel, PageControlImport.ActivePage = TabSheetImport);
  SetButtonSelected(ButtonFlatUpdateExcel, PageControlImport.ActivePage = TabSheetUpdateKP);
end;

procedure TFormMain.PageControlImportChange(Sender: TObject);
begin
  OpenImportPage(TabSheetImport);
end;

procedure TFormMain.PanelKSearchExit(Sender: TObject);
begin
  PanelKSearch.Hide;
end;

procedure TFormMain.SaveList;
begin
  FKinoList.Save;
  ButtonFlatStatUpdateClick(nil);
  ButtonFlatSave.NotifyVisible := False;
end;

procedure TFormMain.ButtonSearchClick(Sender: TObject);
begin
  ButtonFlatSearchClear.Visible := EditSearch.Text <> '';
  if EditSearch.Text = '' then
    Exit;
  TableExList.ItemIndex := FKinoList.Search(EditSearch.Text, TableExList.ItemIndex + 1);
  EditSearch.SetFocus;
end;

procedure TFormMain.TableExKinoSearchEdit(Sender: TObject; var Data: TTableEditStruct; ACol, ARow: Integer; var Allow: Boolean);
//var Year:Integer;
begin
  Allow := False;
  if not IndexInList(ARow, FSearchList.Count) then
    Exit;
  if not IndexInList(FSearchID, FKinoList.Count) then
    Exit;
                    {
 FKinoList[FSearchID].Caption:=FSearchList[ARow].Name;
 FKinoList[FSearchID].Genre:=FSearchList[ARow].Genre;
 if TryStrToInt(FSearchList[ARow].Year, Year) then FKinoList[FSearchID].Year:=Year;
 if Pos('сериал', FSearchList[ARow].Name) <> 0 then FKinoList[FSearchID].KinoType:=ktSeries
 else FKinoList[FSearchID].KinoType:=ktFilm;
 if FKinoList[FSearchID].Info = '' then FKinoList[FSearchID].Info:=FSearchList[ARow].Adv;
 if TryStrToInt(FSearchList[ARow].KID, Year) then FKinoList[FSearchID].KID:=Year;  }
  if FillKinoItem(FKinoList[FSearchID], FSearchList[ARow]) then
  begin
    FKinoList.UpdateRecord(FSearchID);
    ButtonFlatSave.NotifyVisible := True;
    ButtonFlatKSearchCloseClick(nil);
  end;
end;

procedure TFormMain.TableExKinoSearchGetData(FCol, FRow: Integer; var Value: string);
begin
  Value := '';
  if not IndexInList(FRow, FSearchList.Count) then
    Exit;
  case FCol of
    0:
      Value := FSearchList[FRow].Name;
    1:
      Value := FSearchList[FRow].Year;
    2:
      Value := FSearchList[FRow].Rating;
    3:
      Value := FSearchList[FRow].Genre;
    4:
      Value := FSearchList[FRow].Adv;
  end;
end;

procedure TFormMain.TableExListColumnClick(Sender: TObject; MouseButton: TMouseButton; const Index: Integer);
var
  Clm: string;
begin
  case Index of
    1:
      Clm := fnCaption;
    2:
      Clm := fnType;
    3:
      Clm := fnYear;
    4:
      Clm := fnGenre;
    5:
      Clm := fnRating;
    6:
      Clm := fnRating2;
    7:
      Clm := fnViewed;
    8:
      Clm := fnKPMarked;
    9:
      Clm := fnInfo;
  //10:Clm:=fnDate;
  else
    Exit;
  end;
  if FKinoList.OrderBy = Clm then
    FKinoList.OrderDesc := not FKinoList.OrderDesc
  else
  begin
    FKinoList.OrderDesc := False;
    FKinoList.OrderBy := Clm;
  end;
  LoadList;
end;

procedure TFormMain.TableExListDrawCellData(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
  if not IndexInList(ARow, FKinoList.Count) then
    Exit;

  with TableExList.Canvas do
  begin
    case ACol of
      0:
        ImageListKType.Draw(TableExList.Canvas, Rect.Left, Rect.Top, Ord(FKinoList.Items[ARow].KinoType), True);
      7:
        if FKinoList.Items[ARow].Viewed then
          ImageListButtons.Draw(TableExList.Canvas, Rect.Left + (Rect.Width div 2 - 24 div 2), Rect.Top + (Rect.Height div 2 - 24 div 2), 18, True);
      8:
        if FKinoList.Items[ARow].KPMarked then
          ImageListButtons.Draw(TableExList.Canvas, Rect.Left + (Rect.Width div 2 - 24 div 2), Rect.Top + (Rect.Height div 2 - 24 div 2), 8, True);
      11:
        if FKinoList.Items[ARow].KID < 1 then
        begin
          ImageListButtons.Draw(TableExList.Canvas, Rect.Left + 2, Rect.Top + (Rect.Height div 2 - 24 div 2), 19, True);
        end;
    end;
  end;
end;

function GetColumnId(ColumnName: string): Integer;
begin
  if ColumnName = fnCaption then
    Exit(1);
  if ColumnName = fnType then
    Exit(2);
  if ColumnName = fnYear then
    Exit(3);
  if ColumnName = fnGenre then
    Exit(4);
  if ColumnName = fnRating then
    Exit(5);
  if ColumnName = fnRating2 then
    Exit(6);
  if ColumnName = fnViewed then
    Exit(7);
  if ColumnName = fnKPMarked then
    Exit(8);
  if ColumnName = fnInfo then
    Exit(9);
  if ColumnName = fnDate then
    Exit(10);
  Result := -1;
end;

procedure TFormMain.TableExListDrawColumnData(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  i: Integer;
begin
  with TableExList.Canvas do
  begin
    if ACol = GetColumnId(FKinoList.OrderBy) then
    begin
      Pen.Color := ColorDarker(TableExList.ColumnsColor, 20);
      Pen.Width := 1;
      for i := 0 to 3 do
      begin
        MoveTo(Rect.Left + 1, Rect.Bottom - i);
        LineTo(Rect.Right, Rect.Bottom - i);
      end;
      //if FKinoList.OrderDesc then
      // ImageListKType.Draw(TableExList.Canvas, Rect.Right-32, Rect.Top+(Rect.Height div 2 - 32 div 2), 5, True)
      //else
      // ImageListKType.Draw(TableExList.Canvas, Rect.Right-32, Rect.Top+(Rect.Height div 2 - 32 div 2), 4, True);
    end;
    case ACol of
      7:
        ImageListButtons.Draw(TableExList.Canvas, Rect.Left + (Rect.Width div 2 - 24 div 2), Rect.Top + (Rect.Height div 2 - 24 div 2), 18, True);
      8:
        ImageListButtons.Draw(TableExList.Canvas, Rect.Left + (Rect.Width div 2 - 24 div 2), Rect.Top + (Rect.Height div 2 - 24 div 2), 8, True);
    else


    end;
  end;
end;

procedure TFormMain.TableExListEdit(Sender: TObject; var Data: TTableEditStruct; ACol, ARow: Integer; var Allow: Boolean);
var
  i: Integer;
begin
  Allow := False;
  if not IndexInList(ARow, FKinoList.Count) then
    Exit;
  case ACol of
    1:
      begin
        Data.EditMode := teText;
        Data.TextValue := FKinoList.Items[ARow].Caption;
        Data.ReadOnly := False;
        Allow := True;
      end;
    2:
      begin
        Data.EditMode := teList;
        Data.FixedList := True;
        Data.Items := TStringList.Create;
        Data.Items.Add(KinoTypeToStr(ktFilm));
        Data.Items.Add(KinoTypeToStr(ktSeries));
        Data.ItemValue := Ord(FKinoList.Items[ARow].KinoType);
        Data.TextValue := FKinoList.Items[ARow].StrKinoType;
        Data.ReadOnly := False;
        Allow := True;
      end;
    3:
      begin
        Data.EditMode := teInt;
        Data.TextValue := IntToStr(FKinoList.Items[ARow].Year);
        if Data.TextValue = '0' then
          Data.TextValue := '';
        Data.ReadOnly := False;
        Allow := True;
      end;
    4:
      begin
        Data.EditMode := teList;
        Data.FixedList := False;
        Data.ListDrop := True;
        Data.Items := TStringList.Create;
        FKinoList.GetGenres(Data.Items);
        Data.TextValue := FKinoList.Items[ARow].Genre;
        Data.ReadOnly := False;
        Allow := True;
      end;
    5:
      begin
        Data.EditMode := teList;
        Data.FixedList := False;
        Data.ListDrop := True;
        Data.Items := TStringList.Create;
        Data.Items.Add('Нет');
        for i := 1 to 10 do
          Data.Items.Add(IntToStr(i));
        Data.TextValue := FloatToStr(FKinoList.Items[ARow].Rating);
        if Data.TextValue = '0' then
          Data.TextValue := '';
        Data.ReadOnly := False;
        Allow := True;
      end;
    6:
      begin
        Data.EditMode := teList;
        Data.FixedList := False;
        Data.ListDrop := True;
        Data.Items := TStringList.Create;
        Data.Items.Add('Нет');
        for i := 1 to 10 do
          Data.Items.Add(IntToStr(i));
        Data.TextValue := FloatToStr(FKinoList.Items[ARow].Rating2);
        if Data.TextValue = '0' then
          Data.TextValue := '';
        Data.ReadOnly := False;
        Allow := True;
      end;
    7:
      begin
    //FKinoList.Items[ARow].Viewed:=not FKinoList.Items[ARow].Viewed;
    //Data.EditMode:=teList;
    //Data.FixedList:=True;
    //Data.Items:=TStringList.Create;
    //Data.Items.Add('Не просмотрен');
    //Data.Items.Add('Просмотрен');
    //Data.ItemValue:=Ord(FKinoList.Items[ARow].Viewed);
    //Data.ReadOnly:=True;
    //Allow:=True;
      end;
    8:
      begin
    //FKinoList.Items[ARow].KPMarked:= not FKinoList.Items[ARow].KPMarked;
    {Data.EditMode:=teList;
    Data.FixedList:=True;
    Data.Items:=TStringList.Create;
    Data.Items.Add('Не отмечен');
    Data.Items.Add('Отмечен');
    Data.ItemValue:=Ord(FKinoList.Items[ARow].KPMarked);
    Data.ReadOnly:=True;
    Allow:=True;  }
      end;
    9:
      begin
        Data.EditMode := teText;
        Data.TextValue := FKinoList.Items[ARow].Info;
        Data.ReadOnly := False;
        Allow := True;
      end;
  end;
end;

procedure TFormMain.TableExListEditCancel(Sender: TObject; ACol, ARow: Integer);
begin
  if not IndexInList(ARow, FKinoList.Count) then
    Exit;
  if FKinoList.Items[ARow].Empty then
    FKinoList.Delete(ARow);
  UpdateStat;
end;

procedure TFormMain.TableExListEditOk(Sender: TObject; Value: string; ItemValue, ACol, ARow: Integer);
begin
  if not IndexInList(ARow, FKinoList.Count) then
    Exit;
  case ACol of
    1:
      FKinoList.Items[ARow].Caption := Value;
    2:
      FKinoList.Items[ARow].KinoType := TKinoType(ItemValue);
    3:
      FKinoList.Items[ARow].Year := StrToInt(Value);
    4:
      FKinoList.Items[ARow].Genre := Value;
    5:
      begin
        FKinoList.Items[ARow].Rating := Max(0, Min(ItemValue, 10));
        if FKinoList.Items[ARow].Rating > 0 then
          FKinoList.Items[ARow].Viewed := True;
      end;
    6:
      FKinoList.Items[ARow].Rating2 := Max(0, Min(ItemValue, 10));
    7:
      FKinoList.Items[ARow].Viewed := Boolean(ItemValue);
    8:
      FKinoList.Items[ARow].KPMarked := Boolean(ItemValue);
    9:
      FKinoList.Items[ARow].Info := Value;
  end;
  FKinoList.UpdateRecord(ARow);
  ButtonFlatSave.NotifyVisible := True;
end;

procedure TFormMain.TableExListGetData(FCol, FRow: Integer; var Value: string);
begin
  Value := '';
  if not IndexInList(FRow, FKinoList.Count) then
    Exit;
  case FCol of
    0:
      Exit;
    1:
      Value := FKinoList[FRow].StrCaption;
    2:
      Value := FKinoList[FRow].StrKinoType;
    3:
      Value := FKinoList[FRow].StrYear;
    4:
      Value := FKinoList[FRow].StrGenre;
    5:
      Value := FKinoList[FRow].StrRating;
    6:
      Value := FKinoList[FRow].StrRating2;
  //7:Value:=FKinoList[FRow].StrViewed;
  //8:Value:=FKinoList[FRow].StrKPMarked;
    9:
      Value := FKinoList[FRow].StrInfo;
  //10:Value:=FKinoList[FRow].StrDate;
  end;
end;

procedure TFormMain.TableExListItemColClick(Sender: TObject; MouseButton: TMouseButton; const Index: Integer);
begin
  if not IndexInList(TableExList.ItemIndex, FKinoList.Count) then
    Exit;
  if not (Index in [7, 8]) then
    Exit;
  case Index of
    7:
      FKinoList.Items[TableExList.ItemIndex].Viewed := not FKinoList.Items[TableExList.ItemIndex].Viewed;
    8:
      FKinoList.Items[TableExList.ItemIndex].KPMarked := not FKinoList.Items[TableExList.ItemIndex].KPMarked;
  end;
  FKinoList.UpdateRecord(TableExList.ItemIndex);
  UpdateStat;
  ButtonFlatSave.NotifyVisible := True;
end;

procedure TFormMain.TableExListKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key in [Ord('A')..Ord('Z'), Ord('0')..Ord('9'), VK_NUMPAD0..VK_NUMLOCK, VK_RETURN] then
    TableExList.Edit(TableExList.ItemIndex, TableExList.FocusedColumn);
end;

procedure TFormMain.TableExListMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  case Button of
    TMouseButton.mbRight:
      begin
        if not IndexInList(TableExList.ItemIndex, FKinoList.Count) then
          Exit;
        PopupMenuList.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
      end;
  end;
end;

procedure TFormMain.TableExStatGetData(FCol, FRow: Integer; var Value: string);
begin
  Value := '';
  if not IndexInList(FRow, FStat.Count) then
    Exit;
  case FCol of
    0:
      Value := FStat[FRow].Caption;
    1:
      Value := FStat[FRow].Value;
  end;
end;

procedure TFormMain.TimerChromeTimer(Sender: TObject);
begin
  TimerChrome.Enabled := False;
  if (not Chromium.CreateBrowser(CEFWindowParent)) and (not Chromium.Initialized) then
    TimerChrome.Enabled := True;
end;

end.

