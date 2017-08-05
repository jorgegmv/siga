unit unConAquisicao;

interface

uses
  Windows, Messages, ShellAPI, SysUtils, Variants, StrUtils, Math, Classes,
  Mask, Buttons, MaskUtils, Registry, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ToolWin, ImgList, jpeg, StdCtrls, Menus, ExtCtrls, Grids, DB,
  AsgFindDialog, asgcheck, AdvObj, BaseGrid, AdvGrid, AdvCGrid,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, DateUtils, DBAdvGrid,
  UnAplExportaXLS, RpDefine, RpRave, RpCon, RpConDS, RpBase, RpSystem,
  AdvGlowButton, AdvGroupBox, AdvOfficeButtons, AdvEdit, AdvEdBtn,
  PlannerDatePicker, tmsAdvGridExcel, AdvAppStyler, AdvToolBar, AdvOfficePager,
  AdvPanel, unUsuario, unAquisicao, unTipoMovimento;

type
  TfmConAquisicao = class(TForm)
    GridFindDialogColumnGrid: TAdvGridFindDialog;
    QueryAquisicao: TZQuery;
    DataSourceAquisicao: TDataSource;
    SaveDialog: TSaveDialog;
    ProjectRelAquisicao: TRvProject;
    DataSetConnectionRelAquisicao: TRvDataSetConnection;
    QueryRelAquisicao: TZQuery;
    PanelBotoes: TAdvPanel;
    ButtonFechar: TAdvGlowButton;
    ButtonNovo: TAdvGlowButton;
    ButtonEditar: TAdvGlowButton;
    ButtonVisualizarItensAquisicao: TAdvGlowButton;
    ButtonVisualizarParcelas: TAdvGlowButton;
    FormStyler: TAdvFormStyler;
    OfficePagerCentral: TAdvOfficePager;
    OfficePageFiltros: TAdvOfficePage;
    PanelTabela: TAdvPanel;
    OfficePageTabela: TAdvOfficePage;
    DockPaneOpcoes: TAdvDockPanel;
    ToolBarOpcoes: TAdvToolBar;
    ToolBarSeparator1: TAdvToolBarSeparator;
    ButtonAbrirJanelaPesquisa: TAdvGlowButton;
    ButtonAtualizarTabela: TAdvGlowButton;
    ButtonImprimirRelatorio: TAdvGlowButton;
    ButtonExportarPlanilha: TAdvGlowButton;
    ButtonExportarHTML: TAdvGlowButton;
    DBAdvGridAquisicao: TDBAdvGrid;
    PanelSumarizacao: TAdvPanel;
    PanelPreenchimento: TAdvPanel;
    PanelTotalRegistros: TAdvPanel;
    LabelTotalRegistros: TLabel;
    PanelValorTotal: TAdvPanel;
    LabelValorTotal: TLabel;
    PanelCampos: TAdvPanel;
    LabelInformacoesPeriodo: TLabel;
    LabelPeriodoAte: TLabel;
    LabelPeriodoDe: TLabel;
    LabelSeparadorAnoNumero: TLabel;
    ButtonAplicarParametros: TAdvGlowButton;
    ButtonCancelarConsulta: TAdvGlowButton;
    ButtonLimparTipoMovimento: TAdvGlowButton;
    ButtonLimparUsuario: TAdvGlowButton;
    DatePickerConsultaDTAQUISICAOFinal: TPlannerDatePicker;
    DatePickerConsultaDTAQUISICAOInicial: TPlannerDatePicker;
    EditConsultaCDTIPOMOVIMENTO: TAdvEdit;
    EditConsultaCDUSUARIO: TAdvEdit;
    EditConsultaDEAQUISICAO: TAdvEdit;
    EditConsultaNMLOGIN: TAdvEdit;
    EditConsultaNUANOAQUISICAO: TAdvEdit;
    EditConsultaNUAQUISICAO: TAdvEdit;
    GroupBoxOrdenacao: TAdvGroupBox;
    ColumnGridOrdenacao: TAdvColumnGrid;
    GroupBoxOutrasOpcoes: TAdvGroupBox;
    CheckBoxConsultaFLURGENTE: TAdvOfficeCheckBox;
    CheckBoxConsultaFLCANCELADO: TAdvOfficeCheckBox;
    CheckBoxConsultaFLENTREGAPENDENTE: TAdvOfficeCheckBox;
    CheckBoxConsultaPARCELADA: TAdvOfficeCheckBox;
    RadioGroupTipoConsulta: TAdvOfficeRadioGroup;
    PanelTitulos: TAdvPanel;
    LabelAquisicao: TLabel;
    LabelDescricao: TLabel;
    LabelTipoMovimento: TLabel;
    LabelUsuario: TLabel;
    PanelInfo: TAdvPanel;
    LabelCamposRequeridos: TLabel;
    EditConsultaDETIPOMOVIMENTO: TAdvEditBtn;
    EditConsultaNMUSUARIO: TAdvEditBtn;
    AdvGridExcelIO: TAdvGridExcelIO;
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure ButtonFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure ButtonAplicarParametrosClick(Sender: TObject);
    procedure ButtonCancelarConsultaClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EditConsultaCDUSUARIOExit(Sender: TObject);
    procedure ButtonLimparUsuarioClick(Sender: TObject);
    procedure ButtonLimparTipoMovimentoClick(Sender: TObject);
    procedure EditConsultaCDTIPOMOVIMENTOExit(Sender: TObject);
    procedure EditConsultaDETIPOMOVIMENTOExit(Sender: TObject);
    procedure EditConsultaNMLOGINExit(Sender: TObject);
    procedure EditConsultaNMUSUARIOExit(Sender: TObject);
    procedure DBAdvGridAquisicaoDblClickCell(Sender: TObject; ARow,
      ACol: Integer);
    procedure ButtonEditarClick(Sender: TObject);
    procedure ButtonNovoClick(Sender: TObject);
    procedure ButtonVisualizarItensAquisicaoClick(Sender: TObject);
    procedure EditConsultaNUANOAQUISICAOExit(Sender: TObject);
    procedure ButtonVisualizarParcelasClick(Sender: TObject);
    procedure RadioGroupTipoConsultaClick(Sender: TObject);
    procedure ColumnGridOrdenacaoComboChange(Sender: TObject; ACol, ARow,
      AItemIndex: Integer; ASelection: string);
    procedure ButtonAbrirJanelaPesquisaClick(Sender: TObject);
    procedure ButtonAtualizarTabelaClick(Sender: TObject);
    procedure ButtonImprimirRelatorioClick(Sender: TObject);
    procedure ButtonExportarPlanilhaClick(Sender: TObject);
    procedure ButtonExportarHTMLClick(Sender: TObject);
    procedure OfficePageFiltrosShow(Sender: TObject);
    procedure EditConsultaNMUSUARIOClickBtn(Sender: TObject);
    procedure EditConsultaDETIPOMOVIMENTOClickBtn(Sender: TObject);
    procedure EditConsultaCDTIPOMOVIMENTOChange(Sender: TObject);
    procedure EditConsultaNUANOAQUISICAOChange(Sender: TObject);
    procedure EditConsultaNUAQUISICAOChange(Sender: TObject);
    procedure EditConsultaCDUSUARIOChange(Sender: TObject);
  private
    { Private declarations }
    pId: TGUID;
    pCodigo: integer;
    plUsuario, plTipoMovimento: TStringList;
    pcdAquisicoes: string;
    pUsuario: TUsuario;
    pAquisicao: TAquisicao;
    pTipoMovimento: TTipoMovimento;
    procedure inicializaConsulta;
    procedure carregaImagensBotoes;
    procedure congelaFiltros(pCongelar: boolean = true);
    function aplicaFiltro(): TStrings;
    function obtemvlAquisicao(prmcdAquisicao: integer): currency;
  public
    { Public declarations }
    property Codigo: integer read pCodigo write pCodigo;
  end;

var
  fmConAquisicao: TfmConAquisicao;

