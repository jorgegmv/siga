object fmAplSobre: TfmAplSobre
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Sobre o Sistema Aqueloo SIGA...'
  ClientHeight = 572
  ClientWidth = 594
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
  PixelsPerInch = 96
  TextHeight = 13
  object PanelBotoes: TAdvPanel
    Left = 0
    Top = 531
    Width = 594
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
      Left = 515
      Top = 8
      Width = 75
      Height = 25
      Hint = 'Fechar a tela de Sobre.'
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
      TabOrder = 0
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
  end
  object PanelCentral: TAdvPanel
    Left = 0
    Top = 0
    Width = 594
    Height = 531
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
    FullHeight = 531
    object LabelCriador: TLabel
      Left = 8
      Top = 10
      Width = 190
      Height = 16
      Caption = 'Desenvolvido por: Jorge Vallad'#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object LabelDireitosAutorais: TLabel
      Left = 8
      Top = 30
      Width = 204
      Height = 16
      Caption = 'Direitos autorais: Aqueloo Sistemas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object LabelVersao: TLabel
      Left = 8
      Top = 50
      Width = 45
      Height = 16
      Caption = 'Vers'#227'o:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object LabelUso: TLabel
      Left = 8
      Top = 90
      Width = 115
      Height = 16
      Caption = 'Uso: N'#227'o comercial.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object LabelDetalhes: TLabel
      Left = 8
      Top = 110
      Width = 499
      Height = 32
      Caption = 
        'Objetivo: '#13#10'Uma ferramenta pr'#225'tica e moderna para a Gest'#227'o de Aq' +
        'uisi'#231#245'es e Controle Financeiro.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object LabelLicenca: TLabel
      Left = 8
      Top = 70
      Width = 135
      Height = 16
      Caption = 'Licen'#231'a: Software livre.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object GroupBoxHistoricoVersoes: TAdvGroupBox
      Left = 0
      Top = 148
      Width = 594
      Height = 383
      Align = alBottom
      Caption = 'Hist'#243'rico de vers'#245'es'
      ParentCtl3D = True
      TabOrder = 0
      object GroupBoxNotasVersoesAnteriores: TAdvGroupBox
        Left = 3
        Top = 268
        Width = 588
        Height = 112
        Align = alBottom
        Caption = 'Vers'#245'es anteriores'
        ParentCtl3D = True
        TabOrder = 0
        object MemoNotasVersoesAnteriores: TAdvMemo
          Left = 3
          Top = 16
          Width = 582
          Height = 93
          Cursor = crDefault
          ActiveLineSettings.ShowActiveLine = False
          ActiveLineSettings.ShowActiveLineIndicator = False
          Align = alClient
          AutoCompletion.Active = False
          AutoCompletion.AutoDisplay = False
          AutoCompletion.AutoWidth = False
          AutoCompletion.Font.Charset = DEFAULT_CHARSET
          AutoCompletion.Font.Color = clWindowText
          AutoCompletion.Font.Height = -11
          AutoCompletion.Font.Name = 'Tahoma'
          AutoCompletion.Font.Style = []
          AutoCompletion.StartToken = '(.'
          AutoCorrect.Active = True
          AutoHintParameters = hpNone
          AutoHintParameterPosition = hpBelowCode
          AutoIndent = False
          AutoThemeAdapt = True
          BlockShow = False
          BkColor = 16640730
          BookmarkGlyph.Data = {
            36050000424D3605000000000000360400002800000010000000100000000100
            0800000000000001000000000000000000000001000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
            A6000020400000206000002080000020A0000020C0000020E000004000000040
            20000040400000406000004080000040A0000040C0000040E000006000000060
            20000060400000606000006080000060A0000060C0000060E000008000000080
            20000080400000806000008080000080A0000080C0000080E00000A0000000A0
            200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
            200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
            200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
            20004000400040006000400080004000A0004000C0004000E000402000004020
            20004020400040206000402080004020A0004020C0004020E000404000004040
            20004040400040406000404080004040A0004040C0004040E000406000004060
            20004060400040606000406080004060A0004060C0004060E000408000004080
            20004080400040806000408080004080A0004080C0004080E00040A0000040A0
            200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
            200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
            200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
            20008000400080006000800080008000A0008000C0008000E000802000008020
            20008020400080206000802080008020A0008020C0008020E000804000008040
            20008040400080406000804080008040A0008040C0008040E000806000008060
            20008060400080606000806080008060A0008060C0008060E000808000008080
            20008080400080806000808080008080A0008080C0008080E00080A0000080A0
            200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
            200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
            200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
            2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
            2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
            2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
            2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
            2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
            2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
            2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FDFD25252525
            2525252525252525FDFDFD2E25FFFFFFFFFFFFFFFFFFFF25FDFDFD2525252525
            2525252525252525FDFD9A9AB7B7B7B7B7B7B7B7B7B72525FDFDFD25B7B7B7B7
            B7B7B7B7B7B72525FDFD9A9AB7B7B7B7B7B7B7B7B7B72525FDFDFD25BFB7BFBF
            B7B7B7B7B7B72525FDFD9A9ABFBFBFB7BFBFB7B7B7B72525FDFDFD25BFBFBFBF
            BFB7BFBFB7B72525FDFD9A9ABFBFBFB7BFBFBFB7BFB72525FDFDFD25BFBFBFBF
            BFBFBFBFBFB72525FDFD9A9ABFBFBFBFBFB7BFBFB7B72525FDFDFD25BFBFBFBF
            BFBFBFBFBFB72525FDFD9A9ABFBFBFBFBFBFBFBFBFB725FDFDFDFD2525252525
            25252525252525FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD}
          BorderColor = 9841920
          BorderStyle = bsSingle
          ClipboardFormats = [cfText]
          CodeFolding.Enabled = False
          CodeFolding.LineColor = clGray
          Ctl3D = False
          DelErase = True
          DragMode = dmManual
          EnhancedHomeKey = False
          Gutter.Font.Charset = DEFAULT_CHARSET
          Gutter.Font.Color = clWindowText
          Gutter.Font.Height = -11
          Gutter.Font.Name = 'Courier New'
          Gutter.Font.Style = []
          Gutter.BorderColor = 9841920
          Gutter.GutterColor = 14722429
          Gutter.GutterColorTo = 16572875
          Gutter.ShowLineNumbers = False
          Gutter.Visible = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          HiddenCaret = False
          HideSelection = True
          Lines.Strings = (
            '20/12/2015 - Vers'#227'o 2.6.0.1'
            
              '[2015/B.015] Corre'#231#227'o de bug na listagem do Saldo financeiro do ' +
              'Usu'#225'rio no cadastro de Investimento;'
            '18/12/2015 - Vers'#227'o 2.6.0.0'
            
              '[2015/M.016] Implementada a melhoria de ocultar/exibir nos cadas' +
              'tros de Aquisi'#231#227'o, Despesa, Investimento e Receita.'
            '07/12/2015 - Vers'#227'o 2.5.1.0'
            
              '[2015/M.015] Implementada a melhoria de apresentar as imagens co' +
              'm a op'#231#227'o de "Imagens quentes".'
            '05/12/2015 - Vers'#227'o 2.5.0.0'
            
              '[2015/I.005] Implementado a inova'#231#227'o de cadastro de Investimento' +
              '.'
            '14/11/2015 - Vers'#227'o 2.4.5.0'
            
              '[2015/M.014] Implementada a melhoria de marcar se h'#225' anexos nos ' +
              'cadastros de Receitas e Despesas.'
            '09/11/2015 - Vers'#227'o 2.4.4.0'
            
              '[2015/M.013] Implementada a melhoria na barra de ferramentas do ' +
              'sistema.'
            '24/10/2015 - Vers'#227'o 2.4.3.4'
            '[2015/B.013] Corre'#231#227'o de bugs gerais;'
            '20/10/2015 - Vers'#227'o 2.4.3.3'
            '[2015/B.012] Corre'#231#227'o do estilo na consulta de Materiais;'
            '12/10/2015 - Vers'#227'o 2.4.3.2'
            
              '[2015/B.011] Corre'#231#227'o de bug ao trocar de aba na consulta de Aqu' +
              'isi'#231#245'es;'
            '11/10/2015 - Vers'#227'o 2.4.3.1'
            
              '[2015/B.011] Corre'#231#227'o de bug na atualiza'#231#227'o de Aquisi'#231#227'o Parcela' +
              'da no cadastro da Aquisi'#231#227'o;'
            '10/10/2015 - Vers'#227'o 2.4.3.0'
            
              '[2015/M.012] Implementada a melhoria de utiliza'#231#227'o de estilos no' +
              ' cadastro de Aquisi'#231#227'o.'
            '28/09/2015 - Vers'#227'o 2.4.2.0'
            
              '[2015/M.012] Implementada a melhoria de troca de estilos e assoc' +
              'ia'#231#227'o de estilo do usu'#225'rio.'
            '24/09/2015 - Vers'#227'o 2.4.1.0'
            
              '[2015/M.011] Implementada a melhoria de exportar HMTL nos relat'#243 +
              'rios.'
            '12/09/2015 - Vers'#227'o 2.4.0.0'
            
              '[2015/I.004] Implementado a inova'#231#227'o de utiliza'#231#227'o de estilo do ' +
              'office 2013.'
            '31/08/2015 - Vers'#227'o 2.3.6.0'
            
              '[2015/M.010] Implementado a inclus'#227'o de gr'#225'ficos de movimenta'#231#245'e' +
              's.'
            '20/08/2015 - Vers'#227'o 2.3.5.0'
            
              '[2015/M.009] Implementado a inclus'#227'o de fornecedor nos itens da ' +
              'Despesa.'
            '15/08/2015 - Vers'#227'o 2.3.4.2'
            '[2015/B.010] Corre'#231#227'o de bug geral no cadastro da Aquisi'#231#227'o;'
            '09/08/2015 - Vers'#227'o 2.3.4.1'
            '[2015/B.009] Corre'#231#227'o de bug geral na formata'#231#227'o financeira;'
            '06/08/2015 - Vers'#227'o 2.3.4.0'
            
              '[2015/M.008] Implementado a apresenta'#231#227'o do saldo acumulado na l' +
              'istagem dos Movimentos.'
            '01/08/2015 - Vers'#227'o 2.3.3.0'
            
              '[2015/B.008] Corre'#231#227'o de bug no relat'#243'rio de Aquisi'#231#245'es - Materi' +
              'ais por Fornecedor;'
            '[2015/M.007] Implementado o Painel de Resumo Financeiro.'
            '30/07/2015 - Vers'#227'o 2.3.2.0'
            
              '[2015/B.007] Corre'#231#227'o de bug no cadastro de Usu'#225'rio, no campo CE' +
              'P;'
            
              '[2015/B.008] Corre'#231#227'o de bug no cadastro de Fornecedor, no campo' +
              ' CEP;'
            
              '[2015/M.006] Implementado o relat'#243'rio de Aquisi'#231#227'o - Materiais p' +
              'or Fornecedor.'
            '24/07/2015 - Vers'#227'o 2.3.1.2'
            
              '[2015/B.006] Corre'#231#227'o de bug no cadastro de Aquisi'#231#227'o, que n'#227'o p' +
              'ermitia atualizar o usu'#225'rio;'
            '24/07/2015 - Vers'#227'o 2.3.1.1'
            '[2015/B.005]'
            
              '- Corre'#231#227'o de bug no cadastro de Aquisi'#231#227'o, que n'#227'o permitia atu' +
              'alizar o usu'#225'rio;'
            
              '- Corre'#231#227'o nas imagens do sistema, pois estava dif'#237'cil visualiza' +
              'r.'
            '23/07/2015 - Vers'#227'o 2.3.1.0'
            '[2015/M.004] Implementado a consulta de Documentos.'
            '[2015/M.005] Implementado o relat'#243'rio de Garantia de Materiais.'
            '21/07/2015 - Vers'#227'o 2.3.0.0'
            '[2015/M.003] Implementado o painel de Movimenta'#231#245'es.'
            '16/07/2015 - Vers'#227'o 2.2.1.2'
            '[2015/B.004]'
            
              '- Corre'#231#227'o de bug no relat'#243'rio de movimenta'#231#245'es, onde o valor to' +
              'tal era sempre apresentado em azul;'
            '- Corre'#231#227'o na op'#231#227'o de recarregar par'#226'metros do sistema.'
            '15/07/2015 - Vers'#227'o 2.2.1.1'
            
              '[2015/B.003] Corre'#231#227'o de bugs no cadastro e listagem de moviment' +
              'a'#231#245'es.'
            '12/07/2015 - Vers'#227'o 2.2.1.0'
            '[2015/B.002] Corre'#231#227'o de bugs gerais no sistema.'
            
              '[2015/M.001] Implementado a troca da tabela de par'#226'metros por co' +
              'nfigura'#231#245'es de se'#231#227'o por usu'#225'rio.'
            '04/07/2015 - Vers'#227'o 2.2.0.1'
            '[2015/B.001] Corre'#231#227'o de bugs na janela de pesquisa das Grids.'
            '10/01/2015 - Vers'#227'o 2.2.0.0'
            '[2014/B.020] Corre'#231#227'o de bugs gerais no Cadastro de Despesas.'
            
              '[2014/B.021] Corre'#231#227'o de bugs ao salvar o documento em disco no ' +
              'Cadastro de Documentos.'
            
              '[2014/I.003] Implantada a inova'#231#227'o de Gerenciamento Financeiro, ' +
              'atrav'#233's do Cadastro de Receitas e Despesas.'
            '10/12/2014 - Vers'#227'o 2.1.3.0'
            
              '[2014/B.018] Corre'#231#227'o de bugs gerais, identificado nas telas de ' +
              'Cadastro de Notifica'#231#245'es e tamb'#233'm nas Consultas'
            'de Pend'#234'ncias.'
            
              '[2014/B.019] Corre'#231#227'o de bugs na tela de cadastro de documentos,' +
              ' que gerava falha de chave prim'#225'ria ao adicionar documentos.'
            
              '[2014/M.011] Implementado a atualiza'#231#227'o dos '#237'cones da aplica'#231#227'o,' +
              ' utilizando-se '#237'cones personalizados.'
            
              '[2014/M.012] Implementado a melhoria de definir entre apresentar' +
              ' ou n'#227'o as imagens dos materiais.'
            
              '[2014/I.004] Implementado a inova'#231#227'o de Cadastro de Receitas fin' +
              'anceiras.'
            
              '[2014/I.005] Implementado a inova'#231#227'o de Cadastro de Despesas fin' +
              'anceiras.'
            '14/11/2014 - Vers'#227'o 2.1.2.0'
            
              '[2014/B.016] Corre'#231#227'o de bugs gerais, identificado em diversas t' +
              'elas.'
            
              '[2014/B.017] Exclus'#227'o do calend'#225'rio, que estava exigindo muito p' +
              'rocessamento e oferecendo poucos recursos.'
            
              '[2014/M.010] Implementado o acesso ao Cadastro de Aquisi'#231#245'es atr' +
              'av'#233's do Painel de Pend'#234'ncias.'
            '18/08/2014 - Vers'#227'o 2.1.1.0'
            
              '[2014/B.015] Corre'#231#227'o da falha ao clicar na Grid de Aquisi'#231#245'es. ' +
              'Foi alterado o evento desta Grid, que estava inconsistente.'
            
              '[2014/M.009] Implementada a melhoria da inclus'#227'o do Valor da Gar' +
              'antia e Data da Garantia no cadastro de Itens da Aquisi'#231#227'o. Esta' +
              ' informa'#231#227'o foi utilizada nos c'#225'lculos dos relat'#243'rio de Aquisi'#231#227 +
              'o.'
            '13/08/2014 - Vers'#227'o 2.1.0.0'
            
              '[2014/M.002] Implementada a melhoria de relat'#243'rios que retornam ' +
              'informa'#231#245'es das aquisi'#231#245'es de forma resumida ou detalhada, de ac' +
              'ordo com os filtros informados.'
            
              '[2014/I.001] Implantada a inova'#231#227'o de filtro nas listagens das A' +
              'quisi'#231#245'es, permitindo trazer os dados apenas do usu'#225'rio que est'#225 +
              ' logado. Esta informa'#231#227'o '#233' parametriz'#225'vel.'
            
              '[2014/I.002] Implantada a inova'#231#227'o da op'#231#227'o de informar valores ' +
              'de controle, como: Valor M'#225'ximo de Aquisi'#231#245'es Mensais; Valor M'#225'x' +
              'imo de Aquisi'#231#245'es Mensais Parceladas; Meta de Aquisi'#231#245'es Mensais' +
              '.'
            '01/08/2014 - Vers'#227'o 2.0.1.0'
            
              '[2014/B.004] Corre'#231#227'o da falha do sistema posicionar no campo C'#243 +
              'digo ao trocar de aba. Foi alterado para posicionar no primeiro ' +
              'campo habilitado da tela.'
            
              '[2014/B.011] Corre'#231#227'o da falha do treeview de listagem de Pend'#234'n' +
              'cias e Parcelas n'#227'o estar atualizando se utilizarmos o bot'#227'o de ' +
              'refresh.'
            
              '[2014/B.012] Corre'#231#227'o da falha de permitir um n'#250'mero m'#237'nimo de p' +
              'arcelas, este valor foi parametrizado no Sistema.'
            
              '[2014/B.013] Corre'#231#227'o da falha da Tela de Parcelas Aquisi'#231#227'o est' +
              'ar bloqueando caso o valor das parcelas ultrapasse o valor da co' +
              'mpra. Foi parametrizado para se o par'#226'metro estar ativo, apresen' +
              'tar uma mensagem de confirma'#231#227'o.'
            
              '[2014/B.014] Corre'#231#227'o da falha na ordena'#231#227'o dos campos das tabel' +
              'as, foi adicionado uma tela para selecionar a ordena'#231#227'o ser apli' +
              'cada nas consultas.'
            
              '[2014/M.007] Implementada a melhoria dos Pain'#233'is de Pend'#234'ncias d' +
              'e Entrega e Pend'#234'ncias de Parcela.'
            
              '[2014/M.008] Implementada a melhoria de no Cadastro de Aquisi'#231#245'e' +
              's, permitir que seja aplicada uma Taxa de Juros no Parcelamento ' +
              'da Aquisi'#231#227'o e tamb'#233'm uma Taxa Extra.'
            '23/07/2014 - Vers'#227'o 2.0.0.2'
            
              '[2014/B.001] Corre'#231#227'o da falha do campo Forma de Pagamento ficar' +
              ' desabilitado sempre que '#233' acionado o bot'#227'o "Novo".'
            
              '[2014/B.002] Corre'#231#227'o da falha de n'#227'o ser apresentado a informa'#231 +
              #227'o da fam'#237'lia pai no listagem das fam'#237'lias no Sistema.'
            
              '[2014/B.003] Corre'#231#227'o da falha das grids dos cadastros e consult' +
              'as estarem sendo apresentadas sem um padr'#227'o de tema, algumas est' +
              #227'o coloridas e outras n'#227'o.'
            
              '[2014/B.005] Corre'#231#227'o da falha das caixas de di'#225'logo n'#227'o abrirem' +
              ' no Windows 7.'
            
              '[2014/B.006] Corre'#231#227'o da falha no sistema ao tentar Salvar a ima' +
              'gem do usu'#225'rio.'
            
              '[2014/B.007] Corre'#231#227'o da falha do tema n'#227'o estar conseguindo ser' +
              ' aplicado a alguns formul'#225'rios.'
            
              '[2014/B.008] Corre'#231#227'o da falha de ao editar uma aquisi'#231#227'o, mesmo' +
              ' n'#227'o havendo parcelas, o sistema apresentar como havendo duas pa' +
              'rcelas.'
            
              '[2014/B.009] Corre'#231#227'o da falha da Aquisi'#231#227'o estar podendo ser ca' +
              'ncelada havendo Parcelamento, a regra '#233' que seja confirmado com ' +
              'o usu'#225'rio a exclus'#227'o das parcelas e apenas ap'#243's isto a Aquisi'#231#227'o' +
              ' possa ser cancelada.'
            
              '[2014/B.010] Corre'#231#227'o da falha da tela de Login n'#227'o estar possib' +
              'ilitando visualizar a Senha quando se clica no CheckBox de Visua' +
              'lizar a Senha.'
            '[2014/M.001] Melhoria nos relat'#243'rios:'
            
              '1) Implementado um relat'#243'rio que retorne informa'#231#245'es do Material' +
              ' de forma resumida ou detalhada, de acordo com os filtros inform' +
              'ados.'
            
              '2) Implementado um relat'#243'rio que retorne informa'#231#245'es das Marcas ' +
              '/ Modelos do Material que est'#225' sendo consultado.'
            '[2014/M.004] Melhoria geral na tela de Cadastro de Aquisi'#231#227'o:'
            
              '1) Ao parcelar uma aquisi'#231#227'o, permitir que seja informada uma en' +
              'trada para o montante do valor da aquisi'#231#227'o.'
            '2) Inclu'#237'da a op'#231#227'o de informar uma Forma de Pagamento.'
            '3) Inclu'#237'da a op'#231#227'o de Recalcular as Parcelas.'
            '[2014/M.005] Melhoria Geral:'
            
              '1) Reduzir tamanho das telas de cadastro de Aquisi'#231#227'o e Material' +
              ' para serem comportadas em um notebook de 13'#186'.'
            
              '2) Ajustar os labels e os bot'#245'es para o posicionamento correto e' +
              'm rela'#231#227'o ao campo.'
            
              '[2014/M.006] Implementado na tela de Login a op'#231#227'o de enviar a S' +
              'enha de acesso por e-mail para o usu'#225'rio que est'#225' tentando reali' +
              'zar login.'
            '18/07/2014 - Vers'#227'o 2.0.0.1'
            '- Sistema - Convers'#227'o para utilizar os componentes JVCL;'
            '- Sistema - Inclu'#237'da a op'#231#227'o de Agendamento de Notifica'#231#245'es;'
            
              '- Sistema - Inclus'#227'o de emiss'#227'o de Relat'#243'rios nos Cadastros e Co' +
              'nsultas;'
            '- Sistema - Corre'#231#227'o de Bugs gerais no Sistema;'
            
              '- Cadastro de Aquisi'#231#245'es - Removido o Encerramento de Aquisi'#231#245'es' +
              ';'
            '- Cadastro de Aquisi'#231#245'es - Inclu'#237'da a op'#231#227'o de Informar a'
            'Marca/Modelo dos Materias na inclus'#227'o dos Itens da Aquisi'#231#227'o;'
            '- Consulta de Fam'#237'lias - Inclu'#237'da a visualiza'#231#227'o da Fam'#237'lia Pai.'
            '24/04/2014 - Vers'#227'o 1.0.0.5'
            
              '- Sistema - Inclu'#237'do o comportamento de salvar o tamanho do Pain' +
              'el de Pend'#234'ncias;'
            
              '- Sistema - Corrigido o m'#233'todo de transfer'#234'ncia e visualiza'#231#227'o d' +
              'e arquivos e documentos;'
            
              '- Consulta de Aquisi'#231#245'es - Corrigido a'#231#245'es de visualizar itens e' +
              ' parcelas, que estavam desabilitadas indevidamente;'
            
              '- Cadastro de Aquisi'#231#245'es - Liberado o cancelamento da Aquisi'#231#227'o,' +
              ' mesmo estando encerrada;'
            
              '- Cadastro de Aquisi'#231#245'es - Liberado a visualiza'#231#227'o dos documento' +
              's, quando a aquisi'#231#227'o estiver encerrada;'
            
              '- Cadastro de Usu'#225'rio - Inclu'#237'da a op'#231#227'o de inserir uma imagem n' +
              'o cadastro do Usu'#225'rio.'
            '21/04/2014 - Vers'#227'o 1.0.0.4'
            
              '- Cadastro de Aquisi'#231#245'es - Retirado o tratamento de duplicidade ' +
              'de materiais, pois deve ser por marca e modelo.'
            '21/04/2014 - Vers'#227'o 1.0.0.3'
            
              '- Cadastro de Usu'#225'rios - Corrigido o campo CEP, implementado par' +
              'a sair ao clicar em ESC;'
            
              '- Cadastro de Fornecedores - Corrigido o campo CEP, implementado' +
              ' para sair ao clicar em ESC;'
            
              '- Cadastro de Fornecedores - Inclu'#237'do valida'#231#227'o para o campo CNP' +
              'J.'
            '21/04/2014 - Vers'#227'o 1.0.0.2'
            
              '- Cadastro de Aquisi'#231#245'es - Inclu'#237'do o bot'#227'o de cadastro de Mater' +
              'ial;'
            
              '- Consulta de Aquisi'#231#245'es - Inclu'#237'do regra para n'#227'o congelar a te' +
              'la se a consulta retornar vazia;'
            
              '- Consulta de Aquisi'#231#245'es - Inclu'#237'do campo para apresentar o soma' +
              't'#243'rio das Aquisi'#231#245'es.'
            '21/04/2014 - Vers'#227'o 1.0.0.1'
            
              '- Cadastro de Aquisi'#231#245'es - Inclu'#237'do o bot'#227'o de cadastro de Mater' +
              'ial;'
            
              '- Cadastro de Aquisi'#231#245'es - Inclu'#237'do formata'#231#227'o do campo de N'#250'mer' +
              'o da Nota fiscal;'
            
              '- Cadastro de Aquisi'#231#245'es - Corrigido campo Quantidade, configura' +
              'do para apresentar por padr'#227'o o valor 1;'
            
              '- Cadastro de Aquisi'#231#245'es - Corrigido o erro no campo Nome do For' +
              'necedor;'
            
              '- Cadastro de Aquisi'#231#245'es - Corrigido o erro na pesquisa por Desc' +
              'ri'#231#227'o do Material;'
            '- Cadastros Gerais - Corrigido falha na Grid de consulta;'
            
              '- Cadastro de Fam'#237'lia - Corrigido para abrir expandido quando fo' +
              'r uma '#250'nica Fam'#237'lia Pai;'
            
              '- Cadastro de Materiais - Corrigido para informar sugest'#227'o do Ti' +
              'po de Material da Fam'#237'lia;'
            
              '- Consulta de Aquisi'#231#245'es - Corrigido para consulta sempre retorn' +
              'ar as Aquisi'#231#245'es encerradas;'
            
              '- Consulta de Aquisi'#231#245'es - Corrigido regras das Op'#231#245'es adicionai' +
              's.')
          MarkerList.UseDefaultMarkerImageIndex = False
          MarkerList.DefaultMarkerImageIndex = -1
          MarkerList.ImageTransparentColor = 586969356
          OleDropTarget = []
          PrintOptions.MarginLeft = 0
          PrintOptions.MarginRight = 0
          PrintOptions.MarginTop = 0
          PrintOptions.MarginBottom = 0
          PrintOptions.PageNr = False
          PrintOptions.PrintLineNumbers = False
          ReadOnly = True
          RightMarginColor = 14869218
          ScrollBars = ssVertical
          ScrollHint = False
          SelColor = clWhite
          SelBkColor = clNavy
          ShowRightMargin = False
          SmartTabs = False
          TabOrder = 0
          TabStop = True
          TrimTrailingSpaces = True
          UILanguage.ScrollHint = 'Row'
          UILanguage.Undo = 'Undo'
          UILanguage.Redo = 'Redo'
          UILanguage.Copy = 'Copy'
          UILanguage.Cut = 'Cut'
          UILanguage.Paste = 'Paste'
          UILanguage.Delete = 'Delete'
          UILanguage.SelectAll = 'Select All'
          UrlStyle.TextColor = clBlue
          UrlStyle.BkColor = clWhite
          UrlStyle.Style = [fsUnderline]
          UseStyler = True
          Version = '3.1.9.1'
          WordWrap = wwNone
        end
      end
      object GroupBoxNotasVersoesAtuais: TAdvGroupBox
        Left = 3
        Top = 15
        Width = 588
        Height = 253
        Align = alBottom
        Caption = 'Vers'#245'es atuais'
        ParentCtl3D = True
        TabOrder = 1
        object MemoNotasVersoesAtuais: TAdvMemo
          Left = 3
          Top = 16
          Width = 582
          Height = 234
          Cursor = crDefault
          ActiveLineSettings.ShowActiveLine = False
          ActiveLineSettings.ShowActiveLineIndicator = False
          Align = alClient
          AutoCompletion.Active = False
          AutoCompletion.AutoDisplay = False
          AutoCompletion.AutoWidth = False
          AutoCompletion.Font.Charset = DEFAULT_CHARSET
          AutoCompletion.Font.Color = clWindowText
          AutoCompletion.Font.Height = -11
          AutoCompletion.Font.Name = 'Tahoma'
          AutoCompletion.Font.Style = []
          AutoCompletion.StartToken = '(.'
          AutoCorrect.Active = True
          AutoHintParameters = hpNone
          AutoHintParameterPosition = hpBelowCode
          AutoIndent = False
          AutoThemeAdapt = True
          BlockShow = False
          BkColor = 16640730
          BookmarkGlyph.Data = {
            36050000424D3605000000000000360400002800000010000000100000000100
            0800000000000001000000000000000000000001000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
            A6000020400000206000002080000020A0000020C0000020E000004000000040
            20000040400000406000004080000040A0000040C0000040E000006000000060
            20000060400000606000006080000060A0000060C0000060E000008000000080
            20000080400000806000008080000080A0000080C0000080E00000A0000000A0
            200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
            200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
            200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
            20004000400040006000400080004000A0004000C0004000E000402000004020
            20004020400040206000402080004020A0004020C0004020E000404000004040
            20004040400040406000404080004040A0004040C0004040E000406000004060
            20004060400040606000406080004060A0004060C0004060E000408000004080
            20004080400040806000408080004080A0004080C0004080E00040A0000040A0
            200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
            200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
            200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
            20008000400080006000800080008000A0008000C0008000E000802000008020
            20008020400080206000802080008020A0008020C0008020E000804000008040
            20008040400080406000804080008040A0008040C0008040E000806000008060
            20008060400080606000806080008060A0008060C0008060E000808000008080
            20008080400080806000808080008080A0008080C0008080E00080A0000080A0
            200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
            200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
            200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
            2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
            2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
            2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
            2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
            2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
            2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
            2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FDFD25252525
            2525252525252525FDFDFD2E25FFFFFFFFFFFFFFFFFFFF25FDFDFD2525252525
            2525252525252525FDFD9A9AB7B7B7B7B7B7B7B7B7B72525FDFDFD25B7B7B7B7
            B7B7B7B7B7B72525FDFD9A9AB7B7B7B7B7B7B7B7B7B72525FDFDFD25BFB7BFBF
            B7B7B7B7B7B72525FDFD9A9ABFBFBFB7BFBFB7B7B7B72525FDFDFD25BFBFBFBF
            BFB7BFBFB7B72525FDFD9A9ABFBFBFB7BFBFBFB7BFB72525FDFDFD25BFBFBFBF
            BFBFBFBFBFB72525FDFD9A9ABFBFBFBFBFB7BFBFB7B72525FDFDFD25BFBFBFBF
            BFBFBFBFBFB72525FDFD9A9ABFBFBFBFBFBFBFBFBFB725FDFDFDFD2525252525
            25252525252525FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD}
          BorderColor = 9841920
          BorderStyle = bsSingle
          ClipboardFormats = [cfText]
          CodeFolding.Enabled = False
          CodeFolding.LineColor = clGray
          Ctl3D = False
          DelErase = True
          DragMode = dmManual
          EnhancedHomeKey = False
          Gutter.Font.Charset = DEFAULT_CHARSET
          Gutter.Font.Color = clWindowText
          Gutter.Font.Height = -11
          Gutter.Font.Name = 'Courier New'
          Gutter.Font.Style = []
          Gutter.BorderColor = 9841920
          Gutter.GutterColor = 14722429
          Gutter.GutterColorTo = 16572875
          Gutter.ShowLineNumbers = False
          Gutter.Visible = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          HiddenCaret = False
          HideSelection = True
          Lines.Strings = (
            '03/08/2016 - Vers'#227'o 2.6.10.0'
            
              '[2016/M.0009] Implementada melhorias em filtro de consulta nas t' +
              'elas de cadastro de Material e Modelo.'
            '30/07/2016 - Vers'#227'o 2.6.9.0'
            '[2016/M.0008] Implementada melhorias em visualiza'#231#245'es gerais.'
            '18/07/2016 - Vers'#227'o 2.6.8.3'
            '[2016/B.005] Corre'#231#227'o de bugs no cadastro de Aquisi'#231#245'es.'
            '06/07/2016 - Vers'#227'o 2.6.8.2'
            '[2016/B.005] Corre'#231#227'o de bugs no cadastro de Aquisi'#231#245'es.'
            '28/05/2016 - Vers'#227'o 2.6.8.1'
            '[2016/B.004] Corre'#231#227'o de bugs gerais.'
            '28/04/2016 - Vers'#227'o 2.6.8.0'
            
              '[2016/M.0007] Implementada o gr'#225'fico do avan'#231'o das Despesas no m' +
              #234's atual.'
            '01/04/2016 - Vers'#227'o 2.6.7.0'
            
              '[2016/M.0006] Implementada a melhoria de saque parcial na tela d' +
              'e Investimento.'
            '17/03/2016 - Vers'#227'o 2.6.6.1'
            '[2016/B.003] Corre'#231#227'o de bugs gerais.'
            '12/03/2016 - Vers'#227'o 2.6.6.0'
            
              '[2016/M.0005] Implementada a melhoria dos pain'#233'is na tela princi' +
              'pal.'
            '08/03/2016 - Vers'#227'o 2.6.5.1'
            '[2016/B.002] Corre'#231#227'o de bugs gerais.'
            '26/02/2016 - Vers'#227'o 2.6.5.0'
            
              '[2016/M.0004] Implementada a melhoria de cadastrar Aquisi'#231#227'o de ' +
              'Presentes Recebidos.'
            '20/02/2016 - Vers'#227'o 2.6.4.0'
            
              '[2016/M.0003] Implementada a melhoria de relat'#243'rio de Gastos com' +
              ' Combust'#237'vel.'
            '19/02/2016 - Vers'#227'o 2.6.3.0'
            
              '[2016/M.0002] Implementada a melhoria de abrir as pend'#234'ncias atr' +
              'av'#233's da listagem de pend'#234'ncias.'
            '09/02/2016 - Vers'#227'o 2.6.2.0'
            '[2016/M.0001] Implementada pequenas melhorias de layout.'
            '02/02/2016 - Vers'#227'o 2.6.1.0'
            
              '[2016/M.0001] Implementada a melhoria de colocar textos nos bot'#245 +
              'es de adicionar e excluir.'
            '02/01/2016 - Vers'#227'o 2.6.0.2'
            
              '[2016/B.001] Corre'#231#227'o de bug na no filtro de tipo de movimento e' +
              ' na atualiza'#231#227'o do saldo do usu'#225'rio.')
          MarkerList.UseDefaultMarkerImageIndex = False
          MarkerList.DefaultMarkerImageIndex = -1
          MarkerList.ImageTransparentColor = 586969356
          OleDropTarget = []
          PrintOptions.MarginLeft = 0
          PrintOptions.MarginRight = 0
          PrintOptions.MarginTop = 0
          PrintOptions.MarginBottom = 0
          PrintOptions.PageNr = False
          PrintOptions.PrintLineNumbers = False
          ReadOnly = True
          RightMarginColor = 14869218
          ScrollBars = ssVertical
          ScrollHint = False
          SelColor = clWhite
          SelBkColor = clNavy
          ShowRightMargin = False
          SmartTabs = False
          TabOrder = 0
          TabStop = True
          TrimTrailingSpaces = True
          UILanguage.ScrollHint = 'Row'
          UILanguage.Undo = 'Undo'
          UILanguage.Redo = 'Redo'
          UILanguage.Copy = 'Copy'
          UILanguage.Cut = 'Cut'
          UILanguage.Paste = 'Paste'
          UILanguage.Delete = 'Delete'
          UILanguage.SelectAll = 'Select All'
          UrlStyle.TextColor = clBlue
          UrlStyle.BkColor = clWhite
          UrlStyle.Style = [fsUnderline]
          UseStyler = True
          Version = '3.1.9.1'
          WordWrap = wwNone
        end
      end
    end
  end
  object FormStyler: TAdvFormStyler
    Style = tsOffice2003Blue
    AppStyle = dmEstilo.AppStyler
    Left = 528
    Top = 8
  end
end
