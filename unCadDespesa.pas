unit unCadDespesa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, Grids, AdvObj, BaseGrid, AdvGrid, AdvCGrid, AsgFindDialog, ComCtrls,
  Menus, UnAplExportaXLS, ImgList, ToolWin, MaskUtils, DBAdvGrid, RpCon,
  RpConDS, RpBase, RpSystem, RpDefine, RpRave, RpRender, RpRenderPDF, ShellAPI,
  Vcl.Mask, DateUtils, AdvAppStyler, AdvMenus, AdvGlowButton, AdvPanel, AdvEdit,
  AdvEdBtn, PlannerDatePicker, AdvMoneyEdit, AdvOfficeButtons, AdvGroupBox,
  AdvToolBar, AdvOfficePager, tmsAdvGridExcel, unUsuario, unFornecedor,
  unFormaPagamento, unTipoMovimento, unDespesa;

type
  TfmCadDespesa = class(TForm)
    QueryGeral: TZQuery;
    GridFindDialogColumnGrid: TAdvGridFindDialog;
    DBAdvGridGeral: TDBAdvGrid;
    DataSource: TDataSource;
    SaveDialog: TSaveDialog;
    ProjectRelDespesa: TRvProject;
    DataSetConnectionRelDespesa: TRvDataSetConnection;
    QueryRelDespesa: TZQuery;
    LabelDespesa: TLabel;
    LabelDescricao: TLabel;
    LabelUsuario: TLabel;
    ColumnGridItens: TAdvColumnGrid;
    LabelTipoMovimento: TLabel;
    LabelSeparadorAnoNumero: TLabel;
    LabelDataDespesa: TLabel;
    LabelObservacoes: TLabel;
    FormStyler: TAdvFormStyler;
    PopupMenuGrid: TAdvPopupMenu;
    MenuItemEditarRegistro: TMenuItem;
    MenuItemAtualizarTabela: TMenuItem;
    MenuItemEspaco1: TMenuItem;
    MenuItemVisualizarFiltro: TMenuItem;
    ButtonLimparUsuario: TAdvGlowButton;
    ButtonLimparTipoMovimento: TAdvGlowButton;
    ButtonNovoTipoMovimento: TAdvGlowButton;
    ButtonAdicionarLinhaGridItens: TAdvGlowButton;
    ButtonExcluirLinhaGridItens: TAdvGlowButton;
    ButtonGerarItensDespesa: TAdvGlowButton;
    PanelBotoes: TAdvPanel;
    BitBtnFechar: TAdvGlowButton;
    BitBtnSalvar: TAdvGlowButton;
    BitBtnNovo: TAdvGlowButton;
    BitBtnRestaurar: TAdvGlowButton;
    BitBtnCancelarDespesa: TAdvGlowButton;
    BitBtnInserirDocumento: TAdvGlowButton;
    EditCadastroNUDESPESA: TAdvEdit;
    EditCadastroCDUSUARIO: TAdvEdit;
    EditCadastroNMLOGIN: TAdvEdit;
    EditCadastroCDTIPOMOVIMENTO: TAdvEdit;
    EditCadastroNUANODESPESA: TAdvEdit;
    DatePickerEditCadastroDTDESPESA: TPlannerDatePicker;
    EditCadastroNMUSUARIO: TAdvEditBtn;
    EditCadastroDETIPOMOVIMENTO: TAdvEditBtn;
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
    GroupBoxDespesa: TAdvGroupBox;
    GroupBoxItensDespesa: TAdvGroupBox;
    PanelItensDespesa: TAdvPanel;
    PanelBotoesControleGridItens: TAdvPanel;
    PanelGridItens: TAdvPanel;
    PanelTotalizador: TAdvPanel;
    PanelTotalizadorEspaco: TAdvPanel;
    PanelTotalizadorItens: TAdvPanel;
    LabelTotalizadorItens: TLabel;
    PanelTotalizadorValor: TAdvPanel;
    LabelTotalizadorValor: TLabel;
    PanelTitulos: TAdvPanel;
    PanelInformacoes: TAdvPanel;
    LabelInformacoes: TLabel;
    PanelStatusCadastro: TAdvPanel;
    LabelStatusCadastro: TLabel;
    AdvGridExcelIO: TAdvGridExcelIO;
    ButtonExibirInvisiveis: TAdvGlowButton;
    LabelDataCadastro: TLabel;
    LabelDataUltimaAtualizacao: TLabel;
    DatePickerEditCadastroDTULTATUALIZACAO: TPlannerDatePicker;
    DatePickerEditCadastroDTCADASTRO: TPlannerDatePicker;
    EditCadastroDEDESPESA: TAdvEdit;
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
    procedure ButtonGerarItensDespesaClick(Sender: TObject);
    procedure ColumnGridItensGetEditorType(Sender: TObject; ACol, ARow: Integer;
      var AEditor: TEditorType);
    procedure ColumnGridItensEllipsClick(Sender: TObject; ACol, ARow: Integer;
      var S: string);
    procedure TabSheetCadastroDespesaItensShow(Sender: TObject);
    procedure ColumnGridItensClickCell(Sender: TObject; ARow, ACol: Integer);
    procedure EditCadastroCDTIPOMOVIMENTOExit(Sender: TObject);
    procedure EditCadastroDETIPOMOVIMENTOExit(Sender: TObject);
    procedure ButtonLimparTipoMovimentoClick(Sender: TObject);
    procedure ButtonNovoTipoMovimentoClick(Sender: TObject);
    procedure BitBtnCancelarDespesaClick(Sender: TObject);
    procedure DatePickerEditCadastroDTDESPESAExit(Sender: TObject);
    procedure EditCadastroNUANODESPESAExit(Sender: TObject);
    procedure BitBtnInserirDocumentoClick(Sender: TObject);
    procedure EditCadastroDETIPOMOVIMENTOClickBtn(Sender: TObject);
    procedure EditCadastroNMUSUARIOClickBtn(Sender: TObject);
    procedure OfficePageCadastroShow(Sender: TObject);
    procedure OfficePageConsultaShow(Sender: TObject);
    procedure EditCadastroCDTIPOMOVIMENTOChange(Sender: TObject);
    procedure EditCadastroCDUSUARIOChange(Sender: TObject);
    procedure DBAdvGridGeralClickCell(Sender: TObject; ARow, ACol: Integer);
    procedure ButtonExibirInvisiveisClick(Sender: TObject);
    procedure ColumnGridItensCellValidate(Sender: TObject; ACol, ARow: Integer;
      var Value: string; var Valid: Boolean);
  private
    { Private declarations }
    pId: TGUID;
    pOpcao: Char;
    pCodigo, pEspacamentoInicial, pEspacamentoFinal,
    pEspacamentoEntre, pMesInicio, pMesEncerramento,
    pAnoInicio, pAnoEncerramento, pDiaVencimento: integer;
    pOrdenacao, pOcultarExibir: string;
    pdtMinima, pdtMaxima, pdtDespesa: TDate;
    pValorDespesa: currency;
    plTipoMovimento, plUsuario, plFormaPagamento, plFornecedor: TStringList;
    pUsuario: TUsuario;
    pFornecedor: TFornecedor;
    pFormaPagamento: TFormaPagamento;
    pTipoMovimento: TTipoMovimento;
    pDespesa: TDespesa;
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
    procedure obtemConfiguracaoItensDespesa;
    procedure enviaEmail;
    procedure atualizaDespesaVisivel;
    function validaExclusao: boolean;
    function obtemnmFormaPagamento(prmcdFormaPagamento: integer): string;
    function obtemnmFornecedor(prmcdFornecedor: integer): string;
    procedure carregaImagensBotoes;
    property EspacamentoInicial: integer read pEspacamentoInicial write pEspacamentoInicial;
    property EspacamentoEntre: integer read pEspacamentoEntre write pEspacamentoEntre;
    property EspacamentoFinal: integer read pEspacamentoFinal write pEspacamentoFinal;
  public
    { Public declarations }
    procedure setaCadastroUnico;
    procedure editaCadastroViaConsulta(prmCodigo: integer);
    property Opcao: char read pOpcao write pOpcao;
    property Codigo: integer read pCodigo write pCodigo;
    property Ordenacao: string read pOrdenacao write pOrdenacao;
  end;

var
  fmCadDespesa: TfmCadDespesa;

implementation

uses unPrincipal, undmPrincipal, unAplOrdenaGrid, unConFiltroPadrao,
  unAplEditaTexto, unCadTipoMovimento, unCadDespesaConfiguracao, unCadDocumento,
  undmEstilo;

{$R *.dfm}

procedure TfmCadDespesa.apresentaResultadoCadastro(prmMensagem: string);
begin
  MessageBox(fmPrincipal.Handle,
             PWideChar(prmMensagem),
             cTituloMensagemInformacao,
             MB_OK or MB_ICONINFORMATION);
end;

procedure TfmCadDespesa.atualizaCadastro;
var
  i, vRetorno: integer;
  vErro: boolean;
  vValor: currency;
