unit KinoLib.List;

interface
 uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Generics.Collections, Vcl.Grids,
  TableDraw, SQLLang, SQLiteTable3;

 type
  TKinoType = (ktFilm, ktSeries);

  TKinoItem = class
   private
    FID:Integer;
    FCaption:string;
    FInfo:string;
    FGenre:string;
    FYear:Word;
    FKinoType:TKinoType;
    FRating:Byte;
    FRating2:Byte;
    FChanged:Boolean;
    FEmpty:Boolean;
    FViewed:Boolean;
    FKPMarked:Boolean;
    FDate:TDateTime;
    //
    FStrCaption:string;
    FStrInfo:string;
    FStrGenre:string;
    FStrYear:string;
    FStrKinoType:string;
    FStrRating:string;
    FStrRating2:string;
    FStrChanged:string;
    FStrViewed:string;
    FStrKPMarked:string;
    FStrDate:string;
    FKID: Integer;
    //
    procedure DoChanged;
    procedure SetCaption(const Value: string);
    procedure SetGenre(const Value: string);
    procedure SetInfo(const Value: string);
    procedure SetKinoType(const Value: TKinoType);
    procedure SetRating(const Value: Byte);
    procedure SetRating2(const Value: Byte);
    procedure SetYear(const Value: Word);
    procedure SetKPMarked(const Value: Boolean);
    procedure SetViewed(const Value: Boolean);
    procedure SetDate(const Value: TDateTime);
    function GetForSearch: string;
    procedure SetKID(const Value: Integer);
    procedure SetEmpty(const Value: Boolean);
   public
    property Caption:string read FCaption write SetCaption;
    property Info:string read FInfo write SetInfo;
    property Genre:string read FGenre write SetGenre;
    property Year:Word read FYear write SetYear;
    property KinoType:TKinoType read FKinoType write SetKinoType;
    property Rating:Byte read FRating write SetRating;
    property Rating2:Byte read FRating2 write SetRating2;
    property ID:Integer read FID;
    property Viewed:Boolean read FViewed write SetViewed;
    property KPMarked:Boolean read FKPMarked write SetKPMarked;
    property Date:TDateTime read FDate write SetDate;
    property KID:Integer read FKID write SetKID;

    property StrCaption:string read FStrCaption;
    property StrInfo:string read FStrInfo;
    property StrGenre:string read FStrGenre;
    property StrYear:string read FStrYear;
    property StrKinoType:string read FStrKinoType;
    property StrRating:string read FStrRating;
    property StrRating2:string read FStrRating2;
    property StrViewed:string read FStrViewed;
    property StrKPMarked:string read FStrKPMarked;
    property StrDate:string read FStrDate;

    property Changed:Boolean read FChanged;
    property ForSearch:string read GetForSearch;
    property Empty:Boolean read FEmpty write SetEmpty;

    constructor Create;
  end;

  TKinoRatings = array[1..10] of Word;
  //23 301

  TKinoItems = class(TTableData<TKinoItem>)
   private
    FDBFileName:string;
    FSQLLite:TSQLiteDatabase;
    FOrderBy:string;
    FOrderDesc:Boolean;
    FFilterRating: Integer;
    FFilterYear: Integer;
    FFilterGenre: string;
    procedure SetFilterGenre(const Value: string);
    procedure SetFilterRating(const Value: Integer);
    procedure SetFilterYear(const Value: Integer);
   public
    function Load:Boolean;
    function Save:Boolean;
    function Search(Text:string; From:Integer):Integer;
    procedure Clear; override;
    procedure UpdateRecord(Index:Integer);
    procedure DeleteRecord(Index:Integer);
    function GetGenres(var Items:TStringList):Integer;
    function GetYears(var Items:TStringList):Integer;
    function GetRatingFilms(var Items:TKinoRatings):Boolean;
    constructor Create(AOwner: TTableEx; const ADBFileName:string); overload;
    property OrderBy:string read FOrderBy write FOrderBy;
    property OrderDesc:Boolean read FOrderDesc write FOrderDesc;
    property FilterGenre:string read FFilterGenre write SetFilterGenre;
    property FilterYear:Integer read FFilterYear write SetFilterYear;
    property FilterRating:Integer read FFilterRating write SetFilterRating;
  end;

  TKinoStatRecord = record
   Caption:string;
   Value:string;
   class function Create(ACaption, AValue:string):TKinoStatRecord; static;
  end;

  TKinoStatistics = class(TTableData<TKinoStatRecord>)
   public
    FRatingFilms:TKinoRatings;
    procedure UpdateStat(Lib:TKinoItems);
  end;

