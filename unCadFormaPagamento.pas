unit unCadFormaPagamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, Grids, AdvObj, BaseGrid, AdvGrid, AdvCGrid, AsgFindDialog, ComCtrls,
  Menus, UnAplExportaXLS, ImgList, ToolWin, MaskUtils, DBAdvGrid, RpRender,
  RpRenderPDF, ShellAPI, RpCon, RpConDS, RpBase, RpSystem, RpDefine, RpRave,
  AdvGlowButton, AdvPanel, AdvAppStyler, AdvToolBar, AdvOfficePager,
  tmsAdvGridExcel, AdvMenus, AdvOfficeButtons, AdvEdit, unFormaPagamento;

type
  TfmCadFormaPagamento = class(TForm)
    QueryGeral: TZQuery;
    GridFindDialogColumnGrid: TAdvGridFindDialog;
    DBAdvGridGeral: TDBAdvGrid;
    DataSource: TDataSource;
    LabelCodigo: TLabel;
    LabelFormaPagamento: TLabel;
    SaveDialog: TSaveDialog;
    ProjectRelFormaPagamento: TRvProject;
    DataSetConnectionRelFormaPagamento: TRvDataSetConnection;
    QueryRelFormaPagamento: TZQuery;
    PanelBotoes: TAdvPanel;
    BitBtnFechar: TAdvGlowButton;
    BitBtnSalvar: TAdvGlowButton;
    BitBtnNovo: TAdvGlowButton;
    BitBtnExcluir: TAdvGlowButton;
    BitBtnRestaurar: TAdvGlowButton;
    FormStyler: TAdvFormStyler;
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
    EditCadastroCDFORMAPAGAMENTO: TAdvEdit;
    EditCadastroNMFORMAPAGAMENTO: TAdvEdit;
    CheckBoxCadastroFLATIVO: TAdvOfficeCheckBox;
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
  private
    { Private declarations }
    pId: TGUID;
    pOpcao: Char;
    pCodigo, pEspacamentoInicial, pEspacamentoFinal, pEspacamentoEntre: integer;
    pOrdenacao: string;
    pFormaPagamento: TFormaPagamento;
    procedure editaColunaGrid(prmIndice: integer; prmNome, prmCabecalho: string;
      prmEditor: TEditorType; prmAlinhamento: TAlignment; prmTamanho: integer;
      prmSomenteLeitura: boolean);
    procedure desabilitaBotoes;
    procedure habilitaBotoes;
    procedure novoCadastro;
    procedure editaCadastro;
    procedure insereCadastro;
    procedure atualizaCadastro;
    function validaExclusao: boolean;
    procedure carregaImagensBotoes;
    property EspacamentoInicial: integer read pEspacamentoInicial write pEspacamentoInicial;
    property EspacamentoEntre: integer read pEspacamentoEntre write pEspacamentoEntre;
    property EspacamentoFinal: integer read pEspacamentoFinal write pEspacamentoFinal;
  public
    { Public declarations }
    property Opcao: char read pOpcao write pOpcao;
    property Codigo: integer read pCodigo write pCodigo;
    property Ordenacao: string read pOrdenacao write pOrdenacao;
  end;

var
  fmCadFormaPagamento: TfmCadFormaPagamento;

implementation

uses unPrincipal, unConFiltroPadrao, undmPrincipal, undmEstilo,
  unAplOrdenaGrid;

{$R *.dfm}

procedure TfmCadFormaPagamento.atualizaCadastro;
var
  vRetorno: integer;
begin
  try
    pFormaPagamento.Codigo := Codigo;
    pFormaPagamento.Nome := EditCadastroNMFORMAPAGAMENTO.Text;
    if CheckBoxCadastroFLATIVO.Checked then
      pFormaPagamento.Ativo := 'S'
    else
      pFormaPagamento.Ativo := 'N';
    vRetorno := pFormaPagamento.atualiza;

    if vRetorno <> 0 then
      fmPrincipal.apresentaResultadoCadastro('Cadastro atualizado com sucesso.')
    else
      fmPrincipal.apresentaResultadoCadastro('N�o foi poss�vel atualizar o cadastro.');
  except
    on E: exception do
      raise;
  end;
