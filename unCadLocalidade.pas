unit unCadLocalidade;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, Grids, AdvObj, BaseGrid, AdvGrid, AdvCGrid, AsgFindDialog, ComCtrls,
  Menus, UnAplExportaXLS, ImgList, ToolWin, MaskUtils, DBAdvGrid, RpCon,
  RpConDS, RpBase, RpSystem, RpDefine, RpRave, RpRender, RpRenderPDF, ShellAPI,
  Mask, AdvGlowButton, AdvPanel, AdvMenus, AdvAppStyler, AdvEdit, AdvEdBtn,
  AdvOfficeButtons, AdvToolBar, tmsAdvGridExcel, AdvOfficePager, unLocalidade,
  unPais, unInformacaoGeografica, unUnidadeFederacao;

type
  TfmCadLocalidade = class(TForm)
    QueryGeral: TZQuery;
    GridFindDialogColumnGrid: TAdvGridFindDialog;
    DBAdvGridGeral: TDBAdvGrid;
    DataSource: TDataSource;
    LabelCodigo: TLabel;
    LabelPais: TLabel;
    LabelLocalidade: TLabel;
    LabelUF: TLabel;
    LabelDDD: TLabel;
    SaveDialog: TSaveDialog;
    ProjectRelLocalidade: TRvProject;
    DataSetConnectionRelLocalidade: TRvDataSetConnection;
    QueryRelLocalidade: TZQuery;
    ButtonLimparPais: TAdvGlowButton;
    ButtonNovoPais: TAdvGlowButton;
    ButtonLimparUF: TAdvGlowButton;
    ButtonNovoUF: TAdvGlowButton;
    PanelBotoes: TAdvPanel;
    BitBtnFechar: TAdvGlowButton;
    BitBtnSalvar: TAdvGlowButton;
    BitBtnNovo: TAdvGlowButton;
    BitBtnExcluir: TAdvGlowButton;
    BitBtnRestaurar: TAdvGlowButton;
    PopupMenuGrid: TAdvPopupMenu;
    MenuItemEditarRegistro: TMenuItem;
    MenuItemAtualizarTabela: TMenuItem;
    MenuItemEspaco1: TMenuItem;
    MenuItemVisualizarFiltro: TMenuItem;
    FormStyler: TAdvFormStyler;
    EditCadastroCDLOCALIDADE: TAdvEdit;
    EditCadastroNMLOCALIDADE: TAdvEdit;
    EditCadastroNUPREFIXO: TAdvEdit;
    EditCadastroCDPAIS: TAdvEdit;
    EditCadastroSGPAIS: TAdvEdit;
    EditCadastroCDUF: TAdvEdit;
    EditCadastroSGUF: TAdvEdit;
    EditCadastroNMPAIS: TAdvEditBtn;
    EditCadastroNMUF: TAdvEditBtn;
    CheckBoxCadastroFLCAPITAL: TAdvOfficeCheckBox;
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
    procedure ButtonOrdenarRegistrosClick(Sender: TObject);
    procedure OfficePageCadastroShow(Sender: TObject);
    procedure EditCadastroNMPAISClickBtn(Sender: TObject);
    procedure EditCadastroNMUFClickBtn(Sender: TObject);
    procedure EditCadastroCDPAISChange(Sender: TObject);
    procedure EditCadastroCDUFChange(Sender: TObject);
    procedure EditCadastroNUPREFIXOChange(Sender: TObject);
  private
    { Private declarations }
    pId: TGUID;
    plPais, plUnidadeFederacao: TStringList;
    pOpcao: Char;
    pCodigo, pEspacamentoInicial, pEspacamentoFinal, pEspacamentoEntre: integer;
    pOrdenacao: string;
    pLocalidade: TLocalidade;
    pInformacaoGeografica: TInformacaoGeografica;
    pPais: TPais;
    pUnidadeFederacao: TUnidadeFederacao;
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
    function validaExclusao: boolean;
    procedure carregaImagensBotoes;
    property EspacamentoInicial: integer read pEspacamentoInicial write pEspacamentoInicial;
    property EspacamentoEntre: integer read pEspacamentoEntre write pEspacamentoEntre;
    property EspacamentoFinal: integer read pEspacamentoFinal write pEspacamentoFinal;
  public
    { Public declarations }
    procedure setaCadastroUnico(prmcdPais, prmcdUF: integer);
    property Opcao: char read pOpcao write pOpcao;
    property Codigo: integer read pCodigo write pCodigo;
    property Ordenacao: string read pOrdenacao write pOrdenacao;
  end;

