object fmAplControleFinanceiro: TfmAplControleFinanceiro
  Left = 0
  Top = 0
  Caption = 'Painel de Controle Financeiro'
  ClientHeight = 362
  ClientWidth = 584
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object PanelBotoes: TJvPanel
    Left = 0
    Top = 321
    Width = 584
    Height = 41
    Align = alBottom
    ParentColor = True
    TabOrder = 0
    object BitBtnFechar: TJvBitBtn
      Left = 500
      Top = 8
      Width = 75
      Height = 25
      Hint = 'Fechar cadastro.'
      Cancel = True
      Caption = '&Fechar'
      ParentShowHint = False
      ShowHint = True
      Spacing = 3
      TabOrder = 0
      WordWrap = True
    end
  end
  object ToolBarGrid: TJvToolBar
    Left = 0
    Top = 0
    Width = 584
    Height = 29
    Images = fmPrincipal.ImageListTools
    TabOrder = 1
    Transparent = True
    object ToolButtonAbrirJanelaPesquisa: TToolButton
      Left = 0
      Top = 0
      Hint = 'Abrir Janela de Pesquisa.'
      ImageIndex = 4
      ParentShowHint = False
      ShowHint = True
    end
    object ToolButtonOrdenarRegistros: TToolButton
      Left = 23
      Top = 0
      Hint = 'Definir ordena'#231#227'o dos registros.'
      Caption = 'ToolButtonOrdenarRegistros'
      ImageIndex = 18
      ParentShowHint = False
      ShowHint = True
    end
    object ToolButtonAtualizarTabela: TToolButton
      Left = 46
      Top = 0
      Hint = 'Atualizar tabela.'
      ImageIndex = 1
      ParentShowHint = False
      ShowHint = True
    end
    object ToolButtonSeparador1: TToolButton
      Left = 69
      Top = 0
      Width = 8
      Caption = 'ToolButtonSeparador1'
      ImageIndex = 5
      Style = tbsSeparator
    end
    object ToolButtonImprimirRelatorio: TToolButton
      Left = 77
      Top = 0
      Hint = 'Imprimir relat'#243'rio.'
      ImageIndex = 9
      ParentShowHint = False
      ShowHint = True
    end
    object ToolButtonExportarPlanilha: TToolButton
      Left = 100
      Top = 0
      Hint = 'Exportar para Planilha.'
      ImageIndex = 10
      ParentShowHint = False
      ShowHint = True
    end
    object ToolButtonExportarHTML: TToolButton
      Left = 123
      Top = 0
      Hint = 'Exportar para HTML.'
      ImageIndex = 11
      ParentShowHint = False
      ShowHint = True
    end
  end
  object PanelCentral: TJvPanel
    Left = 0
    Top = 29
    Width = 584
    Height = 292
    Align = alClient
    ParentColor = True
    TabOrder = 2
  end
  object PageControlPrincipal: TJvPageControl
    Left = 0
    Top = 29
    Width = 584
    Height = 292
    ActivePage = TabSheetFiltro
    Align = alClient
    MultiLine = True
    Style = tsFlatButtons
    TabOrder = 3
    object TabSheetFiltro: TTabSheet
      Caption = 'Filtro'
      object PanelCampos: TJvPanel
        Left = 120
        Top = 0
        Width = 456
        Height = 261
        Align = alClient
        BevelEdges = []
        BevelOuter = bvNone
        ParentColor = True
        TabOrder = 0
        ExplicitLeft = 0
        ExplicitWidth = 576
        object LabelPeriodoAte: TLabel
          Left = 95
          Top = 13
          Width = 16
          Height = 13
          Caption = 'at'#233
          Transparent = True
        end
        object DatePickerEditFiltroPeriodoInicial: TJvDatePickerEdit
          Left = 6
          Top = 10
          Width = 84
          Height = 21
          Hint = 'Per'#237'odo Inicial.'
          AllowNoDate = True
          Checked = False
          Flat = False
          ParentFlat = False
          ParentColor = True
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
        end
        object DatePickerEditFiltroPeriodoFinal: TJvDatePickerEdit
          Left = 120
          Top = 10
          Width = 84
          Height = 21
          Hint = 'Per'#237'odo Final.'
          AllowNoDate = True
          Checked = False
          Flat = False
          ParentFlat = False
          ParentColor = True
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          Visible = False
        end
        object GroupBoxTiposRegistros: TJvGroupBox
          Left = 6
          Top = 35
          Width = 444
          Height = 80
          Caption = 'Tipos de Registros Financeiros'
          TabOrder = 2
          object CheckBoxFiltroDespesa: TJvCheckBox
            Left = 10
            Top = 15
            Width = 156
            Height = 17
            Alignment = taRightJustify
            Caption = 'Listar registros de Despesas'
            Checked = True
            State = cbChecked
            TabOrder = 0
            LinkedControls = <>
          end
          object CheckBoxFiltroReceita: TJvCheckBox
            Left = 10
            Top = 35
            Width = 151
            Height = 17
            Alignment = taRightJustify
            Caption = 'Listar registros de Receitas'
            Checked = True
            State = cbChecked
            TabOrder = 1
            LinkedControls = <>
          end
          object CheckBoxFiltroAquisicoes: TJvCheckBox
            Left = 10
            Top = 55
            Width = 160
            Height = 17
            Alignment = taRightJustify
            Caption = 'Listar registros de Aquisi'#231#245'es'
            Checked = True
            State = cbChecked
            TabOrder = 2
            LinkedControls = <>
          end
        end
      end
      object PanelTitulos: TJvPanel
        Left = 0
        Top = 0
        Width = 120
        Height = 261
        Align = alLeft
        BevelEdges = []
        BevelOuter = bvNone
        ParentColor = True
        TabOrder = 1
        object LabelPeriodo: TLabel
          Left = 72
          Top = 13
          Width = 46
          Height = 13
          Caption = 'Per'#237'odo*:'
          Transparent = True
        end
        object LabelDataCadastro: TLabel
          Left = 29
          Top = 303
          Width = 89
          Height = 13
          Caption = 'Data do Cadastro:'
          Transparent = True
        end
      end
    end
    object TabSheetDados: TTabSheet
      Caption = 'Dados Financeiros'
      ImageIndex = 1
      object PanelGrid: TJvPanel
        Left = 0
        Top = 27
        Width = 576
        Height = 234
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object ColumnGridItens: TAdvColumnGrid
          Left = 0
          Top = 0
          Width = 576
          Height = 234
          Cursor = crDefault
          Align = alClient
          Color = clBtnFace
          ColCount = 8
          DrawingStyle = gdsClassic
          RowCount = 2
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goRowSelect]
          ScrollBars = ssBoth
          TabOrder = 0
          GridLineColor = 15527152
          GridFixedLineColor = 13947601
          HoverRowCells = [hcNormal, hcSelected]
          HintShowCells = True
          HintShowLargeText = True
          HintShowSizing = True
          ActiveCellFont.Charset = DEFAULT_CHARSET
          ActiveCellFont.Color = clWindowText
          ActiveCellFont.Height = -11
          ActiveCellFont.Name = 'Tahoma'
          ActiveCellFont.Style = [fsBold]
          ActiveCellColor = 16575452
          ActiveCellColorTo = 16571329
          AutoThemeAdapt = True
          ColumnHeaders.Strings = (
            ''
            'Dom.'
            'Seg.'
            'Ter.'
            'Qua.'
            'Qui.'
            'Sex.'
            'Sab.')
          ControlLook.FixedGradientMirrorFrom = 16049884
          ControlLook.FixedGradientMirrorTo = 16247261
          ControlLook.FixedGradientHoverFrom = 16710648
          ControlLook.FixedGradientHoverTo = 16446189
          ControlLook.FixedGradientHoverMirrorFrom = 16049367
          ControlLook.FixedGradientHoverMirrorTo = 15258305
          ControlLook.FixedGradientDownFrom = 15853789
          ControlLook.FixedGradientDownTo = 15852760
          ControlLook.FixedGradientDownMirrorFrom = 15522767
          ControlLook.FixedGradientDownMirrorTo = 15588559
          ControlLook.FixedGradientDownBorder = 14007466
          ControlLook.DropDownHeader.Font.Charset = DEFAULT_CHARSET
          ControlLook.DropDownHeader.Font.Color = clWindowText
          ControlLook.DropDownHeader.Font.Height = -11
          ControlLook.DropDownHeader.Font.Name = 'Tahoma'
          ControlLook.DropDownHeader.Font.Style = []
          ControlLook.DropDownHeader.Visible = True
          ControlLook.DropDownHeader.Buttons = <>
          ControlLook.DropDownFooter.Font.Charset = DEFAULT_CHARSET
          ControlLook.DropDownFooter.Font.Color = clWindowText
          ControlLook.DropDownFooter.Font.Height = -11
          ControlLook.DropDownFooter.Font.Name = 'Tahoma'
          ControlLook.DropDownFooter.Font.Style = []
          ControlLook.DropDownFooter.Visible = True
          ControlLook.DropDownFooter.Buttons = <>
          DefaultEditor = edNone
          Filter = <>
          FilterActive = True
          FilterDropDown.Font.Charset = DEFAULT_CHARSET
          FilterDropDown.Font.Color = clWindowText
          FilterDropDown.Font.Height = -11
          FilterDropDown.Font.Name = 'Tahoma'
          FilterDropDown.Font.Style = []
          FilterDropDown.TextChecked = 'Checked'
          FilterDropDown.TextUnChecked = 'Unchecked'
          FilterDropDownClear = '(All)'
          FilterEdit.TypeNames.Strings = (
            'Starts with'
            'Ends with'
            'Contains'
            'Not contains'
            'Equal'
            'Not equal'
            'Clear')
          FixedColWidth = 20
          FixedRowHeight = 22
          FixedFont.Charset = DEFAULT_CHARSET
          FixedFont.Color = clWindowText
          FixedFont.Height = -11
          FixedFont.Name = 'Tahoma'
          FixedFont.Style = [fsBold]
          FloatFormat = '%.2f'
          GridImages = fmPrincipal.ImageListGrid
          Look = glWin7
          PrintSettings.DateFormat = 'dd/mm/yyyy'
          PrintSettings.Font.Charset = DEFAULT_CHARSET
          PrintSettings.Font.Color = clWindowText
          PrintSettings.Font.Height = -11
          PrintSettings.Font.Name = 'Tahoma'
          PrintSettings.Font.Style = []
          PrintSettings.FixedFont.Charset = DEFAULT_CHARSET
          PrintSettings.FixedFont.Color = clWindowText
          PrintSettings.FixedFont.Height = -11
          PrintSettings.FixedFont.Name = 'Tahoma'
          PrintSettings.FixedFont.Style = []
          PrintSettings.HeaderFont.Charset = DEFAULT_CHARSET
          PrintSettings.HeaderFont.Color = clWindowText
          PrintSettings.HeaderFont.Height = -11
          PrintSettings.HeaderFont.Name = 'Tahoma'
          PrintSettings.HeaderFont.Style = []
          PrintSettings.FooterFont.Charset = DEFAULT_CHARSET
          PrintSettings.FooterFont.Color = clWindowText
          PrintSettings.FooterFont.Height = -11
          PrintSettings.FooterFont.Name = 'Tahoma'
          PrintSettings.FooterFont.Style = []
          PrintSettings.PageNumSep = '/'
          SearchFooter.Color = 16645370
          SearchFooter.ColorTo = 16247261
          SearchFooter.FindNextCaption = 'Find &next'
          SearchFooter.FindPrevCaption = 'Find &previous'
          SearchFooter.Font.Charset = DEFAULT_CHARSET
          SearchFooter.Font.Color = clWindowText
          SearchFooter.Font.Height = -11
          SearchFooter.Font.Name = 'Tahoma'
          SearchFooter.Font.Style = []
          SearchFooter.HighLightCaption = 'Highlight'
          SearchFooter.HintClose = 'Close'
          SearchFooter.HintFindNext = 'Find next occurrence'
          SearchFooter.HintFindPrev = 'Find previous occurrence'
          SearchFooter.HintHighlight = 'Highlight occurrences'
          SearchFooter.MatchCaseCaption = 'Match case'
          ShowDesignHelper = False
          SortSettings.DefaultFormat = ssAutomatic
          SortSettings.Show = True
          SortSettings.IndexShow = True
          SortSettings.BlankPos = blLast
          SortSettings.HeaderColor = 16579058
          SortSettings.HeaderColorTo = 16579058
          SortSettings.HeaderMirrorColor = 16380385
          SortSettings.HeaderMirrorColorTo = 16182488
          Version = '3.1.3.5'
          Columns = <
            item
              AutoMinSize = 0
              AutoMaxSize = 0
              Alignment = taLeftJustify
              Borders = []
              BorderPen.Color = clSilver
              CheckFalse = 'N'
              CheckTrue = 'Y'
              Color = clWindow
              ColumnPopupType = cpFixedCellsRClick
              DropDownCount = 8
              EditLength = 0
              Editor = edNone
              FilterCaseSensitive = False
              Fixed = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              HeaderAlignment = taLeftJustify
              HeaderFont.Charset = DEFAULT_CHARSET
              HeaderFont.Color = clWindowText
              HeaderFont.Height = -11
              HeaderFont.Name = 'Tahoma'
              HeaderFont.Style = []
              MinSize = 0
              MaxSize = 0
              Name = 'FIXA'
              Password = False
              PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
              PrintColor = clWhite
              PrintFont.Charset = DEFAULT_CHARSET
              PrintFont.Color = clWindowText
              PrintFont.Height = -11
              PrintFont.Name = 'Tahoma'
              PrintFont.Style = []
              ReadOnly = True
              ShowBands = False
              SortStyle = ssAutomatic
              SpinMax = 0
              SpinMin = 0
              SpinStep = 1
              Tag = 0
              Width = 20
            end
            item
              AutoMinSize = 0
              AutoMaxSize = 0
              Alignment = taCenter
              Borders = []
              BorderPen.Color = clSilver
              CheckFalse = 'N'
              CheckTrue = 'Y'
              Color = clWindow
              ColumnPopupType = cpFixedCellsRClick
              DropDownCount = 8
              EditLength = 0
              Editor = edNone
              FilterCaseSensitive = False
              Fixed = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              Header = 'Dom.'
              HeaderAlignment = taLeftJustify
              HeaderFont.Charset = DEFAULT_CHARSET
              HeaderFont.Color = clWindowText
              HeaderFont.Height = -11
              HeaderFont.Name = 'Tahoma'
              HeaderFont.Style = []
              MinSize = 0
              MaxSize = 0
              Name = 'D1'
              Password = False
              PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
              PrintColor = clWhite
              PrintFont.Charset = DEFAULT_CHARSET
              PrintFont.Color = clWindowText
              PrintFont.Height = -11
              PrintFont.Name = 'Tahoma'
              PrintFont.Style = []
              ReadOnly = True
              ShowBands = False
              SortStyle = ssAutomatic
              SpinMax = 0
              SpinMin = 0
              SpinStep = 1
              Tag = 0
              Width = 75
            end
            item
              AutoMinSize = 0
              AutoMaxSize = 0
              Alignment = taCenter
              Borders = []
              BorderPen.Color = clSilver
              CheckFalse = 'N'
              CheckTrue = 'Y'
              Color = clWindow
              ColumnPopupType = cpFixedCellsRClick
              DropDownCount = 8
              EditLength = 0
              Editor = edNone
              FilterCaseSensitive = False
              Fixed = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              Header = 'Seg.'
              HeaderAlignment = taLeftJustify
              HeaderFont.Charset = DEFAULT_CHARSET
              HeaderFont.Color = clWindowText
              HeaderFont.Height = -11
              HeaderFont.Name = 'Tahoma'
              HeaderFont.Style = []
              MinSize = 0
              MaxSize = 0
              Name = 'D2'
              Password = False
              PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
              PrintColor = clWhite
              PrintFont.Charset = DEFAULT_CHARSET
              PrintFont.Color = clWindowText
              PrintFont.Height = -11
              PrintFont.Name = 'Tahoma'
              PrintFont.Style = []
              ReadOnly = True
              ShowBands = False
              SortStyle = ssAutomatic
              SpinMax = 0
              SpinMin = 0
              SpinStep = 1
              Tag = 0
              Width = 75
            end
            item
              AutoMinSize = 0
              AutoMaxSize = 0
              Alignment = taCenter
              Borders = []
              BorderPen.Color = clSilver
              CheckFalse = 'N'
              CheckTrue = 'Y'
              Color = clWindow
              ColumnPopupType = cpFixedCellsRClick
              DropDownCount = 8
              EditLength = 0
              Editor = edNone
              FilterCaseSensitive = False
              Fixed = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              Header = 'Ter.'
              HeaderAlignment = taLeftJustify
              HeaderFont.Charset = DEFAULT_CHARSET
              HeaderFont.Color = clWindowText
              HeaderFont.Height = -11
              HeaderFont.Name = 'Tahoma'
              HeaderFont.Style = []
              MinSize = 0
              MaxSize = 0
              Name = 'D3'
              Password = False
              PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
              PrintColor = clWhite
              PrintFont.Charset = DEFAULT_CHARSET
              PrintFont.Color = clWindowText
              PrintFont.Height = -11
              PrintFont.Name = 'Tahoma'
              PrintFont.Style = []
              ReadOnly = True
              ShowBands = False
              SortStyle = ssAutomatic
              SpinMax = 0
              SpinMin = 0
              SpinStep = 1
              Tag = 0
              Width = 75
            end
            item
              AutoMinSize = 0
              AutoMaxSize = 0
              Alignment = taCenter
              Borders = []
              BorderPen.Color = clSilver
              CheckFalse = 'N'
              CheckTrue = 'Y'
              Color = clWindow
              ColumnPopupType = cpFixedCellsRClick
              DropDownCount = 8
              EditLength = 0
              Editor = edNone
              FilterCaseSensitive = False
              Fixed = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              Header = 'Qua.'
              HeaderAlignment = taLeftJustify
              HeaderFont.Charset = DEFAULT_CHARSET
              HeaderFont.Color = clWindowText
              HeaderFont.Height = -11
              HeaderFont.Name = 'Tahoma'
              HeaderFont.Style = []
              MinSize = 0
              MaxSize = 0
              Name = 'D4'
              Password = False
              PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
              PrintColor = clWhite
              PrintFont.Charset = DEFAULT_CHARSET
              PrintFont.Color = clWindowText
              PrintFont.Height = -11
              PrintFont.Name = 'Tahoma'
              PrintFont.Style = []
              ReadOnly = True
              ShowBands = False
              SortStyle = ssAutomatic
              SpinMax = 0
              SpinMin = 0
              SpinStep = 1
              Tag = 0
              Width = 75
            end
            item
              AutoMinSize = 0
              AutoMaxSize = 0
              Alignment = taCenter
              Borders = []
              BorderPen.Color = clSilver
              CheckFalse = 'N'
              CheckTrue = 'Y'
              Color = clWindow
              ColumnPopupType = cpFixedCellsRClick
              DropDownCount = 8
              EditLength = 0
              Editor = edNone
              FilterCaseSensitive = False
              Fixed = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              Header = 'Qui.'
              HeaderAlignment = taLeftJustify
              HeaderFont.Charset = DEFAULT_CHARSET
              HeaderFont.Color = clWindowText
              HeaderFont.Height = -11
              HeaderFont.Name = 'Tahoma'
              HeaderFont.Style = []
              MinSize = 0
              MaxSize = 0
              Name = 'D5'
              Password = False
              PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
              PrintColor = clWhite
              PrintFont.Charset = DEFAULT_CHARSET
              PrintFont.Color = clWindowText
              PrintFont.Height = -11
              PrintFont.Name = 'Tahoma'
              PrintFont.Style = []
              ReadOnly = True
              ShowBands = False
              SortStyle = ssAutomatic
              SpinMax = 0
              SpinMin = 0
              SpinStep = 1
              Tag = 0
              Width = 75
            end
            item
              AutoMinSize = 0
              AutoMaxSize = 0
              Alignment = taCenter
              Borders = []
              BorderPen.Color = clSilver
              CheckFalse = 'N'
              CheckTrue = 'Y'
              Color = clWindow
              ColumnPopupType = cpFixedCellsRClick
              DropDownCount = 8
              EditLength = 0
              Editor = edNone
              FilterCaseSensitive = False
              Fixed = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              Header = 'Sex.'
              HeaderAlignment = taLeftJustify
              HeaderFont.Charset = DEFAULT_CHARSET
              HeaderFont.Color = clWindowText
              HeaderFont.Height = -11
              HeaderFont.Name = 'Tahoma'
              HeaderFont.Style = []
              MinSize = 0
              MaxSize = 0
              Name = 'D6'
              Password = False
              PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
              PrintColor = clWhite
              PrintFont.Charset = DEFAULT_CHARSET
              PrintFont.Color = clWindowText
              PrintFont.Height = -11
              PrintFont.Name = 'Tahoma'
              PrintFont.Style = []
              ReadOnly = True
              ShowBands = False
              SortStyle = ssAutomatic
              SpinMax = 0
              SpinMin = 0
              SpinStep = 1
              Tag = 0
              Width = 75
            end
            item
              AutoMinSize = 0
              AutoMaxSize = 0
              Alignment = taCenter
              Borders = []
              BorderPen.Color = clSilver
              CheckFalse = 'N'
              CheckTrue = 'Y'
              Color = clWindow
              ColumnPopupType = cpFixedCellsRClick
              DropDownCount = 8
              EditLength = 0
              Editor = edNone
              FilterCaseSensitive = False
              Fixed = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              Header = 'Sab.'
              HeaderAlignment = taLeftJustify
              HeaderFont.Charset = DEFAULT_CHARSET
              HeaderFont.Color = clWindowText
              HeaderFont.Height = -11
              HeaderFont.Name = 'Tahoma'
              HeaderFont.Style = []
              MinSize = 0
              MaxSize = 0
              Name = 'D7'
              Password = False
              PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
              PrintColor = clWhite
              PrintFont.Charset = DEFAULT_CHARSET
              PrintFont.Color = clWindowText
              PrintFont.Height = -11
              PrintFont.Name = 'Tahoma'
              PrintFont.Style = []
              ReadOnly = True
              ShowBands = False
              SortStyle = ssAutomatic
              SpinMax = 0
              SpinMin = 0
              SpinStep = 1
              Tag = 0
              Width = 75
            end>
          ColWidths = (
            20
            75
            75
            75
            75
            75
            75
            75)
        end
      end
      object PanelInfoFiltro: TJvPanel
        Left = 0
        Top = 0
        Width = 576
        Height = 27
        Align = alTop
        ParentColor = True
        TabOrder = 1
        object LabelFiltros: TLabel
          Left = 6
          Top = 8
          Width = 33
          Height = 13
          Caption = 'Filtros:'
          Transparent = True
        end
      end
    end
  end
end
