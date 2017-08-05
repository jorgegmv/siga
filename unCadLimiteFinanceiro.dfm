object fmCadLimiteFinanceiro: TfmCadLimiteFinanceiro
  Left = 0
  Top = 0
  ActiveControl = EditSaldoMinimoMensal
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Limites Financeiros'
  ClientHeight = 171
  ClientWidth = 324
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object PanelBotoes: TAdvPanel
    Left = 0
    Top = 130
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
      Left = 150
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
    object BitBtnSalvar: TAdvGlowButton
      Left = 6
      Top = 8
      Width = 75
      Height = 25
      Hint = 'Salvar as informa'#231#245'es.'
      Caption = '&Salvar'
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
      OnClick = BitBtnSalvarClick
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
  object PanelGeral: TAdvPanel
    Left = 0
    Top = 0
    Width = 324
    Height = 130
    Align = alClient
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
    FullHeight = 87
    object PanelCampos: TAdvPanel
      Left = 120
      Top = 22
      Width = 204
      Height = 108
      Align = alClient
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
      FullHeight = 57
      object ImageStatus1: TAdvOfficeImage
        Left = 127
        Top = 11
        Width = 16
        Height = 16
        Picture.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          610000015049444154388D95D33D4B5C5110C6F1DF5EC5423BF1030451496121
          882029925502C957486161B1D8045F4010B1394D8A60134B2D042B0B6D92C222
          A458B61304216C622A119114116C94B04D168B7B2EDEDCBD9AF89473E63FF39C
          33672A8A0A9E620E2FF1046DFCC4176C0A9AF9F44A0EECC17BBC457747E1546D
          6C6149D0BA2B90C21FF1FA1EB0A8065E095A490CBC7B040CCFB1913A0846F0ED
          01DB99BEE23316636E1BE3DDA8FD07DCC21BFC884E4791602E91BEF6BFB42AF8
          8EF908679AAE082E31F000DCC01486708CDEDCD9EFA404D8C6047EE106B3D1EE
          4E01261E9C17621782A3D8B52638C532264B9A5D74A91AC6B35CF085AA6BC127
          754DC12876D1555260AF2218C289CE49ACE0030E315602B7319EFDC4F568B3A8
          2BF497C4614B48C7086B382849BA0FAE6381EC5E757F54EDA34F3A81B2E964B6
          3731F3F732E595AE734DFAC10663F42C76ED58E75BDE8447F20412029E000000
          0049454E44AE426082}
        Stretch = True
        Version = '1.1.1.0'
        Visible = False
      end
      object ImageStatus2: TAdvOfficeImage
        Left = 127
        Top = 36
        Width = 16
        Height = 16
        Picture.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          610000015049444154388D95D33D4B5C5110C6F1DF5EC5423BF1030451496121
          882029925502C957486161B1D8045F4010B1394D8A60134B2D042B0B6D92C222
          A458B61304216C622A119114116C94B04D168B7B2EDEDCBD9AF89473E63FF39C
          33672A8A0A9E620E2FF1046DFCC4176C0A9AF9F44A0EECC17BBC457747E1546D
          6C6149D0BA2B90C21FF1FA1EB0A8065E095A490CBC7B040CCFB1913A0846F0ED
          01DB99BEE23316636E1BE3DDA8FD07DCC21BFC884E4791602E91BEF6BFB42AF8
          8EF908679AAE082E31F000DCC01486708CDEDCD9EFA404D8C6047EE106B3D1EE
          4E01261E9C17621782A3D8B52638C532264B9A5D74A91AC6B35CF085AA6BC127
          754DC12876D1555260AF2218C289CE49ACE0030E315602B7319EFDC4F568B3A8
          2BF497C4614B48C7086B382849BA0FAE6381EC5E757F54EDA34F3A81B2E964B6
          3731F3F732E595AE734DFAC10663F42C76ED58E75BDE8447F20412029E000000
          0049454E44AE426082}
        Stretch = True
        Version = '1.1.1.0'
        Visible = False
      end
      object ImageStatus3: TAdvOfficeImage
        Left = 127
        Top = 61
        Width = 16
        Height = 16
        Picture.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          610000015049444154388D95D33D4B5C5110C6F1DF5EC5423BF1030451496121
          882029925502C957486161B1D8045F4010B1394D8A60134B2D042B0B6D92C222
          A458B61304216C622A119114116C94B04D168B7B2EDEDCBD9AF89473E63FF39C
          33672A8A0A9E620E2FF1046DFCC4176C0A9AF9F44A0EECC17BBC457747E1546D
          6C6149D0BA2B90C21FF1FA1EB0A8065E095A490CBC7B040CCFB1913A0846F0ED
          01DB99BEE23316636E1BE3DDA8FD07DCC21BFC884E4791602E91BEF6BFB42AF8
          8EF908679AAE082E31F000DCC01486708CDEDCD9EFA404D8C6047EE106B3D1EE
          4E01261E9C17621782A3D8B52638C532264B9A5D74A91AC6B35CF085AA6BC127
          754DC12876D1555260AF2218C289CE49ACE0030E315602B7319EFDC4F568B3A8
          2BF497C4614B48C7086B382849BA0FAE6381EC5E757F54EDA34F3A81B2E964B6
          3731F3F732E595AE734DFAC10663F42C76ED58E75BDE8447F20412029E000000
          0049454E44AE426082}
        Stretch = True
        Version = '1.1.1.0'
        Visible = False
      end
      object EditSaldoMetaMensal: TAdvMoneyEdit
        Tag = 3
        Left = 6
        Top = 60
        Width = 115
        Height = 21
        Hint = 'Meta de saldo mensal.'
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
        TabOrder = 2
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
      object EditSaldoMinimoMensal: TAdvMoneyEdit
        Tag = 3
        Left = 6
        Top = 10
        Width = 115
        Height = 21
        Hint = 'Saldo m'#237'nimo para movimenta'#231#245'es mensais.'
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
      object EditValorLimiteDespesaMensal: TAdvMoneyEdit
        Tag = 3
        Left = 6
        Top = 35
        Width = 115
        Height = 21
        Hint = 'Valor Limite das despesas mensais.'
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
      object CheckBoxCadastroFLVISIVEL: TAdvOfficeCheckBox
        Left = 6
        Top = 85
        Width = 187
        Height = 17
        Checked = True
        TabOrder = 3
        TabStop = True
        Alignment = taLeftJustify
        Caption = 'Painel de Status financeiro vis'#237'vel?'
        ReturnIsTab = False
        State = cbChecked
        Themed = True
        Version = '1.3.8.4'
      end
    end
    object PanelInformações: TAdvPanel
      Left = 0
      Top = 0
      Width = 324
      Height = 22
      Align = alTop
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
      Text = '<P align="center"><B><I>Limites mensais</I></B></P>'
      FullHeight = 22
    end
    object PanelTitulos: TAdvPanel
      Left = 0
      Top = 22
      Width = 120
      Height = 108
      Align = alLeft
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
      FullHeight = 87
      object LabelLimiteDespesas: TLabel
        Left = 26
        Top = 38
        Width = 94
        Height = 13
        Caption = 'Limite de despesas:'
        Transparent = True
      end
      object LabelSaldoMinimo: TLabel
        Left = 55
        Top = 13
        Width = 65
        Height = 13
        Caption = 'Saldo m'#237'nimo:'
        Transparent = True
      end
      object LabelMetaSaldo: TLabel
        Left = 49
        Top = 63
        Width = 71
        Height = 13
        Caption = 'Meta de saldo:'
        Transparent = True
      end
    end
  end
  object FormStyler: TAdvFormStyler
    Style = tsOffice2003Blue
    AppStyle = dmEstilo.AppStyler
    Left = 248
    Top = 32
  end
end
