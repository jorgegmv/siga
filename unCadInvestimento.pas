unit unCadInvestimento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, Grids, AdvObj, BaseGrid, AdvGrid, AdvCGrid, AsgFindDialog, ComCtrls,
  Menus, UnAplExportaXLS, ImgList, ToolWin, MaskUtils, DBAdvGrid, RpCon,
  RpConDS, RpBase, RpSystem, RpDefine, RpRave, RpRender, RpRenderPDF, ShellAPI,
  Vcl.Mask, DateUtils, AdvAppStyler, AdvGlowButton, AdvMenus, AdvEdit, AdvEdBtn,
  PlannerDatePicker, AdvOfficeButtons, AdvMoneyEdit, AdvGroupBox,
  tmsAdvGridExcel, AdvToolBar, AdvOfficePager, AdvPanel, unInvestimento,
  unUsuario, unTipoMovimento;

type
  TfmCadInvestimento = class(TForm)
    QueryGeral: TZQuery;
    GridFindDialogColumnGrid: TAdvGridFindDialog;
    DBAdvGridGeral: TDBAdvGrid;
    DataSource: TDataSource;
    LabelTipoMovimento: TLabel;
    LabelUsuario: TLabel;
    SaveDialog: TSaveDialog;
    ProjectRelInvestimento: TRvProject;
    DataSetConnectionRelInvestimento: TRvDataSetConnection;
    QueryRelInvestimento: TZQuery;
    ColumnGridItens: TAdvColumnGrid;
    LabelInvestimento: TLabel;
    FormStyler: TAdvFormStyler;
    PopupMenuGrid: TAdvPopupMenu;
    MenuItemEditarRegistro: TMenuItem;
    MenuItemAtualizarTabela: TMenuItem;
    MenuItemEspaco1: TMenuItem;
    MenuItemVisualizarFiltro: TMenuItem;
    ButtonLimparTipoMovimento: TAdvGlowButton;
    ButtonLimparUsuario: TAdvGlowButton;
    ButtonNovoTipoMovimento: TAdvGlowButton;
    EditCadastroCDUSUARIO: TAdvEdit;
    EditCadastroNMLOGIN: TAdvEdit;
    EditCadastroCDTIPOMOVIMENTO: TAdvEdit;
    EditCadastroNMUSUARIO: TAdvEditBtn;
    EditCadastroDETIPOMOVIMENTO: TAdvEditBtn;
    PanelBotoes: TAdvPanel;
    BitBtnFechar: TAdvGlowButton;
    BitBtnSalvar: TAdvGlowButton;
    BitBtnNovo: TAdvGlowButton;
    BitBtnSacarTodoInvestimento: TAdvGlowButton;
    BitBtnRestaurar: TAdvGlowButton;
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
    GroupBoxInvestimento: TAdvGroupBox;
    GroupBoxItensInvestimento: TAdvGroupBox;
    PanelTotalizador: TAdvPanel;
    PanelTotalizadorItens: TAdvPanel;
    LabelTotalizadorItens: TLabel;
    PanelTotalizadorValor: TAdvPanel;
    LabelTotalizadorValor: TLabel;
    PanelTotalizadorEspaco: TAdvPanel;
    PanelGridItens: TAdvPanel;
    PanelItensInvestimento: TAdvPanel;
    AdvGridExcelIO: TAdvGridExcelIO;
    PanelBotoesControleGridItens: TAdvPanel;
    ButtonAdicionarLinhaGridItens: TAdvGlowButton;
    ButtonExcluirLinhaGridItens: TAdvGlowButton;
    EditCadastroDEINVESTIMENTO: TAdvEdit;
    DatePickerEditCadastroDTINVESTIMENTO: TPlannerDatePicker;
    ButtonExibirInvisiveis: TAdvGlowButton;
    DatePickerEditCadastroDTCADASTRO: TPlannerDatePicker;
    LabelDataUltimaAtualizacao: TLabel;
    DatePickerEditCadastroDTULTATUALIZACAO: TPlannerDatePicker;
    LabelDataInvestimento: TLabel;
    LabelDataCadastro: TLabel;
    BitBtnSaqueParcialInvestimento: TAdvGlowButton;
    AdvGridUndoRedo: TAdvGridUndoRedo;
    ImageList: TImageList;
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtnFecharClick(Sender: TObject);
    procedure BitBtnNovoClick(Sender: TObject);
    procedure BitBtnSalvarClick(Sender: TObject);
    procedure BitBtnSacarTodoInvestimentoClick(Sender: TObject);
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
    procedure ColumnGridItensClickCell(Sender: TObject; ARow, ACol: Integer);
    procedure EditCadastroCDTIPOMOVIMENTOExit(Sender: TObject);
    procedure EditCadastroDETIPOMOVIMENTOExit(Sender: TObject);
    procedure ButtonLimparTipoMovimentoClick(Sender: TObject);
    procedure ButtonNovoTipoMovimentoClick(Sender: TObject);
    procedure ColumnGridItensCellsChanged(Sender: TObject; R: TRect);
    procedure OfficePageCadastroShow(Sender: TObject);
    procedure OfficePageConsultaShow(Sender: TObject);
    procedure EditCadastroDETIPOMOVIMENTOClickBtn(Sender: TObject);
    procedure EditCadastroNMUSUARIOClickBtn(Sender: TObject);
    procedure EditCadastroCDTIPOMOVIMENTOChange(Sender: TObject);
    procedure EditCadastroCDUSUARIOChange(Sender: TObject);
    procedure ColumnGridItensEllipsClick(Sender: TObject; ACol, ARow: Integer;
      var S: string);
    procedure ColumnGridItensGetEditorType(Sender: TObject; ACol, ARow: Integer;
      var AEditor: TEditorType);
    procedure DBAdvGridGeralClickCell(Sender: TObject; ARow, ACol: Integer);
    procedure ButtonExibirInvisiveisClick(Sender: TObject);
    procedure BitBtnSaqueParcialInvestimentoClick(Sender: TObject);
  private
    { Private declarations }
    pId: TGUID;
    pOpcao: Char;
    pCodigo, pEspacamentoInicial, pEspacamentoFinal, pEspacamentoEntre: integer;
    pOrdenacao, pOcultarExibir: string;
    plTipoMovimento, plUsuario: TStringList;
    pInvestimento: TInvestimento;
    pUsuario: TUsuario;
    pTipoMovimento: TTipoMovimento;
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
    procedure adicionaLinha;
    procedure atualizaInvestimentoVisivel;
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
  fmCadInvestimento: TfmCadInvestimento;