begin
  try
    vErro := false;
    pDespesa.Codigo := Codigo;
    pDespesa.Usuario := StrToInt(EditCadastroCDUSUARIO.Text);
    pDespesa.Nome := EditCadastroDEDESPESA.Text;
    if MemoCadastroDEOBSERVACOES.Lines.Count > 0 then
      pDespesa.Observacoes.Assign(MemoCadastroDEOBSERVACOES.Lines)
    else
      pDespesa.Observacoes.Clear;
    pDespesa.Data := DatePickerEditCadastroDTDESPESA.Date;
    // Soma o valor da despesa, subtrai o valor de desconto e acrescenta o valor do juros.
    with ColumnGridItens do
      vValor := ColumnSum(2,1,RowCount-1) - ColumnSum(3,1,RowCount-1) + ColumnSum(4,1,RowCount-1);
    pDespesa.Valor := vValor;
    vRetorno := pDespesa.atualiza;
    if vRetorno <> 0 then
      with ColumnGridItens do
        for i := 1 to RowCount -1 do
        begin
          pDespesa.CodigoItem := ColumnByName['NUITEM'].Ints[i];
          pDespesa.ValorDespesa := ColumnByName['VLDESPESA'].Floats[i];
          pDespesa.ValorDesconto := ColumnByName['VLDESCONTO'].Floats[i];
          pDespesa.ValorJuros := ColumnByName['VLJUROS'].Floats[i];
          pDespesa.DataVencimento := ColumnByName['DTVENCIMENTO'].Dates[i];
          if ColumnByName['DTPAGAMENTO'].Rows[i] <> EmptyStr then
            pDespesa.DataPagamento := ColumnByName['DTPAGAMENTO'].Dates[i]
          else
            pDespesa.DataPagamento := -1;
          if ColumnByName['CDFORMAPAGAMENTO'].Ints[i] > 0 then
            pDespesa.FormaPagamento := ColumnByName['CDFORMAPAGAMENTO'].Ints[i]
          else
            pDespesa.FormaPagamento := 0;
          if ColumnByName['CDFORNECEDOR'].Ints[i] > 0 then
            pDespesa.Fornecedor := ColumnByName['CDFORNECEDOR'].Ints[i]
          else
            pDespesa.Fornecedor := 0;
          if ColumnByName['NUNOTAFISCAL'].Ints[i] > 0 then
            pDespesa.NotaFiscal := ColumnByName['NUNOTAFISCAL'].Ints[i]
          else
            pDespesa.NotaFiscal := 0;
          if ColumnByName['DEOBSERVACOES'].Rows[i] <> EmptyStr then
            pDespesa.Observacoes.Text := ColumnByName['DEOBSERVACOES'].Rows[i]
          else
            pDespesa.Observacoes.Clear;
          if ColumnByName['NUITEM'].Rows[i] <> EmptyStr then
            vErro := (pDespesa.atualizaItem = 0)
          else
            vErro := (pDespesa.insereItem = 0);
        end;

    if vRetorno <> 0 then
    begin
      if not vErro then
        fmPrincipal.apresentaResultadoCadastro('Cadastro atualizado com sucesso.')
      else
        apresentaResultadoCadastro('Despesa atualizada com sucesso, mas alguns itens não puderam ser atualizados.');

      // Envia o e-mail pro usuário.
      if fmPrincipal.SempreEnviaEmailCadastroDespesa = true then
        enviaEMail;
    end
    else
      raise Exception.Create('Não foi possível atualizar o cadastro.');
  except
    on E: exception do
      raise;
  end;
end;

procedure TfmCadDespesa.atualizaDespesaVisivel;
var
  vMensagem: string;
  vRetorno: integer;
begin
  // Verifica deseja realmente ocultar/exibir.
  with DBAdvGridGeral do
  begin
    if Row = 0 then
      Exit;

    pDespesa.Codigo := ColumnByName['CDDESPESA'].Ints[Row];
  end;

  if pOcultarExibir = 'ocultar' then
    vMensagem := 'Deseja realmente ocultar a despesa?'
  else
    vMensagem := 'Deseja realmente tornar a despesa visível?';
  vRetorno := MessageBox(fmPrincipal.Handle,PWideChar(vMensagem),cTituloMensagemConfirmacao,MB_YESNO or MB_ICONQUESTION or MB_DEFBUTTON2);
  if vRetorno <> mrYes then
    Exit;

  if pOcultarExibir = 'ocultar' then
    pDespesa.setaVisivel('N')
  else
    pDespesa.setaVisivel('S');

  pDespesa.Codigo := Codigo;
  MenuItemAtualizarTabelaClick(fmCadDespesa);
end;

procedure TfmCadDespesa.atualizaSomatorioGrid;
var
  vValor: currency;
begin
  // Atualiza os totais.
  with ColumnGridItens do
  begin
    if ColumnByName['VLDESPESA'].Rows[1] <> EmptyStr then
      LabelTotalizadorItens.Caption := 'Total de itens: ' + IntToStr(RowCount -1)
    else
      LabelTotalizadorItens.Caption := 'Total de itens: 0';
    vValor := ColumnSum(2,1,RowCount -1) - ColumnSum(3,1,RowCount -1) + ColumnSum(4,1,RowCount -1);
    LabelTotalizadorValor.Caption := 'Valor total: ' + FormatFloat('"R$ ",0.00',vValor);
  end;
end;

procedure TfmCadDespesa.BitBtnRestaurarClick(Sender: TObject);
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

procedure TfmCadDespesa.ButtonAdicionarLinhaGridItensClick(Sender: TObject);
begin
  with ColumnGridItens do
    InsertRows(Row+1,1);
end;

procedure TfmCadDespesa.ButtonExcluirLinhaGridItensClick(Sender: TObject);
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
  if MessageBox(fmPrincipal.Handle, PWideChar('Deseja realmente realizar a exclusão do item da despesa selecionado?'), cTituloMensagemConfirmacao, MB_YESNO or MB_ICONQUESTION or MB_DEFBUTTON2) = IDNO then
    Exit;
  // Valida se é possível realizar a exclusão.
  if not validaExclusao then
    Exit;

  // Realiza a exclusão do registro.
  try
    with ColumnGridItens do
    begin
      pDespesa.CodigoItem := ColumnByName['NUITEM'].Ints[Row];
      vRetorno := pDespesa.excluiItem;
      limpaGridItens;
      populaGridItens;
    end;

    if vRetorno <> 0 then
      apresentaResultadoCadastro('Item da despesa excluído com sucesso.')
    else
      raise Exception.Create('Não foi possível excluir o item da despesa.');
  except
    on E: exception do
      fmPrincipal.manipulaExcecoes(Sender,E);
  end;
end;

procedure TfmCadDespesa.ButtonExibirInvisiveisClick(Sender: TObject);
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

procedure TfmCadDespesa.BitBtnCancelarDespesaClick(Sender: TObject);
var
  vRetorno: integer;
begin
  // Valida se realmente o usuário quer realizar p cancelamento.
  if MessageBox(fmPrincipal.Handle, PWideChar('Deseja realmente realizar o cancelamento da despesa selecionada?'), cTituloMensagemConfirmacao, MB_YESNO or MB_ICONQUESTION or MB_DEFBUTTON2) = IDNO then
    Exit;

  // Realiza o cancelamento do registro.
  try
    vRetorno := pDespesa.cancela;

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

procedure TfmCadDespesa.BitBtnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfmCadDespesa.BitBtnInserirDocumentoClick(Sender: TObject);
begin
  try
    fmPrincipal.pLogSistema.Trace('>> Cadastro de Despesa - Carregando a tela de Documentos.');
    fmCadDocumento := TfmCadDocumento.Create(Self);
    fmCadDocumento.Caption := Caption + ' :: ' + fmCadDocumento.Caption;
    with fmCadDocumento do
    begin
      fmCadDocumento.Codigo := fmCadDespesa.Codigo;
      fmCadDocumento.Tipo := 'D';
      NomeDiretorio := EditCadastroCDTIPOMOVIMENTO.Text + '.' + EditCadastroNUANODESPESA.Text + EditCadastroNUDESPESA.Text;
      preencheGrid;
      ShowModal;
    end;
    fmPrincipal.pLogSistema.Trace('>> Cadastro de Despesa - Tela de Documentos carregada com sucesso.');
  except
    on E: Exception do
      fmPrincipal.manipulaExcecoes(Sender,E);
  end;
end;

procedure TfmCadDespesa.ButtonGerarItensDespesaClick(Sender: TObject);
var
  vnmFormaPagamento, vnmFornecedor: string;
  i: integer;
  vData, vdtInicio, vdtEncerramento: TDateTime;
  vQuery: TZQuery;
