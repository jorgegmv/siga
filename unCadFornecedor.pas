unit unCadFornecedor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, StrUtils, Buttons, ExtCtrls, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, Grids, AdvObj, BaseGrid, AdvGrid, AdvCGrid,
  AsgFindDialog, ComCtrls, Menus, ShellAPI, UnAplExportaXLS, ImgList, ToolWin,
  MaskUtils, DBAdvGrid, jpeg, RpRender, RpRenderPDF, RpCon, RpConDS, RpBase,
  RpSystem, RpDefine, RpRave, AdvGlowButton, AdvMenus, AdvAppStyler, AdvEdit,
  AdvEdBtn, AdvGroupBox, AdvPanel, AdvToolBar, AdvOfficePager, tmsAdvGridExcel,
  JvComponentBase, JvBalloonHint, AdvOfficeButtons, unFornecedor,
  unInformacaoGeografica, unPais, unCEP;

type
  TfmCadFornecedor = class(TForm)
    QueryGeral: TZQuery;
    GridFindDialogColumnGrid: TAdvGridFindDialog;
    DBAdvGridGeral: TDBAdvGrid;
    DataSource: TDataSource;
    BalloonHintInfoTelefones: TJvBalloonHint;
    LabelCodigo: TLabel;
    LabelUsuario: TLabel;
    LabelFornecedor: TLabel;
    LabelEmail: TLabel;
    SaveDialog: TSaveDialog;
    ProjectRelFornecedor: TRvProject;
    DataSetConnectionRelFornecedor: TRvDataSetConnection;
    QueryRelFornecedor: TZQuery;
    LabelNomeResumido: TLabel;
    FormStyler: TAdvFormStyler;
    PopupMenuGrid: TAdvPopupMenu;
    MenuItemEditarRegistro: TMenuItem;
    MenuItemAtualizarTabela: TMenuItem;
    MenuItemEspaco1: TMenuItem;
    MenuItemVisualizarFiltro: TMenuItem;
    EditCadastroCDFORNECEDOR: TAdvEdit;
    EditCadastroNMFORNECEDOR: TAdvEdit;
    EditCadastroDEEMAIL: TAdvEdit;
    EditCadastroNUCNPJ: TAdvEdit;
    EditCadastroSGFORNECEDOR: TAdvEdit;
    LabelNumero: TLabel;
    LabelEndereco: TLabel;
    LabelCEP: TLabel;
    ButtonPesquisarCEP: TAdvGlowButton;
    EditCadastroNUENDERECO: TAdvEdit;
    EditCadastroNUCEP: TAdvEdit;
    LabelTelefoneComercial: TLabel;
    LabelTelefoneCelular: TLabel;
    LabelPais: TLabel;
    ButtonInfoTelefones: TAdvGlowButton;
    ButtonLimparPais: TAdvGlowButton;
    EditCadastroNUTELEFONECOMERCIAL: TAdvEdit;
    EditCadastroNUTELEFONECELULAR: TAdvEdit;
    EditCadastroNUDDI: TAdvEdit;
    EditCadastroNMPAIS: TAdvEditBtn;
    GroupBoxEndereco: TAdvGroupBox;
    GroupBoxTelefone: TAdvGroupBox;
    PanelBotoes: TAdvPanel;
    BitBtnFechar: TAdvGlowButton;
    BitBtnSalvar: TAdvGlowButton;
    BitBtnNovo: TAdvGlowButton;
    BitBtnExcluir: TAdvGlowButton;
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
    CheckBoxCadastroFLATIVO: TAdvOfficeCheckBox;
    MemoCadastroNMENDERECO: TMemo;
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
    procedure EditCadastroNUTELEFONECELULARChange(Sender: TObject);
    procedure EditCadastroNUTELEFONECELULARExit(Sender: TObject);
    procedure EditCadastroNUTELEFONECOMERCIALChange(Sender: TObject);
    procedure EditCadastroNUTELEFONECOMERCIALExit(Sender: TObject);
    procedure EditCadastroNUCEPExit(Sender: TObject);
    procedure ButtonPesquisarCEPClick(Sender: TObject);
    procedure EditCadastroNUCNPJExit(Sender: TObject);
    procedure ButtonInfoTelefonesClick(Sender: TObject);
    procedure EditCadastroNMPAISExit(Sender: TObject);
    procedure ButtonLimparPaisClick(Sender: TObject);
    procedure EditCadastroNUCNPJChange(Sender: TObject);
    procedure ButtonOrdenarRegistrosClick(Sender: TObject);
    procedure EditCadastroNUCEPChange(Sender: TObject);
    procedure EditCadastroNUCEPKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditCadastroNUTELEFONECELULARKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure EditCadastroNUTELEFONECOMERCIALKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure EditCadastroNMFORNECEDORExit(Sender: TObject);
    procedure EditCadastroNMPAISClickBtn(Sender: TObject);
    procedure OfficePageCadastroShow(Sender: TObject);
    procedure EditCadastroNUENDERECOChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    pId: TGUID;
    pOpcao: Char;
    pCodigo, pEspacamentoInicial, pEspacamentoFinal, pEspacamentoEntre: integer;
    pOrdenacao: string;
    pExcluindoCaractere: boolean;
    pFornecedor: TFornecedor;
    pInformacaoGeografica: TInformacaoGeografica;
    pPais: TPais;
    pCEP: TCEP;
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
  fmCadFornecedor: TfmCadFornecedor;

