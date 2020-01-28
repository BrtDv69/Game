unit Main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, ComCtrls, ToolWin, ImgList, Grids, Wwdbgrid,
  wwdbedit, Buttons, Db, IBCustomDataSet, IBDatabase, IBSQL,fcStatusBar,
  wwdbdatetimepicker, Mask, Wwdbspin, TeeProcs, TeEngine, Chart, DBChart,
  Series, LZRW1, IBServices, Registry, Hyperstr, Math, fcLabel, fcText,
  Menus, Printers, FR_Chart, FR_Class, FR_Desgn, FR_DSet,
  FR_DBSet, FR_RRect, Wwdbigrd, DBCtrls;

type
 TObjProcedure = procedure of object;

type
  TfrmMain = class(TForm)
    PageControl1: TPageControl;
    tsReports: TTabSheet;
    tsComps: TTabSheet;
    tsTariffs: TTabSheet;
    ImageList1: TImageList;
    Panel2: TPanel;
    Panel5: TPanel;
    Panel1: TPanel;
    sbTariff: TSpeedButton;
    sbClose: TSpeedButton;
    wwDBEdit1: TwwDBEdit;
    Panel6: TPanel;
    wwDBEdit2: TwwDBEdit;
    ImageList2: TImageList;
    trMain: TIBTransaction;
    ibdsMainComps: TIBDataSet;
    dsMainComps: TDataSource;
    ibdMain: TIBDatabase;
    ibdsMainCompsID: TIntegerField;
    ibdsMainCompsNUMBER: TIBStringField;
    ibdsMainCompsCLASS: TIntegerField;
    ibdsMainCompsDESCRIPTION: TIBStringField;
    ibdsMainCompsVALID: TIntegerField;
    ibdsMainCompsCOMMENTS: TIBStringField;
    ibdsMainTariffs: TIBDataSet;
    dsMainTariffs: TDataSource;
    ibdsMainTariffsID: TIntegerField;
    ibdsMainTariffsNAME: TIBStringField;
    ibdsMainTariffsPRICE: TFloatField;
    ibdsMainTariffsVALID: TIntegerField;
    ibdsMainTariffsCOMMENTS: TIBStringField;
    sbClass: TSpeedButton;
    fcStatusBar1: TfcStatusBar;
    ibdsMainCompsIP_ADDRESS: TIBStringField;
    ibdsMainCompsIP_ADDRESS2: TIBStringField;
    ibdsMainTariffsI_SPEED: TIntegerField;
    SpeedButton3: TSpeedButton;
    ibdsMainClass: TIBDataSet;
    dsMainClass: TDataSource;
    Panel3: TPanel;
    tpStart: TwwDBDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    tpStop: TwwDBDateTimePicker;
    ibdsMainClassCLASS: TIntegerField;
    ibdsMainClassDURATION: TFloatField;
    ibdsMainClassTOTAL_SUM: TFloatField;
    Splitter1: TSplitter;
    ibdsMainClassPercentage: TStringField;
    pnlClass: TPanel;
    dbgClass: TwwDBGrid;
    Splitter2: TSplitter;
    pnlTariff: TPanel;
    dbgTariff: TwwDBGrid;
    Splitter3: TSplitter;
    Panel8: TPanel;
    Label3: TLabel;
    seWorkTime: TwwDBSpinEdit;
    dbbtnClass: TwwIButton;
    dbbtnTariff: TwwIButton;
    ibdsMainGroupTariff: TIBDataSet;
    dsMainGroupTariff: TDataSource;
    ibsServo: TIBSQL;
    ibdsMainGroupTariffNAME: TIBStringField;
    ibdsMainGroupTariffDURATION: TFloatField;
    ibdsMainGroupTariffTOTAL_SUM: TFloatField;
    ibdsMainGroupTariffPercentage: TStringField;
    opd: TOpenDialog;
    lzrw: Tlzrw1;
    ibRS: TIBRestoreService;
    Chart1: TChart;
    Series1: TLineSeries;
    Series2: TLineSeries;
    Series3: TLineSeries;
    Series4: TLineSeries;
    ibsGraphs: TIBSQL;
    ibdsMainGroupTariffIN_COUNT: TIntegerField;
    ibdsMainGroupTariffID: TIntegerField;
    pnlChart: TPanel;
    pnlAverage: TPanel;
    Chart2: TChart;
    LineSeries1: TLineSeries;
    LineSeries2: TLineSeries;
    LineSeries3: TLineSeries;
    LineSeries4: TLineSeries;
    Panel4: TPanel;
    lblShowTime: TfcLabel;
    pnlTime: TPanel;
    Chart3: TChart;
    LineSeries5: TLineSeries;
    LineSeries7: TLineSeries;
    Panel9: TPanel;
    lblShowAverage: TfcLabel;
    Series5: TBarSeries;
    Series6: TBarSeries;
    sbPrintLine: TSpeedButton;
    lblLines: TfcLabel;
    lblBars: TfcLabel;
    frReport1: TfrReport;
    frChartObject1: TfrChartObject;
    frDesigner1: TfrDesigner;
    frDBDataSet1: TfrDBDataSet;
    opdRep: TOpenDialog;
    tsEncashment: TTabSheet;
    ibdsEncashment: TIBDataSet;
    dsEncashment: TDataSource;
    ibdsEncashmentCREATE_TIME: TDateTimeField;
    ibdsEncashmentAMOUNT: TFloatField;
    ibdsEncashmentCOMMENTS: TIBStringField;
    ibsAux: TIBSQL;
    tsProg: TTabSheet;
    ibdsMainProg: TIBDataSet;
    ibdsMainProgNAME: TIBStringField;
    ibdsMainProgPATH: TIBStringField;
    ibdsMainProgICON: TBlobField;
    ibdsMainProgID_PROG: TIntegerField;
    ibdsMainProgHASH: TIntegerField;
    ibdsMainProgNUM_OF_COMPS: TIntegerField;
    dsMainProg: TDataSource;
    ibdsCompProg: TIBDataSet;
    ibdsCompProgNUMBER: TIBStringField;
    ibdsCompProgID_PROG: TIntegerField;
    ibdsCompProgDESCRIPTION: TIBStringField;
    ibdsCompProgNETWORK_NAME: TIBStringField;
    ibdsCompProgID: TIntegerField;
    dsCompProg: TDataSource;
    Panel7: TPanel;
    Splitter4: TSplitter;
    wwdbgComps: TwwDBGrid;
    wwdbgProgOfComps: TwwDBGrid;
    DBImage1: TDBImage;
    tsLogs: TTabSheet;
    PageControl2: TPageControl;
    tsLogUnorder: TTabSheet;
    tsLogComps: TTabSheet;
    tsLogTariffs: TTabSheet;
    wwDBGrid5: TwwDBGrid;
    wwDBGrid6: TwwDBGrid;
    wwDBGrid2: TwwDBGrid;
    ibdsLogUnorder: TIBDataSet;
    dsLogUnorder: TDataSource;
    ibdsLogUnorderNETWORK_NAME: TIBStringField;
    ibdsLogUnorderTIME_START: TDateTimeField;
    ibdsLogUnorderTIME_STOP: TDateTimeField;
    ibdsLogUnorderNUMBER: TIBStringField;
    ibdsLogComps: TIBDataSet;
    dsLogComps: TDataSource;
    ibdsLogCompsNUMBER: TIBStringField;
    ibdsLogCompsNETWORK_NAME: TIBStringField;
    ibdsLogCompsNEW_VALID: TSmallintField;
    ibdsLogCompsCHANGE_TIME: TDateTimeField;
    ibdsLogTariffs: TIBDataSet;
    dsLogTariffs: TDataSource;
    ibdsLogTariffsNAME: TIBStringField;
    ibdsLogTariffsNEW_PRICE: TFloatField;
    ibdsLogTariffsOLD_PRICE: TFloatField;
    ibdsLogTariffsCHANGE_TIME: TDateTimeField;
    Panel10: TPanel;
    Panel11: TPanel;
    ibdsLogUnorderDeltaTime: TStringField;
    wwDBGrid1: TwwDBGrid;
    wwDBGrid3: TwwDBGrid;
    wwDBGrid4: TwwDBGrid;
    procedure sbCloseClick(Sender: TObject);
    procedure wwDBGrid3CalcTitleImage(Sender: TObject; Field: TField;
      var TitleImageAttributes: TwwTitleImageAttributes);
    procedure wwDBGrid3CreateHintWindow(Sender: TObject;
      HintWindow: TwwGridHintWindow; AField: TField; R: TRect;
      var WordWrap: Boolean; var MaxWidth, MaxHeight: Integer;
      var DoDefault: Boolean);
    procedure wwDBGrid3TitleButtonClick(Sender: TObject;
      AFieldName: String);
    procedure PageControl1Change(Sender: TObject);
    procedure ibdsMainClassCalcFields(DataSet: TDataSet);
    procedure dbbtnClassClick(Sender: TObject);
    procedure ibdsMainClassBeforeOpen(DataSet: TDataSet);
    procedure ibdsMainClassAfterClose(DataSet: TDataSet);
    procedure tpStartChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ibdsMainGroupTariffAfterClose(DataSet: TDataSet);
    procedure ibdsMainGroupTariffBeforeOpen(DataSet: TDataSet);
    procedure ibdsMainGroupTariffCalcFields(DataSet: TDataSet);
    procedure dbbtnTariffClick(Sender: TObject);
    procedure ibdsMainClassAfterOpen(DataSet: TDataSet);
    procedure ibdsMainGroupTariffAfterOpen(DataSet: TDataSet);
    procedure dbgClassUpdateFooter(Sender: TObject);
    procedure sbTariffClick(Sender: TObject);
    procedure ibdsTotalTimeBeforeOpen(DataSet: TDataSet);
    procedure ibdsTotalWeekDayBeforeOpen(DataSet: TDataSet);
    procedure SpeedButton3Click(Sender: TObject);
    procedure ibdsMainClassAfterScroll(DataSet: TDataSet);
    procedure ibdsMainGroupTariffAfterScroll(DataSet: TDataSet);
    procedure lblShowTimeMouseEnter(Sender: TObject);
    procedure lblShowTimeMouseLeave(Sender: TObject);
    procedure lblShowTimeMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure lblShowTimeMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure lblShowTimeClick(Sender: TObject);
    procedure ibdsMainGroupTariffIN_COUNTChange(Sender: TField);
    procedure dbgTariffCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure FormShow(Sender: TObject);
    procedure Chart3Resize(Sender: TObject);
    procedure lblLinesClick(Sender: TObject);
    procedure sbPrintLineClick(Sender: TObject);
    procedure frReport1BeforePrint(Memo: TStringList; View: TfrView);
    procedure ibdsMainGroupTariffFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure ibdsEncashmentBeforeOpen(DataSet: TDataSet);
    procedure wwDBGrid1UpdateFooter(Sender: TObject);
    procedure ibdsLogUnorderBeforeOpen(DataSet: TDataSet);
    procedure PageControl2Change(Sender: TObject);
    procedure ibdsLogCompsBeforeOpen(DataSet: TDataSet);
    procedure ibdsLogTariffsBeforeOpen(DataSet: TDataSet);
    procedure ibdsLogUnorderCalcFields(DataSet: TDataSet);
    procedure dbgClassCalcTitleAttributes(Sender: TObject;
      AFieldName: String; AFont: TFont; ABrush: TBrush;
      var ATitleAlignment: TAlignment);
    procedure wwDBGridCalcTitleAttributes(Sender: TObject; AFieldName, AFieldNameReal: String; AFont: TFont; ABrush: TBrush;
                                                var ATitleAlignment: TAlignment; OrderBy: String);
    procedure tpStartCloseUp(Sender: TObject);
  private
    { Private declarations }
    procedure GenerateSelectMainComps;
    procedure GenerateSelectMainTariffs;
    procedure GenerateSelectMainClass;
    procedure GenerateSelectMainGroupTariff;
    procedure GenerateSelectEncashment;
    procedure GenerateSelectCompProg;
    procedure GenerateSelectMainProg;
    procedure GenerateSelectLogUnorder;
    procedure GenerateSelectLogComps;
    procedure GenerateSelectLogTariffs;
    procedure GetTotals;
    procedure GetClass;
    procedure GetTariff;
    procedure TotalRefreash;
    procedure GetManyByDate(Total:Boolean);
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.DFM}

{$L C:\GUARDANT\API\STEALTH\LIB\NVSK32WD.OBJ}

procedure nskSetMode(dwFlags:longint; bProg:byte; dwID:longint;
                      wSN:word; bVer:byte;
                      wMask, wType:word ); stdcall; external;
function nskTransform( dwPrivateRD:longint; bAlgoNum,bLng:byte;
                       pData:pointer ):integer; stdcall; external;
function nskCRC( pData:pointer;
                 dwLng,dwPrevCRC:longint ):longint; stdcall; external;
function nskCodeInit( dwPrivateRD:longint; wCnvType:word;
                      bAddr:byte; pKey:pointer ):integer; stdcall; external;
function nskEnCode( wCnvType:word; pKeyBuf,pData:pointer;
                    dwLng:longint ):integer; stdcall; external;
function nskDeCode( wCnvType:word; pKeyBuf,pData:pointer;
                    dwLng:longint ):integer; stdcall; external;
function nskRead( dwPrivateRD:longint; bAddr,bLng:byte;
                  pData:pointer ):integer; stdcall; external;
procedure wwDBGridCalcTitleImage(Sender: TObject; Field: TField;
                                 var TitleImageAttributes: TwwTitleImageAttributes;
                                 OrderBy : String); forward;
function FieldPos(FieldName: String; SelectSQL: TStrings): String; forward;
procedure wwDBGridTitleButtonClick(Sender: TObject; AFieldName: String;
                                   var OrderBy : String; Ctrl : Boolean;
                                   sbApply, sbCancel : TSpeedButton;
                                   GenerateSelect : TObjProcedure); forward;

var
  OrderByMainComps  : String = ' 2 desc, 5 asc';
  OrderByMainTariffs  : String = ' 2 desc, 4 asc';
  OrderByClass  : String = ' 3 desc';
  OrderByTariff  : String = ' 3 desc';
  OrderByEncashment  : String = ' 1 asc';
  OrderByCompProg : String =' 2 asc';
  OrderByMainProg : String =' 2 asc';
  OrderByLogUnorder : String =' 3 asc, 4 asc';
  OrderByLogComps : String =' 4 asc';
  OrderByLogTariffs : String =' 4 asc';
  DownBtnName : String[20] = 'sbClass';
  TotalTime, ClassTime, TariffTime : array[0..23] of Double;
  TotalWeekDay, ClassWeekDay, TariffWeekDay : array[1..7] of Double;
  NumbComps : Integer;
  RussianWeekDays : array[1..7] of String[3];
  RefreshClass, RefreshTariff : Boolean;
  TotalWidth : Integer = 20;
  LineActiveOld : Boolean;
  ShowByTariff : Boolean = True;
  CodePass  : array[0..32-1] of Byte;
  PrivRD : Longint = 1262958463;
  