begin
  obtemConfiguracaoItensDespesa;
  // Realiza validações.
  if pValorDespesa = -1 then
    Exit;
  // Fim Realiza validações.

  try
    limpaGridItens;

    // Formata as datas de início e encerramento.
    vdtInicio := EncodeDate(pAnoInicio,pMesInicio+1,pDiaVencimento);
    vdtEncerramento := EncodeDate(pAnoEncerramento,pMesEncerramento+1,pDiaVencimento);
    vData := vdtInicio;

    // Obtém o nome da Forma de Pagamento.
    if plFormaPagamento.Count > 0 then
    begin
      // Obtém a Forma de Pagamento.
      try
        vQuery := pFormaPagamento.filtro;
        with vQuery do
        begin
          SQL.Add('WHERE "NU-Código" = :CDFORMAPAGAMENTO');
          Params.ParamByName('CDFORMAPAGAMENTO').AsInteger := StrToInt(plFormaPagamento.Strings[0]);
          dmPrincipal.executaConsulta(vQuery);

          if not Eof then
            vnmFormaPagamento := Fields.Fields[1].AsString
          else
            vnmFormaPagamento := EmptyStr;
          Active := false;
        end;
      finally
        FreeAndNil(vQuery);
      end;
    end;

    // Obtém o nome da Fornecedor.
    if plFornecedor.Count > 0 then
    begin
      // Obtém a Forma de Pagamento.
      try
        vQuery := pFornecedor.filtro;
        with vQuery do
        begin
          SQL.Add('WHERE "NU-Código" = :CDFORNECEDOR');
          Params.ParamByName('CDFORNECEDOR').AsInteger := StrToInt(plFornecedor.Strings[0]);
          dmPrincipal.executaConsulta(vQuery);

          if not Eof then
            vnmFornecedor := Fields.Fields[2].AsString
          else
            vnmFornecedor := EmptyStr;
          Active := false;
        end;
      finally
        FreeAndNil(vQuery);
      end;
    end;

    // Transfere os dados para a Grid de Itens da Despesa.
    with ColumnGridItens do
    begin
      BeginUpdate;
      i := 0;
      while true do
      begin
        Inc(i);
        ColumnByName['NUITEM'].Rows[i] := EmptyStr;
        ColumnByName['VLDESPESA'].Floats[i] := pValorDespesa;
        ColumnByName['VLDESCONTO'].Floats[i] := 0;
        ColumnByName['VLJUROS'].Floats[i] := 0;
        ColumnByName['DTVENCIMENTO'].Dates[i] := vData;
        ColumnByName['DTPAGAMENTO'].Rows[i] := EmptyStr;
        if vnmFormaPagamento <> EmptyStr then
        begin
          ColumnByName['CDFORMAPAGAMENTO'].Ints[i] := StrToInt(plFormaPagamento.Strings[0]);
          ColumnByName['NMFORMAPAGAMENTO'].Rows[i] := vnmFormaPagamento;
        end
        else
        begin
          ColumnByName['NMFORMAPAGAMENTO'].Rows[i] := EmptyStr;
          ColumnByName['CDFORMAPAGAMENTO'].Ints[i] := 0;
        end;
        if vnmFornecedor <> EmptyStr then
        begin
          ColumnByName['CDFORNECEDOR'].Ints[i] := StrToInt(plFornecedor.Strings[0]);
          ColumnByName['NMFORNECEDOR'].Rows[i] := vnmFornecedor;
        end
        else
        begin
          ColumnByName['NMFORNECEDOR'].Rows[i] := EmptyStr;
          ColumnByName['CDFORNECEDOR'].Ints[i] := 0;
        end;
        ColumnByName['NUNOTAFISCAL'].Rows[i] := EmptyStr;
        ColumnByName['DEOBSERVACOES'].Rows[i] := EmptyStr;
        AddImageIdx(10,i,0,haCenter,vaCenter);

        vData := IncMonth(vData, 1);
        // Se já preencheu todas datas, sai do loop.
        if vData > vdtEncerramento then
          break
        else
          AddRow;
      end;
      EndUpdate;
    end;

    atualizaSomatorioGrid;

    OfficePagerCentral.ActivePageIndex := 1;
    if ColumnGridItens.Enabled then
      ActiveControl := ColumnGridItens;
  except
    on E: exception do
    begin
      ColumnGridItens.EndUpdate;
      fmPrincipal.manipulaExcecoes(Sender,E);
    end;
  end;
end;

procedure TfmCadDespesa.insereCadastro;
var
  i: integer;
  vValor: currency;
begin
  try
    pDespesa.Movimento := StrToInt(EditCadastroCDTIPOMOVIMENTO.Text);
    pDespesa.Ano := StrToInt(EditCadastroNUANODESPESA.Text);
    pDespesa.Usuario := StrToInt(EditCadastroCDUSUARIO.Text);
    pDespesa.Nome := EditCadastroDEDESPESA.Text;
    if MemoCadastroDEOBSERVACOES.Lines.Count > 0 then
      pDespesa.Observacoes.Assign(MemoCadastroDEOBSERVACOES.Lines)
    else
      pDespesa.Observacoes.Clear;
    pDespesa.Data := DatePickerEditCadastroDTDESPESA.Date;
    pDespesa.DiaVencimento := pDiaVencimento;
    // Seta o tipo de frequência.
    if ColumnGridItens.RowCount > 2 then
      pDespesa.Frequencia := 'M'
    else
      pDespesa.Frequencia := 'U';
    // Soma o valor da despesa, subtrai o valor de desconto e acrescenta o valor do juros.
    with ColumnGridItens do
      vValor := ColumnSum(2,1,RowCount-1) - ColumnSum(3,1,RowCount-1) + ColumnSum(4,1,RowCount-1);
    pDespesa.Valor := vValor;
    Codigo := pDespesa.insere;

    if Codigo <> 0 then
    begin
      with ColumnGridItens do
        for i := 1 to RowCount -1 do
        begin
          pDespesa.CodigoItem := 0;
          pDespesa.ValorDespesa := ColumnByName['VLDESPESA'].Floats[i];
          pDespesa.ValorDesconto := ColumnByName['VLDESCONTO'].Floats[i];
          pDespesa.ValorJuros := ColumnByName['VLJUROS'].Floats[i];
          pDespesa.DataVencimento := ColumnByName['DTVENCIMENTO'].Dates[i];
          if ColumnByName['DTPAGAMENTO'].Rows[i] <> EmptyStr then
            pDespesa.DataPagamento := ColumnByName['DTPAGAMENTO'].Dates[i]
          else
            pDespesa.DataPagamento := -1;
          if ColumnByName['CDFORMAPAGAMENTO'].Ints[i] > 0 then
            pDespesa.FormaPagamento := ColumnByName['CDFORMAPAGAMENTO'].Ints[i]
          else
            pDespesa.FormaPagamento := 0;
          if ColumnByName['CDFORNECEDOR'].Ints[i] > 0 then
            pDespesa.Fornecedor := ColumnByName['CDFORNECEDOR'].Ints[i]
          else
            pDespesa.Fornecedor := 0;
          if ColumnByName['NUNOTAFISCAL'].Ints[i] > 0 then
            pDespesa.NotaFiscal := ColumnByName['NUNOTAFISCAL'].Ints[i]
          else
            pDespesa.NotaFiscal := 0;
          if ColumnByName['DEOBSERVACOES'].Rows[i] <> EmptyStr then
            pDespesa.Observacoes.Text := ColumnByName['DEOBSERVACOES'].Rows[i]
          else
            pDespesa.Observacoes.Clear;
          if pDespesa.insereItem = 0 then
          begin
            pDespesa.Codigo := 0;
            pDespesa.exclui;
            raise Exception.Create('Não foi possível incluir o cadastro.');
            Exit;
          end;
        end;

      // Atualiza a tabela de Usuário Saldo.
      //fmPrincipal.atualizaUsuarioSaldo;

      fmPrincipal.apresentaResultadoCadastro('Cadastro incluído com sucesso.');

      // Envia e-mail para o usuário.
      if fmPrincipal.SempreEnviaEmailCadastroDespesa = true then
        enviaEMail;
    end
    else
      raise Exception.Create('Não foi possível incluir o cadastro.');

    EditCadastroNUDESPESA.Text := IntToStr(Codigo);
  except
    on E: exception do
      raise;
  end;
end;

procedure TfmCadDespesa.limpaGridItens;
begin
  with ColumnGridItens do
  begin
    BeginUpdate;
    RowCount := 2;
    ClearRows(1,1);
    ColumnByName['VLDESPESA'].FloatFormat := '%.2f';
    ColumnByName['VLDESPESA'].SortPrefix := 'R$';
    ColumnByName['VLDESCONTO'].FloatFormat := '%.2f';
    ColumnByName['VLDESCONTO'].SortPrefix := 'R$';
    ColumnByName['VLJUROS'].FloatFormat := '%.2f';
    ColumnByName['VLJUROS'].SortPrefix := 'R$';
    HideColumn(11);
    HideColumn(12);
    HideColumn(13);
    EndUpdate;
  end;
  atualizaSomatorioGrid;
end;

procedure TfmCadDespesa.BitBtnNovoClick(Sender: TObject);
begin
  congelaTela(false);
  Opcao := 'I';
  desabilitaBotoes;
  novoCadastro;
  BitBtnSalvar.Enabled := true;
  BitBtnRestaurar.Enabled := true;
  ButtonGerarItensDespesa.Enabled := true;
  ButtonAdicionarLinhaGridItens.Enabled := true;
  ButtonExcluirLinhaGridItens.Enabled := true;
end;

procedure TfmCadDespesa.BitBtnSalvarClick(Sender: TObject);
var
  i: integer;
  vMensagem: string;
  vOk: boolean;
