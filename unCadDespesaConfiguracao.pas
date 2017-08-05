unit unCadDespesaConfiguracao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, DateUtils, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, AdvAppStyler, AdvGlowButton, AdvFontCombo,
  AdvSpin, AdvEdit, AdvMoneyEdit, AdvCombo, AdvEdBtn, AdvPanel, Vcl.ExtCtrls,
  unFornecedor, unFormaPagamento;

type
  TfmCadDespesaConfiguracao = class(TForm)
    FormStyler: TAdvFormStyler;
    PanelBotoes: TAdvPanel;
    BitBtnFechar: TAdvGlowButton;
    BitBtnAplicar: TAdvGlowButton;
    PanelInfo: TAdvPanel;
    LabelCamposRequeridos: TLabel;
    PanelTitulos: TAdvPanel;
    LabelPeriodo: TLabel;
    LabelValorDespesa: TLabel;
    LabelDiaVencimento: TLabel;
    LabelFormaPagamento: TLabel;
    LabelFornecedor: TLabel;
    PanelCampos: TAdvPanel;
    ButtonLimparFormaPagamento: TAdvGlowButton;
    ButtonLimparFornecedor: TAdvGlowButton;
    ButtonNovoFormaPagamento: TAdvGlowButton;
    ButtonNovoFornecedor: TAdvGlowButton;
    ComboBoxCadastroMesEncerramento: TAdvOfficeComboBox;
    ComboBoxCadastroMesInicio: TAdvOfficeComboBox;
    ComboEditCadastroNMFORMAPAGAMENTO: TAdvEditBtn;
    ComboEditCadastroNMFORNECEDOR: TAdvEditBtn;
    EditCadastroCDFORMAPAGAMENTO: TAdvEdit;
    EditCadastroCDFORNECEDOR: TAdvEdit;
    LabelPeriodoSeparador: TLabel;
    LabelPeriodoSeparador2: TLabel;
    LabelPeriodoSeparador3: TLabel;
    SpinEditCadastroAnoEncerramento: TAdvSpinEdit;
    SpinEditCadastroAnoInicio: TAdvSpinEdit;
    SpinEditCadastroDiaVencimento: TAdvSpinEdit;
    EditCadastroValorDespesa: TAdvMoneyEdit;
    procedure BitBtnFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormResize(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtnAplicarClick(Sender: TObject);
    procedure ButtonLimparFormaPagamentoClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ButtonNovoFormaPagamentoClick(Sender: TObject);
    procedure EditCadastroCDFORMAPAGAMENTOExit(Sender: TObject);
    procedure ComboEditCadastroNMFORMAPAGAMENTOExit(Sender: TObject);
    procedure ButtonLimparFornecedorClick(Sender: TObject);
    procedure ButtonNovoFornecedorClick(Sender: TObject);
    procedure EditCadastroCDFORNECEDORExit(Sender: TObject);
    procedure ComboEditCadastroNMFORNECEDORExit(Sender: TObject);
    procedure ComboEditCadastroNMFORMAPAGAMENTOClickBtn(Sender: TObject);
    procedure ComboEditCadastroNMFORNECEDORClickBtn(Sender: TObject);
  private
    { Private declarations }
    pId: TGUID;
    plFormaPagamento, plFornecedor: TStringList;
    pFornecedor: TFornecedor;
    pFormaPagamento: TFormaPagamento;
    FMesInicio, FMesEncerramento, FAnoInicio, FAnoEncerramento,
    FDiaVencimento, FFormaPagamento, FFornecedor: integer;
    FValorDespesa: currency;
    procedure configuraCampos;
    procedure carregaImagensBotoes;
  public
    { Public declarations }
    property MesInicio: integer read FMesInicio write FMesInicio;
    property MesEncerramento: integer read FMesEncerramento write FMesEncerramento;
    property AnoInicio: integer read FAnoInicio write FAnoInicio;
    property AnoEncerramento: integer read FAnoEncerramento write FAnoEncerramento;
    property DiaVencimento: integer read FDiaVencimento write FDiaVencimento;
    property ValorDespesa: currency read FValorDespesa write FValorDespesa;
    property FormaPagamento: integer read FFormaPagamento write FFormaPagamento;
    property Fornecedor: integer read FFornecedor write FFornecedor;
  end;

var
  fmCadDespesaConfiguracao: TfmCadDespesaConfiguracao;

implementation

{$R *.dfm}

uses unPrincipal, unCadFormaPagamento, undmPrincipal, undmEstilo,
  unConFiltroPadrao, unCadFornecedor;

procedure TfmCadDespesaConfiguracao.BitBtnAplicarClick(Sender: TObject);
var
  vMensagem: string;
begin
  // Realiza validações.
  vMensagem := EmptyStr;
  if SpinEditCadastroAnoInicio.Value > SpinEditCadastroAnoEncerramento.Value then
    vMensagem := '- O ano inicial deve ser inferior ao ano de encerramento.'#13#10'Favor informar um ano inicial inferior ao ano de encerramento.'#13+#10;
  if SpinEditCadastroAnoInicio.Value = SpinEditCadastroAnoEncerramento.Value then
    if ComboBoxCadastroMesInicio.ItemIndex > ComboBoxCadastroMesEncerramento.ItemIndex then
      vMensagem := vMensagem + '- O mês inicial deve ser inferior ao mês de encerramento.'#13#10'Favor informar um mês inicial inferior ao mês de encerramento.'#13+#10;
  if EditCadastroValorDespesa.Value = 0 then
    vMensagem := vMensagem + '- O valor da despesa deve ser maior que zero.'#13#10'Favor informar um valor maior que zero para o valor da despesa.';

  if vMensagem <> EmptyStr then
  begin
    MessageBox(fmPrincipal.Handle, PWideChar(vMensagem), cTituloMensagemErro, MB_OK or MB_ICONERROR);
    ActiveControl := ComboBoxCadastroMesInicio;
    Exit;
  end;
  // Fim Realiza validações.

  // Seta os valores;
  MesInicio := ComboBoxCadastroMesInicio.ItemIndex;
  MesEncerramento := ComboBoxCadastroMesEncerramento.ItemIndex;
  AnoInicio := Trunc(SpinEditCadastroAnoInicio.Value);
  AnoEncerramento := Trunc(SpinEditCadastroAnoEncerramento.Value);
  DiaVencimento := Trunc(SpinEditCadastroDiaVencimento.Value);
  ValorDespesa := EditCadastroValorDespesa.Value;
  // Se selecionou, seta a forma de pagamento.
  if plFormaPagamento.Count > 0 then
    FormaPagamento := StrToInt(plFormaPagamento.Strings[0])
  else
    FormaPagamento := -1;
  // Se selecionou, seta a fornecedor.
  if plFornecedor.Count > 0 then
    Fornecedor := StrToInt(plFornecedor.Strings[0])
  else
    Fornecedor := -1;

  Close;
end;

procedure TfmCadDespesaConfiguracao.BitBtnFecharClick(Sender: TObject);
begin
  ValorDespesa := -1;
  Close;
end;

procedure TfmCadDespesaConfiguracao.ButtonLimparFormaPagamentoClick(
  Sender: TObject);
begin
  plFormaPagamento.Clear;

  EditCadastroCDFORMAPAGAMENTO.Clear;
  ComboEditCadastroNMFORMAPAGAMENTO.Clear;

  EditCadastroCDFORMAPAGAMENTO.Enabled := true;
  ComboEditCadastroNMFORMAPAGAMENTO.Enabled := true;
  ButtonLimparFormaPagamento.Enabled := false;
  ButtonNovoFormaPagamento.Enabled := true;
end;

procedure TfmCadDespesaConfiguracao.ButtonLimparFornecedorClick(
  Sender: TObject);
begin
  plFornecedor.Clear;

  EditCadastroCDFORNECEDOR.Clear;
  ComboEditCadastroNMFORNECEDOR.Clear;

  EditCadastroCDFORNECEDOR.Enabled := true;
  ComboEditCadastroNMFORNECEDOR.Enabled := true;
  ButtonLimparFornecedor.Enabled := false;
  ButtonNovoFornecedor.Enabled := true;
end;

procedure TfmCadDespesaConfiguracao.ButtonNovoFormaPagamentoClick(
  Sender: TObject);
var
  vcdFormaPagamento: integer;
begin
  vcdFormaPagamento := 0;
  try
    fmCadFormaPagamento := TfmCadFormaPagamento.Create(Self);
    with fmCadFormaPagamento do
    begin
      try
        Tag := 1;
        ShowModal;

        vcdFormaPagamento := fmCadFormaPagamento.Codigo;
      except
        on E: exception do
          raise exception.Create('Não foi possível abrir a tela de Cadastro de Forma de Pagamento.'+#13#10+E.Message);
      end;
    end;
  finally
    // Verifica se foi cadastrada uma forma de pagamento.
    if vcdFormaPagamento > 0 then
    begin
      ActiveControl := BitBtnAplicar;
      EditCadastroCDFORMAPAGAMENTO.Text := IntToStr(vcdFormaPagamento);
      EditCadastroCDFORMAPAGAMENTOExit(EditCadastroCDFORMAPAGAMENTO);
      ButtonLimparFormaPagamento.Enabled := true;
      ButtonNovoFormaPagamento.Enabled := false;
    end;
  end;
end;

procedure TfmCadDespesaConfiguracao.ButtonNovoFornecedorClick(Sender: TObject);
var
  vcdFornecedor: integer;
begin
  vcdFornecedor := 0;
  try
    fmCadFornecedor := TfmCadFornecedor.Create(Self);
    with fmCadFornecedor do
    begin
      try
        Tag := 1;
        ShowModal;

        vcdFornecedor := fmCadFornecedor.Codigo;
      except
        on E: exception do
          raise exception.Create('Não foi possível abrir a tela de Cadastro de Fornecedor.'+#13#10+E.Message);
      end;
    end;
  finally
    // Verifica se foi cadastrado um fornecedor.
    if vcdFornecedor > 0 then
    begin
      ActiveControl := BitBtnAplicar;
      EditCadastroCDFORNECEDOR.Text := IntToStr(vcdFornecedor);
      EditCadastroCDFORNECEDORExit(EditCadastroCDFORNECEDOR);
      ButtonLimparFornecedor.Enabled := true;
      ButtonNovoFornecedor.Enabled := false;
    end;
  end;
end;

procedure TfmCadDespesaConfiguracao.carregaImagensBotoes;
begin
  EditCadastroValorDespesa.Button.Glyph.Assign(fmPrincipal.fnGeral.obtemImagemCalculadora);
  ComboEditCadastroNMFORMAPAGAMENTO.Button.Glyph.Assign(fmPrincipal.fnGeral.obtemImagemPesquisa);
  ComboEditCadastroNMFORNECEDOR.Button.Glyph.Assign(fmPrincipal.fnGeral.obtemImagemPesquisa);

  ButtonLimparFormaPagamento.Picture.LoadFromFile(fmPrincipal.LocalIcones + 'erase-e-16.png');
  ButtonLimparFormaPagamento.HotPicture.LoadFromFile(fmPrincipal.LocalIcones + 'erase-h-16.png');
  ButtonLimparFormaPagamento.DisabledPicture.LoadFromFile(fmPrincipal.LocalIcones + 'erase-d-16.png');
  ButtonLimparFornecedor.Picture.LoadFromFile(fmPrincipal.LocalIcones + 'erase-e-16.png');
  ButtonLimparFornecedor.HotPicture.LoadFromFile(fmPrincipal.LocalIcones + 'erase-h-16.png');
  ButtonLimparFornecedor.DisabledPicture.LoadFromFile(fmPrincipal.LocalIcones + 'erase-d-16.png');
  ButtonNovoFormaPagamento.Picture.LoadFromFile(fmPrincipal.LocalIcones + 'new-e-16.png');
  ButtonNovoFormaPagamento.HotPicture.LoadFromFile(fmPrincipal.LocalIcones + 'new-h-16.png');
  ButtonNovoFormaPagamento.DisabledPicture.LoadFromFile(fmPrincipal.LocalIcones + 'new-d-16.png');
  ButtonNovoFornecedor.Picture.LoadFromFile(fmPrincipal.LocalIcones + 'new-e-16.png');
  ButtonNovoFornecedor.HotPicture.LoadFromFile(fmPrincipal.LocalIcones + 'new-h-16.png');
  ButtonNovoFornecedor.DisabledPicture.LoadFromFile(fmPrincipal.LocalIcones + 'new-d-16.png');
end;

procedure TfmCadDespesaConfiguracao.ComboEditCadastroNMFORMAPAGAMENTOClickBtn(
  Sender: TObject);
var
  i: integer;
begin
  // Para que o evento não seja executado.
  EditCadastroCDFORMAPAGAMENTO.OnExit := nil;
  ComboEditCadastroNMFORMAPAGAMENTO.OnExit := nil;
  ComboEditCadastroNMFORMAPAGAMENTO.OnClickBtn := nil;

  fmConFiltroPadrao := TfmConFiltroPadrao.Create(Self);
  try
    with fmConFiltroPadrao do
    begin
      try
        setaTitulo('Consulta de Formas de Pagamento');
        setaConsulta(pFormaPagamento.filtro);
        setaOpcao('R');
        executaFiltro(0,EmptyStr);
        ShowModal;
      finally
        plFormaPagamento.Clear;
        with pResSearch do
          for i := 0 to Count -1 do
            if objResSearch[i].Id = buscaId then
            begin
              plFormaPagamento.Add(objResSearch[i].Codigo);
              EditCadastroCDFORMAPAGAMENTO.Text := objResSearch[i].Codigo;
              ComboEditCadastroNMFORMAPAGAMENTO.Text := objResSearch[i].Nome1;
            end;
      end;
    end;
  finally
    EditCadastroCDFORMAPAGAMENTO.Enabled := (plFormaPagamento.Count = 0);
    ComboEditCadastroNMFORMAPAGAMENTO.Enabled := (plFormaPagamento.Count = 0);
    ButtonLimparFormaPagamento.Enabled := (plFormaPagamento.Count > 0);
    ButtonNovoFormaPagamento.Enabled := (plFormaPagamento.Count = 0);

    // Valida para qual campo vai se posicionar.
    if plFormaPagamento.Count > 0 then
      ActiveControl := EditCadastroCDFORNECEDOR
    else
      ActiveControl := ComboEditCadastroNMFORMAPAGAMENTO;
  end;

  // Para que o evento volte a ser executado.
  EditCadastroCDFORMAPAGAMENTO.OnExit := EditCadastroCDFORMAPAGAMENTOExit;
  ComboEditCadastroNMFORMAPAGAMENTO.OnExit := ComboEditCadastroNMFORMAPAGAMENTOExit;
  ComboEditCadastroNMFORMAPAGAMENTO.OnClickBtn := ComboEditCadastroNMFORMAPAGAMENTOClickBtn;
end;

procedure TfmCadDespesaConfiguracao.ComboEditCadastroNMFORMAPAGAMENTOExit(
  Sender: TObject);
var
  i: integer;
  vQuery: TZQuery;
begin
  if Length(Trim(ComboEditCadastroNMFORMAPAGAMENTO.Text)) = 0 then
    Exit;
  // Para que o evento não seja executado.
  EditCadastroCDFORMAPAGAMENTO.OnExit := nil;
  ComboEditCadastroNMFORMAPAGAMENTO.OnExit := nil;
  ComboEditCadastroNMFORMAPAGAMENTO.OnClickBtn := nil;

  try
    vQuery := pFormaPagamento.filtro;
    with vQuery do
    begin
      SQL.Add('WHERE UPPER("NM-Forma Pagamento") LIKE :NMFORMAPAGAMENTO');
      Params.ParamByName('NMFORMAPAGAMENTO').AsString := '%'+AnsiUpperCase(ComboEditCadastroNMFORMAPAGAMENTO.Text)+'%';
      dmPrincipal.executaConsulta(vQuery);

      if RecordCount > 1 then
      begin
        fmConFiltroPadrao := TfmConFiltroPadrao.Create(Self);
        with fmConFiltroPadrao do
        begin
          try
            setaTitulo('Consulta de Formas de Pagamento');
            setaConsulta(pFormaPagamento.filtro);
            setaOpcao('R');
            executaFiltro(2,ComboEditCadastroNMFORMAPAGAMENTO.Text);
            ShowModal;
          finally
            plFormaPagamento.Clear;
            with pResSearch do
              for i := 0 to Count -1 do
                if objResSearch[i].Id = buscaId then
                begin
                  plFormaPagamento.Add(objResSearch[i].Codigo);
                  EditCadastroCDFORMAPAGAMENTO.Text := objResSearch[i].Codigo;
                  ComboEditCadastroNMFORMAPAGAMENTO.Text := objResSearch[i].Nome1;
                end;
          end;
        end;
      end
      else
        if not Eof then
        begin
          plFormaPagamento.Clear;
          plFormaPagamento.Add(Fields.Fields[0].AsString);
          EditCadastroCDFORMAPAGAMENTO.Text := Fields.Fields[0].AsString;
          ComboEditCadastroNMFORMAPAGAMENTO.Text := Fields.Fields[1].AsString;
        end
        else
          fmPrincipal.apresentaResultadoCadastro('Nenhum registro encontrado.');
      Active := false;
    end;
  finally
    FreeAndNil(vQuery);

    EditCadastroCDFORMAPAGAMENTO.Enabled := (plFormaPagamento.Count = 0);
    ComboEditCadastroNMFORMAPAGAMENTO.Enabled := (plFormaPagamento.Count = 0);
    ButtonLimparFormaPagamento.Enabled := (plFormaPagamento.Count > 0);
    ButtonNovoFormaPagamento.Enabled := (plFormaPagamento.Count = 0);

    // Valida para qual campo vai se posicionar.
    if plFormaPagamento.Count > 0 then
      ActiveControl := EditCadastroCDFORNECEDOR
    else
      ActiveControl := ComboEditCadastroNMFORMAPAGAMENTO;
  end;

  // Para que o evento volte a ser executado.
  EditCadastroCDFORMAPAGAMENTO.OnExit := EditCadastroCDFORMAPAGAMENTOExit;
  ComboEditCadastroNMFORMAPAGAMENTO.OnExit := ComboEditCadastroNMFORMAPAGAMENTOExit;
  ComboEditCadastroNMFORMAPAGAMENTO.OnClickBtn := ComboEditCadastroNMFORMAPAGAMENTOClickBtn;
end;

procedure TfmCadDespesaConfiguracao.ComboEditCadastroNMFORNECEDORClickBtn(
  Sender: TObject);
var
  i: integer;
begin
  // Para que o evento não seja executado.
  EditCadastroCDFORNECEDOR.OnExit := nil;
  ComboEditCadastroNMFORNECEDOR.OnExit := nil;
  ComboEditCadastroNMFORNECEDOR.OnClickBtn := nil;

  fmConFiltroPadrao := TfmConFiltroPadrao.Create(Self);
  try
    with fmConFiltroPadrao do
    begin
      try
        setaTitulo('Consulta de Fornecedores');
        setaConsulta(pFornecedor.filtro);
        setaOpcao('R');
        executaFiltro(0,EmptyStr);
        ShowModal;
      finally
        plFornecedor.Clear;
        with pResSearch do
          for i := 0 to Count -1 do
            if objResSearch[i].Id = buscaId then
            begin
              plFornecedor.Add(objResSearch[i].Codigo);
              EditCadastroCDFORNECEDOR.Text := objResSearch[i].Codigo;
              ComboEditCadastroNMFORNECEDOR.Text := objResSearch[i].Nome2;
            end;
      end;
    end;
  finally
    EditCadastroCDFORNECEDOR.Enabled := (plFornecedor.Count = 0);
    ComboEditCadastroNMFORNECEDOR.Enabled := (plFornecedor.Count = 0);
    ButtonLimparFornecedor.Enabled := (plFornecedor.Count > 0);
    ButtonNovoFornecedor.Enabled := (plFornecedor.Count = 0);

    // Valida para qual campo vai se posicionar.
    if plFornecedor.Count > 0 then
      ActiveControl := BitBtnAplicar
    else
      ActiveControl := ComboEditCadastroNMFORNECEDOR;
  end;

  // Para que o evento volte a ser executado.
  EditCadastroCDFORNECEDOR.OnExit := EditCadastroCDFORNECEDORExit;
  ComboEditCadastroNMFORNECEDOR.OnExit := ComboEditCadastroNMFORNECEDORExit;
  ComboEditCadastroNMFORNECEDOR.OnClickBtn := ComboEditCadastroNMFORNECEDORClickBtn;
end;

procedure TfmCadDespesaConfiguracao.ComboEditCadastroNMFORNECEDORExit(
  Sender: TObject);
var
  i: integer;
  vQuery: TZQuery;
begin
  if Length(Trim(ComboEditCadastroNMFORNECEDOR.Text)) = 0 then
    Exit;
  // Para que o evento não seja executado.
  EditCadastroCDFORNECEDOR.OnExit := nil;
  ComboEditCadastroNMFORNECEDOR.OnExit := nil;
  ComboEditCadastroNMFORNECEDOR.OnClickBtn := nil;

  try
    vQuery := pFornecedor.filtro;
    with vQuery do
    begin
      SQL.Add('WHERE UPPER("NM-Fornecedor") LIKE :NMFORNECEDOR');
      Params.ParamByName('NMFORNECEDOR').AsString := '%'+AnsiUpperCase(ComboEditCadastroNMFORNECEDOR.Text)+'%';
      dmPrincipal.executaConsulta(vQuery);

      if RecordCount > 1 then
      begin
        fmConFiltroPadrao := TfmConFiltroPadrao.Create(Self);
        with fmConFiltroPadrao do
        begin
          try
            setaTitulo('Consulta de Fornecedores');
            setaConsulta(pFornecedor.filtro);
            setaOpcao('R');
            executaFiltro(2,ComboEditCadastroNMFORNECEDOR.Text);
            ShowModal;
          finally
            plFornecedor.Clear;
            with pResSearch do
              for i := 0 to Count -1 do
                if objResSearch[i].Id = buscaId then
                begin
                  plFornecedor.Add(objResSearch[i].Codigo);
                  EditCadastroCDFORNECEDOR.Text := objResSearch[i].Codigo;
                  ComboEditCadastroNMFORNECEDOR.Text := objResSearch[i].Nome2;
                end;
          end;
        end;
      end
      else
        if not Eof then
        begin
          plFornecedor.Clear;
          plFornecedor.Add(Fields.Fields[0].AsString);
          EditCadastroCDFORNECEDOR.Text := Fields.Fields[0].AsString;
          ComboEditCadastroNMFORNECEDOR.Text := Fields.Fields[2].AsString;
        end
        else
          fmPrincipal.apresentaResultadoCadastro('Nenhum registro encontrado.');
      Active := false;
    end;
  finally
    FreeAndNil(vQuery);

    EditCadastroCDFORNECEDOR.Enabled := (plFornecedor.Count = 0);
    ComboEditCadastroNMFORNECEDOR.Enabled := (plFornecedor.Count = 0);
    ButtonLimparFornecedor.Enabled := (plFornecedor.Count > 0);
    ButtonNovoFornecedor.Enabled := (plFornecedor.Count = 0);

    // Valida para qual campo vai se posicionar.
    if plFornecedor.Count > 0 then
      ActiveControl := BitBtnAplicar
    else
      ActiveControl := ComboEditCadastroNMFORNECEDOR;
  end;

  // Para que o evento volte a ser executado.
  EditCadastroCDFORNECEDOR.OnExit := EditCadastroCDFORNECEDORExit;
  ComboEditCadastroNMFORNECEDOR.OnExit := ComboEditCadastroNMFORNECEDORExit;
  ComboEditCadastroNMFORNECEDOR.OnClickBtn := ComboEditCadastroNMFORNECEDORClickBtn;
end;

procedure TfmCadDespesaConfiguracao.configuraCampos;
var
  vnuDia, vnuMes, vnuAno: integer;
begin
  // Formata os valores dos campos.
  vnuDia := DayOf(Now);
  vnuMes := MonthOfTheYear(Now);
  vnuAno := YearOf(Now);

  ComboBoxCadastroMesInicio.ItemIndex := vnuMes -1;
  with SpinEditCadastroAnoInicio do
    Value := vnuAno;
  if ComboBoxCadastroMesEncerramento.Items.Count <> vnuMes then
    ComboBoxCadastroMesEncerramento.ItemIndex := vnuMes
  else
    ComboBoxCadastroMesEncerramento.ItemIndex := 0;
  with SpinEditCadastroAnoEncerramento do
  begin
    Value := vnuAno;
    if ComboBoxCadastroMesEncerramento.ItemIndex = 0 then
      Value := Value + 1;
  end;

  SpinEditCadastroDiaVencimento.Value := vnuDia;
  EditCadastroValorDespesa.Value := 0;
  ActiveControl := ComboBoxCadastroMesInicio;
end;

procedure TfmCadDespesaConfiguracao.EditCadastroCDFORMAPAGAMENTOExit(
  Sender: TObject);
var
  vQuery: TZQuery;
begin
  // Se não digitou nada, sai sem abrir a search.
  if Length(Trim(EditCadastroCDFORMAPAGAMENTO.Text)) = 0 then
    Exit;

  // Para que o evento não seja executado.
  EditCadastroCDFORMAPAGAMENTO.OnExit := nil;
  ComboEditCadastroNMFORMAPAGAMENTO.OnExit := nil;
  ComboEditCadastroNMFORMAPAGAMENTO.OnClickBtn := nil;

  try
    vQuery := pFormaPagamento.filtro;
    with vQuery do
    begin
      SQL.Add('WHERE "NU-Código" = :CDFORMAPAGAMENTO');
      Params.ParamByName('CDFORMAPAGAMENTO').AsString := EditCadastroCDFORMAPAGAMENTO.Text;
      dmPrincipal.executaConsulta(vQuery);

      if not Eof then
      begin
        plFormaPagamento.Clear;
        plFormaPagamento.Add(Fields.Fields[0].AsString);
        EditCadastroCDFORMAPAGAMENTO.Text := Fields.Fields[0].AsString;
        ComboEditCadastroNMFORMAPAGAMENTO.Text := Fields.Fields[1].AsString;
      end
      else
      begin
        plFormaPagamento.Clear;
        EditCadastroCDFORMAPAGAMENTO.Clear;
        ComboEditCadastroNMFORMAPAGAMENTO.Clear;
        fmPrincipal.apresentaResultadoCadastro('Nenhum registro encontrado.');
      end;
      Active := false;
    end;
  finally
    FreeAndNil(vQuery);
    EditCadastroCDFORMAPAGAMENTO.Enabled := (plFormaPagamento.Count = 0);
    ComboEditCadastroNMFORMAPAGAMENTO.Enabled := (plFormaPagamento.Count = 0);
    ButtonLimparFormaPagamento.Enabled := (plFormaPagamento.Count > 0);
    ButtonNovoFormaPagamento.Enabled := (plFormaPagamento.Count = 0);
    // Se este painel estiver visível é porque a aquisição foi encerrada ou cancelada.

     // Valida para qual campo vai se posicionar.
    if plFormaPagamento.Count > 0 then
      ActiveControl := EditCadastroCDFORNECEDOR
    else
      ActiveControl := EditCadastroCDFORMAPAGAMENTO;
  end;

  // Para que o evento volte a ser executado.
  EditCadastroCDFORMAPAGAMENTO.OnExit := EditCadastroCDFORMAPAGAMENTOExit;
  ComboEditCadastroNMFORMAPAGAMENTO.OnExit := ComboEditCadastroNMFORMAPAGAMENTOExit;
  ComboEditCadastroNMFORMAPAGAMENTO.OnClickBtn := ComboEditCadastroNMFORMAPAGAMENTOClickBtn;
end;

procedure TfmCadDespesaConfiguracao.EditCadastroCDFORNECEDORExit(
  Sender: TObject);
var
  vQuery: TZQuery;
begin
  // Se não digitou nada, sai sem abrir a search.
  if Length(Trim(EditCadastroCDFORNECEDOR.Text)) = 0 then
    Exit;

  // Para que o evento não seja executado.
  EditCadastroCDFORNECEDOR.OnExit := nil;
  ComboEditCadastroNMFORNECEDOR.OnExit := nil;
  ComboEditCadastroNMFORNECEDOR.OnClickBtn := nil;

  try
    vQuery := pFornecedor.filtro;
    with vQuery do
    begin
      SQL.Add('WHERE "NU-Código" = :CDFORNECEDOR');
      Params.ParamByName('CDFORNECEDOR').AsString := EditCadastroCDFORNECEDOR.Text;
      dmPrincipal.executaConsulta(vQuery);

      if not Eof then
      begin
        plFornecedor.Clear;
        plFornecedor.Add(Fields.Fields[0].AsString);
        EditCadastroCDFORNECEDOR.Text := Fields.Fields[0].AsString;
        ComboEditCadastroNMFORNECEDOR.Text := Fields.Fields[2].AsString;
      end
      else
      begin
        plFornecedor.Clear;
        EditCadastroCDFORNECEDOR.Clear;
        ComboEditCadastroNMFORNECEDOR.Clear;
        fmPrincipal.apresentaResultadoCadastro('Nenhum registro encontrado.');
      end;
      Active := false;
    end;
  finally
    FreeAndNil(vQuery);
    EditCadastroCDFORNECEDOR.Enabled := (plFornecedor.Count = 0);
    ComboEditCadastroNMFORNECEDOR.Enabled := (plFornecedor.Count = 0);
    ButtonLimparFornecedor.Enabled := (plFornecedor.Count > 0);
    ButtonNovoFornecedor.Enabled := (plFornecedor.Count = 0);
    // Se este painel estiver visível é porque a aquisição foi encerrada ou cancelada.

     // Valida para qual campo vai se posicionar.
    if plFornecedor.Count > 0 then
      ActiveControl := BitBtnAplicar
    else
      ActiveControl := EditCadastroCDFORNECEDOR;
  end;

  // Para que o evento volte a ser executado.
  EditCadastroCDFORNECEDOR.OnExit := EditCadastroCDFORNECEDORExit;
  ComboEditCadastroNMFORNECEDOR.OnExit := ComboEditCadastroNMFORNECEDORExit;
  ComboEditCadastroNMFORNECEDOR.OnClickBtn := ComboEditCadastroNMFORNECEDORClickBtn;
end;

procedure TfmCadDespesaConfiguracao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfmCadDespesaConfiguracao.FormCreate(Sender: TObject);
begin
  try
    CreateGUID(pId);

    Color := Self.Color;
    FormStyler.AutoThemeAdapt := false;

    plFormaPagamento := TStringList.Create;
    plFornecedor := TStringList.Create;

    pFornecedor := TFornecedor.Create;
    pFormaPagamento := TFormaPagamento.Create;

    // Inicializa os valores;
    MesInicio := -1;
    MesEncerramento := -1;
    AnoInicio := -1;
    AnoEncerramento := -1;
    DiaVencimento := -1;
    ValorDespesa := -1;
    FormaPagamento := -1;

    ComboBoxCadastroMesEncerramento.AutoThemeAdapt := false;
    ComboBoxCadastroMesInicio.AutoThemeAdapt := false;
    EditCadastroValorDespesa.Button.Flat := true;

    carregaImagensBotoes;

    FormResize(Sender);
  except
    on E: Exception do
    begin
      fmPrincipal.manipulaExcecoes(Sender,E);
      Close;
    end;
  end;
end;

procedure TfmCadDespesaConfiguracao.FormDestroy(Sender: TObject);
begin
  FreeAndNil(plFormaPagamento);
  FreeAndNil(plFornecedor);
  FreeAndNil(pFornecedor);
  FreeAndNil(pFormaPagamento);
end;

procedure TfmCadDespesaConfiguracao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Exit;
end;

procedure TfmCadDespesaConfiguracao.FormResize(Sender: TObject);
begin
  BitBtnFechar.Left := PanelBotoes.Width - BitBtnFechar.Width - fmPrincipal.EspacamentoFinalBotao;
  BitBtnAplicar.Left := BitBtnFechar.Left - BitBtnAplicar.Width - fmPrincipal.EspacamentoEntreBotoes;
end;

procedure TfmCadDespesaConfiguracao.FormShow(Sender: TObject);
begin
  configuraCampos;
end;

end.