end;

procedure TfmCadFormaPagamento.BitBtnRestaurarClick(Sender: TObject);
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

procedure TfmCadFormaPagamento.BitBtnExcluirClick(Sender: TObject);
var
  vRetorno: integer;
begin
  // Valida se realmente o usu�rio quer realizar a exclus�o.
  if MessageBox(fmPrincipal.Handle,
                PWideChar('Confirma a exclus�o da forma de pagamento?'),
                cTituloMensagemConfirmacao,
                MB_YESNO or MB_ICONQUESTION or MB_DEFBUTTON2) = IDNO then
    Exit;
  // Valida se � poss�vel realizar a exclus�o.
  if not validaExclusao then
    Exit;

  desabilitaBotoes;
  try
    pFormaPagamento.Codigo := Codigo;
    vRetorno := pFormaPagamento.exclui;

    BitBtnNovoClick(Sender);

    if vRetorno <> 0 then
      fmPrincipal.apresentaResultadoCadastro('Cadastro exclu�do com sucesso.')
    else
      fmPrincipal.apresentaResultadoCadastro('N�o foi poss�vel excluir o cadastro.');

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

procedure TfmCadFormaPagamento.BitBtnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfmCadFormaPagamento.insereCadastro;
begin
  try
    pFormaPagamento.Nome := EditCadastroNMFORMAPAGAMENTO.Text;
    if CheckBoxCadastroFLATIVO.Checked then
      pFormaPagamento.Ativo := 'S'
    else
      pFormaPagamento.Ativo := 'N';
    Codigo := pFormaPagamento.insere;

    if Codigo <> 0 then
      fmPrincipal.apresentaResultadoCadastro('Cadastro inclu�do com sucesso.')
    else
      fmPrincipal.apresentaResultadoCadastro('N�o foi poss�vel incluir o cadastro.');

    EditCadastroCDFORMAPAGAMENTO.Text := IntToStr(Codigo);
  except
    on E: exception do
      raise;
  end;
end;

procedure TfmCadFormaPagamento.BitBtnNovoClick(Sender: TObject);
begin
  pOpcao := 'I';
  desabilitaBotoes;
  novoCadastro;
  BitBtnSalvar.Enabled := true;
  BitBtnRestaurar.Enabled := true;
end;

procedure TfmCadFormaPagamento.BitBtnSalvarClick(Sender: TObject);
var
  vMensagem: string;
begin
  desabilitaBotoes;

  // Valida��es.
  vMensagem := EmptyStr;
  if AnsiCompareText(EditCadastroNMFORMAPAGAMENTO.Text,EmptyStr) = 0 then
    vMensagem := vMensagem + #13#10'- O campo Forma de Pagamento � requerido.';

  if vMensagem <> EmptyStr then
  begin
    BitBtnSalvar.Enabled := true;
    if Opcao = 'A' then
      BitBtnExcluir.Enabled := true;
    BitBtnRestaurar.Enabled := true;
    MessageBox(fmPrincipal.Handle,
               PWideChar('O cadastro n�o poder� ser executado devido as seguintes pend�ncias:' + vMensagem),
               cTituloMensagemAlerta,
               MB_OK or MB_ICONWARNING);
    Exit;
  end;
  // Fim Valida��es.

  try
    if Opcao = 'I' then
      insereCadastro
    else
      if Opcao = 'A' then
        atualizaCadastro;

    // Se n�o foi chamado pelo formPrincipal, a Tag ser� setada para 1, para que
    // a tela seja fechada automaticamente. Este � padr�o das telas que s�o abertas
    // via cadastro e n�o via form principal.
    if Tag = 1 then
      BitBtnFecharClick(Sender);

    // Atualiza a Grid.
    MenuItemAtualizarTabelaClick(Sender);

    // Edita o cadastro realizado.
    editaCadastro;
    habilitaBotoes;
    Opcao := 'A';
    ActiveControl := EditCadastroNMFORMAPAGAMENTO;
  except
    on E: Exception do
    begin
      fmPrincipal.apresentaResultadoCadastro(E.Message);
      fmPrincipal.manipulaExcecoes(Sender,E);
    end;
  end;