const
  cConsultaP1 = 'SELECT "Código","Tipo de Movimento","Aquisição","Data de Aquisição","Usuário",';
  cConsultaP2 = '"Data do Registro","Descrição","Observações","Urgente","Motivo","Ag. Entrega","Previsão","Cód. Rastreamento","Entrega","Parcelas","Taxa de Juros","Taxa Extra","Cancelado","Data de Cancelamento"';
  cOrdem1 = '"Tipo de Movimento";"Aquisição";"Data de Aquisição";"Usuário"';
  cOrdem2 = '"Data do Registro";"Descrição";"Observações";"Urgente";"Motivo";"Ag. Entrega";"Previsão";"Cód. Rastreamento";"Entrega";"Parcelas";"Taxa de Juros";"Taxa Extra";"Cancelado";"Data de Cancelamento"';

implementation

uses unPrincipal, unConFiltroPadrao, unResSearch, undmPrincipal, unCadAquisicao,
  unConAquisicaoItens, unCadAquisicaoParcela, undmEstilo;

{$R *.dfm}

procedure TfmConAquisicao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfmConAquisicao.FormCreate(Sender: TObject);
var
  i: integer;
begin
  try
    CreateGUID(pId);

    Color := Self.Color;
    FormStyler.AutoThemeAdapt := false;

    plUsuario := TStringList.Create;
    plTipoMovimento := TStringList.Create;

    pUsuario := TUsuario.Create;
    pAquisicao := TAquisicao.Create;
    pTipoMovimento := TTipoMovimento.Create;

    with DBAdvGridAquisicao do
    begin
      DrawingStyle := gdsThemed;
      AutoThemeAdapt := false;
      for i := 0 to ColCount -1 do
        Columns[i].ShowBands := true;
      Bands.Active := true;
    end;
    with ColumnGridOrdenacao do
    begin
      DrawingStyle := gdsThemed;
      AutoThemeAdapt := false;
      for i := 0 to ColCount -1 do
        Columns[i].ShowBands := true;
      Bands.Active := true;
    end;

    inicializaConsulta;

    carregaImagensBotoes;

    OfficePagerCentral.ActivePageIndex := 0;

    ButtonNovo.Enabled := fmPrincipal.Administrador;

    for i := Self.ComponentCount -1 downto 0 do
      if (Self.Components[i] is TAdvOfficeCheckBox) then
        (Self.Components[i] as TAdvOfficeCheckBox).Themed := true;
    RadioGroupTipoConsulta.Themed := true;

    if not fmPrincipal.Administrador then
      DBAdvGridAquisicao.OnDblClickCell := nil;

    OfficePagerCentral.Images := fmPrincipal.ImageListE;
    OfficePagerCentral.DisabledImages := fmPrincipal.ImageListD;
    OfficePageFiltros.ImageIndex := 0;
    OfficePageTabela.ImageIndex := 2;

    FormResize(Sender);
  except
    on E: Exception do
    begin
      fmPrincipal.manipulaExcecoes(Sender,E);
      Close;
    end;
  end;
end;

procedure TfmConAquisicao.FormDestroy(Sender: TObject);
begin
  FreeAndNil(plUsuario);
  FreeAndNil(plTipoMovimento);
  FreeAndNil(pUsuario);
  FreeAndNil(pAquisicao);
  FreeAndNil(pTipoMovimento);
end;

procedure TfmConAquisicao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Exit;
end;

procedure TfmConAquisicao.FormResize(Sender: TObject);
begin
  ButtonFechar.Left := PanelBotoes.Width - ButtonFechar.Width - fmPrincipal.EspacamentoFinalBotao;
  ButtonVisualizarParcelas.Left := ButtonFechar.Left - ButtonVisualizarParcelas.Width - fmPrincipal.EspacamentoEntreBotoes;
  ButtonVisualizarItensAquisicao.Left := ButtonVisualizarParcelas.Left - ButtonVisualizarItensAquisicao.Width - fmPrincipal.EspacamentoEntreBotoes;
  ButtonEditar.Left := ButtonVisualizarItensAquisicao.Left - ButtonEditar.Width - fmPrincipal.EspacamentoEntreBotoes;
  ButtonNovo.Left := ButtonEditar.Left - ButtonNovo.Width - fmPrincipal.EspacamentoEntreBotoes;

  ButtonAplicarParametros.Left := fmPrincipal.EspacamentoInicialBotao;
  ButtonCancelarConsulta.Left := ButtonAplicarParametros.Left + ButtonAplicarParametros.Width + fmPrincipal.EspacamentoEntreBotoes;
end;

procedure TfmConAquisicao.inicializaConsulta;
begin
  QueryAquisicao.Active := false;

  LabelTotalRegistros.Caption := 'Total de registros: 0';

  // Somente Administrador pode consultar outros usuários.
  ButtonLimparUsuarioClick(ButtonLimparUsuario);
  if fmPrincipal.FiltroLogin <> cNenhumFiltroLogin then
  begin
    EditConsultaNMLOGIN.Text := fmPrincipal.FiltroLogin;
    EditConsultaNMLOGINExit(EditConsultaNMLOGIN);
  end;

  // Se não for administrador, só consegue visualizar o que é seu.
  EditConsultaCDUSUARIO.Enabled := fmPrincipal.Administrador;
  EditConsultaNMLOGIN.Enabled := fmPrincipal.Administrador;
  EditConsultaNMUSUARIO.Enabled := fmPrincipal.Administrador;

  ButtonLimparTipoMovimentoClick(ButtonLimparTipoMovimento);

  EditConsultaNUANOAQUISICAO.Clear;
  EditConsultaNUAQUISICAO.Clear;

  DatePickerConsultaDTAQUISICAOInicial.Clear;
  DatePickerConsultaDTAQUISICAOFinal.Clear;

  EditConsultaDEAQUISICAO.Clear;

  CheckBoxConsultaFLURGENTE.Checked := false;
  CheckBoxConsultaFLENTREGAPENDENTE.Checked := false;
  CheckBoxConsultaPARCELADA.Checked := false;
  CheckBoxConsultaFLCANCELADO.Checked := false;

  RadioGroupTipoConsulta.ItemIndex := 0;
  RadioGroupTipoConsultaClick(RadioGroupTipoConsulta);

  ButtonEditar.Enabled := false;
  ButtonVisualizarItensAquisicao.Enabled := false;
  ButtonVisualizarParcelas.Enabled := false;

  if OfficePagerCentral.ActivePageIndex = 0 then
    if EditConsultaCDTIPOMOVIMENTO.Enabled then
      ActiveControl := EditConsultaCDTIPOMOVIMENTO;
end;

function TfmConAquisicao.obtemvlAquisicao(prmcdAquisicao: integer): currency;
var
  vQuery: TZQuery;
begin
  Result := 0;
  try
    try
      vQuery := TZQuery.Create(Self);
      with vQuery do
      begin
        SQL.Text := 'SELECT SUM(qtmaterial * vlunitario) AS VP';
        SQL.Add('FROM ' + cSchema + '.aquisicaoitem');
        SQL.Add('WHERE cdaquisicao = :CDAQUISICAO');
        Params.ParamByName('CDAQUISICAO').AsInteger := prmcdAquisicao;
        dmPrincipal.executaConsulta(vQuery);

        // Se o número de registros.
        Result := (Fields.Fields[0].AsCurrency);
      end;
    except
      on E: Exception do
        raise;
    end;
  finally
    vQuery.Active := false;
    FreeAndNil(vQuery);
  end;
end;

procedure TfmConAquisicao.OfficePageFiltrosShow(Sender: TObject);
begin
  if ButtonAplicarParametros.Enabled = false then
    ActiveControl := ButtonCancelarConsulta
  else
    if EditConsultaCDTIPOMOVIMENTO.Enabled = false then
      ActiveControl := EditConsultaNUANOAQUISICAO
    else
      ActiveControl := EditConsultaCDTIPOMOVIMENTO;
end;

procedure TfmConAquisicao.RadioGroupTipoConsultaClick(Sender: TObject);
var
  i: integer;
  vAux: TStringList;
