unit unCadAquisicao;

interface

uses
  Windows, Messages, ShellAPI, SysUtils, Variants, StrUtils, Math, Classes,
  Mask, Buttons, MaskUtils, Registry, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ToolWin, ImgList, jpeg, StdCtrls, Menus, ExtCtrls, Grids, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, AdvObj, BaseGrid, AdvGrid,
  AdvCGrid, AsgFindDialog, UnAplExportaXLS, DBAdvGrid, RpCon, RpConDS, RpBase,
  RpSystem, RpDefine, RpRave, RpRender, RpRenderPDF, DateUtils, tmsAdvGridExcel,
  AdvAppStyler, AdvGlowButton, AdvPanel, AdvOfficeButtons, AdvEdit, AdvEdBtn,
  PlannerDatePicker, AdvGroupBox, AdvSpin, AdvMoneyEdit, AdvMenus, AdvToolBar,
  AdvOfficePager, unMaterial, unAquisicao, unUsuario, unFornecedor,
  unMotivoUrgencia, unFormaPagamento, unTipoMovimento;

type
  TfmCadAquisicao = class(TForm)
    QueryGeral: TZQuery;
    GridFindDialogColumnGrid: TAdvGridFindDialog;
    DataSource: TDataSource;
    ColumnGridItens: TAdvColumnGrid;
    DBAdvGridGeral: TDBAdvGrid;
    LabelSeparadorAnoNumero: TLabel;
    LabelDataAquisicao: TLabel;
    SaveDialog: TSaveDialog;
    QueryRelAquisicao: TZQuery;
    DataSetConnectionRelAquisicao: TRvDataSetConnection;
    ProjectRelAquisicao: TRvProject;
    AdvGridExcelIO: TAdvGridExcelIO;
    FormStyler: TAdvFormStyler;
    PanelBotoes: TAdvPanel;
    BitBtnSalvar: TAdvGlowButton;
    BitBtnRestaurar: TAdvGlowButton;
    BitBtnNovo: TAdvGlowButton;
    BitBtnCancelarAquisicao: TAdvGlowButton;
    BitBtnParcelas: TAdvGlowButton;
    BitBtnInserirDocumento: TAdvGlowButton;
    BitBtnFechar: TAdvGlowButton;
    PanelInformacoes: TAdvPanel;
    LabelInformacoes: TLabel;
    ButtonLimparUsuario: TAdvGlowButton;
    ButtonLimparTipoMovimento: TAdvGlowButton;
    ButtonNovoTipoMovimento: TAdvGlowButton;
    LabelFornecedor: TLabel;
    LabelNumeroNotaFiscal: TLabel;
    LabelFormaPagamento: TLabel;
    LabelMotivoUrgencia: TLabel;
    LabelPrevisaoEntrega: TLabel;
    LabelNumeroParcelas: TLabel;
    DatePickerEditCadastroDTAQUISICAO: TPlannerDatePicker;
    PanelStatusCadastro: TAdvPanel;
    LabelStatusCadastro: TLabel;
    EditCadastroNUANOAQUISICAO: TAdvEdit;
    EditCadastroCDUSUARIO: TAdvEdit;
    EditCadastroNMLOGIN: TAdvEdit;
    EditCadastroCDTIPOMOVIMENTO: TAdvEdit;
    EditCadastroNUAQUISICAO: TAdvEdit;
    EditCadastroNMUSUARIO: TAdvEditBtn;
    EditCadastroDETIPOMOVIMENTO: TAdvEditBtn;
    PopupMenuGrid: TAdvPopupMenu;
    MenuItemEditarRegistro: TMenuItem;
    MenuItemAtualizarTabela: TMenuItem;
    MenuItemEspaco1: TMenuItem;
    MenuItemVisualizarFiltro: TMenuItem;
    PanelTotalizadorItens: TAdvPanel;
    LabelTotalizadorItens: TLabel;
    PanelTotalizadorEspaco: TAdvPanel;
    PanelTotalizadorQuantidade: TAdvPanel;
    LabelTotalizadorQuantidade: TLabel;
    PanelTotalizadorValor: TAdvPanel;
    LabelTotalizadorValor: TLabel;
    PanelTotalizador: TAdvPanel;
    PanelMateriaisAquisicao: TAdvPanel;
    GroupBoxInformacoesEntrega: TAdvGroupBox;
    CheckBoxCadastroFLENTREGAPENDENTE: TAdvOfficeCheckBox;
    DatePickerEditCadastroDTPREVISAOENTREGA: TPlannerDatePicker;
    LabelCodigoRastreamento: TLabel;
    EditCadastroCDRASTREAMENTO: TAdvEdit;
    DatePickerEditCadastroDTENTREGA: TPlannerDatePicker;
    LabelDataEntrega: TLabel;
    GroupBoxInformacoesUrgencia: TAdvGroupBox;
    CheckBoxCadastroFLURGENTE: TAdvOfficeCheckBox;
    EditCadastroCDMOTIVOURGENCIA: TAdvEdit;
    EditCadastroDEMOTIVOURGENCIA: TAdvEditBtn;
    ButtonLimparMotivoUrgencia: TAdvGlowButton;
    ButtonNovoMotivoUrgencia: TAdvGlowButton;
    GroupBoxParcelamentoPagamento: TAdvGroupBox;
    EditCadastroCDFORNECEDOR: TAdvEdit;
    EditCadastroNUCNPJ: TAdvEdit;
    EditCadastroNMFORNECEDOR: TAdvEditBtn;
    ButtonLimparFornecedor: TAdvGlowButton;
    ButtonNovoFornecedor: TAdvGlowButton;
    EditCadastroNUNOTAFISCAL: TAdvEdit;
    EditCadastroCDFORMAPAGAMENTO: TAdvEdit;
    EditCadastroNMFORMAPAGAMENTO: TAdvEditBtn;
    ButtonLimparFormaPagamento: TAdvGlowButton;
    ButtonNovoFormaPagamento: TAdvGlowButton;
    CheckBoxCadastroFLPARCELADO: TAdvOfficeCheckBox;
    SpinEditNumeroParcelas: TAdvSpinEdit;
    LabelValorParcelaEntrada: TLabel;
    EditCadastroVLENTRADAPARCELA: TAdvMoneyEdit;
    LabelTaxaJuros: TLabel;
    EditCadastroVLTAXAJUROS: TAdvMoneyEdit;
    LabelValorExtra: TLabel;
    EditCadastroVLTAXAEXTRA: TAdvMoneyEdit;
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
    OfficePagerCadastroAquisicao: TAdvOfficePager;
    OfficePageCadastroAquisicao: TAdvOfficePage;
    PanelCadastro: TAdvPanel;
    PanelCampos: TAdvPanel;
    GroupBoxAquisicao: TAdvGroupBox;
    PanelTitulos: TAdvPanel;
    LabelDescricao: TLabel;
    LabelAquisicao: TLabel;
    LabelObservacoes: TLabel;
    LabelTipoMovimento: TLabel;
    LabelUsuario: TLabel;
    OfficePageCadastroAquisicaoItem: TAdvOfficePage;
    PanelAquisicaoItem: TAdvPanel;
    ButtonExibirCancelados: TAdvGlowButton;
    ToolBarSeparator2: TAdvToolBarSeparator;
    PanelBotoesMaterial: TAdvPanel;
    ButtonAdicionarMaterial: TAdvGlowButton;
    ButtonExibirInvisiveis: TAdvGlowButton;
    LabelDataCadastro: TLabel;
    DatePickerEditCadastroDTCADASTRO: TPlannerDatePicker;
    LabelDataUltimaAtualizacao: TLabel;
    DatePickerEditCadastroDTULTATUALIZACAO: TPlannerDatePicker;
    EditCadastroDEAQUISICAO: TAdvEdit;
    MemoCadastroDEOBSERVACOES: TMemo;
    ImageList: TImageList;
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtnFecharClick(Sender: TObject);
    procedure BitBtnNovoClick(Sender: TObject);
    procedure BitBtnSalvarClick(Sender: TObject);
    procedure BitBtnCancelarAquisicaoClick(Sender: TObject);
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
    procedure FormDestroy(Sender: TObject);
    procedure ButtonLimparUsuarioClick(Sender: TObject);
    procedure ButtonNovoFornecedorClick(Sender: TObject);
    procedure EditCadastroCDTIPOMOVIMENTOExit(Sender: TObject);
    procedure EditCadastroDETIPOMOVIMENTOExit(Sender: TObject);
    procedure EditCadastroCDMOTIVOURGENCIAExit(Sender: TObject);
    procedure ButtonLimparTipoMovimentoClick(Sender: TObject);
    procedure ButtonLimparMotivoUrgenciaClick(Sender: TObject);
    procedure ButtonNovoTipoMovimentoClick(Sender: TObject);
    procedure ButtonNovoMotivoUrgenciaClick(Sender: TObject);
    procedure EditCadastroDEMOTIVOURGENCIAExit(Sender: TObject);
    procedure ColumnGridItensClickCell(Sender: TObject; ARow,
      ACol: Integer);
    procedure BitBtnInserirDocumentoClick(Sender: TObject);
    procedure EditCadastroNUANOAQUISICAOExit(Sender: TObject);
    procedure ButtonLimparFormaPagamentoClick(Sender: TObject);
    procedure ButtonLimparFornecedorClick(Sender: TObject);
    procedure CheckBoxCadastroFLPARCELADOClick(Sender: TObject);
    procedure CheckBoxCadastroFLURGENTEClick(Sender: TObject);
    procedure ColumnGridItensGetCellColor(Sender: TObject; ARow, ACol: Integer;
      AState: TGridDrawState; ABrush: TBrush; AFont: TFont);
    procedure EditCadastroNMFORMAPAGAMENTOExit(Sender: TObject);
    procedure EditCadastroNMFORNECEDORExit(Sender: TObject);
    procedure EditCadastroNMUSUARIOExit(Sender: TObject);
    procedure EditCadastroCDFORNECEDORExit(Sender: TObject);
    procedure EditCadastroCDUSUARIOExit(Sender: TObject);
    procedure EditCadastroNMLOGINExit(Sender: TObject);
    procedure EditCadastroCDFORMAPAGAMENTOExit(Sender: TObject);
    procedure ButtonNovoFormaPagamentoClick(Sender: TObject);
    procedure EditCadastroNUCNPJChange(Sender: TObject);
    procedure EditCadastroNUCNPJExit(Sender: TObject);
    procedure EditCadastroNUNOTAFISCALChange(Sender: TObject);
    procedure BitBtnParcelasClick(Sender: TObject);
    procedure ButtonOrdenarRegistrosClick(Sender: TObject);
    procedure DatePickerEditCadastroDTAQUISICAOExit(Sender: TObject);
    procedure ButtonExibirCanceladosClick(Sender: TObject);
    procedure SpinEditNumeroParcelasChange(Sender: TObject);
    procedure EditCadastroDETIPOMOVIMENTOClickBtn(Sender: TObject);
    procedure EditCadastroNMUSUARIOClickBtn(Sender: TObject);
    procedure EditCadastroNMFORNECEDORClickBtn(Sender: TObject);
    procedure EditCadastroNMFORMAPAGAMENTOClickBtn(Sender: TObject);
    procedure EditCadastroDEMOTIVOURGENCIAClickBtn(Sender: TObject);
    procedure OfficePageCadastroAquisicaoShow(Sender: TObject);
    procedure EditCadastroCDTIPOMOVIMENTOChange(Sender: TObject);
    procedure EditCadastroCDUSUARIOChange(Sender: TObject);
    procedure EditCadastroCDFORNECEDORChange(Sender: TObject);
    procedure EditCadastroCDFORMAPAGAMENTOChange(Sender: TObject);
    procedure EditCadastroCDMOTIVOURGENCIAChange(Sender: TObject);
    procedure ButtonAdicionarMaterialClick(Sender: TObject);
    procedure CheckBoxCadastroFLENTREGAPENDENTEClick(Sender: TObject);
    procedure ButtonExibirInvisiveisClick(Sender: TObject);
    procedure DBAdvGridGeralClickCell(Sender: TObject; ARow, ACol: Integer);
    procedure ColumnGridItensGetFormat(Sender: TObject; ACol: Integer;
      var AStyle: TSortStyle; var aPrefix, aSuffix: string);
  private
    { Private declarations }
    pId: TGUID;
    pOpcao, pStatusAquisicao: Char;
    pCodigo, pEspacamentoInicial, pEspacamentoFinal, pEspacamentoEntre: integer;
    plUsuario, plTipoMovimento, plMotivoUrgencia, plFornecedor,
    plFormaPagamento: TStringList;
    pAtivarControle, pflParcelado: boolean;
    pOrdenacao, pOcultarExibir: string;
    pdtMinima, pdtMaxima, pdtAquisicao: TDate;
    pMaterial: TMaterial;
    pAquisicao: TAquisicao;
    pUsuario: TUsuario;
    pFornecedor: TFornecedor;
    pMotivoUrgencia: TMotivoUrgencia;
    pFormaPagamento: TFormaPagamento;
    pTipoMovimento: TTipoMovimento;
    procedure atualizaSomatorioGrid;
    procedure editaColunaGrid(prmIndice: integer; prmNome, prmCabecalho: string;
      prmEditor: TEditorType; prmAlinhamento: TAlignment; prmTamanho: integer;
      prmSomenteLeitura: boolean);
    procedure habilitaTudo;
    procedure desabilitaTudo;
    procedure desabilitaBotoes;
    procedure habilitaBotoes;
    procedure novoCadastro;
    procedure editaCadastro;
    procedure insereCadastro;
    procedure atualizaCadastro;
    procedure limpaGrid;
    procedure limpaCamposAquisicao;
    procedure enviaEMail;
    procedure atualizaAquisicaoVisivel;
    function validaExclusao: boolean;
    procedure carregaImagensBotoes;
    procedure carregaImageLists;
    procedure obtemMarcaModelo(prmcdMarcaModelo: string; var prmcdMarca, prmcdModelo: integer);
    property EspacamentoInicial: integer read pEspacamentoInicial write pEspacamentoInicial;
    property EspacamentoEntre: integer read pEspacamentoEntre write pEspacamentoEntre;
    property EspacamentoFinal: integer read pEspacamentoFinal write pEspacamentoFinal;
  public
    { Public declarations }
    procedure editaCadastroViaConsulta(prmCodigo: integer);
    function buscaId: cardinal;
    property Opcao: char read pOpcao write pOpcao;
    property Codigo: integer read pCodigo write pCodigo;
    property Ordenacao: string read pOrdenacao write pOrdenacao;
  end;

var
  fmCadAquisicao: TfmCadAquisicao;

implementation

uses unPrincipal, unConFiltroPadrao, undmPrincipal, undmEstilo, unCadMarca,
  unCadFamilia, unCadEmbalagem, unCadModelo, unCadImagem, unCadDocumento,
  unConFiltroMaterial, unCadMotivoUrgencia, unCadTipoMovimento, unCadFornecedor,
  unCadFormaPagamento, unCadMaterial, unCadAquisicaoParcela, unAplOrdenaGrid,
  unCadAquisicaoItem;

{$R *.dfm}

procedure TfmCadAquisicao.atualizaAquisicaoVisivel;
var
  vMensagem: string;
  vRetorno, vCodigo: integer;
  vflCancelado, vflParcelado: boolean;
begin
  // Verifica deseja realmente ocultar/exibir.
  with DBAdvGridGeral do
  begin
    if Row = 0 then
      Exit;

    vCodigo := ColumnByName['CDAQUISICAO'].Ints[Row];
  end;

  if pOcultarExibir = 'ocultar' then
    vMensagem := 'Deseja realmente ocultar a aquisição?'
  else
    vMensagem := 'Deseja realmente tornar a aquisição visível?';
  vRetorno := MessageBox(fmPrincipal.Handle,PWideChar(vMensagem),cTituloMensagemConfirmacao,MB_YESNO or MB_ICONQUESTION or MB_DEFBUTTON2);
  if vRetorno <> mrYes then
    Exit;

  // Aquisições canceladas e com parcelas pendentes não podem ser tornadas invisíveis.
  with DBAdvGridGeral do
  begin
    GetCheckBoxState(7,Row,vflCancelado);
    GetCheckBoxState(9,Row,vflParcelado);
    if vflCancelado = true then
    begin
      MessageBox(Handle,
                 PWideChar('As aquisições canceladas não podem ser ocultadas.'#13#10+
                           'Para ocultar as aquisições canceladas favor desmarcar a opção de exibir aquisições canceladas.'),
                 cTituloMensagemInformacao,
                 MB_OK or MB_ICONINFORMATION);
      Exit;
    end;
    if vflParcelado = true then
    begin
      pAquisicao.Codigo := ColumnByName['CDAQUISICAO'].Ints[Row];
      if pAquisicao.existeParcelaPendente > 0 then
      begin
        MessageBox(Handle,
                       PWideChar('As aquisições parceladas não podem ser ocultadas.'#13#10+
                                 'Favor concluir o pagamento das parcelas pendentes para, após isto, ocultar esta aquisição.'),
                       cTituloMensagemInformacao,
                       MB_OK or MB_ICONINFORMATION);
        Exit;
      end;
    end;
  end;

  pAquisicao.Codigo := vCodigo;
  if pOcultarExibir = 'ocultar' then
    pAquisicao.setaVisivel('N')
  else
    pAquisicao.setaVisivel('S');
  pAquisicao.Codigo := Codigo;

  MenuItemAtualizarTabelaClick(fmCadAquisicao);
end;

procedure TfmCadAquisicao.atualizaCadastro;
var
  vQuery: TZQuery;
  vRetorno, i, j, k, vqtMaterial, vnuParcelas, vcdMarca, vcdModelo: integer;
  vvlParcela, vvlUnitario, vvlGarantia, vvlTotal, x, y, z, vvlParcela1: currency;
