unit unCadModelo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, Grids, AdvObj, BaseGrid, AdvGrid, AdvCGrid, AsgFindDialog, ComCtrls,
  Menus, UnAplExportaXLS, ImgList, ToolWin, MaskUtils, DBAdvGrid, RpCon,
  RpConDS, RpBase, RpSystem, RpDefine, RpRave, RpRender, RpRenderPDF, ShellAPI,
  Mask,  AdvGlowButton, AdvAppStyler, AdvPanel, AdvMenus, AdvEdit, AdvEdBtn,
  AdvToolBar, AdvOfficePager, tmsAdvGridExcel, AdvOfficeButtons, unModelo,
  unMarca;

type
  TfmCadModelo = class(TForm)
    QueryGeral: TZQuery;
    GridFindDialogColumnGrid: TAdvGridFindDialog;
    DataSource: TDataSource;
    LabelCodigo: TLabel;
    LabelModelo: TLabel;
    LabelMarca: TLabel;
    SaveDialog: TSaveDialog;
    ProjectRelModelo: TRvProject;
    DataSetConnectionRelModelo: TRvDataSetConnection;
    QueryRelModelo: TZQuery;
    FormStyler: TAdvFormStyler;
    ButtonLimparMarca: TAdvGlowButton;
    ButtonNovoMarca: TAdvGlowButton;
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
    EditCadastroCDMODELO: TAdvEdit;
    EditCadastroNMMODELO: TAdvEdit;
    EditCadastroCDMARCA: TAdvEdit;
    EditCadastroNMMARCA: TAdvEditBtn;
    OfficePagerCentral: TAdvOfficePager;
    OfficePageConsulta: TAdvOfficePage;
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
    AdvGridExcelIO: TAdvGridExcelIO;
    PanelFiltroFamilia: TAdvPanel;
    LabelFiltroMarca: TLabel;
    EditFiltroMarca: TAdvEdit;
    ButtonFiltrar: TAdvGlowButton;
    PanelTabela: TAdvPanel;
    DBAdvGridGeral: TDBAdvGrid;
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
    procedure ButtonLimparMarcaClick(Sender: TObject);
    procedure ButtonNovoMarcaClick(Sender: TObject);
    procedure EditCadastroNMMARCAExit(Sender: TObject);
    procedure EditCadastroCDMARCAExit(Sender: TObject);
    procedure ButtonOrdenarRegistrosClick(Sender: TObject);
    procedure OfficePageCadastroShow(Sender: TObject);
    procedure EditCadastroNMMARCAClickBtn(Sender: TObject);
    procedure ButtonFiltrarClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    pId: TGUID;
    pOpcao: Char;
    pCodigo, pEspacamentoInicial, pEspacamentoFinal, pEspacamentoEntre: integer;
    plMarca: TStringList;
    pOrdenacao: string;
    pModelo: TModelo;
    pMarca: TMarca;
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
    procedure setaCadastroUnico(prmcdMarca: integer);
    property Opcao: char read pOpcao write pOpcao;
    property Codigo: integer read pCodigo write pCodigo;
    property Ordenacao: string read pOrdenacao write pOrdenacao;
  end;

var
  fmCadModelo: TfmCadModelo;

implementation

uses unPrincipal, unConFiltroPadrao, undmPrincipal, unCadMarca, unAplOrdenaGrid,
  undmEstilo;

{$R *.dfm}

procedure TfmCadModelo.atualizaCadastro;
var
  vRetorno: integer;
begin
  try
    pModelo.Codigo := Codigo;
    pModelo.Marca := StrToInt(EditCadastroCDMARCA.Text);
    pModelo.Nome := EditCadastroNMMODELO.Text;
    if CheckBoxCadastroFLATIVO.Checked then
      pModelo.Ativo := 'S'
    else
      pModelo.Ativo := 'N';
    vRetorno := pModelo.atualiza;

    if vRetorno <> 0 then
      fmPrincipal.apresentaResultadoCadastro('Cadastro atualizado com sucesso.')
    else
      fmPrincipal.apresentaResultadoCadastro('Não foi possível atualizar o cadastro.');
  except
    on E: exception do
      raise;
  end;
end;

procedure TfmCadModelo.BitBtnRestaurarClick(Sender: TObject);
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

procedure TfmCadModelo.BitBtnExcluirClick(Sender: TObject);
var
  vRetorno: integer;