begin
  vAux := TStringList.Create;
  vAux.Delimiter := ';';
  vAux.QuoteChar := '"';
  try
    with ColumnGridOrdenacao do
    begin
      BeginUpdate;
      ClearRows(1,RowCount-1);
      vAux.DelimitedText := cOrdem1;
      if RadioGroupTipoConsulta.ItemIndex = 1 then
        vAux.DelimitedText := cOrdem1 + ';' +cOrdem2;
      RowCount := vAux.Count+1;

      for i := 0 to vAux.Count-1 do
      begin
        // A chave é sempre apresentada pro usuário como marcada.
        if i in [0..1] then
          AddCheckBox(0,i+1,true,false)
        else
          AddCheckBox(0,i+1,false,false);
        ColumnByName['Campo'].Rows[i+1] := vAux[i];
        ColumnByName['Ordem'].Rows[i+1] := 'Asc.';
      end;
      EndUpdate;
    end;
  finally
    FreeAndNil(vAux);
  end;
end;

function TfmConAquisicao.aplicaFiltro: TStrings;
var
  i: integer;
  vClausula, vMascaraData, vDataInicial, vDataFinal: string;
  vFiltro: TStringList;
  vQuery: TZQuery;
begin
  vFiltro := TStringList.Create;
  try
    plUsuario.Sort;
    plTipoMovimento.Sort;

    // Prepara a cláusula de data.
    vClausula := EmptyStr;
    vMascaraData := QuotedStr('YYYY-MM-DD');
    if DatePickerConsultaDTAQUISICAOInicial.Text <> EmptyStr then
    begin
      vDataInicial := DatePickerConsultaDTAQUISICAOInicial.Text;
      vDataInicial := QuotedStr(Copy(vDataInicial,7,4)+'-'+
                                Copy(vDataInicial,4,2)+'-'+
                                Copy(vDataInicial,1,2));
    end;
    if DatePickerConsultaDTAQUISICAOFinal.Text <> EmptyStr then
    begin
      // Incrementa 1 dia para filtrar corretamente.
      vDataFinal := DateToStr(DateUtils.IncDay(DatePickerConsultaDTAQUISICAOFinal.Date, 1));
      vDataFinal := QuotedStr(Copy(vDataFinal,7,4)+'-'+
                              Copy(vDataFinal,4,2)+'-'+
                              Copy(vDataFinal,1,2));
    end;

    vClausula := EmptyStr;
    if plUsuario.Count > 0 then
    begin
      vClausula := 'cdusuario IN (';
      for i := 0 to plUsuario.Count -1 do
        vClausula := vClausula + plUsuario.Strings[i]+',';
      vClausula := Copy(vClausula,1,Length(vClausula)-1)+')';
      vFiltro.Add(vClausula);
    end;

    vClausula := EmptyStr;
    if plTipoMovimento.Count > 0 then
    begin
      vClausula := 'cdtipomovimento IN (';
      for i := 0 to plTipoMovimento.Count -1 do
        vClausula := vClausula + plTipoMovimento.Strings[i]+',';
      vClausula := Copy(vClausula,1,Length(vClausula)-1)+')';
      vFiltro.Add(vClausula);
    end;

    if EditConsultaNUANOAQUISICAO.Text <> EmptyStr then
      vFiltro.Add('nuanoaquisicao = '+EditConsultaNUANOAQUISICAO.Text);

    if EditConsultaNUAQUISICAO.Text <> EmptyStr then
      vFiltro.Add('nuaquisicao = '+EditConsultaNUAQUISICAO.Text);

    if (DatePickerConsultaDTAQUISICAOInicial.Text <> EmptyStr) and
       (DatePickerConsultaDTAQUISICAOFinal.Text <> EmptyStr) then
      vFiltro.Add('(dtaquisicao >= TO_DATE('+vDataInicial+','+vMascaraData+')'+
                  ' AND dtaquisicao < TO_DATE('+vDataFinal+','+vMascaraData+'))')
    else
    if DatePickerConsultaDTAQUISICAOInicial.Text <> EmptyStr then
      vFiltro.Add('dtaquisicao >= TO_DATE('+vDataInicial+','+vMascaraData+')')
    else
    if DatePickerConsultaDTAQUISICAOFinal.Text <> EmptyStr then
      vFiltro.Add('dtaquisicao < TO_DATE('+vDataFinal+','+vMascaraData+')');

    if EditConsultaDEAQUISICAO.Text <> EmptyStr then
      vFiltro.Add('deaquisicao LIKE '+QuotedStr(EditConsultaDEAQUISICAO.Text+'%'));

    vClausula := EmptyStr;

    if CheckBoxConsultaFLURGENTE.Checked then
      vFiltro.Add('flurgente = ''S''');

    if CheckBoxConsultaFLENTREGAPENDENTE.Checked then
      vFiltro.Add('flentregapendente = ''S''');

    if CheckBoxConsultaPARCELADA.Checked then
      vFiltro.Add('EXISTS (SELECT 1 FROM ' + cSchema + '.aquisicaoparcela WHERE aquisicaoparcela.cdaquisicao = aquisicao.cdaquisicao)');

    if CheckBoxConsultaFLCANCELADO.Checked then
      vFiltro.Add('flcancelado = ''S''')
    else
      vFiltro.Add('flcancelado = ''N''');

    for i := 0 to vFiltro.Count -1 do
      if i = 0 then
        vFiltro.Strings[i] := 'WHERE '+vFiltro.Strings[i]
      else
        vFiltro.Strings[i] := '  AND '+vFiltro.Strings[i];

    // Pesquisa na tabela de aquisições para aí sim filtrar na view.
    try
      vQuery := pAquisicao.lista;
      with vQuery do
      begin
        SQL.AddStrings(vFiltro);
        dmPrincipal.executaConsulta(vQuery);

        if Eof then
          vClausula := '-1,';
        while not Eof do
        begin
          vClausula := vClausula + Fields.Fields[0].AsString + ',';
          Next;
        end;
        Active := false;
      end;
    finally
      FreeAndNil(vQuery);

      vClausula := Copy(vClausula,1,Length(vClausula)-1);
      vFiltro.Clear;
      vFiltro.Add(vClausula);
      Result := vFiltro;
    end;
  except
    on E: Exception do
      raise;
  end;
end;

procedure TfmConAquisicao.ButtonCancelarConsultaClick(Sender: TObject);
begin
  try
    congelaFiltros(false);
    inicializaConsulta;

    if EditConsultaCDTIPOMOVIMENTO.Enabled = false then
      ActiveControl := EditConsultaNUANOAQUISICAO
    else
      ActiveControl := EditConsultaCDTIPOMOVIMENTO;
  except
    on E: Exception do
      fmPrincipal.manipulaExcecoes(Sender,E);
  end;
end;

procedure TfmConAquisicao.ButtonEditarClick(Sender: TObject);
begin
  with DBAdvGridAquisicao do
    DBAdvGridAquisicaoDblClickCell(Sender,Row,Col);
end;

procedure TfmConAquisicao.ButtonAplicarParametrosClick(Sender: TObject);
var
  i: integer;
  vOrdenacao: string;
  vQuery: TZQuery;