var
  fmCadLocalidade: TfmCadLocalidade;

implementation

uses unPrincipal, unConFiltroPadrao, undmPrincipal, undmEstilo, unCadPais,
  unCadUF, unAplOrdenaGrid;

{$R *.dfm}

procedure TfmCadLocalidade.atualizaCadastro;
var
  vRetorno: integer;
begin
  try
    pLocalidade.Codigo := Codigo;
    pLocalidade.UnidadeFederacao := StrToInt(EditCadastroCDUF.Text);
    pLocalidade.Nome := EditCadastroNMLOCALIDADE.Text;
    if EditCadastroNUPREFIXO.Text = EmptyStr then
      pLocalidade.Prefixo := -1
    else
      pLocalidade.Prefixo := StrToInt(EditCadastroNUPREFIXO.Text);
    if CheckBoxCadastroFLCAPITAL.Checked = true then
      pLocalidade.Capital := 'S'
    else
      pLocalidade.Capital := 'N';
    vRetorno := pLocalidade.atualiza;

    if vRetorno <> 0 then
      fmPrincipal.apresentaResultadoCadastro('Cadastro atualizado com sucesso.')
    else
      fmPrincipal.apresentaResultadoCadastro('N�o foi poss�vel atualizar o cadastro.');
  except
    on E: exception do
      raise;
  end;
end;

procedure TfmCadLocalidade.BitBtnRestaurarClick(Sender: TObject);
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

procedure TfmCadLocalidade.BitBtnExcluirClick(Sender: TObject);
var
  vRetorno: integer;
begin
  // Valida se realmente o usu�rio quer realizar a exclus�o.
  if MessageBox(fmPrincipal.Handle,
                PWideChar('Confirma a exclus�o da localidade?'),
                cTituloMensagemConfirmacao,
                MB_YESNO or MB_ICONQUESTION or MB_DEFBUTTON2) = IDNO then
    Exit;
  // Valida se � poss�vel realizar a exclus�o.
  if not validaExclusao then
    Exit;

  desabilitaBotoes;
  try
    pLocalidade.Codigo := Codigo;
    vRetorno := pLocalidade.exclui;

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

procedure TfmCadLocalidade.BitBtnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfmCadLocalidade.insereCadastro;
begin

  try
    pLocalidade.UnidadeFederacao := StrToInt(EditCadastroCDUF.Text);
    pLocalidade.Nome := EditCadastroNMLOCALIDADE.Text;
    if EditCadastroNUPREFIXO.Text = EmptyStr then
      pLocalidade.Prefixo := -1
    else
      pLocalidade.Prefixo := StrToInt(EditCadastroNUPREFIXO.Text);
    if CheckBoxCadastroFLCAPITAL.Checked = true then
      pLocalidade.Capital := 'S'
    else
      pLocalidade.Capital := 'N';
    Codigo := pLocalidade.insere;

    if Codigo <> 0 then
      fmPrincipal.apresentaResultadoCadastro('Cadastro inclu�do com sucesso.')
    else
      fmPrincipal.apresentaResultadoCadastro('N�o foi poss�vel incluir o cadastro.');

    EditCadastroCDPAIS.Text := IntToStr(Codigo);
  except
    on E: exception do
      raise;
  end;
end;

procedure TfmCadLocalidade.limparCamposPais;
begin
  plPais.Clear;

  EditCadastroCDPAIS.Clear;
  EditCadastroSGPAIS.Clear;
  EditCadastroNMPAIS.Clear;
  limparCamposUF;
end;

procedure TfmCadLocalidade.limparCamposUF;
begin
  plUnidadeFederacao.Clear;

  EditCadastroCDUF.Clear;
  EditCadastroSGUF.Clear;
  EditCadastroNMUF.Clear;
end;

procedure TfmCadLocalidade.BitBtnNovoClick(Sender: TObject);
begin
  pOpcao := 'I';
  desabilitaBotoes;
  novoCadastro;
  BitBtnSalvar.Enabled := true;
  BitBtnRestaurar.Enabled := true;
