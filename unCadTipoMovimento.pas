unit unCadTipoMovimento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, Grids, AdvObj, BaseGrid, AdvGrid, AdvCGrid, AsgFindDialog, ComCtrls,
  Menus, UnAplExportaXLS, ImgList, ToolWin, MaskUtils, DBAdvGrid, ShellAPI,
  RpRender, RpRenderPDF, RpCon, RpConDS, RpBase, RpSystem, RpDefine, RpRave,
  AdvGlowButton, AdvPanel, AdvAppStyler, AdvEdit, AdvGroupBox, AdvOfficeButtons,
  AdvToolBar, AdvOfficePager, tmsAdvGridExcel, AdvMenus, unTipoMovimento;

type
  TfmCadTipoMovimento = class(TForm)
    QueryGeral: TZQuery;
    GridFindDialogColumnGrid: TAdvGridFindDialog;
    DBAdvGridGeral: TDBAdvGrid;
    DataSource: TDataSource;
    LabelCodigo: TLabel;
    LabelTipoMovimento: TLabel;
    SaveDialog: TSaveDialog;
    ProjectRelTipoMovimento: TRvProject;
    DataSetConnectionRelTipoMovimento: TRvDataSetConnection;
    QueryRelTipoMovimento: TZQuery;
    PanelBotoes: TAdvPanel;
    BitBtnFechar: TAdvGlowButton;
    BitBtnSalvar: TAdvGlowButton;
    BitBtnNovo: TAdvGlowButton;
    BitBtnExcluir: TAdvGlowButton;
    BitBtnRestaurar: TAdvGlowButton;
    FormStyler: TAdvFormStyler;
    EditCadastroCDTIPOMOVIMENTO: TAdvEdit;
    EditCadastroDETIPOMOVIMENTO: TAdvEdit;
    RadioGroupCadastroFLTIPOMOVIMENTO: TAdvOfficeRadioGroup;
    GroupBoxOpcoes: TAdvGroupBox;
    CheckBoxCadastroFLPADRAO: TAdvOfficeCheckBox;
    CheckBoxCadastroFLATIVO: TAdvOfficeCheckBox;
    OfficePagerCentral: TAdvOfficePager;
    OfficePageConsulta: TAdvOfficePage;
    PanelTabela: TAdvPanel;
    DockPaneOpcoes: TAdvDockPanel;
    ToolBarOpcoes: TAdvToolBar;
    ToolBarSeparator1: TAdvToolBarSeparator;
    ButtonAbrirJanelaPesquisa: TAdvGlowButton;
    ButtonOrdenarRegistros: TAdvGlowButton;
    ButtonAtualizarTabela: TAdvGlowButton;
    ButtonImprimirRelatorio: TAdvGlowButton;
    ButtonExportarPlanilha: TAdvGlowButton;
    ButtonExportarHTML: TAdvGlowButton;
    PanelSumarizacao: TAdvPanel;
    PanelPreenchimento: TAdvPanel;
    PanelTotalRegistros: TAdvPanel;
    LabelTotalRegistros: TLabel;
    OfficePageCadastro: TAdvOfficePage;
    PanelCadastro: TAdvPanel;
    PanelCampos: TAdvPanel;
    PanelInformacoes: TAdvPanel;
    LabelInformacoes: TLabel;
    PanelTitulos: TAdvPanel;
    PopupMenuGrid: TAdvPopupMenu;
    MenuItemEditarRegistro: TMenuItem;
    MenuItemAtualizarTabela: TMenuItem;
    MenuItemEspaco1: TMenuItem;
    MenuItemVisualizarFiltro: TMenuItem;
    AdvGridExcelIO: TAdvGridExcelIO;
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtnFecharClick(Sender: TObject);
    procedure BitBtnNovoClick(Sender: TObject);
    procedure BitBtnSalvarClick(Sender: TObject);
    procedure BitBtnExcluirClick(Sender: TObject);
    procedure MenuItemEditarRegistroClick(Sender: TObject);
    procedure MenuItemAtualizarTabelaClick(Sender: TObject);
    procedure MenuItemVisualizarFiltroClick(Sender: TObject);
    procedure ButtonExportarPlanilhaClick(Sender: TObject);
    procedure ButtonExportarHTMLClick(Sender: TObject);
    procedure DBAdvGridGeralFilterSelect(Sender: TObject; Column,
      ItemIndex: Integer; FriendlyName: string; var FilterCondition: string);
    procedure BitBtnRestaurarClick(Sender: TObject);
    procedure DBAdvGridGeralDblClickCell(Sender: TObject; ARow, ACol: Integer);
    procedure ButtonImprimirRelatorioClick(Sender: TObject);
    procedure ButtonOrdenarRegistrosClick(Sender: TObject);
    procedure OfficePageCadastroShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    pId: TGUID;
    pOpcao: Char;
    pCodigo, pEspacamentoInicial, pEspacamentoFinal, pEspacamentoEntre: integer;
    pOrdenacao, pNaturezaPadrao: string;
    pTipoMovimento: TTipoMovimento;
    procedure editaColunaGrid(prmIndice: integer; prmNome, prmCabecalho: string;
      prmEditor: TEditorType; prmAlinhamento: TAlignment; prmTamanho: integer;
      prmSomenteLeitura: boolean);
    procedure desabilitaCampos;
    procedure habilitaCampos;
    procedure desabilitaBotoes;
    procedure habilitaBotoes;
    procedure novoCadastro;
    procedure editaCadastro;
    procedure insereCadastro;
    procedure atualizaCadastro;
    function validaExclusao: boolean;
    function validaExistePadrao: boolean;
    procedure carregaImagensBotoes;
    property EspacamentoInicial: integer read pEspacamentoInicial write pEspacamentoInicial;
    property EspacamentoEntre: integer read pEspacamentoEntre write pEspacamentoEntre;
    property EspacamentoFinal: integer read pEspacamentoFinal write pEspacamentoFinal;
  public
    { Public declarations }
    property Opcao: char read pOpcao write pOpcao;
    property Codigo: integer read pCodigo write pCodigo;
    property NaturezaPadrao: string read pNaturezaPadrao write pNaturezaPadrao;
    property Ordenacao: string read pOrdenacao write pOrdenacao;
  end;

