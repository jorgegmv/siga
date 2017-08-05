unit unCadReceitaConfiguracao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, DateUtils, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, AdvAppStyler, AdvGlowButton, AdvFontCombo,
  AdvSpin, AdvEdit, AdvMoneyEdit, AdvCombo, AdvEdBtn, AdvPanel, Vcl.ExtCtrls,
  AdvOfficeButtons, PlannerDatePicker;

type
  TfmCadReceitaConfiguracao = class(TForm)
    FormStyler: TAdvFormStyler;
    PanelBotoes: TAdvPanel;
    BitBtnFechar: TAdvGlowButton;
    BitBtnAplicar: TAdvGlowButton;
    PanelInfo: TAdvPanel;
    LabelCamposRequeridos: TLabel;
    PanelTitulos: TAdvPanel;
    LabelDataPagamento: TLabel;
    LabelValorPago: TLabel;
    PanelCampos: TAdvPanel;
    CheckBoxIncrementarMesPagamento: TAdvOfficeCheckBox;
    EditCadastroVLPAGO: TAdvMoneyEdit;
    DatePickerEditCadastroDTPAGAMENTO: TPlannerDatePicker;
    procedure BitBtnFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormResize(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtnAplicarClick(Sender: TObject);
  private
    { Private declarations }
    pId: TGUID;
    pValorPago: currency;
    pDataPagamento: TDateTime;
    pIncrementarMes: boolean;
    procedure configuraCampos;
  public
    { Public declarations }
    property ValorPago: currency read pValorPago write pValorPago;
    property DataPagamento: TDateTime read pDataPagamento write pDataPagamento;
    property IncrementarMes: boolean read pIncrementarMes write pIncrementarMes;
  end;

var
  fmCadReceitaConfiguracao: TfmCadReceitaConfiguracao;

implementation

{$R *.dfm}

uses unPrincipal, unCadFormaPagamento, undmPrincipal, undmEstilo,
  unConFiltroPadrao, unCadFornecedor;

procedure TfmCadReceitaConfiguracao.BitBtnAplicarClick(Sender: TObject);
var
  vMensagem: string;
begin
  // Realiza validações.
  vMensagem := EmptyStr;
  if EditCadastroVLPAGO.Value = 0 then
    vMensagem := vMensagem + #13+#10'- O valor pago deve ser maior que zero.'+#13+#10+
                 'Favor informar um valor pago maior que zero.';
  if DatePickerEditCadastroDTPAGAMENTO.IsDateValid = false then
      vMensagem := vMensagem + #13+#10'- A data de pagamento deve ser uma data válida, no formato Ano/Mês/Dia.'+#13+#10+
                   'Favor informar uma data de pagamento no formato válido.';

  if vMensagem <> EmptyStr then
  begin
    MessageBox(fmPrincipal.Handle,
			         PWideChar(vMensagem),
			         cTituloMensagemErro,
			         MB_OK or MB_ICONERROR);
    ActiveControl := EditCadastroVLPAGO;
    Exit;
  end;
  // Fim Realiza validações.

  // Seta os valores;
  ValorPago := EditCadastroVLPAGO.Value;
  DataPagamento := DatePickerEditCadastroDTPAGAMENTO.Date;
  IncrementarMes := CheckBoxIncrementarMesPagamento.Checked;

  Close;
end;

procedure TfmCadReceitaConfiguracao.BitBtnFecharClick(Sender: TObject);
begin
  ValorPago := -1;
  Close;
end;

procedure TfmCadReceitaConfiguracao.configuraCampos;
begin
  EditCadastroVLPAGO.Value := ValorPago;
  DatePickerEditCadastroDTPAGAMENTO.Date := DataPagamento;
  CheckBoxIncrementarMesPagamento.Checked := IncrementarMes;

  ActiveControl := EditCadastroVLPAGO;
end;

procedure TfmCadReceitaConfiguracao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfmCadReceitaConfiguracao.FormCreate(Sender: TObject);
begin
  try
    CreateGUID(pId);

    Color := Self.Color;
    FormStyler.AutoThemeAdapt := false;

    // Inicializa os valores;
    ValorPago := -1;
    DataPagamento := -1;
    IncrementarMes := false;
    ValorPago := -1;

    EditCadastroVLPAGO.Button.Flat := true;
    EditCadastroVLPAGO.Button.Glyph.Assign(fmPrincipal.fnGeral.obtemImagemCalculadora);
    CheckBoxIncrementarMesPagamento.Themed := true;

    FormResize(Sender);
  except
    on E: Exception do
    begin
      fmPrincipal.manipulaExcecoes(Sender,E);
      Close;
    end;
  end;
end;

procedure TfmCadReceitaConfiguracao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Exit;
end;

procedure TfmCadReceitaConfiguracao.FormResize(Sender: TObject);
begin
  BitBtnFechar.Left := PanelBotoes.Width - BitBtnFechar.Width - fmPrincipal.EspacamentoFinalBotao;
  BitBtnAplicar.Left := BitBtnFechar.Left - BitBtnAplicar.Width - fmPrincipal.EspacamentoEntreBotoes;
end;

procedure TfmCadReceitaConfiguracao.FormShow(Sender: TObject);
begin
  configuraCampos;
end;

end.
