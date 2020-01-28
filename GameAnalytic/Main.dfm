object frmMain: TfrmMain
  Left = 29
  Top = 137
  Width = 680
  Height = 487
  Caption = 'Wizard iGame Analitic'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Icon.Data = {
    0000010001002020040000000000E80200001600000028000000200000004000
    0000010004000000000000020000000000000000000000000000000000000000
    000000008000008000000080800080000000800080008080000080808000C0C0
    C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
    0000000000000777770000000000000000000000000C40777770000000000000
    000000000CCC440777770000000000000000000CCCCC44407777700000000000
    00000CCCCCCE44440777770000000000000CCCCCCEECC4444077777000000000
    0CCCCCCCC4CCCC44407777770000000CCCCCCCCCC44CCCC4407777777000000C
    CCCCCCCCC444CCCC407777700000000CCE0CCCCCC4444CC0077770000000000E
    EC0CCCCCC44440077770000000000000CC0CCCCCC44440777000000000000000
    0C0CCCCCC44440700000000000000000000CCCCCC44440000000000000000000
    000CCCCCC44440000000000000000000000CCCCCC44440000000000000000000
    000CCCCCC44440000000000000000000000CCCCEEC4440000000000000000000
    000CCEECCCC4400000000000000000000CCEEC4444CC40000000000000000000
    0EECC0000444C00000000000000000000CC004444004C0000000000000000000
    0004444444400000000000000000000000044444444000000000000000000000
    0044CCC4C444000000000000000000000044CCCCC44400000000000000000000
    004CCCCCC44400000000000000000000004CCFCCC44400000000000000000000
    000CCCCCC4400000000000000000000000044CC4444000000000000000000000
    000004444000000000000000000000000000000000000000000000000000FFFE
    03FFFFF801FFFFE000FFFF80007FFE00003FF800001FE000000FC0000007C000
    001FC000007FC00001FFE00007FFF0001FFFF8003FFFFC003FFFFC003FFFFC00
    3FFFFC003FFFF8003FFFF0003FFFF0003FFFF0003FFFF8007FFFFC00FFFFF800
    7FFFF8007FFFF8007FFFF8007FFFFC00FFFFFC00FFFFFE01FFFFFF87FFFF}
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Tag = 2
    Left = 0
    Top = 0
    Width = 672
    Height = 440
    ActivePage = tsReports
    Align = alClient
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    HotTrack = True
    Images = ImageList1
    MultiLine = True
    ParentFont = False
    TabOrder = 0
    TabPosition = tpRight
    OnChange = PageControl1Change
    object tsReports: TTabSheet
      Caption = 'Отчеты'
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 605
        Height = 430
        Align = alClient
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 0
        object Splitter1: TSplitter
          Left = 2
          Top = 209
          Width = 601
          Height = 3
          Cursor = crVSplit
          Align = alBottom
          Beveled = True
        end
        object pnlClass: TPanel
          Tag = 219
          Left = 2
          Top = 2
          Width = 601
          Height = 207
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object Splitter2: TSplitter
            Left = 350
            Top = 0
            Width = 3
            Height = 207
            Cursor = crHSplit
            Beveled = True
          end
          object dbgClass: TwwDBGrid
            Left = 0
            Top = 0
            Width = 350
            Height = 207
            ControlType.Strings = (
              'VALID;CheckBox;1;0'
              'IP_ADDRESS;CustomEdit;wwDBEdit3'
              'In_Count;CheckBox;1;0'
              'IN_COUNT;CheckBox;1;0')
            Selected.Strings = (
              'CLASS'#9'9'#9'Класс'#9#9
              'Percentage'#9'29'#9'Использование времени'#9#9
              'TOTAL_SUM'#9'13'#9'Сумма'#9#9)
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
            Align = alLeft
            DataSource = dsMainClass
            EditCalculated = True
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            KeyOptions = []
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgFooter3DCells, dgNoLimitColSize, dgTrailingEllipsis, dgShowCellHint]
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            TitleAlignment = taCenter
            TitleFont.Charset = RUSSIAN_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = True
            OnCalcTitleAttributes = dbgClassCalcTitleAttributes
            OnTitleButtonClick = wwDBGrid3TitleButtonClick
            OnCreateHintWindow = wwDBGrid3CreateHintWindow
            OnCalcTitleImage = wwDBGrid3CalcTitleImage
            OnUpdateFooter = dbgClassUpdateFooter
            TitleImageList = ImageList2
            PadColumnStyle = pcsPlain
            object dbbtnClass: TwwIButton
              Left = 0
              Top = 0
              Width = 13
              Height = 23
              AllowAllUp = True
              GroupIndex = 1
              Enabled = False
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                04000000000000010000120B0000120B00001000000000000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555550555
                555555555555F55555555505555B0555570555F55557F55555F55B50555B0555
                7B55575F5557F555575555B5055B5557B5555575F55755557555555B5550005B
                55555557555FFF575555555555BBB0055555555555777FF5555555555BBBBB00
                55555555577777FF55555000BBBBBBB050005FFF7777777F5FFFBBB5BBBBBBB0
                BBB577757777777F77755555BBBBBBB55555555577777775555555555BBBBB55
                55555555577777555555555705BBB55505555555F5777555F555557B5555055B
                505555575555F5575F5557B5555B0555B50555755557F55575F55B55555B0555
                5B5557555557F55557555555555B555555555555555755555555}
              NumGlyphs = 2
              OnClick = dbbtnClassClick
            end
          end
          object lzrw: Tlzrw1
            Left = 66
            Top = 144
            Width = 39
            Height = 29
            UseStream = True
            TabOrder = 1
            Visible = False
          end
          object Chart1: TChart
            Left = 353
            Top = 0
            Width = 248
            Height = 207
            BackWall.Brush.Color = clWhite
            BackWall.Brush.Style = bsClear
            Legend.Visible = False
            MarginTop = 10
            Title.Text.Strings = (
              'TChart')
            Title.Visible = False
            LeftAxis.Automatic = False
            LeftAxis.AutomaticMaximum = False
            LeftAxis.AutomaticMinimum = False
            LeftAxis.Maximum = 100
            LeftAxis.Title.Caption = 'Средняя загрузка, %%'
            View3D = False
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 2
            object Series1: TLineSeries
              Marks.ArrowLength = 8
              Marks.Visible = False
              SeriesColor = clRed
              Title = 'TotalTime'
              LinePen.Width = 2
              Pointer.InflateMargins = True
              Pointer.Style = psRectangle
              Pointer.Visible = False
              XValues.Name = 'X'
              XValues.Order = loAscending
              YValues.Name = 'Y'
              YValues.Order = loNone
            end
            object Series2: TLineSeries
              Marks.ArrowLength = 8
              Marks.Visible = False
              SeriesColor = clGreen
              Title = 'TotalWeekDay'
              LinePen.Width = 2
              Pointer.InflateMargins = True
              Pointer.Style = psRectangle
              Pointer.Visible = False
              XValues.Name = 'X'
              XValues.Order = loAscending
              YValues.Name = 'Y'
              YValues.Order = loNone
            end
            object Series3: TLineSeries
              Marks.ArrowLength = 8
              Marks.Visible = False
              SeriesColor = clRed
              Title = 'ClassTime'
              Pointer.InflateMargins = True
              Pointer.Style = psRectangle
              Pointer.Visible = False
              XValues.Name = 'X'
              XValues.Order = loAscending
              YValues.Name = 'Y'
              YValues.Order = loNone
            end
            object Series4: TLineSeries
              Marks.ArrowLength = 8
              Marks.Visible = False
              SeriesColor = clGreen
              Title = 'ClassWeekDay'
              Pointer.InflateMargins = True
              Pointer.Style = psRectangle
              Pointer.Visible = False
              XValues.Name = 'X'
              XValues.Order = loAscending
              YValues.Name = 'Y'
              YValues.Order = loNone
            end
          end
        end
        object pnlTariff: TPanel
          Tag = 216
          Left = 2
          Top = 212
          Width = 601
          Height = 216
          Align = alBottom
          BevelOuter = bvNone
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          object Splitter3: TSplitter
            Left = 350
            Top = 0
            Width = 3
            Height = 216
            Cursor = crHSplit
            Beveled = True
          end
          object dbgTariff: TwwDBGrid
            Tag = 1
            Left = 0
            Top = 0
            Width = 350
            Height = 216
            ControlType.Strings = (
              'VALID;CheckBox;1;0'
              'IP_ADDRESS;CustomEdit;wwDBEdit3'
              'IN_COUNT;CheckBox;1;0')
            Selected.Strings = (
              'NAME'#9'13'#9'Тариф'#9#9
              'Percentage'#9'19'#9'Использование~времени'#9#9
              'TOTAL_SUM'#9'11'#9'Сумма'#9#9
              'IN_COUNT'#9'7'#9'В~итогах'#9#9)
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
            Align = alLeft
            DataSource = dsMainGroupTariff
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgFooter3DCells, dgNoLimitColSize, dgTrailingEllipsis, dgShowCellHint]
            ParentFont = False
            TabOrder = 0
            TitleAlignment = taCenter
            TitleFont.Charset = RUSSIAN_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 2
            TitleButtons = True
            OnCalcCellColors = dbgTariffCalcCellColors
            OnCalcTitleAttributes = dbgClassCalcTitleAttributes
            OnTitleButtonClick = wwDBGrid3TitleButtonClick
            OnCreateHintWindow = wwDBGrid3CreateHintWindow
            OnCalcTitleImage = wwDBGrid3CalcTitleImage
            OnUpdateFooter = dbgClassUpdateFooter
            TitleImageList = ImageList2
            PadColumnStyle = pcsPlain
            object dbbtnTariff: TwwIButton
              Left = 0
              Top = 0
              Width = 13
              Height = 30
              AllowAllUp = True
              GroupIndex = 2
              Enabled = False
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                04000000000000010000120B0000120B00001000000000000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555550555
                555555555555F55555555505555B0555570555F55557F55555F55B50555B0555
                7B55575F5557F555575555B5055B5557B5555575F55755557555555B5550005B
                55555557555FFF575555555555BBB0055555555555777FF5555555555BBBBB00
                55555555577777FF55555000BBBBBBB050005FFF7777777F5FFFBBB5BBBBBBB0
                BBB577757777777F77755555BBBBBBB55555555577777775555555555BBBBB55
                55555555577777555555555705BBB55505555555F5777555F555557B5555055B
                505555575555F5575F5557B5555B0555B50555755557F55575F55B55555B0555
                5B5557555557F55557555555555B555555555555555755555555}
              NumGlyphs = 2
              OnClick = dbbtnTariffClick
            end
          end
          object pnlChart: TPanel
            Left = 353
            Top = 0
            Width = 248
            Height = 216
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            object pnlAverage: TPanel
              Left = 0
              Top = 0
              Width = 248
              Height = 216
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 1
              object Chart2: TChart
                Left = 17
                Top = 0
                Width = 231
                Height = 216
                BackWall.Brush.Color = clWhite
                BackWall.Brush.Style = bsClear
                Legend.Visible = False
                MarginTop = 10
                Title.Text.Strings = (
                  'TChart')
                Title.Visible = False
                LeftAxis.Automatic = False
                LeftAxis.AutomaticMaximum = False
                LeftAxis.AutomaticMinimum = False
                LeftAxis.Maximum = 100
                LeftAxis.Title.Caption = 'Средняя загрузка, %%'
                View3D = False
                Zoom.Animated = True
                Align = alClient
                BevelOuter = bvNone
                TabOrder = 0
                object LineSeries1: TLineSeries
                  Marks.ArrowLength = 8
                  Marks.Visible = False
                  SeriesColor = clRed
                  Title = 'TotalTime'
                  LinePen.Width = 2
                  Pointer.InflateMargins = True
                  Pointer.Style = psRectangle
                  Pointer.Visible = False
                  XValues.Name = 'X'
                  XValues.Order = loAscending
                  YValues.Name = 'Y'
                  YValues.Order = loNone
                end
                object LineSeries2: TLineSeries
                  Marks.ArrowLength = 8
                  Marks.Visible = False
                  SeriesColor = clGreen
                  Title = 'TotalWeekDay'
                  LinePen.Width = 2
                  Pointer.InflateMargins = True
                  Pointer.Style = psRectangle
                  Pointer.Visible = False
                  XValues.Name = 'X'
                  XValues.Order = loAscending
                  YValues.Name = 'Y'
                  YValues.Order = loNone
                end
                object LineSeries3: TLineSeries
                  Marks.ArrowLength = 8
                  Marks.Visible = False
                  SeriesColor = clRed
                  Title = 'TariffTime'
                  Pointer.InflateMargins = True
                  Pointer.Style = psRectangle
                  Pointer.Visible = False
                  XValues.Name = 'X'
                  XValues.Order = loAscending
                  YValues.Name = 'Y'
                  YValues.Order = loNone
                end
                object LineSeries4: TLineSeries
                  Marks.ArrowLength = 8
                  Marks.Visible = False
                  SeriesColor = clGreen
                  Title = 'TariffWeekDay'
                  Pointer.InflateMargins = True
                  Pointer.Style = psRectangle
                  Pointer.Visible = False
                  XValues.Name = 'X'
                  XValues.Order = loAscending
                  YValues.Name = 'Y'
                  YValues.Order = loNone
                end
              end
              object Panel4: TPanel
                Left = 0
                Top = 0
                Width = 17
                Height = 216
                Align = alLeft
                AutoSize = True
                TabOrder = 1
                object lblShowTime: TfcLabel
                  Left = 1
                  Top = 1
                  Width = 15
                  Height = 214
                  Cursor = crHandPoint
                  Hint = 'Показать графики зависимости выручки от даты'
                  Align = alLeft
                  Caption = 'Показать зависимость выручки от даты, руб.'
                  Font.Charset = RUSSIAN_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -12
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  ParentShowHint = False
                  TextOptions.Alignment = taLeftJustify
                  TextOptions.Rotation = 90
                  TextOptions.Style = fclsLowered
                  TextOptions.VAlignment = vaTop
                  ShowHint = True
                  OnClick = lblShowTimeClick
                  OnMouseEnter = lblShowTimeMouseEnter
                  OnMouseLeave = lblShowTimeMouseLeave
                  OnMouseDown = lblShowTimeMouseDown
                  OnMouseUp = lblShowTimeMouseUp
                end
              end
            end
            object pnlTime: TPanel
              Left = 0
              Top = 0
              Width = 248
              Height = 216
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 0
              Visible = False
              object Chart3: TChart
                Left = 0
                Top = 0
                Width = 231
                Height = 216
                BackWall.Brush.Color = clWhite
                BackWall.Brush.Style = bsClear
                Legend.Visible = False
                MarginBottom = 5
                MarginTop = 6
                Title.Text.Strings = (
                  'TChart')
                Title.Visible = False
                LeftAxis.Title.Caption = 'Выручка, руб.'
                View3D = False
                Align = alClient
                BevelOuter = bvNone
                TabOrder = 0
                OnResize = Chart3Resize
                object lblLines: TfcLabel
                  Left = 74
                  Top = 202
                  Width = 37
                  Height = 15
                  Cursor = crHandPoint
                  Hint = 'Отображает график в виде линий'
                  Anchors = [akLeft, akBottom]
                  Caption = 'Линии'
                  Font.Charset = RUSSIAN_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -12
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                  ParentShowHint = False
                  TextOptions.Alignment = taLeftJustify
                  TextOptions.Style = fclsLowered
                  TextOptions.VAlignment = vaTop
                  Transparent = True
                  ShowHint = True
                  OnClick = lblLinesClick
                end
                object lblBars: TfcLabel
                  Left = 123
                  Top = 202
                  Width = 56
                  Height = 15
                  Cursor = crHandPoint
                  Hint = 'Отображает график в виде столбиков'
                  Anchors = [akLeft, akBottom]
                  Caption = 'Столбики'
                  Font.Charset = RUSSIAN_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -12
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                  ParentShowHint = False
                  TextOptions.Alignment = taLeftJustify
                  TextOptions.Style = fclsRaised
                  TextOptions.VAlignment = vaTop
                  Transparent = True
                  ShowHint = True
                  OnClick = lblLinesClick
                end
                object LineSeries5: TLineSeries
                  Marks.ArrowLength = 8
                  Marks.Visible = False
                  SeriesColor = clBlue
                  ShowInLegend = False
                  Title = 'TotalMany'
                  LinePen.Width = 2
                  Pointer.InflateMargins = True
                  Pointer.Style = psRectangle
                  Pointer.Visible = False
                  XValues.Name = 'X'
                  XValues.Order = loAscending
                  YValues.Name = 'Y'
                  YValues.Order = loNone
                end
                object LineSeries7: TLineSeries
                  Marks.ArrowLength = 8
                  Marks.Visible = False
                  SeriesColor = clBlue
                  ShowInLegend = False
                  Title = 'TariffMany'
                  Pointer.InflateMargins = True
                  Pointer.Style = psRectangle
                  Pointer.Visible = False
                  XValues.Name = 'X'
                  XValues.Order = loAscending
                  YValues.Name = 'Y'
                  YValues.Order = loNone
                end
                object Series5: TBarSeries
                  Active = False
                  Marks.ArrowLength = 20
                  Marks.Visible = False
                  SeriesColor = clBlue
                  ShowInLegend = False
                  Title = 'TotalManyBar'
                  Gradient.Direction = gdTopBottom
                  MultiBar = mbNone
                  XValues.Name = 'X'
                  XValues.Order = loAscending
                  YValues.Name = 'Bar'
                  YValues.Order = loNone
                end
                object Series6: TBarSeries
                  Active = False
                  BarBrush.Style = bsDiagCross
                  Marks.ArrowLength = 20
                  Marks.Visible = False
                  SeriesColor = clBlue
                  ShowInLegend = False
                  Title = 'TariffManyBar'
                  BarWidthPercent = 40
                  Gradient.Direction = gdTopBottom
                  MultiBar = mbNone
                  XValues.Name = 'X'
                  XValues.Order = loAscending
                  YValues.Name = 'Bar'
                  YValues.Order = loNone
                end
              end
              object Panel9: TPanel
                Left = 231
                Top = 0
                Width = 17
                Height = 216
                Align = alRight
                AutoSize = True
                TabOrder = 1
                object lblShowAverage: TfcLabel
                  Left = 1
                  Top = 1
                  Width = 15
                  Height = 214
                  Cursor = crHandPoint
                  Hint = 'Показать графики усредненных величин'
                  Align = alLeft
                  Caption = 'Показать усредненные величины, %%'
                  Font.Charset = RUSSIAN_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -12
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  ParentShowHint = False
                  TextOptions.Alignment = taLeftJustify
                  TextOptions.Rotation = 90
                  TextOptions.Style = fclsLowered
                  TextOptions.VAlignment = vaTop
                  ShowHint = True
                  OnClick = lblShowTimeClick
                  OnMouseEnter = lblShowTimeMouseEnter
                  OnMouseLeave = lblShowTimeMouseLeave
                  OnMouseDown = lblShowTimeMouseDown
                  OnMouseUp = lblShowTimeMouseUp
                end
              end
            end
          end
        end
      end
      object Panel1: TPanel
        Left = 605
        Top = 0
        Width = 19
        Height = 430
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 1
        object sbTariff: TSpeedButton
          Left = 0
          Top = 19
          Width = 19
          Height = 19
          Cursor = crHandPoint
          Hint = 'Отчет по тарифам'
          GroupIndex = 1
          Flat = True
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000120B0000120B00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFC9C6C6727373D8D3D3FBFBFBE3E3E3FFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFC7C74079794CA6A648
            6161584C4C5F5A5ADFDBDBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFCEC9C94E6E6E97DEDEA9B2B2456C6C0031310018184F6060D9D4D4FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCF65606099979761747413393900
            5353066D6D208C8C20ADAD1F20207D7979D3D3D3FFFFFFFFFFFFFFFFFFD4CFCF
            453C3C4663630C3F3F0051510A6B6B577D7D8EF1F188FFFF8AFBFB6EB6B65253
            535858587B8484B4B3B3C4C3C3233E3E0037370056560B6B6B6A7D7DCAF1F1D8
            FFFF92B7BC6D52452D1F1B839E9D9CC2C3939B9B3F5A5A6F6B6B4B4444005D5D
            136F6F697A7AD3E8E7F4FFFFACB7BC845648B83900FE48000D151B0F2130909B
            9895B4B4444141B1B0B0F4F3F3595B5BC8CDCDFDFFFFE7F8FB876250B23600FF
            4E00F04B008B3100A73602091E3210202E8E9B9888A5A5B3B3B3FFFFFFF2F1F1
            9B9999E7EAEACFF2F8973402FB4C007B2F05193F5F0C315D823E1CAF3700091F
            32102230565756E3E4E4FFFFFFFFFFFFE8E8E89A9A9ACACFD14429161E374F1E
            67BF7BA9FF7084C0404C548E4E2DAD350008172B30363BE2E1E0FFFFFFFFFFFF
            FFFFFFF1F0EF5154591D5DB271A0FFB2C4FFAEC0FF7CA0FF4A64B44551568F4F
            2E9427004D4E4EF7F9F9FFFFFFFFFFFFFFFFFFFFFFFF9394978F9FDFB1C6FF7F
            9EFF648AFF698EFF7097FF4C65B34B51534D3D33CDCBCAFDFDFDFFFFFFFFFFFF
            FFFFFFFFFFFFEFEEEA7B82965479E86B91FF6B8FFF6B8FFF6B8FFF7197FF546F
            C213171FADACABFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0EEE869739459
            7EE86E93FF6C90FF7095FF6287F44864B3545B72C9C7C4FFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFF2F0E86973945E82EE668CF84761AC5B6580B1B0
            ADFDFCF8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2
            F0E85C6689505B7CB1AFACFBF9F4FFFFFFFFFFFFFFFFFFFFFFFF}
          ParentShowHint = False
          ShowHint = True
          Transparent = False
          OnClick = sbTariffClick
        end
        object sbClose: TSpeedButton
          Left = 0
          Top = 76
          Width = 19
          Height = 19
          Cursor = crHandPoint
          Hint = 'Закрыть'
          AllowAllUp = True
          Flat = True
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000120B0000120B00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8A8A87969F99000000FF
            FFFFFFFFFFFFFFFF9E9C9EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFF0F6EEFFFFFF494D520000008889866D706E000000000000D1CB
            CFD7D5D0000000FFFFFFFFFFFFFFFFFFFFFFFF7E7F7FFFFFFF7C7C794F5C5565
            66620B0906959595FFFFFFF9FFFCFFFFFF040B04000000FFFFFF7F7F7D000000
            FFFFFFFFFFFFF7F9F0000000000000000000000000000000545A57FFFFFFFFFF
            FF000000C0BFBCFFFFFFEDF3EF0000000D0F0CC5CACE00000000000000080000
            0B00000800000000000000000000FFFFFF3C3D3BFFFFFFFFFFFFBDBDBCFFFFFF
            272D28000000000000000400000A00000800000900000B000009000000004347
            3F484B46FFFFFFFFFFFFFFFFFFFFFFFFDBE5E7000000000500000B0000080000
            0800000800000800000B00000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF
            C6CCC0000000000000000A00000800000800000800000800000B000000000000
            00484F4DBEBDB9FFFFFFFFFFFF959E9843463A000000000000000B0000080000
            0800000800000800000C00000000050E00FFFFFF000000FFFFFF8A8889D0D3C8
            D2D6D6000000000000000900000B00000900000900000A00000E000000007177
            6CFFFFFF000000FCFAFFD4D6D6FFFFFFFFFFFF6A756E00000000000000000000
            0900000C00000500000000000000C7CBCCFFFFFF909687000000FFFFFFFFFFFF
            D9D7D98F9291C8C4C2000000000000000000000000000000000000272E280000
            00AAAAACC4C4C4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF33363300
            0000000000000000C2C3C3FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFF0000004E4E4FDEDDE3F6F6F3DDDBDBFFFFFF0000
            00F8FBFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE1E4DF595B59FF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFF888785FFFFFFFFFFFFFFFFFF}
          ParentShowHint = False
          ShowHint = True
          Transparent = False
          OnClick = sbCloseClick
        end
        object sbClass: TSpeedButton
          Left = 0
          Top = 0
          Width = 19
          Height = 19
          Cursor = crHandPoint
          Hint = 'Отчет по машинам'
          GroupIndex = 1
          Down = True
          Flat = True
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000120B0000120B00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFB7B5B4979493C2C5C5BDBCBCB8B8B8DCDCDCFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5FDFFADB2B4AF380C5A
            0000464C4D767A7A6F6F6F797979D8D8D8FFFFFFFFFFFFFFFFFFFFFFFFF6F6F7
            E4EEEFB2B8B87C584F7A0E0AFD561C8502005E02035757577F83837776767979
            79D8D8D8FFFFFFFFFFFFFFFFFF938F8C611D148E2517CF391DB9190BF5561D7F
            05009200006C03035457577F8383777676797979D8D8D8FFFFFFFFFFFF958E87
            AB1907C7230EB71F14760B3EEB56288105008B00009E00007203035657577E82
            82767676787878D9D9D9FFFFFF968F89AC1F09740A3C4B288F312F86F15E2581
            04008B0000950000AC00007C03035C59597779796F6F6FBDBDBDFFFFFF998F87
            97161052498BA9B6BBA09A8DF45E258003008B0000950000A40000AD00004C39
            39A0A4A4D9D9D9FBFBFBFFFFFF968C86A72816AB9F95B9C0BE7C7999E8532080
            03008B0000950000A400009F00008C7B7BFFFFFFFFFFFFFFFFFFFFFFFF968C86
            AF2F168883C25257E24739D0EF592A7F0400890000950000A400009E00009381
            81FFFFFFFFFFFFFFFFFFFFFFFF988E85A2262059279F962B56AE2121FC601FD0
            3C008A0200930000A100009C00008F8080FFFFFFFFFFFFFFFFFFFFFFFF8F8781
            B11F0AC72E18F1571FFB5910FE5401FF5B00DF3D009402009D00009C00008D80
            80FFFFFFFFFFFFFFFFFFFFFFFFBFBDBD84381AED4700FF5C02FF5500FF5500FF
            5500FF5B00DE3D00A902009C00008C8080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            D7E5EA97654CE84200FF5700FF5500FF5500FF5500FF5B00EF3E009B00008276
            78FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE8F3F994634CE84300FF5700FF
            5500FF5700FF5500DD4300552114AFB5B9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFE8F4F994634CEC4500FF5B00DA3E00913D14918580E2EAEBFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE8F4F98959447D
            270092857FDAE5EBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          ParentShowHint = False
          ShowHint = True
          Transparent = False
          OnClick = sbTariffClick
        end
        object SpeedButton3: TSpeedButton
          Left = 0
          Top = 38
          Width = 19
          Height = 19
          Cursor = crHandPoint
          Hint = 'Принять информацию'
          AllowAllUp = True
          Flat = True
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            1800000000000003000024160000241600000000000000000000FFFFFFFFFFFF
            FFFBEFFFFFFF555556756858434E5600182FD0BCA7FFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFF3D4E6200003600001A9DABDD1B47A44B4C42BF
            C9DD001F6BC18C73444B4DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFB1B1001529
            D5FFFF0057B53E463DD7F0FD57B2FF001C18031B52000C2D004150003756FFFF
            FFFFFFFFFFFFFFFFFFFF0C25314AA3FF3A3941FCFFFF5BBAFF0009000F0C5600
            193D5BFFFF08C3F3FFBCC252FFFF006B80FFFFFFFFFFFFFFFFFFC6B6A99BABB5
            72CBFF0009090D065200342E45EAFF9FFFFF5EFFFF3F565FDBFFFFACFFFF3AFF
            FF003353FFFFFFFFFFFFFFFFFFC8A28F001F4900436932FBFFCCFFFF82CDD909
            5D7508476D1C4C4F1F7485154878329EB500597D000000FFFFFFBBBEC2000000
            00465C058BBA1A83A0004A6B85656ABAFFFFA1E2DA93E8FFACF9F798FAFD5287
            6D0001004A362EFFFFFFF6F9F949474BFFFFFE8AF0FB8DECF95B888EACB4AC95
            FDFFABFFFFAFFFFF4B9C912B5B6D133F7487D1FF00365DC1B8ABFFFFFFFFFFFF
            4E8887D0FFFF94FFFF528B8CCCFFFF9CFFFF54A99314002D001E2D97D6FFFFFF
            FFA5F9FF227BBD715C52FFFFFFFFFFFFFFFFFF2B0C00FFFFFFB4A3969ECCC100
            001109312885ACE6E3FFFF93D4FFFAFDFFDDF2FF00236A243239FFFFFFFFFFFF
            605B5824536C304237162C1B0B30724991EB73CDFF5BAFECB5EEFF75A3CE598B
            C7528AC770D0FF000000FFFFFFDCDCDB241F20F6EFF195BFD9AFD6E8BFDCF0B6
            C1F8A8C8F1A5C7F7575A284B81B379DCFF81E2FF2A608F19272CFFFFFFFFFFFF
            B1B1B048393066595D64575B5F4D5F604E62594C5E5B4B3EF1EDE771635F1244
            7C020F719D8A7BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFEEDFD8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          ParentShowHint = False
          ShowHint = True
          Transparent = False
          OnClick = SpeedButton3Click
        end
        object sbPrintLine: TSpeedButton
          Left = 0
          Top = 57
          Width = 19
          Height = 19
          Cursor = crHandPoint
          Hint = 'Печать'
          AllowAllUp = True
          Flat = True
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
            0003377777777777777308888888888888807F33333333333337088888888888
            88807FFFFFFFFFFFFFF7000000000000000077777777777777770F8F8F8F8F8F
            8F807F333333333333F708F8F8F8F8F8F9F07F333333333337370F8F8F8F8F8F
            8F807FFFFFFFFFFFFFF7000000000000000077777777777777773330FFFFFFFF
            03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
            03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
            33333337F3F37F3733333330F08F0F0333333337F7337F7333333330FFFF0033
            33333337FFFF7733333333300000033333333337777773333333}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          Transparent = False
          OnClick = sbPrintLineClick
        end
      end
    end
    object tsComps: TTabSheet
      Caption = 'Машины'
      ImageIndex = 1
      object Panel5: TPanel
        Left = 0
        Top = 0
        Width = 624
        Height = 430
        Align = alClient
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object Panel10: TPanel
          Left = 2
          Top = 380
          Width = 620
          Height = 48
          Align = alBottom
          TabOrder = 2
        end
        object wwDBEdit1: TwwDBEdit
          Left = 4
          Top = 384
          Width = 315
          Height = 41
          Anchors = [akLeft, akRight, akBottom]
          AutoSize = False
          BorderStyle = bsNone
          DataField = 'COMMENTS'
          DataSource = dsMainComps
          Frame.Enabled = True
          Frame.Transparent = True
          Frame.NonFocusBorders = [efRightBorder, efBottomBorder]
          ReadOnly = True
          TabOrder = 1
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBGrid3: TwwDBGrid
          Tag = 2
          Left = 2
          Top = 2
          Width = 620
          Height = 378
          ControlType.Strings = (
            'NEW_VALID;CheckBox;1;0'
            'VALID;CheckBox;1;0')
          Selected.Strings = (
            'NUMBER'#9'8'#9'№№'#9'F'
            'CLASS'#9'9'#9'Класс'#9'F'
            'NETWORK_NAME'#9'15'#9'Сетевое имя'#9'F'
            'IP_ADDRESS'#9'14'#9'IP адрес(а)'#9'F'
            'DESCRIPTION'#9'34'#9'Описание'#9'F'
            'VALID'#9'13'#9'Дейст'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsMainComps
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgCancelOnExit, dgWordWrap, dgFooter3DCells, dgNoLimitColSize, dgTrailingEllipsis, dgShowCellHint, dgProportionalColResize, dgRowResize]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          TitleAlignment = taCenter
          TitleFont.Charset = RUSSIAN_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = True
          UseTFields = False
          OnCalcTitleAttributes = dbgClassCalcTitleAttributes
          OnTitleButtonClick = wwDBGrid3TitleButtonClick
          OnCreateHintWindow = wwDBGrid3CreateHintWindow
          OnCalcTitleImage = wwDBGrid3CalcTitleImage
          TitleImageList = ImageList2
          PadColumnStyle = pcsPlain
        end
      end
    end
    object tsTariffs: TTabSheet
      Caption = 'Тарифы'
      ImageIndex = 2
      object Panel6: TPanel
        Left = 0
        Top = 0
        Width = 624
        Height = 430
        Align = alClient
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object Panel11: TPanel
          Left = 2
          Top = 380
          Width = 620
          Height = 48
          Align = alBottom
          TabOrder = 2
        end
        object wwDBEdit2: TwwDBEdit
          Left = 5
          Top = 384
          Width = 314
          Height = 41
          Anchors = [akLeft, akRight, akBottom]
          AutoSize = False
          BorderStyle = bsNone
          DataField = 'COMMENTS'
          DataSource = dsMainTariffs
          Frame.Enabled = True
          Frame.Transparent = True
          Frame.NonFocusBorders = [efRightBorder, efBottomBorder]
          ReadOnly = True
          TabOrder = 1
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBGrid4: TwwDBGrid
          Tag = 3
          Left = 2
          Top = 2
          Width = 620
          Height = 378
          ControlType.Strings = (
            'NEW_VALID;CheckBox;1;0'
            'VALID;CheckBox;1;0')
          Selected.Strings = (
            'NAME'#9'50'#9'Наименование'#9'F'
            'I_SPEED'#9'21'#9'Скорость~соединения, бит/с'#9'F'
            'PRICE'#9'13'#9'Цена/час'#9'F'
            'VALID'#9'11'#9'Дейст'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsMainTariffs
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgCancelOnExit, dgWordWrap, dgFooter3DCells, dgNoLimitColSize, dgTrailingEllipsis, dgShowCellHint, dgProportionalColResize, dgRowResize]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          TitleAlignment = taCenter
          TitleFont.Charset = RUSSIAN_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = True
          UseTFields = False
          OnCalcTitleAttributes = dbgClassCalcTitleAttributes
          OnTitleButtonClick = wwDBGrid3TitleButtonClick
          OnCreateHintWindow = wwDBGrid3CreateHintWindow
          OnCalcTitleImage = wwDBGrid3CalcTitleImage
          TitleImageList = ImageList2
          PadColumnStyle = pcsPlain
        end
      end
    end
    object tsProg: TTabSheet
      Caption = 'Программы'
      ImageIndex = 4
      object Panel7: TPanel
        Left = 0
        Top = 0
        Width = 624
        Height = 430
        Align = alClient
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 0
        object Splitter4: TSplitter
          Left = 2
          Top = 361
          Width = 620
          Height = 3
          Cursor = crVSplit
          Align = alTop
          Beveled = True
        end
        object wwdbgComps: TwwDBGrid
          Tag = 5
          Left = 2
          Top = 364
          Width = 620
          Height = 64
          ControlType.Strings = (
            'ICON;Bitmap;Original Size;Source Copy'
            'NUMBER;CustomEdit;wwdblcComps;F'
            'NETWORK_NAME;CustomEdit;wwdblcComps;F'
            'DESCRIPTION;CustomEdit;wwdblcComps;F'
            'ID;CustomEdit;wwdblcComps;F')
          Selected.Strings = (
            'NUMBER'#9'14'#9'№№'#9'F'
            'NETWORK_NAME'#9'15'#9'Сетевое имя'#9'T'
            'DESCRIPTION'#9'67'#9'Описание'#9'T')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
          Align = alClient
          DataSource = dsCompProg
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MultiSelectOptions = [msoAutoUnselect, msoShiftSelect]
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgWordWrap, dgNoLimitColSize, dgTrailingEllipsis, dgShowCellHint, dgProportionalColResize, dgRowResize]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          TitleAlignment = taCenter
          TitleFont.Charset = RUSSIAN_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 2
          TitleButtons = True
          UseTFields = False
          OnCalcTitleAttributes = dbgClassCalcTitleAttributes
          OnTitleButtonClick = wwDBGrid3TitleButtonClick
          OnCreateHintWindow = wwDBGrid3CreateHintWindow
          OnCalcTitleImage = wwDBGrid3CalcTitleImage
          TitleImageList = ImageList2
          PadColumnStyle = pcsPlain
        end
        object wwdbgProgOfComps: TwwDBGrid
          Tag = 6
          Left = 2
          Top = 2
          Width = 620
          Height = 359
          ControlType.Strings = (
            'ICON;CustomEdit;DBImage1;T'
            'VALID;CheckBox;1;0')
          Selected.Strings = (
            'NAME'#9'19'#9'Название игры'#9'F'
            'PATH'#9'53'#9'Путь'#9'F'
            'ICON'#9'8'#9'Иконка'#9'F'
            'NUM_OF_COMPS'#9'15'#9'Кол-во~компьютеров'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
          Align = alTop
          DataSource = dsMainProg
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyOptions = [dgAllowDelete]
          MultiSelectOptions = [msoAutoUnselect, msoShiftSelect]
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit, dgWordWrap, dgNoLimitColSize, dgTrailingEllipsis, dgShowCellHint, dgProportionalColResize, dgRowResize]
          ParentFont = False
          ReadOnly = True
          RowHeightPercent = 212
          TabOrder = 1
          TitleAlignment = taCenter
          TitleFont.Charset = RUSSIAN_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 2
          TitleButtons = True
          UseTFields = False
          OnCalcTitleAttributes = dbgClassCalcTitleAttributes
          OnTitleButtonClick = wwDBGrid3TitleButtonClick
          OnCreateHintWindow = wwDBGrid3CreateHintWindow
          OnCalcTitleImage = wwDBGrid3CalcTitleImage
          TitleImageList = ImageList2
          PadColumnStyle = pcsPlain
        end
        object DBImage1: TDBImage
          Left = 512
          Top = 171
          Width = 52
          Height = 33
          Hint = 'Двойной щелчок для изменения'
          DataField = 'ICON'
          DataSource = dsMainProg
          TabOrder = 2
        end
      end
    end
    object tsEncashment: TTabSheet
      Caption = 'Инкассация'
      ImageIndex = 3
      object wwDBGrid1: TwwDBGrid
        Tag = 4
        Left = 0
        Top = 0
        Width = 624
        Height = 430
        ControlType.Strings = (
          'NEW_VALID;CheckBox;1;0')
        Selected.Strings = (
          'CREATE_TIME'#9'10'#9'Дата'#9'F'
          'AMOUNT'#9'10'#9'Сумма'#9'F'
          'COMMENTS'#9'62'#9'Комментарии'#9'F')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = dsEncashment
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgCancelOnExit, dgWordWrap, dgShowFooter, dgFooter3DCells, dgNoLimitColSize, dgTrailingEllipsis, dgShowCellHint, dgProportionalColResize, dgRowResize]
        ParentFont = False
        TabOrder = 0
        TitleAlignment = taCenter
        TitleFont.Charset = RUSSIAN_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = True
        UseTFields = False
        OnCalcTitleAttributes = dbgClassCalcTitleAttributes
        OnTitleButtonClick = wwDBGrid3TitleButtonClick
        OnCreateHintWindow = wwDBGrid3CreateHintWindow
        OnCalcTitleImage = wwDBGrid3CalcTitleImage
        OnUpdateFooter = wwDBGrid1UpdateFooter
        TitleImageList = ImageList2
        PadColumnStyle = pcsPlain
      end
    end
    object tsLogs: TTabSheet
      Caption = 'Логи'
      ImageIndex = 5
      object PageControl2: TPageControl
        Left = 0
        Top = 0
        Width = 624
        Height = 430
        ActivePage = tsLogComps
        Align = alClient
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        HotTrack = True
        ParentFont = False
        TabOrder = 0
        OnChange = PageControl2Change
        object tsLogUnorder: TTabSheet
          Caption = 'Несанкционированные включения'
          object wwDBGrid2: TwwDBGrid
            Tag = 7
            Left = 0
            Top = 0
            Width = 616
            Height = 402
            Selected.Strings = (
              'NUMBER'#9'10'#9'№№'#9'F'
              'NETWORK_NAME'#9'19'#9'Сетевое имя'#9'F'
              'TIME_START'#9'18'#9'Время начала'#9'F'
              'TIME_STOP'#9'24'#9'Время конца'#9'F'
              'DeltaTime'#9'22'#9'Всего времени'#9'F')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsLogUnorder
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgCancelOnExit, dgWordWrap, dgNoLimitColSize, dgTrailingEllipsis, dgShowCellHint, dgProportionalColResize, dgRowResize]
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            TitleAlignment = taCenter
            TitleFont.Charset = RUSSIAN_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = True
            UseTFields = False
            OnCalcTitleAttributes = dbgClassCalcTitleAttributes
            OnTitleButtonClick = wwDBGrid3TitleButtonClick
            OnCreateHintWindow = wwDBGrid3CreateHintWindow
            OnCalcTitleImage = wwDBGrid3CalcTitleImage
            TitleImageList = ImageList2
            PadColumnStyle = pcsPlain
          end
        end
        object tsLogComps: TTabSheet
          Caption = 'Признак действительности'
          ImageIndex = 1
          object wwDBGrid5: TwwDBGrid
            Tag = 8
            Left = 0
            Top = 0
            Width = 616
            Height = 402
            ControlType.Strings = (
              'NEW_VALID;CheckBox;1;0')
            Selected.Strings = (
              'NUMBER'#9'14'#9'№№'#9'F'
              'NETWORK_NAME'#9'29'#9'Сетевое имя'#9'F'
              'NEW_VALID'#9'20'#9'Новое значение'#9'F'
              'CHANGE_TIME'#9'31'#9'Время изменения'#9'F')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsLogComps
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgCancelOnExit, dgWordWrap, dgFooter3DCells, dgNoLimitColSize, dgTrailingEllipsis, dgShowCellHint, dgProportionalColResize, dgRowResize]
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            TitleAlignment = taCenter
            TitleFont.Charset = RUSSIAN_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = True
            UseTFields = False
            OnCalcTitleAttributes = dbgClassCalcTitleAttributes
            OnTitleButtonClick = wwDBGrid3TitleButtonClick
            OnCreateHintWindow = wwDBGrid3CreateHintWindow
            OnCalcTitleImage = wwDBGrid3CalcTitleImage
            TitleImageList = ImageList2
            PadColumnStyle = pcsPlain
          end
        end
        object tsLogTariffs: TTabSheet
          Caption = 'Цена тарифа'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ImageIndex = 2
          ParentFont = False
          object wwDBGrid6: TwwDBGrid
            Tag = 9
            Left = 0
            Top = 0
            Width = 616
            Height = 402
            Selected.Strings = (
              'NAME'#9'31'#9'Наименование'#9'F'
              'OLD_PRICE'#9'18'#9'Старая цена'#9'F'
              'NEW_PRICE'#9'18'#9'Новая цена'#9'F'
              'CHANGE_TIME'#9'27'#9'Время изменения'#9'F')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsLogTariffs
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgCancelOnExit, dgWordWrap, dgFooter3DCells, dgNoLimitColSize, dgTrailingEllipsis, dgShowCellHint, dgProportionalColResize, dgRowResize]
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            TitleAlignment = taCenter
            TitleFont.Charset = RUSSIAN_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = True
            UseTFields = False
            OnCalcTitleAttributes = dbgClassCalcTitleAttributes
            OnTitleButtonClick = wwDBGrid3TitleButtonClick
            OnCreateHintWindow = wwDBGrid3CreateHintWindow
            OnCalcTitleImage = wwDBGrid3CalcTitleImage
            TitleImageList = ImageList2
            PadColumnStyle = pcsPlain
          end
        end
      end
    end
  end
  object fcStatusBar1: TfcStatusBar
    Left = 0
    Top = 440
    Width = 672
    Height = 20
    Panels = <
      item
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Hint = 'Дата последнего заказа в базе'
        Name = 'Panel0'
        Tag = 0
        TextOptions.Alignment = taLeftJustify
        TextOptions.VAlignment = vaVCenter
        Width = '91'
      end
      item
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Name = 'Panel1'
        Style = psHint
        Tag = 0
        TextOptions.Alignment = taLeftJustify
        TextOptions.VAlignment = vaVCenter
        Width = '100%'
      end
      item
        Component = Panel3
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Name = 'Panel2'
        Style = psControl
        Tag = 0
        TextOptions.Alignment = taLeftJustify
        TextOptions.VAlignment = vaVCenter
        Width = '221'
      end
      item
        Component = Panel8
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Name = 'Panel3'
        Style = psControl
        Tag = 0
        TextOptions.Alignment = taLeftJustify
        TextOptions.VAlignment = vaVCenter
        Width = '183'
      end>
    SimplePanel = False
    SizeGrip = False
    StatusBarText.CapsLock = 'Caps'
    StatusBarText.Overwrite = 'Overwrite'
    StatusBarText.NumLock = 'Num'
    StatusBarText.ScrollLock = 'Scroll'
    object Panel3: TPanel
      Left = 271
      Top = 3
      Width = 217
      Height = 16
      BevelOuter = bvNone
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object Label1: TLabel
        Left = 0
        Top = 2
        Width = 48
        Height = 13
        Caption = 'Период C'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 126
        Top = 2
        Width = 14
        Height = 13
        Caption = 'По'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object tpStart: TwwDBDateTimePicker
        Left = 50
        Top = 0
        Width = 73
        Height = 19
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
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ShowButton = True
        TabOrder = 0
        UnboundDataType = wwDTEdtDate
        OnCloseUp = tpStartCloseUp
        OnChange = tpStartChange
      end
      object tpStop: TwwDBDateTimePicker
        Left = 143
        Top = 0
        Width = 73
        Height = 19
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
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ShowButton = True
        TabOrder = 1
        UnboundDataType = wwDTEdtDate
        OnCloseUp = tpStartCloseUp
        OnChange = tpStartChange
      end
    end
    object Panel8: TPanel
      Left = 492
      Top = 3
      Width = 179
      Height = 16
      BevelOuter = bvNone
      TabOrder = 1
      object Label3: TLabel
        Left = -1
        Top = 2
        Width = 143
        Height = 13
        Caption = 'Длительность рабочего дня'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object seWorkTime: TwwDBSpinEdit
        Left = 143
        Top = 0
        Width = 35
        Height = 19
        Increment = 1
        MaxValue = 24
        Value = 24
        BorderStyle = bsNone
        ButtonEffects.Transparent = True
        ButtonEffects.Flat = True
        Frame.Enabled = True
        Frame.Transparent = True
        Picture.PictureMask = '#[#]'
        TabOrder = 0
        UnboundDataType = wwDefault
        OnChange = tpStartChange
      end
    end
  end
  object ImageList1: TImageList
    Left = 164
    Top = 48
    Bitmap = {
      494C010107000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001001800000000000024
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000009090900000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000D8D0D8E8E8E8E8E8E8E8E8E8707070000000000000
      E0E0E0E0E0E0B8B8A80000000000000000000000000000000000000000003B3B
      3B4040403C3C3C3A3A3A3B3B3B3B3B3B37373700000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000C0C0C080000080808000000000000000000000000000000000000000
      0000000000000000000000E0E0E0E0E0D8C0C0B8687090B0B0C0C0B8B8D8D0D8
      FFFFFFF0F0F0F0F0FF0000000000000000000000000000000000005C5C5CA4A4
      A4A4A4A4A3A3A3A0A0A0A4A4A4A4A4A45C5C5C30303000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00C0C0C080000080000080000080808000000000000000000000000000000000
      0000000000000000A8A0A0F8F8F8D0C8C05060805060885868907070A06070A0
      C0C0C0C8C8D0D0D0F0A0A0A80000000000000000000000000000005C5C5CA4A4
      A4A4A4A4A4A4A40909FF0909FFA4A4A45C5C5C5B5B5B2C2C2C00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C0C0
      C080808080808080000080000080000080808000000000000000000000000000
      0000000000B0B0B0E0D8D8D0C0C84048805060A06078A87888C07080B87088B8
      6878A8A0A0A0C8C8D8A0A0B00000000000000000000000000000005C5C5CA4A4
      A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A45C5C5C5C5C5C2C2C2C00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000C0C0C08080
      8080808080808080808080000080000080000080808000000000000000000000
      0000000000E0E0E0E0D0D83850686080B07080B86880C05868A07080B06068A8
      6070A05060A0606080E0E0E00000000000000000000000000000005C5C5CA4A4
      A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A45C5C5C5C5C5C2B2B2B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000C0C0C08080808000
      0080808080808080808080000080000080000080000080808000000000000000
      0000D8D8E8E0E0F06870885058885868987088C07888B05050705060888090C0
      7080B06070B0585880D0D0E00000000000000000000000000000005C5C5CFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5C5C5C5C5C5C2A2A2A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000C0C0C08000008080808000
      00800000808080800000800000C0C0C0C0C0C080000080000080808000000000
      0000D8D8E0E0E0FF8088983848785060888090B0404060404060282840283050
      7070B06068985050807878880000000000000000000000000000005C5C5C5C5C
      5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C0909095C5C5C2A2A2A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000008000008000008000008080
      80808080800000800000C0C0C0C0C0C0FFFFFFFFFFFF80000080000000000000
      0000000000F0F0F0D8D8D82828485050789898A0383858282838282838303050
      6868986870983838683030400000000000000000000000000000005C5C5CA4A4
      A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A45C5C5C0909092B2B2B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000008000008000008000
      00800000800000C0C0C0C0C0C0FFFFFFFFFFFFFFFFFFFFFFFF80000000000000
      0000000000000000304050181828283050888898202040B0B0B0282840282840
      687090384860202040808090D8D8E00000000000000000000000005C5C5CFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5C5C5C5C5C5C2A2A2A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008000008000
      00800000C0C0C0C0C0C0FFFFFFFFFFFFFFFFFFFFFFFFC0C0C000000000000000
      0000000000000000282848202038282840202838404860282838302840384050
      283040282840585060E8E8F8D0D0D80000000000000000000000005C5C5C5C5C
      5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C0909095C5C5C2A2A2A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008000
      00800000C0C0C0FFFFFFFFFFFFFFFFFFFFFFFFC0C0C000000000000000000000
      0000000000FFFFFFE0E0D8101028101020282838282838303040303040282838
      101020E0D8E0E0E0FFE8E8F00000000000000000000000000000005C5C5CA4A4
      A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A45C5C5C0909092A2A2A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00800000800000FFFFFFFFFFFFFFFFFFC0C0C000000000000000000000000000
      0000000000D8D0D0E8E8E8807080202038101020101020101020101020101020
      4040589898989090980000000000000000000000000000000000005C5C5CFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5C5C5C5C5C5C29292900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000800000800000FFFFFFC0C0C000000000000000000000000000000000
      0000000000E0E0E0E0E0FFC8C8D0B8B0B0384860282840282838303048888890
      B8B8B0B8B0B8E0E0E00000000000000000000000000000000000005C5C5CA4A4
      A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A45C5C5C29292900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000080000080000000000000000000000000000000000000000000
      0000000000000000D8D8F8E8E8F8F8F8F8D0C8D0A0A0A0000000C8C0C0D8D0D0
      E0E0E00000000000000000000000000000000000000000000000000000005C5C
      5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000A8A8B0000000000000000000000000000000000000E8E8E8
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000080808000000000000000000000000000
      0000000000000000000000000000000000000000000000808080808080808080
      8080800000000000000000000000000000000000000000000000000000000000
      0080808000000000000000000000000000000000000000000000000000000000
      0000000000000000DDDDDDC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
      C0C0C0C0C0C00000000000000000000000000000000000000000000000000000
      0000000000000000000000000080000000000080808000000000000000000000
      0000000000000000000000000000000000000000FF0000800000808080808080
      8080808080800000000000000000000000000000000000000000000000008080
      8000FFFF00000080808080808000000000000000000000000000000000000000
      0000000000000000DDDDDDA4A0A0444444444444444444444444444444444444
      444444999999999999999999999999A4A0A00000000000000000000000000000
      0000000000000000000000000080000080000000000080808000000000000000
      0000000000000000000000000000FF0000800000FF0000800000800000808080
      80808080808080808000000000000000000000000000000000000080808000FF
      FFC0C0C080808000000000000080808000000000000000000000000000000000
      0000000000000000444444999999A4A0A0A4A0A0002200002200A4A0A0A4A0A0
      999999999999A4A0A0DDDDDD0000000000000000000000000000000000000000
      00000000000000808080C0C0C080000080000080000000000080808000000000
      0000000000000000800000FF0000FF0000800000FF0000800000800000800000
      808080808080808080808080000000000000000000000000808080C0C0C08080
      8000000000000000FFFF00000000FFFF00000080808000000000000000000000
      0000000000444444A4A0A0C0C0C0C0C0C0CCCCCC00220000AA00002200CCCCCC
      C0C0C0A4A0A09999990000000000000000000000000000000000000000000000
      0000000000000080000080000080000080000080000000000000000000000000
      0000000000000000800000FF0000800000000080FF0000800000800000800000
      8000008080808080808080808080800000000000008080808080800000000000
      0000FFFF00000000FFFF00FFFF00FFFF00FFFFC0C0C000000080808000000000
      0000000000999999C0C0C0CCCCCCF0FBFF00AA0000220000AA0000AA00002200
      DDDDDDC0C0C0A4A0A04444440000000000000000000000000000000000000000
      00000000000000808080C0C0C0C0C0C080000080000000000000000000000000
      0000000000000000800000000080C0C0C0808080FF0000800000800000800000
      800000FF000080808080808080808000000080808000000000000000FFFF0000
      00C0C0C0C0C0C0C0C0C0C0C0C0000000008080C0C0C0C0C0C000FFFF00000000
      0000000000999999A4A0A0DDDDDDF0FBFF00220000330000990000AA00002200
      DDDDDDCCCCCCA4A0A04444440000000000000000000000000000000000000000
      00000000000000C0C0C0FF0000FF0000FF000080000000000000000000000000
      0000000000000000800000808080C0C0C0808080FF0000800000800000800000
      800000FF000080808000000000000000000000000000FFFF000000FFFFFFFFFF
      FFFFFFFFFFFFFF000000FF0000000000000000008080FFFFFF00000080808000
      0000000000999999C0C0C0DDDDDDF0FBFF00220000AA0000AA00009900F0FBFF
      DDDDDDCCCCCCA4A0A04444440000000000000000000000000000000000008000
      00808080000000000000FF0000FF0000FF0000FF000000000000000000000000
      0000000000000000800000808080C0C0C0000080FF0000800000800000800000
      800000FF0000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFF
      FF000000FF0000FF0000FF0000FF0000000080000000008080FFFFFF00000000
      0000000000999999A4A0A0DDDDDDF0FBFF00AA0000330000AA00002200002200
      DDDDDDA4A0A09999994444440000000000000000000000000000000000008000
      00800000808080000000000000FF0000FF000000000000000000000000000000
      00000000000000008000000000FF808080808080FF0000800000800000800000
      800000FF0000000000000000000000000000000000000000FFFFFFFFFFFF0000
      00FF0000FF0000000000008080000000FF000000008000000000000000000000
      0000000000444444A4A0A0C0C0C0DDDDDD00220000AA0000AA00009900DDDDDD
      CCCCCCA4A0A0999999000000000000000000000000000000000000C0C0C08000
      0080000080000080808000000000000000000000000000000000000000000000
      0000000000000000800000800000FF0000800000FF0000FF0000800000800000
      800000800000000000000000000000000000000000000000000000FFFFFF0000
      00000000008080808080808080008080000000FF000000008000000080808000
      0000000000000000999999A4A0A0CCCCCCDDDDDD002200009900DDDDDDC0C0C0
      A4A0A09999993333330000000000000000000000000000008080808000008000
      0080000080000000000080808000000000000000000000000000000000000000
      0000000000000000800000FF0000FF0000FF0000FF0000FF0000FF0000800000
      8000008000000000000000000000000000000000000000000000000000000080
      80808080808080FFFFFF808080808080008080000000FF000000000000000000
      0000000000000000000000444444999999A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0
      999999444444000000000000000000000000000000000000800000C0C0C08000
      0080000080000000000000000000000000000000000000000000000000000000
      0000000000000000000000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
      8000008000000000000000000000000000000000000000000000000000008080
      80FFFFFF80808080808080808080808080808000808000000000000000000000
      0000000000000000000000000000000000444444444444444444444444444444
      000000000000000000000000000000000000000000000000808080C0C0C0FF00
      0080000080000000000000000000000000000000000080808080808000000000
      0000000000000000000000000000FF0000FF0000FF0000FF0000FF0000FF0000
      FF00008000000000000000000000000000000000000000000000000000000000
      0080808080808080808080808080808080808080808000808000000000000000
      0000000000000000000000000000000000444444444444999999A4A0A0000000
      000000000000000000000000000000000000000000000000FF0000FF0000FF00
      00FF000080000000000000000000000000000000000000000080808000000000
      0000000000000000000000000000000000FF0000FF0000FF0000FF0000FF0000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000080808080808080808080808080808080808080808000000000000000
      0000000000000000000000000000000000A4A0A0DDDDDD444444A4A0A0444444
      000000000000000000000000000000000000000000000000000000FF0000FF00
      00FF0000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF0000FF0000FF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000080808080808080808080808000000000000000000000000000
      0000000000000000000000000000999999999999F0FBFFF0FBFFA4A0A0999999
      000000000000000000000000000000000000000000000000000000000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080808000000000000000000000000000000000000000
      0000000000000000000000000000999999000000999999444444444444444444
      444444000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFFFEFF0000FFFFE0C7F01F0000
      FC7FE007E00F0000F83FC003E0070000F01F8003E0070000E00F8003E0070000
      C0070003E007000080030003E007000080038003E0070000C003C001E0070000
      E007C001E0070000F00F8003E0070000F81F8007E0070000FC3F8007E0070000
      FE7FC11FF00F0000FFFFDFBFFFFF0000FF9FFC1FFBFFC00FFE0FF80FF07FC000
      FC07E007E03FC003FC038003C00F8007FC07800180038003FC07800100018003
      FC07800700018003E203800F00038003810B800F8003800780B3800FC001C007
      804F800FE003E00F8027C00FF007F83F80F3E00FF003F87FC0FBF00FF803F83F
      E0FFF83FFC0FF03FF3FFFCFFFE3FF41F00000000000000000000000000000000
      000000000000}
  end
  object ImageList2: TImageList
    Left = 224
    Top = 32
    Bitmap = {
      494C010102000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      000000000000360000002800000040000000100000000100180000000000000C
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D8CCC0D8CCC0D8CCC0D8CCC0D8CC
      C0D8CCC0D8CCC0D8CCC0D8CCC0D8CCC0D8CCC0D8CCC0D8CCC0D8CCC0D8CCC0D8
      CCC0000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D8CCC0D8CCC0D8CCC0D8CCC0D8CC
      C0D8CCC0D8CCC0D8CCC0D8CCC0D8CCC0D8CCC0D8CCC0D8CCC0D8CCC0D8CCC0D8
      CCC0000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D8CCC0D8CCC0D8CCC0D8CCC0D8CC
      C0D8CCC0808080808080FFFFFFFFFFFFD8CCC0D8CCC0D8CCC0D8CCC0D8CCC0D8
      CCC0000000000000808080C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
      C0C0C0C0C0C0C0C0C0C0C0C00000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D8CCC0D8CCC0D8CCC0D8CCC0D8CC
      C0D8CCC0808080808080FFFFFFFFFFFFD8CCC0D8CCC0D8CCC0D8CCC0D8CCC0D8
      CCC0000000000000808080000000000000C0C0C0000000C0C0C0000000C0C0C0
      000000C0C0C0000000C0C0C00000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D8CCC0D8CCC0D8CCC0D8CCC0D8CC
      C0808080D8CCC0D8CCC0D8CCC0D8CCC0FFFFFFD8CCC0D8CCC0D8CCC0D8CCC0D8
      CCC0000000000000808080000000C0C0C0000000C0C0C0808080C0C0C0000000
      C0C0C0000000C0C0C0C0C0C00000000000000000000000000000000000000000
      00000000000000808080FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF000000000000000000000000D8CCC0D8CCC0D8CCC0D8CCC0D8CC
      C0808080D8CCC0D8CCC0D8CCC0D8CCC0FFFFFFD8CCC0D8CCC0D8CCC0D8CCC0D8
      CCC0000000000000808080000000000000C0C0C0808080808080808080C0C0C0
      000000C0C0C0000000C0C0C00000000000000000000000000000000000000000
      00000000808080000000000000FFFFFF00000000000000000000000000000000
      0000000000000000000000000000808080000000000000000000000000000000
      000000FFFFFF000000000000000000000000D8CCC0D8CCC0D8CCC0D8CCC0D8CC
      C0808080D8CCC0D8CCC0D8CCC0D8CCC0FFFFFFD8CCC0D8CCC0D8CCC0D8CCC0D8
      CCC0000000000000808080000000C0C0C0808080808080808080808080808080
      C0C0C0000000C0C0C0C0C0C00000000000000000000000000000000000000000
      00000000808080000000000000FFFFFF00000000000000000000000000000000
      0000000000000000000000000000000000808080000000000000000000000000
      FFFFFF000000000000000000000000000000D8CCC0D8CCC0D8CCC08080808080
      80D8CCC0D8CCC0D8CCC0D8CCC0D8CCC0D8CCC0FFFFFFFFFFFFD8CCC0D8CCC0D8
      CCC0000000000000808080000000000000808080808080C0C0C0808080808080
      808080C0C0C0000000C0C0C00000000000000000000000000000000000000000
      00808080000000000000000000000000FFFFFF00000000000000000000000000
      0000000000000000000000000000000000808080000000000000000000000000
      FFFFFF000000000000000000000000000000D8CCC0D8CCC0D8CCC08080808080
      80D8CCC0D8CCC0D8CCC0D8CCC0D8CCC0D8CCC0FFFFFFFFFFFFD8CCC0D8CCC0D8
      CCC0000000000000808080000000C0C0C0808080C0C0C0000000C0C0C0808080
      808080808080C0C0C0C0C0C00000000000000000000000000000000000000000
      00808080000000000000000000000000FFFFFF00000000000000000000000000
      0000000000000000000000000000000000000000808080000000000000FFFFFF
      000000000000000000000000000000000000D8CCC0D8CCC0D8CCC08080808080
      80D8CCC0D8CCC0D8CCC0D8CCC0D8CCC0D8CCC0FFFFFFFFFFFFD8CCC0D8CCC0D8
      CCC0000000000000808080000000000000C0C0C0000000C0C0C0000000C0C0C0
      808080808080000000C0C0C00000000000000000000000000000000000008080
      80000000000000000000000000000000000000FFFFFF00000000000000000000
      0000000000000000000000000000000000000000808080000000000000FFFFFF
      000000000000000000000000000000000000D8CCC0D8CCC0D8CCC08080808080
      80D8CCC0D8CCC0D8CCC0D8CCC0D8CCC0D8CCC0FFFFFFFFFFFFD8CCC0D8CCC0D8
      CCC0000000000000808080000000C0C0C0000000C0C0C0000000C0C0C0000000
      C0C0C0808080C0C0C0C0C0C00000000000000000000000000000000000008080
      80808080808080808080808080808080808080FFFFFF00000000000000000000
      0000000000000000000000000000000000000000000000808080FFFFFF000000
      000000000000000000000000000000000000D8CCC0D8CCC0808080D8CCC0D8CC
      C0D8CCC0D8CCC0D8CCC0D8CCC0D8CCC0D8CCC0D8CCC0D8CCC0FFFFFFD8CCC0D8
      CCC0000000000000808080000000000000C0C0C0000000C0C0C0000000C0C0C0
      000000C0C0C0000000C0C0C00000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D8CCC0D8CCC08080808080808080
      80808080808080808080808080808080808080808080808080FFFFFFD8CCC0D8
      CCC0000000000000808080000000000000000000000000000000000000000000
      000000000000000000C0C0C00000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D8CCC0D8CCC08080808080808080
      80808080808080808080808080808080808080808080808080FFFFFFD8CCC0D8
      CCC0000000000000808080808080808080808080808080808080808080808080
      8080808080808080808080800000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D8CCC0D8CCC0D8CCC0D8CCC0D8CC
      C0D8CCC0D8CCC0D8CCC0D8CCC0D8CCC0D8CCC0D8CCC0D8CCC0D8CCC0D8CCC0D8
      CCC0000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D8CCC0D8CCC0D8CCC0D8CCC0D8CC
      C0D8CCC0D8CCC0D8CCC0D8CCC0D8CCC0D8CCC0D8CCC0D8CCC0D8CCC0D8CCC0D8
      CCC0000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFFD8CCC000FFFFFFFFD8CCC000
      FFFFFFFFD8CCC000FFFFFFFFD8CCC000FFFFFFFFD8CCC000FE7FF00FD8CCC000
      FDBFF7EFD8CCC000FDBFFBDFD8CCC000FBDFFBDFD8CCC000FBDFFDBFD8CCC000
      F7EFFDBFFFFFFFFFF00FFE7F00000000FFFFFFFF00000000FFFFFFFF00000000
      FFFFFFFF00000000FFFFFFFF0000000000000000000000000000000000000000
      000000000000}
  end
  object trMain: TIBTransaction
    Active = False
    DefaultDatabase = ibdMain
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saNone
    Left = 12
    Top = 43
  end
  object ibdsMainComps: TIBDataSet
    Database = ibdMain
    Transaction = trMain
    BufferChunks = 100
    CachedUpdates = False
    SelectSQL.Strings = (
      
        'select ID, NUMBER, NETWORK_NAME, IP_ADDRESS, CLASS, DESCRIPTION,' +
        ' VALID, COMMENTS'
      'from COMPS'
      'order by 2 desc, 5 asc')
    Left = 70
    Top = 72
    object ibdsMainCompsNUMBER: TIBStringField
      Alignment = taRightJustify
      DisplayLabel = '№№'
      DisplayWidth = 9
      FieldName = 'NUMBER'
      Size = 10
    end
    object ibdsMainCompsCLASS: TIntegerField
      DisplayLabel = 'Класс'
      DisplayWidth = 9
      FieldName = 'CLASS'
    end
    object ibdsMainCompsIP_ADDRESS: TIBStringField
      DisplayLabel = 'Сетевое имя'
      DisplayWidth = 12
      FieldName = 'NETWORK_NAME'
      Size = 15
    end
    object ibdsMainCompsIP_ADDRESS2: TIBStringField
      DisplayLabel = 'IP адрес(а)'
      DisplayWidth = 17
      FieldName = 'IP_ADDRESS'
      Size = 100
    end
    object ibdsMainCompsDESCRIPTION: TIBStringField
      DisplayLabel = 'Описание'
      DisplayWidth = 37
      FieldName = 'DESCRIPTION'
      Size = 100
    end
    object ibdsMainCompsVALID: TIntegerField
      DisplayLabel = 'Дейст'
      DisplayWidth = 9
      FieldName = 'VALID'
    end
    object ibdsMainCompsID: TIntegerField
      DisplayWidth = 10
      FieldName = 'ID'
      Visible = False
    end
    object ibdsMainCompsCOMMENTS: TIBStringField
      DisplayWidth = 500
      FieldName = 'COMMENTS'
      Visible = False
      Size = 500
    end
  end
  object dsMainComps: TDataSource
    DataSet = ibdsMainComps
    Left = 70
    Top = 101
  end
  object ibdMain: TIBDatabase
    Params.Strings = (
      'lc_ctype=WIN1251')
    LoginPrompt = False
    DefaultTransaction = trMain
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    AllowStreamedConnected = False
    Left = 12
    Top = 14
  end
  object ibdsMainTariffs: TIBDataSet
    Database = ibdMain
    Transaction = trMain
    BufferChunks = 100
    CachedUpdates = False
    SelectSQL.Strings = (
      'select ID, NAME, I_SPEED, PRICE, VALID, COMMENTS'
      'from TARIFFS'
      'order by 2, 4')
    Left = 99
    Top = 72
    object ibdsMainTariffsNAME: TIBStringField
      DisplayLabel = 'Наименование'
      DisplayWidth = 50
      FieldName = 'NAME'
      Size = 100
    end
    object ibdsMainTariffsI_SPEED: TIntegerField
      DisplayLabel = 'Скорость~соединения, бит/с'
      DisplayWidth = 21
      FieldName = 'I_SPEED'
      Required = True
      DisplayFormat = '### ### ##0'
      EditFormat = '########0'
      MaxValue = 1999999999
    end
    object ibdsMainTariffsPRICE: TFloatField
      DisplayLabel = 'Цена/час'
      DisplayWidth = 13
      FieldName = 'PRICE'
      DisplayFormat = '#,##0.00'
      EditFormat = '### ### ##0.00'
    end
    object ibdsMainTariffsVALID: TIntegerField
      DisplayLabel = 'Дейст'
      DisplayWidth = 11
      FieldName = 'VALID'
    end
    object ibdsMainTariffsID: TIntegerField
      DisplayWidth = 10
      FieldName = 'ID'
      Visible = False
    end
    object ibdsMainTariffsCOMMENTS: TIBStringField
      DisplayWidth = 100
      FieldName = 'COMMENTS'
      Visible = False
      Size = 100
    end
  end
  object dsMainTariffs: TDataSource
    DataSet = ibdsMainTariffs
    Left = 99
    Top = 101
  end
  object ibdsMainClass: TIBDataSet
    Database = ibdMain
    Transaction = trMain
    AfterClose = ibdsMainClassAfterClose
    AfterOpen = ibdsMainClassAfterOpen
    AfterScroll = ibdsMainClassAfterScroll
    BeforeOpen = ibdsMainClassBeforeOpen
    OnCalcFields = ibdsMainClassCalcFields
    BufferChunks = 100
    CachedUpdates = False
    SelectSQL.Strings = (
      'select C.CLASS, SUM(O.TIME_STOP-O.TIME_START) DURATION,'
      'SUM(O.PRICE) TOTAL_SUM'
      'from GET_ORDERS(:START,:STOP) O, COMPS C, TARIFFS T'
      'where (C.ID=O.COMP_ID) and (O.TARIFF_ID=T.ID) and (T.IN_COUNT=1)'
      'group by C.CLASS'
      'order by 3 desc')
    Left = 12
    Top = 72
    object ibdsMainClassCLASS: TIntegerField
      DisplayLabel = 'Класс'
      DisplayWidth = 9
      FieldName = 'CLASS'
      ReadOnly = True
      Required = True
    end
    object ibdsMainClassPercentage: TStringField
      DisplayLabel = 'Использование времени'
      DisplayWidth = 29
      FieldKind = fkCalculated
      FieldName = 'Percentage'
      ReadOnly = True
      Size = 27
      Calculated = True
    end
    object ibdsMainClassTOTAL_SUM: TFloatField
      DisplayLabel = 'Сумма'
      DisplayWidth = 13
      FieldName = 'TOTAL_SUM'
      ReadOnly = True
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
      currency = True
    end
    object ibdsMainClassDURATION: TFloatField
      DisplayLabel = 'Длительность'
      DisplayWidth = 19
      FieldName = 'DURATION'
      ReadOnly = True
      Visible = False
    end
  end
  object dsMainClass: TDataSource
    DataSet = ibdsMainClass
    Left = 12
    Top = 101
  end
  object ibdsMainGroupTariff: TIBDataSet
    Database = ibdMain
    Transaction = trMain
    AfterClose = ibdsMainGroupTariffAfterClose
    AfterOpen = ibdsMainGroupTariffAfterOpen
    AfterScroll = ibdsMainGroupTariffAfterScroll
    BeforeOpen = ibdsMainGroupTariffBeforeOpen
    OnCalcFields = ibdsMainGroupTariffCalcFields
    BufferChunks = 100
    CachedUpdates = False
    SelectSQL.Strings = (
      'select T.ID, T.NAME, SUM(O.TIME_STOP-O.TIME_START) DURATION,'
      'SUM(O.PRICE) TOTAL_SUM, T.IN_COUNT'
      'from TARIFFS T, GET_ORDERS(:START,:STOP) O, COMPS C'
      
        'where (T.ID=O.TARIFF_ID) and (C.ID=O.COMP_ID) and (C.CLASS=:CLAS' +
        'S)'
      'group by T.ID, T.NAME, T.IN_COUNT'
      'order by 3 desc')
    ModifySQL.Strings = (
      'update TARIFFS'
      'set'
      '  IN_COUNT = :IN_COUNT'
      'where'
      '  ID = :OLD_ID')
    DataSource = dsMainClass
    OnFilterRecord = ibdsMainGroupTariffFilterRecord
    Left = 41
    Top = 72
    object ibdsMainGroupTariffNAME: TIBStringField
      DisplayLabel = 'Тариф'
      DisplayWidth = 13
      FieldName = 'NAME'
      Required = True
      Size = 100
    end
    object ibdsMainGroupTariffPercentage: TStringField
      DisplayLabel = 'Использование~времени'
      DisplayWidth = 19
      FieldKind = fkCalculated
      FieldName = 'Percentage'
      Calculated = True
    end
    object ibdsMainGroupTariffTOTAL_SUM: TFloatField
      DisplayLabel = 'Сумма'
      DisplayWidth = 11
      FieldName = 'TOTAL_SUM'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
      currency = True
    end
    object ibdsMainGroupTariffIN_COUNT: TIntegerField
      DisplayLabel = 'В~итогах'
      DisplayWidth = 7
      FieldName = 'IN_COUNT'
      OnChange = ibdsMainGroupTariffIN_COUNTChange
    end
    object ibdsMainGroupTariffDURATION: TFloatField
      DisplayLabel = 'Длительность'
      FieldName = 'DURATION'
      Visible = False
    end
    object ibdsMainGroupTariffID: TIntegerField
      FieldName = 'ID'
      Required = True
      Visible = False
    end
  end
  object dsMainGroupTariff: TDataSource
    DataSet = ibdsMainGroupTariff
    Left = 41
    Top = 101
  end
  object ibsServo: TIBSQL
    Database = ibdMain
    ParamCheck = True
    Transaction = trMain
    Left = 158
    Top = 72
  end
  object opd: TOpenDialog
    DefaultExt = 'rep'
    Filter = 'Файлы отчета|XXX.rep'
    Options = [ofReadOnly, ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Title = 'Укажите файл отчета'
    Left = 14
    Top = 152
  end
  object ibRS: TIBRestoreService
    ServerName = 'localhost'
    LoginPrompt = False
    TraceFlags = []
    PageBuffers = 3000
    Options = [Replace, CreateNewDB]
    Left = 43
    Top = 152
  end
  object ibsGraphs: TIBSQL
    Database = ibdMain
    ParamCheck = True
    Transaction = trMain
    Left = 187
    Top = 72
  end
  object frReport1: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    OnBeforePrint = frReport1BeforePrint
    Left = 174
    Top = 152
    ReportForm = {18000000}
  end
  object frChartObject1: TfrChartObject
    Left = 261
    Top = 152
  end
  object frDesigner1: TfrDesigner
    Left = 203
    Top = 152
  end
  object frDBDataSet1: TfrDBDataSet
    DataSet = ibdsMainGroupTariff
    Left = 232
    Top = 152
  end
  object opdRep: TOpenDialog
    DefaultExt = '*.frf'
    Filter = 'Файлы отчетов|*.frf'
    Options = [ofReadOnly, ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Left = 296
    Top = 152
  end
  object ibdsEncashment: TIBDataSet
    Database = ibdMain
    Transaction = trMain
    BeforeOpen = ibdsEncashmentBeforeOpen
    BufferChunks = 1000
    CachedUpdates = False
    SelectSQL.Strings = (
      'select E.CREATE_TIME, E.AMOUNT, E.COMMENTS'
      'from ENCASHMENT E'
      'where (E.CREATE_TIME>:Start) and (E.CREATE_TIME<:Stop)'
      'order by 1 asc')
    Left = 128
    Top = 72
    object ibdsEncashmentCREATE_TIME: TDateTimeField
      DisplayLabel = 'Дата'
      DisplayWidth = 18
      FieldName = 'CREATE_TIME'
      Origin = 'ENCASHMENT.CREATE_TIME'
      Required = True
    end
    object ibdsEncashmentAMOUNT: TFloatField
      DisplayLabel = 'Сумма'
      DisplayWidth = 16
      FieldName = 'AMOUNT'
      Origin = 'ENCASHMENT.AMOUNT'
      DisplayFormat = '#,##0.00'
    end
    object ibdsEncashmentCOMMENTS: TIBStringField
      DisplayLabel = 'Комментарии'
      DisplayWidth = 66
      FieldName = 'COMMENTS'
      Origin = 'ENCASHMENT.COMMENTS'
      Size = 100
    end
  end
  object dsEncashment: TDataSource
    DataSet = ibdsEncashment
    Left = 128
    Top = 101
  end
  object ibsAux: TIBSQL
    Database = ibdMain
    ParamCheck = True
    Transaction = trMain
    Left = 217
    Top = 72
  end
  object ibdsMainProg: TIBDataSet
    Database = ibdMain
    Transaction = trMain
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from PROGRAMMS'
      'where'
      '  ID_PROG = :OLD_ID_PROG')
    InsertSQL.Strings = (
      'insert into PROGRAMMS'
      '  (ID_PROG, NAME, PATH, ICON, HASH, NUM_OF_COMPS)'
      'values'
      '  (:ID_PROG, :NAME, :PATH, :ICON, :HASH, :NUM_OF_COMPS)')
    RefreshSQL.Strings = (
      'Select '
      '  ID_PROG,'
      '  NAME,'
      '  PATH,'
      '  ICON,'
      '  HASH,'
      '  NUM_OF_COMPS'
      'from PROGRAMMS '
      'where'
      '  ID_PROG = :ID_PROG')
    SelectSQL.Strings = (
      'select ID_PROG, NAME, PATH, ICON, HASH, NUM_OF_COMPS'
      'from PROGRAMMS'
      'order by 2 '
      ''
      '')
    ModifySQL.Strings = (
      'update PROGRAMMS'
      'set'
      '  ID_PROG = :ID_PROG,'
      '  NAME = :NAME,'
      '  PATH = :PATH,'
      '  ICON = :ICON,'
      '  HASH = :HASH,'
      '  NUM_OF_COMPS = :NUM_OF_COMPS'
      'where'
      '  ID_PROG = :OLD_ID_PROG')
    Left = 356
    Top = 72
    object ibdsMainProgNAME: TIBStringField
      FieldName = 'NAME'
      Origin = 'COMPS_SETS.NAME'
      Required = True
      Size = 30
    end
    object ibdsMainProgPATH: TIBStringField
      FieldName = 'PATH'
      Origin = 'COMPS_SETS.PATH'
      Required = True
      Size = 150
    end
    object ibdsMainProgICON: TBlobField
      FieldName = 'ICON'
      Origin = 'COMPS_SETS.ICON'
      Required = True
      BlobType = ftBlob
      Size = 8
    end
    object ibdsMainProgID_PROG: TIntegerField
      FieldName = 'ID_PROG'
      Origin = 'COMPS_SETS.ID_PROG'
      Required = True
    end
    object ibdsMainProgHASH: TIntegerField
      FieldName = 'HASH'
      Origin = 'COMPS_SETS.HASH'
      Required = True
    end
    object ibdsMainProgNUM_OF_COMPS: TIntegerField
      FieldName = 'NUM_OF_COMPS'
      Origin = 'PROGRAMMS.NUM_OF_COMPS'
      Required = True
    end
  end
  object dsMainProg: TDataSource
    DataSet = ibdsMainProg
    Left = 356
    Top = 102
  end
  object ibdsCompProg: TIBDataSet
    Database = ibdMain
    Transaction = trMain
    BufferChunks = 100
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from PROG_COMPS'
      'where'
      '  ID = :OLD_ID and'
      '  ID_PROG = :OLD_ID_PROG')
    InsertSQL.Strings = (
      'insert into PROG_COMPS'
      '  (ID, ID_PROG)'
      'values'
      '  (:ID, :ID_PROG)')
    RefreshSQL.Strings = (
      
        'select PC.ID, C.NUMBER, PC.ID_PROG, C.DESCRIPTION, C.NETWORK_NAM' +
        'E, C.ID from PROG_COMPS PC, COMPS C'
      'where (PC.ID_PROG=:Id_Prog) and (PC.ID=C.ID)'
      'order by 1')
    SelectSQL.Strings = (
      
        'select PC.ID, C.NUMBER, PC.ID_PROG, C.DESCRIPTION, C.NETWORK_NAM' +
        'E, C.ID from PROG_COMPS PC, COMPS C'
      'where (PC.ID_PROG=:Id_Prog) and (PC.ID=C.ID)'
      'order by 1')
    ModifySQL.Strings = (
      'update PROG_COMPS'
      'set'
      '  ID = :ID,'
      '  ID_PROG = :ID_PROG'
      'where'
      '  ID = :OLD_ID and'
      '  ID_PROG = :OLD_ID_PROG')
    DataSource = dsMainProg
    Left = 390
    Top = 72
    object ibdsCompProgNUMBER: TIBStringField
      FieldName = 'NUMBER'
      Origin = 'COMPS.NUMBER'
      Required = True
      Size = 10
    end
    object ibdsCompProgID_PROG: TIntegerField
      FieldName = 'ID_PROG'
      Origin = 'PROGRAMMS_COMPS.ID_PROG'
      Required = True
    end
    object ibdsCompProgDESCRIPTION: TIBStringField
      FieldName = 'DESCRIPTION'
      Origin = 'COMPS.DESCRIPTION'
      Required = True
      Size = 100
    end
    object ibdsCompProgNETWORK_NAME: TIBStringField
      FieldName = 'NETWORK_NAME'
      Origin = 'COMPS.NETWORK_NAME'
      Required = True
      Size = 30
    end
    object ibdsCompProgID: TIntegerField
      FieldName = 'ID'
      Origin = 'PROG_COMPS.ID'
      Required = True
    end
  end
  object dsCompProg: TDataSource
    DataSet = ibdsCompProg
    Left = 390
    Top = 101
  end
  object ibdsLogUnorder: TIBDataSet
    Database = ibdMain
    Transaction = trMain
    BeforeOpen = ibdsLogUnorderBeforeOpen
    OnCalcFields = ibdsLogUnorderCalcFields
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      '')
    SelectSQL.Strings = (
      'select C.NUMBER, C.NETWORK_NAME, UT.TIME_START, UT.TIME_STOP'
      'from  UNORDER_TIME UT, COMPS C'
      
        'where (UT.COMP_ID=C.ID) and (UT.TIME_START>:Start) and (UT.TIME_' +
        'START<:Stop)'
      'order by 1 asc')
    Left = 420
    Top = 72
    object ibdsLogUnorderNETWORK_NAME: TIBStringField
      FieldName = 'NETWORK_NAME'
      Origin = '"COMPS"."NETWORK_NAME"'
      Required = True
      Size = 30
    end
    object ibdsLogUnorderTIME_START: TDateTimeField
      FieldName = 'TIME_START'
      Origin = '"UNORDER_TIME"."TIME_START"'
      Required = True
    end
    object ibdsLogUnorderTIME_STOP: TDateTimeField
      FieldName = 'TIME_STOP'
      Origin = '"UNORDER_TIME"."TIME_STOP"'
      Required = True
    end
    object ibdsLogUnorderNUMBER: TIBStringField
      FieldName = 'NUMBER'
      Origin = '"COMPS"."NUMBER"'
      Required = True
      Size = 10
    end
    object ibdsLogUnorderDeltaTime: TStringField
      FieldKind = fkCalculated
      FieldName = 'DeltaTime'
      Calculated = True
    end
  end
  object dsLogUnorder: TDataSource
    DataSet = ibdsLogUnorder
    Left = 421
    Top = 102
  end
  object ibdsLogComps: TIBDataSet
    Database = ibdMain
    Transaction = trMain
    BeforeOpen = ibdsLogCompsBeforeOpen
    BufferChunks = 1000
    CachedUpdates = False
    SelectSQL.Strings = (
      'select C.NUMBER, C.NETWORK_NAME, CL.NEW_VALID, CL.CHANGE_TIME'
      'from  COMPS_LOGS CL, COMPS C'
      
        'where (CL.COMP_ID=C.ID) and (CL.CHANGE_TIME>:Start) and (CL.CHAN' +
        'GE_TIME<:Stop)'
      'order by 1 asc')
    Left = 452
    Top = 72
    object ibdsLogCompsNUMBER: TIBStringField
      FieldName = 'NUMBER'
      Origin = '"COMPS"."NUMBER"'
      Required = True
      Size = 10
    end
    object ibdsLogCompsNETWORK_NAME: TIBStringField
      FieldName = 'NETWORK_NAME'
      Origin = '"COMPS"."NETWORK_NAME"'
      Required = True
      Size = 30
    end
    object ibdsLogCompsNEW_VALID: TSmallintField
      FieldName = 'NEW_VALID'
      Origin = '"COMPS_LOGS"."NEW_VALID"'
      Required = True
    end
    object ibdsLogCompsCHANGE_TIME: TDateTimeField
      FieldName = 'CHANGE_TIME'
      Origin = '"COMPS_LOGS"."CHANGE_TIME"'
      Required = True
    end
  end
  object dsLogComps: TDataSource
    DataSet = ibdsLogComps
    Left = 453
    Top = 102
  end
  object ibdsLogTariffs: TIBDataSet
    Database = ibdMain
    Transaction = trMain
    BeforeOpen = ibdsLogTariffsBeforeOpen
    BufferChunks = 1000
    CachedUpdates = False
    SelectSQL.Strings = (
      'select T.NAME, TL.NEW_PRICE,TL.OLD_PRICE, TL.CHANGE_TIME'
      'from  TARIFFS_LOGS TL, TARIFFS T'
      
        'where (TL.TARIFF_ID=T.ID) and (TL.CHANGE_TIME>:Start) and (TL.CH' +
        'ANGE_TIME<:Stop)'
      'order by 1 asc')
    Left = 484
    Top = 72
    object ibdsLogTariffsNAME: TIBStringField
      FieldName = 'NAME'
      Origin = '"TARIFFS"."NAME"'
      Required = True
      Size = 100
    end
    object ibdsLogTariffsNEW_PRICE: TFloatField
      FieldName = 'NEW_PRICE'
      Origin = '"TARIFFS_LOGS"."NEW_PRICE"'
      Required = True
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object ibdsLogTariffsOLD_PRICE: TFloatField
      FieldName = 'OLD_PRICE'
      Origin = '"TARIFFS_LOGS"."OLD_PRICE"'
      Required = True
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object ibdsLogTariffsCHANGE_TIME: TDateTimeField
      FieldName = 'CHANGE_TIME'
      Origin = '"TARIFFS_LOGS"."CHANGE_TIME"'
      Required = True
    end
  end
  object dsLogTariffs: TDataSource
    DataSet = ibdsLogTariffs
    Left = 484
    Top = 102
  end
end