end;

procedure TfmCadLocalidade.BitBtnSalvarClick(Sender: TObject);
var
  vMensagem: string;
begin
  desabilitaBotoes;

  // Valida��es.
  vMensagem := EmptyStr;
  if AnsiCompareText(EditCadastroCDPAIS.Text,EmptyStr) = 0 then
    vMensagem := vMensagem + #13#10'- O campo Pa�s � requerido.';
  if AnsiCompareText(EditCadastroCDUF.Text,EmptyStr) = 0 then
    vMensagem := vMensagem + #13#10'- O campo U.F. � requerido.';
  if AnsiCompareText(EditCadastroNMLOCALIDADE.Text,EmptyStr) = 0 then
    vMensagem := vMensagem + #13#10'- O campo Localidade � requerido.';

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
    ActiveControl := EditCadastroNMLOCALIDADE;
  except
    on E: Exception do
    begin
      fmPrincipal.apresentaResultadoCadastro(E.Message);
      fmPrincipal.manipulaExcecoes(Sender,E);
    end;
  end;
end;

procedure TfmCadLocalidade.EditCadastroNMPAISClickBtn(Sender: TObject);
var
  i: integer;
begin
  fmConFiltroPadrao := TfmConFiltroPadrao.Create(Self);
  try
    with fmConFiltroPadrao do
    begin
      try
        setaTitulo('Consulta de Pa�ses');
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
    ButtonLimparUFClick(Sender);
    if plPais.Count = 0 then
    begin
      // U.F.
      EditCadastroCDUF.Enabled := false;
      EditCadastroSGUF.Enabled := false;
      EditCadastroNMUF.Enabled := false;
      ButtonLimparUF.Enabled := false;
      ButtonNovoUF.Enabled := false;
    end;

    // Valida para qual campo vai se posicionar.
    if plPais.Count > 0 then
      ActiveControl := EditCadastroCDUF
    else
      ActiveControl := EditCadastroNMPAIS;

    // Pa�s
    EditCadastroCDPAIS.Enabled := (plPais.Count = 0);
    EditCadastroSGPAIS.Enabled := (plPais.Count = 0);
    EditCadastroNMPAIS.Enabled := (plPais.Count = 0);
    ButtonLimparPais.Enabled := (plPais.Count > 0);
    ButtonNovoPais.Enabled := (plPais.Count = 0);
  end;
end;

procedure TfmCadLocalidade.EditCadastroNMPAISExit(Sender: TObject);
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
      SQL.Add('WHERE UPPER("NM-Pa�s") LIKE :NMPAIS');
      Params.ParamByName('NMPAIS').AsString := '%'+AnsiUpperCase(EditCadastroNMPAIS.Text)+'%';
      dmPrincipal.executaConsulta(vQuery);
      if RecordCount > 1 then
      begin
        fmConFiltroPadrao := TfmConFiltroPadrao.Create(Self);
        with fmConFiltroPadrao do
        begin
          try
            setaTitulo('Consulta de Pa�ses');
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

    ButtonLimparUFClick(Sender);
    if plPais.Count = 0 then
    begin
      // U.F.
      EditCadastroCDUF.Enabled := false;
      EditCadastroSGUF.Enabled := false;
      EditCadastroNMUF.Enabled := false;
      ButtonLimparUF.Enabled := false;
      ButtonNovoUF.Enabled := false;
    end;

    // Valida para qual campo vai se posicionar.
    if plPais.Count > 0 then
      ActiveControl := EditCadastroCDUF
    else
      ActiveControl := EditCadastroNMPAIS;

    // Pa�s
    EditCadastroCDPAIS.Enabled := (plPais.Count = 0);
    EditCadastroSGPAIS.Enabled := (plPais.Count = 0);
    EditCadastroNMPAIS.Enabled := (plPais.Count = 0);
    ButtonLimparPais.Enabled := (plPais.Count > 0);
    ButtonNovoPais.Enabled := (plPais.Count = 0);
  end;
end;

procedure TfmCadLocalidade.EditCadastroNMUFClickBtn(Sender: TObject);
var
  i: integer;