var
  fmCadTipoMovimento: TfmCadTipoMovimento;

implementation

uses unPrincipal, unConFiltroPadrao, undmPrincipal, unAplOrdenaGrid,
  undmEstilo;

{$R *.dfm}

procedure TfmCadTipoMovimento.atualizaCadastro;
var
  vRetorno: integer;
begin
  try
    pTipoMovimento.Codigo := Codigo;
    pTipoMovimento.Nome := EditCadastroDETIPOMOVIMENTO.Text;
    case RadioGroupCadastroFLTIPOMOVIMENTO.ItemIndex of
      0: pTipoMovimento.Natureza := 'A';
      1: pTipoMovimento.Natureza := 'D';
      2: pTipoMovimento.Natureza := 'I';
      else pTipoMovimento.Natureza := 'R';
    end;
    if CheckBoxCadastroFLPADRAO.Checked then
      pTipoMovimento.Padrao := 'S'
    else
      pTipoMovimento.Padrao := 'N';
    if CheckBoxCadastroFLATIVO.Checked then
      pTipoMovimento.Ativo := 'S'
    else
      pTipoMovimento.Ativo := 'N';
    // Se marcou como padrão, então valida se não há outro marcado como padrão.
    if pTipoMovimento.Padrao = 'S' then
      if validaExistePadrao then
      begin
        fmPrincipal.apresentaResultadoCadastro('Já existe outro tipo de movimento padrão para esta natureza.');
        fmPrincipal.pLogSistema.Warn('Não foi possível atualizar o cadastro, pois já existe outro tipo de movimento padrão para esta natureza.');
        Exit;
      end;

    vRetorno := pTipoMovimento.atualiza;

    if vRetorno <> 0 then
      fmPrincipal.apresentaResultadoCadastro('Cadastro atualizado com sucesso.')
    else
      fmPrincipal.apresentaResultadoCadastro('Não foi possível atualizar o cadastro.');
  except
    on E: exception do
      raise;
  end;
end;

procedure TfmCadTipoMovimento.BitBtnRestaurarClick(Sender: TObject);
begin
  desabilitaBotoes;
  novoCadastro;
  if Opcao = 'I' then
    BitBtnNovoClick(Sender)
  else
  begin
    editaCadastro;
    habilitaBotoes;
  end;
end;

procedure TfmCadTipoMovimento.BitBtnExcluirClick(Sender: TObject);
var
  vRetorno: integer;