begin
  try
    with QueryAquisicao do
    begin
      Active := false;
      SQL := pAquisicao.visao.SQL;
      case RadioGroupTipoConsulta.ItemIndex of
        0: SQL.Strings[0] := cConsultaP1 + '"Descrição","Urgente","Ag. Entrega","Parcelas","Cancelado"';
        1: SQL.Strings[0] := cConsultaP1 + cConsultaP2;
      end;
      pcdAquisicoes := Trim(aplicaFiltro.Text);
      SQL.Add('WHERE "Código" IN (' + pcdAquisicoes + ')');
      vOrdenacao := EmptyStr;
      with ColumnGridOrdenacao do
        for i := 1 to RowCount -1 do
          if IsChecked(0,i) then
            vOrdenacao := vOrdenacao + '"' + ColumnByName['Campo'].Rows[i] + '" ' +
                          StringReplace(Uppercase(ColumnByName['Ordem'].Rows[i]),'.',',',[]);
      if vOrdenacao <> EmptyStr then
        SQL.Add('ORDER BY ' + Copy(vOrdenacao,1,Length(vOrdenacao)-1));
      dmPrincipal.executaConsulta(QueryAquisicao);

      // Seta os checkbox.
      if not Eof then
        with DBAdvGridAquisicao do
        begin
          for i := 1 to RowCount -1 do
          begin
            case RadioGroupTipoConsulta.ItemIndex of
              0:
              begin
                Columns[7].ReadOnly := true;
                Columns[7].Alignment := taCenter;
                Columns[7].CheckBoxField := true;
                Columns[7].CheckTrue := 'S';
                Columns[7].CheckFalse := 'N';
                Columns[8].ReadOnly := true;
                Columns[8].Alignment := taCenter;
                Columns[8].CheckBoxField := true;
                Columns[8].CheckTrue := 'S';
                Columns[8].CheckFalse := 'N';
                Columns[10].ReadOnly := true;
                Columns[10].Alignment := taCenter;
                Columns[10].CheckBoxField := true;
                Columns[10].CheckTrue := 'S';
                Columns[10].CheckFalse := 'N';
              end;
              1:
              begin
                Columns[9].ReadOnly := true;
                Columns[9].Alignment := taCenter;
                Columns[9].CheckBoxField := true;
                Columns[9].CheckTrue := 'S';
                Columns[9].CheckFalse := 'N';
                Columns[11].ReadOnly := true;
                Columns[11].Alignment := taCenter;
                Columns[11].CheckBoxField := true;
                Columns[11].CheckTrue := 'S';
                Columns[11].CheckFalse := 'N';
                Columns[16].FloatFormat := '%.2f';
                Columns[16].SortSuffix := '%';
                Columns[17].FloatFormat := '%.2f';
                Columns[17].SortPrefix := 'R$';
                Columns[18].ReadOnly := true;
                Columns[18].Alignment := taCenter;
                Columns[18].CheckBoxField := true;
                Columns[18].CheckTrue := 'S';
                Columns[18].CheckFalse := 'N';
              end;
            end;
          end;

          HideColumn(1);
          AutoSizeColumns(true,4);
          AutoSizeRows(true,4);

          if not Eof then
            Row := 1;

          // Manipula os botões.
          ButtonEditar.Enabled := false;
          ButtonVisualizarItensAquisicao.Enabled := false;
          ButtonVisualizarParcelas.Enabled := false;
          if ((RowCount > 1) and
              (Columns.Items[1].Rows[Row] <> EmptyStr)) then
          begin
            if fmPrincipal.Administrador then
              ButtonEditar.Enabled := true;
            ButtonVisualizarItensAquisicao.Enabled := true;
            ButtonVisualizarParcelas.Enabled := true;
          end;
          Codigo := DBAdvGridAquisicao.Columns.Items[1].Ints[Row];
        end;

      // Preenche o totalizador.
      LabelTotalRegistros.Caption := 'Total de registros: ' + IntToStr(DBAdvGridAquisicao.RowCount -1);
      if DBAdvGridAquisicao.RowCount = 2 then
      begin
        if DBAdvGridAquisicao.Columns[1].Rows[1] = EmptyStr then
          LabelTotalRegistros.Caption := 'Total de registros: 0';
      end;

      // Obtem o somatório das aquisições selecionadas.
      LabelValorTotal.Caption := 'Valor total: R$ 0,00';
      if not Eof then
        try
          vQuery := TZQuery.Create(Self);
          with vQuery do
          begin
            SQL.Text := 'SELECT SUM(aquisicaoitem.qtmaterial * (materialembalagem.qtequivalencia * aquisicaoitem.vlunitario + COALESCE(aquisicaoitem.vlgarantia, 0))) AS VLTOTAL';
            SQL.Add('FROM ' + cSchema + '.aquisicao');
            SQL.Add('INNER JOIN ' + cSchema + '.aquisicaoitem ON aquisicao.cdaquisicao = aquisicaoitem.cdaquisicao');
            SQL.Add('INNER JOIN ' + cSchema + '.material ON aquisicaoitem.cdmaterial = material.cdmaterial');
            SQL.Add('INNER JOIN ' + cSchema + '.materialembalagem ON material.cdmaterial = materialembalagem.cdmaterial');

            SQL.Add('WHERE aquisicao.cdaquisicao IN (' + Trim(aplicaFiltro.Text) + ')');
            dmPrincipal.executaConsulta(vQuery);
            if not Eof then
              LabelValorTotal.Caption := 'Valor total: ' + FormatFloat('"R$ ",0.00',Fields.Fields[0].AsCurrency);
          end;
        finally
          FreeAndNil(vQuery);
        end;

      if not Eof then
      begin
        congelaFiltros();
        OfficePagerCentral.ActivePageIndex := 1;
        ActiveControl := DBAdvGridAquisicao;
      end
      else
        MessageBox(fmPrincipal.Handle,
                   PWideChar('A consulta foi executada com sucesso, mas nenhum registro foi encontrado.'+#13#10+
                             'Verifique os parâmetros informados para a consulta.'),
                   cTituloMensagemInformacao,
                   MB_OK or MB_ICONINFORMATION);
    end;
  except
    on E: Exception do
      fmPrincipal.manipulaExcecoes(Sender,E);
  end;
end;

procedure TfmConAquisicao.ButtonFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfmConAquisicao.ButtonAbrirJanelaPesquisaClick(Sender: TObject);
begin
  GridFindDialogColumnGrid.Execute;
end;

procedure TfmConAquisicao.ButtonAtualizarTabelaClick(Sender: TObject);
begin
  ButtonAplicarParametrosClick(Sender);
end;

procedure TfmConAquisicao.ButtonExportarHTMLClick(Sender: TObject);
begin
  with SaveDialog do
  begin
    Title := 'Salvar Arquivo';
    DefaultExt := '*.htm*';
    InitialDir := fmPrincipal.LocalAplicacao;
    Filter := 'Arquivos HTML|*.html';
    FilterIndex := 0;
    if Execute then
    begin
      DBAdvGridAquisicao.SaveToHTML(FileName,false);
      if FileExists(FileName) then
        ShellExecute(Handle,PChar('Open'),PChar(FileName),nil,nil,SW_SHOWNORMAL);
    end;
  end;
end;

procedure TfmConAquisicao.ButtonExportarPlanilhaClick(Sender: TObject);
begin
  with SaveDialog do
  begin
    Title := 'Salvar Arquivo';
    DefaultExt := '*.xls*';
    InitialDir := fmPrincipal.LocalAplicacao;
    Filter := 'Arquivos XLS|*.xls*';
    FilterIndex := 0;
    if Execute then
    begin
      if fmPrincipal.ExisteMSOffice = true then
        AdvGridExcelIO.XLSExport(FileName)
      else
        UnAplExportaXLS.StringGridToXLS(DBAdvGridAquisicao,FileName);
      if FileExists(FileName) then
        ShellExecute(Handle,PChar('Open'),PChar(FileName),nil,nil,SW_SHOWNORMAL);
    end;
  end;
end;

procedure TfmConAquisicao.ButtonImprimirRelatorioClick(Sender: TObject);
var
  vAux: string;
begin
  // Não imprime relatório se a grid estiver vazia.
  with DBAdvGridAquisicao do
    if Columns[1].Rows[Row] = EmptyStr then
      Exit;

  try
    // Inicializa os Relatorios.
    QueryRelAquisicao.SQL := pAquisicao.relatorio.SQL;
    // Filtra pelo Usuário.
    if EditConsultaNMLOGIN.Text <> EmptyStr then
      vAux := EditConsultaNMLOGIN.Text + ' - %'
    else
      vAux := '%';
    QueryRelAquisicao.Params.ParamByName('NMLOGIN').AsString := vAux;

    // Passa os filtros para as consultas que este relatório utiliza.
    with QueryRelAquisicao do
    begin
      SQL.Insert(SQL.Count-1,'  AND aquisicao.cdaquisicao in (' + pcdAquisicoes + ')');
    end;
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

procedure TfmConAquisicao.ButtonLimparTipoMovimentoClick(Sender: TObject);
begin
  plTipoMovimento.Clear;

  EditConsultaCDTIPOMOVIMENTO.Clear;
  EditConsultaDETIPOMOVIMENTO.Clear;

  EditConsultaCDTIPOMOVIMENTO.Enabled := true;
  EditConsultaDETIPOMOVIMENTO.Enabled := true;
  ButtonLimparTipoMovimento.Enabled := false;

  if OfficePagerCentral.ActivePageIndex = 0 then
    if EditConsultaCDTIPOMOVIMENTO.Enabled then
      ActiveControl := EditConsultaCDTIPOMOVIMENTO;
end;

