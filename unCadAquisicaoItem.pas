unit unCadAquisicaoItem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ExtCtrls, Vcl.StdCtrls, AdvAppStyler, AdvEdit, AdvFontCombo, AdvEdBtn,
  AdvMoneyEdit, PlannerDatePicker, Data.DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, System.StrUtils, AdvGrid, AdvOfficeButtons, AdvGlowButton, AdvPanel,
  unFamilia, unMaterial, unEmbalagem;

type
  TfmAquisicaoItem = class(TForm)
    PanelBotoes: TAdvPanel;
    BitBtnFechar: TAdvGlowButton;
    BitBtnAplicar: TAdvGlowButton;
    BitBtnRestaurar: TAdvGlowButton;
    FormStyler: TAdvFormStyler;
    PanelTitulos: TAdvPanel;
    PanelCampos: TAdvPanel;
    LabelDataGarantia: TLabel;
    LabelEmbalagem: TLabel;
    LabelFamiliaMaterial: TLabel;
    LabelItemMaterial: TLabel;
    LabelMarcaModelo: TLabel;
    LabelMaterial: TLabel;
    LabelQuantidade: TLabel;
    LabelValorGarantia: TLabel;
    LabelValorTotal: TLabel;
    LabelValorUnitario: TLabel;
    PanelInfo: TAdvPanel;
    LabelCamposRequeridos: TLabel;
    ButtonNovoFamilia: TAdvGlowButton;
    ButtonNovoMaterial: TAdvGlowButton;
    ButtonNovoEmbalagem: TAdvGlowButton;
    ButtonLimparFamilia: TAdvGlowButton;
    ButtonLimparMaterial: TAdvGlowButton;
    ButtonLimparEmbalagem: TAdvGlowButton;
    EditCadastroCDEMBALAGEM: TAdvEdit;
    EditCadastroCDFAMILIA: TAdvEdit;
    EditCadastroCDMATERIAL: TAdvEdit;
    EditCadastroNUITEM: TAdvEdit;
    EditCadastroQTEQUIVALENCIA: TAdvEdit;
    EditCadastroQTMATERIAL: TAdvEdit;
    EditCadastroSGEMBALAGEM: TAdvEdit;
    ComboBoxCadastroMarcaModelo: TAdvOfficeComboBox;
    EditCadastroDEFAMILIA: TAdvEditBtn;
    EditCadastroDEMATERIAL: TAdvEditBtn;
    EditCadastroNMEMBALAGEM: TAdvEditBtn;
    EditCadastroVLGARANTIA: TAdvMoneyEdit;
    EditCadastroVLTOTAL: TAdvMoneyEdit;
    EditCadastroVLUNITARIO: TAdvMoneyEdit;
    EditCadastroDTGARANTIA: TPlannerDatePicker;
    CheckBoxCadastroFLGARANTIAATIVA: TAdvOfficeCheckBox;
    ButtonNovoFamiliaPai: TAdvGlowButton;
    procedure BitBtnFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure EditCadastroQTMATERIALExit(Sender: TObject);
    procedure EditCadastroVLUNITARIOExit(Sender: TObject);
    procedure EditCadastroVLGARANTIAExit(Sender: TObject);
    procedure EditCadastroCDFAMILIAChange(Sender: TObject);
    procedure EditCadastroCDFAMILIAExit(Sender: TObject);
    procedure EditCadastroDEFAMILIAClickBtn(Sender: TObject);
    procedure EditCadastroDEFAMILIAExit(Sender: TObject);
    procedure ButtonLimparFamiliaClick(Sender: TObject);
    procedure ButtonNovoFamiliaClick(Sender: TObject);
    procedure EditCadastroCDMATERIALChange(Sender: TObject);
    procedure EditCadastroCDMATERIALExit(Sender: TObject);
    procedure EditCadastroDEMATERIALClickBtn(Sender: TObject);
    procedure EditCadastroDEMATERIALExit(Sender: TObject);
    procedure ButtonLimparMaterialClick(Sender: TObject);
    procedure ButtonNovoMaterialClick(Sender: TObject);
    procedure EditCadastroCDEMBALAGEMChange(Sender: TObject);
    procedure EditCadastroCDEMBALAGEMExit(Sender: TObject);
    procedure EditCadastroSGEMBALAGEMExit(Sender: TObject);
    procedure EditCadastroNMEMBALAGEMClickBtn(Sender: TObject);
    procedure EditCadastroNMEMBALAGEMExit(Sender: TObject);
    procedure ButtonLimparEmbalagemClick(Sender: TObject);
    procedure ButtonNovoEmbalagemClick(Sender: TObject);
    procedure BitBtnAplicarClick(Sender: TObject);
    procedure BitBtnRestaurarClick(Sender: TObject);
    procedure ButtonNovoFamiliaPaiClick(Sender: TObject);
  private
    { Private declarations }
    pId: TGUID;
    plTipoMovimento, plFamilia, plMaterial, plEmbalagem, plMarcaModelo: TStringList;
    pcdFamilia, pcdMaterial, pdeMaterial, pcdMarcaModelo, pnmMarcaModelo,
    pnmEmbalagem, pflGarantiaAtiva: string;
    pStatusAquisicao, pStatusAquisicaoItem: char;
    pAtivarControle: boolean;
    pnuItem, pcdEmbalagem, pqtMaterial, pqtEquivalencia: integer;
    pvlUnitario, pvlGarantia: currency;
    pdtGarantia: TDate;
    pFamilia: TFamilia;
    pMaterial: TMaterial;
    pEmbalagem: TEmbalagem;
    procedure controlaCamposMateriais(prmHabilitar: boolean = true);
    procedure populaMarcaModelo(prmcdMaterial: string);
    procedure habilitaTudo;
    procedure obtemMarcaModelo(prmcdMarcaModelo: string; var prmcdMarca, prmcdModelo: integer);
    procedure novoCadastro;
    procedure carregaImagensBotoes;
  public
    { Public declarations }
    procedure preencheCampos;
    property StatusAquisicao: char read pStatusAquisicao write pStatusAquisicao;
    property StatusAquisicaoItem: char read pStatusAquisicaoItem write pStatusAquisicaoItem;
    property AtivarControle: boolean read pAtivarControle write pAtivarControle;
    property nuItem: integer read pnuItem write pnuItem;
    property cdFamilia: string read pcdFamilia write pcdFamilia;
    property cdMaterial: string read pcdMaterial write pcdMaterial;
    property deMaterial: string read pdeMaterial write pdeMaterial;
    property cdEmbalagem: integer read pcdEmbalagem write pcdEmbalagem;
    property nmEmbalagem: string read pnmEmbalagem write pnmEmbalagem;
    property qtEquivalencia: integer read pqtEquivalencia write pqtEquivalencia;
    property cdMarcaModelo: string read pcdMarcaModelo write pcdMarcaModelo;
    property nmMarcaModelo: string read pnmMarcaModelo write pnmMarcaModelo;
    property qtMaterial: integer read pqtMaterial write pqtMaterial;
    property vlUnitario: currency read pvlUnitario write pvlUnitario;
    property vlGarantia: currency read pvlGarantia write pvlGarantia;
    property dtGarantia: TDate read pdtGarantia write pdtGarantia;
    property flGarantiaAtiva: string read pflGarantiaAtiva write pflGarantiaAtiva;
  end;