begin
  // Presente recebido é um tipo de movimento protegido.
  if (RadioGroupCadastroFLTIPOMOVIMENTO.ItemIndex = 0) and
     (AnsiCompareText(Trim(EditCadastroDETIPOMOVIMENTO.Text), cTipoMovimentoPresente) = 0) then
  begin
    MessageBox(Handle,
               PWideChar('O tipo de movimento de aquisição com a descrição "Presente Recebido" é protegido de exclusão.'),
               cTituloMensagemInformacao,
               MB_OK or MB_ICONINFORMATION);
    Exit;
  end;

  // Valida se realmente o usuário quer realizar a exclusão.
  if MessageBox(fmPrincipal.Handle,
                PWideChar('Confirma a exclusão do tipo de movimento?'),
                cTituloMensagemConfirmacao,
                MB_YESNO or MB_ICONQUESTION or MB_DEFBUTTON2) = IDNO then
    Exit;
  // Valida se é possível realizar a exclusão.
  if not validaExclusao then
    Exit;

  desabilitaBotoes;
  try
    pTipoMovimento.Codigo := Codigo;
    vRetorno := pTipoMovimento.exclui;

    BitBtnNovoClick(Sender);

    if vRetorno <> 0 then
      fmPrincipal.apresentaResultadoCadastro('Cadastro excluído com sucesso.')
    else
      fmPrincipal.apresentaResultadoCadastro('Não foi possível excluir o cadastro.');

    // Atualiza a Grid.
    MenuItemAtualizarTabelaClick(Sender);
  except
    on E: exception do
    begin
      fmPrincipal.apresentaResultadoCadastro(E.Message);
      fmPrincipal.manipulaExcecoes(Sender,E);
    end;
  end;
end;

procedure TfmCadTipoMovimento.BitBtnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfmCadTipoMovimento.insereCadastro;
begin
  try
    pTipoMovimento.Nome := EditCadastroDETIPOMOVIMENTO.Text;
    case RadioGroupCadastroFLTIPOMOVIMENTO.ItemIndex of
      0: pTipoMovimento.Natureza := 'A';
      1: pTipoMovimento.Natureza := 'D';
      2: pTipoMovimento.Natureza := 'I';
      else pTipoMovimento.Natureza := 'R';
    end;
    if CheckBoxCadastroFLPADRAO.Checked then
      pTipoMovimento.Padrao := 'S'
    else
      pTipoMovimento.Padrao := 'N';
    if CheckBoxCadastroFLATIVO.Checked then
      pTipoMovimento.Ativo := 'S'
    else
      pTipoMovimento.Ativo := 'N';
    // Se marcou como padrão, então valida se não há outro marcado como padrão.
    if pTipoMovimento.Padrao = 'S' then
      if validaExistePadrao then
      begin
        fmPrincipal.apresentaResultadoCadastro('Já existe outro tipo de movimento padrão para esta natureza.');
        fmPrincipal.pLogSistema.Warn('Não foi possível incluir o cadastro, pois já existe outro tipo de movimento padrão para esta natureza.');
        Exit;
      end;

    Codigo := pTipoMovimento.insere;

    if Codigo <> 0 then
      fmPrincipal.apresentaResultadoCadastro('Cadastro incluído com sucesso.')
    else
      fmPrincipal.apresentaResultadoCadastro('Não foi possível incluir o cadastro.');

    EditCadastroCDTIPOMOVIMENTO.Text := IntToStr(Codigo);
  except
    on E: exception do
      raise;
  end;
end;

procedure TfmCadTipoMovimento.BitBtnNovoClick(Sender: TObject);
begin
  pOpcao := 'I';
  habilitaCampos;
  desabilitaBotoes;
  novoCadastro;
  BitBtnSalvar.Enabled := true;
  BitBtnRestaurar.Enabled := true;
end;

procedure TfmCadTipoMovimento.BitBtnSalvarClick(Sender: TObject);
var
  vMensagem: string;