procedure TfmConAquisicao.ButtonLimparUsuarioClick(Sender: TObject);
begin
  plUsuario.Clear;

  EditConsultaCDUSUARIO.Clear;
  EditConsultaNMLOGIN.Clear;
  EditConsultaNMUSUARIO.Clear;

  EditConsultaCDUSUARIO.Enabled := true;
  EditConsultaNMLOGIN.Enabled := true;
  EditConsultaNMUSUARIO.Enabled := true;
  ButtonLimparUsuario.Enabled := false;

  if OfficePagerCentral.ActivePageIndex = 0 then
    if EditConsultaCDUSUARIO.Enabled then
      ActiveControl := EditConsultaCDUSUARIO;
end;

procedure TfmConAquisicao.ButtonNovoClick(Sender: TObject);
begin
  try
    fmCadAquisicao := TfmCadAquisicao.Create(Self);
    with fmCadAquisicao do
    begin
      Tag := 1;

      Position := poOwnerFormCenter;
      Show;
    end;
  except
    on E: Exception do
      fmPrincipal.manipulaExcecoes(Sender,E);
  end;
end;

procedure TfmConAquisicao.ButtonVisualizarItensAquisicaoClick(Sender: TObject);
begin
  with DBAdvGridAquisicao do
    Codigo := Columns.Items[1].Ints[Row];

  // Trata de a grid estar vazia.
  with DBAdvGridAquisicao do
    if Row = 1 then
      if Columns[1].Rows[1] = EmptyStr then
        Exit;

  fmConAquisicaoItens := TfmConAquisicaoItens.Create(Self);
  fmConAquisicaoItens.Caption := Caption + ' :: ' + fmConAquisicaoItens.Caption;
  with fmConAquisicaoItens do
    try
      fmConAquisicaoItens.Codigo := fmConAquisicao.Codigo;
      listaAquisicaoItens;

      Position := poOwnerFormCenter;
      Show;
    except
      on E: Exception do
        fmPrincipal.manipulaExcecoes(Sender,E);
    end;
end;

procedure TfmConAquisicao.ButtonVisualizarParcelasClick(Sender: TObject);
var
  vcdAquisicao: integer;
  vvlAquisicao, vvlTaxaExtra: currency;
  vvlTaxaJuros: double;
  vQuery: TZQuery;
begin
  with DBAdvGridAquisicao do
    Codigo := Columns.Items[1].Ints[Row];

  // Obtém as informações de taxas para passar para a tela de Parcelas.
  try
    vQuery := TZQuery.Create(Self);
    with vQuery do
    begin
      SQL.Text := 'SELECT vltaxajuros,vltaxaextra';
      SQL.Add('FROM ' + cSchema + '.aquisicao');
      SQL.Add('WHERE cdaquisicao = :CDAQUISICAO');
      Params.ParamByName('CDAQUISICAO').AsInteger := Codigo;
      dmPrincipal.executaConsulta(vQuery);

      if not Eof then
      begin
        vvlTaxaJuros := Fields.FieldByName('VLTAXAJUROS').AsFloat;
        vvlTaxaExtra := Fields.FieldByName('VLTAXAEXTRA').AsCurrency;
      end
      else
      begin
        vvlTaxaJuros := 0;
        vvlTaxaExtra := 0;
      end
    end;
  finally
    vQuery.Active := false;
    FreeAndNil(vQuery);
  end;

  vcdAquisicao := Codigo;
  vvlAquisicao := obtemvlAquisicao(vcdAquisicao);
  fmCadAquisicaoParcela := TfmCadAquisicaoParcela.Create(Self);
  fmCadAquisicaoParcela.Caption := Caption + ' :: ' + fmCadAquisicaoParcela.Caption;
  with fmCadAquisicaoParcela do
  begin
    try
      consultaParcelasAquisicao(vcdAquisicao, vvlAquisicao, vvlTaxaExtra, vvlTaxaJuros, true);
      Show;
    except
      on E: exception do
        fmPrincipal.manipulaExcecoes(Sender,E);
    end;
  end;
end;

procedure TfmConAquisicao.carregaImagensBotoes;
begin
  EditConsultaDETIPOMOVIMENTO.Button.Glyph.Assign(fmPrincipal.fnGeral.obtemImagemPesquisa);
  EditConsultaNMUSUARIO.Button.Glyph.Assign(fmPrincipal.fnGeral.obtemImagemPesquisa);

  ButtonAbrirJanelaPesquisa.Picture.LoadFromFile(fmPrincipal.LocalIcones + 'search-e-16.png');
  ButtonAbrirJanelaPesquisa.HotPicture.LoadFromFile(fmPrincipal.LocalIcones + 'search-h-16.png');
  ButtonAbrirJanelaPesquisa.DisabledPicture.LoadFromFile(fmPrincipal.LocalIcones + 'search-d-16.png');
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

  ButtonLimparTipoMovimento.Picture.LoadFromFile(fmPrincipal.LocalIcones + 'erase-e-16.png');
  ButtonLimparTipoMovimento.HotPicture.LoadFromFile(fmPrincipal.LocalIcones + 'erase-h-16.png');
  ButtonLimparTipoMovimento.DisabledPicture.LoadFromFile(fmPrincipal.LocalIcones + 'erase-d-16.png');
  ButtonLimparUsuario.Picture.LoadFromFile(fmPrincipal.LocalIcones + 'erase-e-16.png');
  ButtonLimparUsuario.HotPicture.LoadFromFile(fmPrincipal.LocalIcones + 'erase-h-16.png');
  ButtonLimparUsuario.DisabledPicture.LoadFromFile(fmPrincipal.LocalIcones + 'erase-d-16.png');
end;

procedure TfmConAquisicao.ColumnGridOrdenacaoComboChange(Sender: TObject; ACol,
  ARow, AItemIndex: Integer; ASelection: string);
begin
  ColumnGridOrdenacao.ColumnByName['Ordem'].Rows[ARow] := ASelection;
end;

procedure TfmConAquisicao.EditConsultaDETIPOMOVIMENTOClickBtn(Sender: TObject);
var
  i: integer;
  vMensagem: string;
begin
  // Para que o evento não seja executado.
  EditConsultaCDTIPOMOVIMENTO.OnExit := nil;
  EditConsultaDETIPOMOVIMENTO.OnExit := nil;
  EditConsultaDETIPOMOVIMENTO.OnClickBtn := nil;

  fmConFiltroPadrao := TfmConFiltroPadrao.Create(Self);
  try
    with fmConFiltroPadrao do
    begin
      try
        setaTitulo('Consulta de Tipos de Movimento');
        setaConsulta(pTipoMovimento.filtro);
        setaFiltrosExtras('"DE-Natureza" = ''Aquisição''',
                          'Natureza: Aquisição');
        setaOpcao('C');
        executaFiltro(0,EmptyStr);
        ShowModal;
      finally
        plTipoMovimento.Clear;
        with pResSearch do
          for i := 0 to Count -1 do
            if objResSearch[i].Id = buscaId then
            begin
              plTipoMovimento.Add(objResSearch[i].Codigo);
              EditConsultaCDTIPOMOVIMENTO.Text := objResSearch[i].Codigo;
              EditConsultaDETIPOMOVIMENTO.Text := objResSearch[i].Nome1;
            end;
      end;
    end;
  finally
    // Se encontrar mais de um registro muda o texto do campo.
    if plTipoMovimento.Count > 1 then
    begin
      EditConsultaCDTIPOMOVIMENTO.Clear;
      vMensagem := fmPrincipal.MensagemFiltroVariosRegistros;
      EditConsultaDETIPOMOVIMENTO.Text := Format(vMensagem,[IntToStr(plTipoMovimento.Count)]);
    end;

    // Valida para qual campo vai se posicionar.
    if OfficePagerCentral.ActivePageIndex = 0 then
      if plTipoMovimento.Count > 0 then
        ActiveControl := EditConsultaNUANOAQUISICAO
      else
        ActiveControl := EditConsultaDETIPOMOVIMENTO;

    EditConsultaCDTIPOMOVIMENTO.Enabled := plTipoMovimento.Count = 0;
    EditConsultaDETIPOMOVIMENTO.Enabled := plTipoMovimento.Count = 0;
    ButtonLimparTipoMovimento.Enabled := (plTipoMovimento.Count > 0);
  end;

  // Para que o evento volte a ser executado.
  EditConsultaCDTIPOMOVIMENTO.OnExit := EditConsultaCDTIPOMOVIMENTOExit;
  EditConsultaDETIPOMOVIMENTO.OnExit := EditConsultaDETIPOMOVIMENTOExit;
  EditConsultaDETIPOMOVIMENTO.OnClickBtn := EditConsultaDETIPOMOVIMENTOClickBtn;