begin
  desabilitaBotoes;

  // Validações.
  vMensagem := EmptyStr;
  if EditCadastroCDTIPOMOVIMENTO.Text = EmptyStr then
    vMensagem := vMensagem + #13#10'- O campo Tipo de movimento é requerido.';
  if EditCadastroCDUSUARIO.Text = EmptyStr then
    vMensagem := vMensagem + #13#10'- O campo Usuário é requerido.';
  if EditCadastroDEDESPESA.Text = EmptyStr then
    vMensagem := vMensagem + #13#10'- O campo Despesa é requerido.';

  // Valida se existe pelo menos 1 item.
  vOk := false;
  with ColumnGridItens do
    for i := 1 to RowCount -1 do
      if (ColumnByName['VLDESPESA'].Rows[i] <> EmptyStr) and
         (ColumnByName['DTVENCIMENTO'].Rows[i] <> EmptyStr) then
      begin
        vOk := true;
        break;
      end;

  if not vOk then
    vMensagem := vMensagem + #13#10'- É preciso informar pelo menos 1 item para a despesa.';

  // Valida se as despesas possuem valor maior que os descontos.
  if vOk then
  begin
    with ColumnGridItens do
      for i := 1 to RowCount -1 do
        if ColumnByName['VLDESCONTO'].Floats[i] > ColumnByName['VLDESPESA'].Floats[i] then
        begin
          vOk := false;
          break;
        end;

    if not vOk then
      vMensagem := vMensagem + #13#10'- Existe Vl. desconto com valor maior que o Vl. despesa.';
  end;

  if vMensagem <> EmptyStr then
  begin
    BitBtnSalvar.Enabled := true;
    if Opcao = 'A' then
      BitBtnCancelarDespesa.Enabled := true;
    BitBtnRestaurar.Enabled := true;
    MessageBox(fmPrincipal.Handle, PWideChar('O cadastro não poderá ser executado devido as seguintes pendências:' + vMensagem), cTituloMensagemAlerta, MB_OK or MB_ICONWARNING);
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
    if Tag in [1..2] then
      BitBtnFecharClick(Sender);

    // Atualiza a Grid.
    MenuItemAtualizarTabelaClick(Sender);

    // Edita o cadastro realizado.
    editaCadastro;
    habilitaBotoes;
    Opcao := 'A';
    ButtonGerarItensDespesa.Enabled := false;
    if EditCadastroDEDESPESA.Enabled then
      ActiveControl := EditCadastroDEDESPESA;
  except
    on E: Exception do
      fmPrincipal.manipulaExcecoes(Sender,E);
  end;
end;

procedure TfmCadDespesa.ColumnGridItensCanDeleteRow(Sender: TObject;
  ARow: Integer; var CanDelete: Boolean);
begin
  CanDelete := false;
  ButtonExcluirLinhaGridItensClick(Sender);
end;

procedure TfmCadDespesa.ColumnGridItensCellValidate(Sender: TObject; ACol,
  ARow: Integer; var Value: string; var Valid: Boolean);
begin
  if ARow = 0 then
    Exit;

  Valid := true;

  with ColumnGridItens do
  begin
    if (ACol = 2) or (ACol = 3) then
    begin
      if ColumnByName['VLDESPESA'].Rows[ARow] <> EmptyStr then
        if ColumnByName['VLDESCONTO'].Rows[ARow] <> EmptyStr then
          if ColumnByName['VLDESCONTO'].Floats[ARow] > ColumnByName['VLDESPESA'].Floats[ARow] then
          begin
            InvalidEntryText := 'O Vl. desconto deve ser menor que o Vl. despesa.';
            Valid := false;
            Value := EmptyStr;
          end;
    end
    else
      if ACol = 7 then
      begin
        if ColumnByName['NMFORMAPAGAMENTO'].Rows[ARow] = EmptyStr then
          if ColumnByName['CDFORMAPAGAMENTO'].Rows[ARow] <> EmptyStr then
            ColumnByName['CDFORMAPAGAMENTO'].Rows[ARow] := EmptyStr;
      end
      else
        if ACol = 8 then
        begin
          if ColumnByName['NMFORNECEDOR'].Rows[ARow] = EmptyStr then
            if ColumnByName['CDFORNECEDOR'].Rows[ARow] <> EmptyStr then
              ColumnByName['CDFORNECEDOR'].Rows[ARow] := EmptyStr;
        end
        else
          if ACol = 9 then
            if Length(Value) > 10 then
            begin
              InvalidEntryText := 'O Nº nota fiscal deve possuir um tamanho menor que dez.';
              Valid := false;
              Value := EmptyStr;
            end;
  end;
end;

procedure TfmCadDespesa.ColumnGridItensClickCell(Sender: TObject; ARow,
  ACol: Integer);
begin
  if ARow = 0 then
    Exit;

  if ACol = 10 then
    with ColumnGridItens do
      if ColumnByName['VLDESPESA'].Rows[ARow] <> EmptyStr then
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
            AddImageIdx(10,ARow,1,haCenter,vaCenter);
            ColumnByName['DEOBSERVACOES'].Rows[ARow] := Texto.Text;
          end
          else
          begin
            AddImageIdx(10,ARow,0,haCenter,vaCenter);
            ColumnByName['DEOBSERVACOES'].Rows[ARow] := EmptyStr;
          end;
        end;
      end;
end;

procedure TfmCadDespesa.ColumnGridItensEllipsClick(Sender: TObject; ACol,
  ARow: Integer; var S: string);
var
  i: integer;
begin
  if ARow = 0 then
    Exit;
  if (ACol <> 7) and (ACol <> 8) then
    Exit;

  fmConFiltroPadrao := TfmConFiltroPadrao.Create(Self);
  with fmConFiltroPadrao do
  begin
    try
      if ACol = 7 then
      begin
        setaTitulo('Consulta de Formas de Pagamento');
        setaConsulta(pFormaPagamento.filtro);
      end
      else
      begin
        setaTitulo('Consulta de Fornecedores');
        setaConsulta(pFornecedor.filtro);
      end;
      setaOpcao('R');
      executaFiltro(0,EmptyStr);
      ShowModal;
    finally
      if ACol = 7 then
      begin
        plFormaPagamento.Clear;
        with pResSearch do
          for i := 0 to Count -1 do
            if objResSearch[i].Id = buscaId then
            begin
              plFormaPagamento.Add(objResSearch[i].Codigo);
              ColumnGridItens.ColumnByName['CDFORMAPAGAMENTO'].Rows[ARow] := objResSearch[i].Codigo;
              ColumnGridItens.ColumnByName['NMFORMAPAGAMENTO'].Rows[ARow] := objResSearch[i].Nome1;
              S := objResSearch[i].Nome1;
            end;
      end
      else
      begin
        plFornecedor.Clear;
        with pResSearch do
          for i := 0 to Count -1 do
            if objResSearch[i].Id = buscaId then
            begin
              plFornecedor.Add(objResSearch[i].Codigo);
              ColumnGridItens.ColumnByName['CDFORNECEDOR'].Rows[ARow] := objResSearch[i].Codigo;
              ColumnGridItens.ColumnByName['NMFORNECEDOR'].Rows[ARow] := objResSearch[i].Nome1;
              S := objResSearch[i].Nome2;
            end;
      end
    end;
  end;
end;

procedure TfmCadDespesa.ColumnGridItensGetEditorType(Sender: TObject; ACol,
  ARow: Integer; var AEditor: TEditorType);
begin
  if ARow = 0 then
    Exit;

 case ACol of
   7,8:
   begin
     AEditor := edEditBtn;
     with ColumnGridItens.BtnEdit do
     begin
       EditorEnabled := false;
       Glyph.Assign(fmPrincipal.fnGeral.obtemImagemPesquisa);
       ButtonCaption := EmptyStr;
     end;
   end;
 end;
end;