begin
  fmConFiltroPadrao := TfmConFiltroPadrao.Create(Self);
  try
    with fmConFiltroPadrao do
    begin
      try
        setaTitulo('Consulta de Unidades da Federa��o');
        setaConsulta(pUnidadeFederacao.filtro);
        setaOpcao('R');
        // Trata especificamente de relacionar as U.F. com um Pa�s.
        setaFiltrosExtras('"NU-C�digo" IN (SELECT cduf'#13#10+
                          '                FROM ' + cSchema + '.uf'#13#10+
                          '                WHERE cdpais = '+EditCadastroCDPAIS.Text+')',
                          'Nome do Pa�s: '+EditCadastroNMPAIS.Text);
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
    // Valida para qual campo vai se posicionar.
    if plUnidadeFederacao.Count > 0 then
      ActiveControl := EditCadastroNMLOCALIDADE
    else
      ActiveControl := EditCadastroNMUF;

    EditCadastroCDUF.Enabled := (plUnidadeFederacao.Count = 0);
    EditCadastroSGUF.Enabled := (plUnidadeFederacao.Count = 0);
    EditCadastroNMUF.Enabled := (plUnidadeFederacao.Count = 0);
    ButtonLimparUF.Enabled := (plUnidadeFederacao.Count > 0);
    ButtonNovoUF.Enabled := (plUnidadeFederacao.Count = 0);
  end;
end;

procedure TfmCadLocalidade.EditCadastroNMUFExit(Sender: TObject);
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
      // Trata especificamente de relacionar as U.F. com um Pa�s.
      SQL.Add('  AND "NU-C�digo" IN (SELECT taux.cduf');
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
            setaTitulo('Consulta de Unidades da Federa��o');
            setaConsulta(pUnidadeFederacao.filtro);
            setaOpcao('R');
            // Trata especificamente de relacionar as U.F. com um Pa�s.
            setaFiltrosExtras('"NU-C�digo" IN (SELECT cduf'#13#10+
                              '                FROM ' + cSchema + '.uf'#13#10+
                              '                WHERE cdpais = '+EditCadastroCDPAIS.Text+')',
                              'Nome do Pa�s: '+EditCadastroNMPAIS.Text);
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

    // Valida para qual campo vai se posicionar.
    if plUnidadeFederacao.Count > 0 then
      ActiveControl := EditCadastroNMLOCALIDADE
    else
      ActiveControl := EditCadastroNMUF;

    EditCadastroCDUF.Enabled := (plUnidadeFederacao.Count = 0);
    EditCadastroSGUF.Enabled := (plUnidadeFederacao.Count = 0);
    EditCadastroNMUF.Enabled := (plUnidadeFederacao.Count = 0);
    ButtonLimparUF.Enabled := (plUnidadeFederacao.Count > 0);
    ButtonNovoUF.Enabled := (plUnidadeFederacao.Count = 0);
  end;
end;

procedure TfmCadLocalidade.EditCadastroNUPREFIXOChange(Sender: TObject);
var
  vChar: char;
begin
  with TAdvEdit(Sender) do
    if Length(Text) > 0 then
    begin
      OnChange := nil;
      vChar := Text[Length(Text)];
      // Verifica se o caractere digitado � v�lido.
      fmPrincipal.fnGeral.verificaNumeros(vChar,7);
      if vChar = #0 then
        Text := Copy(Text,1,Length(Text)-1);
      OnChange := EditCadastroNUPREFIXOChange;
      SelStart := Length(Text);
    end;
end;

procedure TfmCadLocalidade.DBAdvGridGeralDblClickCell(Sender: TObject; ARow,
  ACol: Integer);
begin
  if ARow > 0 then
    MenuItemEditarRegistroClick(MenuItemEditarRegistro);
end;

procedure TfmCadLocalidade.DBAdvGridGeralFilterSelect(Sender: TObject; Column,
  ItemIndex: Integer; FriendlyName: string; var FilterCondition: string);
begin
  case ItemIndex of
    0: FilterCondition := EmptyStr;
    1: FilterCondition := 'S';
    2: FilterCondition := 'N';
  end;

  DBAdvGridGeral.Cells[Column,0] := FriendlyName;
end;

procedure TfmCadLocalidade.desabilitaBotoes;
begin
  BitBtnSalvar.Enabled := false;
  BitBtnExcluir.Enabled := false;
  BitBtnRestaurar.Enabled := false;
  BitBtnNovo.Enabled := false;
end;