begin
  try
    fmPrincipal.pLogSistema.Info('>> Cadastro de Aquisição - Atualiza o cadastro da Aquisição.');
    pAquisicao.Codigo := Codigo;
    pAquisicao.CodigoItem := 0;
    pAquisicao.Parcela := 0;
    pAquisicao.Nome := EditCadastroDEAQUISICAO.Text;
    if MemoCadastroDEOBSERVACOES.Lines.Count > 0 then
      pAquisicao.Observacoes.Assign(MemoCadastroDEOBSERVACOES.Lines)
    else
      pAquisicao.Observacoes.Clear;
    pAquisicao.Data := DatePickerEditCadastroDTAQUISICAO.Date;
    pAquisicao.MotivoUrgencia := StrToIntDef(EditCadastroCDMOTIVOURGENCIA.Text,0);
    pAquisicao.DataPrevisaoEntrega := DatePickerEditCadastroDTPREVISAOENTREGA.Date;
    pAquisicao.DataEntrega := DatePickerEditCadastroDTENTREGA.Date;
    pAquisicao.CodigoRastreamento := EditCadastroCDRASTREAMENTO.Text;
    pAquisicao.Fornecedor := StrToIntDef(EditCadastroCDFORNECEDOR.Text,0);
    pAquisicao.FormaPagamento := StrToIntDef(EditCadastroCDFORMAPAGAMENTO.Text,0);
    pAquisicao.NotaFiscal := StrToIntDef(EditCadastroNUNOTAFISCAL.Text,0);
    pAquisicao.TaxaJuros := EditCadastroVLTAXAJUROS.Value;
    pAquisicao.TaxaExtra := EditCadastroVLTAXAEXTRA.Value;
    if CheckBoxCadastroFLURGENTE.Checked = true then
      pAquisicao.Urgente := 'S'
    else
      pAquisicao.Urgente := 'N';
    if CheckBoxCadastroFLENTREGAPENDENTE.Checked = true then
      pAquisicao.EntregaPendente := 'S'
    else
      pAquisicao.EntregaPendente := 'N';
    if CheckBoxCadastroFLPARCELADO.Checked = true then
      pAquisicao.Parcelado := 'S'
    else
      pAquisicao.Parcelado := 'N';

    // Se for Administrador pode cadastrar para qualquer usuário, senão somente pode cadastrar para o seu próprio usuário.
    if fmPrincipal.Administrador = true then
      pAquisicao.Usuario := StrToInt(EditCadastroCDUSUARIO.Text)
    else
      pAquisicao.Usuario := fmPrincipal.CodigoUsuarioLogado;

    // Parâmetro informado ao editar o registro, aquisições parceladas não é
    // permitido editar valores, somente informações cadastrais.
    if pflParcelado = false then
      vRetorno := pAquisicao.atualiza
    else
      vRetorno := pAquisicao.atualizaParcelada;

    if vRetorno = 0 then
      raise Exception.Create('Não foi possível atualizar o cadastro.');

    // Só executa as próximas instruções se não for uma aquisição parcelada.
    if pflParcelado = false then
    begin
      // Loop para verificar os itens a serem excluídos.
      for i := ColumnGridItens.RowCount -1 downto 1 do
        if (ColumnGridItens.ColumnByName['EXCLUIDO'].Rows[i] = '1') and
           (ColumnGridItens.ColumnByName['NUITEM'].Rows[i] <> EmptyStr) then
          ColumnGridItens.RemoveRows(i,1);

      // Se desativou o parcelamento, apaga todas as parcelas.
      if (pAquisicao.Parcelado = 'N') and (pAquisicao.obtemNumeroParcelas > 0) then
      begin
        fmPrincipal.pLogSistema.Trace('>> Cadastro de Aquisição - Exclui Parcelas da Aquisição.');
        pAquisicao.excluiParcela;
      end;

      // Antes de inserir, exclui os itens existentes.
      fmPrincipal.pLogSistema.Trace('>> Cadastro de Aquisição - Exclui Itens da Aquisição.');
      pAquisicao.excluiItem;

      fmPrincipal.pLogSistema.Info('>> Cadastro de Aquisição - Insere Itens da Aquisição.');
      vvlTotal := 0;
      for i := 1 to ColumnGridItens.RowCount -1 do
        if (ColumnGridItens.ColumnByName['EXCLUIDO'].Rows[i] = '0') and
           (ColumnGridItens.ColumnByName['NUITEM'].Rows[i] <> EmptyStr) then
        begin
          // Insere a aquisição.
          vqtMaterial := ColumnGridItens.ColumnByName['QTEQUIVALENCIA'].Ints[i] * ColumnGridItens.ColumnByName['QTMATERIAL'].Ints[i];
          vvlUnitario := ColumnGridItens.ColumnByName['VLUNITARIO'].Floats[i];
          vvlGarantia := ColumnGridItens.ColumnByName['VLGARANTIA'].Floats[i];
          obtemMarcaModelo(ColumnGridItens.ColumnByName['CDMARCAMODELO'].Rows[i],vcdMarca,vcdModelo);
          pAquisicao.Material := ColumnGridItens.ColumnByName['CDMATERIAL'].Ints[i];
          pAquisicao.Embalagem := ColumnGridItens.ColumnByName['CDEMBALAGEM'].Ints[i];
          pAquisicao.Marca := vcdMarca;
          pAquisicao.Modelo := vcdModelo;
          pAquisicao.Quantidade := vqtMaterial;
          pAquisicao.ValorUnitario := vvlUnitario;
          if ColumnGridItens.ColumnByName['DTGARANTIA'].Rows[i] <> EmptyStr then
            pAquisicao.DataGarantia := ColumnGridItens.ColumnByName['DTGARANTIA'].Dates[i]
          else
            pAquisicao.DataGarantia := -1;
          pAquisicao.ValorGarantia := vvlGarantia;
          pAquisicao.Observacoes.Clear;
          pAquisicao.GarantiaAtiva := ColumnGridItens.ColumnByName['FLGARANTIAATIVA'].Rows[i];
          if pAquisicao.insereItem = 0 then
            raise Exception.Create('Não foi possível salvar o item da aquisição. O cadastro será cancelado!');
          vvlTotal := vvlTotal + (vqtMaterial * vvlUnitario) + (vqtMaterial * vvlGarantia);
        end;

      // Reordena os itens.
      fmPrincipal.pLogSistema.Trace('>> Cadastro de Aquisição - Executa a função fn_reorganiza_aquisicaoitem_nuitem.');
      try
        vQuery := TZQuery.Create(nil);
        try
          vQuery.SQL.Text := 'SELECT ' + cSchema + '.fn_reorganiza_aquisicaoitem_nuitem(' + IntToStr(Codigo) + ')';
          dmPrincipal.executaConsulta(vQuery);
        finally
          FreeAndNil(vQuery);
        end;
      except
        on E: exception do
         raise;
      end;

      // Cadastra as parcelas, caso seja selecionado como Parcelado, mas não
      // tenha sido cadastrado na inclusão.
      if (pAquisicao.Parcelado = 'S') and (pAquisicao.obtemNumeroParcelas = 0) then
      begin
        // Regras:
        //  1) Se a divisão for um valor com mais de 2 casas decimais, a primeira
        //     parcela receberá o restante do valor, as outras parcelas receberão
        //     o valor arredondado em 2 casas decimais (as dos centavos).
        vnuParcelas := Trunc(SpinEditNumeroParcelas.Value);

        // Se tem uma entrada, gera a primeira parcela como tipo Entrada e
        // recalcula o valor total.
        k := 0;
        if EditCadastroVLENTRADAPARCELA.Value > 0 then
        begin
          vvlTotal := vvlTotal - EditCadastroVLENTRADAPARCELA.Value;
          k := 1;
          fmPrincipal.pLogSistema.Trace('>> Cadastro de Aquisição - Insere Parcela da Aquisição - Entrada.');
          pAquisicao.Parcela := 1;
          pAquisicao.TipoParcela := 'E';
          pAquisicao.DataVencimento := DatePickerEditCadastroDTAQUISICAO.Date;
          pAquisicao.ValorParcela := EditCadastroVLENTRADAPARCELA.Value;
          pAquisicao.ValorDesconto := 0;
          pAquisicao.ValorJuros := 0;
          pAquisicao.FormaPagamento := 0;
          if pAquisicao.insereParcela = 0 then
            raise Exception.Create('Não foi possível atualizar o cadastro.');
        end;

        // Calcula o valor das Parcelas.
        fmPrincipal.pLogSistema.Trace('>> Cadastro de Aquisição - Calcula valor das Parcelas da Aquisição.');
        vvlParcela := pAquisicao.obtemValorParcela(vvlTotal,EditCadastroVLTAXAJUROS.Value,vnuParcelas);
        // Cálculo para ver se há um desdobramento, se houve, joga na primeira prestação.
        x := RoundTo(vvlParcela, -2);
        y := (vvlParcela - x) * vnuParcelas;
        y := RoundTo(y, -2);
        if vvlParcela > x then
          vvlParcela1 := x + y + EditCadastroVLTAXAEXTRA.Value
        else
          vvlParcela1 := x + EditCadastroVLTAXAEXTRA.Value;
        vvlParcela := x + EditCadastroVLTAXAEXTRA.Value;

        fmPrincipal.pLogSistema.Trace('>> Cadastro de Aquisição - Insere Parcelas da Aquisição.');
        for j := 1 to vnuParcelas do
        begin
          //vvlParcela := calculaParcela(j,vnuParcelas,vvlTotal);
          if j = 1 then
            z := vvlParcela1
          else
            z := vvlParcela;

          pAquisicao.Parcela := j + k;
          pAquisicao.TipoParcela := 'P';
          pAquisicao.DataVencimento := IncMonth(DatePickerEditCadastroDTAQUISICAO.Date, j);
          pAquisicao.ValorParcela := z;
          pAquisicao.ValorDesconto := 0;
          pAquisicao.ValorJuros := 0;
          pAquisicao.FormaPagamento := 0;
          if pAquisicao.insereParcela = 0 then
            raise Exception.Create('Não foi possível atualizar o cadastro.');
        end;
      end;
    end;

    // Atualiza a tabela de Usuário Receita.
    //fmPrincipal.atualizaUsuarioSaldo;

    fmPrincipal.apresentaResultadoCadastro('Cadastro atualizado com sucesso.');

    // Envia e-mail pro usuário.
    if fmPrincipal.SempreEnviaEmailCadastroAquisicao = true then
    begin
      fmPrincipal.pLogSistema.Trace('>> Cadastro de Aquisição - Envia e-mail.');
      enviaEMail;
    end;
  except
    on E: exception do
      raise;
  end;
end;

procedure TfmCadAquisicao.BitBtnRestaurarClick(Sender: TObject);
var
  vAtivarControle: boolean;
begin
  if Opcao = 'I' then
    BitBtnNovoClick(Sender)
  else
  begin
    vAtivarControle := pAtivarControle;
    pAtivarControle := false;
    editaCadastro;
    habilitaBotoes;
    pAtivarControle := vAtivarControle;
  end;
end;

procedure TfmCadAquisicao.BitBtnInserirDocumentoClick(Sender: TObject);
begin
  try
    fmPrincipal.pLogSistema.Trace('>> Cadastro de Aquisição - Carregando a tela de Documentos.');
    fmCadDocumento := TfmCadDocumento.Create(Self);
    fmCadDocumento.Caption := Caption + ' :: ' + fmCadDocumento.Caption;
    with fmCadDocumento do
    begin
      fmCadDocumento.Codigo := fmCadAquisicao.Codigo;
      fmCadDocumento.Tipo := 'A';
      NomeDiretorio := EditCadastroCDTIPOMOVIMENTO.Text + '.' + EditCadastroNUANOAQUISICAO.Text + EditCadastroNUAQUISICAO.Text;
      preencheGrid;
      if pStatusAquisicao = 'C' then
        SomenteLeitura := true;
      ShowModal;
    end;
    fmPrincipal.pLogSistema.Trace('>> Cadastro de Aquisição - Tela de Documentos carregada com sucesso.');
  except
    on E: Exception do
      fmPrincipal.manipulaExcecoes(Sender,E);
  end;
end;

procedure TfmCadAquisicao.atualizaSomatorioGrid;
begin
  try
    // Atualiza os totais.
    with ColumnGridItens do
    begin
      if ColumnByName['NUITEM'].Rows[1] <> EmptyStr then
        LabelTotalizadorItens.Caption := 'Total de itens: ' + IntToStr(RowCount -1)
      else
        LabelTotalizadorItens.Caption := 'Total de itens: 0';
      LabelTotalizadorQuantidade.Caption := 'Quantidade total: ' + FormatFloat('0',ColumnSum(6,1,RowCount -1));
      LabelTotalizadorValor.Caption := 'Valor total: ' + FormatFloat('"R$ ",0.00',ColumnSum(9,1,RowCount -1));
    end;
  except
    raise;
  end;
end;

procedure TfmCadAquisicao.BitBtnCancelarAquisicaoClick(Sender: TObject);
var
  vRetorno: integer;
begin
  if Codigo = 0 then
    Exit;

  // Verifica pendências antes de encerrar.
  pAquisicao.Parcela := 0;
  if pAquisicao.existeEntregaPendente > 0 then
  begin
    MessageBox(fmPrincipal.Handle,
               PWideChar('Esta aquisição está marcada como possuindo uma entrega pendente.'+#13+#10+''+#13+#10+
                         'Para cancelar esta aquisição siga os passos a seguir:'+#13+#10+
                         '1) Desmarque a opção Aguardando entrega;'+#13+#10+
                         '2) Salve o registro;'+#13+#10+
                         '3) Acione a opção Cancelar aquisição.'),
               cTituloMensagemInformacao,
               MB_OK or MB_ICONINFORMATION);
    Exit;
  end;

  // Valida se é possível realizar a exclusão.
  if not validaExclusao then
    Exit;

  desabilitaBotoes;
  try
    // Existindo Parcelamento, realiza a exclusão das parcelas.
    if pAquisicao.existeParcelamento > 0 then
      pAquisicao.excluiParcela;

    fmPrincipal.pLogSistema.Trace('>> Cadastro de Aquisição - Cancela a Aquisição.');
    vRetorno := pAquisicao.cancela;

    // Se não foi chamado pelo formPrincipal, a Tag será setada para 1 ou 2,
    //para que a tela seja fechada automaticamente. Este é padrão das telas
    //que são abertas via cadastro e não via form principal.
    if Tag in [1..2] then
    begin
      BitBtnFecharClick(Sender);
      Exit;
    end;

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

procedure TfmCadAquisicao.BitBtnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfmCadAquisicao.insereCadastro;
var
  i, j, k, vqtMaterial, vnuParcelas, vcdMarca, vcdModelo: integer;
  vvlUnitario, vvlGarantia, vvlTotal, vvlParcela, x, y, z, vvlParcela1: currency;
begin
  try
    fmPrincipal.pLogSistema.Info('>> Cadastro de Aquisição - Insere o cadastro da Aquisição.');
    pAquisicao.Movimento := StrToInt(EditCadastroCDTIPOMOVIMENTO.Text);
    pAquisicao.Ano := StrToInt(EditCadastroNUANOAQUISICAO.Text);
    pAquisicao.CodigoItem := 0;
    pAquisicao.Parcela := 0;
    pAquisicao.Nome := EditCadastroDEAQUISICAO.Text;
    if MemoCadastroDEOBSERVACOES.Lines.Count > 0 then
      pAquisicao.Observacoes.Assign(MemoCadastroDEOBSERVACOES.Lines)
    else
      pAquisicao.Observacoes.Clear;
    pAquisicao.Data := DatePickerEditCadastroDTAQUISICAO.Date;
    pAquisicao.MotivoUrgencia := StrToIntDef(EditCadastroCDMOTIVOURGENCIA.Text,0);
    pAquisicao.DataPrevisaoEntrega := DatePickerEditCadastroDTPREVISAOENTREGA.Date;
    pAquisicao.DataEntrega := DatePickerEditCadastroDTENTREGA.Date;
    pAquisicao.CodigoRastreamento := EditCadastroCDRASTREAMENTO.Text;
    pAquisicao.Fornecedor := StrToIntDef(EditCadastroCDFORNECEDOR.Text,0);
    pAquisicao.FormaPagamento := StrToIntDef(EditCadastroCDFORMAPAGAMENTO.Text,0);
    pAquisicao.NotaFiscal := StrToIntDef(EditCadastroNUNOTAFISCAL.Text,0);
    pAquisicao.TaxaJuros := EditCadastroVLTAXAJUROS.Value;
    pAquisicao.TaxaExtra := EditCadastroVLTAXAEXTRA.Value;
    pAquisicao.ValorTotal := 0;
    if CheckBoxCadastroFLURGENTE.Checked = true then
      pAquisicao.Urgente := 'S'
    else
      pAquisicao.Urgente := 'N';
    if CheckBoxCadastroFLENTREGAPENDENTE.Checked = true then
      pAquisicao.EntregaPendente := 'S'
    else
      pAquisicao.EntregaPendente := 'N';
    if CheckBoxCadastroFLPARCELADO.Checked = true then
      pAquisicao.Parcelado := 'S'
    else
      pAquisicao.Parcelado := 'N';
    // Se for Administrador pode cadastrar para qualquer usuário, senão somente pode cadastrar para o seu próprio usuário.
    if fmPrincipal.Administrador = true then
      pAquisicao.Usuario := StrToInt(EditCadastroCDUSUARIO.Text)
    else
      pAquisicao.Usuario := fmPrincipal.CodigoUsuarioLogado;

    // Insere a Aquisição.
    Codigo := pAquisicao.insere;

    if Codigo = 0 then
      raise Exception.Create('Não foi possível incluir o cadastro.');

    pAquisicao.Codigo := Codigo;

    // Se a aquisição foi incluída com sucesso, inclui os itens.
    fmPrincipal.pLogSistema.Trace('>> Cadastro de Aquisição - Insere Itens da Aquisição.');
    vvlTotal := 0;
    for i := 1 to ColumnGridItens.RowCount -1 do
      if (ColumnGridItens.ColumnByName['EXCLUIDO'].Rows[i] = '0') and
         (ColumnGridItens.ColumnByName['NUITEM'].Rows[i] <> EmptyStr) then
      begin
        vqtMaterial := ColumnGridItens.ColumnByName['QTEQUIVALENCIA'].Ints[i] * ColumnGridItens.ColumnByName['QTMATERIAL'].Ints[i];
        vvlUnitario := ColumnGridItens.ColumnByName['VLUNITARIO'].Floats[i];
        vvlGarantia := ColumnGridItens.ColumnByName['VLGARANTIA'].Floats[i];
        obtemMarcaModelo(ColumnGridItens.ColumnByName['CDMARCAMODELO'].Rows[i],vcdMarca,vcdModelo);
        pAquisicao.Material := ColumnGridItens.ColumnByName['CDMATERIAL'].Ints[i];
        pAquisicao.Embalagem := ColumnGridItens.ColumnByName['CDEMBALAGEM'].Ints[i];
        pAquisicao.Marca := vcdMarca;
        pAquisicao.Modelo := vcdModelo;
        pAquisicao.Quantidade := vqtMaterial;
        pAquisicao.ValorUnitario := vvlUnitario;
        if ColumnGridItens.ColumnByName['DTGARANTIA'].Rows[i] <> EmptyStr then
          pAquisicao.DataGarantia := ColumnGridItens.ColumnByName['DTGARANTIA'].Dates[i]
        else
          pAquisicao.DataGarantia := -1;
        pAquisicao.ValorGarantia := vvlGarantia;
        pAquisicao.Observacoes.Clear;
        pAquisicao.GarantiaAtiva := ColumnGridItens.ColumnByName['FLGARANTIAATIVA'].Rows[i];
        if pAquisicao.insereItem = 0 then
        begin
          pAquisicao.exclui;
          Codigo := 0;
          raise Exception.Create('Não foi possível incluir o cadastro.');
        end;
        vvlTotal := vvlTotal + (vqtMaterial * vvlUnitario) + (vqtMaterial * vvlGarantia);
      end;

    // Cadastra as parcelas, caso seja selecionado como Parcelado.
    if pAquisicao.Parcelado = 'S' then
    begin
      // Regras:
      //  1) Se a divisão for um valor com mais de 2 casas decimais, a primeira
      //     parcela receberá o restante do valor, as outras parcelas receberão
      //     o valor arredondado em 2 casas decimais (as dos centavos).
      vnuParcelas := Trunc(SpinEditNumeroParcelas.Value);

      // Se tem uma entrada, gera a primeira parcela como tipo Entrada e
      // recalcula o valor total.
      k := 0;
      if EditCadastroVLENTRADAPARCELA.Value > 0 then
      begin
        vvlTotal := vvlTotal - EditCadastroVLENTRADAPARCELA.Value;
        k := 1;
        fmPrincipal.pLogSistema.Trace('>> Cadastro de Aquisição - Insere Parcela da Aquisição - Entrada.');
        pAquisicao.Parcela := 1;
        pAquisicao.TipoParcela := 'E';
        pAquisicao.DataVencimento := DatePickerEditCadastroDTAQUISICAO.Date;
        pAquisicao.ValorParcela := EditCadastroVLENTRADAPARCELA.Value;
        pAquisicao.ValorDesconto := 0;
        pAquisicao.ValorJuros := 0;
        pAquisicao.FormaPagamento := 0;
        if pAquisicao.insereParcela = 0 then
          raise Exception.Create('Não foi possível realizar o cadastro.');
      end;

      // Calcula o valor das Parcelas.
      fmPrincipal.pLogSistema.Trace('>> Cadastro de Aquisição - Obtém valor das Parcelas da Aquisição.');
      vvlParcela := pAquisicao.obtemValorParcela(vvlTotal,EditCadastroVLTAXAJUROS.Value,vnuParcelas);

      // Cálculo para ver se há um desdobramento, se houve, joga na primeira prestação.
      x := RoundTo(vvlParcela, -2);
      y := (vvlParcela - x) * vnuParcelas;
      y := RoundTo(y, -2);
      if vvlParcela > x then
        vvlParcela1 := x + y + EditCadastroVLTAXAEXTRA.Value
      else
        vvlParcela1 := x + EditCadastroVLTAXAEXTRA.Value;
      vvlParcela := x + EditCadastroVLTAXAEXTRA.Value;

      fmPrincipal.pLogSistema.Trace('>> Cadastro de Aquisição - Insere Parcelas da Aquisição.');
      for j := 1 to vnuParcelas do
      begin
        //vvlParcela := calculaParcela(j,vnuParcelas,vvlTotal);
        if j = 1 then
          z := vvlParcela1
        else
          z := vvlParcela;

        pAquisicao.Parcela := j + k;
        pAquisicao.TipoParcela := 'P';
        pAquisicao.DataVencimento := IncMonth(DatePickerEditCadastroDTAQUISICAO.Date, j);
        pAquisicao.ValorParcela := z;
        pAquisicao.ValorDesconto := 0;
        pAquisicao.ValorJuros := 0;
        pAquisicao.FormaPagamento := 0;
        if pAquisicao.insereParcela = 0 then
          raise Exception.Create('Não foi possível salvar a parcela da aquisição. O cadastro será cancelado!');
      end;
    end;

    // Atualiza a tabela de Usuário Saldo.
    //fmPrincipal.atualizaUsuarioSaldo;

    EditCadastroNUAQUISICAO.Text := IntToStr(Codigo);
    fmPrincipal.apresentaResultadoCadastro('Cadastro incluído com sucesso.');

    // Envia e-mail pro usuário.
    if fmPrincipal.SempreEnviaEmailCadastroAquisicao = true then
      enviaEMail;
  except
    on E: exception do
    begin
      pAquisicao.Codigo := Codigo;
      pAquisicao.exclui;
      Codigo := 0;
      raise;
    end;
  end;
end;

procedure TfmCadAquisicao.limpaCamposAquisicao;
var
  vcdTipoMovimentoPadrao: string;
  vTipoMovimento: TTipoMovimento;
begin
  plUsuario.Clear;
  EditCadastroCDUSUARIO.Clear;
  EditCadastroNMLOGIN.Clear;
  EditCadastroNMUSUARIO.Clear;

  plTipoMovimento.Clear;
  EditCadastroCDTIPOMOVIMENTO.Clear;
  EditCadastroDETIPOMOVIMENTO.Clear;

  // Se houver o cadastro do Tipo de Movimento, obtém qual está cadastrada como padrão.
  if Opcao = 'I' then
    try
      vTipoMovimento := TTipoMovimento.Create;
      vcdTipoMovimentoPadrao := IntToStr(vTipoMovimento.obtemPadrao('A'));
      if vcdTipoMovimentoPadrao <> '0' then
      begin
        EditCadastroCDTIPOMOVIMENTO.Text := vcdTipoMovimentoPadrao;
        EditCadastroCDTIPOMOVIMENTOExit(EditCadastroCDTIPOMOVIMENTO);
      end;
    finally
      FreeAndNil(vTipoMovimento);
    end;

  EditCadastroNUAQUISICAO.Clear;
  EditCadastroNUANOAQUISICAO.Clear;
  DatePickerEditCadastroDTCADASTRO.Clear;
  DatePickerEditCadastroDTAQUISICAO.Clear;

  EditCadastroDEAQUISICAO.Clear;
  MemoCadastroDEOBSERVACOES.Clear;

  CheckBoxCadastroFLPARCELADO.Checked := false;
  //CheckBoxCadastroFLPARCELADOClick(CheckBoxCadastroFLPARCELADO);
  EditCadastroNUNOTAFISCAL.Clear;

  plFornecedor.Clear;
  EditCadastroCDFORNECEDOR.Clear;
  EditCadastroNUCNPJ.Clear;
  EditCadastroNMFORNECEDOR.Clear;

  plFormaPagamento.Clear;
  EditCadastroCDFORMAPAGAMENTO.Clear;
  EditCadastroNMFORMAPAGAMENTO.Clear;

  plMotivoUrgencia.Clear;
  CheckBoxCadastroFLURGENTE.Checked := false;
  CheckBoxCadastroFLURGENTEClick(CheckBoxCadastroFLURGENTE);
  EditCadastroCDMOTIVOURGENCIA.Clear;
  EditCadastroDEMOTIVOURGENCIA.Clear;

  CheckBoxCadastroFLENTREGAPENDENTE.Checked := false;
  DatePickerEditCadastroDTPREVISAOENTREGA.Clear;
  EditCadastroCDRASTREAMENTO.Clear;
  DatePickerEditCadastroDTENTREGA.Clear;

  if vcdTipoMovimentoPadrao = '0' then
    ButtonLimparTipoMovimento.Enabled := false;
  ButtonLimparFornecedor.Enabled := false;
  ButtonLimparFormaPagamento.Enabled := false;
  BitBtnParcelas.Enabled := false;
  ButtonLimparMotivoUrgencia.Enabled := false;
  ButtonNovoFornecedor.Enabled := true;
  ButtonNovoFormaPagamento.Enabled := true;
  ButtonNovoMotivoUrgencia.Enabled := false;
end;

procedure TfmCadAquisicao.limpaGrid;
begin
  with ColumnGridItens do
  begin
    ClearNormalRows(1,RowCount-1);
    RowCount := 2;
    ColumnByName['EXCLUIDO'].Ints[RowCount -1] := 0;
    ColumnByName['VLUNITARIO'].FloatFormat := '%.2f';
    ColumnByName['VLUNITARIO'].SortPrefix := 'R$';
    ColumnByName['VLTOTAL'].FloatFormat := '%.2f';
    ColumnByName['VLTOTAL'].SortPrefix := 'R$';
    HideColumns(13,20);
    AutoSizeColumns(true);
  end;

  LabelTotalizadorItens.Caption := 'Total de itens: 0';
  LabelTotalizadorQuantidade.Caption := 'Qtde. total: 0';
  LabelTotalizadorValor.Caption := 'Valor total: R$ 0,00';
end;

procedure TfmCadAquisicao.BitBtnNovoClick(Sender: TObject);
var
  vAtivarControle: boolean;
begin
  vAtivarControle := pAtivarControle;
  pAtivarControle := false;
  Opcao := 'I';
  Codigo := 0;
  novoCadastro;
  desabilitaBotoes;
  // Estes botões devem se manter ativos.
  BitBtnSalvar.Enabled := true;
  BitBtnRestaurar.Enabled := true;
  pAtivarControle := vAtivarControle;