begin
  desabilitaBotoes;

  // Validações.
  vMensagem := EmptyStr;
  if AnsiCompareText(EditCadastroDETIPOMOVIMENTO.Text,EmptyStr) = 0 then
    vMensagem := vMensagem + #13#10'- O campo Tipo de Movimento é requerido.';

  if vMensagem <> EmptyStr then
  begin
    BitBtnSalvar.Enabled := true;
    if Opcao = 'A' then
      BitBtnExcluir.Enabled := true;
    BitBtnRestaurar.Enabled := true;
    MessageBox(fmPrincipal.Handle,
               PWideChar('O cadastro não poderá ser executado devido as seguintes pendências:' + vMensagem),
               cTituloMensagemAlerta,
               MB_OK or MB_ICONWARNING);
    Exit;
  end;
  // Fim Validações.

  try
    if Opcao = 'I' then
      insereCadastro
    else
      if Opcao = 'A' then
        atualizaCadastro;

    // Se não foi chamado pelo formPrincipal, a Tag será setada para 1, para que
    // a tela seja fechada automaticamente. Este é padrão das telas que são abertas
    // via cadastro e não via form principal.
    if Tag = 1 then
      BitBtnFecharClick(Sender);

    // Atualiza a Grid.
    MenuItemAtualizarTabelaClick(Sender);

    // Edita o cadastro realizado.
    editaCadastro;
    habilitaBotoes;
    Opcao := 'A';
    if EditCadastroDETIPOMOVIMENTO.Enabled = true then
      ActiveControl := EditCadastroDETIPOMOVIMENTO;
  except
    on E: Exception do
    begin
      fmPrincipal.apresentaResultadoCadastro(E.Message);
      fmPrincipal.manipulaExcecoes(Sender,E);
    end;
  end;
end;

procedure TfmCadTipoMovimento.DBAdvGridGeralDblClickCell(Sender: TObject; ARow,
  ACol: Integer);
begin
  if ARow > 0 then
    MenuItemEditarRegistroClick(MenuItemEditarRegistro);
end;

procedure TfmCadTipoMovimento.DBAdvGridGeralFilterSelect(Sender: TObject; Column,
  ItemIndex: Integer; FriendlyName: string; var FilterCondition: string);
begin
  case ItemIndex of
    0: FilterCondition := EmptyStr;
    1: FilterCondition := 'S';
    2: FilterCondition := 'N';
  end;

  DBAdvGridGeral.Cells[Column,0] := FriendlyName;
end;

procedure TfmCadTipoMovimento.desabilitaBotoes;
begin
  BitBtnSalvar.Enabled := false;
  BitBtnExcluir.Enabled := false;
  BitBtnRestaurar.Enabled := false;
  BitBtnNovo.Enabled := false;
end;

procedure TfmCadTipoMovimento.desabilitaCampos;
begin
  EditCadastroDETIPOMOVIMENTO.Enabled := false;
  RadioGroupCadastroFLTIPOMOVIMENTO.Enabled := false;
  CheckBoxCadastroFLPADRAO.Enabled := false;
  CheckBoxCadastroFLATIVO.Enabled := false;
end;

procedure TfmCadTipoMovimento.editaCadastro;
var
  vQuery: TZQuery;
begin
  novoCadastro;

  try
    try
      vQuery := pTipoMovimento.lista;
      with vQuery do
      begin
        // Consulta o cadastro do Tipo de Movimento.
        SQL.Add('WHERE cdtipomovimento = :CURRENT_CDTIPOMOVIMENTO');
        Params.ParamByName('CURRENT_CDTIPOMOVIMENTO').AsInteger := Codigo;
        dmPrincipal.executaConsulta(vQuery);

        if not Eof then
        begin
          EditCadastroCDTIPOMOVIMENTO.Text := IntToStr(Codigo);
          EditCadastroDETIPOMOVIMENTO.Text := Fields.FieldByName('DETIPOMOVIMENTO').AsString;
          if Fields.FieldByName('FLTIPOMOVIMENTO').AsString = 'A' then
            RadioGroupCadastroFLTIPOMOVIMENTO.ItemIndex := 0
          else
            if Fields.FieldByName('FLTIPOMOVIMENTO').AsString = 'D' then
              RadioGroupCadastroFLTIPOMOVIMENTO.ItemIndex := 1
            else
              if Fields.FieldByName('FLTIPOMOVIMENTO').AsString = 'I' then
                RadioGroupCadastroFLTIPOMOVIMENTO.ItemIndex := 2
              else
                RadioGroupCadastroFLTIPOMOVIMENTO.ItemIndex := 3;
          if Fields.FieldByName('FLPADRAO').AsString = 'S' then
            CheckBoxCadastroFLPADRAO.Checked := true
          else
            CheckBoxCadastroFLPADRAO.Checked := false;
          if Fields.FieldByName('FLATIVO').AsString = 'S' then
            CheckBoxCadastroFLATIVO.Checked := true
          else
            CheckBoxCadastroFLATIVO.Checked := false;
        end
        else
          raise exception.Create('O cadastro do Tipo de Movimento não foi encontrado.');
      end;
    finally
      vQuery.Active := false;
      FreeAndNil(vQuery);
    end;
  except
    on E: exception do
      raise;
  end;
