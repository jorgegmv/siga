unit unCadUsuario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, StrUtils, Buttons, ExtCtrls, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, Grids, AdvObj, BaseGrid, AdvGrid, AdvCGrid,
  AsgFindDialog, ComCtrls, Menus, ShellAPI, UnAplExportaXLS, ImgList, ToolWin,
  MaskUtils, DBAdvGrid, jpeg, RpRender, RpRenderPDF, RpCon, RpConDS, RpBase,
  RpSystem, RpDefine, RpRave, Vcl.ExtDlgs, Vcl.Imaging.pngimage, AdvGlowButton,
  AdvOfficeImage, AdvEdit, AdvOfficeButtons, AdvAppStyler, tmsAdvGridExcel,
  AdvMenus, JvBalloonHint, AdvGroupBox, AdvEdBtn, AdvToolBar, AdvPanel,
  AdvOfficePager, JvComponentBase, unUsuario, unDocumento, unPerfil,
  unInformacaoGeografica, unCEP;

type
  TfmCadUsuario = class(TForm)
    QueryGeral: TZQuery;
    GridFindDialogColumnGrid: TAdvGridFindDialog;
    DBAdvGridGeral: TDBAdvGrid;
    DataSource: TDataSource;
    BalloonHintInfoTelefones: TJvBalloonHint;
    LabelCodigo: TLabel;
    LabelUsuario: TLabel;
    LabelLogin: TLabel;
    LabelEmail: TLabel;
    LabelPerfil: TLabel;
    LabelDisponivel: TLabel;
    LabelImagem: TLabel;
    LabelNumero: TLabel;
    LabelEndereco: TLabel;
    LabelCEP: TLabel;
    LabelTelefoneResidencial: TLabel;
    LabelTelefoneCelular: TLabel;
    LabelSelecionarImagem: TLabel;
    OpenDialog: TOpenDialog;
    SaveDialog: TSaveDialog;
    OpenPictureDialog: TOpenPictureDialog;
    ProjectRelUsuario: TRvProject;
    DataSetConnectionRelUsuario: TRvDataSetConnection;
    QueryRelUsuario: TZQuery;
    ButtonLimparPerfil: TAdvGlowButton;
    ButtonNovoPerfil: TAdvGlowButton;
    ButtonRemoverImagem: TAdvGlowButton;
    ButtonSalvarImagem: TAdvGlowButton;
    ButtonPesquisarCEP: TAdvGlowButton;
    ButtonInfoTelefones: TAdvGlowButton;
    ImageIMIMAGEM: TAdvOfficeImage;
    MemoCadastroNMENDERECO: TMemo;
    EditCadastroCDUSUARIO: TAdvEdit;
    EditCadastroNMUSUARIO: TAdvEdit;
    EditCadastroCDPERFIL: TAdvEdit;
    EditCadastroDEEMAIL: TAdvEdit;
    EditCadastroNMLOGIN: TAdvEdit;
    EditCadastroNUENDERECO: TAdvEdit;
    EditCadastroNUCEP: TAdvEdit;
    EditCadastroNUTELEFONERESIDENCIAL: TAdvEdit;
    EditCadastroNUTELEFONECELULAR: TAdvEdit;
    CheckBoxCadastroFLATIVO: TAdvOfficeCheckBox;
    FormStyler: TAdvFormStyler;
    EditCadastroNMPERFIL: TAdvEditBtn;
    GroupBoxEndereco: TAdvGroupBox;
    GroupBoxTelefone: TAdvGroupBox;
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
    PanelBotoes: TAdvPanel;
    BitBtnFechar: TAdvGlowButton;
    BitBtnSalvar: TAdvGlowButton;
    BitBtnNovo: TAdvGlowButton;
    BitBtnExcluir: TAdvGlowButton;
    BitBtnRestaurar: TAdvGlowButton;
    BitBtnRedefinirSenha: TAdvGlowButton;
    PopupMenuGrid: TAdvPopupMenu;
    MenuItemEditarRegistro: TMenuItem;
    MenuItemAtualizarTabela: TMenuItem;
    MenuItemEspaco1: TMenuItem;
    MenuItemVisualizarFiltro: TMenuItem;
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
    procedure ButtonLimparPerfilClick(Sender: TObject);
    procedure ButtonSalvarImagemClick(Sender: TObject);
    procedure EditCadastroNMPERFILExit(Sender: TObject);
    procedure EditCadastroNMLOGINChange(Sender: TObject);
    procedure EditCadastroNMLOGINExit(Sender: TObject);
    procedure EditCadastroNUTELEFONECELULARChange(Sender: TObject);
    procedure EditCadastroNUTELEFONECELULARExit(Sender: TObject);
    procedure EditCadastroNUTELEFONERESIDENCIALChange(Sender: TObject);
    procedure EditCadastroNUTELEFONERESIDENCIALExit(Sender: TObject);
    procedure EditCadastroCDPERFILExit(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure EditCadastroNUCEPExit(Sender: TObject);
    procedure LabelSelecionarImagemClick(Sender: TObject);
    procedure ButtonNovoPerfilClick(Sender: TObject);
    procedure ButtonPesquisarCEPClick(Sender: TObject);
    procedure BitBtnRedefinirSenhaClick(Sender: TObject);
    procedure ButtonRemoverImagemClick(Sender: TObject);
    procedure ButtonInfoTelefonesClick(Sender: TObject);
    procedure EditCadastroCDPERFILChange(Sender: TObject);
    procedure ButtonOrdenarRegistrosClick(Sender: TObject);
    procedure EditCadastroNUCEPChange(Sender: TObject);
    procedure EditCadastroNUCEPKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditCadastroNUTELEFONERESIDENCIALKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure EditCadastroNUTELEFONECELULARKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure EditCadastroNMPERFILClickBtn(Sender: TObject);
    procedure OfficePageCadastroShow(Sender: TObject);
  private
    { Private declarations }
    pId: TGUID;
    pOpcao: Char;
    pCodigo, pCodigoDocumento, pEspacamentoInicial, pEspacamentoFinal,
    pEspacamentoEntre: integer;
    plPerfil: TStringList;
    pUsuario: TUsuario;
    pDocumento: TDocumento;
    pPerfil: TPerfil;
    pInformacaoGeografica: TInformacaoGeografica;
    pCEP: TCEP;
    pimImagem, pOrdenacao: string;
    pbolExclusaoInvisivel, pExcluindoCaractere: boolean;
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
    property Ordenacao: string read pOrdenacao write pOrdenacao;
  public
    { Public declarations }
    pAtualizarUsuario: boolean;
    procedure editaCadastroUsuarioLogin;
    property Opcao: char read pOpcao write pOpcao;
    property Codigo: integer read pCodigo write pCodigo;
    property CodigoDocumento: integer read pCodigoDocumento write pCodigoDocumento;
  end;

var
  fmCadUsuario: TfmCadUsuario;

implementation

uses unPrincipal, unConFiltroPadrao, undmPrincipal, unCadPerfil, unGeral,
  unAplOrdenaGrid, undmEstilo;

{$R *.dfm}

procedure TfmCadUsuario.atualizaCadastro;
var
  vRetorno: integer;
begin
  try
    pUsuario.Nome := Trim(EditCadastroNMUSUARIO.Text);
    pUsuario.Email := Trim(EditCadastroDEEMAIL.Text);
    pUsuario.Perfil := StrToInt(EditCadastroCDPERFIL.Text);
    pUsuario.CEP := EditCadastroNUCEP.Tag;
    pUsuario.Numero := StrToIntDef(EditCadastroNUENDERECO.Text,0);
    pUsuario.TelefoneFixo := EditCadastroNUTELEFONERESIDENCIAL.Text;
    pUsuario.TelefoneCelular := EditCadastroNUTELEFONECELULAR.Text;
    if CheckBoxCadastroFLATIVO.Checked then
      pUsuario.Ativo := 'S'
    else
      pUsuario.Ativo := 'N';
    vRetorno := pUsuario.atualiza;

    if vRetorno <> 0 then
      fmPrincipal.apresentaResultadoCadastro('Cadastro atualizado com sucesso.')
    else
      fmPrincipal.apresentaResultadoCadastro('Não foi possível atualizar o cadastro.');
  except
    on E: exception do
      raise;
  end;
end;

procedure TfmCadUsuario.BitBtnRedefinirSenhaClick(Sender: TObject);
var
  vSenha, vEmail: string;
begin
  // Valida se realmente o usuário quer redefinir a senha do usuário.
  if MessageBox(fmPrincipal.Handle,
                PWideChar('Deseja realmente redefinir a senha do usuário '+EditCadastroNMLOGIN.Text+'?'),
                cTituloMensagemConfirmacao,
                MB_YESNO or MB_ICONQUESTION or MB_DEFBUTTON2) = IDNO then
    Exit;

  try
    with fmPrincipal.fnGeral do
    begin
      vSenha := geraSenha;
      pUsuario.Senha := criptografaSenha(vSenha);
    end;
    pUsuario.DicaSenha := 'Senha redefinida pelo Administrador.';

    if pUsuario.atualizaSenhaUsuario <> 0 then
      fmPrincipal.apresentaResultadoCadastro('Senha do usuário ' + EditCadastroNMLOGIN.Text + ' redefinida com sucesso.')
    else
    begin
      fmPrincipal.apresentaResultadoCadastro('Não foi possível redefinir a senha do usuário ' + EditCadastroNMLOGIN.Text + '.');
      Exit;
    end;

    // Formata o e-mail de confirmação do cadastro.
    vEmail := '<div align="left">'+
              'E-mail de redifinição de senha do usuário.'+
              '</div>'+
              '<br>'+
              '<div align="left">'+
              '<b>Nome:</b> '+Trim(EditCadastroNMUSUARIO.Text)+'<br>'+
              '<b>Login:</b> '+Trim(EditCadastroNMLOGIN.Text)+'<br>'+
              '</div>'+
              '<br>'+
              '<div align="left">'+
              'Sua Senha temporária, válida por 5 dias úteis, é: "'+vSenha+'".'+
              '<br>'+
              'Acesse o sistema utilizando seu usuário e senha informados e realize a troca de sua senha temporária.'+
              '<br>'+
              'Acesso: <i>Menu > Arquivo > Alterar Senha do Usuário</i>'+
              '</div>';
    fmPrincipal.enviaEmail('Redifinição de senha do usuário',
                           EditCadastroDEEMAIL.Text,
                           EmptyStr,
                           fmPrincipal.EmailUsuarioLogado,
                           vEmail);
    fmPrincipal.pLogSistema.Debug('Administrador redefiniu a senha do usuário: ' +
                                  EditCadastroNMLOGIN.Text + '.');
  except
    on E: Exception do
      fmPrincipal.manipulaExcecoes(Sender,E);
  end;
end;

procedure TfmCadUsuario.ButtonRemoverImagemClick(Sender: TObject);
var
  vImagem: string;
begin
  try
    // Seta o cddocumento para nulo.
    if pUsuario.excluiImagemUsuario <> 0 then
    begin
      // Exclui a imagem para poder inserir uma nova.
      pDocumento.Codigo := CodigoDocumento;
      pDocumento.exclui;

      if not pbolExclusaoInvisivel then
      begin
        fmPrincipal.apresentaResultadoCadastro('Imagem removida do usuário com sucesso.');

        vImagem := fmPrincipal.LocalAplicacao + fmPrincipal.LocalImagemPadraoUsuario;
        ImageIMIMAGEM.Picture.LoadFromFile(vImagem);
        ButtonRemoverImagem.Enabled := false;

        // Se for o próprio usuário que está logado, atualiza sua imagem.
        if fmPrincipal.CodigoUsuarioLogado = Codigo then
        begin
          fmPrincipal.CodigoImagemUsuarioLogado := 0;
          fmPrincipal.ImageIMIMAGEM.Picture.LoadFromFile(vImagem);
        end;
      end;
    end;
  except
    on E: Exception do
      fmPrincipal.manipulaExcecoes(Sender,E);
  end;
end;

procedure TfmCadUsuario.BitBtnRestaurarClick(Sender: TObject);
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

procedure TfmCadUsuario.BitBtnExcluirClick(Sender: TObject);
var
  vRetorno: integer;
begin
  // Valida se realmente o usuário quer realizar a exclusão.
  if MessageBox(fmPrincipal.Handle,
                PWideChar('Confirma a exclusão do usuário?'),
                cTituloMensagemConfirmacao,
                MB_YESNO or MB_ICONQUESTION or MB_DEFBUTTON2) = IDNO then
    Exit;
  // Valida se é possível realizar a exclusão.
  if not validaExclusao then
    Exit;

  desabilitaBotoes;
  try
    // Trata uma imagem já salva.
    pbolExclusaoInvisivel := true;
    if CodigoDocumento <> 0 then
      ButtonRemoverImagemClick(Sender);
    pbolExclusaoInvisivel := false;

    vRetorno := pUsuario.exclui;

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

procedure TfmCadUsuario.BitBtnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfmCadUsuario.ButtonLimparPerfilClick(Sender: TObject);
begin
  plPerfil.Clear;

  EditCadastroCDPERFIL.Clear;
  EditCadastroNMPERFIL.Clear;

  EditCadastroCDPERFIL.Enabled := true;
  EditCadastroNMPERFIL.Enabled := true;

  ButtonLimparPerfil.Enabled := false;
  ButtonNovoPerfil.Enabled := true;
end;

procedure TfmCadUsuario.insereCadastro;
var
  vSenha, vEmail, vSistemaUsuario: string;
begin
  try
    pUsuario.Nome := Trim(EditCadastroNMUSUARIO.Text);
    pUsuario.Login := Trim(EditCadastroNMLOGIN.Text);
    with fmPrincipal.fnGeral do
    begin
      vSenha := geraSenha;
      pUsuario.Senha := criptografaSenha(vSenha);
    end;
    pUsuario.Email := Trim(EditCadastroDEEMAIL.Text);
    pUsuario.Perfil := StrToInt(EditCadastroCDPERFIL.Text);
    pUsuario.CEP := EditCadastroNUCEP.Tag;
    pUsuario.Numero := StrToIntDef(EditCadastroNUENDERECO.Text,0);
    pUsuario.TelefoneFixo := EditCadastroNUTELEFONERESIDENCIAL.Text;
    pUsuario.TelefoneCelular := EditCadastroNUTELEFONECELULAR.Text;
    if CheckBoxCadastroFLATIVO.Checked then
      pUsuario.Ativo := 'S'
    else
      pUsuario.Ativo := 'N';
    Codigo := pUsuario.insere;

    if Codigo <> 0 then
    begin
      pUsuario.Codigo := Codigo;
      // Escreve a configuração padrão do usuário.
      fmPrincipal.pLogSistema.Info('Gerando configurações padrões.');
      with fmPrincipal do
      begin
        vSistemaUsuario := cSistema + '.' + EditCadastroNMLOGIN.Text;
        pArquivoConfig.WriteInteger(vSistemaUsuario, cCodigoPaisPadrao, cPaisPadrao);
        pArquivoConfig.WriteBoolean(vSistemaUsuario,cExibirAquisicoesCanceladas, false);
        pArquivoConfig.WriteBoolean(vSistemaUsuario,cExibirImagemMaterial, false);
        pArquivoConfig.WriteBoolean(vSistemaUsuario,cExibirAlertaParcelasExcedeAquisicao, false);
        pArquivoConfig.WriteString(vSistemaUsuario,cFiltroLogin, cNenhumFiltroLogin);
        pArquivoConfig.WriteBoolean(vSistemaUsuario, cIniciarComSistema, false);
        pArquivoConfig.WriteBoolean(vSistemaUsuario, cIniciarMaximizado, true);
        pArquivoConfig.WriteString(vSistemaUsuario, cLocalExportarRelatorios, cLocalPadraoExportarRelatorios);
        pArquivoConfig.WriteBoolean(vSistemaUsuario, cMostrarIconeBandejaSistema, true);
        pArquivoConfig.WriteBoolean(vSistemaUsuario, cPreencheAnoConsultaAquisicao, false);
        pArquivoConfig.WriteBoolean(vSistemaUsuario, cPreencheUsuarioConsultaAquisicao, false);
        pArquivoConfig.WriteBoolean(vSistemaUsuario, cSalvarLoginSecao, false);
        pArquivoConfig.WriteBoolean(vSistemaUsuario, cSempreEnviaEmailCadastroAquisicao, true);
        pArquivoConfig.WriteBoolean(vSistemaUsuario, cSempreEnviaEmailCadastroDespesa, true);
        pArquivoConfig.WriteBoolean(vSistemaUsuario, cSempreEnviaEmailCadastroReceita, true);
        pArquivoConfig.WriteBoolean(vSistemaUsuario, cSempreEnviaEmailCadastroInvestimento, true);
        pArquivoConfig.WriteBoolean(vSistemaUsuario, cSenhaComplexa, false);
        //pArquivoConfig.WriteInteger(vSistemaUsuario, cTamanhoPainelPendencias, cTamanhoPadraoPainelPendencias);
        pArquivoConfig.WriteExtended(vSistemaUsuario, cSaldoMinimoMensal, 0);
        pArquivoConfig.WriteExtended(vSistemaUsuario, cValorLimiteDespesaMensal, 0);
        pArquivoConfig.WriteExtended(vSistemaUsuario, cSaldoMetaMensal, 0);
      end;

      fmPrincipal.apresentaResultadoCadastro('Cadastro incluído com sucesso.');

      // Formata o e-mail de confirmação do cadastro.
      vEmail := '<div align="left">'+
                'E-mail de confirmação de cadastro de usuário.'+
                '</div>'+
                '<br>'+
                '<div align="left">'+
                '<b>Nome:</b> '+Trim(EditCadastroNMUSUARIO.Text)+'<br>'+
                '<b>Login:</b> '+Trim(EditCadastroNMLOGIN.Text)+'<br>'+
                '<b>E-mail:</b> '+Trim(EditCadastroDEEMAIL.Text)+'<br>'+
                '<b>Perfil:</b> '+EditCadastroNMPERFIL.Text+'<br>';
      if not CheckBoxCadastroFLATIVO.Checked then
        vEmail := vEmail + '<b>Observação:</b> Usuário está inativo.<br>';
      vEmail := vEmail +
                '<br>'+
                '<br>'+
                'Sua senha temporária, válida por 5 dias úteis, é: "'+vSenha+'".'+
                '<br>'+
                'Acesse o sistema utilizando seu usuário e senha informados e realize a troca de sua senha temporária.'+
                '</div>';
      fmPrincipal.enviaEmail('Cadastro de Usuário',
                             EditCadastroDEEMAIL.Text,
                             fmPrincipal.EmailUsuarioLogado,
                             EmptyStr,
                             vEmail);
    end
    else
      fmPrincipal.apresentaResultadoCadastro('Não foi possível incluir o cadastro.');

    EditCadastroCDUSUARIO.Text := IntToStr(Codigo);
  except
    on E: exception do
      raise;
  end;
end;

procedure TfmCadUsuario.BitBtnNovoClick(Sender: TObject);
begin
  pOpcao := 'I';
  desabilitaBotoes;
  novoCadastro;
  BitBtnSalvar.Enabled := true;
  BitBtnRestaurar.Enabled := true;
end;

procedure TfmCadUsuario.ButtonNovoPerfilClick(Sender: TObject);
var
  vcdPerfil: integer;
begin
  vcdPerfil := 0;
  try
    fmCadPerfil := TfmCadPerfil.Create(Self);
    with fmCadPerfil do
    begin
      try
        Tag := 1;
        ShowModal;

        vcdPerfil := fmCadPerfil.Codigo;
      except
        on E: exception do
          raise exception.Create('Não foi possível abrir a tela de Cadastro de Perfil.'+#13#10+E.Message);
      end;
    end;
  finally
    // Verifica se foi cadastrado um perfil.
    if vcdPerfil > 0 then
    begin
      EditCadastroCDPERFIL.Text := IntToStr(vcdPerfil);
      EditCadastroCDPERFILExit(EditCadastroCDPERFIL);
    end;
  end;
end;

procedure TfmCadUsuario.ButtonPesquisarCEPClick(Sender: TObject);
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
              fmCadUsuario.ActiveControl := EditCadastroNUENDERECO;
            end;
      end;
    end;
  finally
    EditCadastroNUCEP.OnExit := EditCadastroNUCEPExit;
    EditCadastroNUCEP.OnChange := EditCadastroNUCEPChange;
  end;
end;

procedure TfmCadUsuario.BitBtnSalvarClick(Sender: TObject);
var
  vMensagem: string;
begin
  desabilitaBotoes;

  // Validações.
  vMensagem := EmptyStr;
  if AnsiCompareText(EditCadastroNMUSUARIO.Text,EmptyStr) = 0 then
    vMensagem := vMensagem + #13#10'- O campo Nome completo é requerido.';
  if AnsiCompareText(EditCadastroNMLOGIN.Text,EmptyStr) = 0 then
    vMensagem := vMensagem + #13#10'- O campo Login é requerido.';
  if AnsiCompareText(EditCadastroDEEMAIL.Text,EmptyStr) = 0 then
    vMensagem := vMensagem + #13#10'- O campo E-mail é requerido.';
  if AnsiCompareText(EditCadastroCDPERFIL.Text,EmptyStr) = 0 then
    vMensagem := vMensagem + #13#10'- O campo Perfil é requerido.';
  if AnsiCompareText(EditCadastroDEEMAIL.Text,EmptyStr) <> 0 then
    if not fmPrincipal.fnGeral.verificaEmail(EditCadastroDEEMAIL.Text) then
      vMensagem := vMensagem + #13#10'- O campo E-mail é inconsistente.';

  // Se o usuário está editando o seu próprio Perfil, não deixa torná-lo inativo.
  if Opcao = 'A' then
    if fmPrincipal.CodigoUsuarioLogado = StrToIntDef(EditCadastroCDUSUARIO.Text,0) then
      if not CheckBoxCadastroFLATIVO.Checked then
        vMensagem := vMensagem + #13#10'- Não é possível inativar o Usuário que está logado.';

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
    begin
      pAtualizarUsuario := true;
      BitBtnFecharClick(Sender);
    end;

    // Atualiza a Grid.
    MenuItemAtualizarTabelaClick(Sender);

    if not fmPrincipal.Administrador then
    begin
      Codigo := fmPrincipal.CodigoUsuarioLogado;
      editaCadastro;
      Opcao := 'A';
      BitBtnSalvar.Enabled := true;
    end
    else
      BitBtnNovoClick(Sender);

    // Edita o cadastro realizado.
    editaCadastro;
    habilitaBotoes;
    Opcao := 'A';
    ActiveControl := EditCadastroNMUSUARIO;
  except
    on E: Exception do
    begin
      fmPrincipal.apresentaResultadoCadastro(E.Message);
      fmPrincipal.manipulaExcecoes(Sender,E);
    end;
  end;
end;

procedure TfmCadUsuario.ButtonSalvarImagemClick(Sender: TObject);
var
  vStatus: integer;
  vcsImagem, vlcImagem, vnmImagem: string;
begin
  try
    if pimImagem <> EmptyStr then
    begin
      // Obtem o checksum do arquivo.
      vcsImagem := fmPrincipal.fnGeral.obtemCheckSumArquivo(pimImagem);

      // Trata uma imagem já salva.
      pbolExclusaoInvisivel := true;
      if CodigoDocumento <> 0 then
        ButtonRemoverImagemClick(Sender);
      pbolExclusaoInvisivel := false;

      // Transfere para um diretório temporário, para salvar em banco de dados.
      vlcImagem := fmPrincipal.fnGeral.obtemDiretorioTemporario('random');
      vnmImagem := 'img.' + EditCadastroNMLOGIN.Text + '.' + ExtractFileName(pimImagem);
      fmPrincipal.fnGeral.transfereArquivo(pimImagem, vlcImagem, vnmImagem);

      // Insere o documento no banco de dados.
      pDocumento.Nome := vnmImagem;
      pDocumento.Descricao := 'Imagem Usuário ' + EditCadastroNMLOGIN.Text;
      pDocumento.Tipo := 'I'; // Padrão para Imagem.
      pDocumento.Documento := vlcImagem + vnmImagem;
      pDocumento.Checksum := vcsImagem;
      CodigoDocumento := pDocumento.insere;

      if CodigoDocumento = 0 then
        raise exception.Create('Não foi possível incluir a Imagem.');

      pUsuario.Imagem := CodigoDocumento;
      vStatus := pUsuario.atualizaImagemUsuario;

      if vStatus = 0 then
      begin
        // Se não puder associar, exclui a imagem cadastrada.
        pDocumento.Codigo := CodigoDocumento;
        pDocumento.exclui;
        raise exception.Create('Não foi possível associar a imagem ao usuário.');
      end;
    end;

    fmPrincipal.apresentaResultadoCadastro('Imagem associada ao usuário com sucesso.');

    ButtonRemoverImagem.Enabled := true;

    // Se for o próprio usuário que está logado, atualiza sua imagem.
    if fmPrincipal.CodigoUsuarioLogado = Codigo then
    begin
      fmPrincipal.CodigoImagemUsuarioLogado := CodigoDocumento;
      fmPrincipal.exibeImagemUsuario(Codigo);
    end;
  except
    on E: exception do
    begin
      fmPrincipal.apresentaResultadoCadastro(E.Message);
      fmPrincipal.manipulaExcecoes(Sender,E);
    end;
  end;
end;

procedure TfmCadUsuario.carregaImagensBotoes;
begin
  EditCadastroNMPERFIL.Button.Glyph.Assign(fmPrincipal.fnGeral.obtemImagemPesquisa);

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

  ButtonLimparPerfil.Picture.LoadFromFile(fmPrincipal.LocalIcones + 'erase-e-16.png');
  ButtonLimparPerfil.HotPicture.LoadFromFile(fmPrincipal.LocalIcones + 'erase-h-16.png');
  ButtonLimparPerfil.DisabledPicture.LoadFromFile(fmPrincipal.LocalIcones + 'erase-d-16.png');
  ButtonNovoPerfil.Picture.LoadFromFile(fmPrincipal.LocalIcones + 'new-e-16.png');
  ButtonNovoPerfil.HotPicture.LoadFromFile(fmPrincipal.LocalIcones + 'new-h-16.png');
  ButtonNovoPerfil.DisabledPicture.LoadFromFile(fmPrincipal.LocalIcones + 'new-d-16.png');
  ButtonPesquisarCEP.Picture.LoadFromFile(fmPrincipal.LocalIcones + 'search-e-16.png');
  ButtonPesquisarCEP.HotPicture.LoadFromFile(fmPrincipal.LocalIcones + 'search-h-16.png');
  ButtonPesquisarCEP.DisabledPicture.LoadFromFile(fmPrincipal.LocalIcones + 'search-d-16.png');
  ButtonInfoTelefones.Picture.LoadFromFile(fmPrincipal.LocalIcones + 'info-e-16.png');
  ButtonInfoTelefones.HotPicture.LoadFromFile(fmPrincipal.LocalIcones + 'info-h-16.png');
  ButtonInfoTelefones.DisabledPicture.LoadFromFile(fmPrincipal.LocalIcones + 'info-d-16.png');
  ButtonSalvarImagem.Picture.LoadFromFile(fmPrincipal.LocalIcones + 'add-image-e-16.png');
  ButtonSalvarImagem.HotPicture.LoadFromFile(fmPrincipal.LocalIcones + 'add-image-h-16.png');
  ButtonSalvarImagem.DisabledPicture.LoadFromFile(fmPrincipal.LocalIcones + 'add-image-d-16.png');
  ButtonRemoverImagem.Picture.LoadFromFile(fmPrincipal.LocalIcones + 'remove-image-e-16.png');
  ButtonRemoverImagem.HotPicture.LoadFromFile(fmPrincipal.LocalIcones + 'remove-image-h-16.png');
  ButtonRemoverImagem.DisabledPicture.LoadFromFile(fmPrincipal.LocalIcones + 'remove-image-d-16.png');
end;

procedure TfmCadUsuario.EditCadastroNMPERFILClickBtn(Sender: TObject);
var
  i: integer;
  vAux: TStringList;
begin
  vAux := TStringList.Create;
  fmConFiltroPadrao := TfmConFiltroPadrao.Create(Self);
  try
    with fmConFiltroPadrao do
    begin
      try
        setaTitulo('Consulta de Perfis');
        setaConsulta(pPerfil.filtro);
        setaOpcao('R');
        executaFiltro(0,EmptyStr);
        ShowModal;
      finally
        plPerfil.Clear;
        with pResSearch do
          for i := 0 to Count -1 do
            if objResSearch[i].Id = buscaId then
            begin
              plPerfil.Add(objResSearch[i].Codigo);
              EditCadastroCDPERFIL.Text := objResSearch[i].Codigo;
              EditCadastroNMPERFIL.Text := objResSearch[i].Nome1;
            end;
      end;
    end;
  finally
    FreeAndNil(vAux);
    // Valida para qual campo vai se posicionar.
    if plPerfil.Count > 0 then
      ActiveControl := EditCadastroNUCEP
    else
      ActiveControl := EditCadastroNMPERFIL;

    EditCadastroCDPERFIL.Enabled := (plPerfil.Count = 0);
    EditCadastroNMPERFIL.Enabled := (plPerfil.Count = 0);
    ButtonLimparPerfil.Enabled := (plPerfil.Count > 0);
    ButtonNovoPerfil.Enabled := (plPerfil.Count = 0);
  end;
end;

procedure TfmCadUsuario.EditCadastroNMPERFILExit(Sender: TObject);
var
  i: integer;
  vAux: TStringList;
  vQuery: TZQuery;
begin
  // Se não digitou nada, sai sem pesquisar.
  if Length(Trim(EditCadastroNMPERFIL.Text)) = 0 then
    Exit;

  vAux := TStringList.Create;
  try
    vQuery := pPerfil.filtro;
    with vQuery do
    begin
      SQL.Add('WHERE UPPER("NM-Perfil") LIKE :NMPERFIL');
      Params.ParamByName('NMPERFIL').AsString := '%'+AnsiUpperCase(EditCadastroNMPERFIL.Text)+'%';
      dmPrincipal.executaConsulta(vQuery);

      if RecordCount > 1 then
      begin
        fmConFiltroPadrao := TfmConFiltroPadrao.Create(Self);
        with fmConFiltroPadrao do
        begin
          try
            setaTitulo('Consulta de Perfis');
            setaConsulta(pPerfil.filtro);
            setaOpcao('R');
            executaFiltro(2,EditCadastroNMPERFIL.Text);
            ShowModal;
          finally
            plPerfil.Clear;
            with pResSearch do
              for i := 0 to Count -1 do
                if objResSearch[i].Id = buscaId then
                begin
                  plPerfil.Add(objResSearch[i].Codigo);
                  EditCadastroCDPERFIL.Text := objResSearch[i].Codigo;
                  EditCadastroNMPERFIL.Text := objResSearch[i].Nome1;
                end;
          end;
        end;
      end
      else
        if not Eof then
        begin
          plPerfil.Clear;
          plPerfil.Add(Fields.Fields[0].AsString);
          EditCadastroCDPERFIL.Text := Fields.Fields[0].AsString;
          EditCadastroNMPERFIL.Text := Fields.Fields[1].AsString;
        end
        else
        begin
          EditCadastroNMPERFIL.Clear;
          fmPrincipal.apresentaResultadoCadastro('Nenhum registro encontrado.');
        end;
      Active := false;
    end;
  finally
    FreeAndNil(vQuery);

    EditCadastroCDPERFIL.Enabled := (plPerfil.Count = 0);
    EditCadastroNMPERFIL.Enabled := (plPerfil.Count = 0);
    ButtonLimparPerfil.Enabled := (plPerfil.Count > 0);
    ButtonNovoPerfil.Enabled := (plPerfil.Count = 0);

    // Valida para qual campo vai se posicionar.
    if plPerfil.Count > 0 then
      ActiveControl := EditCadastroNUCEP
    else
      ActiveControl := EditCadastroNMPERFIL;

    FreeAndNil(vAux);
  end;
end;

procedure TfmCadUsuario.DBAdvGridGeralDblClickCell(Sender: TObject; ARow,
  ACol: Integer);
begin
  if ARow > 0 then
    MenuItemEditarRegistroClick(MenuItemEditarRegistro);
end;

procedure TfmCadUsuario.DBAdvGridGeralFilterSelect(Sender: TObject; Column,
  ItemIndex: Integer; FriendlyName: string; var FilterCondition: string);
begin
  case ItemIndex of
    0: FilterCondition := EmptyStr;
    1: FilterCondition := 'S';
    2: FilterCondition := 'N';
  end;

  DBAdvGridGeral.Cells[Column,0] := FriendlyName;
end;

procedure TfmCadUsuario.desabilitaBotoes;
begin
  BitBtnSalvar.Enabled := false;
  BitBtnExcluir.Enabled := false;
  BitBtnRestaurar.Enabled := false;
  BitBtnNovo.Enabled := false;
  BitBtnRedefinirSenha.Enabled := false;
end;

procedure TfmCadUsuario.editaCadastro;
var
  vCEP, vImagem, vNomeImagem, vDescricaoImagem: string;
  vQuery, vQueryCEP, vQueryImagemUsuario: TZQuery;
begin
  novoCadastro;

  // Estes campos somente são visíveis na edição.
  ImageIMIMAGEM.Visible := true;
  LabelImagem.Visible := true;
  LabelSelecionarImagem.Visible := true;
  ButtonSalvarImagem.Visible := true;
  ButtonRemoverImagem.Visible := true;
  ButtonSalvarImagem.Enabled := false;
  ButtonRemoverImagem.Enabled := false;

  try
    try
      vQuery := pUsuario.lista;
      with vQuery do
      begin
        // Consulta o cadastro do usuário.
        SQL.Add('WHERE cdusuario = :CURRENT_CDUSUARIO');
        Params.ParamByName('CURRENT_CDUSUARIO').AsInteger := Codigo;
        dmPrincipal.executaConsulta(vQuery);

        if not Eof then
        begin
          EditCadastroCDUSUARIO.Text := IntToStr(Codigo);
          EditCadastroNMUSUARIO.Text := Fields.FieldByName('NMUSUARIO').AsString;
          EditCadastroNMLOGIN.Text := Fields.FieldByName('NMLOGIN').AsString;
          EditCadastroDEEMAIL.Text := Fields.FieldByName('DEEMAIL').AsString;
          EditCadastroCDPERFIL.Text := Fields.FieldByName('CDPERFIL').AsString;
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
          EditCadastroNUTELEFONERESIDENCIAL.Text := Fields.FieldByName('NUTELEFONERESIDENCIAL').AsString;
          EditCadastroNUTELEFONECELULAR.Text := Fields.FieldByName('NUTELEFONECELULAR').AsString;
          CheckBoxCadastroFLATIVO.Checked := (Fields.FieldByName('FLATIVO').AsString = 'S');
          // Para mostrar a imagem selecionada.
          CodigoDocumento := 0;
          if not Fields.FieldByName('CDDOCUMENTO').IsNull then
          begin
            try
              CodigoDocumento := Fields.FieldByName('CDDOCUMENTO').AsInteger;
              vQueryImagemUsuario := pDocumento.lista;
              with vQueryImagemUsuario do
              begin
                SQL.Add('WHERE cddocumento = :CDDOCUMENTO');
                Params.Items[0].AsInteger := CodigoDocumento;
                dmPrincipal.executaConsulta(vQueryImagemUsuario);

                if not Eof then
                begin
                  // Copia a Imagem para um diretório temporário e a visualiza.
                  vImagem := fmPrincipal.LocalTemporario + Fields.FieldByName('NMDOCUMENTO').AsString;
                  pDocumento.Codigo := Fields.FieldByName('CDDOCUMENTO').AsInteger;
                  if not pDocumento.salvaDocumentoDisco(vImagem) then
                  begin
                    fmPrincipal.pLogSistema.Error('A imagem ' + vImagem +
                                                  ' não pode ser obtida da tabela. A imagem não será apresentada.');
                    Exit;
                  end;
                  vDescricaoImagem := Fields.FieldByName('DEDOCUMENTO').AsString;
                  vNomeImagem := ExtractFileName(vImagem);
                  ImageIMIMAGEM.Picture.LoadFromFile(vImagem);
                  ImageIMIMAGEM.Hint := vDescricaoImagem;
                  ButtonRemoverImagem.Enabled := true;
                end;
              end;
            finally
              FreeAndNil(vQueryImagemUsuario);
            end;
          end;
        end
        else
          raise exception.Create('O cadastro do usuário não foi encontrado.');

        Active := false;
      end;

      EditCadastroCDPERFILExit(EditCadastroCDPERFIL);
      if EditCadastroNUCEP.Tag > 0 then
        EditCadastroNUCEPExit(EditCadastroNUCEP);
    except
      on E: exception do
        raise;
    end;

    ActiveControl := EditCadastroNMUSUARIO;

    // Somente Administradores podem Redefinir a Senha de um Usuário.
    if fmPrincipal.Administrador then
      BitBtnRedefinirSenha.Enabled := true;
    // Somente Administradores podem Alterar o Perfil e o Status do Usuário.
    if not fmPrincipal.Administrador then
    begin
      EditCadastroNMLOGIN.Enabled := false;
      EditCadastroCDPERFIL.Enabled := false;
      EditCadastroNMPERFIL.Enabled := false;
      ButtonLimparPerfil.Enabled := false;
      ButtonNovoPerfil.Enabled := false;
      CheckBoxCadastroFLATIVO.Enabled := false;
    end;
  finally
    vQuery.Active := false;
    FreeAndNil(vQuery);
  end;
end;

procedure TfmCadUsuario.editaColunaGrid(prmIndice: integer; prmNome,
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

procedure TfmCadUsuario.editaCadastroUsuarioLogin;
begin
  Opcao := 'A';
  pUsuario.Codigo := Codigo;
  OfficePageConsulta.TabVisible := false;
  editaCadastro;
  desabilitaBotoes;
  BitBtnSalvar.Enabled := true;
end;

procedure TfmCadUsuario.EditCadastroCDPERFILChange(Sender: TObject);
begin
  fmPrincipal.fnGeral.verificaCodigo(Sender);
end;

procedure TfmCadUsuario.EditCadastroCDPERFILExit(Sender: TObject);
var
  i: integer;
  vAux: TStringList;
  vQuery: TZQuery;
begin
  // Se não digitou nada, sai sem pesquisar.
  if Length(Trim(EditCadastroCDPERFIL.Text)) = 0 then
    Exit;

  try
    vAux := TStringList.Create;
    vQuery := pPerfil.filtro;
    with vQuery do
    begin
      SQL.Add('WHERE "NU-Código" = :CDPERFIL');
      Params.ParamByName('CDPERFIL').AsInteger := StrToInt(EditCadastroCDPERFIL.Text);
      dmPrincipal.executaConsulta(vQuery);

      if RecordCount > 1 then
      begin
        fmConFiltroPadrao := TfmConFiltroPadrao.Create(Self);
        with fmConFiltroPadrao do
        begin
          try
            setaTitulo('Consulta de Perfis');
            setaConsulta(pPerfil.filtro);
            setaOpcao('R');
            executaFiltro(1,EditCadastroCDPERFIL.Text);
            ShowModal;
          finally
            plPerfil.Clear;
            with pResSearch do
              for i := 0 to Count -1 do
                if objResSearch[i].Id = buscaId then
                begin
                  plPerfil.Add(objResSearch[i].Codigo);
                  EditCadastroCDPERFIL.Text := objResSearch[i].Codigo;
                  EditCadastroNMPERFIL.Text := objResSearch[i].Nome1;
                end;
          end;
        end;
      end
      else
        if not Eof then
        begin
          plPerfil.Clear;
          plPerfil.Add(Fields.Fields[0].AsString);
          EditCadastroCDPERFIL.Text := Fields.Fields[0].AsString;
          EditCadastroNMPERFIL.Text := Fields.Fields[1].AsString;
        end
        else
        begin
          EditCadastroCDPERFIL.Clear;
          fmPrincipal.apresentaResultadoCadastro('Nenhum registro encontrado.');
        end;
      Active := false;
    end;
  finally
    FreeAndNil(vAux);
    FreeAndNil(vQuery);

    // Valida para qual campo vai se posicionar.
    if plPerfil.Count > 0 then
      ActiveControl := EditCadastroNUCEP
    else
      ActiveControl := EditCadastroCDPERFIL;

    EditCadastroCDPERFIL.Enabled := (plPerfil.Count = 0);
    EditCadastroNMPERFIL.Enabled := (plPerfil.Count = 0);
    ButtonLimparPerfil.Enabled := (plPerfil.Count > 0);
    ButtonNovoPerfil.Enabled := (plPerfil.Count = 0);
  end;
end;

procedure TfmCadUsuario.EditCadastroNMLOGINChange(Sender: TObject);
var
  vChar: char;
begin
  LabelDisponivel.Visible := false;
  with EditCadastroNMLOGIN do
    if Length(Text) > 0 then
    begin
      OnChange := nil;
      vChar := Text[Length(Text)];
      // Verifica se o caractere digitado é válido.
      fmPrincipal.fnGeral.verificaLogin(vChar);
      if vChar = #0 then
        Text := Copy(Text,1,Length(Text)-1);
      OnChange := EditCadastroNMLOGINChange;
      SelStart := Length(Text);
    end;
end;

procedure TfmCadUsuario.EditCadastroNMLOGINExit(Sender: TObject);
var
  vQuery: TZQuery;
begin
  // Se não digitou nada, não pesquisa o login.
  if Length(Trim(EditCadastroNMLOGIN.Text)) = 0 then
    Exit;
  // Se não está habilitado, não precisa validar.
  if EditCadastroNMLOGIN.Enabled = false then
    Exit;

  try
    try
      vQuery := pUsuario.lista;
      with vQuery do
      begin
        SQL.Add('WHERE nmlogin = :NMLOGIN');
        // Para edição verifica se o Login não é do próprio usuário.
        if Opcao = 'A' then
        begin
          SQL.Add('  AND cdusuario != :CDUSUARIO');
          Params.ParamByName('CDUSUARIO').AsInteger := StrToInt(EditCadastroCDUSUARIO.Text);
        end;
        Params.ParamByName('NMLOGIN').AsString := EditCadastroNMLOGIN.Text;
        dmPrincipal.executaConsulta(vQuery);

        if not Eof then
          MessageBox(fmPrincipal.Handle,
                     PWideChar('O Login informado já consta cadastrado no Sistema.'+#13+#10+
                               'Favor informar um novo Login.'),
                     cTituloMensagemAlerta,
                     MB_OK or MB_ICONWARNING)
        else
          if EditCadastroNMLOGIN.Enabled then
            LabelDisponivel.Visible := true;
      end;
    except
      on E: Exception do
        fmPrincipal.manipulaExcecoes(Sender,E);
    end;
  finally
    vQuery.Active := false;
    FreeAndNil(vQuery);
  end;
end;

procedure TfmCadUsuario.EditCadastroNUTELEFONECELULARChange(Sender: TObject);
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

procedure TfmCadUsuario.EditCadastroNUTELEFONECELULARExit(Sender: TObject);
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

procedure TfmCadUsuario.EditCadastroNUTELEFONECELULARKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  pExcluindoCaractere := ((Key = VK_BACK) or (Key = VK_DELETE));
end;

procedure TfmCadUsuario.EditCadastroNUTELEFONERESIDENCIALChange(
  Sender: TObject);
var
  vChar: char;
begin
  if pExcluindoCaractere then
    Exit;

  with EditCadastroNUTELEFONERESIDENCIAL do
    if Length(Text) > 0 then
    begin
      OnChange := nil;
      vChar := Text[Length(Text)];
      // Verifica se o caractere digitado é válido.
      fmPrincipal.fnGeral.verificaTelefone(vChar);
      if vChar = #0 then
        Text := Copy(Text,1,Length(Text)-1);
      OnChange := EditCadastroNUTELEFONERESIDENCIALChange;
      SelStart := Length(Text);
    end;
end;

procedure TfmCadUsuario.EditCadastroNUTELEFONERESIDENCIALExit(Sender: TObject);
var
  vnufTelefone: string;
begin
  if Length(EditCadastroNUTELEFONERESIDENCIAL.Text) = 0 then
    Exit;

  vnufTelefone := EditCadastroNUTELEFONERESIDENCIAL.Text;
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
    EditCadastroNUTELEFONERESIDENCIAL.Text := vnufTelefone;
  end;
end;

procedure TfmCadUsuario.EditCadastroNUTELEFONERESIDENCIALKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  pExcluindoCaractere := ((Key = VK_BACK) or (Key = VK_DELETE));
end;

procedure TfmCadUsuario.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  QueryGeral.Close;

  Action := caFree;
end;

procedure TfmCadUsuario.FormCreate(Sender: TObject);
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

    plPerfil := TStringList.Create;
    pUsuario := TUsuario.Create;
    pDocumento := TDocumento.Create;
    pPerfil := TPerfil.Create;
    pInformacaoGeografica := TInformacaoGeografica.Create;
    pCEP := TCEP.Create;

    // Variável responsável por informar se a tela inicial precisa ser recarregada.
    pAtualizarUsuario := false;

    OfficePagerCentral.ActivePageIndex := 1;
    pExcluindoCaractere := false;

    Ordenacao := '|"Código":"N":"Asc."|;|"Usuário":"S":"Asc."|;|"Login":"S":"Asc."|;|"Ativo":"N":"Asc."|;|"Perfil":"N":"Asc."|;|"Admin.":"N":"Asc."|';

    // Monta a consulta que carregará os dados da Grid.
    with QueryGeral do
    begin
      SQL := pUsuario.lista.SQL;
      SQL.Strings[0] := 'SELECT usuario.cdusuario,usuario.nmusuario,usuario.nmlogin,usuario.flativo,perfil.nmperfil,perfil.fladministrador';
      SQL.Add('INNER JOIN ' + cSchema + '.perfil ON usuario.cdperfil = perfil.cdperfil');
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

    // Apenas Administradores podem excluir ou redefinir a senha de um usuário.
    if fmPrincipal.Administrador = false then
    begin
      BitBtnRedefinirSenha.Enabled := false;
      BitBtnExcluir.Enabled := false;
      // A página de consulta só é disponível para o Administrador.
      OfficePageConsulta.TabVisible := false;
    end;

    if not fmPrincipal.Administrador then
    begin
      Codigo := fmPrincipal.CodigoUsuarioLogado;
      editaCadastro;
      Opcao := 'A';
    end;

    FormResize(Sender);
  except
    on E: Exception do
    begin
      fmPrincipal.manipulaExcecoes(Sender,E);
      Close;
    end;
  end;
end;

procedure TfmCadUsuario.FormDestroy(Sender: TObject);
begin
  FreeAndNil(plPerfil);
  FreeAndNil(pUsuario);
  FreeAndNil(pDocumento);
  FreeAndNil(pPerfil);
  FreeAndNil(pInformacaoGeografica);
  FreeAndNil(pCEP);
end;

procedure TfmCadUsuario.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Exit;
end;

procedure TfmCadUsuario.FormResize(Sender: TObject);
begin
  EspacamentoInicial := fmPrincipal.EspacamentoInicialBotao;
  EspacamentoFinal := fmPrincipal.EspacamentoFinalBotao;
  EspacamentoEntre := fmPrincipal.EspacamentoEntreBotoes;

  BitBtnFechar.Left := PanelBotoes.Width - BitBtnFechar.Width - EspacamentoFinal;
  BitBtnRedefinirSenha.Left := BitBtnFechar.Left - BitBtnRedefinirSenha.Width - EspacamentoEntre;
  BitBtnNovo.Left := BitBtnRedefinirSenha.Left - BitBtnNovo.Width - EspacamentoEntre;
  BitBtnRestaurar.Left := BitBtnNovo.Left - BitBtnRestaurar.Width - EspacamentoEntre;
  BitBtnExcluir.Left := BitBtnRestaurar.Left - BitBtnExcluir.Width - EspacamentoEntre;
  BitBtnSalvar.Left := BitBtnExcluir.Left - BitBtnSalvar.Width - EspacamentoEntre;
end;

procedure TfmCadUsuario.habilitaBotoes;
begin
  BitBtnSalvar.Enabled := true;
  BitBtnRestaurar.Enabled := true;
  BitBtnNovo.Enabled := true;
  if fmPrincipal.Administrador then
  begin
    BitBtnExcluir.Enabled := true;
    BitBtnRedefinirSenha.Enabled := true;
  end;
end;

procedure TfmCadUsuario.LabelSelecionarImagemClick(Sender: TObject);
begin
  try
    with OpenPictureDialog do
    begin
      if DirectoryExists('%USERPROFILE%\Pictures\') then
        InitialDir := '%USERPROFILE%\Pictures\'
      else
        InitialDir := '%USERPROFILE%\';
      Filter := 'Todos (*.png;*.jpeg;*.jpg;*.bmp;*.tif;*.tiff)|*.png;*.jpeg;*.jpg;*.bmp;*.tif;*.tiff|';
      Filter := Filter + 'Imagens PNG (*.png)|*.png|';
      Filter := Filter + 'Imagens JPEG (*.jpeg;*.jpg)|*.jpeg;*.jpg|';
      Filter := Filter + 'Bitmaps (*.bmp)|*.bmp|';
      Filter := Filter + 'Imagens TIFF (*.tiff;*.tif)|*.tiff;*.tif';
      FilterIndex := 1;
      Title := 'Abrir Imagem';
      if Execute(Handle) then
      begin
        pimImagem := FileName;
        ImageIMIMAGEM.Picture.LoadFromFile(FileName);
        ButtonSalvarImagem.Enabled := true;
      end;
    end;
  except
    on E: Exception do
      fmPrincipal.manipulaExcecoes(Sender,E);
  end;
end;

procedure TfmCadUsuario.ButtonInfoTelefonesClick(Sender: TObject);
var
  vTexto: string;
begin
  vTexto := 'A formatação do número de telefone é automática, '+
            'por isto, não deve-se digitar parênteses e traços.'+#13#10+
            'Deve-se adotar as seguintes regras ao informar o número do telefone:'+#13#10+
            '- Para número de telefone fixo:'+#13#10+
            '  '+#187+' Código de Área + Número de telefone, sem código internacional.'+#13#10+
            '- Para número de telefone celular:'+#13#10+
            '  '+#187+' Código de Área + Número de telefone, sem código internacional.';
  BalloonHintInfoTelefones.ActivateHint(ButtonInfoTelefones,
                                        vTexto,
                                        'Informação sobre Números de Telefone.',
                                        60000);
end;

procedure TfmCadUsuario.EditCadastroNUCEPChange(Sender: TObject);
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

procedure TfmCadUsuario.EditCadastroNUCEPExit(Sender: TObject);
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
          MemoCadastroNMENDERECO.Text := Fields.FieldByName('SGLOGRADOURO').AsString + ' ' +
                                         Fields.FieldByName('NMENDERECO').AsString + ' - ' +
                                         Fields.FieldByName('NMBAIRRO').AsString + ' - ' +
                                         Fields.FieldByName('NMLOCALIDADE').AsString + ' - ' +
                                         Fields.FieldByName('NMUF').AsString + ' - ' +
                                         Fields.FieldByName('NMPAIS').AsString;
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

procedure TfmCadUsuario.EditCadastroNUCEPKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  pExcluindoCaractere := ((Key = VK_BACK) or (Key = VK_DELETE));
end;

procedure TfmCadUsuario.MenuItemAtualizarTabelaClick(Sender: TObject);
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
      editaColunaGrid(1,'CDUSUARIO','Código',edNone,Classes.taRightJustify,40,true);
      editaColunaGrid(2,'NMUSUARIO','Usuário',edNone,Classes.taLeftJustify,300,true);
      editaColunaGrid(3,'NMLOGIN','Login',edNone,Classes.taLeftJustify,200,true);
      editaColunaGrid(4,'FLATIVO','Ativo',edCheckBox,Classes.taCenter,40,true);
      editaColunaGrid(5,'NMPERFIL','Perfil',edNone,Classes.taLeftJustify,200,true);
      editaColunaGrid(6,'FLADMINISTRADOR','Admin.',edCheckBox,Classes.taCenter,40,true);
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

procedure TfmCadUsuario.MenuItemEditarRegistroClick(Sender: TObject);
begin
  Opcao := 'A';
  with DBAdvGridGeral do
    Codigo := ColumnByName['CDUSUARIO'].Ints[Row];
  pUsuario.Codigo := Codigo;
  editaCadastro;
  habilitaBotoes;

  ActiveControl := EditCadastroNMUSUARIO;
end;

procedure TfmCadUsuario.MenuItemVisualizarFiltroClick(Sender: TObject);
begin
  GridFindDialogColumnGrid.Execute;
end;

procedure TfmCadUsuario.novoCadastro;
var
  vImagem: string;
begin
  OfficePagerCentral.ActivePageIndex := 1;

  EditCadastroCDUSUARIO.Clear;
  EditCadastroNMUSUARIO.Clear;
  EditCadastroNMLOGIN.Clear;
  EditCadastroDEEMAIL.Clear;
  EditCadastroNUCEP.Tag := 0;
  EditCadastroNUCEP.Clear;
  MemoCadastroNMENDERECO.Clear;
  EditCadastroNUENDERECO.Clear;
  EditCadastroNUTELEFONERESIDENCIAL.Clear;
  EditCadastroNUTELEFONECELULAR.Clear;

  ButtonLimparPerfilClick(ButtonLimparPerfil);
  BitBtnRedefinirSenha.Enabled := false;

  LabelDisponivel.Visible := false;
  CheckBoxCadastroFLATIVO.Checked := true;

  ImageIMIMAGEM.Visible := false;
  LabelImagem.Visible := false;
  LabelSelecionarImagem.Visible := false;
  ButtonSalvarImagem.Visible := false;
  ButtonRemoverImagem.Visible := false;
  ButtonSalvarImagem.Enabled := false;
  ButtonRemoverImagem.Enabled := false;
  vImagem := fmPrincipal.LocalAplicacao + fmPrincipal.LocalImagemPadraoUsuario;
  ImageIMIMAGEM.Picture.LoadFromFile(vImagem);

  EditCadastroNMLOGIN.Enabled := (Opcao = 'I');

  ActiveControl := EditCadastroNMUSUARIO;
end;

procedure TfmCadUsuario.OfficePageCadastroShow(Sender: TObject);
begin
  ActiveControl := EditCadastroNMUSUARIO;
end;

procedure TfmCadUsuario.ButtonExportarHTMLClick(Sender: TObject);
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

procedure TfmCadUsuario.ButtonExportarPlanilhaClick(Sender: TObject);
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

procedure TfmCadUsuario.ButtonImprimirRelatorioClick(Sender: TObject);
begin
  try
    QueryRelUsuario.SQL := pUsuario.relatorio.SQL;
    dmPrincipal.executaConsulta(QueryRelUsuario);
    with fmPrincipal.SystemRelatorio do
    begin
      DefaultDest := rdPreview;
      SystemSetups := SystemSetups - [ssAllowSetup];
      DoNativeOutput := false;
    end;
    with ProjectRelUsuario do
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

procedure TfmCadUsuario.ButtonOrdenarRegistrosClick(Sender: TObject);
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

function TfmCadUsuario.validaExclusao: boolean;
begin
  Result := true;
end;

end.