const
 Table = 'tnList';
 fnID = 'L_ID';
 fnCaption = 'L_CAPTION';
 fnInfo = 'L_INFO';
 fnGenre = 'L_GENRE';
 fnYear = 'L_YEAR';
 fnType = 'L_TYPE';
 fnRating = 'L_RATING';
 fnRating2 = 'L_RATING2';
 fnViewed = 'L_VIEWED';
 fnKPMarked = 'L_KPMARKED';
 fnDate = 'L_DATE';
 fnKID = 'L_KID';

 function KinoTypeToStr(Value:TKinoType):string;

implementation

function KinoTypeToStr(Value:TKinoType):string;
begin
 case Value of
  ktFilm: Result:='Фильм';
  ktSeries: Result:='Сериал';
 else
  Result:='Не известно';
 end;
end;

{ TKinoItem }

constructor TKinoItem.Create;
begin
 inherited;
 FEmpty:=True;
 FChanged:=True;
 FID:=-1;
 FDate:=Now;
end;

procedure TKinoItem.DoChanged;
begin
 FEmpty:=False;
 FChanged:=True;
end;

function TKinoItem.GetForSearch: string;
begin
 if Year > 0 then Result:=Format('%s %d', [Caption, Year]) else Result:=Caption;
end;

procedure TKinoItem.SetCaption(const Value: string);
begin
 FCaption:=Value;
 FStrCaption:=FCaption;
 DoChanged;
end;

procedure TKinoItem.SetDate(const Value: TDateTime);
begin
 FDate:=Value;
 FStrDate:=DateTimeToStr(FDate);
 DoChanged;
end;

procedure TKinoItem.SetEmpty(const Value: Boolean);
begin
 FEmpty:=Value;
end;

procedure TKinoItem.SetGenre(const Value: string);
begin
 FGenre:=Value;
 FStrGenre:=FGenre;
 DoChanged;
end;

procedure TKinoItem.SetInfo(const Value: string);
begin
 FInfo:=Value;
 FStrInfo:=FInfo;
 DoChanged;
end;

procedure TKinoItem.SetKID(const Value: Integer);
begin
 FKID:=Value;
 DoChanged;
end;

procedure TKinoItem.SetKinoType(const Value: TKinoType);
begin
 FKinoType:=Value;
 FStrKinoType:=KinoTypeToStr(FKinoType);
 DoChanged;
end;

procedure TKinoItem.SetKPMarked(const Value: Boolean);
begin
 FKPMarked:=Value;
 if FKPMarked then FStrKPMarked:='Отмечен'
 else FStrKPMarked:='Не отмечен';
 DoChanged;
end;

procedure TKinoItem.SetRating(const Value: Byte);
begin
 FRating:=Value;
 if FRating <= 0 then FStrRating:=''
 else FStrRating:=IntToStr(FRating);
 DoChanged;
end;

procedure TKinoItem.SetRating2(const Value: Byte);
begin
 FRating2:=Value;
 if FRating2 <= 0 then FStrRating2:=''
 else FStrRating2:=IntToStr(FRating2);
 DoChanged;
end;

procedure TKinoItem.SetViewed(const Value: Boolean);
begin
 FViewed:=Value;
 if FViewed then FStrViewed:='Просмотрен'
 else FStrViewed:='Не просмотрен';
 DoChanged;
end;

procedure TKinoItem.SetYear(const Value: Word);
begin
 FYear:=Value;
 if FYear <= 0 then FStrYear:='' else FStrYear:=IntToStr(FYear);
 DoChanged;
end;

{ TKinoItems }

procedure TKinoItems.Clear;
var i:Integer;
begin
 for i:= 0 to Count-1 do Items[i].Free;
 inherited;
end;