var
  fmAquisicaoItem: TfmAquisicaoItem;

implementation

{$R *.dfm}

uses unPrincipal, undmPrincipal, undmEstilo, unConFiltroPadrao, unCadFamilia,
  unConFiltroMaterial, unCadMaterial, unCadEmbalagem, unCadAquisicao;

procedure TfmAquisicaoItem.BitBtnAplicarClick(Sender: TObject);
var
  vqtMaterial: integer;
  vAux, vMensagem: string;
begin
  // Realiza validações.
  vMensagem := EmptyStr;
  if EditCadastroCDFAMILIA.Text = EmptyStr then
    vMensagem := vMensagem + #13#10'- O campo Família é requerido.';
  if EditCadastroCDMATERIAL.Text = EmptyStr then
    vMensagem := vMensagem + #13#10'- O campo Material é requerido.';
  vqtMaterial := StrToIntDef(EditCadastroQTMATERIAL.Text,0);
  if vqtMaterial <= 0 then
    vMensagem := vMensagem + #13#10'- A Quantidade precisa ser maior que zero.';
  if EditCadastroVLUNITARIO.Value <= 0 then
    vMensagem := vMensagem + #13#10'- O valor unitário precisa ser maior que zero.';

  if vMensagem <> EmptyStr then
  begin
    if StatusAquisicaoItem = 'I' then
      MessageBox(fmPrincipal.Handle,
                 PWideChar('A inclusão da informação do material não poderá ser executada devido as seguintes pendências:' + vMensagem),
                 cTituloMensagemAlerta,
                 MB_OK or MB_ICONWARNING)
    else
      MessageBox(fmPrincipal.Handle,
                 PWideChar('A atualização da informação do material não poderá ser executada devido as seguintes pendências:' + vMensagem),
                 cTituloMensagemAlerta,
                 MB_OK or MB_ICONWARNING);
    Exit;
  end;
  // Fim Realiza validações.

  try
    cdFamilia := EditCadastroCDFAMILIA.Text;
    cdMaterial := EditCadastroCDMATERIAL.Text;
    deMaterial := EditCadastroDEMATERIAL.Text;
    // Necessário porque se não clicar o Combo perde o Texto.
    with ComboBoxCadastroMarcaModelo do
      if ItemIndex > -1 then
        vAux := Items.Strings[ItemIndex];
    if vAux <> EmptyStr then
    begin
      cdMarcaModelo := plMarcaModelo.Strings[ComboBoxCadastroMarcaModelo.ItemIndex];
      nmMarcaModelo := vAux;
    end;
    cdEmbalagem := StrToInt(EditCadastroCDEMBALAGEM.Text);
    nmEmbalagem := EditCadastroNMEMBALAGEM.Text;
    qtEquivalencia := StrToInt(EditCadastroQTEQUIVALENCIA.Text);
    qtMaterial := vqtMaterial;
    vlUnitario := EditCadastroVLUNITARIO.Value;
    // Previne o erro de o usuário clicar no botão de Confirmar sem ter o valor total calculado.
    if EditCadastroVLTOTAL.Value = 0 then
      EditCadastroVLUNITARIOExit(EditCadastroVLUNITARIO);
    vlGarantia := EditCadastroVLGARANTIA.Value;
    if EditCadastroDTGARANTIA.IsDateValid then
      dtGarantia := EditCadastroDTGARANTIA.Date
    else
      dtGarantia := -1;
    if CheckBoxCadastroFLGARANTIAATIVA.Checked then
      flGarantiaAtiva := 'S'
    else
      flGarantiaAtiva := 'N';

    // Seta que o cadastro foi atualizado.
    StatusAquisicaoItem := 'A';
    Close;
  except
    on E: Exception do
      fmPrincipal.manipulaExcecoes(Sender,E);
  end;
end;

procedure TfmAquisicaoItem.BitBtnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfmAquisicaoItem.BitBtnRestaurarClick(Sender: TObject);
begin
  novoCadastro;
  preencheCampos;
end;

procedure TfmAquisicaoItem.ButtonLimparEmbalagemClick(Sender: TObject);
begin
  plEmbalagem.Clear;

  EditCadastroCDEMBALAGEM.Clear;
  EditCadastroSGEMBALAGEM.Clear;
  EditCadastroNMEMBALAGEM.Clear;
  EditCadastroQTEQUIVALENCIA.Clear;

  EditCadastroCDEMBALAGEM.Enabled := true;
  EditCadastroSGEMBALAGEM.Enabled := true;
  EditCadastroNMEMBALAGEM.Enabled := true;
  ButtonLimparEmbalagem.Enabled := false;
  ButtonNovoEmbalagem.Enabled := false;
end;

procedure TfmAquisicaoItem.ButtonLimparFamiliaClick(Sender: TObject);
begin
  plFamilia.Clear;

  EditCadastroCDFAMILIA.Clear;
  EditCadastroDEFAMILIA.Clear;

  EditCadastroCDFAMILIA.Enabled := true;
  EditCadastroDEFAMILIA.Enabled := true;
  ButtonLimparFamilia.Enabled := false;
  ButtonNovoFamilia.Enabled := true;

  ButtonLimparMaterialClick(Sender);
end;

procedure TfmAquisicaoItem.ButtonLimparMaterialClick(Sender: TObject);
begin
  plMaterial.Clear;
  plEmbalagem.Clear;
  plMarcaModelo.Clear;

  EditCadastroCDMATERIAL.Clear;
  EditCadastroDEMATERIAL.Clear;
  ButtonLimparEmbalagemClick(Sender);
  ComboBoxCadastroMarcaModelo.Items.Clear;

  EditCadastroCDMATERIAL.Enabled := true;
  EditCadastroDEMATERIAL.Enabled := true;
  ButtonLimparMaterial.Enabled := false;
  ButtonNovoMaterial.Enabled := (plFamilia.Count > 0);
end;

procedure TfmAquisicaoItem.ButtonNovoEmbalagemClick(Sender: TObject);
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
      if pAtivarControle then
        if EditCadastroCDEMBALAGEM.Enabled then
          ActiveControl := EditCadastroCDEMBALAGEM;
    end;
  end;
end;

procedure TfmAquisicaoItem.ButtonNovoFamiliaClick(Sender: TObject);
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
      if pAtivarControle then
        if EditCadastroCDMATERIAL.Enabled then
          ActiveControl := EditCadastroCDMATERIAL;

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