end;

procedure TfmCadAquisicao.BitBtnSalvarClick(Sender: TObject);
var
  i: integer;
  vMensagem: string;
  vOk: boolean;
begin
  desabilitaBotoes;

  // Validações.
  vMensagem := EmptyStr;
  if EditCadastroCDTIPOMOVIMENTO.Text = EmptyStr then
    vMensagem := vMensagem + #13#10'- O campo Tipo de Movimento é requerido.';
  if EditCadastroCDUSUARIO.Text = EmptyStr then
    vMensagem := vMensagem + #13#10'- O campo Usuário é requerido.';
  if EditCadastroDEAQUISICAO.Text = EmptyStr then
    vMensagem := vMensagem + #13#10'- O campo Descrição é requerido.';
  if CheckBoxCadastroFLURGENTE.Checked then
    if AnsiCompareText(EditCadastroDEMOTIVOURGENCIA.Text,EmptyStr) = 0 then
      vMensagem := vMensagem + #13#10'- O campo Motivo é requerido.';
  if CheckBoxCadastroFLENTREGAPENDENTE.Checked then
    if DatePickerEditCadastroDTPREVISAOENTREGA.IsDateValid = false then
      vMensagem := vMensagem + #13#10'- O campo Previsão de Entrega é requerido ou está inválido.';

  // Valida se existe pelo menos 1 item.
  vOk := false;
  with ColumnGridItens do
    for i := 1 to RowCount -1 do
      if ColumnByName['NUITEM'].Rows[i] <> EmptyStr then
        if ColumnByName['EXCLUIDO'].Ints[i] = 0 then
        begin
          vOk := true;
          break;
        end;

  if not vOk then
    vMensagem := vMensagem + #13#10'- É preciso informar pelo menos 1 material para a aquisição.';

  if vMensagem <> EmptyStr then
  begin
    BitBtnSalvar.Enabled := true;
    BitBtnCancelarAquisicao.Enabled := (Opcao = 'A');
    BitBtnRestaurar.Enabled := true;
    vMensagem := 'O cadastro não poderá ser executado devido as seguintes pendências:' + vMensagem;
    MessageBox(fmPrincipal.Handle, PWideChar(vMensagem), cTituloMensagemAlerta, MB_OK or MB_ICONWARNING);
    Exit;
  end;
  // Fim Validações.

  try
    if Opcao = 'I' then
      insereCadastro
    else
      if Opcao = 'A' then
        atualizaCadastro;

    // Se o cadastro não ocorreu com sucesso não edita o cadastro, mantém em inserção.
    if Codigo = 0 then
      Exit;

    // Atualiza a Grid.
    MenuItemAtualizarTabelaClick(Sender);

    // Edita o cadastro realizado.
    pAtivarControle := false;
    editaCadastro;
    habilitaBotoes;
    Opcao := 'A';
    pAtivarControle := true;
  except
    on E: Exception do
      fmPrincipal.manipulaExcecoes(Sender,E);
  end;
end;

function TfmCadAquisicao.buscaId: cardinal;
begin
  Result := pId.D1;
end;

// Desativado em 25/07/2014 - Jorge Valladão
{function TfmCadAquisicao.calculaParcela(prmNumeroParcela,
  prmTotalParcelas: integer; prmValorTotal: currency): currency;
var
  vnuParcelas: integer;
  vvlTotal, vvlParcela, vvlArredondado, vvlAdicionar: currency;
begin
  try
    vnuParcelas := prmTotalParcelas;
    vvlTotal := prmValorTotal;
    vvlParcela := vvlTotal / vnuParcelas;
    vvlArredondado := fmPrincipal.Arredonda(vvlParcela, -2);
    vvlAdicionar := (vvlParcela - vvlArredondado) * vnuParcelas;
    vvlAdicionar := fmPrincipal.Arredonda(vvlAdicionar, -2);
    // Só faz para a primeira parcela.
    if prmNumeroParcela = 1 then
    begin
      if vvlParcela > vvlArredondado then
        vvlParcela := vvlArredondado + vvlAdicionar;
    end
    else
      vvlParcela := vvlArredondado;
    Result := vvlParcela;
  except
    raise;
  end;
end;}

procedure TfmCadAquisicao.CheckBoxCadastroFLENTREGAPENDENTEClick(
  Sender: TObject);
begin
  EditCadastroCDRASTREAMENTO.Enabled := CheckBoxCadastroFLENTREGAPENDENTE.Checked;
  DatePickerEditCadastroDTENTREGA.Enabled := CheckBoxCadastroFLENTREGAPENDENTE.Checked;
  DatePickerEditCadastroDTPREVISAOENTREGA.Enabled := CheckBoxCadastroFLENTREGAPENDENTE.Checked;
end;

procedure TfmCadAquisicao.CheckBoxCadastroFLPARCELADOClick(Sender: TObject);
begin
  pAquisicao.Codigo := Codigo;

  // Enquanto não salvar o registro com informações de parcelas, não habilita.
  if (Opcao = 'A') and (pAquisicao.obtemNumeroParcelas > 0) then
    BitBtnParcelas.Enabled := CheckBoxCadastroFLPARCELADO.Checked;

  if (CharInSet(Opcao,['I','A'])) and (pAquisicao.obtemNumeroParcelas = 0) then
    SpinEditNumeroParcelas.Enabled := CheckBoxCadastroFLPARCELADO.Checked
  else
    SpinEditNumeroParcelas.Enabled := false;
  EditCadastroVLENTRADAPARCELA.Enabled := CheckBoxCadastroFLPARCELADO.Checked;
  EditCadastroVLENTRADAPARCELA.Enabled := (not (SpinEditNumeroParcelas.Value < 2));
  EditCadastroVLTAXAJUROS.Enabled := CheckBoxCadastroFLPARCELADO.Checked;
  EditCadastroVLTAXAEXTRA.Enabled := CheckBoxCadastroFLPARCELADO.Checked;
end;

procedure TfmCadAquisicao.CheckBoxCadastroFLURGENTEClick(Sender: TObject);
begin
  if not CheckBoxCadastroFLURGENTE.Checked then
  begin
    EditCadastroCDMOTIVOURGENCIA.Clear;
    EditCadastroDEMOTIVOURGENCIA.Clear;
    ButtonLimparMotivoUrgencia.Enabled := false;
  end;
  EditCadastroCDMOTIVOURGENCIA.Enabled := CheckBoxCadastroFLURGENTE.Checked;
  EditCadastroDEMOTIVOURGENCIA.Enabled := CheckBoxCadastroFLURGENTE.Checked;
  ButtonNovoMotivoUrgencia.Enabled := (CheckBoxCadastroFLURGENTE.Checked);
end;

procedure TfmCadAquisicao.ColumnGridItensClickCell(Sender: TObject; ARow,
  ACol: Integer);
var
  vvlTotal: currency;
begin
  // Realiza validações
  if ARow = 0 then
    Exit;
  if ColumnGridItens.ColumnByName['NUITEM'].Rows[ARow] = EmptyStr then
    Exit;

  if ACol = 11 then
  begin
    fmPrincipal.pLogSistema.Info('>> Carregando a tela de Item da Aquisição.');
    fmAquisicaoItem := TfmAquisicaoItem.Create(Self);
    with fmAquisicaoItem do
    begin
      StatusAquisicao := pStatusAquisicao;
      AtivarControle := false;
      StatusAquisicaoItem := 'E';

      // Passa os dados para tela.
      with ColumnGridItens do
      begin
        BeginUpdate;
        nuItem := ColumnByName['NUITEM'].Ints[Row];
        cdFamilia := ColumnByName['CDFAMILIA'].Rows[Row];
        cdMaterial := ColumnByName['CDMATERIALF'].Rows[Row];
        deMaterial := ColumnByName['DEMATERIAL'].Rows[Row];
        cdMarcaModelo := ColumnByName['CDMARCAMODELO'].Rows[Row];
        nmMarcaModelo := ColumnByName['NMMARCAMODELO'].Rows[Row];
        cdEmbalagem := ColumnByName['CDEMBALAGEM'].Ints[Row];
        nmEmbalagem := ColumnByName['NMEMBALAGEM'].Rows[Row];
        qtEquivalencia := ColumnByName['QTEQUIVALENCIA'].Ints[Row];
        qtMaterial := ColumnByName['QTMATERIAL'].Ints[Row];
        vlUnitario := ColumnByName['VLUNITARIO'].Floats[Row];
        vlGarantia := ColumnByName['VLGARANTIA'].Floats[Row];
        if ColumnByName['DTGARANTIA'].Rows[Row] <> EmptyStr then
          dtGarantia := ColumnByName['DTGARANTIA'].Dates[Row]
        else
          dtGarantia := -1;
        flGarantiaAtiva := ColumnByName['FLGARANTIAATIVA'].Rows[Row];
        Enabled := false;
        EndUpdate;
      end;

      preencheCampos;
      ShowModal;

      // Valida se acionou o botão Aplicar.
      if StatusAquisicaoItem = 'A' then
      begin
        with ColumnGridItens do
        begin
          BeginUpdate;
          ColumnByName['NUITEM'].Ints[Row] := nuItem;
          ColumnByName['CDFAMILIA'].Rows[Row] := cdFamilia;
          ColumnByName['CDMATERIAL'].Rows[Row] := AnsiRightStr(cdMaterial,3);
          ColumnByName['CDMATERIALF'].Rows[Row] := cdMaterial;
          ColumnByName['DEMATERIAL'].Rows[Row] := deMaterial;
          ColumnByName['CDMARCAMODELO'].Rows[Row] := cdMarcaModelo;
          ColumnByName['NMMARCAMODELO'].Rows[Row] := nmMarcaModelo;
          ColumnByName['CDEMBALAGEM'].Ints[Row] := cdEmbalagem;
          ColumnByName['NMEMBALAGEM'].Rows[Row] := nmEmbalagem;
          ColumnByName['QTEQUIVALENCIA'].Ints[Row] := qtEquivalencia;
          ColumnByName['QTMATERIAL'].Ints[Row] := qtMaterial;
          ColumnByName['VLUNITARIO'].Floats[Row] := vlUnitario;
          ColumnByName['VLGARANTIA'].Floats[Row] := vlGarantia;
          vvlTotal := (qtMaterial * vlUnitario) + (qtMaterial * vlGarantia);
          ColumnByName['VLTOTAL'].Floats[Row] := vvlTotal;
          if dtGarantia > -1 then
            ColumnByName['DTGARANTIA'].Dates[Row] := dtGarantia
          else
            ColumnByName['DTGARANTIA'].Rows[Row] := EmptyStr;
          ColumnByName['FLGARANTIAATIVA'].Rows[Row] := flGarantiaAtiva;
          ColumnByName['EXCLUIDO'].Ints[Row] := 0;
          if pStatusAquisicao <> 'C' then
          begin
            AddImageIdx(11,Row,0,haCenter,vaCenter);
            AddImageIdx(12,Row,1,haCenter,vaCenter);
          end;
          EndUpdate;
        end;

        // Atualiza o somatório.
        atualizaSomatorioGrid;
      end;

      ColumnGridItens.Enabled := true;
    end;
    fmPrincipal.pLogSistema.Info('>> Tela de Item da Aquisição carregada com sucesso.');
  end;

  if ACol = 12 then
    with ColumnGridItens do
      if Enabled then
        if ColumnByName['EXCLUIDO'].Ints[ARow] = 0 then
          ColumnByName['EXCLUIDO'].Ints[ARow] := 1
        else
          ColumnByName['EXCLUIDO'].Ints[ARow] := 0;
end;

procedure TfmCadAquisicao.ColumnGridItensGetCellColor(Sender: TObject; ARow,
  ACol: Integer; AState: TGridDrawState; ABrush: TBrush; AFont: TFont);
begin
  // Realiza validações
  if ARow = 0 then
    Exit;

  if ColumnGridItens.ColumnByName['EXCLUIDO'].Ints[ARow] = 1 then
  begin
    ABrush.Color:= clred;
    AFont.Style := [fsBold];
    AFont.Color:= clWhite;
  end;
end;

procedure TfmCadAquisicao.ColumnGridItensGetFormat(Sender: TObject;
  ACol: Integer; var AStyle: TSortStyle; var aPrefix, aSuffix: string);
begin
  if ACol in [7,8,9] then
  begin
    AStyle := ssFinancial;
    APrefix := '$ ';
  end;
end;

procedure TfmCadAquisicao.EditCadastroNMFORMAPAGAMENTOClickBtn(
  Sender: TObject);
var
  i: integer;
begin
  // Para que o evento não seja executado.
  EditCadastroCDFORMAPAGAMENTO.OnChange := nil;
  EditCadastroCDFORMAPAGAMENTO.OnExit := nil;
  EditCadastroNMFORMAPAGAMENTO.OnExit := nil;
  EditCadastroNMFORMAPAGAMENTO.OnClickBtn := nil;

  fmConFiltroPadrao := TfmConFiltroPadrao.Create(Self);
  try
    with fmConFiltroPadrao do
    begin
      try
        setaTitulo('Consulta de Formas de Pagamento');
        setaConsulta(pFormaPagamento.filtro);
        setaOpcao('R');
        executaFiltro(0,EmptyStr);
        ShowModal;
      finally
        plFormaPagamento.Clear;
        with pResSearch do
          for i := 0 to Count -1 do
            if objResSearch[i].Id = buscaId then
            begin
              plFormaPagamento.Add(objResSearch[i].Codigo);
              EditCadastroCDFORMAPAGAMENTO.Text := objResSearch[i].Codigo;
              EditCadastroNMFORMAPAGAMENTO.Text := objResSearch[i].Nome1;
            end;
      end;
    end;
  finally
    EditCadastroCDFORMAPAGAMENTO.Enabled := (plFormaPagamento.Count = 0);
    EditCadastroNMFORMAPAGAMENTO.Enabled := (plFormaPagamento.Count = 0);
    ButtonLimparFormaPagamento.Enabled := (plFormaPagamento.Count > 0);
    ButtonNovoFormaPagamento.Enabled := (plFormaPagamento.Count = 0);

    // Valida para qual campo vai se posicionar.
    if pAtivarControle then
      if OfficePagerCentral.ActivePageIndex = 1 then
        if OfficePagerCadastroAquisicao.ActivePageIndex = 0 then
          if plFormaPagamento.Count > 0 then
          begin
            if CheckBoxCadastroFLPARCELADO.Enabled then
              ActiveControl := CheckBoxCadastroFLPARCELADO;
          end
          else
            if EditCadastroNMFORMAPAGAMENTO.Enabled then
              ActiveControl := EditCadastroNMFORMAPAGAMENTO;
  end;

  // Para que o evento volte a ser executado.
  EditCadastroCDFORMAPAGAMENTO.OnChange := EditCadastroCDFORMAPAGAMENTOChange;
  EditCadastroCDFORMAPAGAMENTO.OnExit := EditCadastroCDFORMAPAGAMENTOExit;
  EditCadastroNMFORMAPAGAMENTO.OnExit := EditCadastroNMFORMAPAGAMENTOExit;
  EditCadastroNMFORMAPAGAMENTO.OnClickBtn := EditCadastroNMFORMAPAGAMENTOClickBtn;
end;

procedure TfmCadAquisicao.EditCadastroNMFORMAPAGAMENTOExit(
  Sender: TObject);
var
  i: integer;
  vQuery: TZQuery;
begin
  if Length(Trim(EditCadastroNMFORMAPAGAMENTO.Text)) = 0 then
    Exit;

  // Para que o evento não seja executado.
  EditCadastroCDFORMAPAGAMENTO.OnChange := nil;
  EditCadastroCDFORMAPAGAMENTO.OnExit := nil;
  EditCadastroNMFORMAPAGAMENTO.OnExit := nil;
  EditCadastroNMFORMAPAGAMENTO.OnClickBtn := nil;

  try
    vQuery := pFormaPagamento.filtro;
    with vQuery do
    begin
      SQL.Add('WHERE UPPER("NM-Forma Pagamento") LIKE :NMFORMAPAGAMENTO');
      Params.ParamByName('NMFORMAPAGAMENTO').AsString := '%'+AnsiUpperCase(EditCadastroNMFORMAPAGAMENTO.Text)+'%';
      dmPrincipal.executaConsulta(vQuery);

      if RecordCount > 1 then
      begin
        fmConFiltroPadrao := TfmConFiltroPadrao.Create(Self);
        with fmConFiltroPadrao do
        begin
          try
            setaTitulo('Consulta de Formas de Pagamento');
            setaConsulta(pFormaPagamento.filtro);
            setaOpcao('R');
            executaFiltro(2,EditCadastroNMFORMAPAGAMENTO.Text);
            ShowModal;
          finally
            plFormaPagamento.Clear;
            with pResSearch do
              for i := 0 to Count -1 do
                if objResSearch[i].Id = buscaId then
                begin
                  plFormaPagamento.Add(objResSearch[i].Codigo);
                  EditCadastroCDFORMAPAGAMENTO.Text := objResSearch[i].Codigo;
                  EditCadastroNMFORMAPAGAMENTO.Text := objResSearch[i].Nome1;
                end;
          end;
        end;
      end
      else
        if not Eof then
        begin
          plFormaPagamento.Clear;
          plFormaPagamento.Add(Fields.Fields[0].AsString);
          EditCadastroCDFORMAPAGAMENTO.Text := Fields.Fields[0].AsString;
          EditCadastroNMFORMAPAGAMENTO.Text := Fields.Fields[1].AsString;
        end
        else
          fmPrincipal.apresentaResultadoCadastro('Nenhum registro encontrado.');
      Active := false;
    end;
  finally
    FreeAndNil(vQuery);

    EditCadastroCDFORMAPAGAMENTO.Enabled := (plFormaPagamento.Count = 0);
    EditCadastroNMFORMAPAGAMENTO.Enabled := (plFormaPagamento.Count = 0);
    ButtonLimparFormaPagamento.Enabled := (plFormaPagamento.Count > 0);
    ButtonNovoFormaPagamento.Enabled := (plFormaPagamento.Count = 0);

    // Valida para qual campo vai se posicionar.
    if pAtivarControle then
      if OfficePagerCentral.ActivePageIndex = 1 then
        if OfficePagerCadastroAquisicao.ActivePageIndex = 0 then
          if plFormaPagamento.Count > 0 then
          begin
            if CheckBoxCadastroFLPARCELADO.Enabled then
              ActiveControl := CheckBoxCadastroFLPARCELADO;
          end
          else
            if EditCadastroNMFORMAPAGAMENTO.Enabled then
              ActiveControl := EditCadastroNMFORMAPAGAMENTO;
  end;

  // Para que o evento volte a ser executado.
  EditCadastroCDFORMAPAGAMENTO.OnChange := EditCadastroCDFORMAPAGAMENTOChange;
  EditCadastroCDFORMAPAGAMENTO.OnExit := EditCadastroCDFORMAPAGAMENTOExit;
  EditCadastroNMFORMAPAGAMENTO.OnExit := EditCadastroNMFORMAPAGAMENTOExit;
  EditCadastroNMFORMAPAGAMENTO.OnClickBtn := EditCadastroNMFORMAPAGAMENTOClickBtn;
end;

procedure TfmCadAquisicao.EditCadastroNMFORNECEDORClickBtn(
  Sender: TObject);
var
  i: integer;
begin
  // Para que o evento não seja executado.
  EditCadastroCDFORNECEDOR.OnChange := nil;
  EditCadastroCDFORNECEDOR.OnExit := nil;
  EditCadastroNUCNPJ.OnExit := nil;
  EditCadastroNMFORNECEDOR.OnExit := nil;
  EditCadastroNMFORNECEDOR.OnClickBtn := nil;

  fmConFiltroPadrao := TfmConFiltroPadrao.Create(Self);
  try
    with fmConFiltroPadrao do
    begin
      try
        setaTitulo('Consulta de Fornecedores');
        setaConsulta(pFornecedor.filtro);
        setaOpcao('R');
        executaFiltro(0,EmptyStr);
        ShowModal;
      finally
        plFornecedor.Clear;
        with pResSearch do
          for i := 0 to Count -1 do
            if objResSearch[i].Id = buscaId then
            begin
              plFornecedor.Add(objResSearch[i].Codigo);
              EditCadastroCDFORNECEDOR.Text := objResSearch[i].Codigo;
              EditCadastroNUCNPJ.Text := objResSearch[i].Nome1;
              EditCadastroNMFORNECEDOR.Text := objResSearch[i].Nome2;
            end;
      end;
    end;
  finally
    EditCadastroCDFORNECEDOR.Enabled := (plFornecedor.Count = 0);
    EditCadastroNUCNPJ.Enabled := (plFornecedor.Count = 0);
    EditCadastroNMFORNECEDOR.Enabled := (plFornecedor.Count = 0);
    ButtonLimparFornecedor.Enabled := (plFornecedor.Count > 0);
    ButtonNovoFornecedor.Enabled := (plFornecedor.Count = 0);

    // Valida para qual campo vai se posicionar.
    if pAtivarControle then
      if OfficePagerCentral.ActivePageIndex = 1 then
        if OfficePagerCadastroAquisicao.ActivePageIndex = 0 then
          if plFornecedor.Count > 0 then
          begin
            if EditCadastroNUNOTAFISCAL.Enabled then
              ActiveControl := EditCadastroNUNOTAFISCAL;
          end
          else
            if EditCadastroNMFORNECEDOR.Enabled then
              ActiveControl := EditCadastroNMFORNECEDOR;
  end;

  // Para que o evento volte a ser executado.
  EditCadastroCDFORNECEDOR.OnChange := EditCadastroCDFORNECEDORChange;
  EditCadastroCDFORNECEDOR.OnExit := EditCadastroCDFORNECEDORExit;
  EditCadastroNUCNPJ.OnExit := EditCadastroNUCNPJExit;
  EditCadastroNMFORNECEDOR.OnExit := EditCadastroNMFORNECEDORExit;
  EditCadastroNMFORNECEDOR.OnClickBtn := EditCadastroNMFORNECEDORClickBtn;
end;

procedure TfmCadAquisicao.EditCadastroNMFORNECEDORExit(Sender: TObject);
var
  i: integer;
  vQuery: TZQuery;