implementation

uses unPrincipal, unConFiltroPadrao, undmPrincipal, unCadPerfil,
  unAplOrdenaGrid, undmEstilo;

{$R *.dfm}

procedure TfmCadFornecedor.atualizaCadastro;
var
  vRetorno: integer;
begin
  try
    pFornecedor.Codigo := Codigo;
    pFornecedor.CNPJ := EditCadastroNUCNPJ.Text;
    pFornecedor.Nome := EditCadastroNMFORNECEDOR.Text;
    pFornecedor.NomeResumido := EditCadastroSGFORNECEDOR.Text;
    pFornecedor.Email := EditCadastroDEEMAIL.Text;
    pFornecedor.CEP := EditCadastroNUCEP.Tag;
    pFornecedor.Numero := StrToIntDef(EditCadastroNUENDERECO.Text,0);
    pFornecedor.Pais := EditCadastroNMPAIS.Tag;
    pFornecedor.TelefoneFixo := EditCadastroNUTELEFONECOMERCIAL.Text;
    pFornecedor.TelefoneCelular := EditCadastroNUTELEFONECELULAR.Text;
    if CheckBoxCadastroFLATIVO.Checked then
      pFornecedor.Ativo := 'S'
    else
      pFornecedor.Ativo := 'N';
    vRetorno := pFornecedor.atualiza;

    if vRetorno <> 0 then
      fmPrincipal.apresentaResultadoCadastro('Cadastro atualizado com sucesso.')
    else
      fmPrincipal.apresentaResultadoCadastro('Não foi possível atualizar o cadastro.');
  except
    on E: exception do
      raise;
  end;
end;

procedure TfmCadFornecedor.BitBtnRestaurarClick(Sender: TObject);
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

procedure TfmCadFornecedor.BitBtnExcluirClick(Sender: TObject);
var
  vRetorno: integer;
begin
  // Valida se realmente o usuário quer realizar a exclusão.
  if MessageBox(fmPrincipal.Handle,
                PWideChar('Confirma a exclusão do fornecedor?'),
                cTituloMensagemConfirmacao,
                MB_YESNO or MB_ICONQUESTION or MB_DEFBUTTON2) = IDNO then
    Exit;
  // Valida se é possível realizar a exclusão.
  if not validaExclusao then
    Exit;

  desabilitaBotoes;
  try
    pFornecedor.Codigo := Codigo;
    vRetorno := pFornecedor.exclui;

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

procedure TfmCadFornecedor.BitBtnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfmCadFornecedor.insereCadastro;
begin
  try
    pFornecedor.CNPJ := EditCadastroNUCNPJ.Text;
    pFornecedor.Nome := EditCadastroNMFORNECEDOR.Text;
    pFornecedor.NomeResumido := EditCadastroSGFORNECEDOR.Text;
    pFornecedor.Email := EditCadastroDEEMAIL.Text;
    pFornecedor.CEP := EditCadastroNUCEP.Tag;
    pFornecedor.Numero := StrToIntDef(EditCadastroNUENDERECO.Text,0);
    pFornecedor.Pais := EditCadastroNMPAIS.Tag;
    pFornecedor.TelefoneFixo := EditCadastroNUTELEFONECOMERCIAL.Text;
    pFornecedor.TelefoneCelular := EditCadastroNUTELEFONECELULAR.Text;
    if CheckBoxCadastroFLATIVO.Checked then
      pFornecedor.Ativo := 'S'
    else
      pFornecedor.Ativo := 'N';
    Codigo := pFornecedor.insere;

    if Codigo <> 0 then
      fmPrincipal.apresentaResultadoCadastro('Cadastro incluído com sucesso.')
    else
      fmPrincipal.apresentaResultadoCadastro('Não foi possível incluir o cadastro.');

    EditCadastroCDFORNECEDOR.Text := IntToStr(Codigo);
  except
    on E: exception do
      raise;
  end;
end;

procedure TfmCadFornecedor.BitBtnNovoClick(Sender: TObject);
begin
  pOpcao := 'I';
  desabilitaBotoes;
  novoCadastro;
  Codigo := 0;
  BitBtnSalvar.Enabled := true;
  BitBtnRestaurar.Enabled := true;
end;