procedure TfmAquisicaoItem.ButtonNovoFamiliaPaiClick(Sender: TObject);
begin
  fmCadFamilia := TfmCadFamilia.Create(Self);
  with fmCadFamilia do
  begin
    try
      Tag := 1;
      pCadastrarPai := 1;
      ShowModal;
    except
      on E: Exception do
        raise exception.Create('Não foi possível abrir a tela de Cadastro de Família.'+#13#10+E.Message);
    end;
  end;
end;

procedure TfmAquisicaoItem.ButtonNovoMaterialClick(Sender: TObject);
var
  vcdMaterial: integer;
  vcdFamilia: string;
begin
  vcdMaterial := 0;
  vcdFamilia := EditCadastroCDFAMILIA.Text;
  try
    fmCadMaterial := TfmCadMaterial.Create(Self);
    with fmCadMaterial do
    begin
      try
        Tag := 1;
        setaFamilia(vcdFamilia);
        ShowModal;

        vcdMaterial := fmCadMaterial.Codigo;
      except
        on E: exception do
          raise exception.Create('Não foi possível abrir a tela de Cadastro de Material.'+#13#10+E.Message);
      end;
    end;
  finally
    // Verifica se foi cadastrado um material.
    if vcdMaterial > 0 then
    begin
      if pAtivarControle then
        if ComboBoxCadastroMarcaModelo.Enabled then
          ActiveControl := ComboBoxCadastroMarcaModelo
        else
          if EditCadastroQTMATERIAL.Enabled then
            ActiveControl := EditCadastroQTMATERIAL;
      EditCadastroCDMATERIAL.Text := pMaterial.obtemMaterial(vcdMaterial);
      EditCadastroCDMATERIALExit(EditCadastroCDMATERIAL);
      ButtonLimparMaterial.Enabled := true;
      ButtonNovoMaterial.Enabled := false;
    end;
  end;
end;

procedure TfmAquisicaoItem.carregaImagensBotoes;
begin
  EditCadastroDEFAMILIA.Button.Glyph.Assign(fmPrincipal.fnGeral.obtemImagemPesquisa);
  EditCadastroDEMATERIAL.Button.Glyph.Assign(fmPrincipal.fnGeral.obtemImagemPesquisa);
  EditCadastroNMEMBALAGEM.Button.Glyph.Assign(fmPrincipal.fnGeral.obtemImagemPesquisa);
  EditCadastroVLUNITARIO.Button.Glyph.Assign(fmPrincipal.fnGeral.obtemImagemCalculadora);
  EditCadastroVLGARANTIA.Button.Glyph.Assign(fmPrincipal.fnGeral.obtemImagemCalculadora);
  EditCadastroVLTOTAL.Button.Glyph.Assign(fmPrincipal.fnGeral.obtemImagemCalculadora);

  ButtonLimparFamilia.Picture.LoadFromFile(fmPrincipal.LocalIcones + 'erase-e-16.png');
  ButtonLimparFamilia.HotPicture.LoadFromFile(fmPrincipal.LocalIcones + 'erase-h-16.png');
  ButtonLimparFamilia.DisabledPicture.LoadFromFile(fmPrincipal.LocalIcones + 'erase-d-16.png');
  ButtonLimparMaterial.Picture.LoadFromFile(fmPrincipal.LocalIcones + 'erase-e-16.png');
  ButtonLimparMaterial.HotPicture.LoadFromFile(fmPrincipal.LocalIcones + 'erase-h-16.png');
  ButtonLimparMaterial.DisabledPicture.LoadFromFile(fmPrincipal.LocalIcones + 'erase-d-16.png');
  ButtonLimparEmbalagem.Picture.LoadFromFile(fmPrincipal.LocalIcones + 'erase-e-16.png');
  ButtonLimparEmbalagem.HotPicture.LoadFromFile(fmPrincipal.LocalIcones + 'erase-h-16.png');
  ButtonLimparEmbalagem.DisabledPicture.LoadFromFile(fmPrincipal.LocalIcones + 'erase-d-16.png');
  ButtonNovoFamilia.Picture.LoadFromFile(fmPrincipal.LocalIcones + 'new-e-16.png');
  ButtonNovoFamilia.HotPicture.LoadFromFile(fmPrincipal.LocalIcones + 'new-h-16.png');
  ButtonNovoFamilia.DisabledPicture.LoadFromFile(fmPrincipal.LocalIcones + 'new-d-16.png');
  ButtonNovoMaterial.Picture.LoadFromFile(fmPrincipal.LocalIcones + 'new-e-16.png');
  ButtonNovoMaterial.HotPicture.LoadFromFile(fmPrincipal.LocalIcones + 'new-h-16.png');
  ButtonNovoMaterial.DisabledPicture.LoadFromFile(fmPrincipal.LocalIcones + 'new-d-16.png');
  ButtonNovoEmbalagem.Picture.LoadFromFile(fmPrincipal.LocalIcones + 'new-e-16.png');
  ButtonNovoEmbalagem.HotPicture.LoadFromFile(fmPrincipal.LocalIcones + 'new-h-16.png');
  ButtonNovoEmbalagem.DisabledPicture.LoadFromFile(fmPrincipal.LocalIcones + 'new-d-16.png');
  ButtonNovoFamiliaPai.Picture.LoadFromFile(fmPrincipal.LocalIcones + 'genealogy-e-16.png');
  ButtonNovoFamiliaPai.HotPicture.LoadFromFile(fmPrincipal.LocalIcones + 'genealogy-h-16.png');
  ButtonNovoFamiliaPai.DisabledPicture.LoadFromFile(fmPrincipal.LocalIcones + 'genealogy-d-16.png');
end;

procedure TfmAquisicaoItem.controlaCamposMateriais(prmHabilitar: boolean);
begin
  EditCadastroQTMATERIAL.Enabled := prmHabilitar;
  EditCadastroVLUNITARIO.Enabled := prmHabilitar;
end;

procedure TfmAquisicaoItem.EditCadastroCDEMBALAGEMChange(Sender: TObject);
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

procedure TfmAquisicaoItem.EditCadastroCDEMBALAGEMExit(Sender: TObject);
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
      if plEmbalagem.Count > 0 then
      begin
        if EditCadastroQTEQUIVALENCIA.Enabled then
          ActiveControl := EditCadastroQTEQUIVALENCIA;
      end
      else
        if EditCadastroCDEMBALAGEM.Enabled then
          ActiveControl := EditCadastroCDEMBALAGEM;
  end;

  // Para que o evento volte a ser executado.
  EditCadastroCDEMBALAGEM.OnExit := EditCadastroCDEMBALAGEMExit;
  EditCadastroSGEMBALAGEM.OnExit := EditCadastroSGEMBALAGEMExit;
  EditCadastroNMEMBALAGEM.OnExit := EditCadastroNMEMBALAGEMExit;
  EditCadastroNMEMBALAGEM.OnClickBtn := EditCadastroNMEMBALAGEMClickBtn;
end;

procedure TfmAquisicaoItem.EditCadastroCDFAMILIAChange(Sender: TObject);
var
  vChar: char;
begin
  with EditCadastroCDFAMILIA do
    if Length(Text) > 0 then
    begin
      OnChange := nil;
      vChar := Text[Length(Text)];
      // Verifica se o caractere digitado é válido.
      fmPrincipal.fnGeral.verificaNumeros(vChar);
      if vChar <> #0 then
        Text := pFamilia.formataFamilia(Text)
      else
        Text := Copy(Text,1,Length(Text)-1);
      OnChange := EditCadastroCDFAMILIAChange;
      SelStart := Length(Text);
    end;
end;

procedure TfmAquisicaoItem.EditCadastroCDFAMILIAExit(Sender: TObject);
var
  i: integer;
  vQuery: TZQuery;
begin
  // Se não digitou nada, sai sem pesquisar.
  if Length(Trim(EditCadastroCDFAMILIA.Text)) = 0 then
    Exit;

  // Para que o evento não seja executado.
  EditCadastroCDFAMILIA.OnExit := nil;
  EditCadastroDEFAMILIA.OnExit := nil;
  EditCadastroDEFAMILIA.OnClickBtn := nil;

  try
    vQuery := pFamilia.filtroNivel2;
    with vQuery do
    begin
      SQL.Add('WHERE "NF-Código" LIKE :CDFAMILIA');
      Params.ParamByName('CDFAMILIA').AsString := EditCadastroCDFAMILIA.Text + '%';
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
            executaFiltro(1,EditCadastroCDFAMILIA.Text);
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

    ButtonLimparMaterialClick(Sender);
    if plFamilia.Count = 0 then
    begin
      EditCadastroCDMATERIAL.Enabled := false;
      EditCadastroDEMATERIAL.Enabled := false;
      ButtonLimparFamilia.Enabled := false;
      ButtonNovoFamilia.Enabled := false;
    end;

    EditCadastroCDFAMILIA.Enabled := (plFamilia.Count = 0);
    EditCadastroDEFAMILIA.Enabled := (plFamilia.Count = 0);
    ButtonLimparFamilia.Enabled := (plFamilia.Count > 0);
    ButtonNovoFamilia.Enabled := (plFamilia.Count = 0);

    // Valida para qual campo vai se posicionar.
    if pAtivarControle then
      if plFamilia.Count > 0 then
      begin
        if EditCadastroCDMATERIAL.Enabled then
          ActiveControl := EditCadastroCDMATERIAL;
      end
      else
        if EditCadastroCDFAMILIA.Enabled then
          ActiveControl := EditCadastroCDFAMILIA;
  end;

  // Para que o evento volte a ser executado.
  EditCadastroCDFAMILIA.OnExit := EditCadastroCDFAMILIAExit;
  EditCadastroDEFAMILIA.OnExit := EditCadastroDEFAMILIAExit;
  EditCadastroDEFAMILIA.OnClickBtn := EditCadastroDEFAMILIAClickBtn;
end;

procedure TfmAquisicaoItem.EditCadastroCDMATERIALChange(Sender: TObject);
var
  vChar: char;
begin
  with EditCadastroCDMATERIAL do
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
      OnChange := EditCadastroCDMATERIALChange;
      SelStart := Length(Text);
    end;
end;

procedure TfmAquisicaoItem.EditCadastroCDMATERIALExit(Sender: TObject);
var
  vQuery: TZQuery;
begin
  // Se não digitou nada, sai sem abrir a search.
  if Length(Trim(EditCadastroCDMATERIAL.Text)) = 0 then
    Exit;

  // Para que o evento não seja executado.
  EditCadastroCDMATERIAL.OnExit := nil;
  EditCadastroDEMATERIAL.OnExit := nil;
  EditCadastroDEMATERIAL.OnClickBtn := nil;

  try
    vQuery := pMaterial.filtro;
    with vQuery do
    begin
      SQL.Add('WHERE "NF-Código" LIKE :CDFAMILIA');
      SQL.Add('  AND "NF-Código" = :CDMATERIAL');
      Params.ParamByName('CDFAMILIA').AsString := EditCadastroCDFAMILIA.Text + '%';
      Params.ParamByName('CDMATERIAL').AsString := EditCadastroCDMATERIAL.Text;
      dmPrincipal.executaConsulta(vQuery);

      if not Eof then
      begin
        plMaterial.Clear;
        plMaterial.Add(Fields.Fields[0].AsString);
        EditCadastroCDMATERIAL.Text := Fields.Fields[0].AsString;
        EditCadastroDEMATERIAL.Text := Fields.Fields[2].AsString;
        EditCadastroSGEMBALAGEM.Text := Fields.Fields[3].AsString;
        EditCadastroSGEMBALAGEMExit(EditCadastroSGEMBALAGEM);
        EditCadastroQTEQUIVALENCIA.Text := Fields.Fields[4].AsString;
        populaMarcaModelo(Fields.Fields[0].AsString);
      end
      else
      begin
        EditCadastroCDMATERIAL.Clear;
        EditCadastroDEMATERIAL.Clear;
        EditCadastroSGEMBALAGEM.Clear;
        EditCadastroSGEMBALAGEMExit(EditCadastroSGEMBALAGEM);
        EditCadastroQTEQUIVALENCIA.Clear;
        fmPrincipal.apresentaResultadoCadastro('Nenhum registro encontrado.');
      end;
      Active := false;
    end;
  finally
    FreeAndNil(vQuery);
    // Verifica se habilita os outros campos do material.
    controlaCamposMateriais((plMaterial.Count > 0));

    EditCadastroCDMATERIAL.Enabled := (plMaterial.Count = 0);
    EditCadastroDEMATERIAL.Enabled := (plMaterial.Count = 0);
    ButtonLimparMaterial.Enabled := (plMaterial.Count > 0);
    ButtonNovoMaterial.Enabled := (plMaterial.Count = 0);
    // Se este painel estiver visível é porque a aquisição foi encerrada ou cancelada.
    if pStatusAquisicao = 'C' then
    begin
      ButtonLimparMaterial.Enabled := false;
      ButtonNovoMaterial.Enabled := false;
    end;

    // Valida para qual campo vai se posicionar.
    if pAtivarControle then
      if plMaterial.Count > 0 then
      begin
        if ComboBoxCadastroMarcaModelo.Enabled then
          ActiveControl := ComboBoxCadastroMarcaModelo;
      end
      else
        if EditCadastroCDMATERIAL.Enabled then
          ActiveControl := EditCadastroCDMATERIAL;
  end;

  // Para que o evento volte a ser executado.
  EditCadastroCDMATERIAL.OnExit := EditCadastroCDMATERIALExit;
  EditCadastroDEMATERIAL.OnExit := EditCadastroDEMATERIALExit;
  EditCadastroDEMATERIAL.OnClickBtn := EditCadastroDEMATERIALClickBtn;
end;

procedure TfmAquisicaoItem.EditCadastroDEFAMILIAClickBtn(Sender: TObject);
var
  i: integer;
begin
  // Para que o evento não seja executado.
  EditCadastroCDFAMILIA.OnExit := nil;
  EditCadastroDEFAMILIA.OnExit := nil;
  EditCadastroDEFAMILIA.OnClickBtn := nil;

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
    ButtonLimparMaterialClick(Sender);
    if plFamilia.Count = 0 then
    begin
      EditCadastroCDMATERIAL.Enabled := false;
      EditCadastroDEMATERIAL.Enabled := false;
      ButtonLimparFamilia.Enabled := false;
      ButtonNovoFamilia.Enabled := false;
    end;

    EditCadastroCDFAMILIA.Enabled := (plFamilia.Count = 0);
    EditCadastroDEFAMILIA.Enabled := (plFamilia.Count = 0);
    ButtonLimparFamilia.Enabled := (plFamilia.Count > 0);
    ButtonNovoFamilia.Enabled := (plFamilia.Count = 0);

    // Valida para qual campo vai se posicionar.
    if pAtivarControle then
      if plFamilia.Count > 0 then
      begin
        if EditCadastroCDMATERIAL.Enabled then
          ActiveControl := EditCadastroCDMATERIAL;
      end
      else
        if EditCadastroDEFAMILIA.Enabled then
          ActiveControl := EditCadastroDEFAMILIA;
  end;

  // Para que o evento volte a ser executado.
  EditCadastroCDFAMILIA.OnExit := EditCadastroCDFAMILIAExit;
  EditCadastroDEFAMILIA.OnExit := EditCadastroDEFAMILIAExit;
  EditCadastroDEFAMILIA.OnClickBtn := EditCadastroDEFAMILIAClickBtn;
end;

procedure TfmAquisicaoItem.EditCadastroDEFAMILIAExit(Sender: TObject);
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

    ButtonLimparMaterialClick(Sender);
    if plFamilia.Count = 0 then
    begin
      EditCadastroCDMATERIAL.Enabled := false;
      EditCadastroDEMATERIAL.Enabled := false;
      ButtonLimparFamilia.Enabled := false;
      ButtonNovoFamilia.Enabled := false;
    end;

    EditCadastroCDFAMILIA.Enabled := (plFamilia.Count = 0);
    EditCadastroDEFAMILIA.Enabled := (plFamilia.Count = 0);
    ButtonLimparFamilia.Enabled := (plFamilia.Count > 0);
    ButtonNovoFamilia.Enabled := (plFamilia.Count = 0);

    // Valida para qual campo vai se posicionar.
    if pAtivarControle then
      if plFamilia.Count > 0 then
      begin
        if EditCadastroCDMATERIAL.Enabled then
          ActiveControl := EditCadastroCDMATERIAL;
      end
      else
        if EditCadastroDEFAMILIA.Enabled then
          ActiveControl := EditCadastroDEFAMILIA;
  end;

  // Para que o evento volte a ser executado.
  EditCadastroCDFAMILIA.OnExit := EditCadastroCDFAMILIAExit;
  EditCadastroDEFAMILIA.OnExit := EditCadastroDEFAMILIAExit;
  EditCadastroDEFAMILIA.OnClickBtn := EditCadastroDEFAMILIAClickBtn;
end;

procedure TfmAquisicaoItem.EditCadastroDEMATERIALClickBtn(Sender: TObject);
var
  i: integer;
begin
  // Para que o evento não seja executado.
  EditCadastroCDMATERIAL.OnExit := nil;
  EditCadastroDEMATERIAL.OnExit := nil;
  EditCadastroDEMATERIAL.OnClickBtn := nil;

  fmConFiltroMaterial := TfmConFiltroMaterial.Create(Self);
  try
    with fmConFiltroMaterial do
    begin
      try
        setaTitulo('Consulta de Materiais');
        setaConsulta(pMaterial.filtro);
        setaOpcao('R');
        // Trata especificamente de relacionar o Material com a Família.
        setaFiltrosExtras('"NF-Código" LIKE ' + QuotedStr(EditCadastroCDFAMILIA.Text + '.%'),
                          'Código da Família: '+EditCadastroCDFAMILIA.Text);
        executaFiltro(0,EmptyStr);
        ShowModal;
      finally
        plMaterial.Clear;
        with pResSearch do
          for i := 0 to Count -1 do
            if objResSearch[i].Id = buscaId then
            begin
              plMaterial.Add(objResSearch[i].Codigo);
              EditCadastroCDMATERIAL.Text := objResSearch[i].Codigo;
              EditCadastroDEMATERIAL.Text := objResSearch[i].Nome2;
              EditCadastroSGEMBALAGEM.Text := objResSearch[i].Nome3;
              EditCadastroSGEMBALAGEMExit(EditCadastroSGEMBALAGEM);
              EditCadastroQTEQUIVALENCIA.Text := objResSearch[i].Nome4;
              populaMarcaModelo(objResSearch[i].Codigo);
            end;
      end;
    end;
  finally
    // Verifica se habilita os outros campos do material.
    controlaCamposMateriais((plMaterial.Count > 0));

    EditCadastroCDMATERIAL.Enabled := (plMaterial.Count = 0);
    EditCadastroDEMATERIAL.Enabled := (plMaterial.Count = 0);
    ButtonLimparMaterial.Enabled := (plMaterial.Count > 0);
    ButtonNovoMaterial.Enabled := (plMaterial.Count = 0);

    // Valida para qual campo vai se posicionar.
    if pAtivarControle then
      if plMaterial.Count > 0 then
      begin
        if ComboBoxCadastroMarcaModelo.Enabled then
          ActiveControl := ComboBoxCadastroMarcaModelo;
      end
      else
        if EditCadastroDEMATERIAL.Enabled then
          ActiveControl := EditCadastroDEMATERIAL;
  end;

  // Para que o evento volte a ser executado.
  EditCadastroCDMATERIAL.OnExit := EditCadastroCDMATERIALExit;
  EditCadastroDEMATERIAL.OnExit := EditCadastroDEMATERIALExit;
  EditCadastroDEMATERIAL.OnClickBtn := EditCadastroDEMATERIALClickBtn;
end;

procedure TfmAquisicaoItem.EditCadastroDEMATERIALExit(Sender: TObject);
var
  i: integer;
  vQuery: TZQuery;
begin
  if Length(Trim(EditCadastroDEMATERIAL.Text)) = 0 then
    Exit;

  // Para que o evento não seja executado.
  EditCadastroCDMATERIAL.OnExit := nil;
  EditCadastroDEMATERIAL.OnExit := nil;
  EditCadastroDEMATERIAL.OnClickBtn := nil;

  try
    vQuery := pMaterial.filtro;
    with vQuery do
    begin
      SQL.Add('WHERE UPPER("DE-Material") LIKE :DEMATERIAL');
      SQL.Add('  AND "NF-Código" LIKE :CDFAMILIA');
      Params.ParamByName('DEMATERIAL').AsString := '%'+AnsiUpperCase(EditCadastroDEMATERIAL.Text)+'%';
      Params.ParamByName('CDFAMILIA').AsString := EditCadastroCDFAMILIA.Text + '.%';
      dmPrincipal.executaConsulta(vQuery);

      if RecordCount > 1 then
      begin
        fmConFiltroMaterial := TfmConFiltroMaterial.Create(Self);
        with fmConFiltroMaterial do
        begin
          try
            setaTitulo('Consulta de Materiais');
            setaConsulta(pMaterial.filtro);
            setaOpcao('R');
            // Trata especificamente de relacionar o Material com a Família.
            setaFiltrosExtras('"NF-Código" LIKE ' + QuotedStr(EditCadastroCDFAMILIA.Text + '%'),
                              'Código da Família: '+EditCadastroCDFAMILIA.Text);
            executaFiltro(2,EditCadastroDEMATERIAL.Text);
            ShowModal;
          finally
            plMaterial.Clear;
            with pResSearch do
              for i := 0 to Count -1 do
                if objResSearch[i].Id = buscaId then
                begin
                  plMaterial.Add(objResSearch[i].Codigo);
                  EditCadastroCDMATERIAL.Text := objResSearch[i].Codigo;
                  EditCadastroDEMATERIAL.Text := objResSearch[i].Nome2;
                  EditCadastroSGEMBALAGEM.Text := objResSearch[i].Nome3;
                  EditCadastroSGEMBALAGEMExit(EditCadastroSGEMBALAGEM);
                  EditCadastroQTEQUIVALENCIA.Text := objResSearch[i].Nome4;
                  populaMarcaModelo(objResSearch[i].Codigo);
                end;
          end;
        end;
      end
      else
        if not Eof then
        begin
          plMaterial.Clear;
          plMaterial.Add(Fields.Fields[0].AsString);
          EditCadastroCDMATERIAL.Text := Fields.Fields[0].AsString;
          EditCadastroDEMATERIAL.Text := Fields.Fields[2].AsString;
          EditCadastroSGEMBALAGEM.Text := Fields.Fields[3].AsString;
          EditCadastroSGEMBALAGEMExit(EditCadastroSGEMBALAGEM);
          EditCadastroQTEQUIVALENCIA.Text := Fields.Fields[4].AsString;
          populaMarcaModelo(Fields.Fields[0].AsString);
        end
        else
          fmPrincipal.apresentaResultadoCadastro('Nenhum registro encontrado.');
      Active := false;
    end;
  finally
    FreeAndNil(vQuery);
    // Verifica se habilita os outros campos do material.
    controlaCamposMateriais((plMaterial.Count > 0));

    EditCadastroCDMATERIAL.Enabled := (plMaterial.Count = 0);
    EditCadastroDEMATERIAL.Enabled := (plMaterial.Count = 0);
    ButtonLimparMaterial.Enabled := (plMaterial.Count > 0);
    ButtonNovoMaterial.Enabled := (plMaterial.Count = 0);

    // Valida para qual campo vai se posicionar.
    if pAtivarControle then
      if plMaterial.Count > 0 then
      begin
        if ComboBoxCadastroMarcaModelo.Enabled then
          ActiveControl := ComboBoxCadastroMarcaModelo;
      end
      else
        if EditCadastroDEMATERIAL.Enabled then
          ActiveControl := EditCadastroDEMATERIAL;
  end;

  // Para que o evento volte a ser executado.
  EditCadastroCDMATERIAL.OnExit := EditCadastroCDMATERIALExit;
  EditCadastroDEMATERIAL.OnExit := EditCadastroDEMATERIALExit;
  EditCadastroDEMATERIAL.OnClickBtn := EditCadastroDEMATERIALClickBtn;
end;

procedure TfmAquisicaoItem.EditCadastroNMEMBALAGEMClickBtn(Sender: TObject);
var
  i: integer;
begin
  // Para que o evento não seja executado.
  EditCadastroCDEMBALAGEM.OnExit := nil;
  EditCadastroSGEMBALAGEM.OnExit := nil;
  EditCadastroNMEMBALAGEM.OnExit := nil;
  EditCadastroNMEMBALAGEM.OnClickBtn := nil;

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
      if plEmbalagem.Count > 0 then
      begin
        if ComboBoxCadastroMarcaModelo.Enabled then
          ActiveControl := ComboBoxCadastroMarcaModelo;
      end
      else
        if EditCadastroNMEMBALAGEM.Enabled then
          ActiveControl := EditCadastroNMEMBALAGEM;
  end;

  // Para que o evento volte a ser executado.
  EditCadastroCDEMBALAGEM.OnExit := EditCadastroCDEMBALAGEMExit;
  EditCadastroSGEMBALAGEM.OnExit := EditCadastroSGEMBALAGEMExit;
  EditCadastroNMEMBALAGEM.OnExit := EditCadastroNMEMBALAGEMExit;
  EditCadastroNMEMBALAGEM.OnClickBtn := EditCadastroNMEMBALAGEMClickBtn;
end;

procedure TfmAquisicaoItem.EditCadastroNMEMBALAGEMExit(Sender: TObject);
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
      if plEmbalagem.Count > 0 then
      begin
        if ComboBoxCadastroMarcaModelo.Enabled then
          ActiveControl := ComboBoxCadastroMarcaModelo;
      end
      else
        if EditCadastroNMEMBALAGEM.Enabled then
          ActiveControl := EditCadastroNMEMBALAGEM;
  end;

  // Para que o evento volte a ser executado.
  EditCadastroCDEMBALAGEM.OnExit := EditCadastroCDEMBALAGEMExit;
  EditCadastroSGEMBALAGEM.OnExit := EditCadastroSGEMBALAGEMExit;
  EditCadastroNMEMBALAGEM.OnExit := EditCadastroNMEMBALAGEMExit;
  EditCadastroNMEMBALAGEM.OnClickBtn := EditCadastroNMEMBALAGEMClickBtn;
end;

procedure TfmAquisicaoItem.EditCadastroQTMATERIALExit(Sender: TObject);
var
  vQtde: integer;
  vValorTotal: double;
begin
  // Verifica se deve ser formatado o valor e calculado o total.
  if StrToInt(EditCadastroQTMATERIAL.Text) = 0 then
    Exit;
  if EditCadastroVLUNITARIO.Value = 0 then
    Exit;

  try
    vQtde := StrToInt(EditCadastroQTMATERIAL.Text) * StrToInt(EditCadastroQTEQUIVALENCIA.Text);
    vValorTotal := (vQtde * EditCadastroVLUNITARIO.Value) + (vQtde * EditCadastroVLGARANTIA.Value);
    EditCadastroVLTOTAL.Value := fmPrincipal.fnGeral.Arredonda(vValorTotal,-2);
  except
    on E: EDivByZero do
      MessageBox(fmPrincipal.Handle,
                 PWideChar('Ocorreu um erro de divisão por zero.'+#13+#10+
                           'Por favor, verifique os valores informados.'),
                 cTituloMensagemErro,
                 MB_OK or MB_ICONERROR);
    on E: Exception do
      MessageBox(fmPrincipal.Handle,
                 PWideChar('Ocorreu um erro de cálculo.'+#13+#10+
                           'Erro encontrado: '+#13+#10+E.Message+#13+#10+
                           'Por favor, verifique os valores informados.'),
                 cTituloMensagemErro,
                 MB_OK or MB_ICONERROR);
  end;
end;

procedure TfmAquisicaoItem.EditCadastroSGEMBALAGEMExit(Sender: TObject);
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
      if plEmbalagem.Count > 0 then
      begin
        if ComboBoxCadastroMarcaModelo.Enabled then
          ActiveControl := ComboBoxCadastroMarcaModelo;
      end
      else
        if EditCadastroSGEMBALAGEM.Enabled then
          ActiveControl := EditCadastroSGEMBALAGEM;
  end;

  // Para que o evento volte a ser executado.
  EditCadastroCDEMBALAGEM.OnExit := EditCadastroCDEMBALAGEMExit;
  EditCadastroSGEMBALAGEM.OnExit := EditCadastroSGEMBALAGEMExit;
  EditCadastroNMEMBALAGEM.OnExit := EditCadastroNMEMBALAGEMExit;
  EditCadastroNMEMBALAGEM.OnClickBtn := EditCadastroNMEMBALAGEMClickBtn;
end;

procedure TfmAquisicaoItem.EditCadastroVLGARANTIAExit(Sender: TObject);
var
  vQtde: integer;
  vValorTotal: double;
begin
  try
    vQtde := StrToInt(EditCadastroQTMATERIAL.Text) * StrToInt(EditCadastroQTEQUIVALENCIA.Text);
    vValorTotal := (vQtde * EditCadastroVLUNITARIO.Value) + (vQtde * EditCadastroVLGARANTIA.Value);
    EditCadastroVLTOTAL.Value := fmPrincipal.fnGeral.Arredonda(vValorTotal,-2);
  except
    on E: EDivByZero do
      MessageBox(fmPrincipal.Handle,
                 PWideChar('Ocorreu um erro de divisão por zero.'+#13+#10+
                           'Por favor, verifique os valores informados.'),
                 cTituloMensagemErro,
                 MB_OK or MB_ICONERROR);
    on E: Exception do
      MessageBox(fmPrincipal.Handle,
                 PWideChar('Ocorreu um erro de cálculo.'+#13+#10+
                           'Erro encontrado: '+#13+#10+E.Message+#13+#10+
                           'Por favor, verifique os valores informados.'),
                 cTituloMensagemErro,
                 MB_OK or MB_ICONERROR);
  end;
end;

procedure TfmAquisicaoItem.EditCadastroVLUNITARIOExit(Sender: TObject);
var
  vQtde: integer;
  vValorTotal: double;
begin
  try
    vQtde := StrToInt(EditCadastroQTMATERIAL.Text) * StrToInt(EditCadastroQTEQUIVALENCIA.Text);
    vValorTotal := (vQtde * EditCadastroVLUNITARIO.Value) + (vQtde * EditCadastroVLGARANTIA.Value);
    EditCadastroVLTOTAL.Value := fmPrincipal.fnGeral.Arredonda(vValorTotal,-2);
  except
    on E: EDivByZero do
      MessageBox(fmPrincipal.Handle,
                 PWideChar('Ocorreu um erro de divisão por zero.'+#13+#10+
                           'Por favor, verifique os valores informados.'),
                 cTituloMensagemErro,
                 MB_OK or MB_ICONERROR);
    on E: Exception do
      MessageBox(fmPrincipal.Handle,
                 PWideChar('Ocorreu um erro de cálculo.'+#13+#10+
                           'Erro encontrado: '+#13+#10+E.Message+#13+#10+
                           'Por favor, verifique os valores informados.'),
                 cTituloMensagemErro,
                 MB_OK or MB_ICONERROR);
  end;
end;

procedure TfmAquisicaoItem.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfmAquisicaoItem.FormCreate(Sender: TObject);
begin
  try
    CreateGUID(pId);

    Color := Self.Color;
    FormStyler.AutoThemeAdapt := false;

    plTipoMovimento := TStringList.Create;
    plFamilia := TStringList.Create;
    plMaterial := TStringList.Create;
    plEmbalagem := TStringList.Create;
    plMarcaModelo := TStringList.Create;

    pFamilia := TFamilia.Create;
    pMaterial := TMaterial.Create;
    pEmbalagem := TEmbalagem.Create;

    EditCadastroVLUNITARIO.Button.Flat := true;
    EditCadastroVLGARANTIA.Button.Flat := true;
    EditCadastroVLTOTAL.Button.Flat := true;

    ComboBoxCadastroMarcaModelo.AutoThemeAdapt := false;
    CheckBoxCadastroFLGARANTIAATIVA.Themed := true;

    carregaImagensBotoes;

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

procedure TfmAquisicaoItem.FormDestroy(Sender: TObject);
begin
  FreeAndNil(plTipoMovimento);
  FreeAndNil(plFamilia);
  FreeAndNil(plMaterial);
  FreeAndNil(plEmbalagem);
  FreeAndNil(plMarcaModelo);
  FreeAndNil(pFamilia);
  FreeAndNil(pMaterial);
  FreeAndNil(pEmbalagem);
end;

procedure TfmAquisicaoItem.FormResize(Sender: TObject);
var
  vEspacamentoFinal, vEspacamentoEntre: integer;
begin
  vEspacamentoFinal := fmPrincipal.EspacamentoFinalBotao;
  vEspacamentoEntre := fmPrincipal.EspacamentoEntreBotoes;

  BitBtnFechar.Left := PanelBotoes.Width - BitBtnFechar.Width - vEspacamentoFinal;
  BitBtnRestaurar.Left := BitBtnFechar.Left - BitBtnRestaurar.Width - vEspacamentoEntre;
  BitBtnAplicar.Left := BitBtnRestaurar.Left - BitBtnAplicar.Width - vEspacamentoEntre;
end;

procedure TfmAquisicaoItem.habilitaTudo;
begin
  // Eventos.
  EditCadastroCDEMBALAGEM.OnExit := EditCadastroCDEMBALAGEMExit;
  EditCadastroSGEMBALAGEM.OnExit := EditCadastroSGEMBALAGEMExit;
  EditCadastroNMEMBALAGEM.OnExit := EditCadastroNMEMBALAGEMExit;
  EditCadastroVLUNITARIO.OnExit := EditCadastroVLUNITARIOExit;
  EditCadastroQTMATERIAL.OnExit := EditCadastroQTMATERIALExit;
  EditCadastroCDMATERIAL.OnExit := EditCadastroCDMATERIALExit;
  EditCadastroDEMATERIAL.OnExit := EditCadastroDEMATERIALExit;
  EditCadastroCDMATERIAL.OnChange := EditCadastroCDMATERIALChange;

  // Componentes.
  BitBtnAplicar.Enabled := true;
  BitBtnRestaurar.Enabled := true;
  ButtonLimparMaterial.Enabled := true;
  ButtonNovoMaterial.Enabled := true;
  EditCadastroNUITEM.Enabled := true;
  EditCadastroVLUNITARIO.Enabled := true;
  EditCadastroCDFAMILIA.Enabled := true;
  EditCadastroDEFAMILIA.Enabled := true;
  ButtonLimparFamilia.Enabled := true;
  ButtonNovoFamilia.Enabled := true;
  EditCadastroCDEMBALAGEM.Enabled := true;
  EditCadastroSGEMBALAGEM.Enabled := true;
  EditCadastroNMEMBALAGEM.Enabled := true;
  EditCadastroCDMATERIAL.Enabled := true;
  EditCadastroVLGARANTIA.Enabled := true;
  EditCadastroVLTOTAL.Enabled := true;
  EditCadastroDTGARANTIA.Enabled := true;
  EditCadastroQTEQUIVALENCIA.Enabled := false;
  EditCadastroQTMATERIAL.Enabled := true;
  ComboBoxCadastroMarcaModelo.Enabled := true;
  EditCadastroDEMATERIAL.Enabled := true;
  ButtonLimparEmbalagem.Enabled := true;
  ButtonNovoEmbalagem.Enabled := true;
  CheckBoxCadastroFLGARANTIAATIVA.Enabled := true;
end;

procedure TfmAquisicaoItem.novoCadastro;
begin
  habilitaTudo;

  plMaterial.Clear;
  plEmbalagem.Clear;
  plMarcaModelo.Clear;
  plMarcaModelo.Clear;

  EditCadastroNUITEM.Text := IntToStr(pnuItem);
  ButtonLimparFamiliaClick(ButtonLimparFamilia);
  EditCadastroQTMATERIAL.Text := '1';
  EditCadastroVLUNITARIO.Value := 0;
  EditCadastroVLGARANTIA.Value := 0;
  EditCadastroVLTOTAL.Value := 0;
  EditCadastroDTGARANTIA.Clear;
  CheckBoxCadastroFLGARANTIAATIVA.Checked := false;

  if EditCadastroCDFAMILIA.Enabled then
    ActiveControl := EditCadastroCDFAMILIA;
end;

procedure TfmAquisicaoItem.obtemMarcaModelo(prmcdMarcaModelo: string;
  var prmcdMarca, prmcdModelo: integer);
var
  vAux: TStringList;
begin
  fmPrincipal.pLogSistema.Info('>> Obtem a Marca/Modelo.');
  if prmcdMarcaModelo = EmptyStr then
  begin
    prmcdMarca := -1;
    prmcdModelo := -1;
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

procedure TfmAquisicaoItem.populaMarcaModelo(prmcdMaterial: string);
var
  vQuery: TZQuery;
  vAux: TStringList;
  vcdMaterial, vcdMarca, vcdModelo: integer;
begin
  // Busca as Marcas / Modelos para o material informado.
  try
    fmPrincipal.pLogSistema.Info('>> Cadastro de Aquisição - Popula Marca/Modelo.');
    // Quebra o código do Material apenas no cdmaterial, que é a última parte.
    vAux := TStringList.Create;
    vAux.Delimiter := '.';
    vAux.DelimitedText := prmcdMaterial;
    vcdMaterial := StrToInt(vAux[2]);

    vQuery := TZQuery.Create(Self);
    with vQuery do
    begin
      SQL.Text := 'SELECT marca.cdmarca, modelo.cdmodelo, marca.nmmarca||'' - ''||modelo.nmmodelo AS NMMARCAMODELO';
      SQL.Add('FROM ' + cSchema + '.marca');
      SQL.Add('INNER JOIN ' + cSchema + '.modelo ON marca.cdmarca = modelo.cdmarca');
      SQL.Add('WHERE marca.flativo = ''S''');
      SQL.Add('  AND modelo.flativo = ''S''');
      SQL.Add('  AND EXISTS (SELECT 1');
      SQL.Add('              FROM ' + cSchema + '.materialmarcamodelo');
      SQL.Add('              WHERE materialmarcamodelo.cdmarca = marca.cdmarca');
      SQL.Add('                AND materialmarcamodelo.cdmodelo = modelo.cdmodelo');
      SQL.Add('                AND materialmarcamodelo.cdmaterial = :CDMATERIAL)');
      SQL.Add('ORDER BY 3');
      Params.ParamByName('CDMATERIAL').AsInteger := vcdMaterial;
      dmPrincipal.executaConsulta(vQuery);

      obtemMarcaModelo(cdMarcaModelo,vcdMarca,vcdModelo);
      plMarcaModelo.Clear;
      nmMarcaModelo := EmptyStr;
      ComboBoxCadastroMarcaModelo.Items.Clear;
      if not Eof then
      begin
        plMarcaModelo.Add(EmptyStr);
        ComboBoxCadastroMarcaModelo.Items.Add(EmptyStr);
        ComboBoxCadastroMarcaModelo.ItemIndex := 0;
      end;
      while not Eof do
      begin
        plMarcaModelo.Add(Fields.FieldByName('CDMARCA').AsString + ';' + Fields.FieldByName('CDMODELO').AsString);
        ComboBoxCadastroMarcaModelo.Items.Add(Fields.FieldByName('NMMARCAMODELO').AsString);
        // Armazena a Marca/Modelo do Material.
        if (vcdMarca = Fields.FieldByName('CDMARCA').AsInteger) and (vcdModelo = Fields.FieldByName('CDMODELO').AsInteger) then
          nmMarcaModelo := Fields.FieldByName('NMMARCAMODELO').AsString;

        Next;
      end;
      Active := false;
    end;
  finally
    FreeAndNil(vAux);
    FreeAndNil(vQuery);
  end;
end;

procedure TfmAquisicaoItem.preencheCampos;
begin
  try
    EditCadastroNUITEM.Text := IntToStr(nuItem);
    EditCadastroCDFAMILIA.Text := cdFamilia;
    if cdFamilia <> EmptyStr then
      EditCadastroCDFAMILIAExit(EditCadastroCDFAMILIA);
    EditCadastroCDMATERIAL.Text := cdMaterial;
    if cdMaterial <> EmptyStr then
    begin
      EditCadastroCDMATERIALExit(EditCadastroCDMATERIAL);
      with ComboBoxCadastroMarcaModelo do
        ItemIndex := Items.IndexOf(nmMarcaModelo);
    end;
    EditCadastroQTMATERIAL.Text := IntToStr(qtMaterial);
    EditCadastroVLUNITARIO.Value := vlUnitario;
    EditCadastroVLGARANTIA.Value := vlGarantia;
    if vlUnitario <> 0 then
      EditCadastroVLGARANTIAExit(EditCadastroVLGARANTIA);
    if dtGarantia > -1 then
      EditCadastroDTGARANTIA.Date := dtGarantia
    else
      EditCadastroDTGARANTIA.Clear;
    CheckBoxCadastroFLGARANTIAATIVA.Checked := (flGarantiaAtiva = 'S');
  except
    on E: Exception do
      raise;
  end;
end;

end.
