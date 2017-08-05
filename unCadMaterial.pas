unit unCadMaterial;

interface

uses
  Windows, Messages, ShellAPI, SysUtils, Variants, StrUtils, Math, Classes,
  Mask, Buttons, MaskUtils, Registry, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ToolWin, ImgList, jpeg, StdCtrls, Menus, ExtCtrls, Grids, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, AdvObj, BaseGrid, AdvGrid,
  AdvCGrid, AsgFindDialog, UnAplExportaXLS, DBAdvGrid, RpCon, RpConDS, RpBase,
  RpSystem, RpDefine, RpRave, RpRender, RpRenderPDF, AdvAppStyler,
  AdvGlowButton, AdvMenus, AdvEdit, AdvEdBtn, AdvSpin, AdvGroupBox,
  AdvOfficeButtons, AdvDateTimePicker, PlannerDatePicker, tmsAdvGridExcel,
  AdvToolBar, AdvPanel, AdvOfficePager, unFamilia, unMaterial, unMarca,
  unModelo, unEmbalagem, unUsuario;

type
  TfmCadMaterial = class(TForm)
    QueryGeral: TZQuery;
    GridFindDialogColumnGrid: TAdvGridFindDialog;
    DataSource: TDataSource;
    ColumnGridMarcaModelo: TAdvColumnGrid;
    LabelCodigo: TLabel;
    LabelMaterial: TLabel;
    LabelFamilia: TLabel;
    LabelEmbalagem: TLabel;
    LabelUsuario: TLabel;
    LabelDataCadastro: TLabel;
    SaveDialog: TSaveDialog;
    ProjectRelMaterial: TRvProject;
    DataSetConnectionRelMaterial: TRvDataSetConnection;
    QueryRelMaterial: TZQuery;
    FormStyler: TAdvFormStyler;
    ButtonNovoFamilia: TAdvGlowButton;
    PopupMenuGrid: TAdvPopupMenu;
    MenuItemEditarRegistro: TMenuItem;
    MenuItemAtualizarTabela: TMenuItem;
    MenuItemEspaco1: TMenuItem;
    MenuItemVisualizarFiltro: TMenuItem;
    EditCadastroCDMATERIAL: TAdvEdit;
    EditCadastroDEMATERIAL: TAdvEdit;
    EditCadastroCDFAMILIA: TAdvEdit;
    EditCadastroDEFAMILIA: TAdvEditBtn;
    CheckBoxCadastroFLATIVO: TAdvOfficeCheckBox;
    GroupBoxMarcaModelo: TAdvGroupBox;
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
    ButtonLimparFamilia: TAdvGlowButton;
    PanelBotoes: TAdvPanel;
    BitBtnFechar: TAdvGlowButton;
    BitBtnSalvar: TAdvGlowButton;
    BitBtnNovo: TAdvGlowButton;
    BitBtnExcluir: TAdvGlowButton;
    BitBtnRestaurar: TAdvGlowButton;
    BitBtnCadastrarImagens: TAdvGlowButton;
    AdvGridExcelIO: TAdvGridExcelIO;
    EditCadastroCDUSUARIO: TAdvEdit;
    EditCadastroNMLOGIN: TAdvEdit;
    EditCadastroNMUSUARIO: TAdvEditBtn;
    DatePickerCadastroDTCADASTRO: TPlannerDatePicker;
    LabelDataUltimaAtualizacao: TLabel;
    DatePickerCadastroDTULTATUALIZACAO: TPlannerDatePicker;
    PanelFiltroFamilia: TAdvPanel;
    PanelTabela: TAdvPanel;
    DBAdvGridGeral: TDBAdvGrid;
    LabelFiltroFamilia: TLabel;
    EditFiltroMaterial: TAdvEdit;
    ButtonFiltrar: TAdvGlowButton;
    PanelBotoesControleGridItens: TAdvPanel;
    ButtonNovoMarca: TAdvGlowButton;
    ButtonNovoModelo: TAdvGlowButton;
    ButtonAdicionarLinhaGridItens: TAdvGlowButton;
    EditCadastroCDEMBALAGEM: TAdvEdit;
    EditCadastroSGEMBALAGEM: TAdvEdit;
    EditCadastroNMEMBALAGEM: TAdvEditBtn;
    ButtonLimparEmbalagem: TAdvGlowButton;
    ButtonNovoEmbalagem: TAdvGlowButton;
    ImageList: TImageList;
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
    procedure ButtonLimparFamiliaClick(Sender: TObject);
    procedure ButtonNovoFamiliaClick(Sender: TObject);
    procedure EditCadastroDEFAMILIAExit(Sender: TObject);
    procedure EditCadastroCDFAMILIAExit(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure EditCadastroCDEMBALAGEMExit(Sender: TObject);
    procedure EditCadastroSGEMBALAGEMExit(Sender: TObject);
    procedure EditCadastroNMEMBALAGEMExit(Sender: TObject);
    procedure ButtonLimparEmbalagemClick(Sender: TObject);
    procedure ButtonNovoEmbalagemClick(Sender: TObject);
    procedure ButtonNovoMarcaClick(Sender: TObject);
    procedure ButtonNovoModeloClick(Sender: TObject);
    procedure ColumnGridMarcaModeloClickCell(Sender: TObject; ARow,
      ACol: Integer);
    procedure BitBtnCadastrarImagensClick(Sender: TObject);
    procedure ButtonOrdenarRegistrosClick(Sender: TObject);
    procedure EditCadastroDEFAMILIAClickBtn(Sender: TObject);
    procedure EditCadastroNMEMBALAGEMClickBtn(Sender: TObject);
    procedure OfficePageCadastroShow(Sender: TObject);
    procedure EditCadastroCDEMBALAGEMChange(Sender: TObject);
    procedure EditFiltroMaterialChange(Sender: TObject);
    procedure ButtonFiltrarClick(Sender: TObject);
    procedure ColumnGridMarcaModeloGetEditorType(Sender: TObject; ACol,
      ARow: Integer; var AEditor: TEditorType);
    procedure ColumnGridMarcaModeloEllipsClick(Sender: TObject; ACol,
      ARow: Integer; var S: string);
    procedure ButtonAdicionarLinhaGridItensClick(Sender: TObject);
  private
    { Private declarations }
    pId: TGUID;
    pOpcao: Char;
    pCodigo, pEspacamentoInicial, pEspacamentoFinal, pEspacamentoEntre: integer;
    pAtivarControle: boolean;
    plFamilia, plEmbalagem, plMarca, plModelo: TStringList;
    pOrdenacao: string;
    pFamilia: TFamilia;
    pMaterial: TMaterial;
    pMarca: TMarca;
    pModelo: TModelo;
    pEmbalagem: TEmbalagem;
    pUsuario: TUsuario;
    procedure editaColunaGrid(prmIndice: integer; prmNome, prmCabecalho: string;
      prmEditor: TEditorType; prmAlinhamento: TAlignment; prmTamanho: integer;
      prmSomenteLeitura: boolean);
    procedure desabilitaBotoes;
    procedure habilitaBotoes;
    procedure novoCadastro;
    procedure editaCadastro;
    procedure insereCadastro;
    procedure atualizaCadastro;
    procedure limpaGrid;
    function validaExclusao: boolean;
    procedure carregaImagensBotoes;
    property EspacamentoInicial: integer read pEspacamentoInicial write pEspacamentoInicial;
    property EspacamentoEntre: integer read pEspacamentoEntre write pEspacamentoEntre;
    property EspacamentoFinal: integer read pEspacamentoFinal write pEspacamentoFinal;
  public
    { Public declarations }
    procedure editaCadastroViaConsulta(prmCodigo: integer);
    procedure setaFamilia(prmFamilia: string);
    property Opcao: char read pOpcao write pOpcao;
    property Codigo: integer read pCodigo write pCodigo;
    property Ordenacao: string read pOrdenacao write pOrdenacao;
  end;

var
  fmCadMaterial: TfmCadMaterial;

implementation

uses unPrincipal, unConFiltroPadrao, undmPrincipal, unCadMarca, unCadFamilia,
  undmEstilo, unCadEmbalagem, unCadModelo, unCadImagem, unAplOrdenaGrid;

{$R *.dfm}

procedure TfmCadMaterial.atualizaCadastro;
var
  vRetorno, i: integer;
begin
  try
    // Atualiza o Material.
    pMaterial.Codigo := Codigo;
    pMaterial.Familia := EditCadastroCDFAMILIA.Text;
    pMaterial.Nome := EditCadastroDEMATERIAL.Text;
    pMaterial.Tipo := 'P';
    if CheckBoxCadastroFLATIVO.Checked then
      pMaterial.Ativo := 'S'
    else
      pMaterial.Ativo := 'N';
    vRetorno := pMaterial.atualiza;

    if vRetorno = 0 then
      raise Exception.Create('Não foi possível atualizar o cadastro.');

    // Insere a embalagem do material.
    pMaterial.Embalagem := StrToInt(EditCadastroCDEMBALAGEM.Text);
    pMaterial.Equivalencia := 1;
    pMaterial.EmbalagemPadrao := 'S';
    vRetorno := pMaterial.atualizaMaterialEmbalagem;

    if vRetorno = 0 then
      raise Exception.Create('Não foi possível atualizar o cadastro.');

    // Exclui as Marcas / Modelos do Material.
    pMaterial.excluiMaterialMarcaModelo;

    // Insere as marcas/modelos do Material.
    with ColumnGridMarcaModelo do
    begin
      if RowCount > 1 then
      begin
        for i := 1 to RowCount -1 do
        begin
          if ColumnByName['CDMARCA'].Rows[i] <> EmptyStr then
          begin
            pMaterial.Marca := ColumnByName['CDMARCA'].Ints[i];
            pMaterial.Modelo := ColumnByName['CDMODELO'].Ints[i];
            if IsRadioButtonChecked(1,i) = true then
              pMaterial.MarcaModeloPadrao := 'S'
            else
              pMaterial.MarcaModeloPadrao := 'N';
            vRetorno := pMaterial.insereMaterialMarcaModelo;

            if vRetorno = 0 then
              raise Exception.Create('Não foi possível atualizar o cadastro.');
          end;
        end;
      end;
    end;

    fmPrincipal.apresentaResultadoCadastro('Cadastro atualizado com sucesso.');
  except
    on E: exception do
      raise;
  end;
end;

procedure TfmCadMaterial.BitBtnRestaurarClick(Sender: TObject);
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

procedure TfmCadMaterial.BitBtnCadastrarImagensClick(Sender: TObject);
begin
  fmCadImagem := TfmCadImagem.Create(Self);
  fmCadImagem.Caption := Caption + ' :: ' + fmCadImagem.Caption;
  with fmCadImagem do
  begin
    Tag := 0;
    setacdMaterial(Codigo);
    carregaImagensMaterial;
    Show;
  end;
end;

procedure TfmCadMaterial.BitBtnExcluirClick(Sender: TObject);
var
  vRetorno: integer;
begin
  // Valida se realmente o usuário quer realizar a exclusão.
  if MessageBox(fmPrincipal.Handle,
                PWideChar('Confirma a exclusão do material?'),
                cTituloMensagemConfirmacao,
                MB_YESNO or MB_ICONQUESTION or MB_DEFBUTTON2) = IDNO then
    Exit;
  // Valida se é possível realizar a exclusão.
  if not validaExclusao then
    Exit;

  desabilitaBotoes;
  try
    pMaterial.Codigo := Codigo;
    vRetorno := pMaterial.exclui;

    BitBtnNovoClick(Sender);

    if vRetorno <> 0 then
      fmPrincipal.apresentaResultadoCadastro('Cadastro excluído com sucesso.')
    else
      raise Exception.Create('Não foi possível excluir o cadastro.');

    // Atualiza a Grid.
    MenuItemAtualizarTabelaClick(Sender);
  except
    on E: exception do
      fmPrincipal.manipulaExcecoes(Sender,E);
  end;
end;

procedure TfmCadMaterial.BitBtnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfmCadMaterial.insereCadastro;
var
  vRetorno, i: integer;
begin
  try
    // Insere o Material.
    pMaterial.Familia := EditCadastroCDFAMILIA.Text;
    pMaterial.Nome := EditCadastroDEMATERIAL.Text;
    pMaterial.Tipo := 'P';
    if CheckBoxCadastroFLATIVO.Checked then
      pMaterial.Ativo := 'S'
    else
      pMaterial.Ativo := 'N';
    pMaterial.Usuario := StrToInt(EditCadastroCDUSUARIO.Text);

    Codigo := pMaterial.insere;

    if Codigo = 0 then
      raise Exception.Create('Não foi possível incluir o cadastro.');

    // Insere a Embalagem do Material.
    pMaterial.Embalagem := StrToInt(EditCadastroCDEMBALAGEM.Text);
    pMaterial.Equivalencia := 1;
    pMaterial.EmbalagemPadrao := 'S';

    pMaterial.Codigo := Codigo;
    vRetorno := pMaterial.insereMaterialEmbalagem;

    // Se não conseguir incluir a Marca/Modelo, faz rollback de tudo.
    if vRetorno = 0 then
    begin
      pMaterial.exclui;
      raise Exception.Create('Não foi possível incluir o cadastro.');
    end;

    // Insere a(s) Marca(s)/Modelo(s) do Material.
    with ColumnGridMarcaModelo do
    begin
      if RowCount >= 2 then
      begin
        for i := 1 to RowCount -1 do
        begin
          if ColumnByName['CDMARCA'].Rows[i] <> EmptyStr then
          begin
            pMaterial.Marca := ColumnByName['CDMARCA'].Ints[i];
            pMaterial.Modelo := ColumnByName['CDMODELO'].Ints[i];
            if IsRadioButtonChecked(1,i) then
              pMaterial.MarcaModeloPadrao := 'S'
            else
              pMaterial.MarcaModeloPadrao := 'N';

            vRetorno := pMaterial.insereMaterialMarcaModelo;

            // Se não conseguir incluir a Marca/Modelo, faz rollback de tudo.
            if vRetorno = 0 then
            begin
              pMaterial.excluiMaterialMarcaModelo;
              pMaterial.exclui;
              raise Exception.Create('Não foi possível incluir o cadastro.');
              Exit;
            end;
          end;
        end;
      end;
    end;

    EditCadastroCDMATERIAL.Text := IntToStr(Codigo);
    fmPrincipal.apresentaResultadoCadastro('Cadastro incluído com sucesso.');
  except
    on E: exception do
      raise;
  end;
end;

procedure TfmCadMaterial.limpaGrid;
var
  i: integer;
begin
  with ColumnGridMarcaModelo do
  begin
    BeginUpdate;
//    Enabled := true;
    ClearRows(1,RowCount -1);
    for i := RowCount -1 downto 1 do
    begin
      RemoveRadio(1,i);
      RemoveImageIdx(4,i);
      if i <> 1 then
        RemoveRows(i,1);
    end;
    AddRadioButton(1,1,true);
    ColumnByName['NMMARCA'].ReadOnly := false;
    ColumnByName['NMMODELO'].ReadOnly := false;
    AddImageIdx(4,1,0,haCenter,vaCenter);
//    RowCount := 2;
    HideColumns(5,6);
    EndUpdate;
  end;
end;

procedure TfmCadMaterial.BitBtnNovoClick(Sender: TObject);
begin
  pOpcao := 'I';
  desabilitaBotoes;
  novoCadastro;
  BitBtnSalvar.Enabled := true;
  BitBtnRestaurar.Enabled := true;
end;

procedure TfmCadMaterial.BitBtnSalvarClick(Sender: TObject);
var
  vMensagem: string;
begin
  desabilitaBotoes;
  // Validações.
  vMensagem := EmptyStr;
  if AnsiCompareText(EditCadastroCDFAMILIA.Text,EmptyStr) = 0 then
    vMensagem := vMensagem + #13#10'- O campo Família é requerido.';
  if AnsiCompareText(EditCadastroDEMATERIAL.Text,EmptyStr) = 0 then
    vMensagem := vMensagem + #13#10'- O campo Material é requerido.';
  if AnsiCompareText(EditCadastroCDEMBALAGEM.Text,EmptyStr) = 0 then
    vMensagem := vMensagem + #13#10'- O campo Embalagem é requerido.';

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
    begin
      BitBtnFecharClick(Sender);
      Exit;
    end;

    // Atualiza a Grid.
    MenuItemAtualizarTabelaClick(Sender);

    // Edita o cadastro realizado.
    editaCadastro;
    Opcao := 'A';
    habilitaBotoes;
  except
    on E: Exception do
      fmPrincipal.manipulaExcecoes(Sender,E);
  end;
end;

procedure TfmCadMaterial.ColumnGridMarcaModeloClickCell(Sender: TObject; ARow,
  ACol: Integer);
var
  i: integer;
  vResultado, vAux: boolean;
begin
  if ARow = 0 then
    Exit;

  with ColumnGridMarcaModelo do
  begin
    // Se clicou na coluna de excluir valida se pode excluir.
    if ACol = 4 then
    begin
      if (ColumnByName['CDMARCA'].Rows[ARow] <> EmptyStr) and
         (ColumnByName['CDMARCA'].Rows[ARow] <> EmptyStr) then
      begin
        pModelo.Marca := ColumnByName['CDMARCA'].Ints[ARow];
        pModelo.Codigo := ColumnByName['CDMODELO'].Ints[ARow];
        vResultado := pModelo.existeDependenciaAquisicao;
        pModelo.Codigo := Codigo;
        if vResultado = true then
        begin
          MessageBox(fmPrincipal.Handle,
                     PWideChar('Esta marca/modelo do material está associada a uma aquisição e por isto não poderá desvinculada do material.'),
                     cTituloMensagemAlerta,
                     MB_OK or MB_ICONEXCLAMATION);
          Exit;
        end;
      end;

      if RowCount > 2 then
      begin
        RemoveRows(Row,1);
        // Verifica se existe outro selecionado.
        vAux := false;
        for i := 1 to RowCount-1 do
          if IsRadioButtonChecked(1,i) then
            vAux := true;
        if vAux = false then
          SetRadioButtonState(1,1,true);
      end
      else
        limpaGrid;
    end;
  end;
end;

procedure TfmCadMaterial.ColumnGridMarcaModeloEllipsClick(Sender: TObject; ACol,
  ARow: Integer; var S: string);
var
  i: integer;
  vFiltro, vAux: string;
begin
  if ARow = 0 then
    Exit;
  if (ACol <> 2) and (ACol <> 3) then
    Exit;

  with ColumnGridMarcaModelo do
  begin
    if ACol = 2 then
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
                  ColumnByName['CDMARCA'].Rows[ARow] := objResSearch[i].Codigo;
                  ColumnByName['NMMARCA'].Rows[ARow] := objResSearch[i].Nome1;
                  S := objResSearch[i].Nome1;
                end;
          end;
        end;
      finally
        plModelo.Clear;
      end;
    end;

    if ACol = 3 then
    begin
      if ColumnByName['CDMARCA'].Rows[ARow] = EmptyStr then
      begin
        MessageBox(fmPrincipal.Handle,
                   PWideChar('É necessário selecionar uma marca antes de selecionar um modelo.'),
                   cTituloMensagemAlerta,
                   MB_OK or MB_ICONEXCLAMATION);
        Exit;
      end;

      // Filtro para proibir selecionar modelos duplicados.
      if RowCount > 2 then
      begin
        vFiltro := ' AND "NU-Código" NOT IN(';
        for i := 1 to RowCount -1 do
        begin
          if (ColumnByName['CDMARCA'].Ints[ARow] = ColumnByName['CDMARCA'].Ints[i]) and
             (ColumnByName['CDMODELO'].Rows[i] <> EmptyStr)then
            vAux := vAux + ColumnByName['CDMODELO'].Rows[i] + ',';
        end;
        if vAux <> EmptyStr then
          vFiltro := vFiltro + Copy(vAux,1,Length(vAux)-1) + ')';
      end;

      fmConFiltroPadrao := TfmConFiltroPadrao.Create(Self);
      with fmConFiltroPadrao do
      begin
        try
          setaTitulo('Consulta de Modelos');
          setaConsulta(pModelo.filtro);
          setaOpcao('R');
          setaFiltrosExtras('"NM-Marca" = '+QuotedStr(ColumnByName['NMMARCA'].Rows[ARow])+vFiltro,
                            'Nome da marca: '+ColumnByName['NMMARCA'].Rows[ARow]);
          executaFiltro(0,EmptyStr);
          ShowModal;
        finally
          plModelo.Clear;
          with pResSearch do
            for i := 0 to Count -1 do
              if objResSearch[i].Id = buscaId then
              begin
                plModelo.Add(objResSearch[i].Codigo);
                ColumnByName['CDMODELO'].Rows[ARow] := objResSearch[i].Codigo;
                ColumnByName['NMMODELO'].Rows[ARow] := objResSearch[i].Nome2;
                S := objResSearch[i].Nome2;
              end;
        end;
      end;
    end;  
  end;
end;

procedure TfmCadMaterial.ColumnGridMarcaModeloGetEditorType(Sender: TObject;
  ACol, ARow: Integer; var AEditor: TEditorType);
begin
  if ARow = 0 then
    Exit;

 case ACol of
   2,3:
   begin
     AEditor := edEditBtn;
     with ColumnGridMarcaModelo.BtnEdit do
     begin
       EditorEnabled := false;
       Glyph.Assign(fmPrincipal.fnGeral.obtemImagemPesquisa);
       ButtonCaption := EmptyStr;
     end;
   end;
 end;
end;

procedure TfmCadMaterial.EditCadastroDEFAMILIAClickBtn(Sender: TObject);
var
  i: integer;
begin
  // Para que o evento não seja executado.
  EditCadastroCDFAMILIA.OnExit := nil;
  EditCadastroDEFAMILIA.OnExit := nil;
  EditCadastroDEFAMILIA.OnClickBtn := nil;
  ActiveControl := EditCadastroDEFAMILIA;

  fmConFiltroPadrao := TfmConFiltroPadrao.Create(Self);
  try
    with fmConFiltroPadrao do
    begin
      try
        setaTitulo('Consulta de Famílias');
        setaConsulta(pFamilia.filtroNivel2);
        setaOpcao('R');
        executaFiltro(0,EmptyStr);
        ShowModal;
      finally
        plFamilia.Clear;
        with pResSearch do
          for i := 0 to Count -1 do
            if objResSearch[i].Id = buscaId then
            begin
              plFamilia.Add(objResSearch[i].Codigo);
              EditCadastroCDFAMILIA.Text := objResSearch[i].Codigo;
              EditCadastroDEFAMILIA.Text := objResSearch[i].Nome2;
            end;
      end;
    end;
  finally
    EditCadastroCDFAMILIA.Enabled := (plFamilia.Count = 0);
    EditCadastroDEFAMILIA.Enabled := (plFamilia.Count = 0);
    ButtonLimparFamilia.Enabled := (plFamilia.Count > 0);
    ButtonNovoFamilia.Enabled := (plFamilia.Count = 0);

    // Valida para qual campo vai se posicionar.
    if pAtivarControle then
      if OfficePagerCentral.ActivePageIndex = 1 then
        if plFamilia.Count > 0 then
          ActiveControl := EditCadastroDEMATERIAL
        else
          ActiveControl := EditCadastroDEFAMILIA;
  end;

  // Para que o evento volte a ser executado.
  EditCadastroCDFAMILIA.OnExit := EditCadastroCDFAMILIAExit;
  EditCadastroDEFAMILIA.OnExit := EditCadastroDEFAMILIAExit;
  EditCadastroDEFAMILIA.OnClickBtn := EditCadastroDEFAMILIAClickBtn;
end;

procedure TfmCadMaterial.EditCadastroDEFAMILIAExit(Sender: TObject);
var
  i: integer;
  vQuery: TZQuery;
begin
  if Length(Trim(EditCadastroDEFAMILIA.Text)) = 0 then
    Exit;

  // Para que o evento não seja executado.
  EditCadastroCDFAMILIA.OnExit := nil;
  EditCadastroDEFAMILIA.OnExit := nil;
  EditCadastroDEFAMILIA.OnClickBtn := nil;

  try
    vQuery := pFamilia.filtroNivel2;
    with vQuery do
    begin
      SQL.Add('WHERE UPPER("DE-Família") LIKE :DEFAMILIA');
      Params.ParamByName('DEFAMILIA').AsString := '%'+AnsiUpperCase(EditCadastroDEFAMILIA.Text)+'%';
      dmPrincipal.executaConsulta(vQuery);

      if RecordCount > 1 then
      begin
        fmConFiltroPadrao := TfmConFiltroPadrao.Create(Self);
        with fmConFiltroPadrao do
        begin
          try
            setaTitulo('Consulta de Famílias');
            setaConsulta(pFamilia.filtroNivel2);
            setaOpcao('R');
            executaFiltro(3,EditCadastroDEFAMILIA.Text);
            ShowModal;
          finally
            plFamilia.Clear;
            with pResSearch do
              for i := 0 to Count -1 do
                if objResSearch[i].Id = buscaId then
                begin
                  plFamilia.Add(objResSearch[i].Codigo);
                  EditCadastroCDFAMILIA.Text := objResSearch[i].Codigo;
                  EditCadastroDEFAMILIA.Text := objResSearch[i].Nome2;
                end;
          end;
        end;
      end
      else
        if not Eof then
        begin
          plFamilia.Clear;
          plFamilia.Add(Fields.Fields[0].AsString);
          EditCadastroCDFAMILIA.Text := Fields.Fields[0].AsString;
          EditCadastroDEFAMILIA.Text := Fields.Fields[2].AsString;
        end
        else
          fmPrincipal.apresentaResultadoCadastro('Nenhum registro encontrado.');
      Active := false;
    end;
  finally
    FreeAndNil(vQuery);

    EditCadastroCDFAMILIA.Enabled := (plFamilia.Count = 0);
    EditCadastroDEFAMILIA.Enabled := (plFamilia.Count = 0);
    ButtonLimparFamilia.Enabled := (plFamilia.Count > 0);
    ButtonNovoFamilia.Enabled := (plFamilia.Count = 0);

    // Valida para qual campo vai se posicionar.
    if pAtivarControle then
      if plFamilia.Count > 0 then
        ActiveControl := EditCadastroDEMATERIAL
      else
        ActiveControl := EditCadastroDEFAMILIA;
  end;

  // Para que o evento volte a ser executado.
  EditCadastroCDFAMILIA.OnExit := EditCadastroCDFAMILIAExit;
  EditCadastroDEFAMILIA.OnExit := EditCadastroDEFAMILIAExit;
  EditCadastroDEFAMILIA.OnClickBtn := EditCadastroDEFAMILIAClickBtn;
end;

procedure TfmCadMaterial.EditCadastroNMEMBALAGEMClickBtn(Sender: TObject);
var
  i: integer;
begin
  // Para que o evento não seja executado.
  EditCadastroCDEMBALAGEM.OnExit := nil;
  EditCadastroSGEMBALAGEM.OnExit := nil;
  EditCadastroNMEMBALAGEM.OnExit := nil;
  EditCadastroNMEMBALAGEM.OnClickBtn := nil;
  ActiveControl := EditCadastroNMEMBALAGEM;

  fmConFiltroPadrao := TfmConFiltroPadrao.Create(Self);
  try
    with fmConFiltroPadrao do
    begin
      try
        setaTitulo('Consulta de Embalagens');
        setaConsulta(pEmbalagem.filtro);
        setaOpcao('R');
        executaFiltro(0,EmptyStr);
        ShowModal;
      finally
        plEmbalagem.Clear;
        with pResSearch do
          for i := 0 to Count -1 do
            if objResSearch[i].Id = buscaId then
            begin
              plEmbalagem.Add(objResSearch[i].Codigo);
              EditCadastroCDEMBALAGEM.Text := objResSearch[i].Codigo;
              EditCadastroSGEMBALAGEM.Text := objResSearch[i].Nome1;
              EditCadastroNMEMBALAGEM.Text := objResSearch[i].Nome2;
            end;
      end;
    end;
  finally
    EditCadastroCDEMBALAGEM.Enabled := (plEmbalagem.Count = 0);
    EditCadastroSGEMBALAGEM.Enabled := (plEmbalagem.Count = 0);
    EditCadastroNMEMBALAGEM.Enabled := (plEmbalagem.Count = 0);
    ButtonLimparEmbalagem.Enabled := (plEmbalagem.Count > 0);
    ButtonNovoEmbalagem.Enabled := (plEmbalagem.Count = 0);

    // Valida para qual campo vai se posicionar.
    if pAtivarControle then
      if OfficePagerCentral.ActivePageIndex = 1 then
        if plEmbalagem.Count > 0 then
          ActiveControl := ColumnGridMarcaModelo
        else
          ActiveControl := EditCadastroNMEMBALAGEM;
  end;

  // Para que o evento volte a ser executado.
  EditCadastroCDEMBALAGEM.OnExit := EditCadastroCDEMBALAGEMExit;
  EditCadastroSGEMBALAGEM.OnExit := EditCadastroSGEMBALAGEMExit;
  EditCadastroNMEMBALAGEM.OnExit := EditCadastroNMEMBALAGEMExit;
  EditCadastroNMEMBALAGEM.OnClickBtn := EditCadastroNMEMBALAGEMClickBtn;
end;

procedure TfmCadMaterial.EditCadastroNMEMBALAGEMExit(Sender: TObject);
var
  i: integer;
  vQuery: TZQuery;
begin
  // Se não digitou nada, sai sem pesquisar.
  if Length(Trim(EditCadastroNMEMBALAGEM.Text)) = 0 then
    Exit;

  // Para que o evento não seja executado.
  EditCadastroCDEMBALAGEM.OnExit := nil;
  EditCadastroSGEMBALAGEM.OnExit := nil;
  EditCadastroNMEMBALAGEM.OnExit := nil;
  EditCadastroNMEMBALAGEM.OnClickBtn := nil;

  try
    vQuery := pEmbalagem.filtro;
    with vQuery do
    begin
      SQL.Add('WHERE UPPER("NM-Embalagem") LIKE :NMEMBALAGEM');
      Params.ParamByName('NMEMBALAGEM').AsString := '%'+AnsiUpperCase(EditCadastroNMEMBALAGEM.Text)+'%';
      dmPrincipal.executaConsulta(vQuery);

      if RecordCount > 1 then
      begin
        fmConFiltroPadrao := TfmConFiltroPadrao.Create(Self);
        with fmConFiltroPadrao do
        begin
          try
            setaTitulo('Consulta de Embalagens');
            setaConsulta(pEmbalagem.filtro);
            setaOpcao('R');
            executaFiltro(3,EditCadastroNMEMBALAGEM.Text);
            ShowModal;
          finally
            plEmbalagem.Clear;
            with pResSearch do
              for i := 0 to Count -1 do
                if objResSearch[i].Id = buscaId then
                begin
                  plEmbalagem.Add(objResSearch[i].Codigo);
                  EditCadastroCDEMBALAGEM.Text := objResSearch[i].Codigo;
                  EditCadastroSGEMBALAGEM.Text := objResSearch[i].Nome1;
                  EditCadastroNMEMBALAGEM.Text := objResSearch[i].Nome2;
                end;
          end;
        end;
      end
      else
        if not Eof then
        begin
          plEmbalagem.Clear;
          plEmbalagem.Add(Fields.Fields[0].AsString);
          EditCadastroCDEMBALAGEM.Text := Fields.Fields[0].AsString;
          EditCadastroSGEMBALAGEM.Text := Fields.Fields[1].AsString;
          EditCadastroNMEMBALAGEM.Text := Fields.Fields[2].AsString;
        end
        else
        begin
          plEmbalagem.Clear;
          EditCadastroCDEMBALAGEM.Clear;
          EditCadastroSGEMBALAGEM.Clear;
          EditCadastroNMEMBALAGEM.Clear;
          fmPrincipal.apresentaResultadoCadastro('Nenhum registro encontrado.');
        end;
      Active := false;
    end;
  finally
    FreeAndNil(vQuery);

    EditCadastroCDEMBALAGEM.Enabled := (plEmbalagem.Count = 0);
    EditCadastroSGEMBALAGEM.Enabled := (plEmbalagem.Count = 0);
    EditCadastroNMEMBALAGEM.Enabled := (plEmbalagem.Count = 0);
    ButtonLimparEmbalagem.Enabled := (plEmbalagem.Count > 0);
    ButtonNovoEmbalagem.Enabled := (plEmbalagem.Count = 0);

    // Valida para qual campo vai se posicionar.
    if pAtivarControle then
      if OfficePagerCentral.ActivePageIndex = 1 then
        if plEmbalagem.Count > 0 then
          ActiveControl := ColumnGridMarcaModelo
        else
          ActiveControl := EditCadastroNMEMBALAGEM;
  end;

  // Para que o evento volte a ser executado.
  EditCadastroCDEMBALAGEM.OnExit := EditCadastroCDEMBALAGEMExit;
  EditCadastroSGEMBALAGEM.OnExit := EditCadastroSGEMBALAGEMExit;
  EditCadastroNMEMBALAGEM.OnExit := EditCadastroNMEMBALAGEMExit;
  EditCadastroNMEMBALAGEM.OnClickBtn := EditCadastroNMEMBALAGEMClickBtn;
end;

procedure TfmCadMaterial.DBAdvGridGeralDblClickCell(Sender: TObject; ARow,
  ACol: Integer);
begin
  if ARow > 0 then
    MenuItemEditarRegistroClick(MenuItemEditarRegistro);
end;

procedure TfmCadMaterial.DBAdvGridGeralFilterSelect(Sender: TObject; Column,
  ItemIndex: Integer; FriendlyName: string; var FilterCondition: string);
begin
  case ItemIndex of
    0: FilterCondition := EmptyStr;
    1: FilterCondition := 'S';
    2: FilterCondition := 'N';
  end;

  DBAdvGridGeral.Cells[Column,0] := FriendlyName;
end;

procedure TfmCadMaterial.desabilitaBotoes;
begin
  BitBtnSalvar.Enabled := false;
  BitBtnExcluir.Enabled := false;
  BitBtnRestaurar.Enabled := false;
  BitBtnNovo.Enabled := false;
  BitBtnCadastrarImagens.Enabled := false;
end;

procedure TfmCadMaterial.editaCadastro;
var
  vQuery, vQuery2, vQuery3, vQuery4: TZQuery;
begin
  novoCadastro;

  try
    try
      vQuery := pMaterial.visao;
      with vQuery do
      begin
        // Consulta o cadastro do Material.
        SQL.Add('WHERE CDMATERIAL = :CURRENT_CDMATERIAL');
        Params.ParamByName('CURRENT_CDMATERIAL').AsInteger := Codigo;
        dmPrincipal.executaConsulta(vQuery);

        if not Eof then
        begin
          EditCadastroCDMATERIAL.Text := IntToStr(Codigo);
          EditCadastroCDFAMILIA.Text := Fields.FieldByName('CDFAMILIAF').AsString;
          EditCadastroCDFAMILIAExit(EditCadastroCDFAMILIA);
          EditCadastroDEMATERIAL.Text := Fields.FieldByName('DEMATERIAL').AsString;
          CheckBoxCadastroFLATIVO.Checked := (Fields.FieldByName('FLATIVO').AsString = 'S');

          DatePickerCadastroDTCADASTRO.Date := Fields.FieldByName('DTREGISTRO').AsDateTime;
          if not Fields.FieldByName('DTULTATUALIZACAO').IsNull then
            DatePickerCadastroDTULTATUALIZACAO.Date := Fields.FieldByName('DTULTATUALIZACAO').AsDateTime
          else
            DatePickerCadastroDTULTATUALIZACAO.Date;

          // Consulta o cadastro da Embalagem do Material.
          vQuery2 := pMaterial.filtroMaterialEmbalagem;
          with vQuery2 do
            try
              SQL.Add('WHERE CDMATERIAL = :CURRENT_CDMATERIAL');
              Params.ParamByName('CURRENT_CDMATERIAL').AsInteger := Codigo;
              dmPrincipal.executaConsulta(vQuery2);

              if not Eof then
              begin
                EditCadastroCDEMBALAGEM.Text := Fields.FieldByName('CDEMBALAGEM').AsString;
                EditCadastroCDEMBALAGEMExit(EditCadastroCDEMBALAGEM);
              end;
            finally
              Active := false;
              FreeAndNil(vQuery2);
            end;

          // Consulta o cadastro das Marcas/Modelos do Material.
          vQuery3 := pMaterial.filtroMaterialMarcaModelo;
          with vQuery3 do
            try
              SQL.Add('WHERE CDMATERIAL = :CURRENT_CDMATERIAL');
              Params.Items[0].AsInteger := Codigo;
              dmPrincipal.executaConsulta(vQuery3);

              while not Eof do
              begin
                with ColumnGridMarcaModelo do
                begin
                  ColumnByName['CDMARCA'].Ints[RowCount-1] := Fields.FieldByName('CDMARCA').AsInteger;
                  pMarca.Codigo := ColumnByName['CDMARCA'].Ints[RowCount-1];
                  ColumnByName['NMMARCA'].Rows[RowCount-1] := pMarca.obtemMarca;                  
                  ColumnByName['CDMODELO'].Ints[RowCount-1] := Fields.FieldByName('CDMODELO').AsInteger;
                  pModelo.Codigo := ColumnByName['CDMODELO'].Ints[RowCount-1];
                  pModelo.Marca := ColumnByName['CDMARCA'].Ints[RowCount-1];
                  ColumnByName['NMMODELO'].Rows[RowCount-1] := pModelo.obtemModelo;
                  if Fields.FieldByName('FLPADRAO').AsString = 'S' then
                    AddRadioButton(1,RowCount-1,true)
                  else
                    AddRadioButton(1,RowCount-1,false);
                  AddImageIdx(4,RowCount-1,0,haCenter,vaCenter);
                  ColumnByName['NMMARCA'].ReadOnly := true;
                  ColumnByName['NMMODELO'].ReadOnly := true;
                    
                  Next;
                  if not Eof then
                    AddRow;
                end;
              end;
            finally
              Active := false;
              FreeAndNil(vQuery3);
            end;

          // Consulta o cadastro do Usuário que realizou o cadastro do Material.
          vQuery4 := pUsuario.lista;
          with vQuery4 do
            try
              SQL.Add('WHERE cdusuario = :CDUSUARIO');
              Params.Items[0].AsInteger := vQuery.Fields.FieldByName('CDUSUARIO').AsInteger;
              dmPrincipal.executaConsulta(vQuery4);

              if not Eof then
              begin
                EditCadastroCDUSUARIO.Text := Fields.FieldByName('CDUSUARIO').AsString;
                EditCadastroNMLOGIN.Text := Fields.FieldByName('NMLOGIN').AsString;
                EditCadastroNMUSUARIO.Text := Fields.FieldByName('NMUSUARIO').AsString;
              end;
            finally
              Active := false;
              FreeAndNil(vQuery4);
            end;

          BitBtnCadastrarImagens.Enabled := true;
        end
        else
          raise exception.Create('O cadastro do Material não foi encontrado.');
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

procedure TfmCadMaterial.editaCadastroViaConsulta(prmCodigo: integer);
begin
  pAtivarControle := false;
  Codigo := prmCodigo;
  Opcao := 'A';
  Tag := 1;
  editaCadastro;
  BitBtnExcluir.Enabled := true;
  BitBtnCadastrarImagens.Enabled := true;
  OfficePageConsulta.TabVisible := false;
  pAtivarControle := true;
end;

procedure TfmCadMaterial.editaColunaGrid(prmIndice: integer; prmNome,
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

procedure TfmCadMaterial.EditCadastroCDEMBALAGEMChange(Sender: TObject);
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
      OnChange := EditCadastroCDEMBALAGEMChange;
      SelStart := Length(Text);
    end;
end;

procedure TfmCadMaterial.EditCadastroCDEMBALAGEMExit(Sender: TObject);
var
  vQuery: TZQuery;
begin
  // Se não digitou nada, sai sem pesquisar.
  if Length(Trim(EditCadastroCDEMBALAGEM.Text)) = 0 then
    Exit;

  // Para que o evento não seja executado.
  EditCadastroCDEMBALAGEM.OnExit := nil;
  EditCadastroSGEMBALAGEM.OnExit := nil;
  EditCadastroNMEMBALAGEM.OnExit := nil;
  EditCadastroNMEMBALAGEM.OnClickBtn := nil;

  try
    vQuery := pEmbalagem.filtro;
    with vQuery do
    begin
      SQL.Add('WHERE "NU-Código" = :CDEMBALAGEM');
      Params.ParamByName('CDEMBALAGEM').AsInteger := StrToInt(EditCadastroCDEMBALAGEM.Text);
      dmPrincipal.executaConsulta(vQuery);

      if not Eof then
      begin
        plEmbalagem.Clear;
        plEmbalagem.Add(Fields.Fields[0].AsString);
        EditCadastroCDEMBALAGEM.Text := Fields.Fields[0].AsString;
        EditCadastroSGEMBALAGEM.Text := Fields.Fields[1].AsString;
        EditCadastroNMEMBALAGEM.Text := Fields.Fields[2].AsString;
      end
      else
      begin
        plEmbalagem.Clear;
        EditCadastroCDEMBALAGEM.Clear;
        EditCadastroSGEMBALAGEM.Clear;
        EditCadastroNMEMBALAGEM.Clear;
        fmPrincipal.apresentaResultadoCadastro('Nenhum registro encontrado.');
      end;
      Active := false;
    end;
  finally
    FreeAndNil(vQuery);

    EditCadastroCDEMBALAGEM.Enabled := (plEmbalagem.Count = 0);
    EditCadastroSGEMBALAGEM.Enabled := (plEmbalagem.Count = 0);
    EditCadastroNMEMBALAGEM.Enabled := (plEmbalagem.Count = 0);
    ButtonLimparEmbalagem.Enabled := (plEmbalagem.Count > 0);
    ButtonNovoEmbalagem.Enabled := (plEmbalagem.Count = 0);

    // Valida para qual campo vai se posicionar.
    if pAtivarControle then
      if OfficePagerCentral.ActivePageIndex = 1 then
        if plEmbalagem.Count > 0 then
          ActiveControl := ColumnGridMarcaModelo
        else
          ActiveControl := EditCadastroCDEMBALAGEM;
  end;

  // Para que o evento volte a ser executado.
  EditCadastroCDEMBALAGEM.OnExit := EditCadastroCDEMBALAGEMExit;
  EditCadastroSGEMBALAGEM.OnExit := EditCadastroSGEMBALAGEMExit;
  EditCadastroNMEMBALAGEM.OnExit := EditCadastroNMEMBALAGEMExit;
  EditCadastroNMEMBALAGEM.OnClickBtn := EditCadastroNMEMBALAGEMClickBtn;
end;

procedure TfmCadMaterial.EditCadastroCDFAMILIAExit(Sender: TObject);
var
  i: integer;
  vQuery: TZQuery;
  vcdFamilia: string;
begin
  // Se não digitou nada, sai sem pesquisar.
  if Length(Trim(EditCadastroCDFAMILIA.Text)) = 0 then
    Exit;

  // Para que o evento não seja executado.
  EditCadastroCDFAMILIA.OnExit := nil;
  EditCadastroDEFAMILIA.OnExit := nil;
  EditCadastroDEFAMILIA.OnClickBtn := nil;

  with EditCadastroCDFAMILIA do
    if Length(Text) > 0 then
      vcdFamilia := pFamilia.formataFamilia(Text)
    else
      vcdFamilia := Text;

  try
    vQuery := pFamilia.filtroNivel2;
    with vQuery do
    begin
      SQL.Add('WHERE "NF-Código" LIKE :CDFAMILIA');
      Params.ParamByName('CDFAMILIA').AsString := vcdFamilia + '%';
      dmPrincipal.executaConsulta(vQuery);

      if RecordCount > 1 then
      begin
        fmConFiltroPadrao := TfmConFiltroPadrao.Create(Self);
        with fmConFiltroPadrao do
        begin
          try
            setaTitulo('Consulta de Famílias');
            setaConsulta(pFamilia.filtroNivel2);
            setaOpcao('R');
            executaFiltro(1,vcdFamilia);
            ShowModal;
          finally
             plFamilia.Clear;
            with pResSearch do
              for i := 0 to Count -1 do
                if objResSearch[i].Id = buscaId then
                begin
                  plFamilia.Add(objResSearch[i].Codigo);
                  EditCadastroCDFAMILIA.Text := objResSearch[i].Codigo;
                  EditCadastroDEFAMILIA.Text := objResSearch[i].Nome2;
                end;
          end;
        end;
      end
      else
        if not Eof then
        begin
          plFamilia.Clear;
          plFamilia.Add(Fields.Fields[0].AsString);
          EditCadastroCDFAMILIA.Text := Fields.Fields[0].AsString;
          EditCadastroDEFAMILIA.Text := Fields.Fields[2].AsString;
        end
        else
        begin
          plFamilia.Clear;
          EditCadastroCDFAMILIA.Clear;
          EditCadastroDEFAMILIA.Clear;
          fmPrincipal.apresentaResultadoCadastro('Nenhum registro encontrado.');
        end;
      Active := false;
    end;
  finally
    FreeAndNil(vQuery);

    EditCadastroCDFAMILIA.Enabled := (plFamilia.Count = 0);
    EditCadastroDEFAMILIA.Enabled := (plFamilia.Count = 0);
    ButtonLimparFamilia.Enabled := (plFamilia.Count > 0);
    ButtonNovoFamilia.Enabled := (plFamilia.Count = 0);

    // Valida para qual campo vai se posicionar.
    if pAtivarControle then
      if OfficePagerCentral.ActivePageIndex = 1 then
        if plFamilia.Count > 0 then
          ActiveControl := EditCadastroDEMATERIAL
        else
          ActiveControl := EditCadastroCDFAMILIA;
  end;

  // Para que o evento volte a ser executado.
  EditCadastroCDFAMILIA.OnExit := EditCadastroCDFAMILIAExit;
  EditCadastroDEFAMILIA.OnExit := EditCadastroDEFAMILIAExit;
  EditCadastroDEFAMILIA.OnClickBtn := EditCadastroDEFAMILIAClickBtn;
end;

procedure TfmCadMaterial.EditCadastroSGEMBALAGEMExit(Sender: TObject);
var
  i: integer;
  vQuery: TZQuery;
begin
  // Se não digitou nada, sai sem pesquisar.
  if Length(Trim(EditCadastroSGEMBALAGEM.Text)) = 0 then
    Exit;

  // Para que o evento não seja executado.
  EditCadastroCDEMBALAGEM.OnExit := nil;
  EditCadastroSGEMBALAGEM.OnExit := nil;
  EditCadastroNMEMBALAGEM.OnExit := nil;
  EditCadastroNMEMBALAGEM.OnClickBtn := nil;

  try
    vQuery := pEmbalagem.filtro;
    with vQuery do
    begin
      SQL.Add('WHERE UPPER("SG-Embalagem") LIKE :SGEMBALAGEM');
      Params.ParamByName('SGEMBALAGEM').AsString := AnsiUpperCase(EditCadastroSGEMBALAGEM.Text)+'%';
      dmPrincipal.executaConsulta(vQuery);

      if RecordCount > 1 then
      begin
        fmConFiltroPadrao := TfmConFiltroPadrao.Create(Self);
        with fmConFiltroPadrao do
        begin
          try
            setaTitulo('Consulta de Embalagens');
            setaConsulta(pEmbalagem.filtro);
            setaOpcao('R');
            executaFiltro(2,EditCadastroSGEMBALAGEM.Text);
            ShowModal;
          finally
            plEmbalagem.Clear;
            with pResSearch do
              for i := 0 to Count -1 do
                if objResSearch[i].Id = buscaId then
                begin
                  plEmbalagem.Add(objResSearch[i].Codigo);
                  EditCadastroCDEMBALAGEM.Text := objResSearch[i].Codigo;
                  EditCadastroSGEMBALAGEM.Text := objResSearch[i].Nome1;
                  EditCadastroNMEMBALAGEM.Text := objResSearch[i].Nome2;
                end;
          end;
        end;
      end
      else
        if not Eof then
        begin
          plEmbalagem.Clear;
          plEmbalagem.Add(Fields.Fields[0].AsString);
          EditCadastroCDEMBALAGEM.Text := Fields.Fields[0].AsString;
          EditCadastroSGEMBALAGEM.Text := Fields.Fields[1].AsString;
          EditCadastroNMEMBALAGEM.Text := Fields.Fields[2].AsString;
        end
        else
        begin
          plEmbalagem.Clear;
          EditCadastroCDEMBALAGEM.Clear;
          EditCadastroSGEMBALAGEM.Clear;
          EditCadastroNMEMBALAGEM.Clear;
          fmPrincipal.apresentaResultadoCadastro('Nenhum registro encontrado.');
        end;
      Active := false;
    end;
  finally
    FreeAndNil(vQuery);

    EditCadastroCDEMBALAGEM.Enabled := (plEmbalagem.Count = 0);
    EditCadastroSGEMBALAGEM.Enabled := (plEmbalagem.Count = 0);
    EditCadastroNMEMBALAGEM.Enabled := (plEmbalagem.Count = 0);
    ButtonLimparEmbalagem.Enabled := (plEmbalagem.Count > 0);
    ButtonNovoEmbalagem.Enabled := (plEmbalagem.Count = 0);

    // Valida para qual campo vai se posicionar.
    if pAtivarControle then
      if OfficePagerCentral.ActivePageIndex = 1 then
        if plEmbalagem.Count > 0 then
          ActiveControl := ColumnGridMarcaModelo
        else
          ActiveControl := EditCadastroSGEMBALAGEM;
 end;

  // Para que o evento volte a ser executado.
  EditCadastroCDEMBALAGEM.OnExit := EditCadastroCDEMBALAGEMExit;
  EditCadastroSGEMBALAGEM.OnExit := EditCadastroSGEMBALAGEMExit;
  EditCadastroNMEMBALAGEM.OnExit := EditCadastroNMEMBALAGEMExit;
  EditCadastroNMEMBALAGEM.OnClickBtn := EditCadastroNMEMBALAGEMClickBtn;
end;

procedure TfmCadMaterial.EditFiltroMaterialChange(Sender: TObject);
var
  vChar: char;
begin
  with EditFiltroMaterial do
    if Length(Text) > 0 then
    begin
      OnChange := nil;
      vChar := Text[Length(Text)];
      // Verifica se o caractere digitado é válido.
      fmPrincipal.fnGeral.verificaNumeros(vChar,3);
      if vChar <> #0 then
        Text := pMaterial.formataMaterial(Text)
      else
        Text := Copy(Text,1,Length(Text)-1);
      OnChange := EditFiltroMaterialChange;
      SelStart := Length(Text);
    end;
end;

procedure TfmCadMaterial.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  QueryGeral.Close;

  Action := caFree;
end;

procedure TfmCadMaterial.FormCreate(Sender: TObject);
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

    // Cria as listas.
    plFamilia := TStringList.Create;
    plEmbalagem := TStringList.Create;
    plMarca := TStringList.Create;
    plModelo := TStringList.Create;

    pMaterial := TMaterial.Create;
    pMarca := TMarca.Create;
    pModelo := TModelo.Create;
    pEmbalagem := TEmbalagem.Create;
    pUsuario := TUsuario.Create;

    OfficePagerCentral.ActivePageIndex := 1;

    Ordenacao := '|"Cód. material":"N":"Asc."|;|"Código":"S":"Asc."|;|"Família":"S":"Asc."|;|"Material":"S":"Asc."|;|"Embalagem":"S":"Asc."|;|"Ativo":"S":"Asc."|';

    // Monta a consulta que carregará os dados da Grid.
    with QueryGeral do
    begin
      SQL := pMaterial.lista.SQL;
      SQL.Strings[0] := 'SELECT cdmaterial, cdfamilia, defamilia, dematerial, sgembalagem, flativo';
      SQL.Add('WHERE cdfamilia LIKE :CDFAMILIA');
      SQL.Add('ORDER BY 2,3,4,5,6');
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
    with ColumnGridMarcaModelo do
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

    fmPrincipal.fnGeral.insereImageList(ImageList,fmPrincipal.LocalIcones + 'cancel-e-16.png');
    ColumnGridMarcaModelo.GridImages := ImageList;

    PopupMenuGrid.Images := fmPrincipal.ImageListPopupMenuE;
    PopupMenuGrid.DisabledImages := fmPrincipal.ImageListPopupMenuD;
    MenuItemEditarRegistro.ImageIndex := 3;
    MenuItemAtualizarTabela.ImageIndex := 4;
    MenuItemVisualizarFiltro.ImageIndex := 5;

    novoCadastro;

    FormResize(Sender);
  except
    on E: Exception do
      fmPrincipal.manipulaExcecoes(Sender,E);
  end;
end;

procedure TfmCadMaterial.FormDestroy(Sender: TObject);
begin
  FreeAndNil(plFamilia);
  FreeAndNil(plEmbalagem);
  FreeAndNil(plMarca);
  FreeAndNil(plModelo);
  FreeAndNil(pFamilia);
  FreeAndNil(pMaterial);
  FreeAndNil(pMarca);
  FreeAndNil(pModelo);
  FreeAndNil(pEmbalagem);
  FreeAndNil(pUsuario);
end;

procedure TfmCadMaterial.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Exit;
end;

procedure TfmCadMaterial.FormResize(Sender: TObject);
begin
  EspacamentoInicial := fmPrincipal.EspacamentoInicialBotao;
  EspacamentoFinal := fmPrincipal.EspacamentoFinalBotao;
  EspacamentoEntre := fmPrincipal.EspacamentoEntreBotoes;

  BitBtnFechar.Left := PanelBotoes.Width - BitBtnFechar.Width - EspacamentoFinal;
  BitBtnCadastrarImagens.Left := BitBtnFechar.Left - BitBtnCadastrarImagens.Width - EspacamentoEntre;
  BitBtnNovo.Left := BitBtnCadastrarImagens.Left - BitBtnNovo.Width - EspacamentoEntre;
  BitBtnRestaurar.Left := BitBtnNovo.Left - BitBtnRestaurar.Width - EspacamentoEntre;
  BitBtnExcluir.Left := BitBtnRestaurar.Left - BitBtnExcluir.Width - EspacamentoEntre;
  BitBtnSalvar.Left := BitBtnExcluir.Left - BitBtnSalvar.Width - EspacamentoEntre;

  ButtonAdicionarLinhaGridItens.Left := PanelBotoesControleGridItens.Width - ButtonAdicionarLinhaGridItens.Width - EspacamentoFinal;
  ButtonNovoModelo.Left := ButtonAdicionarLinhaGridItens.Left - ButtonNovoModelo.Width - EspacamentoEntre;
  ButtonNovoMarca.Left := ButtonNovoModelo.Left - ButtonNovoMarca.Width - EspacamentoEntre;
end;

procedure TfmCadMaterial.habilitaBotoes;
begin
  BitBtnSalvar.Enabled := true;
  BitBtnExcluir.Enabled := true;
  BitBtnRestaurar.Enabled := true;
  BitBtnNovo.Enabled := true;
  BitBtnCadastrarImagens.Enabled := true;
end;

procedure TfmCadMaterial.ButtonLimparEmbalagemClick(Sender: TObject);
begin
  plEmbalagem.Clear;

  EditCadastroCDEMBALAGEM.Clear;
  EditCadastroSGEMBALAGEM.Clear;
  EditCadastroNMEMBALAGEM.Clear;

  EditCadastroCDEMBALAGEM.Enabled := true;
  EditCadastroSGEMBALAGEM.Enabled := true;
  EditCadastroNMEMBALAGEM.Enabled := true;

  ButtonLimparEmbalagem.Enabled := false;
  ButtonNovoEmbalagem.Enabled := true;
end;

procedure TfmCadMaterial.ButtonLimparFamiliaClick(Sender: TObject);
begin
  plFamilia.Clear;

  EditCadastroCDFAMILIA.Clear;
  EditCadastroDEFAMILIA.Clear;

  EditCadastroCDFAMILIA.Enabled := true;
  EditCadastroDEFAMILIA.Enabled := true;
  ButtonLimparFamilia.Enabled := false;
  ButtonNovoFamilia.Enabled := true;
end;

procedure TfmCadMaterial.ButtonNovoEmbalagemClick(Sender: TObject);
var
  vcdEmbalagem: integer;
begin
  vcdEmbalagem := 0;
  try
    fmCadEmbalagem := TfmCadEmbalagem.Create(Self);
    with fmCadEmbalagem do
    begin
      try
        Tag := 1;
        ShowModal;

        vcdEmbalagem := fmCadEmbalagem.Codigo;
      except
        on E: exception do
          raise exception.Create('Não foi possível abrir a tela de Cadastro de Embalagem.'+#13#10+E.Message);
      end;
    end;
  finally
    // Verifica se foi cadastrada uma embalagem.
    if vcdEmbalagem > 0 then
    begin
      EditCadastroCDEMBALAGEM.Text := IntToStr(vcdEmbalagem);
      EditCadastroCDEMBALAGEMExit(EditCadastroCDEMBALAGEM);
      if OfficePagerCentral.ActivePageIndex = 1 then
        if EditCadastroCDEMBALAGEM.Enabled then
          ActiveControl := EditCadastroCDEMBALAGEM;
    end;
  end;
end;

procedure TfmCadMaterial.ButtonNovoFamiliaClick(Sender: TObject);
var
  vcdFamilia: integer;
  vQuery: TZQuery;
begin
  vcdFamilia := 0;
  try
    fmCadFamilia := TfmCadFamilia.Create(Self);
    with fmCadFamilia do
    begin
      try
        Tag := 1;
        ShowModal;

        vcdFamilia := fmCadFamilia.Codigo;
      except
        on E: Exception do
          raise exception.Create('Não foi possível abrir a tela de Cadastro de Família.'+#13#10+E.Message);
      end;
    end;
  finally
    // Verifica se foi cadastrada uma família.
    if vcdFamilia > 0 then
    begin
      if OfficePagerCentral.ActivePageIndex = 1 then
        ActiveControl := EditCadastroDEMATERIAL;

      // Busca o código formatado família para o código informado.
      try
        vQuery := pFamilia.Visao;
        with vQuery do
        begin
          Params.Items[0].AsInteger := vcdFamilia;
          dmPrincipal.executaConsulta(vQuery);

          if not Eof then
          begin
            EditCadastroCDFAMILIA.Text := Fields.Fields[1].AsString;
            EditCadastroCDFAMILIAExit(EditCadastroCDFAMILIA);
          end;
          Active := false;
        end;
      finally
        FreeAndNil(vQuery);
      end;
    end;
  end;
end;

procedure TfmCadMaterial.ButtonNovoMarcaClick(Sender: TObject);
begin
  fmCadMarca := TfmCadMarca.Create(Self);
  with fmCadMarca do
  begin
    try
      Tag := 1;
      ShowModal;
    except
      on E: exception do
        raise exception.Create('Não foi possível abrir a tela de Cadastro de Marca.'+#13#10+E.Message);
    end;
  end;
end;

procedure TfmCadMaterial.ButtonNovoModeloClick(Sender: TObject);
var
  vcdModelo: integer;
begin
  with ColumnGridMarcaModelo do
  begin
    if ColumnByName['CDMARCA'].Rows[RowCount-1] = EmptyStr  then
    begin
      MessageBox(fmPrincipal.Handle,
                 PWideChar('É necessário selecionar uma marca como parâmetro para o cadastro de Modelo.'),
                 cTituloMensagemAlerta,
                 MB_OK or MB_ICONEXCLAMATION);
      Exit;
    end;

    vcdModelo := ColumnByName['CDMARCA'].Ints[RowCount-1];    
  end;
  
  fmCadModelo := TfmCadModelo.Create(Self);
  with fmCadModelo do
  begin
    try
      Tag := 1;
      fmCadModelo.setaCadastroUnico(vcdModelo);
      ShowModal;
    except
      on E: exception do
        raise exception.Create('Não foi possível abrir a tela de Cadastro de Modelo.'+#13#10+E.Message);
    end;
  end;
end;

procedure TfmCadMaterial.MenuItemAtualizarTabelaClick(Sender: TObject);
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
        if EditFiltroMaterial.Text <> EmptyStr then
          Params.ParamByName('CDFAMILIA').AsString := EditFiltroMaterial.Text + '%'
        else
          Params.ParamByName('CDFAMILIA').AsString := '%';
      end;

      dmPrincipal.executaConsulta(QueryGeral);

      // Configura a Grid.
      editaColunaGrid(1,'CDMATERIAL','Cód. Material',edNone,Classes.taRightJustify,0,true);
      editaColunaGrid(2,'CDFAMILIA','Código',edNone,Classes.taLeftJustify,80,true);
      editaColunaGrid(3,'DEFAMILIA','Família',edNone,Classes.taLeftJustify,300,true);
      editaColunaGrid(4,'DEMATERIAL','Material',edNone,Classes.taLeftJustify,330,true);
      editaColunaGrid(5,'SGEMBALAGEM','Embalagem',edNone,Classes.taLeftJustify,65,true);
      editaColunaGrid(6,'FLATIVO','Ativo',edCheckBox,Classes.taCenter,40,true);
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

procedure TfmCadMaterial.MenuItemEditarRegistroClick(Sender: TObject);
begin
  Opcao := 'A';
  with DBAdvGridGeral do
    Codigo := ColumnByName['CDMATERIAL'].Ints[Row];
  editaCadastro;
  habilitaBotoes;

  ActiveControl := EditCadastroDEMATERIAL;
end;

procedure TfmCadMaterial.MenuItemVisualizarFiltroClick(Sender: TObject);
begin
  GridFindDialogColumnGrid.Execute;
end;

procedure TfmCadMaterial.novoCadastro;
begin
  OfficePagerCentral.ActivePageIndex := 1;

  EditCadastroCDMATERIAL.Clear;
  ButtonLimparFamiliaClick(ButtonLimparFamilia);
  EditCadastroDEMATERIAL.Clear;
  CheckBoxCadastroFLATIVO.Checked := true;
  ButtonLimparEmbalagemClick(ButtonLimparEmbalagem);
  limpaGrid;

  // Preenche os dados do usuário.
  EditCadastroCDUSUARIO.Text := IntToStr(fmPrincipal.CodigoUsuarioLogado);
  EditCadastroNMLOGIN.Text := fmPrincipal.LoginUsuarioLogado;
  EditCadastroNMUSUARIO.Text := fmPrincipal.NomeUsuarioLogado;
  DatePickerCadastroDTCADASTRO.Clear;
  DatePickerCadastroDTULTATUALIZACAO.Clear;

  ActiveControl := EditCadastroCDFAMILIA;
end;

procedure TfmCadMaterial.OfficePageCadastroShow(Sender: TObject);
begin
  if EditCadastroCDFAMILIA.Enabled = false then
    ActiveControl := EditCadastroDEMATERIAL
  else
    ActiveControl := EditCadastroCDFAMILIA;
end;

procedure TfmCadMaterial.setaFamilia(prmFamilia: string);
begin
  EditCadastroCDFAMILIA.Text := prmFamilia;
  EditCadastroCDFAMILIAExit(EditCadastroCDFAMILIA);
  ButtonLimparFamilia.Enabled := false;
  BitBtnRestaurar.Enabled := false;
end;

procedure TfmCadMaterial.ButtonAdicionarLinhaGridItensClick(Sender: TObject);
begin
  with ColumnGridMarcaModelo do
  begin
    if (ColumnByName['CDMARCA'].Rows[RowCount-1] <> EmptyStr) and
       (ColumnByName['CDMODELO'].Rows[RowCount-1] <> EmptyStr) then
    begin
      AddRow;
      if RowCount = 2 then
        AddRadioButton(1,RowCount-1,true)
      else
        AddRadioButton(1,RowCount-1,false);
      AddImageIdx(4,RowCount-1,0,haCenter,vaCenter);
      ColumnByName['NMMARCA'].ReadOnly := false;
      ColumnByName['NMMODELO'].ReadOnly := false;
    end;
  end;
end;

procedure TfmCadMaterial.ButtonExportarHTMLClick(Sender: TObject);
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

procedure TfmCadMaterial.ButtonExportarPlanilhaClick(Sender: TObject);
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

procedure TfmCadMaterial.ButtonFiltrarClick(Sender: TObject);
begin
  MenuItemAtualizarTabelaClick(Sender);
end;

procedure TfmCadMaterial.ButtonImprimirRelatorioClick(Sender: TObject);
begin
  try
    QueryRelMaterial.SQL := pMaterial.relatorio.SQL;
    dmPrincipal.executaConsulta(QueryRelMaterial);
    with fmPrincipal.SystemRelatorio do
    begin
      DefaultDest := rdPreview;
      SystemSetups := SystemSetups - [ssAllowSetup];
      DoNativeOutput := false;
      //SystemSetups := SystemSetups - [ssAllowSetup];
    end;
    with ProjectRelMaterial do
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

procedure TfmCadMaterial.ButtonOrdenarRegistrosClick(Sender: TObject);
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

procedure TfmCadMaterial.carregaImagensBotoes;
begin
  EditCadastroNMUSUARIO.Button.Glyph.Assign(fmPrincipal.fnGeral.obtemImagemPesquisa);
  EditCadastroDEFAMILIA.Button.Glyph.Assign(fmPrincipal.fnGeral.obtemImagemPesquisa);
  EditCadastroNMEMBALAGEM.Button.Glyph.Assign(fmPrincipal.fnGeral.obtemImagemPesquisa);

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

  ButtonLimparFamilia.Picture.LoadFromFile(fmPrincipal.LocalIcones + 'erase-e-16.png');
  ButtonLimparFamilia.HotPicture.LoadFromFile(fmPrincipal.LocalIcones + 'erase-h-16.png');
  ButtonLimparFamilia.DisabledPicture.LoadFromFile(fmPrincipal.LocalIcones + 'erase-d-16.png');
  ButtonLimparEmbalagem.Picture.LoadFromFile(fmPrincipal.LocalIcones + 'erase-e-16.png');
  ButtonLimparEmbalagem.HotPicture.LoadFromFile(fmPrincipal.LocalIcones + 'erase-h-16.png');
  ButtonLimparEmbalagem.DisabledPicture.LoadFromFile(fmPrincipal.LocalIcones + 'erase-d-16.png');
  ButtonNovoFamilia.Picture.LoadFromFile(fmPrincipal.LocalIcones + 'new-e-16.png');
  ButtonNovoFamilia.HotPicture.LoadFromFile(fmPrincipal.LocalIcones + 'new-h-16.png');
  ButtonNovoFamilia.DisabledPicture.LoadFromFile(fmPrincipal.LocalIcones + 'new-d-16.png');
  ButtonNovoMarca.Picture.LoadFromFile(fmPrincipal.LocalIcones + 'new-e-16.png');
  ButtonNovoMarca.HotPicture.LoadFromFile(fmPrincipal.LocalIcones + 'new-h-16.png');
  ButtonNovoMarca.DisabledPicture.LoadFromFile(fmPrincipal.LocalIcones + 'new-d-16.png');
  ButtonNovoModelo.Picture.LoadFromFile(fmPrincipal.LocalIcones + 'new-e-16.png');
  ButtonNovoModelo.HotPicture.LoadFromFile(fmPrincipal.LocalIcones + 'new-h-16.png');
  ButtonNovoModelo.DisabledPicture.LoadFromFile(fmPrincipal.LocalIcones + 'new-d-16.png');
  ButtonNovoEmbalagem.Picture.LoadFromFile(fmPrincipal.LocalIcones + 'new-e-16.png');
  ButtonNovoEmbalagem.HotPicture.LoadFromFile(fmPrincipal.LocalIcones + 'new-h-16.png');
  ButtonNovoEmbalagem.DisabledPicture.LoadFromFile(fmPrincipal.LocalIcones + 'new-d-16.png');

  ButtonAdicionarLinhaGridItens.Picture.LoadFromFile(fmPrincipal.LocalIcones + 'add-row-e-16.png');
  ButtonAdicionarLinhaGridItens.HotPicture.LoadFromFile(fmPrincipal.LocalIcones + 'add-row-h-16.png');
  ButtonAdicionarLinhaGridItens.DisabledPicture.LoadFromFile(fmPrincipal.LocalIcones + 'add-row-d-16.png');
end;

function TfmCadMaterial.validaExclusao: boolean;
var
  vMensagem: string;
begin
  vMensagem := EmptyStr;

  try
    if pMaterial.existeDependencia then
      vMensagem := '- Existem itens de aquisições utilizando este material.';

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