Procedure SetNewAxis(Axis:TChartAxis;
                     ASeries:TChartSeries;
                     IsOtherSide:Boolean);
begin
  Axis.Axis.Color:=ASeries.SeriesColor;
  Axis.OtherSide:=IsOtherSide
end;

Procedure HorizAxisForSeries(ASeries:TChartSeries;
                             IsOtherSide:Boolean);
Var Axis:TChartAxis;
begin
  Axis:=TChartAxis.Create(ASeries.ParentChart);
  Axis.Horizontal:=True;
  Axis.Grid.Visible:=True;
  Axis.Grid.Color := ASeries.SeriesColor;
  ASeries.CustomHorizAxis:=Axis;
  SetNewAxis(Axis,ASeries,IsOtherside);
end;

function GetWeekDayNumber(WeekDay : Integer): Integer;
 var WD, DaysRemain : Integer;
begin
 If (WeekDay=7) then
  WD := 1
 else
  WD := WeekDay+1;
 DaysRemain := Round(Frac((frmMain.tpStop.Date+1-frmMain.tpStart.Date)/7)*7);
 Result := Trunc((frmMain.tpStop.Date+1-frmMain.tpStart.Date)/7);
 If (DaysRemain>0) then
  If (DayOfWeek(frmMain.tpStart.Date)+DaysRemain<8) then
   Begin
    If (WD>=DayOfWeek(frmMain.tpStart.Date)) and (WD<=DayOfWeek(frmMain.tpStop.Date+1)) then
     Inc(Result)
   End
  else
   If (WD>=DayOfWeek(frmMain.tpStart.Date)) or (WD<=DayOfWeek(frmMain.tpStop.Date+1)) then
    Inc(Result)
end;

function FieldPosNumber(FieldPosRes, OrderBy: String): String;
 var k : Integer;
begin
 Result := '';
 OrderBy := OrderBy+',';
 k := 0;
 While (Length(OrderBy)>0) do
  Begin
   Inc(k);
   If (Pos(' '+FieldPosRes+' ',Copy(OrderBy,1,Pred(Pos(',',OrderBy))))>0) then
    Begin
     If (Copy(OrderBy,Succ(Pos(',',OrderBy)),Length(OrderBy)-Pos(',',OrderBy))<>'') or (k>1) then
      Result := IntToStr(k)+': ';
     Break
    End;
   OrderBy := Copy(OrderBy,Succ(Pos(',',OrderBy)),Length(OrderBy)-Pos(',',OrderBy))
  End
end;

procedure TfrmMain.GenerateSelectMainComps;
begin
 ibdsMainComps.SelectSQL.Clear;
 ibdsMainComps.SelectSQL.Add('select ID, NUMBER, NETWORK_NAME, IP_ADDRESS,');
 ibdsMainComps.SelectSQL.Add('CLASS, DESCRIPTION, VALID, COMMENTS');
 ibdsMainComps.SelectSQL.Add('from COMPS');
 ibdsMainComps.SelectSQL.Add('order by'+OrderByMainComps)
end;

procedure TfrmMain.GenerateSelectMainTariffs;
begin
 ibdsMainTariffs.SelectSQL.Clear;
 ibdsMainTariffs.SelectSQL.Add('select ID, NAME, I_SPEED, PRICE, VALID, COMMENTS');
 ibdsMainTariffs.SelectSQL.Add('from TARIFFS');
 ibdsMainTariffs.SelectSQL.Add('order by'+OrderByMainTariffs)
end;

procedure TfrmMain.GenerateSelectMainClass;
begin
 ibdsMainClass.SelectSQL.Clear;
 ibdsMainClass.SelectSQL.Add('select C.CLASS, SUM(O.TIME_STOP-O.TIME_START) DURATION,');
 ibdsMainClass.SelectSQL.Add('SUM(O.PRICE) TOTAL_SUM');
 ibdsMainClass.SelectSQL.Add('from COMPS C, GET_ORDERS(:START,:STOP) O, TARIFFS T');
 ibdsMainClass.SelectSQL.Add('where (C.ID=O.COMP_ID) and (T.ID=O.TARIFF_ID)');
 If (pnlClass.Align=alClient) then
  Begin
   ibdsMainClass.SelectSQL.Add('and (T.IN_COUNT=1)');
   ibdsMainClass.DataSource := nil;
   ibdsMainGroupTariff.DataSource := dsMainClass;
   dbbtnClass.Enabled := True;
   dbbtnClass.AllowAllUp := False;
   dbgClass.Options := dbgClass.Options+[dgShowFooter]
  End
 else
  Begin
   ibdsMainClass.SelectSQL.Add('and (T.ID=:ID)');
   dbbtnClass.AllowAllUp := True;
   ibdsMainGroupTariff.DataSource := nil;
   ibdsMainClass.DataSource := dsMainGroupTariff;
   dbgClass.Options := dbgClass.Options-[dgShowFooter]
  End;
 ibdsMainClass.SelectSQL.Add('group by C.CLASS');
 ibdsMainClass.SelectSQL.Add('order by'+OrderByClass)
end;

procedure TfrmMain.GenerateSelectMainGroupTariff;
begin
 ibdsMainGroupTariff.SelectSQL.Clear;
 ibdsMainGroupTariff.SelectSQL.Add('select T.ID, T.NAME, SUM(O.TIME_STOP-O.TIME_START) DURATION,');
 ibdsMainGroupTariff.SelectSQL.Add('SUM(O.PRICE) TOTAL_SUM, T.IN_COUNT');
 ibdsMainGroupTariff.SelectSQL.Add('from TARIFFS T, GET_ORDERS(:START,:STOP) O');
 If (pnlTariff.Align<>alClient) then
  ibdsMainGroupTariff.SelectSQL.Add(', COMPS C');
 ibdsMainGroupTariff.SelectSQL.Add('where (T.ID=O.TARIFF_ID)');
 If (pnlTariff.Align=alClient) then
  Begin
   ibdsMainGroupTariff.DataSource := nil;
   ibdsMainClass.DataSource := dsMainGroupTariff;
   dbbtnTariff.Enabled := True;
   dbbtnTariff.AllowAllUp := False;
   dbgTariff.Options := dbgTariff.Options+[dgShowFooter]
  End
 else
  Begin
   ibdsMainGroupTariff.SelectSQL.Add('and (C.ID=O.COMP_ID) and (C.CLASS=:CLASS)');
   dbbtnTariff.AllowAllUp := True;
   ibdsMainClass.DataSource := nil;
   ibdsMainGroupTariff.DataSource := dsMainClass;
   dbgTariff.Options := dbgTariff.Options-[dgShowFooter]
  End;
 ibdsMainGroupTariff.SelectSQL.Add('group by T.ID, T.NAME, T.IN_COUNT');
 If (pnlTariff.Align=alClient) then
  Begin
   ibdsMainGroupTariffIN_COUNT.Visible := True;
   ibdsMainGroupTariffNAME.DisplayWidth := TotalWidth-ibdsMainGroupTariffIN_COUNT.DisplayWidth
  End
 else
  Begin
   ibdsMainGroupTariffIN_COUNT.Visible := False;
   ibdsMainGroupTariffNAME.DisplayWidth := TotalWidth
  End;
 ibdsMainGroupTariff.SelectSQL.Add('order by'+OrderByTariff)
end;

procedure TfrmMain.GenerateSelectEncashment;
 var k : Integer;
begin
 For k := Pred(ibdsEncashment.SelectSQL.Count) downto 3 do
  ibdsEncashment.SelectSQL.Delete(k);
 ibdsEncashment.SelectSQL.Add('order by'+OrderByEncashment)
end;

{Ivan}procedure TfrmMain.GenerateSelectCompProg;
begin
 ibdsCompProg.SelectSQL[2] := ('order by'+OrderByCompProg)
end;

procedure TfrmMain.GenerateSelectMainProg;
begin
 ibdsMainProg.SelectSQL[2] := ('order by'+OrderByMainProg)
end;

procedure TfrmMain.GenerateSelectLogUnorder;
begin
 ibdsLogUnorder.SelectSQL[3] := ('order by'+OrderByLogUnorder)
end;

procedure TfrmMain.GenerateSelectLogComps;
begin
 ibdsLogComps.SelectSQL[3] := ('order by'+OrderByLogComps)
end;

procedure TfrmMain.GenerateSelectLogTariffs;
begin
 ibdsLogTariffs.SelectSQL[3] := ('order by'+OrderByLogTariffs)
end;

procedure wwDBGridCalcTitleImage(Sender: TObject; Field: TField;
                                 var TitleImageAttributes: TwwTitleImageAttributes;
                                 OrderBy : String);
var FieldPosRes, PartOrderBy : String;
begin
 TitleImageAttributes.ImageIndex := -1;
 FieldPosRes := FieldPos(Field.FieldName,((Sender as TwwDBGrid).DataSource.DataSet as TIBDataSet).SelectSQL);
 If (Field <> nil) and (((Sender as TwwDBGrid).DataSource.DataSet as TIBDataSet).Active) and
    (Pos(' '+FieldPosRes+' ',OrderBy)>0) then
  Begin
   PartOrderBy := Copy(OrderBy,Pos(' '+FieldPosRes+' ',OrderBy),Length(OrderBy)-Pos(' '+FieldPosRes+' ',OrderBy)+1);
   If (Pos(',',PartOrderBy)<>0) then
    PartOrderBy := Copy(PartOrderBy,1,Pos(',',PartOrderBy)-1);
   If (Pos('asc',PartOrderBy)>0) then
    TitleImageAttributes.ImageIndex := 1
   else
    TitleImageAttributes.ImageIndex := 0
  End
end;

function FieldPos(FieldName: String; SelectSQL: TStrings): String;
 var SqlStr, S : String;
     k, kk : Integer;
Begin
 SqlStr :='';
 For k := 0 to Pred(SelectSQL.Count) do
  SqlStr := SqlStr+SelectSQL[k]+' ';
 If (Pos('distinct',SqlStr)=0) then
  SqlStr := Copy(SqlStr,7,Pos(' from ',SqlStr)-7)
 else
  SqlStr := Copy(SqlStr,Pos(' distinct ',SqlStr)+10,Pos(' from ',SqlStr)-Pos(' distinct ',SqlStr)+10);
 Trim(SqlStr);
 SqlStr := SqlStr+',';
 S := '';
 kk := 1;
 While (Length(SqlStr)>0) do
  Begin
   S := Trim(Copy(SqlStr,1,Pos(',',SqlStr)));
   If (CompareText(Copy(S,Length(S)-Length(FieldName),Length(FieldName)),FieldName)=0) and
      ((S[Length(S)-Length(FieldName)-1] in [' ','.',',']) or (Length(S)=Succ(Length(FieldName)))) then
    Break;
   SqlStr := Copy(SqlStr,Succ(Pos(',',SqlStr)),Length(SqlStr)-Pos(',',SqlStr));
   Inc(kk)
  End;
 Result := IntToStr(kk)
End;

procedure wwDBGridTitleButtonClick(Sender: TObject; AFieldName: String;
                                   var OrderBy : String; Ctrl : Boolean;
                                   sbApply, sbCancel : TSpeedButton;
                                   GenerateSelect : TObjProcedure);
 var BookMark : TBookMarkStr;
     Field : TField;
     FieldPosRes, PreStr, PastStr : String;
begin
 try
  Field := ((Sender as TwwDBGrid).DataSource.DataSet as TIBDataSet).FieldByName(AFieldName)
 except
  exit
 end;
 If (AFieldName <> '') and (Field.FieldKind=fkData) and (AFieldName <> 'ICON') then
  Begin
   If (sbApply<>nil) then
    If (sbApply.Enabled) then
     Case MessageDlg('Имеются несохраненные изменения. Сохранить?', mtConfirmation, [mbYes,mbNo,mbCancel],0) of
      mrYes: sbApply.Click;
      mrNo: sbCancel.Click;
      mrCancel: Exit
     End;
   BookMark := ((Sender as TwwDBGrid).DataSource.DataSet as TIBDataSet).BookMark;
   ((Sender as TwwDBGrid).DataSource.DataSet as TIBDataSet).DisableControls;
   ((Sender as TwwDBGrid).DataSource.DataSet as TIBDataSet).Close;
   FieldPosRes := FieldPos(AFieldName,((Sender as TwwDBGrid).DataSource.DataSet as TIBDataSet).SelectSQL);
   If (Ctrl) then
    Begin
     If (Pos(' '+FieldPosRes+' ',OrderBy)>0) then
      Begin
       If (Pos(' '+FieldPosRes+' ',OrderBy)=1) then
        PreStr := ''
       else
        PreStr := Copy(OrderBy,1,Pos(' '+FieldPosRes+' ',OrderBy));
       OrderBy := Copy(OrderBy,Pos(' '+FieldPosRes+' ',OrderBy),Length(OrderBy)-Pos(' '+FieldPosRes+' ',OrderBy)+1);
       If (Pos(',',OrderBy)=0) then
        PastStr := ''
       else
        Begin
         PastStr := Copy(OrderBy,Pos(',',OrderBy),Length(OrderBy)-Pos(',',OrderBy)+1);
         OrderBy := Copy(OrderBy,1,Pos(',',OrderBy)-1)
        End;
       If (Pos('asc',OrderBy)>0) then
        OrderBy := ' '+FieldPosRes+' desc'
       else
        OrderBy := ' '+FieldPosRes+' asc';
       OrderBy := PreStr+OrderBy+PastStr
      End
     else
      Begin
       If (OrderBy<>'') then
        OrderBy := OrderBy+', '+FieldPosRes+' asc'
       else
        OrderBy := ' '+FieldPosRes+' asc';
      End
    end
   else
    Begin
     If (Pos(' '+FieldPosRes+' ',OrderBy)>0) then
      If (Pos('asc',OrderBy)>0) then
       OrderBy := ' '+FieldPosRes+' desc'
      else
       OrderBy := ' '+FieldPosRes+' asc'
     else
      OrderBy := ' '+FieldPosRes+' asc';
    End;
   GenerateSelect;
   ((Sender as TwwDBGrid).DataSource.DataSet as TIBDataSet).Open;
   ((Sender as TwwDBGrid).DataSource.DataSet as TIBDataSet).BookMark := BookMark;
   ((Sender as TwwDBGrid).DataSource.DataSet as TIBDataSet).EnableControls
  End