constructor TKinoItems.Create(AOwner: TTableEx; const ADBFileName: string);
begin
 inherited Create(AOwner);
 FOrderBy:=fnDate;
 FOrderDesc:=True;
 FFilterRating:=-1;
 FFilterYear:=-1;
 FFilterGenre:='';
 FDBFileName:=ADBFileName;
 try
  FSQLLite:=TSQLiteDatabase.Create(FDBFileName);
  if not FSQLLite.TableExists(Table) then
   with SQL.CreateTable(Table) do
    begin
     AddField(fnID, ftInteger, True, True);
     AddField(fnCaption, ftString);
     AddField(fnInfo, ftString);
     AddField(fnGenre, ftString);
     AddField(fnYear, ftInteger);
     AddField(fnType, ftInteger);
     AddField(fnRating, ftInteger);
     AddField(fnRating2, ftInteger);
     AddField(fnViewed, ftBoolean);
     AddField(fnKPMarked, ftBoolean);
     AddField(fnDate, ftDateTime);
     AddField(fnKID, ftInteger);
     FSQLLite.ExecSQL(GetSQL);
     EndCreate;
    end;
 except

 end;
end;

procedure TKinoItems.DeleteRecord(Index: Integer);
var Res:Integer;
begin
 with SQL.Select(Table) do
  begin
   AddField(fnID);
   WhereFieldEqual(fnID, Items[Index].ID);
   Res:=FSQLLite.GetTableValue(GetSQL);
   EndCreate;
  end;
 if Res >= 0 then
  begin
   With SQL.Delete(Table) do
    begin
     WhereFieldEqual(fnID, Items[Index].ID);
     FSQLLite.ExecSQL(GetSQL);
     EndCreate;
    end;
  end;
 Delete(Index);
end;

function TKinoItems.GetGenres(var Items:TStringList):Integer;
begin
 Result:=-1;
 Items.Clear;
 try
  with SQL.Select(Table) do
   begin
    AddField(fnGenre);
    WhereNotFieldEqual(fnGenre, '');
    Distinct:=True;
    FSQLLite.GetTableStrings(GetSQL, Items);
    Result:=Items.Count;
    EndCreate;
   end;
 finally

 end;
end;

function TKinoItems.GetRatingFilms(var Items: TKinoRatings): Boolean;
var i:Integer;
begin
 for i:= 1 to 10 do Items[i]:=0;
 for i:= 0 to Count-1 do
  begin
   if Self.Items[i].Rating in [1..10] then
    Items[Self.Items[i].Rating]:=Items[Self.Items[i].Rating] + 1;
  end;
end;

function TKinoItems.GetYears(var Items: TStringList): Integer;
begin
 Result:=-1;
 try
  with SQL.Select(Table) do
   begin
    AddField(fnYear);
    WhereNotFieldEqual(fnYear, '');
    WhereNotFieldEqual(fnYear, 0);
    Distinct:=True;
    FSQLLite.GetTableStrings(GetSQL, Items);
    Result:=Items.Count;
    EndCreate;
   end;
 finally

 end;
end;

function TKinoItems.Load: Boolean;
var RTable:TSQLiteTable;
    Item:TKinoItem;
begin
 try
  BeginUpdate;
  Clear;
  with SQL.Select(Table) do
   begin
    AddField(fnID);
    AddField(fnCaption);
    AddField(fnInfo);
    AddField(fnGenre);
    AddField(fnYear);
    AddField(fnType);
    AddField(fnRating);
    AddField(fnRating2);
    AddField(fnViewed);
    AddField(fnKPMarked);
    AddField(fnDate);
    AddField(fnKID);
    OrderBy(fnKPMarked);
    OrderBy(FOrderBy, FOrderDesc);
    OrderBy(fnCaption);
    if FFilterRating >= 0 then WhereFieldEqual(fnRating, FFilterRating);
    if FFilterYear >= 0 then WhereFieldEqual(fnYear, FFilterYear, wuAnd);
    if FFilterGenre <> '' then WhereFieldEqual(fnGenre, FFilterGenre, wuAnd);

    RTable:=FSQLLite.GetTable(GetSQL);
    EndCreate;
   end;
  if Assigned(RTable) then
   begin
    RTable.MoveFirst;
    while not RTable.EOF do
     begin
      Item:=TKinoItem.Create;
      Item.FID:=RTable.FieldAsInteger(0);
      Item.Caption:=RTable.FieldAsString(1);
      Item.Info:=RTable.FieldAsString(2);
      Item.Genre:=RTable.FieldAsString(3);
      Item.Year:=RTable.FieldAsInteger(4);
      Item.KinoType:=TKinoType(RTable.FieldAsInteger(5));
      Item.Rating:=RTable.FieldAsInteger(6);
      Item.Rating2:=RTable.FieldAsInteger(7);
      Item.Viewed:=RTable.FieldAsBoolean(8);
      Item.KPMarked:=RTable.FieldAsBoolean(9);
      Item.Date:=RTable.FieldAsDateTime(10);
      Item.KID:=RTable.FieldAsInteger(11);
      Item.FChanged:=False;
      Add(Item);
      RTable.Next;
     end;
   end;
 finally
  EndUpdate;
 end;