begin
  if Length(Trim(EditCadastroNMFORNECEDOR.Text)) = 0 then
    Exit;

  // Para que o evento não seja executado.
  EditCadastroCDFORNECEDOR.OnChange := nil;
  EditCadastroCDFORNECEDOR.OnExit := nil;
  EditCadastroNUCNPJ.OnExit := nil;
  EditCadastroNMFORNECEDOR.OnExit := nil;
  EditCadastroNMFORNECEDOR.OnClickBtn := nil;

  try
    vQuery := pFornecedor.filtro;
    with vQuery do
    begin
      SQL.Add('WHERE UPPER("NM-Fornecedor") LIKE :NMFORNECEDOR');
      Params.Items[0].AsString := '%'+AnsiUpperCase(EditCadastroNMFORNECEDOR.Text)+'%';
      dmPrincipal.executaConsulta(vQuery);

      if RecordCount > 1 then
      begin
        fmConFiltroPadrao := TfmConFiltroPadrao.Create(Self);
        with fmConFiltroPadrao do
        begin
          try
            setaTitulo('Consulta de Fornecedores');
            setaConsulta(pFornecedor.filtro);
            setaOpcao('R');
            executaFiltro(3,EditCadastroNMFORNECEDOR.Text);
            ShowModal;
          finally
            plFornecedor.Clear;
            with pResSearch do
              for i := 0 to Count -1 do
                if objResSearch[i].Id = buscaId then
                begin
                  plFornecedor.Add(objResSearch[i].Codigo);
                  EditCadastroCDFORNECEDOR.Text := objResSearch[i].Codigo;
                  EditCadastroNUCNPJ.Text := objResSearch[i].Nome1;
                  EditCadastroNMFORNECEDOR.Text := objResSearch[i].Nome2;
                end;
          end;
        end;
      end
      else
        if not Eof then
        begin
          plFornecedor.Clear;
          plFornecedor.Add(Fields.Fields[0].AsString);
          EditCadastroCDFORNECEDOR.Text := Fields.Fields[0].AsString;
          EditCadastroNUCNPJ.Text := Fields.Fields[1].AsString;
          EditCadastroNMFORNECEDOR.Text := Fields.Fields[2].AsString;
        end
        else
          fmPrincipal.apresentaResultadoCadastro('Nenhum registro encontrado.');
      Active := false;
    end;
  finally
    FreeAndNil(vQuery);

    EditCadastroCDFORNECEDOR.Enabled := (plFornecedor.Count = 0);
    EditCadastroNUCNPJ.Enabled := (plFornecedor.Count = 0);
    EditCadastroNMFORNECEDOR.Enabled := (plFornecedor.Count = 0);
    ButtonLimparFornecedor.Enabled := (plFornecedor.Count > 0);
    ButtonNovoFornecedor.Enabled := (plFornecedor.Count = 0);

    // Valida para qual campo vai se posicionar.
    if pAtivarControle then
      if OfficePagerCentral.ActivePageIndex = 1 then
        if OfficePagerCadastroAquisicao.ActivePageIndex = 0 then
          if plFornecedor.Count > 0 then
          begin
            if EditCadastroNUNOTAFISCAL.Enabled then
              ActiveControl := EditCadastroNUNOTAFISCAL;
          end
          else
            if EditCadastroNMFORNECEDOR.Enabled then
              ActiveControl := EditCadastroNMFORNECEDOR;
  end;

  // Para que o evento volte a ser executado.
  EditCadastroCDFORNECEDOR.OnChange := EditCadastroCDFORNECEDORChange;
  EditCadastroCDFORNECEDOR.OnExit := EditCadastroCDFORNECEDORExit;
  EditCadastroNUCNPJ.OnExit := EditCadastroNUCNPJExit;
  EditCadastroNMFORNECEDOR.OnExit := EditCadastroNMFORNECEDORExit;
  EditCadastroNMFORNECEDOR.OnClickBtn := EditCadastroNMFORNECEDORClickBtn;
end;

procedure TfmCadAquisicao.EditCadastroNMUSUARIOClickBtn(Sender: TObject);
var
  i: integer;
begin
  // Para que o evento não seja executado.
  EditCadastroCDUSUARIO.OnChange := nil;
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
    // Se este painel estiver visível é porque a aquisição foi encerrada ou cancelada.
    if pStatusAquisicao = 'C' then
      ButtonLimparUsuario.Enabled := false;

    // Valida para qual campo vai se posicionar.
    if pAtivarControle then
      if OfficePagerCentral.ActivePageIndex = 1 then
        if OfficePagerCadastroAquisicao.ActivePageIndex = 0 then
          if plUsuario.Count > 0 then
          begin
            if EditCadastroDEAQUISICAO.Enabled then
              ActiveControl := EditCadastroDEAQUISICAO;
          end
          else
            if EditCadastroNMUSUARIO.Enabled then
              ActiveControl := EditCadastroNMUSUARIO;
  end;

  // Para que o evento volte a ser executado.
  EditCadastroCDUSUARIO.OnChange := EditCadastroCDUSUARIOChange;
  EditCadastroCDUSUARIO.OnExit := EditCadastroCDUSUARIOExit;
  EditCadastroNMLOGIN.OnExit := EditCadastroNMLOGINExit;
  EditCadastroNMUSUARIO.OnExit := EditCadastroNMUSUARIOExit;
  EditCadastroNMUSUARIO.OnClickBtn := EditCadastroNMUSUARIOClickBtn;
end;

procedure TfmCadAquisicao.EditCadastroNMUSUARIOExit(Sender: TObject);
var
  i: integer;
  vQuery: TZQuery;
begin
  if Length(Trim(EditCadastroNMUSUARIO.Text)) = 0 then
    Exit;

  // Para que o evento não seja executado.
  EditCadastroCDUSUARIO.OnChange := nil;
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
          fmPrincipal.apresentaResultadoCadastro('Nenhum registro encontrado.');
      Active := false;
    end;
  finally
    FreeAndNil(vQuery);
    EditCadastroCDUSUARIO.Enabled := (plUsuario.Count = 0);
    EditCadastroNMLOGIN.Enabled := (plUsuario.Count = 0);
    EditCadastroNMUSUARIO.Enabled := (plUsuario.Count = 0);
    if fmPrincipal.Administrador then
      ButtonLimparUsuario.Enabled := (plUsuario.Count > 0);
    // Se este painel estiver visível é porque a aquisição foi encerrada ou cancelada.
    if pStatusAquisicao = 'C' then
      ButtonLimparUsuario.Enabled := false;

    // Valida para qual campo vai se posicionar.
    if pAtivarControle then
      if OfficePagerCentral.ActivePageIndex = 1 then
        if OfficePagerCadastroAquisicao.ActivePageIndex = 0 then
          if plUsuario.Count > 0 then
          begin
            if EditCadastroDEAQUISICAO.Enabled then
              ActiveControl := EditCadastroDEAQUISICAO;
          end
          else
            if EditCadastroNMUSUARIO.Enabled then
              ActiveControl := EditCadastroNMUSUARIO;
  end;

  // Para que o evento volte a ser executado.
  EditCadastroCDUSUARIO.OnChange := EditCadastroCDUSUARIOChange;
  EditCadastroCDUSUARIO.OnExit := EditCadastroCDUSUARIOExit;
  EditCadastroNMLOGIN.OnExit := EditCadastroNMLOGINExit;
  EditCadastroNMUSUARIO.OnExit := EditCadastroNMUSUARIOExit;
  EditCadastroNMUSUARIO.OnClickBtn := EditCadastroNMUSUARIOClickBtn;
end;

procedure TfmCadAquisicao.EditCadastroDETIPOMOVIMENTOClickBtn(
  Sender: TObject);
var
  i: integer;
begin
  // Para que o evento não seja executado.
  EditCadastroCDTIPOMOVIMENTO.OnChange := nil;
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
        setaOpcao('R');
        setaFiltrosExtras('"DE-Natureza" = ''Aquisição''',
                          'Natureza: Aquisição');
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
    if pAtivarControle then
      if OfficePagerCentral.ActivePageIndex = 1 then
        if OfficePagerCadastroAquisicao.ActivePageIndex = 0 then
          if plTipoMovimento.Count > 0 then
          begin
            if EditCadastroNUANOAQUISICAO.Enabled then
              ActiveControl := EditCadastroNUANOAQUISICAO;
          end
          else
            if EditCadastroDETIPOMOVIMENTO.Enabled then
              ActiveControl := EditCadastroDETIPOMOVIMENTO;
  end;

  // Para que o evento volte a ser executado.
  EditCadastroCDTIPOMOVIMENTO.OnChange := EditCadastroCDTIPOMOVIMENTOChange;
  EditCadastroCDTIPOMOVIMENTO.OnExit := EditCadastroCDTIPOMOVIMENTOExit;
  EditCadastroDETIPOMOVIMENTO.OnExit := EditCadastroDETIPOMOVIMENTOExit;
  EditCadastroDETIPOMOVIMENTO.OnClickBtn := EditCadastroDETIPOMOVIMENTOClickBtn;

  // Verifica foi selecionado um tipo de movimento igual a presente recebido.
  if AnsiCompareText(Trim(EditCadastroDETIPOMOVIMENTO.Text), cTipoMovimentoPresente) = 0 then
  begin
    CheckBoxCadastroFLPARCELADO.Checked := false;
    CheckBoxCadastroFLPARCELADO.Enabled := false;
    EditCadastroCDFORMAPAGAMENTO.Enabled := false;
    EditCadastroNMFORMAPAGAMENTO.Enabled := false;
    ButtonLimparFormaPagamento.Enabled := false;
    ButtonNovoFormaPagamento.Enabled := false;
    CheckBoxCadastroFLURGENTE.Checked := false;
    CheckBoxCadastroFLURGENTE.Enabled := false;
    CheckBoxCadastroFLENTREGAPENDENTE.Checked := false;
    CheckBoxCadastroFLENTREGAPENDENTE.Enabled := false;
  end;
end;

procedure TfmCadAquisicao.EditCadastroDETIPOMOVIMENTOExit(Sender: TObject);
var
  i: integer;
  vQuery: TZQuery;
begin
  if Length(Trim(EditCadastroDETIPOMOVIMENTO.Text)) = 0 then
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
      SQL.Add('WHERE UPPER("DE-Tipo Movimento") LIKE :DETIPOMOVIMENTO');
      SQL.Add('  AND "DE-Natureza" = ''Aquisição''');
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
            setaFiltrosExtras('"DE-Natureza" = ''Aquisição''',
                              'Natureza: Aquisição');
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
          fmPrincipal.apresentaResultadoCadastro('Nenhum registro encontrado.');
      Active := false;
    end;
  finally
    FreeAndNil(vQuery);

    EditCadastroCDTIPOMOVIMENTO.Enabled := (plTipoMovimento.Count = 0);
    EditCadastroDETIPOMOVIMENTO.Enabled := (plTipoMovimento.Count = 0);
    ButtonLimparTipoMovimento.Enabled := (plTipoMovimento.Count > 0);
    ButtonNovoTipoMovimento.Enabled := (plTipoMovimento.Count = 0);

    // Valida para qual campo vai se posicionar.
    if pAtivarControle then
      if OfficePagerCentral.ActivePageIndex = 1 then
        if OfficePagerCadastroAquisicao.ActivePageIndex = 0 then
          if plTipoMovimento.Count > 0 then
          begin
            if EditCadastroNUANOAQUISICAO.Enabled then
              ActiveControl := EditCadastroNUANOAQUISICAO;
          end
          else
            if EditCadastroDETIPOMOVIMENTO.Enabled then
              ActiveControl := EditCadastroDETIPOMOVIMENTO;
  end;

  // Para que o evento volte a ser executado.
  EditCadastroCDTIPOMOVIMENTO.OnChange := EditCadastroCDTIPOMOVIMENTOChange;
  EditCadastroCDTIPOMOVIMENTO.OnExit := EditCadastroCDTIPOMOVIMENTOExit;
  EditCadastroDETIPOMOVIMENTO.OnExit := EditCadastroDETIPOMOVIMENTOExit;
  EditCadastroDETIPOMOVIMENTO.OnClickBtn := EditCadastroDETIPOMOVIMENTOClickBtn;

  // Verifica foi selecionado um tipo de movimento igual a presente recebido.
  if AnsiCompareText(Trim(EditCadastroDETIPOMOVIMENTO.Text), cTipoMovimentoPresente) = 0 then
  begin
    CheckBoxCadastroFLPARCELADO.Checked := false;
    CheckBoxCadastroFLPARCELADO.Enabled := false;
    EditCadastroCDFORMAPAGAMENTO.Enabled := false;
    EditCadastroNMFORMAPAGAMENTO.Enabled := false;
    ButtonLimparFormaPagamento.Enabled := false;
    ButtonNovoFormaPagamento.Enabled := false;
    CheckBoxCadastroFLURGENTE.Checked := false;
    CheckBoxCadastroFLURGENTE.Enabled := false;
    CheckBoxCadastroFLENTREGAPENDENTE.Checked := false;
    CheckBoxCadastroFLENTREGAPENDENTE.Enabled := false;
  end;
end;

procedure TfmCadAquisicao.EditCadastroDEMOTIVOURGENCIAClickBtn(
  Sender: TObject);
var
  i: integer;
begin
  // Para que o evento não seja executado.
  EditCadastroCDMOTIVOURGENCIA.OnChange := nil;
  EditCadastroCDMOTIVOURGENCIA.OnExit := nil;
  EditCadastroDEMOTIVOURGENCIA.OnExit := nil;
  EditCadastroDEMOTIVOURGENCIA.OnClickBtn := nil;

  fmConFiltroPadrao := TfmConFiltroPadrao.Create(Self);
  try
    with fmConFiltroPadrao do
    begin
      try
        setaTitulo('Consulta de Motivos de Urgência');
        setaConsulta(pMotivoUrgencia.filtro);
        setaOpcao('R');
        executaFiltro(0,EmptyStr);
        ShowModal;
      finally
        plMotivoUrgencia.Clear;
        with pResSearch do
          for i := 0 to Count -1 do
            if objResSearch[i].Id = buscaId then
            begin
              plMotivoUrgencia.Add(objResSearch[i].Codigo);
              EditCadastroCDMOTIVOURGENCIA.Text := objResSearch[i].Codigo;
              EditCadastroDEMOTIVOURGENCIA.Text := objResSearch[i].Nome1;
            end;
      end;
    end;
  finally
    EditCadastroCDMOTIVOURGENCIA.Enabled := (plMotivoUrgencia.Count = 0);
    EditCadastroDEMOTIVOURGENCIA.Enabled := (plMotivoUrgencia.Count = 0);
    ButtonLimparMotivoUrgencia.Enabled := (plMotivoUrgencia.Count > 0);
    ButtonNovoMotivoUrgencia.Enabled := (plMotivoUrgencia.Count = 0);

    // Valida para qual campo vai se posicionar.
    if pAtivarControle then
      if OfficePagerCentral.ActivePageIndex = 1 then
        if OfficePagerCadastroAquisicao.ActivePageIndex = 0 then
          if plMotivoUrgencia.Count > 0 then
          begin
            if CheckBoxCadastroFLENTREGAPENDENTE.Enabled then
              ActiveControl := CheckBoxCadastroFLENTREGAPENDENTE;
          end
          else
            if EditCadastroDEMOTIVOURGENCIA.Enabled then
              ActiveControl := EditCadastroDEMOTIVOURGENCIA;
  end;

  // Para que o evento volte a ser executado.
  EditCadastroCDMOTIVOURGENCIA.OnChange := EditCadastroCDMOTIVOURGENCIAChange;
  EditCadastroCDMOTIVOURGENCIA.OnExit := EditCadastroCDMOTIVOURGENCIAExit;
  EditCadastroDEMOTIVOURGENCIA.OnExit := EditCadastroDEMOTIVOURGENCIAExit;
  EditCadastroDEMOTIVOURGENCIA.OnClickBtn := EditCadastroDEMOTIVOURGENCIAClickBtn;
end;

procedure TfmCadAquisicao.EditCadastroDEMOTIVOURGENCIAExit(Sender: TObject);
var
  i: integer;
  vQuery: TZQuery;
begin
  if Length(Trim(EditCadastroDEMOTIVOURGENCIA.Text)) = 0 then
    Exit;

  // Para que o evento não seja executado.
  EditCadastroCDMOTIVOURGENCIA.OnChange := nil;
  EditCadastroCDMOTIVOURGENCIA.OnExit := nil;
  EditCadastroDEMOTIVOURGENCIA.OnExit := nil;
  EditCadastroDEMOTIVOURGENCIA.OnClickBtn := nil;

  try
    vQuery := pMotivoUrgencia.filtro;
    with vQuery do
    begin
      SQL.Add('WHERE UPPER("DE-Motivo") LIKE :DEMOTIVO');
      Params.ParamByName('DEMOTIVO').AsString := '%'+AnsiUpperCase(EditCadastroDEMOTIVOURGENCIA.Text)+'%';
      dmPrincipal.executaConsulta(vQuery);

      if RecordCount > 1 then
      begin
        fmConFiltroPadrao := TfmConFiltroPadrao.Create(Self);
        with fmConFiltroPadrao do
        begin
          try
            setaTitulo('Consulta de Motivos de Urgência');
            setaConsulta(pMotivoUrgencia.filtro);
            setaOpcao('R');
            executaFiltro(2,EditCadastroDEMOTIVOURGENCIA.Text);
            ShowModal;
          finally
            plMotivoUrgencia.Clear;
            with pResSearch do
              for i := 0 to Count -1 do
                if objResSearch[i].Id = buscaId then
                begin
                  plMotivoUrgencia.Add(objResSearch[i].Codigo);
                  EditCadastroCDMOTIVOURGENCIA.Text := objResSearch[i].Codigo;
                  EditCadastroDEMOTIVOURGENCIA.Text := objResSearch[i].Nome1;
                end;
          end;
        end;
      end
      else
        if not Eof then
        begin
          plMotivoUrgencia.Clear;
          plMotivoUrgencia.Add(Fields.Fields[0].AsString);
          EditCadastroCDMOTIVOURGENCIA.Text := Fields.Fields[0].AsString;
          EditCadastroDEMOTIVOURGENCIA.Text := Fields.Fields[1].AsString;
        end
        else
          fmPrincipal.apresentaResultadoCadastro('Nenhum registro encontrado.');
      Active := false;
    end;
  finally
    FreeAndNil(vQuery);
    EditCadastroCDMOTIVOURGENCIA.Enabled := (plMotivoUrgencia.Count = 0);
    EditCadastroDEMOTIVOURGENCIA.Enabled := (plMotivoUrgencia.Count = 0);
    ButtonLimparMotivoUrgencia.Enabled := (plMotivoUrgencia.Count > 0);
    ButtonNovoMotivoUrgencia.Enabled := (plMotivoUrgencia.Count = 0);

    // Valida para qual campo vai se posicionar.
    if pAtivarControle then
      if OfficePagerCentral.ActivePageIndex = 1 then
        if OfficePagerCadastroAquisicao.ActivePageIndex = 0 then
          if plMotivoUrgencia.Count > 0 then
          begin
            if CheckBoxCadastroFLENTREGAPENDENTE.Enabled then
              ActiveControl := CheckBoxCadastroFLENTREGAPENDENTE;
          end
          else
            if EditCadastroDEMOTIVOURGENCIA.Enabled then
              ActiveControl := EditCadastroDEMOTIVOURGENCIA;
  end;

  // Para que o evento volte a ser executado.
  EditCadastroCDMOTIVOURGENCIA.OnChange := EditCadastroCDMOTIVOURGENCIAChange;
  EditCadastroCDMOTIVOURGENCIA.OnExit := EditCadastroCDMOTIVOURGENCIAExit;
  EditCadastroDEMOTIVOURGENCIA.OnExit := EditCadastroDEMOTIVOURGENCIAExit;
  EditCadastroDEMOTIVOURGENCIA.OnClickBtn := EditCadastroDEMOTIVOURGENCIAClickBtn;
end;

procedure TfmCadAquisicao.DatePickerEditCadastroDTAQUISICAOExit(
  Sender: TObject);
begin
  // Para alteração, a data não pode ser menor que o Ano do cadastro.
  if Opcao = 'A' then
    if (DatePickerEditCadastroDTAQUISICAO.Date < pdtMinima) or
       (DatePickerEditCadastroDTAQUISICAO.Date > pdtMaxima) then
    begin
      MessageBox(fmPrincipal.Handle,
                 PWideChar('A data de aquisição informada não se encontra dentro do ano de aquisição.'+#13+#10+
                           'Favor informar uma data que pertença ao ano de '+EditCadastroNUANOAQUISICAO.Text+'.'),
                 cTituloMensagemErro,
                 MB_OK or MB_ICONERROR);
      DatePickerEditCadastroDTAQUISICAO.Date := pdtAquisicao;
      Exit;
    end;
  EditCadastroNUANOAQUISICAO.Text := IntToStr(YearOf(DatePickerEditCadastroDTAQUISICAO.Date));
end;

procedure TfmCadAquisicao.DBAdvGridGeralClickCell(Sender: TObject; ARow,
  ACol: Integer);
var
  vEstado: boolean;
begin
  if ARow = 0 then
    Exit;

  // Guarda a informação do estado da aquisição.
  DBAdvGridGeral.GetCheckboxState(12, ARow, vEstado);

  if vEstado = true then
    pOcultarExibir := 'ocultar'
  else
    pOcultarExibir := 'exibir';

  // Considera como se tivesse clicado no checkbox de visível.
  if ACol = 12 then
    atualizaAquisicaoVisivel;
end;

procedure TfmCadAquisicao.DBAdvGridGeralDblClickCell(Sender: TObject; ARow,
  ACol: Integer);
begin
  if ARow > 0 then
    MenuItemEditarRegistroClick(MenuItemEditarRegistro);
end;

procedure TfmCadAquisicao.DBAdvGridGeralFilterSelect(Sender: TObject; Column,
  ItemIndex: Integer; FriendlyName: string; var FilterCondition: string);
begin
  try
    case ItemIndex of
      0: FilterCondition := EmptyStr;
      1: FilterCondition := 'S';
      2: FilterCondition := 'N';
    end;

    DBAdvGridGeral.Cells[Column,0] := FriendlyName;
  except
    on E: Exception do
      fmPrincipal.manipulaExcecoes(Sender,E);
  end;
end;

procedure TfmCadAquisicao.desabilitaBotoes;
begin
  BitBtnSalvar.Enabled := false;
  BitBtnRestaurar.Enabled := false;
  BitBtnNovo.Enabled := false;
  BitBtnCancelarAquisicao.Enabled := false;
  BitBtnParcelas.Enabled := false;
  BitBtnInserirDocumento.Enabled := false;
end;