end;

procedure TfrmMain.sbCloseClick(Sender: TObject);
begin
 Close
end;

procedure TfrmMain.wwDBGrid3CalcTitleImage(Sender: TObject; Field: TField;
  var TitleImageAttributes: TwwTitleImageAttributes);
begin
 Case (Sender as TComponent).Tag of
  0: If (Field=ibdsMainClassPercentage) then
      wwDBGridCalcTitleImage(Sender, ibdsMainClassDURATION, TitleImageAttributes, OrderByClass)
     else
      wwDBGridCalcTitleImage(Sender, Field, TitleImageAttributes, OrderByClass);
  1: If (Field=ibdsMainGroupTariffPercentage) then
      wwDBGridCalcTitleImage(Sender, ibdsMainGroupTariffDURATION, TitleImageAttributes, OrderByTariff)
     else
      wwDBGridCalcTitleImage(Sender, Field, TitleImageAttributes, OrderByTariff);
  2: wwDBGridCalcTitleImage(Sender, Field, TitleImageAttributes, OrderByMainComps);
  3: wwDBGridCalcTitleImage(Sender, Field, TitleImageAttributes, OrderByMainTariffs);
  4: wwDBGridCalcTitleImage(Sender, Field, TitleImageAttributes, OrderByEncashment);
  5: wwDBGridCalcTitleImage(Sender, Field, TitleImageAttributes, OrderByCompProg);
  6: wwDBGridCalcTitleImage(Sender, Field, TitleImageAttributes, OrderByMainProg);
  7: wwDBGridCalcTitleImage(Sender, Field, TitleImageAttributes, OrderByLogUnorder);
  8: wwDBGridCalcTitleImage(Sender, Field, TitleImageAttributes, OrderByLogComps);
  9: wwDBGridCalcTitleImage(Sender, Field, TitleImageAttributes, OrderByLogTariffs);
 end
end;

procedure TfrmMain.wwDBGrid3CreateHintWindow(Sender: TObject;
  HintWindow: TwwGridHintWindow; AField: TField; R: TRect;
  var WordWrap: Boolean; var MaxWidth, MaxHeight: Integer;
  var DoDefault: Boolean);
begin
 WordWrap := True;
 if (AField is TBlobField) then
    MaxWidth := 200;
 MaxHeight := Screen.Height
end;

procedure TfrmMain.wwDBGrid3TitleButtonClick(Sender: TObject;
  AFieldName: String);
begin
 Case (Sender as TComponent).Tag of
  0: Begin
      If (AFieldName='Percentage') then
       wwDBGridTitleButtonClick(Sender, 'DURATION', OrderByClass, (GetKeyState(VK_CONTROL)<0),
                                nil, nil, GenerateSelectMainClass)
      else
       wwDBGridTitleButtonClick(Sender, AFieldName, OrderByClass, (GetKeyState(VK_CONTROL)<0),
                                nil, nil, GenerateSelectMainClass);
      GetClass;
      RefreshClass := True
     End;
  1: Begin
      If (AFieldName='Percentage') then
       wwDBGridTitleButtonClick(Sender, 'DURATION', OrderByTariff, (GetKeyState(VK_CONTROL)<0),
                               nil, nil, GenerateSelectMainGroupTariff)
      else
       wwDBGridTitleButtonClick(Sender, AFieldName, OrderByTariff, (GetKeyState(VK_CONTROL)<0),
                               nil, nil, GenerateSelectMainGroupTariff);
      GetTariff;
      GetManyByDate(False);
      RefreshTariff := True
     End;
  2: wwDBGridTitleButtonClick(Sender, AFieldName, OrderByMainComps, (GetKeyState(VK_CONTROL)<0),
                              nil, nil, GenerateSelectMainComps);
  3: wwDBGridTitleButtonClick(Sender, AFieldName, OrderByMainTariffs, (GetKeyState(VK_CONTROL)<0),
                              nil, nil, GenerateSelectMainTariffs);
  4: wwDBGridTitleButtonClick(Sender, AFieldName, OrderByEncashment, (GetKeyState(VK_CONTROL)<0),
                              nil, nil, GenerateSelectEncashment);
  5: wwDBGridTitleButtonClick(Sender, AFieldName, OrderByCompProg, (GetKeyState(VK_CONTROL)<0),
                              nil, nil, GenerateSelectCompProg);
  6: wwDBGridTitleButtonClick(Sender, AFieldName, OrderByMainProg, (GetKeyState(VK_CONTROL)<0),
                              nil, nil, GenerateSelectMainProg);
  7: wwDBGridTitleButtonClick(Sender, AFieldName, OrderByLogUnorder, (GetKeyState(VK_CONTROL)<0),
                              nil, nil, GenerateSelectLogUnorder);
  8: wwDBGridTitleButtonClick(Sender, AFieldName, OrderByLogComps, (GetKeyState(VK_CONTROL)<0),
                              nil, nil, GenerateSelectLogComps);
  9: wwDBGridTitleButtonClick(Sender, AFieldName, OrderByLogTariffs, (GetKeyState(VK_CONTROL)<0),
                              nil, nil, GenerateSelectLogTariffs);
 end
end;

procedure TfrmMain.PageControl1Change(Sender: TObject);
begin
 ibdsMainComps.Active := (PageControl1.ActivePage=tsComps);
 ibdsMainTariffs.Active := (PageControl1.ActivePage=tsTariffs);
 ibdsEncashment.Active := (PageControl1.ActivePage=tsEncashment);
 ibdsMainProg.Active := (PageControl1.ActivePage=tsProg);
 ibdsCompProg.Active := (PageControl1.ActivePage=tsProg);
 ibdsLogUnorder.Active := False;
 ibdsLogComps.Active := False;
 ibdsLogTariffs.Active := False;
 If (PageControl1.ActivePage=tsLogs) then
  Begin
   ibdsLogUnorder.Active := (PageControl2.ActivePage=tsLogUnorder);
   ibdsLogComps.Active := (PageControl2.ActivePage=tsLogComps);
   ibdsLogTariffs.Active := (PageControl2.ActivePage=tsLogTariffs)
  End
end;

procedure TfrmMain.ibdsMainClassCalcFields(DataSet: TDataSet);
 var DurationPrcnt : Double;
begin
 DurationPrcnt := 24*ibdsMainClassDURATION.AsFloat*100/((Trunc(ibdsMainClass.ParamByName('Stop').Value-
                  ibdsMainClass.ParamByName('Start').Value))*seWorkTime.Value)/NumbComps;
 ibdsMainClassPercentage.Value := FormatFloat('####0.00%',DurationPrcnt)+', ';
 If (ibdsMainClassDURATION.AsFloat/(NumbComps*(Trunc(ibdsMainClass.ParamByName('Stop').Value-
                  ibdsMainClass.ParamByName('Start').Value)))>=1) then
  ibdsMainClassPercentage.Value := ibdsMainClassPercentage.Value+IntToStr(Trunc(ibdsMainClassDURATION.AsFloat/(NumbComps*(Trunc(ibdsMainClass.ParamByName('Stop').Value-
                  ibdsMainClass.ParamByName('Start').Value)))))+'сут. ';
 If (Frac(ibdsMainClassDURATION.AsFloat/(NumbComps*(Trunc(ibdsMainClass.ParamByName('Stop').Value-
                  ibdsMainClass.ParamByName('Start').Value))))>0) then
  ibdsMainClassPercentage.Value := ibdsMainClassPercentage.Value+FormatDateTime('hhч. nn м. ',Frac(ibdsMainClassDURATION.AsFloat/(NumbComps*(Trunc(ibdsMainClass.ParamByName('Stop').Value-
                  ibdsMainClass.ParamByName('Start').Value)))))
end;

procedure TfrmMain.dbbtnClassClick(Sender: TObject);
begin
 dbgClass.SetFocus;
 If ((Sender as TwwIButton).Down) then
  Begin
   ibdsMainClass.Close;
   GenerateSelectMainClass;
   ibdsMainClass.Open;
   RefreshClass := True;
   If (pnlClass.Align<>alClient) and (pnlClass.Height=dbbtnClass.Height+4) and
      (pnlClass.Tag<=Panel2.Height-dbbtnTariff.Height-10) and (pnlClass.Tag>5) then
    pnlClass.Height := pnlClass.Tag;
   If (pnlClass.Align=alClient) then
    Begin
     GetTotals;
     If (ibdsMainGroupTariff.Active) then
      GetManyByDate(True)
    End
   else
    GetClass;
   Chart1.Visible := True
  End
 else
  Begin
   ibdsMainClass.Close;
   Chart1.Visible := False;
   If (pnlClass.Align<>alClient) then
    Begin
     pnlClass.Tag := pnlClass.Height;
     Chart1.Visible := False;
     pnlClass.Height := dbbtnClass.Height+4
    End
  End
end;

procedure TfrmMain.ibdsMainClassBeforeOpen(DataSet: TDataSet);
begin
 RefreshClass := False;
 ibdsMainClass.ParamByName('Start').AsDate := tpStart.Date;
 ibdsMainClass.ParamByName('Stop').AsDate := tpStop.Date+1
end;

procedure TfrmMain.ibdsMainClassAfterClose(DataSet: TDataSet);
 var OldAllowAllUp : Boolean;
begin
 OldAllowAllUp := dbbtnClass.AllowAllUp;
 dbbtnClass.AllowAllUp := True;
 dbbtnClass.Down := False;
 dbbtnClass.AllowAllUp := OldAllowAllUp
end;

procedure TfrmMain.tpStartChange(Sender: TObject);
begin
 ibdsMainClass.Close;
 ibdsMainGroupTariff.Close;
 ibdsEncashment.Close;
 ibdsLogUnorder.Close;
 ibdsLogComps.Close;
 ibdsLogTariffs.Close;
 Series1.Clear; LineSeries1.Clear;
 Series2.Clear; LineSeries2.Clear;
 Series3.Clear; LineSeries3.Clear;
 Series4.Clear; LineSeries4.Clear;
 Series5.Clear; LineSeries5.Clear;
 Series6.Clear; LineSeries7.Clear;
 LineActiveOld := LineSeries5.Active;
 Series5.Active := (lblBars.TextOptions.Style=fclsLowered);
 Series6.Active := (lblBars.TextOptions.Style=fclsLowered);
 LineSeries5.Active := (lblLines.TextOptions.Style=fclsLowered);
 LineSeries7.Active := (lblLines.TextOptions.Style=fclsLowered);
 If (pnlClass.Align=alClient) then
  Begin
   pnlTariff.Height := dbbtnTariff.Height+4;
   pnlChart.Visible := False;
   dbbtnTariff.Enabled := False
  End
 else
  Begin
   pnlClass.Height := dbbtnClass.Height+4;
   Chart1.Visible := False;
   dbbtnClass.Enabled := False
  End
end;

procedure TfrmMain.FormCreate(Sender: TObject);
 var Reg: TRegistry;
     IniFile : TRegIniFile;
     k : Integer;
     NotGood  : Integer;
     Pswd, UName, UPass : String;
