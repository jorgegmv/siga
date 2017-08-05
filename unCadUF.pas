unit unCadUF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, Grids, AdvObj, BaseGrid, AdvGrid, AdvCGrid, AsgFindDialog, ComCtrls,
  Menus, UnAplExportaXLS, ImgList, ToolWin, MaskUtils, DBAdvGrid, RpCon,
  RpConDS, RpBase, RpSystem, RpDefine, RpRave, RpRender, RpRenderPDF, ShellAPI,
  Mask, AdvAppStyler, tmsAdvGridExcel, AdvMenus, AdvEdit, AdvEdBtn,
  AdvGlowButton, AdvToolBar, AdvPanel, AdvOfficePager, unUnidadeFederacao,
  unPais, unInformacaoGeografica;

type
  TfmCadUF = class(TForm)
    QueryGeral: TZQuery;
    GridFindDialogColumnGrid: TAdvGridFindDialog;
    DataSource: TDataSource;
    LabelCodigo: TLabel;
    LabelPais: TLabel;
    LabelSigla: TLabel;
    LabelUF: TLabel;
    SaveDialog: TSaveDialog;
    ProjectRelUF: TRvProject;
    DataSetConnectionRelUF: TRvDataSetConnection;
    QueryRelUF: TZQuery;
    FormStyler: TAdvFormStyler;
    ButtonLimparPais: TAdvGlowButton;
    ButtonNovoPais: TAdvGlowButton;
    PopupMenuGrid: TAdvPopupMenu;
    MenuItemEditarRegistro: TMenuItem;
    MenuItemAtualizarTabela: TMenuItem;
    MenuItemEspaco1: TMenuItem;
    MenuItemVisualizarFiltro: TMenuItem;
    EditCadastroCDUF: TAdvEdit;
    EditCadastroNMUF: TAdvEdit;
    EditCadastroSGUF: TAdvEdit;
    EditCadastroCDPAIS: TAdvEdit;
    EditCadastroSGPAIS: TAdvEdit;
    EditCadastroNMPAIS: TAdvEditBtn;
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
    DBAdvGridGeral: TDBAdvGrid;
    PanelBotoes: TAdvPanel;
    BitBtnFechar: TAdvGlowButton;
    BitBtnSalvar: TAdvGlowButton;
    BitBtnNovo: TAdvGlowButton;
    BitBtnExcluir: TAdvGlowButton;
    BitBtnRestaurar: TAdvGlowButton;
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
    procedure ButtonOrdenarRegistrosClick(Sender: TObject);
    procedure EditCadastroNMPAISClickBtn(Sender: TObject);
    procedure OfficePageCadastroShow(Sender: TObject);
    procedure EditCadastroCDPAISChange(Sender: TObject);
  private
    { Private declarations }
    pId: TGUID;
    plPais: TStringList;
    pOpcao: Char;
    pCodigo, pEspacamentoInicial, pEspacamentoFinal, pEspacamentoEntre: integer;
    pOrdenacao: string;
    pUnidadeFederacao: TUnidadeFederacao;
    pInformacaoGeografica: TInformacaoGeografica;
    pPais: TPais;
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
    procedure setaCadastroUnico(prmcdPais: integer);
    property Opcao: char read pOpcao write pOpcao;
    property Codigo: integer read pCodigo write pCodigo;
    property Ordenacao: string read pOrdenacao write pOrdenacao;
  end;

var
  fmCadUF: TfmCadUF;

implementation

uses unPrincipal, unConFiltroPadrao, undmPrincipal, unCadPais, unAplOrdenaGrid,
  undmEstilo;

{$R *.dfm}

procedure TfmCadUF.atualizaCadastro;
var
  vRetorno: integer;
