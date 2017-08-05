object fmCadInvestimentoLimite: TfmCadInvestimentoLimite
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Investimento :: Valor do Investimento'
  ClientHeight = 131
  ClientWidth = 324
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
    Top = 90
    Width = 324
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
      Left = 248
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
      Left = 168
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
    Width = 324
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
    Height = 66
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
    object LabelSaldo: TLabel
      Left = 39
      Top = 13
      Width = 80
      Height = 13
      Caption = 'Saldo dispon'#237'vel:'
      Transparent = True
    end
    object LabelValorInvestimento: TLabel
      Left = 6
      Top = 38
      Width = 113
      Height = 13
      Caption = 'Valor do investimento*:'
      Transparent = True
    end
  end
  object PanelCampos: TAdvPanel
    Left = 119
    Top = 24
    Width = 205
    Height = 66
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
    object EditCadastroValorInvestimento: TAdvMoneyEdit
      Tag = 3
      Left = 6
      Top = 35
      Width = 123
      Height = 21
      Hint = 'Valor do Investimento a ser realizado.'
      EditType = etMoney
      EmptyTextStyle = []
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
    object EditCadastroValorSaldo: TAdvMoneyEdit
      Tag = 3
      Left = 6
      Top = 10
      Width = 123
      Height = 21
      Hint = 'Valor do saldo dispon'#237'vel para utilizar no investimento.'
      EditType = etMoney
      EmptyTextStyle = []
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
      Enabled = False
      MaxLength = 17
      ParentColor = True
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
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
  end
  object FormStyler: TAdvFormStyler
    Style = tsOffice2003Blue
    AppStyle = dmEstilo.AppStyler
    Left = 24
    Top = 32
  end
end
