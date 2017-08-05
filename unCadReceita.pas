unit unCadReceita;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, Grids, AdvObj, BaseGrid, AdvGrid, AdvCGrid, AsgFindDialog, ComCtrls,
  Menus, UnAplExportaXLS, ImgList, ToolWin, MaskUtils, DBAdvGrid, RpCon,
  RpConDS, RpBase, RpSystem, RpDefine, RpRave, RpRender, RpRenderPDF, ShellAPI,
  Vcl.Mask, DateUtils, AdvAppStyler, AdvGlowButton, AdvMenus, AdvEdit, AdvEdBtn,
  PlannerDatePicker, AdvOfficeButtons, AdvMoneyEdit, tmsAdvGridExcel,
  AdvGroupBox, AdvToolBar, AdvOfficePager, AdvPanel, unUsuario, unTipoMovimento,
  unReceita;

type
  TfmCadReceita = class(TForm)
    QueryGeral: TZQuery;
    GridFindDialogColumnGrid: TAdvGridFindDialog;
    DBAdvGridGeral: TDBAdvGrid;
    DataSource: TDataSource;
    LabelTipoMovimento: TLabel;
    LabelDescricao: TLabel;
    LabelUsuario: TLabel;
    SaveDialog: TSaveDialog;
    ProjectRelReceita: TRvProject;
    DataSetConnectionRelReceita: TRvDataSetConnection;
    QueryRelReceita: TZQuery;
    ColumnGridItens: TAdvColumnGrid;
    LabelSeparadorAnoNumero: TLabel;
    LabelDataReceita: TLabel;
    LabelReceita: TLabel;
    LabelObservacoes: TLabel;
    FormStyler: TAdvFormStyler;
    PopupMenuGrid: TAdvPopupMenu;
    MenuItemEditarRegistro: TMenuItem;
    MenuItemAtualizarTabela: TMenuItem;
    MenuItemEspaco1: TMenuItem;
    MenuItemVisualizarFiltro: TMenuItem;
    ButtonLimparTipoMovimento: TAdvGlowButton;
    ButtonLimparUsuario: TAdvGlowButton;
    ButtonNovoTipoMovimento: TAdvGlowButton;
    ButtonAdicionarLinhaGridItens: TAdvGlowButton;
    ButtonExcluirLinhaGridItens: TAdvGlowButton;
    ButtonAdicionarDadosGrid: TAdvGlowButton;
    EditCadastroCDUSUARIO: TAdvEdit;
    EditCadastroNMLOGIN: TAdvEdit;
    EditCadastroCDTIPOMOVIMENTO: TAdvEdit;
    EditCadastroNUANORECEITA: TAdvEdit;
    EditCadastroNURECEITA: TAdvEdit;
    EditCadastroNMUSUARIO: TAdvEditBtn;
    EditCadastroDETIPOMOVIMENTO: TAdvEditBtn;
    DatePickerEditCadastroDTRECEITA: TPlannerDatePicker;
    PanelBotoes: TAdvPanel;
    BitBtnFechar: TAdvGlowButton;
    BitBtnSalvar: TAdvGlowButton;
    BitBtnNovo: TAdvGlowButton;
    BitBtnCancelarReceita: TAdvGlowButton;
    BitBtnRestaurar: TAdvGlowButton;
    BitBtnInserirDocumento: TAdvGlowButton;
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
    GroupBoxReceita: TAdvGroupBox;
    GroupBoxItensReceita: TAdvGroupBox;
    PanelBotoesControleGridItens: TAdvPanel;
    PanelTotalizador: TAdvPanel;
    PanelTotalizadorItens: TAdvPanel;
    LabelTotalizadorItens: TLabel;
    PanelTotalizadorValor: TAdvPanel;
    LabelTotalizadorValor: TLabel;
    PanelTotalizadorEspaco: TAdvPanel;
    PanelGridItens: TAdvPanel;
    PanelItensReceita: TAdvPanel;
    PanelStatusCadastro: TAdvPanel;
    LabelStatusCadastro: TLabel;
    AdvGridExcelIO: TAdvGridExcelIO;
    ButtonExibirInvisiveis: TAdvGlowButton;
    LabelDataCadastro: TLabel;
    DatePickerEditCadastroDTCADASTRO: TPlannerDatePicker;
    LabelDataUltimaAtualizacao: TLabel;
    DatePickerEditCadastroDTULTATUALIZACAO: TPlannerDatePicker;
    EditCadastroDERECEITA: TAdvEdit;
    MemoCadastroDEOBSERVACOES: TMemo;
    AdvGridUndoRedo: TAdvGridUndoRedo;
    ImageList: TImageList;
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtnFecharClick(Sender: TObject);
    procedure BitBtnNovoClick(Sender: TObject);
    procedure BitBtnSalvarClick(Sender: TObject);
    procedure BitBtnCancelarReceitaClick(Sender: TObject);
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
    procedure ButtonLimparUsuarioClick(Sender: TObject);
    procedure EditCadastroNMUSUARIOExit(Sender: TObject);
    procedure EditCadastroCDUSUARIOExit(Sender: TObject);
    procedure EditCadastroNMLOGINExit(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ColumnGridItensCanDeleteRow(Sender: TObject; ARow: Integer;
      var CanDelete: Boolean);
    procedure ButtonAdicionarLinhaGridItensClick(Sender: TObject);
    procedure ButtonExcluirLinhaGridItensClick(Sender: TObject);
    procedure TabSheetCadastroReceitaItensShow(Sender: TObject);
    procedure TabSheetCadastroReceitaShow(Sender: TObject);
    procedure ColumnGridItensClickCell(Sender: TObject; ARow, ACol: Integer);
    procedure EditCadastroCDTIPOMOVIMENTOExit(Sender: TObject);
    procedure EditCadastroDETIPOMOVIMENTOExit(Sender: TObject);
    procedure ButtonLimparTipoMovimentoClick(Sender: TObject);
    procedure ButtonNovoTipoMovimentoClick(Sender: TObject);
    procedure DatePickerEditCadastroDTRECEITAExit(Sender: TObject);
    procedure ColumnGridItensCellsChanged(Sender: TObject; R: TRect);
    procedure ButtonAdicionarDadosGridClick(Sender: TObject);
    procedure EditCadastroNUANORECEITAExit(Sender: TObject);
    procedure BitBtnInserirDocumentoClick(Sender: TObject);
    procedure OfficePageCadastroShow(Sender: TObject);
    procedure OfficePageConsultaShow(Sender: TObject);
    procedure EditCadastroDETIPOMOVIMENTOClickBtn(Sender: TObject);
    procedure EditCadastroNMUSUARIOClickBtn(Sender: TObject);
    procedure EditCadastroCDTIPOMOVIMENTOChange(Sender: TObject);
    procedure EditCadastroCDUSUARIOChange(Sender: TObject);
    procedure DBAdvGridGeralClickCell(Sender: TObject; ARow, ACol: Integer);
    procedure ButtonExibirInvisiveisClick(Sender: TObject);
  private
    { Private declarations }
    pId: TGUID;
    pOpcao: Char;
    pCodigo, pEspacamentoInicial, pEspacamentoFinal, pEspacamentoEntre: integer;
    pOrdenacao, pOcultarExibir: string;
    plTipoMovimento, plUsuario: TStringList;
    pdtMinima, pdtMaxima, pdtReceita, pDataPagamento: TDate;
    pValorPago: currency;
    pIncrementarMes: boolean;
    pUsuario: TUsuario;
    pTipoMovimento: TTipoMovimento;
    pReceita: TReceita;
    procedure editaColunaGrid(prmIndice: integer; prmNome, prmCabecalho: string;
      prmEditor: TEditorType; prmAlinhamento: TAlignment; prmTamanho: integer;
      prmSomenteLeitura: boolean);
    procedure apresentaResultadoCadastro(prmMensagem: string);
    procedure desabilitaBotoes;
    procedure habilitaBotoes;
    procedure congelaTela(prmCongelar: boolean = true);
    procedure novoCadastro;
    procedure editaCadastro;
    procedure insereCadastro;
    procedure atualizaCadastro;
    procedure limpaGridItens;
    procedure populaGridItens;
    procedure atualizaSomatorioGrid;
    procedure enviaEmail;
    procedure atualizaReceitaVisivel;
    procedure obtemConfiguracaoItensReceita;
    function validaExclusao: boolean;
    procedure carregaImagensBotoes;
    property EspacamentoInicial: integer read pEspacamentoInicial write pEspacamentoInicial;
    property EspacamentoEntre: integer read pEspacamentoEntre write pEspacamentoEntre;
    property EspacamentoFinal: integer read pEspacamentoFinal write pEspacamentoFinal;
  public
    { Public declarations }
    procedure setaCadastroUnico;
    property Opcao: char read pOpcao write pOpcao;
    property Codigo: integer read pCodigo write pCodigo;
    property Ordenacao: string read pOrdenacao write pOrdenacao;
  end;

var
  fmCadReceita: TfmCadReceita;

implementation

uses unPrincipal, undmPrincipal, unAplOrdenaGrid, unConFiltroPadrao,
  unAplEditaTexto, unCadTipoMovimento, unCadDocumento, undmEstilo,
  unCadReceitaConfiguracao;

{$R *.dfm}

procedure TfmCadReceita.apresentaResultadoCadastro(prmMensagem: string);
begin
  MessageBox(fmPrincipal.Handle,
             PWideChar(prmMensagem),
             cTituloMensagemInformacao,
             MB_OK or MB_ICONINFORMATION);
end;

procedure TfmCadReceita.atualizaCadastro;
var
  i, vRetorno: integer;
  vErro: boolean;
begin
  try
    vErro := false;
    pReceita.Codigo := Codigo;
    pReceita.Usuario := StrToInt(EditCadastroCDUSUARIO.Text);
    pReceita.Nome := EditCadastroDERECEITA.Text;
    if MemoCadastroDEOBSERVACOES.Lines.Count > 0 then
      pReceita.Observacoes.Assign(MemoCadastroDEOBSERVACOES.Lines)
    else
      pReceita.Observacoes.Clear;
    pReceita.Data := DatePickerEditCadastroDTRECEITA.Date;
    vRetorno := pReceita.atualiza;

    if vRetorno <> 0 then
      with ColumnGridItens do
        for i := 1 to RowCount -1 do
        begin
          pReceita.CodigoItem := ColumnByName['NUITEM'].Ints[i];
          pReceita.ValorReceita := ColumnByName['VLRECEITA'].Floats[i];
          pReceita.DataPagamento := ColumnByName['DTPAGAMENTO'].Dates[i];
          if ColumnByName['DEOBSERVACOES'].Rows[i] <> EmptyStr then
            pReceita.Observacoes.Text := ColumnByName['DEOBSERVACOES'].Rows[i]
          else
            pReceita.Observacoes.Clear;
          if ColumnByName['NUITEM'].Rows[i] <> EmptyStr then
            vErro := (pReceita.atualizaItem = 0)
          else
            vErro := (pReceita.insereItem = 0);
        end;

    if vRetorno <> 0 then
    begin
      if not vErro then
        fmPrincipal.apresentaResultadoCadastro('Cadastro atualizado com sucesso.')
      else
        apresentaResultadoCadastro('Receita atualizada com sucesso, mas alguns itens não puderam ser atualizados.');

      // Envia o e-mail pro usuário.
      if fmPrincipal.SempreEnviaEmailCadastroReceita = true then
        enviaEMail;
    end
    else
      raise Exception.Create('Não foi possível atualizar o cadastro.');
  except
    on E: exception do
      raise;
  end;
end;

procedure TfmCadReceita.atualizaReceitaVisivel;
var
  vMensagem: string;
  vRetorno: integer;
begin
  // Verifica deseja realmente ocultar/exibir.
  with DBAdvGridGeral do
  begin
    if Row = 0 then
      Exit;

    pReceita.Codigo := ColumnByName['CDRECEITA'].Ints[Row];
  end;

  if pOcultarExibir = 'ocultar' then
    vMensagem := 'Deseja realmente ocultar a receita?'
  else
    vMensagem := 'Deseja realmente tornar a receita visível?';
  vRetorno := MessageBox(fmPrincipal.Handle,PWideChar(vMensagem),cTituloMensagemConfirmacao,MB_YESNO or MB_ICONQUESTION or MB_DEFBUTTON2);
  if vRetorno <> mrYes then
    Exit;

  if pOcultarExibir = 'ocultar' then
    pReceita.setaVisivel('N')
  else
    pReceita.setaVisivel('S');
  pReceita.Codigo := Codigo;
  MenuItemAtualizarTabelaClick(fmCadReceita);
end;

procedure TfmCadReceita.atualizaSomatorioGrid;
var
  vValor: currency;
begin
  // Atualiza os totais.
  with ColumnGridItens do
  begin
    if ColumnByName['VLRECEITA'].Rows[1] <> EmptyStr then
      LabelTotalizadorItens.Caption := 'Total de itens: ' + IntToStr(RowCount -1)
    else
      LabelTotalizadorItens.Caption := 'Total de itens: 0';
    vValor := ColumnSum(2,1,RowCount -1);
    LabelTotalizadorValor.Caption := 'Valor total: ' + FormatFloat('"R$ ",0.00',vValor);
  end;
end;

procedure TfmCadReceita.BitBtnRestaurarClick(Sender: TObject);
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

procedure TfmCadReceita.ButtonAdicionarDadosGridClick(Sender: TObject);
var
  i: integer;
begin
  try
    obtemConfiguracaoItensReceita;
    if pValorPago = -1 then
      Exit;

    with ColumnGridItens do
      for i := 1 to RowCount -1 do
      begin
        ColumnByName['VLRECEITA'].Floats[i] := pValorPago;
        if pIncrementarMes = true then
          ColumnByName['DTPAGAMENTO'].Dates[i] := IncMonth(pDataPagamento, i -1)
        else
          ColumnByName['DTPAGAMENTO'].Dates[i] := pDataPagamento;
      end;
  except
    on E: exception do
      fmPrincipal.manipulaExcecoes(Sender,E);
  end;
end;

procedure TfmCadReceita.ButtonAdicionarLinhaGridItensClick(Sender: TObject);
begin
  ColumnGridItens.AddRow;
  atualizaSomatorioGrid;
end;

procedure TfmCadReceita.BitBtnCancelarReceitaClick(Sender: TObject);
var
  vRetorno: integer;
begin
  // Valida se realmente o usuário quer realizar a exclusão.
  if MessageBox(fmPrincipal.Handle,
                PWideChar('Deseja realmente realizar o cancelamento da receita?'),
                cTituloMensagemConfirmacao,
                MB_YESNO or MB_ICONQUESTION or MB_DEFBUTTON2) = IDNO then
    Exit;

  try
    vRetorno := pReceita.cancela;

    if vRetorno <> 0 then
    begin
      fmPrincipal.apresentaResultadoCadastro('Cadastro cancelado com sucesso.');
      BitBtnNovoClick(Sender);
    end
    else
      raise Exception.Create('Não foi possível cancelar o cadastro.');

    // Atualiza a Grid.
    MenuItemAtualizarTabelaClick(Sender);
  except
    on E: exception do
      fmPrincipal.manipulaExcecoes(Sender,E);
  end;
end;

procedure TfmCadReceita.ButtonExcluirLinhaGridItensClick(Sender: TObject);
var
  vRetorno: integer;
begin
  // Se for um item ainda não cadastrado, apenas o remove da grid.
  with ColumnGridItens do
    if ColumnByName['NUITEM'].Rows[Row] = EmptyStr then
    begin
      if RowCount > 2 then
        RemoveRows(Row,1)
      else
        limpaGridItens;
      Exit;
    end;

  // Valida se realmente o usuário quer realizar a exclusão.
  if MessageBox(fmPrincipal.Handle,
                PWideChar('Deseja realmente realizar a exclusão do item da receita selecionado?'),
                cTituloMensagemConfirmacao,
                MB_YESNO or MB_ICONQUESTION or MB_DEFBUTTON2) = IDNO then
    Exit;
  // Valida se é possível realizar a exclusão.
  if not validaExclusao then
    Exit;

  // Realiza a exclusão do registro.
  try
    with ColumnGridItens do
    begin
      pReceita.CodigoItem := ColumnByName['NUITEM'].Ints[Row];
      vRetorno := pReceita.excluiItem;
      limpaGridItens;
      populaGridItens;
    end;

    if vRetorno <> 0 then
      apresentaResultadoCadastro('Item da receita excluído com sucesso.')
    else
      raise Exception.Create('Não foi possível excluir o item da receita.');

    // Atualiza a tabela de Usuário Saldo.
    //fmPrincipal.atualizaUsuarioSaldo;
  except
    on E: exception do
      fmPrincipal.manipulaExcecoes(Sender,E);
  end;
end;

procedure TfmCadReceita.ButtonExibirInvisiveisClick(Sender: TObject);
begin
  // 26 = Imagem de desativado.
  if ButtonExibirInvisiveis.Tag = 0 then
  begin
    ButtonExibirInvisiveis.Tag := 1;
    ButtonExibirInvisiveis.Picture.LoadFromFile(fmPrincipal.LocalIcones + 'visible-e-16.png');
    ButtonExibirInvisiveis.HotPicture.LoadFromFile(fmPrincipal.LocalIcones + 'visible-h-16.png');
    ButtonExibirInvisiveis.DisabledPicture.LoadFromFile(fmPrincipal.LocalIcones + 'visible-d-16.png');
  end
  else
  begin
    ButtonExibirInvisiveis.Tag := 0;
    ButtonExibirInvisiveis.Picture.LoadFromFile(fmPrincipal.LocalIcones + 'invisible-e-16.png');
    ButtonExibirInvisiveis.HotPicture.LoadFromFile(fmPrincipal.LocalIcones + 'invisible-h-16.png');
    ButtonExibirInvisiveis.DisabledPicture.LoadFromFile(fmPrincipal.LocalIcones + 'invisible-d-16.png');
  end;

  MenuItemAtualizarTabelaClick(Sender);
end;

procedure TfmCadReceita.BitBtnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfmCadReceita.BitBtnInserirDocumentoClick(Sender: TObject);
begin
  try
    fmPrincipal.pLogSistema.Trace('>> Cadastro de Receita - Carregando a tela de Documentos.');
    fmCadDocumento := TfmCadDocumento.Create(Self);
    fmCadDocumento.Caption := Caption + ' :: ' + fmCadDocumento.Caption;
    with fmCadDocumento do
    begin
      fmCadDocumento.Codigo := fmCadReceita.Codigo;
      fmCadDocumento.Tipo := 'R';
      NomeDiretorio := EditCadastroCDTIPOMOVIMENTO.Text + '.' + EditCadastroNUANORECEITA.Text + EditCadastroNURECEITA.Text;
      preencheGrid;
      ShowModal;
    end;
    fmPrincipal.pLogSistema.Trace('>> Cadastro de Receita - Tela de Documentos carregada com sucesso.');
  except
    on E: Exception do
      fmPrincipal.manipulaExcecoes(Sender,E);
  end;
end;

procedure TfmCadReceita.insereCadastro;
var
  i: integer;
begin
  try
    pReceita.Movimento := StrToInt(EditCadastroCDTIPOMOVIMENTO.Text);
    pReceita.Ano := StrToInt(EditCadastroNUANORECEITA.Text);
    pReceita.Usuario := StrToInt(EditCadastroCDUSUARIO.Text);
    pReceita.Nome := EditCadastroDERECEITA.Text;
    if MemoCadastroDEOBSERVACOES.Lines.Count > 0 then
      pReceita.Observacoes.Assign(MemoCadastroDEOBSERVACOES.Lines)
    else
      pReceita.Observacoes.Clear;
    pReceita.Data := DatePickerEditCadastroDTRECEITA.Date;
    Codigo := pReceita.insere;

    if Codigo <> 0 then
    begin
      with ColumnGridItens do
        for i := 1 to RowCount -1 do
        begin
          pReceita.ValorReceita := ColumnByName['VLRECEITA'].Floats[i];
          pReceita.DataPagamento := ColumnByName['DTPAGAMENTO'].Dates[i];
          if ColumnByName['DEOBSERVACOES'].Rows[i] <> EmptyStr then
            pReceita.Observacoes.Text := ColumnByName['DEOBSERVACOES'].Rows[i]
          else
            pReceita.Observacoes.Clear;
          if pReceita.insereItem = 0 then
          begin
            pReceita.exclui;
            raise Exception.Create('Não foi possível incluir o cadastro.');
          end;
        end;

      fmPrincipal.apresentaResultadoCadastro('Cadastro incluído com sucesso.');

      // Envia o e-mail pro usuário.
      if fmPrincipal.SempreEnviaEmailCadastroReceita = true then
        enviaEMail;
    end
    else
      raise Exception.Create('Não foi possível incluir o cadastro.');

    EditCadastroNURECEITA.Text := IntToStr(Codigo);
  except
    on E: exception do
      raise;
  end;
end;

procedure TfmCadReceita.limpaGridItens;
begin
  with ColumnGridItens do
  begin
    BeginUpdate;
    RowCount := 2;
    ClearRows(1,1);
    ColumnByName['VLRECEITA'].FloatFormat := '%.2f';
    ColumnByName['VLRECEITA'].SortPrefix := 'R$';
    AddImageIdx(4,1,0,haCenter,vaCenter);
    HideColumn(5);
    EndUpdate;
  end;
  atualizaSomatorioGrid;
end;

procedure TfmCadReceita.BitBtnNovoClick(Sender: TObject);
begin
  congelaTela(false);
  pOpcao := 'I';
  desabilitaBotoes;
  novoCadastro;
  BitBtnSalvar.Enabled := true;
  BitBtnRestaurar.Enabled := true;
end;

procedure TfmCadReceita.BitBtnSalvarClick(Sender: TObject);
var
  i: integer;
  vMensagem: string;
  vOk: boolean;
begin
  desabilitaBotoes;

  // Validações.
  vMensagem := EmptyStr;
  if AnsiCompareText(EditCadastroDERECEITA.Text,EmptyStr) = 0 then
    vMensagem := vMensagem + #13#10'- O campo Receita é requerido.';
  if AnsiCompareText(EditCadastroCDUSUARIO.Text,EmptyStr) = 0 then
    vMensagem := vMensagem + #13#10'- O campo Usuário é requerido.';

  // Valida se existe pelo menos 1 item.
  vOk := false;
  with ColumnGridItens do
    for i := 1 to RowCount -1 do
      if (ColumnByName['VLRECEITA'].Rows[i] <> EmptyStr) and
         (ColumnByName['DTPAGAMENTO'].Rows[i] <> EmptyStr) then
      begin
        vOk := true;
        break;
      end;

  if not vOk then
    vMensagem := vMensagem + #13#10'- É preciso informar pelo menos 1 item para a receita.';

  if vMensagem <> EmptyStr then
  begin
    BitBtnSalvar.Enabled := true;
    if Opcao = 'A' then
      BitBtnCancelarReceita.Enabled := true;
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

    if EditCadastroDERECEITA.Enabled then
      ActiveControl := EditCadastroDERECEITA;
  except
    on E: Exception do
      fmPrincipal.manipulaExcecoes(Sender,E);
  end;
end;

procedure TfmCadReceita.ColumnGridItensCanDeleteRow(Sender: TObject;
  ARow: Integer; var CanDelete: Boolean);
begin
  CanDelete := false;
  ButtonExcluirLinhaGridItensClick(Sender);
end;

procedure TfmCadReceita.ColumnGridItensCellsChanged(Sender: TObject; R: TRect);
begin
  atualizaSomatorioGrid;
end;

procedure TfmCadReceita.ColumnGridItensClickCell(Sender: TObject; ARow,
  ACol: Integer);
begin
  if ARow = 0 then
    Exit;

  if ACol = 4 then
    with ColumnGridItens do
      if ColumnByName['VLRECEITA'].Rows[ARow] <> EmptyStr then
      begin
        fmAplEditaTexto := TfmAplEditaTexto.Create(Self);
        fmAplEditaTexto.Caption := Caption + ' :: Editar observações';
        with fmAplEditaTexto do
        begin
          if ColumnByName['DEOBSERVACOES'].Rows[ARow] <> EmptyStr then
            Texto.Text := ColumnByName['DEOBSERVACOES'].Rows[ARow]
          else
            Texto.Clear;
          SomenteLeitura := false;
          MemoEditor.Lines.Capacity := 1000;
          ShowModal;
          if Trim(Texto.Text) <> EmptyStr then
          begin
            AddImageIdx(4,ARow,1,haCenter,vaCenter);
            ColumnByName['DEOBSERVACOES'].Rows[ARow] := Texto.Text;
          end
          else
          begin
            AddImageIdx(4,ARow,0,haCenter,vaCenter);
            ColumnByName['DEOBSERVACOES'].Rows[ARow] := EmptyStr;
          end;
        end;
      end;
end;

procedure TfmCadReceita.EditCadastroDETIPOMOVIMENTOClickBtn(
  Sender: TObject);
var
  i: integer;
begin
  // Para que o evento não seja executado.
  EditCadastroCDTIPOMOVIMENTO.OnExit := nil;
  EditCadastroDETIPOMOVIMENTO.OnExit := nil;
  EditCadastroDETIPOMOVIMENTO.OnClickBtn := nil;

  fmConFiltroPadrao := TfmConFiltroPadrao.Create(Self);
  try
    with fmConFiltroPadrao do
    begin
      try
        setaTitulo('Consulta de Tipos de Movimento');
        setaConsulta(pTipoMovimento.filtro);
        setaFiltrosExtras('"DE-Natureza" = ''Receita''',
                          'Natureza: Receita');
        setaOpcao('R');
        executaFiltro(0,EmptyStr);
        ShowModal;
      finally
        plTipoMovimento.Clear;
        with pResSearch do
          for i := 0 to Count -1 do
            if objResSearch[i].Id = buscaId then
            begin
              plTipoMovimento.Add(objResSearch[i].Codigo);
              EditCadastroCDTIPOMOVIMENTO.Text := objResSearch[i].Codigo;
              EditCadastroDETIPOMOVIMENTO.Text := objResSearch[i].Nome1;
            end;
      end;
    end;
  finally
    EditCadastroCDTIPOMOVIMENTO.Enabled := (plTipoMovimento.Count = 0);
    EditCadastroDETIPOMOVIMENTO.Enabled := (plTipoMovimento.Count = 0);
    ButtonLimparTipoMovimento.Enabled := (plTipoMovimento.Count > 0);
    ButtonNovoTipoMovimento.Enabled := (plTipoMovimento.Count = 0);

    // Valida para qual campo vai se posicionar.
    if OfficePagerCentral.ActivePageIndex = 0 then
      if plTipoMovimento.Count > 0 then
      begin
        if plUsuario.Count = 0 then
        begin
          if EditCadastroCDUSUARIO.Enabled then
            ActiveControl := EditCadastroCDUSUARIO;
        end
        else
          if EditCadastroDERECEITA.Enabled then
            ActiveControl := EditCadastroDERECEITA;
      end
      else
        if EditCadastroDETIPOMOVIMENTO.Enabled then
          ActiveControl := EditCadastroDETIPOMOVIMENTO;
  end;

  // Para que o evento volte a ser executado.
  EditCadastroCDTIPOMOVIMENTO.OnExit := EditCadastroCDTIPOMOVIMENTOExit;
  EditCadastroDETIPOMOVIMENTO.OnExit := EditCadastroDETIPOMOVIMENTOExit;
  EditCadastroDETIPOMOVIMENTO.OnClickBtn := EditCadastroDETIPOMOVIMENTOClickBtn;
end;

procedure TfmCadReceita.EditCadastroDETIPOMOVIMENTOExit(Sender: TObject);
var
  i: integer;
  vQuery: TZQuery;
begin
  if Length(Trim(EditCadastroDETIPOMOVIMENTO.Text)) = 0 then
    Exit;

  // Para que o evento não seja executado.
  EditCadastroCDTIPOMOVIMENTO.OnExit := nil;
  EditCadastroDETIPOMOVIMENTO.OnExit := nil;
  EditCadastroDETIPOMOVIMENTO.OnClickBtn := nil;

  try
    vQuery := pTipoMovimento.filtro;
    with vQuery do
    begin
      SQL.Add('WHERE UPPER("DE-Tipo Movimento") LIKE :DETIPOMOVIMENTO');
      SQL.Add('  AND "DE-Natureza" = ''Receita''');
      Params.ParamByName('DETIPOMOVIMENTO').AsString := '%'+AnsiUpperCase(EditCadastroDETIPOMOVIMENTO.Text)+'%';
      dmPrincipal.executaConsulta(vQuery);

      if RecordCount > 1 then
      begin
        fmConFiltroPadrao := TfmConFiltroPadrao.Create(Self);
        with fmConFiltroPadrao do
        begin
          try
            setaTitulo('Consulta de Tipos de Movimento');
            setaConsulta(pTipoMovimento.filtro);
            setaFiltrosExtras('"DE-Natureza" = ''Receita''',
                              'Natureza: Receita');
            setaOpcao('R');
            executaFiltro(2,EditCadastroDETIPOMOVIMENTO.Text);
            ShowModal;
          finally
            plTipoMovimento.Clear;
            with pResSearch do
              for i := 0 to Count -1 do
                if objResSearch[i].Id = buscaId then
                begin
                  plTipoMovimento.Add(objResSearch[i].Codigo);
                  EditCadastroCDTIPOMOVIMENTO.Text := objResSearch[i].Codigo;
                  EditCadastroDETIPOMOVIMENTO.Text := objResSearch[i].Nome1;
                end;
          end;
        end;
      end
      else
        if not Eof then
        begin
          plTipoMovimento.Clear;
          plTipoMovimento.Add(Fields.Fields[0].AsString);
          EditCadastroCDTIPOMOVIMENTO.Text := Fields.Fields[0].AsString;
          EditCadastroDETIPOMOVIMENTO.Text := Fields.Fields[1].AsString;
        end
        else
          apresentaResultadoCadastro('Nenhum registro encontrado.');
      Active := false;
    end;
  finally
    FreeAndNil(vQuery);

    EditCadastroCDTIPOMOVIMENTO.Enabled := (plTipoMovimento.Count = 0);
    EditCadastroDETIPOMOVIMENTO.Enabled := (plTipoMovimento.Count = 0);
    ButtonLimparTipoMovimento.Enabled := (plTipoMovimento.Count > 0);
    ButtonNovoTipoMovimento.Enabled := (plTipoMovimento.Count = 0);

    // Valida para qual campo vai se posicionar.
    if OfficePagerCentral.ActivePageIndex = 0 then
      if plTipoMovimento.Count > 0 then
      begin
        if plUsuario.Count = 0 then
        begin
          if EditCadastroCDUSUARIO.Enabled then
            ActiveControl := EditCadastroCDUSUARIO;
        end
        else
          if EditCadastroDERECEITA.Enabled then
            ActiveControl := EditCadastroDERECEITA;
      end
      else
        if EditCadastroDETIPOMOVIMENTO.Enabled then
          ActiveControl := EditCadastroDETIPOMOVIMENTO;
  end;

  // Para que o evento volte a ser executado.
  EditCadastroCDTIPOMOVIMENTO.OnExit := EditCadastroCDTIPOMOVIMENTOExit;
  EditCadastroDETIPOMOVIMENTO.OnExit := EditCadastroDETIPOMOVIMENTOExit;
  EditCadastroDETIPOMOVIMENTO.OnClickBtn := EditCadastroDETIPOMOVIMENTOClickBtn;
end;

procedure TfmCadReceita.EditCadastroNMUSUARIOClickBtn(Sender: TObject);
var
  i: integer;
begin
  // Para que o evento não seja executado.
  EditCadastroCDUSUARIO.OnExit := nil;
  EditCadastroNMLOGIN.OnExit := nil;
  EditCadastroNMUSUARIO.OnExit := nil;
  EditCadastroNMUSUARIO.OnClickBtn := nil;

  fmConFiltroPadrao := TfmConFiltroPadrao.Create(Self);
  try
    with fmConFiltroPadrao do
    begin
      try
        setaTitulo('Consulta de Usuários');
        setaConsulta(pUsuario.filtro);
        setaOpcao('R');
        executaFiltro(0,EmptyStr);
        ShowModal;
      finally
        plUsuario.Clear;
        with pResSearch do
          for i := 0 to Count -1 do
            if objResSearch[i].Id = buscaId then
            begin
              plUsuario.Add(objResSearch[i].Codigo);
              EditCadastroCDUSUARIO.Text := objResSearch[i].Codigo;
              EditCadastroNMLOGIN.Text := objResSearch[i].Nome1;
              EditCadastroNMUSUARIO.Text := objResSearch[i].Nome2;
            end;
      end;
    end;
  finally
    EditCadastroCDUSUARIO.Enabled := (plUsuario.Count = 0);
    EditCadastroNMLOGIN.Enabled := (plUsuario.Count = 0);
    EditCadastroNMUSUARIO.Enabled := (plUsuario.Count = 0);
    if fmPrincipal.Administrador then
      ButtonLimparUsuario.Enabled := (plUsuario.Count > 0);

    // Valida para qual campo vai se posicionar.
    if OfficePagerCentral.ActivePageIndex = 1 then
      if plUsuario.Count = 0 then
        if EditCadastroNMUSUARIO.Enabled then
          ActiveControl := EditCadastroNMUSUARIO;
  end;

  // Para que o evento volte a ser executado.
  EditCadastroCDUSUARIO.OnExit := EditCadastroCDUSUARIOExit;
  EditCadastroNMLOGIN.OnExit := EditCadastroNMLOGINExit;
  EditCadastroNMUSUARIO.OnExit := EditCadastroNMUSUARIOExit;
  EditCadastroNMUSUARIO.OnClickBtn := EditCadastroNMUSUARIOClickBtn;
end;

procedure TfmCadReceita.EditCadastroNMUSUARIOExit(Sender: TObject);
var
  i: integer;
  vQuery: TZQuery;
begin
  if Length(Trim(EditCadastroNMUSUARIO.Text)) = 0 then
    Exit;

  // Para que o evento não seja executado.
  EditCadastroCDUSUARIO.OnExit := nil;
  EditCadastroNMLOGIN.OnExit := nil;
  EditCadastroNMUSUARIO.OnExit := nil;
  EditCadastroNMUSUARIO.OnClickBtn := nil;

  try
    vQuery := pUsuario.filtro;
    with vQuery do
    begin
      SQL.Add('WHERE UPPER("NM-Usuário") LIKE :NMUSUARIO');
      Params.ParamByName('NMUSUARIO').AsString := '%'+AnsiUpperCase(EditCadastroNMUSUARIO.Text)+'%';
      dmPrincipal.executaConsulta(vQuery);

      if RecordCount > 1 then
      begin
        fmConFiltroPadrao := TfmConFiltroPadrao.Create(Self);
        with fmConFiltroPadrao do
        begin
          try
            setaTitulo('Consulta de Usuários');
            setaConsulta(pUsuario.filtro);
            setaOpcao('R');
            executaFiltro(3,EditCadastroNMUSUARIO.Text);
            ShowModal;
          finally
            plUsuario.Clear;
            with pResSearch do
              for i := 0 to Count -1 do
                if objResSearch[i].Id = buscaId then
                begin
                  plUsuario.Add(objResSearch[i].Codigo);
                  EditCadastroCDUSUARIO.Text := objResSearch[i].Codigo;
                  EditCadastroNMLOGIN.Text := objResSearch[i].Nome1;
                  EditCadastroNMUSUARIO.Text := objResSearch[i].Nome2;
                end;
          end;
        end;
      end
      else
        if not Eof then
        begin
          plUsuario.Clear;
          plUsuario.Add(Fields.Fields[0].AsString);
          EditCadastroCDUSUARIO.Text := Fields.Fields[0].AsString;
          EditCadastroNMLOGIN.Text := Fields.Fields[1].AsString;
          EditCadastroNMUSUARIO.Text := Fields.Fields[2].AsString;
        end
        else
          apresentaResultadoCadastro('Nenhum registro encontrado.');
      Active := false;
    end;
  finally
    FreeAndNil(vQuery);
    EditCadastroCDUSUARIO.Enabled := (plUsuario.Count = 0);
    EditCadastroNMLOGIN.Enabled := (plUsuario.Count = 0);
    EditCadastroNMUSUARIO.Enabled := (plUsuario.Count = 0);
    if fmPrincipal.Administrador then
      ButtonLimparUsuario.Enabled := (plUsuario.Count > 0);

    // Valida para qual campo vai se posicionar.
    if OfficePagerCentral.ActivePageIndex = 1 then
      if plUsuario.Count = 0 then
        if EditCadastroNMUSUARIO.Enabled then
          ActiveControl := EditCadastroNMUSUARIO;
  end;

  // Para que o evento volte a ser executado.
  EditCadastroCDUSUARIO.OnExit := EditCadastroCDUSUARIOExit;
  EditCadastroNMLOGIN.OnExit := EditCadastroNMLOGINExit;
  EditCadastroNMUSUARIO.OnExit := EditCadastroNMUSUARIOExit;
  EditCadastroNMUSUARIO.OnClickBtn := EditCadastroNMUSUARIOClickBtn;
end;

procedure TfmCadReceita.congelaTela(prmCongelar: boolean);
var
  i, j: integer;
begin
  EditCadastroCDTIPOMOVIMENTO.Enabled := not prmCongelar;
  EditCadastroDETIPOMOVIMENTO.Enabled := not prmCongelar;
  ButtonLimparTipoMovimento.Enabled := not prmCongelar;
  ButtonNovoTipoMovimento.Enabled := not prmCongelar;
  EditCadastroCDUSUARIO.Enabled := not prmCongelar;
  EditCadastroNMLOGIN.Enabled := not prmCongelar;
  EditCadastroNMUSUARIO.Enabled := not prmCongelar;
  ButtonLimparUsuario.Enabled := not prmCongelar;
  EditCadastroDERECEITA.Enabled := not prmCongelar;

  ButtonAdicionarDadosGrid.Enabled := not prmCongelar;
  ButtonAdicionarLinhaGridItens.Enabled := not prmCongelar;
  ButtonExcluirLinhaGridItens.Enabled := not prmCongelar;
  BitBtnRestaurar.Enabled := not prmCongelar;
  BitBtnCancelarReceita.Enabled := not prmCongelar;
  BitBtnSalvar.Enabled := not prmCongelar;
  BitBtnInserirDocumento.Enabled := not prmCongelar;

  if prmCongelar then
  begin
    EditCadastroCDTIPOMOVIMENTO.OnExit := nil;
    EditCadastroDETIPOMOVIMENTO.OnExit := nil;
    EditCadastroDETIPOMOVIMENTO.OnClickBtn := nil;
    EditCadastroCDUSUARIO.OnExit := nil;
    EditCadastroNMLOGIN.OnExit := nil;
    EditCadastroNMUSUARIO.OnExit := nil;
    EditCadastroNMUSUARIO.OnClickBtn := nil;
  end;

  // Desabilita ou não as colunas da Grid.
  with ColumnGridItens do
    for i := 1 to RowCount -1 do
      for j := 1 to ColCount -1 do
        ReadOnly[i,j] := prmCongelar;
end;

procedure TfmCadReceita.DatePickerEditCadastroDTRECEITAExit(Sender: TObject);
begin
  // Para alteração, a data não pode ser menor que o Ano do cadastro.
  if Opcao = 'A' then
    if (DatePickerEditCadastroDTRECEITA.Date < pdtMinima) or
       (DatePickerEditCadastroDTRECEITA.Date > pdtMaxima) then
    begin
      MessageBox(fmPrincipal.Handle,
                 PWideChar('A data da receita informada não se encontra dentro do ano da receita.'+#13+#10+
                           'Favor informar uma Data que pertença ao ano de '+EditCadastroNUANORECEITA.Text+'.'),
                 cTituloMensagemErro,
                 MB_OK or MB_ICONERROR);
      DatePickerEditCadastroDTRECEITA.Date := pdtReceita;
      Exit;
    end;
  EditCadastroNUANORECEITA.Text := IntToStr(YearOf(DatePickerEditCadastroDTRECEITA.Date));
end;

procedure TfmCadReceita.DBAdvGridGeralClickCell(Sender: TObject; ARow,
  ACol: Integer);
var
  vEstado: boolean;
begin
  if ARow = 0 then
    Exit;

  DBAdvGridGeral.GetCheckboxState(7, ARow, vEstado);
  if vEstado = true then
    pOcultarExibir := 'ocultar'
  else
    pOcultarExibir := 'exibir';

  // Considera como se tivesse clicado no checkbox de visível.
  if ACol = 7 then
    atualizaReceitaVisivel;
end;

procedure TfmCadReceita.DBAdvGridGeralDblClickCell(Sender: TObject; ARow,
  ACol: Integer);
begin
  if ARow > 0 then
    MenuItemEditarRegistroClick(MenuItemEditarRegistro);
end;

procedure TfmCadReceita.DBAdvGridGeralFilterSelect(Sender: TObject; Column,
  ItemIndex: Integer; FriendlyName: string; var FilterCondition: string);
begin
  case ItemIndex of
    0: FilterCondition := EmptyStr;
    1: FilterCondition := 'S';
    2: FilterCondition := 'N';
  end;

  DBAdvGridGeral.Cells[Column,0] := FriendlyName;
end;

procedure TfmCadReceita.desabilitaBotoes;
begin
  BitBtnSalvar.Enabled := false;
  BitBtnCancelarReceita.Enabled := false;
  BitBtnRestaurar.Enabled := false;
  BitBtnNovo.Enabled := false;
  BitBtnInserirDocumento.Enabled := false;
end;

procedure TfmCadReceita.editaCadastro;
var
  vQuery: TZQuery;
  vAno: word;
begin
  novoCadastro;

  try
    try
      vQuery := pReceita.lista;
      with vQuery do
      begin
        // Consulta o cadastro da Receita.
        SQL.Add('WHERE cdreceita = :CURRENT_CDRECEITA');
        Params.ParamByName('CURRENT_CDRECEITA').AsInteger := Codigo;
        dmPrincipal.executaConsulta(vQuery);

        if not Eof then
        begin
          EditCadastroNUANORECEITA.Text := Fields.FieldByName('NUANORECEITA').AsString;
          EditCadastroNURECEITA.Text := Fields.FieldByName('NURECEITA').AsString;
          DatePickerEditCadastroDTRECEITA.Date := Fields.FieldByName('DTRECEITA').AsDateTime;
          vAno := StrToInt(EditCadastroNUANORECEITA.Text);
          pdtMinima := EncodeDate(vAno,1,1);
          pdtMaxima := EncodeDate(vAno,12,31);
          pdtReceita := Fields.FieldByName('DTRECEITA').AsDateTime;
          EditCadastroCDTIPOMOVIMENTO.Text := Fields.FieldByName('CDTIPOMOVIMENTO').AsString;
          EditCadastroCDTIPOMOVIMENTOExit(EditCadastroCDTIPOMOVIMENTO);
          EditCadastroCDUSUARIO.Text := Fields.FieldByName('CDUSUARIO').AsString;
          EditCadastroCDUSUARIOExit(EditCadastroCDUSUARIO);
          EditCadastroDERECEITA.Text := Fields.FieldByName('DERECEITA').AsString;
          if Fields.FieldByName('DEOBSERVACOES').IsNull = false then
            MemoCadastroDEOBSERVACOES.Lines.Text := Fields.FieldByName('DEOBSERVACOES').AsString;
          DatePickerEditCadastroDTCADASTRO.Date := Fields.FieldByName('DTREGISTRO').AsDateTime;
          if Fields.FieldByName('DTULTATUALIZACAO').IsNull = false then
            DatePickerEditCadastroDTULTATUALIZACAO.Date := Fields.FieldByName('DTULTATUALIZACAO').AsDateTime
          else
            DatePickerEditCadastroDTULTATUALIZACAO.Clear;
          // Mostra ou não o painel.
          // - Se cancelado, mostra o painel com a informação de cancelamento.
          PanelStatusCadastro.Visible := (Fields.FieldByName('FLCANCELADO').AsString = 'S');
          if PanelStatusCadastro.Visible then
            LabelStatusCadastro.Caption := 'Esta receita foi cancelada em ' + FormatDateTime('dd/mm/yyyy',Fields.FieldByName('DTCANCELAMENTO').AsDateTime) + '.';
        end
        else
          raise exception.Create('O cadastro da Receita não foi encontrado.');
        Active := false;

        populaGridItens;

        // Se for um despesa advinda de uma aquisição não permite edição.
        if PanelStatusCadastro.Visible then
          congelaTela(true)
        else
        begin
          // Na edição, estes campos são sempre somente leitura.
          EditCadastroCDTIPOMOVIMENTO.Enabled := false;
          EditCadastroDETIPOMOVIMENTO.Enabled := false;
          ButtonLimparTipoMovimento.Enabled := false;
          ButtonNovoTipoMovimento.Enabled := false;
        end;

        BitBtnNovo.Enabled := true;
        BitBtnInserirDocumento.Enabled := true;
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

procedure TfmCadReceita.editaColunaGrid(prmIndice: integer; prmNome,
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

procedure TfmCadReceita.EditCadastroCDTIPOMOVIMENTOChange(Sender: TObject);
var
  vChar: char;
begin
  with TAdvEdit(Sender) do
    if Length(Text) > 0 then
    begin
      OnChange := nil;
      vChar := Text[Length(Text)];
      // Verifica se o caractere digitado é válido.
      fmPrincipal.fnGeral.verificaNumeros(vChar,7);
      if vChar = #0 then
        Text := Copy(Text,1,Length(Text)-1);
      OnChange := EditCadastroCDTIPOMOVIMENTOChange;
      SelStart := Length(Text);
    end;
end;

procedure TfmCadReceita.EditCadastroCDTIPOMOVIMENTOExit(Sender: TObject);
var
  vQuery: TZQuery;
begin
  // Se não digitou nada, sai sem abrir a search.
  if Length(Trim(EditCadastroCDTIPOMOVIMENTO.Text)) = 0 then
    Exit;

  // Para que o evento não seja executado.
  EditCadastroCDTIPOMOVIMENTO.OnExit := nil;
  EditCadastroDETIPOMOVIMENTO.OnExit := nil;
  EditCadastroDETIPOMOVIMENTO.OnClickBtn := nil;

  try
    vQuery := pTipoMovimento.filtro;
    with vQuery do
    begin
      SQL.Add('WHERE "NU-Código" = :CDTIPOMOVIMENTO');
      SQL.Add('  AND "DE-Natureza" = ''Receita''');
      Params.ParamByName('CDTIPOMOVIMENTO').AsString := EditCadastroCDTIPOMOVIMENTO.Text;
      dmPrincipal.executaConsulta(vQuery);

      if not Eof then
      begin
        plTipoMovimento.Clear;
        plTipoMovimento.Add(Fields.Fields[0].AsString);
        EditCadastroCDTIPOMOVIMENTO.Text := Fields.Fields[0].AsString;
        EditCadastroDETIPOMOVIMENTO.Text := Fields.Fields[1].AsString;
      end
      else
      begin
        plTipoMovimento.Clear;
        EditCadastroCDTIPOMOVIMENTO.Clear;
        EditCadastroDETIPOMOVIMENTO.Clear;
        apresentaResultadoCadastro('Nenhum registro encontrado.');
      end;
      Active := false;
    end;
  finally
    FreeAndNil(vQuery);
    EditCadastroCDTIPOMOVIMENTO.Enabled := (plTipoMovimento.Count = 0);
    EditCadastroDETIPOMOVIMENTO.Enabled := (plTipoMovimento.Count = 0);
    ButtonLimparTipoMovimento.Enabled := (plTipoMovimento.Count > 0);
    ButtonNovoTipoMovimento.Enabled := (plTipoMovimento.Count = 0);

    // Valida para qual campo vai se posicionar.
    if OfficePagerCentral.ActivePageIndex = 0 then
      if plTipoMovimento.Count > 0 then
      begin
        if plUsuario.Count = 0 then
        begin
          if EditCadastroCDUSUARIO.Enabled then
            ActiveControl := EditCadastroCDUSUARIO;
        end
        else
          if EditCadastroDERECEITA.Enabled then
            ActiveControl := EditCadastroDERECEITA;
      end
      else
        if EditCadastroCDTIPOMOVIMENTO.Enabled then
          ActiveControl := EditCadastroCDTIPOMOVIMENTO;
  end;

  // Para que o evento volte a ser executado.
  EditCadastroCDTIPOMOVIMENTO.OnExit := EditCadastroCDTIPOMOVIMENTOExit;
  EditCadastroDETIPOMOVIMENTO.OnExit := EditCadastroDETIPOMOVIMENTOExit;
  EditCadastroDETIPOMOVIMENTO.OnClickBtn := EditCadastroDETIPOMOVIMENTOClickBtn;
end;

procedure TfmCadReceita.EditCadastroCDUSUARIOChange(Sender: TObject);
var
  vChar: char;
begin
  with TAdvEdit(Sender) do
    if Length(Text) > 0 then
    begin
      OnChange := nil;
      vChar := Text[Length(Text)];
      // Verifica se o caractere digitado é válido.
      fmPrincipal.fnGeral.verificaNumeros(vChar,7);
      if vChar = #0 then
        Text := Copy(Text,1,Length(Text)-1);
      OnChange := EditCadastroCDUSUARIOChange;
      SelStart := Length(Text);
    end;
end;

procedure TfmCadReceita.EditCadastroCDUSUARIOExit(Sender: TObject);
var
  vQuery: TZQuery;
begin
  if Length(Trim(EditCadastroCDUSUARIO.Text)) = 0 then
    Exit;

  // Para que o evento não seja executado.
  EditCadastroCDUSUARIO.OnExit := nil;
  EditCadastroNMLOGIN.OnExit := nil;
  EditCadastroNMUSUARIO.OnExit := nil;
  EditCadastroNMUSUARIO.OnClickBtn := nil;

  try
    vQuery := pUsuario.filtro;
    with vQuery do
    begin
      SQL.Add('WHERE "NU-Código" = :CDUSUARIO');
      Params.Items[0].AsString := EditCadastroCDUSUARIO.Text;
      dmPrincipal.executaConsulta(vQuery);

      if not Eof then
      begin
        plUsuario.Clear;
        plUsuario.Add(Fields.Fields[0].AsString);
        EditCadastroNMLOGIN.Text := Fields.Fields[1].AsString;
        EditCadastroNMUSUARIO.Text := Fields.Fields[2].AsString;
      end
      else
      begin
        plUsuario.Clear;
        EditCadastroCDUSUARIO.Clear;
        EditCadastroNMLOGIN.Clear;
        EditCadastroNMUSUARIO.Clear;
        apresentaResultadoCadastro('Nenhum registro encontrado.');
      end;
      Active := false;
    end;
  finally
    FreeAndNil(vQuery);

    EditCadastroCDUSUARIO.Enabled := (plUsuario.Count = 0);
    EditCadastroNMLOGIN.Enabled := (plUsuario.Count = 0);
    EditCadastroNMUSUARIO.Enabled := (plUsuario.Count = 0);
    if fmPrincipal.Administrador then
      ButtonLimparUsuario.Enabled := (plUsuario.Count > 0)
    else
      ButtonLimparUsuario.Enabled := false;

    // Valida para qual campo vai se posicionar.
    if OfficePagerCentral.ActivePageIndex = 1 then
      if plUsuario.Count = 0 then
        if EditCadastroCDUSUARIO.Enabled then
          ActiveControl := EditCadastroCDUSUARIO;
  end;

  // Para que o evento volte a ser executado.
  EditCadastroCDUSUARIO.OnExit := EditCadastroCDUSUARIOExit;
  EditCadastroNMLOGIN.OnExit := EditCadastroNMLOGINExit;
  EditCadastroNMUSUARIO.OnExit := EditCadastroNMUSUARIOExit;
  EditCadastroNMUSUARIO.OnClickBtn := EditCadastroNMUSUARIOClickBtn;
end;

procedure TfmCadReceita.EditCadastroNMLOGINExit(Sender: TObject);
var
  i: integer;
  vQuery: TZQuery;
begin
  if Length(Trim(EditCadastroNMLOGIN.Text)) = 0 then
    Exit;

  // Para que o evento não seja executado.
  EditCadastroCDUSUARIO.OnExit := nil;
  EditCadastroNMLOGIN.OnExit := nil;
  EditCadastroNMUSUARIO.OnExit := nil;
  EditCadastroNMUSUARIO.OnClickBtn := nil;

  try
    vQuery := pUsuario.filtro;
    with vQuery do
    begin
      SQL.Add('WHERE UPPER("LG-Login") LIKE :NMLOGIN');
      Params.ParamByName('NMLOGIN').AsString := '%'+AnsiUpperCase(EditCadastroNMLOGIN.Text)+'%';
      dmPrincipal.executaConsulta(vQuery);

      if RecordCount > 1 then
      begin
        fmConFiltroPadrao := TfmConFiltroPadrao.Create(Self);
        with fmConFiltroPadrao do
        begin
          try
            setaTitulo('Consulta de Usuários');
            setaConsulta(pUsuario.filtro);
            setaOpcao('R');
            executaFiltro(2,EditCadastroNMLOGIN.Text);
            ShowModal;
          finally
            plUsuario.Clear;
            with pResSearch do
              for i := 0 to Count -1 do
                if objResSearch[i].Id = buscaId then
                begin
                  plUsuario.Add(objResSearch[i].Codigo);
                  EditCadastroCDUSUARIO.Text := objResSearch[i].Codigo;
                  EditCadastroNMLOGIN.Text := objResSearch[i].Nome1;
                  EditCadastroNMUSUARIO.Text := objResSearch[i].Nome2;
                end;
          end;
        end;
      end
      else
        if not Eof then
        begin
          plUsuario.Clear;
          plUsuario.Add(Fields.Fields[0].AsString);
          EditCadastroCDUSUARIO.Text := Fields.Fields[0].AsString;
          EditCadastroNMLOGIN.Text := Fields.Fields[1].AsString;
          EditCadastroNMUSUARIO.Text := Fields.Fields[2].AsString;
        end
        else
          apresentaResultadoCadastro('Nenhum registro encontrado.');
      Active := false;
    end;
  finally
    FreeAndNil(vQuery);
    EditCadastroCDUSUARIO.Enabled := (plUsuario.Count = 0);
    EditCadastroNMLOGIN.Enabled := (plUsuario.Count = 0);
    EditCadastroNMUSUARIO.Enabled := (plUsuario.Count = 0);
    if fmPrincipal.Administrador then
      ButtonLimparUsuario.Enabled := (plUsuario.Count > 0);

    // Valida para qual campo vai se posicionar.
    if OfficePagerCentral.ActivePageIndex = 1 then
      if plUsuario.Count = 0 then
        if EditCadastroNMLOGIN.Enabled then
          ActiveControl := EditCadastroNMLOGIN;
  end;

  // Para que o evento volte a ser executado.
  EditCadastroCDUSUARIO.OnExit := EditCadastroCDUSUARIOExit;
  EditCadastroNMLOGIN.OnExit := EditCadastroNMLOGINExit;
  EditCadastroNMUSUARIO.OnExit := EditCadastroNMUSUARIOExit;
  EditCadastroNMUSUARIO.OnClickBtn := EditCadastroNMUSUARIOClickBtn;
end;

procedure TfmCadReceita.EditCadastroNUANORECEITAExit(Sender: TObject);
var
  vDataInicial, vDataFinal: TDate;
begin
  vDataInicial := StrToDate(Format('01/01/%s',[EditCadastroNUANORECEITA.Text]));
  vDataFinal := StrToDate(Format('31/12/%s',[EditCadastroNUANORECEITA.Text]));

  if (DatePickerEditCadastroDTRECEITA.Date < vDataInicial) or
     (DatePickerEditCadastroDTRECEITA.Date > vDataFinal) then
  begin
    DatePickerEditCadastroDTRECEITA.Date := vDataFinal;
    MessageBox(fmPrincipal.Handle,
               PWideChar('A data da receita informada não pertence ao ano informado.'+#13+#10+
                         'Por este motivo, o sistema ajustou automaticamente a data da receita para o primeiro dia deste ano.'+#13+#10+
                         'Por favor, reveja o campo Data da Receita.'),
               cTituloMensagemAlerta,
               MB_OK or MB_ICONWARNING);
  end;
end;

procedure TfmCadReceita.enviaEmail;
var
  vEmail: string;
  vQuery,vQuery2: TZQuery;
  vvlTotalGeral: currency;
begin
  try
    vQuery := pReceita.visao;
    with vQuery do
    begin
      SQL.Add('WHERE receita.cdreceita = :CDRECEITA');
      Params.Items[0].AsInteger := Codigo;
      dmPrincipal.executaConsulta(vQuery);

      if Eof then
        raise Exception.Create('Não foi possível consultar a receita cadastrada.');

      // Formata o e-mail de confirmação da Receita.
      vEmail := '<div align="left">'+
                'E-mail de confirmação de Cadastro de Receita.<br><br>'+
                '<b>Tipo de Movimento:</b> '+ Fields.Fields[1].AsString +'<br>'+
                '<b>Receita:</b> '+ Fields.Fields[2].AsString +'<br>'+
                '<b>Data do Registro:</b> '+ Fields.Fields[6].AsString +'<br>'+
                '<b>Data da Receita:</b> '+ Fields.Fields[5].AsString +'<br>'+
                '<b>Usuário (Login):</b> '+ Fields.Fields[3].AsString +'<br>'+
                '<b>Descrição:</b> '+ Fields.Fields[4].AsString +'<br>'+
                '</div>'+
                '<br>';
    end;

    vEmail := vEmail +
              '</div>'+
              '<br>'+
              '<table width="100%" border="1" cellspacing="0" cellpadding="1">'+
              '  <tr>'+
              '    <td width="30" style="white-space:nowrap; text-align:left"><b>Item</b></td>'+
              '    <td width="70" style="white-space:nowrap; text-align:left"><b>Data Pgto</b></td>'+
              '    <td width="80" style="white-space:nowrap; text-align:left"><b>Vl. Receita</b></td>'+
              '    <td width="*" style="white-space:nowrap; text-align:left"><b>Observações</b></td>'+
              '  </tr>';

    // Preenche os Itens da Receita.
    vQuery2 := pReceita.visaoItem;
    with vQuery2 do
    begin
      SQL.Add('WHERE cdreceita = :CDRECEITA');
      Params.Items[0].AsInteger := Codigo;
      dmPrincipal.executaConsulta(vQuery2);

      if Eof then
        raise Exception.Create('Não foi possível consultar os itens da receita cadastrada.');

      vvlTotalGeral := 0;
      while not Eof do
      begin
        // Calcula os totais gerais.
        vvlTotalGeral := vvlTotalGeral + Fields.Fields[3].AsCurrency;

        vEmail := vEmail +
                '  <tr>'+
                '    <td width="30" style="white-space:nowrap; text-align:right">'+ Fields.Fields[1].AsString +'</td>'+
                '    <td width="70" style="white-space:nowrap; text-align:left">'+ Fields.Fields[5].AsString +'</td>'+
                '    <td width="80" style="white-space:nowrap; text-align:right">'+ FormatFloat('"R$ ",0.00',Fields.Fields[3].AsCurrency) +'</td>'+
                '    <td width="*" style="white-space:nowrap; text-align:left">'+ Fields.Fields[4].AsString+'</td>'+
                '  </tr>';
        Next;
      end;

      // Apresenta o valor total geral.
      First;
      if not Eof then
        vEmail := vEmail +
                '  <tr>'+
                '    <td colspan="4" width="*" style="white-space:nowrap; text-align:right"><b>Total Geral:</b> '+ FormatFloat('"R$ ",0.00',vvlTotalGeral) +'</td>'+
                '  </tr>';
    end;

    vEmail := vEmail + '  </table>';

    try
      fmPrincipal.pLogSistema.Debug('Enviando e-mail.');
      fmPrincipal.enviaEmail('Cadastro de Receita',
                             fmPrincipal.EmailUsuarioLogado,
                             EmptyStr,
                             EmptyStr,
                             vEmail);
      fmPrincipal.pLogSistema.Debug('Concluído.');
    except
      on E: Exception do
        fmPrincipal.manipulaExcecoes(fmCadReceita,E);
    end;
  finally
    vQuery.Active := false;
    vQuery2.Active := false;
    FreeAndNil(vQuery);
    FreeAndNil(vQuery2);
  end;
end;

procedure TfmCadReceita.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfmCadReceita.FormCreate(Sender: TObject);
var
  i: integer;
begin
  try
    CreateGUID(pId);

    Color := Self.Color;
    FormStyler.AutoThemeAdapt := false;

    plTipoMovimento := TStringList.Create;
    plUsuario := TStringList.Create;

    pUsuario := TUsuario.Create;
    pTipoMovimento := TTipoMovimento.Create;
    pReceita := TReceita.Create;

    // Seta a opção padrão, que é inclusão.
    if Opcao <> 'A' then
      Opcao := 'I';

    OfficePagerCentral.ActivePageIndex := 1;

    Ordenacao := '|"Tipo de movimento":"S":"Asc."|;|"Receita":"S":"Asc."|;|"Usuário":"S":"Asc."|;|"Descrição":"S":"Asc."|;|"Data":"S":"Asc."|;|"Anexo":"N":"Asc."|;|"Visível":"N":"Asc."|;|"Código":"N":"Asc."|';

    // Monta a consulta que carregará os dados da Grid.
    QueryGeral.SQL := pReceita.grid.SQL;

    // Configura a Grid.
    with DBAdvGridGeral do
    begin
      DrawingStyle := gdsThemed;
      AutoThemeAdapt := false;
      for i := 0 to ColCount -1 do
        Columns[i].ShowBands := true;
      Bands.Active := true;
    end;
    with ColumnGridItens do
    begin
      DrawingStyle := gdsThemed;
      AutoThemeAdapt := false;
      for i := 0 to ColCount -1 do
        Columns[i].ShowBands := true;
      Bands.Active := true;
    end;

    ButtonExibirInvisiveis.Tag := 0;

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

procedure TfmCadReceita.FormDestroy(Sender: TObject);
begin
  FreeAndNil(plTipoMovimento);
  FreeAndNil(plUsuario);
  FreeAndNil(pUsuario);
  FreeAndNil(pTipoMovimento);
  FreeAndNil(pReceita);
end;

procedure TfmCadReceita.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Exit;
end;

procedure TfmCadReceita.FormResize(Sender: TObject);
begin
  EspacamentoInicial := fmPrincipal.EspacamentoInicialBotao;
  EspacamentoFinal := fmPrincipal.EspacamentoFinalBotao;
  EspacamentoEntre := fmPrincipal.EspacamentoEntreBotoes;

  BitBtnFechar.Left := PanelBotoes.Width - BitBtnFechar.Width - EspacamentoFinal;
  BitBtnInserirDocumento.Left := BitBtnFechar.Left - BitBtnInserirDocumento.Width - EspacamentoEntre;
  BitBtnCancelarReceita.Left := BitBtnInserirDocumento.Left - BitBtnCancelarReceita.Width - EspacamentoEntre;
  BitBtnNovo.Left := BitBtnCancelarReceita.Left - BitBtnNovo.Width - EspacamentoEntre;
  BitBtnRestaurar.Left := BitBtnNovo.Left - BitBtnRestaurar.Width - EspacamentoEntre;
  BitBtnSalvar.Left := BitBtnRestaurar.Left - BitBtnSalvar.Width - EspacamentoEntre;

  ButtonExcluirLinhaGridItens.Left := PanelBotoesControleGridItens.Width - ButtonExcluirLinhaGridItens.Width - EspacamentoFinal;
  ButtonAdicionarLinhaGridItens.Left := ButtonExcluirLinhaGridItens.Left - ButtonAdicionarLinhaGridItens.Width - EspacamentoEntre;
  ButtonAdicionarDadosGrid.Left := ButtonAdicionarLinhaGridItens.Left - ButtonAdicionarDadosGrid.Width - EspacamentoEntre;
end;

procedure TfmCadReceita.habilitaBotoes;
begin
  BitBtnSalvar.Enabled := true;
  BitBtnCancelarReceita.Enabled := true;
  BitBtnRestaurar.Enabled := true;
  BitBtnNovo.Enabled := true;
  BitBtnInserirDocumento.Enabled := true;
end;

procedure TfmCadReceita.ButtonLimparTipoMovimentoClick(Sender: TObject);
begin
  plTipoMovimento.Clear;

  EditCadastroCDTIPOMOVIMENTO.Clear;
  EditCadastroDETIPOMOVIMENTO.Clear;

  EditCadastroCDTIPOMOVIMENTO.Enabled := true;
  EditCadastroDETIPOMOVIMENTO.Enabled := true;
  ButtonLimparTipoMovimento.Enabled := false;
  ButtonNovoTipoMovimento.Enabled := true;
end;

procedure TfmCadReceita.ButtonLimparUsuarioClick(Sender: TObject);
begin
  plUsuario.Clear;

  EditCadastroCDUSUARIO.Clear;
  EditCadastroNMLOGIN.Clear;
  EditCadastroNMUSUARIO.Clear;

  EditCadastroCDUSUARIO.Enabled := true;
  EditCadastroNMLOGIN.Enabled := true;
  EditCadastroNMUSUARIO.Enabled := true;
  ButtonLimparUsuario.Enabled := false;
end;

procedure TfmCadReceita.ButtonNovoTipoMovimentoClick(Sender: TObject);
var
  vcdTipoMovimento: integer;
begin
  vcdTipoMovimento := 0;
  try
    fmCadTipoMovimento := TfmCadTipoMovimento.Create(Self);
    with fmCadTipoMovimento do
    begin
      try
        Tag := 1;
        NaturezaPadrao := 'R';
        ShowModal;

        vcdTipoMovimento := fmCadTipoMovimento.Codigo;
      except
        on E: exception do
          raise exception.Create('Não foi possível abrir a tela de Cadastro de Tipo de Movimento.'+#13#10+E.Message);
      end;
    end;
  finally
    // Verifica se foi cadastrada um tipo de despesa.
    if vcdTipoMovimento > 0 then
    begin
      if OfficePagerCentral.ActivePageIndex = 0 then
        if EditCadastroCDTIPOMOVIMENTO.Enabled then
          ActiveControl := EditCadastroCDTIPOMOVIMENTO;
      EditCadastroCDTIPOMOVIMENTO.Text := IntToStr(vcdTipoMovimento);
      EditCadastroCDTIPOMOVIMENTOExit(EditCadastroCDTIPOMOVIMENTO);
      ButtonLimparTipoMovimento.Enabled := true;
      ButtonNovoTipoMovimento.Enabled := false;
    end;
  end;
end;

procedure TfmCadReceita.MenuItemAtualizarTabelaClick(Sender: TObject);
var
  vOrdenacao: string;
begin
  try
    try
      Screen.Cursor := crSQLWait;

      vOrdenacao := fmPrincipal.fnGeral.obtemOrdenacaoFormatada(Ordenacao);
      if vOrdenacao <> EmptyStr then
        QueryGeral.SQL.Strings[QueryGeral.SQL.Count-1] := vOrdenacao;
      if ButtonExibirInvisiveis.Tag = 0 then
        QueryGeral.Params.ParamByName('FLVISIVEL').AsString := 'S'
      else
        QueryGeral.Params.ParamByName('FLVISIVEL').AsString := 'N';
      dmPrincipal.executaConsulta(QueryGeral);

      // Configura a Grid.
      editaColunaGrid(1,'DETIPOMOVIMENTO','Tipo de movimento',edNone,taLeftJustify,200,true);
      editaColunaGrid(2,'RECEITAF','Receita',edNone,taLeftJustify,55,true);
      editaColunaGrid(3,'NMLOGIN','Usuário',edNone,taLeftJustify,120,true);
      editaColunaGrid(4,'DERECEITA','Descrição',edNone,taLeftJustify,350,true);
      editaColunaGrid(5,'DTRECEITA','Data',edNone,Classes.taLeftJustify,70,true);
      editaColunaGrid(6,'FLANEXO','Anexo',edCheckBox,Classes.taCenter,40,true);
      editaColunaGrid(7,'FLVISIVEL','Visível',edCheckBox,Classes.taCenter,40,true);
      editaColunaGrid(8,'CDRECEITA','Código',edNone,taRightJustify,40,true);
      LabelTotalRegistros.Caption := 'Total de registros: ' + IntToStr(QueryGeral.RecordCount);
      DBAdvGridGeral.HideColumn(8);
      DBAdvGridGeral.AutoSizeColumns(true);
    except
      on E: Exception do
        fmPrincipal.manipulaExcecoes(Sender,E);
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfmCadReceita.MenuItemEditarRegistroClick(Sender: TObject);
begin
  Opcao := 'A';
  with DBAdvGridGeral do
    Codigo := ColumnByName['CDRECEITA'].Ints[Row];
  pReceita.Codigo := Codigo;
  editaCadastro;
  habilitaBotoes;

  if EditCadastroDERECEITA.Enabled then
    ActiveControl := EditCadastroDERECEITA;
end;

procedure TfmCadReceita.MenuItemVisualizarFiltroClick(Sender: TObject);
begin
  GridFindDialogColumnGrid.Execute;
end;

procedure TfmCadReceita.novoCadastro;
var
  vcdTipoMovimentoPadrao: string;
  vTipoMovimento: TTipoMovimento;
begin
  OfficePagerCentral.ActivePageIndex := 1;

  EditCadastroCDTIPOMOVIMENTO.OnExit := nil;
  EditCadastroDETIPOMOVIMENTO.OnExit := nil;
  EditCadastroDETIPOMOVIMENTO.OnClickBtn := nil;
  plTipoMovimento.Clear;
  EditCadastroCDTIPOMOVIMENTO.Clear;
  EditCadastroDETIPOMOVIMENTO.Clear;
  // Se houver o cadastro do Tipo de Movimento, obtém qual está cadastrada como padrão.
  ButtonLimparTipoMovimentoClick(ButtonLimparTipoMovimento);
  if Opcao = 'I' then
    try
      vTipoMovimento := TTipoMovimento.Create;
      vcdTipoMovimentoPadrao := IntToStr(vTipoMovimento.obtemPadrao('R'));
      if vcdTipoMovimentoPadrao <> '0' then
      begin
        EditCadastroCDTIPOMOVIMENTO.Text := vcdTipoMovimentoPadrao;
        EditCadastroCDTIPOMOVIMENTOExit(EditCadastroCDTIPOMOVIMENTO);
      end;
    finally
      FreeAndNil(vTipoMovimento);
    end;
  EditCadastroCDTIPOMOVIMENTO.OnExit := EditCadastroCDTIPOMOVIMENTOExit;
  EditCadastroDETIPOMOVIMENTO.OnExit := EditCadastroDETIPOMOVIMENTOExit;
  EditCadastroDETIPOMOVIMENTO.OnClickBtn := EditCadastroDETIPOMOVIMENTOClickBtn;

  EditCadastroNUANORECEITA.Text := FormatDateTime('yyyy',Date());
  EditCadastroNURECEITA.Clear;
  DatePickerEditCadastroDTRECEITA.Date := Date();

  // Preenche os dados do usuário.
  EditCadastroCDUSUARIO.Text := IntToStr(fmPrincipal.CodigoUsuarioLogado);
  EditCadastroCDUSUARIOExit(EditCadastroCDUSUARIO);

  EditCadastroDERECEITA.Clear;
  MemoCadastroDEOBSERVACOES.Lines.Clear;
  DatePickerEditCadastroDTCADASTRO.Clear;
  DatePickerEditCadastroDTULTATUALIZACAO.Clear;

  pValorPago := 0;
  pDataPagamento := Date();
  pIncrementarMes := true;

  limpaGridItens;

  if EditCadastroCDTIPOMOVIMENTO.Text = EmptyStr then
  begin
    if EditCadastroCDTIPOMOVIMENTO.Enabled then
      ActiveControl := EditCadastroCDTIPOMOVIMENTO;
  end
  else
    if EditCadastroDERECEITA.Enabled then
      ActiveControl := EditCadastroDERECEITA;
end;

procedure TfmCadReceita.obtemConfiguracaoItensReceita;
begin
  fmCadReceitaConfiguracao := TfmCadReceitaConfiguracao.Create(Self);
  with fmCadReceitaConfiguracao do
  begin
    ValorPago := pValorPago;
    DataPagamento := pDataPagamento;
    IncrementarMes := pIncrementarMes;

    ShowModal;

    // Se saiu pelo botão Aplicar salva os parâmetros.
    pValorPago := ValorPago;
    if ValorPago = -1 then
      Exit;
    pDataPagamento := DataPagamento;
    pIncrementarMes := IncrementarMes;
  end;
end;

procedure TfmCadReceita.OfficePageCadastroShow(Sender: TObject);
begin
  if OfficePagerCentral.ActivePageIndex = 0 then
  begin
    if EditCadastroDERECEITA.Enabled then
      ActiveControl := EditCadastroDERECEITA;
  end
  else
    if ColumnGridItens.Enabled then
      ActiveControl := ColumnGridItens;
end;

procedure TfmCadReceita.OfficePageConsultaShow(Sender: TObject);
begin
  if DBAdvGridGeral.Enabled then
    ActiveControl := DBAdvGridGeral;
end;

procedure TfmCadReceita.populaGridItens;
var
  vQuery: TZQuery;
  procedure insereDadosGrid(prmnuItem: integer; prmvlReceita: currency;
                            prmdtPagamento: TDate; prmdeObservacoes: string);
  begin
    with ColumnGridItens do
    begin
      if ColumnByName['NUITEM'].Rows[RowCount-1] <> EmptyStr then
        RowCount := RowCount +1;
      ColumnByName['NUITEM'].Ints[RowCount-1] := prmnuItem;
      ColumnByName['VLRECEITA'].Floats[RowCount-1] := prmvlReceita;
      ColumnByName['DTPAGAMENTO'].Dates[RowCount-1] := prmdtPagamento;
      ColumnByName['DEOBSERVACOES'].Rows[RowCount-1] := prmdeObservacoes;
      if prmdeObservacoes = EmptyStr then
        AddImageIdx(4,RowCount-1,0,haCenter,vaCenter)
      else
        AddImageIdx(4,RowCount-1,1,haCenter,vaCenter);
    end;
  end;
begin
  try
    try
      vQuery := pReceita.listaItem;
      with vQuery do
      begin
        // Consulta o cadastro dos Itens da Receita.
        SQL.Add('WHERE cdreceita = :CURRENT_CDRECEITA');
        SQL.Add('ORDER BY 2 ASC');
        Params.ParamByName('CURRENT_CDRECEITA').AsInteger := Codigo;
        dmPrincipal.executaConsulta(vQuery);

        if not Eof then
        begin
          ColumnGridItens.Enabled := true;
          ColumnGridItens.BeginUpdate;

          // Preeenche os dados da grid.
          while not Eof do
          begin
            insereDadosGrid(Fields.FieldByName('NUITEM').AsInteger,
                            Fields.FieldByName('VLRECEITA').AsCurrency,
                            Fields.FieldByName('DTPAGAMENTO').AsDateTime,
                            Fields.FieldByName('DEOBSERVACOES').AsString);

            Next;
          end;
          ColumnGridItens.EndUpdate;
          ColumnGridItens.Row := ColumnGridItens.RowCount -1;
        end
        else
          ColumnGridItens.Enabled := false;
      end;
    finally
      vQuery.Active := false;
      FreeAndNil(vQuery);
      atualizaSomatorioGrid;
    end;
  except
    on E: exception do
      raise;
  end;
end;

procedure TfmCadReceita.setaCadastroUnico;
begin
  BitBtnCancelarReceita.Enabled := false;
  BitBtnRestaurar.Enabled := false;
  BitBtnNovo.Enabled := false;
  BitBtnInserirDocumento.Enabled := false;
  OfficePageConsulta.TabVisible := false;
end;

procedure TfmCadReceita.TabSheetCadastroReceitaItensShow(Sender: TObject);
begin
  if ColumnGridItens.Enabled then
    ActiveControl := ColumnGridItens;
end;

procedure TfmCadReceita.TabSheetCadastroReceitaShow(Sender: TObject);
begin
  if EditCadastroDERECEITA.Enabled then
    ActiveControl := EditCadastroDERECEITA;
end;

procedure TfmCadReceita.ButtonExportarHTMLClick(Sender: TObject);
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

procedure TfmCadReceita.ButtonExportarPlanilhaClick(Sender: TObject);
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

procedure TfmCadReceita.ButtonImprimirRelatorioClick(Sender: TObject);
var
  vAux: string;
begin
  try
    QueryRelReceita.SQL := pReceita.relatorio.SQL;
    // Filtra pelo Usuário, caso informado no Painel Principal.
    if fmPrincipal.FiltroLogin <> cNenhumFiltroLogin then
      vAux := fmPrincipal.FiltroLogin
    else
      vAux := '%';
    QueryRelReceita.Params.ParamByName('NMLOGIN').AsString := vAux;
    dmPrincipal.executaConsulta(QueryRelReceita);
    with fmPrincipal.SystemRelatorio do
    begin
      DefaultDest := rdPreview;
      SystemSetups := SystemSetups - [ssAllowSetup];
      DoNativeOutput := false;
    end;
    with ProjectRelReceita do
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

procedure TfmCadReceita.ButtonOrdenarRegistrosClick(Sender: TObject);
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

procedure TfmCadReceita.carregaImagensBotoes;
begin
  EditCadastroNMUSUARIO.Button.Glyph.Assign(fmPrincipal.fnGeral.obtemImagemPesquisa);
  EditCadastroDETIPOMOVIMENTO.Button.Glyph.Assign(fmPrincipal.fnGeral.obtemImagemPesquisa);
  EditCadastroNMUSUARIO.Button.Glyph.Assign(fmPrincipal.fnGeral.obtemImagemPesquisa);

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
  ButtonExibirInvisiveis.Picture.LoadFromFile(fmPrincipal.LocalIcones + 'invisible-e-16.png');
  ButtonExibirInvisiveis.HotPicture.LoadFromFile(fmPrincipal.LocalIcones + 'invisible-h-16.png');
  ButtonExibirInvisiveis.DisabledPicture.LoadFromFile(fmPrincipal.LocalIcones + 'invisible-d-16.png');

  ButtonLimparTipoMovimento.Picture.LoadFromFile(fmPrincipal.LocalIcones + 'erase-e-16.png');
  ButtonLimparTipoMovimento.HotPicture.LoadFromFile(fmPrincipal.LocalIcones + 'erase-h-16.png');
  ButtonLimparTipoMovimento.DisabledPicture.LoadFromFile(fmPrincipal.LocalIcones + 'erase-d-16.png');
  ButtonLimparUsuario.Picture.LoadFromFile(fmPrincipal.LocalIcones + 'erase-e-16.png');
  ButtonLimparUsuario.HotPicture.LoadFromFile(fmPrincipal.LocalIcones + 'erase-h-16.png');
  ButtonLimparUsuario.DisabledPicture.LoadFromFile(fmPrincipal.LocalIcones + 'erase-d-16.png');
  ButtonNovoTipoMovimento.Picture.LoadFromFile(fmPrincipal.LocalIcones + 'new-e-16.png');
  ButtonNovoTipoMovimento.HotPicture.LoadFromFile(fmPrincipal.LocalIcones + 'new-h-16.png');
  ButtonNovoTipoMovimento.DisabledPicture.LoadFromFile(fmPrincipal.LocalIcones + 'new-d-16.png');

  ButtonAdicionarDadosGrid.Picture.LoadFromFile(fmPrincipal.LocalIcones + 'purchase-order-e-16.png');
  ButtonAdicionarDadosGrid.HotPicture.LoadFromFile(fmPrincipal.LocalIcones + 'purchase-order-h-16.png');
  ButtonAdicionarDadosGrid.DisabledPicture.LoadFromFile(fmPrincipal.LocalIcones + 'purchase-order-d-16.png');
  ButtonAdicionarLinhaGridItens.Picture.LoadFromFile(fmPrincipal.LocalIcones + 'add-row-e-16.png');
  ButtonAdicionarLinhaGridItens.HotPicture.LoadFromFile(fmPrincipal.LocalIcones + 'add-row-h-16.png');
  ButtonAdicionarLinhaGridItens.DisabledPicture.LoadFromFile(fmPrincipal.LocalIcones + 'add-row-d-16.png');
  ButtonExcluirLinhaGridItens.Picture.LoadFromFile(fmPrincipal.LocalIcones + 'delete-row-e-16.png');
  ButtonExcluirLinhaGridItens.HotPicture.LoadFromFile(fmPrincipal.LocalIcones + 'delete-row-h-16.png');
  ButtonExcluirLinhaGridItens.DisabledPicture.LoadFromFile(fmPrincipal.LocalIcones + 'delete-row-d-16.png');

  fmPrincipal.fnGeral.insereImageList(ImageList,fmPrincipal.LocalIcones + 'note-2-e-16.png');
  fmPrincipal.fnGeral.insereImageList(ImageList,fmPrincipal.LocalIcones + 'note-2-green-16.png');
  ColumnGridItens.GridImages := ImageList;
end;

function TfmCadReceita.validaExclusao: boolean;
begin
  Result := true;
end;

end.