end;

procedure TfmCadTipoMovimento.editaColunaGrid(prmIndice: integer; prmNome,
  prmCabecalho: string; prmEditor: TEditorType; prmAlinhamento: TAlignment;
  prmTamanho: integer; prmSomenteLeitura: boolean);
begin
  with DBAdvGridGeral do
  begin
    with Columns.Items[prmIndice] do
    begin
      Columns[prmIndice].Name := prmNome;
      Columns[prmIndice].Header := prmCabecalho;
      Columns[prmIndice].Editor := prmEditor;
      Columns[prmIndice].Width := prmTamanho;
      if prmEditor in [edNumeric,edPositiveNumeric,edFloat] then
        Columns[prmIndice].Alignment := taRightJustify
      else
        if prmEditor = edCheckBox then
        begin
          Columns[prmIndice].Alignment := Classes.taCenter;
          Columns[prmIndice].CheckBoxField := true;
          Columns[prmIndice].CheckTrue := 'S';
          Columns[prmIndice].CheckFalse := 'N';
        end
        else
          Columns[prmIndice].Alignment := prmAlinhamento;
      Columns[prmIndice].ReadOnly := prmSomenteLeitura;
    end;
  end;
end;

procedure TfmCadTipoMovimento.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  QueryGeral.Close;

  Action := caFree;
end;

procedure TfmCadTipoMovimento.FormCreate(Sender: TObject);
var
  i: integer;
begin
  try
    CreateGUID(pId);

    Color := Self.Color;
    FormStyler.AutoThemeAdapt := false;

    // Seta a opção padrão, que é inclusão.
    if Opcao <> 'A' then
      Opcao := 'I';

    OfficePagerCentral.ActivePageIndex := 1;

    pTipoMovimento := TTipoMovimento.Create;

    Ordenacao := '|"Tipo de movimento":"S":"Asc."|;|"Natureza":"S":"Asc."|;|"Padrão":"S":"Asc."|;|"Ativo":"S":"Asc."|';

    // Monta a consulta que carregará os dados da Grid.
    with QueryGeral do
    begin
      SQL := pTipoMovimento.visao.SQL;
      SQL.Add('ORDER BY 2,3,4');
    end;

    // Configura a Grid.
    with DBAdvGridGeral do
    begin
      DrawingStyle := gdsThemed;
      AutoThemeAdapt := false;
      for i := 0 to ColCount -1 do
        Columns[i].ShowBands := true;
      Bands.Active := true;
    end;

    RadioGroupCadastroFLTIPOMOVIMENTO.Themed := true;
    for i := Self.ComponentCount -1 downto 0 do
      if (Self.Components[i] is TAdvOfficeCheckBox) then
        (Self.Components[i] as TAdvOfficeCheckBox).Themed := true;

    MenuItemAtualizarTabelaClick(Sender);

    carregaImagensBotoes;

    OfficePagerCentral.Images := fmPrincipal.ImageListE;
    OfficePagerCentral.DisabledImages := fmPrincipal.ImageListD;
    OfficePageConsulta.ImageIndex := 2;
    OfficePageCadastro.ImageIndex := 1;

    PopupMenuGrid.Images := fmPrincipal.ImageListPopupMenuE;
    PopupMenuGrid.DisabledImages := fmPrincipal.ImageListPopupMenuD;
    MenuItemEditarRegistro.ImageIndex := 3;
    MenuItemAtualizarTabela.ImageIndex := 4;
    MenuItemVisualizarFiltro.ImageIndex := 5;

    novoCadastro;

    FormResize(Sender);
  except
    on E: Exception do
    begin
      fmPrincipal.manipulaExcecoes(Sender,E);
      Close;
    end;
  end;
end;

procedure TfmCadTipoMovimento.FormDestroy(Sender: TObject);
begin
  FreeAndNil(pTipoMovimento);
end;

procedure TfmCadTipoMovimento.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Exit;
end;

