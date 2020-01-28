object frmMain: TfrmMain
  Left = 258
  Top = 166
  Align = alTop
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Оставшееся время'
  ClientHeight = 151
  ClientWidth = 267
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  PopupMenu = PopupMenu1
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnMouseDown = FormMouseDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Image: TImage
    Left = 0
    Top = 0
    Width = 267
    Height = 151
    Align = alClient
    AutoSize = True
    Center = True
  end
  object lbWizard: TfcLabel
    Left = -318
    Top = 101
    Width = 684
    Height = 25
    Caption = 
      'Wizard iGame©   ЗАО "Визард Престиж". Саратов, ул. Вольская, 70.' +
      ' Тел./факс: (8452) 72 04 70.   www.wiznet.ru'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clSilver
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Pitch = fpFixed
    Font.Style = [fsBold]
    ParentFont = False
    TextOptions.Alignment = taCenter
    TextOptions.ExtrudeEffects.Enabled = True
    TextOptions.ExtrudeEffects.NearColor = clBtnFace
    TextOptions.ExtrudeEffects.Orientation = fcTopRight
    TextOptions.Shadow.XOffset = 2
    TextOptions.Shadow.YOffset = 2
    TextOptions.Style = fclsOutline
    TextOptions.VAlignment = vaTop
    Transparent = True
  end
  object Panel1: TPanel
    Left = 174
    Top = 40
    Width = 40
    Height = 21
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    Visible = False
    OnMouseDown = FormMouseDown
    object lblTime: TfcLabel
      Left = 4
      Top = 3
      Width = 33
      Height = 16
      Caption = '00:00'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TextOptions.Alignment = taLeftJustify
      TextOptions.OutlineColor = clRed
      TextOptions.Style = fclsRaised
      TextOptions.VAlignment = vaTop
      Transparent = True
      OnMouseDown = FormMouseDown
    end
  end
  object ibdMain: TIBDatabase
    Params.Strings = (
      'user_name=CLIENT'
      'password=~Idkfmumuniy'
      'lc_ctype=WIN1251')
    LoginPrompt = False
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    AllowStreamedConnected = False
    Left = 1
    Top = 1
  end
  object trMain: TIBTransaction
    Active = False
    DefaultDatabase = ibdMain
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saNone
    Left = 30
    Top = 1
  end
  object ibsRemain: TIBSQL
    Database = ibdMain
    ParamCheck = True
    SQL.Strings = (
      '')
    Transaction = trMain
    Left = 59
    Top = 1
  end
  object PopupMenu1: TPopupMenu
    Left = 88
    Top = 1
    object N1: TMenuItem
      Caption = 'Поверх всех'
      OnClick = N1Click
    end
  end
  object RxTimerList1: TRxTimerList
    Active = True
    Left = 168
    Top = 2
    object tmClock: TRxTimerEvent
      Interval = 12000
      OnTimer = tmClockTimer
    end
    object tmRemain: TRxTimerEvent
      Interval = 90000
      OnTimer = tmRemainTimer
    end
    object tmMessager: TRxTimerEvent
      Cycled = False
      Enabled = False
      Interval = 100
      OnTimer = tmMessagerTimer
    end
  end
  object NMMSGServ1: TNMMSGServ
    Port = 6711
    ReportLevel = 0
    OnMSG = NMMSGServ1MSG
    Left = 197
    Top = 2
  end
end