implementation

uses unPrincipal, undmPrincipal, unAplOrdenaGrid, unConFiltroPadrao,
  unAplEditaTexto, unCadTipoMovimento, unCadDocumento, undmEstilo,
  unCadInvestimentoLimite, unCadInvestimentoSaqueParcial;

{$R *.dfm}

procedure TfmCadInvestimento.adicionaLinha;
begin
  with ColumnGridItens do
  begin
    if ColumnByName['NUITEM'].Ints[RowCount -1] > 0 then
      AddRow;
    ColumnByName['VLINVESTIMENTO'].Floats[RowCount-1] := 0;
    ColumnByName['DTINVESTIMENTO'].Dates[RowCount-1] := Date();
  end;
end;

procedure TfmCadInvestimento.apresentaResultadoCadastro(prmMensagem: string);
begin
  MessageBox(fmPrincipal.Handle,
             PWideChar(prmMensagem),
             cTituloMensagemInformacao,
             MB_OK or MB_ICONINFORMATION);
end;

procedure TfmCadInvestimento.atualizaCadastro;
var
  i, vRetorno: integer;
  vErro: boolean;
begin
  try
    vErro := false;
    pInvestimento.Usuario := StrToInt(EditCadastroCDUSUARIO.Text);
    pInvestimento.Nome := EditCadastroDEINVESTIMENTO.Text;
    pInvestimento.Data := DatePickerEditCadastroDTINVESTIMENTO.Date;
    vRetorno := pInvestimento.atualiza;

    if vRetorno <> 0 then
      with ColumnGridItens do
        for i := 1 to RowCount -1 do
        begin
          pInvestimento.CodigoItem := ColumnByName['NUITEM'].Ints[i];
          pInvestimento.Valor := ColumnByName['VLINVESTIMENTO'].Floats[i];
          pInvestimento.Data := ColumnByName['DTINVESTIMENTO'].Dates[i];
          pInvestimento.Observacoes := ColumnByName['DEOBSERVACOES'].Rows[i];
          if ColumnByName['NUITEM'].Rows[i] <> EmptyStr then
            vErro := (pInvestimento.atualizaItem = 0)
          else
            vErro := (pInvestimento.insereItem = 0);
        end;

    if vRetorno <> 0 then
    begin
      if not vErro then
      begin
        // Atualiza a tabela de Usuário Saldo.
        //fmPrincipal.atualizaUsuarioSaldo;

        fmPrincipal.apresentaResultadoCadastro('Cadastro atualizado com sucesso.');
      end
      else
        apresentaResultadoCadastro('Investimento atualizado com sucesso, mas alguns itens não puderam ser atualizados.');

      // Envia o e-mail pro usuário.
      if fmPrincipal.SempreEnviaEmailCadastroInvestimento = true then
        enviaEMail;
    end
    else
      raise Exception.Create('Não foi possível atualizar o cadastro.');
  except
    on E: exception do
      raise;
  end;
end;

procedure TfmCadInvestimento.atualizaInvestimentoVisivel;
var
  vMensagem: string;
  vRetorno, vCodigo: integer;
begin
  // Verifica deseja realmente ocultar/exibir.
  with DBAdvGridGeral do
  begin
    if Row = 0 then
      Exit;

    vCodigo := ColumnByName['CDINVESTIMENTO'].Ints[Row];
    pInvestimento.Codigo := vCodigo;
  end;

  if pOcultarExibir = 'ocultar' then
    vMensagem := 'Deseja realmente ocultar o investimento?'
  else
    vMensagem := 'Deseja realmente tornar o investimento visível?';
  vRetorno := MessageBox(fmPrincipal.Handle,PWideChar(vMensagem),cTituloMensagemConfirmacao,MB_YESNO or MB_ICONQUESTION or MB_DEFBUTTON2);
  if vRetorno <> mrYes then
    Exit;

  if pOcultarExibir = 'ocultar' then
    pInvestimento.setaVisivel('N')
  else
    pInvestimento.setaVisivel('S');

  MenuItemAtualizarTabelaClick(fmCadInvestimento);
end;

procedure TfmCadInvestimento.atualizaSomatorioGrid;
var
  vValor: currency;
begin
  // Atualiza os totais.
  with ColumnGridItens do
  begin
    if ColumnByName['VLINVESTIMENTO'].Rows[1] <> EmptyStr then
      LabelTotalizadorItens.Caption := 'Total de itens: ' + IntToStr(RowCount -1)
    else
      LabelTotalizadorItens.Caption := 'Total de itens: 0';
    vValor := ColumnSum(2,1,RowCount -1);
    LabelTotalizadorValor.Caption := 'Valor total: ' + FormatFloat('"R$ ",0.00',vValor);
  end;
end;

procedure TfmCadInvestimento.BitBtnRestaurarClick(Sender: TObject);
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