procedure TfmCadTipoMovimento.FormResize(Sender: TObject);
begin
  EspacamentoInicial := fmPrincipal.EspacamentoInicialBotao;
  EspacamentoFinal := fmPrincipal.EspacamentoFinalBotao;
  EspacamentoEntre := fmPrincipal.EspacamentoEntreBotoes;

  BitBtnFechar.Left := PanelBotoes.Width - BitBtnFechar.Width - EspacamentoFinal;
  BitBtnNovo.Left := BitBtnFechar.Left - BitBtnNovo.Width - EspacamentoEntre;
  BitBtnRestaurar.Left := BitBtnNovo.Left - BitBtnRestaurar.Width - EspacamentoEntre;
  BitBtnExcluir.Left := BitBtnRestaurar.Left - BitBtnExcluir.Width - EspacamentoEntre;
  BitBtnSalvar.Left := BitBtnExcluir.Left - BitBtnSalvar.Width - EspacamentoEntre;
end;

procedure TfmCadTipoMovimento.FormShow(Sender: TObject);
begin
  if NaturezaPadrao <> EmptyStr then
  begin
    RadioGroupCadastroFLTIPOMOVIMENTO.Enabled := false;
    case NaturezaPadrao[1] of
      'A': RadioGroupCadastroFLTIPOMOVIMENTO.ItemIndex := 0;
      'D': RadioGroupCadastroFLTIPOMOVIMENTO.ItemIndex := 1;
      'I': RadioGroupCadastroFLTIPOMOVIMENTO.ItemIndex := 2;
      else RadioGroupCadastroFLTIPOMOVIMENTO.ItemIndex := 3;
    end;
  end;
end;

procedure TfmCadTipoMovimento.habilitaBotoes;
begin
  BitBtnSalvar.Enabled := true;
  BitBtnExcluir.Enabled := true;
  BitBtnRestaurar.Enabled := true;
  BitBtnNovo.Enabled := true;
end;

procedure TfmCadTipoMovimento.habilitaCampos;
begin
  EditCadastroDETIPOMOVIMENTO.Enabled := true;
  RadioGroupCadastroFLTIPOMOVIMENTO.Enabled := true;
  CheckBoxCadastroFLPADRAO.Enabled := true;
  CheckBoxCadastroFLATIVO.Enabled := true;
end;

procedure TfmCadTipoMovimento.MenuItemAtualizarTabelaClick(Sender: TObject);
var
  vOrdenacao: string;
begin
  try
    try
      Screen.Cursor := crSQLWait;

      vOrdenacao := fmPrincipal.fnGeral.obtemOrdenacaoFormatada(Ordenacao);
      if vOrdenacao <> EmptyStr then
        QueryGeral.SQL.Strings[QueryGeral.SQL.Count-1] := vOrdenacao;
      dmPrincipal.executaConsulta(QueryGeral);

      // Configura a Grid.
      editaColunaGrid(1,'CDTIPOMOVIMENTO','Código',edNone,Classes.taRightJustify,0,true);
      editaColunaGrid(2,'DETIPOMOVIMENTO','Tipo de movimento',edNone,Classes.taLeftJustify,350,true);
      editaColunaGrid(3,'FLTIPOMOVIMENTO','Natureza',edNone,Classes.taLeftJustify,100,true);
      editaColunaGrid(4,'FLPADRAO','Padrão',edCheckBox,Classes.taCenter,40,true);
      editaColunaGrid(5,'FLATIVO','Ativo',edCheckBox,Classes.taCenter,40,true);
      DBAdvGridGeral.HideColumn(1);
      DBAdvGridGeral.AutoSizeColumns(true);

      LabelTotalRegistros.Caption := 'Total de registros: ' + IntToStr(QueryGeral.RecordCount);
    except
      on E: Exception do
        fmPrincipal.manipulaExcecoes(Sender,E);
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfmCadTipoMovimento.MenuItemEditarRegistroClick(Sender: TObject);
begin
  Opcao := 'A';
  with DBAdvGridGeral do
  begin
    Codigo := ColumnByName['CDTIPOMOVIMENTO'].Ints[Row];

    editaCadastro;
    habilitaBotoes;

    if (RadioGroupCadastroFLTIPOMOVIMENTO.ItemIndex = 0) and
       (AnsiCompareText(ColumnByName['DETIPOMOVIMENTO'].Rows[Row], cTipoMovimentoPresente) = 0) then
    begin
      desabilitaBotoes;
      desabilitaCampos;
      BitBtnNovo.Enabled := true;
    end
    else
      habilitaCampos;
  end;

  if EditCadastroDETIPOMOVIMENTO.Enabled = true then
    ActiveControl := EditCadastroDETIPOMOVIMENTO;