begin
 RussianWeekDays[1] := 'Пн.';
 RussianWeekDays[2] := 'Вт.';
 RussianWeekDays[3] := 'Ср.';
 RussianWeekDays[4] := 'Чт.';
 RussianWeekDays[5] := 'Пт.';
 RussianWeekDays[6] := 'Сб.';
 RussianWeekDays[7] := 'Вс.';
 Reg := TRegistry.Create;
 Reg.RootKey := HKEY_LOCAL_MACHINE;
 If (Reg.KeyExists('\Software\WizardSoft\Wizard iGame')) then
  Begin
   Reg.OpenKeyReadOnly('\Software\WizardSoft\Wizard iGame');
   If (Reg.ValueExists('Path')) then
    ibdMain.DatabaseName := Reg.ReadString('Path')
  End;
 Reg.Free;
 IniFile := TRegIniFile.Create;
 IniFile.RootKey := HKEY_CURRENT_USER;
 IniFile.OpenKey('\Software\WizardSoft\Wizard iGame',True);
 frmMain.Height := IniFile.ReadInteger('Wizard iGame Analitic','frmMain.Height',frmMain.Height);
 frmMain.Width := IniFile.ReadInteger('Wizard iGame Analitic','frmMain.Width',frmMain.Width);
 frmMain.Left := IniFile.ReadInteger('Wizard iGame Analitic','frmMain.Left',frmMain.Left);
 frmMain.Top := IniFile.ReadInteger('Wizard iGame Analitic','frmMain.Top',frmMain.Top);
 Case IniFile.ReadInteger('Wizard iGame Analitic','frmMain.WindowState',1) of
  0: frmMain.WindowState := wsMinimized;
  1: frmMain.WindowState := wsNormal;
  2: frmMain.WindowState := wsMaximized;
 end;
 For k := 0 to Pred(frmMain.ComponentCount) do
  If (Components[k] is TField) then
   Begin
    (Components[k] as TField).DisplayLabel := IniFile.ReadString('Wizard iGame Analitic','frmMain.'+(Components[k] as TField).Name+'.DisplayLabel',(Components[k] as TField).DisplayLabel);
    (Components[k] as TField).DisplayWidth := IniFile.ReadInteger('Wizard iGame Analitic','frmMain.'+(Components[k] as TField).Name+'.DisplayWidth',(Components[k] as TField).DisplayWidth);
    (Components[k] as TField).Index := IniFile.ReadInteger('Wizard iGame Analitic','frmMain.'+(Components[k] as TField).Name+'.Index',(Components[k] as TField).Index);
    If ((Components[k] is TNumericField)) then
     (Components[k] as TNumericField).DisplayFormat := IniFile.ReadString('Wizard iGame Analitic','frmMain.'+(Components[k] as TNumericField).Name+'.DisplayFormat',(Components[k] as TNumericField).DisplayFormat);
    (Components[k] as TField).Visible := IniFile.ReadBool('Wizard iGame Analitic','frmMain.'+(Components[k] as TField).Name+'.Visible',(Components[k] as TField).Visible)
   End;
 pnlTariff.Tag := IniFile.ReadInteger('Wizard iGame Analitic','frmMain.pnlTariff.Tag',pnlTariff.Tag);
 pnlClass.Tag := IniFile.ReadInteger('Wizard iGame Analitic','frmMain.pnlClass.Tag',pnlClass.Tag);
 dbgClass.Width := IniFile.ReadInteger('Wizard iGame Analitic','frmMain.dbgClass.Width',dbgClass.Width);
 dbgTariff.Width := IniFile.ReadInteger('Wizard iGame Analitic','frmMain.dbgTariff.Width',dbgTariff.Width);
 seWorkTime.Value := IniFile.ReadInteger('Wizard iGame Analitic','frmMain.seWorkTime.Value',Trunc(seWorkTime.Value));
 ShowByTariff := IniFile.ReadBool('Wizard iGame Analitic','ShowByTariff',ShowByTariff);
 pnlTime.Visible := IniFile.ReadBool('Wizard iGame Analitic','frmMain.pnlTime.Visible',pnlTime.Visible);
 pnlAverage.Visible := IniFile.ReadBool('Wizard iGame Analitic','frmMain.pnlAverage.Visible',pnlAverage.Visible);
 Case IniFile.ReadInteger('Wizard iGame Analitic','frmMain.lblLines.TextOptions.Style',1) of
  0: lblLines.TextOptions.Style := fclsLowered;
  1: lblLines.TextOptions.Style := fclsRaised
 end;
 If (lblLines.TextOptions.Style=fclsRaised) then
  lblBars.TextOptions.Style := fclsLowered
 else
  lblBars.TextOptions.Style := fclsRaised;
 Series5.Active := IniFile.ReadBool('Wizard iGame Analitic','frmMain.Series5.Active',Series5.Active);
 IniFile.CloseKey;
 IniFile.Free;
 Series6.Active := Series5.Active;
 LineSeries5.Active := NOT Series5.Active;
 LineSeries7.Active := LineSeries5.Active;
 ibRS.DatabaseName.Add(Copy(ibdMain.DatabaseName,Succ(Pos(':',ibdMain.DatabaseName)),Length(ibdMain.DatabaseName)-Pos(':',ibdMain.DatabaseName)));
 ibRS.BackupFile.Add(GetTmpDir+'XXX.xyz');
 If (IsNetWork) then
  Begin
   ibRS.ServerName := Copy(ibdMain.DatabaseName,1,Pred(Pos(':',ibdMain.DatabaseName)));
   ibRS.Protocol := TCP
  End
 else
  Begin
   ibRS.ServerName := 'localhost';
   ibRS.Protocol := Local
  End;
 PageControl1.ActivePageIndex := 0;
 If (pnlClass.Align=alClient) then
  Begin
   pnlTariff.Height := dbbtnTariff.Height+4;
   pnlChart.Visible := False;
   dbbtnClass.Enabled := True
  End
 else
  Begin
   pnlClass.Height := dbbtnClass.Height+4;
   Chart1.Visible := False;
   dbbtnTariff.Enabled := True
  end;
 CodePass[0] := 171; CodePass[1] := 163; CodePass[2] := 74; CodePass[3] := 211;
 CodePass[4] := 168; CodePass[5] := 146; CodePass[6] := 89; CodePass[7] := 45;
 CodePass[8] := 234; CodePass[9] := 254; CodePass[10] := 117; CodePass[11] := 219;
 CodePass[12] := 66; CodePass[13] := 138; CodePass[14] := 47; CodePass[15] := 158;
 CodePass[16] := 81; CodePass[17] := 42; CodePass[18] := 10; CodePass[19] := 54;
 CodePass[20] := 181; CodePass[21] := 105; CodePass[22] := 22; CodePass[23] := 243;
 CodePass[24] := 46; CodePass[25] := 218; CodePass[26] := 80; CodePass[27] := 127;
 CodePass[28] := 183; CodePass[29] := 161; CodePass[30] := 31; CodePass[31] := 14;
 nskDeCode(0,@CodePass,@PrivRD,4);
 nskSetMode(25,1,0,0,1,2,0);
 NotGood := nskCRC(@PrivRD,4,-1)-1417686703;
 Pswd := '@J:B%8^4#rg$;aQn4u5)_)({}[wgor!&';
 NotGood := nskCodeInit(PrivRD,0,1,@Pswd[1]);
 UName := '1234';
 NotGood := nskRead(PrivRD,124,4,@UName[1]);
 NotGood := nskDeCode(0,@Pswd[1],@UName[1],4);
 UPass := '0123456789';
 NotGood := nskRead(PrivRD,128,10,@UPass[1]);
 NotGood := nskDeCode(0,@Pswd[1],@UPass[1],10);
 NotGood := nskEnCode(0,@CodePass,@PrivRD,4);
 Pswd := '@J:B%8^4#rg$;aQn4u5)_)({}[wgor!&';
 try
  k := Trunc(256/NotGood);
  ibdMain.Params.Clear
 except
  ibdMain.Params.Clear;
  ibdMain.Params.Add('user_name='+UName);
  ibdMain.Params.Add('password='+UPass);
  ibdMain.Params.Add('lc_ctype=WIN1251');
 end;
 ibdMain.Open;
 trMain.StartTransaction;
 GenerateSelectMainProg;
 GenerateSelectCompProg;
 GenerateSelectLogUnorder;
 GenerateSelectLogComps;
 GenerateSelectLogTariffs;
 ibsServo.SQL.Clear;
 ibsServo.SQL.Add('select MAX(TIME_STOP) MAX_STOP from ORDERS');
 ibsServo.ExecQuery;
 tpStart.Date := ibsServo.FieldByName('MAX_STOP').AsDate-10;
 tpStop.Date := ibsServo.FieldByName('MAX_STOP').AsDate;
 fcStatusBar1.Panels[0].Text := FormatDateTime('dd.mm.yyyy hh:nn',ibsServo.FieldByName('MAX_STOP').AsDateTime);
 ibsServo.Close;
 seWorkTime.Value := 24;
 ibsServo.SQL.Clear;
 ibsServo.SQL.Add('select COUNT(*) CNT from COMPS where (VALID=1)');
 ibsServo.ExecQuery;
 NumbComps := ibsServo.FieldByName('CNT').AsInteger;
 ibsServo.Close;
 ibsServo.SQL.Clear;
 ibsServo.SQL.Add('delete from UNORDER_TIME where TIME_START=TIME_STOP');
 ibsServo.ExecQuery;
 ibsServo.Close;
 ibsServo.SQL.Clear;
 ibsServo.SQL.Add('select SUM(O.TIME_STOP-O.TIME_START) DURATION,');
 ibsServo.SQL.Add('SUM(O.PRICE) TOTAL_SUM');
 ibsServo.SQL.Add('from GET_ORDERS(:START,:STOP) O, TARIFFS T');
 ibsServo.SQL.Add('where (O.TARIFF_ID=T.ID) and (T.IN_COUNT=1)');
 ibsServo.GenerateParamNames := True;
 Series1.GetHorizAxis.Axis.Color := Series1.SeriesColor;
 Series1.GetHorizAxis.Grid.Color := Series1.SeriesColor;
 LineSeries1.GetHorizAxis.Grid.Color := LineSeries1.SeriesColor;
 HorizAxisForSeries(Series2, True);
 Series4.CustomHorizAxis:=Series2.CustomHorizAxis;
 LineSeries1.GetHorizAxis.Axis.Color := LineSeries1.SeriesColor;
 HorizAxisForSeries(LineSeries2, True);
 LineSeries4.CustomHorizAxis:=LineSeries2.CustomHorizAxis;
 LineSeries1.LinePen.Visible := False;
 LineSeries2.LinePen.Visible := False;
 Series2.Stairs := True;
 Series4.Stairs := True;
 LineSeries2.Stairs := True;
 LineSeries4.Stairs := True;
 PageControl2.ActivePage := tsLogUnorder
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
 var IniFile : TRegIniFile;
     k : Integer;
begin
 IniFile := TRegIniFile.Create;
 IniFile.RootKey := HKEY_CURRENT_USER;
 IniFile.OpenKey('\Software\WizardSoft\Wizard iGame',True);
 IniFile.WriteInteger('Wizard iGame Analitic','frmMain.Left',frmMain.Left);
 IniFile.WriteInteger('Wizard iGame Analitic','frmMain.Top',frmMain.Top);
 Case (frmMain.WindowState) of
  wsMinimized : IniFile.WriteInteger('Wizard iGame Analitic','frmMain.WindowState',0);
  wsNormal    : Begin
                 IniFile.WriteInteger('Wizard iGame Analitic','frmMain.WindowState',1);
                 IniFile.WriteInteger('Wizard iGame Analitic','frmMain.Height',frmMain.Height);
                 IniFile.WriteInteger('Wizard iGame Analitic','frmMain.Width',frmMain.Width)
                End;
  wsMaximized : IniFile.WriteInteger('Wizard iGame Analitic','frmMain.WindowState',2)
 end;
 For k := 0 to Pred(frmMain.ComponentCount) do
  If (Components[k] is TField) then
   Begin
    IniFile.WriteString('Wizard iGame Analitic','frmMain.'+(Components[k] as TField).Name+'.DisplayLabel',(Components[k] as TField).DisplayLabel);
    IniFile.WriteInteger('Wizard iGame Analitic','frmMain.'+(Components[k] as TField).Name+'.DisplayWidth',(Components[k] as TField).DisplayWidth);
    IniFile.WriteInteger('Wizard iGame Analitic','frmMain.'+(Components[k] as TField).Name+'.Index',(Components[k] as TField).Index);
    If ((Components[k] is TNumericField)) then
     IniFile.WriteString('Wizard iGame Analitic','frmMain.'+(Components[k] as TNumericField).Name+'.DisplayFormat',(Components[k] as TNumericField).DisplayFormat);
     IniFile.WriteBool('Wizard iGame Analitic','frmMain.'+(Components[k] as TField).Name+'.Visible',(Components[k] as TField).Visible)
   End;
 IniFile.WriteInteger('Wizard iGame Analitic','frmMain.pnlTariff.Tag',pnlTariff.Tag);
 IniFile.WriteInteger('Wizard iGame Analitic','frmMain.pnlClass.Tag',pnlClass.Tag);
 IniFile.WriteInteger('Wizard iGame Analitic','frmMain.dbgClass.Width',dbgClass.Width);
 IniFile.WriteInteger('Wizard iGame Analitic','frmMain.dbgTariff.Width',dbgTariff.Width);
 IniFile.WriteInteger('Wizard iGame Analitic','frmMain.seWorkTime.Value',Trunc(seWorkTime.Value));
 IniFile.WriteBool('Wizard iGame Analitic','ShowByTariff',sbTariff.Down);
 IniFile.WriteBool('Wizard iGame Analitic','frmMain.pnlTime.Visible',pnlTime.Visible);
 IniFile.WriteBool('Wizard iGame Analitic','frmMain.pnlAverage.Visible',pnlAverage.Visible);
 Case (lblLines.TextOptions.Style) of
  fclsLowered : IniFile.WriteInteger('Wizard iGame Analitic','frmMain.lblLines.TextOptions.Style',0);
  fclsRaised  : IniFile.WriteInteger('Wizard iGame Analitic','frmMain.lblLines.TextOptions.Style',1)
 end;
 IniFile.WriteBool('Wizard iGame Analitic','frmMain.Series5.Active',Series5.Active);
 IniFile.CloseKey;
 IniFile.Free;
 try
  trMain.Commit
 except
 end;
 Action := caFree
end;

procedure TfrmMain.ibdsMainGroupTariffAfterClose(DataSet: TDataSet);
 var OldAllowAllUp : Boolean;
begin
 OldAllowAllUp := dbbtnTariff.AllowAllUp;
 dbbtnTariff.AllowAllUp := True;
 dbbtnTariff.Down := False;
 dbbtnTariff.AllowAllUp := OldAllowAllUp
end;

procedure TfrmMain.ibdsMainGroupTariffBeforeOpen(DataSet: TDataSet);
begin
 RefreshTariff := False;
 ibdsMainGroupTariff.ParamByName('Start').AsDate := tpStart.Date;
 ibdsMainGroupTariff.ParamByName('Stop').AsDate := tpStop.Date+1
end;

procedure TfrmMain.ibdsMainGroupTariffCalcFields(DataSet: TDataSet);
 var DurationPrcnt : Double;
begin
 DurationPrcnt := 24*ibdsMainGroupTariffDURATION.AsFloat*100/((Trunc(ibdsMainGroupTariff.ParamByName('Stop').Value-
                  ibdsMainGroupTariff.ParamByName('Start').Value))*seWorkTime.Value)/NumbComps;
 ibdsMainGroupTariffPercentage.Value := FormatFloat('####0.00%',DurationPrcnt)+', ';
 If (ibdsMainGroupTariffDURATION.AsFloat/(NumbComps*(Trunc(ibdsMainGroupTariff.ParamByName('Stop').Value-
                  ibdsMainGroupTariff.ParamByName('Start').Value)))>=1) then
  ibdsMainGroupTariffPercentage.Value := ibdsMainGroupTariffPercentage.Value+IntToStr(Trunc(ibdsMainGroupTariffDURATION.AsFloat/(NumbComps*(Trunc(ibdsMainGroupTariff.ParamByName('Stop').Value-
                  ibdsMainGroupTariff.ParamByName('Start').Value)))))+'сут. ';
 If (Frac(ibdsMainGroupTariffDURATION.AsFloat/(NumbComps*(Trunc(ibdsMainGroupTariff.ParamByName('Stop').Value-
                  ibdsMainGroupTariff.ParamByName('Start').Value))))>0) then
  ibdsMainGroupTariffPercentage.Value := ibdsMainGroupTariffPercentage.Value+FormatDateTime('hhч. nn м. ',Frac(ibdsMainGroupTariffDURATION.AsFloat/(NumbComps*(Trunc(ibdsMainGroupTariff.ParamByName('Stop').Value-
                  ibdsMainGroupTariff.ParamByName('Start').Value)))))
end;

procedure TfrmMain.dbbtnTariffClick(Sender: TObject);
begin
 dbgTariff.SetFocus;
 If ((Sender as TwwIButton).Down) then
  Begin
   ibdsMainGroupTariff.Close;
   GenerateSelectMainGroupTariff;
   ibdsMainGroupTariff.Open;
   RefreshTariff := True;
   If (pnlTariff.Align<>alClient) and (pnlTariff.Height=dbbtnTariff.Height+4) and
      (pnlTariff.Tag<=Panel2.Height-dbbtnClass.Height-10) and (pnlTariff.Tag>5) then
    pnlTariff.Height := pnlTariff.Tag;
   If (pnlTariff.Align=alClient) then
    Begin
     GetTotals;
     GetManyByDate(True)
    End
   else
    Begin
     GetTariff;
     If (LineSeries5.Count>0) then
      GetManyByDate(False)
     else
      GetManyByDate(True)
    End;
   Series5.Active := (lblBars.TextOptions.Style=fclsLowered);
   Series6.Active := (lblBars.TextOptions.Style=fclsLowered);
   LineSeries5.Active := (lblLines.TextOptions.Style=fclsLowered);
   LineSeries7.Active := (lblLines.TextOptions.Style=fclsLowered);
   pnlChart.Visible := True
  End
 else
  Begin
   ibdsMainGroupTariff.Close;
   If (pnlTariff.Align<>alClient) then
    Begin
     pnlTariff.Tag := pnlTariff.Height;
     pnlChart.Visible := False;
     pnlTariff.Height := dbbtnTariff.Height+4
    End
  End