end;

function TKinoItems.Save: Boolean;
var i:Integer;
begin
 Result:=False;
 for i:= 0 to Count-1 do
  begin
   if not Items[i].Changed then Continue;
   UpdateRecord(i);
  end;
 Result:=True;
end;

function TKinoItems.Search(Text: string; From: Integer): Integer;
var i:Integer;
begin
 Result:=-1;
 if not IndexInList(From, Count) then From:=0;
 Text:=AnsiLowerCase(Text);
 for i:= From to Count-1 do
  begin
   if Pos(Text, AnsiLowerCase(Items[i].Caption)) > 0 then
    begin
     //if From = i then Continue;
     
     Exit(i);
    end;
  end;
 if From > 0 then Result:=Search(Text, 0);
end;

procedure TKinoItems.SetFilterGenre(const Value: string);
begin
 if FFilterGenre = Value then Exit;
 FFilterGenre:=Value;
 Load;
end;

procedure TKinoItems.SetFilterRating(const Value: Integer);
begin
 if FFilterRating = Value then Exit;
 FFilterRating:=Value;
 Load;
end;

procedure TKinoItems.SetFilterYear(const Value: Integer);
begin
 if FFilterYear = Value then Exit;
 FFilterYear:=Value;
 Load;
end;

procedure TKinoItems.UpdateRecord(Index: Integer);
var Res:Integer;
begin
 with SQL.Select(Table) do
  begin
   AddField(fnID);
   WhereFieldEqual(fnID, Items[Index].ID);
   Res:=FSQLLite.GetTableValue(GetSQL);
   EndCreate;
  end;
 if Res <= -1 then
  begin
   with SQL.InsertInto(Table) do
    begin
     AddValue(fnCaption, Items[Index].FCaption);
     AddValue(fnInfo, Items[Index].FInfo);
     AddValue(fnGenre, Items[Index].FGenre);
     AddValue(fnYear, Items[Index].FYear);
     AddValue(fnType, Ord(Items[Index].FKinoType));
     AddValue(fnRating, Items[Index].FRating);
     AddValue(fnRating2, Items[Index].FRating2);
     AddValue(fnViewed, Items[Index].FViewed);
     AddValue(fnKPMarked, Items[Index].FKPMarked);
     AddValue(fnDate, Items[Index].FDate);
     AddValue(fnKID, Items[Index].FKID);
     FSQLLite.ExecSQL(GetSQL);
     EndCreate;
    end;
   Items[Index].FID:=FSQLLite.GetLastInsertRowID;
   Items[Index].FChanged:=False;
  end
 else
  begin
   with SQL.Update(Table) do
    begin
     AddValue(fnCaption, Items[Index].FCaption);
     AddValue(fnInfo, Items[Index].FInfo);
     AddValue(fnGenre, Items[Index].FGenre);
     AddValue(fnYear, Items[Index].FYear);
     AddValue(fnType, Ord(Items[Index].FKinoType));
     AddValue(fnRating, Items[Index].FRating);
     AddValue(fnRating2, Items[Index].FRating2);
     AddValue(fnViewed, Items[Index].FViewed);
     AddValue(fnKPMarked, Items[Index].FKPMarked);
     AddValue(fnKID, Items[Index].FKID);
     WhereFieldEqual(fnID, Items[Index].FID);
     FSQLLite.ExecSQL(GetSQL);
     EndCreate;
    end;
   Items[Index].FChanged:=False;
  end;
