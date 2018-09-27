unit KinoLib.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Generics.Collections, Vcl.Grids,
  KinoLib.List, Vcl.ExtCtrls, HGM.Common.Settings,
  System.ImageList, Vcl.ImgList, Vcl.StdCtrls, Vcl.Buttons, IdSSLOpenSSL,
  HGM.Common.Utils, HGM.WinAPI.ShellDlg, acPNG, IdHTTP, IdURI,
  Vcl.Menus, HGM.Controls.PanelExt, HGM.Controls.VirtualTable, HGM.Button;

type
  TKinoElement = record
   Rating,
   Name,
   Year,
   Genre,
   Adv, KID:string;
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
    DrawPanel1: TDrawPanel;
    PanelImport: TPanel;
    PanelImportTop: TPanel;
    Label5: TLabel;
    ButtonFlat3: TButtonFlat;
    FileOpenDialogXLS: TFileOpenDialog;
    StringGridXL: TStringGrid;
    PanelImportCtrl: TPanel;
    ButtonFlat6: TButtonFlat;
    Label6: TLabel;
    ButtonFlatKSearch: TButtonFlat;
    ButtonFlat5: TButtonFlat;
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
    ButtonFlat1: TButtonFlat;
    MenuItemSetKID: TMenuItem;
    N7: TMenuItem;
    procedure TableExListGetData(FCol, FRow: Integer; var Value: string);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure TableExListEdit(Sender: TObject; var Data: TTableEditStruct; ACol,
      ARow: Integer; var Allow: Boolean);
    procedure TableExListEditOk(Sender: TObject; Value: string; ItemValue, ACol,
      ARow: Integer);
    procedure TableExListColumnClick(Sender: TObject; MouseButton: TMouseButton;
      const Index: Integer);
    procedure ButtonFlatSaveClick(Sender: TObject);
    procedure ButtonFlatImportClick(Sender: TObject);
    procedure ButtonFlatQuitClick(Sender: TObject);
    procedure TableExListDrawCellData(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure ComboBoxFilterYearChange(Sender: TObject);
    procedure ComboBoxFilterGenreChange(Sender: TObject);
    procedure ComboBoxFilterRatingChange(Sender: TObject);
    procedure ButtonSearchClick(Sender: TObject);
    procedure ButtonFlatFilterClick(Sender: TObject);
    procedure TableExListDrawColumnData(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure ButtonFlatStatClick(Sender: TObject);
    procedure ButtonFlatHideStatClick(Sender: TObject);
    procedure TableExStatGetData(FCol, FRow: Integer; var Value: string);
    procedure ButtonFlatStatUpdateClick(Sender: TObject);
    procedure ButtonFlat4Click(Sender: TObject);
    procedure DrawPanel1Paint(Sender: TObject);
    procedure ButtonFlatSearchClearClick(Sender: TObject);
    procedure ButtonFlatFilmAddClick(Sender: TObject);
    procedure ButtonFlatFilmDeleteClick(Sender: TObject);
    procedure ButtonFlatFilmFindClick(Sender: TObject);
    procedure ButtonFlat2Click(Sender: TObject);
    procedure TableExListKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ButtonFlat5Click(Sender: TObject);
    procedure ButtonFlat6Click(Sender: TObject);
    procedure ButtonFlatKSearchClick(Sender: TObject);
    procedure PanelKSearchExit(Sender: TObject);
    procedure TableExKinoSearchGetData(FCol, FRow: Integer; var Value: string);
    procedure ButtonFlatKSearchCloseClick(Sender: TObject);
    procedure TableExKinoSearchEdit(Sender: TObject; var Data: TTableEditStruct;
      ACol, ARow: Integer; var Allow: Boolean);
    procedure TableExListMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ButtonFlatFindFilmGoogleClick(Sender: TObject);
    procedure TableExListEditCancel(Sender: TObject; ACol, ARow: Integer);
    procedure TableExListItemColClick(Sender: TObject;
      MouseButton: TMouseButton; const Index: Integer);
    procedure EditSearchKeyPress(Sender: TObject; var Key: Char);
    procedure ButtonFlatSavePaint(Sender: TObject);
    procedure ButtonFlat1Click(Sender: TObject);
    procedure MenuItemSetKIDClick(Sender: TObject);
  private
    FSaveNotify:Boolean;
    FKinoList:TKinoItems;
    FStat:TKinoStatistics;
    FMainColor:TColor;
    FSettings:TSettingsIni;
    FSearchList:TKinoElements;
    FSearchID:Integer;
    FFilterNotify: Boolean;
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
  public
    procedure LoadList;
    procedure SaveList;
    property KinoList:TKinoItems read FKinoList;
  end;

const
  BaseURL = 'https://www.kinopoisk.ru/index.php?kp_query=%s';

var
  FormMain:TFormMain;

  function GetHTMLTag(HTMLData, Tag, Param:string; FullTag:Boolean; var Offset:Integer):string; overload;
  function GetHTMLTag(HTMLData, Tag, Param:string; FullTag:Boolean = False):string; overload;

implementation
 uses ShellAPI, Direct2D, D2D1, ComObj, ActiveX,
      MSHTML, ADODB_TLB, CDO_TLB, System.StrUtils, Clipbrd;

{$R *.dfm}

function FillKinoItem(Item:TKinoItem; SearchRec:TKinoElement):Boolean;
var Year:Integer;
begin
 Result:=True;
 Item.Caption:=SearchRec.Name;
 Item.Genre:=SearchRec.Genre;
 if TryStrToInt(SearchRec.Year, Year) then Item.Year:=Year;
 Year:=Pos('(сериал)', AnsiLowerCase(SearchRec.Name));
 if Year <> 0 then
  begin
   Item.Caption:=Copy(SearchRec.Name, 1, Year-2);
   Item.KinoType:=ktSeries;
  end
 else Item.KinoType:=ktFilm;
 if Item.Info = '' then Item.Info:=SearchRec.Adv;
 if TryStrToInt(SearchRec.KID, Year) then Item.KID:=Year;
end;

function HTMLTextToString(HTMLData:string):string;
begin
 Result:=StringReplace(HTMLData, '&amp;',  '&', [rfReplaceAll, rfIgnoreCase]);
 Result:=StringReplace(Result,  '&lt;',  '<', [rfReplaceAll, rfIgnoreCase]);
 Result:=StringReplace(Result,  '&gt;',  '>', [rfReplaceAll, rfIgnoreCase]);
 Result:=StringReplace(Result,  '&quot;',  '"', [rfReplaceAll, rfIgnoreCase]);
 Result:=StringReplace(Result,  '&apos;', '''', [rfReplaceAll, rfIgnoreCase]);
 Result:=StringReplace(Result,  '&nbsp;', ' ', [rfReplaceAll, rfIgnoreCase]);
 Result:=StringReplace(Result,  '&ndash;', '–', [rfReplaceAll, rfIgnoreCase]);
 Result:=StringReplace(Result,  '&#38;', '&', [rfReplaceAll, rfIgnoreCase]);
 Result:=StringReplace(Result,  '&middot;', '·', [rfReplaceAll, rfIgnoreCase]);
 Result:=StringReplace(Result,  '&laquo;', '«', [rfReplaceAll, rfIgnoreCase]);
 Result:=StringReplace(Result,  '&raquo;', '»', [rfReplaceAll, rfIgnoreCase]);
end;

function GetTagPropValue(HTMLData, PropName:string; Offset:Integer = 1):string;
var HData, tmp1:string;
var i, p, e:Integer;
begin
 Result:='';
 HTMLData:=StringReplace(HTMLData, #13#10, ' ', [rfReplaceAll]);
 HTMLData:=StringReplace(HTMLData, '  ', '', [rfReplaceAll]);
 HData:=AnsiLowerCase(HTMLData);
 PropName:=AnsiLowerCase(PropName)+'="';
 p:=Pos(PropName, HData, Offset);
 if p <= 0 then Exit;
 e:=Pos('"', HData, Offset+p+PropName.Length+1);
 if p <= 0 then Exit;
 Result:=Copy(HTMLData, p+PropName.Length, e-(p+PropName.Length));
end;

function ClearHTMLTags(HTMLData:string):string;
var i:Integer;
    Writing:Boolean;
begin
 Result:='';
 Writing:=False;
 for i:= 1 to HTMLData.Length do
  begin
   if HTMLData[i] = '<' then Writing:=False;
   if Writing then Result:=Result+HTMLData[i];
   if HTMLData[i] = '>' then Writing:=True;
  end;
end;

function GetHTMLTag(HTMLData, Tag, Param:string; FullTag:Boolean; var Offset:Integer):string;
var HData, TagClose, TagOpen, WStr:string;
    p, TagCount, i:Integer;
    Writing:Boolean;
begin
 Result:='';
 HTMLData:=StringReplace(HTMLData, #13#10, ' ', [rfReplaceAll]);
 HTMLData:=StringReplace(HTMLData, '  ', '', [rfReplaceAll]);
 HData:=AnsiLowerCase(HTMLData);
 TagClose:=Format('</%s>', [AnsiLowerCase(Tag)]);
 TagOpen:= Format('<%s', [AnsiLowerCase(Tag)]);
 if FullTag then
  begin
   if Param = '' then Exit;
   Tag:=AnsiLowerCase(Param);
  end
 else
  begin
   if Param <> ''
   then Tag:=Format('<%s class="%s">', [AnsiLowerCase(Tag), AnsiLowerCase(Param)])
   else Tag:=Format('<%s', [AnsiLowerCase(Tag)]);
  end;
 p:=Pos(Tag, HData, Offset);
 if p > 0 then
  begin
   p:=p+Tag.Length;
   TagCount:=1;
   WStr:='';
   Writing:=False;
   for i:= p to HData.Length do
    begin
     if Writing then           //<p
      begin
       WStr:=WStr+HData[i];
       if WStr = TagOpen then Inc(TagCount);
       if WStr = TagClose then Dec(TagCount);
      end;
     if HData[i] = '<' then
      begin
       Writing:=True;
       WStr:='<';
       Continue;
      end;
     if HData[i] = '>' then
      begin
       if not Writing then p:=i+1;
       Writing:=False;
       WStr:='';
      end;
     if TagCount <= 0 then
      begin
       Offset:=i-p-TagClose.Length+1;
       Result:=Copy(HTMLData, p, Offset);
       Offset:=p+Offset;
       Break;
      end;
    end;
  end;
end;

function GetHTMLTag(HTMLData, Tag, Param:string;  FullTag:Boolean):string;
var Offset:Integer;
begin
 Offset:=1;
 Result:=GetHTMLTag(HTMLData, Tag, Param, FullTag, Offset);
end;

procedure TFormMain.ButtonFlatQuitClick(Sender: TObject);
begin
 Application.Terminate;
end;

procedure TFormMain.ButtonFlatSaveClick(Sender: TObject);
begin
 SaveList;
 LoadList;
end;

procedure TFormMain.ButtonFlatSavePaint(Sender: TObject);
var DR:TRect;
    NW:Integer;
    D2:TDirect2DCanvas;
begin   {
 if SaveNotify then
  begin
   with TDirect2DCanvas.Create(ButtonFlatSave.Canvas, ButtonFlatSave.ClientRect) do
    begin
     try
      RenderTarget.BeginDraw;
      Brush.Style:=bsSolid;
      Pen.Style:=psSolid;
      NW:=8;
      DR:=Rect(0, 0, NW, NW);
      DR.SetLocation(ButtonFlatSave.ImageIndentLeft+ButtonFlatSave.Images.Width-4, (ButtonFlatSave.Height div 2 - ButtonFlatSave.Images.Height div 2)-4);
      Pen.Color:=$0042A4FF;
      Brush.Color:=$0042A4FF;
      Ellipse(DR);
      RenderTarget.EndDraw;
     except

     end;
     Free;
    end;
  end;  }
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
 FStat.UpdateStat(FKinoList);
end;

procedure TFormMain.ButtonFlatSearchClearClick(Sender: TObject);
begin
 EditSearch.Clear;
end;

procedure TFormMain.FilmDelete;
begin
 ButtonFlatHideStatClick(nil);
 if not IndexInList(TableExList.ItemIndex, FKinoList.Count) then Exit;
 if FKinoList[TableExList.ItemIndex].Caption <> '' then
  begin
   if not AskYesNo('Прошу ответить', 'Удалить "'+FKinoList[TableExList.ItemIndex].Caption+'" из списка?') then Exit
  end
 else
  begin
   if not AskYesNo('Прошу ответить', 'Удалить выбранный элемент из списка?') then Exit
  end;
 FKinoList.DeleteRecord(TableExList.ItemIndex);
 ButtonFlatSave.NotifyVisible:=True;
end;

procedure TFormMain.ButtonFlatFilmDeleteClick(Sender: TObject);
begin
 FilmDelete;
end;
 //https://rating.kinopoisk.ru/89515.xml.
procedure TFormMain.FilmFindKinopoisk;
var Str:string;
begin
 ButtonFlatHideStatClick(nil);
 if not IndexInList(TableExList.ItemIndex, FKinoList.Count) then
  begin
   if AskYesNo('Вопрос', 'Элемент не выбран. Открыть просто сайт Кинопоиск?') then
    ShellExecute(Application.Handle, 'open', PChar('https://www.kinopoisk.ru'), nil, nil, SW_NORMAL);
   Exit;
  end;
 if FKinoList[TableExList.ItemIndex].KID > 1 then
  begin
   Str:=IntToStr(FKinoList[TableExList.ItemIndex].KID);
   ShellExecute(Application.Handle, 'open', PChar('https://www.kinopoisk.ru/film/'+Str), nil, nil, SW_NORMAL);
   Exit;
  end
 else
  begin
   Str:=FKinoList[TableExList.ItemIndex].Caption;
   ShellExecute(Application.Handle, 'open', PChar(TIdURI.PathEncode('https://www.kinopoisk.ru/index.php?kp_query='+Str)), nil, nil, SW_NORMAL);
  end;
end;

procedure TFormMain.ButtonFlatFilmFindClick(Sender: TObject);
begin
 FilmFindKinopoisk;
end;

procedure TFormMain.UpdateFilterNotify;
begin
 ButtonFlatFilter.NotifyVisible:=(FKinoList.FilterYear >= 0) or (FKinoList.FilterGenre <> '') or (FKinoList.FilterRating >= 0);
end;

procedure TFormMain.UpdateMenu;
var i:Integer;
begin
 for i:=0 to PanelMenu.ControlCount - 1 do
  begin
   if PanelMenu.Controls[i] is TButtonFlat then
    begin
     if PanelMenu.Width <= 46 then
      (PanelMenu.Controls[i] as TButtonFlat).Shape:=stCircle
     else (PanelMenu.Controls[i] as TButtonFlat).Shape:=stRoundRect;
    end;
  end;
end;

procedure TFormMain.ButtonFlat1Click(Sender: TObject);
var i, r, j, p:Integer;
    Data:TKinoElement;
    CItem:TKinoItem;
begin
 LabelKSearch.Caption:='Подождите, идёт поиск...';
 PanelKSearch.Show;
 PanelKSearch.BringToFront;
 PanelKSearch.SetFocus;
 Application.ProcessMessages;
 for i:= 0 to FKinoList.Count-1 do
  begin
   CItem:=FKinoList[i];
   //if (FKinoList[i].KinoType = ktSeries) and (Pos('', )) then Continue;
   //if FKinoList[i].Year <= 0 then Continue;
   if CItem.KID > 1 then Continue;
   TableExList.ItemIndex:=i;
   FSearchList.Clear;
   Application.ProcessMessages;
   r:=WebSearch(i);
   if r > 0 then
    begin
     j:=0;
     r:=-1;
     while (FSearchList.Count > 0) and (j < FSearchList.Count) do
      begin
       Data:=FSearchList[j];
       if CItem.KinoType = ktSeries then
        begin
         p:=Pos('(сериал)', AnsiLowerCase(Data.Name));
         if p = 0 then
          begin
           FSearchList.Delete(j);
           Continue;
          end;
         Data.Name:=Copy(Data.Name, 1, p-2);
        end;
       if Data.Name <> CItem.Caption then
        begin
         FSearchList.Delete(j);
         Continue;
        end;
       if Data.Year = CItem.Year.ToString then
        begin
         r:=j;
         Break;
        end;
       Inc(j);
      end;
     if r < 0 then
      if FSearchList.Count = 1 then r:=0;
     if r >= 0 then FillKinoItem(CItem, FSearchList[r]);
    end;
   Application.ProcessMessages;
   if Application.Terminated then Break;
  end;
 ButtonFlatKSearchCloseClick(nil);
end;

procedure TFormMain.ButtonFlat2Click(Sender: TObject);
begin
 if PanelMenu.Width > 46 then PanelMenu.Width:=46
 else PanelMenu.Width:=200;
 UpdateMenu;
end;

procedure TFormMain.ButtonFlat4Click(Sender: TObject);
begin
 ComboBoxFilterYear.ItemIndex:=-1;
 ComboBoxFilterGenre.Text:='';
 ComboBoxFilterRating.ItemIndex:=0;
 FKinoList.FilterGenre:='';
 FKinoList.FilterYear:=-1;
 FKinoList.FilterRating:=-1;
 UpdateFilterNotify;
 PanelFilter.Hide;
end;

procedure TFormMain.ButtonFlat5Click(Sender: TObject);
begin
 if FileOpenDialogXLS.Execute then
  begin
   try
    StringGridXL.Enabled:=False;
    ButtonFlatImport.Enabled:=False;
    LoadFile(FileOpenDialogXLS.FileName);
   finally
    StringGridXL.Enabled:=True;
    ButtonFlatImport.Enabled:=True;
   end;
  end;
end;

procedure TFormMain.ButtonFlat6Click(Sender: TObject);
var R:Integer;
var Item:TKinoItem;
begin
 if StringGridXL.RowCount <= 0 then Exit;
 if not AskYesNo('Ответь', 'Добавить записи из этого списка в базу?') then Exit;

 for R:= 0 to StringGridXL.RowCount-1 do
  begin
   Item:=TKinoItem.Create;
   try
    Item.Caption:=StringGridXL.Cells[0, R];
    if StringGridXL.Cells[1, R] <> '' then
     Item.Year:=StrToInt(StringGridXL.Cells[1, R])
    else Item.Year:=0;
    Item.Genre:=StringGridXL.Cells[2, R];
    if StringGridXL.Cells[3, R] <> '' then
     Item.Rating:=StrToInt(StringGridXL.Cells[3, R])
    else Item.Rating:=0;
    try
     Item.Date:=StrToDateTime(StringGridXL.Cells[4, R]);
    except
     Item.Date:=Now;
    end;
    Item.Viewed:=True;
    Item.KPMarked:=True;
    FormMain.KinoList.Add(Item);
   except
    Item.Free;
   end;
  end;
 FormMain.KinoList.Save;
end;

{
<div class="element most_wanted">
  <div class="right">
      <div class="rating  ratingGreenBG" title="7.090 (4&nbsp;335)">7.1</div>
      <ul class="links">
         <li><a href="/film/vo-vlasti-stikhii-2018-1015040/cast/#actor" data-url="/film/vo-vlasti-stikhii-2018-1015040/cast/#actor" class="js-serp-metrika" data-id="1015040" data-type="film">актеры</a><s></s></li>
         <li><a href="/film/vo-vlasti-stikhii-2018-1015040/video/" data-url="/film/vo-vlasti-stikhii-2018-1015040/video/" class="js-serp-metrika" data-id="1015040" data-type="film" data-popup-info="disabled">трейлеры</a><s></s></li>
         <li><a href="/film/vo-vlasti-stikhii-2018-1015040/stills/" data-url="/film/vo-vlasti-stikhii-2018-1015040/stills/" class="js-serp-metrika" data-id="1015040" data-type="film" data-popup-info="disabled">кадры</a><s></s></li>
         <li><a href="/film/vo-vlasti-stikhii-2018-1015040/posters/" data-url="/film/vo-vlasti-stikhii-2018-1015040/posters/" class="js-serp-metrika" data-id="1015040" data-type="film">постеры</a><s></s></li>
         <li><a href="/film/vo-vlasti-stikhii-2018-1015040/afisha/city/1/" data-url="/film/vo-vlasti-stikhii-2018-1015040/afisha/city/1/" class="js-serp-metrika" data-id="1015040" data-type="film">сеансы</a><s></s></li>
         <li class="inactive">сайты<s></s></li>
         <li class="inactive">DVD<s></s></li>
      </ul>
  </div>
  <p class="pic"><a href="/film/vo-vlasti-stikhii-2018-1015040/sr/1/" class="js-serp-metrika" data-url="/film/vo-vlasti-stikhii-2018-1015040/" data-id="1015040" data-type="film"><img class="" src="https://st.kp.yandex.net/images/sm_film/1015040.jpg" title="" alt="Во власти стихии" id="FlappImg_0" style="opacity: 1;"></a></p>
  <div class="info">
     <p class="name"><a href="/film/vo-vlasti-stikhii-2018-1015040/sr/1/" class="js-serp-metrika" data-url="/film/vo-vlasti-stikhii-2018-1015040/" data-id="1015040" data-type="film" data-popup-info="disabled">Во власти стихии</a> <span class="year">2018</span></p>
     <span class="gray">Adrift, 96 мин</span>
     <span class="gray">США... <i class="director">реж. <a class="lined js-serp-metrika" href="/name/19908/" data-url="/name/19908/" data-id="1015040" data-type="film" data-popup-info="enabled">Бальтасар Кормакур</a></i>
     	<br>(боевик, триллер, драма...)
     </span>
     <span class="gray">
      <a class="lined js-serp-metrika" href="/name/1004809/" data-url="/name/1004809/" data-id="1015040" data-type="film">Шейлин Вудли</a>, <a class="lined js-serp-metrika" href="/name/1829631/" data-url="/name/1829631/" data-id="1015040" data-type="film">Сэм Клафлин</a>, <a class="lined js-serp-metrika" href="/film/vo-vlasti-stikhii-2018-1015040/cast/#actor" data-url="/film/vo-vlasti-stikhii-2018-1015040/cast/#actor" data-id="1015040" data-type="film">...</a>
     </span>
  </div>
  <div class="clear"></div>
</div>
}

{
<div id="photoInfoTable" class="clearfix">
    <div id="headerFilm" class="feature_film_header feature_film_header_603111 country_num3">
        <h1 class="moviename-big" itemprop="name">Нечувствительный</h1>
        <span itemprop="alternativeHeadline">Insensibles</span>
        <div class="movieFlags"><div class="flag flag15" title="Испания"><a href="/lists/m_act%5Bcountry%5D/15/"></a></div><div class="flag flag8" title="Франция"><a href="/lists/m_act%5Bcountry%5D/8/"></a></div><div class="flag flag36" title="Португалия"><a href="/lists/m_act%5Bcountry%5D/36/"></a></div></div>
    </div>
    <div id="photoBlock" class="originalPoster">
        <div class="film-img-box feature_film_img_box feature_film_img_box_603111">

            <a class="addFolder" title="Буду смотреть" href="#"></a>


                <span class="left_bg"></span>
                <span class="bottom_bg"></span>
                <a class="popupBigImage" href="#" onclick="openImgPopup('/images/film_big/603111.jpg'); return false">
                    <img width="205" src="https://st.kp.yandex.net/images/film_iphone/iphone360_603111.jpg" alt="Нечувствительный (Insensibles)" itemprop="image">
                </a>

        </div>


    <div itemscope="" itemtype="http://schema.org/VideoObject">
<meta itemprop="name" content="Нечувствительный">
<meta itemprop="thumbnail" content="http://avatars.mds.yandex.net/get-ott/223007/2a0000016235c4cd1cca9f1eb642b67519f8/orig">
<link itemprop="thumbnailUrl" href="http://avatars.mds.yandex.net/get-ott/223007/2a0000016235c4cd1cca9f1eb642b67519f8/orig">
<link itemprop="url" href="https://frontend.vh.yandex.ru/player/759006820312088963">
<link itemprop="embedUrl" href="https://frontend.vh.yandex.ru/player/759006820312088963">
<meta itemprop="duration" content="01:41:06">
<meta itemprop="isFamilyFriendly" content="false">
<meta itemprop="description" content="The truth is painful">
<meta itemprop="uploadDate" content="1970-01-18T18:03:21+0300">

        <meta itemprop="videoQuality" content="HD">
</div>

        <div class="movie-buttons-container">

                <div class="js-ott-widget online_button_film" data-from="kp" data-kp-film-id="603111" data-title="Нечувствительный" style="display: block;" data-film-id="4b2d5d2776e5a34191b8ca6a394a4db2" data-element-inited="true">
                    <button class="js-ott-widget__button movie-online-button feature_online_button_film feature_online_button_film_603111 js-ott-widget__button_orange" data-from="kp" data-kp-film-id="603111" data-title="Нечувствительный" style="background-image: url(&quot;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='18' height='18' viewBox='0 0 18 18'%3E %3Cg fill='none' fill-rule='evenodd'%3E %3Cpath d='M0 0h18v18H0z'/%3E %3Cpath fill='%23FFF' d='M5 2v14l12-7z'/%3E %3C/g%3E %3C/svg%3E&quot;); background-repeat: no-repeat; background-position: 10px 50%;">Смотреть</button>
                    <div class="js-ott-widget__subscribe movie-online-plus" style="display: block;">
                        <div class="movie-online-plus__text">
                            <div class="movie-online-plus__badge"></div><span class="movie-online-plus__ad-free">По подписке</span>
                        </div>
                    </div>
                </div>
        </div>

    </div>
    <div data-metrika="film_info" id="infoTable" class="js-rum-hero">
    <table class="info">
        <tbody><tr>
            <td class="type">год</td>
            <td><div style="position: relative">
                <a href="/lists/m_act%5Byear%5D/2012/" title="">2012</a>

            </div></td>
        </tr>
        <tr>
            <td class="type">страна</td>
            <td><div style="position: relative">
                <a href="/lists/m_act%5Bcountry%5D/15/">Испания</a>, <a href="/lists/m_act%5Bcountry%5D/8/">Франция</a>, <a href="/lists/m_act%5Bcountry%5D/36/">Португалия</a>
            </div></td>
        </tr>
        <tr><td class="type">слоган</td><td style="color: #555">«The truth is painful»</td></tr>
        <tr><td class="type">режиссер</td><td itemprop="director"><a href="/name/953650/">Хуан Карлос Медина</a></td></tr>
        <tr><td class="type">сценарий</td><td><a href="/name/774034/">Луисо Бердехо</a>, <a href="/name/953650/">Хуан Карлос Медина</a></td></tr>
        <tr><td class="type">продюсер</td><td itemprop="producer"><a href="/name/1309500/">Адольфо Бланко</a>, <a href="/name/389953/">Франсуа Коньяр</a>, <a href="/name/485074/">Антуан Симкине</a>, <a href="/film/603111/cast/#producer">...</a></td></tr>

        <tr><td class="type">оператор</td><td><a href="/name/742064/">Алехандро Мартинес</a></td></tr>
        <tr><td class="type">композитор</td><td itemprop="musicBy"><a href="/name/497704/">Юхан Сёдерквист</a></td></tr>
        <tr><td class="type">художник</td><td><a href="/name/2004991/">Иниго Наварро</a>, <a href="/name/2041271/">Ромина Хауссман</a>, <a href="/name/1988520/">Ариадна Папио</a></td></tr>
        <tr><td class="type">монтаж</td><td><a href="/name/1070840/">Педро Рибейро</a></td></tr>
        <tr><td class="type">жанр</td><td>
            <span itemprop="genre"><a href="/lists/m_act%5Bgenre%5D/1/">ужасы</a>, <a href="/lists/m_act%5Bgenre%5D/5/">фэнтези</a>, <a href="/lists/m_act%5Bgenre%5D/4/">триллер</a>, <a href="/lists/m_act%5Bgenre%5D/17/">детектив</a></span>, <a href="/film/603111/keywords/">...</a>
            <a class="wordLinks" href="/film/603111/keywords/">слова</a>
        </td></tr>

            <tr class="en">
                <td class="type">бюджет</td>
                <td class="euro"><div style="position: relative">
                    €3&nbsp;520&nbsp;000
                </div></td>
            </tr>
            <tr>
                <td class="type">зрители</td>
                <td><div style="position: relative"><div style="margin-left: -20px">
                    <img src="https://st.kp.yandex.net/images/flags/flag-8.gif" width="16" height="11" alt="Франция" title="Франция">&nbsp;&nbsp;7.3 тыс.,&nbsp;&nbsp;&nbsp;&nbsp;<img src="https://st.kp.yandex.net/images/flags/flag-7.gif" width="16" height="11" alt="Финляндия" title="Финляндия">&nbsp;&nbsp;4.7 тыс.,&nbsp;&nbsp;&nbsp;&nbsp;<img src="https://st.kp.yandex.net/images/flags/flag-15.gif" width="16" height="11" alt="Испания" title="Испания">&nbsp;&nbsp;4.2 тыс., <a href="/film/603111/dates/">...</a>
                </div></div></td>
            </tr>
            <tr>
                <td id="div_world_prem_td1" class="type">премьера (мир)</td>
                <td id="div_world_prem_td2" class="calendar" style="cursor: pointer">
                    <div style="position: relative" title="Дополнительная информация">
                        <div class="prem_ical" title="Добавить в календарь" data-ical-type="world" data-ical-date="8 сентября 2012" data-date-premier-start-link="20120908" data-date-premier-stop-link="20120909" data-ical-rerelease=""><!-- //--></div>
                        <a href="/film/603111/dates/" title="">8 сентября 2012</a>, <a href="/film/603111/dates/" title="">...</a>
                        <meta itemprop="dateCreated" content="2012-09-08">
                        <s class="popup_help_icon" title="Дополнительная информация"></s>
                    </div>
                </td>
            </tr>
            <tr class="ratePopup" onmouseover="$('.ratePopup').addClass('ratePopupAct')" onmouseout="$('.ratePopup').removeClass('ratePopupAct')">
                <td class="type">возраст</td>
                <td style="color: #555">
                    <div class="ageLimit age18"></div>
                    <span style="margin-left: 3px">зрителям, достигшим 18 лет</span>
                </td>
            </tr>
        <tr><td class="type">время</td><td class="time" id="runtime">101 мин. <span style="color: #999">/</span> 01:41</td></tr>
    </tbody></table>
  </div>
    <div id="actorList" class="clearfix">

            <h4>В главных ролях:</h4>
            <ul><li itemprop="actors"><a href="/name/247531/">Алекс Брендемюль</a></li><li itemprop="actors"><a href="/name/230758/">Томас Лемаркус</a></li><li itemprop="actors"><a href="/name/2548256/" data-popup-info="enabled">Илиас Стотхарт</a></li><li itemprop="actors"><a href="/name/2548255/">Мот Харрис Данлоп Стотхарт</a></li><li itemprop="actors"><a href="/name/4929/">Дерек де Линт</a></li><li itemprop="actors"><a href="/name/388789/">Рамон Фонтсере</a></li><li itemprop="actors"><a href="/name/449037/">Сильвия Бель</a></li><li itemprop="actors"><a href="/name/446682/">Беа Сегура</a></li><li itemprop="actors"><a href="/name/17008/">Хуан Диего</a></li><li itemprop="actors"><a href="/name/439185/">Феликс Гомес</a></li><li itemprop="actors"><a href="/film/603111/cast/">...</a></li></ul>
        <h4><a href="/film/603111/cast/">показать всех</a> »</h4>
    </div>
</div>
}

function TFormMain.WebSearch(const Index:Integer):Integer;
var RequestURL, tmp, tmp2:string;
    HTTPObject:TIdHTTP;
    HTTPStream:TStringStream;
    IdSSLIOHandlerSocketOpenSSL:TIdSSLIOHandlerSocketOpenSSL;
    PageData:TStringList;
    i, p:Integer;
    Data:TKinoElement;
    Text:string;

function GetElementData(Src:string):TKinoElement;
var tempStr1:string;
    Ofs:Integer;
begin
 Result.Name:='';
 if Src = '' then Exit;
 Result.Rating:=GetHTMLTag(Src, 'div', 'right');
 Src:=GetHTMLTag(Src, 'div', 'info');
 tempStr1:=Src;
 Src:=GetHTMLTag(Src, 'p', 'name');
 Ofs:=1;
 Result.Name:=HTMLTextToString(GetHTMLTag(Src, 'a', '', False, Ofs));
 Result.KID:=GetTagPropValue(Src, 'data-id');
 Result.Year:=Copy(HTMLTextToString(GetHTMLTag(Src, 'span', '', False, Ofs)), 1, 4);
 Ofs:=1;
 Result.Adv:=HTMLTextToString(GetHTMLTag(tempStr1, 'span', 'gray', False, Ofs));
 Result.Genre:=HTMLTextToString(GetHTMLTag(tempStr1, 'span', 'gray', False, Ofs));
 Ofs:=Pos('/>(', Result.Genre)+3;
 Result.Genre:=StringReplace(Copy(Result.Genre, Ofs, Result.Genre.Length-Ofs), '...', '', [rfReplaceAll]);

 Result.Rating:=HTMLTextToString(GetHTMLTag(Result.Rating, 'div', ''));
end;

function GetPageData(Src:string):TKinoElement;
var tmp1:string;
    p1:Integer;
begin
 Result.Name:='';
 if Src = '' then Exit;
 Result.Name:=HTMLTextToString(ClearHTMLTags(GetHTMLTag(Src, 'h1', '')));
 Result.Adv:=HTMLTextToString(ClearHTMLTags(GetHTMLTag(Src, 'span', '')));
 tmp1:=GetHTMLTag(Src, 'table', 'info');
 p1:=1;
 Result.Year:=Copy(HTMLTextToString(GetHTMLTag(tmp1, 'a', '', False, p1)), 1, 4);
 Result.Genre:=HTMLTextToString(ClearHTMLTags(GetHTMLTag(tmp1, 'span', '<span itemprop="genre">', True, p1)));
 tmp1:=GetHTMLTag(Src, 'div', 'movie-buttons-container');
 Result.KID:=GetTagPropValue(tmp1, 'data-kp-film-id');
end;

begin
 Result:=-1;
 Text:=FKinoList[Index].Caption;
 RequestURL:=TIdURI.URLEncode(Format(BaseURL, [Text]));
 RequestURL:=TIdURI.PathEncode(Format(BaseURL, [Text]));
 HTTPObject:=TIdHTTP.Create(nil);
 IdSSLIOHandlerSocketOpenSSL:=TIdSSLIOHandlerSocketOpenSSL.Create(nil);
 HTTPObject.IOHandler:=IdSSLIOHandlerSocketOpenSSL;
 HTTPObject.HandleRedirects:=True;
 HTTPStream:=TStringStream.Create;
 PageData:=TStringList.Create;
 FSearchList.Clear;
 try
  HTTPObject.Get(RequestURL, HTTPStream);
  HTTPStream.Position:=0;
  PageData.LoadFromStream(HTTPStream);
  //PageData.Text:=Memo1.Text;
  p:=1;
  Data:=GetElementData(GetHTMLTag(PageData.Text, 'div', 'element most_wanted', False, p));
  if Data.Name <> '' then FSearchList.Add(Data);

  p:=1;
  GetHTMLTag(PageData.Text, 'div', 'search_results', False, p);
  tmp:=GetHTMLTag(PageData.Text, 'div', '', False, p);
  p:=1;
  repeat
   Data:=GetElementData(GetHTMLTag(tmp, 'div', 'element', False, p));
   if Data.Name <> '' then FSearchList.Add(Data);
  until (Data.Name = '');
  if FSearchList.Count <= 0 then
   begin
    p:=1;
    Data:=GetPageData(GetHTMLTag(PageData.Text, 'div', '<div id="photoInfoTable" class="clearfix">', True, p));
    if Data.Name <> '' then FSearchList.Add(Data);
   end;
 except

 end;
 PageData.Free;
 IdSSLIOHandlerSocketOpenSSL.Free;
 HTTPObject.Free;
 HTTPStream.Free;
 LabelKSearch.Caption:='Результаты поиска';
 Result:=FSearchList.Count;
end;


procedure TFormMain.ButtonFlatKSearchClick(Sender: TObject);
begin
 FSearchID:=TableExList.ItemIndex;
 if not IndexInList(FSearchID, FKinoList.Count) then Exit;
 LabelKSearch.Caption:='Подождите, идёт поиск...';
 FSearchList.Clear;
 PanelKSearch.Show;
 PanelKSearch.BringToFront;
 PanelKSearch.SetFocus;
 Application.ProcessMessages;
 WebSearch(FSearchID);
end;

procedure TFormMain.LoadFile(FileName: string);
var Excel, Sheet: Variant;
    R, C, W, MaxWidth:Integer;

function ReadCellStr(aR, aC:Integer):string;
begin
 Result:=Trim(Sheet.Cells[aR, aC]);
 if Result <> '' then
  Result[1]:=AnsiUpperCase(Result[1])[1];
end;

procedure GridClear(SG:TStringGrid);
var i:Integer;
begin
 if SG.RowCount > 0 then
  begin
   for i:= 0 to SG.RowCount - 1 do SG.Rows[i].Clear;
   SG.RowCount:=0;
  end;
end;

begin
 GridClear(StringGridXL);
 Excel:=CreateOleObject('Excel.Application');
 try
  Excel.Application.ScreenUpdating:=False;
  Excel.Application.EnableEvents:=False;
  Excel.Application.Interactive:=True;
  Excel.Application.DisplayAlerts:=False;
  Excel.Application.DisplayStatusBar:=True;
  Excel.Visible:=False;
  Excel.Workbooks.Open(FileName, False, False);
  Excel.Sheets[1].Select;
  Excel.Sheets[1].Cells.SpecialCells($0000000B, EmptyParam).Activate;

  Sheet:=Excel.Workbooks[1].WorkSheets[1];
  StringGridXL.RowCount:=Excel.ActiveCell.Row;
  StringGridXL.ColCount:=5;
  for R:= 1 to StringGridXL.RowCount do
   begin
    for C:= 1 to StringGridXL.ColCount do
     begin
      StringGridXL.Cells[C-1, R-1]:=ReadCellStr(R, C);
      W:=StringGridXL.Canvas.TextWidth(StringGridXL.Cells[C-1, R-1]);
      if W > StringGridXL.ColWidths[C-1] then StringGridXL.ColWidths[C-1]:=W+10;
     end;
    Application.ProcessMessages;
   end;
 finally
  Excel.Application.ScreenUpdating:=True;
  Excel.Application.EnableEvents:=True;
  Excel.Application.Interactive:=True;
  Excel.Application.DisplayAlerts:=True;
  {Закрываем процесс Excel}
  Excel.Quit;
  Excel:=UnAssigned;
 end;
end;


procedure TFormMain.ButtonFlatImportClick(Sender: TObject);
begin
 PanelImport.BringToFront;
end;

procedure TFormMain.ButtonFlatKSearchCloseClick(Sender: TObject);
begin
 PanelKSearch.Hide;
end;

procedure TFormMain.FilmAdd;
var Item:TKinoItem;
begin
 ButtonFlatHideStatClick(nil);
 Item:=TKinoItem.Create;
 FKinoList.Insert(0, Item);
 TableExList.ItemIndex:=0;
 TableExList.Edit(0, 1);
 ButtonFlatSave.NotifyVisible:=True;
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
var Str:string;
begin
 ButtonFlatHideStatClick(nil);
 if not IndexInList(TableExList.ItemIndex, FKinoList.Count) then
  begin                                           //https://www.google.ru/search?q=vvvv
   if AskYesNo('Вопрос', 'Элемент не выбран. Открыть просто сайт Google?') then
    ShellExecute(Application.Handle, 'open', PChar('https://www.google.ru'), nil, nil, SW_NORMAL);
   Exit;
  end;
 Str:=FKinoList[TableExList.ItemIndex].Caption;
 ShellExecute(Application.Handle, 'open', PChar('https://www.google.ru/search?q='+Str), nil, nil, SW_NORMAL);
end;

procedure TFormMain.ComboBoxFilterGenreChange(Sender: TObject);
begin
 FKinoList.FilterGenre:=ComboBoxFilterGenre.Text;
 UpdateFilterNotify;
end;

procedure TFormMain.ComboBoxFilterRatingChange(Sender: TObject);
begin
 case ComboBoxFilterRating.ItemIndex of
  0:FKinoList.FilterRating:=-1;
  1:FKinoList.FilterRating:=0;
  2..11:FKinoList.FilterRating:=ComboBoxFilterRating.ItemIndex - 1;
 end;
 UpdateFilterNotify;
end;

procedure TFormMain.ComboBoxFilterYearChange(Sender: TObject);
var Year:Integer;
begin
 if TryStrToInt(ComboBoxFilterYear.Text, Year) then
  begin
   FKinoList.FilterYear:=Year;
  end
 else
  begin
   ComboBoxFilterYear.Text:='';
   FKinoList.FilterYear:=-1;
  end;
 UpdateFilterNotify;
end;

procedure TFormMain.DrawPanel1Paint(Sender: TObject);
const SplitW = 5;
var Direct2D:TDirect2DCanvas;
    i:Integer;
    MaxV:Word;
    ItemRect:TRect;
    ItemW:Integer;
    FieldH:Integer;
    Str:string;
    RectText:TRect;
begin
 MaxV:=1;
 FieldH:=DrawPanel1.ClientHeight - 40;
 for i:= 1 to 10 do if FStat.FRatingFilms[i] > MaxV then MaxV:=FStat.FRatingFilms[i];
 ItemW:=Round(((DrawPanel1.ClientWidth - (SplitW * 10)) / 10));
 Direct2D:=TDirect2DCanvas.Create(DrawPanel1.Canvas, DrawPanel1.ClientRect);
 with Direct2D do
  begin
   try
    BeginDraw;
    Brush.Color:=FMainColor;
    FillRect(DrawPanel1.ClientRect);
    Brush.Color:=ColorLighter(FMainColor);
    Pen.Color:=FMainColor;
    Font.Size:=12;
    for i:= 1 to 10 do
     begin
      ItemRect.Left:=SplitW + (i-1) * (ItemW + SplitW);                   //x = 100%
      ItemRect.Right:=ItemRect.Left + ItemW - SplitW;                   // 1 = x/100 %
      ItemRect.Bottom:=DrawPanel1.ClientHeight - 20;// GItems[i] / (MaxV / 100)
      ItemRect.Top:=DrawPanel1.ClientHeight - Round(FieldH * (((100 / MaxV) * FStat.FRatingFilms[i]) / 100)) - 20;
      Brush.Style:=bsSolid;
      Rectangle(ItemRect);
      Brush.Style:=bsClear;

      Font.Color:=ColorLighter(FMainColor);
      Str:=IntToStr(i);
      RectText:=Rect(ItemRect.Left, ItemRect.Bottom, ItemRect.Right, ItemRect.Bottom+20);
      RectText.Offset(0, 2);
      TextRect(RectText, Str, [tfCenter, tfSingleLine, tfVerticalCenter]);

      Font.Color:=clWhite;
      Str:=IntToStr(FStat.FRatingFilms[i]);
      RectText:=Rect(ItemRect.Left, ItemRect.Top-20, ItemRect.Right, ItemRect.Top);
      TextRect(RectText, Str, [tfCenter, tfSingleLine, tfVerticalCenter]);
     end;
    Pen.Color:=ColorLighter(FMainColor);
    MoveTo(0, DrawPanel1.ClientHeight-20);
    LineTo(DrawPanel1.ClientWidth, DrawPanel1.ClientHeight-20);
   finally
    EndDraw;
    Free;
   end;
  end;
end;

procedure TFormMain.EditSearchKeyPress(Sender: TObject; var Key: Char);
begin
 if Key = #13 then
  begin
   Key:=#0;
   ButtonSearchClick(Sender);
  end;
end;

procedure TFormMain.SetMenuIconColor(Color:TColor);
var i:Integer;
begin
 for i:= 0 to ImageListButtons.Count - 1 do ColorImages(ImageListButtons, i, Color);
 ColorImages(ImageListKType, 4, Color);
 ColorImages(ImageListKType, 5, Color);
 ColorImages(ImageListKType, 6, Color);
 ColorImages(ImageListKType, 7, Color);
end;

type
 TColorControl = class(TWinControl)
  public
   property Color;
 end;

procedure TFormMain.SetMenuColor(Value:TColor);
type TControls = TList<TWinControl>;
var i, c:Integer;
    Group1:TControls; //
    Group2:TControls; // Заголовки с элементами управления
begin
 Group1:=TControls.Create;
 Group2:=TControls.Create;

 Group1.Add(PanelMenu);
 Group1.Add(PanelFilter);
 Group1.Add(PanelList);

 Group2.Add(PanelStatTop);
 Group2.Add(PanelImportTop);
 Group2.Add(PanelKSearchTop);
 Group2.Add(PanelImportCtrl);

 for c:= 0 to Group1.Count-1 do
  with TColorControl(Group1[c]) do
   begin
    Color:=Value;
    ParentBackground:=False;
    ParentColor:=False;
    for i:=0 to ControlCount - 1 do
     begin
      if Controls[i] is TShape then
       begin
        (Controls[i] as TShape).Brush.Color:=ColorLighter(Value, 10);
        (Controls[i] as TShape).Pen.Color:=ColorLighter(Value, 10);
        (Controls[i] as TShape).Height:=1;
       end;
      if Controls[i] is TButtonFlat then
       begin
        (Controls[i] as TButtonFlat).ColorNormal:=Value;
        (Controls[i] as TButtonFlat).ColorOver:=ColorDarker(Value, 15);
        (Controls[i] as TButtonFlat).ColorPressed:=ColorLighter(Value, 15);
      end;
       if Controls[i] is TLabel then
       begin
        (Controls[i] as TLabel).Font.Color:=ColorDarker(clWhite, 10);
       end;
     end;
   end;
 for c:= 0 to Group2.Count-1 do
  with TColorControl(Group2[c]) do
   begin
    Color:=Value;
    ParentBackground:=False;
    ParentColor:=False;
    for i:= 0 to ControlCount - 1 do
     begin
      if Controls[i] is TLabel then
       begin
        (Controls[i] as TLabel).Font.Color:=ColorDarker(clWhite, 10);
       end;
      if Controls[i] is TButtonFlat then
       begin
        (Controls[i] as TButtonFlat).ColorNormal:=Value;
        (Controls[i] as TButtonFlat).ColorOver:=ColorDarker(Value, 15);
        (Controls[i] as TButtonFlat).ColorPressed:=ColorLighter(Value, 15);
       end;
     end;
   end;
 with ScrollBox1 do
  begin
   Color:=Value;
   ParentBackground:=False;
   ParentColor:=False;
   for i:= 0 to ControlCount - 1 do
    begin
     if Controls[i] is TTableEx then
      begin
       (Controls[i] as TTableEx).Font.Color:=ColorDarker(clWhite, 10);
       (Controls[i] as TTableEx).FontHotLine.Color:=ColorDarker(clWhite, 10);
       (Controls[i] as TTableEx).FontLine.Color:=ColorDarker(clWhite, 10);
       (Controls[i] as TTableEx).FontSelLine.Color:=ColorDarker(clWhite, 10);
       (Controls[i] as TTableEx).Color:=Value;
       (Controls[i] as TTableEx).LineColor:=Value;
       (Controls[i] as TTableEx).LineColorXor:=Value;
       (Controls[i] as TTableEx).LineHotColor:=Value;
       (Controls[i] as TTableEx).LineSelColor:=Value;
      end;
     if Controls[i] is TLabel then
      begin
       (Controls[i] as TLabel).Font.Color:=ColorDarker(clWhite, 10);
      end;
     if Controls[i] is TButtonFlat then
      begin
       (Controls[i] as TButtonFlat).ColorNormal:=Value;
       (Controls[i] as TButtonFlat).ColorOver:=ColorDarker(Value, 15);
       (Controls[i] as TButtonFlat).ColorPressed:=ColorLighter(Value, 15);
      end;
    end;
  end;

 ShapeSplit.Brush.Color:=ColorLighter(Value, 10);
 ShapeSplit.Pen.Color:=ColorLighter(Value, 10);
 ShapeSplit.Width:=1;

 ShapeSplitTop.Brush.Color:=ColorDarker(PanelHead.Color, 10);
 ShapeSplitTop.Pen.Color:=ColorDarker(PanelHead.Color, 10);
 ShapeSplitTop.Height:=1;
end;

procedure TFormMain.SetInterface;
begin
 FMainColor:=$009A572B;
 SetMenuColor(FMainColor);
 SetMenuIconColor(ColorLighter(FMainColor, 60));
 PanelList.BringToFront;
end;

procedure TFormMain.FormCreate(Sender: TObject);
begin
 FSaveNotify:=False;
 SetInterface;
 FSettings:=TSettingsIni.Create(ExtractFilePath(ParamStr(0))+'\config.ini');
 with TableExList do
  begin
   AddColumn('', 32);
   AddColumn('Заголовок', FSettings.GetInt('Columns', 'Caption', 200));
   AddColumn('Тип', FSettings.GetInt('Columns', 'Type', 100));
   AddColumn('Год', FSettings.GetInt('Columns', 'Year', 60));
   AddColumn('Жанр', FSettings.GetInt('Columns', 'Genre', 100));
   AddColumn('Оценка', FSettings.GetInt('Columns', 'Rating', 90));
   AddColumn('Оценка 2', FSettings.GetInt('Columns', 'Rating2', 90));
   Columns[AddColumn('', FSettings.GetInt('Columns', 'State', 36), True)].ShowButtonOnlySelect:=False;
   Columns[AddColumn('', FSettings.GetInt('Columns', 'Kinopoisk', 36), True)].ShowButtonOnlySelect:=False;
   AddColumn('Информация', FSettings.GetInt('Columns', 'Info', 150));
   AddColumn('Дата добавления', FSettings.GetInt('Columns', 'Date', 120));
   AddColumn('', 10);
  end;
 FSettings.GetParamWindow('General', FormMain, [wpsAll]);
 FKinoList:=TKinoItems.Create(TableExList, ExtractFilePath(ParamStr(0))+'data.db');
 try
  LoadList;
 except

 end;
 FStat:=TKinoStatistics.Create(TableExStat);
 with TableExStat do
  begin
   AddColumn('Параметр', 250);
   AddColumn('Значение', 100);
  end;
 FStat.UpdateStat(FKinoList);
 FSearchList:=TKinoElements.Create(TableExKinoSearch);
 with TableExKinoSearch do
  begin
   AddColumn('Заголовок', 250);
   AddColumn('Год', 100);
   AddColumn('Рейтинг', 50);
   AddColumn('Жанр', 200);
   AddColumn('Информация', 220);
  end;
 FSearchList.UpdateTable;
 PanelMenu.Width:=46;
 UpdateMenu;
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

procedure TFormMain.LoadList;
var Items:TStringList;
begin
 FKinoList.Load;
 Items:=TStringList.Create;
 FKinoList.GetGenres(Items);
 ComboBoxFilterGenre.Items.Assign(Items);

 FKinoList.GetYears(Items);
 ComboBoxFilterYear.Items.Assign(Items);

 Items.Free;
end;

procedure TFormMain.MenuItemSetKIDClick(Sender: TObject);
var Num:string;
    NInt:Integer;
begin
 if not IndexInList(TableExList.ItemIndex, FKinoList.Count) then Exit;
 Num:='';
 if InputQuery('Номер фильма на Кинопоиске', 'Укажите номер фильма, например "418903"', Num) then
  if TryStrToInt(Num, NInt) then
   begin
    FKinoList[TableExList.ItemIndex].KID:=NInt;
    FKinoList.UpdateRecord(TableExList.ItemIndex);
    TableExList.Repaint;
   end
  else
   MessageBox(Application.Handle, 'Необходимо указать номер фильма.', '', MB_ICONWARNING or MB_OK);
end;

procedure TFormMain.PanelKSearchExit(Sender: TObject);
begin
 PanelKSearch.Hide;
end;

procedure TFormMain.SaveList;
begin
 FKinoList.Save;
 ButtonFlatStatUpdateClick(nil);
 ButtonFlatSave.NotifyVisible:=False;
end;

procedure TFormMain.ButtonSearchClick(Sender: TObject);
begin
 ButtonFlatSearchClear.Visible:=EditSearch.Text <> '';
 if EditSearch.Text = '' then Exit;
 TableExList.ItemIndex:=FKinoList.Search(EditSearch.Text, TableExList.ItemIndex+1);
 EditSearch.SetFocus;
end;

procedure TFormMain.TableExKinoSearchEdit(Sender: TObject; var Data: TTableEditStruct; ACol, ARow: Integer; var Allow: Boolean);
//var Year:Integer;
begin
 Allow:=False;
 if not IndexInList(ARow, FSearchList.Count) then Exit;
 if not IndexInList(FSearchID, FKinoList.Count) then Exit;
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
   ButtonFlatSave.NotifyVisible:=True;
   ButtonFlatKSearchCloseClick(nil);
  end;
end;

procedure TFormMain.TableExKinoSearchGetData(FCol, FRow: Integer; var Value: string);
begin
 Value:='';
 if not IndexInList(FRow, FSearchList.Count) then Exit;
 case FCol of
  0:Value:=FSearchList[FRow].Name;
  1:Value:=FSearchList[FRow].Year;
  2:Value:=FSearchList[FRow].Rating;
  3:Value:=FSearchList[FRow].Genre;
  4:Value:=FSearchList[FRow].Adv;
 end;
end;

procedure TFormMain.TableExListColumnClick(Sender: TObject; MouseButton: TMouseButton; const Index: Integer);
var Clm:string;
begin
 case Index of
  1:Clm:=fnCaption;
  2:Clm:=fnType;
  3:Clm:=fnYear;
  4:Clm:=fnGenre;
  5:Clm:=fnRating;
  6:Clm:=fnRating2;
  7:Clm:=fnViewed;
  8:Clm:=fnKPMarked;
  9:Clm:=fnInfo;
  10:Clm:=fnDate;
 else Exit;
 end;
 if FKinoList.OrderBy = Clm then FKinoList.OrderDesc:=not FKinoList.OrderDesc else
  begin
   FKinoList.OrderDesc:=False;
   FKinoList.OrderBy:=Clm;
  end;
 LoadList;
end;

procedure TFormMain.TableExListDrawCellData(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
 if not IndexInList(ARow, FKinoList.Count) then Exit;

 with TableExList.Canvas do
  begin
   case ACol of
    0: ImageListKType.Draw(TableExList.Canvas, Rect.Left, Rect.Top, Ord(FKinoList.Items[ARow].KinoType), True);
    7: if FKinoList.Items[ARow].Viewed then ImageListButtons.Draw(TableExList.Canvas, Rect.Left+(Rect.Width div 2 - 24 div 2), Rect.Top+(Rect.Height div 2 - 24 div 2), 18, True);
    8: if FKinoList.Items[ARow].KPMarked then ImageListButtons.Draw(TableExList.Canvas, Rect.Left+(Rect.Width div 2 - 24 div 2), Rect.Top+(Rect.Height div 2 - 24 div 2), 8, True);
    11:if FKinoList.Items[ARow].KID < 1 then
     begin
      ImageListButtons.Draw(TableExList.Canvas, Rect.Left+2, Rect.Top+(Rect.Height div 2 - 24 div 2), 19, True);
     end;
   end;
  end;
end;

function GetColumnId(ColumnName:string):Integer;
begin
 if ColumnName = fnCaption then Exit(1);
 if ColumnName = fnType then Exit(2);
 if ColumnName = fnYear then Exit(3);
 if ColumnName = fnGenre then Exit(4);
 if ColumnName = fnRating then Exit(5);
 if ColumnName = fnRating2 then Exit(6);
 if ColumnName = fnViewed then Exit(7);
 if ColumnName = fnKPMarked then Exit(8);
 if ColumnName = fnInfo then Exit(9);
 if ColumnName = fnDate then Exit(10);
 Result:=-1;
end;

procedure TFormMain.TableExListDrawColumnData(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
 with TableExList.Canvas do
  begin
   if ACol = GetColumnId(FKinoList.OrderBy) then
     begin
      Brush.Color:=ColorDarker(TableExList.ColumnsColor);
      Pen.Color:=Brush.Color;
      Pen.Width:=3;
      MoveTo(Rect.Left, Rect.Bottom-4);
      LineTo(Rect.Right, Rect.Bottom-4);
      //if FKinoList.OrderDesc then
      // ImageListKType.Draw(TableExList.Canvas, Rect.Right-32, Rect.Top+(Rect.Height div 2 - 32 div 2), 5, True)
      //else
      // ImageListKType.Draw(TableExList.Canvas, Rect.Right-32, Rect.Top+(Rect.Height div 2 - 32 div 2), 4, True);
     end;
   case ACol of
    7: ImageListButtons.Draw(TableExList.Canvas, Rect.Left+(Rect.Width div 2 - 24 div 2), Rect.Top+(Rect.Height div 2 - 24 div 2), 18, True);
    8: ImageListButtons.Draw(TableExList.Canvas, Rect.Left+(Rect.Width div 2 - 24 div 2), Rect.Top+(Rect.Height div 2 - 24 div 2), 8, True);
   else

   end;
  end;
end;

procedure TFormMain.TableExListEdit(Sender: TObject; var Data: TTableEditStruct; ACol, ARow: Integer; var Allow: Boolean);
begin
 Allow:=False;
 if not IndexInList(ARow, FKinoList.Count) then Exit;
 case ACol of
  1:
   begin
    Data.EditMode:=teText;
    Data.TextValue:=FKinoList.Items[ARow].Caption;
    Data.ReadOnly:=False;
    Allow:=True;
   end;
  2:
   begin
    Data.EditMode:=teList;
    Data.FixedList:=True;
    Data.Items:=TStringList.Create;
    Data.Items.Add(KinoTypeToStr(ktFilm));
    Data.Items.Add(KinoTypeToStr(ktSeries));
    Data.ItemValue:=Ord(FKinoList.Items[ARow].KinoType);
    Data.TextValue:=FKinoList.Items[ARow].StrKinoType;
    Data.ReadOnly:=False;
    Allow:=True;
   end;
  3:
   begin
    Data.EditMode:=teInt;
    Data.TextValue:=IntToStr(FKinoList.Items[ARow].Year);
    if Data.TextValue = '0' then Data.TextValue:='';
    Data.ReadOnly:=False;
    Allow:=True;
   end;
  4:
   begin
    Data.EditMode:=teList;
    Data.FixedList:=False;
    Data.ListDrop:=True;
    Data.Items:=TStringList.Create;
    FKinoList.GetGenres(Data.Items);
    Data.TextValue:=FKinoList.Items[ARow].Genre;
    Data.ReadOnly:=False;
    Allow:=True;
   end;
  5:
   begin
    Data.EditMode:=teFloat;
    Data.TextValue:=FloatToStr(FKinoList.Items[ARow].Rating);
    if Data.TextValue = '0' then Data.TextValue:='';
    Data.ReadOnly:=False;
    Allow:=True;
   end;
  6:
   begin
    Data.EditMode:=teFloat;
    Data.TextValue:=FloatToStr(FKinoList.Items[ARow].Rating2);
    if Data.TextValue = '0' then Data.TextValue:='';
    Data.ReadOnly:=False;
    Allow:=True;
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
    Data.EditMode:=teText;
    Data.TextValue:=FKinoList.Items[ARow].Info;
    Data.ReadOnly:=False;
    Allow:=True;
   end;
 end;
end;

procedure TFormMain.TableExListEditCancel(Sender: TObject; ACol, ARow: Integer);
begin
 if not IndexInList(ARow, FKinoList.Count) then Exit;
 if FKinoList.Items[ARow].Empty then FKinoList.Delete(ARow);
end;

procedure TFormMain.TableExListEditOk(Sender: TObject; Value: string; ItemValue, ACol, ARow: Integer);
begin
 if not IndexInList(ARow, FKinoList.Count) then Exit;
 case ACol of
  1: FKinoList.Items[ARow].Caption:=Value;
  2: FKinoList.Items[ARow].KinoType:=TKinoType(ItemValue);
  3: FKinoList.Items[ARow].Year:=StrToInt(Value);
  4: FKinoList.Items[ARow].Genre:=Value;
  5: FKinoList.Items[ARow].Rating:=StrToInt(Value);
  6: FKinoList.Items[ARow].Rating2:=StrToInt(Value);
  7: FKinoList.Items[ARow].Viewed:=Boolean(ItemValue);
  8: FKinoList.Items[ARow].KPMarked:=Boolean(ItemValue);
  9: FKinoList.Items[ARow].Info:=Value;
 end;
 FKinoList.UpdateRecord(ARow);
 ButtonFlatSave.NotifyVisible:=True;
end;

procedure TFormMain.TableExListGetData(FCol, FRow: Integer; var Value: string);
begin
 Value:='';
 if not IndexInList(FRow, FKinoList.Count) then Exit;
 case FCol of
  0:Exit;
  1:Value:=FKinoList[FRow].StrCaption;
  2:Value:=FKinoList[FRow].StrKinoType;
  3:Value:=FKinoList[FRow].StrYear;
  4:Value:=FKinoList[FRow].StrGenre;
  5:Value:=FKinoList[FRow].StrRating;
  6:Value:=FKinoList[FRow].StrRating2;
  //7:Value:=FKinoList[FRow].StrViewed;
  //8:Value:=FKinoList[FRow].StrKPMarked;
  9:Value:=FKinoList[FRow].StrInfo;
  10:Value:=FKinoList[FRow].StrDate;
 end;
end;

procedure TFormMain.TableExListItemColClick(Sender: TObject;
  MouseButton: TMouseButton; const Index: Integer);
begin
 if not IndexInList(TableExList.ItemIndex, FKinoList.Count) then Exit;
 if not (Index in [7, 8]) then Exit;
 case Index of
  7: FKinoList.Items[TableExList.ItemIndex].Viewed:=not FKinoList.Items[TableExList.ItemIndex].Viewed;
  8: FKinoList.Items[TableExList.ItemIndex].KPMarked:=not FKinoList.Items[TableExList.ItemIndex].KPMarked;
 end;
 FKinoList.UpdateRecord(TableExList.ItemIndex);
 ButtonFlatSave.NotifyVisible:=True;
end;

procedure TFormMain.TableExListKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
 if Key in [Ord('A')..Ord('Z'), Ord('0')..Ord('9'), VK_NUMPAD0..VK_NUMLOCK, VK_RETURN] then TableExList.Edit(TableExList.ItemIndex, TableExList.FocusedColumn);
end;

procedure TFormMain.TableExListMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
 case Button of
  TMouseButton.mbRight:
   begin
    if not IndexInList(TableExList.ItemIndex, FKinoList.Count) then Exit;
    PopupMenuList.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
   end;
 end;
end;

procedure TFormMain.TableExStatGetData(FCol, FRow: Integer; var Value: string);
begin
 Value:='';
 if not IndexInList(FRow, FStat.Count) then Exit;
 case FCol of
  0:Value:=FStat[FRow].Caption;
  1:Value:=FStat[FRow].Value;
 end;
end;

end.