end;

procedure TfrmMain.ibdsMainClassAfterOpen(DataSet: TDataSet);
begin
 If (pnlClass.Align=alClient) then
  dbbtnTariff.Enabled := True;
 dbbtnClass.Down := True
end;

procedure TfrmMain.ibdsMainGroupTariffAfterOpen(DataSet: TDataSet);
begin
 If (pnlTariff.Align=alClient) then
  dbbtnClass.Enabled := True;
 dbbtnTariff.Down := True
end;

procedure TfrmMain.dbgClassUpdateFooter(Sender: TObject);
 var DurationPrcnt : Double;
     Percentage : String;
begin
 If (dgShowFooter in (Sender as TwwdbGrid).Options) then
  Begin
   ibsServo.ParamByName('Start').AsDate := tpStart.Date;
   ibsServo.ParamByName('Stop').AsDate := tpStop.Date+1;
   ibsServo.ExecQuery;
   DurationPrcnt := 24*ibsServo.FieldByName('DURATION').AsDouble*100/((Trunc(tpStop.Date+1-
                    tpStart.Date))*seWorkTime.Value)/NumbComps;
   Percentage := FormatFloat('####0.00%',DurationPrcnt)+', ';
   If (ibsServo.FieldByName('DURATION').AsDouble>=1) then
    Percentage := Percentage+IntToStr(Trunc(ibsServo.FieldByName('DURATION').AsDouble))+'сут. ';
   If (Frac(ibsServo.FieldByName('DURATION').AsDouble)>0) then
    Percentage := Percentage+FormatDateTime('hhч. nn м. ',Frac(ibsServo.FieldByName('DURATION').AsDouble));
   (Sender as TwwdbGrid).ColumnByName('Percentage').FooterValue:=Percentage;
   (Sender as TwwdbGrid).ColumnByName('TOTAL_SUM').FooterValue:=FormatFloat('#,##0.00',ibsServo.FieldByName('TOTAL_SUM').AsDouble);
   ibsServo.Close
  End
end;

procedure TfrmMain.sbTariffClick(Sender: TObject);
 var OldClassOpen, OldTariffOpen : Boolean;
     OldClassTag, OldTariffTag : LongInt;
     OldTariffHeight, OldClassHeight : Integer;
begin
 If (DownBtnName=(Sender as TSpeedButton).Name) then
  Exit;
 DownBtnName := (Sender as TSpeedButton).Name;
 OldClassOpen := ibdsMainClass.Active;
 OldTariffOpen := ibdsMainGroupTariff.Active;
 OldClassTag := pnlClass.Tag;
 OldTariffTag := pnlTariff.Tag;
 OldTariffHeight := pnlTariff.Height;
 OldClassHeight := pnlClass.Height;
 ibdsMainClass.Close;
 ibdsMainGroupTariff.Close;
 Splitter1.Hide;
 pnlClass.Hide;
 pnlTariff.Hide;
 If (Sender=sbTariff) then
  pnlClass.Align := alBottom
 else
  pnlClass.Align := alClient;
 If (OldTariffHeight=dbbtnTariff.Height+4) then
  Begin
   pnlClass.Height := dbbtnClass.Height+4;
   Chart1.Visible := False
  End
 else
  Begin
   pnlClass.Height := OldTariffHeight;
   Chart1.Visible := True
  End;
 pnlClass.Tag := OldTariffTag;
 If (OldClassHeight=dbbtnClass.Height+4) then
  Begin
   pnlTariff.Height := dbbtnTariff.Height+4;
   pnlChart.Visible := False
  End
 else
  Begin
   pnlTariff.Height := OldClassHeight;
   pnlChart.Visible := True
  End;
 pnlTariff.Tag := OldClassTag;
 If (Sender=sbTariff) then
  pnlTariff.Align := alClient
 else
  pnlTariff.Align := alBottom;
 pnlClass.Tag := OldTariffTag;
 pnlTariff.Tag := OldClassTag;
 GenerateSelectMainClass;
 GenerateSelectMainGroupTariff;
 If (Sender=sbTariff) then
  Begin
   ibdsMainGroupTariff.Active := OldClassOpen;
   ibdsMainClass.Active := OldTariffOpen;
   dbbtnClass.Enabled := OldClassOpen;
   Series1.LinePen.Visible := False;
   Series2.LinePen.Visible := False;
   LineSeries1.LinePen.Visible := True;
   LineSeries2.LinePen.Visible := True;
   pnlClass.Show;
   Splitter1.Show;
   pnlTariff.Show;
   If (ibdsMainGroupTariff.Active) then
    If (lblShowTime.Caption='Обновить') or (lblShowAverage.Caption='Обновить') then
     TotalRefreash
    else
     Begin
      GetTariff;
      If (LineSeries5.Count>0) then
       GetManyByDate(False)
      else
       GetManyByDate(True)
     End;
   RefreshTariff := True
  End
 else
  Begin
   ibdsMainClass.Active := OldTariffOpen;
   ibdsMainGroupTariff.Active := OldClassOpen;
   dbbtnTariff.Enabled := OldTariffOpen;
   Series1.LinePen.Visible := True;
   Series2.LinePen.Visible := True;
   LineSeries1.LinePen.Visible := False;
   LineSeries2.LinePen.Visible := False;
   pnlTariff.Show;
   Splitter1.Show;
   pnlClass.Show;
   If (ibdsMainClass.Active) then
    If (lblShowTime.Caption='Обновить') or (lblShowAverage.Caption='Обновить') then
     TotalRefreash
    else
     GetClass;
   RefreshClass := True
  End
end;

procedure TfrmMain.ibdsTotalTimeBeforeOpen(DataSet: TDataSet);
begin
 (DataSet as TIBDataSet).ParamByName('Start').AsDate := tpStart.Date;
 (DataSet as TIBDataSet).ParamByName('Stop').AsDate := tpStop.Date+1
end;

procedure TfrmMain.ibdsTotalWeekDayBeforeOpen(DataSet: TDataSet);
begin
 (DataSet as TIBDataSet).ParamByName('WorkTime').AsInteger := Trunc(seWorkTime.Value);
 (DataSet as TIBDataSet).ParamByName('Start').AsDate := tpStart.Date;
 (DataSet as TIBDataSet).ParamByName('Stop').AsDate := tpStop.Date+1
end;

procedure TfrmMain.SpeedButton3Click(Sender: TObject);
 var InpStream, OutStream : TFileStream;
     k : Integer; 
     Pswd, UName, UPass : String;
begin
 If (opd.Execute) then
  Begin
   For k := 0 to Pred(frmMain.ComponentCount) do
    If (frmMain.Components[k] is TSpeedButton) or (frmMain.Components[k] is TwwIButton) then
     (frmMain.Components[k] as TSpeedButton).Enabled := False;
   FileSetAttr(opd.FileName,faArchive);
   InpStream := TFileStream.Create(opd.FileName,fmOpenRead);
   OutStream := TFileStream.Create(GetTmpDir+'XXX.xyz',fmCreate);
   Lzrw.InputStream := InpStream;
   Lzrw.OutputStream := OutStream;
   Lzrw.Decompress;
   OutStream.Position := 0;
   OutStream.Free;
   InpStream.Free;
   DeleteFile(opd.FileName);
   ibdMain.Close;
   try
    Screen.Cursor := crHourGlass;
    CodePass[0] := 171; CodePass[1] := 163; CodePass[2] := 74; CodePass[3] := 211;
    CodePass[4] := 168; CodePass[5] := 146; CodePass[6] := 89; CodePass[7] := 45;
    CodePass[8] := 234; CodePass[9] := 254; CodePass[10] := 117; CodePass[11] := 219;
    CodePass[12] := 66; CodePass[13] := 138; CodePass[14] := 47; CodePass[15] := 158;
    CodePass[16] := 81; CodePass[17] := 42; CodePass[18] := 10; CodePass[19] := 54;
    CodePass[20] := 181; CodePass[21] := 105; CodePass[22] := 22; CodePass[23] := 243;
    CodePass[24] := 46; CodePass[25] := 218; CodePass[26] := 80; CodePass[27] := 127;
    CodePass[28] := 183; CodePass[29] := 161; CodePass[30] := 31; CodePass[31] := 14;
    nskDeCode(0,@CodePass,@PrivRD,4);
    nskSetMode(25,1,0,0,1,1,0);
    Pswd := '@J:B%8^4#rg$;aQn4u5)_)({}[wgor!&';
    nskCodeInit(PrivRD,0,1,@Pswd[1]);
    UName := '1234';
    nskRead(PrivRD,110,4,@UName[1]);
    nskDeCode(0,@Pswd[1],@UName[1],4);
    UPass := '0123456789';
    nskRead(PrivRD,114,10,@UPass[1]);
    nskDeCode(0,@Pswd[1],@UPass[1],10);
    nskEnCode(0,@CodePass,@PrivRD,4);
    Pswd := '@J:B%8^4#rg$;aQn4u5)_)({}[wgor!&';
    ibRS.Params.Clear;
    ibRS.Params.Add('user_name='+UName);
    ibRS.Params.Add('password='+UPass);
    ibRS.Attach();
    If (ibRS.Active=True) then
     Begin
      ibRS.ServiceStart;
       While (ibRS.IsServiceRunning) do
        Application.ProcessMessages;
      ibRS.Active := False
     End
    else
     Begin
      MessageDlg('Невозможно соединиться с сервером БД.',mtError,[mbOK],0);
      Exit
     End;
   finally
    If (ibRS.Active) then
     ibRS.Detach();
    Screen.Cursor := crDefault
   end;
   DeleteFile(GetTmpDir+'XXX.xyz');
   ibdMain.Open;
   trMain.StartTransaction;
   ibsServo.SQL.Clear;
   ibsServo.SQL.Add('select COUNT(*) CNT from COMPS where (VALID=1)');
   ibsServo.ExecQuery;
   NumbComps := ibsServo.FieldByName('CNT').AsInteger;
   ibsServo.Close;
   For k := 0 to Pred(frmMain.ComponentCount) do
    If (frmMain.Components[k] is TSpeedButton) or (frmMain.Components[k] is TwwIButton) then
     (frmMain.Components[k] as TSpeedButton).Enabled := True;
   ibsServo.SQL.Clear;
   ibsServo.SQL.Add('select MAX(TIME_STOP) MAX_STOP from ORDERS');
   ibsServo.ExecQuery;
   fcStatusBar1.Panels[0].Text := FormatDateTime('dd.mm.yyyy hh:nn',ibsServo.FieldByName('MAX_STOP').AsDateTime);
   ibsServo.Close;
   ibsServo.SQL.Clear;
   ibsServo.SQL.Add('select COUNT(*) CNT from COMPS where (VALID=1)');
   ibsServo.ExecQuery;
   NumbComps := ibsServo.FieldByName('CNT').AsInteger;
   ibsServo.Close;
   ibsServo.SQL.Clear;
   ibsServo.SQL.Add('select SUM(O.TIME_STOP-O.TIME_START) DURATION,');
   ibsServo.SQL.Add('SUM(O.PRICE) TOTAL_SUM');
   ibsServo.SQL.Add('from ORDERS O, TARIFFS T');
   ibsServo.SQL.Add('where (O.TIME_START<:STOP) and (O.TIME_STOP>=:START) and');
   ibsServo.SQL.Add('(O.TARIFF_ID=T.ID) and (T.IN_COUNT=1)');
   ibsServo.GenerateParamNames := True
  End
end;

procedure TfrmMain.GetTotals;
 var HourStart, MinStart, HourStop: Word;
     i, WeekDayStart : Integer;
     TimeDelta, Duration : Double;
     CurrentDay : Integer;