procedure TfmCadFornecedor.ButtonPesquisarCEPClick(Sender: TObject);
begin
  try
    EditCadastroNUCEP.OnExit := nil;
    EditCadastroNUCEP.OnChange := nil;
    EditCadastroNUCEP.Clear;

    fmConFiltroPadrao := TfmConFiltroPadrao.Create(Self);
    with fmConFiltroPadrao do
    begin
      try
        setaTitulo('Consulta de CEP''s');
        setaConsulta(pCEP.filtro);
        setaOpcao('R');
        executaFiltro(0,EmptyStr);
        ShowModal;
      finally
        with pResSearch do
          if Count > 0 then
            if objResSearch[0].Id = buscaId then
            begin
              EditCadastroNUCEP.Tag := StrToInt(objResSearch[0].Nome5);
              EditCadastroNUCEP.Text := objResSearch[0].Codigo;
              EditCadastroNUCEPExit(Sender);
              fmCadFornecedor.ActiveControl := EditCadastroNUENDERECO;
            end;
      end;
    end;
  finally
    EditCadastroNUCEP.OnExit := EditCadastroNUCEPExit;
    EditCadastroNUCEP.OnChange := EditCadastroNUCEPChange;
  end;
end;

procedure TfmCadFornecedor.carregaImagensBotoes;
begin
  EditCadastroNMPAIS.Button.Glyph.Assign(fmPrincipal.fnGeral.obtemImagemPesquisa);

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

  ButtonLimparPais.Picture.LoadFromFile(fmPrincipal.LocalIcones + 'erase-e-16.png');
  ButtonLimparPais.HotPicture.LoadFromFile(fmPrincipal.LocalIcones + 'erase-h-16.png');
  ButtonLimparPais.DisabledPicture.LoadFromFile(fmPrincipal.LocalIcones + 'erase-d-16.png');
  ButtonPesquisarCEP.Picture.LoadFromFile(fmPrincipal.LocalIcones + 'search-e-16.png');
  ButtonPesquisarCEP.HotPicture.LoadFromFile(fmPrincipal.LocalIcones + 'search-h-16.png');
  ButtonPesquisarCEP.DisabledPicture.LoadFromFile(fmPrincipal.LocalIcones + 'search-d-16.png');
  ButtonInfoTelefones.Picture.LoadFromFile(fmPrincipal.LocalIcones + 'info-e-16.png');
  ButtonInfoTelefones.HotPicture.LoadFromFile(fmPrincipal.LocalIcones + 'info-h-16.png');
  ButtonInfoTelefones.DisabledPicture.LoadFromFile(fmPrincipal.LocalIcones + 'info-d-16.png');
end;

procedure TfmCadFornecedor.BitBtnSalvarClick(Sender: TObject);
var
  vMensagem: string;
begin
  desabilitaBotoes;

  // Validações.
  vMensagem := EmptyStr;
  if AnsiCompareText(EditCadastroNUCNPJ.Text,EmptyStr) = 0 then
    vMensagem := vMensagem + #13#10'- O campo CNPJ é requerido.';
  if AnsiCompareText(EditCadastroNMFORNECEDOR.Text,EmptyStr) = 0 then
    vMensagem := vMensagem + #13#10'- O campo Fornecedor é requerido.';
  if AnsiCompareText(EditCadastroDEEMAIL.Text,EmptyStr) <> 0 then
    if not fmPrincipal.fnGeral.verificaEmail(EditCadastroDEEMAIL.Text) then
      vMensagem := vMensagem + #13#10'- O campo E-mail é inconsistente.';

  // Verifica se o fornecedor já está cadastrado.
  if vMensagem = EmptyStr then
    if pFornecedor.existe(Codigo, EditCadastroNUCNPJ.Text, EditCadastroNMFORNECEDOR.Text) = true then
      vMensagem := vMensagem + #13#10'- Já existe um fornecedor cadastrado com este CNPJ e nome de fornecedor.';

  if vMensagem <> EmptyStr then
  begin
    BitBtnSalvar.Enabled := true;
    // Somente administradores pode utilizar estes botões.
    if fmPrincipal.Administrador then
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
    ActiveControl := EditCadastroNUCNPJ;
  except
    on E: Exception do
    begin
      fmPrincipal.apresentaResultadoCadastro(E.Message);
      fmPrincipal.manipulaExcecoes(Sender,E);
    end;
  end;
end;

procedure TfmCadFornecedor.EditCadastroNMPAISClickBtn(Sender: TObject);
var
  i: integer;
begin
  fmConFiltroPadrao := TfmConFiltroPadrao.Create(Self);
  try
    with fmConFiltroPadrao do
    begin
      try
        setaTitulo('Consulta de Países');
        setaConsulta(pPais.filtro);
        setaOpcao('R');
        executaFiltro(0,EmptyStr);
        ShowModal;
      finally
        with pResSearch do
          for i := 0 to Count -1 do
            if objResSearch[i].Id = buscaId then
            begin
              EditCadastroNMPAIS.Tag := StrToInt(objResSearch[i].Codigo);
              EditCadastroNMPAIS.Text := objResSearch[i].Nome2;
              EditCadastroNUDDI.Text := objResSearch[i].Nome3;
            end;
      end;
    end;
  finally
    // Valida para qual campo vai se posicionar.
    if EditCadastroNMPAIS.Tag > 0 then
      ActiveControl := EditCadastroNUTELEFONECOMERCIAL
    else
      ActiveControl := EditCadastroNMPAIS;

    EditCadastroNMPAIS.Enabled := (EditCadastroNMPAIS.Tag = 0);
    ButtonLimparPais.Enabled := (EditCadastroNMPAIS.Tag > 0);
  end;
