unit unCadInvestimentoSaqueParcial;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, DateUtils, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, AdvAppStyler, AdvGlowButton, AdvFontCombo,
  AdvSpin, AdvEdit, AdvMoneyEdit, AdvCombo, AdvEdBtn, AdvPanel, Vcl.ExtCtrls;

type
  TfmCadInvestimentoSaqueParcial = class(TForm)
    FormStyler: TAdvFormStyler;
    PanelBotoes: TAdvPanel;
    BitBtnFechar: TAdvGlowButton;
    BitBtnAplicar: TAdvGlowButton;
    PanelInfo: TAdvPanel;
    LabelCamposRequeridos: TLabel;
    PanelTitulos: TAdvPanel;
    LabelSaldo: TLabel;
    LabelValorInvestimento: TLabel;
    PanelCampos: TAdvPanel;
    EditCadastroValorSaque: TAdvMoneyEdit;
    EditCadastroValorInvestimentoAtual: TAdvMoneyEdit;
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
    pUsuario: string;
    pValorInvestimentoAtual, pValorInvestimento: currency;
  public
    { Public declarations }
    procedure configuraCampos;
    property ValorInvestimentoAtual: currency read pValorInvestimentoAtual write pValorInvestimentoAtual;
    property ValorInvestimento: currency read pValorInvestimento write pValorInvestimento;
    property Usuario: string read pUsuario write pUsuario;
  end;

var
  fmCadInvestimentoSaqueParcial: TfmCadInvestimentoSaqueParcial;

implementation

{$R *.dfm}

uses unPrincipal, undmEstilo;

procedure TfmCadInvestimentoSaqueParcial.BitBtnAplicarClick(Sender: TObject);
var
  vMensagem: string;
begin
  // Realiza validações.
  vMensagem := EmptyStr;
  if EditCadastroValorSaque.Value = 0 then
    vMensagem := vMensagem + #13+#10'- O Valor a Sacar deve ser maior que zero.'+#13+#10+
                 'Favor informar um valor maior que zero para ser sacado.';
  if EditCadastroValorSaque.Value > EditCadastroValorInvestimentoAtual.Value then
    vMensagem := vMensagem + #13+#10'- O Valor do Saque ultrapassa o Valor do Investimento Atual.'+#13+#10+
                 'Favor informar no Valor a Sacar um valor menor que o Valor do Investimento Atual.';
  if EditCadastroValorSaque.Value = EditCadastroValorInvestimentoAtual.Value then
    vMensagem := vMensagem + #13+#10'- O Valor do Saque é igual ao Valor do Investimento Atual.'+#13+#10+
                 'Favor informar no Valor a Sacar um valor menor que o Valor do Investimento Atual.';

  if vMensagem <> EmptyStr then
  begin
    MessageBox(fmPrincipal.Handle,
			         PWideChar(vMensagem),
			         cTituloMensagemErro,
			         MB_OK or MB_ICONERROR);
    ActiveControl := EditCadastroValorSaque;
    Exit;
  end;
  // Fim Realiza validações.

  // Seta os valores;
  ValorInvestimento := EditCadastroValorSaque.Value;

  Close;
end;

procedure TfmCadInvestimentoSaqueParcial.BitBtnFecharClick(Sender: TObject);
begin
  ValorInvestimento := -1;
  Close;
end;

procedure TfmCadInvestimentoSaqueParcial.configuraCampos;
begin
  EditCadastroValorInvestimentoAtual.Value := ValorInvestimentoAtual;
  EditCadastroValorSaque.Value := 0;
  ActiveControl := EditCadastroValorSaque;
end;

procedure TfmCadInvestimentoSaqueParcial.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfmCadInvestimentoSaqueParcial.FormCreate(Sender: TObject);
begin
  try
    CreateGUID(pId);

    Color := Self.Color;
    FormStyler.AutoThemeAdapt := false;

    ValorInvestimento := -1;

    EditCadastroValorInvestimentoAtual.Button.Flat := true;
    EditCadastroValorSaque.Button.Flat := true;

    EditCadastroValorInvestimentoAtual.Button.Glyph.Assign(fmPrincipal.fnGeral.obtemImagemCalculadora);
    EditCadastroValorSaque.Button.Glyph.Assign(fmPrincipal.fnGeral.obtemImagemCalculadora);

    FormResize(Sender);
  except
    on E: Exception do
    begin
      fmPrincipal.manipulaExcecoes(Sender,E);
      Close;
    end;
  end;
end;

procedure TfmCadInvestimentoSaqueParcial.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Exit;
end;

procedure TfmCadInvestimentoSaqueParcial.FormResize(Sender: TObject);
begin
  BitBtnFechar.Left := PanelBotoes.Width - BitBtnFechar.Width - fmPrincipal.EspacamentoFinalBotao;
  BitBtnAplicar.Left := BitBtnFechar.Left - BitBtnAplicar.Width - fmPrincipal.EspacamentoEntreBotoes;
end;

procedure TfmCadInvestimentoSaqueParcial.FormShow(Sender: TObject);
begin
  configuraCampos;
end;

end.