begin
  // Valida se realmente o usuário quer realizar a exclusão.
  if MessageBox(fmPrincipal.Handle,
                PWideChar('Confirma a exclusão do modelo?'),
                cTituloMensagemConfirmacao,
                MB_YESNO or MB_ICONQUESTION or MB_DEFBUTTON2) = IDNO then
    Exit;
  // Valida se é possível realizar a exclusão.
  if not validaExclusao then
    Exit;

  desabilitaBotoes;
  try
    pModelo.Codigo := Codigo;
    vRetorno := pModelo.exclui;

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

procedure TfmCadModelo.BitBtnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfmCadModelo.insereCadastro;
begin
  try
    pModelo.Marca := StrToInt(EditCadastroCDMARCA.Text);
    pModelo.Nome := EditCadastroNMMODELO.Text;
    if CheckBoxCadastroFLATIVO.Checked then
      pModelo.Ativo := 'S'
    else
      pModelo.Ativo := 'N';
    Codigo := pModelo.insere;

    if Codigo <> 0 then
      fmPrincipal.apresentaResultadoCadastro('Cadastro incluído com sucesso.')
    else
      fmPrincipal.apresentaResultadoCadastro('Não foi possível incluir o cadastro.');

    EditCadastroCDMODELO.Text := IntToStr(Codigo);
  except
    on E: exception do
      raise;
  end;
end;

procedure TfmCadModelo.BitBtnNovoClick(Sender: TObject);
begin
  pOpcao := 'I';
  desabilitaBotoes;
  novoCadastro;
  BitBtnSalvar.Enabled := true;
  BitBtnRestaurar.Enabled := true;
end;

procedure TfmCadModelo.BitBtnSalvarClick(Sender: TObject);
var
  vMensagem: string;
begin
  desabilitaBotoes;

  // Validações.
  vMensagem := EmptyStr;
  if AnsiCompareText(EditCadastroCDMARCA.Text,EmptyStr) = 0 then
    vMensagem := vMensagem + #13#10'- O campo Marca é requerido.';
  if AnsiCompareText(EditCadastroNMMODELO.Text,EmptyStr) = 0 then
    vMensagem := vMensagem + #13#10'- O campo Modelo é requerido.';

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
    ActiveControl := EditCadastroNMMODELO;
  except
    on E: Exception do
    begin
      fmPrincipal.apresentaResultadoCadastro(E.Message);
      fmPrincipal.manipulaExcecoes(Sender,E);
    end;
  end;
end;

procedure TfmCadModelo.EditCadastroNMMARCAClickBtn(Sender: TObject);
var
  i: integer;
begin
  fmConFiltroPadrao := TfmConFiltroPadrao.Create(Self);
  try
    with fmConFiltroPadrao do
    begin
      try
        setaTitulo('Consulta de Marcas');
        setaConsulta(pMarca.filtro);
        setaOpcao('R');
        executaFiltro(0,EmptyStr);
        ShowModal;
      finally
        with pResSearch do
          for i := 0 to Count -1 do
            if objResSearch[i].Id = buscaId then
            begin
              plMarca.Clear;
              plMarca.Add(objResSearch[i].Codigo);
              EditCadastroCDMARCA.Text := objResSearch[i].Codigo;
              EditCadastroNMMARCA.Text := objResSearch[i].Nome1;
            end;
      end;
    end;
  finally
    // Valida para qual campo vai se posicionar.
    if plMarca.Count > 0 then
      ActiveControl := EditCadastroNMMODELO
    else
      ActiveControl := EditCadastroNMMARCA;

    EditCadastroCDMARCA.Enabled := (plMarca.Count = 0);
    EditCadastroNMMARCA.Enabled := (plMarca.Count = 0);
    ButtonLimparMarca.Enabled := (plMarca.Count > 0);
    ButtonNovoMarca.Enabled := (plMarca.Count = 0);
  end;
end;

procedure TfmCadModelo.EditCadastroNMMARCAExit(Sender: TObject);
var
  i: integer;
  vQuery: TZQuery;