procedure TfmCadAquisicao.desabilitaTudo;
begin
  // Eventos.
  EditCadastroCDTIPOMOVIMENTO.OnChange := nil;
  EditCadastroCDTIPOMOVIMENTO.OnExit := nil;
  EditCadastroDETIPOMOVIMENTO.OnClickBtn := nil;
  EditCadastroDETIPOMOVIMENTO.OnExit := nil;
  EditCadastroCDMOTIVOURGENCIA.OnChange := nil;
  EditCadastroCDMOTIVOURGENCIA.OnExit := nil;
  EditCadastroDEMOTIVOURGENCIA.OnClickBtn := nil;
  EditCadastroDEMOTIVOURGENCIA.OnExit := nil;
  EditCadastroNMFORMAPAGAMENTO.OnClickBtn := nil;
  EditCadastroNMFORMAPAGAMENTO.OnExit := nil;
  EditCadastroNMFORNECEDOR.OnClickBtn := nil;
  EditCadastroNMFORNECEDOR.OnExit := nil;
  EditCadastroNMUSUARIO.OnClickBtn := nil;
  EditCadastroNMUSUARIO.OnExit := nil;
  EditCadastroCDFORNECEDOR.OnChange := nil;
  EditCadastroCDFORNECEDOR.OnExit := nil;
  EditCadastroCDUSUARIO.OnChange := nil;
  EditCadastroCDUSUARIO.OnExit := nil;
  EditCadastroNMLOGIN.OnExit := nil;
  EditCadastroCDFORMAPAGAMENTO.OnChange := nil;
  EditCadastroCDFORMAPAGAMENTO.OnExit := nil;
  EditCadastroNUCNPJ.OnChange := nil;
  EditCadastroNUCNPJ.OnExit := nil;
  EditCadastroNUNOTAFISCAL.OnChange := nil;
  ColumnGridItens.OnClickCell := nil;
  ColumnGridItens.OnDblClickCell := nil;

  // Componentes.
  BitBtnSalvar.Enabled := false;
  BitBtnNovo.Enabled := false;
  BitBtnCancelarAquisicao.Enabled := false;
  BitBtnRestaurar.Enabled := false;
  EditCadastroNUANOAQUISICAO.Enabled := false;
  CheckBoxCadastroFLPARCELADO.Enabled := false;
  ButtonLimparUsuario.Enabled := false;
  ButtonNovoFornecedor.Enabled := false;
  EditCadastroCDUSUARIO.Enabled := false;
  EditCadastroNMLOGIN.Enabled := false;
  EditCadastroNMUSUARIO.Enabled := false;
  BitBtnParcelas.Enabled := false;
  BitBtnInserirDocumento.Enabled := false;
  MemoCadastroDEOBSERVACOES.Enabled := false;
  EditCadastroCDTIPOMOVIMENTO.Enabled := false;
  EditCadastroDETIPOMOVIMENTO.Enabled := false;
  ButtonLimparTipoMovimento.Enabled := false;
  ButtonNovoTipoMovimento.Enabled := false;
  EditCadastroCDMOTIVOURGENCIA.Enabled := false;
  EditCadastroDEMOTIVOURGENCIA.Enabled := false;
  ButtonLimparMotivoUrgencia.Enabled := false;
  ButtonNovoMotivoUrgencia.Enabled := false;
  EditCadastroNUAQUISICAO.Enabled := false;
  DatePickerEditCadastroDTAQUISICAO.Enabled := false;
  DatePickerEditCadastroDTCADASTRO.Enabled := false;
  EditCadastroDEAQUISICAO.Enabled := false;
  DatePickerEditCadastroDTULTATUALIZACAO.Enabled := false;
  EditCadastroCDFORNECEDOR.Enabled := false;
  EditCadastroNMFORNECEDOR.Enabled := false;
  ButtonLimparFornecedor.Enabled := false;
  EditCadastroCDFORMAPAGAMENTO.Enabled := false;
  EditCadastroNMFORMAPAGAMENTO.Enabled := false;
  ButtonLimparFormaPagamento.Enabled := false;
  ButtonNovoFormaPagamento.Enabled := false;
  CheckBoxCadastroFLURGENTE.Enabled := false;
  CheckBoxCadastroFLENTREGAPENDENTE.Enabled := false;
  EditCadastroCDRASTREAMENTO.Enabled := false;
  DatePickerEditCadastroDTPREVISAOENTREGA.Enabled := false;
  ButtonAdicionarMaterial.Enabled := false;
  EditCadastroNUCNPJ.Enabled := false;
  EditCadastroNUNOTAFISCAL.Enabled := false;
  ColumnGridItens.Enabled := false;
end;

procedure TfmCadAquisicao.editaCadastroViaConsulta(prmCodigo: integer);
begin
  pAtivarControle := false;
  Codigo := prmCodigo;
  Opcao := 'A';
  // A opção 2 apresenta o botão Novo sempre desabilitado.
  Tag := 2;
  pAquisicao.Codigo := Codigo;
  pflParcelado := (pAquisicao.existeParcelamento > 0);

  editaCadastro;

  // Se estiver cancelada, não habilita.
  if pStatusAquisicao <> 'C' then
    habilitaBotoes;

  pAtivarControle := true;

  if EditCadastroDEAQUISICAO.Enabled then
    ActiveControl := EditCadastroDEAQUISICAO
  else
    if BitBtnNovo.Enabled then
      ActiveControl := BitBtnNovo;
end;

procedure TfmCadAquisicao.editaCadastro;
var
  vcdMaterialF, vMarcaModelo: string;
  vQuery: TZQuery;
  vAno: word;
  vvlTotal: currency;
begin
  novoCadastro;
  pStatusAquisicao := 'A';

  try
    try
      vQuery := pAquisicao.lista;
      with vQuery do
      begin
        // Consulta o cadastro da Aquisição.
        SQL.Add('WHERE cdaquisicao = :CURRENT_CDAQUISICAO');
        Params.ParamByName('CURRENT_CDAQUISICAO').AsInteger := Codigo;
        dmPrincipal.executaConsulta(vQuery);

        if not Eof then
        begin
          EditCadastroCDTIPOMOVIMENTO.Text := Fields.FieldByName('CDTIPOMOVIMENTO').AsString;
          EditCadastroCDTIPOMOVIMENTOExit(EditCadastroCDTIPOMOVIMENTO);
          EditCadastroNUANOAQUISICAO.Text := Fields.FieldByName('NUANOAQUISICAO').AsString;
          EditCadastroNUAQUISICAO.Text := Fields.FieldByName('NUAQUISICAO').AsString;
          DatePickerEditCadastroDTCADASTRO.Date := Fields.FieldByName('DTREGISTRO').AsDateTime;
          DatePickerEditCadastroDTAQUISICAO.Date := Fields.FieldByName('DTAQUISICAO').AsDateTime;
          vAno := StrToInt(EditCadastroNUANOAQUISICAO.Text);
          pdtMinima := EncodeDate(vAno,1,1);
          pdtMaxima := EncodeDate(vAno,12,31);
          pdtAquisicao := Fields.FieldByName('DTAQUISICAO').AsDateTime;
          if not Fields.FieldByName('DTULTATUALIZACAO').IsNull then
            DatePickerEditCadastroDTULTATUALIZACAO.Date := Fields.FieldByName('DTULTATUALIZACAO').AsDateTime;
          EditCadastroCDUSUARIO.Text := Fields.FieldByName('CDUSUARIO').AsString;
          EditCadastroCDUSUARIOExit(EditCadastroCDUSUARIO);
          EditCadastroDEAQUISICAO.Text := Fields.FieldByName('DEAQUISICAO').AsString;
          if not Fields.FieldByName('DEOBSERVACOES').IsNull then
            MemoCadastroDEOBSERVACOES.Text := Fields.FieldByName('DEOBSERVACOES').Text;
          if Fields.FieldByName('FLURGENTE').AsString = 'S' then
          begin
            CheckBoxCadastroFLURGENTE.Checked := true;
            EditCadastroCDMOTIVOURGENCIA.Text := Fields.FieldByName('CDMOTIVOURGENCIA').AsString;
            EditCadastroCDMOTIVOURGENCIAExit(EditCadastroCDMOTIVOURGENCIA);
          end;
          if Fields.FieldByName('FLENTREGAPENDENTE').AsString = 'S' then
            CheckBoxCadastroFLENTREGAPENDENTE.Checked := true;
          if not Fields.FieldByName('DTPREVISAOENTREGA').IsNull then
            DatePickerEditCadastroDTPREVISAOENTREGA.Date := Fields.FieldByName('DTPREVISAOENTREGA').AsDateTime;
          if not Fields.FieldByName('CDRASTREAMENTO').IsNull then
            EditCadastroCDRASTREAMENTO.Text := Fields.FieldByName('CDRASTREAMENTO').AsString;
          if not Fields.FieldByName('DTENTREGA').IsNull then
            DatePickerEditCadastroDTENTREGA.Date := Fields.FieldByName('DTENTREGA').AsDateTime;
          if not Fields.FieldByName('NUNOTAFISCAL').IsNull then
            EditCadastroNUNOTAFISCAL.Text := Format('%.*d', [10,Fields.FieldByName('NUNOTAFISCAL').AsInteger]);
          EditCadastroCDFORNECEDOR.Text := Fields.FieldByName('CDFORNECEDOR').AsString;
          if not Fields.FieldByName('CDFORNECEDOR').IsNull then
            EditCadastroCDFORNECEDORExit(EditCadastroCDFORNECEDOR);
          EditCadastroCDFORMAPAGAMENTO.Text := Fields.FieldByName('CDFORMAPAGAMENTO').AsString;
          if not Fields.FieldByName('CDFORMAPAGAMENTO').IsNull then
            EditCadastroCDFORMAPAGAMENTOExit(EditCadastroCDFORMAPAGAMENTO);
          if Fields.FieldByName('FLPARCELADO').AsString = 'S' then
          begin
            CheckBoxCadastroFLPARCELADO.Checked := true;
            BitBtnParcelas.Enabled := true;
            SpinEditNumeroParcelas.Value := Trunc(pAquisicao.obtemNumeroParcelas);
            EditCadastroVLENTRADAPARCELA.Value := pAquisicao.obtemValorEntrada;
          end;
          EditCadastroVLTAXAJUROS.Value := Fields.FieldByName('VLTAXAJUROS').AsFloat;
          EditCadastroVLTAXAEXTRA.Value := Fields.FieldByName('VLTAXAEXTRA').AsCurrency;
          // Controla os campos de entrega.
          EditCadastroCDRASTREAMENTO.Enabled := CheckBoxCadastroFLENTREGAPENDENTE.Checked;
          DatePickerEditCadastroDTENTREGA.Enabled := CheckBoxCadastroFLENTREGAPENDENTE.Checked;
          DatePickerEditCadastroDTPREVISAOENTREGA.Enabled := CheckBoxCadastroFLENTREGAPENDENTE.Checked;
          // Mostra ou não o painel.
          // - Se cancelado, mostra o painel com a informação de cancelamento;.
          PanelStatusCadastro.Visible := (Fields.FieldByName('FLCANCELADO').AsString = 'S');
          // Guarda o status da aquisição.
          if Fields.FieldByName('FLCANCELADO').AsString = 'S' then
          begin
            LabelStatusCadastro.Caption := 'Esta aquisição foi cancelada em ' + FormatDateTime('dd/mm/yyyy',Fields.FieldByName('DTCANCELAMENTO').AsDateTime) + '.';
            pStatusAquisicao := 'C';
          end
          else
            pStatusAquisicao := 'A';
        end
        else
          raise exception.Create('O cadastro da Aquisição não foi encontrado.');

        Active := false;
        // Consulta o cadastro dos Itens da Aquisicao.
        FreeAndNil(vQuery);
        vQuery := pAquisicao.listaItem;
        SQL.Add('WHERE aquisicaoitem.cdaquisicao = :CURRENT_CDAQUISICAO');
        SQL.Add('ORDER BY 3 ASC');
        Params.ParamByName('CURRENT_CDAQUISICAO').AsInteger := Codigo;
        dmPrincipal.executaConsulta(vQuery);

        if not Eof then
        begin
          // Preeenche os dados da grid.
          ColumnGridItens.BeginUpdate;
          while not Eof do
          begin
            with ColumnGridItens do
            begin
              ColumnByName['NUITEM'].Ints[Row] := Fields.FieldByName('NUITEM').AsInteger;
              ColumnByName['CDFAMILIA'].Rows[Row] := Fields.FieldByName('CDFAMILIAF').AsString;
              ColumnByName['CDMATERIAL'].Ints[Row] := Fields.FieldByName('CDMATERIAL').AsInteger;
              vcdMaterialF := pMaterial.obtemMaterial(Fields.FieldByName('CDMATERIAL').AsInteger);
              ColumnByName['CDMATERIALF'].Rows[Row] := vcdMaterialF;
              ColumnByName['DEMATERIAL'].Rows[Row] := Fields.FieldByName('DEMATERIAL').AsString;
              if Fields.FieldByName('CDMARCA').AsInteger > 0 then
              begin
                vMarcaModelo := Fields.FieldByName('CDMARCA').AsString + ';' + Fields.FieldByName('CDMODELO').AsString;
                ColumnByName['CDMARCAMODELO'].Rows[Row] := vMarcaModelo;
                ColumnByName['NMMARCAMODELO'].Rows[Row] := Fields.FieldByName('NMMARCA').AsString + ' - ' + Fields.FieldByName('NMMODELO').AsString;
              end;
              ColumnByName['CDEMBALAGEM'].Ints[Row] := Fields.FieldByName('CDEMBALAGEM').AsInteger;
              ColumnByName['NMEMBALAGEM'].Rows[Row] := Fields.FieldByName('NMEMBALAGEM').AsString;
              ColumnByName['QTEQUIVALENCIA'].Ints[Row] := Fields.FieldByName('QTEQUIVALENCIA').AsInteger;
              ColumnByName['QTMATERIAL'].Ints[Row] := Fields.FieldByName('QTMATERIAL').AsInteger;
              ColumnByName['VLUNITARIO'].Floats[Row] := Fields.FieldByName('VLUNITARIO').AsCurrency;
              ColumnByName['VLGARANTIA'].Floats[Row] := Fields.FieldByName('VLGARANTIA').AsCurrency;
              vvlTotal := (ColumnByName['QTMATERIAL'].Ints[Row] * ColumnByName['VLUNITARIO'].Floats[Row]) + (ColumnByName['QTMATERIAL'].Ints[Row] * ColumnByName['VLGARANTIA'].Floats[Row]);
              ColumnByName['VLTOTAL'].Floats[Row] := vvlTotal;
              if not Fields.FieldByName('DTGARANTIA').IsNull then
                ColumnByName['DTGARANTIA'].Dates[Row] := Fields.FieldByName('DTGARANTIA').AsDateTime;
              ColumnByName['FLGARANTIAATIVA'].Rows[Row] := Fields.FieldByName('FLGARANTIAATIVA').AsString;
              ColumnByName['EXCLUIDO'].Ints[Row] := 0;
              if pStatusAquisicao <> 'C' then
              begin
                AddImageIdx(11,Row,0,haCenter,vaCenter);
                AddImageIdx(12,Row,1,haCenter,vaCenter);
              end
              else
              begin
                AddImageIdx(11,Row,2,haCenter,vaCenter);
                AddImageIdx(12,Row,3,haCenter,vaCenter);
              end
            end;

            Next;

            // Controla para não incluir item a mais no final.
            with ColumnGridItens do
              if not Eof then
              begin
                AddRow;
                Row := RowCount -1;
              end;
          end;
          with ColumnGridItens do
          begin
            Row := 1;
            EndUpdate;
            AutoSizeColumns(true);
          end;

          // Atualiza o somatório.
          atualizaSomatorioGrid;
        end
        else
          fmPrincipal.pLogSistema.Warn('O cadastro da aquisição '+IntToStr(Codigo)+' não possui itens.');
        Active := false;
      end;
    finally
      vQuery.Active := false;
      FreeAndNil(vQuery);

      EditCadastroNUANOAQUISICAO.Enabled := false;

      // O Tipo de Aquisição não pode ser alterado após o registro ser salvo.
      if Opcao = 'A' then
      begin
        EditCadastroCDTIPOMOVIMENTO.Enabled := false;
        EditCadastroDETIPOMOVIMENTO.Enabled := false;
        ButtonLimparTipoMovimento.Enabled := false;
        ButtonNovoTipoMovimento.Enabled := false;
        EditCadastroCDTIPOMOVIMENTO.OnChange := nil;
        EditCadastroCDTIPOMOVIMENTO.OnExit := nil;
        EditCadastroDETIPOMOVIMENTO.OnExit := nil;
        EditCadastroDETIPOMOVIMENTO.OnClickBtn := nil;
      end;

      // Se for uma aquisição parcelada, não permite alterar valores, apenas informações cadastrais.
      if pflParcelado = true then
      begin
        CheckBoxCadastroFLPARCELADO.Enabled := false;
        EditCadastroVLTAXAEXTRA.Enabled := false;
        EditCadastroVLTAXAJUROS.Enabled := false;
        EditCadastroVLENTRADAPARCELA.Enabled := false;
        SpinEditNumeroParcelas.Enabled := false;
        ButtonAdicionarMaterial.Enabled := false;
        ColumnGridItens.Enabled := false;
      end;

      // Verifica foi selecionado um tipo de movimento igual a presente recebido.
      if AnsiCompareText(Trim(EditCadastroDETIPOMOVIMENTO.Text), cTipoMovimentoPresente) = 0 then
      begin
        ButtonLimparTipoMovimento.Enabled := false;
        CheckBoxCadastroFLPARCELADO.Checked := false;
        CheckBoxCadastroFLPARCELADO.Enabled := false;
        EditCadastroCDFORMAPAGAMENTO.Enabled := false;
        EditCadastroNMFORMAPAGAMENTO.Enabled := false;
        ButtonLimparFormaPagamento.Enabled := false;
        ButtonNovoFormaPagamento.Enabled := false;
        CheckBoxCadastroFLURGENTE.Checked := false;
        CheckBoxCadastroFLURGENTE.Enabled := false;
        CheckBoxCadastroFLENTREGAPENDENTE.Checked := false;
        CheckBoxCadastroFLENTREGAPENDENTE.Enabled := false;
      end;

      // Desabilita para edição, caso seja uma aquisição cancelada.
      if pStatusAquisicao = 'C' then
      begin
        desabilitaTudo;
        desabilitaBotoes;
        BitBtnNovo.Enabled := true;
        BitBtnFechar.Enabled := true;
      end;
    end;
  except
    on E: exception do
      raise;
  end;
end;

procedure TfmCadAquisicao.editaColunaGrid(prmIndice: integer; prmNome,
  prmCabecalho: string; prmEditor: TEditorType; prmAlinhamento: TAlignment;
  prmTamanho: integer; prmSomenteLeitura: boolean);
begin
  try
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
  except
    on E: Exception do
      fmPrincipal.manipulaExcecoes(fmPrincipal,E);
  end;
end;

procedure TfmCadAquisicao.EditCadastroCDFORMAPAGAMENTOChange(Sender: TObject);
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
      OnChange := EditCadastroCDFORMAPAGAMENTOChange;
      SelStart := Length(Text);
    end;
end;

procedure TfmCadAquisicao.EditCadastroCDFORMAPAGAMENTOExit(Sender: TObject);
var
  vQuery: TZQuery;
begin
  // Se não digitou nada, sai sem abrir a search.
  if Length(Trim(EditCadastroCDFORMAPAGAMENTO.Text)) = 0 then
    Exit;

  // Para que o evento não seja executado.
  EditCadastroCDFORMAPAGAMENTO.OnChange := nil;
  EditCadastroCDFORMAPAGAMENTO.OnExit := nil;
  EditCadastroNMFORMAPAGAMENTO.OnExit := nil;
  EditCadastroNMFORMAPAGAMENTO.OnClickBtn := nil;

  try
    vQuery := pFormaPagamento.filtro;
    with vQuery do
    begin
      SQL.Add('WHERE "NU-Código" = :CDFORMAPAGAMENTO');
      Params.ParamByName('CDFORMAPAGAMENTO').AsString := EditCadastroCDFORMAPAGAMENTO.Text;
      dmPrincipal.executaConsulta(vQuery);

      if not Eof then
      begin
        plFormaPagamento.Clear;
        plFormaPagamento.Add(Fields.Fields[0].AsString);
        EditCadastroCDFORMAPAGAMENTO.Text := Fields.Fields[0].AsString;
        EditCadastroNMFORMAPAGAMENTO.Text := Fields.Fields[1].AsString;
      end
      else
      begin
        plFormaPagamento.Clear;
        EditCadastroCDFORMAPAGAMENTO.Clear;
        EditCadastroNMFORMAPAGAMENTO.Clear;
        fmPrincipal.apresentaResultadoCadastro('Nenhum registro encontrado.');
      end;
      Active := false;
    end;
  finally
    FreeAndNil(vQuery);
    EditCadastroCDFORMAPAGAMENTO.Enabled := (plFormaPagamento.Count = 0);
    EditCadastroNMFORMAPAGAMENTO.Enabled := (plFormaPagamento.Count = 0);
    ButtonLimparFormaPagamento.Enabled := (plFormaPagamento.Count > 0);
    ButtonNovoFormaPagamento.Enabled := (plFormaPagamento.Count = 0);
    // Se este painel estiver visível é porque a aquisição foi encerrada ou cancelada.
    if pStatusAquisicao = 'C' then
    begin
      ButtonLimparFormaPagamento.Enabled := false;
      ButtonNovoFormaPagamento.Enabled := false;
    end;

     // Valida para qual campo vai se posicionar.
    if pAtivarControle then
      if OfficePagerCentral.ActivePageIndex = 1 then
        if OfficePagerCadastroAquisicao.ActivePageIndex = 0 then
          if plFormaPagamento.Count > 0 then
          begin
            if CheckBoxCadastroFLPARCELADO.Enabled then
              ActiveControl := CheckBoxCadastroFLPARCELADO;
          end
          else
            if EditCadastroCDFORMAPAGAMENTO.Enabled then
              ActiveControl := EditCadastroCDFORMAPAGAMENTO;
 end;

  // Para que o evento volte a ser executado.
  EditCadastroCDFORMAPAGAMENTO.OnChange := EditCadastroCDFORMAPAGAMENTOChange;
  EditCadastroCDFORMAPAGAMENTO.OnExit := EditCadastroCDFORMAPAGAMENTOExit;
  EditCadastroNMFORMAPAGAMENTO.OnExit := EditCadastroNMFORMAPAGAMENTOExit;
  EditCadastroNMFORMAPAGAMENTO.OnClickBtn := EditCadastroNMFORMAPAGAMENTOClickBtn;
end;

procedure TfmCadAquisicao.EditCadastroCDFORNECEDORChange(Sender: TObject);
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
      OnChange := EditCadastroCDFORNECEDORChange;
      SelStart := Length(Text);
    end;
end;

procedure TfmCadAquisicao.EditCadastroCDFORNECEDORExit(Sender: TObject);
var
  vQuery: TZQuery;