begin
  try
    pUnidadeFederacao.Codigo := Codigo;
    pUnidadeFederacao.Pais := StrToInt(EditCadastroCDPAIS.Text);
    pUnidadeFederacao.Nome := EditCadastroNMUF.Text;
    pUnidadeFederacao.Sigla := EditCadastroSGUF.Text;
    vRetorno := pUnidadeFederacao.atualiza;

    if vRetorno <> 0 then
      fmPrincipal.apresentaResultadoCadastro('Cadastro atualizado com sucesso.')
    else
      fmPrincipal.apresentaResultadoCadastro('Não foi possível atualizar o cadastro.');
  except
    on E: exception do
      raise;
  end;
end;

procedure TfmCadUF.BitBtnRestaurarClick(Sender: TObject);
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

procedure TfmCadUF.BitBtnExcluirClick(Sender: TObject);
var
  vRetorno: integer;
begin
  // Valida se realmente o usuário quer realizar a exclusão.
  if MessageBox(fmPrincipal.Handle,
                PWideChar('Confirma a exclusão da Unidade da Federação?'),
                cTituloMensagemConfirmacao,
                MB_YESNO or MB_ICONQUESTION or MB_DEFBUTTON2) = IDNO then
    Exit;
  // Valida se é possível realizar a exclusão.
  if not validaExclusao then
    Exit;

  desabilitaBotoes;
  try
    pUnidadeFederacao.Codigo := Codigo;
    vRetorno := pUnidadeFederacao.exclui;

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

procedure TfmCadUF.BitBtnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfmCadUF.insereCadastro;
begin
  try
    pUnidadeFederacao.Pais := StrToInt(EditCadastroCDPAIS.Text);
    pUnidadeFederacao.Nome := EditCadastroNMUF.Text;
    pUnidadeFederacao.Sigla := EditCadastroSGUF.Text;
    Codigo := pUnidadeFederacao.insere;

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

procedure TfmCadUF.BitBtnNovoClick(Sender: TObject);
begin
  pOpcao := 'I';
  desabilitaBotoes;
  novoCadastro;
  BitBtnSalvar.Enabled := true;
  BitBtnRestaurar.Enabled := true;
end;

procedure TfmCadUF.BitBtnSalvarClick(Sender: TObject);
var
  vMensagem: string;
begin
  desabilitaBotoes;

  // Validações.
  vMensagem := EmptyStr;
  if AnsiCompareText(EditCadastroCDPAIS.Text,EmptyStr) = 0 then
    vMensagem := vMensagem + #13#10'- O campo País é requerido.';
  if AnsiCompareText(EditCadastroNMUF.Text,EmptyStr) = 0 then
    vMensagem := vMensagem + #13#10'- O campo U.F. é requerido.';
  if AnsiCompareText(EditCadastroSGUF.Text,EmptyStr) = 0 then
    vMensagem := vMensagem + #13#10'- O campo Sigla é requerido.';

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
    ActiveControl := EditCadastroNMUF;
  except
    on E: Exception do
    begin
      fmPrincipal.apresentaResultadoCadastro(E.Message);
      fmPrincipal.manipulaExcecoes(Sender,E);
    end;
  end;
end;

procedure TfmCadUF.EditCadastroNMPAISClickBtn(Sender: TObject);
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
    // Valida para qual campo vai se posicionar.
    if plPais.Count > 0 then
      ActiveControl := EditCadastroNMUF
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

procedure TfmCadUF.EditCadastroNMPAISExit(Sender: TObject);
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

    // Valida para qual campo vai se posicionar.
    if plPais.Count > 0 then
      ActiveControl := EditCadastroNMUF
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

procedure TfmCadUF.DBAdvGridGeralDblClickCell(Sender: TObject; ARow,
  ACol: Integer);
begin
  if ARow > 0 then
    MenuItemEditarRegistroClick(MenuItemEditarRegistro);
end;

procedure TfmCadUF.DBAdvGridGeralFilterSelect(Sender: TObject; Column,
  ItemIndex: Integer; FriendlyName: string; var FilterCondition: string);
begin
  case ItemIndex of
    0: FilterCondition := EmptyStr;
    1: FilterCondition := 'S';
    2: FilterCondition := 'N';
  end;

  DBAdvGridGeral.Cells[Column,0] := FriendlyName;