begin
  if Length(Trim(EditCadastroNMMARCA.Text)) = 0 then
    Exit;

  try
    vQuery := pMarca.filtro;
    with vQuery do
    begin
      SQL.Add('WHERE UPPER("NM-Marca") LIKE :NMMARCA');
      Params.ParamByName('NMMARCA').AsString := '%'+AnsiUpperCase(EditCadastroNMMARCA.Text)+'%';
      dmPrincipal.executaConsulta(vQuery);

      if RecordCount > 1 then
      begin
        fmConFiltroPadrao := TfmConFiltroPadrao.Create(Self);
        with fmConFiltroPadrao do
        begin
          try
            setaTitulo('Consulta de Marcas');
            setaConsulta(pMarca.filtro);
            setaOpcao('R');
            executaFiltro(2,EditCadastroNMMARCA.Text);
            ShowModal;
          finally
            with pResSearch do
              for i := 0 to Count -1 do
                if objResSearch[i].Id = buscaId then
                begin
                  plMarca.Clear;
                  plMarca.Add(objResSearch[i].Codigo);
                  EditCadastroCDMARCA.Text := objResSearch[i].Codigo;
                  EditCadastroNMMARCA.Text := objResSearch[i].Nome1;
                end;
          end;
        end;
      end
      else
        if not Eof then
        begin
          plMarca.Clear;
          plMarca.Add(Fields.Fields[0].AsString);
          EditCadastroCDMARCA.Text := Fields.Fields[0].AsString;
          EditCadastroNMMARCA.Text := Fields.Fields[1].AsString;
        end
        else
          fmPrincipal.apresentaResultadoCadastro('Nenhum registro encontrado.');
      Active := false;
    end;
  finally
    FreeAndNil(vQuery);

    // Valida para qual campo vai se posicionar.
    if plMarca.Count > 0 then
      ActiveControl := EditCadastroNMMODELO
    else
      ActiveControl := EditCadastroNMMARCA;

    EditCadastroCDMARCA.Enabled := (plMarca.Count = 0);
    EditCadastroNMMARCA.Enabled := (plMarca.Count = 0);
    ButtonLimparMarca.Enabled := (plMarca.Count > 0);
    ButtonNovoMarca.Enabled := (plMarca.Count = 0);
  end;
end;

procedure TfmCadModelo.DBAdvGridGeralDblClickCell(Sender: TObject; ARow,
  ACol: Integer);
begin
  if ARow > 0 then
    MenuItemEditarRegistroClick(MenuItemEditarRegistro);
end;

procedure TfmCadModelo.DBAdvGridGeralFilterSelect(Sender: TObject; Column,
  ItemIndex: Integer; FriendlyName: string; var FilterCondition: string);
begin
  case ItemIndex of
    0: FilterCondition := EmptyStr;
    1: FilterCondition := 'S';
    2: FilterCondition := 'N';
  end;

  DBAdvGridGeral.Cells[Column,0] := FriendlyName;
end;

procedure TfmCadModelo.desabilitaBotoes;
begin
  BitBtnSalvar.Enabled := false;
  BitBtnExcluir.Enabled := false;
  BitBtnRestaurar.Enabled := false;
  BitBtnNovo.Enabled := false;
end;

procedure TfmCadModelo.editaCadastro;
var
  vQuery: TZQuery;
begin
  novoCadastro;

  try
    try
      vQuery := pModelo.lista;
      with vQuery do
      begin
        // Consulta o cadastro do Modelo.
        SQL.Add('WHERE cdmodelo = :CURRENT_CDMODELO');
        Params.ParamByName('CURRENT_CDMODELO').AsInteger := Codigo;
        dmPrincipal.executaConsulta(vQuery);

        if not Eof then
        begin
          EditCadastroCDMODELO.Text := IntToStr(Codigo);
          EditCadastroCDMARCA.Text := Fields.FieldByName('CDMARCA').AsString;
          EditCadastroCDMARCAExit(EditCadastroCDMARCA);
          EditCadastroNMMODELO.Text := Fields.FieldByName('NMMODELO').AsString;
          CheckBoxCadastroFLATIVO.Checked := (Fields.FieldByName('FLATIVO').AsString = 'S');
        end
        else
          raise exception.Create('O cadastro do Modelo não foi encontrado.');
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