end;

procedure TfmCadFornecedor.EditCadastroNMPAISExit(Sender: TObject);
var
  i: integer;
  vQuery: TZQuery;
begin
  if Length(Trim(EditCadastroNMPAIS.Text)) = 0 then
    Exit;

  try
    vQuery := pPais.filtro;
    with vQuery do
    begin
      SQL.Add('WHERE UPPER("NM-País") LIKE :NMPAIS');
      Params.ParamByName('NMPAIS').AsString := '%'+AnsiUpperCase(EditCadastroNMPAIS.Text)+'%';
      dmPrincipal.executaConsulta(vQuery);
      if RecordCount > 1 then
      begin
        fmConFiltroPadrao := TfmConFiltroPadrao.Create(Self);
        with fmConFiltroPadrao do
        begin
          try
            setaTitulo('Consulta de Países');
            setaConsulta(pPais.filtro);
            setaOpcao('R');
            executaFiltro(3,EditCadastroNMPAIS.Text);
            ShowModal;
          finally
            with pResSearch do
              for i := 0 to Count -1 do
                if objResSearch[i].Id = buscaId then
                begin
                  EditCadastroNMPAIS.Tag := StrToInt(objResSearch[i].Codigo);
                  EditCadastroNMPAIS.Text := objResSearch[i].Nome2;
                  EditCadastroNUDDI.Text := objResSearch[i].Nome3;
                end;
          end;
        end;
      end
      else
        if not Eof then
        begin
          EditCadastroNMPAIS.Tag := Fields.Fields[0].AsInteger;
          EditCadastroNMPAIS.Text := Fields.Fields[2].AsString;
          EditCadastroNUDDI.Text := Fields.Fields[3].AsString;
        end
        else
          fmPrincipal.apresentaResultadoCadastro('Nenhum registro encontrado.');
      Active := false;
    end;
  finally
    FreeAndNil(vQuery);

    // Valida para qual campo vai se posicionar.
    if EditCadastroNMPAIS.Tag > 0 then
      ActiveControl := EditCadastroNUTELEFONECOMERCIAL
    else
      ActiveControl := EditCadastroNMPAIS;

    EditCadastroNMPAIS.Enabled := (EditCadastroNMPAIS.Tag = 0);
    ButtonLimparPais.Enabled := (EditCadastroNMPAIS.Tag > 0);
  end;
end;

procedure TfmCadFornecedor.DBAdvGridGeralDblClickCell(Sender: TObject; ARow,
  ACol: Integer);
begin
  if ARow > 0 then
    MenuItemEditarRegistroClick(MenuItemEditarRegistro);
end;

procedure TfmCadFornecedor.DBAdvGridGeralFilterSelect(Sender: TObject; Column,
  ItemIndex: Integer; FriendlyName: string; var FilterCondition: string);
begin
  case ItemIndex of
    0: FilterCondition := EmptyStr;
    1: FilterCondition := 'S';
    2: FilterCondition := 'N';
  end;

  DBAdvGridGeral.Cells[Column,0] := FriendlyName;
end;

procedure TfmCadFornecedor.desabilitaBotoes;
begin
  BitBtnSalvar.Enabled := false;
  BitBtnExcluir.Enabled := false;
  BitBtnRestaurar.Enabled := false;
  BitBtnNovo.Enabled := false;
end;

procedure TfmCadFornecedor.editaCadastro;
var
  vCEP: string;
  vQuery, vQueryCEP, vQueryPais: TZQuery;