end;

procedure TfmCadUF.desabilitaBotoes;
begin
  BitBtnSalvar.Enabled := false;
  BitBtnExcluir.Enabled := false;
  BitBtnRestaurar.Enabled := false;
  BitBtnNovo.Enabled := false;
end;

procedure TfmCadUF.editaCadastro;
var
  vQuery: TZQuery;
begin
  novoCadastro;

  try
    try
      vQuery := pInformacaoGeografica.visao;
      with vQuery do
      begin
        // Consulta o cadastro da UF.
        SQL.Add('WHERE cduf = :CURRENT_CDUF');
        Params.ParamByName('CURRENT_CDUF').AsInteger := Codigo;
        dmPrincipal.executaConsulta(vQuery);

        if not Eof then
        begin
        EditCadastroCDUF.Text := IntToStr(Codigo);
        EditCadastroCDPAIS.Text := Fields.FieldByName('CDPAIS').AsString;
        EditCadastroCDPAISExit(EditCadastroCDPAIS);
        EditCadastroSGUF.Text := Fields.FieldByName('SGUF').AsString;
        EditCadastroNMUF.Text := Fields.FieldByName('NMUF').AsString;
        end
        else
          raise exception.Create('O cadastro da Unidade da Federação não foi encontrado.');
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

procedure TfmCadUF.editaColunaGrid(prmIndice: integer; prmNome,
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

procedure TfmCadUF.EditCadastroCDPAISChange(Sender: TObject);
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

procedure TfmCadUF.EditCadastroCDPAISExit(Sender: TObject);
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

    // Valida para qual campo vai se posicionar.
    if plPais.Count > 0 then
      ActiveControl := EditCadastroNMUF
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

procedure TfmCadUF.EditCadastroSGPAISExit(Sender: TObject);
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

    // Valida para qual campo vai se posicionar.
    if plPais.Count > 0 then
      ActiveControl := EditCadastroNMUF
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

procedure TfmCadUF.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  QueryGeral.Close;

  Action := caFree;
end;

procedure TfmCadUF.FormCreate(Sender: TObject);
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

    pUnidadeFederacao := TUnidadeFederacao.Create;
    plPais := TStringList.Create;
    pInformacaoGeografica := TInformacaoGeografica.Create;

    pPais := TPais.Create;

    OfficePagerCentral.ActivePageIndex := 1;

    Ordenacao := '|"Código":"N":"Asc."|;|"País":"S":"Asc."|;|"Unidade da Federação":"S":"Asc."|;|"Sigla":"N":"Asc."|';

    // Monta a consulta que carregará os dados da Grid.
    with QueryGeral do
    begin
      SQL := pUnidadeFederacao.visao.SQL;
      SQL.Strings[0]:= 'SELECT DISTINCT cduf,nmpais,nmuf,sguf';
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

procedure TfmCadUF.FormDestroy(Sender: TObject);
begin
  FreeAndNil(pUnidadeFederacao);
  FreeAndNil(plPais);
  FreeAndNil(pInformacaoGeografica);
  FreeAndNil(pPais);
end;

procedure TfmCadUF.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Exit;
end;

procedure TfmCadUF.FormResize(Sender: TObject);
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

procedure TfmCadUF.habilitaBotoes;
begin
  BitBtnSalvar.Enabled := true;
  BitBtnExcluir.Enabled := true;
  BitBtnRestaurar.Enabled := true;
  BitBtnNovo.Enabled := true;
end;

procedure TfmCadUF.ButtonLimparPaisClick(Sender: TObject);
begin
  plPais.Clear;

  EditCadastroCDPAIS.Clear;
  EditCadastroSGPAIS.Clear;
  EditCadastroNMPAIS.Clear;

  EditCadastroCDPAIS.Enabled := true;
  EditCadastroSGPAIS.Enabled := true;
  EditCadastroNMPAIS.Enabled := true;

  ButtonLimparPais.Enabled := false;
  ButtonNovoPais.Enabled := true;
end;

procedure TfmCadUF.ButtonNovoPaisClick(Sender: TObject);
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

procedure TfmCadUF.MenuItemAtualizarTabelaClick(Sender: TObject);
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
  	  editaColunaGrid(1,'CDUF','Código',edNone,taRightJustify,40,true);
	    editaColunaGrid(2,'NMPAIS','País',edNone,taLeftJustify,250,true);
	    editaColunaGrid(3,'NMUF','Unidade da Federação',edNone,taLeftJustify,250,true);
	    editaColunaGrid(4,'SGUF','Sigla',edNone,taLeftJustify,40,true);
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

procedure TfmCadUF.MenuItemEditarRegistroClick(Sender: TObject);
begin
  Opcao := 'A';
  with DBAdvGridGeral do
    Codigo := ColumnByName['CDUF'].Ints[Row];
  editaCadastro;
  habilitaBotoes;

  ActiveControl := EditCadastroNMUF;
end;

procedure TfmCadUF.MenuItemVisualizarFiltroClick(Sender: TObject);
begin
  GridFindDialogColumnGrid.Execute;
end;

procedure TfmCadUF.novoCadastro;
begin
  OfficePagerCentral.ActivePageIndex := 1;

  EditCadastroCDUF.Clear;
  EditCadastroNMUF.Clear;
  EditCadastroSGUF.Clear;
  ButtonLimparPaisClick(ButtonLimparPais);

  ActiveControl := EditCadastroNMUF;
end;

procedure TfmCadUF.OfficePageCadastroShow(Sender: TObject);
begin
  if EditCadastroCDPAIS.Enabled then
    ActiveControl := EditCadastroCDPAIS
  else
    ActiveControl := EditCadastroNMUF;
end;

procedure TfmCadUF.setaCadastroUnico(prmcdPais: integer);
begin
  EditCadastroCDPAIS.Text := IntToStr(prmcdPais);
  EditCadastroCDPAISExit(EditCadastroCDPAIS);
  ButtonLimparPais.Enabled := false;
  ButtonNovoPais.Enabled := false;
  BitBtnExcluir.Enabled := false;
  BitBtnRestaurar.Enabled := false;
  BitBtnNovo.Enabled := false;
  OfficePageConsulta.TabVisible := false;
end;

procedure TfmCadUF.ButtonExportarHTMLClick(Sender: TObject);
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

procedure TfmCadUF.ButtonExportarPlanilhaClick(Sender: TObject);
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

procedure TfmCadUF.ButtonImprimirRelatorioClick(Sender: TObject);
begin
  try
    QueryRelUF.SQL := pUnidadeFederacao.relatorio.SQL;
    dmPrincipal.executaConsulta(QueryRelUF);
    with fmPrincipal.SystemRelatorio do
    begin
      DefaultDest := rdPreview;
      SystemSetups := SystemSetups - [ssAllowSetup];
      DoNativeOutput := false;
    end;
    with ProjectRelUF do
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

procedure TfmCadUF.ButtonOrdenarRegistrosClick(Sender: TObject);
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

procedure TfmCadUF.carregaImagensBotoes;
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
  ButtonNovoPais.Picture.LoadFromFile(fmPrincipal.LocalIcones + 'new-e-16.png');
  ButtonNovoPais.HotPicture.LoadFromFile(fmPrincipal.LocalIcones + 'new-h-16.png');
  ButtonNovoPais.DisabledPicture.LoadFromFile(fmPrincipal.LocalIcones + 'new-d-16.png');
end;

function TfmCadUF.validaExclusao: boolean;
var
  vMensagem: string;
begin
  vMensagem := EmptyStr;

  try
    pUnidadeFederacao.Codigo := Codigo;
    if pUnidadeFederacao.existeDependencia then
      vMensagem := '- Existem Localidades relacionadas a esta unidade da federação';

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
