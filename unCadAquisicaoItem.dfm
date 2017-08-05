object fmAquisicaoItem: TfmAquisicaoItem
  Left = 0
  Top = 0
  ActiveControl = EditCadastroCDFAMILIA
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Aquisi'#231#227'o :: Item da Aquisi'#231#227'o'
  ClientHeight = 256
  ClientWidth = 834
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
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object PanelBotoes: TAdvPanel
    Left = 0
    Top = 215
    Width = 834
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    Color = 16640730
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
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
    FullHeight = 41
    object BitBtnFechar: TAdvGlowButton
      Left = 730
      Top = 8
      Width = 75
      Height = 25
      Hint = 'Fechar cadastro.'
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
      TabOrder = 2
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
      Left = 3
      Top = 8
      Width = 75
      Height = 25
      Hint = 'Aplicar os ajustes no item da Aquisi'#231#227'o.'
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
    object BitBtnRestaurar: TAdvGlowButton
      Left = 81
      Top = 8
      Width = 75
      Height = 25
      Hint = 'Restaurar para a situa'#231#227'o anterior do cadastro.'
      Caption = '&Restaurar'
      NotesFont.Charset = DEFAULT_CHARSET
      NotesFont.Color = clWindowText
      NotesFont.Height = -11
      NotesFont.Name = 'Tahoma'
      NotesFont.Style = []
      Spacing = 4
      WordWrap = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      TabStop = True
      OnClick = BitBtnRestaurarClick
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
  object PanelTitulos: TAdvPanel
    Left = 0
    Top = 24
    Width = 120
    Height = 191
    Align = alLeft
    BevelOuter = bvNone
    Color = 16640730
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
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
    FullHeight = 214
    object LabelDataGarantia: TLabel
      Left = 3
      Top = 165
      Width = 117
      Height = 13
      Caption = 'Vencimento da garantia:'
      Transparent = True
    end
    object LabelEmbalagem: TLabel
      Left = 54
      Top = 88
      Width = 64
      Height = 13
      Caption = 'Embalagem*:'
      Transparent = True
    end
    object LabelFamiliaMaterial: TLabel
      Left = 76
      Top = 38
      Width = 42
      Height = 13
      Caption = 'Fam'#237'lia*:'
      Transparent = True
    end
    object LabelItemMaterial: TLabel
      Left = 92
      Top = 13
      Width = 26
      Height = 13
      Caption = 'Item:'
      Transparent = True
    end
    object LabelMarcaModelo: TLabel
      Left = 41
      Top = 113
      Width = 77
      Height = 13
      Caption = 'Marca / Modelo:'
      Transparent = True
    end
    object LabelMaterial: TLabel
      Left = 70
      Top = 63
      Width = 48
      Height = 13
      Caption = 'Material*:'
      Transparent = True
    end
    object LabelQuantidade: TLabel
      Left = 52
      Top = 140
      Width = 66
      Height = 13
      Caption = 'Quantidade*:'
      Transparent = True
    end
  end
  object PanelCampos: TAdvPanel
    Left = 120
    Top = 24
    Width = 714
    Height = 191
    Align = alClient
    BevelOuter = bvNone
    Color = 16640730
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
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
    object LabelValorGarantia: TLabel
      Left = 264
      Top = 140
      Width = 71
      Height = 13
      Caption = 'Valor garantia:'
      Transparent = True
    end
    object LabelValorTotal: TLabel
      Left = 450
      Top = 140
      Width = 53
      Height = 13
      Caption = 'Valor total:'
      Transparent = True
    end
    object LabelValorUnitario: TLabel
      Left = 72
      Top = 140
      Width = 73
      Height = 13
      Caption = 'Valor unit'#225'rio*:'
      Transparent = True
    end
    object ButtonNovoFamilia: TAdvGlowButton
      Left = 659
      Top = 34
      Width = 23
      Height = 22
      Hint = 'Nova Fam'#237'lia.'
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
      TabOrder = 4
      TabStop = True
      OnClick = ButtonNovoFamiliaClick
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
    object ButtonNovoMaterial: TAdvGlowButton
      Left = 659
      Top = 59
      Width = 23
      Height = 22
      Hint = 'Novo Material.'
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
      OnClick = ButtonNovoMaterialClick
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
    object ButtonNovoEmbalagem: TAdvGlowButton
      Left = 659
      Top = 84
      Width = 23
      Height = 22
      Hint = 'Nova Embalagem.'
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
      TabOrder = 15
      TabStop = True
      OnClick = ButtonNovoEmbalagemClick
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
    object ButtonLimparFamilia: TAdvGlowButton
      Left = 634
      Top = 34
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
      TabOrder = 3
      TabStop = True
      OnClick = ButtonLimparFamiliaClick
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
    object ButtonLimparMaterial: TAdvGlowButton
      Left = 634
      Top = 59
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
      OnClick = ButtonLimparMaterialClick
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
    object ButtonLimparEmbalagem: TAdvGlowButton
      Left = 634
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
      TabOrder = 14
      TabStop = True
      OnClick = ButtonLimparEmbalagemClick
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
    object EditCadastroCDEMBALAGEM: TAdvEdit
      Left = 6
      Top = 85
      Width = 32
      Height = 21
      Hint = 'C'#243'digo da Embalagem.'
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
      Enabled = False
      MaxLength = 15
      ParentColor = True
      ParentShowHint = False
      ShowHint = True
      TabOrder = 10
      Visible = True
      OnChange = EditCadastroCDEMBALAGEMChange
      OnExit = EditCadastroCDEMBALAGEMExit
      Version = '3.3.2.4'
    end
    object EditCadastroCDFAMILIA: TAdvEdit
      Left = 6
      Top = 35
      Width = 72
      Height = 21
      Hint = 'C'#243'digo da Fam'#237'lia.'
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
      MaxLength = 7
      ParentColor = True
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      Visible = True
      OnChange = EditCadastroCDFAMILIAChange
      OnExit = EditCadastroCDFAMILIAExit
      Version = '3.3.2.4'
    end
    object EditCadastroCDMATERIAL: TAdvEdit
      Left = 6
      Top = 60
      Width = 72
      Height = 21
      Hint = 'C'#243'digo do Material.'
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
      Enabled = False
      MaxLength = 11
      ParentColor = True
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      Visible = True
      OnChange = EditCadastroCDMATERIALChange
      OnExit = EditCadastroCDMATERIALExit
      Version = '3.3.2.4'
    end
    object EditCadastroNUITEM: TAdvEdit
      Left = 6
      Top = 10
      Width = 72
      Height = 21
      TabStop = False
      EditType = etNumeric
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
      Enabled = False
      ParentColor = True
      TabOrder = 0
      Text = '0'
      Visible = True
      Version = '3.3.2.4'
    end
    object EditCadastroQTEQUIVALENCIA: TAdvEdit
      Left = 593
      Top = 85
      Width = 37
      Height = 21
      Hint = 'Equival'#234'ncia da Embalagem.'
      TabStop = False
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
      Enabled = False
      ParentColor = True
      ParentShowHint = False
      ShowHint = True
      TabOrder = 13
      Visible = True
      Version = '3.3.2.4'
    end
    object EditCadastroQTMATERIAL: TAdvEdit
      Left = 6
      Top = 137
      Width = 58
      Height = 21
      Hint = 'Quantidade de Material.'
      EditType = etNumeric
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
      ParentColor = True
      ParentShowHint = False
      ShowHint = True
      TabOrder = 17
      Text = '0'
      Visible = True
      OnExit = EditCadastroQTMATERIALExit
      Version = '3.3.2.4'
    end
    object EditCadastroSGEMBALAGEM: TAdvEdit
      Left = 40
      Top = 85
      Width = 38
      Height = 21
      Hint = 'Sigla da Embalagem.'
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
      CharCase = ecUpperCase
      Color = 16640730
      Enabled = False
      MaxLength = 5
      ParentColor = True
      TabOrder = 11
      Visible = True
      OnExit = EditCadastroSGEMBALAGEMExit
      Version = '3.3.2.4'
    end
    object ComboBoxCadastroMarcaModelo: TAdvOfficeComboBox
      Left = 6
      Top = 110
      Width = 624
      Height = 21
      Button.Color = clWhite
      Button.ColorTo = clSilver
      Button.ColorHot = 14483455
      Button.ColorHotTo = 6013175
      Button.ColorDown = 557032
      Button.ColorDownTo = 8182519
      Button.Width = 12
      DisplayRecentSelection = False
      BorderColor = clNone
      BorderHotColor = clBlack
      SelectionColor = 14722429
      SelectionTextColor = clWhite
      Version = '1.5.3.0'
      ItemIndex = -1
      ItemHeight = 13
      TabOrder = 16
      Style = csDropDownList
    end
    object EditCadastroDEFAMILIA: TAdvEditBtn
      Left = 80
      Top = 35
      Width = 550
      Height = 21
      Hint = 'Descri'#231#227'o da Fam'#237'lia.'
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
      TabOrder = 2
      Visible = True
      OnExit = EditCadastroDEFAMILIAExit
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
      OnClickBtn = EditCadastroDEFAMILIAClickBtn
    end
    object EditCadastroDEMATERIAL: TAdvEditBtn
      Left = 80
      Top = 60
      Width = 550
      Height = 21
      Hint = 'Descri'#231#227'o do Material.'
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
      Enabled = False
      MaxLength = 200
      ParentColor = True
      ParentShowHint = False
      ReadOnly = False
      ShowHint = True
      TabOrder = 7
      Visible = True
      OnExit = EditCadastroDEMATERIALExit
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
      OnClickBtn = EditCadastroDEMATERIALClickBtn
    end
    object EditCadastroNMEMBALAGEM: TAdvEditBtn
      Left = 80
      Top = 85
      Width = 510
      Height = 21
      Hint = 'Nome do Embalagem.'
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
      Enabled = False
      MaxLength = 200
      ParentColor = True
      ParentShowHint = False
      ReadOnly = False
      ShowHint = True
      TabOrder = 12
      Visible = True
      OnExit = EditCadastroNMEMBALAGEMExit
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
      OnClickBtn = EditCadastroNMEMBALAGEMClickBtn
    end
    object EditCadastroVLGARANTIA: TAdvMoneyEdit
      Left = 341
      Top = 137
      Width = 101
      Height = 21
      Hint = 'Valor pago pela Garantia Extendida do Material.'
      EditType = etFloat
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
      ParentColor = True
      ParentShowHint = False
      ShowHint = True
      TabOrder = 19
      Text = '0,00'
      Visible = True
      OnExit = EditCadastroVLGARANTIAExit
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
    end
    object EditCadastroVLTOTAL: TAdvMoneyEdit
      Left = 510
      Top = 137
      Width = 120
      Height = 21
      Hint = 'Valor Total do Material.'
      TabStop = False
      EditType = etFloat
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
      ParentColor = True
      ParentShowHint = False
      ShowHint = True
      TabOrder = 20
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
    end
    object EditCadastroVLUNITARIO: TAdvMoneyEdit
      Left = 152
      Top = 137
      Width = 101
      Height = 21
      Hint = 'Valor Unit'#225'rio do Material.'
      EditType = etFloat
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
      ParentColor = True
      ParentShowHint = False
      ShowHint = True
      TabOrder = 18
      Text = '0,00'
      Visible = True
      OnExit = EditCadastroVLUNITARIOExit
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
    end
    object EditCadastroDTGARANTIA: TPlannerDatePicker
      Left = 6
      Top = 162
      Width = 89
      Height = 21
      Hint = 'Data de Vencimento da Garantia do Material.'
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
      ParentShowHint = False
      ReadOnly = False
      ShowHint = True
      TabOrder = 21
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
      Calendar = cal41_.Owner
      HideCalendarAfterSelection = True
      object cal41_: TPlannerCalendar
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
        Day = 29
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
    object CheckBoxCadastroFLGARANTIAATIVA: TAdvOfficeCheckBox
      Left = 102
      Top = 163
      Width = 155
      Height = 17
      Checked = True
      TabOrder = 22
      TabStop = True
      Alignment = taLeftJustify
      Caption = 'Garantia ativa?'
      ReturnIsTab = False
      State = cbChecked
      Themed = True
      Version = '1.3.8.4'
    end
    object ButtonNovoFamiliaPai: TAdvGlowButton
      Left = 684
      Top = 34
      Width = 23
      Height = 22
      Hint = 'Nova Fam'#237'lia (N'#237'vel 1).'
      ImageIndex = 31
      Images = fmPrincipal.ImageListBotoes
      NotesFont.Charset = DEFAULT_CHARSET
      NotesFont.Color = clWindowText
      NotesFont.Height = -11
      NotesFont.Name = 'Tahoma'
      NotesFont.Style = []
      Spacing = 4
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      TabStop = True
      OnClick = ButtonNovoFamiliaPaiClick
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
    Width = 834
    Height = 24
    Align = alTop
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
  object FormStyler: TAdvFormStyler
    Style = tsOffice2003Blue
    AppStyle = dmEstilo.AppStyler
    Left = 24
    Top = 8
  end
end