begin
  novoCadastro;

  try
    try
      vQuery := pFornecedor.lista;
      with vQuery do
      begin
        // Consulta o cadastro do fornecedor.
        SQL.Add('WHERE cdfornecedor = :CURRENT_CDFORNECEDOR');
        Params.ParamByName('CURRENT_CDFORNECEDOR').AsInteger := Codigo;
        dmPrincipal.executaConsulta(vQuery);

        if not Eof then
        begin
          EditCadastroCDFORNECEDOR.Text := IntToStr(Codigo);
          EditCadastroNUCNPJ.Text := Fields.FieldByName('NUCNPJ').AsString;
          EditCadastroNMFORNECEDOR.Text := Fields.FieldByName('NMFORNECEDOR').AsString;
          EditCadastroSGFORNECEDOR.Text := Fields.FieldByName('SGFORNECEDOR').AsString;
          EditCadastroDEEMAIL.Text := Fields.FieldByName('DEEMAIL').AsString;
          if not Fields.FieldByName('CDCEP').IsNull then
          begin
            EditCadastroNUCEP.Tag := Fields.FieldByName('CDCEP').AsInteger;
            // Pesquisa as informações do CEP.
            try
              vQueryCEP := pCEP.lista;
              with vQueryCEP do
              begin
                SQL.Add('WHERE cdcep = :CDCEP');
                Params.ParamByName('CDCEP').AsInteger := EditCadastroNUCEP.Tag;
                dmPrincipal.executaConsulta(vQueryCEP);

                if not Eof then
                begin
                  // Formata o CEP para apresentar em tela.
                  vCEP := Fields.FieldByName('NUCEP').AsString;
                  vCEP := Copy(vCEP,1,5)+'-'+Copy(vCEP,6,3);
                  EditCadastroNUCEP.Text := vCEP;
                end;
              end;
            finally
              FreeAndNil(vQueryCEP);
            end;
            EditCadastroNUENDERECO.Text := Fields.FieldByName('NUENDERECO').AsString;
          end;
          if not Fields.FieldByName('CDPAIS').IsNull then
          begin
            EditCadastroNMPAIS.Tag := Fields.FieldByName('CDPAIS').AsInteger;
            // Pesquisa as informações do País.
            try
              vQueryPais := pPais.lista;
              with vQueryPais do
              begin
                SQL.Add('WHERE cdpais = :CDPAIS');
                Params.ParamByName('CDPAIS').AsInteger := EditCadastroNMPAIS.Tag;
                dmPrincipal.executaConsulta(vQueryPais);

                if not Eof then
                begin
                  EditCadastroNMPAIS.Text := Fields.FieldByName('NMPAIS').AsString;
                  EditCadastroNUDDI.Text := Fields.FieldByName('NUDDI').AsString;
                  EditCadastroNMPAIS.Enabled := false;
                  ButtonLimparPais.Enabled := true;
                end;
              end;
            finally
              FreeAndNil(vQueryPais);
            end;
          end;
          EditCadastroNUTELEFONECOMERCIAL.Text := Fields.FieldByName('NUTELEFONECOMERCIAL').AsString;
          EditCadastroNUTELEFONECELULAR.Text := Fields.FieldByName('NUTELEFONECELULAR').AsString;
          CheckBoxCadastroFLATIVO.Checked := (Fields.FieldByName('FLATIVO').AsString = 'S');
        end
        else
          raise exception.Create('O cadastro do Fornecedor não foi encontrado.');

        Active := false;
      end;

      if EditCadastroNUCEP.Tag > 0 then
        EditCadastroNUCEPExit(EditCadastroNUCEP);
    except
      on E: exception do
        raise;
    end;

    ActiveControl := EditCadastroNUCNPJ;
  finally
    vQuery.Active := false;
    FreeAndNil(vQuery);
  end;
end;

