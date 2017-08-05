unit unCadFamilia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, Grids, AdvObj, BaseGrid, AdvGrid, AdvCGrid, AsgFindDialog, ComCtrls,
  Menus, ImgList, ToolWin, MaskUtils, DBAdvGrid, RpCon, RpConDS, RpBase,
  RpSystem, RpDefine, RpRave, RpRender, RpRenderPDF, ShellAPI, Mask, StrUtils,
  Winapi.CommCtrl, AdvAppStyler, AdvMenus, AdvGlowButton, AdvPanel, AdvEdit,
  AdvOfficeButtons, AdvGroupBox, AdvEdBtn, PlannerDatePicker, AdvCheckTreeView,
  TVHTMLExport, UnAplExportaXLS, AdvToolBar, AdvOfficePager, unFamilia,
  unUsuario;

type
  TfmCadFamilia = class(TForm)
    LabelCodigo: TLabel;
    LabelFamilia: TLabel;
    LabelFamiliaPai: TLabel;
    LabelUsuario: TLabel;
    ProjectRelFamilia: TRvProject;
    DataSetConnectionRelFamilia: TRvDataSetConnection;
    QueryRelFamilia: TZQuery;
    FormStyler: TAdvFormStyler;
    PopupMenuTreeView: TAdvPopupMenu;
    MenuItemCadastrarFamilia: TMenuItem;
    MenuItemCadastrarSubFamilia: TMenuItem;
    MenuItemAlterarFamilia: TMenuItem;
    MenuItemAtualizarTreeView: TMenuItem;
    MenuItemEspaco1: TMenuItem;
    MenuItemVisualizarFiltro: TMenuItem;
    PopupMenuBotao: TAdvPopupMenu;
    MenuItemCadastrarFamilia2: TMenuItem;
    MenuItemCadastrarSubFamilia2: TMenuItem;
    PanelBotoes: TAdvPanel;
    BitBtnFechar: TAdvGlowButton;
    BitBtnSalvar: TAdvGlowButton;
    BitBtnExcluir: TAdvGlowButton;
    BitBtnRestaurar: TAdvGlowButton;
    EditCadastroCDFAMILIA: TAdvEdit;
    EditCadastroDEFAMILIA: TAdvEdit;
    EditCadastroCDFAMILIAPAI: TAdvEdit;
    CheckBoxCadastroFLATIVO: TAdvOfficeCheckBox;
    EditCadastroDEFAMILIAPAI: TAdvEditBtn;
    TreeViewGeral: TAdvCheckTreeView;
    OfficePagerCentral: TAdvOfficePager;
    OfficePageConsulta: TAdvOfficePage;
    PanelTabela: TAdvPanel;
    DockPaneOpcoes: TAdvDockPanel;
    ToolBarOpcoes: TAdvToolBar;
    AdvToolBarSeparator1: TAdvToolBarSeparator;
    ButtonAlterarFamilia: TAdvGlowButton;
    ButtonExpandirTodos: TAdvGlowButton;
    ButtonAtualizarTabela: TAdvGlowButton;
    ButtonImprimirRelatorio: TAdvGlowButton;
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
    AdvToolBarSeparator2: TAdvToolBarSeparator;
    MenuButtonCadastrarFamilia: TAdvGlowMenuButton;
    ButtonContrairTodos: TAdvGlowButton;
    AdvToolBarSeparator3: TAdvToolBarSeparator;
    EditCadastroCDUSUARIO: TAdvEdit;
    EditCadastroNMLOGIN: TAdvEdit;
    EditCadastroNMUSUARIO: TAdvEditBtn;
    LabelDataCadastro: TLabel;
    DatePickerCadastroDTCADASTRO: TPlannerDatePicker;
    LabelDataUltimaAtualizacao: TLabel;
    DatePickerCadastroDTULTATUALIZACAO: TPlannerDatePicker;
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtnFecharClick(Sender: TObject);
    procedure BitBtnSalvarClick(Sender: TObject);
    procedure BitBtnExcluirClick(Sender: TObject);
    procedure MenuItemAlterarFamiliaClick(Sender: TObject);
    procedure MenuItemAtualizarTreeViewClick(Sender: TObject);
    procedure ButtonExportarHTMLClick(Sender: TObject);
    procedure BitBtnRestaurarClick(Sender: TObject);
    procedure ButtonImprimirRelatorioClick(Sender: TObject);
    procedure MenuItemCadastrarFamiliaClick(Sender: TObject);
    procedure MenuItemCadastrarSubFamiliaClick(Sender: TObject);
    procedure ButtonExpandirTodosClick(Sender: TObject);
    procedure ButtonContrairTodosClick(Sender: TObject);
    procedure OfficePageCadastroShow(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    pId: TGUID;
    pOpcao, pTipoInclusao: Char;
    pCodigo: integer;
    pEspacamentoInicial, pEspacamentoFinal, pEspacamentoEntre,
    pTamanhoMascara: integer;
    pMascaraFamiliaPai, pMascaraFamilia: string;
    pFamilia: TFamilia;
    pUsuario: TUsuario;
    procedure desabilitaBotoes;
    procedure habilitaBotoes;
    procedure novoCadastro;
    procedure editaCadastro;
    procedure insereCadastro;
    procedure atualizaCadastro;
    procedure consultaCadastro;
    function validaExclusao: boolean;
    procedure carregaImagensBotoes;
    procedure carregaImagensMenu;
    procedure insereFilhosTreeView(var prmNo: TTreeNode; var prmCodigo: integer);
    procedure preencheFamiliaPai(prmcdFamiliaPai: integer);
    property EspacamentoInicial: integer read pEspacamentoInicial write pEspacamentoInicial;
    property EspacamentoEntre: integer read pEspacamentoEntre write pEspacamentoEntre;
    property EspacamentoFinal: integer read pEspacamentoFinal write pEspacamentoFinal;
  public
    { Public declarations }
    pCadastrarPai: integer;
    property Opcao: char read pOpcao write pOpcao;
    property Codigo: integer read pCodigo write pCodigo;
  end;

var
  fmCadFamilia: TfmCadFamilia;

implementation

uses unPrincipal, unConFiltroPadrao, undmPrincipal, undmEstilo;

{$R *.dfm}

procedure TfmCadFamilia.atualizaCadastro;
var
  vRetorno: integer;
begin
  try
    pFamilia.Codigo := StrToInt(EditCadastroCDFAMILIA.Text);
    pFamilia.FamiliaPai := StrToIntDef(EditCadastroCDFAMILIAPAI.Text,0);
    pFamilia.Nome := EditCadastroDEFAMILIA.Text;
    pFamilia.Tipo := 'P';
    if CheckBoxCadastroFLATIVO.Checked then
      pFamilia.Ativo := 'S'
    else
      pFamilia.Ativo := 'N';
    vRetorno := pFamilia.atualiza;

    if vRetorno <> 0 then
      fmPrincipal.apresentaResultadoCadastro('Cadastro atualizado com sucesso.')
    else
      raise Exception.Create('Não foi possível atualizar o cadastro.');
  except
    on E: exception do
      raise;
  end;
end;

procedure TfmCadFamilia.BitBtnRestaurarClick(Sender: TObject);
begin
  desabilitaBotoes;
  //novoCadastro;
  if Opcao = 'I' then
  begin
    EditCadastroDEFAMILIA.Clear;
    CheckBoxCadastroFLATIVO.Checked := true;
    BitBtnSalvar.Enabled := true;
    BitBtnRestaurar.Enabled := true;
  end
  else
  begin
    editaCadastro;
    habilitaBotoes;
  end;
end;

procedure TfmCadFamilia.BitBtnExcluirClick(Sender: TObject);
var
  vRetorno: integer;
  vMensagem: string;
begin
  if EditCadastroCDFAMILIAPAI.Text = EmptyStr then
    vMensagem := 'Confirma a exclusão da família?'#13#10+
                 'Esta é uma família com subfamília(s), excluindo-a sua(s) subfamília(s) também serão excluídas!'
  else
    vMensagem := 'Confirma a exclusão da família?';

  // Valida se realmente o usuário quer realizar a exclusão.
  if MessageBox(fmPrincipal.Handle,
                PWideChar(vMensagem),
                cTituloMensagemConfirmacao,
                MB_YESNO or MB_ICONQUESTION or MB_DEFBUTTON2) = IDNO then
    Exit;
  // Valida se é possível realizar a exclusão.
  if not validaExclusao then
    Exit;

  desabilitaBotoes;
  try
    pFamilia.Codigo := Codigo;
    vRetorno := pFamilia.exclui;

    if vRetorno <> 0 then
      fmPrincipal.apresentaResultadoCadastro('Cadastro excluído com sucesso.')
    else
      raise Exception.Create('Não foi possível excluir o cadastro.');

    // Atualiza a Grid.
    MenuItemAtualizarTreeViewClick(Sender);
    OfficePagerCentral.ActivePageIndex := 0;
    ActiveControl := TreeViewGeral;
  except
    on E: exception do
      fmPrincipal.manipulaExcecoes(Sender,E);
  end;
end;

procedure TfmCadFamilia.BitBtnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfmCadFamilia.insereCadastro;
begin
  try
    pFamilia.Codigo := StrToIntDef(EditCadastroCDFAMILIA.Text,0);
    pFamilia.FamiliaPai := StrToIntDef(EditCadastroCDFAMILIAPAI.Text,0);
    // Trata o nível da família e se o pai foi informado.
    if EditCadastroCDFAMILIAPAI.Text <> EmptyStr then
      pFamilia.Nivel := 2
    else
      pFamilia.Nivel := 1;
    pFamilia.Tipo := 'P';
    pFamilia.Nome := EditCadastroDEFAMILIA.Text;
    if CheckBoxCadastroFLATIVO.Checked then
      pFamilia.Ativo := 'S'
    else
      pFamilia.Ativo := 'N';
    pFamilia.Usuario := StrToInt(EditCadastroCDUSUARIO.Text);
    pFamilia.TipoCadastro := pTipoInclusao;
    pFamilia.TipoMascara := pMascaraFamilia;
    Codigo := pFamilia.insere;

    if Codigo <> 0 then
      fmPrincipal.apresentaResultadoCadastro('Cadastro incluído com sucesso.')
    else
      raise Exception.Create('Não foi possível incluir o cadastro.');

    EditCadastroCDFAMILIA.Text := IntToStr(Codigo);
  except
    on E: exception do
      raise;
  end;
end;

procedure TfmCadFamilia.insereFilhosTreeView(var prmNo: TTreeNode;
  var prmCodigo: integer);
var
  vQuery: TZQuery;
  vNome: string;
  vNo: TTreeNode;
  vAux: extended;
begin
  vQuery := pFamilia.lista;
  try
    try
      with vQuery do
      begin
        // Consulta o cadastro da família para níveis filho.
        SQL.Add('WHERE cdfamiliapai = :CDFAMILIAPAI');
        SQL.Add('ORDER BY cdfamilia ASC');
        Params.ParamByName('CDFAMILIAPAI').AsInteger := TreeViewGeral.Tag;
        dmPrincipal.executaConsulta(vQuery);

        while not Eof do
        begin
          vAux := StrToFloat(AnsiRightStr(Fields.FieldByName('CDFAMILIA').AsString,pTamanhoMascara));
          vNome := FormatFloat(pMascaraFamilia,vAux) + ' - ' + Fields.FieldByName('DEFAMILIA').AsString;
          vNo := TreeViewGeral.Items.AddChild(prmNo,vNome);
          if Fields.FieldByName('FLATIVO').AsString = 'N' then
            vNo.Text := vNo.Text + ' (Inativo)';
          if Fields.FieldByName('CDFAMILIA').AsInteger = prmCodigo then
            TreeViewGeral.Selected := vNo;
          Next;
        end;
      end;
    except
      on E: exception do
        raise;
    end;
  finally
    vQuery.Active := false;
    FreeAndNil(vQuery);
  end;
end;

procedure TfmCadFamilia.BitBtnSalvarClick(Sender: TObject);
var
  vMensagem: string;
begin
  desabilitaBotoes;
  // Validações.
  vMensagem := EmptyStr;
  if AnsiCompareText(EditCadastroDEFAMILIA.Text,EmptyStr) = 0 then
    vMensagem := vMensagem + #13#10'- O campo Família é requerido.';

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
    MenuItemAtualizarTreeViewClick(Sender);

    // Edita o cadastro realizado.
    editaCadastro;
    Opcao := 'A';
    habilitaBotoes;
  except
    on E: Exception do
      fmPrincipal.manipulaExcecoes(Sender,E);
  end;
end;

procedure TfmCadFamilia.carregaImagensBotoes;
begin
  EditCadastroDEFAMILIAPAI.Button.Glyph.Assign(fmPrincipal.fnGeral.obtemImagemPesquisa);
  EditCadastroNMUSUARIO.Button.Glyph.Assign(fmPrincipal.fnGeral.obtemImagemPesquisa);

  ButtonAtualizarTabela.Picture.LoadFromFile(fmPrincipal.LocalIcones + 'refresh-e-16.png');
  ButtonAtualizarTabela.HotPicture.LoadFromFile(fmPrincipal.LocalIcones + 'refresh-h-16.png');
  ButtonAtualizarTabela.DisabledPicture.LoadFromFile(fmPrincipal.LocalIcones + 'refresh-d-16.png');
  ButtonImprimirRelatorio.Picture.LoadFromFile(fmPrincipal.LocalIcones + 'report-e-16.png');
  ButtonImprimirRelatorio.HotPicture.LoadFromFile(fmPrincipal.LocalIcones + 'report-h-16.png');
  ButtonImprimirRelatorio.DisabledPicture.LoadFromFile(fmPrincipal.LocalIcones + 'report-d-16.png');
  ButtonExportarHTML.Picture.LoadFromFile(fmPrincipal.LocalIcones + 'html-e-16.png');
  ButtonExportarHTML.HotPicture.LoadFromFile(fmPrincipal.LocalIcones + 'html-h-16.png');
  ButtonExportarHTML.DisabledPicture.LoadFromFile(fmPrincipal.LocalIcones + 'html-d-16.png');
  ButtonExpandirTodos.Picture.LoadFromFile(fmPrincipal.LocalIcones + 'plus-6-e-16.png');
  ButtonExpandirTodos.HotPicture.LoadFromFile(fmPrincipal.LocalIcones + 'plus-6-h-16.png');
  ButtonExpandirTodos.DisabledPicture.LoadFromFile(fmPrincipal.LocalIcones + 'plus-6-d-16.png');
  ButtonContrairTodos.Picture.LoadFromFile(fmPrincipal.LocalIcones + 'minus-6-e-16.png');
  ButtonContrairTodos.HotPicture.LoadFromFile(fmPrincipal.LocalIcones + 'minus-6-h-16.png');
  ButtonContrairTodos.DisabledPicture.LoadFromFile(fmPrincipal.LocalIcones + 'minus-6-d-16.png');
  MenuButtonCadastrarFamilia.Picture.LoadFromFile(fmPrincipal.LocalIcones + 'new-e-16.png');
  MenuButtonCadastrarFamilia.HotPicture.LoadFromFile(fmPrincipal.LocalIcones + 'new-h-16.png');
  MenuButtonCadastrarFamilia.DisabledPicture.LoadFromFile(fmPrincipal.LocalIcones + 'new-d-16.png');
  ButtonAlterarFamilia.Picture.LoadFromFile(fmPrincipal.LocalIcones + 'edit-e-16.png');
  ButtonAlterarFamilia.HotPicture.LoadFromFile(fmPrincipal.LocalIcones + 'edit-h-16.png');
  ButtonAlterarFamilia.DisabledPicture.LoadFromFile(fmPrincipal.LocalIcones + 'edit-d-16.png');
end;

procedure TfmCadFamilia.carregaImagensMenu;
begin
  PopupMenuTreeView.Images := fmPrincipal.ImageListPopupMenuE;
  PopupMenuTreeView.DisabledImages := fmPrincipal.ImageListPopupMenuD;
  MenuItemAlterarFamilia.ImageIndex := 3;
  MenuItemAtualizarTreeView.ImageIndex := 4;
  MenuItemVisualizarFiltro.ImageIndex := 5;
  MenuItemCadastrarFamilia.ImageIndex := 6;
  MenuItemCadastrarSubFamilia.ImageIndex := 7;

  PopupMenuBotao.Images := fmPrincipal.ImageListPopupMenuE;
  PopupMenuBotao.DisabledImages := fmPrincipal.ImageListPopupMenuD;
  MenuItemCadastrarFamilia2.ImageIndex := 6;
  MenuItemCadastrarSubFamilia2.ImageIndex := 7;
end;

procedure TfmCadFamilia.consultaCadastro;
var
  vCodigo: integer;
  vNo: TTreeNode;
  vNome,vFamilia: string;
  vAux: Extended;
  vQuery: TZQuery;
begin
  vCodigo := Codigo;
  novoCadastro;

  try
    try
      vQuery := pFamilia.lista;
      with vQuery do
      begin
        // Consulta o cadastro da família para níveis pai.
        SQL.Add('WHERE nunivel = 1');
        SQL.Add('ORDER BY cdfamilia ASC');
        dmPrincipal.executaConsulta(vQuery);

        TreeViewGeral.Items.BeginUpdate;
        TreeViewGeral.Items.Clear;

        while not Eof do
        begin
          vFamilia := RightStr(Fields.FieldByName('CDFAMILIA').AsString,pTamanhoMascara);
          vAux := StrToFloat(vFamilia);
          vNome := FormatFloat(pMascaraFamiliaPai,vAux) + ' - ' + Fields.FieldByName('DEFAMILIA').AsString;
          TreeViewGeral.Tag := Fields.FieldByName('CDFAMILIA').AsInteger;
          vNo := TreeViewGeral.Items.Add(nil,vNome);
          if Fields.FieldByName('FLATIVO').AsString = 'N' then
            vNo.Text := vNo.Text + ' (Inativo)';
          if Fields.FieldByName('CDFAMILIA').AsInteger = vCodigo then
            TreeViewGeral.Selected := vNo;
          // Insere os filhos desta família.
          insereFilhosTreeView(vNo, vCodigo);
          Next;
        end;

        with TreeViewGeral do
        begin
          Items.EndUpdate;
          if Items.Count = 1 then
            Items[0].Expand(false);
          LabelTotalRegistros.Caption := 'Total de registros: ' + IntToStr(Items.Count);
        end;
      end;
    except
      on E: exception do
        raise;
    end;
  finally
    vQuery.Active := false;
    FreeAndNil(vQuery);
  end;
end;

procedure TfmCadFamilia.desabilitaBotoes;
begin
  BitBtnSalvar.Enabled := false;
  BitBtnExcluir.Enabled := false;
  BitBtnRestaurar.Enabled := false;
end;

procedure TfmCadFamilia.editaCadastro;
var
  vcdFamilia: string;
  vAux: Extended;
  vQuery, vQuery2: TZQuery;
begin
  novoCadastro;

  with TreeViewGeral.Selected do
  begin
    // Se for um filho, tem que montar o código.
    if Level > 0 then
      vcdFamilia := Trim(Copy(Parent.Text,1,Pos('-',Parent.Text)-1));
    Codigo := StrToInt(vcdFamilia + Trim(Copy(Text,1,Pos('-',Text)-1)));
  end;

  try
    try
      vQuery := pFamilia.lista;
      with vQuery do
      begin
        // Consulta o cadastro da Família.
        SQL.Add('WHERE cdfamilia = :CURRENT_CDFAMILIA');
        Params.ParamByName('CURRENT_CDFAMILIA').AsInteger := Codigo;
        dmPrincipal.executaConsulta(vQuery);

        if not Eof then
        begin
          vAux := Codigo;
          EditCadastroCDFAMILIA.Text := FormatFloat(pMascaraFamilia,vAux);
          if not Fields.FieldByName('CDFAMILIAPAI').IsNull then
            preencheFamiliaPai(Fields.FieldByName('CDFAMILIAPAI').AsInteger);
          EditCadastroDEFAMILIA.Text := Fields.FieldByName('DEFAMILIA').AsString;
          CheckBoxCadastroFLATIVO.Checked := (Fields.FieldByName('FLATIVO').AsString = 'S');

          DatePickerCadastroDTCADASTRO.Date := Fields.FieldByName('DTREGISTRO').AsDateTime;
          if not Fields.FieldByName('DTULTATUALIZACAO').IsNull then
            DatePickerCadastroDTULTATUALIZACAO.Date := Fields.FieldByName('DTULTATUALIZACAO').AsDateTime
          else
            DatePickerCadastroDTULTATUALIZACAO.Clear;

          // Consulta o usuário.
          vQuery2 := pUsuario.lista;
          with vQuery2 do
            try
              SQL.Add('WHERE cdusuario = :CDUSUARIO');
              Params.Items[0].AsInteger := vQuery.Fields.FieldByName('CDUSUARIO').AsInteger;
              dmPrincipal.executaConsulta(vQuery2);

              if not Eof then
              begin
                EditCadastroCDUSUARIO.Text := Fields.FieldByName('CDUSUARIO').AsString;
                EditCadastroNMLOGIN.Text := Fields.FieldByName('NMLOGIN').AsString;
                EditCadastroNMUSUARIO.Text := Fields.FieldByName('NMUSUARIO').AsString;
              end;
            finally
              Active := false;
              FreeAndNil(vQuery2);
            end;
        end
        else
          raise exception.Create('O cadastro do País não foi encontrado.');
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

procedure TfmCadFamilia.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfmCadFamilia.FormCreate(Sender: TObject);
var
  vAux: string;
begin
  try
    CreateGUID(pId);

    Color := Self.Color;
    FormStyler.AutoThemeAdapt := false;

    pCadastrarPai := 0;

    // Seta a opção padrão, que é inclusão.
    if Opcao <> 'A' then
      Opcao := 'I';

    OfficePagerCentral.ActivePageIndex := 0;

    pFamilia := TFamilia.Create;
    pUsuario := TUsuario.Create;

    vAux := fmPrincipal.MascaraFamilia;
    pMascaraFamiliaPai := Copy(vAux,1,Pos('.',vAux)-1);
    pMascaraFamilia := Copy(vAux,Pos('.',vAux)+1,Length(vAux));
    pTamanhoMascara := Length(pMascaraFamilia);

    novoCadastro;
    MenuItemAtualizarTreeViewClick(Sender);
    desabilitaBotoes;

    // Se não tiver itens já entra no cadastro direto.
    if TreeViewGeral.Items.Count = 0 then
      MenuItemCadastrarFamiliaClick(Sender)
    else
    begin
      TreeViewGeral.Selected := TreeViewGeral.Items.Item[0];
      ActiveControl := TreeViewGeral;
    end;

    CheckBoxCadastroFLATIVO.Themed := true;

    carregaImagensBotoes;
    carregaImagensMenu;

    OfficePagerCentral.Images := fmPrincipal.ImageListE;
    OfficePagerCentral.DisabledImages := fmPrincipal.ImageListD;
    OfficePageConsulta.ImageIndex := 2;
    OfficePageCadastro.ImageIndex := 1;

    FormResize(Sender);
  except
    on E: Exception do
    begin
      fmPrincipal.manipulaExcecoes(Sender,E);
      Close;
    end;
  end;
end;

procedure TfmCadFamilia.FormDestroy(Sender: TObject);
begin
  FreeAndNil(pFamilia);
  FreeAndNil(pUsuario);
end;

procedure TfmCadFamilia.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Exit;
end;

procedure TfmCadFamilia.FormResize(Sender: TObject);
begin
  EspacamentoInicial := fmPrincipal.EspacamentoInicialBotao;
  EspacamentoFinal := fmPrincipal.EspacamentoFinalBotao;
  EspacamentoEntre := fmPrincipal.EspacamentoEntreBotoes;

  BitBtnFechar.Left := PanelBotoes.Width - BitBtnFechar.Width - EspacamentoFinal;
  BitBtnRestaurar.Left := BitBtnFechar.Left - BitBtnRestaurar.Width - EspacamentoEntre;
  BitBtnExcluir.Left := BitBtnRestaurar.Left - BitBtnExcluir.Width - EspacamentoEntre;
  BitBtnSalvar.Left := BitBtnExcluir.Left - BitBtnSalvar.Width - EspacamentoEntre;
end;

procedure TfmCadFamilia.FormShow(Sender: TObject);
begin
  if pCadastrarPai = 1 then
  begin
    MenuItemCadastrarFamiliaClick(Self);
    OfficePageConsulta.TabVisible := false;
  end;
end;

procedure TfmCadFamilia.habilitaBotoes;
begin
  BitBtnSalvar.Enabled := true;
  BitBtnExcluir.Enabled := true;
  BitBtnRestaurar.Enabled := true;
end;

procedure TfmCadFamilia.MenuItemAtualizarTreeViewClick(Sender: TObject);
begin
  try
    ButtonContrairTodosClick(ButtonContrairTodos);
    consultaCadastro;
    ButtonExpandirTodosClick(ButtonExpandirTodos);
  except
    on E: Exception do
      fmPrincipal.manipulaExcecoes(Sender,E);
  end;
end;

procedure TfmCadFamilia.MenuItemCadastrarFamiliaClick(Sender: TObject);
var
  vPai: string;
  vAux: extended;
  vQuery: TZQuery;
begin
  // Verifica se não é um primeiro cadastro.
  if TreeViewGeral.Items.Count > 0 then
  begin
    // Previne que se chame o evento sem ter um item selecionado.
    if TreeViewGeral.SelectionCount = 0 then
      Exit;

    OfficePagerCentral.ActivePageIndex := 1;
    novoCadastro;
    pOpcao := 'I';

    // Verifica se o cadastro é de uma família ou sub família.
    if TreeViewGeral.Selected.Level = 0 then
      pTipoInclusao := 'F'
    else
      pTipoInclusao := 'S';

    if pTipoInclusao = 'S' then
    begin
      // Pega o código referente à família.
      vPai := TreeViewGeral.Selected.Parent.Text;
      preencheFamiliaPai(StrToInt(Trim(Copy(vPai,1,Pos('-',vPai)-1))));
    end;

    try
      try
        //vQuery := TZQuery.Create(Self);
        vQuery := pFamilia.obtemConsultaNovaFamilia;
        with vQuery do
        begin
          //SQL := pFamilia.obtemConsultaNovaFamilia.SQL;
          if pTipoInclusao = 'F' then
            SQL.Add('WHERE nunivel = 1')
          else
          begin
            SQL.Add('WHERE nunivel > 1');
            SQL.Add('  AND cdfamiliapai = :CDFAMILIAPAI');
            Params.ParamByName('CDFAMILIAPAI').AsInteger := StrToInt(EditCadastroCDFAMILIAPAI.Text);
          end;
          dmPrincipal.executaConsulta(vQuery);
          if not Eof then
          begin
            EditCadastroCDFAMILIA.Text := Fields.FieldByName('CDFAMILIA').AsString;
            vAux := StrToFloat(EditCadastroCDFAMILIA.Text);
            EditCadastroCDFAMILIA.Text := FormatFloat(pMascaraFamilia,vAux);
          end;

          habilitaBotoes;
          BitBtnExcluir.Enabled := false;
        end;
      except
        on E: exception do
          fmPrincipal.manipulaExcecoes(Sender,E);
      end;
    finally
      vQuery.Active := false;
      FreeAndNil(vQuery);
    end;
  end
  else
  begin
    novoCadastro;
    pOpcao := 'I';
    pTipoInclusao := 'F';
    vAux := 1;
    EditCadastroCDFAMILIA.Text := FormatFloat(pMascaraFamilia,vAux);
    BitBtnSalvar.Enabled := true;
  end;

  // Preenche os dados do usuário.
  EditCadastroCDUSUARIO.Text := IntToStr(fmPrincipal.CodigoUsuarioLogado);
  EditCadastroNMLOGIN.Text := fmPrincipal.LoginUsuarioLogado;
  EditCadastroNMUSUARIO.Text := fmPrincipal.NomeUsuarioLogado;
end;

procedure TfmCadFamilia.MenuItemCadastrarSubFamiliaClick(Sender: TObject);
var
  vPai: string;
  vAux: Extended;
  vQuery: TZQuery;
begin
  // Previne que se chame o evento sem ter um item selecionado.
  if TreeViewGeral.SelectionCount = 0 then
    Exit;
  if TreeViewGeral.Selected.Level = 1 then
  begin
    MessageBox(fmPrincipal.Handle,
               PWideChar('Não é possível cadastrar uma subfamília de uma subfamília.'),
               cTituloMensagemInformacao,
               MB_OK or MB_ICONINFORMATION);
    Exit;
  end;

  OfficePagerCentral.ActivePageIndex := 1;
  novoCadastro;
  pOpcao := 'I';
  pTipoInclusao := 'S';

  // Pega o código referente à família.
//  if TreeViewGeral.Selected.HasChildren = false then
//    vPai := TreeViewGeral.Selected.Text
//  else
//    vPai := TreeViewGeral.Selected.Parent.Text;
  vPai := TreeViewGeral.Selected.Text;
  preencheFamiliaPai(StrToInt(Trim(Copy(vPai,1,Pos('-',vPai)-1))));

  try
    try
//      vQuery := TZQuery.Create(Self);
      vQuery := pFamilia.obtemConsultaNovaFamilia;
      with vQuery do
      begin
        // Consulta o cadastro da sub família para família pai.
//        SQL := pFamilia.obtemConsultaNovaFamilia.SQL;
        SQL.Add('WHERE cdfamiliapai = :CDFAMILIA');
        Params.ParamByName('CDFAMILIA').AsInteger := StrToInt(EditCadastroCDFAMILIAPAI.Text);
        dmPrincipal.executaConsulta(vQuery);
        if not Eof then
        begin
          EditCadastroCDFAMILIA.Text := Fields.FieldByName('CDFAMILIA').AsString;
          vAux := StrToFloat(EditCadastroCDFAMILIA.Text);
          EditCadastroCDFAMILIA.Text := FormatFloat(pMascaraFamilia,vAux);
        end;
      end;

      // Preenche os dados do usuário.
      EditCadastroCDUSUARIO.Text := IntToStr(fmPrincipal.CodigoUsuarioLogado);
      EditCadastroNMLOGIN.Text := fmPrincipal.LoginUsuarioLogado;
      EditCadastroNMUSUARIO.Text := fmPrincipal.NomeUsuarioLogado;

      habilitaBotoes;
      BitBtnExcluir.Enabled := false;
    except
      on E: exception do
        fmPrincipal.manipulaExcecoes(Sender,E);
    end;
  finally
    vQuery.Active := false;
    FreeAndNil(vQuery);
  end;

  ActiveControl := EditCadastroDEFAMILIA;
end;

procedure TfmCadFamilia.MenuItemAlterarFamiliaClick(Sender: TObject);
begin
  Opcao := 'A';
  // Previne que se chame o evento sem ter um item selecionado.
  if TreeViewGeral.SelectionCount = 0 then
    Exit;

  editaCadastro;
  habilitaBotoes;

  OfficePagerCentral.ActivePageIndex := 1;
  ActiveControl := EditCadastroDEFAMILIA;
end;

procedure TfmCadFamilia.novoCadastro;
begin
  EditCadastroCDFAMILIAPAI.Clear;
  EditCadastroDEFAMILIAPAI.Clear;
  EditCadastroCDFAMILIA.Clear;
  EditCadastroDEFAMILIA.Clear;
  CheckBoxCadastroFLATIVO.Checked := true;

  EditCadastroCDFAMILIAPAI.ReadOnly := true;
  EditCadastroDEFAMILIAPAI.ReadOnly := true;
  EditCadastroCDFAMILIA.ReadOnly := true;

  EditCadastroCDUSUARIO.Clear;
  EditCadastroNMLOGIN.Clear;
  EditCadastroNMUSUARIO.Clear;
  DatePickerCadastroDTCADASTRO.Clear;
  DatePickerCadastroDTULTATUALIZACAO.Clear;
end;

procedure TfmCadFamilia.OfficePageCadastroShow(Sender: TObject);
begin
  ActiveControl := EditCadastroDEFAMILIA;
end;

procedure TfmCadFamilia.preencheFamiliaPai(prmcdFamiliaPai: integer);
var
  vQuery: TZQuery;
begin
  // Busca a descrição da família.
  vQuery := pFamilia.filtroNivel1;
  with vQuery do
    try
      SQL.Add('WHERE "NU-Código" = :CDFAMILIA');
      Params.ParamByName('CDFAMILIA').AsInteger := prmcdFamiliaPai;
      dmPrincipal.executaConsulta(vQuery);
      if not Eof then
      begin
        EditCadastroCDFAMILIAPAI.Text := Fields.Fields[0].AsString;
        EditCadastroDEFAMILIAPAI.Text := Fields.Fields[1].AsString;
      end
      else
      begin
        EditCadastroCDFAMILIAPAI.Clear;
        EditCadastroDEFAMILIAPAI.Clear;
        raise Exception.Create('Não foi identificada a Descrição para a Família Pai.');
      end;
    finally
      Active := false;
      FreeAndNil(vQuery);
    end;
end;

procedure TfmCadFamilia.ButtonContrairTodosClick(Sender: TObject);
begin
  TreeViewGeral.FullCollapse;
end;

procedure TfmCadFamilia.ButtonExpandirTodosClick(Sender: TObject);
begin
  TreeViewGeral.FullExpand;
end;

procedure TfmCadFamilia.ButtonExportarHTMLClick(Sender: TObject);
var
  vLocal: string;
  vArquivoHTML: TTVHTMLExport;
begin
  try
    vLocal := fmPrincipal.LocalTemporario + 'CadastroFamilias.html';
    try
      vArquivoHTML := TTVHTMLExport.Create(Self);
      with vArquivoHTML do
      begin
        Indent := 2;

        ShowFolderImage := false;
        ShowBorder := true;
        UseInternalImages := true;
        Title.Show := true;
        Header.Show := true;
        Footer.Show := true;
        Header.Bold := false;
        Footer.Bold := false;

        Title.Text := 'Cadastro de Famílias';
        Title.Size := H1;

        Header.Lines.Clear;
        Header.Lines.Add('Emitido por: ' + fmPrincipal.LoginUsuarioLogado);
        Header.Lines.Add('<br/>');
        Header.Lines.Add('Emitido em: ' + FormatDateTime('dd/mm/yyy hh:nn:ss',Now()));
        Footer.Lines.Clear;
        Footer.Lines.Add('[Aqueloo - Sistema Integrado de Gestão de Aquisições]');

        StyleSheet.Clear;
        StyleSheet.LoadFromFile(fmPrincipal.LocalAplicacao + fmPrincipal.ArquivoHTMLStyleSheet);

        SaveToHTML(vLocal,TreeViewGeral);
        if FileExists(vLocal) then
          ShellExecute(Handle,PChar('Open'),PChar(vLocal),nil,nil,SW_SHOWNORMAL);
      end;
    finally
      FreeAndNil(vArquivoHTML);
    end;
  except
    on E: Exception do
      fmPrincipal.manipulaExcecoes(Sender,E);
  end;
end;

procedure TfmCadFamilia.ButtonImprimirRelatorioClick(Sender: TObject);
begin
  try
    QueryRelFamilia.SQL := pFamilia.relatorio.SQL;
    dmPrincipal.executaConsulta(QueryRelFamilia);
    with fmPrincipal.SystemRelatorio do
    begin
      DefaultDest := rdPreview;
      SystemSetups := SystemSetups - [ssAllowSetup];
      DoNativeOutput := false;
    end;
    with ProjectRelFamilia do
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

function TfmCadFamilia.validaExclusao: boolean;
var
  vMensagem: string;
begin
  vMensagem := EmptyStr;

  try
    pFamilia.Codigo := Codigo;
    if pFamilia.existeDependencia then
      vMensagem := '- Existem aquisições relacionadas a esta família.';

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