end;

procedure TfmCadFormaPagamento.DBAdvGridGeralDblClickCell(Sender: TObject; ARow,
  ACol: Integer);
begin
  if ARow > 0 then
    MenuItemEditarRegistroClick(MenuItemEditarRegistro);
end;

procedure TfmCadFormaPagamento.DBAdvGridGeralFilterSelect(Sender: TObject; Column,
  ItemIndex: Integer; FriendlyName: string; var FilterCondition: string);
begin
  case ItemIndex of
    0: FilterCondition := EmptyStr;
    1: FilterCondition := 'S';
    2: FilterCondition := 'N';
  end;

  DBAdvGridGeral.Cells[Column,0] := FriendlyName;
end;

procedure TfmCadFormaPagamento.desabilitaBotoes;
begin
  BitBtnSalvar.Enabled := false;
  BitBtnExcluir.Enabled := false;
  BitBtnRestaurar.Enabled := false;
  BitBtnNovo.Enabled := false;
end;

procedure TfmCadFormaPagamento.editaCadastro;
var
  vQuery: TZQuery;
begin
  novoCadastro;

  try
    try
      vQuery := pFormaPagamento.lista;
      with vQuery do
      begin
        // Consulta o cadastro da Forma de Pagamento.
        SQL.Add('WHERE cdformapagamento = :CURRENT_CDFORMAPAGAMENTO');
        Params.ParamByName('CURRENT_CDFORMAPAGAMENTO').AsInteger := Codigo;
        dmPrincipal.executaConsulta(vQuery);

        if not Eof then
        begin
          EditCadastroCDFORMAPAGAMENTO.Text := IntToStr(Codigo);
          EditCadastroNMFORMAPAGAMENTO.Text := Fields.FieldByName('NMFORMAPAGAMENTO').AsString;
          CheckBoxCadastroFLATIVO.Checked := (Fields.FieldByName('FLATIVO').AsString = 'S');
        end
        else
          raise exception.Create('O cadastro da Forma de Pagamento n�o foi encontrado.');
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

