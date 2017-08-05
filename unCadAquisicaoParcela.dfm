object fmCadAquisicaoParcela: TfmCadAquisicaoParcela
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Parcelamento'
  ClientHeight = 572
  ClientWidth = 804
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
    Top = 531
    Width = 804
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
    object ButtonFechar: TAdvGlowButton
      Left = 712
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
      TabOrder = 4
      TabStop = True
      OnClick = ButtonFecharClick
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
    object ButtonSalvar: TAdvGlowButton
      Left = 3
      Top = 8
      Width = 75
      Height = 25
      Hint = 'Salvar registro'
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
      OnClick = ButtonSalvarClick
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
    object ButtonExcluir: TAdvGlowButton
      Left = 84
      Top = 8
      Width = 75
      Height = 25
      Hint = 'Excluir o registro.'
      Caption = '&Excluir'
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
      OnClick = ButtonExcluirClick
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
    object ButtonRestaurar: TAdvGlowButton
      Left = 163
      Top = 8
      Width = 75
      Height = 25
      Hint = 'Restaurar os registros.'
      Caption = '&Restaurar'
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
      OnClick = ButtonRestaurarClick
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
    object ButtonRecalculaParcelas: TAdvGlowButton
      Left = 244
      Top = 8
      Width = 105
      Height = 25
      Hint = 'Recalcula todas as Parcelas que s'#227'o do Tipo Parcela.'
      Caption = 'Recalcular &parcelas'
      NotesFont.Charset = DEFAULT_CHARSET
      NotesFont.Color = clWindowText
      NotesFont.Height = -11
      NotesFont.Name = 'Tahoma'
      NotesFont.Style = []
      Spacing = 3
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      TabStop = True
      Visible = False
      OnClick = ButtonRecalculaParcelasClick
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
  end
  object PanelCentral: TAdvPanel
    Left = 0
    Top = 24
    Width = 804
    Height = 507
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
    object ColumnGridParcelas: TAdvColumnGrid
      Left = 0
      Top = 113
      Width = 804
      Height = 368
      Cursor = crHandPoint
      Align = alClient
      ColCount = 14
      Ctl3D = True
      DrawingStyle = gdsClassic
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSizing, goColSizing, goTabs, goRowSelect]
      ParentCtl3D = False
      ScrollBars = ssBoth
      TabOrder = 0
      GridLineColor = 15527152
      GridFixedLineColor = 13947601
      HoverRowCells = [hcNormal, hcSelected]
      OnClickCell = ColumnGridParcelasClickCell
      HintShowCells = True
      HTMLHint = True
      ActiveCellFont.Charset = DEFAULT_CHARSET
      ActiveCellFont.Color = clWindowText
      ActiveCellFont.Height = -11
      ActiveCellFont.Name = 'Tahoma'
      ActiveCellFont.Style = [fsBold]
      ActiveCellColor = 16575452
      ActiveCellColorTo = 16571329
      Bands.Active = True
      Bands.Print = True
      ColumnHeaders.Strings = (
        ''
        'Parcela'
        'Tipo'
        ''
        'Forma de pgto.'
        'Vencimento'
        'Vl. parcela'
        'Vl. desconto'
        'Vl. acr'#233'scimo'
        'Vl. total'
        'Pago'
        'Pago em'
        'Editar')
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
      Filter = <>
      FilterActive = True
      FilterDropDown.AutoSize = True
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
      FixedColWidth = 10
      FixedRowHeight = 22
      FixedFont.Charset = DEFAULT_CHARSET
      FixedFont.Color = clWindowText
      FixedFont.Height = -11
      FixedFont.Name = 'Tahoma'
      FixedFont.Style = [fsBold]
      FloatFormat = '%.2f'
      HoverButtons.Buttons = <>
      HoverButtons.Position = hbLeftFromColumnLeft
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
      SearchFooter.AutoSearch = False
      SearchFooter.Color = 16645370
      SearchFooter.ColorTo = 16247261
      SearchFooter.FindNextCaption = 'Encontrar &pr'#243'xima'
      SearchFooter.FindPrevCaption = 'Encontrar &anterior'
      SearchFooter.Font.Charset = DEFAULT_CHARSET
      SearchFooter.Font.Color = clWindowText
      SearchFooter.Font.Height = -11
      SearchFooter.Font.Name = 'Tahoma'
      SearchFooter.Font.Style = []
      SearchFooter.HighLightCaption = 'Highlight'
      SearchFooter.HintClose = 'Fechar'
      SearchFooter.HintFindNext = 'Encontrar pr'#243'xima ocorr'#234'ncia'
      SearchFooter.HintFindPrev = 'Encontrar ocorr'#234'ncia anterior'
      SearchFooter.HintHighlight = 'Marcar ocorr'#234'ncias'
      SearchFooter.MatchCaseCaption = 'Combinar'
      SortSettings.DefaultFormat = ssAutomatic
      SortSettings.Show = True
      SortSettings.HeaderColor = 16579058
      SortSettings.HeaderColorTo = 16579058
      SortSettings.HeaderMirrorColor = 16380385
      SortSettings.HeaderMirrorColorTo = 16182488
      Version = '3.1.3.6'
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
          Name = 'Fixed'
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
          Width = 10
        end
        item
          AutoMinSize = 0
          AutoMaxSize = 0
          Alignment = taRightJustify
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = '0'
          CheckTrue = '1'
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
          Header = 'Parcela'
          HeaderAlignment = taLeftJustify
          HeaderFont.Charset = DEFAULT_CHARSET
          HeaderFont.Color = clWindowText
          HeaderFont.Height = -11
          HeaderFont.Name = 'Tahoma'
          HeaderFont.Style = []
          MinSize = 0
          MaxSize = 0
          Name = 'NUPARCELA'
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
          Width = 50
        end
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
          Header = 'Tipo'
          HeaderAlignment = taLeftJustify
          HeaderFont.Charset = DEFAULT_CHARSET
          HeaderFont.Color = clWindowText
          HeaderFont.Height = -11
          HeaderFont.Name = 'Tahoma'
          HeaderFont.Style = []
          MinSize = 0
          MaxSize = 0
          Name = 'FLTIPOPARCELA'
          Password = False
          PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
          PrintColor = clWhite
          PrintFont.Charset = DEFAULT_CHARSET
          PrintFont.Color = clWindowText
          PrintFont.Height = -11
          PrintFont.Name = 'Tahoma'
          PrintFont.Style = []
          ReadOnly = False
          ShowBands = False
          SortStyle = ssAutomatic
          SpinMax = 0
          SpinMin = 0
          SpinStep = 1
          Tag = 0
          Width = 50
        end
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
          Name = 'CDFORMAPAGAMENTO'
          Password = False
          PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
          PrintColor = clWhite
          PrintFont.Charset = DEFAULT_CHARSET
          PrintFont.Color = clWindowText
          PrintFont.Height = -11
          PrintFont.Name = 'Tahoma'
          PrintFont.Style = []
          ReadOnly = False
          ShowBands = False
          SortStyle = ssAutomatic
          SpinMax = 0
          SpinMin = 0
          SpinStep = 1
          Tag = 0
          Width = 0
        end
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
          Header = 'Forma de pgto.'
          HeaderAlignment = taLeftJustify
          HeaderFont.Charset = DEFAULT_CHARSET
          HeaderFont.Color = clWindowText
          HeaderFont.Height = -11
          HeaderFont.Name = 'Tahoma'
          HeaderFont.Style = []
          MinSize = 0
          MaxSize = 0
          Name = 'NMFORMAPAGAMENTO'
          Password = False
          PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
          PrintColor = clWhite
          PrintFont.Charset = DEFAULT_CHARSET
          PrintFont.Color = clWindowText
          PrintFont.Height = -11
          PrintFont.Name = 'Tahoma'
          PrintFont.Style = []
          ReadOnly = False
          ShowBands = False
          SortStyle = ssAutomatic
          SpinMax = 0
          SpinMin = 0
          SpinStep = 1
          Tag = 0
          Width = 110
        end
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
          Header = 'Vencimento'
          HeaderAlignment = taLeftJustify
          HeaderFont.Charset = DEFAULT_CHARSET
          HeaderFont.Color = clWindowText
          HeaderFont.Height = -11
          HeaderFont.Name = 'Tahoma'
          HeaderFont.Style = []
          MinSize = 0
          MaxSize = 0
          Name = 'DTVENCIMENTO'
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
          Width = 70
        end
        item
          AutoMinSize = 0
          AutoMaxSize = 0
          Alignment = taRightJustify
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
          Header = 'Vl. parcela'
          HeaderAlignment = taLeftJustify
          HeaderFont.Charset = DEFAULT_CHARSET
          HeaderFont.Color = clWindowText
          HeaderFont.Height = -11
          HeaderFont.Name = 'Tahoma'
          HeaderFont.Style = []
          MinSize = 0
          MaxSize = 0
          Name = 'VLPARCELA'
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
          Width = 85
        end
        item
          AutoMinSize = 0
          AutoMaxSize = 0
          Alignment = taRightJustify
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
          FloatFormat = '%.2f'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Header = 'Vl. desconto'
          HeaderAlignment = taLeftJustify
          HeaderFont.Charset = DEFAULT_CHARSET
          HeaderFont.Color = clWindowText
          HeaderFont.Height = -11
          HeaderFont.Name = 'Tahoma'
          HeaderFont.Style = []
          MinSize = 0
          MaxSize = 0
          Name = 'VLDESCONTO'
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
          Width = 80
        end
        item
          AutoMinSize = 0
          AutoMaxSize = 0
          Alignment = taRightJustify
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
          FloatFormat = '%.2f'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Header = 'Vl. acr'#233'scimo'
          HeaderAlignment = taLeftJustify
          HeaderFont.Charset = DEFAULT_CHARSET
          HeaderFont.Color = clWindowText
          HeaderFont.Height = -11
          HeaderFont.Name = 'Tahoma'
          HeaderFont.Style = []
          MinSize = 0
          MaxSize = 0
          Name = 'VLACRESCIMO'
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
          Width = 80
        end
        item
          AutoMinSize = 0
          AutoMaxSize = 0
          Alignment = taRightJustify
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          ColumnPopupType = cpFixedCellsRClick
          DropDownCount = 8
          EditLength = 0
          Editor = edNormal
          FilterCaseSensitive = False
          Fixed = False
          FloatFormat = '%.2f'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Header = 'Vl. total'
          HeaderAlignment = taLeftJustify
          HeaderFont.Charset = DEFAULT_CHARSET
          HeaderFont.Color = clWindowText
          HeaderFont.Height = -11
          HeaderFont.Name = 'Tahoma'
          HeaderFont.Style = []
          MinSize = 0
          MaxSize = 0
          Name = 'VLTOTAL'
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
          Width = 100
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
          Editor = edNormal
          FilterCaseSensitive = False
          Fixed = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Header = 'Pago'
          HeaderAlignment = taLeftJustify
          HeaderFont.Charset = DEFAULT_CHARSET
          HeaderFont.Color = clWindowText
          HeaderFont.Height = -11
          HeaderFont.Name = 'Tahoma'
          HeaderFont.Style = []
          MinSize = 0
          MaxSize = 0
          Name = 'PAGO'
          Password = False
          PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
          PrintColor = clWhite
          PrintFont.Charset = DEFAULT_CHARSET
          PrintFont.Color = clWindowText
          PrintFont.Height = -11
          PrintFont.Name = 'Tahoma'
          PrintFont.Style = []
          ReadOnly = False
          ShowBands = False
          SortStyle = ssAutomatic
          SpinMax = 0
          SpinMin = 0
          SpinStep = 1
          Tag = 0
          Width = 30
        end
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
          Header = 'Pago em'
          HeaderAlignment = taLeftJustify
          HeaderFont.Charset = DEFAULT_CHARSET
          HeaderFont.Color = clWindowText
          HeaderFont.Height = -11
          HeaderFont.Name = 'Tahoma'
          HeaderFont.Style = []
          MinSize = 0
          MaxSize = 0
          Name = 'DTPAGAMENTO'
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
          Width = 70
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
          Editor = edNormal
          FilterCaseSensitive = False
          Fixed = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Header = 'Editar'
          HeaderAlignment = taLeftJustify
          HeaderFont.Charset = DEFAULT_CHARSET
          HeaderFont.Color = clWindowText
          HeaderFont.Height = -11
          HeaderFont.Name = 'Tahoma'
          HeaderFont.Style = []
          MinSize = 0
          MaxSize = 0
          Name = 'EDITAR'
          Password = False
          PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
          PrintColor = clWhite
          PrintFont.Charset = DEFAULT_CHARSET
          PrintFont.Color = clWindowText
          PrintFont.Height = -11
          PrintFont.Name = 'Tahoma'
          PrintFont.Style = []
          ReadOnly = False
          ShowBands = False
          SortStyle = ssAutomatic
          SpinMax = 0
          SpinMin = 0
          SpinStep = 1
          Tag = 0
          Width = 35
        end
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
          Editor = edNormal
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
          Name = 'FLOPCAO'
          Password = False
          PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
          PrintColor = clWhite
          PrintFont.Charset = DEFAULT_CHARSET
          PrintFont.Color = clWindowText
          PrintFont.Height = -11
          PrintFont.Name = 'Tahoma'
          PrintFont.Style = []
          ReadOnly = False
          ShowBands = False
          SortStyle = ssAutomatic
          SpinMax = 0
          SpinMin = 0
          SpinStep = 1
          Tag = 0
          Width = 0
        end>
      ColWidths = (
        10
        50
        50
        0
        110
        70
        85
        80
        80
        100
        30
        70
        35
        0)
    end
    object PanelParcela: TAdvPanel
      Left = 0
      Top = 0
      Width = 804
      Height = 113
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
      ExplicitTop = 1
      FullHeight = 120
      object LabelAcrescimo: TLabel
        Left = 346
        Top = 90
        Width = 66
        Height = 13
        Caption = 'Vl. acr'#233'scimo:'
        Transparent = True
      end
      object LabelDesconto: TLabel
        Left = 186
        Top = 90
        Width = 63
        Height = 13
        Caption = 'Vl. desconto:'
        Transparent = True
      end
      object LabelFormaPagamento: TLabel
        Left = 186
        Top = 40
        Width = 106
        Height = 13
        Caption = 'Forma de pagamento:'
        Transparent = True
      end
      object LabelPagoEm: TLabel
        Left = 198
        Top = 65
        Width = 51
        Height = 13
        Caption = 'Pago em*:'
        Transparent = True
        Visible = False
      end
      object LabelParcela: TLabel
        Left = 45
        Top = 13
        Width = 45
        Height = 13
        Caption = 'Parcela*:'
        Transparent = True
      end
      object LabelTaxaJuros: TLabel
        Left = 342
        Top = 65
        Width = 70
        Height = 13
        Caption = 'Taxa de juros:'
      end
      object LabelTipoParcela: TLabel
        Left = 7
        Top = 40
        Width = 83
        Height = 13
        Caption = 'Tipo de parcela*:'
        Transparent = True
      end
      object LabelValorExtra: TLabel
        Left = 498
        Top = 65
        Width = 45
        Height = 13
        Caption = 'Vl. extra:'
      end
      object LabelValorParcela: TLabel
        Left = 30
        Top = 90
        Width = 60
        Height = 13
        Caption = 'Vl. parcela*:'
        Transparent = True
      end
      object LabelValorTotal: TLabel
        Left = 494
        Top = 90
        Width = 47
        Height = 13
        Caption = 'Vl. total*:'
        Transparent = True
      end
      object LabelVencimento: TLabel
        Left = 25
        Top = 65
        Width = 65
        Height = 13
        Caption = 'Vencimento*:'
        Transparent = True
      end
      object ButtonAtualizarTudo: TAdvGlowButton
        Left = 671
        Top = 34
        Width = 23
        Height = 22
        Hint = 'Aplicar esta Forma de Pagamento a Todas as Parcelas.'
        ImageIndex = 29
        Images = fmPrincipal.ImageListBotoes
        NotesFont.Charset = DEFAULT_CHARSET
        NotesFont.Color = clWindowText
        NotesFont.Height = -11
        NotesFont.Name = 'Tahoma'
        NotesFont.Style = []
        Spacing = 1
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        TabStop = True
        OnClick = ButtonAtualizarTudoClick
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
      object ButtonCancelarEdicaoParcela: TAdvGlowButton
        Left = 725
        Top = 84
        Width = 75
        Height = 25
        Hint = 'Cancelar a Inclus'#227'o / Alte'#231#227'o da Parcela.'
        Caption = '&Cancelar'
        NotesFont.Charset = DEFAULT_CHARSET
        NotesFont.Color = clWindowText
        NotesFont.Height = -11
        NotesFont.Name = 'Tahoma'
        NotesFont.Style = []
        Spacing = 1
        ParentShowHint = False
        ShowHint = True
        TabOrder = 15
        TabStop = True
        OnClick = ButtonCancelarEdicaoParcelaClick
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
        Layout = blGlyphTop
      end
      object ButtonIncluirAlterarParcela: TAdvGlowButton
        Left = 646
        Top = 84
        Width = 75
        Height = 25
        Hint = 'Incluir / Alterar a Parcela.'
        Caption = '&Adicionar'
        NotesFont.Charset = DEFAULT_CHARSET
        NotesFont.Color = clWindowText
        NotesFont.Height = -11
        NotesFont.Name = 'Tahoma'
        NotesFont.Style = []
        Spacing = 1
        ParentShowHint = False
        ShowHint = True
        TabOrder = 14
        TabStop = True
        OnClick = ButtonIncluirAlterarParcelaClick
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
        Layout = blGlyphTop
      end
      object ComboBoxCadastroFLTIPOPARCELA: TAdvOfficeComboBox
        Left = 94
        Top = 35
        Width = 84
        Height = 21
        Hint = 'Tipo de Parcela do Parcelamento da Aquisi'#231#227'o.'
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
        Items.Strings = (
          ''
          'Entrada'
          'Parcela'
          'Refor'#231'o')
        ItemIndex = -1
        ItemHeight = 13
        TabOrder = 1
        ShowHint = True
        Style = csDropDownList
      end
      object ComboBoxCadastroNMFORMAPAGAMENTO: TAdvOfficeComboBox
        Left = 297
        Top = 35
        Width = 343
        Height = 21
        Hint = 'Forma de Pagamento da Parcela da Aquisi'#231#227'o.'
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
        TabOrder = 2
        ShowHint = True
        Style = csDropDownList
      end
      object DatePickerEditCadastroDTPAGAMENTO: TPlannerDatePicker
        Left = 253
        Top = 62
        Width = 84
        Height = 21
        Hint = 'Data em que a parcela foi paga.'
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
        TabOrder = 7
        Visible = False
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
        Calendar = cal48_.Owner
        HideCalendarAfterSelection = True
        object cal48_: TPlannerCalendar
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
          Day = 11
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
      object DatePickerEditCadastroDTVENCIMENTO: TPlannerDatePicker
        Left = 94
        Top = 62
        Width = 84
        Height = 21
        Hint = 'Data em vencer'#225' a parcela.'
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
        TabOrder = 6
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
        Calendar = cal48_.Owner
        HideCalendarAfterSelection = True
        object cal48_: TPlannerCalendar
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
          Day = 11
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
      object EditCadastroNUPARCELA: TAdvEdit
        Tag = 1
        Left = 94
        Top = 10
        Width = 44
        Height = 21
        Hint = 'N'#250'mero da parcela.'
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
        TabOrder = 0
        Visible = True
        Version = '3.3.2.4'
      end
      object EditCadastroVLACRESCIMO: TAdvMoneyEdit
        Tag = 3
        Left = 416
        Top = 87
        Width = 70
        Height = 21
        Hint = 'Valor do Acr'#233'scimo na Parcela (Caso pago com atraso).'
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
        ParentColor = True
        ParentShowHint = False
        ShowHint = True
        TabOrder = 12
        Text = '0,00'
        Visible = True
        OnExit = EditCadastroVLACRESCIMOExit
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
      object EditCadastroVLDESCONTO: TAdvMoneyEdit
        Tag = 3
        Left = 253
        Top = 87
        Width = 72
        Height = 21
        Hint = 'Valor do Desconto na Parcela.'
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
        ParentColor = True
        ParentShowHint = False
        ShowHint = True
        TabOrder = 11
        Text = '0,00'
        Visible = True
        OnExit = EditCadastroVLDESCONTOExit
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
      object EditCadastroVLPARCELA: TAdvMoneyEdit
        Tag = 3
        Left = 94
        Top = 87
        Width = 83
        Height = 21
        Hint = 'Valor Unit'#225'rio da Parcela.'
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
        ParentColor = True
        ParentShowHint = False
        ShowHint = True
        TabOrder = 10
        Text = '0,00'
        Visible = True
        OnExit = EditCadastroVLPARCELAExit
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
      object EditCadastroVLTAXAEXTRA: TAdvMoneyEdit
        Tag = 3
        Left = 547
        Top = 62
        Width = 94
        Height = 21
        Hint = 'Valor Extra a ser adicionado ao c'#225'lculo da Parcela.'
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
        ParentColor = True
        ParentShowHint = False
        ShowHint = True
        TabOrder = 9
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
      object EditCadastroVLTAXAJUROS: TAdvMoneyEdit
        Tag = 3
        Left = 416
        Top = 62
        Width = 70
        Height = 21
        Hint = 'Valor da Taxa de Juros a ser aplicado nas Parcelas da Aquisi'#231#227'o.'
        EditType = etFloat
        EmptyTextStyle = []
        DisabledColor = clWindow
        Precision = 2
        Suffix = '%'
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
        TabOrder = 8
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
      object EditCadastroVLTOTAL: TAdvMoneyEdit
        Tag = 3
        Left = 547
        Top = 87
        Width = 94
        Height = 21
        Hint = 'Valor Total da Parcela (Caso pago com atraso).'
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
        ParentColor = True
        ParentShowHint = False
        ShowHint = True
        TabOrder = 13
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
      object ButtonAtualizarFormaPagamento: TAdvGlowButton
        Left = 646
        Top = 34
        Width = 23
        Height = 22
        Hint = 'Atualizar a listagem das Formas de Pagamento.'
        ImageIndex = 0
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
        OnClick = ButtonAtualizarFormaPagamentoClick
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
      object ButtonNovoFormaPagamento: TAdvGlowButton
        Left = 696
        Top = 34
        Width = 23
        Height = 22
        Hint = 'Cadastrar Forma de Pagamento.'
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
        TabOrder = 5
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
    end
    object PanelSumarizacao: TAdvPanel
      Left = 0
      Top = 481
      Width = 804
      Height = 26
      Align = alBottom
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
      FullHeight = 26
      object PanelTotalRegistro: TAdvPanel
        Left = 0
        Top = 0
        Width = 161
        Height = 26
        Align = alLeft
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
        FullHeight = 24
        object LabelTotalRegistrosParcela: TLabel
          Left = 5
          Top = 5
          Width = 95
          Height = 13
          Caption = 'Total de parcelas: 0'
          Transparent = True
        end
      end
      object PanelValorTotalAquisicao: TAdvPanel
        Left = 604
        Top = 0
        Width = 200
        Height = 26
        Align = alRight
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
        FullHeight = 24
        object LabelValorTotalAquisicao: TLabel
          Left = 5
          Top = 5
          Width = 131
          Height = 13
          Caption = 'Valor da aquisi'#231#227'o: R$ 0,00'
          Transparent = True
        end
      end
      object PanelValorTotalParcela: TAdvPanel
        Left = 161
        Top = 0
        Width = 243
        Height = 26
        Align = alClient
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
        object LabelValorTotalParcela: TLabel
          Left = 5
          Top = 5
          Width = 132
          Height = 13
          Caption = 'Valor das parcelas: R$ 0,00'
          Transparent = True
        end
      end
      object PanelValorTotalParcelaCalculado: TAdvPanel
        Left = 404
        Top = 0
        Width = 200
        Height = 26
        Align = alRight
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
        FullHeight = 24
        object LabelValorTotalParcelaCalculado: TLabel
          Left = 5
          Top = 5
          Width = 94
          Height = 13
          Caption = 'Valor total: R$ 0,00'
          Transparent = True
        end
      end
    end
  end
  object PanelInfo: TAdvPanel
    Left = 0
    Top = 0
    Width = 804
    Height = 24
    Align = alTop
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
    Top = 208
  end
  object ImageList: TImageList
    Left = 752
    Top = 184
  end
end