begin
  if Length(Trim(EditCadastroCDFORNECEDOR.Text)) = 0 then
    Exit;

  // Para que o evento não seja executado.
  EditCadastroCDFORNECEDOR.OnChange := nil;
  EditCadastroCDFORNECEDOR.OnExit := nil;
  EditCadastroNUCNPJ.OnExit := nil;
  EditCadastroNMFORNECEDOR.OnExit := nil;
  EditCadastroNMFORNECEDOR.OnClickBtn := nil;

  try
    vQuery := pFornecedor.filtro;
    with vQuery do
    begin
      SQL.Add('WHERE "NU-Código" = :CDFORNECEDOR');
      Params.Items[0].AsString := EditCadastroCDFORNECEDOR.Text;
      dmPrincipal.executaConsulta(vQuery);

      if not Eof then
      begin
        plFornecedor.Clear;
        plFornecedor.Add(Fields.Fields[0].AsString);
        EditCadastroNUCNPJ.Text := Fields.Fields[1].AsString;
        EditCadastroNMFORNECEDOR.Text := Fields.Fields[2].AsString;
      end
      else
      begin
        plFornecedor.Clear;
        EditCadastroCDFORNECEDOR.Clear;
        EditCadastroNUCNPJ.Clear;
        EditCadastroNMFORNECEDOR.Clear;
        fmPrincipal.apresentaResultadoCadastro('Nenhum registro encontrado.');
      end;
      Active := false;
    end;
  finally
    FreeAndNil(vQuery);

    EditCadastroCDFORNECEDOR.Enabled := (plFornecedor.Count = 0);
    EditCadastroNUCNPJ.Enabled := (plFornecedor.Count = 0);
    EditCadastroNMFORNECEDOR.Enabled := (plFornecedor.Count = 0);
    ButtonLimparFornecedor.Enabled := (plFornecedor.Count > 0);
    ButtonNovoFornecedor.Enabled := (plFornecedor.Count = 0);

    // Valida para qual campo vai se posicionar.
    if pAtivarControle then
      if OfficePagerCentral.ActivePageIndex = 1 then
        if OfficePagerCadastroAquisicao.ActivePageIndex = 0 then
          if plFornecedor.Count > 0 then
          begin
            if EditCadastroNUNOTAFISCAL.Enabled then
              ActiveControl := EditCadastroNUNOTAFISCAL;
          end
          else
            if EditCadastroCDFORNECEDOR.Enabled then
              ActiveControl := EditCadastroCDFORNECEDOR;
  end;

  // Para que o evento volte a ser executado.
  EditCadastroCDFORNECEDOR.OnChange := EditCadastroCDFORNECEDORChange;
  EditCadastroCDFORNECEDOR.OnExit := EditCadastroCDFORNECEDORExit;
  EditCadastroNUCNPJ.OnExit := EditCadastroNUCNPJExit;
  EditCadastroNMFORNECEDOR.OnExit := EditCadastroNMFORNECEDORExit;
  EditCadastroNMFORNECEDOR.OnClickBtn := EditCadastroNMFORNECEDORClickBtn;
end;

procedure TfmCadAquisicao.EditCadastroCDTIPOMOVIMENTOChange(Sender: TObject);
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

procedure TfmCadAquisicao.EditCadastroCDTIPOMOVIMENTOExit(Sender: TObject);
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
      SQL.Add('  AND "DE-Natureza" = ''Aquisição''');
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
        fmPrincipal.apresentaResultadoCadastro('Nenhum registro encontrado.');
      end;
      Active := false;
    end;
  finally
    FreeAndNil(vQuery);
    EditCadastroCDTIPOMOVIMENTO.Enabled := (plTipoMovimento.Count = 0);
    EditCadastroDETIPOMOVIMENTO.Enabled := (plTipoMovimento.Count = 0);
    ButtonLimparTipoMovimento.Enabled := (plTipoMovimento.Count > 0);
    ButtonNovoTipoMovimento.Enabled := (plTipoMovimento.Count = 0);
    // Se este painel estiver visível é porque a aquisição foi encerrada ou cancelada.
    if pStatusAquisicao = 'C' then
    begin
      ButtonLimparTipoMovimento.Enabled := false;
      ButtonNovoTipoMovimento.Enabled := false;
    end;

    // Valida para qual campo vai se posicionar.
    if pAtivarControle then
      if OfficePagerCentral.ActivePageIndex = 1 then
        if OfficePagerCadastroAquisicao.ActivePageIndex = 0 then
          if plTipoMovimento.Count > 0 then
          begin
            if EditCadastroNUANOAQUISICAO.Enabled then
              ActiveControl := EditCadastroNUANOAQUISICAO;
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

  // Verifica foi selecionado um tipo de movimento igual a presente recebido.
  if AnsiCompareText(Trim(EditCadastroDETIPOMOVIMENTO.Text), cTipoMovimentoPresente) = 0 then
  begin
    CheckBoxCadastroFLPARCELADO.Checked := false;
    CheckBoxCadastroFLPARCELADO.Enabled := false;
    EditCadastroCDFORMAPAGAMENTO.Enabled := false;
    EditCadastroNMFORMAPAGAMENTO.Enabled := false;
    ButtonLimparFormaPagamento.Enabled := false;
    ButtonNovoFormaPagamento.Enabled := false;
    CheckBoxCadastroFLURGENTE.Checked := false;
    CheckBoxCadastroFLURGENTE.Enabled := false;
    CheckBoxCadastroFLENTREGAPENDENTE.Checked := false;
    CheckBoxCadastroFLENTREGAPENDENTE.Enabled := false;
  end;
end;

procedure TfmCadAquisicao.EditCadastroCDUSUARIOChange(Sender: TObject);
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

procedure TfmCadAquisicao.EditCadastroCDUSUARIOExit(Sender: TObject);
var
  vQuery: TZQuery;
begin
  if Length(Trim(EditCadastroCDUSUARIO.Text)) = 0 then
    Exit;

  // Para que o evento não seja executado.
  EditCadastroCDUSUARIO.OnChange := nil;
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
        fmPrincipal.apresentaResultadoCadastro('Nenhum registro encontrado.');
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
    if pAtivarControle then
      if OfficePagerCentral.ActivePageIndex = 1 then
        if OfficePagerCadastroAquisicao.ActivePageIndex = 0 then
          if plUsuario.Count > 0 then
          begin
            if EditCadastroDEAQUISICAO.Enabled then
              ActiveControl := EditCadastroDEAQUISICAO;
          end
          else
            if EditCadastroCDUSUARIO.Enabled then
              ActiveControl := EditCadastroCDUSUARIO;
  end;

  // Para que o evento volte a ser executado.
  EditCadastroCDUSUARIO.OnChange := EditCadastroCDUSUARIOChange;
  EditCadastroCDUSUARIO.OnExit := EditCadastroCDUSUARIOExit;
  EditCadastroNMLOGIN.OnExit := EditCadastroNMLOGINExit;
  EditCadastroNMUSUARIO.OnExit := EditCadastroNMUSUARIOExit;
  EditCadastroNMUSUARIO.OnClickBtn := EditCadastroNMUSUARIOClickBtn;
end;

procedure TfmCadAquisicao.EditCadastroNMLOGINExit(Sender: TObject);
var
  i: integer;
  vQuery: TZQuery;
begin
  if Length(Trim(EditCadastroNMLOGIN.Text)) = 0 then
    Exit;

  // Para que o evento não seja executado.
  EditCadastroCDUSUARIO.OnChange := nil;
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
          fmPrincipal.apresentaResultadoCadastro('Nenhum registro encontrado.');
      Active := false;
    end;
  finally
    FreeAndNil(vQuery);
    EditCadastroCDUSUARIO.Enabled := (plUsuario.Count = 0);
    EditCadastroNMLOGIN.Enabled := (plUsuario.Count = 0);
    EditCadastroNMUSUARIO.Enabled := (plUsuario.Count = 0);
    if fmPrincipal.Administrador then
      ButtonLimparUsuario.Enabled := (plUsuario.Count > 0);
    // Se este painel estiver visível é porque a aquisição foi encerrada ou cancelada.
    if pStatusAquisicao = 'C' then
      ButtonLimparUsuario.Enabled := false;

    // Valida para qual campo vai se posicionar.
    if pAtivarControle then
      if OfficePagerCentral.ActivePageIndex = 1 then
        if OfficePagerCadastroAquisicao.ActivePageIndex = 0 then
          if plUsuario.Count > 0 then
          begin
            if EditCadastroDEAQUISICAO.Enabled then
              ActiveControl := EditCadastroDEAQUISICAO;
          end
          else
            if EditCadastroNMLOGIN.Enabled then
              ActiveControl := EditCadastroNMLOGIN;
  end;

  // Para que o evento volte a ser executado.
  EditCadastroCDUSUARIO.OnChange := EditCadastroCDUSUARIOChange;
  EditCadastroCDUSUARIO.OnExit := EditCadastroCDUSUARIOExit;
  EditCadastroNMLOGIN.OnExit := EditCadastroNMLOGINExit;
  EditCadastroNMUSUARIO.OnExit := EditCadastroNMUSUARIOExit;
  EditCadastroNMUSUARIO.OnClickBtn := EditCadastroNMUSUARIOClickBtn;
end;

procedure TfmCadAquisicao.EditCadastroNUANOAQUISICAOExit(Sender: TObject);
var
  vDataInicial, vDataFinal: TDate;
begin
  vDataInicial := StrToDate(Format('01/01/%s',[EditCadastroNUANOAQUISICAO.Text]));
  vDataFinal := StrToDate(Format('31/12/%s',[EditCadastroNUANOAQUISICAO.Text]));

  if (DatePickerEditCadastroDTAQUISICAO.Date < vDataInicial) or
     (DatePickerEditCadastroDTAQUISICAO.Date > vDataFinal) then
  begin
    DatePickerEditCadastroDTAQUISICAO.Date := vDataFinal;
    MessageBox(fmPrincipal.Handle,
               PWideChar('A data de aquisição informada não pertence ao ano informado.'+#13+#10+
                         'Por este motivo, o sistema ajustou automaticamente a data de aquisição para o primeiro dia deste ano.'+#13+#10+
                         'Por favor, reveja o campo Data de Aquisição.'),
               cTituloMensagemAlerta,
               MB_OK or MB_ICONWARNING);
  end;
end;

procedure TfmCadAquisicao.EditCadastroNUCNPJChange(Sender: TObject);
var
  vChar: char;
begin
  with EditCadastroNUCNPJ do
    if Length(Text) > 0 then
    begin
      OnChange := nil;
      vChar := Text[Length(Text)];
      // Verifica se o caractere digitado é válido.
      fmPrincipal.fnGeral.verificaNumeros(vChar,8);
      if vChar = #0 then
        Text := Copy(Text,1,Length(Text)-1);
      OnChange := EditCadastroNUCNPJChange;
      SelStart := Length(Text);
    end;
end;

procedure TfmCadAquisicao.EditCadastroNUCNPJExit(Sender: TObject);
var
  vQuery: TZQuery;
begin
  try
    if Length(Trim(EditCadastroNUCNPJ.Text)) = 0 then
      Exit;

    if Length(Trim(EditCadastroNUCNPJ.Text)) < 14 then
      raise Exception.Create('Não é possível consultar um número de CNPJ incompleto.');

    // Para que o evento não seja executado.
    EditCadastroCDFORNECEDOR.OnChange := nil;
    EditCadastroCDFORNECEDOR.OnExit := nil;
    EditCadastroNUCNPJ.OnExit := nil;
    EditCadastroNMFORNECEDOR.OnExit := nil;
    EditCadastroNMFORNECEDOR.OnClickBtn := nil;

    EditCadastroNUCNPJ.Text := fmPrincipal.fnGeral.formataCNPJ(EditCadastroNUCNPJ.Text);

    try
      vQuery := pFornecedor.filtro;
      with vQuery do
      begin
        SQL.Add('WHERE "CF-CNPJ" = :CNPJ');
        Params.ParamByName('CNPJ').AsString := EditCadastroNUCNPJ.Text;
        dmPrincipal.executaConsulta(vQuery);

        if not Eof then
        begin
          plFornecedor.Clear;
          plFornecedor.Add(Fields.Fields[0].AsString);
          EditCadastroCDFORNECEDOR.Text := Fields.Fields[0].AsString;
          EditCadastroNMFORNECEDOR.Text := Fields.Fields[2].AsString;
        end
        else
        begin
          plFornecedor.Clear;
          EditCadastroCDFORNECEDOR.Clear;
          EditCadastroNUCNPJ.Clear;
          EditCadastroNMFORNECEDOR.Clear;
          fmPrincipal.apresentaResultadoCadastro('Nenhum registro encontrado.');
        end;
        Active := false;
      end;
    finally
      FreeAndNil(vQuery);

      EditCadastroCDFORNECEDOR.Enabled := (plFornecedor.Count = 0);
      EditCadastroNUCNPJ.Enabled := (plFornecedor.Count = 0);
      EditCadastroNMFORNECEDOR.Enabled := (plFornecedor.Count = 0);
      ButtonLimparFornecedor.Enabled := (plFornecedor.Count > 0);
      ButtonNovoFornecedor.Enabled := (plFornecedor.Count = 0);

      // Valida para qual campo vai se posicionar.
      if pAtivarControle then
        if OfficePagerCentral.ActivePageIndex = 1 then
          if OfficePagerCadastroAquisicao.ActivePageIndex = 0 then
            if plFornecedor.Count > 0 then
            begin
              if EditCadastroNUNOTAFISCAL.Enabled then
                ActiveControl := EditCadastroNUNOTAFISCAL;
            end
            else
              if EditCadastroNUCNPJ.Enabled then
                ActiveControl := EditCadastroNUCNPJ;
    end;

    // Para que o evento volte a ser executado.
    EditCadastroCDFORNECEDOR.OnChange := EditCadastroCDFORNECEDORChange;
    EditCadastroCDFORNECEDOR.OnExit := EditCadastroCDFORNECEDORExit;
    EditCadastroNUCNPJ.OnExit := EditCadastroNUCNPJExit;
    EditCadastroNMFORNECEDOR.OnExit := EditCadastroNMFORNECEDORExit;
    EditCadastroNMFORNECEDOR.OnClickBtn := EditCadastroNMFORNECEDORClickBtn;
  except
    on E: exception do
      fmPrincipal.manipulaExcecoes(Sender,E);
  end;
end;

procedure TfmCadAquisicao.EditCadastroNUNOTAFISCALChange(Sender: TObject);
var
  vChar: char;
begin
  with EditCadastroNUNOTAFISCAL do
    if Length(Text) > 0 then
    begin
      OnChange := nil;
      vChar := Text[Length(Text)];
      // Verifica se o caractere digitado é válido.
      fmPrincipal.fnGeral.verificaNumeros(vChar,4);
      if vChar = #0 then
        Text := Copy(Text,1,Length(Text)-1);
      OnChange := EditCadastroNUNOTAFISCALChange;
      SelStart := Length(Text);
    end;
end;

procedure TfmCadAquisicao.EditCadastroCDMOTIVOURGENCIAChange(Sender: TObject);
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
      OnChange := EditCadastroCDMOTIVOURGENCIAChange;
      SelStart := Length(Text);
    end;
end;

procedure TfmCadAquisicao.EditCadastroCDMOTIVOURGENCIAExit(Sender: TObject);
var
  vQuery: TZQuery;
begin
  // Se não digitou nada, sai sem abrir a search.
  if Length(Trim(EditCadastroCDMOTIVOURGENCIA.Text)) = 0 then
    Exit;

  // Para que o evento não seja executado.
  EditCadastroCDMOTIVOURGENCIA.OnChange := nil;
  EditCadastroCDMOTIVOURGENCIA.OnExit := nil;
  EditCadastroDEMOTIVOURGENCIA.OnExit := nil;
  EditCadastroDEMOTIVOURGENCIA.OnClickBtn := nil;

  try
    vQuery := pMotivoUrgencia.filtro;
    with vQuery do
    begin
      SQL.Add('WHERE "NU-Código" = :CDMOTIVOURGENCIA');
      Params.ParamByName('CDMOTIVOURGENCIA').AsString := EditCadastroCDMOTIVOURGENCIA.Text;
      dmPrincipal.executaConsulta(vQuery);

      if not Eof then
      begin
        plMotivoUrgencia.Clear;
        plMotivoUrgencia.Add(Fields.Fields[0].AsString);
        EditCadastroCDMOTIVOURGENCIA.Text := Fields.Fields[0].AsString;
        EditCadastroDEMOTIVOURGENCIA.Text := Fields.Fields[1].AsString;
      end
      else
      begin
        plMotivoUrgencia.Clear;
        EditCadastroCDMOTIVOURGENCIA.Clear;
        EditCadastroDEMOTIVOURGENCIA.Clear;
        fmPrincipal.apresentaResultadoCadastro('Nenhum registro encontrado.');
      end;
      Active := false;
    end;
  finally
    FreeAndNil(vQuery);
    EditCadastroCDMOTIVOURGENCIA.Enabled := (plMotivoUrgencia.Count = 0);
    EditCadastroDEMOTIVOURGENCIA.Enabled := (plMotivoUrgencia.Count = 0);
    ButtonLimparMotivoUrgencia.Enabled := (plMotivoUrgencia.Count > 0);
    ButtonNovoMotivoUrgencia.Enabled := (plMotivoUrgencia.Count = 0);
    // Se este painel estiver visível é porque a aquisição foi encerrada ou cancelada.
    if pStatusAquisicao = 'C' then
    begin
      ButtonLimparMotivoUrgencia.Enabled := false;
      ButtonNovoMotivoUrgencia.Enabled := false;
    end;

    // Valida para qual campo vai se posicionar.
    if pAtivarControle then
      if OfficePagerCentral.ActivePageIndex = 1 then
        if OfficePagerCadastroAquisicao.ActivePageIndex = 0 then
          if plMotivoUrgencia.Count > 0 then
          begin
            if CheckBoxCadastroFLENTREGAPENDENTE.Enabled then
              ActiveControl := CheckBoxCadastroFLENTREGAPENDENTE;
          end
          else
            if EditCadastroCDMOTIVOURGENCIA.Enabled then
              ActiveControl := EditCadastroCDMOTIVOURGENCIA;
  end;

  // Para que o evento volte a ser executado.
  EditCadastroCDMOTIVOURGENCIA.OnChange := EditCadastroCDMOTIVOURGENCIAChange;
  EditCadastroCDMOTIVOURGENCIA.OnExit := EditCadastroCDMOTIVOURGENCIAExit;
  EditCadastroDEMOTIVOURGENCIA.OnExit := EditCadastroDEMOTIVOURGENCIAExit;
  EditCadastroDEMOTIVOURGENCIA.OnClickBtn := EditCadastroDEMOTIVOURGENCIAClickBtn;
end;

procedure TfmCadAquisicao.enviaEMail;
var
  vEmail, vMarcaModelo: string;
  vQuery,vQuery2: TZQuery;
  vQtdeTotalGeral: integer;
  vvlTotalGeral: currency;
begin
  try
    vQuery := pAquisicao.visao;
    with vQuery do
    begin
      SQL.Add('WHERE "Código" = :CDAQUISICAO');
      Params.Items[0].AsInteger := Codigo;
      dmPrincipal.executaConsulta(vQuery);

      if Eof then
        raise Exception.Create('Não foi possível consultar a Aquisição cadastrada.');

      // Formata o e-mail de confirmação da Aquisição.
      vEmail := '<div align="left">'+
                'E-mail de confirmação de Cadastro de Aquisição.<br><br>'+
                '<b>Tipo de Movimento:</b> '+ Fields.Fields[1].AsString +'<br>'+
                '<b>Aquisição:</b> '+ Fields.Fields[2].AsString +'<br>'+
                '<b>Data do Registro:</b> '+ Fields.Fields[3].AsString +'<br>'+
                '<b>Data de Aquisição:</b> '+ Fields.Fields[4].AsString +'<br>'+
                '<b>Usuário (Login):</b> '+ Fields.Fields[5].AsString +'<br>'+
                '<b>Descrição:</b> '+ Fields.Fields[6].AsString +'<br>';
      if not Fields.Fields[19].IsNull then
        vEmail := vEmail + '<b>Forma de Pagamento:</b> '+ Fields.Fields[19].AsString +'<br>';
      if not Fields.Fields[20].IsNull then
        vEmail := vEmail + '<b>Fornecedor:</b> '+ Fields.Fields[20].AsString +'<br>';
      if not Fields.Fields[21].IsNull then
        vEmail := vEmail + '<b>Nota Fiscal:</b> '+ Fields.Fields[21].AsString +'<br>';
      if Fields.Fields[8].AsString = 'Sim' then
      begin
        vEmail := vEmail + '<b>Observação:</b> Aquisição urgente.<br>'+
                           '<b>Motivo:</b> '+ Fields.Fields[9].AsString +'<br>';
      end;
      if Fields.Fields[10].AsString = 'Sim' then
      begin
        vEmail := vEmail + '<b>Ag. Entrega - Previsão:</b> '+ Fields.Fields[11].AsString +'<br>'+
                           '<b>Cód. de Rastreamento:</b> '+ Fields.Fields[12].AsString +'<br>';
      end;
    end;

    vEmail := vEmail +
              '</div>'+
              '<br>'+
              '<table width="100%" border="1" cellspacing="0" cellpadding="1">'+
              '  <tr>'+
              '    <td width="30" style="white-space:nowrap; text-align:left"><b>Item</b></td>'+
              '    <td width="80" style="white-space:nowrap; text-align:left"><b>Família</b></td>'+
              '    <td width="*" style="white-space:nowrap; text-align:left"><b>Material</b></td>'+
              '    <td width="40" style="white-space:nowrap; text-align:left"><b>Emb.</b></td>'+
              '    <td width="90" style="white-space:nowrap; text-align:left"><b>Marca/Modelo</b></td>'+
              '    <td width="40" style="white-space:nowrap; text-align:left"><b>Qtde.</b></td>'+
              '    <td width="70" style="white-space:nowrap; text-align:left"><b>Vl. Unit.</b></td>'+
              '    <td width="70" style="white-space:nowrap; text-align:left"><b>Vl. Garant.</b></td>'+
              '    <td width="80" style="white-space:nowrap; text-align:left"><b>Vl. Total</b></td>'+
              '  </tr>';

    // Preenche os Itens da Aquisição.
    vQuery2 := pAquisicao.visaoItem;
    with vQuery2 do
    begin
      SQL.Add('WHERE "Código" = :CDAQUISICAO');
      Params.Items[0].AsInteger := Codigo;
      SQL.Add('ORDER BY 2');
      dmPrincipal.executaConsulta(vQuery2);

      if Eof then
        raise Exception.Create('Não foi possível consultar os itens da aquisição cadastrada.');

      vQtdeTotalGeral := 0;
      vvlTotalGeral := 0;
      while not Eof do
      begin
        // Formata a Marca e Modelo.
        if not Fields.Fields[6].IsNull then
          vMarcaModelo := Fields.Fields[6].AsString + ' - ' + Fields.Fields[7].AsString
        else
          vMarcaModelo := EmptyStr;

        // Calcula os totais gerais.
        vQtdeTotalGeral := vQtdeTotalGeral + Fields.Fields[8].AsInteger;
        vvlTotalGeral := vvlTotalGeral + Fields.Fields[11].AsCurrency;

        vEmail := vEmail +
                '  <tr>'+
                '    <td width="30" style="white-space:nowrap; text-align:right">'+ Fields.Fields[1].AsString +'</td>'+
                '    <td width="80" style="white-space:nowrap; text-align:left">'+ Fields.Fields[3].AsString +'</td>'+
                '    <td width="*" style="white-space:nowrap; text-align:left">'+ Fields.Fields[4].AsString + ' ' + Fields.Fields[4].AsString+'</td>'+
                '    <td width="40" style="white-space:nowrap; text-align:left">'+ Fields.Fields[5].AsString +'</td>'+
                '    <td width="90" style="white-space:nowrap; text-align:left">'+ vMarcaModelo +'</td>'+
                '    <td width="40" style="white-space:nowrap; text-align:right">'+ Fields.Fields[8].AsString +'</td>'+
                '    <td width="70" style="white-space:nowrap; text-align:right">'+ FormatFloat('"R$ ",0.00',Fields.Fields[9].AsCurrency) +'</td>'+
                '    <td width="70" style="white-space:nowrap; text-align:right">'+ FormatFloat('"R$ ",0.00',Fields.Fields[10].AsCurrency) +'</td>'+
                '    <td width="80" style="white-space:nowrap; text-align:right">'+ FormatFloat('"R$ ",0.00',Fields.Fields[11].AsCurrency) +'</td>'+
                '  </tr>';
        Next;
      end;

      // Apresenta o valor total geral.
      First;
      if not Eof then
        vEmail := vEmail +
                '  <tr>'+
                '    <td colspan="8" width="*" style="white-space:nowrap; text-align:right"><b>Qtde Geral:</b> '+ IntToStr(vQtdeTotalGeral) +'</td>'+
                '    <td width="200" style="white-space:nowrap; text-align:right"><b>Total Geral:</b> '+ FormatFloat('"R$ ",0.00',vvlTotalGeral) +'</td>'+
                '  </tr>';
    end;

    vEmail := vEmail + '  </table>';

    try
      fmPrincipal.pLogSistema.Debug('Enviando e-mail.');
      fmPrincipal.enviaEmail('Cadastro de Aquisição',
                             fmPrincipal.EmailUsuarioLogado,
                             EmptyStr,
                             EmptyStr,
                             vEmail);
      fmPrincipal.pLogSistema.Debug('Concluído.');
    except
      on E: Exception do
        fmPrincipal.manipulaExcecoes(fmCadAquisicao,E);
    end;
  finally
    vQuery.Active := false;
    vQuery2.Active := false;
    FreeAndNil(vQuery);
    FreeAndNil(vQuery2);
  end;