end;

{ TKinoStatistics }

procedure TKinoStatistics.UpdateStat;
type TYDict = TDictionary<Integer, Integer>;
type TGDict = TDictionary<string, Integer>;
var Viewed, Marks, MCount:Integer;
    i:Integer;
    Years:TYDict;
    Genres:TGDict;
    Year, YID, OldYear:Integer;
    Value:TPair<Integer, Integer>;
    GValue:TPair<string, Integer>;
    OldFilm, LastTopFilm:string;
    LastTopDate:TDateTime;
    GenreCnt:Integer;
    Genre:string;
begin
 Lib.GetRatingFilms(FRatingFilms);
 Viewed:=0;
 Marks:=0;
 MCount:=0;
 OldYear:=-1;
 LastTopFilm:='';
 GenreCnt:=0;
 Year:=0;
 Years:=TYDict.Create;
 Genres:=TGDict.Create;
 BeginUpdate;
 try
  Clear;
  for i:= 0 to Lib.Count-1 do
   begin
    if Lib[i].Viewed then Inc(Viewed);
    if Lib[i].Year > 0 then
     begin
      Inc(Marks, Lib[i].Rating);
      Inc(MCount);
      if not Years.TryGetValue(Lib[i].Year, Year) then Year:=0;
      Inc(Year);
      Years.AddOrSetValue(Lib[i].Year, Year);
      if (OldYear <= 0) or (Lib[i].Year < OldYear) then
       begin
        OldYear:=Lib[i].Year;
        OldFilm:=Lib[i].Caption;
       end;
     end;
    if Lib[i].Genre <> '' then
     begin
      if not Genres.TryGetValue(Lib[i].Genre, GenreCnt) then GenreCnt:=0;
      Inc(GenreCnt);
      Genres.AddOrSetValue(Lib[i].Genre, GenreCnt);
     end;
    if Lib[i].Rating = 10 then
     begin
      if LastTopFilm = '' then LastTopDate:=Lib[i].Date;
      if Lib[i].Date >= LastTopDate then
       begin
        LastTopFilm:=Lib[i].Caption;
        LastTopDate:=Lib[i].Date;
       end;
     end;
   end;

  Year:=0;
  YID:=0;
  if Years.Count > 0 then
   begin
    YID:=0;
    for Value in Years do
     begin
      if Value.Value > Year then
       begin
        Year:=Value.Value;
        YID:=Value.Key;
       end;
     end;
   end;
  Years.Free;

  Genre:='Не известно';
  GenreCnt:=0;
  if Genres.Count > 0 then
   begin
    for GValue in Genres do
     begin
      if GValue.Value > GenreCnt then
       begin
        GenreCnt:=GValue.Value;
        Genre:=GValue.Key;
       end;
     end;
   end;
  Genres.Free;

  Marks:=Marks div MCount;
  Add(TKinoStatRecord.Create('Всего фильмов:', IntToStr(Lib.Count)));
  Add(TKinoStatRecord.Create('Нужно посмотреть:', IntToStr(Lib.Count-Viewed)));
  Add(TKinoStatRecord.Create('Просмотрено фильмов:', IntToStr(Viewed)));
  Add(TKinoStatRecord.Create(' ', ''));
  Add(TKinoStatRecord.Create('Средняя оценка:', IntToStr(Marks)));
  if Year > 0 then
  Add(TKinoStatRecord.Create('Самый популярный год:', Format('%d (фильмов: %d)', [YID, Year])));
  Add(TKinoStatRecord.Create('Самый старый фильм:', Format('%s (%d)', [OldFilm, OldYear])));
  Add(TKinoStatRecord.Create('Самый популярный жанр:', Format('%s (%d)', [Genre, GenreCnt])));
  Add(TKinoStatRecord.Create('Последний топовый фильм:', LastTopFilm));

 finally
  EndUpdate;
 end;
end;

{ TKinoStatRecord }

class function TKinoStatRecord.Create(ACaption, AValue: string): TKinoStatRecord;
begin
 Result.Caption:=ACaption;
 Result.Value:=AValue;
end;

end.

///
///  название
///  доп. инфо
///  жанр
///  год
///  сериал / полнометраж
///  оценка на кинопоиске
///
///
///