procedure TfmCadInvestimento.ButtonAdicionarLinhaGridItensClick(Sender: TObject);
begin
  adicionaLinha;
  atualizaSomatorioGrid;
end;

procedure TfmCadInvestimento.BitBtnSacarTodoInvestimentoClick(Sender: TObject);
var
  vRetorno: integer;
begin
  // Valida se realmente o usuário quer realizar a exclusão.
  if MessageBox(fmPrincipal.Handle,
                PWideChar('Deseja realmente realizar o saque de todo o investimento?'),
                cTituloMensagemConfirmacao,
                MB_YESNO or MB_ICONQUESTION or MB_DEFBUTTON2) = IDNO then
    Exit;

  try
    vRetorno := pInvestimento.exclui;

    if vRetorno <> 0 then
    begin
      fmPrincipal.apresentaResultadoCadastro('Investimento sacado com sucesso.');
      BitBtnNovoClick(Sender);
    end
    else
      raise Exception.Create('Não foi possível sacar o cadastro.');

    // Atualiza a tabela de Usuário Saldo.
    //fmPrincipal.atualizaUsuarioSaldo;

    // Atualiza a Grid.
    MenuItemAtualizarTabelaClick(Sender);
  except
    on E: exception do
      fmPrincipal.manipulaExcecoes(Sender,E);
  end;
end;

procedure TfmCadInvestimento.ButtonExcluirLinhaGridItensClick(Sender: TObject);
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
                PWideChar('Deseja realmente realizar a exclusão do item do investimento selecionado?'),
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
      pInvestimento.CodigoItem := ColumnByName['NUITEM'].Ints[Row];
      vRetorno := pInvestimento.excluiItem;

      limpaGridItens;
      populaGridItens;
    end;

    if vRetorno <> 0 then
      apresentaResultadoCadastro('Item do investimento excluído com sucesso.')
    else
      raise Exception.Create('Não foi possível excluir o item do investimento.');

    // Atualiza a tabela de Usuário Saldo.
    //fmPrincipal.atualizaUsuarioSaldo;
  except
    on E: exception do
      fmPrincipal.manipulaExcecoes(Sender,E);
  end;
end;

procedure TfmCadInvestimento.ButtonExibirInvisiveisClick(Sender: TObject);
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

procedure TfmCadInvestimento.BitBtnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfmCadInvestimento.insereCadastro;
var
  i, vRetorno: integer;
begin
  try
    vRetorno := -1;

    pInvestimento.Movimento := StrToInt(EditCadastroCDTIPOMOVIMENTO.Text);
    pInvestimento.Usuario := StrToInt(EditCadastroCDUSUARIO.Text);
    pInvestimento.Nome := EditCadastroDEINVESTIMENTO.Text;
    pInvestimento.Data := DatePickerEditCadastroDTINVESTIMENTO.Date;
    Codigo := pInvestimento.insere;

    if Codigo <> 0 then
    begin
      pInvestimento.Codigo := Codigo;
      with ColumnGridItens do
        for i := 1 to RowCount -1 do
        begin
          try
            pInvestimento.Valor := ColumnByName['VLINVESTIMENTO'].Floats[i];
            pInvestimento.Data := ColumnByName['DTINVESTIMENTO'].Dates[i];
            pInvestimento.Observacoes := ColumnByName['DEOBSERVACOES'].Rows[i];
            vRetorno := pInvestimento.insereItem;
          finally
            if vRetorno = 0 then
            begin
              pInvestimento.exclui;
              raise Exception.Create('Não foi possível incluir o cadastro.');
            end;
          end;
        end;

      // Atualiza a tabela de Usuário Saldo.
      //fmPrincipal.atualizaUsuarioSaldo;

      fmPrincipal.apresentaResultadoCadastro('Cadastro incluído com sucesso.');

      // Envia o e-mail pro usuário.
      if fmPrincipal.SempreEnviaEmailCadastroInvestimento = true then
        enviaEMail;
    end
    else
      raise Exception.Create('Não foi possível incluir o cadastro.');
  except
    on E: exception do
      raise;
  end;
end;

procedure TfmCadInvestimento.limpaGridItens;
begin
  with ColumnGridItens do
  begin
    BeginUpdate;
    RowCount := 2;
    ClearRows(1,1);
    ColumnByName['VLINVESTIMENTO'].FloatFormat := '%.2f';
    ColumnByName['VLINVESTIMENTO'].SortPrefix := 'R$';
    AddImageIdx(4,1,0,haCenter,vaCenter);
    HideColumn(5);
    EndUpdate;
  end;
  atualizaSomatorioGrid;
end;

procedure TfmCadInvestimento.BitBtnNovoClick(Sender: TObject);
begin
  congelaTela(false);
  pOpcao := 'I';
  desabilitaBotoes;
  novoCadastro;
  BitBtnSalvar.Enabled := true;
  BitBtnRestaurar.Enabled := true;
end;

procedure TfmCadInvestimento.BitBtnSalvarClick(Sender: TObject);
var
  i: integer;
  vMensagem: string;
  vOk: boolean;
