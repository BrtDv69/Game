unit Main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, ComCtrls, ToolWin, ImgList, Grids, Wwdbigrd, Wwdbgrid,
  Mask, wwdbedit, Buttons, Db, IBCustomDataSet, IBDatabase, IBSQL, DateUtil,
  fcStatusBar, HyperStr, ScktComp, Menus, HyperFrm, Psock, IBServices,
  LZRW1, ShellApi, NMsmtp, Series, fcLabel, Registry, Math, wwdblook,
  DBCtrls, ExtDlgs, NMMSG, WinSock;

type
 TObjProcedure = procedure of object;

type
  TfrmMain = class(TForm)
    PageControl1: TPageControl;
    tsMain: TTabSheet;
    tsComps: TTabSheet;
    tsTariffs: TTabSheet;
    Panel4: TPanel;
    sbCancelComps: TSpeedButton;
    sbApplyComps: TSpeedButton;
    sbDeleteComps: TSpeedButton;
    sbAddComps: TSpeedButton;
    SpeedButton10: TSpeedButton;
    Panel1: TPanel;
    sbDec: TSpeedButton;
    sbInc: TSpeedButton;
    SpeedButton12: TSpeedButton;
    Panel6: TPanel;
    wwDBEdit2: TwwDBEdit;
    wwDBGrid4: TwwDBGrid;
    Panel7: TPanel;
    sbCancelTariffs: TSpeedButton;
    sbApplyTariffs: TSpeedButton;
    sbDeleteTariffs: TSpeedButton;
    sbAddTariffs: TSpeedButton;
    SpeedButton16: TSpeedButton;
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
    ibsGen_ID: TIBSQL;
    ibdsMainTariffs: TIBDataSet;
    dsMainTariffs: TDataSource;
    ibdsMainTariffsID: TIntegerField;
    ibdsMainTariffsNAME: TIBStringField;
    ibdsMainTariffsPRICE: TFloatField;
    ibdsMainTariffsVALID: TIntegerField;
    ibdsMainTariffsCOMMENTS: TIBStringField;
    ibdsFreeComps: TIBDataSet;
    dsFreeComps: TDataSource;
    dsWorks: TDataSource;
    ibdsFreeCompsID: TIntegerField;
    ibdsFreeCompsNUMBER: TIBStringField;
    ibdsFreeCompsCLASS: TIntegerField;
    ibdsFreeCompsDESCRIPTION: TIBStringField;
    ibdsFreeCompsCOMMENTS: TIBStringField;
    SpeedButton5: TSpeedButton;
    sbFreeComp: TSpeedButton;
    Timer1: TTimer;
    fcStatusBar1: TfcStatusBar;
    ibdsMainCompsNETWORK_NAME: TIBStringField;
    ibdsMainCompsIP_ADDRESS: TIBStringField;
    ibdsMainTariffsI_SPEED: TIntegerField;
    ibdsFreeCompsIP_ADDRESS: TIBStringField;
    psMain: TPowersock;
    ibBS: TIBBackupService;
    SpeedButton1: TSpeedButton;
    NMSMTP1: TNMSMTP;
    tsProg: TTabSheet;
    Panel3: TPanel;
    sbCancelProg: TSpeedButton;
    sbApplyProg: TSpeedButton;
    sbDeleteProg: TSpeedButton;
    sbAddProg: TSpeedButton;
    SpeedButton7: TSpeedButton;
    Panel8: TPanel;
    Splitter1: TSplitter;
    wwdbgComps: TwwDBGrid;
    wwdbgCompsIButton: TwwIButton;
    wwdbgProgOfComps: TwwDBGrid;
    DBImage1: TDBImage;
    wwdblcComps: TwwDBLookupCombo;
    ibdsMainProg: TIBDataSet;
    ibdsMainProgNAME: TIBStringField;
    ibdsMainProgPATH: TIBStringField;
    ibdsMainProgICON: TBlobField;
    ibdsMainProgID_PROG: TIntegerField;
    ibdsMainProgHASH: TIntegerField;
    ibdsMainProgNUM_OF_COMPS: TIntegerField;
    dsMainProg: TDataSource;
    nmmsgSendMsg: TNMMsg;
    ibdsCompProg: TIBDataSet;
    ibdsCompProgNUMBER: TIBStringField;
    ibdsCompProgID_PROG: TIntegerField;
    ibdsCompProgDESCRIPTION: TIBStringField;
    ibdsCompProgNETWORK_NAME: TIBStringField;
    ibdsCompProgID: TIntegerField;
    dsCompProg: TDataSource;
    opdIcon: TOpenPictureDialog;
    ibdsCustomComps: TIBDataSet;
    ibdsCustomCompsNUMBER: TIBStringField;
    ibdsCustomCompsNETWORK_NAME: TIBStringField;
    ibdsCustomCompsDESCRIPTION: TIBStringField;
    ibdsCustomCompsID: TIntegerField;
    ibsGetID: TIBSQL;
    ibsAddAllComps: TIBSQL;
    tmPing: TTimer;
    ImageList1: TImageList;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N2: TMenuItem;
    NShutDown: TMenuItem;
    NReset: TMenuItem;
    NLockUnLock: TMenuItem;
    Panel2: TPanel;
    Splitter2: TSplitter;
    wwdbgFreeComps: TwwDBGrid;
    wwDBGrid1: TwwDBGrid;
    Panel5: TPanel;
    wwDBEdit1: TwwDBEdit;
    wwDBGrid3: TwwDBGrid;
    wwDBGrid3IButton: TwwIButton;
    wwDBEdit3: TwwDBEdit;
    ibdsWorks: TIBDataSet;
    ibdsWorksNUMBER: TIBStringField;
    ibdsWorksCLASS: TIntegerField;
    ibdsWorksDESCRIPTION: TIBStringField;
    ibdsWorksNAME: TIBStringField;
    ibdsWorksI_SPEED: TIntegerField;
    ibdsWorksTIME_REMAIN: TDateTimeField;
    ibdsWorksTIME_STOP: TDateTimeField;
    ibdsWorksCOMMENTS: TIBStringField;
    ibdsWorksTIME_START: TDateTimeField;
    ibdsWorksID: TIntegerField;
    ibdsWorksCOMP_ID: TIntegerField;
    ibdsWorksTARIFF_ID: TIntegerField;
    ibdsWorksPRICE: TFloatField;
    ibdsWorksIP_ADDRESS: TIBStringField;
    ibdsWorksCHECKED: TIntegerField;
    ibdsWorksLOCKED: TSmallintField;
    ibdsWorksINTERFACE: TSmallintField;
    ibdsWorksINTERFACETYPE: TStringField;
    lzrw: Tlzrw1;
    procedure wwDBGrid3KeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure ibdsMainCompsAfterScroll(DataSet: TDataSet);
    procedure sbDeleteCompsClick(Sender: TObject);
    procedure sbAddCompsClick(Sender: TObject);
    procedure sbCancelCompsClick(Sender: TObject);
    procedure sbApplyCompsClick(Sender: TObject);
    procedure dsMainCompsStateChange(Sender: TObject);
    procedure wwDBGrid3CalcTitleImage(Sender: TObject; Field: TField;
      var TitleImageAttributes: TwwTitleImageAttributes);
    procedure wwDBGrid3CreateHintWindow(Sender: TObject;
      HintWindow: TwwGridHintWindow; AField: TField; R: TRect;
      var WordWrap: Boolean; var MaxWidth, MaxHeight: Integer;
      var DoDefault: Boolean);
    procedure wwDBGrid3TitleButtonClick(Sender: TObject;
      AFieldName: String);
    procedure PageControl1Change(Sender: TObject);
    procedure ibdsMainCompsNewRecord(DataSet: TDataSet);
    procedure ibdsMainTariffsAfterScroll(DataSet: TDataSet);
    procedure ibdsMainTariffsNewRecord(DataSet: TDataSet);
    procedure sbDeleteTariffsClick(Sender: TObject);
    procedure sbAddTariffsClick(Sender: TObject);
    procedure sbCancelTariffsClick(Sender: TObject);
    procedure sbApplyTariffsClick(Sender: TObject);
    procedure ibdsWorksCalcFields(DataSet: TDataSet);
    procedure SpeedButton5Click(Sender: TObject);
    procedure sbDecClick(Sender: TObject);
    procedure sbIncClick(Sender: TObject);
    procedure sbFreeCompClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure ibdsWorksAfterOpen(DataSet: TDataSet);
    procedure N1Click(Sender: TObject);
    procedure psMainConnect(Sender: TObject);
    procedure psMainDisconnect(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure NMSMTP1Success(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure wwDBGrid1CalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure sbApplyProgClick(Sender: TObject);
    procedure sbDeleteProgClick(Sender: TObject);
    procedure sbAddProgClick(Sender: TObject);
    procedure wwdblcCompsBeforeDropDown(Sender: TObject);
    procedure DBImage1DblClick(Sender: TObject);
    procedure ibdsMainProgAfterScroll(DataSet: TDataSet);
    procedure wwdbgProgOfCompsCalcCellColors(Sender: TObject;
      Field: TField; State: TGridDrawState; Highlight: Boolean;
      AFont: TFont; ABrush: TBrush);
    procedure ibdsMainProgNAMEChange(Sender: TField);
    procedure ibdsMainProgPATHChange(Sender: TField);
    procedure ibdsCompProgNewRecord(DataSet: TDataSet);
    procedure wwdbgCompsIButtonClick(Sender: TObject);
    procedure NShutDownClick(Sender: TObject);
    procedure NResetClick(Sender: TObject);
    procedure NLockUnLockClick(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure wwdbgCompsExit(Sender: TObject);
    procedure ibdsMainProgNewRecord(DataSet: TDataSet);
    procedure wwdblcCompsCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure wwdbgCompsEnter(Sender: TObject);
    procedure tmPingTimer(Sender: TObject);
    procedure wwDBGrid1CalcTitleAttributes(Sender: TObject;
      AFieldName: String; AFont: TFont; ABrush: TBrush;
      var ATitleAlignment: TAlignment);
    procedure wwdbgProgOfCompsEnter(Sender: TObject);
    procedure GetHashValue;
    procedure AddAllComps;
    procedure SelectAllEnabDisab;
    procedure wwDBGridCalcTitleAttributes(Sender: TObject; AFieldName, AFieldNameReal: String; AFont: TFont; ABrush: TBrush;
                                                var ATitleAlignment: TAlignment; OrderBy: String);
    procedure N4Click(Sender: TObject);
    procedure sbCancelProgClick(Sender: TObject);
    procedure ibdsFreeCompsAfterOpen(DataSet: TDataSet);
    procedure wwdbgCompsKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure StteChange(Suf: String; Enabled: Boolean);
    procedure GenerateSelectMainComps;
    procedure GenerateSelectMainTariffs;
    procedure GenerateSelectMainWorks;
    procedure GenerateSelectMainFreeComps;
    procedure wmSysCommand(var Message:TMessage); message WM_SYSCOMMAND;
    procedure GenerateSelectCompProg;
    procedure GenerateSelectMainProg;

  public
    { Public declarations }
    Stream : TMemoryStream;
    procedure DataSetsOpen;
    function CRC(var Stream : TMemoryStream):LongInt;
  end;

const
  ID_ABOUT = WM_USER+1;
  ID_SETUP = WM_USER+2;
  ID_CONNECT = WM_USER+3;
  ID_ENCASHMENT = WM_USER+4;
  ID_INFO = WM_USER+5;
  CRC32tab : array[0..255] of Integer = (
            $00000000, $77073096, $ee0e612c, $990951ba, $076dc419, $706af48f,
            $e963a535, $9e6495a3, $0edb8832, $79dcb8a4, $e0d5e91e, $97d2d988,
            $09b64c2b, $7eb17cbd, $e7b82d07, $90bf1d91, $1db71064, $6ab020f2,
            $f3b97148, $84be41de, $1adad47d, $6ddde4eb, $f4d4b551, $83d385c7,
            $136c9856, $646ba8c0, $fd62f97a, $8a65c9ec, $14015c4f, $63066cd9,
            $fa0f3d63, $8d080df5, $3b6e20c8, $4c69105e, $d56041e4, $a2677172,
            $3c03e4d1, $4b04d447, $d20d85fd, $a50ab56b, $35b5a8fa, $42b2986c,
            $dbbbc9d6, $acbcf940, $32d86ce3, $45df5c75, $dcd60dcf, $abd13d59,
            $26d930ac, $51de003a, $c8d75180, $bfd06116, $21b4f4b5, $56b3c423,
            $cfba9599, $b8bda50f, $2802b89e, $5f058808, $c60cd9b2, $b10be924,
            $2f6f7c87, $58684c11, $c1611dab, $b6662d3d, $76dc4190, $01db7106,
            $98d220bc, $efd5102a, $71b18589, $06b6b51f, $9fbfe4a5, $e8b8d433,
            $7807c9a2, $0f00f934, $9609a88e, $e10e9818, $7f6a0dbb, $086d3d2d,
            $91646c97, $e6635c01, $6b6b51f4, $1c6c6162, $856530d8, $f262004e,
            $6c0695ed, $1b01a57b, $8208f4c1, $f50fc457, $65b0d9c6, $12b7e950,
            $8bbeb8ea, $fcb9887c, $62dd1ddf, $15da2d49, $8cd37cf3, $fbd44c65,
            $4db26158, $3ab551ce, $a3bc0074, $d4bb30e2, $4adfa541, $3dd895d7,
            $a4d1c46d, $d3d6f4fb, $4369e96a, $346ed9fc, $ad678846, $da60b8d0,
            $44042d73, $33031de5, $aa0a4c5f, $dd0d7cc9, $5005713c, $270241aa,
            $be0b1010, $c90c2086, $5768b525, $206f85b3, $b966d409, $ce61e49f,
            $5edef90e, $29d9c998, $b0d09822, $c7d7a8b4, $59b33d17, $2eb40d81,
            $b7bd5c3b, $c0ba6cad, $edb88320, $9abfb3b6, $03b6e20c, $74b1d29a,
            $ead54739, $9dd277af, $04db2615, $73dc1683, $e3630b12, $94643b84,
            $0d6d6a3e, $7a6a5aa8, $e40ecf0b, $9309ff9d, $0a00ae27, $7d079eb1,
            $f00f9344, $8708a3d2, $1e01f268, $6906c2fe, $f762575d, $806567cb,
            $196c3671, $6e6b06e7, $fed41b76, $89d32be0, $10da7a5a, $67dd4acc,
            $f9b9df6f, $8ebeeff9, $17b7be43, $60b08ed5, $d6d6a3e8, $a1d1937e,
            $38d8c2c4, $4fdff252, $d1bb67f1, $a6bc5767, $3fb506dd, $48b2364b,
            $d80d2bda, $af0a1b4c, $36034af6, $41047a60, $df60efc3, $a867df55,
            $316e8eef, $4669be79, $cb61b38c, $bc66831a, $256fd2a0, $5268e236,
            $cc0c7795, $bb0b4703, $220216b9, $5505262f, $c5ba3bbe, $b2bd0b28,
            $2bb45a92, $5cb36a04, $c2d7ffa7, $b5d0cf31, $2cd99e8b, $5bdeae1d,
            $9b64c2b0, $ec63f226, $756aa39c, $026d930a, $9c0906a9, $eb0e363f,
            $72076785, $05005713, $95bf4a82, $e2b87a14, $7bb12bae, $0cb61b38,
            $92d28e9b, $e5d5be0d, $7cdcefb7, $0bdbdf21, $86d3d2d4, $f1d4e242,
            $68ddb3f8, $1fda836e, $81be16cd, $f6b9265b, $6fb077e1, $18b74777,
            $88085ae6, $ff0f6a70, $66063bca, $11010b5c, $8f659eff, $f862ae69,
            $616bffd3, $166ccf45, $a00ae278, $d70dd2ee, $4e048354, $3903b3c2,
            $a7672661, $d06016f7, $4969474d, $3e6e77db, $aed16a4a, $d9d65adc,
            $40df0b66, $37d83bf0, $a9bcae53, $debb9ec5, $47b2cf7f, $30b5ffe9,
            $bdbdf21c, $cabac28a, $53b39330, $24b4a3a6, $bad03605, $cdd70693,
            $54de5729, $23d967bf, $b3667a2e, $c4614ab8, $5d681b02, $2a6f2b94,
            $b40bbe37, $c30c8ea1, $5a05df1b, $2d02ef8d  );

var
  CurrencyDecimals : Integer;
  frmMain: TfrmMain;
  tc : Cardinal;
  Connected : Boolean = False;
implementation

uses NewOrder, AtEnd, SetUp, AddRemove, TransferWork, Encashment, Intro;

{$R *.DFM}
{$L C:\GUARDANT\API\STEALTH\LIB\NVSK32WD.OBJ}

type
    ip_option_information = record  // Информация заголовка IP (Наполнение 
				    // этой структуры и формат полей описан в RFC791.
        Ttl : u_char;		    // Время жизни (используется traceroute-ом)
        Tos : u_char;          	    // Тип обслуживания, обычно 0
        Flags : u_char; 		    // Флаги заголовка IP, обычно 0
        OptionsSize : u_char;		// Размер данных в заголовке, обычно 0, максимум 40
        OptionsData : PChar;		// Указатель на данные
    end;


    icmp_echo_reply = record
        Address : DWORD; 	    	 // Адрес отвечающего
        Status : u_long;	    	 // IP_STATUS (см. ниже)
        RTTime : u_long;	    	 // Время между эхо-запросом и эхо-ответом 
				         // в миллисекундах
        DataSize : u_short; 	   	 // Размер возвращенных данных
        Reserved : u_short; 	   	 // Зарезервировано
        Data : Pointer; 		 // Указатель на возвращенные данные
        Options : ip_option_information; // Информация из заголовка IP
    end;

    PIPINFO = ^ip_option_information;
    PVOID = Pointer;

    function IcmpCreateFile() : THandle; stdcall; external 'ICMP.DLL' name 'IcmpCreateFile';
    function IcmpCloseHandle(IcmpHandle : THandle) : BOOL; stdcall; external 'ICMP.DLL' 
								    name 'IcmpCloseHandle';
    function IcmpSendEcho(
                          IcmpHandle : THandle;    // handle, возвращенный IcmpCreateFile()
                          DestAddress : u_long;    // Адрес получателя (в сетевом порядке)
                          RequestData : PVOID;     // Указатель на посылаемые данные
                          RequestSize : Word;      // Размер посылаемых данных
                          RequestOptns : PIPINFO;  // Указатель на посылаемую структуру 
                       		               // ip_option_information (может быть nil)
                          ReplyBuffer : PVOID;     // Указатель на буфер, содержащий ответы.
                          ReplySize : DWORD;       // Размер буфера ответов 
                          Timeout : DWORD          // Время ожидания ответа в миллисекундах
                         ) : DWORD; stdcall; external 'ICMP.DLL' name 'IcmpSendEcho';

function MyUpCase(Ch : Char): Char; forward;
procedure wwDBGridCalcTitleImage(Sender: TObject; Field: TField;
                                 var TitleImageAttributes: TwwTitleImageAttributes;
                                 OrderBy : String); forward;
function FieldPos(FieldName: String; SelectSQL: TStrings): String; forward;
procedure nskSetMode(dwFlags:longint; bProg:byte; dwID:longint;
                      wSN:word; bVer:byte;
                      wMask, wType:word ); stdcall; external;
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

var
  OrderByMainComps  : String = ' 2 desc, 5 asc';
  OrderByMainTariffs  : String = ' 2 desc, 4 asc';
  OrderByMainWorks  : String = ' 12 asc, 5 asc, 3 asc';
  OrderByMainFreeComps  : String = ' 4 asc, 2 asc';
  OrderByCompProg : String =' 2 asc';
  OrderByMainProg : String =' 2 asc';
  Sended : Boolean = False;
  PrivRD : Longint = 1262958463;
  CodePass  : array[0..32-1] of Byte;

procedure CRC32(Value: Byte; var crc: Integer);
begin
 crc := CRC32tab[Byte(crc xor Integer(Value))] xor((crc shr 8) and $00ffffff);
end;

procedure CRCEnd(var crc: Integer);
const CRCSeed = $ffffffff;
begin
 crc := (crc xor CRCSeed);
end;

function TfrmMain.CRC(var Stream : TMemoryStream):LongInt;
var  i: Integer;
     Buf : Byte;
begin
 Result := 0;
 Stream.Position := 0;
 for i := 0 to Stream.Size do
  Begin
   Stream.Read(Buf,1);
   CRC32(Buf, Result);
  End;
 CRCEnd(Result);
end;

procedure TfrmMain.wmSysCommand;
begin
 Case Message.wParam of
  ID_SETUP: Begin
             Application.CreateForm(TfrmSetUp,frmSetUp);
             frmSetUp.ShowModal;
             frmSetUp.Free
            End;
  ID_CONNECT: try
               psMain.Connect;
               While NOT (Connected) do ;
               If (psMain.Transaction('TEST')='OK'#10) then
                MessageDlg('OK',mtInformation,[mbOK],0)
               else
                MessageDlg('Невозможно установить связь с сервером интернета. Проверьте настройки',mtError,[mbOK],0);
               psMain.Disconnect;
              except
                psMain.Disconnect;
                tc := GetTickCount;
                While (Abs(GetTickCount-tc)<2000) do
                 Application.ProcessMessages;
                try
                 psMain.Connect;
                 While NOT (Connected) do ;
                 If (psMain.Transaction('TEST')='OK'#10) then
                  MessageDlg('OK',mtInformation,[mbOK],0)
                 else
                  MessageDlg('Невозможно установить связь с сервером интернета. Проверьте настройки',mtError,[mbOK],0);
                 psMain.Disconnect;
                except
                 MessageDlg('Невозможно установить связь с сервером интернета. Проверьте настройки',mtError,[mbOK],0)
                end
              end;
  ID_ENCASHMENT : begin
                   Application.CreateForm(TfrmEncashment,frmEncashment);
                   frmEncashment.ShowModal;
                   frmEncashment.Free
                  end;
  ID_INFO : begin
             Application.CreateForm(TfrmIntro,frmIntro);
             frmIntro.ShowModal;
             frmIntro.Free
            end
 end;
 inherited;
end;

function MyUpCase(Ch: Char): Char;
Begin
 If (Ch in ['a'..'z']) then Ch := UpCase(Ch);
 If Ord(Ch) in [224..255] then Ch := Chr(Ord(Ch)-32);
 Result := Ch
End;

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
    TitleImageAttributes.ImageIndex := 0
   else
    TitleImageAttributes.ImageIndex := 1
  End
end;

procedure TfrmMain.StteChange(Suf: String; Enabled: Boolean);
 var k : Integer;
     ActivePage: TTabSheet;
begin
 If (frmMain<>nil) then
  Begin
   ActivePage := PageControl1.ActivePage;
   For k := 0 to Pred(frmMain.ComponentCount) do
    Begin
     If (Components[k].Name='sbApply'+Suf) or
        (Components[k].Name='sbCancel'+Suf) then
      (Components[k] as TControl).Enabled := Enabled;
     If (Components[k] is TTabSheet) and
        (Components[k].Name<>'ts'+Suf) then
      (Components[k] as TTabSheet).TabVisible := NOT Enabled
    End;
   PageControl1.ActivePage := ActivePage;
 Timer1.Enabled := False;
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
                                   var OrderBy : String; Ctrl : Boolean; Alt : Boolean;
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
   If (Ctrl) or (Alt) then
    Begin
     If (Pos(' '+FieldPosRes+' ',OrderBy)>0) then
      Begin
       If (Pos(' '+FieldPosRes+' ',OrderBy)=1) then
        PreStr := ''
       else
        PreStr := Copy(OrderBy,1,Pos(' '+FieldPosRes+' ',OrderBy)-1);
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
    If (Alt) and (Pos(',',OrderBy)<>0) then
     Begin
      If (Pos(', '+FieldPosRes+' asc',OrderBy)<>0) then
       Delete(OrderBy,Pos(', '+FieldPosRes+' asc',OrderBy),Length(', '+FieldPosRes+' asc'));
      If (Pos(', '+FieldPosRes+' desc',OrderBy)<>0) then
       Delete(OrderBy,Pos(', '+FieldPosRes+' desc',OrderBy),Length(', '+FieldPosRes+' desc'));
      If (Pos(' '+FieldPosRes+' asc',OrderBy)<>0) then
       Delete(OrderBy,Pos(' '+FieldPosRes+' asc',OrderBy),Length(' '+FieldPosRes+' asc')+1);
      If (Pos(' '+FieldPosRes+' desc',OrderBy)<>0) then
       Delete(OrderBy,Pos(' '+FieldPosRes+' desc',OrderBy),Length(' '+FieldPosRes+' desc')+1);
     End;
   GenerateSelect;
   ((Sender as TwwDBGrid).DataSource.DataSet as TIBDataSet).Open;
   ((Sender as TwwDBGrid).DataSource.DataSet as TIBDataSet).BookMark := BookMark;
   ((Sender as TwwDBGrid).DataSource.DataSet as TIBDataSet).EnableControls;
   frmMain.SelectAllEnabDisab;
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

procedure TfrmMain.GenerateSelectMainWorks;
begin
 ibdsWorks.SelectSQL.Clear;
 ibdsWorks.SelectSQL.Add('select O.ID, O.COMP_ID, C.NUMBER, C.IP_ADDRESS, C.CLASS, C.DESCRIPTION,');
 ibdsWorks.SelectSQL.Add('O.TARIFF_ID, T.NAME, T.I_SPEED, O.PRICE, O.TIME_START, O.TIME_STOP,');
 ibdsWorks.SelectSQL.Add('O.COMMENTS, O.CHECKED, O.LOCKED, O.INTERFACE');
 ibdsWorks.SelectSQL.Add('from ORDERS O, COMPS C, TARIFFS T');
 ibdsWorks.SelectSQL.Add('where (O.TIME_START<=current_timestamp+0.001) and (O.TIME_STOP>current_timestamp) and');
 ibdsWorks.SelectSQL.Add('(O.COMP_ID=C.ID) and (O.TARIFF_ID=T.ID) and NOT(O.TIME_START=O.TIME_STOP)');
 ibdsWorks.SelectSQL.Add('order by'+OrderByMainWorks);
 ibdsWorks.Prepare
end;

procedure TfrmMain.GenerateSelectCompProg;
begin
 ibdsCompProg.SelectSQL.Clear;
 ibdsCompProg.SelectSQL.Add('select PC.ID, C.NUMBER, PC.ID_PROG, C.DESCRIPTION, C.NETWORK_NAME, C.ID from PROG_COMPS PC, COMPS C where (PC.ID_PROG=:ID_PROG) and (PC.ID=C.ID)');
 ibdsCompProg.SelectSQL.Add('order by'+OrderByCompProg);
 ibdsCompProg.Prepare
end;

procedure TfrmMain.GenerateSelectMainProg;
begin
 ibdsMainProg.SelectSQL.Clear;
 ibdsMainProg.SelectSQL.Add('select HASH, NAME, PATH, ICON, ID_PROG, NUM_OF_COMPS from PROGRAMMS');
 ibdsMainProg.SelectSQL.Add('order by'+OrderByMainProg)
end;

procedure TfrmMain.GenerateSelectMainFreeComps;
begin
 ibdsFreeComps.SelectSQL.Clear;
 ibdsFreeComps.SelectSQL.Add('select C.ID, C.NUMBER, C.IP_ADDRESS, C.CLASS, C.DESCRIPTION, C.COMMENTS');
 ibdsFreeComps.SelectSQL.Add('from COMPS C');
 ibdsFreeComps.SelectSQL.Add('where (C.VALID=1) and NOT EXISTS(select * from ORDERS O where');
 ibdsFreeComps.SelectSQL.Add('(O.TIME_START<=current_timestamp+0.001) and (O.TIME_STOP>current_timestamp) and (O.COMP_ID=C.ID) and NOT(O.TIME_START=O.TIME_STOP))');
 ibdsFreeComps.SelectSQL.Add('order by'+OrderByMainFreeComps);
 ibdsFreeComps.Prepare
end;

procedure TfrmMain.wwDBGrid3KeyPress(Sender: TObject; var Key: Char);
begin
 Key := MyUpCase(Key)
end;

procedure TfrmMain.FormCreate(Sender: TObject);
 var SysMenu  : THandle;
     IniFile  : TRegIniFile;
     k        : Integer;
     CRC      : Longint;
     NotGood  : Integer;
     MaxComps : Integer;
     Pswd, UName, UPass : String;
begin
 MaxComps := 0;
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
 NotGood := nskCRC(@PrivRD,4,-1)-1417686703;
 Pswd := '@J:B%8^4#rg$;aQn4u5)_)({}[wgor!&';
 nskCodeInit(PrivRD,0,1,@Pswd[1]);
 nskRead(PrivRD,102,4,@MaxComps);
 nskDeCode(0,@Pswd[1],@MaxComps,4);
 nskRead(PrivRD,106,4,@CRC);
 nskDeCode(0,@Pswd[1],@CRC,4);
 UName := '1234';
 nskRead(PrivRD,138,4,@UName[1]);
 nskDeCode(0,@Pswd[1],@UName[1],4);
 UPass := '0123456789';
 nskRead(PrivRD,142,10,@UPass[1]);
 nskDeCode(0,@Pswd[1],@UPass[1],10);
 nskEnCode(0,@CodePass,@PrivRD,4);
 Pswd := '@J:B%8^4#rg$;aQn4u5)_)({}[wgor!&';
 NotGood := NotGood+nskCRC(@MaxComps,4,-1)-CRC;
 SysMenu:=GetSystemMenu(Handle,False);
 InsertMenu(SysMenu,Word(-1),MF_SEPARATOR,ID_ABOUT,'');
 InsertMenu(SysMenu,Word(-1),MF_BYPOSITION,ID_SETUP, 'Настройка');
 InsertMenu(SysMenu,Word(-1),MF_BYPOSITION,ID_CONNECT, 'Тест соединения');
 InsertMenu(SysMenu,Word(-1),MF_SEPARATOR,ID_ABOUT,'');
 InsertMenu(SysMenu,Word(-1),MF_BYPOSITION,ID_ENCASHMENT, 'Инкассация');
 InsertMenu(SysMenu,Word(-1),MF_SEPARATOR,ID_ABOUT,'');
 InsertMenu(SysMenu,Word(-1),MF_BYPOSITION,ID_INFO, 'О программе');
 IniFile := TRegIniFile.Create;
 IniFile.RootKey := HKEY_CURRENT_USER;
 IniFile.OpenKey('\Software\WizardSoft\Wizard iGame',True);
 frmMain.Height := IniFile.ReadInteger('Wizard iGame Admin','frmMain.Height',frmMain.Height);
 frmMain.Width := IniFile.ReadInteger('Wizard iGame Admin','frmMain.Width',frmMain.Width);
 frmMain.Left := IniFile.ReadInteger('Wizard iGame Admin','frmMain.Left',frmMain.Left);
 frmMain.Top := IniFile.ReadInteger('Wizard iGame Admin','frmMain.Top',frmMain.Top);
 Case IniFile.ReadInteger('Wizard iGame Admin','frmMain.WindowState',1) of
  0: frmMain.WindowState := wsMinimized;
  1: frmMain.WindowState := wsNormal;
  2: frmMain.WindowState := wsMaximized;
 end;
 For k := 0 to Pred(frmMain.ComponentCount) do
  If (Components[k] is TField) then
   Begin
    (Components[k] as TField).DisplayLabel := IniFile.ReadString('Wizard iGame Admin','frmMain.'+(Components[k] as TField).Name+'.DisplayLabel',(Components[k] as TField).DisplayLabel);
    (Components[k] as TField).DisplayWidth := IniFile.ReadInteger('Wizard iGame Admin','frmMain.'+(Components[k] as TField).Name+'.DisplayWidth',(Components[k] as TField).DisplayWidth);
    (Components[k] as TField).Index := IniFile.ReadInteger('Wizard iGame Admin','frmMain.'+(Components[k] as TField).Name+'.Index',(Components[k] as TField).Index);
    If ((Components[k] is TNumericField)) then
     (Components[k] as TNumericField).DisplayFormat := IniFile.ReadString('Wizard iGame Admin','frmMain.'+(Components[k] as TNumericField).Name+'.DisplayFormat',(Components[k] as TNumericField).DisplayFormat);
    (Components[k] as TField).Visible := IniFile.ReadBool('Wizard iGame Admin','frmMain.'+(Components[k] as TField).Name+'.Visible',(Components[k] as TField).Visible)
   End;
 IniFile.CloseKey;
 IniFile.Free;
 ibBS.DatabaseName := ExtractFilePath(Application.ExeName)+'Data\GBase.gdb';
 ibBS.BackupFile.Add(ExtractFilePath(Application.ExeName)+'XXX.xyz');
 If (IsNetWork) then
  Begin
   ibdMain.DatabaseName := GetComputer+':'+ExtractFilePath(Application.ExeName)+'Data\GBase.gdb';
   ibBS.ServerName := GetComputer;
   ibBS.Protocol := TCP
  End
 else
  Begin
   ibdMain.DatabaseName := 'localhost'+':'+ExtractFilePath(Application.ExeName)+'Data\GBase.gdb';
   ibBS.ServerName := 'localhost';
   ibBS.Protocol := Local
  End;
 ibdMain.Params.Clear;
 ibdMain.Params.Add('user_name='+UName);
 ibdMain.Params.Add('password='+UPass);
 ibdMain.Params.Add('lc_ctype=WIN1251');
 ibdMain.Open;
 PageControl1.ActivePageIndex := 0;
 trMain.StartTransaction;
 GenerateSelectMainComps;
 GenerateSelectMainTariffs;
 GenerateSelectMainWorks;
 GenerateSelectMainFreeComps;
 GenerateSelectMainProg;
 GenerateSelectCompProg;
 DataSetsOpen;
 ibsGen_ID.SQL.Clear;
 ibsGen_ID.SQL.Add('select IP_ADDRESS, PORT, POST_PORT, POST_USER_NAME,');
 ibsGen_ID.SQL.Add('POST_ADDRESS, DESTINATION_ADDRESS, CURRENCY_DECIMALS');
 ibsGen_ID.SQL.Add('from SET_UP');
 ibsGen_ID.ExecQuery;
 psMain.Host := ibsGen_ID.FieldByName('IP_ADDRESS').AsString;
 psMain.Port := ibsGen_ID.FieldByName('PORT').AsInteger;
 NMSMTP1.Host := ibsGen_ID.FieldByName('IP_ADDRESS').AsString;
 NMSMTP1.Port := ibsGen_ID.FieldByName('POST_PORT').AsInteger;
 NMSMTP1.UserID := ibsGen_ID.FieldByName('POST_USER_NAME').AsString;
 NMSMTP1.PostMessage.FromAddress := ibsGen_ID.FieldByName('POST_ADDRESS').AsString;
 NMSMTP1.PostMessage.FromName := ibsGen_ID.FieldByName('POST_USER_NAME').AsString;
 NMSMTP1.PostMessage.Subject := 'Report';
 NMSMTP1.PostMessage.ToAddress.Add(ibsGen_ID.FieldByName('DESTINATION_ADDRESS').AsString);
 If NOT (ibsGen_ID.RecordCount>0) and (ibsGen_ID.FieldByName('CURRENCY_DECIMALS').IsNull) then
  CurrencyDecimals := ibsGen_ID.FieldByName('CURRENCY_DECIMALS').AsInteger
 else
  CurrencyDecimals := 1;
 ibsGen_ID.Close;
 ibsGen_ID.SQL.Clear;
 ibsGen_ID.SQL.Add('select *');
 ibsGen_ID.SQL.Add('from CASH_DESK');
 ibsGen_ID.ExecQuery;
 If (ibsGen_ID.RecordCount=0) then
  Begin
   ibsGen_ID.Close;
   ibsGen_ID.SQL.Clear;
   ibsGen_ID.SQL.Add('insert into CASH_DESK values (0)');
   ibsGen_ID.ExecQuery
  End;
 ibsGen_ID.Close;
 try
  k := Trunc(27/(k-(k+NotGood+MaxComps-Max(MaxComps,ibdsWorks.RecordCount+ibdsFreeComps.RecordCount))));
  SpeedButton5.OnClick := nil;
  sbInc.OnClick := SpeedButton12.OnClick;
  sbFreeComp.OnClick := SpeedButton12.OnClick;
  wwdbgFreeComps.DataSource := nil
 except
  SpeedButton5.OnClick := SpeedButton5.OnClick;
  sbInc.OnClick := sbInc.OnClick;
  sbFreeComp.OnClick := sbFreeComp.OnClick;
  wwdbgFreeComps.DataSource := dsFreeComps
 end
end;

procedure TfrmMain.SpeedButton12Click(Sender: TObject);
begin
 Close
end;

procedure TfrmMain.ibdsMainCompsAfterScroll(DataSet: TDataSet);
begin
 sbDeleteComps.Enabled := Not (DataSet.RecordCount=0)
end;

procedure TfrmMain.sbDeleteCompsClick(Sender: TObject);
begin
 ibdsMainComps.Delete;
 StteChange('Comps', True)
end;

procedure TfrmMain.sbAddCompsClick(Sender: TObject);
begin
 ibdsMainComps.Append
end;

procedure TfrmMain.sbCancelCompsClick(Sender: TObject);
 var BookMark : String;
begin
 BookMark := ibdsMainComps.Bookmark;
 ibdsMainComps.CancelUpdates;
 StteChange('Comps', False);
 try
  ibdsMainComps.Bookmark := BookMark
 except
 end;
 Timer1.Enabled := True;
end;

procedure TfrmMain.sbApplyCompsClick(Sender: TObject);
 var BookMark : String;
begin
 BookMark := ibdsMainComps.Bookmark;
 try
  ibdsMainComps.ApplyUpdates;
  trMain.CommitRetaining;
  StteChange('Comps', False)
 except
  trMain.RollbackRetaining;
  MessageDlg('Ошибка сохранения. Проверьте введенные данные.', mtError, [mbOK],0)
 end;
 try
  ibdsMainComps.Bookmark := BookMark
 except
 end;
 Timer1.Enabled := True;
end;

procedure TfrmMain.dsMainCompsStateChange(Sender: TObject);
begin
 If ((Sender as TDataSource).State<>dsInactive) then
  If (Sender as TDataSource).State in [dsEdit,dsInsert] then
   StteChange(Copy((Sender as TDataSource).Name,7,Length((Sender as TDataSource).Name)-6), True)
  else
   StteChange(Copy((Sender as TDataSource).Name,7,Length((Sender as TDataSource).Name)-6), ((Sender as TDataSource).DataSet as TIBDataSet).UpdatesPending);
end;

procedure TfrmMain.wwDBGrid3CalcTitleImage(Sender: TObject; Field: TField;
  var TitleImageAttributes: TwwTitleImageAttributes);
begin
 Case (Sender as TComponent).Tag of
  0: wwDBGridCalcTitleImage(Sender, Field, TitleImageAttributes, OrderByMainWorks);
  1: wwDBGridCalcTitleImage(Sender, Field, TitleImageAttributes, OrderByMainFreeComps);
  2: wwDBGridCalcTitleImage(Sender, Field, TitleImageAttributes, OrderByMainComps);
  3: wwDBGridCalcTitleImage(Sender, Field, TitleImageAttributes, OrderByMainTariffs);
  4: wwDBGridCalcTitleImage(Sender, Field, TitleImageAttributes, OrderByCompProg);
  5: wwDBGridCalcTitleImage(Sender, Field, TitleImageAttributes, OrderByMainProg);
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
 If ((Sender as TwwDBGrid)=wwdbgComps) then
  (Sender as TwwDBGrid).SelectedList.Clear;
 Case (Sender as TComponent).Tag of
  0: wwDBGridTitleButtonClick(Sender, AFieldName, OrderByMainWorks, (GetKeyState(VK_CONTROL)<0),(GetKeyState(VK_MENU)<0),
                              sbApplyComps, sbCancelComps, GenerateSelectMainWorks);
  1: wwDBGridTitleButtonClick(Sender, AFieldName, OrderByMainFreeComps, (GetKeyState(VK_CONTROL)<0),(GetKeyState(VK_MENU)<0),
                              sbApplyComps, sbCancelComps, GenerateSelectMainFreeComps);
  2: wwDBGridTitleButtonClick(Sender, AFieldName, OrderByMainComps, (GetKeyState(VK_CONTROL)<0),(GetKeyState(VK_MENU)<0),
                              sbApplyComps, sbCancelComps, GenerateSelectMainComps);
  3: wwDBGridTitleButtonClick(Sender, AFieldName, OrderByMainTariffs, (GetKeyState(VK_CONTROL)<0),(GetKeyState(VK_MENU)<0),
                              sbApplyTariffs, sbCancelTariffs, GenerateSelectMainTariffs);
  4: wwDBGridTitleButtonClick(Sender, AFieldName, OrderByCompProg, (GetKeyState(VK_CONTROL)<0),(GetKeyState(VK_MENU)<0),
                              sbApplyProg, sbCancelProg, GenerateSelectCompProg);
  5: wwDBGridTitleButtonClick(Sender, AFieldName, OrderByMainProg, (GetKeyState(VK_CONTROL)<0),(GetKeyState(VK_MENU)<0),
                              sbApplyProg, sbCancelProg, GenerateSelectMainProg);
 end
end;

procedure TfrmMain.PageControl1Change(Sender: TObject);
begin
 ibdsMainComps.Active := (PageControl1.ActivePage=tsComps);
 ibdsMainTariffs.Active := (PageControl1.ActivePage=tsTariffs);
 ibdsWorks.Active := (PageControl1.ActivePage=tsMain);
 ibdsFreeComps.Active := (PageControl1.ActivePage=tsMain);
 ibdsMainProg.Active := (PageControl1.ActivePage=tsProg);
 ibdsCompProg.Active := (PageControl1.ActivePage=tsProg);
 If (PageControl1.ActivePage=tsProg) then
  Begin
   wwdbgComps.Visible := NOT (ibdsMainProg.RecordCount=0);
   SelectAllEnabDisab;
  End;
 Timer1.Enabled := True;
end;

procedure TfrmMain.ibdsMainCompsNewRecord(DataSet: TDataSet);
begin
 ibsGen_ID.SQL.Clear;
 ibsGen_ID.SQL.Add('select gen_id(GEN_COMPS_ID,1) from rdb$database');
 ibsGen_ID.ExecQuery;
 ibdsMainCompsID.Value := ibsGen_ID.FieldByName('Gen_ID').AsInteger;
 ibdsMainCompsVALID.Value := 1;
 ibsGen_ID.Close
end;

procedure TfrmMain.ibdsMainTariffsAfterScroll(DataSet: TDataSet);
begin
 sbDeleteTariffs.Enabled := Not (DataSet.Bof and DataSet.Eof)
end;

procedure TfrmMain.ibdsMainTariffsNewRecord(DataSet: TDataSet);
begin
 ibsGen_ID.SQL.Clear;
 ibsGen_ID.SQL.Add('select gen_id(GEN_TARIFFS_ID,1) from rdb$database');
 ibsGen_ID.ExecQuery;
 ibdsMainTariffsID.Value := ibsGen_ID.FieldByName('Gen_ID').AsInteger;
 ibdsMainTariffsI_SPEED.Value := 0;
 ibdsMainTariffsVALID.Value := 1;
 ibsGen_ID.Close
end;

procedure TfrmMain.sbDeleteTariffsClick(Sender: TObject);
begin
 ibdsMainTariffs.Delete;
 StteChange('Tariffs', True)
end;

procedure TfrmMain.sbAddTariffsClick(Sender: TObject);
begin
 ibdsMainTariffs.Append
end;

procedure TfrmMain.sbCancelTariffsClick(Sender: TObject);
 var BookMark : String;
begin
 BookMark := ibdsMainTariffs.Bookmark;
 ibdsMainTariffs.CancelUpdates;
 StteChange('Tariffs', False);
 try
  ibdsMainTariffs.Bookmark := BookMark
 except
 end;
 Timer1.Enabled := True;
end;

procedure TfrmMain.sbApplyTariffsClick(Sender: TObject);
 var BookMark : String;
begin
 BookMark := ibdsMainTariffs.Bookmark;
 try
  ibdsMainTariffs.ApplyUpdates;
  trMain.CommitRetaining;
  StteChange('Tariffs', False)
 except
  trMain.RollbackRetaining;
  MessageDlg('Ошибка сохранения. Проверьте введенные данные.', mtError, [mbOK],0)
 end;
 try
  ibdsMainTariffs.Bookmark := BookMark
 except
 end;
 Timer1.Enabled := True
end;

procedure TfrmMain.ibdsWorksCalcFields(DataSet: TDataSet);
 var Hour, Min, Sec, MSec: Word;
begin
// DecodeTime(Now,Hour,Min,Sec,Sec);
// ibdsWorksTIME_REMAIN.Value := ibdsWorksTIME_STOP.Value-(Date+EncodeTime(Hour,Min,0,0));
 DecodeTime(ibdsWorksTIME_STOP.Value-Now,Hour,Min,Sec,MSec);
 If (Sec<30) then
  ibdsWorksTIME_REMAIN.Value := EncodeTime(Hour,Min,0,0)
 else
  ibdsWorksTIME_REMAIN.Value := EncodeTime(Hour,Min,0,0)+EncodeTime(0,1,0,0);
 If (ibdsWorksINTERFACE.AsInteger=1) then
  ibdsWorksINTERFACETYPE.AsString:='Стандартный'
 Else
  ibdsWorksINTERFACETYPE.AsString:='Защищенный'
end;

procedure TfrmMain.SpeedButton5Click(Sender: TObject);
 var Hour, Min, Sec: Word;
     k : Integer;
begin
 If (ibdsFreeComps.RecordCount>0) then
  Begin
   Timer1.Enabled := False;
   try
    Application.CreateForm(TfrmNewOrder,frmNewOrder);
    ibsGen_ID.SQL.Clear;
    ibsGen_ID.SQL.Add('select gen_id(GEN_ORDERS_ID,1) from rdb$database');
    ibsGen_ID.ExecQuery;
    frmNewOrder.ibdsOrder.ParamByName('ID').Value := ibsGen_ID.FieldByName('Gen_ID').AsInteger;
    frmNewOrder.ibdsTariffs.Open;
    frmNewOrder.ibdsOrder.Open;
    frmNewOrder.ibdsOrder.Append;
    frmNewOrder.ibdsOrderID.Value := ibsGen_ID.FieldByName('Gen_ID').AsInteger;
    ibsGen_ID.Close;
    frmNewOrder.ibdsOrderCOMP_ID.Value := ibdsFreeCompsID.AsInteger;
//    DecodeTime(Now,Hour,Min,Sec,Sec);
//    frmNewOrder.ibdsOrderTIME_START.Value := Date+IncMinute(EncodeTime(Hour,Min,0,0),1);
//    frmNewOrder.ibdsOrderTIME_STOP.Value := Date+IncHour(IncMinute(EncodeTime(Hour,Min,0,0),1),1);
//    frmNewOrder.ibdsOrderTIME_START.Value := Date+EncodeTime(Hour,Min,0,0);
//    frmNewOrder.ibdsOrderTIME_STOP.Value := Date+IncHour(EncodeTime(Hour,Min,0,0),1);
    frmNewOrder.ibdsOrderTIME_START.Value := Now;
    frmNewOrder.ibdsOrderTIME_STOP.Value := Now+EncodeTime(1,0,0,0);
    frmNewOrder.ibdsOrderINTERFACE.AsInteger := 0;
    frmNewOrder.MinTimeStop := frmNewOrder.ibdsOrderTIME_START.AsFloat;
    frmNewOrder.CompsNumber := 1;
    If (wwdbgFreeComps.SelectedList.Count>1) then
     Begin
      frmNewOrder.dbeNumber.Text := '';
      frmNewOrder.CompsNumber := wwdbgFreeComps.SelectedList.Count;
      For k := 0 to Pred(wwdbgFreeComps.SelectedList.Count) do
       Begin
        ibdsFreeComps.GotoBookmark(wwdbgFreeComps.SelectedList.Items[k]);
        frmNewOrder.dbeNumber.Text := frmNewOrder.dbeNumber.Text+ibdsFreeCompsNUMBER.AsString+';'
       End;
      frmNewOrder.dbeNumber.Text := Copy(frmNewOrder.dbeNumber.Text,1,Pred(Length(frmNewOrder.dbeNumber.Text)))
     End
    else
     frmNewOrder.dbeNumber.Text := ibdsFreeCompsNUMBER.AsString;
    frmNewOrder.ShowModal;
    frmNewOrder.Free;
    wwdbgFreeComps.SelectedList.Clear
   finally
    Timer1.Enabled := True;
    Timer1Timer(Timer1)
   end
  End
 else
  MessageDlg('Свободных компьютеров нет!',mtError,[mbOK],0)
end;

procedure TfrmMain.sbDecClick(Sender: TObject);
 var Hour, Min, Sec: Word;
     PostIP : String;
begin
 PostIP := ibdsWorksIP_ADDRESS.AsString;
 Timer1.Enabled := False;
 try
  Application.CreateForm(TfrmAddRemove,frmAddRemove);
  frmAddRemove.tpDuration.OnChange := Nil;
  frmAddRemove.Caption := 'Уменьшение времени';
  frmAddRemove.Icon := nil;
//  DecodeTime(Now,Hour,Min,Sec,Sec);
//  frmAddRemove.MinTimeStop := Date+EncodeTime(Hour,Min,0,0);
  frmAddRemove.MinTimeStop := Now-EncodeTime(0,0,10,0);
  frmAddRemove.ibdsOrder.ParamByName('ID').Value := ibdsWorksID.Value;
  frmAddRemove.ibdsOrder.Open;
  frmAddRemove.TimeStop := frmAddRemove.ibdsOrderTIME_STOP.Value;
  frmAddRemove.ibdsOrder.Edit;
  frmAddRemove.wwdbeAmount.ReadOnly := True;
  frmAddRemove.wwdbeAmount.TabStop := False;
  If (frmAddRemove.MinTimeStop<frmAddRemove.ibdsOrderTIME_START.Value) then
   frmAddRemove.ibdsOrderTIME_STOP.Value := frmAddRemove.ibdsOrderTIME_START.Value
  else
   frmAddRemove.ibdsOrderTIME_STOP.Value := frmAddRemove.MinTimeStop;
  frmAddRemove.Label5.Caption := 'Вычесть';
  frmAddRemove.Label10.Caption := 'Сдача';
  frmAddRemove.wwDBDateTimePicker2.MinDate := Date;
  frmAddRemove.wwDBDateTimePicker2.MaxDate := Date;
  frmAddRemove.tpDuration.OnChange := frmAddRemove.tpDurationChange;
  frmAddRemove.ShowModal;
  frmAddRemove.Free;
  wwDBGrid1.SelectedList.Clear
 finally
  Timer1.Enabled := True;
  Timer1Timer(Timer1);
  nmmsgSendMsg.Host := PostIP;
 try
  nmmsgSendMsg.PostIt('ReCalcNow')
 except
  try
   nmmsgSendMsg.PostIt('ReCalcNow')
  except
  end
 end;
 end
end;

procedure TfrmMain.sbIncClick(Sender: TObject);
var PostIP : String;
begin
 PostIP := ibdsWorksIP_ADDRESS.AsString;
 Timer1.Enabled := False;
 try
  Application.CreateForm(TfrmAddRemove,frmAddRemove);
  frmAddRemove.Caption := 'Добавление времени';
  frmAddRemove.Icon := nil;
  frmAddRemove.MinTimeStop := ibdsWorksTIME_STOP.Value;
  frmAddRemove.ibdsOrder.ParamByName('ID').Value := ibdsWorksID.Value;
  frmAddRemove.ibdsOrder.Open;
  frmAddRemove.TimeStop := frmAddRemove.ibdsOrderTIME_STOP.Value;
  frmAddRemove.ibdsOrder.Edit;
  frmAddRemove.tpDuration.Time := 0;
  frmAddRemove.wwDBDateTimePicker2.MinDate := Date;
  frmAddRemove.wwDBDateTimePicker2.MaxDate := Date;
  frmAddRemove.wwdbeAmount.ReadOnly := False;
  frmAddRemove.wwdbeAmount.TabStop := True;
  frmAddRemove.ShowModal;
  frmAddRemove.Free;
  wwDBGrid1.SelectedList.Clear
 finally
  Timer1.Enabled := True;
  Timer1Timer(Timer1);
  nmmsgSendMsg.Host := PostIP;
  try
   nmmsgSendMsg.PostIt('ReCalcNow')
  except
   try
    nmmsgSendMsg.PostIt('ReCalcNow')
   except
   end
  end
 end
end;

procedure TfrmMain.sbFreeCompClick(Sender: TObject);
 var Hour, Min, Sec: Word;
begin
 Timer1.Enabled := False;
 try
  Application.CreateForm(TfrmTransferWork,frmTransferWork);
  frmTransferWork.ibdsTariffs.Open;
  frmTransferWork.ibdsComps.Open;
  If (wwDBGrid1.SelectedList.Count>1) then
   Begin
    ibdsWorks.GotoBookmark(wwDBGrid1.SelectedList.Items[0]);
    frmTransferWork.ibdsDonor.ParamByName('ID').AsInteger := ibdsWorksID.Value;
    ibdsWorks.GotoBookmark(wwDBGrid1.SelectedList.Items[1]);
    frmTransferWork.ibdsAcceptor.ParamByName('ID').AsInteger := ibdsWorksID.Value;
    wwdbgFreeComps.SelectedList.Clear
   End
  else
   Begin
    frmTransferWork.ibdsDonor.ParamByName('ID').AsInteger := ibdsWorksID.Value;
    ibsGen_ID.SQL.Clear;
    ibsGen_ID.SQL.Add('select gen_id(GEN_ORDERS_ID,1) from rdb$database');
    ibsGen_ID.ExecQuery;
    frmTransferWork.ibdsAcceptor.ParamByName('ID').AsInteger := ibsGen_ID.FieldByName('Gen_ID').AsInteger;
    ibsGen_ID.Close
   End;
  frmTransferWork.ibdsDonor.Open;
  frmTransferWork.ibdsAcceptor.Open;
  If (frmTransferWork.ibdsAcceptor.RecordCount=0) then
   Begin
    frmTransferWork.AcceptorTimeStop := 0;
    frmTransferWork.AcceptorPrice := 0;
    frmTransferWork.ibdsAcceptor.Append;
    DecodeTime(Now,Hour,Min,Sec,Sec);
    frmTransferWork.ibdsAcceptorINTERFACE.Value := ibdsWorksINTERFACE.AsInteger;
    frmTransferWork.ibdsAcceptorTIME_START.Value := Date+IncMinute(EncodeTime(Hour,Min,0,0),1);
    frmTransferWork.ibdsAcceptorTIME_STOP.Value := frmTransferWork.ibdsAcceptorTIME_START.Value;
    frmTransferWork.ibdsAcceptorID.AsInteger := frmTransferWork.ibdsAcceptor.ParamByName('ID').AsInteger;
    frmTransferWork.ibdsAcceptorCOMP_ID.Value := ibdsFreeCompsID.Value;
    frmTransferWork.ibdsAcceptorTARIFF_ID.Value := ibdsWorksTARIFF_ID.Value;
    frmTransferWork.ibdsAcceptorI_SPEED.Value := frmTransferWork.ibdsTariffsI_SPEED.Value;
    frmTransferWork.ibdsAcceptorTARIFF_PRICE.Value := frmTransferWork.ibdsTariffsPRICE.Value;
    frmTransferWork.ibdsAcceptorIP_ADDRESS.Value := frmTransferWork.ibdsCompsIP_ADDRESS.Value;
    frmTransferWork.AcceptorPrice := 0
   End
  else
   Begin
    frmTransferWork.AcceptorPrice := frmTransferWork.ibdsAcceptorPRICE.Value;
    frmTransferWork.wwDBLookupCombo1.ReadOnly := True;
    frmTransferWork.wwDBLookupCombo2.ReadOnly := True;
    frmTransferWork.ibdsAcceptor.Edit
   End;
  frmTransferWork.AcceptorTimeStop := frmTransferWork.ibdsAcceptorTIME_STOP.AsFloat;
  frmTransferWork.DonorTimeStop := frmTransferWork.ibdsDonorTIME_STOP.AsFloat;
  frmTransferWork.DonorPrice := frmTransferWork.ibdsDonorPRICE.Value;
  frmTransferWork.ibdsDonor.Edit;
  frmTransferWork.tpDuration.Time := 0;
  frmTransferWork.ShowModal;
  frmTransferWork.Free;
  wwDBGrid1.SelectedList.Clear;
  wwdbgFreeComps.SelectedList.Clear
 finally
  Timer1.Enabled := True;
  Timer1Timer(Timer1)
 end
end;

procedure TfrmMain.Timer1Timer(Sender: TObject);
 var k        : Integer;
     CRC      : Longint;
     NotGood  : Integer;
     MaxComps : Integer;
     Pswd     : String;
begin
 wwDBGrid1.SelectedList.Clear;
 wwdbgFreeComps.SelectedList.Clear;
 ibdsWorks.DisableControls;
 ibdsFreeComps.DisableControls;
 ibdsWorks.Close;
 ibdsFreeComps.Close;
 DataSetsOpen;
 Randomize;
 If (Random>0.98) then
  Begin
   MaxComps := 0;
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
   NotGood := nskCRC(@PrivRD,4,-1)-1417686703;
   Pswd := '@J:B%8^4#rg$;aQn4u5)_)({}[wgor!&';
   nskCodeInit(PrivRD,0,1,@Pswd[1]);
   nskRead(PrivRD,102,4,@MaxComps);
   nskDeCode(0,@Pswd[1],@MaxComps,4);
   nskRead(PrivRD,106,4,@CRC);
   nskDeCode(0,@Pswd[1],@CRC,4);
   nskEnCode(0,@CodePass,@PrivRD,4);
   Pswd := '@J:B%8^4#rg$;aQn4u5)_)({}[wgor!&';
   NotGood := NotGood+nskCRC(@MaxComps,4,-1)-CRC;
   try
    k := Trunc(169/(NotGood+MaxComps-Max(MaxComps,ibdsWorks.RecordCount+ibdsFreeComps.RecordCount)));
    SpeedButton5.OnClick := nil;
    sbInc.OnClick := SpeedButton12.OnClick;
    sbFreeComp.OnClick := SpeedButton12.OnClick;
    wwdbgFreeComps.DataSource := nil
   except
    SpeedButton5.OnClick := SpeedButton5.OnClick;
    sbInc.OnClick := sbInc.OnClick;
    sbFreeComp.OnClick := sbFreeComp.OnClick;
    wwdbgFreeComps.DataSource := dsFreeComps
   end
  End;
 ibdsWorks.EnableControls;
 ibdsFreeComps.EnableControls
end;

procedure TfrmMain.ibdsWorksAfterOpen(DataSet: TDataSet);
begin
 ibdsWorks.DisableControls;
 While NOT (ibdsWorks.Eof) do
  Begin
   If (ibdsWorksTIME_REMAIN.Value<=EncodeTime(0,1,0,0)) then
    Begin
     If (frmMain.FindComponent('frmAtEnd')=nil) then
      frmAtEnd := TfrmAtEnd.Create(frmMain);
     MessageBeep(MB_ICONEXCLAMATION);
     If (Pos(' '+ibdsWorksNUMBER.AsString+';',frmAtEnd.lblAtEnd.Caption)=0) then
      frmAtEnd.lblAtEnd.Caption := frmAtEnd.lblAtEnd.Caption+' '+ibdsWorksNUMBER.AsString+';';
     frmAtEnd.Show
    End;
   ibdsWorks.Next
  End;
 ibdsWorks.First;
 ibdsWorks.EnableControls;
 sbFreeComp.Enabled := (ibdsWorks.RecordCount>0);
 sbInc.Enabled := (ibdsWorks.RecordCount>0);
 sbDec.Enabled := (ibdsWorks.RecordCount>0);
 If (wwDBGrid1.SelectedList.Count>0) then
  try
   ibdsWorks.GotoBookmark(wwDBGrid1.SelectedList.items[0])
  except
  end
end;

procedure TfrmMain.DataSetsOpen;
begin
 ibdsWorks.Open;
 ibdsFreeComps.Open;
 ibdsWorks.FetchAll;
 ibdsFreeComps.FetchAll;
 fcStatusBar1.Panels[1].Text := 'Занято: '+IntToStr(ibdsWorks.RecordCount)+
                                ' Свободно: '+IntToStr(ibdsFreeComps.RecordCount);
 ibsGen_ID.SQL.Clear;
 ibsGen_ID.SQL.Add('select AMOUNT');
 ibsGen_ID.SQL.Add('from CASH_DESK');
 ibsGen_ID.ExecQuery;
 fcStatusBar1.Panels[2].Text := FormatFloat('#,##0.00',ibsGen_ID.FieldByName('AMOUNT').AsDouble);
 ibsGen_ID.Close
end;

procedure TfrmMain.N1Click(Sender: TObject);
 var SendStr : String;
begin
 If (psMain.Host<>'') and (ibdsWorksI_SPEED.Value>0) then
  Begin
   SendStr := 'OPEN '+ibdsWorksIP_ADDRESS.AsString+' '+ibdsWorksI_SPEED.AsString+' '+IntToStr(Trunc(86400*(ibdsWorksTIME_STOP.Value-now)));
   try
    psMain.Connect;
    If (psMain.Transaction(SendStr)='OK'#10) then
     MessageDlg('OK',mtInformation,[mbOK],0)
    else
     MessageDlg('Невозможно установить связь с сервером интернета.',mtError,[mbOK],0);
    psMain.Disconnect
   except
    psMain.Disconnect;
    tc := GetTickCount;
    While (Abs(GetTickCount-tc)<2000) do
    Application.ProcessMessages;
    try
     psMain.Connect;
     While NOT (Connected) do ;
     If (psMain.Transaction(SendStr)='OK'#10) then
      MessageDlg('OK',mtInformation,[mbOK],0)
     else
      MessageDlg('Невозможно установить связь с сервером интернета. Проверьте настройки',mtError,[mbOK],0);
     psMain.Disconnect;
    except
     MessageDlg('Невозможно установить связь с сервером интернета. Проверьте настройки',mtError,[mbOK],0)
    end
   end
  End
end;

procedure TfrmMain.psMainConnect(Sender: TObject);
begin
 Connected := True
end;

procedure TfrmMain.psMainDisconnect(Sender: TObject);
begin
 Connected := False
end;

procedure TfrmMain.SpeedButton1Click(Sender: TObject);
 var InpStream, OutStream : TFileStream;
     Pswd, UName, UPass : String;
begin
 ibsGen_ID.SQL.Clear;
 ibsGen_ID.SQL.Add('delete from UNORDER_TIME where TIME_START=TIME_STOP');
 ibsGen_ID.ExecQuery;
 ibsGen_ID.Close;
 trMain.CommitRetaining;
 (Sender as TSpeedButton).Enabled := False;
 If (FileExists(ExtractFilePath(Application.ExeName)+'XXX.xyz')) then
  If NOT (DeleteFile(ExtractFilePath(Application.ExeName)+'XXX.xyz')) then
   Begin
    MessageDlg('Невозможно создать временный файл.',mtError,[mbOK],0);
    Exit
   End;
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
  ibBS.Params.Clear;
  ibBS.Params.Add('user_name='+UName);
  ibBS.Params.Add('password='+UPass);
  ibBS.Attach();
  If (ibBS.Active) then
   Begin
    ibBS.ServiceStart;
    While (ibBS.IsServiceRunning) do
     Application.ProcessMessages;
    ibBS.Active := False
   End
  else
   Begin
    MessageDlg('Невозможно соединиться с сервером БД.',mtError,[mbOK],0);
    Exit
   End;
 finally
  If (ibBS.Active) then
   ibBS.Detach();
  Screen.Cursor := crDefault
 end;
 InpStream := TFileStream.Create(ExtractFilePath(Application.ExeName)+'XXX.xyz',fmOpenRead);
 OutStream := TFileStream.Create(ExtractFilePath(Application.ExeName)+'XXX.rep',fmCreate);
 Lzrw.InputStream := InpStream;
 Lzrw.OutputStream := OutStream;
 Lzrw.Compress;
 OutStream.Position := 0;
 OutStream.Free;
 InpStream.Free;
 DeleteFile(ExtractFilePath(Application.ExeName)+'XXX.xyz');
 If (NMSMTP1.PostMessage.ToAddress.Count>0) and (NMSMTP1.PostMessage.ToAddress[0]<>'') then
  Begin
   try
    NMSMTP1.Connect;
   except
    MessageDlg('Невозможно установить связь с почтовым сервером. Проверьте настройки',mtError,[mbOK],0);
    Exit
   end;
   While NOT (NMSMTP1.Connected) do
    Application.ProcessMessages;
   NMSMTP1.PostMessage.Attachments.Add(ExtractFilePath(Application.ExeName)+'XXX.rep');
   NMSMTP1.SendMail;
   While NOT (Sended) do
    Application.ProcessMessages;
   NMSMTP1.Disconnect;
   Sended := False;
   DeleteFile(ExtractFilePath(Application.ExeName)+'XXX.rep')
  End;
 (Sender as TSpeedButton).Enabled := True
end;

procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
 NMSMTP1.Abort
end;

procedure TfrmMain.NMSMTP1Success(Sender: TObject);
begin
 Sended := True
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
 var IniFile : TRegIniFile;
     k : Integer;
begin
 IniFile := TRegIniFile.Create;
 IniFile.RootKey := HKEY_CURRENT_USER;
 IniFile.OpenKey('\Software\WizardSoft\Wizard iGame',True);
 IniFile.WriteInteger('Wizard iGame Admin','frmMain.Left',frmMain.Left);
 IniFile.WriteInteger('Wizard iGame Admin','frmMain.Top',frmMain.Top);
 Case (frmMain.WindowState) of
  wsMinimized : IniFile.WriteInteger('Wizard iGame Admin','frmMain.WindowState',0);
  wsNormal    : Begin
                 IniFile.WriteInteger('Wizard iGame Admin','frmMain.Height',frmMain.Height);
                 IniFile.WriteInteger('Wizard iGame Admin','frmMain.Width',frmMain.Width);
                 IniFile.WriteInteger('Wizard iGame Admin','frmMain.WindowState',1)
                End;
  wsMaximized : IniFile.WriteInteger('Wizard iGame Admin','frmMain.WindowState',2)
 end;
 For k := 0 to Pred(frmMain.ComponentCount) do
  If (Components[k] is TField) then
   Begin
    IniFile.WriteString('Wizard iGame Admin','frmMain.'+(Components[k] as TField).Name+'.DisplayLabel',(Components[k] as TField).DisplayLabel);
    IniFile.WriteInteger('Wizard iGame Admin','frmMain.'+(Components[k] as TField).Name+'.DisplayWidth',(Components[k] as TField).DisplayWidth);
    IniFile.WriteInteger('Wizard iGame Admin','frmMain.'+(Components[k] as TField).Name+'.Index',(Components[k] as TField).Index);
    If ((Components[k] is TNumericField)) then
     IniFile.WriteString('Wizard iGame Admin','frmMain.'+(Components[k] as TNumericField).Name+'.DisplayFormat',(Components[k] as TNumericField).DisplayFormat);
     IniFile.WriteBool('Wizard iGame Admin','frmMain.'+(Components[k] as TField).Name+'.Visible',(Components[k] as TField).Visible)
   End;
 IniFile.CloseKey;
 IniFile.Free
end;

procedure TfrmMain.wwDBGrid1CalcCellColors(Sender: TObject; Field: TField;
  State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
 If NOT(ibdsWorksTIME_REMAIN.IsNull) and (ibdsWorksTIME_REMAIN.Value<=EncodeTime(0,5,0,0)) then
  If (ibdsWorksTIME_REMAIN.Value<=EncodeTime(0,1,0,0)) then
   ABrush.Color := clRed
  else
   Begin
    ABrush.Color := clYellow;
    If (Highlight) then AFont.Color := clBlack
   End;
 If (ibdsWorksCHECKED.AsInteger=1) then
  AFont.Style := AFont.Style+[fsBold]
 else
  AFont.Style := AFont.Style-[fsBold];
 If (ibdsWorksLOCKED.AsInteger=1) then
  AFont.Style := AFont.Style+[fsStrikeOut]
 else
  AFont.Style := AFont.Style-[fsStrikeOut]
end;

procedure TfrmMain.N4Click(Sender: TObject);
begin
 ibsGen_ID.SQL.Clear;
 ibsGen_ID.SQL.Add('update ORDERS set CHECKED=:CHECKED where ID='+ibdsWorksID.AsString);
 ibsGen_ID.GenerateParamNames := True;
 ibdsWorks.DisableControls;
 ibdsWorks.Edit;
 If (ibdsWorksCHECKED.AsInteger<>1) then
  ibdsWorksCHECKED.Value := 1
 else
  ibdsWorksCHECKED.AsVariant := null;
 ibdsWorks.Post;
 ibdsWorks.EnableControls;
 ibsGen_ID.ParamByName('CHECKED').AsVariant := ibdsWorksCHECKED.AsVariant;
 try
  ibsGen_ID.ExecQuery;
  trMain.CommitRetaining
 except
  MessageDlg('Невозможно сохранить. Утеряна связь с базой данных.',mtError,[mbOK],0)
 end
end;

procedure TfrmMain.sbCancelProgClick(Sender: TObject);
begin
 try
  ibdsMainProg.CancelUpdates;
  trMain.RollbackRetaining;
 except
 end;
 StteChange('Prog', False);
 ibdsCompProg.Close;
 ibdsCompProg.Open;
 Timer1.Enabled:=True;
 wwdbgComps.Visible := NOT(ibdsMainProg.RecordCount=0);
end;

procedure TfrmMain.sbApplyProgClick(Sender: TObject);
var BookMark : Integer;
begin
 BookMark := ibdsMainProgID_PROG.Value;
 try
  ibdsMainProg.ApplyUpdates;
  trMain.CommitRetaining;
 except
  trMain.RollbackRetaining;
  MessageDlg('Ошибка сохранения. Проверьте введенные данные.', mtError, [mbOK],0);
 end;
 try
  StteChange('Prog', False);
  ibdsMainProg.DisableControls;
  ibdsMainProg.Close;
  ibdsMainProg.Open;
  ibdsMainProg.EnableControls;
 except
 end;
 wwdbgComps.SelectedList.Clear;
 ibdsMainProg.Locate('ID_PROG', Bookmark, []);
 Timer1.Enabled := True;
 wwdbgComps.Visible := NOT(ibdsMainProg.RecordCount=0);
 SelectAllEnabDisab
end;

procedure TfrmMain.sbDeleteProgClick(Sender: TObject);
var i : Integer;
begin
 If (wwdbgComps.HasFocus) then
  Begin
   If (wwdbgComps.SelectedList.Count=0) then
    ibdsCompProg.Delete
   else
    Begin
     ibdsCompProg.DisableControls;
     for i := 0 to wwdbgComps.SelectedList.Count-1 do
      Begin
       ibdsCompProg.GotoBookmark(wwdbgComps.SelectedList.items[i]);
       ibdsCompProg.Freebookmark(wwdbgComps.SelectedList.items[i]);
       ibdsCompProg.Delete;
      end;
     wwdbgComps.SelectedList.Clear;
     ibdsCompProg.EnableControls;
    End;
  End
 else
  ibdsMainProg.Delete;
 StteChange('Prog', True);
end;

procedure TfrmMain.sbAddProgClick(Sender: TObject);
begin
 If (wwdbgComps.HasFocus) then
  Begin
   wwdbgComps.SelectedList.Clear;
   ibdsCompProg.Append;
  End
 else
  Begin
   ibdsMainProg.Append;
   wwdbgComps.Visible := False
  End;
end;

procedure TfrmMain.wwdblcCompsBeforeDropDown(Sender: TObject);
begin
 ibdsCustomComps.Active := True;
end;


procedure TfrmMain.DBImage1DblClick(Sender: TObject);
var IconName : String;
    Icon   : TIcon;
    Bitmap : TBitmap;
begin
 If (opdIcon.Execute) then
  Begin
   opdIcon.InitialDir := opdIcon.FileName;
   IconName := opdIcon.FileName;
   If (UpCase(IconName[Length(IconName)])='O') then
    Begin
     Icon   := TIcon.Create;
     Bitmap := TBitmap.Create;
     Icon.LoadFromFile(IconName);
     Bitmap.Width := Icon.Width;
     Bitmap.Height := Icon.Height;
     Bitmap.Canvas.Draw(0, 0, Icon);
     Delete(IconName,Length(IconName)-2,3);
     IconName := IconName+'bmp';
     Bitmap.SaveToFile(IconName);
     Icon.Free;
     Bitmap.Free;
     ibdsMainProg.Edit;
     ibdsMainProgICON.LoadFromFile(IconName);
     DeleteFile(IconName);
    End
   else
    Begin
     ibdsMainProg.Edit;
     ibdsMainProgICON.LoadFromFile(IconName);
    End;
   GetHashValue;
  End;
end;

procedure TfrmMain.ibdsMainProgAfterScroll(DataSet: TDataSet);
begin
 wwdbgComps.Visible := NOT(ibdsMainProg.RecordCount=0);
 sbDeleteProg.Enabled := NOT (DataSet.RecordCount=0);
 SelectAllEnabDisab;
end;

procedure TfrmMain.wwdbgProgOfCompsCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
 If (ibdsMainProgNUM_OF_COMPS.AsInteger=0) then
  AFont.Style := AFont.Style+[fsItalic];
end;

procedure TfrmMain.ibdsMainProgNAMEChange(Sender: TField);
begin
 GetHashValue;
end;

procedure TfrmMain.ibdsMainProgPATHChange(Sender: TField);
begin
 GetHashValue;
end;

procedure TfrmMain.ibdsCompProgNewRecord(DataSet: TDataSet);
begin
 wwdbgComps.SelectedList.Clear;
end;

procedure TfrmMain.AddAllComps;
begin
 ibdsCompProg.DisableControls;
 ibdsCompProg.Delete;
 ibdsCustomComps.Close;
 ibdsCustomComps.Open;
 ibdsCustomComps.Next;
 While NOT (ibdsCustomComps.Eof) do
  Begin
   ibdsCompProg.Append;
   ibdsCompProgID_PROG.Value := ibdsMainProgID_PROG.AsInteger;
   ibdsCompProgID.Value := ibdsCustomCompsID.AsInteger;
   ibdsCompProgNUMBER.Value := ibdsCustomCompsNUMBER.AsString;
   ibdsCompProgNETWORK_NAME.Value := ibdsCustomCompsNETWORK_NAME.AsString;
   ibdsCompProgDESCRIPTION.Value := ibdsCustomCompsDESCRIPTION.AsString;
   ibdsCustomComps.Next;
  End;
 ibdsCompProg.EnableControls;
end;

procedure TfrmMain.wwdbgCompsIButtonClick(Sender: TObject);
begin
 wwdbgComps.SetFocus;
 wwdbgComps.SelectAll;
end;

procedure TfrmMain.NShutDownClick(Sender: TObject);
begin
 nmmsgSendMsg.Host := ibdsWorksIP_ADDRESS.AsString;
 try
  nmmsgSendMsg.PostIt('ShutDown');
 except
  try
   nmmsgSendMsg.PostIt('ShutDown');
  except
   ShowMessage('Не удаётся передать команду.');
  end;
 end;
end;

procedure TfrmMain.NResetClick(Sender: TObject);
begin
 nmmsgSendMsg.Host := ibdsWorksIP_ADDRESS.AsString;
 try
  nmmsgSendMsg.PostIt('Reset');
 except
  try
   nmmsgSendMsg.PostIt('Reset');
  except
   ShowMessage('Не удаётся передать команду.');
  end;
 end;
end;

procedure TfrmMain.NLockUnLockClick(Sender: TObject);
var Posted : Boolean;
    PostStr : String;
    NewValue : Integer;
begin
 Posted := True;
 nmmsgSendMsg.Host := ibdsWorksIP_ADDRESS.AsString;
 If (ibdsWorksLOCKED.AsInteger<>1) then
  Begin
   PostStr := 'Lock';
   NewValue := 1
  End
 Else
  Begin
   PostStr := 'UnLock';
   NewValue := 0
  End;
 try
  nmmsgSendMsg.PostIt(PostStr)
 except
  try
   nmmsgSendMsg.PostIt(PostStr)
  except
   Posted := False;
   ShowMessage('Не удаётся послать команду.')
  end
 end;
 If (Posted) then
  Begin
   ibdsWorks.Edit;
   ibdsWorksLOCKED.Value := NewValue;
   ibsGen_ID.SQL.Clear;
   ibsGen_ID.SQL.Add('update ORDERS set LOCKED='+IntToStr(NewValue)+' where ID='+ibdsWorksID.AsString);
   ibdsWorks.Post;
   try
    ibsGen_ID.ExecQuery;
    trMain.CommitRetaining
   except
    MessageDlg('Утеряна связь с базой данных.',mtError,[mbOK],0)
   end
  End;
end;

procedure TfrmMain.PopupMenu1Popup(Sender: TObject);
begin
 If (ibdsWorksLOCKED.Value=1) then
  NLockUnLock.Caption := 'Разблокировать компьютер'
 else
  NLockUnLock.Caption := 'Блокировать компьютер';
end;

procedure TfrmMain.wwdbgCompsExit(Sender: TObject);
begin
 wwdbgComps.SelectedList.Clear;
end;

procedure TfrmMain.ibdsMainProgNewRecord(DataSet: TDataSet);
begin
 ibsGetID.SQL.Clear;
 ibsGetID.SQL.Add('select gen_id(GEN_PROG_ID,1) from rdb$database');
 ibsGetID.ExecQuery;
 ibdsMainProgID_PROG.Value := ibsGetID.FieldByName('Gen_ID').AsInteger;
 ibsGetID.Close;
 ibdsMainProgNUM_OF_COMPS.Value := 0;
end;

procedure TfrmMain.wwdblcCompsCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
 If (modified) then
  Begin
   If (ibdsCustomCompsID.AsInteger=-1) then
    AddAllComps
   else
    Begin
     ibdsCompProgID_PROG.AsInteger := ibdsMainProgID_PROG.AsInteger;
     ibdsCompProgID.Value := ibdsCustomCompsID.AsInteger;
     ibdsCompProgNUMBER.Value := ibdsCustomCompsNUMBER.AsString;
     ibdsCompProgNETWORK_NAME.Value := ibdsCustomCompsNETWORK_NAME.AsString;
     ibdsCompProgDESCRIPTION.Value := ibdsCustomCompsDESCRIPTION.AsString;
    End;
   ibdsCompProg.Post;
   ibdsCompProg.Close;
   ibdsCompProg.Open;
   StteChange('Prog', True);
   wwdbgComps.SelectedList.Clear;
  End;
 ibdsCustomComps.Active := False;
end;

procedure TfrmMain.wwdbgCompsEnter(Sender: TObject);
begin
 sbDeleteProg.Enabled := NOT (ibdsCompProg.RecordCount=0);
end;

procedure TfrmMain.tmPingTimer(Sender: TObject);
 var
  hIP : THandle;
  pingBuffer : array [0..31] of Char;
  pIpe : ^icmp_echo_reply;
  pHostEn : PHostEnt;
  wVersionRequested : WORD;
  lwsaData : WSAData;
  error : DWORD;
  destAddress : In_Addr;
begin
 Screen.Cursor := crHourGlass;
 Timer1.Enabled := False;
 tmPing.Enabled := False;
 hIP := IcmpCreateFile();
 GetMem(pIpe,SizeOf(icmp_echo_reply)+SizeOf(pingBuffer));
 pIpe.Data := @pingBuffer;
 pIpe.DataSize := sizeof(pingBuffer);
 wVersionRequested := MakeWord(1,1);
 error := WSAStartup(wVersionRequested,lwsaData);
 If (error <> 0) then
  Exit;
 try
  ibsAddAllComps.SQL.Clear;
  ibsAddAllComps.SQL.Add('execute procedure SET_UNORDER_TIME :CompId, :LastCheckTime');
  ibsGetId.SQL.Clear;
  ibsGetId.SQL.Add('select ID, IP_ADDRESS from COMPS where ID NOT IN (select O.COMP_ID from ORDERS O where (O.TIME_START!>current_timestamp) and (O.TIME_STOP!<current_timestamp)) and (VALID=1) and NOT(IP_ADDRESS is null)');
  ibsGetId.ExecQuery;
  While NOT (ibsGetId.Eof) do
   Begin
    pHostEn := GetHostByName(PChar(ibsGetId.FieldByName('IP_ADDRESS').AsString));
    error := GetLastError();
    If (error<>0) then
     Continue;
    destAddress := PInAddr(pHostEn^.h_addr_list^)^;
    // Посылаем ping-пакет
    IcmpSendEcho(hIP,
                 destAddress.S_addr,
                 @pingBuffer,
                 sizeof(pingBuffer),
                 Nil,
                 pIpe,
                 sizeof(icmp_echo_reply) + sizeof(pingBuffer),
                 10);
    error := GetLastError();
    If (error=0) then
     Begin
      nmmsgSendMsg.Host := ibsGetId.FieldByName('IP_ADDRESS').AsString;
      try
       nmmsgSendMsg.PostIt('');
      except
       ibsAddAllComps.ParamByName('CompId').AsInteger := ibsGetId.FieldByName('ID').AsInteger;
       ibsAddAllComps.ParamByName('LastCheckTime').AsDateTime := Now-EncodeTime(0, Trunc(tmPing.Interval/60000), 10, 0);
       try
        ibsAddAllComps.ExecQuery;
        ibsAddAllComps.Close
       except
       end
      end
     End;
    ibsGetId.Next
   End;
  ibsGetId.Close;
 except
 end;
 trMain.CommitRetaining;
 IcmpCloseHandle(hIP);
 WSACleanup();
 FreeMem(pIpe);
 Screen.Cursor := crDefault;
 Timer1.Enabled := True;
 tmPing.Enabled := True
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

procedure TfrmMain.wwDBGrid1CalcTitleAttributes(Sender: TObject;
  AFieldName: String; AFont: TFont; ABrush: TBrush;
  var ATitleAlignment: TAlignment);
begin
  Case (Sender as TComponent).Tag of
  0: wwDBGridCalcTitleAttributes(Sender, AFieldName, AFieldName, AFont, ABrush, ATitleAlignment, OrderByMainWorks);
  1: wwDBGridCalcTitleAttributes(Sender, AFieldName, AFieldName, AFont, ABrush, ATitleAlignment, OrderByMainFreeComps);
  2: wwDBGridCalcTitleAttributes(Sender, AFieldName, AFieldName, AFont, ABrush, ATitleAlignment, OrderByMainComps);
  3: wwDBGridCalcTitleAttributes(Sender, AFieldName, AFieldName, AFont, ABrush, ATitleAlignment, OrderByMainTariffs);
  4: wwDBGridCalcTitleAttributes(Sender, AFieldName, AFieldName, AFont, ABrush, ATitleAlignment, OrderByCompProg);
  5: wwDBGridCalcTitleAttributes(Sender, AFieldName, AFieldName, AFont, ABrush, ATitleAlignment, OrderByMainProg);
 end
end;

procedure TfrmMain.wwDBGridCalcTitleAttributes(Sender: TObject;
  AFieldName, AFieldNameReal: String; AFont: TFont; ABrush: TBrush;
  var ATitleAlignment: TAlignment; OrderBy: String);
 var FieldPosRes, Number : String;
begin
 If ((Sender as TwwDBGrid).DataSource=nil) then
  Exit;
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
        Begin
         ((Sender as TwwDBGrid).DataSource.DataSet as TIBDataSet).FieldByName(AFieldName).DisplayLabel := Copy(((Sender as TwwDBGrid).DataSource.DataSet as TIBDataSet).FieldByName(AFieldName).DisplayLabel,Pos(': ',((Sender as TwwDBGrid).DataSource.DataSet as TIBDataSet).FieldByName(AFieldName).DisplayLabel)+2,Length(((Sender as TwwDBGrid).DataSource.DataSet as TIBDataSet).FieldByName(AFieldName).DisplayLabel)-Pos(': ',((Sender as TwwDBGrid).DataSource.DataSet as TIBDataSet).FieldByName(AFieldName).DisplayLabel)-1);
         (Sender as TwwDBGrid).ColumnByName(AFieldName).DisplayLabel := Copy((Sender as TwwDBGrid).ColumnByName(AFieldName).DisplayLabel,Pos(': ',(Sender as TwwDBGrid).ColumnByName(AFieldName).DisplayLabel)+2,Length((Sender as TwwDBGrid).ColumnByName(AFieldName).DisplayLabel)-Pos(': ',(Sender as TwwDBGrid).ColumnByName(AFieldName).DisplayLabel)-1)
        End;
         If (Number<>'') then
          ((Sender as TwwDBGrid).DataSource.DataSet as TIBDataSet).FieldByName(AFieldName).DisplayLabel := Number+((Sender as TwwDBGrid).DataSource.DataSet as TIBDataSet).FieldByName(AFieldName).DisplayLabel
      End
    End
   else
    If (Number='') or (Copy((Sender as TwwDBGrid).ColumnByName(AFieldName).DisplayLabel,1,Length(Number))<>Number) then
     Begin
      If (Pos(': ',(Sender as TwwDBGrid).ColumnByName(AFieldName).DisplayLabel)>0) then
       Begin
        ((Sender as TwwDBGrid).DataSource.DataSet as TIBDataSet).FieldByName(AFieldName).DisplayLabel := Copy(((Sender as TwwDBGrid).DataSource.DataSet as TIBDataSet).FieldByName(AFieldName).DisplayLabel,Pos(': ',((Sender as TwwDBGrid).DataSource.DataSet as TIBDataSet).FieldByName(AFieldName).DisplayLabel)+2,Length(((Sender as TwwDBGrid).DataSource.DataSet as TIBDataSet).FieldByName(AFieldName).DisplayLabel)-Pos(': ',((Sender as TwwDBGrid).DataSource.DataSet as TIBDataSet).FieldByName(AFieldName).DisplayLabel)-1);
        (Sender as TwwDBGrid).ColumnByName(AFieldName).DisplayLabel := Copy((Sender as TwwDBGrid).ColumnByName(AFieldName).DisplayLabel,Pos(': ',(Sender as TwwDBGrid).ColumnByName(AFieldName).DisplayLabel)+2,Length((Sender as TwwDBGrid).ColumnByName(AFieldName).DisplayLabel)-Pos(': ',(Sender as TwwDBGrid).ColumnByName(AFieldName).DisplayLabel)-1)
       End;
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

procedure TfrmMain.wwdbgProgOfCompsEnter(Sender: TObject);
begin
 sbDeleteProg.Enabled := NOT (ibdsMainProg.RecordCount=0);
end;

procedure TfrmMain.SelectAllEnabDisab;
begin
 If (ibdsCompProg.RecordCount>1) then
  wwdbgCompsIButton.Enabled := True
 else
  wwdbgCompsIButton.Enabled := False;
end;

procedure TfrmMain.GetHashValue;
begin
 Stream := TMemoryStream.Create;
 ibdsMainProgICON.SaveToStream(Stream);
 ibdsMainProgHASH.AsInteger := Hash(IntToStr(Hash(ibdsMainProgNAME.AsString+ibdsMainProgPATH.AsString))+IntToStr(CRC(Stream)));
 Stream.Free;
end;

procedure TfrmMain.ibdsFreeCompsAfterOpen(DataSet: TDataSet);
begin
 If wwdbgFreeComps.SelectedList.Count>0 then
  try
   ibdsFreeComps.GotoBookmark(wwdbgFreeComps.SelectedList.items[0])
  except
  end
end;

procedure TfrmMain.wwdbgCompsKeyPress(Sender: TObject; var Key: Char);
begin
 If (Key<>#27) then Key:=#0
end;

end.