end;

procedure TfmCadAquisicao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfmCadAquisicao.FormCreate(Sender: TObject);
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

    pAtivarControle := true;
    Codigo := 0;

    // Cria as listas.
    plUsuario := TStringList.Create;
    plTipoMovimento := TStringList.Create;
    plMotivoUrgencia := TStringList.Create;
    plFornecedor := TStringList.Create;
    plFormaPagamento := TStringList.Create;

    pMaterial := TMaterial.Create;
    pAquisicao := TAquisicao.Create;
    pUsuario := TUsuario.Create;
    pFornecedor := TFornecedor.Create;
    pMotivoUrgencia := TMotivoUrgencia.Create;
    pFormaPagamento := TFormaPagamento.Create;
    pTipoMovimento := TTipoMovimento.Create;

    OfficePagerCentral.ActivePageIndex := 1;

    Ordenacao := '|"Tipo de movimento":"S":"Asc."|;' +
                 '|"Aquisição":"S":"Asc."|;' +
                 '|"Usuário":"S":"Asc."|;' +
                 '|"Descrição":"N":"Asc."|;' +
                 '|"Data":"N":"Asc."|;' +
                 '|"Qtde.":"N":"Asc."|;' +
                 '|"Cancelado":"N":"Asc."|;' +
                 '|"Urgente":"N":"Asc."|;' +
                 '|"Parcelado":"N":"Asc."|;' +
                 '|"Pendente":"N":"Asc."|;' +
                 '|"Anexo":"N":"Asc."|;' +
                 '|"Visível":"N":"Asc."|;' +
                 '|"Código":"N":"Asc."|';

    ButtonExibirInvisiveis.Tag := 0;
    ButtonExibirCancelados.Tag := 0;

    // Obtém informações parametrizadas.
    with fmPrincipal.fnGeral do
    begin
      ButtonExibirCancelados.OnClick := nil;
      if fmPrincipal.ExibirAquisicoesCanceladas = true then
        ButtonExibirCancelados.Tag := 1;
      ButtonExibirCancelados.OnClick := ButtonExibirCanceladosClick;
    end;

    // Monta a consulta que carregará os dados da Grid.
    with QueryGeral do
    begin
      SQL := pAquisicao.grid.SQL;
      SQL.Add('WHERE (aquisicao.flcancelado = ''N'' OR aquisicao.flcancelado = :FLCANCELADO)');
      SQL.Add('  AND (aquisicao.flvisivel = ''S'' OR aquisicao.flvisivel = :FLVISIVEL)');
      // Filtra pelo Usuário, caso informado no Painel Principal.
      if fmPrincipal.FiltroLogin <> cNenhumFiltroLogin then
        SQL.Add('  AND aquisicao.nmlogin = ' + QuotedStr(fmPrincipal.FiltroLogin));
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

    for i := Self.ComponentCount -1 downto 0 do
      if (Self.Components[i] is TAdvOfficeCheckBox) then
        (Self.Components[i] as TAdvOfficeCheckBox).Themed := true;

    MenuItemAtualizarTabelaClick(Sender);

    carregaImagensBotoes;
    carregaImageLists;

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

procedure TfmCadAquisicao.FormDestroy(Sender: TObject);
begin
  FreeAndNil(plUsuario);
  FreeAndNil(plTipoMovimento);
  FreeAndNil(plMotivoUrgencia);
  FreeAndNil(plFornecedor);
  FreeAndNil(plFormaPagamento);
  FreeAndNil(pMaterial);
  FreeAndNil(pAquisicao);
  FreeAndNil(pUsuario);
  FreeAndNil(pFornecedor);
  FreeAndNil(pMotivoUrgencia);
  FreeAndNil(pFormaPagamento);
  FreeAndNil(pTipoMovimento);
end;

procedure TfmCadAquisicao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Exit;
end;

procedure TfmCadAquisicao.FormResize(Sender: TObject);
begin
  EspacamentoInicial := fmPrincipal.EspacamentoInicialBotao;
  EspacamentoFinal := fmPrincipal.EspacamentoFinalBotao;
  EspacamentoEntre := fmPrincipal.EspacamentoEntreBotoes;

  BitBtnFechar.Left := PanelBotoes.Width - BitBtnFechar.Width - EspacamentoFinal;
  BitBtnInserirDocumento.Left := BitBtnFechar.Left - BitBtnInserirDocumento.Width - EspacamentoEntre;
  BitBtnParcelas.Left := BitBtnInserirDocumento.Left - BitBtnParcelas.Width - EspacamentoEntre;
  BitBtnCancelarAquisicao.Left := BitBtnParcelas.Left - BitBtnCancelarAquisicao.Width - EspacamentoEntre;
  BitBtnNovo.Left := BitBtnCancelarAquisicao.Left - BitBtnNovo.Width - EspacamentoEntre;
  BitBtnRestaurar.Left := BitBtnNovo.Left - BitBtnRestaurar.Width - EspacamentoEntre;
  BitBtnSalvar.Left := BitBtnRestaurar.Left - BitBtnSalvar.Width - EspacamentoEntre;

  ButtonAdicionarMaterial.Left := PanelBotoesMaterial.Width - ButtonAdicionarMaterial.Width - EspacamentoFinal;
end;

procedure TfmCadAquisicao.habilitaBotoes;
begin
  BitBtnSalvar.Enabled := true;
  BitBtnRestaurar.Enabled := true;
  BitBtnNovo.Enabled := true;
  BitBtnCancelarAquisicao.Enabled := true;
  if (Opcao = 'A') and (CheckBoxCadastroFLPARCELADO.Checked = true) then
    BitBtnParcelas.Enabled := true;
  BitBtnInserirDocumento.Enabled := true;
end;

procedure TfmCadAquisicao.habilitaTudo;
begin
  // Eventos.
  EditCadastroCDTIPOMOVIMENTO.OnExit := EditCadastroCDTIPOMOVIMENTOExit;
  EditCadastroDETIPOMOVIMENTO.OnExit := EditCadastroDETIPOMOVIMENTOExit;
  EditCadastroCDMOTIVOURGENCIA.OnExit := EditCadastroCDMOTIVOURGENCIAExit;
  EditCadastroDEMOTIVOURGENCIA.OnExit := EditCadastroDEMOTIVOURGENCIAExit;
  EditCadastroNUANOAQUISICAO.OnExit := EditCadastroNUANOAQUISICAOExit;
  EditCadastroNMFORMAPAGAMENTO.OnExit := EditCadastroNMFORMAPAGAMENTOExit;
  EditCadastroNMFORNECEDOR.OnExit := EditCadastroNMFORNECEDORExit;
  EditCadastroNMUSUARIO.OnExit := EditCadastroNMUSUARIOExit;
  EditCadastroCDFORNECEDOR.OnExit := EditCadastroCDFORNECEDORExit;
  EditCadastroCDUSUARIO.OnExit := EditCadastroCDUSUARIOExit;
  EditCadastroNMLOGIN.OnExit := EditCadastroNMLOGINExit;
  EditCadastroCDFORMAPAGAMENTO.OnExit := EditCadastroCDFORMAPAGAMENTOExit;
  EditCadastroNUCNPJ.OnChange := EditCadastroNUCNPJChange;
  EditCadastroNUCNPJ.OnExit := EditCadastroNUCNPJExit;
  EditCadastroNUNOTAFISCAL.OnChange := EditCadastroNUNOTAFISCALChange;
  ColumnGridItens.OnClickCell := ColumnGridItensClickCell;

  // Componentes.
  BitBtnSalvar.Enabled := true;
  BitBtnNovo.Enabled := true;
  BitBtnCancelarAquisicao.Enabled := true;
  BitBtnRestaurar.Enabled := true;
  EditCadastroNUANOAQUISICAO.Enabled := true;
  CheckBoxCadastroFLPARCELADO.Enabled := true;
  ButtonLimparUsuario.Enabled := true;
  ButtonNovoFornecedor.Enabled := true;
  EditCadastroCDUSUARIO.Enabled := true;
  EditCadastroNMLOGIN.Enabled := true;
  EditCadastroNMUSUARIO.Enabled := true;
  if (Opcao = 'A') and (CheckBoxCadastroFLPARCELADO.Checked = true) then
    BitBtnParcelas.Enabled := true;
  BitBtnInserirDocumento.Enabled := true;
  MemoCadastroDEOBSERVACOES.Enabled := true;
  EditCadastroCDTIPOMOVIMENTO.Enabled := true;
  EditCadastroDETIPOMOVIMENTO.Enabled := true;
  ButtonLimparTipoMovimento.Enabled := true;
  ButtonNovoTipoMovimento.Enabled := true;
  EditCadastroCDMOTIVOURGENCIA.Enabled := true;
  EditCadastroDEMOTIVOURGENCIA.Enabled := true;
  ButtonLimparMotivoUrgencia.Enabled := true;
  ButtonNovoMotivoUrgencia.Enabled := true;
  DatePickerEditCadastroDTAQUISICAO.Enabled := true;
  //DatePickerEditCadastroDTREGISTRO.ReadOnly := false;
  EditCadastroDEAQUISICAO.Enabled := true;
  //DatePickerEditCadastroDTULTATUALIZACAO.ReadOnly := false;
  EditCadastroCDFORNECEDOR.Enabled := true;
  EditCadastroNMFORNECEDOR.Enabled := true;
  ButtonLimparFornecedor.Enabled := true;
  EditCadastroCDFORMAPAGAMENTO.Enabled := true;
  EditCadastroNMFORMAPAGAMENTO.Enabled := true;
  ButtonLimparFormaPagamento.Enabled := true;
  ButtonNovoFormaPagamento.Enabled := true;
  CheckBoxCadastroFLURGENTE.Enabled := true;
  CheckBoxCadastroFLENTREGAPENDENTE.Enabled := true;
  EditCadastroCDRASTREAMENTO.Enabled := true;
  DatePickerEditCadastroDTPREVISAOENTREGA.Enabled := true;
  DatePickerEditCadastroDTENTREGA.Enabled := true;
  ButtonAdicionarMaterial.Enabled := true;
  EditCadastroNUCNPJ.Enabled := true;
  EditCadastroNUNOTAFISCAL.Enabled := true;
end;

procedure TfmCadAquisicao.ButtonLimparUsuarioClick(Sender: TObject);
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

procedure TfmCadAquisicao.ButtonLimparFormaPagamentoClick(Sender: TObject);
begin
  plFormaPagamento.Clear;

  EditCadastroCDFORMAPAGAMENTO.Clear;
  EditCadastroNMFORMAPAGAMENTO.Clear;

  EditCadastroCDFORMAPAGAMENTO.Enabled := true;
  EditCadastroNMFORMAPAGAMENTO.Enabled := true;
  ButtonLimparFormaPagamento.Enabled := false;
  ButtonNovoFormaPagamento.Enabled := true;
end;

procedure TfmCadAquisicao.ButtonLimparFornecedorClick(Sender: TObject);
begin
  plFornecedor.Clear;

  EditCadastroCDFORNECEDOR.Clear;
  EditCadastroNUCNPJ.Clear;
  EditCadastroNMFORNECEDOR.Clear;

  EditCadastroCDFORNECEDOR.Enabled := true;
  EditCadastroNUCNPJ.Enabled := true;
  EditCadastroNMFORNECEDOR.Enabled := true;
  ButtonLimparFornecedor.Enabled := false;
  ButtonNovoFornecedor.Enabled := true;
end;

procedure TfmCadAquisicao.ButtonLimparTipoMovimentoClick(Sender: TObject);
begin
  plTipoMovimento.Clear;

  EditCadastroCDTIPOMOVIMENTO.Clear;
  EditCadastroDETIPOMOVIMENTO.Clear;

  EditCadastroCDTIPOMOVIMENTO.Enabled := true;
  EditCadastroDETIPOMOVIMENTO.Enabled := true;
  ButtonLimparTipoMovimento.Enabled := false;
  ButtonNovoTipoMovimento.Enabled := true;

  // Habilita os campos bloqueados por causa do tipo de movimento igual a presente.
  EditCadastroCDFORMAPAGAMENTO.Enabled := true;
  EditCadastroNMFORMAPAGAMENTO.Enabled := true;
  ButtonNovoFormaPagamento.Enabled := true;
  CheckBoxCadastroFLPARCELADO.Enabled := true;
  CheckBoxCadastroFLURGENTE.Enabled := true;
  CheckBoxCadastroFLENTREGAPENDENTE.Enabled := true;
end;

procedure TfmCadAquisicao.ButtonLimparMotivoUrgenciaClick(Sender: TObject);
begin
  plMotivoUrgencia.Clear;

  EditCadastroCDMOTIVOURGENCIA.Clear;
  EditCadastroDEMOTIVOURGENCIA.Clear;

  EditCadastroCDMOTIVOURGENCIA.Enabled := true;
  EditCadastroDEMOTIVOURGENCIA.Enabled := true;
  ButtonLimparMotivoUrgencia.Enabled := false;
  ButtonNovoMotivoUrgencia.Enabled := true;
end;

procedure TfmCadAquisicao.ButtonNovoFormaPagamentoClick(Sender: TObject);
var
  vcdFormaPagamento: integer;