end;

procedure TfmConAquisicao.EditConsultaDETIPOMOVIMENTOExit(Sender: TObject);
var
  i: integer;
  vQuery: TZQuery;
  vMensagem: string;
begin
  if Length(Trim(EditConsultaDETIPOMOVIMENTO.Text)) = 0 then
    Exit;

  // Para que o evento não seja executado.
  EditConsultaCDTIPOMOVIMENTO.OnExit := nil;
  EditConsultaDETIPOMOVIMENTO.OnExit := nil;
  EditConsultaDETIPOMOVIMENTO.OnClickBtn := nil;

  try
    vQuery := pTipoMovimento.filtro;
    with vQuery do
    begin
      SQL.Add('WHERE UPPER("DE-Tipo Movimento") LIKE :DETIPOMOVIMENTO');
      SQL.Add('  AND "DE-Natureza" = ''Aquisição''');
      Params.ParamByName('DETIPOMOVIMENTO').AsString := '%'+AnsiUpperCase(EditConsultaDETIPOMOVIMENTO.Text)+'%';
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
            setaOpcao('C');
            executaFiltro(2,EditConsultaDETIPOMOVIMENTO.Text);
            ShowModal;
          finally
            plTipoMovimento.Clear;
            with pResSearch do
              for i := 0 to Count -1 do
                if objResSearch[i].Id = buscaId then
                begin
                  plTipoMovimento.Add(objResSearch[i].Codigo);
                  EditConsultaCDTIPOMOVIMENTO.Text := objResSearch[i].Codigo;
                  EditConsultaDETIPOMOVIMENTO.Text := objResSearch[i].Nome1;
                end;
          end;
        end;
      end
      else
        if not Eof then
        begin
          plTipoMovimento.Clear;
          plTipoMovimento.Add(Fields.Fields[0].AsString);
          EditConsultaCDTIPOMOVIMENTO.Text := Fields.Fields[0].AsString;
          EditConsultaDETIPOMOVIMENTO.Text := Fields.Fields[1].AsString;
        end
        else
          MessageBox(fmPrincipal.Handle,
                     PWideChar('Nenhum registro encontrado.'),
                     'Informação',
                     MB_OK or MB_ICONINFORMATION);
      Active := false;
    end;
  finally
    FreeAndNil(vQuery);
    // Se encontrar mais de um registro muda o texto do campo.
    if plTipoMovimento.Count > 1 then
    begin
      EditConsultaCDTIPOMOVIMENTO.Clear;
      vMensagem := fmPrincipal.MensagemFiltroVariosRegistros;
      EditConsultaDETIPOMOVIMENTO.Text := Format(vMensagem,[IntToStr(plTipoMovimento.Count)]);
    end;

    // Valida para qual campo vai se posicionar.
    if OfficePagerCentral.ActivePageIndex = 0 then
      if plTipoMovimento.Count > 0 then
        ActiveControl := EditConsultaNUANOAQUISICAO
      else
        ActiveControl := EditConsultaDETIPOMOVIMENTO;

    EditConsultaCDTIPOMOVIMENTO.Enabled := plTipoMovimento.Count = 0;
    EditConsultaDETIPOMOVIMENTO.Enabled := plTipoMovimento.Count = 0;
    ButtonLimparTipoMovimento.Enabled := (plTipoMovimento.Count > 0);
  end;

  // Para que o evento volte a ser executado.
  EditConsultaCDTIPOMOVIMENTO.OnExit := EditConsultaCDTIPOMOVIMENTOExit;
  EditConsultaDETIPOMOVIMENTO.OnExit := EditConsultaDETIPOMOVIMENTOExit;
  EditConsultaDETIPOMOVIMENTO.OnClickBtn := EditConsultaDETIPOMOVIMENTOClickBtn;
end;

procedure TfmConAquisicao.EditConsultaNMUSUARIOClickBtn(Sender: TObject);
var
  i: integer;
  vMensagem: string;
begin
  // Para que o evento não seja executado.
  EditConsultaCDUSUARIO.OnExit := nil;
  EditConsultaNMLOGIN.OnExit := nil;
  EditConsultaNMUSUARIO.OnExit := nil;
  EditConsultaNMUSUARIO.OnClickBtn := nil;

  fmConFiltroPadrao := TfmConFiltroPadrao.Create(Self);
  try
    with fmConFiltroPadrao do
    begin
      try
        setaTitulo('Consulta de Usuário');
        setaConsulta(pUsuario.filtro);
        setaOpcao('C');
        executaFiltro(0,EmptyStr);
        ShowModal;
      finally
        plUsuario.Clear;
        with pResSearch do
          for i := 0 to Count -1 do
            if objResSearch[i].Id = buscaId then
            begin
              plUsuario.Add(objResSearch[i].Codigo);
              EditConsultaCDUSUARIO.Text := objResSearch[i].Codigo;
              EditConsultaNMLOGIN.Text := objResSearch[i].Nome1;
              EditConsultaNMUSUARIO.Text := objResSearch[i].Nome2;
            end;
      end;
    end;
  finally
    // Se encontrar mais de um registro muda o texto do campo.
    if plUsuario.Count > 1 then
    begin
      EditConsultaCDUSUARIO.Clear;
      EditConsultaNMLOGIN.Clear;
      vMensagem := fmPrincipal.MensagemFiltroVariosRegistros;
      EditConsultaNMUSUARIO.Text := Format(vMensagem,[IntToStr(plUsuario.Count)]);
    end;

    // Valida para qual campo vai se posicionar.
    if OfficePagerCentral.ActivePageIndex = 0 then
      if plUsuario.Count > 0 then
        ActiveControl := EditConsultaDEAQUISICAO
      else
        ActiveControl := EditConsultaNMUSUARIO;

    EditConsultaCDUSUARIO.Enabled := (plUsuario.Count = 0);
    EditConsultaNMLOGIN.Enabled := (plUsuario.Count = 0);
    EditConsultaNMUSUARIO.Enabled := (plUsuario.Count = 0);
    ButtonLimparUsuario.Enabled := (plUsuario.Count > 0);
  end;

  // Para que o evento volte a ser executado.
  EditConsultaCDUSUARIO.OnExit := EditConsultaCDUSUARIOExit;
  EditConsultaNMLOGIN.OnExit := EditConsultaNMLOGINExit;
  EditConsultaNMUSUARIO.OnExit := EditConsultaNMUSUARIOExit;
  EditConsultaNMUSUARIO.OnClickBtn := EditConsultaNMUSUARIOClickBtn;
end;

procedure TfmConAquisicao.EditConsultaNMUSUARIOExit(Sender: TObject);
var
  i: integer;
  vQuery: TZQuery;
  vMensagem: string;
