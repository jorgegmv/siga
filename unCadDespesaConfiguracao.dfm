object fmCadDespesaConfiguracao: TfmCadDespesaConfiguracao
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Despesa :: Informar par'#226'metros'
  ClientHeight = 206
  ClientWidth = 569
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
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PanelBotoes: TAdvPanel
    Left = 0
    Top = 165
    Width = 569
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
      Left = 365
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
      Left = 285
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
    Width = 569
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
    Height = 141
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
    object LabelPeriodo: TLabel
      Left = 74
      Top = 13
      Width = 46
      Height = 13
      Caption = 'Per'#237'odo*:'
      Transparent = True
    end
    object LabelValorDespesa: TLabel
      Left = 27
      Top = 63
      Width = 92
      Height = 13
      Caption = 'Valor da despesa*:'
      Transparent = True
    end
    object LabelDiaVencimento: TLabel
      Left = 22
      Top = 38
      Width = 98
      Height = 13
      Caption = 'Dia do vencimento*:'
      Transparent = True
    end
    object LabelFormaPagamento: TLabel
      Left = 13
      Top = 88
      Width = 106
      Height = 13
      Caption = 'Forma de pagamento:'
      Transparent = True
    end
    object LabelFornecedor: TLabel
      Left = 59
      Top = 113
      Width = 59
      Height = 13
      Caption = 'Fornecedor:'
      Transparent = True
    end
  end
  object PanelCampos: TAdvPanel
    Left = 119
    Top = 24
    Width = 450
    Height = 141
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
    object LabelPeriodoSeparador: TLabel
      Left = 92
      Top = 13
      Width = 12
      Height = 13
      Caption = 'de'
      Transparent = True
    end
    object LabelPeriodoSeparador2: TLabel
      Left = 164
      Top = 13
      Width = 16
      Height = 13
      Caption = 'at'#233
      Transparent = True
    end
    object LabelPeriodoSeparador3: TLabel
      Left = 270
      Top = 13
      Width = 12
      Height = 13
      Caption = 'de'
      Transparent = True
    end
    object ButtonLimparFormaPagamento: TAdvGlowButton
      Left = 391
      Top = 84
      Width = 23
      Height = 22
      Hint = 'Limpar o campo.'
      ImageIndex = 4
      Images = fmPrincipal.ImageListBotoes
      NotesFont.Charset = DEFAULT_CHARSET
      NotesFont.Color = clWindowText
      NotesFont.Height = -11
      NotesFont.Name = 'Tahoma'
      NotesFont.Style = []
      Spacing = 4
      ParentShowHint = False
      ShowHint = True
      TabOrder = 8
      TabStop = True
      OnClick = ButtonLimparFormaPagamentoClick
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
      Enabled = False
    end
    object ButtonLimparFornecedor: TAdvGlowButton
      Left = 391
      Top = 109
      Width = 23
      Height = 22
      Hint = 'Limpar o campo.'
      ImageIndex = 4
      Images = fmPrincipal.ImageListBotoes
      NotesFont.Charset = DEFAULT_CHARSET
      NotesFont.Color = clWindowText
      NotesFont.Height = -11
      NotesFont.Name = 'Tahoma'
      NotesFont.Style = []
      Spacing = 4
      ParentShowHint = False
      ShowHint = True
      TabOrder = 12
      TabStop = True
      OnClick = ButtonLimparFornecedorClick
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
      Enabled = False
    end
    object ButtonNovoFormaPagamento: TAdvGlowButton
      Left = 416
      Top = 84
      Width = 23
      Height = 22
      Hint = 'Nova Forma de Pagamento.'
      ImageIndex = 13
      Images = fmPrincipal.ImageListBotoes
      NotesFont.Charset = DEFAULT_CHARSET
      NotesFont.Color = clWindowText
      NotesFont.Height = -11
      NotesFont.Name = 'Tahoma'
      NotesFont.Style = []
      Spacing = 4
      ParentShowHint = False
      ShowHint = True
      TabOrder = 9
      TabStop = True
      OnClick = ButtonNovoFormaPagamentoClick
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
    object ButtonNovoFornecedor: TAdvGlowButton
      Left = 416
      Top = 109
      Width = 23
      Height = 22
      Hint = 'Novo Fornecedor.'
      ImageIndex = 13
      Images = fmPrincipal.ImageListBotoes
      NotesFont.Charset = DEFAULT_CHARSET
      NotesFont.Color = clWindowText
      NotesFont.Height = -11
      NotesFont.Name = 'Tahoma'
      NotesFont.Style = []
      Spacing = 4
      ParentShowHint = False
      ShowHint = True
      TabOrder = 13
      TabStop = True
      OnClick = ButtonNovoFornecedorClick
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
    object ComboBoxCadastroMesEncerramento: TAdvOfficeComboBox
      Left = 185
      Top = 10
      Width = 80
      Height = 21
      Hint = 'M'#234's de Encerramento da Despesa.'
      Button.Color = 16572875
      Button.ColorTo = 14722429
      Button.ColorHot = 14483455
      Button.ColorHotTo = 6013175
      Button.ColorDown = 557032
      Button.ColorDownTo = 8182519
      Button.Width = 12
      DisplayRecentSelection = False
      DropDownCount = 12
      BorderColor = clNone
      BorderHotColor = clBlack
      SelectionColor = 14722429
      SelectionTextColor = clWhite
      Version = '1.5.3.0'
      Items.Strings = (
        'Janeiro'
        'Fevereiro'
        'Mar'#231'o'
        'Abril'
        'Maio'
        'Junho'
        'Julho'
        'Agosto'
        'Setembro'
        'Outubro'
        'Novembro'
        'Dezembro')
      ItemIndex = -1
      ItemHeight = 13
      TabOrder = 2
      ShowHint = True
      Style = csDropDownList
    end
    object ComboBoxCadastroMesInicio: TAdvOfficeComboBox
      Left = 6
      Top = 10
      Width = 80
      Height = 21
      Hint = 'M'#234's de In'#237'cio da Despesa.'
      Button.Color = 16572875
      Button.ColorTo = 14722429
      Button.ColorHot = 14483455
      Button.ColorHotTo = 6013175
      Button.ColorDown = 557032
      Button.ColorDownTo = 8182519
      Button.Width = 12
      DisplayRecentSelection = False
      DropDownCount = 12
      BorderColor = clNone
      BorderHotColor = clBlack
      SelectionColor = 14722429
      SelectionTextColor = clWhite
      Version = '1.5.3.0'
      Items.Strings = (
        'Janeiro'
        'Fevereiro'
        'Mar'#231'o'
        'Abril'
        'Maio'
        'Junho'
        'Julho'
        'Agosto'
        'Setembro'
        'Outubro'
        'Novembro'
        'Dezembro')
      ItemIndex = -1
      ItemHeight = 13
      TabOrder = 0
      ShowHint = True
      Style = csDropDownList
    end
    object ComboEditCadastroNMFORMAPAGAMENTO: TAdvEditBtn
      Left = 40
      Top = 85
      Width = 348
      Height = 21
      Hint = 'Descri'#231#227'o da Forma de Pagamento.'
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
      MaxLength = 200
      ParentColor = True
      ParentShowHint = False
      ReadOnly = False
      ShowHint = True
      TabOrder = 7
      Visible = True
      OnExit = ComboEditCadastroNMFORMAPAGAMENTOExit
      Version = '1.3.5.0'
      ButtonStyle = bsButton
      ButtonWidth = 21
      Etched = False
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00009B7C6BFF9D7E6DFF9C7E6DFF9C7E6DFF9C7E6DFF9C7D6DFF9C7D6CFF9B7C
        6BFF9B7C6BFFBEABA0FF7A8FC7FF918980FF77736C7E00000000000000000000
        00009B7766FFFFFFFFFFFAF4E9FFFAF4E9FFFAF4E9FFFAF3E8FFFAF3E7FFFAF2
        E6FFFAF1E4FF9EB8EEFF3983FCFF7FDEFFFF989085EC00000000000000000000
        0000A27F6FFFFFFFFFFFFCF6EDFFFCF6EDFFFBF6EDFFFBF5ECFFFBF5EBFFFBF4
        EAFF9CB6E7FF3482FDFF71E1FFFF3587FAFF216AFC8200000000000000000000
        0000A38070FFFFFFFFFFFCF8F1FFFCF8F1FFA7A5A3FF7D7E7EFF767574FF7F7F
        7DFF918F8CFF8CC5D6FF3688FEFF7892D0FF0000000000000000000000000000
        0000A98778FFFFFFFFFFFDF9F4FFA8A7A6FFBFAD93FFFFD184FFFED085FFFED6
        98FF9A948BFF908F8CFF97B4EBFFBDAAA1FF0000000000000000000000000000
        0000AB897AFFFFFFFFFFFDFCF8FF82807DFFFFDD97FFF2D598FFEFCD90FFF1C8
        82FFFED99DFF858584FFFBF5EAFF9A7C6BFF0000000000000000000000000000
        0000AF8E7FFFFFFFFFFFFEFDFCFF7B7873FFFFEEBDFFF8E8BBFFF4DDA9FFF0D0
        94FFFFD590FF7A7A78FFFBF5ECFF9B7C6BFF0000000000000000000000000000
        0000AF8F80FFFFFFFFFFFEFEFEFF84827DFFFFFFEAFFFFFEEFFFF9EDC2FFF6DA
        A0FFFFDA96FF848383FFFCF6EDFF9B7C6CFF0000000000000000000000000000
        0000AF8F80FFFFFFFFFFFFFFFFFFAAAAABFFDEDAC4FFFFFFF2FFFFF7CBFFFFE7
        A6FFB7AB99FFAAA8A6FFFCF6EEFF9C7C6DFF0000000000000000000000000000
        0000B19080FFFFFFFFFFFFFFFFFFFFFFFFFFABABABFF82807EFF7B7975FF8180
        7EFFABAAA8FFF9F4EEFFF0E8E0FF9F8070FE0000000000000000000000000000
        0000B79787FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFEFDFCFFFDFC
        FAFFC5ACA0FFB08E7EFFA78270FFA78270FF0000000000000000000000000000
        0000B89888FFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFEFEFDFFFEFCFAFFFDFB
        F9FFB08E7EFFF5E2D9FFB18E7EFFA78270580000000000000000000000000000
        0000B89888FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFA78270FFB18E7EFFA7827058000000000000000000000000000000000000
        0000B89888FFB89888FFB49383FFB49383FFB08E7DFFB08E7DFFAC8877FFAC88
        77FFA78270FFA782705800000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
      OnClickBtn = ComboEditCadastroNMFORMAPAGAMENTOClickBtn
    end
    object ComboEditCadastroNMFORNECEDOR: TAdvEditBtn
      Left = 40
      Top = 110
      Width = 348
      Height = 21
      Hint = 'Nome do Fornecedor.'
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
      MaxLength = 200
      ParentColor = True
      ParentShowHint = False
      ReadOnly = False
      ShowHint = True
      TabOrder = 11
      Visible = True
      OnExit = ComboEditCadastroNMFORNECEDORExit
      Version = '1.3.5.0'
      ButtonStyle = bsButton
      ButtonWidth = 21
      Etched = False
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00009B7C6BFF9D7E6DFF9C7E6DFF9C7E6DFF9C7E6DFF9C7D6DFF9C7D6CFF9B7C
        6BFF9B7C6BFFBEABA0FF7A8FC7FF918980FF77736C7E00000000000000000000
        00009B7766FFFFFFFFFFFAF4E9FFFAF4E9FFFAF4E9FFFAF3E8FFFAF3E7FFFAF2
        E6FFFAF1E4FF9EB8EEFF3983FCFF7FDEFFFF989085EC00000000000000000000
        0000A27F6FFFFFFFFFFFFCF6EDFFFCF6EDFFFBF6EDFFFBF5ECFFFBF5EBFFFBF4
        EAFF9CB6E7FF3482FDFF71E1FFFF3587FAFF216AFC8200000000000000000000
        0000A38070FFFFFFFFFFFCF8F1FFFCF8F1FFA7A5A3FF7D7E7EFF767574FF7F7F
        7DFF918F8CFF8CC5D6FF3688FEFF7892D0FF0000000000000000000000000000
        0000A98778FFFFFFFFFFFDF9F4FFA8A7A6FFBFAD93FFFFD184FFFED085FFFED6
        98FF9A948BFF908F8CFF97B4EBFFBDAAA1FF0000000000000000000000000000
        0000AB897AFFFFFFFFFFFDFCF8FF82807DFFFFDD97FFF2D598FFEFCD90FFF1C8
        82FFFED99DFF858584FFFBF5EAFF9A7C6BFF0000000000000000000000000000
        0000AF8E7FFFFFFFFFFFFEFDFCFF7B7873FFFFEEBDFFF8E8BBFFF4DDA9FFF0D0
        94FFFFD590FF7A7A78FFFBF5ECFF9B7C6BFF0000000000000000000000000000
        0000AF8F80FFFFFFFFFFFEFEFEFF84827DFFFFFFEAFFFFFEEFFFF9EDC2FFF6DA
        A0FFFFDA96FF848383FFFCF6EDFF9B7C6CFF0000000000000000000000000000
        0000AF8F80FFFFFFFFFFFFFFFFFFAAAAABFFDEDAC4FFFFFFF2FFFFF7CBFFFFE7
        A6FFB7AB99FFAAA8A6FFFCF6EEFF9C7C6DFF0000000000000000000000000000
        0000B19080FFFFFFFFFFFFFFFFFFFFFFFFFFABABABFF82807EFF7B7975FF8180
        7EFFABAAA8FFF9F4EEFFF0E8E0FF9F8070FE0000000000000000000000000000
        0000B79787FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFEFDFCFFFDFC
        FAFFC5ACA0FFB08E7EFFA78270FFA78270FF0000000000000000000000000000
        0000B89888FFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFEFEFDFFFEFCFAFFFDFB
        F9FFB08E7EFFF5E2D9FFB18E7EFFA78270580000000000000000000000000000
        0000B89888FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFA78270FFB18E7EFFA7827058000000000000000000000000000000000000
        0000B89888FFB89888FFB49383FFB49383FFB08E7DFFB08E7DFFAC8877FFAC88
        77FFA78270FFA782705800000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
      OnClickBtn = ComboEditCadastroNMFORNECEDORClickBtn
    end
    object EditCadastroCDFORMAPAGAMENTO: TAdvEdit
      Left = 6
      Top = 85
      Width = 33
      Height = 21
      Hint = 'C'#243'digo da Forma de Pagamento.'
      EmptyTextStyle = []
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
      MaxLength = 15
      ParentColor = True
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      Visible = True
      OnExit = EditCadastroCDFORMAPAGAMENTOExit
      Version = '3.3.2.4'
    end
    object EditCadastroCDFORNECEDOR: TAdvEdit
      Left = 6
      Top = 110
      Width = 33
      Height = 21
      Hint = 'C'#243'digo do Fornecedor.'
      EmptyTextStyle = []
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
      MaxLength = 15
      ParentColor = True
      ParentShowHint = False
      ShowHint = True
      TabOrder = 10
      Visible = True
      OnExit = EditCadastroCDFORNECEDORExit
      Version = '3.3.2.4'
    end
    object SpinEditCadastroAnoEncerramento: TAdvSpinEdit
      Left = 287
      Top = 10
      Width = 50
      Height = 22
      Hint = 'Ano de Encerramento da Despesa.'
      Value = 1
      FloatValue = 1.000000000000000000
      TimeValue = 0.041666666666666660
      HexValue = 0
      AutoSize = False
      CheckMinValue = True
      CheckMaxValue = True
      IncrementFloat = 0.100000000000000000
      IncrementFloatPage = 1.000000000000000000
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -11
      LabelFont.Name = 'Tahoma'
      LabelFont.Style = []
      MaxLength = 4
      MaxValue = 9999
      MinValue = 1
      ParentColor = True
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      Visible = True
      Version = '1.6.0.0'
    end
    object SpinEditCadastroAnoInicio: TAdvSpinEdit
      Left = 108
      Top = 10
      Width = 50
      Height = 22
      Hint = 'Ano de In'#237'cio da Despesa.'
      Value = 1
      FloatValue = 1.000000000000000000
      TimeValue = 0.041666666666666660
      HexValue = 0
      AutoSize = False
      CheckMinValue = True
      CheckMaxValue = True
      IncrementFloat = 0.100000000000000000
      IncrementFloatPage = 1.000000000000000000
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -11
      LabelFont.Name = 'Tahoma'
      LabelFont.Style = []
      MaxLength = 4
      MaxValue = 9999
      MinValue = 1
      ParentColor = True
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      Visible = True
      Version = '1.6.0.0'
    end
    object SpinEditCadastroDiaVencimento: TAdvSpinEdit
      Left = 6
      Top = 35
      Width = 40
      Height = 22
      Hint = 'Dia do Vencimento da Despesa.'
      Value = 1
      FloatValue = 1.000000000000000000
      TimeValue = 0.041666666666666660
      HexValue = 0
      AutoSize = False
      CheckMinValue = True
      CheckMaxValue = True
      IncrementFloat = 0.100000000000000000
      IncrementFloatPage = 1.000000000000000000
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -11
      LabelFont.Name = 'Tahoma'
      LabelFont.Style = []
      MaxLength = 2
      MaxValue = 31
      MinValue = 1
      ParentColor = True
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      Visible = True
      Version = '1.6.0.0'
    end
    object EditCadastroValorDespesa: TAdvMoneyEdit
      Tag = 3
      Left = 6
      Top = 60
      Width = 115
      Height = 21
      Hint = 
        'Valor da Despesa. Cada Item da Despesa ser'#225' gerado com este valo' +
        'r.'
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
      TabOrder = 5
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