end;

procedure TfmCadTipoMovimento.MenuItemVisualizarFiltroClick(Sender: TObject);
begin
  GridFindDialogColumnGrid.Execute;
end;

procedure TfmCadTipoMovimento.novoCadastro;
begin
  OfficePagerCentral.ActivePageIndex := 1;

  EditCadastroCDTIPOMOVIMENTO.Clear;
  EditCadastroDETIPOMOVIMENTO.Clear;
  RadioGroupCadastroFLTIPOMOVIMENTO.ItemIndex := 0;
  CheckBoxCadastroFLPADRAO.Checked := false;
  CheckBoxCadastroFLATIVO.Checked := true;

  if EditCadastroDETIPOMOVIMENTO.Enabled = true then
    ActiveControl := EditCadastroDETIPOMOVIMENTO;
end;

procedure TfmCadTipoMovimento.OfficePageCadastroShow(Sender: TObject);
begin
  if EditCadastroDETIPOMOVIMENTO.Enabled = true then
    ActiveControl := EditCadastroDETIPOMOVIMENTO;
end;

procedure TfmCadTipoMovimento.ButtonExportarHTMLClick(Sender: TObject);
begin
  with SaveDialog do
  begin
    DefaultExt := '*.htm*';
    InitialDir := fmPrincipal.LocalAplicacao;
    Filter := 'Arquivos HTML|*.html';
    FilterIndex := 0;
    if Execute then
    begin
      DBAdvGridGeral.SaveToHTML(FileName,false);
      if FileExists(FileName) then
        ShellExecute(Handle,PChar('Open'),PChar(FileName),nil,nil,SW_SHOWNORMAL);
    end;
  end;
end;

procedure TfmCadTipoMovimento.ButtonExportarPlanilhaClick(Sender: TObject);
begin
  with SaveDialog do
  begin
    DefaultExt := '*.xls*';
    InitialDir := fmPrincipal.LocalAplicacao;
    Filter := 'Arquivos XLS|*.xls*';
    FilterIndex := 0;
    if Execute then
    begin
      if fmPrincipal.ExisteMSOffice = true then
        AdvGridExcelIO.XLSExport(FileName)
      else
        UnAplExportaXLS.StringGridToXLS(DBAdvGridGeral,FileName);
      if FileExists(FileName) then
        ShellExecute(Handle,PChar('Open'),PChar(FileName),nil,nil,SW_SHOWNORMAL);
    end;
  end;
end;

procedure TfmCadTipoMovimento.ButtonImprimirRelatorioClick(Sender: TObject);
begin
  try
    QueryRelTipoMovimento.SQL := pTipoMovimento.relatorio.SQL;
    dmPrincipal.executaConsulta(QueryRelTipoMovimento);
    with fmPrincipal.SystemRelatorio do
    begin
      DefaultDest := rdPreview;
      SystemSetups := SystemSetups - [ssAllowSetup];
      DoNativeOutput := false;
    end;
    with ProjectRelTipoMovimento do
    begin
      Engine := fmPrincipal.SystemRelatorio;
      SetParam('LoginUsuario',fmPrincipal.LoginUsuarioLogado);
      Execute;
    end;
  except
    on E: Exception do
      fmPrincipal.manipulaExcecoes(Sender,E);
  end;
end;

procedure TfmCadTipoMovimento.ButtonOrdenarRegistrosClick(Sender: TObject);
begin
  fmAplOrdenaGrid := TfmAplOrdenaGrid.Create(Application);
  with fmAplOrdenaGrid do
  begin
    Campos := Ordenacao;
    ShowModal;
    Ordenacao := CamposRetorno;
  end;
  MenuItemAtualizarTabelaClick(Sender);
end;

