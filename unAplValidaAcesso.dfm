object fmAplValidaAcesso: TfmAplValidaAcesso
  Left = 0
  Top = 0
  ActiveControl = EditUsuario
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Aqueloo - SIGA :: Controle de Acesso'
  ClientHeight = 221
  ClientWidth = 544
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
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object PanelCentral: TAdvPanel
    Left = 0
    Top = 0
    Width = 544
    Height = 221
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
    FullHeight = 272
    object LabelUsuario: TLabel
      Left = 149
      Top = 13
      Width = 40
      Height = 13
      Caption = 'Usu'#225'rio:'
      Transparent = True
    end
    object LabelSenha: TLabel
      Left = 155
      Top = 38
      Width = 34
      Height = 13
      Caption = 'Senha:'
      Transparent = True
    end
    object LabelEnviarSenhaEmail: TLabel
      Left = 215
      Top = 60
      Width = 99
      Height = 13
      Cursor = crHandPoint
      Caption = 'Esqueci minha senha'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsUnderline]
      ParentFont = False
      Transparent = True
      OnClick = LabelEnviarSenhaEmailClick
    end
    object PanelImagemLogin: TAdvPanel
      Left = 0
      Top = 0
      Width = 130
      Height = 196
      Align = alLeft
      BevelOuter = bvNone
      Color = 16640730
      TabOrder = 3
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
      FullHeight = 204
      object ImageLogin: TImage
        Left = 0
        Top = 0
        Width = 130
        Height = 196
        Align = alClient
        Center = True
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000000800000
          00800806000000C33E61CB000009F44944415478DAED5D0BA8154518FEBD5E6F
          199165262A2922D90BB3B0E84D96A699F6304BC2327BD93B7B474F8A8C1E685A
          5959A1999589F948B332B3142BB1E829166566752BAD2C8B901011B9F47FCC3D
          78B0BBBBFFD9DD79ECCE7CF0E1BDCE9C393367BF7B7667E6FFBF6945F6D18979
          02F340E65ECCDD99BB32EB9975CD6CA8AADF10D3567D33F3C43666530EED6CCF
          B19D3799AF32FFC9DA58AB1C3A9416FD98D7330792BAE001B5E16FE64CE60466
          63DA466C08A03BF329E620527FDD01D9B095398EF950F3CF35C1B40006335F60
          7630FCBE3E6005F36CE61FB5BCC8A4004631A750FC3D3C201BD6300730D74B5F
          604A00F8CB9F4FE1E29BC0E7CCFE247C403421806ECCCF287CED9BC40252B783
          C459870901CC630EB3FD8978065CF80B9933922AEA16C0B1CC0F283CEDDBC0CF
          CC83985BE22AE916C01CE63935BEA6A98AD4C2BF71AFD3019DE2ADB5ED861A5F
          7319736A5C059D02E8C8FC89E48B3C787819CF5C454AB55881DB5EC5EA0BDCD2
          AADA764DE3A86565B1AEC6FA95D54E29B07682859F2EC2FACB9927C555D02980
          8B98CF0BEB3EC9BC99D4450F88C7BECCD7987D0475B130D495B929AA824E0140
          A93709EA2D610E217D7FC165C4FECC4F987B08EA1EC2FC2AAA50A700B0E8335A
          500F177F91C67E9415B85DDE22A87714F3E3A8429D027889395250EF00E65A8D
          FD282B2E673E2BA8D797F97E54A14E014867009D99BF6BEC4759211500560597
          4515EA1400967E8726D4C193FC3EA4B636036A835400A732174715EA14008216
          0627D48100DA31FFD5D88FB2422A8033990BA30A5D10405B0AD3BF34705E006F
          938AF6890304D086F4ADE2951952010C67CE8D2AD42980A5A4C2BEE2800BDF5A
          631FCA0CA9004630674515DA1600167FDA68EC43992115C00514B32B685B0058
          AA6CABB10F6586F302788F54B8771C8200D2432A808B99D3A30A750A007100C7
          27D40902480FA9002E654E8B2A0C02282E82003C875400B141214100C5855400
          D7302747150601141741009E2308C0734805308654C85D8B28A2001044898053
          E4C0F9BC872015C08DCCC7A20A8B24005CF86B9977901200F2E0B0D1F1B5C631
          B80CEF04D0D280114882CD8E251AC7E12ABC1340D4F63236946034F10CF9754B
          F04E00DF90B29169094DCD83BC95FC118157024006CD8FA49222E200DF1C2445
          FA1062261500FE281E892A2C8A00905E8634B38E82BA88813F8BF9ABC6B1B900
          A900F0D0FC7054615104B01B7303734FE17B379212C12A8DE3B30DE70580AC95
          9E0975100C3A46D016ACE32000492A540570C8389FCA9B75E4BC00F20404B091
          D437412D80C02A3384B2C12B01E02FFF4F4AE7318459C1C4E60FA24C09A85E09
          00F77E08208B0BE86C52C111659921782580F6CCBF7268672529F3A432E4227A
          2500F809FF96535BEB4865CB147D0FC12B01C01265438EED610F011B49CBB236
          64115201DCCB1C1B555814017427B5129827E0437415F345DB834B09AF04D083
          F9BD86763143C007F420156F0FC12B01C013E75B4D6DE3C2E35BE00A2A5696B2
          510160FAD58B793029CB57CCCBB1845B39D8A1BEAA5EE5E79DE7ECD51E773BDB
          A925956101E830CD1FE8BBCC73A9386615C604808BFC0AF3342ABFE3E76AE6E9
          A45C365D873101C0DF7F94EDD11A04ACD6B191F4A9ED8E24C08800F0F0857B6F
          DEE7F0B88ECDA43692DEB0DD91181811C019A45C297D84EB1B4946047009F339
          DB23B508CC10104D7317B9B79164440008C37EC2F6481D004EE74292E596AC0D
          E50823024050C778DB23750470DBC446D2A6AC0DE5042302B89DD47164010AD8
          40C246D23ADB1D214302B893F980ED913A066C25E39B60A5E57E1811C03DCCFB
          2C0FD44520A804DE3B73B33694014100968159010EB940E6AD8D8DA420000750
          8937BC8DCC8B2008C021D8982606013806EC26E2E170B3A1F70B02700C3897E7
          143297921604E01070723776104D2E12050138024C05E1C7BBD5F0FB06013800
          E4DD63066023942C08C022B006800B3FD1621F8C08E06EE6FD1607E92230D543
          8AD9ACAC0D6544D80CB20058D3217074B9ED8E50D80E360EEC002260748DED8E
          34C38800AE633E6E7BA40EC0C5A4522302C0D9BF536C8FD4325C359E32228061
          CC79B6476A1115EB39D7E2010123024026D09754FE84909D810B8E0BFF58D686
          34C2880070E17102E820DBA335084CF3F0956F33D8430263994170E7804DEB11
          B6476C00AE847B4960343914C99927934A10C569DF480E45CE6003ED4802ADAB
          FAB93A31B46EA7DF1B12FEBFF273E5B653DFFC7B7BCD1F28A67708F85CABF97D
          F242480FCF1108F9C66E5E51328301AF04B01FF33B4D6DBB98F421815702E84E
          F95BC420866F1CA9B4AFA2B983005E09206F93286CDFE230A5A9591BB208AF04
          0097F08D39B585FB3C52BF17DB1E54467865139797516423A927FDD5B6079403
          BC12401E56B138470073FCF5B6079313BC124016B3686021A9B83D5321DB26E0
          9500D2DAC50348DD420A57912CE024705E0030964A3AE3A729AE735548736004
          2E38E2F6265131A77949705E00791F19F30BC997835DC8DED50DAF04807B3F16
          82BA08EA2233070F7B1F691C9B0BF04A00D818C252708F847A48CFC234EF078D
          E372055201E036382EAAB0280200BEA078BBD8A259BD6685570747026F517460
          4AC5ECD9747A964D7827009856223EB17A3108A15B485C192B6CA34CF04E00C0
          4852A655980DE05C40ECE415F5C087ACF05200013B1004E039A40280DFF1A4A8
          C22080E2422A00C43D4C8E2A0C02282E82003C471080E7900A0001AF91A16F41
          00C585540030B39816551804505C0401780EA900B02D3E3DAA50A7009632FB25
          D40902480FA900100A3723AAD0B60010B5B38BC63E9419A5100042B55A6BEC43
          992115007220664615EA14C03BA4328AE31004901E52010CA798D0389D0280B1
          C4E0843A10009E01CA16B16B02520120426A6154A10B026847EE19301501CE0B
          603E7368421D08606F527BFB01B5412A8021CC4551853A0580E89D61827A9DC9
          2DFFBDA2402A8001A4E2255B844E01BCCC3C4F50AF27B9710E5FD12015405F52
          0E282D42A7006030395A50AF3F7399C67E94155227F76328264742A7001E65DE
          20A8379B3982CA99BEA50B9D4885C97712D43D9462D2E1750AE04AE6D3827AB8
          F01553C6208264203F720E73A0A02EA2A6BB52CC33964E01742395CD234DE95E
          40CA9A1EE7F3C2B02988E1FF389AD4ADB597B03EBEFA8FA398CF52777A785C32
          474B4047B755FD0B567C7A2BFF5FF9D905A4F12BA84BF93A005639B59864C446
          0403BA058085A0D7C93FAF611780C32D30C38A35C5D02D005C786C0A9D68FBD3
          F010B1E1E015987008E9CDFC90D2B97B04A403E6FD58004ABC559AB288C17A00
          162DC2AD403F1A493DF8894E3035E91184850B98160611E803A67B38BE566C83
          67DA24EA6AE604524EE301F922D5A156365CC28E243597ED6DE1BDCB084C8D11
          F18387BE9ACD316CD9C4612E8B8DA231CC3E146E0B6980F59125A416CF56A46D
          C4B64F202E3C56B5103B7838B30385DB4314B03A8A286AC44E6085152BA799CF
          30FC0FE1B98C9FF72E73150000000049454E44AE426082}
        Proportional = True
        Transparent = True
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 128
        ExplicitHeight = 202
      end
    end
    object GroupBoxOpcoes: TAdvGroupBox
      Left = 194
      Top = 80
      Width = 290
      Height = 65
      Caption = 'Op'#231#245'es'
      ParentCtl3D = True
      TabOrder = 2
      object CheckBoxMostrarSenha: TAdvOfficeCheckBox
        Left = 10
        Top = 15
        Width = 219
        Height = 17
        TabOrder = 0
        TabStop = True
        OnClick = CheckBoxMostrarSenhaClick
        Alignment = taLeftJustify
        Caption = 'Mostrar os caracteres da senha digitada'
        ReturnIsTab = False
        Themed = True
        Version = '1.3.8.4'
      end
      object CheckBoxLembrarUsuario: TAdvOfficeCheckBox
        Left = 10
        Top = 35
        Width = 206
        Height = 17
        Checked = True
        TabOrder = 1
        TabStop = True
        Alignment = taLeftJustify
        Caption = 'Salvar o login do usu'#225'rio informado'
        ReturnIsTab = False
        State = cbChecked
        Themed = True
        Version = '1.3.8.4'
      end
    end
    object GroupBoxDicaSenha: TAdvGroupBox
      Left = 194
      Top = 145
      Width = 290
      Height = 50
      Caption = 'Dica da senha'
      ParentCtl3D = True
      TabOrder = 4
      Visible = False
      object LabelDicaSenha: TLabel
        Left = 8
        Top = 15
        Width = 149
        Height = 13
        Caption = 'Dica da senha n'#227'o cadastrada.'
        Transparent = True
        WordWrap = True
      end
    end
    object PanelVersao: TAdvPanel
      Left = 0
      Top = 196
      Width = 544
      Height = 25
      Align = alBottom
      BevelOuter = bvNone
      Color = 16640730
      TabOrder = 5
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
      Text = '<B> Vers'#227'o:</B>'
      FullHeight = 25
    end
    object EditUsuario: TAdvEdit
      Left = 195
      Top = 10
      Width = 289
      Height = 21
      Hint = 'Informe seu Login do Usu'#225'rio para acesso ao Sistema.'
      EmptyTextStyle = []
      DisabledColor = clWindow
      ShowError = True
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
      DoubleBuffered = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 50
      ParentColor = True
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      Visible = True
      OnExit = EditUsuarioExit
      OnKeyDown = EditUsuarioKeyDown
      Version = '3.3.2.4'
    end
    object EditSenha: TAdvEdit
      Left = 195
      Top = 35
      Width = 289
      Height = 21
      Hint = 'Informe sua Senha para Acesso ao Sistema.'
      EmptyTextStyle = []
      DisabledColor = clWindow
      ShowError = True
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
      DoubleBuffered = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 50
      ParentColor = True
      ParentFont = False
      ParentShowHint = False
      PasswordChar = #9679
      ShowHint = True
      TabOrder = 1
      Visible = True
      OnChange = EditSenhaChange
      OnKeyPress = EditSenhaKeyPress
      Version = '3.3.2.4'
    end
    object ButtonDicaSenha: TAdvGlowButton
      Left = 492
      Top = 37
      Width = 16
      Height = 16
      Cursor = crHandPoint
      Hint = 'Apresentar a dica da senha.'
      NotesFont.Charset = DEFAULT_CHARSET
      NotesFont.Color = clWindowText
      NotesFont.Height = -11
      NotesFont.Name = 'Tahoma'
      NotesFont.Style = []
      OfficeHint.Title = 'Dica da senha'
      OfficeHint.Picture.Data = {
        89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
        61000000EE49444154388DADD3314EC3401085E10F2BCA295CA7708152A53654
        394D8EC01D224BE91107480B4AE13B10893A121DAD458781C26364CCC612885F
        7AD26AE6CDCC7ABDCB4F0A6C7144133A46AC48F8BF98A3428B1A1BAC439B88B5
        E199A78A0F78463931A40CCF61DCA48A443E6AFA101A9AF3F0567DA088AD8D27
        AFF0115A2576D246ADADEEFBC62C070D96897C8D6D866BEC13869733EB9E7DD4
        6A74273D26C36B284BE4D768668944CF3B1E07EB24339CB0C07D227F3B316081
        D385EE102F7135614E51F73B3CF71BE12634A68C9A22C31376B8F3FD22C15B68
        481EDE5DD4E21FAE72DFE4CF8F69C8AF9EF3274C5B479C321731690000000049
        454E44AE426082}
      Picture.Data = {
        89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
        610000010A49444154388D85D3B14A43311406E08F4B1107671171E8E8589CC5
        49C4D97770D5CD37E8E0038883B3A3833877500727111141411111112729C5A1
        88D421B9724D13FBC321C939FF7F4E9293308E397471857EB41BEC623EC3FF83
        557C6054B03ED64BE2762494C4B50D22770C7B09F11BE7E8455133B69F4BF0D4
        200CB18C0A2DE15E1E1BF19754DC8A156BC251F45FE222CEBBC92EA6C50AF558
        CF6145E8420767D1D7498A56E9223DE7082798C261E2FF8ABBFEC556463CC281
        D0FF5C6CA799E0B840BAC76D21D66B9EE34E1EDBD82CC41E9A8B199C66AABCE1
        39E3BFC66C9AB112DA37E925F6848BCD62119FFF8887582A896BACC9FF890136
        26896B2C087FE315EF423BDB39E20FE9A58183A02714030000000049454E44AE
        426082}
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      OnClick = ButtonDicaSenhaClick
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
    object ButtonEnviarSenhaEmail: TAdvGlowButton
      Left = 193
      Top = 59
      Width = 16
      Height = 16
      Cursor = crHandPoint
      Hint = 'Esqueceu sua senha, enviar uma senha tempor'#225'ria por e-mail.'
      NotesFont.Charset = DEFAULT_CHARSET
      NotesFont.Color = clWindowText
      NotesFont.Height = -11
      NotesFont.Name = 'Tahoma'
      NotesFont.Style = []
      Picture.Data = {
        89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
        610000014449444154388DBDD2B14BD5511407F04F2F888718488338BD4950E4
        F58686A425141C5444E40DFE15CD21ED12F1288586881069100787878388888B
        0ED290202A160E22E2248F4C73541BEE79F0A35414C1EF722FE79CEFF77EEF39
        873BE2E12DEB9BF1027F707A53520746B08ADFB8C02E1E5DE5A001DD78850FE8
        0DC2380EF0189B51BB55273DC328BEE327C6D013627514500B478398AD27BE86
        AD0594AEF9CA0C2A716FC4AF38D53089137C42CB25E42E1CA229139B47398735
        4CA10DE7D88E979AA3301FC2151C6504AAE883D7789F49B4C6FF4EF10573380B
        E1327251D7229A58921A9745A334B269BC0D378358C13A864368B14ED8437B46
        E05DF4E5323C0F37BBD26E808F7813F722F6F1E41F62515AA82A263084FC8348
        BE941AF5346C8EE287B4449D38C6069623FE1F72D8C192B413DFF019FDD2146E
        840206A429DC1FFE0219194581875DA1260000000049454E44AE426082}
      Transparent = True
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
      OnClick = LabelEnviarSenhaEmailClick
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
  object FormStyler: TAdvFormStyler
    Style = tsOffice2003Blue
    AppStyle = dmEstilo.AppStyler
    Left = 496
    Top = 104
  end
end