procedure TfmCadModelo.editaColunaGrid(prmIndice: integer; prmNome,
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

procedure TfmCadModelo.EditCadastroCDMARCAExit(Sender: TObject);
var
  vQuery: TZQuery;
begin
  // Se não digitou nada, sai sem abrir a search.
  if Length(Trim(EditCadastroCDMARCA.Text)) = 0 then
    Exit;

  try
    vQuery := pMarca.filtro;
    with vQuery do
    begin
      SQL.Add('WHERE "NU-Código" = :CDMARCA');
      Params.ParamByName('CDMARCA').AsInteger := StrToInt(EditCadastroCDMARCA.Text);
      dmPrincipal.executaConsulta(vQuery);

      if not Eof then
      begin
        plMarca.Clear;
        plMarca.Add(Fields.Fields[0].AsString);
        EditCadastroCDMARCA.Text := Fields.Fields[0].AsString;
        EditCadastroNMMARCA.Text := Fields.Fields[1].AsString;
      end
      else
      begin
        plMarca.Clear;
        EditCadastroCDMARCA.Clear;
        EditCadastroNMMARCA.Clear;
        fmPrincipal.apresentaResultadoCadastro('Nenhum registro encontrado.');
      end;
      Active := false;
    end;
  finally
    FreeAndNil(vQuery);

    EditCadastroCDMARCA.Enabled := (plMarca.Count = 0);
    EditCadastroNMMARCA.Enabled := (plMarca.Count = 0);
    ButtonLimparMarca.Enabled := (plMarca.Count > 0);
    ButtonNovoMarca.Enabled := (plMarca.Count = 0);

    // Valida para qual campo vai se posicionar.
    if plMarca.Count > 0 then
      ActiveControl := EditCadastroNMMODELO
    else
      ActiveControl := EditCadastroCDMARCA;
  end;
end;

procedure TfmCadModelo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  QueryGeral.Close;

  Action := caFree;
end;

procedure TfmCadModelo.FormCreate(Sender: TObject);
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

    plMarca := TStringList.Create;

    pModelo := TModelo.Create;
    pMarca := TMarca.Create;

    OfficePagerCentral.ActivePageIndex := 1;

    Ordenacao := '|"Código":"N":"Asc."|;|"Marca":"S":"Asc."|;|"Modelo":"S":"Asc."|;|"Ativo":"S":"Asc."|';

    // Monta a consulta que carregará os dados da Grid.
    with QueryGeral do
    begin
      SQL := pModelo.visao.SQL;
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

procedure TfmCadModelo.FormDestroy(Sender: TObject);
begin
  FreeAndNil(plMarca);
  FreeAndNil(pModelo);
  FreeAndNil(pMarca);
end;

procedure TfmCadModelo.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Exit;
end;

procedure TfmCadModelo.FormResize(Sender: TObject);
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

procedure TfmCadModelo.habilitaBotoes;
begin
  BitBtnSalvar.Enabled := true;
  BitBtnExcluir.Enabled := true;
  BitBtnRestaurar.Enabled := true;
  BitBtnNovo.Enabled := true;
end;

procedure TfmCadModelo.ButtonLimparMarcaClick(Sender: TObject);
begin
  plMarca.Clear;

  EditCadastroCDMARCA.Clear;
  EditCadastroNMMARCA.Clear;

  EditCadastroCDMARCA.Enabled := true;
  EditCadastroNMMARCA.Enabled := true;
  ButtonLimparMarca.Enabled := false;
  ButtonNovoMarca.Enabled := true;
end;

procedure TfmCadModelo.ButtonNovoMarcaClick(Sender: TObject);
var
  vcdMarca: integer;
begin
  vcdMarca := 0;

  try
    fmCadMarca := TfmCadMarca.Create(Self);
    with fmCadMarca do
    begin
      try
        Tag := 1;
        fmCadMarca.setaCadastroUnico;
        ShowModal;

        vcdMarca := fmCadMarca.Codigo;
      except
        on E: exception do
          raise exception.Create('Não foi possível abrir a tela de Cadastro de Marca.'+#13#10+E.Message);
      end;
    end;
  finally
    // Verifica se foi cadastrado uma marca.
    if vcdMarca > 0 then
    begin
      EditCadastroCDMARCA.Text := IntToStr(vcdMarca);
      EditCadastroCDMARCAExit(EditCadastroCDMARCA);
    end;
  end;
end;

procedure TfmCadModelo.MenuItemAtualizarTabelaClick(Sender: TObject);
var
  vOrdenacao: string;
begin
  try
    try
      Screen.Cursor := crSQLWait;

      vOrdenacao := fmPrincipal.fnGeral.obtemOrdenacaoFormatada(Ordenacao);

      with QueryGeral do
      begin
        if vOrdenacao <> EmptyStr then
          SQL.Strings[SQL.Count-1] := vOrdenacao;
        if EditFiltroMarca.Text <> EmptyStr then
          Params.ParamByName('NMMARCA').AsString := EditFiltroMarca.Text + '%'
        else
          Params.ParamByName('NMMARCA').AsString := '%';
      end;

      dmPrincipal.executaConsulta(QueryGeral);

      // Configura a Grid.
      editaColunaGrid(1,'CDMODELO','Código',edNone,taRightJustify,40,true);
      editaColunaGrid(2,'NMMARCA','Marca',edNone,taLeftJustify,250,true);
      editaColunaGrid(3,'NMMODELO','Modelo',edNone,taLeftJustify,250,true);
      editaColunaGrid(4,'FLATIVO','Ativo',edCheckBox,taCenter,40,true);
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

procedure TfmCadModelo.MenuItemEditarRegistroClick(Sender: TObject);
begin
  Opcao := 'A';
  with DBAdvGridGeral do
    Codigo := ColumnByName['CDMODELO'].Ints[Row];
  editaCadastro;
  habilitaBotoes;

  ActiveControl := EditCadastroNMMODELO;
end;

procedure TfmCadModelo.MenuItemVisualizarFiltroClick(Sender: TObject);
begin
  GridFindDialogColumnGrid.Execute;
end;

procedure TfmCadModelo.novoCadastro;
begin
  OfficePagerCentral.ActivePageIndex := 1;

  EditCadastroCDMODELO.Clear;
  EditCadastroNMMODELO.Clear;
  CheckBoxCadastroFLATIVO.Checked := true;
  ButtonLimparMarcaClick(ButtonLimparMarca);

  ActiveControl := EditCadastroCDMARCA;
end;

procedure TfmCadModelo.OfficePageCadastroShow(Sender: TObject);
begin
  if EditCadastroCDMARCA.Enabled then
    ActiveControl := EditCadastroCDMARCA
  else
    ActiveControl := EditCadastroNMMODELO;
end;

procedure TfmCadModelo.setaCadastroUnico(prmcdMarca: integer);
begin
  EditCadastroCDMARCA.Text := IntToStr(prmcdMarca);
  EditCadastroCDMARCAExit(EditCadastroCDMARCA);

  ButtonLimparMarca.Enabled := false;
  ButtonNovoMarca.Enabled := false;
  BitBtnExcluir.Enabled := false;
  BitBtnRestaurar.Enabled := false;
  BitBtnNovo.Enabled := false;
end;

procedure TfmCadModelo.ButtonExportarHTMLClick(Sender: TObject);
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

procedure TfmCadModelo.ButtonExportarPlanilhaClick(Sender: TObject);
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

procedure TfmCadModelo.ButtonFiltrarClick(Sender: TObject);
begin
  MenuItemAtualizarTabelaClick(Sender);
end;

procedure TfmCadModelo.ButtonImprimirRelatorioClick(Sender: TObject);
begin
  try
    QueryRelModelo.SQL := pModelo.relatorio.SQL;
    dmPrincipal.executaConsulta(QueryRelModelo);
    with fmPrincipal.SystemRelatorio do
    begin
      DefaultDest := rdPreview;
      SystemSetups := SystemSetups - [ssAllowSetup];
      DoNativeOutput := false;
      //SystemSetups := SystemSetups - [ssAllowSetup];
    end;
    with ProjectRelModelo do
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

procedure TfmCadModelo.ButtonOrdenarRegistrosClick(Sender: TObject);
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

procedure TfmCadModelo.carregaImagensBotoes;
begin
  EditCadastroNMMARCA.Button.Glyph.Assign(fmPrincipal.fnGeral.obtemImagemPesquisa);

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

  ButtonLimparMarca.Picture.LoadFromFile(fmPrincipal.LocalIcones + 'erase-e-16.png');
  ButtonLimparMarca.HotPicture.LoadFromFile(fmPrincipal.LocalIcones + 'erase-h-16.png');
  ButtonLimparMarca.DisabledPicture.LoadFromFile(fmPrincipal.LocalIcones + 'erase-d-16.png');
  ButtonNovoMarca.Picture.LoadFromFile(fmPrincipal.LocalIcones + 'new-e-16.png');
  ButtonNovoMarca.HotPicture.LoadFromFile(fmPrincipal.LocalIcones + 'new-h-16.png');
  ButtonNovoMarca.DisabledPicture.LoadFromFile(fmPrincipal.LocalIcones + 'new-d-16.png');
end;

function TfmCadModelo.validaExclusao: boolean;
var
  vMensagem: string;
begin
  vMensagem := EmptyStr;

  try
    pModelo.Codigo := Codigo;
    pModelo.Marca := StrToIntDef(EditCadastroCDMARCA.Text,0);
    if pModelo.existeDependencia then
      vMensagem := '- Existem materiais relacionados a este modelo.';

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