begin
  if Length(Trim(EditConsultaNMUSUARIO.Text)) = 0 then
    Exit;

  // Para que o evento não seja executado.
  EditConsultaCDUSUARIO.OnExit := nil;
  EditConsultaNMLOGIN.OnExit := nil;
  EditConsultaNMUSUARIO.OnExit := nil;
  EditConsultaNMUSUARIO.OnClickBtn := nil;

  try
    vQuery := pUsuario.filtro;
    with vQuery do
    begin
      SQL.Add('WHERE UPPER("NM-Usuário") LIKE :NMUSUARIO');
      Params.ParamByName('NMUSUARIO').AsString := '%'+AnsiUpperCase(EditConsultaNMUSUARIO.Text)+'%';
      dmPrincipal.executaConsulta(vQuery);

      if RecordCount > 1 then
      begin
        fmConFiltroPadrao := TfmConFiltroPadrao.Create(Self);
        with fmConFiltroPadrao do
        begin
          try
            setaTitulo('Consulta de Usuários');
            setaConsulta(pUsuario.filtro);
            setaOpcao('C');
            executaFiltro(3,EditConsultaNMUSUARIO.Text);
            ShowModal;
          finally
            plUsuario.Clear;
            with pResSearch do
              for i := 0 to Count -1 do
                if objResSearch[i].Id = buscaId then
                begin
                  plUsuario.Add(objResSearch[i].Codigo);
                  EditConsultaCDUSUARIO.Text := objResSearch[i].Codigo;
                  EditConsultaNMLOGIN.Text := objResSearch[i].Nome1;
                  EditConsultaNMUSUARIO.Text := objResSearch[i].Nome2;
                end;
          end;
        end;
      end
      else
        if not Eof then
        begin
          plUsuario.Clear;
          plUsuario.Add(Fields.Fields[0].AsString);
          EditConsultaCDUSUARIO.Text := Fields.Fields[0].AsString;
          EditConsultaNMLOGIN.Text := Fields.Fields[1].AsString;
          EditConsultaNMUSUARIO.Text := Fields.Fields[2].AsString;
        end
        else
          MessageBox(fmPrincipal.Handle,
                     PWideChar('Nenhum registro encontrado.'),
                     'Informação',
                     MB_OK or MB_ICONINFORMATION);
      Active := false;
    end;
  finally
    FreeAndNil(vQuery);

    // Se encontrar mais de um registro muda o texto do campo.
    if plUsuario.Count > 1 then
    begin
      EditConsultaCDUSUARIO.Clear;
      EditConsultaNMLOGIN.Clear;
      vMensagem := fmPrincipal.MensagemFiltroVariosRegistros;
      EditConsultaNMUSUARIO.Text := Format(vMensagem,[IntToStr(plUsuario.Count)]);
    end;

    // Valida para qual campo vai se posicionar.
    if OfficePagerCentral.ActivePageIndex = 0 then
      if plUsuario.Count > 0 then
        ActiveControl := EditConsultaDEAQUISICAO
      else
        ActiveControl := EditConsultaNMUSUARIO;

    EditConsultaCDUSUARIO.Enabled := (plUsuario.Count = 0);
    EditConsultaNMLOGIN.Enabled := (plUsuario.Count = 0);
    EditConsultaNMUSUARIO.Enabled := (plUsuario.Count = 0);
    ButtonLimparUsuario.Enabled := (plUsuario.Count > 0);
end;

  // Para que o evento volte a ser executado.
  EditConsultaCDUSUARIO.OnExit := EditConsultaCDUSUARIOExit;
  EditConsultaNMLOGIN.OnExit := EditConsultaNMLOGINExit;
  EditConsultaNMUSUARIO.OnExit := EditConsultaNMUSUARIOExit;
  EditConsultaNMUSUARIO.OnClickBtn := EditConsultaNMUSUARIOClickBtn;
end;

procedure TfmConAquisicao.congelaFiltros(pCongelar: boolean);
begin
  EditConsultaCDUSUARIO.Enabled := not pCongelar;
  EditConsultaNMLOGIN.Enabled := not pCongelar;
  EditConsultaNMUSUARIO.Enabled := not pCongelar;
  EditConsultaCDTIPOMOVIMENTO.Enabled := not pCongelar;
  EditConsultaDETIPOMOVIMENTO.Enabled := not pCongelar;
  EditConsultaNUANOAQUISICAO.Enabled := not pCongelar;
  EditConsultaNUAQUISICAO.Enabled := not pCongelar;
  DatePickerConsultaDTAQUISICAOInicial.Enabled := not pCongelar;
  DatePickerConsultaDTAQUISICAOFinal.Enabled := not pCongelar;
  EditConsultaDEAQUISICAO.Enabled := not pCongelar;
  CheckBoxConsultaFLURGENTE.Enabled := not pCongelar;
  CheckBoxConsultaFLENTREGAPENDENTE.Enabled := not pCongelar;
  CheckBoxConsultaPARCELADA.Enabled := not pCongelar;
  CheckBoxConsultaFLCANCELADO.Enabled := not pCongelar;
  RadioGroupTipoConsulta.Enabled := not pCongelar;
  ColumnGridOrdenacao.Enabled := not pCongelar;
  ButtonAplicarParametros.Enabled := not pCongelar;

  // Utiliza este if pois o botão é controlado pelo próprio campo.
  if pCongelar then
  begin
    ButtonLimparTipoMovimento.Enabled := false;
    ButtonLimparUsuario.Enabled := false;
  end;

end;

procedure TfmConAquisicao.DBAdvGridAquisicaoDblClickCell(Sender: TObject; ARow,
  ACol: Integer);
begin
  if ARow = 0 then
    Exit;
  if not DBAdvGridAquisicao.DataSource.DataSet.Active then
    Exit;

  if DBAdvGridAquisicao.Columns.Items[1].Rows[ARow] <> EmptyStr then
    Codigo := DBAdvGridAquisicao.Columns.Items[1].Ints[ARow]
  else
    Exit;

  fmCadAquisicao := TfmCadAquisicao.Create(Self);
  with fmCadAquisicao do
  begin
    try
      editaCadastroViaConsulta(fmConAquisicao.Codigo);
      Position := poOwnerFormCenter;
      Show;

      // Atualiza o registro da linha selecionada.
      {if Opcao = 'C' then
        BitBtnAplicarParametrosClick(BitBtnAplicarParametros)
      else
        fmPrincipal.consultaLinhaGrid(DBAdvGridAquisicao);}
    except
      on E: exception do
        fmPrincipal.manipulaExcecoes(Sender,E);
    end;
  end;
end;

procedure TfmConAquisicao.EditConsultaCDTIPOMOVIMENTOChange(Sender: TObject);
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
      OnChange := EditConsultaCDTIPOMOVIMENTOChange;
      SelStart := Length(Text);
    end;
end;

procedure TfmConAquisicao.EditConsultaCDTIPOMOVIMENTOExit(Sender: TObject);
var
  vQuery: TZQuery;
begin
  // Se não digitou nada, sai sem abrir a search.
  if Length(Trim(EditConsultaCDTIPOMOVIMENTO.Text)) = 0 then
    Exit;

  // Para que o evento não seja executado.
  EditConsultaCDTIPOMOVIMENTO.OnExit := nil;
  EditConsultaDETIPOMOVIMENTO.OnExit := nil;
  EditConsultaDETIPOMOVIMENTO.OnClickBtn := nil;

  try
    vQuery := pTipoMovimento.filtro;
    with vQuery do
    begin
      SQL.Add('WHERE "NU-Código" = :CDTIPOMOVIMENTO');
      SQL.Add('  AND "DE-Natureza" = ''Aquisição''');
      Params.ParamByName('CDTIPOMOVIMENTO').AsString := EditConsultaCDTIPOMOVIMENTO.Text;
      dmPrincipal.executaConsulta(vQuery);

      if not Eof then
      begin
        plTipoMovimento.Clear;
        plTipoMovimento.Add(Fields.Fields[0].AsString);
        EditConsultaCDTIPOMOVIMENTO.Text := Fields.Fields[0].AsString;
        EditConsultaDETIPOMOVIMENTO.Text := Fields.Fields[1].AsString;
      end
      else
      begin
        plTipoMovimento.Clear;
        EditConsultaCDTIPOMOVIMENTO.Clear;
        EditConsultaDETIPOMOVIMENTO.Clear;
        MessageBox(fmPrincipal.Handle,
                   PWideChar('Nenhum registro encontrado.'),
                   'Informação',
                   MB_OK or MB_ICONINFORMATION);
      end;
      Active := false;
    end;
  finally
    FreeAndNil(vQuery);
    // Valida para qual campo vai se posicionar.
    if OfficePagerCentral.ActivePageIndex = 0 then
      if plTipoMovimento.Count > 0 then
        ActiveControl := EditConsultaNUANOAQUISICAO
      else
        ActiveControl := EditConsultaCDTIPOMOVIMENTO;

    EditConsultaCDTIPOMOVIMENTO.Enabled := (plTipoMovimento.Count = 0);
    EditConsultaDETIPOMOVIMENTO.Enabled := (plTipoMovimento.Count = 0);
    ButtonLimparTipoMovimento.Enabled := (plTipoMovimento.Count > 0);
  end;

  // Para que o evento volte a ser executado.
  EditConsultaCDTIPOMOVIMENTO.OnExit := EditConsultaCDTIPOMOVIMENTOExit;
  EditConsultaDETIPOMOVIMENTO.OnExit := EditConsultaDETIPOMOVIMENTOExit;
  EditConsultaDETIPOMOVIMENTO.OnClickBtn := EditConsultaDETIPOMOVIMENTOClickBtn;