procedure TfmCadTipoMovimento.carregaImagensBotoes;
begin
  ButtonAbrirJanelaPesquisa.Picture.LoadFromFile(fmPrincipal.LocalIcones + 'search-e-16.png');
  ButtonAbrirJanelaPesquisa.HotPicture.LoadFromFile(fmPrincipal.LocalIcones + 'search-h-16.png');
  ButtonAbrirJanelaPesquisa.DisabledPicture.LoadFromFile(fmPrincipal.LocalIcones + 'search-d-16.png');
  ButtonOrdenarRegistros.Picture.LoadFromFile(fmPrincipal.LocalIcones + 'generic-sorting-e-16.png');
  ButtonOrdenarRegistros.HotPicture.LoadFromFile(fmPrincipal.LocalIcones + 'generic-sorting-h-16.png');
  ButtonOrdenarRegistros.DisabledPicture.LoadFromFile(fmPrincipal.LocalIcones + 'generic-sorting-d-16.png');
  ButtonAtualizarTabela.Picture.LoadFromFile(fmPrincipal.LocalIcones + 'refresh-e-16.png');
  ButtonAtualizarTabela.HotPicture.LoadFromFile(fmPrincipal.LocalIcones + 'refresh-h-16.png');
  ButtonAtualizarTabela.DisabledPicture.LoadFromFile(fmPrincipal.LocalIcones + 'refresh-d-16.png');
  ButtonImprimirRelatorio.Picture.LoadFromFile(fmPrincipal.LocalIcones + 'report-e-16.png');
  ButtonImprimirRelatorio.HotPicture.LoadFromFile(fmPrincipal.LocalIcones + 'report-h-16.png');
  ButtonImprimirRelatorio.DisabledPicture.LoadFromFile(fmPrincipal.LocalIcones + 'report-d-16.png');
  ButtonExportarPlanilha.Picture.LoadFromFile(fmPrincipal.LocalIcones + 'excel-e-16.png');
  ButtonExportarPlanilha.HotPicture.LoadFromFile(fmPrincipal.LocalIcones + 'excel-h-16.png');
  ButtonExportarPlanilha.DisabledPicture.LoadFromFile(fmPrincipal.LocalIcones + 'excel-d-16.png');
  ButtonExportarHTML.Picture.LoadFromFile(fmPrincipal.LocalIcones + 'html-e-16.png');
  ButtonExportarHTML.HotPicture.LoadFromFile(fmPrincipal.LocalIcones + 'html-h-16.png');
  ButtonExportarHTML.DisabledPicture.LoadFromFile(fmPrincipal.LocalIcones + 'html-d-16.png');
end;

function TfmCadTipoMovimento.validaExclusao: boolean;
var
  vMensagem: string;
begin
  vMensagem := EmptyStr;

  try
    pTipoMovimento.Codigo := Codigo;
    if pTipoMovimento.existeDependencia then
      vMensagem := '- Existem movimentos relacionados a este tipo de movimento.';

    if vMensagem = EmptyStr then
      Result := true
    else
    begin
      Result := false;
      MessageBox(fmPrincipal.Handle,
                 PWideChar('O cadastro não poderá ser excluído devido as seguintes dependências:'#13#10+vMensagem),
                 cTituloMensagemAlerta,
                 MB_OK or MB_ICONWARNING);
    end;
  except
    on E: exception do
      raise;
  end;
end;

function TfmCadTipoMovimento.validaExistePadrao: boolean;
var
  vflTipoMovimento: string;
  vQuery: TZQuery;
begin
  try
    try
      case RadioGroupCadastroFLTIPOMOVIMENTO.ItemIndex of
        0: vflTipoMovimento := 'A';
        1: vflTipoMovimento := 'D';
        2: vflTipoMovimento := 'I';
        else vflTipoMovimento := 'R';
      end;

      vQuery := TZQuery.Create(Self);
      with vQuery do
      begin
        // Consulta o cadastro do Tipo de Movimento, verificando se existe um Padrão.
        SQL.Text := 'SELECT COUNT(cdtipomovimento) AS NR';
        SQL.Add('FROM ' + cSchema + '.tipomovimento');
        SQL.Add('WHERE flpadrao = ''S''');
        SQL.Add('  AND fltipomovimento = ' + QuotedStr(vflTipoMovimento));
        if Opcao = 'A' then
        begin
          SQL.Add('  AND cdtipomovimento <> :CDTIPOMOVIMENTO');
          Params.ParamByName('CDTIPOMOVIMENTO').AsInteger := Codigo;
        end;
        dmPrincipal.executaConsulta(vQuery);

        Result := (Fields.Fields[0].AsInteger > 0);
      end;
    finally
      vQuery.Active := false;
      FreeAndNil(vQuery);
    end;
  except
    on E: exception do
      raise;
  end;
end;

end.