procedure TfmCadLocalidade.editaCadastro;
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
        SQL.Add('WHERE cdlocalidade = :CURRENT_CDLOCALIDADE');
        Params.ParamByName('CURRENT_CDLOCALIDADE').AsInteger := Codigo;
        dmPrincipal.executaConsulta(vQuery);

        if not Eof then
        begin
          EditCadastroCDLOCALIDADE.Text := IntToStr(Codigo);
          EditCadastroCDPAIS.Text := Fields.FieldByName('CDPAIS').AsString;
          EditCadastroCDPAISExit(EditCadastroCDPAIS);
          EditCadastroCDUF.Text := Fields.FieldByName('CDUF').AsString;
          EditCadastroCDUFExit(EditCadastroCDUF);
          EditCadastroNMLOCALIDADE.Text := Fields.FieldByName('NMLOCALIDADE').AsString;
          EditCadastroNUPREFIXO.Text := Fields.FieldByName('NUPREFIXO').AsString;
          CheckBoxCadastroFLCAPITAL.Checked := (Fields.FieldByName('FLCAPITAL').AsString = 'S');
        end
        else
          raise exception.Create('O cadastro da Localidade n�o foi encontrado.');
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

procedure TfmCadLocalidade.editaColunaGrid(prmIndice: integer; prmNome,
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

procedure TfmCadLocalidade.EditCadastroCDPAISChange(Sender: TObject);
var
  vChar: char;
begin
  with TAdvEdit(Sender) do
    if Length(Text) > 0 then
    begin
      OnChange := nil;
      vChar := Text[Length(Text)];
      // Verifica se o caractere digitado � v�lido.
      fmPrincipal.fnGeral.verificaNumeros(vChar,7);
      if vChar = #0 then
        Text := Copy(Text,1,Length(Text)-1);
      OnChange := EditCadastroCDPAISChange;
      SelStart := Length(Text);
    end;
end;

procedure TfmCadLocalidade.EditCadastroCDPAISExit(Sender: TObject);
var
  vQuery: TZQuery;
begin
  // Se n�o digitou nada, sai sem abrir a search.
  if Length(Trim(EditCadastroCDPAIS.Text)) = 0 then
    Exit;

  try
    vQuery := pPais.filtro;
    with vQuery do
    begin
      SQL.Add('WHERE "NU-C�digo" = :CDPAIS');
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

    ButtonLimparUFClick(Sender);
    if plPais.Count = 0 then
    begin
      // U.F.
      EditCadastroCDUF.Enabled := false;
      EditCadastroSGUF.Enabled := false;
      EditCadastroNMUF.Enabled := false;
      ButtonLimparUF.Enabled := false;
      ButtonNovoUF.Enabled := false;
    end;

    // Valida para qual campo vai se posicionar.
    if plPais.Count > 0 then
      ActiveControl := EditCadastroCDUF
    else
      ActiveControl := EditCadastroCDPAIS;

    // Pa�s
    EditCadastroCDPAIS.Enabled := (plPais.Count = 0);
    EditCadastroSGPAIS.Enabled := (plPais.Count = 0);
    EditCadastroNMPAIS.Enabled := (plPais.Count = 0);
    ButtonLimparPais.Enabled := (plPais.Count > 0);
    ButtonNovoPais.Enabled := (plPais.Count = 0);
  end;
end;

procedure TfmCadLocalidade.EditCadastroCDUFChange(Sender: TObject);
var
  vChar: char;
begin
  with TAdvEdit(Sender) do
    if Length(Text) > 0 then
    begin
      OnChange := nil;
      vChar := Text[Length(Text)];
      // Verifica se o caractere digitado � v�lido.
      fmPrincipal.fnGeral.verificaNumeros(vChar,7);
      if vChar = #0 then
        Text := Copy(Text,1,Length(Text)-1);
      OnChange := EditCadastroCDUFChange;
      SelStart := Length(Text);
    end;
end;

procedure TfmCadLocalidade.EditCadastroCDUFExit(Sender: TObject);
var
  vQuery: TZQuery;
begin
  // Se n�o digitou nada, sai sem abrir a search.
  if Length(Trim(EditCadastroCDUF.Text)) = 0 then
    Exit;

  try
    vQuery := pUnidadeFederacao.filtro;
    with vQuery do
    begin
      SQL.Add('WHERE "NU-C�digo" = :CDUF');
      // Trata especificamente de relacionar as U.F. com um Pa�s.
      SQL.Add('  AND "NU-C�digo" IN (SELECT cduf');
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

    // Valida para qual campo vai se posicionar.
    if plUnidadeFederacao.Count > 0 then
      ActiveControl := EditCadastroNMLOCALIDADE
    else
      ActiveControl := EditCadastroCDUF;

    EditCadastroCDUF.Enabled := (plUnidadeFederacao.Count = 0);
    EditCadastroSGUF.Enabled := (plUnidadeFederacao.Count = 0);
    EditCadastroNMUF.Enabled := (plUnidadeFederacao.Count = 0);
    ButtonLimparUF.Enabled := (plUnidadeFederacao.Count > 0);
    ButtonNovoUF.Enabled := (plUnidadeFederacao.Count = 0);
  end;
end;

procedure TfmCadLocalidade.EditCadastroSGPAISExit(Sender: TObject);
var
  i: integer;
  vQuery: TZQuery;
begin
  // Se n�o digitou nada, sai sem abrir a search.
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
            setaTitulo('Consulta de Pa�ses');
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

    ButtonLimparUFClick(Sender);
    if plPais.Count = 0 then
    begin
      // U.F.
      EditCadastroCDUF.Enabled := false;
      EditCadastroSGUF.Enabled := false;
      EditCadastroNMUF.Enabled := false;
      ButtonLimparUF.Enabled := false;
      ButtonNovoUF.Enabled := false;
    end;

    // Valida para qual campo vai se posicionar.
    if plPais.Count > 0 then
      ActiveControl := EditCadastroCDUF
    else
      ActiveControl := EditCadastroSGPAIS;

    // Pa�s
    EditCadastroCDPAIS.Enabled := (plPais.Count = 0);
    EditCadastroSGPAIS.Enabled := (plPais.Count = 0);
    EditCadastroNMPAIS.Enabled := (plPais.Count = 0);
    ButtonLimparPais.Enabled := (plPais.Count > 0);
    ButtonNovoPais.Enabled := (plPais.Count = 0);
  end;
end;

procedure TfmCadLocalidade.EditCadastroSGUFExit(Sender: TObject);
var
  i: integer;
  vQuery: TZQuery;
begin
  // Se n�o digitou nada, sai sem abrir a search.
  if Length(Trim(EditCadastroSGUF.Text)) = 0 then
    Exit;

  try
    vQuery := pUnidadeFederacao.filtro;
    with vQuery do
    begin
      SQL.Add('WHERE "SG-Sigla" LIKE :SGUF');
      // Trata especificamente de relacionar as U.F. com um Pa�s.
      SQL.Add('  AND "NU-C�digo" IN (SELECT cduf');
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
            setaTitulo('Consulta de Unidades da Federa��o');
            setaConsulta(pUnidadeFederacao.filtro);
            setaOpcao('R');
            // Trata especificamente de relacionar as U.F. com um Pa�s.
            setaFiltrosExtras('"NU-C�digo" IN (SELECT cduf'#13#10+
                              '                FROM ' + cSchema + '.uf'#13#10+
                              '                WHERE cdpais = '+EditCadastroCDPAIS.Text+')',
                              'Nome do Pa�s: '+EditCadastroNMPAIS.Text);
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

    // Valida para qual campo vai se posicionar.
    if plUnidadeFederacao.Count > 0 then
      ActiveControl := EditCadastroNMLOCALIDADE
    else
      ActiveControl := EditCadastroSGUF;

    EditCadastroCDUF.Enabled := (plUnidadeFederacao.Count = 0);
    EditCadastroSGUF.Enabled := (plUnidadeFederacao.Count = 0);
    EditCadastroNMUF.Enabled := (plUnidadeFederacao.Count = 0);
    ButtonLimparUF.Enabled := (plUnidadeFederacao.Count > 0);
    ButtonNovoUF.Enabled := (plUnidadeFederacao.Count = 0);
  end;
end;

procedure TfmCadLocalidade.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  QueryGeral.Close;

  Action := caFree;
end;

procedure TfmCadLocalidade.FormCreate(Sender: TObject);
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

    plPais := TStringList.Create;
    plUnidadeFederacao := TStringList.Create;

    pLocalidade := TLocalidade.Create;
    pInformacaoGeografica := TInformacaoGeografica.Create;
    pPais := TPais.Create;
    pUnidadeFederacao := TUnidadeFederacao.Create;

    OfficePagerCentral.ActivePageIndex := 1;

    Ordenacao := '|"C�digo":"N":"Asc."|;|"Pa�s":"S":"Asc."|;|"Unidade da Federa��o":"S":"Asc."|;|"Localidade":"S":"Asc."|;|"DDD":"N":"Asc."|';

    // Monta a consulta que carregar� os dados da Grid.
    with QueryGeral do
    begin
      SQL := pLocalidade.visao.SQL;
      SQL.Strings[0] := 'SELECT DISTINCT cdlocalidade,nmpais,nmuf,nmlocalidade,nuprefixo';
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
    CheckBoxCadastroFLCAPITAL.Themed := true;

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

procedure TfmCadLocalidade.FormDestroy(Sender: TObject);
begin
  FreeAndNil(plPais);
  FreeAndNil(plUnidadeFederacao);
  FreeAndNil(pLocalidade);
  FreeAndNil(pInformacaoGeografica);
  FreeAndNil(pPais);
  FreeAndNil(pUnidadeFederacao);
end;

procedure TfmCadLocalidade.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Exit;
end;

procedure TfmCadLocalidade.FormResize(Sender: TObject);
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

procedure TfmCadLocalidade.habilitaBotoes;
begin
  BitBtnSalvar.Enabled := true;
  BitBtnExcluir.Enabled := true;
  BitBtnRestaurar.Enabled := true;
  BitBtnNovo.Enabled := true;
end;

procedure TfmCadLocalidade.ButtonLimparPaisClick(Sender: TObject);
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

  ActiveControl := EditCadastroCDPAIS;
end;

procedure TfmCadLocalidade.ButtonLimparUFClick(Sender: TObject);
begin
  limparCamposUF;

  EditCadastroCDUF.Enabled := true;
  EditCadastroSGUF.Enabled := true;
  EditCadastroNMUF.Enabled := true;

  ButtonLimparUF.Enabled := false;
  ButtonNovoUF.Enabled := true;

  ActiveControl := EditCadastroCDUF;
end;

procedure TfmCadLocalidade.ButtonNovoPaisClick(Sender: TObject);
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
          raise exception.Create('N�o foi poss�vel abrir a tela de Cadastro de Pa�s.'+#13#10+E.Message);
      end;
    end;
  finally
    // Verifica se foi cadastrado um pa�s.
    if vcdPais > 0 then
    begin
      EditCadastroCDPAIS.Text := IntToStr(vcdPais);
      EditCadastroCDPAISExit(EditCadastroCDPAIS);
    end;
  end;
end;

procedure TfmCadLocalidade.ButtonNovoUFClick(Sender: TObject);
var
  vcPais, vcdUF: integer;
begin
  vcPais := StrToInt(EditCadastroCDPAIS.Text);
  vcdUF := 0;

  try
    fmCadUF := TfmCadUF.Create(Self);
    with fmCadUF do
    begin
      try
        Tag := 1;
        fmCadUF.setaCadastroUnico(vcPais);
        ShowModal;

        vcdUF := fmCadUF.Codigo;
      except
        on E: exception do
          raise exception.Create('N�o foi poss�vel abrir a tela de Cadastro de Unidade da Federa��o.'+#13#10+E.Message);
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

procedure TfmCadLocalidade.MenuItemAtualizarTabelaClick(Sender: TObject);
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
      editaColunaGrid(1,'CDLOCALIDADE','C�digo',edNone,taRightJustify,40,true);
      editaColunaGrid(2,'NMPAIS','Pa�s',edNone,taLeftJustify,200,true);
      editaColunaGrid(3,'NMUF','Unidade da Federa��o',edNone,taLeftJustify,200,true);
      editaColunaGrid(4,'NMLOCALIDADE','Localidade',edNone,taLeftJustify,200,true);
      editaColunaGrid(5,'NUPREFIXO','DDD',edNone,taLeftJustify,40,true);
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

procedure TfmCadLocalidade.MenuItemEditarRegistroClick(Sender: TObject);
begin
  Opcao := 'A';
  with DBAdvGridGeral do
    Codigo := ColumnByName['CDLOCALIDADE'].Ints[Row];
  editaCadastro;
  habilitaBotoes;

  ActiveControl := EditCadastroNMLOCALIDADE;
end;

procedure TfmCadLocalidade.MenuItemVisualizarFiltroClick(Sender: TObject);
begin
  GridFindDialogColumnGrid.Execute;
end;

procedure TfmCadLocalidade.novoCadastro;
begin
  OfficePagerCentral.ActivePageIndex := 1;

  EditCadastroCDLOCALIDADE.Clear;
  EditCadastroNMLOCALIDADE.Clear;
  EditCadastroNUPREFIXO.Clear;
  CheckBoxCadastroFLCAPITAL.Checked := false;
  ButtonLimparPaisClick(ButtonLimparPais);

  ActiveControl := EditCadastroCDPAIS;
end;

procedure TfmCadLocalidade.OfficePageCadastroShow(Sender: TObject);
begin
  if EditCadastroCDPAIS.Enabled then
    ActiveControl := EditCadastroCDPAIS
  else
    if EditCadastroCDUF.Enabled then
      ActiveControl := EditCadastroCDUF
    else
      ActiveControl := EditCadastroNMLOCALIDADE;
end;

procedure TfmCadLocalidade.setaCadastroUnico(prmcdPais, prmcdUF: integer);
begin
  EditCadastroCDPAIS.Text := IntToStr(prmcdPais);
  EditCadastroCDPAISExit(EditCadastroCDPAIS);
  EditCadastroCDUF.Text := IntToStr(prmcdUF);
  EditCadastroCDUFExit(EditCadastroCDUF);
  ButtonLimparPais.Enabled := false;
  ButtonNovoPais.Enabled := false;
  ButtonLimparUF.Enabled := false;
  ButtonNovoUF.Enabled := false;
  BitBtnExcluir.Enabled := false;
  BitBtnRestaurar.Enabled := false;
  BitBtnNovo.Enabled := false;
  OfficePageConsulta.TabVisible := false;
end;

procedure TfmCadLocalidade.ButtonExportarHTMLClick(Sender: TObject);
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

procedure TfmCadLocalidade.ButtonExportarPlanilhaClick(Sender: TObject);
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

procedure TfmCadLocalidade.ButtonImprimirRelatorioClick(Sender: TObject);
begin
  try
    QueryRelLocalidade.SQL := pLocalidade.relatorio.SQL;
    dmPrincipal.executaConsulta(QueryRelLocalidade);
    with fmPrincipal.SystemRelatorio do
    begin
      DefaultDest := rdPreview;
      SystemSetups := SystemSetups - [ssAllowSetup];
      DoNativeOutput := false;
    end;
    with ProjectRelLocalidade do
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

procedure TfmCadLocalidade.ButtonOrdenarRegistrosClick(Sender: TObject);
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

procedure TfmCadLocalidade.carregaImagensBotoes;
begin
  EditCadastroNMPAIS.Button.Glyph.Assign(fmPrincipal.fnGeral.obtemImagemPesquisa);
  EditCadastroNMUF.Button.Glyph.Assign(fmPrincipal.fnGeral.obtemImagemPesquisa);

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
  ButtonNovoPais.Picture.LoadFromFile(fmPrincipal.LocalIcones + 'new-e-16.png');
  ButtonNovoPais.HotPicture.LoadFromFile(fmPrincipal.LocalIcones + 'new-h-16.png');
  ButtonNovoPais.DisabledPicture.LoadFromFile(fmPrincipal.LocalIcones + 'new-d-16.png');
  ButtonNovoUF.Picture.LoadFromFile(fmPrincipal.LocalIcones + 'new-e-16.png');
  ButtonNovoUF.HotPicture.LoadFromFile(fmPrincipal.LocalIcones + 'new-h-16.png');
  ButtonNovoUF.DisabledPicture.LoadFromFile(fmPrincipal.LocalIcones + 'new-d-16.png');
end;

function TfmCadLocalidade.validaExclusao: boolean;
var
  vMensagem: string;
begin
  vMensagem := EmptyStr;

  try
    pLocalidade.Codigo := Codigo;
    if pLocalidade.existeDependencia then
      vMensagem := '- Existem bairros relacionados a esta localidade.';

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