procedure TfmCadFormaPagamento.editaColunaGrid(prmIndice: integer; prmNome,
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

procedure TfmCadFormaPagamento.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  QueryGeral.Close;

  Action := caFree;
end;

procedure TfmCadFormaPagamento.FormCreate(Sender: TObject);
var
  i: integer;
begin
  try
    CreateGUID(pId);

    Color := Self.Color;
    FormStyler.AutoThemeAdapt := false;

    // Seta a op��o padr�o, que � inclus�o.
    if Opcao <> 'A' then
      Opcao := 'I';

    OfficePagerCentral.ActivePageIndex := 1;

    pFormaPagamento := TFormaPagamento.Create;

    Ordenacao := '|"C�digo":"N":"Asc."|;|"Forma de pagamento":"S":"Asc."|;|"Ativo":"S":"Asc."|';

    // Monta a consulta que carregar� os dados da Grid.
    with QueryGeral do
    begin
      SQL := pFormaPagamento.lista.SQL;
      SQL.Strings[0] := 'SELECT cdformapagamento,nmformapagamento,flativo';
      SQL.Add('ORDER BY 2,3');
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
    CheckBoxCadastroFLATIVO.Themed := true;

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

procedure TfmCadFormaPagamento.FormDestroy(Sender: TObject);
begin
  FreeAndNil(pFormaPagamento);
end;

procedure TfmCadFormaPagamento.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Exit;
end;

procedure TfmCadFormaPagamento.FormResize(Sender: TObject);
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

procedure TfmCadFormaPagamento.habilitaBotoes;
begin
  BitBtnSalvar.Enabled := true;
  BitBtnExcluir.Enabled := true;
  BitBtnRestaurar.Enabled := true;
  BitBtnNovo.Enabled := true;
end;

procedure TfmCadFormaPagamento.MenuItemAtualizarTabelaClick(Sender: TObject);
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
      editaColunaGrid(1,'CDFORMAPAGAMENTO','C�digo',edNone,taRightJustify,40,true);
      editaColunaGrid(2,'NMFORMAPAGAMENTO','Forma de pagamento',edNone,taLeftJustify,450,true);
      editaColunaGrid(3,'FLATIVO','Ativo',edCheckBox,taCenter,40,true);
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

procedure TfmCadFormaPagamento.MenuItemEditarRegistroClick(Sender: TObject);
begin
  Opcao := 'A';
  with DBAdvGridGeral do
    Codigo := ColumnByName['CDFORMAPAGAMENTO'].Ints[Row];
  editaCadastro;
  habilitaBotoes;

  ActiveControl := EditCadastroNMFORMAPAGAMENTO;
end;

procedure TfmCadFormaPagamento.MenuItemVisualizarFiltroClick(Sender: TObject);
begin
  GridFindDialogColumnGrid.Execute;
end;

procedure TfmCadFormaPagamento.novoCadastro;
begin
  OfficePagerCentral.ActivePageIndex := 1;

  EditCadastroCDFORMAPAGAMENTO.Clear;
  EditCadastroNMFORMAPAGAMENTO.Clear;
  CheckBoxCadastroFLATIVO.Checked := true;

  ActiveControl := EditCadastroNMFORMAPAGAMENTO;
end;

procedure TfmCadFormaPagamento.OfficePageCadastroShow(Sender: TObject);
begin
  ActiveControl := EditCadastroNMFORMAPAGAMENTO;
end;

procedure TfmCadFormaPagamento.ButtonExportarHTMLClick(Sender: TObject);
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

procedure TfmCadFormaPagamento.ButtonExportarPlanilhaClick(Sender: TObject);
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

procedure TfmCadFormaPagamento.ButtonImprimirRelatorioClick(Sender: TObject);
begin
  try
    QueryRelFormaPagamento.SQL := pFormaPagamento.relatorio.SQL;
    dmPrincipal.executaConsulta(QueryRelFormaPagamento);
    with fmPrincipal.SystemRelatorio do
    begin
      DefaultDest := rdPreview;
      SystemSetups := SystemSetups - [ssAllowSetup];
      DoNativeOutput := false;
      //SystemSetups := SystemSetups - [ssAllowSetup];
    end;
    with ProjectRelFormaPagamento do
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

procedure TfmCadFormaPagamento.ButtonOrdenarRegistrosClick(Sender: TObject);
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

procedure TfmCadFormaPagamento.carregaImagensBotoes;
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

function TfmCadFormaPagamento.validaExclusao: boolean;
var
  vMensagem: string;
begin
  vMensagem := EmptyStr;

  try
    pFormaPagamento.Codigo := Codigo;
    if pFormaPagamento.existeDependencia then
      vMensagem := '- Existem aquisi��es ou parcelas de aquisi��es relacionadas a esta forma de pagamento.';

    if vMensagem = EmptyStr then
      Result := true
    else
    begin
      Result := false;
      MessageBox(fmPrincipal.Handle,
                 PWideChar('O cadastro n�o poder� ser exclu�do devido as seguintes depend�ncias:'#13#10+vMensagem),
                 cTituloMensagemAlerta,
                 MB_OK or MB_ICONWARNING);
    end;
  except
    on E: exception do
      raise;
  end;
end;

end.
