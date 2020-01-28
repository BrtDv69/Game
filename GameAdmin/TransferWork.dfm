object frmTransferWork: TfrmTransferWork
  Left = 210
  Top = 135
  Width = 420
  Height = 224
  Caption = 'Перебросить время'
  Color = clBtnFace
  Constraints.MaxHeight = 224
  Constraints.MaxWidth = 420
  Constraints.MinHeight = 224
  Constraints.MinWidth = 420
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Icon.Data = {
    0000010001001010000000000000680300001600000028000000100000002000
    0000010018000000000040030000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    00000000000000000000000000000000000000000000000000000000000000FF
    0000FF0000FF0000FF0000FF0000000000000000000000000000000000000000
    000000000000000000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
    00FF0000000000000000000000000000000000000000FF0000FF0000FF000000
    7F7F7F0000007F7F7F0000000000FF0000FF0000FF0000000000000000000000
    000000FF0000FF0000FF00000000000000000000000000000000000000000000
    00FF0000FF0000FF0000000000000000000000FF0000FF000000000000000000
    7F7F7F0000007F7F7F0000000000000000000000FF0000FF0000000000000000
    FF0000FF00000000000000000000000000000000000000000000000000000000
    00000000000000FF0000FF0000000000FF0000FF000000000000000000000000
    0000000000000000000000000000000000000000000000FF0000FF0000000000
    FF0000FF0000000000000000000000007F7F7F0000007F7F7F00000000000000
    00000000000000000000000000000000FF0000FF000000000000000000000000
    0000800000000000800000000000000000000000000000000000000000000000
    FF0000FF0000000000000000000000000000000000000000000000000000FF00
    00FF0000FF0000FF0000FF0000000000000000FF0000FF000000000000000000
    0000000000000000000000000000000000FF0000FF0000FF0000FF0000000000
    000000FF0000FF0000FF00000000000000000000000000000000000000000000
    00000000FF0000FF0000FF0000000000000000000000FF0000FF0000FF000000
    7F7F7F0000007F7F7F0000000000FF0000FF0000FF0000FF0000FF0000000000
    000000000000000000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
    00FF0000000000000000FF0000000000000000000000000000000000000000FF
    0000FF0000FF0000FF0000FF000000000000000000000000000000000000FFFF
    0000F83F0000E00F0000C44700008C6300009C7300003FF900003EF900003C7F
    00003C7F00003C4100009C6100008C710000C4410000E00D0000F83F0000}
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 412
    Height = 197
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object Panel2: TPanel
      Left = 0
      Top = 153
      Width = 412
      Height = 44
      Align = alBottom
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 1
      object sbApply: TSpeedButton
        Left = 132
        Top = 22
        Width = 72
        Height = 19
        Cursor = crHandPoint
        Hint = 
          'Применить все'#13#10'сделанные изменения|Применить все сделанные измен' +
          'ения'
        AllowAllUp = True
        Caption = 'OK'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Glyph.Data = {
          46010000424D460100000000000076000000280000001C0000000D0000000100
          040000000000D000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          33333333333333330000333333333333333333F3333333330000333303333333
          33333F3F3333333300003330003333333333F333F33333330000330000033333
          333F33333F33333300003000300033333373333333F333330000300333000333
          337333F7333F33330000333333300033333777337333F3330000333333330003
          3333333337333F33000033333333300033333333337333F30000333333333300
          3333333333373373000033333333333333333333333377330000333333333333
          33333333333333330000}
        NumGlyphs = 2
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        Transparent = False
        OnClick = sbApplyClick
      end
      object sbCancel: TSpeedButton
        Left = 208
        Top = 22
        Width = 72
        Height = 19
        Cursor = crHandPoint
        Hint = 
          'Отменить все'#13#10'сделанные изменения|Отменить все сделанные изменен' +
          'ия'
        AllowAllUp = True
        Anchors = [akTop, akRight]
        Caption = 'Отмена'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Glyph.Data = {
          46010000424D460100000000000076000000280000001C0000000D0000000100
          040000000000D000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333000033333333333333333FF33333FF330000333003333300
          3333733F333733F3000033300033300033337333F37333F30000333300030003
          3333373337333F330000333330000033333333733333F3330000333333000333
          33333337333F33330000333330000033333333733333F3330000333300030003
          3333373337333F33000033300033300033337333F37333F30000333003333300
          3333733F333733F3000033333333333333333773333377330000333333333333
          33333333333333330000}
        NumGlyphs = 2
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        Transparent = False
        OnClick = sbCancelClick
      end
      object Label4: TLabel
        Left = 67
        Top = 3
        Width = 133
        Height = 16
        Caption = 'Перебросить время:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lblMany: TLabel
        Left = 242
        Top = 3
        Width = 102
        Height = 16
        Caption = 'стоимостью: 0р.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object tpDuration: TwwDBDateTimePicker
        Left = 202
        Top = 2
        Width = 34
        Height = 19
        Hint = 'часы : минуты'
        BorderStyle = bsNone
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        Epoch = 1950
        ButtonEffects.Transparent = True
        ButtonEffects.Flat = True
        Frame.Enabled = True
        Frame.Transparent = True
        Interval.MinutesInterval = 5
        ParentShowHint = False
        ShowHint = True
        ShowButton = False
        TabOrder = 0
        UnboundDataType = wwDTEdtTime
        DisplayFormat = 'hh:nn'
        OnChange = tpDurationChange
      end
    end
    object Panel3: TPanel
      Left = 0
      Top = 0
      Width = 206
      Height = 153
      Align = alLeft
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 2
      object Label5: TLabel
        Left = 88
        Top = 132
        Width = 41
        Height = 16
        Caption = 'денег:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label6: TLabel
        Left = 4
        Top = 116
        Width = 125
        Height = 16
        Caption = 'Осталось времени:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label8: TLabel
        Left = 4
        Top = 21
        Width = 76
        Height = 16
        Caption = 'Компьютер:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object DBText1: TDBText
        Left = 82
        Top = 21
        Width = 52
        Height = 16
        AutoSize = True
        DataField = 'NUMBER'
        DataSource = dsDonor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label9: TLabel
        Left = 4
        Top = 39
        Width = 47
        Height = 16
        Caption = 'Тариф:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object DBText2: TDBText
        Left = 54
        Top = 41
        Width = 42
        Height = 13
        AutoSize = True
        DataField = 'TARIFF_NAME'
        DataSource = dsDonor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object fcLabel1: TfcLabel
        Left = 4
        Top = 2
        Width = 115
        Height = 16
        Caption = 'Перебросить с:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TextOptions.Alignment = taLeftJustify
        TextOptions.Style = fclsLowered
        TextOptions.VAlignment = vaTop
      end
      object DBText3: TDBText
        Left = 132
        Top = 116
        Width = 52
        Height = 16
        AutoSize = True
        DataField = 'Time_Remain'
        DataSource = dsDonor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object DBText4: TDBText
        Left = 132
        Top = 132
        Width = 52
        Height = 16
        AutoSize = True
        DataField = 'Many_Remain'
        DataSource = dsDonor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 4
        Top = 57
        Width = 95
        Height = 16
        Caption = 'Время начала:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label1: TLabel
        Left = 4
        Top = 93
        Width = 95
        Height = 16
        Caption = 'Длительность:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label7: TLabel
        Left = 26
        Top = 75
        Width = 73
        Height = 16
        Caption = 'окончания:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object DBText5: TDBText
        Left = 101
        Top = 57
        Width = 52
        Height = 16
        AutoSize = True
        DataField = 'TIME_START'
        DataSource = dsDonor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object DBText6: TDBText
        Left = 101
        Top = 75
        Width = 52
        Height = 16
        AutoSize = True
        DataField = 'TIME_STOP'
        DataSource = dsDonor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object DBText7: TDBText
        Left = 101
        Top = 93
        Width = 52
        Height = 16
        AutoSize = True
        DataField = 'Duration'
        DataSource = dsDonor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
    end
    object Panel4: TPanel
      Left = 206
      Top = 0
      Width = 206
      Height = 153
      Align = alClient
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 0
      object fcLabel2: TfcLabel
        Left = 4
        Top = 2
        Width = 125
        Height = 16
        Caption = 'Перебросить на:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TextOptions.Alignment = taLeftJustify
        TextOptions.Style = fclsLowered
        TextOptions.VAlignment = vaTop
      end
      object Label10: TLabel
        Left = 4
        Top = 21
        Width = 76
        Height = 16
        Caption = 'Компьютер:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label11: TLabel
        Left = 4
        Top = 39
        Width = 47
        Height = 16
        Caption = 'Тариф:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label12: TLabel
        Left = 4
        Top = 57
        Width = 95
        Height = 16
        Caption = 'Время начала:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label13: TLabel
        Left = 26
        Top = 75
        Width = 73
        Height = 16
        Caption = 'окончания:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label14: TLabel
        Left = 4
        Top = 93
        Width = 95
        Height = 16
        Caption = 'Длительность:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label15: TLabel
        Left = 4
        Top = 116
        Width = 125
        Height = 16
        Caption = 'Осталось времени:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label16: TLabel
        Left = 88
        Top = 132
        Width = 41
        Height = 16
        Caption = 'денег:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object DBText8: TDBText
        Left = 101
        Top = 57
        Width = 52
        Height = 16
        AutoSize = True
        DataField = 'TIME_START'
        DataSource = dsAcceptor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object DBText9: TDBText
        Left = 101
        Top = 75
        Width = 52
        Height = 16
        AutoSize = True
        DataField = 'TIME_STOP'
        DataSource = dsAcceptor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object DBText10: TDBText
        Left = 101
        Top = 93
        Width = 59
        Height = 16
        AutoSize = True
        DataField = 'Duration'
        DataSource = dsAcceptor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object DBText11: TDBText
        Left = 131
        Top = 116
        Width = 59
        Height = 16
        AutoSize = True
        DataField = 'Time_Remain'
        DataSource = dsAcceptor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object DBText12: TDBText
        Left = 131
        Top = 132
        Width = 59
        Height = 16
        AutoSize = True
        DataField = 'Many_Remain'
        DataSource = dsAcceptor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object wwDBLookupCombo1: TwwDBLookupCombo
        Left = 82
        Top = 20
        Width = 121
        Height = 19
        BorderStyle = bsNone
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NUMBER'#9'10'#9'Номер'#9'F'
          'CLASS'#9'10'#9'Класс'#9'F')
        DataField = 'COMP_ID'
        DataSource = dsAcceptor
        LookupTable = ibdsComps
        LookupField = 'ID'
        Options = [loColLines, loTitles]
        ButtonEffects.Transparent = True
        ButtonEffects.Flat = True
        Frame.Enabled = True
        Frame.Transparent = True
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
        OnCloseUp = wwDBLookupCombo1CloseUp
      end
      object wwDBLookupCombo2: TwwDBLookupCombo
        Left = 53
        Top = 38
        Width = 150
        Height = 19
        BorderStyle = bsNone
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NAME'#9'30'#9'Наименование'#9'F'
          'PRICE'#9'10'#9'Цена'#9'F')
        DataField = 'TARIFF_ID'
        DataSource = dsAcceptor
        LookupTable = ibdsTariffs
        LookupField = 'ID'
        Options = [loColLines, loTitles]
        ButtonEffects.Transparent = True
        ButtonEffects.Flat = True
        Frame.Enabled = True
        Frame.Transparent = True
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
        OnCloseUp = wwDBLookupCombo2CloseUp
      end
    end
  end
  object ibdsDonor: TIBDataSet
    Database = frmMain.ibdMain
    Transaction = frmMain.trMain
    OnCalcFields = ibdsDonorCalcFields
    BufferChunks = 100
    CachedUpdates = True
    SelectSQL.Strings = (
      'select O.ID, C.NUMBER, C.IP_ADDRESS, T.NAME TARIFF_NAME,'
      'T.I_SPEED, O.TIME_START, O.TIME_STOP, O.PRICE'
      'from ORDERS O, TARIFFS T, COMPS C'
      'where (O.ID=:ID) and (O.TARIFF_ID=T.ID) and (O.COMP_ID=C.ID)')
    ModifySQL.Strings = (
      'update ORDERS'
      'set'
      '  TIME_STOP = :TIME_STOP,'
      '  PRICE = :PRICE'
      'where'
      '  ID = :OLD_ID')
    Left = 14
    Top = 24
    object ibdsDonorID: TIntegerField
      FieldName = 'ID'
      Origin = 'ORDERS.ID'
    end
    object ibdsDonorNUMBER: TIBStringField
      FieldName = 'NUMBER'
      Origin = 'COMPS.NUMBER'
      Size = 10
    end
    object ibdsDonorIP_ADDRESS: TIBStringField
      FieldName = 'IP_ADDRESS'
      Origin = 'COMPS.IP_ADDRESS'
      Size = 100
    end
    object ibdsDonorTARIFF_NAME: TIBStringField
      FieldName = 'TARIFF_NAME'
      Origin = 'TARIFFS.NAME'
      Size = 100
    end
    object ibdsDonorI_SPEED: TIntegerField
      FieldName = 'I_SPEED'
      Origin = 'TARIFFS.I_SPEED'
    end
    object ibdsDonorTIME_START: TDateTimeField
      FieldName = 'TIME_START'
      Origin = 'ORDERS.TIME_START'
      DisplayFormat = 'hh:nn dd.mm.yy г.'
    end
    object ibdsDonorTIME_STOP: TDateTimeField
      FieldName = 'TIME_STOP'
      Origin = 'ORDERS.TIME_STOP'
      DisplayFormat = 'hh:nn dd.mm.yy г.'
    end
    object ibdsDonorPRICE: TFloatField
      FieldName = 'PRICE'
      Origin = 'ORDERS.PRICE'
    end
    object ibdsDonorDuration: TTimeField
      FieldKind = fkCalculated
      FieldName = 'Duration'
      DisplayFormat = 'hh:nn'
      Calculated = True
    end
    object ibdsDonorTime_Remain: TTimeField
      FieldKind = fkCalculated
      FieldName = 'Time_Remain'
      DisplayFormat = 'hh:nn'
      Calculated = True
    end
    object ibdsDonorMany_Remain: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Many_Remain'
      currency = True
      Calculated = True
    end
  end
  object dsDonor: TDataSource
    DataSet = ibdsDonor
    Left = 14
    Top = 53
  end
  object ibdsTariffs: TIBDataSet
    Database = frmMain.ibdMain
    Transaction = frmMain.trMain
    BufferChunks = 100
    CachedUpdates = True
    SelectSQL.Strings = (
      'select ID,NAME,PRICE, I_SPEED'
      'from TARIFFS'
      'where (VALID=1)'
      'order by 2')
    Left = 379
    Top = 64
    object ibdsTariffsNAME: TIBStringField
      DisplayLabel = 'Наименование'
      DisplayWidth = 30
      FieldName = 'NAME'
      Required = True
      Size = 100
    end
    object ibdsTariffsPRICE: TFloatField
      DisplayLabel = 'Цена'
      DisplayWidth = 10
      FieldName = 'PRICE'
      Required = True
      DisplayFormat = '### ### ##0.00'
      EditFormat = '### ### ##0.00'
    end
    object ibdsTariffsID: TIntegerField
      DisplayWidth = 10
      FieldName = 'ID'
      Required = True
      Visible = False
    end
    object ibdsTariffsI_SPEED: TIntegerField
      FieldName = 'I_SPEED'
      Required = True
      Visible = False
    end
  end
  object ibdsComps: TIBDataSet
    Database = frmMain.ibdMain
    Transaction = frmMain.trMain
    BufferChunks = 100
    CachedUpdates = True
    SelectSQL.Strings = (
      'select ID, NUMBER, IP_ADDRESS, CLASS'
      'from COMPS'
      'order by 2')
    Left = 349
    Top = 64
    object ibdsCompsNUMBER: TIBStringField
      DisplayLabel = 'Номер'
      DisplayWidth = 10
      FieldName = 'NUMBER'
      Origin = 'COMPS.NUMBER'
      Required = True
      Size = 10
    end
    object ibdsCompsCLASS: TIntegerField
      DisplayLabel = 'Класс'
      DisplayWidth = 10
      FieldName = 'CLASS'
      Origin = 'COMPS.CLASS'
      Required = True
    end
    object ibdsCompsID: TIntegerField
      FieldName = 'ID'
      Origin = 'COMPS.ID'
      Required = True
      Visible = False
    end
    object ibdsCompsIP_ADDRESS: TIBStringField
      FieldName = 'IP_ADDRESS'
      Origin = 'COMPS.IP_ADDRESS'
      Required = True
      Visible = False
      Size = 100
    end
  end
  object dsAcceptor: TDataSource
    DataSet = ibdsAcceptor
    Left = 318
    Top = 93
  end
  object ibdsAcceptor: TIBDataSet
    Database = frmMain.ibdMain
    Transaction = frmMain.trMain
    OnCalcFields = ibdsAcceptorCalcFields
    BufferChunks = 100
    CachedUpdates = True
    InsertSQL.Strings = (
      'insert into ORDERS'
      
        '  (ID, COMP_ID, TARIFF_ID, INTERFACE, TIME_START, TIME_STOP, PRI' +
        'CE, '
      'COMMENTS)'
      'values'
      
        '  (:ID, :COMP_ID, :TARIFF_ID, :INTERFACE, :TIME_START, :TIME_STO' +
        'P, :PRICE, '
      '   :COMMENTS)')
    SelectSQL.Strings = (
      'select O.ID, O.COMP_ID, C.NUMBER, C.IP_ADDRESS,'
      
        'O.TARIFF_ID, T.NAME TARIFF_NAME, T.I_SPEED, T.PRICE TARIFF_PRICE' +
        ', O.INTERFACE,'
      'O.TIME_START, O.TIME_STOP, O.PRICE, O.COMMENTS'
      'from ORDERS O, TARIFFS T, COMPS C'
      'where (O.ID=:ID) and (O.TARIFF_ID=T.ID) and (O.COMP_ID=C.ID)')
    ModifySQL.Strings = (
      'update ORDERS'
      'set'
      '  TIME_STOP = :TIME_STOP,'
      '  PRICE = :PRICE,'
      '  COMMENTS = :COMMENTS'
      'where'
      '  ID = :OLD_ID')
    Left = 302
    Top = 24
    object ibdsAcceptorID: TIntegerField
      FieldName = 'ID'
      Origin = 'ORDERS.ID'
    end
    object ibdsAcceptorCOMP_ID: TIntegerField
      FieldName = 'COMP_ID'
      Origin = 'ORDERS.COMP_ID'
    end
    object ibdsAcceptorNUMBER: TIBStringField
      FieldName = 'NUMBER'
      Origin = 'COMPS.NUMBER'
      Size = 10
    end
    object ibdsAcceptorIP_ADDRESS: TIBStringField
      FieldName = 'IP_ADDRESS'
      Origin = 'COMPS.IP_ADDRESS'
      Size = 100
    end
    object ibdsAcceptorTARIFF_ID: TIntegerField
      FieldName = 'TARIFF_ID'
      Origin = 'ORDERS.TARIFF_ID'
    end
    object ibdsAcceptorTARIFF_NAME: TIBStringField
      FieldName = 'TARIFF_NAME'
      Origin = 'TARIFFS.NAME'
      Size = 100
    end
    object ibdsAcceptorI_SPEED: TIntegerField
      FieldName = 'I_SPEED'
      Origin = 'TARIFFS.I_SPEED'
    end
    object ibdsAcceptorTIME_START: TDateTimeField
      FieldName = 'TIME_START'
      Origin = 'ORDERS.TIME_START'
      DisplayFormat = 'hh:nn dd.mm.yy г.'
    end
    object ibdsAcceptorTIME_STOP: TDateTimeField
      FieldName = 'TIME_STOP'
      Origin = 'ORDERS.TIME_STOP'
      DisplayFormat = 'hh:nn dd.mm.yy г.'
    end
    object ibdsAcceptorPRICE: TFloatField
      FieldName = 'PRICE'
      Origin = 'ORDERS.PRICE'
    end
    object ibdsAcceptorCOMMENTS: TIBStringField
      FieldName = 'COMMENTS'
      Origin = 'ORDERS.COMMENTS'
      Size = 100
    end
    object ibdsAcceptorDuration: TTimeField
      FieldKind = fkCalculated
      FieldName = 'Duration'
      DisplayFormat = 'hh:nn'
      Calculated = True
    end
    object ibdsAcceptorTime_Remain: TTimeField
      FieldKind = fkCalculated
      FieldName = 'Time_Remain'
      DisplayFormat = 'hh:nn'
      Calculated = True
    end
    object ibdsAcceptorMany_Remain: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Many_Remain'
      currency = True
      Calculated = True
    end
    object ibdsAcceptorTARIFF_PRICE: TFloatField
      FieldName = 'TARIFF_PRICE'
      Origin = 'TARIFFS.PRICE'
    end
    object ibdsAcceptorINTERFACE: TSmallintField
      FieldName = 'INTERFACE'
      Origin = 'ORDERS.INTERFACE'
      Required = True
    end
  end
end
