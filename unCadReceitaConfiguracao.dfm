object fmCadReceitaConfiguracao: TfmCadReceitaConfiguracao
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Receita :: Gerar itens'
  ClientHeight = 151
  ClientWidth = 254
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PanelBotoes: TAdvPanel
    Left = 0
    Top = 110
    Width = 254
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    Color = 16640730
    TabOrder = 0
    UseDockManager = True
    Version = '2.3.0.5'
    BorderColor = clGray
    Caption.Color = 14059353
    Caption.ColorTo = 9648131
    Caption.Font.Charset = DEFAULT_CHARSET
    Caption.Font.Color = clWindowText
    Caption.Font.Height = -11
    Caption.Font.Name = 'Tahoma'
    Caption.Font.Style = []
    Caption.GradientDirection = gdVertical
    Caption.Indent = 2
    Caption.ShadeLight = 255
    CollapsColor = clNone
    CollapsDelay = 0
    ColorTo = 14986888
    ShadowColor = clBlack
    ShadowOffset = 0
    StatusBar.BorderColor = clNone
    StatusBar.BorderStyle = bsSingle
    StatusBar.Font.Charset = DEFAULT_CHARSET
    StatusBar.Font.Color = clWhite
    StatusBar.Font.Height = -11
    StatusBar.Font.Name = 'Tahoma'
    StatusBar.Font.Style = []
    StatusBar.Color = 14716773
    StatusBar.ColorTo = 16374724
    StatusBar.GradientDirection = gdVertical
    Styler = fmPrincipal.PanelStyler
    FullHeight = 41
    object BitBtnFechar: TAdvGlowButton
      Left = 148
      Top = 8
      Width = 75
      Height = 25
      Hint = 'Fechar a tela sem informar as configura'#231#245'es.'
      Cancel = True
      Caption = '&Fechar'
      NotesFont.Charset = DEFAULT_CHARSET
      NotesFont.Color = clWindowText
      NotesFont.Height = -11
      NotesFont.Name = 'Tahoma'
      NotesFont.Style = []
      Spacing = 3
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      TabStop = True
      OnClick = BitBtnFecharClick
      Appearance.ColorChecked = 16111818
      Appearance.ColorCheckedTo = 16367008
      Appearance.ColorDisabled = 15921906
      Appearance.ColorDisabledTo = 15921906
      Appearance.ColorDown = 16111818
      Appearance.ColorDownTo = 16367008
      Appearance.ColorHot = 16117985
      Appearance.ColorHotTo = 16372402
      Appearance.ColorMirrorHot = 16107693
      Appearance.ColorMirrorHotTo = 16775412
      Appearance.ColorMirrorDown = 16102556
      Appearance.ColorMirrorDownTo = 16768988
      Appearance.ColorMirrorChecked = 16102556
      Appearance.ColorMirrorCheckedTo = 16768988
      Appearance.ColorMirrorDisabled = 11974326
      Appearance.ColorMirrorDisabledTo = 15921906
    end
    object BitBtnAplicar: TAdvGlowButton
      Left = 68
      Top = 8
      Width = 75
      Height = 25
      Hint = 'Aplicar as configura'#231#245'es e fechar a tela.'
      Caption = '&Aplicar'
      Default = True
      NotesFont.Charset = DEFAULT_CHARSET
      NotesFont.Color = clWindowText
      NotesFont.Height = -11
      NotesFont.Name = 'Tahoma'
      NotesFont.Style = []
      Spacing = 3
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      TabStop = True
      OnClick = BitBtnAplicarClick
      Appearance.ColorChecked = 16111818
      Appearance.ColorCheckedTo = 16367008
      Appearance.ColorDisabled = 15921906
      Appearance.ColorDisabledTo = 15921906
      Appearance.ColorDown = 16111818
      Appearance.ColorDownTo = 16367008
      Appearance.ColorHot = 16117985
      Appearance.ColorHotTo = 16372402
      Appearance.ColorMirrorHot = 16107693
      Appearance.ColorMirrorHotTo = 16775412
      Appearance.ColorMirrorDown = 16102556
      Appearance.ColorMirrorDownTo = 16768988
      Appearance.ColorMirrorChecked = 16102556
      Appearance.ColorMirrorCheckedTo = 16768988
      Appearance.ColorMirrorDisabled = 11974326
      Appearance.ColorMirrorDisabledTo = 15921906
    end
  end
  object PanelInfo: TAdvPanel
    Left = 0
    Top = 0
    Width = 254
    Height = 24
    Align = alTop
    BevelOuter = bvNone
    Color = 16640730
    TabOrder = 2
    UseDockManager = True
    Version = '2.3.0.5'
    BorderColor = clGray
    Caption.Color = 14059353
    Caption.ColorTo = 9648131
    Caption.Font.Charset = DEFAULT_CHARSET
    Caption.Font.Color = clWindowText
    Caption.Font.Height = -11
    Caption.Font.Name = 'Tahoma'
    Caption.Font.Style = []
    Caption.GradientDirection = gdVertical
    Caption.Indent = 2
    Caption.ShadeLight = 255
    CollapsColor = clNone
    CollapsDelay = 0
    ColorTo = 14986888
    ShadowColor = clBlack
    ShadowOffset = 0
    StatusBar.BorderColor = clNone
    StatusBar.BorderStyle = bsSingle
    StatusBar.Font.Charset = DEFAULT_CHARSET
    StatusBar.Font.Color = clWhite
    StatusBar.Font.Height = -11
    StatusBar.Font.Name = 'Tahoma'
    StatusBar.Font.Style = []
    StatusBar.Color = 14716773
    StatusBar.ColorTo = 16374724
    StatusBar.GradientDirection = gdVertical
    Styler = fmPrincipal.PanelStyler
    FullHeight = 24
    object LabelCamposRequeridos: TLabel
      Left = 5
      Top = 6
      Width = 132
      Height = 13
      Caption = '(*) Campos requeridos.'
      Color = clInfoText
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold, fsItalic]
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
  end
  object PanelTitulos: TAdvPanel
    Left = 0
    Top = 24
    Width = 119
    Height = 86
    Align = alLeft
    BevelOuter = bvNone
    Color = 16640730
    TabOrder = 1
    UseDockManager = True
    Version = '2.3.0.5'
    BorderColor = clGray
    Caption.Color = 14059353
    Caption.ColorTo = 9648131
    Caption.Font.Charset = DEFAULT_CHARSET
    Caption.Font.Color = clWindowText
    Caption.Font.Height = -11
    Caption.Font.Name = 'Tahoma'
    Caption.Font.Style = []
    Caption.GradientDirection = gdVertical
    Caption.Indent = 2
    Caption.ShadeLight = 255
    CollapsColor = clNone
    CollapsDelay = 0
    ColorTo = 14986888
    ShadowColor = clBlack
    ShadowOffset = 0
    StatusBar.BorderColor = clNone
    StatusBar.BorderStyle = bsSingle
    StatusBar.Font.Charset = DEFAULT_CHARSET
    StatusBar.Font.Color = clWhite
    StatusBar.Font.Height = -11
    StatusBar.Font.Name = 'Tahoma'
    StatusBar.Font.Style = []
    StatusBar.Color = 14716773
    StatusBar.ColorTo = 16374724
    StatusBar.GradientDirection = gdVertical
    Styler = fmPrincipal.PanelStyler
    FullHeight = 141
    object LabelDataPagamento: TLabel
      Left = 14
      Top = 38
      Width = 105
      Height = 13
      Caption = 'Data do pagamento*:'
      Transparent = True
    end
    object LabelValorPago: TLabel
      Left = 58
      Top = 13
      Width = 61
      Height = 13
      Caption = 'Valor pago*:'
      Transparent = True
    end
  end
  object PanelCampos: TAdvPanel
    Left = 119
    Top = 24
    Width = 135
    Height = 86
    Align = alClient
    BevelOuter = bvNone
    Color = 16640730
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    UseDockManager = True
    Version = '2.3.0.5'
    BorderColor = clGray
    Caption.Color = 14059353
    Caption.ColorTo = 9648131
    Caption.Font.Charset = DEFAULT_CHARSET
    Caption.Font.Color = clWhite
    Caption.Font.Height = -11
    Caption.Font.Name = 'Tahoma'
    Caption.Font.Style = []
    Caption.GradientDirection = gdVertical
    Caption.Indent = 2
    Caption.ShadeLight = 255
    CollapsColor = clNone
    CollapsDelay = 0
    ColorTo = 14986888
    ShadowColor = clBlack
    ShadowOffset = 0
    StatusBar.BorderColor = clNone
    StatusBar.BorderStyle = bsSingle
    StatusBar.Font.Charset = DEFAULT_CHARSET
    StatusBar.Font.Color = clWhite
    StatusBar.Font.Height = -11
    StatusBar.Font.Name = 'Tahoma'
    StatusBar.Font.Style = []
    StatusBar.Color = 14716773
    StatusBar.ColorTo = 16374724
    StatusBar.GradientDirection = gdVertical
    Styler = fmPrincipal.PanelStyler
    FullHeight = 141
    object CheckBoxIncrementarMesPagamento: TAdvOfficeCheckBox
      Left = 6
      Top = 60
      Width = 111
      Height = 17
      Checked = True
      TabOrder = 2
      TabStop = True
      Alignment = taLeftJustify
      Caption = 'Incrementar o m'#234's'
      ReturnIsTab = False
      State = cbChecked
      Themed = True
      Version = '1.3.8.4'
    end
    object EditCadastroVLPAGO: TAdvMoneyEdit
      Tag = 3
      Left = 6
      Top = 10
      Width = 111
      Height = 21
      Hint = 
        'Valor Pago a ser inclu'#237'do nas linhas da tabela de Itens da Recei' +
        'ta.'
      EditType = etMoney
      EmptyTextStyle = []
      FocusColor = 16640730
      DisabledColor = clWindow
      Precision = 2
      Prefix = 'R$ '
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -11
      LabelFont.Name = 'Tahoma'
      LabelFont.Style = []
      Lookup.Font.Charset = DEFAULT_CHARSET
      Lookup.Font.Color = clWindowText
      Lookup.Font.Height = -11
      Lookup.Font.Name = 'Arial'
      Lookup.Font.Style = []
      Lookup.Separator = ';'
      AutoSize = False
      Color = 16640730
      MaxLength = 17
      ParentColor = True
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      Text = '0,00'
      Visible = True
      Version = '1.1.2.5'
      CalculatorLook.ButtonWidth = 24
      CalculatorLook.ButtonHeight = 24
      CalculatorLook.ButtonColor = clSilver
      CalculatorLook.Color = clWhite
      CalculatorLook.Flat = False
      CalculatorLook.Font.Charset = DEFAULT_CHARSET
      CalculatorLook.Font.Color = clWindowText
      CalculatorLook.Font.Height = -11
      CalculatorLook.Font.Name = 'Tahoma'
      CalculatorLook.Font.Style = []
      ButtonGlyph.Data = {
        82020000424D820200000000000042000000280000000C0000000C0000000100
        20000300000040020000232E0000232E000000000000000000000000FF0000FF
        0000FF0000000000007000000064000000640000006400000064000000640000
        0064000000640000006400000064000000640000007000000064000000970000
        005C0000005C0000005C0000005E0000005E0000005C0000005C0000005C0000
        005C00000060000000640000005C0000000000000028000000160000002E0000
        002E0000000C00000010000000060000005C00000062000000640000005C0000
        0024000000620000004E00000030000000300000004200000050000000220000
        005C00000064000000640000005C000000000000004200000000000000300000
        00300000005000000060000000280000005C00000064000000640000005E0000
        002E0000003000000030000000560000005600000030000000300000002E0000
        005E00000064000000640000005E0000002E0000003000000030000000560000
        005600000030000000300000002E0000005E00000064000000640000005C0000
        0000000000500000000000000030000000300000000000000000000000000000
        005C00000064000000640000005C000000280000009D00000050000000300000
        00300000005000000060000000280000005C00000064000000640000005C0000
        000000000028000000000000002E0000002E0000000000000000000000000000
        005C0000006400000064000000970000005C0000005C0000005C0000005E0000
        005E0000005C0000005C0000005C000000970000006400000070000000640000
        0064000000640000006400000064000000640000006400000064000000640000
        006400000070}
    end
    object DatePickerEditCadastroDTPAGAMENTO: TPlannerDatePicker
      Left = 6
      Top = 35
      Width = 111
      Height = 21
      Hint = 
        'Data do Pagamento a ser inclu'#237'do nas linhas da tabela de Itens d' +
        'a Receita.'
      EmptyTextStyle = []
      Flat = False
      DisabledColor = clWindow
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -11
      LabelFont.Name = 'Tahoma'
      LabelFont.Style = []
      Lookup.Font.Charset = DEFAULT_CHARSET
      Lookup.Font.Color = clWindowText
      Lookup.Font.Height = -11
      Lookup.Font.Name = 'Arial'
      Lookup.Font.Style = []
      Lookup.Separator = ';'
      AutoSize = False
      Color = 16640730
      MaxLength = 10
      ParentColor = True
      ReadOnly = False
      TabOrder = 1
      Visible = True
      Version = '1.8.3.0'
      ButtonStyle = bsDropDown
      ButtonWidth = 16
      Etched = False
      Glyph.Data = {
        DA020000424DDA0200000000000036000000280000000D0000000D0000000100
        200000000000A402000000000000000000000000000000000000F0F0F000F0F0
        F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
        F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
        F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
        F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
        F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
        F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
        F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
        F00000000000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
        F000F0F0F000F0F0F000F0F0F000F0F0F000000000000000000000000000F0F0
        F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
        F0000000000000000000000000000000000000000000F0F0F000F0F0F000F0F0
        F000F0F0F000F0F0F000F0F0F000F0F0F0000000000000000000000000000000
        0000000000000000000000000000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
        F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
        F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
        F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
        F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
        F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
        F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
        F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
        F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000}
      Calendar = cal85_.Owner
      HideCalendarAfterSelection = True
      object cal85_: TPlannerCalendar
        Left = 0
        Top = 0
        Width = 180
        Height = 180
        EventDayColor = clBlack
        EventFont.Charset = DEFAULT_CHARSET
        EventFont.Color = clWindowText
        EventFont.Height = -11
        EventFont.Name = 'Tahoma'
        EventFont.Style = [fsBold]
        EventMarkerColor = clYellow
        EventMarkerShape = evsCircle
        BackgroundPosition = bpTiled
        BevelOuter = bvNone
        BorderWidth = 1
        Look = lookFlat
        DateDownColor = clNone
        DateHoverColor = clNone
        DayFont.Charset = DEFAULT_CHARSET
        DayFont.Color = clWindowText
        DayFont.Height = -11
        DayFont.Name = 'Tahoma'
        DayFont.Style = []
        WeekFont.Charset = DEFAULT_CHARSET
        WeekFont.Color = clWindowText
        WeekFont.Height = -11
        WeekFont.Name = 'Tahoma'
        WeekFont.Style = []
        WeekName = 'Wk'
        TextColor = clBlack
        SelectColor = clTeal
        SelectFontColor = clWhite
        InActiveColor = clGray
        HeaderColor = clNone
        FocusColor = clHighlight
        InversColor = clTeal
        WeekendColor = clRed
        NameOfDays.Monday = 'seg'
        NameOfDays.Tuesday = 'ter'
        NameOfDays.Wednesday = 'qua'
        NameOfDays.Thursday = 'qui'
        NameOfDays.Friday = 'sex'
        NameOfDays.Saturday = 's'#225'b'
        NameOfDays.Sunday = 'dom'
        NameOfMonths.January = 'jan'
        NameOfMonths.February = 'fev'
        NameOfMonths.March = 'mar'
        NameOfMonths.April = 'abr'
        NameOfMonths.May = 'mai'
        NameOfMonths.June = 'jun'
        NameOfMonths.July = 'jul'
        NameOfMonths.August = 'ago'
        NameOfMonths.September = 'set'
        NameOfMonths.October = 'out'
        NameOfMonths.November = 'nov'
        NameOfMonths.December = 'dez'
        NameOfMonths.UseIntlNames = True
        StartDay = 7
        TodayFormat = '"Today" DDD/mm, YYYY'
        Day = 20
        Month = 9
        Year = 2015
        TabOrder = 0
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        CaptionColor = clNone
        CaptionTextColor = clBlack
        LineColor = clGray
        Line3D = True
        GradientStartColor = clWhite
        GradientEndColor = clBtnFace
        GradientDirection = gdVertical
        MonthGradientStartColor = clNone
        MonthGradientEndColor = clNone
        MonthGradientDirection = gdHorizontal
        HintPrevYear = 'Previous Year'
        HintPrevMonth = 'Previous Month'
        HintNextMonth = 'Next Month'
        HintNextYear = 'Next Year'
        Version = '2.1.0.1'
      end
    end
  end
  object FormStyler: TAdvFormStyler
    Style = tsOffice2003Blue
    AppStyle = dmEstilo.AppStyler
    Left = 24
    Top = 32
  end
end