begin
  desabilitaBotoes;

  // Validações.
  vMensagem := EmptyStr;
  if AnsiCompareText(EditCadastroDEINVESTIMENTO.Text,EmptyStr) = 0 then
    vMensagem := vMensagem + #13#10'- O campo Investimento é requerido.';
  if AnsiCompareText(EditCadastroCDUSUARIO.Text,EmptyStr) = 0 then
    vMensagem := vMensagem + #13#10'- O campo Usuário é requerido.';

  // Valida se existe pelo menos 1 item.
  vOk := false;
  with ColumnGridItens do
    for i := 1 to RowCount -1 do
      if (ColumnByName['VLINVESTIMENTO'].Rows[i] <> EmptyStr) and
         (ColumnByName['DTINVESTIMENTO'].Rows[i] <> EmptyStr) then
      begin
        vOk := true;
        break;
      end;

  if not vOk then
    vMensagem := vMensagem + #13#10'- É preciso informar pelo menos 1 item para o investimento.';

  if vMensagem <> EmptyStr then
  begin
    BitBtnSalvar.Enabled := true;
    if Opcao = 'A' then
    begin
      BitBtnSaqueParcialInvestimento.Enabled := true;
      BitBtnSacarTodoInvestimento.Enabled := true;
    end;
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

    if EditCadastroDEINVESTIMENTO.Enabled then
      ActiveControl := EditCadastroDEINVESTIMENTO;
  except
    on E: Exception do
      fmPrincipal.manipulaExcecoes(Sender,E);
  end;
end;

procedure TfmCadInvestimento.BitBtnSaqueParcialInvestimentoClick(
  Sender: TObject);
var
  vAtualizar: boolean;
  vValorInvestido: currency;
begin
  if ColumnGridItens.Row <= 0 then
    Exit;

  vAtualizar := true;
  try
    with ColumnGridItens do
    begin
      if ColumnByName['VLINVESTIMENTO'].Rows[1] = EmptyStr then
      begin
        MessageBox(fmPrincipal.Handle,
                   PWideChar('Identificado que não há valor a ser sacado.'),
                   cTituloMensagemInformacao,
                   MB_OK or MB_ICONWARNING);
        Exit;
      end;

      vValorInvestido := ColumnByName['VLINVESTIMENTO'].Floats[Row];

      fmCadInvestimentoSaqueParcial := TfmCadInvestimentoSaqueParcial.Create(Self);
      with fmCadInvestimentoSaqueParcial do
      begin
        try
          // Inicializa os valores;
          Usuario := EditCadastroNMLOGIN.Text;
          ValorInvestimentoAtual := vValorInvestido;
          ValorInvestimento := 0;
          ShowModal;
        finally
          if ValorInvestimento <> -1 then
            ColumnByName['VLINVESTIMENTO'].Floats[Row] := ColumnByName['VLINVESTIMENTO'].Floats[Row] - ValorInvestimento
          else
            vAtualizar := false;
        end;
      end;
    end;

    if vAtualizar = true then
    begin
      atualizaCadastro;
      // Atualiza a Grid.
      MenuItemAtualizarTabelaClick(Sender);
    end;
  except
    on E: exception do
      fmPrincipal.manipulaExcecoes(Sender,E);
  end;
end;

procedure TfmCadInvestimento.ColumnGridItensCanDeleteRow(Sender: TObject;
  ARow: Integer; var CanDelete: Boolean);
begin
  CanDelete := false;
  ButtonExcluirLinhaGridItensClick(Sender);
end;

procedure TfmCadInvestimento.ColumnGridItensCellsChanged(Sender: TObject; R: TRect);
begin
  atualizaSomatorioGrid;
end;

procedure TfmCadInvestimento.ColumnGridItensClickCell(Sender: TObject; ARow,
  ACol: Integer);
begin
  if ARow = 0 then
    Exit;

  if ACol = 4 then
    with ColumnGridItens do
      if ColumnByName['VLINVESTIMENTO'].Rows[ARow] <> EmptyStr then
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

procedure TfmCadInvestimento.ColumnGridItensEllipsClick(Sender: TObject; ACol,
  ARow: Integer; var S: string);
begin
  if ARow = 0 then
    Exit;
  if ACol <> 2 then
    Exit;
  if EditCadastroNMLOGIN.Text = EmptyStr then
  begin
    MessageBox(Handle,
               PWideChar('Identificado que o usuário não foi informado.'#13#10+
                         'Favor informar o usuário deste investimento.'),
               cTituloMensagemInformacao,
               MB_OK or MB_ICONINFORMATION);
    Exit;
  end;

  fmCadInvestimentoLimite := TfmCadInvestimentoLimite.Create(Self);
  with fmCadInvestimentoLimite do
  begin
    try
      // Inicializa os valores;
      Usuario := EditCadastroNMLOGIN.Text;
      ValorInvestimento := ColumnGridItens.ColumnByName['VLINVESTIMENTO'].Floats[ARow];
      ShowModal;
    finally
      if ValorInvestimento <> -1 then
      begin
        ColumnGridItens.ColumnByName['VLINVESTIMENTO'].Floats[ARow] := ValorInvestimento;
        S := FormatFloat(',0.00', ValorInvestimento);
      end;
    end;
  end;
end;

procedure TfmCadInvestimento.ColumnGridItensGetEditorType(Sender: TObject; ACol,
  ARow: Integer; var AEditor: TEditorType);
begin
  if ARow = 0 then
    Exit;

 if ACol = 2 then
 begin
   AEditor := edFloatEditBtn;
   with ColumnGridItens.BtnEdit do
   begin
     EditorEnabled := false;
     Glyph.Assign(fmPrincipal.fnGeral.obtemImagemCalculadora);
     ButtonCaption := EmptyStr;
   end;
 end;
end;