begin
 For i := 0 to 23 do
  Begin
   TotalTime[i] := 0;
   ClassTime[i] := 0;
   TariffTime[i] := 0
  End;
 For i := 1 to 7 do
  Begin
   TotalWeekDay[i] := 0;
   ClassWeekDay[i] := 0;
   TariffWeekDay[i] := 0
  End;
 ibsGraphs.SQL.Clear;
 ibsGraphs.SQL.Add('select O.TIME_START, O.TIME_STOP, C.CLASS, T.ID, T.IN_COUNT');
 ibsGraphs.SQL.Add('from ORDERS O, COMPS C, TARIFFS T');
 ibsGraphs.SQL.Add('where (O.TIME_START<'''+FormatDateTime('dd.mm.yyyy',tpStop.Date+1)+
                  ''') and (O.TIME_STOP>='''+FormatDateTime('dd.mm.yyyy',tpStart.Date)+''') and');
 ibsGraphs.SQL.Add('(O.COMP_ID=C.ID) and (O.TARIFF_ID=T.ID)');
 ibsGraphs.ExecQuery;
 While NOT (ibsGraphs.Eof) do
  Begin
   If (ibsGraphs.FieldByName('TIME_START').AsDateTime<tpStart.Date) then
    ibsGraphs.FieldByName('TIME_START').AsDateTime := tpStart.Date;
   If (ibsGraphs.FieldByName('TIME_STOP').AsDateTime>tpStop.Date+1) then
    ibsGraphs.FieldByName('TIME_STOP').AsDateTime := tpStop.Date+1;
   DecodeTime(ibsGraphs.FieldByName('TIME_START').AsDateTime, HourStart, MinStart, MinStart, MinStart);
   DecodeTime(ibsGraphs.FieldByName('TIME_STOP').AsDateTime, HourStop, MinStart, MinStart, MinStart);
   TimeDelta := ibsGraphs.FieldByName('TIME_STOP').AsDateTime-ibsGraphs.FieldByName('TIME_START').AsDateTime;
   WeekDayStart := DayOfWeek(ibsGraphs.FieldByName('TIME_START').AsDateTime);
   For i := 0 to 23 do
    Begin
     If (Frac(ibsGraphs.FieldByName('TIME_STOP').AsDateTime)>Frac(ibsGraphs.FieldByName('TIME_START').AsDateTime)) then
      If (HourStart<=i) and (i<=HourStop) then
       Duration := 24*(Min(Succ(i)/24,Frac(ibsGraphs.FieldByName('TIME_STOP').AsDateTime))-Max(i/24,Frac(ibsGraphs.FieldByName('TIME_START').AsDateTime)))
      else
       Duration := 0
     else
      If (HourStart<=i) and (HourStart<>HourStop) then
       Duration := 24*Abs(Max(i/24,Frac(ibsGraphs.FieldByName('TIME_START').AsDateTime))-Succ(i)/24)
      else
       If (i<=HourStop) and (HourStart<>HourStop) then
        Duration := 24*Abs(i/24-Min(Succ(i)/24,Frac(ibsGraphs.FieldByName('TIME_STOP').AsDateTime)))
       else
        Duration := 0;
     If (ibsGraphs.FieldByName('IN_COUNT').AsInteger=1) then
      TotalTime[i] := TotalTime[i]+Trunc(TimeDelta)+Duration;
     If (pnlClass.Align=alClient) then
      Begin
       If (ibsGraphs.FieldByName('CLASS').AsInteger=ibdsMainClassCLASS.AsInteger) then
        Begin
         If (ibsGraphs.FieldByName('IN_COUNT').AsInteger=1) then
          ClassTime[i] := ClassTime[i]+Trunc(TimeDelta)+Duration;
         If (ibsGraphs.FieldByName('ID').AsInteger=ibdsMainGroupTariffID.AsInteger) then
          TariffTime[i] := (TariffTime[i]+Trunc(TimeDelta)+Duration)
        End
      End
     else
      Begin
       If (ibsGraphs.FieldByName('ID').AsInteger=ibdsMainGroupTariffID.AsInteger) then
        Begin
         TariffTime[i] := TariffTime[i]+Trunc(TimeDelta)+Duration;
         If (ibsGraphs.FieldByName('CLASS').AsInteger=ibdsMainClassCLASS.AsInteger) then
          ClassTime[i] := ClassTime[i]+Trunc(TimeDelta)+Duration
        End
      End
    End;
   If (Trunc(ibsGraphs.FieldByName('TIME_STOP').AsDateTime)=Trunc(ibsGraphs.FieldByName('TIME_START').AsDateTime)) then
    Begin
     If (ibsGraphs.FieldByName('IN_COUNT').AsInteger=1) then
      TotalWeekDay[WeekDayStart] := TotalWeekDay[WeekDayStart]+TimeDelta;
     If (pnlClass.Align=alClient) then
      Begin
       If (ibsGraphs.FieldByName('CLASS').AsInteger=ibdsMainClassCLASS.AsInteger) then
        Begin
         If (ibsGraphs.FieldByName('IN_COUNT').AsInteger=1) then
          ClassWeekDay[WeekDayStart] := ClassWeekDay[WeekDayStart]+TimeDelta;
         If (ibsGraphs.FieldByName('ID').AsInteger=ibdsMainGroupTariffID.AsInteger) then
          TariffWeekDay[WeekDayStart] := TariffWeekDay[WeekDayStart]+TimeDelta
        End
      End
     else
      Begin
       If (ibsGraphs.FieldByName('ID').AsInteger=ibdsMainGroupTariffID.AsInteger) then
        Begin
         TariffWeekDay[WeekDayStart] := TariffWeekDay[WeekDayStart]+TimeDelta;
         If (ibsGraphs.FieldByName('CLASS').AsInteger=ibdsMainClassCLASS.AsInteger) then
          ClassWeekDay[WeekDayStart] := ClassWeekDay[WeekDayStart]+TimeDelta;
        End
      End
    End
   else
    For CurrentDay := Trunc(ibsGraphs.FieldByName('TIME_START').AsDateTime) to Trunc(ibsGraphs.FieldByName('TIME_STOP').AsDateTime) do
     Begin
      Duration := (Min(CurrentDay+1,ibsGraphs.FieldByName('TIME_STOP').AsDateTime)-Max(CurrentDay,ibsGraphs.FieldByName('TIME_START').AsDateTime));
      If (ibsGraphs.FieldByName('IN_COUNT').AsInteger=1) then
       TotalWeekDay[DayOfWeek(CurrentDay)] := TotalWeekDay[DayOfWeek(CurrentDay)]+Duration;
      If (pnlClass.Align=alClient) then
       Begin
        If (ibsGraphs.FieldByName('CLASS').AsInteger=ibdsMainClassCLASS.AsInteger) then
         Begin
          If (ibsGraphs.FieldByName('IN_COUNT').AsInteger=1) then
           ClassWeekDay[DayOfWeek(CurrentDay)] := ClassWeekDay[DayOfWeek(CurrentDay)]+Duration;
         If (ibsGraphs.FieldByName('ID').AsInteger=ibdsMainGroupTariffID.AsInteger) then
          TariffWeekDay[DayOfWeek(CurrentDay)] := TariffWeekDay[DayOfWeek(CurrentDay)]+Duration
        End
      End
     else
      Begin
       If (ibsGraphs.FieldByName('ID').AsInteger=ibdsMainGroupTariffID.AsInteger) then
        Begin
         TariffWeekDay[DayOfWeek(CurrentDay)] := TariffWeekDay[DayOfWeek(CurrentDay)]+Duration;
         If (ibsGraphs.FieldByName('CLASS').AsInteger=ibdsMainClassCLASS.AsInteger) then
          ClassWeekDay[DayOfWeek(CurrentDay)] := ClassWeekDay[DayOfWeek(CurrentDay)]+Duration
        End
      End
     End;
   ibsGraphs.Next
  End;
 ibsGraphs.Close;
 Duration := TotalWeekDay[1];
 For i := 1 to 6 do
  TotalWeekDay[i] := TotalWeekDay[i+1];
 TotalWeekDay[7] := Duration;
 Duration := ClassWeekDay[1];
 For i := 1 to 6 do
  ClassWeekDay[i] := ClassWeekDay[i+1];
 ClassWeekDay[7] := Duration;
 Duration := TariffWeekDay[1];
 For i := 1 to 6 do
  TariffWeekDay[i] := TariffWeekDay[i+1];
 TariffWeekDay[7] := Duration;
 Series1.Clear; LineSeries1.Clear;
 Series2.Clear; LineSeries2.Clear;
 Series3.Clear; LineSeries3.Clear;
 Series4.Clear; LineSeries4.Clear;
 For i := 0 to 23 do
  Begin
   Series1.Add(TotalTime[i]*100/(tpStop.Date+1-tpStart.Date)/NumbComps,FormatFloat('00',i)+':00',Series1.SeriesColor);
   Series3.Add(ClassTime[i]*100/(tpStop.Date+1-tpStart.Date)/NumbComps,FormatFloat('00',i)+':00',Series3.SeriesColor);
   LineSeries1.Add(TotalTime[i]*100/(tpStop.Date+1-tpStart.Date)/NumbComps,FormatFloat('00',i)+':00',Series1.SeriesColor);
   LineSeries3.Add(TariffTime[i]*100/(tpStop.Date+1-tpStart.Date)/NumbComps,FormatFloat('00',i)+':00',Series3.SeriesColor)
  End;
 For i := 1 to 7 do
  Begin
   If (TotalWeekDay[i]<>0) then
    Duration := 24*TotalWeekDay[i]*100/NumbComps/GetWeekDayNumber(i)/seWorkTime.Value
   else
    Duration := 0;
   If (i>1) then
    Series2.Add(Duration,'',Series2.SeriesColor);
   Series2.Add(Duration,RussianWeekDays[i],Series2.SeriesColor);
   If (ClassWeekDay[i]<>0) then
    Duration := 24*ClassWeekDay[i]*100/NumbComps/GetWeekDayNumber(i)/seWorkTime.Value
   else
    Duration := 0;
   If (i>1) then
    Series4.Add(Duration,'',Series4.SeriesColor);
   Series4.Add(Duration,RussianWeekDays[i],Series4.SeriesColor);
   If (TotalWeekDay[i]<>0) then
    Duration := 24*TotalWeekDay[i]*100/NumbComps/GetWeekDayNumber(i)/seWorkTime.Value
   else
    Duration := 0;
   If (i>1) then
    LineSeries2.Add(Duration,'',LineSeries2.SeriesColor);
   LineSeries2.Add(Duration,RussianWeekDays[i],LineSeries2.SeriesColor);
   If (TariffWeekDay[i]<>0) then
    Duration := 24*TariffWeekDay[i]*100/NumbComps/GetWeekDayNumber(i)/seWorkTime.Value
   else
    Duration := 0;
   If (i>1) then
    LineSeries4.Add(Duration,'',LineSeries4.SeriesColor);
   LineSeries4.Add(Duration,RussianWeekDays[i],LineSeries4.SeriesColor)
  End
end;

procedure TfrmMain.GetClass;
 var HourStart, MinStart, HourStop: Word;
     i, WeekDayStart : Integer;
     TimeDelta, Duration : Double;
     CurrentDay : Integer;
begin
 For i := 0 to 23 do
  Begin
   ClassTime[i] := 0;
   If (pnlClass.Align=alClient) then TariffTime[i] := 0
  End;
 For i := 1 to 7 do
  Begin
   ClassWeekDay[i] := 0;
   If (pnlClass.Align=alClient) then TariffWeekDay[i] := 0
  End;
 ibsGraphs.SQL.Clear;
 ibsGraphs.SQL.Add('select O.TIME_START, O.TIME_STOP');
 If (pnlClass.Align=alClient) then
  ibsGraphs.SQL.Add(', T.ID, T.IN_COUNT');
 ibsGraphs.SQL.Add('from ORDERS O, COMPS C, TARIFFS T');
 ibsGraphs.SQL.Add('where (O.TIME_START<'''+FormatDateTime('dd.mm.yyyy',tpStop.Date+1)+
                  ''') and (O.TIME_STOP>='''+FormatDateTime('dd.mm.yyyy',tpStart.Date)+''') and');
 ibsGraphs.SQL.Add('(O.COMP_ID=C.ID) and (O.TARIFF_ID=T.ID) and (C.CLASS='+ibdsMainClassCLASS.AsString+')');
 If (pnlClass.Align<>alClient) then
  ibsGraphs.SQL.Add('and (T.ID='+ibdsMainGroupTariffID.AsString+')');
 ibsGraphs.ExecQuery;
 While NOT (ibsGraphs.Eof) do
  Begin
   If (ibsGraphs.FieldByName('TIME_START').AsDateTime<tpStart.Date) then
    ibsGraphs.FieldByName('TIME_START').AsDateTime := tpStart.Date;
   If (ibsGraphs.FieldByName('TIME_STOP').AsDateTime>tpStop.Date+1) then
    ibsGraphs.FieldByName('TIME_STOP').AsDateTime := tpStop.Date+1;
   DecodeTime(ibsGraphs.FieldByName('TIME_START').AsDateTime, HourStart, MinStart, MinStart, MinStart);
   DecodeTime(ibsGraphs.FieldByName('TIME_STOP').AsDateTime, HourStop, MinStart, MinStart, MinStart);
   TimeDelta := ibsGraphs.FieldByName('TIME_STOP').AsDateTime-ibsGraphs.FieldByName('TIME_START').AsDateTime;
   WeekDayStart := DayOfWeek(ibsGraphs.FieldByName('TIME_START').AsDateTime);
   For i := 0 to 23 do
    Begin
     If (Frac(ibsGraphs.FieldByName('TIME_STOP').AsDateTime)>Frac(ibsGraphs.FieldByName('TIME_START').AsDateTime)) then
      If (HourStart<=i) and (i<=HourStop) then
       Duration := 24*(Min(Succ(i)/24,Frac(ibsGraphs.FieldByName('TIME_STOP').AsDateTime))-Max(i/24,Frac(ibsGraphs.FieldByName('TIME_START').AsDateTime)))
      else
       Duration := 0
     else
      If (HourStart<=i) and (HourStart<>HourStop) then
       Duration := 24*Abs(Max(i/24,Frac(ibsGraphs.FieldByName('TIME_START').AsDateTime))-Succ(i)/24)
      else
       If (i<=HourStop) and (HourStart<>HourStop) then
        Duration := 24*Abs(i/24-Min(Succ(i)/24,Frac(ibsGraphs.FieldByName('TIME_STOP').AsDateTime)))
       else
        Duration := 0;
     If (pnlClass.Align=alClient) then
      Begin
       If (ibsGraphs.FieldByName('IN_COUNT').AsInteger=1) then
        ClassTime[i] := ClassTime[i]+Trunc(TimeDelta)+Duration
      End
     else
      ClassTime[i] := ClassTime[i]+Trunc(TimeDelta)+Duration;
     If (pnlClass.Align=alClient) and (ibsGraphs.FieldByName('ID').AsInteger=ibdsMainGroupTariffID.AsInteger) then
      TariffTime[i] := (TariffTime[i]+Trunc(TimeDelta)+Duration)
    End;
   If (Trunc(ibsGraphs.FieldByName('TIME_STOP').AsDateTime)=Trunc(ibsGraphs.FieldByName('TIME_START').AsDateTime)) then
    Begin
     If (pnlClass.Align=alClient) then
      Begin
       If (ibsGraphs.FieldByName('IN_COUNT').AsInteger=1) then
        ClassWeekDay[WeekDayStart] := ClassWeekDay[WeekDayStart]+TimeDelta
      End
     else
      ClassWeekDay[WeekDayStart] := ClassWeekDay[WeekDayStart]+TimeDelta;
     If (pnlClass.Align=alClient) and (ibsGraphs.FieldByName('ID').AsInteger=ibdsMainGroupTariffID.AsInteger) then
      TariffWeekDay[WeekDayStart] := TariffWeekDay[WeekDayStart]+TimeDelta
    End
   else
    For CurrentDay := Trunc(ibsGraphs.FieldByName('TIME_START').AsDateTime) to Trunc(ibsGraphs.FieldByName('TIME_STOP').AsDateTime) do
     Begin
      Duration := (Min(CurrentDay+1,ibsGraphs.FieldByName('TIME_STOP').AsDateTime)-Max(CurrentDay,ibsGraphs.FieldByName('TIME_START').AsDateTime));
      If (pnlClass.Align=alClient) then
       Begin
        If (ibsGraphs.FieldByName('IN_COUNT').AsInteger=1) then
         ClassWeekDay[DayOfWeek(CurrentDay)] := ClassWeekDay[DayOfWeek(CurrentDay)]+Duration
       End
      else
       ClassWeekDay[DayOfWeek(CurrentDay)] := ClassWeekDay[DayOfWeek(CurrentDay)]+Duration;
      If (pnlClass.Align=alClient) and (ibsGraphs.FieldByName('ID').AsInteger=ibdsMainGroupTariffID.AsInteger) then
       TariffWeekDay[DayOfWeek(CurrentDay)] := TariffWeekDay[DayOfWeek(CurrentDay)]+Duration
     End;
   ibsGraphs.Next
  End;
 ibsGraphs.Close;
 Duration := ClassWeekDay[1];
 For i := 1 to 6 do
  ClassWeekDay[i] := ClassWeekDay[i+1];
 ClassWeekDay[7] := Duration;
 If (pnlClass.Align=alClient) then
  Begin
   Duration := TariffWeekDay[1];
   For i := 1 to 6 do
    TariffWeekDay[i] := TariffWeekDay[i+1];
   TariffWeekDay[7] := Duration
  End; 
 Series3.Clear; 
 Series4.Clear;
 If (pnlClass.Align=alClient) then
  Begin
   LineSeries3.Clear;
   LineSeries4.Clear
  End;
 For i := 0 to 23 do
  Begin
   Series3.Add(ClassTime[i]*100/(tpStop.Date+1-tpStart.Date)/NumbComps,FormatFloat('00',i)+':00',Series3.SeriesColor);
   If (pnlClass.Align=alClient) then
    LineSeries3.Add(TariffTime[i]*100/(tpStop.Date+1-tpStart.Date)/NumbComps,FormatFloat('00',i)+':00',LineSeries3.SeriesColor)
  End;
 For i := 1 to 7 do
  Begin
   If (ClassWeekDay[i]<>0) then
    Duration := 24*ClassWeekDay[i]*100/NumbComps/GetWeekDayNumber(i)/seWorkTime.Value
   else
    Duration := 0;
   If (i>1) then
    Series4.Add(Duration,'',Series4.SeriesColor);
   Series4.Add(Duration,RussianWeekDays[i],Series4.SeriesColor);
   If (pnlClass.Align=alClient) then
    Begin
     If (TariffWeekDay[i]<>0) then
      Duration := 24*TariffWeekDay[i]*100/NumbComps/GetWeekDayNumber(i)/seWorkTime.Value
     else
      Duration := 0;
     If (i>1) then
      LineSeries4.Add(Duration,'',LineSeries4.SeriesColor);
     LineSeries4.Add(Duration,RussianWeekDays[i],LineSeries4.SeriesColor)
    End 
  End
end;

procedure TfrmMain.GetTariff;
 var HourStart, MinStart, HourStop: Word;
     i, WeekDayStart : Integer;
     TimeDelta, Duration : Double;
     CurrentDay : Integer;
begin
 For i := 0 to 23 do
  Begin
   TariffTime[i] := 0;
   If (pnlTariff.Align=alClient) then ClassTime[i] := 0
  End;
 For i := 1 to 7 do
  Begin
   TariffWeekDay[i] := 0;
   If (pnlTariff.Align=alClient) then ClassWeekDay[i] := 0
  End;
 ibsGraphs.SQL.Clear;
 ibsGraphs.SQL.Add('select O.TIME_START, O.TIME_STOP');
 If (pnlTariff.Align=alClient) then
  ibsGraphs.SQL.Add(', C.CLASS');
 ibsGraphs.SQL.Add('from ORDERS O, COMPS C, TARIFFS T');
 ibsGraphs.SQL.Add('where (O.TIME_START<'''+FormatDateTime('dd.mm.yyyy',tpStop.Date+1)+
                  ''') and (O.TIME_STOP>='''+FormatDateTime('dd.mm.yyyy',tpStart.Date)+''') and');
 ibsGraphs.SQL.Add('(O.COMP_ID=C.ID) and (O.TARIFF_ID=T.ID) and (T.ID='+ibdsMainGroupTariffID.AsString+')');
 If (pnlTariff.Align<>alClient) then
  ibsGraphs.SQL.Add('and (C.CLASS='+ibdsMainClassCLASS.AsString+')');
 ibsGraphs.ExecQuery;
 While NOT (ibsGraphs.Eof) do
  Begin
   If (ibsGraphs.FieldByName('TIME_START').AsDateTime<tpStart.Date) then
    ibsGraphs.FieldByName('TIME_START').AsDateTime := tpStart.Date;
   If (ibsGraphs.FieldByName('TIME_STOP').AsDateTime>tpStop.Date+1) then
    ibsGraphs.FieldByName('TIME_STOP').AsDateTime := tpStop.Date+1;
   DecodeTime(ibsGraphs.FieldByName('TIME_START').AsDateTime, HourStart, MinStart, MinStart, MinStart);
   DecodeTime(ibsGraphs.FieldByName('TIME_STOP').AsDateTime, HourStop, MinStart, MinStart, MinStart);
   TimeDelta := ibsGraphs.FieldByName('TIME_STOP').AsDateTime-ibsGraphs.FieldByName('TIME_START').AsDateTime;
   WeekDayStart := DayOfWeek(ibsGraphs.FieldByName('TIME_START').AsDateTime);
   For i := 0 to 23 do
    Begin
     If (Frac(ibsGraphs.FieldByName('TIME_STOP').AsDateTime)>Frac(ibsGraphs.FieldByName('TIME_START').AsDateTime)) then
      If (HourStart<=i) and (i<=HourStop) then
       Duration := 24*(Min(Succ(i)/24,Frac(ibsGraphs.FieldByName('TIME_STOP').AsDateTime))-Max(i/24,Frac(ibsGraphs.FieldByName('TIME_START').AsDateTime)))
      else
       Duration := 0
     else
      If (HourStart<=i) and (HourStart<>HourStop) then
       Duration := 24*Abs(Max(i/24,Frac(ibsGraphs.FieldByName('TIME_START').AsDateTime))-Succ(i)/24)
      else
       If (i<=HourStop) and (HourStart<>HourStop) then
        Duration := 24*Abs(i/24-Min(Succ(i)/24,Frac(ibsGraphs.FieldByName('TIME_STOP').AsDateTime)))
       else
        Duration := 0;
     TariffTime[i] := (TariffTime[i]+Trunc(TimeDelta)+Duration);
     If (pnlTariff.Align=alClient) and (ibsGraphs.FieldByName('CLASS').AsInteger=ibdsMainClassCLASS.AsInteger) then
      ClassTime[i] := ClassTime[i]+Trunc(TimeDelta)+Duration
    End;
   If (Trunc(ibsGraphs.FieldByName('TIME_STOP').AsDateTime)=Trunc(ibsGraphs.FieldByName('TIME_START').AsDateTime)) then
    Begin
     TariffWeekDay[WeekDayStart] := TariffWeekDay[WeekDayStart]+TimeDelta;
     If (pnlTariff.Align=alClient) and (ibsGraphs.FieldByName('CLASS').AsInteger=ibdsMainClassCLASS.AsInteger) then
      ClassWeekDay[WeekDayStart] := ClassWeekDay[WeekDayStart]+TimeDelta
    End
   else
    For CurrentDay := Trunc(ibsGraphs.FieldByName('TIME_START').AsDateTime) to Trunc(ibsGraphs.FieldByName('TIME_STOP').AsDateTime) do
     Begin
      Duration := (Min(CurrentDay+1,ibsGraphs.FieldByName('TIME_STOP').AsDateTime)-Max(CurrentDay,ibsGraphs.FieldByName('TIME_START').AsDateTime));
      TariffWeekDay[DayOfWeek(CurrentDay)] := TariffWeekDay[DayOfWeek(CurrentDay)]+Duration;
      If (pnlTariff.Align=alClient) and (ibsGraphs.FieldByName('CLASS').AsInteger=ibdsMainClassCLASS.AsInteger) then
       ClassWeekDay[DayOfWeek(CurrentDay)] := ClassWeekDay[DayOfWeek(CurrentDay)]+Duration
     End;
   ibsGraphs.Next
  End;
 ibsGraphs.Close;
 Duration := TariffWeekDay[1];
 For i := 1 to 6 do
  TariffWeekDay[i] := TariffWeekDay[i+1];
 TariffWeekDay[7] := Duration;
 If (pnlTariff.Align=alClient) then
  Begin
   Duration := ClassWeekDay[1];
   For i := 1 to 6 do
    ClassWeekDay[i] := ClassWeekDay[i+1];
   ClassWeekDay[7] := Duration
  End;
 LineSeries3.Clear;
 LineSeries4.Clear;
 If (pnlTariff.Align=alClient) then
  Begin
   Series3.Clear;
   Series4.Clear
  End;
 For i := 0 to 23 do
  Begin
   LineSeries3.Add(TariffTime[i]*100/(tpStop.Date+1-tpStart.Date)/NumbComps,FormatFloat('00',i)+':00',LineSeries3.SeriesColor);
   If (pnlTariff.Align=alClient) then
    Series3.Add(ClassTime[i]*100/(tpStop.Date+1-tpStart.Date)/NumbComps,FormatFloat('00',i)+':00',Series3.SeriesColor)
  End;
 For i := 1 to 7 do
  Begin
   If (TariffWeekDay[i]<>0) then
    Duration := 24*TariffWeekDay[i]*100/NumbComps/GetWeekDayNumber(i)/seWorkTime.Value
   else
    Duration := 0;
   If (i>1) then
    LineSeries4.Add(Duration,'',LineSeries4.SeriesColor);
   LineSeries4.Add(Duration,RussianWeekDays[i],LineSeries4.SeriesColor);
   If (pnlTariff.Align=alClient) then
    Begin
     If (ClassWeekDay[i]<>0) then
      Duration := 24*ClassWeekDay[i]*100/NumbComps/GetWeekDayNumber(i)/seWorkTime.Value
     else
      Duration := 0;
     If (i>1) then
      Series4.Add(Duration,'',Series4.SeriesColor);
     Series4.Add(Duration,RussianWeekDays[i],Series4.SeriesColor)
    End
  End
end;

procedure TfrmMain.ibdsMainClassAfterScroll(DataSet: TDataSet);
begin
 If (Chart1.Visible) and (RefreshClass) then
  GetClass;
 RefreshTariff := True
end;

procedure TfrmMain.ibdsMainGroupTariffAfterScroll(DataSet: TDataSet);
begin
 If (pnlChart.Visible) and (RefreshTariff) then
  Begin
   GetTariff;
   GetManyByDate(False)
  End;
 RefreshClass := True
end;

procedure TfrmMain.lblShowTimeMouseEnter(Sender: TObject);
begin
 (Sender as TfcLabel).TextOptions.Style := fclsRaised
end;

procedure TfrmMain.lblShowTimeMouseLeave(Sender: TObject);
begin
 (Sender as TfcLabel).TextOptions.Style := fclsLowered
end;

procedure TfrmMain.lblShowTimeMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 (Sender as TfcLabel).TextOptions.Style := fclsLowered
end;

procedure TfrmMain.lblShowTimeMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 (Sender as TfcLabel).TextOptions.Style := fclsRaised
end;

procedure TfrmMain.lblShowTimeClick(Sender: TObject);
begin
 If ((Sender as TfcLabel).Caption='Обновить') then
  TotalRefreash
 else
  Begin
   pnlTime.Visible := NOT pnlTime.Visible;
   pnlAverage.Visible := NOT pnlAverage.Visible
  End
end;

procedure TfrmMain.ibdsMainGroupTariffIN_COUNTChange(Sender: TField);
begin
 ibdsMainGroupTariff.Post;
 Series1.Clear;
 Series2.Clear;
 LineSeries1.Clear;
 LineSeries2.Clear;
 If (pnlAverage.Visible) then
  Begin
   lblShowTime.Caption := 'Обновить';
   lblShowTime.Hint := 'Обновить графики усредненных величин'
  End
 else
  Begin
   lblShowAverage.Caption := 'Обновить';
   lblShowAverage.Hint := 'Обновить графики зависимости выручки от даты'
  End
end;

procedure TfrmMain.TotalRefreash;
begin
 lblShowTime.Caption := 'Показать зависимость от времени';
 lblShowTime.Hint := 'Показать графики зависимости выручки от даты';
 lblShowAverage.Caption := 'Показать усредненные величины';
 lblShowAverage.Hint := 'Показать графики усредненных величин';
 GetTotals
end;

procedure TfrmMain.dbgTariffCalcCellColors(Sender: TObject; Field: TField;
  State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
 If (ibdsMainGroupTariffIN_COUNT.AsInteger=0) then
  ABrush.Color := clSilver
end;

procedure TfrmMain.GetManyByDate(Total:Boolean);
 var CurrentDate : TDate;
begin
 If (Total) then
  Begin
   LineSeries5.Clear;
   Series5.Clear;
   ibsGraphs.SQL.Clear;
   ibsGraphs.SQL.Add('select sum(O.PRICE) MANY_AMOUNT, O.DATE_START');
   ibsGraphs.SQL.Add('from ORDERS O');
   ibsGraphs.SQL.Add('where (O.TIME_START<'''+FormatDateTime('dd.mm.yyyy',tpStop.Date+1)+
                  ''') and (O.TIME_START>='''+FormatDateTime('dd.mm.yyyy',tpStart.Date)+''')');
   ibsGraphs.SQL.Add('group by O.DATE_START');
   ibsGraphs.ExecQuery;
   CurrentDate := tpStart.Date;
   While NOT (ibsGraphs.Eof) do
    Begin
     While (CurrentDate<ibsGraphs.FieldByName('DATE_START').AsDate) do
      Begin
       LineSeries5.Add(0,FormatDateTime('dd.mm',CurrentDate),LineSeries5.SeriesColor);
       Series5.Add(0,FormatDateTime('dd.mm',CurrentDate),Series5.SeriesColor);
       CurrentDate := CurrentDate+1
      End;
     LineSeries5.Add(ibsGraphs.FieldByName('MANY_AMOUNT').AsDouble,FormatDateTime('dd.mm',CurrentDate),LineSeries5.SeriesColor);
     Series5.Add(ibsGraphs.FieldByName('MANY_AMOUNT').AsDouble,FormatDateTime('dd.mm',CurrentDate),Series5.SeriesColor);
     CurrentDate := CurrentDate+1;
     ibsGraphs.Next
    End;
   ibsGraphs.Close;
   While (CurrentDate<tpStop.Date+1) do
    Begin
     CurrentDate := CurrentDate+1;
     LineSeries5.Add(0,FormatDateTime('dd.mm',CurrentDate),LineSeries5.SeriesColor);
     Series5.Add(0,FormatDateTime('dd.mm',CurrentDate),Series5.SeriesColor);
    End
  End;
 LineSeries7.Clear;
 Series6.Clear;
 ibsGraphs.SQL.Clear;
 ibsGraphs.SQL.Add('select sum(O.PRICE) MANY_AMOUNT, O.DATE_START');
 ibsGraphs.SQL.Add('from ORDERS O');
 ibsGraphs.SQL.Add('where (O.TIME_START<'''+FormatDateTime('dd.mm.yyyy',tpStop.Date+1)+
                 ''') and (O.TIME_START>='''+FormatDateTime('dd.mm.yyyy',tpStart.Date)+''')');
 ibsGraphs.SQL.Add('and (O.TARIFF_ID='+ibdsMainGroupTariffID.AsString+')');
 ibsGraphs.SQL.Add('group by O.DATE_START');
 ibsGraphs.ExecQuery;
 CurrentDate := tpStart.Date;
 While NOT (ibsGraphs.Eof) do
  Begin
   While (CurrentDate<ibsGraphs.FieldByName('DATE_START').AsDate) do
    Begin
     LineSeries7.Add(0,FormatDateTime('dd.mm',CurrentDate),LineSeries7.SeriesColor);
     Series6.Add(0,FormatDateTime('dd.mm',CurrentDate),Series6.SeriesColor);
     CurrentDate := CurrentDate+1
    End;
   LineSeries7.Add(ibsGraphs.FieldByName('MANY_AMOUNT').AsDouble,FormatDateTime('dd.mm',CurrentDate),LineSeries7.SeriesColor);
   Series6.Add(ibsGraphs.FieldByName('MANY_AMOUNT').AsDouble,FormatDateTime('dd.mm',CurrentDate),Series6.SeriesColor);
   CurrentDate := CurrentDate+1;
   ibsGraphs.Next
  End;
 ibsGraphs.Close;
 While (CurrentDate<tpStop.Date+1) do
  Begin
   CurrentDate := CurrentDate+1;
   LineSeries7.Add(0,FormatDateTime('dd.mm',CurrentDate),LineSeries7.SeriesColor);
   Series6.Add(0,FormatDateTime('dd.mm',CurrentDate),Series6.SeriesColor)
  End
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
 If (ShowByTariff) then
  Begin
   sbTariff.Down := True;
   sbTariff.Click;
   ShowByTariff := False
  End 
end;

procedure TfrmMain.Chart3Resize(Sender: TObject);
begin
 lblLines.Left := Trunc(Chart3.Width/2)-lblLines.Width-5;
 lblBars.Left := Trunc(Chart3.Width/2)+5
end;

procedure TfrmMain.lblLinesClick(Sender: TObject);
begin
 If ((Sender as TfcLabel).TextOptions.Style=fclsRaised) then
  Begin
   If (lblLines.TextOptions.Style=fclsRaised) then
    lblLines.TextOptions.Style := fclsLowered
   else
    lblLines.TextOptions.Style := fclsRaised;
   If (lblBars.TextOptions.Style=fclsRaised) then
    lblBars.TextOptions.Style := fclsLowered
   else
    lblBars.TextOptions.Style := fclsRaised;
   Series5.Active := (lblBars.TextOptions.Style=fclsLowered);
   Series6.Active := (lblBars.TextOptions.Style=fclsLowered);
   LineSeries5.Active := (lblLines.TextOptions.Style=fclsLowered);
   LineSeries7.Active := (lblLines.TextOptions.Style=fclsLowered)
  End
end;

procedure TfrmMain.sbPrintLineClick(Sender: TObject);
begin
 If (GetKeyState(VK_CONTROL)<0) then
  Begin
   opdRep.Title := 'Выбор шаблона отчета.';
   opdRep.InitialDir := ExtractFilePath(Application.ExeName);
   If (opdRep.Execute) then
    frReport1.LoadFromFile(opdRep.FileName)
   else
    Exit
  End;
 frReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+'Default.frf');
 try
  ibdsMainGroupTariff.DisableControls;
  ibdsMainGroupTariff.Filtered := True;
  frReport1.Dictionary.Variables['Дата начала'] := tpStart.Date;
  frReport1.Dictionary.Variables['Дата окончания'] := tpStop.Date;
  frReport1.ShowReport
 finally
  ibdsMainGroupTariff.EnableControls;
  ibdsMainGroupTariff.Filtered := False
 end
end;

procedure TfrmMain.frReport1BeforePrint(Memo: TStringList; View: TfrView);
var k : Integer;
    X,Y : String;
begin
  If (View.Name='chrtBars') then
   Begin
    Memo.Clear;
    X := ''; Y := '';
    For k := 0 to Pred(Series5.Count) do
     X := X+Series5.XLabel[k]+';';
    X := Copy(X,1,Pred(Length(X)));
    For k := 0 to Pred(Series5.Count) do
     Y := Y+FloatToStr(Series5.YValues[k])+';';
    Y := Copy(Y,1,Pred(Length(Y)));
    Memo.Add(X);
    Memo.Add(Y)
   End;
  If (View.Name='MemoSumProcent') then
   Begin
    Memo.Clear;
    Memo.Add(dbgTariff.ColumnByName('Percentage').FooterValue)
   End
end;

procedure TfrmMain.ibdsMainGroupTariffFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
 If (Dataset['IN_COUNT']=0) then
  Accept := False
end;

procedure TfrmMain.ibdsEncashmentBeforeOpen(DataSet: TDataSet);
begin
 ibdsEncashment.ParamByName('Start').AsDate := tpStart.Date;
 ibdsEncashment.ParamByName('Stop').AsDate := tpStop.Date+1
end;

procedure TfrmMain.wwDBGrid1UpdateFooter(Sender: TObject);
begin
 ibsAux.SQL.Clear;
 ibsAux.SQL.Add('select SUM(E.AMOUNT) AMOUNT from ENCASHMENT E ');
 ibsAux.SQL.Add('where (E.CREATE_TIME>'''+FormatDateTime('dd.mm.yyyy',tpStart.Date)+''') and (E.CREATE_TIME<'''+FormatDateTime('dd.mm.yyyy',tpStop.Date+1)+''')');
 ibsAux.ExecQuery;
 wwDBGrid1.ColumnByName('AMOUNT').FooterValue:=FormatFloat('#,##0.00',ibsAux.FieldByName('AMOUNT').AsDouble);
 ibsAux.Close
end;

procedure TfrmMain.ibdsLogUnorderBeforeOpen(DataSet: TDataSet);
begin
 ibdsLogUnorder.ParamByName('Start').AsDate := tpStart.Date;
 ibdsLogUnorder.ParamByName('Stop').AsDate := tpStop.Date+1
end;

procedure TfrmMain.PageControl2Change(Sender: TObject);
begin
 ibdsLogUnorder.Active := (PageControl2.ActivePage=tsLogUnorder);
 ibdsLogComps.Active := (PageControl2.ActivePage=tsLogComps);
 ibdsLogTariffs.Active := (PageControl2.ActivePage=tsLogTariffs)
end;

procedure TfrmMain.ibdsLogCompsBeforeOpen(DataSet: TDataSet);
begin
 ibdsLogComps.ParamByName('Start').AsDate := tpStart.Date;
 ibdsLogComps.ParamByName('Stop').AsDate := tpStop.Date+1
end;

procedure TfrmMain.ibdsLogTariffsBeforeOpen(DataSet: TDataSet);
begin
 ibdsLogTariffs.ParamByName('Start').AsDate := tpStart.Date;
 ibdsLogTariffs.ParamByName('Stop').AsDate := tpStop.Date+1
end;

procedure TfrmMain.ibdsLogUnorderCalcFields(DataSet: TDataSet);
begin
 If (ibdsLogUnorderTIME_STOP.AsFloat-ibdsLogUnorderTIME_START.AsFloat>=1) then
  ibdsLogUnorderDELTATIME.Value := IntToStr(Trunc(ibdsLogUnorderTIME_STOP.AsFloat-ibdsLogUnorderTIME_START.AsFloat))+'сут. ';
 If (Frac(ibdsLogUnorderTIME_STOP.Value-ibdsLogUnorderTIME_START.Value)>0) then
  ibdsLogUnorderDELTATIME.Value := ibdsLogUnorderDELTATIME.Value+FormatDateTime('hhч. nn м. ',Frac(ibdsLogUnorderTIME_STOP.AsFloat-ibdsLogUnorderTIME_START.AsFloat))
end;

procedure TfrmMain.dbgClassCalcTitleAttributes(Sender: TObject;
  AFieldName: String; AFont: TFont; ABrush: TBrush;
  var ATitleAlignment: TAlignment);
begin
  Case (Sender as TComponent).Tag of
   0: wwDBGridCalcTitleAttributes(Sender, AFieldName, AFieldName, AFont, ABrush, ATitleAlignment, OrderByClass);
   1: wwDBGridCalcTitleAttributes(Sender, AFieldName, AFieldName, AFont, ABrush, ATitleAlignment, OrderByTariff);
   2: wwDBGridCalcTitleAttributes(Sender, AFieldName, AFieldName, AFont, ABrush, ATitleAlignment, OrderByMainComps);
   3: wwDBGridCalcTitleAttributes(Sender, AFieldName, AFieldName, AFont, ABrush, ATitleAlignment, OrderByMainTariffs);
   4: wwDBGridCalcTitleAttributes(Sender, AFieldName, AFieldName, AFont, ABrush, ATitleAlignment, OrderByEncashment);
   5: wwDBGridCalcTitleAttributes(Sender, AFieldName, AFieldName, AFont, ABrush, ATitleAlignment, OrderByCompProg);
   6: wwDBGridCalcTitleAttributes(Sender, AFieldName, AFieldName, AFont, ABrush, ATitleAlignment, OrderByMainProg);
   7: wwDBGridCalcTitleAttributes(Sender, AFieldName, AFieldName, AFont, ABrush, ATitleAlignment, OrderByLogUnorder);
   8: wwDBGridCalcTitleAttributes(Sender, AFieldName, AFieldName, AFont, ABrush, ATitleAlignment, OrderByLogComps);
   9: wwDBGridCalcTitleAttributes(Sender, AFieldName, AFieldName, AFont, ABrush, ATitleAlignment, OrderByLogTariffs);
 end
end;

procedure TfrmMain.wwDBGridCalcTitleAttributes(Sender: TObject;
  AFieldName, AFieldNameReal: String; AFont: TFont; ABrush: TBrush;
  var ATitleAlignment: TAlignment; OrderBy: String);
 var FieldPosRes, Number : String;
begin
 FieldPosRes := FieldPos(AFieldNameReal,((Sender as TwwDBGrid).DataSource.DataSet as TIBDataSet).SelectSQL);
 Number := FieldPosNumber(FieldPosRes, OrderBy);
 If (((Sender as TwwDBGrid).DataSource.DataSet as TIBDataSet).Active) and
     (Pos(' '+FieldPosRes+' ',OrderBy)>0) then
  Begin
   If ((Sender as TwwDBGrid).UseTFields) then
    Begin
     If (Number='') or (Copy(((Sender as TwwDBGrid).DataSource.DataSet as TIBDataSet).FieldByName(AFieldName).DisplayLabel,1,Length(Number))<>Number) then
      Begin
       If (Pos(': ',((Sender as TwwDBGrid).DataSource.DataSet as TIBDataSet).FieldByName(AFieldName).DisplayLabel)>0) then
        ((Sender as TwwDBGrid).DataSource.DataSet as TIBDataSet).FieldByName(AFieldName).DisplayLabel := Copy(((Sender as TwwDBGrid).DataSource.DataSet as TIBDataSet).FieldByName(AFieldName).DisplayLabel,Pos(': ',((Sender as TwwDBGrid).DataSource.DataSet as TIBDataSet).FieldByName(AFieldName).DisplayLabel)+2,Length(((Sender as TwwDBGrid).DataSource.DataSet as TIBDataSet).FieldByName(AFieldName).DisplayLabel)-Pos(': ',((Sender as TwwDBGrid).DataSource.DataSet as TIBDataSet).FieldByName(AFieldName).DisplayLabel)-1);
       If (Number<>'') then
        ((Sender as TwwDBGrid).DataSource.DataSet as TIBDataSet).FieldByName(AFieldName).DisplayLabel := Number+((Sender as TwwDBGrid).DataSource.DataSet as TIBDataSet).FieldByName(AFieldName).DisplayLabel
      End
    End
   else
    If (Number='') or (Copy((Sender as TwwDBGrid).ColumnByName(AFieldName).DisplayLabel,1,Length(Number))<>Number) then
     Begin
      If (Pos(': ',(Sender as TwwDBGrid).ColumnByName(AFieldName).DisplayLabel)>0) then
       (Sender as TwwDBGrid).ColumnByName(AFieldName).DisplayLabel := Copy((Sender as TwwDBGrid).ColumnByName(AFieldName).DisplayLabel,Pos(': ',(Sender as TwwDBGrid).ColumnByName(AFieldName).DisplayLabel)+2,Length((Sender as TwwDBGrid).ColumnByName(AFieldName).DisplayLabel)-Pos(': ',(Sender as TwwDBGrid).ColumnByName(AFieldName).DisplayLabel)-1);
      If (Number<>'') then
       (Sender as TwwDBGrid).ColumnByName(AFieldName).DisplayLabel := Number+(Sender as TwwDBGrid).ColumnByName(AFieldName).DisplayLabel
     End
  End
 else
  If (Pos(': ',(Sender as TwwDBGrid).ColumnByName(AFieldName).DisplayLabel)>0) then
   Begin
     If ((Sender as TwwDBGrid).UseTFields) then
      ((Sender as TwwDBGrid).DataSource.DataSet as TIBDataSet).FieldByName(AFieldName).DisplayLabel := Copy(((Sender as TwwDBGrid).DataSource.DataSet as TIBDataSet).FieldByName(AFieldName).DisplayLabel,Pos(': ',((Sender as TwwDBGrid).DataSource.DataSet as TIBDataSet).FieldByName(AFieldName).DisplayLabel)+2,Length(((Sender as TwwDBGrid).DataSource.DataSet as TIBDataSet).FieldByName(AFieldName).DisplayLabel)-Pos(': ',((Sender as TwwDBGrid).DataSource.DataSet as TIBDataSet).FieldByName(AFieldName).DisplayLabel)-1)
     else
      (Sender as TwwDBGrid).ColumnByName(AFieldName).DisplayLabel := Copy((Sender as TwwDBGrid).ColumnByName(AFieldName).DisplayLabel,Pos(': ',(Sender as TwwDBGrid).ColumnByName(AFieldName).DisplayLabel)+2,Length((Sender as TwwDBGrid).ColumnByName(AFieldName).DisplayLabel)-Pos(': ',(Sender as TwwDBGrid).ColumnByName(AFieldName).DisplayLabel)-1)
   End
end;

procedure TfrmMain.tpStartCloseUp(Sender: TObject);
begin
 ibdsEncashment.Active := (PageControl1.ActivePage=tsEncashment);
 If PageControl1.ActivePage=tsLogs then
  Begin
   ibdsLogUnorder.Active := (PageControl2.ActivePage=tsLogUnorder);
   ibdsLogComps.Active := (PageControl2.ActivePage=tsLogComps);
   ibdsLogTariffs.Active := (PageControl2.ActivePage=tsLogTariffs);
  End;
end;

end.