procedure TfmCadFornecedor.editaColunaGrid(prmIndice: integer; prmNome,
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

procedure TfmCadFornecedor.EditCadastroNUTELEFONECELULARChange(Sender: TObject);
var
  vChar: char;
begin
  if pExcluindoCaractere then
    Exit;

  with EditCadastroNUTELEFONECELULAR do
    if Length(Text) > 0 then
    begin
      OnChange := nil;
      vChar := Text[Length(Text)];
      // Verifica se o caractere digitado é válido.
      fmPrincipal.fnGeral.verificaTelefone(vChar);
      if vChar = #0 then
        Text := Copy(Text,1,Length(Text)-1);
      OnChange := EditCadastroNUTELEFONECELULARChange;
      SelStart := Length(Text);
    end;
end;

procedure TfmCadFornecedor.EditCadastroNUTELEFONECELULARExit(Sender: TObject);
var
  vnufTelefone: string;
begin
  if Length(EditCadastroNUTELEFONECELULAR.Text) = 0 then
    Exit;

  vnufTelefone := EditCadastroNUTELEFONECELULAR.Text;
  // Desformata o número do telefone.
  vnufTelefone := StringReplace(vnufTelefone,' ',EmptyStr,[rfReplaceAll]);
  vnufTelefone := StringReplace(vnufTelefone,'(',EmptyStr,[rfReplaceAll]);
  vnufTelefone := StringReplace(vnufTelefone,')',EmptyStr,[rfReplaceAll]);
  vnufTelefone := StringReplace(vnufTelefone,'-',EmptyStr,[rfReplaceAll]);

  try
    // Formato 1:
    // -- Código Área, 2 dígitos;
    // -- Telefone, 8 dígitos;
    if Length(vnufTelefone) = 10 then
    begin
      vnufTelefone := '(' + Copy(vnufTelefone,1,2) + ') ' +
                      Copy(vnufTelefone,3,4) + '-' +
                      Copy(vnufTelefone,7,4);
      Exit;
    end;

    // Formato 2:
    // -- Código Área, 2 dígitos;
    // -- Telefone, 9 dígitos;
    if Length(vnufTelefone) = 11 then
      vnufTelefone := '(' + Copy(vnufTelefone,1,2) + ') ' +
                      Copy(vnufTelefone,3,5) + '-' +
                      Copy(vnufTelefone,8,4);
  finally
    EditCadastroNUTELEFONECELULAR.Text := vnufTelefone;
  end;
end;

procedure TfmCadFornecedor.EditCadastroNUTELEFONECELULARKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  pExcluindoCaractere := ((Key = VK_BACK) or (Key = VK_DELETE));
end;

procedure TfmCadFornecedor.EditCadastroNUTELEFONECOMERCIALChange(
  Sender: TObject);
var
  vChar: char;
begin
  if pExcluindoCaractere then
    Exit;

  with EditCadastroNUTELEFONECOMERCIAL do
    if Length(Text) > 0 then
    begin
      OnChange := nil;
      vChar := Text[Length(Text)];
      // Verifica se o caractere digitado é válido.
      fmPrincipal.fnGeral.verificaTelefone(vChar);
      if vChar = #0 then
        Text := Copy(Text,1,Length(Text)-1);
      OnChange := EditCadastroNUTELEFONECOMERCIALChange;
      SelStart := Length(Text);
    end;
end;

procedure TfmCadFornecedor.EditCadastroNUTELEFONECOMERCIALExit(Sender: TObject);
var
  vnufTelefone: string;
begin
  if Length(EditCadastroNUTELEFONECOMERCIAL.Text) = 0 then
    Exit;

  vnufTelefone := EditCadastroNUTELEFONECOMERCIAL.Text;
  // Desformata o número do telefone.
  vnufTelefone := StringReplace(vnufTelefone,' ',EmptyStr,[rfReplaceAll]);
  vnufTelefone := StringReplace(vnufTelefone,'(',EmptyStr,[rfReplaceAll]);
  vnufTelefone := StringReplace(vnufTelefone,')',EmptyStr,[rfReplaceAll]);
  vnufTelefone := StringReplace(vnufTelefone,'-',EmptyStr,[rfReplaceAll]);

  try
    // Formato 1:
    // -- Código Área, 0 dígitos;
    // -- Telefone, 8 dígitos;
    if Length(vnufTelefone) = 8 then
    begin
      vnufTelefone := Copy(vnufTelefone,1,4) + '-' + Copy(vnufTelefone,5,4);
      Exit;
    end;

    // Formato 2:
    // -- Código Área, 2 dígitos;
    // -- Telefone, 8 dígitos;
    if Length(vnufTelefone) = 10 then
    begin
      vnufTelefone := '(' + Copy(vnufTelefone,1,2) + ') ' +
                      Copy(vnufTelefone,3,4) + '-' +
                      Copy(vnufTelefone,7,4);
      Exit;
    end;

    // Formato 3:
    // -- Código Área, 2 dígitos;
    // -- Telefone, 9 dígitos;
    // Ou:
    // -- Código Área, 0 dígitos;
    // -- Telefone, 11 dígitos;
    if Length(vnufTelefone) = 11 then
      if (Copy(vnufTelefone,1,4) = '0300') or
         (Copy(vnufTelefone,1,4) = '0800') then
        vnufTelefone := Copy(vnufTelefone,1,4) + ' ' +
                        Copy(vnufTelefone,5,3) + ' ' +
                        Copy(vnufTelefone,8,4)
      else
        if Copy(vnufTelefone,1,3) = '011' then
          vnufTelefone := Copy(vnufTelefone,1,3) + ' ' +
                          Copy(vnufTelefone,4,4) + '-' +
                          Copy(vnufTelefone,8,4)
        else
          vnufTelefone := '(' + Copy(vnufTelefone,1,2) + ') ' +
                          Copy(vnufTelefone,3,5) + '-' +
                          Copy(vnufTelefone,8,4);
  finally
    EditCadastroNUTELEFONECOMERCIAL.Text := vnufTelefone;
  end;
end;

procedure TfmCadFornecedor.EditCadastroNUTELEFONECOMERCIALKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  pExcluindoCaractere := ((Key = VK_BACK) or (Key = VK_DELETE));
end;

procedure TfmCadFornecedor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  QueryGeral.Close;

  Action := caFree;
end;

procedure TfmCadFornecedor.FormCreate(Sender: TObject);
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

    pFornecedor := TFornecedor.Create;
    pInformacaoGeografica := TInformacaoGeografica.Create;
    pPais := TPais.Create;
    pCEP := TCEP.Create;

    OfficePagerCentral.ActivePageIndex := 1;
    pExcluindoCaractere := false;

    Ordenacao := '|"Código":"N":"Asc."|;|"CNPJ":"S":"Asc."|;|"Fornecedor":"S":"Asc."|;|"E-mail":"N":"Asc."|;|"Ativo":"S":"Asc."|';

    // Monta a consulta que carregará os dados da Grid.
    with QueryGeral do
    begin
      SQL := pFornecedor.lista.SQL;
      SQL.Strings[0] := 'SELECT cdfornecedor,nucnpj,nmfornecedor,deemail,flativo';
      SQL.Add('ORDER BY 2,3,5');
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

    // Apenas Administradores podem excluir.
    BitBtnExcluir.Enabled := (fmPrincipal.Administrador);
    // A página de consulta só é disponível para o Administrador.
    OfficePageConsulta.TabVisible := (fmPrincipal.Administrador);

    FormResize(Sender);
  except
    on E: Exception do
    begin
      fmPrincipal.manipulaExcecoes(Sender,E);
      Close;
    end;
  end;
end;

procedure TfmCadFornecedor.FormDestroy(Sender: TObject);
begin
  FreeAndNil(pFornecedor);
  FreeAndNil(pInformacaoGeografica);
  FreeAndNil(pPais);
  FreeAndNil(pCEP);
end;

procedure TfmCadFornecedor.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Exit;
end;

procedure TfmCadFornecedor.FormResize(Sender: TObject);
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

procedure TfmCadFornecedor.habilitaBotoes;
begin
  BitBtnSalvar.Enabled := true;
  BitBtnRestaurar.Enabled := true;
  BitBtnNovo.Enabled := true;
  if fmPrincipal.Administrador then
    BitBtnExcluir.Enabled := true;
end;

procedure TfmCadFornecedor.ButtonInfoTelefonesClick(Sender: TObject);
var
  vTexto: string;
begin
  vTexto := 'A formatação do número de telefone é automática, '+
            'por isto, não deve-se digitar parênteses e traços.'+#13#10+
            'Deve-se adotar as seguintes regras ao informar o número do telefone:'+#13#10+
            '- Para número de telefone fixo:'+#13#10+
            '  '+#187+' Código de Área + Número de telefone, sem código internacional.'+#13#10+
            '- Para número de telefone gratuito:'+#13#10+
            '  '+#187+' Apenas o número de telefone.'+#13#10+
            '- Para número de telefone celular:'+#13#10+
            '  '+#187+' Código de Área + Número de telefone, sem código internacional.';
  BalloonHintInfoTelefones.ActivateHint(ButtonInfoTelefones,
                                        vTexto,
                                        'Informação sobre Números de Telefone.',
                                        60000);
end;

procedure TfmCadFornecedor.ButtonLimparPaisClick(Sender: TObject);
begin
  EditCadastroNMPAIS.Tag := 0;
  EditCadastroNMPAIS.Clear;
  EditCadastroNUDDI.Clear;

  EditCadastroNMPAIS.Enabled := true;

  ButtonLimparPais.Enabled := false;
end;

procedure TfmCadFornecedor.EditCadastroNMFORNECEDORExit(Sender: TObject);
begin
  EditCadastroSGFORNECEDOR.Text := Trim(Copy(Trim(EditCadastroNMFORNECEDOR.Text),1,30));
end;

procedure TfmCadFornecedor.EditCadastroNUCEPChange(Sender: TObject);
var
  vChar: char;
begin
  if pExcluindoCaractere then
    Exit;

  with EditCadastroNUCEP do
    if Length(Text) > 0 then
    begin
      OnChange := nil;
      vChar := Text[Length(Text)];
      // Verifica se o caractere digitado é válido.
      fmPrincipal.fnGeral.verificaCEP(Sender);
      if vChar = #0 then
        Text := Copy(Text,1,Length(Text)-1)
      // Insere o "-" no CEP, caso seja o momento.
      else
        Text := fmPrincipal.fnGeral.formataCEP(Text);
      OnChange := EditCadastroNUCEPChange;
      SelStart := Length(Text);
    end;
end;

procedure TfmCadFornecedor.EditCadastroNUCEPExit(Sender: TObject);
var
  vnuCEP: integer;
  vQuery: TZQuery;
begin
  if Trim(EditCadastroNUCEP.Text) = EmptyStr then
    if Length(Trim(EditCadastroNUCEP.Text)) < 9 then
      Exit;

  try
    EditCadastroNUCEP.Tag := 0;
    MemoCadastroNMENDERECO.Clear;
    vnuCEP := StrToIntDef(StringReplace(EditCadastroNUCEP.Text,'-',EmptyStr,[]),0);
    try
      vQuery := pInformacaoGeografica.visao;
      with vQuery do
      begin
        SQL.Add('WHERE nucep = :NUCEP');
        Params.ParamByName('NUCEP').AsInteger := vnuCEP;
        dmPrincipal.executaConsulta(vQuery);

        // Se for encontrado, retorna para o usuário.
        if not Eof then
        begin
          EditCadastroNUCEP.Tag := Fields.FieldByName('CDCEP').AsInteger;
          MemoCadastroNMENDERECO.Lines.Text := Fields.FieldByName('SGLOGRADOURO').AsString + ' ' +
                                               Fields.FieldByName('NMENDERECO').AsString + ' - ' +
                                               Fields.FieldByName('NMBAIRRO').AsString + ' - ' +
                                               Fields.FieldByName('NMLOCALIDADE').AsString + ' - ' +
                                               Fields.FieldByName('NMUF').AsString + ' - ' +
                                               Fields.FieldByName('NMPAIS').AsString;
          //MemoCadastroNMENDERECO.RefreshMemo;
          ActiveControl := EditCadastroNUENDERECO;
        end
        else
        begin
          fmPrincipal.apresentaResultadoCadastro('O CEP informado não se encontra cadastrado no sistema.');
          ActiveControl := EditCadastroNUCEP;
        end;
      end;
    except
      on E: Exception do
        fmPrincipal.manipulaExcecoes(Sender,E);
    end;
  finally
    FreeAndNil(vQuery);
  end;
end;

procedure TfmCadFornecedor.EditCadastroNUCEPKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  pExcluindoCaractere := ((Key = VK_BACK) or (Key = VK_DELETE));
end;

procedure TfmCadFornecedor.EditCadastroNUCNPJChange(Sender: TObject);
var
  vChar: char;
begin
  with EditCadastroNUCNPJ do
    if Length(Text) > 0 then
    begin
      OnChange := nil;
      vChar := Text[Length(Text)];
      // Verifica se o caractere digitado é válido.
      fmPrincipal.fnGeral.verificaNumeros(vChar,7);
      if vChar = #0 then
        Text := Copy(Text,1,Length(Text)-1);
      OnChange := EditCadastroNUCNPJChange;
      SelStart := Length(Text);
    end;
end;

procedure TfmCadFornecedor.EditCadastroNUCNPJExit(Sender: TObject);
begin
  if EditCadastroNUCNPJ.Text <> EmptyStr then
  begin
    if not fmPrincipal.fnGeral.validaCNPJ(EditCadastroNUCNPJ.Text) then
    begin
      MessageBox(fmPrincipal.Handle,
                 PWideChar('O número informado do CNPJ é inválido.'+#13+#10+
                           'Por favor, verifique o número do CNPJ digitado.'),
                 cTituloMensagemErro,
                 MB_OK or MB_ICONERROR);
      ActiveControl := EditCadastroNUCNPJ;
    end
    else
      EditCadastroNUCNPJ.Text := fmPrincipal.fnGeral.formataCNPJ(EditCadastroNUCNPJ.Text);
  end;
end;

procedure TfmCadFornecedor.EditCadastroNUENDERECOChange(Sender: TObject);
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
      OnChange := EditCadastroNUENDERECOChange;
      SelStart := Length(Text);
    end;
end;

procedure TfmCadFornecedor.MenuItemAtualizarTabelaClick(Sender: TObject);
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
      editaColunaGrid(1,'CDFORNECEDOR','Código',edNone,taRightJustify,40,true);
      editaColunaGrid(2,'NUCNPJ','CNPJ',edNone,taLeftJustify,150,true);
      editaColunaGrid(3,'NMFORNECEDOR','Fornecedor',edNone,taLeftJustify,400,true);
      editaColunaGrid(4,'DEEMAIL','E-mail',edNone,taLeftJustify,200,true);
      editaColunaGrid(5,'FLATIVO','Ativo',edCheckBox,taCenter,40,true);
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

procedure TfmCadFornecedor.MenuItemEditarRegistroClick(Sender: TObject);
begin
  Opcao := 'A';
  with DBAdvGridGeral do
    Codigo := ColumnByName['CDFORNECEDOR'].Ints[Row];
  editaCadastro;
  habilitaBotoes;

  ActiveControl := EditCadastroNUCNPJ;
end;

procedure TfmCadFornecedor.MenuItemVisualizarFiltroClick(Sender: TObject);
begin
  GridFindDialogColumnGrid.Execute;
end;

procedure TfmCadFornecedor.novoCadastro;
begin
  OfficePagerCentral.ActivePageIndex := 1;

  EditCadastroCDFORNECEDOR.Clear;
  EditCadastroNUCNPJ.Clear;
  EditCadastroNMFORNECEDOR.Clear;
  EditCadastroSGFORNECEDOR.Clear;
  EditCadastroDEEMAIL.Clear;
  EditCadastroNUCEP.Tag := 0;
  EditCadastroNUCEP.Clear;
  MemoCadastroNMENDERECO.Clear;
  EditCadastroNUENDERECO.Clear;
  EditCadastroNMPAIS.Tag := 0;
  EditCadastroNMPAIS.Clear;
  EditCadastroNMPAIS.Enabled := true;
  EditCadastroNUDDI.Clear;
  EditCadastroNUTELEFONECOMERCIAL.Clear;
  EditCadastroNUTELEFONECELULAR.Clear;

  ButtonLimparPais.Enabled := false;

  CheckBoxCadastroFLATIVO.Checked := true;

  ActiveControl := EditCadastroNUCNPJ;
end;

procedure TfmCadFornecedor.OfficePageCadastroShow(Sender: TObject);
begin
  ActiveControl := EditCadastroNUCNPJ;
end;

procedure TfmCadFornecedor.ButtonExportarHTMLClick(Sender: TObject);
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

procedure TfmCadFornecedor.ButtonExportarPlanilhaClick(Sender: TObject);
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

procedure TfmCadFornecedor.ButtonImprimirRelatorioClick(Sender: TObject);
begin
  try
    QueryRelFornecedor.SQL := pFornecedor.relatorio.SQL;
    dmPrincipal.executaConsulta(QueryRelFornecedor);
    with fmPrincipal.SystemRelatorio do
    begin
      DefaultDest := rdPreview;
      SystemSetups := SystemSetups - [ssAllowSetup];
      DoNativeOutput := false;
    end;
    with ProjectRelFornecedor do
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

procedure TfmCadFornecedor.ButtonOrdenarRegistrosClick(Sender: TObject);
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

function TfmCadFornecedor.validaExclusao: boolean;
var
  vMensagem: string;
begin
  vMensagem := EmptyStr;

  try
    pFornecedor.Codigo := Codigo;
    if pFornecedor.existeDependencia then
      vMensagem := '- Existem aquisições relacionadas a este fornecedor.';

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

end.