procedure TfmCadInvestimento.EditCadastroDETIPOMOVIMENTOClickBtn(
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
        setaFiltrosExtras('"DE-Natureza" = ''Investimento''',
                          'Natureza: Investimento');
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
          if EditCadastroDEINVESTIMENTO.Enabled then
            ActiveControl := EditCadastroDEINVESTIMENTO;
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

procedure TfmCadInvestimento.EditCadastroDETIPOMOVIMENTOExit(Sender: TObject);
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
      SQL.Add('  AND "DE-Natureza" = ''Investimento''');
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
            setaFiltrosExtras('"DE-Natureza" = ''Investimento''',
                              'Natureza: Investimento');
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
          if EditCadastroDEINVESTIMENTO.Enabled then
            ActiveControl := EditCadastroDEINVESTIMENTO;
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

procedure TfmCadInvestimento.EditCadastroNMUSUARIOClickBtn(Sender: TObject);
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

procedure TfmCadInvestimento.EditCadastroNMUSUARIOExit(Sender: TObject);
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

procedure TfmCadInvestimento.congelaTela(prmCongelar: boolean);
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
  EditCadastroDEINVESTIMENTO.Enabled := not prmCongelar;
  DatePickerEditCadastroDTINVESTIMENTO.Enabled := not prmCongelar;

  ButtonAdicionarLinhaGridItens.Enabled := not prmCongelar;
  ButtonExcluirLinhaGridItens.Enabled := not prmCongelar;
  BitBtnRestaurar.Enabled := not prmCongelar;
  BitBtnSaqueParcialInvestimento.Enabled := not prmCongelar;
  BitBtnSacarTodoInvestimento.Enabled := not prmCongelar;
  BitBtnSalvar.Enabled := not prmCongelar;

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

procedure TfmCadInvestimento.DBAdvGridGeralClickCell(Sender: TObject; ARow,
  ACol: Integer);
var
  vEstado: boolean;
begin
  if ARow = 0 then
    Exit;

  DBAdvGridGeral.GetCheckboxState(5, ARow, vEstado);
  if vEstado = true then
    pOcultarExibir := 'ocultar'
  else
    pOcultarExibir := 'exibir';

  // Considera como se tivesse clicado no checkbox de visível.
  if ACol = 5 then
    atualizaInvestimentoVisivel;
end;

procedure TfmCadInvestimento.DBAdvGridGeralDblClickCell(Sender: TObject; ARow,
  ACol: Integer);
begin
  if ARow > 0 then
    MenuItemEditarRegistroClick(MenuItemEditarRegistro);
end;

procedure TfmCadInvestimento.DBAdvGridGeralFilterSelect(Sender: TObject; Column,
  ItemIndex: Integer; FriendlyName: string; var FilterCondition: string);
begin
  case ItemIndex of
    0: FilterCondition := EmptyStr;
    1: FilterCondition := 'S';
    2: FilterCondition := 'N';
  end;

  DBAdvGridGeral.Cells[Column,0] := FriendlyName;
end;

procedure TfmCadInvestimento.desabilitaBotoes;
begin
  BitBtnSalvar.Enabled := false;
  BitBtnSaqueParcialInvestimento.Enabled := false;
  BitBtnSacarTodoInvestimento.Enabled := false;
  BitBtnRestaurar.Enabled := false;
  BitBtnNovo.Enabled := false;
end;

procedure TfmCadInvestimento.editaCadastro;
var
  vQuery: TZQuery;
begin
  novoCadastro;

  try
    try
      vQuery := pInvestimento.lista;
      with vQuery do
      begin
        // Consulta o cadastro do Investimento.
        SQL.Add('WHERE cdinvestimento = :CURRENT_CDINVESTIMENTO');
        Params.ParamByName('CURRENT_CDINVESTIMENTO').AsInteger := Codigo;
        dmPrincipal.executaConsulta(vQuery);

        if not Eof then
        begin
          DatePickerEditCadastroDTINVESTIMENTO.Date := Fields.FieldByName('DTINVESTIMENTO').AsDateTime;
          EditCadastroCDTIPOMOVIMENTO.Text := Fields.FieldByName('CDTIPOMOVIMENTO').AsString;
          EditCadastroCDTIPOMOVIMENTOExit(EditCadastroCDTIPOMOVIMENTO);
          EditCadastroCDUSUARIO.Text := Fields.FieldByName('CDUSUARIO').AsString;
          EditCadastroCDUSUARIOExit(EditCadastroCDUSUARIO);
          EditCadastroDEINVESTIMENTO.Text := Fields.FieldByName('DEINVESTIMENTO').AsString;
          DatePickerEditCadastroDTCADASTRO.Date := Fields.FieldByName('DTREGISTRO').AsDateTime;
          if Fields.FieldByName('DTULTATUALIZACAO').IsNull = false then
            DatePickerEditCadastroDTULTATUALIZACAO.Date := Fields.FieldByName('DTULTATUALIZACAO').AsDateTime
          else
            DatePickerEditCadastroDTULTATUALIZACAO.Clear;
        end
        else
          raise exception.Create('O cadastro do Investimento não foi encontrado.');
        Active := false;

        populaGridItens;

        // Na edição, estes campos são sempre somente leitura.
        EditCadastroCDTIPOMOVIMENTO.Enabled := false;
        EditCadastroDETIPOMOVIMENTO.Enabled := false;
        ButtonLimparTipoMovimento.Enabled := false;
        ButtonNovoTipoMovimento.Enabled := false;

        BitBtnNovo.Enabled := true;
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

procedure TfmCadInvestimento.editaColunaGrid(prmIndice: integer; prmNome,
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

procedure TfmCadInvestimento.EditCadastroCDTIPOMOVIMENTOChange(Sender: TObject);
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

procedure TfmCadInvestimento.EditCadastroCDTIPOMOVIMENTOExit(Sender: TObject);
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
      SQL.Add('  AND "DE-Natureza" = ''Investimento''');
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
          if EditCadastroDEINVESTIMENTO.Enabled then
            ActiveControl := EditCadastroDEINVESTIMENTO;
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

procedure TfmCadInvestimento.EditCadastroCDUSUARIOChange(Sender: TObject);
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

procedure TfmCadInvestimento.EditCadastroCDUSUARIOExit(Sender: TObject);
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

procedure TfmCadInvestimento.EditCadastroNMLOGINExit(Sender: TObject);
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

procedure TfmCadInvestimento.enviaEmail;
var
  vEmail: string;
  vQuery,vQuery2: TZQuery;
  vvlTotalGeral: currency;
begin
  try
    vQuery := pInvestimento.visao;
    with vQuery do
    begin
      SQL.Add('WHERE investimento.cdinvestimento = :CDINVESTIMENTO');
      Params.Items[0].AsInteger := Codigo;
      dmPrincipal.executaConsulta(vQuery);

      if Eof then
        raise Exception.Create('Não foi possível consultar o investimento cadastrado.');

      // Formata o e-mail de confirmação do Investimento.
      vEmail := '<div align="left">'+
                'E-mail de confirmação de Cadastro de Investimento.<br><br>'+
                '<b>Tipo de Movimento:</b> '+ Fields.Fields[1].AsString +'<br>'+
                '<b>Investimento:</b> '+ Fields.Fields[3].AsString +'<br>'+
                '<b>Data do Investimento:</b> '+ Fields.Fields[4].AsString +'<br>'+
                '<b>Usuário (Login):</b> '+ Fields.Fields[2].AsString +'<br>'+
                '<b>Data do Registro:</b> '+ Fields.Fields[5].AsString +'<br>'+
                '</div>'+
                '<br>';
    end;

    vEmail := vEmail +
              '</div>'+
              '<br>'+
              '<table width="100%" border="1" cellspacing="0" cellpadding="1">'+
              '  <tr>'+
              '    <td width="30" style="white-space:nowrap; text-align:left"><b>Item</b></td>'+
              '    <td width="100" style="white-space:nowrap; text-align:left"><b>Valor Investido</b></td>'+
              '    <td width="95" style="white-space:nowrap; text-align:left"><b>Data Aplicação</b></td>'+
              '    <td width="*" style="white-space:nowrap; text-align:left"><b>Observações</b></td>'+
              '  </tr>';

    // Preenche os Itens do Investimento.
    vQuery2 := pInvestimento.visaoItem;
    with vQuery2 do
    begin
      SQL.Add('WHERE cdinvestimento = :CDINVESTIMENTO');
      Params.Items[0].AsInteger := Codigo;
      dmPrincipal.executaConsulta(vQuery2);

      if Eof then
        raise Exception.Create('Não foi possível consultar os itens do investimento cadastrado.');

      vvlTotalGeral := 0;
      while not Eof do
      begin
        // Calcula os totais gerais.
        vvlTotalGeral := vvlTotalGeral + Fields.Fields[3].AsCurrency;

        vEmail := vEmail +
                '  <tr>'+
                '    <td width="30" style="white-space:nowrap; text-align:right">'+ Fields.Fields[1].AsString +'</td>'+
                '    <td width="100" style="white-space:nowrap; text-align:right">'+ FormatFloat('"R$ ",0.00',Fields.Fields[3].AsCurrency) +'</td>'+
                '    <td width="90" style="white-space:nowrap; text-align:left">'+ Fields.Fields[2].AsString +'</td>'+
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
      fmPrincipal.enviaEmail('Cadastro de Investimento',
                             fmPrincipal.EmailUsuarioLogado,
                             EmptyStr,
                             EmptyStr,
                             vEmail);
      fmPrincipal.pLogSistema.Debug('Concluído.');
    except
      on E: Exception do
        fmPrincipal.manipulaExcecoes(fmCadInvestimento,E);
    end;
  finally
    vQuery.Active := false;
    vQuery2.Active := false;
    FreeAndNil(vQuery);
    FreeAndNil(vQuery2);
  end;
end;

procedure TfmCadInvestimento.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfmCadInvestimento.FormCreate(Sender: TObject);
var
  i: integer;
begin
  try
    CreateGUID(pId);

    Color := Self.Color;
    FormStyler.AutoThemeAdapt := false;

    plTipoMovimento := TStringList.Create;
    plUsuario := TStringList.Create;

    // Seta a opção padrão, que é inclusão.
    if Opcao <> 'A' then
      Opcao := 'I';

    pInvestimento := TInvestimento.Create;
    pUsuario := TUsuario.Create;
    pTipoMovimento := TTipoMovimento.Create;

    OfficePagerCentral.ActivePageIndex := 1;

    Ordenacao := '|"Tipo de movimento":"S":"Asc."|;|"Usuário":"S":"Asc."|;|"Investimento":"N":"Asc."|;|"Data":"S":"Asc."||"Visível":"N":"Asc."|;|"Código":"N":"Asc."|';

    // Monta a consulta que carregará os dados da Grid.
    with QueryGeral do
    begin
      SQL := pInvestimento.grid.SQL;
      SQL.Strings[0] := 'SELECT investimento.detipomovimento, investimento.nmlogin, investimento.deinvestimento, investimento.dtinvestimento, investimento.flvisivel, investimento.cdinvestimento';
      SQL.Add('WHERE 1 = 1');
      // Filtra pelo Usuário, caso informado no Painel Principal.
      if fmPrincipal.FiltroLogin <> cNenhumFiltroLogin then
        SQL.Add('  AND investimento.nmlogin = ' + QuotedStr(fmPrincipal.FiltroLogin));
      SQL.Add('  AND (investimento.flvisivel = ''S'' OR investimento.flvisivel = :FLVISIVEL)');
      SQL.Add('ORDER BY 1,2,3,4');
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

    fmPrincipal.fnGeral.insereImageList(ImageList,fmPrincipal.LocalIcones + 'note-2-e-16.png');
    fmPrincipal.fnGeral.insereImageList(ImageList,fmPrincipal.LocalIcones + 'note-2-green-16.png');
    ColumnGridItens.GridImages := ImageList;

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

procedure TfmCadInvestimento.FormDestroy(Sender: TObject);
begin
  FreeAndNil(plTipoMovimento);
  FreeAndNil(plUsuario);
  FreeAndNil(pInvestimento);
  FreeAndNil(pUsuario);
  FreeAndNil(pTipoMovimento);
end;

procedure TfmCadInvestimento.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Exit;
end;

procedure TfmCadInvestimento.FormResize(Sender: TObject);
begin
  EspacamentoInicial := fmPrincipal.EspacamentoInicialBotao;
  EspacamentoFinal := fmPrincipal.EspacamentoFinalBotao;
  EspacamentoEntre := fmPrincipal.EspacamentoEntreBotoes;

  BitBtnFechar.Left := PanelBotoes.Width - BitBtnFechar.Width - EspacamentoFinal;
  BitBtnSacarTodoInvestimento.Left := BitBtnFechar.Left - BitBtnSacarTodoInvestimento.Width - EspacamentoEntre;
  BitBtnSaqueParcialInvestimento.Left := BitBtnSacarTodoInvestimento.Left - BitBtnSaqueParcialInvestimento.Width - EspacamentoEntre;
  BitBtnNovo.Left := BitBtnSaqueParcialInvestimento.Left - BitBtnNovo.Width - EspacamentoEntre;
  BitBtnRestaurar.Left := BitBtnNovo.Left - BitBtnRestaurar.Width - EspacamentoEntre;
  BitBtnSalvar.Left := BitBtnRestaurar.Left - BitBtnSalvar.Width - EspacamentoEntre;

  ButtonExcluirLinhaGridItens.Left := PanelBotoesControleGridItens.Width - ButtonExcluirLinhaGridItens.Width - EspacamentoFinal;
  ButtonAdicionarLinhaGridItens.Left := ButtonExcluirLinhaGridItens.Left - ButtonAdicionarLinhaGridItens.Width - EspacamentoEntre;
end;

procedure TfmCadInvestimento.habilitaBotoes;
begin
  BitBtnSalvar.Enabled := true;
  BitBtnSaqueParcialInvestimento.Enabled := true;
  BitBtnSacarTodoInvestimento.Enabled := true;
  BitBtnRestaurar.Enabled := true;
  BitBtnNovo.Enabled := true;
end;

procedure TfmCadInvestimento.ButtonLimparTipoMovimentoClick(Sender: TObject);
begin
  plTipoMovimento.Clear;

  EditCadastroCDTIPOMOVIMENTO.Clear;
  EditCadastroDETIPOMOVIMENTO.Clear;

  EditCadastroCDTIPOMOVIMENTO.Enabled := true;
  EditCadastroDETIPOMOVIMENTO.Enabled := true;
  ButtonLimparTipoMovimento.Enabled := false;
  ButtonNovoTipoMovimento.Enabled := true;
end;

procedure TfmCadInvestimento.ButtonLimparUsuarioClick(Sender: TObject);
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

procedure TfmCadInvestimento.ButtonNovoTipoMovimentoClick(Sender: TObject);
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
        NaturezaPadrao := 'I';
        ShowModal;

        vcdTipoMovimento := fmCadTipoMovimento.Codigo;
      except
        on E: exception do
          raise exception.Create('Não foi possível abrir a tela de Cadastro de Tipo de Movimento.'+#13#10+E.Message);
      end;
    end;
  finally
    // Verifica se foi cadastrado um tipo de investimento.
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

procedure TfmCadInvestimento.MenuItemAtualizarTabelaClick(Sender: TObject);
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
      editaColunaGrid(2,'NMLOGIN','Usuário',edNone,taLeftJustify,120,true);
      editaColunaGrid(3,'DEINVESTIMENTO','Descrição',edNone,taLeftJustify,330,true);
      editaColunaGrid(4,'DTINVESTIMENTO','Data',edNone,Classes.taLeftJustify,70,true);
      editaColunaGrid(5,'FLVISIVEL','Visível',edCheckBox,Classes.taCenter,40,true);
      editaColunaGrid(6,'CDINVESTIMENTO','Código',edNone,taRightJustify,40,true);
      LabelTotalRegistros.Caption := 'Total de registros: ' + IntToStr(QueryGeral.RecordCount);
      DBAdvGridGeral.HideColumn(6);
      DBAdvGridGeral.AutoSizeColumns(true);
    except
      on E: Exception do
        fmPrincipal.manipulaExcecoes(Sender,E);
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfmCadInvestimento.MenuItemEditarRegistroClick(Sender: TObject);
begin
  Opcao := 'A';
  with DBAdvGridGeral do
    Codigo := ColumnByName['CDINVESTIMENTO'].Ints[Row];
  pInvestimento.Codigo := Codigo;
  editaCadastro;
  habilitaBotoes;

  if EditCadastroDEINVESTIMENTO.Enabled then
    ActiveControl := EditCadastroDEINVESTIMENTO;
end;

procedure TfmCadInvestimento.MenuItemVisualizarFiltroClick(Sender: TObject);
begin
  GridFindDialogColumnGrid.Execute;
end;

procedure TfmCadInvestimento.novoCadastro;
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
      vcdTipoMovimentoPadrao := IntToStr(vTipoMovimento.obtemPadrao('I'));
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

  DatePickerEditCadastroDTINVESTIMENTO.Date := Date();

  // Preenche os dados do usuário.
  EditCadastroCDUSUARIO.Text := IntToStr(fmPrincipal.CodigoUsuarioLogado);
  EditCadastroCDUSUARIOExit(EditCadastroCDUSUARIO);

  EditCadastroDEINVESTIMENTO.Clear;
  DatePickerEditCadastroDTCADASTRO.Clear;
  DatePickerEditCadastroDTULTATUALIZACAO.Clear;

  limpaGridItens;

  if EditCadastroCDTIPOMOVIMENTO.Text = EmptyStr then
  begin
    if EditCadastroCDTIPOMOVIMENTO.Enabled then
      ActiveControl := EditCadastroCDTIPOMOVIMENTO;
  end
  else
    if EditCadastroDEINVESTIMENTO.Enabled then
      ActiveControl := EditCadastroDEINVESTIMENTO;
end;

procedure TfmCadInvestimento.OfficePageCadastroShow(Sender: TObject);
begin
  if OfficePagerCentral.ActivePageIndex = 0 then
  begin
    if EditCadastroDEINVESTIMENTO.Enabled then
      ActiveControl := EditCadastroDEINVESTIMENTO;
  end
  else
    if ColumnGridItens.Enabled then
      ActiveControl := ColumnGridItens;
end;

procedure TfmCadInvestimento.OfficePageConsultaShow(Sender: TObject);
begin
  if DBAdvGridGeral.Enabled then
    ActiveControl := DBAdvGridGeral;
end;

procedure TfmCadInvestimento.populaGridItens;
var
  vQuery: TZQuery;
  procedure insereDadosGrid(prmnuItem: integer; prmvlInvestimento: currency;
                            prmdtInvestimento: TDate; prmdeObservacoes: string);
  begin
    with ColumnGridItens do
    begin
      if ColumnByName['NUITEM'].Rows[RowCount-1] <> EmptyStr then
        RowCount := RowCount +1;
      ColumnByName['NUITEM'].Ints[RowCount-1] := prmnuItem;
      ColumnByName['VLINVESTIMENTO'].Floats[RowCount-1] := prmvlInvestimento;
      ColumnByName['DTINVESTIMENTO'].Dates[RowCount-1] := prmdtInvestimento;
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
      vQuery := pInvestimento.listaItem;
      with vQuery do
      begin
        // Consulta o cadastro dos Itens do Investimento.
        SQL.Add('WHERE cdinvestimento = :CURRENT_CDINVESTIMENTO');
        SQL.Add('ORDER BY 2 ASC');
        Params.ParamByName('CURRENT_CDINVESTIMENTO').AsInteger := Codigo;
        dmPrincipal.executaConsulta(vQuery);

        if not Eof then
        begin
          ColumnGridItens.Enabled := true;
          ColumnGridItens.BeginUpdate;

          // Preeenche os dados da grid.
          while not Eof do
          begin
            insereDadosGrid(Fields.FieldByName('NUITEM').AsInteger,
                            Fields.FieldByName('VLINVESTIMENTO').AsCurrency,
                            Fields.FieldByName('DTINVESTIMENTO').AsDateTime,
                            Fields.FieldByName('DEOBSERVACOES').AsString);

            Next;
          end;
          ColumnGridItens.EndUpdate;
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

procedure TfmCadInvestimento.setaCadastroUnico;
begin
  BitBtnSaqueParcialInvestimento.Enabled := false;
  BitBtnSacarTodoInvestimento.Enabled := false;
  BitBtnRestaurar.Enabled := false;
  BitBtnNovo.Enabled := false;
  OfficePageConsulta.TabVisible := false;
end;

procedure TfmCadInvestimento.ButtonExportarHTMLClick(Sender: TObject);
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

procedure TfmCadInvestimento.ButtonExportarPlanilhaClick(Sender: TObject);
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

procedure TfmCadInvestimento.ButtonImprimirRelatorioClick(Sender: TObject);
var
  vAux: string;
begin
  try
    QueryRelInvestimento.SQL := pInvestimento.relatorio.SQL;
    // Filtra pelo Usuário, caso informado no Painel Principal.
    if fmPrincipal.FiltroLogin <> cNenhumFiltroLogin then
      vAux := fmPrincipal.FiltroLogin
    else
      vAux := '%';
    QueryRelInvestimento.Params.ParamByName('NMLOGIN').AsString := vAux;
    dmPrincipal.executaConsulta(QueryRelInvestimento);
    with fmPrincipal.SystemRelatorio do
    begin
      DefaultDest := rdPreview;
      SystemSetups := SystemSetups - [ssAllowSetup];
      DoNativeOutput := false;
    end;
    with ProjectRelInvestimento do
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

procedure TfmCadInvestimento.ButtonOrdenarRegistrosClick(Sender: TObject);
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

procedure TfmCadInvestimento.carregaImagensBotoes;
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

  ButtonAdicionarLinhaGridItens.Picture.LoadFromFile(fmPrincipal.LocalIcones + 'add-row-e-16.png');
  ButtonAdicionarLinhaGridItens.HotPicture.LoadFromFile(fmPrincipal.LocalIcones + 'add-row-h-16.png');
  ButtonAdicionarLinhaGridItens.DisabledPicture.LoadFromFile(fmPrincipal.LocalIcones + 'add-row-d-16.png');
  ButtonExcluirLinhaGridItens.Picture.LoadFromFile(fmPrincipal.LocalIcones + 'delete-row-e-16.png');
  ButtonExcluirLinhaGridItens.HotPicture.LoadFromFile(fmPrincipal.LocalIcones + 'delete-row-h-16.png');
  ButtonExcluirLinhaGridItens.DisabledPicture.LoadFromFile(fmPrincipal.LocalIcones + 'delete-row-d-16.png');
end;

function TfmCadInvestimento.validaExclusao: boolean;
begin
  Result := true;
end;

end.