end;

procedure TfmConAquisicao.EditConsultaCDUSUARIOChange(Sender: TObject);
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
      OnChange := EditConsultaCDUSUARIOChange;
      SelStart := Length(Text);
    end;
end;

procedure TfmConAquisicao.EditConsultaCDUSUARIOExit(Sender: TObject);
var
  vQuery: TZQuery;
begin
  if Length(Trim(EditConsultaCDUSUARIO.Text)) = 0 then
    Exit;

  // Para que o evento não seja executado.
  EditConsultaCDUSUARIO.OnExit := nil;
  EditConsultaNMLOGIN.OnExit := nil;
  EditConsultaNMUSUARIO.OnExit := nil;
  EditConsultaNMUSUARIO.OnClickBtn := nil;

  try
    vQuery := pUsuario.filtro;
    with vQuery do
    begin
      SQL.Add('WHERE "NU-Código" = :CDUSUARIO');
      Params.ParamByName('CDUSUARIO').AsString := EditConsultaCDUSUARIO.Text;
      dmPrincipal.executaConsulta(vQuery);

      if not Eof then
      begin
        plUsuario.Clear;
        plUsuario.Add(Fields.Fields[0].AsString);
        EditConsultaNMLOGIN.Text := Fields.Fields[1].AsString;
        EditConsultaNMUSUARIO.Text := Fields.Fields[2].AsString;
      end
      else
      begin
        plUsuario.Clear;
        EditConsultaCDUSUARIO.Clear;
        EditConsultaNMLOGIN.Clear;
        EditConsultaNMUSUARIO.Clear;
        MessageBox(fmPrincipal.Handle,
                   PWideChar('Nenhum registro encontrado.'),
                   'Informação',
                   MB_OK or MB_ICONINFORMATION);
      end;
      Active := false;
    end;
  finally
    FreeAndNil(vQuery);

    // Valida para qual campo vai se posicionar.
    if OfficePagerCentral.ActivePageIndex = 0 then
      if plUsuario.Count > 0 then
        ActiveControl := EditConsultaDEAQUISICAO
      else
        ActiveControl := EditConsultaCDUSUARIO;

    EditConsultaCDUSUARIO.Enabled := (plUsuario.Count = 0);
    EditConsultaNMLOGIN.Enabled := (plUsuario.Count = 0);
    EditConsultaNMUSUARIO.Enabled := (plUsuario.Count = 0);
    ButtonLimparUsuario.Enabled := (plUsuario.Count > 0);
  end;

  // Para que o evento volte a ser executado.
  EditConsultaCDUSUARIO.OnExit := EditConsultaCDUSUARIOExit;
  EditConsultaNMLOGIN.OnExit := EditConsultaNMLOGINExit;
  EditConsultaNMUSUARIO.OnExit := EditConsultaNMUSUARIOExit;
  EditConsultaNMUSUARIO.OnClickBtn := EditConsultaNMUSUARIOClickBtn;
end;

procedure TfmConAquisicao.EditConsultaNMLOGINExit(Sender: TObject);
var
  i: integer;
  vQuery: TZQuery;
  vMensagem: string;
begin
  if Length(Trim(EditConsultaNMLOGIN.Text)) = 0 then
    Exit;

  // Para que o evento não seja executado.
  EditConsultaCDUSUARIO.OnExit := nil;
  EditConsultaNMLOGIN.OnExit := nil;
  EditConsultaNMUSUARIO.OnExit := nil;
  EditConsultaNMUSUARIO.OnClickBtn := nil;

  try
    vQuery := pUsuario.filtro;
    with vQuery do
    begin
      SQL.Add('WHERE UPPER("LG-Login") LIKE :NMLOGIN');
      Params.ParamByName('NMLOGIN').AsString := AnsiUpperCase(EditConsultaNMLOGIN.Text)+'%';
      dmPrincipal.executaConsulta(vQuery);

      if RecordCount > 1 then
      begin
        fmConFiltroPadrao := TfmConFiltroPadrao.Create(Self);
        with fmConFiltroPadrao do
        begin
          try
            setaTitulo('Consulta de Usuários');
            setaConsulta(pUsuario.filtro);
            setaOpcao('C');
            executaFiltro(2,EditConsultaNMLOGIN.Text);
            ShowModal;
          finally
            plUsuario.Clear;
            with pResSearch do
              for i := 0 to Count -1 do
                if objResSearch[i].Id = buscaId then
                begin
                  plUsuario.Add(objResSearch[i].Codigo);
                  EditConsultaCDUSUARIO.Text := objResSearch[i].Codigo;
                  EditConsultaNMLOGIN.Text := objResSearch[i].Nome1;
                  EditConsultaNMUSUARIO.Text := objResSearch[i].Nome2;
                end;
          end;
        end;
      end
      else
        if not Eof then
        begin
          plUsuario.Clear;
          plUsuario.Add(Fields.Fields[0].AsString);
          EditConsultaCDUSUARIO.Text := Fields.Fields[0].AsString;
          EditConsultaNMLOGIN.Text := Fields.Fields[1].AsString;
          EditConsultaNMUSUARIO.Text := Fields.Fields[2].AsString;
        end
        else
          MessageBox(fmPrincipal.Handle,
                     PWideChar('Nenhum registro encontrado.'),
                     'Informação',
                     MB_OK or MB_ICONINFORMATION);
      Active := false;
    end;
  finally
    FreeAndNil(vQuery);

    // Se encontrar mais de um registro muda o texto do campo.
    if plUsuario.Count > 1 then
    begin
      EditConsultaCDUSUARIO.Clear;
      EditConsultaNMLOGIN.Clear;
      vMensagem := fmPrincipal.MensagemFiltroVariosRegistros;
      EditConsultaNMUSUARIO.Text := Format(vMensagem,[IntToStr(plUsuario.Count)]);
    end;

    // Valida para qual campo vai se posicionar.
    if OfficePagerCentral.ActivePageIndex = 0 then
      if plUsuario.Count > 0 then
        ActiveControl := EditConsultaDEAQUISICAO
      else
        ActiveControl := EditConsultaNMLOGIN;

    EditConsultaCDUSUARIO.Enabled := (plUsuario.Count = 0);
    EditConsultaNMLOGIN.Enabled := (plUsuario.Count = 0);
    EditConsultaNMUSUARIO.Enabled := (plUsuario.Count = 0);
    ButtonLimparUsuario.Enabled := (plUsuario.Count > 0);
  end;

  // Para que o evento volte a ser executado.
  EditConsultaCDUSUARIO.OnExit := EditConsultaCDUSUARIOExit;
  EditConsultaNMLOGIN.OnExit := EditConsultaNMLOGINExit;
  EditConsultaNMUSUARIO.OnExit := EditConsultaNMUSUARIOExit;
  EditConsultaNMUSUARIO.OnClickBtn := EditConsultaNMUSUARIOClickBtn;
end;

procedure TfmConAquisicao.EditConsultaNUANOAQUISICAOChange(Sender: TObject);
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
      OnChange := EditConsultaNUANOAQUISICAOChange;
      SelStart := Length(Text);
    end;
end;

procedure TfmConAquisicao.EditConsultaNUANOAQUISICAOExit(Sender: TObject);
begin
  if EditConsultaNUANOAQUISICAO.Text = EmptyStr then
    Exit;

  if Length(Trim(EditConsultaNUANOAQUISICAO.Text)) < 4 then
  begin
    MessageBox(fmPrincipal.Handle,
               PWideChar('O Ano de Aquisição está inconsistente. Este campo precisa estar no seguinte formato: AAAA'+#13+#10+
                         'Por favor, corrija a inconsistência neste campo.'),
               cTituloMensagemErro,
               MB_OK or MB_ICONERROR);
    ActiveControl := EditConsultaNUANOAQUISICAO;
  end;
end;

procedure TfmConAquisicao.EditConsultaNUAQUISICAOChange(Sender: TObject);
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
      OnChange := EditConsultaNUAQUISICAOChange;
      SelStart := Length(Text);
    end;
end;

end.