procedure TfmCadDespesa.EditCadastroDETIPOMOVIMENTOClickBtn(
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
        setaFiltrosExtras('"DE-Natureza" = ''Despesa''',
                          'Natureza: Despesa');
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
          if EditCadastroDEDESPESA.Enabled then
            ActiveControl := EditCadastroDEDESPESA;
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

procedure TfmCadDespesa.EditCadastroDETIPOMOVIMENTOExit(Sender: TObject);
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
      SQL.Add('  AND "DE-Natureza" = ''Despesa''');
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
            setaFiltrosExtras('"DE-Natureza" = ''Despesa''',
                              'Natureza: Despesa');
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
          if EditCadastroDEDESPESA.Enabled then
            ActiveControl := EditCadastroDEDESPESA;
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

procedure TfmCadDespesa.EditCadastroNMUSUARIOClickBtn(Sender: TObject);
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
    ButtonLimparUsuario.Enabled := (plUsuario.Count > 0);
    if fmPrincipal.Administrador = false then
      ButtonLimparUsuario.Enabled := false;

    // Valida para qual campo vai se posicionar.
    if OfficePagerCentral.ActivePageIndex = 1 then
      if plUsuario.Count > 0 then
      begin
        if EditCadastroDEDESPESA.Enabled then
          ActiveControl := EditCadastroDEDESPESA;
      end
      else
        if EditCadastroNMUSUARIO.Enabled then
          ActiveControl := EditCadastroNMUSUARIO;
  end;

  // Para que o evento volte a ser executado.
  EditCadastroCDUSUARIO.OnExit := EditCadastroCDUSUARIOExit;
  EditCadastroNMLOGIN.OnExit := EditCadastroNMLOGINExit;
  EditCadastroNMUSUARIO.OnExit := EditCadastroNMUSUARIOExit;
  EditCadastroNMUSUARIO.OnClickBtn := EditCadastroNMUSUARIOClickBtn;
end;

procedure TfmCadDespesa.EditCadastroNMUSUARIOExit(Sender: TObject);
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
    ButtonLimparUsuario.Enabled := (plUsuario.Count > 0);
    if fmPrincipal.Administrador = false then
      ButtonLimparUsuario.Enabled := false;

    // Valida para qual campo vai se posicionar.
    if OfficePagerCentral.ActivePageIndex = 1 then
      if plUsuario.Count > 0 then
      begin
        if EditCadastroDEDESPESA.Enabled then
          ActiveControl := EditCadastroDEDESPESA;
      end
      else
        if EditCadastroNMUSUARIO.Enabled then
          ActiveControl := EditCadastroNMUSUARIO;
  end;

  // Para que o evento volte a ser executado.
  EditCadastroCDUSUARIO.OnExit := EditCadastroCDUSUARIOExit;
  EditCadastroNMLOGIN.OnExit := EditCadastroNMLOGINExit;
  EditCadastroNMUSUARIO.OnExit := EditCadastroNMUSUARIOExit;
  EditCadastroNMUSUARIO.OnClickBtn := EditCadastroNMUSUARIOClickBtn;
end;

procedure TfmCadDespesa.congelaTela(prmCongelar: boolean);
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
  EditCadastroDEDESPESA.Enabled := not prmCongelar;

  ButtonAdicionarLinhaGridItens.Enabled := not prmCongelar;
  ButtonExcluirLinhaGridItens.Enabled := not prmCongelar;
  ButtonGerarItensDespesa.Enabled := not prmCongelar;
  BitBtnRestaurar.Enabled := not prmCongelar;
  BitBtnCancelarDespesa.Enabled := not prmCongelar;
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

procedure TfmCadDespesa.DatePickerEditCadastroDTDESPESAExit(Sender: TObject);
begin
  // Para alteração, a data não pode ser menor que o Ano do cadastro.
  if Opcao = 'A' then
    if (DatePickerEditCadastroDTDESPESA.Date < pdtMinima) or
       (DatePickerEditCadastroDTDESPESA.Date > pdtMaxima) then
    begin
      MessageBox(fmPrincipal.Handle,
			           PWideChar('A data da despesa informada não se encontra dentro do ano da despesa.'+#13+#10+
                           'Favor informar uma data que pertença ao ano de '+EditCadastroNUANODESPESA.Text+'.'),
			           cTituloMensagemErro,
			           MB_OK or MB_ICONERROR);
      DatePickerEditCadastroDTDESPESA.Date := pdtDespesa;
      Exit;
    end;
  EditCadastroNUANODESPESA.Text := IntToStr(YearOf(DatePickerEditCadastroDTDESPESA.Date));
end;

procedure TfmCadDespesa.DBAdvGridGeralClickCell(Sender: TObject; ARow,
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
    atualizaDespesaVisivel;
end;

procedure TfmCadDespesa.DBAdvGridGeralDblClickCell(Sender: TObject; ARow,
  ACol: Integer);
begin
  if ARow > 0 then
    MenuItemEditarRegistroClick(MenuItemEditarRegistro);
end;

procedure TfmCadDespesa.DBAdvGridGeralFilterSelect(Sender: TObject; Column,
  ItemIndex: Integer; FriendlyName: string; var FilterCondition: string);
begin
  case ItemIndex of
    0: FilterCondition := EmptyStr;
    1: FilterCondition := 'S';
    2: FilterCondition := 'N';
  end;

  DBAdvGridGeral.Cells[Column,0] := FriendlyName;
end;

procedure TfmCadDespesa.desabilitaBotoes;
begin
  BitBtnSalvar.Enabled := false;
  BitBtnCancelarDespesa.Enabled := false;
  BitBtnRestaurar.Enabled := false;
  BitBtnNovo.Enabled := false;
  BitBtnInserirDocumento.Enabled := false;

  ButtonAdicionarLinhaGridItens.Enabled := false;
  ButtonExcluirLinhaGridItens.Enabled := false;
end;

procedure TfmCadDespesa.editaCadastro;
var
  vQuery: TZQuery;
  vAno: word;
begin
  novoCadastro;

  try
    try
      vQuery := pDespesa.lista;
      with vQuery do
      begin
        // Consulta o cadastro da Despesa.
        SQL.Add('WHERE cddespesa = :CURRENT_CDDESPESA');
        Params.ParamByName('CURRENT_CDDESPESA').AsInteger := Codigo;
        dmPrincipal.executaConsulta(vQuery);

        if not Eof then
        begin
          EditCadastroNUANODESPESA.Text := Fields.FieldByName('NUANODESPESA').AsString;
          EditCadastroNUDESPESA.Text := Fields.FieldByName('NUDESPESA').AsString;
          DatePickerEditCadastroDTDESPESA.Date := Fields.FieldByName('DTDESPESA').AsDateTime;
          vAno := StrToInt(EditCadastroNUANODESPESA.Text);
          pdtMinima := EncodeDate(vAno,1,1);
          pdtMaxima := EncodeDate(vAno,12,31);
          pdtDespesa := Fields.FieldByName('DTDESPESA').AsDateTime;
          EditCadastroCDTIPOMOVIMENTO.Text := Fields.FieldByName('CDTIPOMOVIMENTO').AsString;
          EditCadastroCDTIPOMOVIMENTOExit(EditCadastroCDTIPOMOVIMENTO);
          EditCadastroCDUSUARIO.Text := Fields.FieldByName('CDUSUARIO').AsString;
          EditCadastroCDUSUARIOExit(EditCadastroCDUSUARIO);
          EditCadastroDEDESPESA.Text := Fields.FieldByName('DEDESPESA').AsString;
          if not Fields.FieldByName('DEOBSERVACOES').IsNull then
            MemoCadastroDEOBSERVACOES.Lines.Text := Fields.FieldByName('DEOBSERVACOES').AsString;
          DatePickerEditCadastroDTCADASTRO.Date := Fields.FieldByName('DTREGISTRO').AsDateTime;
          if not Fields.FieldByName('DTULTATUALIZACAO').IsNull then
            DatePickerEditCadastroDTULTATUALIZACAO.Date := Fields.FieldByName('DTULTATUALIZACAO').AsDateTime
          else
            DatePickerEditCadastroDTULTATUALIZACAO.Clear;
          // Mostra ou não o painel.
          // - Se cancelado, mostra o painel com a informação de cancelamento.
          PanelStatusCadastro.Visible := (Fields.FieldByName('FLCANCELADO').AsString = 'S');
          if PanelStatusCadastro.Visible then
            LabelStatusCadastro.Caption := 'Esta despesa foi cancelada em ' + FormatDateTime('dd/mm/yyyy',Fields.FieldByName('DTCANCELAMENTO').AsDateTime) + '.';
        end
        else
          raise exception.Create('O cadastro da Despesa não foi encontrado.');
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
          ButtonGerarItensDespesa.Enabled := false;
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

procedure TfmCadDespesa.editaCadastroViaConsulta(prmCodigo: integer);
begin
  Codigo := prmCodigo;
  Opcao := 'A';
  // A opção 2 apresenta o botão Novo sempre desabilitado.
  Tag := 2;
  editaCadastro;
  OfficePagerCentral.ActivePageIndex := 1;
  OfficePageConsulta.TabVisible := false;
  if ColumnGridItens.Enabled then
    ActiveControl := ColumnGridItens;
end;

procedure TfmCadDespesa.editaColunaGrid(prmIndice: integer; prmNome,
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

procedure TfmCadDespesa.EditCadastroCDTIPOMOVIMENTOChange(Sender: TObject);
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

procedure TfmCadDespesa.EditCadastroCDTIPOMOVIMENTOExit(Sender: TObject);
var
  vQuery: TZQuery;
begin
  // Se não digitou nada, sai sem abrir a search.
  if Length(Trim(EditCadastroCDTIPOMOVIMENTO.Text)) = 0 then
    Exit;

  // Para que o evento não seja executado.
  EditCadastroCDTIPOMOVIMENTO.OnChange := nil;
  EditCadastroCDTIPOMOVIMENTO.OnExit := nil;
  EditCadastroDETIPOMOVIMENTO.OnExit := nil;
  EditCadastroDETIPOMOVIMENTO.OnClickBtn := nil;

  try
    vQuery := pTipoMovimento.filtro;
    with vQuery do
    begin
      SQL.Add('WHERE "NU-Código" = :CDTIPOMOVIMENTO');
      SQL.Add('  AND "DE-Natureza" = ''Despesa''');
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
    if OfficePagerCentral.ActivePageIndex = 1 then
      if plTipoMovimento.Count > 0 then
      begin
        if plUsuario.Count = 0 then
        begin
          if EditCadastroCDUSUARIO.Enabled then
            ActiveControl := EditCadastroCDUSUARIO;
        end
        else
          if EditCadastroDEDESPESA.Enabled then
            ActiveControl := EditCadastroDEDESPESA;
      end
      else
        if EditCadastroCDTIPOMOVIMENTO.Enabled then
          ActiveControl := EditCadastroCDTIPOMOVIMENTO;
  end;

  // Para que o evento volte a ser executado.
  EditCadastroCDTIPOMOVIMENTO.OnChange := EditCadastroCDTIPOMOVIMENTOChange;
  EditCadastroCDTIPOMOVIMENTO.OnExit := EditCadastroCDTIPOMOVIMENTOExit;
  EditCadastroDETIPOMOVIMENTO.OnExit := EditCadastroDETIPOMOVIMENTOExit;
  EditCadastroDETIPOMOVIMENTO.OnClickBtn := EditCadastroDETIPOMOVIMENTOClickBtn;
end;

procedure TfmCadDespesa.EditCadastroCDUSUARIOChange(Sender: TObject);
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

procedure TfmCadDespesa.EditCadastroCDUSUARIOExit(Sender: TObject);
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
    ButtonLimparUsuario.Enabled := (plUsuario.Count > 0);
    if fmPrincipal.Administrador = false then
      ButtonLimparUsuario.Enabled := false;

    // Valida para qual campo vai se posicionar.
    if OfficePagerCentral.ActivePageIndex = 1 then
      if plUsuario.Count > 0 then
      begin
        if EditCadastroDEDESPESA.Enabled then
          ActiveControl := EditCadastroDEDESPESA;
      end
      else
        if EditCadastroCDUSUARIO.Enabled then
          ActiveControl := EditCadastroCDUSUARIO;
  end;

  // Para que o evento volte a ser executado.
  EditCadastroCDUSUARIO.OnExit := EditCadastroCDUSUARIOExit;
  EditCadastroNMLOGIN.OnExit := EditCadastroNMLOGINExit;
  EditCadastroNMUSUARIO.OnExit := EditCadastroNMUSUARIOExit;
  EditCadastroNMUSUARIO.OnClickBtn := EditCadastroNMUSUARIOClickBtn;
end;

procedure TfmCadDespesa.EditCadastroNMLOGINExit(Sender: TObject);
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
    ButtonLimparUsuario.Enabled := (plUsuario.Count > 0);
    if fmPrincipal.Administrador = false then
      ButtonLimparUsuario.Enabled := false;

    // Valida para qual campo vai se posicionar.
    if OfficePagerCentral.ActivePageIndex = 1 then
      if plUsuario.Count > 0 then
      begin
        if EditCadastroDEDESPESA.Enabled then
          ActiveControl := EditCadastroDEDESPESA;
      end
      else
        if EditCadastroNMLOGIN.Enabled then
          ActiveControl := EditCadastroNMLOGIN;
  end;

  // Para que o evento volte a ser executado.
  EditCadastroCDUSUARIO.OnExit := EditCadastroCDUSUARIOExit;
  EditCadastroNMLOGIN.OnExit := EditCadastroNMLOGINExit;
  EditCadastroNMUSUARIO.OnExit := EditCadastroNMUSUARIOExit;
  EditCadastroNMUSUARIO.OnClickBtn := EditCadastroNMUSUARIOClickBtn;
end;

procedure TfmCadDespesa.EditCadastroNUANODESPESAExit(Sender: TObject);
var
  vDataInicial, vDataFinal: TDate;
begin
  vDataInicial := StrToDate(Format('01/01/%s',[EditCadastroNUANODESPESA.Text]));
  vDataFinal := StrToDate(Format('31/12/%s',[EditCadastroNUANODESPESA.Text]));

  if (DatePickerEditCadastroDTDESPESA.Date < vDataInicial) or
     (DatePickerEditCadastroDTDESPESA.Date > vDataFinal) then
  begin
    DatePickerEditCadastroDTDESPESA.Date := vDataFinal;
    MessageBox(fmPrincipal.Handle,
               PWideChar('A data de despesa informada não pertence ao ano informado.'+#13+#10+
                         'Por este motivo, o sistema ajustou automaticamente a data de despesa para o primeiro dia deste ano.'+#13+#10+
                         'Por favor, reveja o campo Data de Despesa.'),
               cTituloMensagemAlerta,
               MB_OK or MB_ICONWARNING);
  end;
end;

procedure TfmCadDespesa.enviaEmail;
var
  vEmail, vnuNotaFiscal: string;
  vQuery,vQuery2: TZQuery;
  vvlTotalGeral: currency;
begin
  try
    vQuery := pDespesa.visao;
    with vQuery do
    begin
      SQL.Add('WHERE despesa.cddespesa = :CDDESPESA');
      Params.Items[0].AsInteger := Codigo;
      dmPrincipal.executaConsulta(vQuery);

      if Eof then
        raise Exception.Create('Não foi possível consultar a despesa cadastrada.');

      // Formata o e-mail de confirmação da despesa.
      vEmail := '<div align="left">'+
                'E-mail de confirmação de Cadastro de Despesa.<br><br>'+
                '<b>Tipo de movimento:</b> '+ Fields.Fields[1].AsString +'<br>'+
                '<b>Despesa:</b> '+ Fields.Fields[2].AsString +'<br>'+
                '<b>Data do registro:</b> '+ Fields.Fields[9].AsString +'<br>'+
                '<b>Data da despesa:</b> '+ Fields.Fields[5].AsString +'<br>'+
                '<b>Usuário (Login):</b> '+ Fields.Fields[3].AsString +'<br>'+
                '<b>Descrição:</b> '+ Fields.Fields[4].AsString +'<br>'+
                '<b>Frequência:</b> '+ Fields.Fields[8].AsString +'<br>'+
                '</div>'+
                '<br>';
    end;

    vEmail := vEmail +
              '</div>'+
              '<br>'+
              '<table width="100%" border="1" cellspacing="0" cellpadding="1">'+
              '  <tr>'+
              '    <td width="30" style="white-space: nowrap text-align:left"><b>Item</b></td>'+
              '    <td width="70" style="white-space: nowrap text-align:left"><b>Data venc.</b></td>'+
              '    <td width="70" style="white-space: nowrap text-align:left"><b>Data pgto</b></td>'+
              '    <td width="*" style="white-space: nowrap text-align:left"><b>Forma pgto</b></td>'+
              '    <td width="150" style="white-space: nowrap text-align:left"><b>Fornecedor</b></td>'+
              '    <td width="80" style="white-space: nowrap text-align:left"><b>Nº Nota Fiscal</b></td>'+
              '    <td width="80" style="white-space: nowrap text-align:left"><b>Vl. despesa</b></td>'+
              '    <td width="80" style="white-space: nowrap text-align:left"><b>Vl. desconto</b></td>'+
              '    <td width="80" style="white-space: nowrap text-align:left"><b>Vl. juros</b></td>'+
              '    <td width="80" style="white-space: nowrap text-align:left"><b>Vl. total</b></td>'+
              '  </tr>';

    // Preenche os Itens da Despesa.
    vQuery2 := pDespesa.visaoItem;
    with vQuery2 do
    begin
      SQL.Add('WHERE cddespesa = :CDDESPESA');
      Params.Items[0].AsInteger := Codigo;
      dmPrincipal.executaConsulta(vQuery2);

      if Eof then
        raise Exception.Create('Não foi possível consultar os itens da despesa cadastrada.');

      vvlTotalGeral := 0;
      while not Eof do
      begin
        // Calcula os totais gerais.
        vvlTotalGeral := vvlTotalGeral + Fields.Fields[7].AsCurrency;
        if not Fields.Fields[13].IsNull then
          vnuNotaFiscal := Format('%.*d', [10,Fields.Fields[13].AsInteger])
        else
          vnuNotaFiscal := EmptyStr;

        vEmail := vEmail +
                '  <tr>'+
                '    <td width="30" style="white-space:nowrap; text-align:right">'+ Fields.Fields[1].AsString +'</td>'+
                '    <td width="70" style="white-space:nowrap; text-align:left">'+ Fields.Fields[11].AsString +'</td>'+
                '    <td width="70" style="white-space:nowrap; text-align:left">'+ Fields.Fields[12].AsString +'</td>'+
                '    <td width="*" style="white-space:nowrap; text-align:left">'+ Fields.Fields[8].AsString+'</td>'+
                '    <td width="150" style="white-space:nowrap; text-align:left">'+ Fields.Fields[9].AsString+'</td>'+
                '    <td width="80" style="white-space:nowrap; text-align:right">'+ vnuNotaFiscal +'</td>'+
                '    <td width="80" style="white-space:nowrap; text-align:right">'+ FormatFloat('"R$ ",0.00',Fields.Fields[4].AsCurrency) +'</td>'+
                '    <td width="80" style="white-space:nowrap; text-align:right">'+ FormatFloat('"R$ ",0.00',Fields.Fields[5].AsCurrency) +'</td>'+
                '    <td width="80" style="white-space:nowrap; text-align:right">'+ FormatFloat('"R$ ",0.00',Fields.Fields[6].AsCurrency) +'</td>'+
                '    <td width="80" style="white-space:nowrap; text-align:right">'+ FormatFloat('"R$ ",0.00',Fields.Fields[7].AsCurrency) +'</td>'+
                '  </tr>';
        Next;
      end;

      // Apresenta o valor total geral.
      First;
      if not Eof then
        vEmail := vEmail +
                '  <tr>'+
                '    <td colspan="10" width="*" style="white-space:nowrap; text-align:right"><b>Total geral:</b> '+ FormatFloat('"R$ ",0.00',vvlTotalGeral) +'</td>'+
                '  </tr>';
    end;

    vEmail := vEmail + '  </table>';

    try
      fmPrincipal.pLogSistema.Debug('Enviando e-mail.');
      fmPrincipal.enviaEmail('Cadastro de Despesa', fmPrincipal.EmailUsuarioLogado, EmptyStr, EmptyStr, vEmail);
      fmPrincipal.pLogSistema.Debug('Concluído.');
    except
      on E: Exception do
        fmPrincipal.manipulaExcecoes(fmCadDespesa,E);
    end;
  finally
    vQuery.Active := false;
    vQuery2.Active := false;
    FreeAndNil(vQuery);
    FreeAndNil(vQuery2);
  end;
end;

procedure TfmCadDespesa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfmCadDespesa.FormCreate(Sender: TObject);
var
  i: integer;
begin
  try
    CreateGUID(pId);

    Color := Self.Color;
    FormStyler.AutoThemeAdapt := false;

    // Cria as listas.
    plTipoMovimento := TStringList.Create;
    plUsuario := TStringList.Create;
    plFormaPagamento := TStringList.Create;
    plFornecedor := TStringList.Create;

    pUsuario := TUsuario.Create;
    pFornecedor := TFornecedor.Create;
    pFormaPagamento := TFormaPagamento.Create;
    pTipoMovimento := TTipoMovimento.Create;
    pDespesa := TDespesa.Create;

    Color := Self.Color;

    // Seta a opção padrão, que é inclusão.
    if Opcao <> 'A' then
      Opcao := 'I';

    OfficePagerCentral.ActivePageIndex := 1;

    Ordenacao := '|"Tipo de movimento":"S":"Asc."|;|"Despesa":"S":"Asc."|;|"Usuário":"S":"Asc."|;|"Descrição":"S":"Asc."|;|"Data":"S":"Asc."|;|"Anexo":"N":"Asc."|;|"Visível":"N":"Asc."|;|"Código":"N":"Asc."|';

    // Monta a consulta que carregará os dados da Grid.
    QueryGeral.SQL := pDespesa.grid.SQL;

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

procedure TfmCadDespesa.FormDestroy(Sender: TObject);
begin
  FreeAndNil(plTipoMovimento);
  FreeAndNil(plUsuario);
  FreeAndNil(plFormaPagamento);
  FreeAndNil(plFornecedor);
  FreeAndNil(pUsuario);
  FreeAndNil(pFornecedor);
  FreeAndNil(pFormaPagamento);
  FreeAndNil(pTipoMovimento);
  FreeAndNil(pDespesa);
end;

procedure TfmCadDespesa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Exit;
end;

procedure TfmCadDespesa.FormResize(Sender: TObject);
begin
  EspacamentoInicial := fmPrincipal.EspacamentoInicialBotao;
  EspacamentoFinal := fmPrincipal.EspacamentoFinalBotao;
  EspacamentoEntre := fmPrincipal.EspacamentoEntreBotoes;

  BitBtnFechar.Left := PanelBotoes.Width - BitBtnFechar.Width - EspacamentoFinal;
  BitBtnInserirDocumento.Left := BitBtnFechar.Left - BitBtnInserirDocumento.Width - EspacamentoEntre;
  BitBtnCancelarDespesa.Left := BitBtnInserirDocumento.Left - BitBtnCancelarDespesa.Width - EspacamentoEntre;
  BitBtnNovo.Left := BitBtnCancelarDespesa.Left - BitBtnNovo.Width - EspacamentoEntre;
  BitBtnRestaurar.Left := BitBtnNovo.Left - BitBtnRestaurar.Width - EspacamentoEntre;
  BitBtnSalvar.Left := BitBtnRestaurar.Left - BitBtnSalvar.Width - EspacamentoEntre;

  ButtonExcluirLinhaGridItens.Left := PanelBotoesControleGridItens.Width - ButtonExcluirLinhaGridItens.Width - EspacamentoFinal;
  ButtonAdicionarLinhaGridItens.Left := ButtonExcluirLinhaGridItens.Left - ButtonAdicionarLinhaGridItens.Width - EspacamentoEntre;
  ButtonGerarItensDespesa.Left := ButtonAdicionarLinhaGridItens.Left - ButtonGerarItensDespesa.Width - EspacamentoEntre;
end;

procedure TfmCadDespesa.habilitaBotoes;
begin
  BitBtnSalvar.Enabled := true;
  if Tag <> 2 then
    BitBtnCancelarDespesa.Enabled := true;
  BitBtnRestaurar.Enabled := true;
  if Tag <> 2 then
    BitBtnNovo.Enabled := true;
  BitBtnInserirDocumento.Enabled := true;
  ButtonGerarItensDespesa.Enabled := (Opcao = 'I');
  ButtonAdicionarLinhaGridItens.Enabled := true;
  ButtonExcluirLinhaGridItens.Enabled := true;
end;

procedure TfmCadDespesa.ButtonLimparTipoMovimentoClick(Sender: TObject);
begin
  plTipoMovimento.Clear;

  EditCadastroCDTIPOMOVIMENTO.Clear;
  EditCadastroDETIPOMOVIMENTO.Clear;

  EditCadastroCDTIPOMOVIMENTO.Enabled := true;
  EditCadastroDETIPOMOVIMENTO.Enabled := true;
  ButtonLimparTipoMovimento.Enabled := false;
  ButtonNovoTipoMovimento.Enabled := true;
end;

procedure TfmCadDespesa.ButtonLimparUsuarioClick(Sender: TObject);
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

procedure TfmCadDespesa.ButtonNovoTipoMovimentoClick(Sender: TObject);
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
        NaturezaPadrao := 'D';
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
      if OfficePagerCentral.ActivePageIndex = 1 then
        if EditCadastroCDTIPOMOVIMENTO.Enabled then
          ActiveControl := EditCadastroCDTIPOMOVIMENTO;
      EditCadastroCDTIPOMOVIMENTO.Text := IntToStr(vcdTipoMovimento);
      EditCadastroCDTIPOMOVIMENTOExit(EditCadastroCDTIPOMOVIMENTO);
      ButtonLimparTipoMovimento.Enabled := true;
      ButtonNovoTipoMovimento.Enabled := false;
    end;
  end;
end;

procedure TfmCadDespesa.MenuItemAtualizarTabelaClick(Sender: TObject);
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
      editaColunaGrid(2,'DESPESAF','Despesa',edNone,taLeftJustify,55,true);
      editaColunaGrid(3,'NMLOGIN','Usuário',edNone,taLeftJustify,120,true);
      editaColunaGrid(4,'DEDESPESA','Descrição',edNone,taLeftJustify,350,true);
      editaColunaGrid(5,'DTDESPESA','Data',edNone,Classes.taLeftJustify,70,true);
      editaColunaGrid(6,'FLANEXO','Anexo',edCheckBox,Classes.taCenter,40,true);
      editaColunaGrid(7,'FLVISIVEL','Visível',edCheckBox,Classes.taCenter,40,true);
      editaColunaGrid(8,'CDDESPESA','Código',edNone,taRightJustify,40,true);
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

procedure TfmCadDespesa.MenuItemEditarRegistroClick(Sender: TObject);
begin
  Opcao := 'A';
  with DBAdvGridGeral do
    Codigo := ColumnByName['CDDESPESA'].Ints[Row];
  pDespesa.Codigo := Codigo;

  editaCadastro;
  habilitaBotoes;

  if EditCadastroDEDESPESA.Enabled then
    ActiveControl := EditCadastroDEDESPESA;
end;

procedure TfmCadDespesa.MenuItemVisualizarFiltroClick(Sender: TObject);
begin
  GridFindDialogColumnGrid.Execute;
end;

procedure TfmCadDespesa.novoCadastro;
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
      vcdTipoMovimentoPadrao := IntToStr(vTipoMovimento.obtemPadrao('D'));
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

  EditCadastroNUANODESPESA.Text := FormatDateTime('yyyy',Date());
  EditCadastroNUDESPESA.Clear;
  DatePickerEditCadastroDTDESPESA.Date := Date();

  // Preenche os dados do usuário.
  EditCadastroCDUSUARIO.Text := IntToStr(fmPrincipal.CodigoUsuarioLogado);
  EditCadastroCDUSUARIOExit(EditCadastroCDUSUARIO);

  EditCadastroDEDESPESA.Clear;
  MemoCadastroDEOBSERVACOES.Lines.Clear;
  DatePickerEditCadastroDTCADASTRO.Clear;
  DatePickerEditCadastroDTULTATUALIZACAO.Clear;

  limpaGridItens;

  if EditCadastroCDTIPOMOVIMENTO.Text = EmptyStr then
  begin
    if EditCadastroCDTIPOMOVIMENTO.Enabled then
      ActiveControl := EditCadastroCDTIPOMOVIMENTO;
  end
  else
    if EditCadastroDEDESPESA.Enabled then
      ActiveControl := EditCadastroDEDESPESA;
end;

procedure TfmCadDespesa.obtemConfiguracaoItensDespesa;
begin
  fmCadDespesaConfiguracao := TfmCadDespesaConfiguracao.Create(Self);
  with fmCadDespesaConfiguracao do
  begin
    ShowModal;

    // Se saiu pelo botão Aplicar salva os parâmetros.
    pValorDespesa := ValorDespesa;
    if ValorDespesa > 0 then
    begin
      pMesInicio := MesInicio;
      pMesEncerramento := MesEncerramento;
      pAnoInicio := AnoInicio;
      pAnoEncerramento := AnoEncerramento;
      pDiaVencimento := DiaVencimento;
      plFormaPagamento.Clear;
      plFornecedor.Clear;
      if FormaPagamento <> -1 then
        plFormaPagamento.Add(IntToStr(FormaPagamento));
      if Fornecedor <> -1 then
        plFornecedor.Add(IntToStr(Fornecedor));
    end;
  end;
end;

function TfmCadDespesa.obtemnmFormaPagamento(
  prmcdFormaPagamento: integer): string;
var
  vQuery: TZQuery;
begin
  try
    // Consulta o cadastro dos Formas de Pagamento.
    vQuery := pFormaPagamento.lista;
    if prmcdFormaPagamento <> 0 then
      with vQuery do
      begin
        SQL.Add('WHERE cdformapagamento = :CURRENT_CDFORMAPAGAMENTO');
        Params.ParamByName('CURRENT_CDFORMAPAGAMENTO').AsInteger := prmcdFormaPagamento;
        dmPrincipal.executaConsulta(vQuery);

        if not Eof then
          Result := Fields.FieldByName('NMFORMAPAGAMENTO').AsString
        else
          Result := EmptyStr;
      end;
    finally
      vQuery.Active := false;
      FreeAndNil(vQuery);
    end;
end;

function TfmCadDespesa.obtemnmFornecedor(prmcdFornecedor: integer): string;
var
  vQuery: TZQuery;
begin
  try
    // Consulta o cadastro dos Fornecedores.
    vQuery := pFornecedor.lista;
    if prmcdFornecedor <> 0 then
      with vQuery do
      begin
        SQL.Add('WHERE cdfornecedor = :CURRENT_CDFORNECEDOR');
        Params.ParamByName('CURRENT_CDFORNECEDOR').AsInteger := prmcdFornecedor;
        dmPrincipal.executaConsulta(vQuery);

        if not Eof then
          Result := Fields.FieldByName('NMFORNECEDOR').AsString
        else
          Result := EmptyStr;
      end;
    finally
      vQuery.Active := false;
      FreeAndNil(vQuery);
    end;
end;

procedure TfmCadDespesa.OfficePageCadastroShow(Sender: TObject);
begin
  if EditCadastroDEDESPESA.Enabled then
    ActiveControl := EditCadastroDEDESPESA;
end;

procedure TfmCadDespesa.OfficePageConsultaShow(Sender: TObject);
begin
  if DBAdvGridGeral.Enabled then
    ActiveControl := DBAdvGridGeral;
end;

procedure TfmCadDespesa.populaGridItens;
var
  vQuery: TZQuery;
  procedure insereDadosGrid(prmnuItem: integer; prmvlDespesa, prmvlDesconto,
                            prmvlJuros: currency; prmdtVencimento: TDate;
                            prmdtPagamento: string; prmcdFormaPagamento,
                            prmcdFornecedor, prmnuNotaFiscal,
                            prmcdMovimento: integer;
                            prmdeObservacoes: string);
  begin
    with ColumnGridItens do
    begin
      if ColumnByName['NUITEM'].Rows[RowCount-1] <> EmptyStr then
        RowCount := RowCount +1;
      ColumnByName['NUITEM'].Ints[RowCount-1] := prmnuItem;
      ColumnByName['VLDESPESA'].Floats[RowCount-1] := prmvlDespesa;
      ColumnByName['VLDESCONTO'].Floats[RowCount-1] := prmvlDesconto;
      ColumnByName['VLJUROS'].Floats[RowCount-1] := prmvlJuros;
      ColumnByName['DTVENCIMENTO'].Dates[RowCount-1] := prmdtVencimento;
      if prmdtPagamento <> EmptyStr then
        ColumnByName['DTPAGAMENTO'].Dates[RowCount-1] := StrToDate(prmdtPagamento)
      else
        ColumnByName['DTPAGAMENTO'].Rows[RowCount-1] := EmptyStr;
      ColumnByName['CDFORMAPAGAMENTO'].Ints[RowCount-1] := prmcdFormaPagamento;
      if prmcdFormaPagamento <> 0 then
        ColumnByName['NMFORMAPAGAMENTO'].Rows[RowCount-1] := obtemnmFormaPagamento(prmcdFormaPagamento)
      else
        ColumnByName['NMFORMAPAGAMENTO'].Rows[RowCount-1] := EmptyStr;
      ColumnByName['CDFORNECEDOR'].Ints[RowCount-1] := prmcdFornecedor;
      if prmcdFornecedor > 0 then
        ColumnByName['NMFORNECEDOR'].Rows[RowCount-1] := obtemnmFornecedor(prmcdFornecedor)
      else
        ColumnByName['NMFORNECEDOR'].Rows[RowCount-1] := EmptyStr;
      if prmnuNotaFiscal > 0 then
        ColumnByName['NUNOTAFISCAL'].Rows[RowCount-1] := Format('%.*d', [10,prmnuNotaFiscal])
      else
        ColumnByName['NUNOTAFISCAL'].Rows[RowCount-1] := EmptyStr;
      ColumnByName['DEOBSERVACOES'].Rows[RowCount-1] := prmdeObservacoes;
      if prmdeObservacoes = EmptyStr then
        AddImageIdx(10,RowCount-1,0,haCenter,vaCenter)
      else
        AddImageIdx(10,RowCount-1,1,haCenter,vaCenter);
      ColumnByName['CDMOVIMENTO'].Ints[RowCount-1] := prmcdMovimento;
    end;
  end;
begin
  try
    try
      vQuery := pDespesa.listaItem;
      with vQuery do
      begin
        // Consulta o cadastro dos Itens da Despesa.
        SQL.Add('WHERE cddespesa = :CURRENT_CDDESPESA');
        SQL.Add('ORDER BY 2 ASC');
        Params.ParamByName('CURRENT_CDDESPESA').AsInteger := Codigo;
        dmPrincipal.executaConsulta(vQuery);

        if not Eof then
        begin
          ColumnGridItens.Enabled := true;
          ColumnGridItens.BeginUpdate;

          // Preeenche os dados da grid.
          while not Eof do
          begin
            insereDadosGrid(Fields.FieldByName('NUITEM').AsInteger,
                            Fields.FieldByName('VLDESPESA').AsCurrency,
                            Fields.FieldByName('VLDESCONTO').AsCurrency,
                            Fields.FieldByName('VLJUROS').AsCurrency,
                            Fields.FieldByName('DTVENCIMENTO').AsDateTime,
                            Fields.FieldByName('DTPAGAMENTO').AsString,
                            Fields.FieldByName('CDFORMAPAGAMENTO').AsInteger,
                            Fields.FieldByName('CDFORNECEDOR').AsInteger,
                            Fields.FieldByName('NUNOTAFISCAL').AsInteger,
                            Fields.FieldByName('CDMOVIMENTO').AsInteger,
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

procedure TfmCadDespesa.setaCadastroUnico;
begin
  ButtonGerarItensDespesa.Enabled := false;
  BitBtnCancelarDespesa.Enabled := false;
  BitBtnRestaurar.Enabled := false;
  BitBtnNovo.Enabled := false;
  BitBtnInserirDocumento.Enabled := false;
  OfficePageConsulta.TabVisible := false;
end;

procedure TfmCadDespesa.TabSheetCadastroDespesaItensShow(Sender: TObject);
begin
  if ColumnGridItens.Enabled then
    ActiveControl := ColumnGridItens;
end;

procedure TfmCadDespesa.ButtonExportarHTMLClick(Sender: TObject);
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

procedure TfmCadDespesa.ButtonExportarPlanilhaClick(Sender: TObject);
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

procedure TfmCadDespesa.ButtonImprimirRelatorioClick(Sender: TObject);
var
  vAux: string;
begin
  try
    QueryRelDespesa.SQL := pDespesa.relatorio.SQL;
    // Filtra pelo Usuário, caso informado no Painel Principal.
    if fmPrincipal.FiltroLogin <> cNenhumFiltroLogin then
      vAux := fmPrincipal.FiltroLogin
    else
      vAux := '%';
    QueryRelDespesa.Params.ParamByName('NMLOGIN').AsString := vAux;
    dmPrincipal.executaConsulta(QueryRelDespesa);
    with fmPrincipal.SystemRelatorio do
    begin
      DefaultDest := rdPreview;
      SystemSetups := SystemSetups - [ssAllowSetup];
      DoNativeOutput := false;
    end;
    with ProjectRelDespesa do
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

procedure TfmCadDespesa.ButtonOrdenarRegistrosClick(Sender: TObject);
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

procedure TfmCadDespesa.carregaImagensBotoes;
begin
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

  ButtonGerarItensDespesa.Picture.LoadFromFile(fmPrincipal.LocalIcones + 'purchase-order-e-16.png');
  ButtonGerarItensDespesa.HotPicture.LoadFromFile(fmPrincipal.LocalIcones + 'purchase-order-h-16.png');
  ButtonGerarItensDespesa.DisabledPicture.LoadFromFile(fmPrincipal.LocalIcones + 'purchase-order-d-16.png');
  ButtonAdicionarLinhaGridItens.Picture.LoadFromFile(fmPrincipal.LocalIcones + 'add-row-e-16.png');
  ButtonAdicionarLinhaGridItens.HotPicture.LoadFromFile(fmPrincipal.LocalIcones + 'add-row-h-16.png');
  ButtonAdicionarLinhaGridItens.DisabledPicture.LoadFromFile(fmPrincipal.LocalIcones + 'add-row-d-16.png');
  ButtonExcluirLinhaGridItens.Picture.LoadFromFile(fmPrincipal.LocalIcones + 'delete-row-e-16.png');
  ButtonExcluirLinhaGridItens.HotPicture.LoadFromFile(fmPrincipal.LocalIcones + 'delete-row-h-16.png');
  ButtonExcluirLinhaGridItens.DisabledPicture.LoadFromFile(fmPrincipal.LocalIcones + 'delete-row-d-16.png');
end;

function TfmCadDespesa.validaExclusao: boolean;
begin
  Result := true;
end;

end.