begin
  fmPrincipal.pLogSistema.Info('>> Carregando a tela de Cadastro de Forma de Pagamento.');
  vcdFormaPagamento := 0;
  try
    fmCadFormaPagamento := TfmCadFormaPagamento.Create(Self);
    with fmCadFormaPagamento do
    begin
      try
        Tag := 1;
        ShowModal;

        vcdFormaPagamento := fmCadFormaPagamento.Codigo;
      except
        on E: exception do
          raise exception.Create('Não foi possível abrir a tela de Cadastro de Forma de Pagamento.'+#13#10+E.Message);
      end;
    end;
  finally
    // Verifica se foi cadastrada uma forma de pagamento.
    if vcdFormaPagamento > 0 then
    begin
      if pAtivarControle then
        if OfficePagerCentral.ActivePageIndex = 1 then
          if OfficePagerCadastroAquisicao.ActivePageIndex = 0 then
            if CheckBoxCadastroFLURGENTE.Enabled then
              ActiveControl := CheckBoxCadastroFLURGENTE;
      EditCadastroCDFORMAPAGAMENTO.Text := IntToStr(vcdFormaPagamento);
      EditCadastroCDFORMAPAGAMENTOExit(EditCadastroCDFORMAPAGAMENTO);
      ButtonLimparFormaPagamento.Enabled := true;
      ButtonNovoFormaPagamento.Enabled := false;
    end;
  end;
  fmPrincipal.pLogSistema.Info('>> Tela de Cadastro de Forma de Pagamento carregada com sucesso.');
end;

procedure TfmCadAquisicao.ButtonNovoFornecedorClick(Sender: TObject);
var
  vcdFornecedor: integer;
begin
  fmPrincipal.pLogSistema.Info('>> Carregando a tela de Cadastro de Fornecedor.');
  vcdFornecedor := 0;
  try
    fmCadFornecedor := TfmCadFornecedor.Create(Self);
    with fmCadFornecedor do
    begin
      try
        Tag := 1;
        ShowModal;

        vcdFornecedor := fmCadFornecedor.Codigo;
      except
        on E: exception do
          raise exception.Create('Não foi possível abrir a tela de Cadastro de Fornecedor.'+#13#10+E.Message);
      end;
    end;
  finally
    // Verifica se foi cadastrada um fornecedor.
    if vcdFornecedor > 0 then
    begin
      if pAtivarControle then
        if OfficePagerCentral.ActivePageIndex = 1 then
          if OfficePagerCadastroAquisicao.ActivePageIndex = 0 then
            if EditCadastroNUNOTAFISCAL.Enabled then
              ActiveControl := EditCadastroNUNOTAFISCAL;
      EditCadastroCDFORNECEDOR.Text := IntToStr(vcdFornecedor);
      EditCadastroCDFORNECEDORExit(EditCadastroCDFORNECEDOR);
      ButtonLimparFornecedor.Enabled := true;
      ButtonNovoFornecedor.Enabled := false;
    end;
  end;
  fmPrincipal.pLogSistema.Info('>> Tela de Cadastro de Fornecedor carregada com sucesso.');
end;

procedure TfmCadAquisicao.ButtonNovoTipoMovimentoClick(Sender: TObject);
var
  vcdTipoDespesa: integer;
begin
  fmPrincipal.pLogSistema.Info('>> Carregando a tela de Cadastro de Tipo de Movimento.');
  vcdTipoDespesa := 0;
  try
    fmCadTipoMovimento := TfmCadTipoMovimento.Create(Self);
    with fmCadTipoMovimento do
    begin
      try
        Tag := 1;
        NaturezaPadrao := 'A';
        ShowModal;

        vcdTipoDespesa := fmCadTipoMovimento.Codigo;
      except
        on E: exception do
          raise exception.Create('Não foi possível abrir a tela de Cadastro de Tipo de Movimento.'+#13#10+E.Message);
      end;
    end;
  finally
    // Verifica se foi cadastrada um tipo de despesa.
    if vcdTipoDespesa > 0 then
    begin
      if pAtivarControle then
        if OfficePagerCentral.ActivePageIndex = 1 then
          if OfficePagerCadastroAquisicao.ActivePageIndex = 0 then
            if EditCadastroCDTIPOMOVIMENTO.Enabled then
              ActiveControl := EditCadastroCDTIPOMOVIMENTO;
      EditCadastroCDTIPOMOVIMENTO.Text := IntToStr(vcdTipoDespesa);
      EditCadastroCDTIPOMOVIMENTOExit(EditCadastroCDTIPOMOVIMENTO);
      ButtonLimparTipoMovimento.Enabled := true;
      ButtonNovoTipoMovimento.Enabled := false;
    end;
  end;
  fmPrincipal.pLogSistema.Info('>> Tela de Cadastro de Tipo de Movimento carregada com sucesso.');
end;

procedure TfmCadAquisicao.BitBtnParcelasClick(Sender: TObject);
var
  vcdAquisicao: integer;
  vvlAquisicao, vvlTaxaExtra: currency;
  vvlTaxaJuros: double;
begin
  vcdAquisicao := Codigo;
  vvlAquisicao := ColumnGridItens.ColumnSum(13,1,ColumnGridItens.RowCount -1);
  vvlTaxaExtra := EditCadastroVLTAXAEXTRA.Value;
  vvlTaxaJuros := EditCadastroVLTAXAJUROS.Value;
  fmCadAquisicaoParcela := TfmCadAquisicaoParcela.Create(Self);
  fmCadAquisicaoParcela.Caption := Caption + ' :: ' + fmCadAquisicaoParcela.Caption;
  with fmCadAquisicaoParcela do
  begin
    try
      consultaParcelasAquisicao(vcdAquisicao,vvlAquisicao,vvlTaxaExtra,vvlTaxaJuros,false);
      ShowModal;
    except
      on E: exception do
        raise exception.Create('Não foi possível abrir a tela de Cadastro de Parcelas.'+#13#10+E.Message);
    end;
  end;
end;

procedure TfmCadAquisicao.ButtonNovoMotivoUrgenciaClick(Sender: TObject);
var
  vcdMotivoUrgencia: integer;
begin
  fmPrincipal.pLogSistema.Info('>> Carregando a tela de Cadastro de Motivo de Urgência.');
  vcdMotivoUrgencia := 0;
  try
    fmCadMotivoUrgencia := TfmCadMotivoUrgencia.Create(Self);
    with fmCadMotivoUrgencia do
    begin
      try
        Tag := 1;
        ShowModal;

        vcdMotivoUrgencia := fmCadMotivoUrgencia.Codigo;
      except
        on E: exception do
          raise exception.Create('Não foi possível abrir a tela de Cadastro de Motivo de Urgência.'+#13#10+E.Message);
      end;
    end;
  finally
    // Verifica se foi cadastrada um motivo de urgência.
    if vcdMotivoUrgencia > 0 then
    begin
      if pAtivarControle then
        if OfficePagerCentral.ActivePageIndex = 1 then
          if OfficePagerCadastroAquisicao.ActivePageIndex = 0 then
            if CheckBoxCadastroFLENTREGAPENDENTE.Enabled then
              ActiveControl := CheckBoxCadastroFLENTREGAPENDENTE;
      EditCadastroCDMOTIVOURGENCIA.Text := IntToStr(vcdMotivoUrgencia);
      EditCadastroCDMOTIVOURGENCIAExit(EditCadastroCDMOTIVOURGENCIA);
      ButtonLimparMotivoUrgencia.Enabled := true;
      ButtonNovoMotivoUrgencia.Enabled := false;
    end;
  end;
  fmPrincipal.pLogSistema.Info('>> Tela de Cadastro de Motivo de Urgência carregada com sucesso.');
end;

procedure TfmCadAquisicao.MenuItemAtualizarTabelaClick(Sender: TObject);
var
  vOrdenacao: string;
begin
  try
    try
      Screen.Cursor := crSQLWait;

      vOrdenacao := fmPrincipal.fnGeral.obtemOrdenacaoFormatada(Ordenacao);
      if vOrdenacao <> EmptyStr then
        QueryGeral.SQL.Strings[QueryGeral.SQL.Count-1] := vOrdenacao;
      if fmPrincipal.ExibirAquisicoesCanceladas = true then
        QueryGeral.Params.ParamByName('FLCANCELADO').AsString := 'S'
      else
        QueryGeral.Params.ParamByName('FLCANCELADO').AsString := 'N';
      if ButtonExibirInvisiveis.Tag = 0 then
        QueryGeral.Params.ParamByName('FLVISIVEL').AsString := 'S'
      else
        QueryGeral.Params.ParamByName('FLVISIVEL').AsString := 'N';
      dmPrincipal.executaConsulta(QueryGeral);

      // Configura a Grid.
      editaColunaGrid(1,'CDTIPOMOVIMENTO','Tipo de movimento',edNone,Classes.taLeftJustify,200,true);
      editaColunaGrid(2,'AQUISICAO','Aquisição',edNone,Classes.taLeftJustify,55,true);
      editaColunaGrid(3,'NMLOGIN','Usuário',edNone,Classes.taLeftJustify,120,true);
      editaColunaGrid(4,'DEAQUISICAO','Descrição',edNone,Classes.taLeftJustify,200,true);
      editaColunaGrid(5,'DTAQUISICAO','Data',edNone,Classes.taLeftJustify,70,true);
      editaColunaGrid(6,'QTMATERIAL','Qtde.',edNone,Classes.taRightJustify,40,true);
      editaColunaGrid(7,'FLCANCELADO','Canc.',edCheckBox,Classes.taCenter,35,true);
      editaColunaGrid(8,'FLURGENTE','Urg.',edCheckBox,Classes.taCenter,30,true);
      editaColunaGrid(9,'FLPARCELADO','Parc.',edCheckBox,Classes.taCenter,35,true);
      editaColunaGrid(10,'FLENTREGAPENDENTE','Pend.',edCheckBox,Classes.taCenter,35,true);
      editaColunaGrid(11,'FLANEXO','Anexo',edCheckBox,Classes.taCenter,40,true);
      editaColunaGrid(12,'FLVISIVEL','Visível',edCheckBox,Classes.taCenter,40,true);
      editaColunaGrid(13,'CDAQUISICAO','Código',edNone,Classes.taRightJustify,40,true);

      LabelTotalRegistros.Caption := 'Total de registros: ' + IntToStr(QueryGeral.RecordCount);
      DBAdvGridGeral.HideColumn(13);
      DBAdvGridGeral.AutoSizeColumns(true);
    except
      on E: Exception do
        fmPrincipal.manipulaExcecoes(Sender,E);
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfmCadAquisicao.MenuItemEditarRegistroClick(Sender: TObject);
begin
  Opcao := 'A';
  pAtivarControle := false;

  with DBAdvGridGeral do
  begin
    Codigo := ColumnByName['CDAQUISICAO'].Ints[Row];
    pAquisicao.Codigo := Codigo;
    // Guarda a informação se é parcelado.
    GetCheckBoxState(9,Row,pflParcelado);
  end;

  editaCadastro;
  // Se estiver cancelada, não habilita.
  if pStatusAquisicao <> 'C' then
    habilitaBotoes;

  pAtivarControle := true;

  if EditCadastroDEAQUISICAO.Enabled then
    ActiveControl := EditCadastroDEAQUISICAO
  else
    if BitBtnNovo.Enabled then
      ActiveControl := BitBtnNovo;
end;

procedure TfmCadAquisicao.MenuItemVisualizarFiltroClick(Sender: TObject);
begin
  GridFindDialogColumnGrid.Execute;
end;

procedure TfmCadAquisicao.novoCadastro;
begin
  habilitaTudo;
  PanelStatusCadastro.Visible := false;
  OfficePagerCentral.ActivePageIndex := 1;
  OfficePagerCadastroAquisicao.ActivePageIndex := 0;

  limpaCamposAquisicao;
  limpaGrid;

  // Preenche os dados do usuário.
  EditCadastroCDUSUARIO.Text := IntToStr(fmPrincipal.CodigoUsuarioLogado);
  EditCadastroCDUSUARIOExit(EditCadastroCDUSUARIO);

  EditCadastroNUANOAQUISICAO.Text := FormatDateTime('yyyy',Date());
  DatePickerEditCadastroDTCADASTRO.Date := Date();
  DatePickerEditCadastroDTAQUISICAO.Date := Date();
  DatePickerEditCadastroDTCADASTRO.Clear;
  DatePickerEditCadastroDTULTATUALIZACAO.Clear;
  DatePickerEditCadastroDTPREVISAOENTREGA.Clear;

  BitBtnCancelarAquisicao.Enabled := false;
  BitBtnParcelas.Enabled := false;
  BitBtnInserirDocumento.Enabled := false;
  BitBtnNovo.Enabled := false;

  EditCadastroCDTIPOMOVIMENTO.OnExit := EditCadastroCDTIPOMOVIMENTOExit;
  EditCadastroDETIPOMOVIMENTO.OnExit := EditCadastroDETIPOMOVIMENTOExit;
  EditCadastroDETIPOMOVIMENTO.OnClickBtn := EditCadastroDETIPOMOVIMENTOClickBtn;

  SpinEditNumeroParcelas.Enabled := false;
  SpinEditNumeroParcelas.MinValue := fmPrincipal.NumeroMinimoParcelas;
  SpinEditNumeroParcelas.Value := SpinEditNumeroParcelas.MinValue;
  EditCadastroVLENTRADAPARCELA.Value := 0;
  EditCadastroVLTAXAJUROS.Value := 0;
  EditCadastroVLTAXAEXTRA.Value := 0;
  EditCadastroVLENTRADAPARCELA.Enabled := false;
  EditCadastroVLTAXAJUROS.Enabled := false;
  EditCadastroVLTAXAEXTRA.Enabled := false;
  EditCadastroCDRASTREAMENTO.Enabled := false;
  DatePickerEditCadastroDTENTREGA.Enabled := false;
  DatePickerEditCadastroDTPREVISAOENTREGA.Enabled := false;
  ButtonAdicionarMaterial.Enabled := true;
  ColumnGridItens.Enabled := true;

  if EditCadastroCDTIPOMOVIMENTO.Enabled then
  begin
    if EditCadastroCDTIPOMOVIMENTO.Enabled then
      ActiveControl := EditCadastroDEAQUISICAO;
  end
  else
    if EditCadastroCDTIPOMOVIMENTO.Enabled then
      ActiveControl := EditCadastroCDTIPOMOVIMENTO;
end;

procedure TfmCadAquisicao.obtemMarcaModelo(prmcdMarcaModelo: string;
  var prmcdMarca, prmcdModelo: integer);
var
  vAux: TStringList;
begin
  fmPrincipal.pLogSistema.Info('>> Obtem a Marca/Modelo.');
  if prmcdMarcaModelo = EmptyStr then
  begin
    prmcdMarca := 0;
    prmcdModelo := 0;
    Exit;
  end;

  try
    vAux := TStringList.Create;
    vAux.Delimiter := ';';
    vAux.DelimitedText := prmcdMarcaModelo;
    prmcdMarca := StrToInt(vAux[0]);
    prmcdModelo := StrToInt(vAux[1]);
  finally
    FreeAndNil(vAux);
  end;
end;

procedure TfmCadAquisicao.OfficePageCadastroAquisicaoShow(Sender: TObject);
begin
  if EditCadastroCDTIPOMOVIMENTO.Enabled then
  begin
    if EditCadastroDEAQUISICAO.Enabled then
      ActiveControl := EditCadastroDEAQUISICAO;
  end
  else
    if EditCadastroCDTIPOMOVIMENTO.Enabled then
      ActiveControl := EditCadastroCDTIPOMOVIMENTO;
end;

procedure TfmCadAquisicao.SpinEditNumeroParcelasChange(Sender: TObject);
begin
  EditCadastroVLENTRADAPARCELA.Enabled := (SpinEditNumeroParcelas.Value >= 2);
  if SpinEditNumeroParcelas.Value < 2 then
    EditCadastroVLENTRADAPARCELA.Value := 0;
end;

procedure TfmCadAquisicao.ButtonAdicionarMaterialClick(Sender: TObject);
var
  vvlTotal: currency;
begin
  fmPrincipal.pLogSistema.Info('>> Carregando a tela de Item da Aquisição.');
  fmAquisicaoItem := TfmAquisicaoItem.Create(Self);
  with fmAquisicaoItem do
  begin
    StatusAquisicao := pStatusAquisicao;
    AtivarControle := true;
    StatusAquisicaoItem := 'I';

    // Passa os dados para tela.
    nuItem := 1;
    with ColumnGridItens do
      if ColumnByName['NUITEM'].Rows[RowCount-1] <> EmptyStr then
        nuItem := RowCount;
    cdFamilia := EmptyStr;
    cdMaterial := EmptyStr;
    deMaterial := EmptyStr;
    cdMarcaModelo := EmptyStr;
    nmMarcaModelo := EmptyStr;
    cdEmbalagem := 0;
    nmEmbalagem := EmptyStr;
    qtEquivalencia := 0;
    qtMaterial := 1;
    vlUnitario := 0;
    vlGarantia := 0;
    dtGarantia := 0;
    flGarantiaAtiva := 'N';

    preencheCampos;
    ShowModal;

    // Valida se acionou o botão Aplicar.
    if StatusAquisicaoItem = 'A' then
    begin
      with ColumnGridItens do
      begin
        BeginUpdate;
        if ColumnByName['NUITEM'].Rows[RowCount-1] <> EmptyStr then
          AddRow;
        Row := RowCount -1;

        ColumnByName['NUITEM'].Ints[Row] := nuItem;
        ColumnByName['CDFAMILIA'].Rows[Row] := cdFamilia;
        ColumnByName['CDMATERIAL'].Rows[Row] := AnsiRightStr(cdMaterial,3);
        ColumnByName['CDMATERIALF'].Rows[Row] := cdMaterial;
        ColumnByName['DEMATERIAL'].Rows[Row] := deMaterial;
        ColumnByName['CDMARCAMODELO'].Rows[Row] := cdMarcaModelo;
        ColumnByName['NMMARCAMODELO'].Rows[Row] := nmMarcaModelo;
        ColumnByName['CDEMBALAGEM'].Ints[Row] := cdEmbalagem;
        ColumnByName['NMEMBALAGEM'].Rows[Row] := nmEmbalagem;
        ColumnByName['QTEQUIVALENCIA'].Ints[Row] := qtEquivalencia;
        ColumnByName['QTMATERIAL'].Ints[Row] := qtMaterial;
        ColumnByName['VLUNITARIO'].Floats[Row] := vlUnitario;
        ColumnByName['VLGARANTIA'].Floats[Row] := vlGarantia;
        vvlTotal := (qtMaterial * vlUnitario) + (qtMaterial * vlGarantia);
        ColumnByName['VLTOTAL'].Floats[Row] := vvlTotal;
        if dtGarantia > -1 then
          ColumnByName['DTGARANTIA'].Dates[Row] := dtGarantia
        else
          ColumnByName['DTGARANTIA'].Rows[Row] := EmptyStr;
        ColumnByName['EXCLUIDO'].Ints[Row] := 0;
        ColumnByName['FLGARANTIAATIVA'].Rows[Row] := flGarantiaAtiva;
        if pStatusAquisicao <> 'C' then
        begin
          AddImageIdx(11,Row,0,haCenter,vaCenter);
          AddImageIdx(12,Row,1,haCenter,vaCenter);
        end;
        EndUpdate;
      end;

      // Atualiza o somatório.
      atualizaSomatorioGrid;
    end;
  end;
  fmPrincipal.pLogSistema.Info('>> Tela de Item da Aquisição carregada com sucesso.');
end;

procedure TfmCadAquisicao.ButtonExibirCanceladosClick(Sender: TObject);
begin
  // 19 = Imagem de desativado.
  if ButtonExibirCancelados.Tag = 0 then
  begin
    ButtonExibirCancelados.Tag := 1;
    fmPrincipal.ExibirAquisicoesCanceladas := true;
    ButtonExibirCancelados.Picture.LoadFromFile(fmPrincipal.LocalIcones + 'cancel-e-16.png');
    ButtonExibirCancelados.HotPicture.LoadFromFile(fmPrincipal.LocalIcones + 'cancel-h-16.png');
    ButtonExibirCancelados.DisabledPicture.LoadFromFile(fmPrincipal.LocalIcones + 'cancel-d-16.png');
  end
  else
  begin
    ButtonExibirCancelados.Tag := 0;
    fmPrincipal.ExibirAquisicoesCanceladas := false;
    ButtonExibirCancelados.Picture.LoadFromFile(fmPrincipal.LocalIcones + 'cancel-green-16.png');
    ButtonExibirCancelados.HotPicture.LoadFromFile(fmPrincipal.LocalIcones + 'cancel-green2-16.png');
    ButtonExibirCancelados.DisabledPicture.LoadFromFile(fmPrincipal.LocalIcones + 'cancel-d-16.png');
  end;
  MenuItemAtualizarTabelaClick(Sender);
end;

procedure TfmCadAquisicao.ButtonExibirInvisiveisClick(Sender: TObject);
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

procedure TfmCadAquisicao.ButtonExportarHTMLClick(Sender: TObject);
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

procedure TfmCadAquisicao.ButtonExportarPlanilhaClick(Sender: TObject);
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

procedure TfmCadAquisicao.ButtonImprimirRelatorioClick(Sender: TObject);
var
  vAux: string;
begin
  try
    QueryRelAquisicao.SQL := pAquisicao.relatorio.SQL;
    // Filtra pelo Usuário, caso informado no Painel Principal.
    if fmPrincipal.FiltroLogin <> cNenhumFiltroLogin then
      vAux := fmPrincipal.FiltroLogin
    else
      vAux := '%';
    QueryRelAquisicao.Params.ParamByName('NMLOGIN').AsString := vAux;
    dmPrincipal.executaConsulta(QueryRelAquisicao);

    with fmPrincipal.SystemRelatorio do
    begin
      DefaultDest := rdPreview;
      SystemSetups := SystemSetups - [ssAllowSetup];
      DoNativeOutput := false;
    end;
    with ProjectRelAquisicao do
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

procedure TfmCadAquisicao.ButtonOrdenarRegistrosClick(Sender: TObject);
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

procedure TfmCadAquisicao.carregaImageLists;
begin
  OfficePagerCentral.Images := fmPrincipal.ImageListE;
  OfficePagerCentral.DisabledImages := fmPrincipal.ImageListD;
  OfficePageConsulta.ImageIndex := 2;
  OfficePageCadastro.ImageIndex := 1;
  OfficePagerCadastroAquisicao.Images := fmPrincipal.ImageListE;
  OfficePagerCadastroAquisicao.DisabledImages := fmPrincipal.ImageListD;
  OfficePageCadastroAquisicao.ImageIndex := 3;
  OfficePageCadastroAquisicaoItem.ImageIndex := 4;

  fmPrincipal.fnGeral.insereImageList(ImageList,fmPrincipal.LocalIcones + 'edit-e-16.png');
  fmPrincipal.fnGeral.insereImageList(ImageList,fmPrincipal.LocalIcones + 'cancel-e-16.png');
  fmPrincipal.fnGeral.insereImageList(ImageList,fmPrincipal.LocalIcones + 'edit-d-16.png');
  fmPrincipal.fnGeral.insereImageList(ImageList,fmPrincipal.LocalIcones + 'cancel-d-16.png');
  ColumnGridItens.GridImages := ImageList;

end;

procedure TfmCadAquisicao.carregaImagensBotoes;
begin
    EditCadastroDETIPOMOVIMENTO.Button.Glyph.Assign(fmPrincipal.fnGeral.obtemImagemPesquisa);
    EditCadastroNMUSUARIO.Button.Glyph.Assign(fmPrincipal.fnGeral.obtemImagemPesquisa);
    EditCadastroNMFORNECEDOR.Button.Glyph.Assign(fmPrincipal.fnGeral.obtemImagemPesquisa);
    EditCadastroNMFORMAPAGAMENTO.Button.Glyph.Assign(fmPrincipal.fnGeral.obtemImagemPesquisa);
    EditCadastroDEMOTIVOURGENCIA.Button.Glyph.Assign(fmPrincipal.fnGeral.obtemImagemPesquisa);
    EditCadastroVLENTRADAPARCELA.Button.Flat := true;
    EditCadastroVLTAXAEXTRA.Button.Flat := true;
    EditCadastroVLTAXAJUROS.Button.Flat := true;
    EditCadastroVLENTRADAPARCELA.Button.Glyph.Assign(fmPrincipal.fnGeral.obtemImagemCalculadora);
    EditCadastroVLTAXAJUROS.Button.Glyph.Assign(fmPrincipal.fnGeral.obtemImagemCalculadora);
    EditCadastroVLTAXAEXTRA.Button.Glyph.Assign(fmPrincipal.fnGeral.obtemImagemCalculadora);

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
    ButtonExibirCancelados.Picture.LoadFromFile(fmPrincipal.LocalIcones + 'cancel-e-16.png');
    ButtonExibirCancelados.HotPicture.LoadFromFile(fmPrincipal.LocalIcones + 'cancel-h-16.png');
    ButtonExibirCancelados.DisabledPicture.LoadFromFile(fmPrincipal.LocalIcones + 'cancel-d-16.png');
    ButtonExibirInvisiveis.Picture.LoadFromFile(fmPrincipal.LocalIcones + 'invisible-e-16.png');
    ButtonExibirInvisiveis.HotPicture.LoadFromFile(fmPrincipal.LocalIcones + 'invisible-h-16.png');
    ButtonExibirInvisiveis.DisabledPicture.LoadFromFile(fmPrincipal.LocalIcones + 'invisible-d-16.png');

    ButtonLimparTipoMovimento.Picture.LoadFromFile(fmPrincipal.LocalIcones + 'erase-e-16.png');
    ButtonLimparTipoMovimento.HotPicture.LoadFromFile(fmPrincipal.LocalIcones + 'erase-h-16.png');
    ButtonLimparTipoMovimento.DisabledPicture.LoadFromFile(fmPrincipal.LocalIcones + 'erase-d-16.png');
    ButtonLimparUsuario.Picture.LoadFromFile(fmPrincipal.LocalIcones + 'erase-e-16.png');
    ButtonLimparUsuario.HotPicture.LoadFromFile(fmPrincipal.LocalIcones + 'erase-h-16.png');
    ButtonLimparUsuario.DisabledPicture.LoadFromFile(fmPrincipal.LocalIcones + 'erase-d-16.png');
    ButtonLimparFornecedor.Picture.LoadFromFile(fmPrincipal.LocalIcones + 'erase-e-16.png');
    ButtonLimparFornecedor.HotPicture.LoadFromFile(fmPrincipal.LocalIcones + 'erase-h-16.png');
    ButtonLimparFornecedor.DisabledPicture.LoadFromFile(fmPrincipal.LocalIcones + 'erase-d-16.png');
    ButtonLimparFormaPagamento.Picture.LoadFromFile(fmPrincipal.LocalIcones + 'erase-e-16.png');
    ButtonLimparFormaPagamento.HotPicture.LoadFromFile(fmPrincipal.LocalIcones + 'erase-h-16.png');
    ButtonLimparFormaPagamento.DisabledPicture.LoadFromFile(fmPrincipal.LocalIcones + 'erase-d-16.png');
    ButtonLimparMotivoUrgencia.Picture.LoadFromFile(fmPrincipal.LocalIcones + 'erase-e-16.png');
    ButtonLimparMotivoUrgencia.HotPicture.LoadFromFile(fmPrincipal.LocalIcones + 'erase-h-16.png');
    ButtonLimparMotivoUrgencia.DisabledPicture.LoadFromFile(fmPrincipal.LocalIcones + 'erase-d-16.png');
    ButtonNovoTipoMovimento.Picture.LoadFromFile(fmPrincipal.LocalIcones + 'new-e-16.png');
    ButtonNovoTipoMovimento.HotPicture.LoadFromFile(fmPrincipal.LocalIcones + 'new-h-16.png');
    ButtonNovoTipoMovimento.DisabledPicture.LoadFromFile(fmPrincipal.LocalIcones + 'new-d-16.png');
    ButtonNovoFornecedor.Picture.LoadFromFile(fmPrincipal.LocalIcones + 'new-e-16.png');
    ButtonNovoFornecedor.HotPicture.LoadFromFile(fmPrincipal.LocalIcones + 'new-h-16.png');
    ButtonNovoFornecedor.DisabledPicture.LoadFromFile(fmPrincipal.LocalIcones + 'new-d-16.png');
    ButtonNovoFormaPagamento.Picture.LoadFromFile(fmPrincipal.LocalIcones + 'new-e-16.png');
    ButtonNovoFormaPagamento.HotPicture.LoadFromFile(fmPrincipal.LocalIcones + 'new-h-16.png');
    ButtonNovoFormaPagamento.DisabledPicture.LoadFromFile(fmPrincipal.LocalIcones + 'new-d-16.png');
    ButtonNovoMotivoUrgencia.Picture.LoadFromFile(fmPrincipal.LocalIcones + 'new-e-16.png');
    ButtonNovoMotivoUrgencia.HotPicture.LoadFromFile(fmPrincipal.LocalIcones + 'new-h-16.png');
    ButtonNovoMotivoUrgencia.DisabledPicture.LoadFromFile(fmPrincipal.LocalIcones + 'new-d-16.png');

    ButtonAdicionarMaterial.Picture.LoadFromFile(fmPrincipal.LocalIcones + 'add-row-e-16.png');
    ButtonAdicionarMaterial.HotPicture.LoadFromFile(fmPrincipal.LocalIcones + 'add-row-h-16.png');
    ButtonAdicionarMaterial.DisabledPicture.LoadFromFile(fmPrincipal.LocalIcones + 'add-row-d-16.png');
end;

function TfmCadAquisicao.validaExclusao: boolean;
var
  vRetorno: integer;
begin
  // Verifica se existe parcelamento.
  if pAquisicao.existeParcelamento = 0 then
    vRetorno := MessageBox(fmPrincipal.Handle,
                           PWideChar('Deseja realmente cancelar o cadastro da aquisição?'#13#10#13#10 +
                                     'Atenção: Esta operação não poderá ser desfeita.'),
                           cTituloMensagemConfirmacao,
                           MB_YESNO or MB_ICONQUESTION or MB_DEFBUTTON2)
  else
    vRetorno := MessageBox(fmPrincipal.Handle,
                           PWideChar('Identificamos que esta aquisição possui parcelamento. Para executar o cancelamento da aquisição, todas as parcelas, mesmo as que estão pagas, serão excluídas. Deseja realmente cancelar o cadastro da aquisição?'#13#10#13#10 +
                                     'Atenção: Esta operação não poderá ser desfeita.'),
                           cTituloMensagemConfirmacao,
                           MB_YESNO or MB_ICONQUESTION or MB_DEFBUTTON2);

  if vRetorno = IDNO then
    Result := false
  else
    Result := true;
end;

end.
