unit unCadBairro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, Grids, AdvObj, BaseGrid, AdvGrid, AdvCGrid, AsgFindDialog, ComCtrls,
  Menus, UnAplExportaXLS, ImgList, ToolWin, ShellAPI, Mask, MaskUtils,
  DBAdvGrid, RpCon, RpConDS, RpBase, RpSystem, RpDefine, RpRave, RpRender,
  RpRenderPDF, AdvAppStyler, AdvGlowButton, AdvMenus, AdvPanel, AdvEdit,
  AdvEdBtn, AdvToolBar, AdvOfficePager, tmsAdvGridExcel, unBairro, unPais,
  unInformacaoGeografica, unUnidadeFederacao, unLocalidade;

type
  TfmCadBairro = class(TForm)
    QueryGeral: TZQuery;
    GridFindDialogColumnGrid: TAdvGridFindDialog;
    DBAdvGridGeral: TDBAdvGrid;
    DataSource: TDataSource;
    LabelCodigo: TLabel;
    LabelPais: TLabel;
    LabelBairro: TLabel;
    LabelUF: TLabel;
    LabelLocalidade: TLabel;
    SaveDialog: TSaveDialog;
    ProjectRelBairro: TRvProject;
    DataSetConnectionRelBairro: TRvDataSetConnection;
    QueryRelBairro: TZQuery;
    FormStyler: TAdvFormStyler;
    PopupMenuGrid: TAdvPopupMenu;
    MenuItemEditarRegistro: TMenuItem;
    MenuItemAtualizarTabela: TMenuItem;
    MenuItemEspaco1: TMenuItem;
    MenuItemVisualizarFiltro: TMenuItem;
    PanelBotoes: TAdvPanel;
    BitBtnFechar: TAdvGlowButton;
    BitBtnSalvar: TAdvGlowButton;
    BitBtnNovo: TAdvGlowButton;
    BitBtnExcluir: TAdvGlowButton;
    BitBtnRestaurar: TAdvGlowButton;
    ButtonLimparPais: TAdvGlowButton;
    ButtonNovoPais: TAdvGlowButton;
    ButtonLimparUF: TAdvGlowButton;
    ButtonNovoUF: TAdvGlowButton;
    ButtonLimparLocalidade: TAdvGlowButton;
    ButtonNovoLocalidade: TAdvGlowButton;
    EditCadastroCDBAIRRO: TAdvEdit;
    EditCadastroNMBAIRRO: TAdvEdit;
    EditCadastroCDPAIS: TAdvEdit;
    EditCadastroSGPAIS: TAdvEdit;
    EditCadastroCDUF: TAdvEdit;
    EditCadastroSGUF: TAdvEdit;
    EditCadastroCDLOCALIDADE: TAdvEdit;
    EditCadastroNMPAIS: TAdvEditBtn;
    EditCadastroNMUF: TAdvEditBtn;
    EditCadastroNMLOCALIDADE: TAdvEditBtn;
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
    procedure ButtonLimparPaisClick(Sender: TObject);
    procedure ButtonNovoPaisClick(Sender: TObject);
    procedure EditCadastroNMPAISExit(Sender: TObject);
    procedure EditCadastroCDPAISExit(Sender: TObject);
    procedure EditCadastroSGPAISExit(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ButtonLimparUFClick(Sender: TObject);
    procedure ButtonNovoUFClick(Sender: TObject);
    procedure EditCadastroNMUFExit(Sender: TObject);
    procedure EditCadastroCDUFExit(Sender: TObject);
    procedure EditCadastroSGUFExit(Sender: TObject);
    procedure ButtonLimparLocalidadeClick(Sender: TObject);
    procedure ButtonNovoLocalidadeClick(Sender: TObject);
    procedure EditCadastroNMLOCALIDADEExit(Sender: TObject);
    procedure EditCadastroCDLOCALIDADEExit(Sender: TObject);
    procedure ButtonOrdenarRegistrosClick(Sender: TObject);
    procedure OfficePageCadastroClick(Sender: TObject);
    procedure EditCadastroNMPAISClickBtn(Sender: TObject);
    procedure EditCadastroNMUFClickBtn(Sender: TObject);
    procedure EditCadastroNMLOCALIDADEClickBtn(Sender: TObject);
    procedure EditCadastroCDPAISChange(Sender: TObject);
    procedure EditCadastroCDUFChange(Sender: TObject);
    procedure EditCadastroCDLOCALIDADEChange(Sender: TObject);
  private
    { Private declarations }
    pId: TGUID;
    plPais, plUnidadeFederacao, plLocalidade: TStringList;
    pOpcao: Char;
    pCodigo, pEspacamentoInicial, pEspacamentoFinal, pEspacamentoEntre: integer;
    pOrdenacao: string;
    pBairro: TBairro;
    pInformacaoGeografica: TInformacaoGeografica;
    pPais: TPais;
    pUnidadeFederacao: TUnidadeFederacao;
    pLocalidade: TLocalidade;
    procedure editaColunaGrid(prmIndice: integer; prmNome, prmCabecalho: string;
      prmEditor: TEditorType; prmAlinhamento: TAlignment; prmTamanho: integer;
      prmSomenteLeitura: boolean);
    procedure desabilitaBotoes;
    procedure habilitaBotoes;
    procedure novoCadastro;
    procedure editaCadastro;
    procedure insereCadastro;
    procedure atualizaCadastro;
    procedure limparCamposPais;
    procedure limparCamposUF;
    procedure limparCamposLocalidade;
    function validaExclusao: boolean;
    procedure carregaImagensBotoes;
    property EspacamentoInicial: integer read pEspacamentoInicial write pEspacamentoInicial;
    property EspacamentoEntre: integer read pEspacamentoEntre write pEspacamentoEntre;
    property EspacamentoFinal: integer read pEspacamentoFinal write pEspacamentoFinal;
  public
    { Public declarations }
    procedure setaCadastroUnico(prmcdPais, prmcdUF, prmcdLocalidade: integer);
    property Opcao: char read pOpcao write pOpcao;
    property Codigo: integer read pCodigo write pCodigo;
    property Ordenacao: string read pOrdenacao write pOrdenacao;
  end;

var
  fmCadBairro: TfmCadBairro;

implementation

uses unPrincipal, unConFiltroPadrao, undmPrincipal, undmEstilo, unCadPais,
  unCadUF, unCadLocalidade, unAplOrdenaGrid;

{$R *.dfm}

procedure TfmCadBairro.atualizaCadastro;
var
  vRetorno: integer;
begin
  try
    pBairro.Codigo := Codigo;
    pBairro.Localidade := StrToInt(EditCadastroCDLOCALIDADE.Text);
    pBairro.Nome := EditCadastroNMBAIRRO.Text;
    vRetorno := pBairro.atualiza;

    if vRetorno <> 0 then
      fmPrincipal.apresentaResultadoCadastro('Cadastro atualizado com sucesso.')
    else
      fmPrincipal.apresentaResultadoCadastro('Não foi possível atualizar o cadastro.');
  except
    on E: exception do
      raise;
  end;
end;

procedure TfmCadBairro.BitBtnRestaurarClick(Sender: TObject);
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

procedure TfmCadBairro.BitBtnExcluirClick(Sender: TObject);
var
  vRetorno: integer;
begin
  // Valida se realmente o usuário quer realizar a exclusão.
  if MessageBox(fmPrincipal.Handle,
                PWideChar('Confirma a exclusão do bairro?'),
                cTituloMensagemConfirmacao,
                MB_YESNO or MB_ICONQUESTION or MB_DEFBUTTON2) = IDNO then
    Exit;
  // Valida se é possível realizar a exclusão.
  if not validaExclusao then
    Exit;

  desabilitaBotoes;
  try
    pBairro.Codigo := Codigo;
    vRetorno := pBairro.exclui;

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

procedure TfmCadBairro.BitBtnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfmCadBairro.insereCadastro;
begin

  try
    pBairro.Localidade := StrToInt(EditCadastroCDLOCALIDADE.Text);
    pBairro.Nome := EditCadastroNMBAIRRO.Text;
    Codigo := pBairro.insere;

    if Codigo <> 0 then
      fmPrincipal.apresentaResultadoCadastro('Cadastro incluído com sucesso.')
    else
      fmPrincipal.apresentaResultadoCadastro('Não foi possível incluir o cadastro.');

    EditCadastroCDPAIS.Text := IntToStr(Codigo);
  except
    on E: exception do
      raise;
  end;
end;

procedure TfmCadBairro.limparCamposLocalidade;
begin
  plLocalidade.Clear;

  EditCadastroCDLOCALIDADE.Clear;
  EditCadastroNMLOCALIDADE.Clear;
end;

procedure TfmCadBairro.limparCamposPais;
begin
  plPais.Clear;

  EditCadastroCDPAIS.Clear;
  EditCadastroSGPAIS.Clear;
  EditCadastroNMPAIS.Clear;
  limparCamposUF;
end;

procedure TfmCadBairro.limparCamposUF;
begin
  plUnidadeFederacao.Clear;

  EditCadastroCDUF.Clear;
  EditCadastroSGUF.Clear;
  EditCadastroNMUF.Clear;
  limparCamposLocalidade;
end;

procedure TfmCadBairro.BitBtnNovoClick(Sender: TObject);
begin
  pOpcao := 'I';
  desabilitaBotoes;
  novoCadastro;
  BitBtnSalvar.Enabled := true;
  BitBtnRestaurar.Enabled := true;
end;

procedure TfmCadBairro.BitBtnSalvarClick(Sender: TObject);
var
  vMensagem: string;
begin
  desabilitaBotoes;

  // Validações.
  vMensagem := EmptyStr;
  if AnsiCompareText(EditCadastroCDPAIS.Text,EmptyStr) = 0 then
    vMensagem := vMensagem + #13#10'- O campo País é requerido.';
  if AnsiCompareText(EditCadastroCDUF.Text,EmptyStr) = 0 then
    vMensagem := vMensagem + #13#10'- O campo U.F. é requerido.';
  if AnsiCompareText(EditCadastroCDLOCALIDADE.Text,EmptyStr) = 0 then
    vMensagem := vMensagem + #13#10'- O campo Localidade é requerido.';
  if AnsiCompareText(EditCadastroNMBAIRRO.Text,EmptyStr) = 0 then
    vMensagem := vMensagem + #13#10'- O campo Bairro é requerido.';

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
    ActiveControl := EditCadastroNMBAIRRO;
  except
    on E: Exception do
    begin
      fmPrincipal.apresentaResultadoCadastro(E.Message);
      fmPrincipal.manipulaExcecoes(Sender,E);
    end;
  end;
end;

procedure TfmCadBairro.EditCadastroNMLOCALIDADEClickBtn(Sender: TObject);
var
  i: integer;
begin
  fmConFiltroPadrao := TfmConFiltroPadrao.Create(Self);
  try
    with fmConFiltroPadrao do
    begin
      try
        setaTitulo('Consulta de Localidades');
        setaConsulta(pLocalidade.filtro);
        setaOpcao('R');
        setaFiltrosExtras('"NU-Código" IN (SELECT taux.cdlocalidade'#13#10+
                          '                FROM ' + cSchema + '.localidade taux'#13#10+
                          '                WHERE taux.cduf = '+EditCadastroCDUF.Text+')',
                          'Nome da U.F.: '+EditCadastroNMUF.Text);
        executaFiltro(0,EmptyStr);
        ShowModal;
      finally
        plLocalidade.Clear;
        with pResSearch do
          for i := 0 to Count -1 do
            if objResSearch[i].Id = buscaId then
            begin
              plLocalidade.Add(objResSearch[i].Codigo);
              EditCadastroCDLOCALIDADE.Text := objResSearch[i].Codigo;
              EditCadastroNMLOCALIDADE.Text := objResSearch[i].Nome1;
            end;
      end;
    end;
  finally
    // Valida para qual campo vai se posicionar.
    if plLocalidade.Count > 0 then
      ActiveControl := EditCadastroNMBAIRRO
    else
      ActiveControl := EditCadastroNMLOCALIDADE;

    EditCadastroCDLocalidade.Enabled := (plLocalidade.Count = 0);
    EditCadastroNMLocalidade.Enabled := (plLocalidade.Count = 0);
    ButtonLimparLocalidade.Enabled := (plLocalidade.Count > 0);
    ButtonNovoLocalidade.Enabled := (plLocalidade.Count = 0);
  end;
end;

procedure TfmCadBairro.EditCadastroNMLOCALIDADEExit(Sender: TObject);
var
  i: integer;
  vQuery: TZQuery;
begin
  // Se não digitou nada, sai sem abrir a search.
  if Length(Trim(EditCadastroNMLOCALIDADE.Text)) = 0 then
    Exit;

  try
    vQuery := pLocalidade.filtro;
    with vQuery do
    begin
      SQL.Add('WHERE UPPER("NM-Localidade") LIKE :NMLOCALIDADE');
      // Trata especificamente de relacionar a Localidade com a UF.
      SQL.Add('  AND "NU-Código" IN (SELECT taux.cdlocalidade');
      SQL.Add('                      FROM ' + cSchema + '.localidade taux');
      SQL.Add('                      WHERE taux.cduf = :CDUF)');
      Params.ParamByName('NMLOCALIDADE').AsString := '%'+AnsiUpperCase(EditCadastroNMLOCALIDADE.Text)+'%';
      Params.ParamByName('CDUF').AsInteger := StrToInt(EditCadastroCDUF.Text);
      dmPrincipal.executaConsulta(vQuery);

      if RecordCount > 1 then
      begin
        fmConFiltroPadrao := TfmConFiltroPadrao.Create(Self);
        with fmConFiltroPadrao do
        begin
          try
            setaTitulo('Consulta de Localidades');
            setaConsulta(pLocalidade.filtro);
            setaOpcao('R');
            setaFiltrosExtras('"NU-Código" IN (SELECT taux.cdlocalidade'#13#10+
                              '                FROM ' + cSchema + '.localidade taux'#13#10+
                              '                WHERE taux.cduf = '+EditCadastroCDUF.Text+')',
                              'Nome da U.F.: '+EditCadastroNMUF.Text);
            executaFiltro(2,EditCadastroNMLOCALIDADE.Text);
            ShowModal;
          finally
            plLocalidade.Clear;
            with pResSearch do
              for i := 0 to Count -1 do
                if objResSearch[i].Id = buscaId then
                begin
                  plLocalidade.Add(objResSearch[i].Codigo);
                  EditCadastroCDLOCALIDADE.Text := objResSearch[i].Codigo;
                  EditCadastroNMLOCALIDADE.Text := objResSearch[i].Nome1;
                end;
          end;
        end;
      end
      else
        if not Eof then
        begin
          plLocalidade.Clear;
          plLocalidade.Add(Fields.Fields[0].AsString);
          EditCadastroCDLOCALIDADE.Text := Fields.Fields[0].AsString;
          EditCadastroNMLOCALIDADE.Text := Fields.Fields[1].AsString;
        end
        else
          fmPrincipal.apresentaResultadoCadastro('Nenhum registro encontrado.');
      Active := false;
    end;
  finally
    FreeAndNil(vQuery);

    // Valida para qual campo vai se posicionar.
    if plLocalidade.Count > 0 then
      ActiveControl := EditCadastroNMBAIRRO
    else
      ActiveControl := EditCadastroNMLOCALIDADE;

    EditCadastroCDLocalidade.Enabled := (plLocalidade.Count = 0);
    EditCadastroNMLocalidade.Enabled := (plLocalidade.Count = 0);
    ButtonLimparLocalidade.Enabled := (plLocalidade.Count > 0);
    ButtonNovoLocalidade.Enabled := (plLocalidade.Count = 0);
  end;
end;

procedure TfmCadBairro.EditCadastroNMPAISClickBtn(Sender: TObject);
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
        plPais.Clear;
        with pResSearch do
          for i := 0 to Count -1 do
            if objResSearch[i].Id = buscaId then
            begin
              plPais.Add(objResSearch[i].Codigo);
              EditCadastroCDPAIS.Text := objResSearch[i].Codigo;
              EditCadastroSGPAIS.Text := objResSearch[i].Nome1;
              EditCadastroNMPAIS.Text := objResSearch[i].Nome2;
            end;
      end;
    end;
  finally

    // Limpas os combos dependentes.
    ButtonLimparUFClick(Sender);
    if plPais.Count = 0 then
    begin
      // U.F.
      EditCadastroCDUF.Enabled := false;
      EditCadastroSGUF.Enabled := false;
      EditCadastroNMUF.Enabled := false;
      ButtonLimparUF.Enabled := false;
      ButtonNovoUF.Enabled := false;

      // Localidade
      EditCadastroCDLocalidade.Enabled := false;
      EditCadastroNMUF.Enabled := false;
      ButtonLimparUF.Enabled := false;
      ButtonNovoUF.Enabled := false;
    end;

    // Valida para qual campo vai se posicionar.
    if plPais.Count > 0 then
      ActiveControl := EditCadastroCDUF
    else
      ActiveControl := EditCadastroNMPAIS;

    // País
    EditCadastroCDPAIS.Enabled := (plPais.Count = 0);
    EditCadastroSGPAIS.Enabled := (plPais.Count = 0);
    EditCadastroNMPAIS.Enabled := (plPais.Count = 0);
    ButtonLimparPais.Enabled := (plPais.Count > 0);
    ButtonNovoPais.Enabled := (plPais.Count = 0);
  end;
end;

procedure TfmCadBairro.EditCadastroNMPAISExit(Sender: TObject);
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
            plPais.Clear;
            with pResSearch do
              for i := 0 to Count -1 do
                if objResSearch[i].Id = buscaId then
                begin
                  plPais.Add(objResSearch[i].Codigo);
                  EditCadastroCDPAIS.Text := objResSearch[i].Codigo;
                  EditCadastroSGPAIS.Text := objResSearch[i].Nome1;
                  EditCadastroNMPAIS.Text := objResSearch[i].Nome2;
                end;
          end;
        end;
      end
      else
        if not Eof then
        begin
          plPais.Clear;
          plPais.Add(Fields.Fields[0].AsString);
          EditCadastroCDPAIS.Text := Fields.Fields[0].AsString;
          EditCadastroSGPAIS.Text := Fields.Fields[1].AsString;
          EditCadastroNMPAIS.Text := Fields.Fields[2].AsString;
        end
        else
          fmPrincipal.apresentaResultadoCadastro('Nenhum registro encontrado.');
      Active := false;
    end;
  finally
    FreeAndNil(vQuery);

    // Limpas os combos dependentes.
    ButtonLimparUFClick(Sender);
    if plPais.Count = 0 then
    begin
      // U.F.
      EditCadastroCDUF.Enabled := false;
      EditCadastroSGUF.Enabled := false;
      EditCadastroNMUF.Enabled := false;
      ButtonLimparUF.Enabled := false;
      ButtonNovoUF.Enabled := false;

      // Localidade
      EditCadastroCDLocalidade.Enabled := false;
      EditCadastroNMUF.Enabled := false;
      ButtonLimparUF.Enabled := false;
      ButtonNovoUF.Enabled := false;
    end;

    // Valida para qual campo vai se posicionar.
    if plPais.Count > 0 then
      ActiveControl := EditCadastroCDUF
    else
      ActiveControl := EditCadastroNMPAIS;

    // País
    EditCadastroCDPAIS.Enabled := (plPais.Count = 0);
    EditCadastroSGPAIS.Enabled := (plPais.Count = 0);
    EditCadastroNMPAIS.Enabled := (plPais.Count = 0);
    ButtonLimparPais.Enabled := (plPais.Count > 0);
    ButtonNovoPais.Enabled := (plPais.Count = 0);
  end;
end;

procedure TfmCadBairro.EditCadastroNMUFClickBtn(Sender: TObject);
var
  i: integer;
begin
  fmConFiltroPadrao := TfmConFiltroPadrao.Create(Self);
  try
    with fmConFiltroPadrao do
    begin
      try
        setaTitulo('Consulta de Unidades da Federação');
        setaConsulta(pUnidadeFederacao.filtro);
        setaOpcao('R');
        // Trata especificamente de relacionar as U.F. com um País.
        setaFiltrosExtras('"NU-Código" IN (SELECT cduf'#13#10+
                          '                FROM ' + cSchema + '.uf'#13#10+
                          '                WHERE cdpais = '+EditCadastroCDPAIS.Text+')',
                          'Nome do País: '+EditCadastroNMPAIS.Text);
        executaFiltro(0,EmptyStr);
        ShowModal;
      finally
        plUnidadeFederacao.Clear;
        with pResSearch do
          for i := 0 to Count -1 do
            if objResSearch[i].Id = buscaId then
            begin
              plUnidadeFederacao.Add(objResSearch[i].Codigo);
              EditCadastroCDUF.Text := objResSearch[i].Codigo;
              EditCadastroSGUF.Text := objResSearch[i].Nome1;
              EditCadastroNMUF.Text := objResSearch[i].Nome2;
            end;
      end;
    end;
  finally
    // Limpas os combos dependentes.
    ButtonLimparLocalidadeClick(Sender);
    if plUnidadeFederacao.Count = 0 then
    begin
      // Localidade
      EditCadastroCDLocalidade.Enabled := false;
      EditCadastroNMUF.Enabled := false;
      ButtonLimparUF.Enabled := false;
      ButtonNovoUF.Enabled := false;
    end;

    // Valida para qual campo vai se posicionar.
    if plUnidadeFederacao.Count > 0 then
      ActiveControl := EditCadastroCDLOCALIDADE
    else
      ActiveControl := EditCadastroNMUF;

    EditCadastroCDUF.Enabled := (plUnidadeFederacao.Count = 0);
    EditCadastroSGUF.Enabled := (plUnidadeFederacao.Count = 0);
    EditCadastroNMUF.Enabled := (plUnidadeFederacao.Count = 0);
    ButtonLimparUF.Enabled := (plUnidadeFederacao.Count > 0);
    ButtonNovoUF.Enabled := (plUnidadeFederacao.Count = 0);
  end;
end;

procedure TfmCadBairro.EditCadastroNMUFExit(Sender: TObject);
var
  i: integer;
  vQuery: TZQuery;
begin
  if Length(Trim(EditCadastroNMUF.Text)) = 0 then
    Exit;

  try
    vQuery := pUnidadeFederacao.filtro;
    with vQuery do
    begin
      SQL.Add('WHERE UPPER("NM-U.F.") LIKE :NMUF');
      // Trata especificamente de relacionar as U.F. com um País.
      SQL.Add('  AND "NU-Código" IN (SELECT taux.cduf');
      SQL.Add('                      FROM ' + cSchema + '.uf taux');
      SQL.Add('                      WHERE taux.cdpais = :CDPAIS)');
      Params.ParamByName('CDPAIS').AsInteger := StrToInt(EditCadastroCDPAIS.Text);
      Params.ParamByName('NMUF').AsString := '%'+AnsiUpperCase(EditCadastroNMUF.Text)+'%';
      dmPrincipal.executaConsulta(vQuery);

      if RecordCount > 1 then
      begin
        fmConFiltroPadrao := TfmConFiltroPadrao.Create(Self);
        with fmConFiltroPadrao do
        begin
          try
            setaTitulo('Consulta de Unidades da Federação');
            setaConsulta(pUnidadeFederacao.filtro);
            setaOpcao('R');
            // Trata especificamente de relacionar as U.F. com um País.
            setaFiltrosExtras('"NU-Código" IN (SELECT cduf'#13#10+
                              '                FROM ' + cSchema + '.uf'#13#10+
                              '                WHERE cdpais = '+EditCadastroCDPAIS.Text+')',
                              'Nome do País: '+EditCadastroNMPAIS.Text);
            executaFiltro(3,EditCadastroNMUF.Text);
            ShowModal;
          finally
            plUnidadeFederacao.Clear;
            with pResSearch do
              for i := 0 to Count -1 do
                if objResSearch[i].Id = buscaId then
                begin
                  plUnidadeFederacao.Add(objResSearch[i].Codigo);
                  EditCadastroCDUF.Text := objResSearch[i].Codigo;
                  EditCadastroSGUF.Text := objResSearch[i].Nome1;
                  EditCadastroNMUF.Text := objResSearch[i].Nome2;
                end;
          end;
        end;
      end
      else
        if not Eof then
        begin
          plUnidadeFederacao.Clear;
          plUnidadeFederacao.Add(Fields.Fields[0].AsString);
          EditCadastroCDUF.Text := Fields.Fields[0].AsString;
          EditCadastroSGUF.Text := Fields.Fields[1].AsString;
          EditCadastroNMUF.Text := Fields.Fields[2].AsString;
        end
        else
          fmPrincipal.apresentaResultadoCadastro('Nenhum registro encontrado.');
      Active := false;
    end;
  finally
    FreeAndNil(vQuery);

    // Limpas os combos dependentes.
    ButtonLimparLocalidadeClick(Sender);
    if plUnidadeFederacao.Count = 0 then
    begin
      // Localidade
      EditCadastroCDLocalidade.Enabled := false;
      EditCadastroNMUF.Enabled := false;
      ButtonLimparUF.Enabled := false;
      ButtonNovoUF.Enabled := false;
    end;

    // Valida para qual campo vai se posicionar.
    if plUnidadeFederacao.Count > 0 then
      ActiveControl := EditCadastroCDLOCALIDADE
    else
      ActiveControl := EditCadastroNMUF;

    EditCadastroCDUF.Enabled := (plUnidadeFederacao.Count = 0);
    EditCadastroSGUF.Enabled := (plUnidadeFederacao.Count = 0);
    EditCadastroNMUF.Enabled := (plUnidadeFederacao.Count = 0);
    ButtonLimparUF.Enabled := (plUnidadeFederacao.Count > 0);
    ButtonNovoUF.Enabled := (plUnidadeFederacao.Count = 0);
  end;
end;

procedure TfmCadBairro.DBAdvGridGeralDblClickCell(Sender: TObject; ARow,
  ACol: Integer);
begin
  if ARow > 0 then
    MenuItemEditarRegistroClick(MenuItemEditarRegistro);
end;

procedure TfmCadBairro.DBAdvGridGeralFilterSelect(Sender: TObject; Column,
  ItemIndex: Integer; FriendlyName: string; var FilterCondition: string);
begin
  case ItemIndex of
    0: FilterCondition := EmptyStr;
    1: FilterCondition := 'S';
    2: FilterCondition := 'N';
  end;

  DBAdvGridGeral.Cells[Column,0] := FriendlyName;
end;

procedure TfmCadBairro.desabilitaBotoes;
begin
  BitBtnSalvar.Enabled := false;
  BitBtnExcluir.Enabled := false;
  BitBtnRestaurar.Enabled := false;
  BitBtnNovo.Enabled := false;
end;

procedure TfmCadBairro.editaCadastro;
var
  vQuery: TZQuery;
begin
  novoCadastro;

  try
    try
      vQuery := pInformacaoGeografica.visao;
      with vQuery do
      begin
        // Consulta o cadastro da Localidade.
        SQL.Add('WHERE cdbairro = :CURRENT_CDBAIRRO');
        Params.ParamByName('CURRENT_CDBAIRRO').AsInteger := Codigo;
        dmPrincipal.executaConsulta(vQuery);

        if not Eof then
        begin
          EditCadastroCDBAIRRO.Text := IntToStr(Codigo);
          EditCadastroCDPAIS.Text := Fields.FieldByName('CDPAIS').AsString;
          EditCadastroCDPAISExit(EditCadastroCDPAIS);
          EditCadastroCDUF.Text := Fields.FieldByName('CDUF').AsString;
          EditCadastroCDUFExit(EditCadastroCDUF);
          EditCadastroCDLOCALIDADE.Text := Fields.FieldByName('CDLOCALIDADE').AsString;
          EditCadastroCDLOCALIDADEExit(EditCadastroCDLOCALIDADE);
          EditCadastroNMBAIRRO.Text := Fields.FieldByName('NMBAIRRO').AsString;
        end
        else
          raise exception.Create('O cadastro da Localidade não foi encontrado.');
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

procedure TfmCadBairro.editaColunaGrid(prmIndice: integer; prmNome,
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

procedure TfmCadBairro.EditCadastroCDLOCALIDADEChange(Sender: TObject);
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
      OnChange := EditCadastroCDLOCALIDADEChange;
      SelStart := Length(Text);
    end;
end;

procedure TfmCadBairro.EditCadastroCDLOCALIDADEExit(Sender: TObject);
var
  vQuery: TZQuery;
begin
  // Se não digitou nada, sai sem abrir a search.
  if Length(Trim(EditCadastroCDLOCALIDADE.Text)) = 0 then
    Exit;

  try
    vQuery := pLocalidade.filtro;
    with vQuery do
    begin
      SQL.Add('WHERE "NU-Código" = :CDLOCALIDADE');
      // Trata especificamente de relacionar a Localidade com a UF.
      SQL.Add('  AND "NU-Código" IN (SELECT taux.cdlocalidade');
      SQL.Add('                      FROM ' + cSchema + '.localidade taux');
      SQL.Add('                      WHERE taux.cduf = :CDUF)');
      Params.ParamByName('CDLOCALIDADE').AsInteger := StrToInt(EditCadastroCDLOCALIDADE.Text);
      Params.ParamByName('CDUF').AsInteger := StrToInt(EditCadastroCDUF.Text);
      dmPrincipal.executaConsulta(vQuery);

      if not Eof then
      begin
        plLocalidade.Clear;
        plLocalidade.Add(Fields.Fields[0].AsString);
        EditCadastroCDLOCALIDADE.Text := Fields.Fields[0].AsString;
        EditCadastroNMLOCALIDADE.Text := Fields.Fields[1].AsString;
      end
      else
      begin
        plLocalidade.Clear;
        EditCadastroCDLOCALIDADE.Clear;
        EditCadastroNMLOCALIDADE.Clear;
        fmPrincipal.apresentaResultadoCadastro('Nenhum registro encontrado.');
      end;
      Active := false;
    end;
  finally
    FreeAndNil(vQuery);

    // Valida para qual campo vai se posicionar.
    if plLocalidade.Count > 0 then
      ActiveControl := EditCadastroNMBAIRRO
    else
      ActiveControl := EditCadastroCDLOCALIDADE;

    EditCadastroCDLocalidade.Enabled := (plLocalidade.Count = 0);
    EditCadastroNMLocalidade.Enabled := (plLocalidade.Count = 0);
    ButtonLimparLocalidade.Enabled := (plLocalidade.Count > 0);
    ButtonNovoLocalidade.Enabled := (plLocalidade.Count = 0);
  end;
end;

procedure TfmCadBairro.EditCadastroCDPAISChange(Sender: TObject);
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
      OnChange := EditCadastroCDPAISChange;
      SelStart := Length(Text);
    end;
end;

procedure TfmCadBairro.EditCadastroCDPAISExit(Sender: TObject);
var
  vQuery: TZQuery;
begin
  // Se não digitou nada, sai sem abrir a search.
  if Length(Trim(EditCadastroCDPAIS.Text)) = 0 then
    Exit;

  try
    vQuery := pPais.filtro;
    with vQuery do
    begin
      SQL.Add('WHERE "NU-Código" = :CDPAIS');
      Params.ParamByName('CDPAIS').AsInteger := StrToInt(EditCadastroCDPAIS.Text);
      dmPrincipal.executaConsulta(vQuery);

      if not Eof then
      begin
        plPais.Clear;
        plPais.Add(Fields.Fields[0].AsString);
        EditCadastroCDPAIS.Text := Fields.Fields[0].AsString;
        EditCadastroSGPAIS.Text := Fields.Fields[1].AsString;
        EditCadastroNMPAIS.Text := Fields.Fields[2].AsString;
      end
      else
      begin
        plPais.Clear;
        EditCadastroCDPAIS.Clear;
        EditCadastroSGPAIS.Clear;
        EditCadastroNMPAIS.Clear;
        fmPrincipal.apresentaResultadoCadastro('Nenhum registro encontrado.');
      end;
      Active := false;
    end;
  finally
    FreeAndNil(vQuery);

    // Limpas os combos dependentes.
    ButtonLimparUFClick(Sender);
    if plPais.Count = 0 then
    begin
      // U.F.
      EditCadastroCDUF.Enabled := false;
      EditCadastroSGUF.Enabled := false;
      EditCadastroNMUF.Enabled := false;
      ButtonLimparUF.Enabled := false;
      ButtonNovoUF.Enabled := false;

      // Localidade
      EditCadastroCDLocalidade.Enabled := false;
      EditCadastroNMUF.Enabled := false;
      ButtonLimparUF.Enabled := false;
      ButtonNovoUF.Enabled := false;
    end;

    // Valida para qual campo vai se posicionar.
    if plPais.Count > 0 then
      ActiveControl := EditCadastroCDUF
    else
      ActiveControl := EditCadastroCDPAIS;

    // País
    EditCadastroCDPAIS.Enabled := (plPais.Count = 0);
    EditCadastroSGPAIS.Enabled := (plPais.Count = 0);
    EditCadastroNMPAIS.Enabled := (plPais.Count = 0);
    ButtonLimparPais.Enabled := (plPais.Count > 0);
    ButtonNovoPais.Enabled := (plPais.Count = 0);
  end;
end;

procedure TfmCadBairro.EditCadastroCDUFChange(Sender: TObject);
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
      OnChange := EditCadastroCDUFChange;
      SelStart := Length(Text);
    end;
end;

procedure TfmCadBairro.EditCadastroCDUFExit(Sender: TObject);
var
  vQuery: TZQuery;
begin
  // Se não digitou nada, sai sem abrir a search.
  if Length(Trim(EditCadastroCDUF.Text)) = 0 then
    Exit;

  try
    vQuery := pUnidadeFederacao.filtro;
    with vQuery do
    begin
      SQL.Add('WHERE "NU-Código" = :CDUF');
      // Trata especificamente de relacionar as U.F. com um País.
      SQL.Add('  AND "NU-Código" IN (SELECT cduf');
      SQL.Add('                      FROM ' + cSchema + '.uf');
      SQL.Add('                      WHERE cdpais = :CDPAIS)');
      Params.ParamByName('CDPAIS').AsInteger := StrToInt(EditCadastroCDPAIS.Text);
      Params.ParamByName('CDUF').AsInteger := StrToInt(EditCadastroCDUF.Text);
      dmPrincipal.executaConsulta(vQuery);

      if not Eof then
      begin
        plUnidadeFederacao.Clear;
        plUnidadeFederacao.Add(Fields.Fields[0].AsString);
        EditCadastroCDUF.Text := Fields.Fields[0].AsString;
        EditCadastroSGUF.Text := Fields.Fields[1].AsString;
        EditCadastroNMUF.Text := Fields.Fields[2].AsString;
      end
      else
      begin
        plUnidadeFederacao.Clear;
        EditCadastroCDUF.Clear;
        EditCadastroSGUF.Clear;
        EditCadastroNMUF.Clear;
        fmPrincipal.apresentaResultadoCadastro('Nenhum registro encontrado.');
      end;
      Active := false;
    end;
  finally
    FreeAndNil(vQuery);

    // Limpas os combos dependentes.
    ButtonLimparLocalidadeClick(Sender);
    if plUnidadeFederacao.Count = 0 then
    begin
      // Localidade
      EditCadastroCDLocalidade.Enabled := false;
      EditCadastroNMUF.Enabled := false;
      ButtonLimparUF.Enabled := false;
      ButtonNovoUF.Enabled := false;
    end;

    // Valida para qual campo vai se posicionar.
    if plUnidadeFederacao.Count > 0 then
      ActiveControl := EditCadastroCDLOCALIDADE
    else
      ActiveControl := EditCadastroCDUF;

    EditCadastroCDUF.Enabled := (plUnidadeFederacao.Count = 0);
    EditCadastroSGUF.Enabled := (plUnidadeFederacao.Count = 0);
    EditCadastroNMUF.Enabled := (plUnidadeFederacao.Count = 0);
    ButtonLimparUF.Enabled := (plUnidadeFederacao.Count > 0);
    ButtonNovoUF.Enabled := (plUnidadeFederacao.Count = 0);
  end;
end;

procedure TfmCadBairro.EditCadastroSGPAISExit(Sender: TObject);
var
  i: integer;
  vQuery: TZQuery;
begin
  // Se não digitou nada, sai sem abrir a search.
  if Length(Trim(EditCadastroSGPAIS.Text)) = 0 then
    Exit;

  try
    vQuery := pPais.filtro;
    with vQuery do
    begin
      SQL.Add('WHERE "SG-Sigla" LIKE :SGPAIS');
      Params.ParamByName('SGPAIS').AsString := EditCadastroSGPAIS.Text+'%';
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
            executaFiltro(2,EditCadastroSGPAIS.Text);
            ShowModal;
          finally
            plPais.Clear;
            with pResSearch do
              for i := 0 to Count -1 do
                if objResSearch[i].Id = buscaId then
                begin
                  plPais.Add(objResSearch[i].Codigo);
                  EditCadastroCDPAIS.Text := objResSearch[i].Codigo;
                  EditCadastroSGPAIS.Text := objResSearch[i].Nome1;
                  EditCadastroNMPAIS.Text := objResSearch[i].Nome2;
                end;
          end;
        end;
      end
      else
        if not Eof then
        begin
          plPais.Clear;
          plPais.Add(Fields.Fields[0].AsString);
          EditCadastroCDPAIS.Text := Fields.Fields[0].AsString;
          EditCadastroSGPAIS.Text := Fields.Fields[1].AsString;
          EditCadastroNMPAIS.Text := Fields.Fields[2].AsString;
        end
        else
          fmPrincipal.apresentaResultadoCadastro('Nenhum registro encontrado.');
      Active := false;
    end;
  finally
    FreeAndNil(vQuery);

    // Limpas os combos dependentes.
    ButtonLimparUFClick(Sender);
    if plPais.Count = 0 then
    begin
      // U.F.
      EditCadastroCDUF.Enabled := false;
      EditCadastroSGUF.Enabled := false;
      EditCadastroNMUF.Enabled := false;
      ButtonLimparUF.Enabled := false;
      ButtonNovoUF.Enabled := false;

      // Localidade
      EditCadastroCDLocalidade.Enabled := false;
      EditCadastroNMUF.Enabled := false;
      ButtonLimparUF.Enabled := false;
      ButtonNovoUF.Enabled := false;
    end;

    // Valida para qual campo vai se posicionar.
    if plPais.Count > 0 then
      ActiveControl := EditCadastroCDUF
    else
      ActiveControl := EditCadastroSGPAIS;

    // País
    EditCadastroCDPAIS.Enabled := (plPais.Count = 0);
    EditCadastroSGPAIS.Enabled := (plPais.Count = 0);
    EditCadastroNMPAIS.Enabled := (plPais.Count = 0);
    ButtonLimparPais.Enabled := (plPais.Count > 0);
    ButtonNovoPais.Enabled := (plPais.Count = 0);
  end;
end;

procedure TfmCadBairro.EditCadastroSGUFExit(Sender: TObject);
var
  i: integer;
  vQuery: TZQuery;
begin
  // Se não digitou nada, sai sem abrir a search.
  if Length(Trim(EditCadastroSGUF.Text)) = 0 then
    Exit;

  try
    vQuery := pUnidadeFederacao.filtro;
    with vQuery do
    begin
      SQL.Add('WHERE "SG-Sigla" LIKE :SGUF');
      // Trata especificamente de relacionar as U.F. com um País.
      SQL.Add('  AND "NU-Código" IN (SELECT cduf');
      SQL.Add('                      FROM ' + cSchema + '.uf');
      SQL.Add('                      WHERE cdpais = :CDPAIS)');
      Params.ParamByName('CDPAIS').AsInteger := StrToInt(EditCadastroCDPAIS.Text);
      Params.ParamByName('SGUF').AsString := '%'+EditCadastroSGUF.Text+'%';
      dmPrincipal.executaConsulta(vQuery);

      if RecordCount > 1 then
      begin
        fmConFiltroPadrao := TfmConFiltroPadrao.Create(Self);
        with fmConFiltroPadrao do
        begin
          try
            setaTitulo('Consulta de Unidades da Federação');
            setaConsulta(pUnidadeFederacao.filtro);
            setaOpcao('R');
            // Trata especificamente de relacionar as U.F. com um País.
            setaFiltrosExtras('"NU-Código" IN (SELECT cduf'#13#10+
                              '                FROM ' + cSchema + '.uf'#13#10+
                              '                WHERE cdpais = '+EditCadastroCDPAIS.Text+')',
                              'Nome do País: '+EditCadastroNMPAIS.Text);
            executaFiltro(2,EditCadastroSGUF.Text);
            ShowModal;
          finally
            plUnidadeFederacao.Clear;
            with pResSearch do
              for i := 0 to Count -1 do
                if objResSearch[i].Id = buscaId then
                begin
                  plUnidadeFederacao.Add(objResSearch[i].Codigo);
                  EditCadastroCDUF.Text := objResSearch[i].Codigo;
                  EditCadastroSGUF.Text := objResSearch[i].Nome1;
                  EditCadastroNMUF.Text := objResSearch[i].Nome2;
                end;
          end;
        end;
      end
      else
        if not Eof then
        begin
          plUnidadeFederacao.Clear;
          plUnidadeFederacao.Add(Fields.Fields[0].AsString);
          EditCadastroCDUF.Text := Fields.Fields[0].AsString;
          EditCadastroSGUF.Text := Fields.Fields[1].AsString;
          EditCadastroNMUF.Text := Fields.Fields[2].AsString;
        end
        else
          fmPrincipal.apresentaResultadoCadastro('Nenhum registro encontrado.');
      Active := false;
    end;
  finally
    FreeAndNil(vQuery);

    // Limpas os combos dependentes.
    ButtonLimparLocalidadeClick(Sender);
    if plUnidadeFederacao.Count = 0 then
    begin
      // Localidade
      EditCadastroCDLocalidade.Enabled := false;
      EditCadastroNMUF.Enabled := false;
      ButtonLimparUF.Enabled := false;
      ButtonNovoUF.Enabled := false;
    end;

    // Valida para qual campo vai se posicionar.
    if plUnidadeFederacao.Count > 0 then
      ActiveControl := EditCadastroCDLOCALIDADE
    else
      ActiveControl := EditCadastroSGUF;

    EditCadastroCDUF.Enabled := (plUnidadeFederacao.Count = 0);
    EditCadastroSGUF.Enabled := (plUnidadeFederacao.Count = 0);
    EditCadastroNMUF.Enabled := (plUnidadeFederacao.Count = 0);
    ButtonLimparUF.Enabled := (plUnidadeFederacao.Count > 0);
    ButtonNovoUF.Enabled := (plUnidadeFederacao.Count = 0);
  end;
end;

procedure TfmCadBairro.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  QueryGeral.Close;

  Action := caFree;
end;

procedure TfmCadBairro.FormCreate(Sender: TObject);
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

    plPais := TStringList.Create;
    plUnidadeFederacao := TStringList.Create;
    plLocalidade := TStringList.Create;

    pBairro := TBairro.Create;
    pInformacaoGeografica := TInformacaoGeografica.Create;
    pPais := TPais.Create;
    pUnidadeFederacao := TUnidadeFederacao.Create;
    pLocalidade := TLocalidade.Create;

    OfficePagerCentral.ActivePageIndex := 1;

    Ordenacao := '|"Código":"N":"Asc."|;|"País":"S":"Asc."|;|"Unidade da Federação":"S":"Asc."|;|"Localidade":"S":"Asc."|;|"Bairro":"S":"Asc."|';

    // Monta a consulta que carregará os dados da Grid.
    with QueryGeral do
    begin
      SQL := pBairro.visao.SQL;
      SQL.Strings[0] := 'SELECT DISTINCT cdbairro,nmpais,nmuf,nmlocalidade,nmbairro';
      SQL.Add('ORDER BY 2,3,4,5');
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

procedure TfmCadBairro.FormDestroy(Sender: TObject);
begin
  FreeAndNil(plPais);
  FreeAndNil(plUnidadeFederacao);
  FreeAndNil(plLocalidade);
  FreeAndNil(pBairro);
  FreeAndNil(pInformacaoGeografica);
  FreeAndNil(pPais);
  FreeAndNil(pUnidadeFederacao);
  FreeAndNil(pLocalidade);
end;

procedure TfmCadBairro.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Exit;
end;

procedure TfmCadBairro.FormResize(Sender: TObject);
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

procedure TfmCadBairro.habilitaBotoes;
begin
  BitBtnSalvar.Enabled := true;
  BitBtnExcluir.Enabled := true;
  BitBtnRestaurar.Enabled := true;
  BitBtnNovo.Enabled := true;
end;

procedure TfmCadBairro.ButtonLimparLocalidadeClick(Sender: TObject);
begin
  plLocalidade.Clear;

  EditCadastroCDLOCALIDADE.Clear;
  EditCadastroNMLOCALIDADE.Clear;

  EditCadastroCDLOCALIDADE.Enabled := true;
  EditCadastroNMLOCALIDADE.Enabled := true;
  ButtonLimparLocalidade.Enabled := false;
  ButtonNovoLocalidade.Enabled := true;

  ActiveControl := EditCadastroCDLOCALIDADE;
end;

procedure TfmCadBairro.ButtonLimparPaisClick(Sender: TObject);
begin
  limparCamposPais;

  EditCadastroCDPAIS.Enabled := true;
  EditCadastroSGPAIS.Enabled := true;
  EditCadastroNMPAIS.Enabled := true;

  ButtonLimparPais.Enabled := false;
  ButtonNovoPais.Enabled := true;

  EditCadastroCDUF.Enabled := false;
  EditCadastroSGUF.Enabled := false;
  EditCadastroNMUF.Enabled := false;

  ButtonLimparUF.Enabled := false;
  ButtonNovoUF.Enabled := false;

  EditCadastroCDLOCALIDADE.Enabled := false;
  EditCadastroNMLOCALIDADE.Enabled := false;
  ButtonLimparLocalidade.Enabled := false;
  ButtonNovoLocalidade.Enabled := false;

  ActiveControl := EditCadastroCDPAIS;
end;

procedure TfmCadBairro.ButtonLimparUFClick(Sender: TObject);
begin
  limparCamposUF;

  EditCadastroCDUF.Enabled := true;
  EditCadastroSGUF.Enabled := true;
  EditCadastroNMUF.Enabled := true;

  ButtonLimparUF.Enabled := false;
  ButtonNovoUF.Enabled := true;

  EditCadastroCDLOCALIDADE.Enabled := false;
  EditCadastroNMLOCALIDADE.Enabled := false;
  ButtonLimparLocalidade.Enabled := false;
  ButtonNovoLocalidade.Enabled := false;

  ActiveControl := EditCadastroCDUF;
end;

procedure TfmCadBairro.ButtonNovoLocalidadeClick(Sender: TObject);
var
  vcdPais, vcdUF, vcdLocalidade: integer;
begin
  vcdPais := StrToInt(EditCadastroCDPAIS.Text);
  vcdUF := StrToInt(EditCadastroCDUF.Text);
  vcdLocalidade := 0;

  try
    fmCadLocalidade := TfmCadLocalidade.Create(Self);
    with fmCadLocalidade do
    begin
      try
        Tag := 1;
        fmCadLocalidade.setaCadastroUnico(vcdPais, vcdUF);
        ShowModal;

        vcdLocalidade := fmCadLocalidade.Codigo;
      except
        on E: exception do
          raise exception.Create('Não foi possível abrir a tela de Cadastro de Localidade.'+#13#10+E.Message);
      end;
    end;
  finally
    // Verifica se foi cadastrado uma localidade.
    if vcdLocalidade > 0 then
    begin
      EditCadastroCDLOCALIDADE.Text := IntToStr(vcdLocalidade);
      EditCadastroCDLOCALIDADEExit(EditCadastroCDLOCALIDADE);
    end;
  end;
end;

procedure TfmCadBairro.ButtonNovoPaisClick(Sender: TObject);
var
  vcdPais: integer;
begin
  vcdPais := 0;

  try
    fmCadPais := TfmCadPais.Create(Self);
    with fmCadPais do
    begin
      try
        Tag := 1;
        fmCadPais.setaCadastroUnico;
        ShowModal;

        vcdPais := fmCadPais.Codigo;
      except
        on E: exception do
          raise exception.Create('Não foi possível abrir a tela de Cadastro de País.'+#13#10+E.Message);
      end;
    end;
  finally
    // Verifica se foi cadastrado um país.
    if vcdPais > 0 then
    begin
      EditCadastroCDPAIS.Text := IntToStr(vcdPais);
      EditCadastroCDPAISExit(EditCadastroCDPAIS);
    end;
  end;
end;

procedure TfmCadBairro.ButtonNovoUFClick(Sender: TObject);
var
  vcdPais, vcdUF: integer;
begin
  vcdPais := StrToInt(EditCadastroCDPAIS.Text);
  vcdUF := 0;

  try
    fmCadUF := TfmCadUF.Create(Self);
    with fmCadUF do
    begin
      try
        Tag := 1;
        fmCadUF.setaCadastroUnico(vcdPais);
        ShowModal;

        vcdUF := fmCadUF.Codigo;
      except
        on E: exception do
          raise exception.Create('Não foi possível abrir a tela de Cadastro de Unidade da Federação.'+#13#10+E.Message);
      end;
    end;
  finally
    // Verifica se foi cadastrado uma u.f.
    if vcdUF > 0 then
    begin
      EditCadastroCDUF.Text := IntToStr(vcdUF);
      EditCadastroCDUFExit(EditCadastroCDUF);
    end;
  end;
end;

procedure TfmCadBairro.MenuItemAtualizarTabelaClick(Sender: TObject);
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
      editaColunaGrid(1,'CDBAIRRO','Código',edNone,taRightJustify,40,true);
      editaColunaGrid(2,'NMPAIS','País',edNone,taLeftJustify,200,true);
      editaColunaGrid(3,'NMUF','Unidade da Federação',edNone,taLeftJustify,200,true);
      editaColunaGrid(4,'NMLOCALIDADE','Localidade',edNone,taLeftJustify,200,true);
      editaColunaGrid(5,'NMBAIRRO','Bairro',edNone,taLeftJustify,200,true);
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

procedure TfmCadBairro.MenuItemEditarRegistroClick(Sender: TObject);
begin
  Opcao := 'A';
  with DBAdvGridGeral do
    Codigo := ColumnByName['CDBAIRRO'].Ints[Row];
  editaCadastro;
  habilitaBotoes;

  ActiveControl := EditCadastroNMBAIRRO;
end;

procedure TfmCadBairro.MenuItemVisualizarFiltroClick(Sender: TObject);
begin
  GridFindDialogColumnGrid.Execute;
end;

procedure TfmCadBairro.novoCadastro;
begin
  OfficePagerCentral.ActivePageIndex := 1;

  EditCadastroCDBAIRRO.Clear;
  EditCadastroNMBAIRRO.Clear;
  ButtonLimparPaisClick(ButtonLimparPais);

  if EditCadastroCDPAIS.Enabled then
    ActiveControl := EditCadastroCDPAIS;

  ActiveControl := EditCadastroCDPAIS;
end;

procedure TfmCadBairro.OfficePageCadastroClick(Sender: TObject);
begin
  if EditCadastroCDPAIS.Enabled then
    ActiveControl := EditCadastroCDPAIS
  else
    if EditCadastroCDUF.Enabled then
      ActiveControl := EditCadastroCDUF
    else
      if EditCadastroCDLOCALIDADE.Enabled then
        ActiveControl := EditCadastroCDLOCALIDADE
      else
        ActiveControl := EditCadastroNMBAIRRO;
end;

procedure TfmCadBairro.setaCadastroUnico(prmcdPais, prmcdUF,
  prmcdLocalidade: integer);
begin
  EditCadastroCDPAIS.Text := IntToStr(prmcdPais);
  EditCadastroCDPAISExit(EditCadastroCDPAIS);
  EditCadastroCDUF.Text := IntToStr(prmcdUF);
  EditCadastroCDUFExit(EditCadastroCDUF);
  EditCadastroCDLOCALIDADE.Text := IntToStr(prmcdLocalidade);
  EditCadastroCDLOCALIDADEExit(EditCadastroCDLOCALIDADE);
  ButtonLimparPais.Enabled := false;
  ButtonNovoPais.Enabled := false;
  ButtonLimparUF.Enabled := false;
  ButtonNovoUF.Enabled := false;
  ButtonLimparLocalidade.Enabled := false;
  ButtonNovoLocalidade.Enabled := false;
  BitBtnExcluir.Enabled := false;
  BitBtnRestaurar.Enabled := false;
  BitBtnNovo.Enabled := false;
  OfficePageConsulta.TabVisible := false;
end;

procedure TfmCadBairro.ButtonExportarHTMLClick(Sender: TObject);
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

procedure TfmCadBairro.ButtonExportarPlanilhaClick(Sender: TObject);
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

procedure TfmCadBairro.ButtonImprimirRelatorioClick(Sender: TObject);
begin
  try
    QueryRelBairro.SQL := pBairro.relatorio.SQL;
    dmPrincipal.executaConsulta(QueryRelBairro);
    with fmPrincipal.SystemRelatorio do
    begin
      DefaultDest := rdPreview;
      SystemSetups := SystemSetups - [ssAllowSetup];
      DoNativeOutput := false;
    end;
    with ProjectRelBairro do
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

procedure TfmCadBairro.ButtonOrdenarRegistrosClick(Sender: TObject);
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

procedure TfmCadBairro.carregaImagensBotoes;
begin
  EditCadastroNMPAIS.Button.Glyph.Assign(fmPrincipal.fnGeral.obtemImagemPesquisa);
  EditCadastroNMUF.Button.Glyph.Assign(fmPrincipal.fnGeral.obtemImagemPesquisa);
  EditCadastroNMLOCALIDADE.Button.Glyph.Assign(fmPrincipal.fnGeral.obtemImagemPesquisa);

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
  ButtonLimparUF.Picture.LoadFromFile(fmPrincipal.LocalIcones + 'erase-e-16.png');
  ButtonLimparUF.HotPicture.LoadFromFile(fmPrincipal.LocalIcones + 'erase-h-16.png');
  ButtonLimparUF.DisabledPicture.LoadFromFile(fmPrincipal.LocalIcones + 'erase-d-16.png');
  ButtonLimparLocalidade.Picture.LoadFromFile(fmPrincipal.LocalIcones + 'erase-e-16.png');
  ButtonLimparLocalidade.HotPicture.LoadFromFile(fmPrincipal.LocalIcones + 'erase-h-16.png');
  ButtonLimparLocalidade.DisabledPicture.LoadFromFile(fmPrincipal.LocalIcones + 'erase-d-16.png');
  ButtonNovoPais.Picture.LoadFromFile(fmPrincipal.LocalIcones + 'new-e-16.png');
  ButtonNovoPais.HotPicture.LoadFromFile(fmPrincipal.LocalIcones + 'new-h-16.png');
  ButtonNovoPais.DisabledPicture.LoadFromFile(fmPrincipal.LocalIcones + 'new-d-16.png');
  ButtonNovoUF.Picture.LoadFromFile(fmPrincipal.LocalIcones + 'new-e-16.png');
  ButtonNovoUF.HotPicture.LoadFromFile(fmPrincipal.LocalIcones + 'new-h-16.png');
  ButtonNovoUF.DisabledPicture.LoadFromFile(fmPrincipal.LocalIcones + 'new-d-16.png');
  ButtonNovoLocalidade.Picture.LoadFromFile(fmPrincipal.LocalIcones + 'new-e-16.png');
  ButtonNovoLocalidade.HotPicture.LoadFromFile(fmPrincipal.LocalIcones + 'new-h-16.png');
  ButtonNovoLocalidade.DisabledPicture.LoadFromFile(fmPrincipal.LocalIcones + 'new-d-16.png');
end;

function TfmCadBairro.validaExclusao: boolean;
var
  vMensagem: string;
begin
  vMensagem := EmptyStr;

  try
    pBairro.Codigo := Codigo;
    if pBairro.existeDependencia then
      vMensagem := '- Existem CEP''s relacionados a este bairro.';

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
