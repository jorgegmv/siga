unit unCadInvestimentoLimite;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, DateUtils, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, AdvAppStyler, AdvGlowButton, AdvFontCombo,
  AdvSpin, AdvEdit, AdvMoneyEdit, AdvCombo, AdvEdBtn, AdvPanel, Vcl.ExtCtrls;

type
  TfmCadInvestimentoLimite = class(TForm)
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
    EditCadastroValorInvestimento: TAdvMoneyEdit;
    EditCadastroValorSaldo: TAdvMoneyEdit;
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
    pValorInvestimento: currency;
  public
    { Public declarations }
    procedure configuraCampos;
    property ValorInvestimento: currency read pValorInvestimento write pValorInvestimento;
    property Usuario: string read pUsuario write pUsuario;
  end;

var
  fmCadInvestimentoLimite: TfmCadInvestimentoLimite;

implementation

{$R *.dfm}

uses unPrincipal, undmEstilo;

procedure TfmCadInvestimentoLimite.BitBtnAplicarClick(Sender: TObject);
var
  vMensagem: string;
begin
  // Realiza validações.
  vMensagem := EmptyStr;
  if EditCadastroValorInvestimento.Value = 0 then
    vMensagem := vMensagem + #13+#10'- O Valor do Investimento deve ser maior que zero.'+#13+#10+
                 'Favor informar um valor maior que zero para o Valor do Investimento.';
  if EditCadastroValorInvestimento.Value > EditCadastroValorSaldo.Value then
    vMensagem := vMensagem + #13+#10'- O Valor do Investimento ultrapassa o seu Saldo Disponível.'+#13+#10+
                 'Favor informar no Valor do Investimento um valor menor que o seu Saldo Disponível.';

  if vMensagem <> EmptyStr then
  begin
    MessageBox(fmPrincipal.Handle,
			         PWideChar(vMensagem),
			         cTituloMensagemErro,
			         MB_OK or MB_ICONERROR);
    ActiveControl := EditCadastroValorInvestimento;
    Exit;
  end;
  // Fim Realiza validações.

  // Seta os valores;
  ValorInvestimento := EditCadastroValorInvestimento.Value;

  Close;
end;

procedure TfmCadInvestimentoLimite.BitBtnFecharClick(Sender: TObject);
begin
  ValorInvestimento := -1;
  Close;
end;

procedure TfmCadInvestimentoLimite.configuraCampos;
begin
  EditCadastroValorSaldo.Value := fmPrincipal.fnGeral.obtemSaldoFinanceiro(Usuario);
  if ValorInvestimento > -1 then
    EditCadastroValorInvestimento.Value := ValorInvestimento
  else
    EditCadastroValorInvestimento.Value := 0;
  ActiveControl := EditCadastroValorInvestimento;
end;

procedure TfmCadInvestimentoLimite.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfmCadInvestimentoLimite.FormCreate(Sender: TObject);
begin
  try
    CreateGUID(pId);

    Color := Self.Color;
    FormStyler.AutoThemeAdapt := false;

    ValorInvestimento := -1;

    EditCadastroValorSaldo.Button.Flat := true;
    EditCadastroValorInvestimento.Button.Flat := true;

    EditCadastroValorSaldo.Button.Glyph.Assign(fmPrincipal.fnGeral.obtemImagemCalculadora);
    EditCadastroValorInvestimento.Button.Glyph.Assign(fmPrincipal.fnGeral.obtemImagemCalculadora);

    FormResize(Sender);
  except
    on E: Exception do
    begin
      fmPrincipal.manipulaExcecoes(Sender,E);
      Close;
    end;
  end;
end;

procedure TfmCadInvestimentoLimite.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Exit;
end;

procedure TfmCadInvestimentoLimite.FormResize(Sender: TObject);
begin
  BitBtnFechar.Left := PanelBotoes.Width - BitBtnFechar.Width - fmPrincipal.EspacamentoFinalBotao;
  BitBtnAplicar.Left := BitBtnFechar.Left - BitBtnAplicar.Width - fmPrincipal.EspacamentoEntreBotoes;
end;

procedure TfmCadInvestimentoLimite.FormShow(Sender: TObject);
begin
  configuraCampos;
end;

end.
