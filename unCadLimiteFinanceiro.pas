unit unCadLimiteFinanceiro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Vcl.Imaging.pngimage, AdvAppStyler, AdvEdit,
  AdvMoneyEdit, AdvPanel, AdvOfficeImage, Vcl.ExtCtrls, AdvOfficeButtons,
  AdvGlowButton;

type
  TfmCadLimiteFinanceiro = class(TForm)
    FormStyler: TAdvFormStyler;
    EditSaldoMinimoMensal: TAdvMoneyEdit;
    EditValorLimiteDespesaMensal: TAdvMoneyEdit;
    EditSaldoMetaMensal: TAdvMoneyEdit;
    PanelBotoes: TAdvPanel;
    BitBtnFechar: TAdvGlowButton;
    BitBtnSalvar: TAdvGlowButton;
    PanelInformações: TAdvPanel;
    ImageStatus1: TAdvOfficeImage;
    ImageStatus2: TAdvOfficeImage;
    ImageStatus3: TAdvOfficeImage;
    PanelCampos: TAdvPanel;
    PanelTitulos: TAdvPanel;
    LabelLimiteDespesas: TLabel;
    LabelSaldoMinimo: TLabel;
    LabelMetaSaldo: TLabel;
    PanelGeral: TAdvPanel;
    CheckBoxCadastroFLVISIVEL: TAdvOfficeCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtnFecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BitBtnSalvarClick(Sender: TObject);
  private
    { Private declarations }
    pId: TGUID;
  public
    { Public declarations }
  end;

var
  fmCadLimiteFinanceiro: TfmCadLimiteFinanceiro;

implementation

{$R *.dfm}

uses unPrincipal, undmPrincipal, undmEstilo;

procedure TfmCadLimiteFinanceiro.BitBtnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfmCadLimiteFinanceiro.BitBtnSalvarClick(Sender: TObject);
begin
  try
    ImageStatus1.Visible := false;
    ImageStatus2.Visible := false;
    ImageStatus3.Visible := false;
    with fmPrincipal do
    begin
      try
        SaldoMinimoMensal := EditSaldoMinimoMensal.Value;
        ImageStatus1.Picture.LoadFromFile(LocalAplicacao + 'Images\ok-16-green.png');
        ImageStatus1.Visible := true;
      except
        on E: exception do
        begin
          ImageStatus1.Picture.LoadFromFile(LocalAplicacao + 'Images\error-16-red.png');
          ImageStatus1.Visible := true;
          raise;
        end;
      end;

      try
        ValorLimiteDespesaMensal := EditValorLimiteDespesaMensal.Value;
        ImageStatus2.Picture.LoadFromFile(LocalAplicacao + 'Images\ok-16-green.png');
        ImageStatus2.Visible := true;
      except
        on E: exception do
        begin
          ImageStatus2.Picture.LoadFromFile(LocalAplicacao + 'Images\error-16-red.png');
          ImageStatus2.Visible := true;
          raise;
        end;
      end;

      try
        SaldoMetaMensal := EditSaldoMetaMensal.Value;
        ImageStatus3.Picture.LoadFromFile(LocalAplicacao + 'Images\ok-16-green.png');
        ImageStatus3.Visible := true;
      except
        on E: exception do
        begin
          ImageStatus3.Picture.LoadFromFile(LocalAplicacao + 'Images\error-16-red.png');
          ImageStatus3.Visible := true;
          raise;
        end;
      end;

      PainelStatusFinanceiroVisivel := CheckBoxCadastroFLVISIVEL.Checked;
    end;
  except
    on E: exception do
      fmPrincipal.manipulaExcecoes(Sender,E);
  end;
end;

procedure TfmCadLimiteFinanceiro.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfmCadLimiteFinanceiro.FormCreate(Sender: TObject);
begin
  try
    CreateGUID(pId);

    Color := Self.Color;
    FormStyler.AutoThemeAdapt := false;

    PanelInformações.TextVAlign := tvaCenter;

    EditSaldoMinimoMensal.Button.Flat := true;
    EditValorLimiteDespesaMensal.Button.Flat := true;
    EditSaldoMetaMensal.Button.Flat := true;

    EditSaldoMinimoMensal.Button.Glyph.Assign(fmPrincipal.fnGeral.obtemImagemCalculadora);
    EditValorLimiteDespesaMensal.Button.Glyph.Assign(fmPrincipal.fnGeral.obtemImagemCalculadora);
    EditSaldoMetaMensal.Button.Glyph.Assign(fmPrincipal.fnGeral.obtemImagemCalculadora);

    ImageStatus1.Picture.LoadFromFile(fmPrincipal.LocalIcones + 'ok-green-16.png');
    ImageStatus2.Picture.LoadFromFile(fmPrincipal.LocalIcones + 'ok-green-16.png');
    ImageStatus3.Picture.LoadFromFile(fmPrincipal.LocalIcones + 'ok-green-16.png');

    with fmPrincipal do
    begin
      EditSaldoMinimoMensal.Value := SaldoMinimoMensal;
      EditValorLimiteDespesaMensal.Value := ValorLimiteDespesaMensal;
      EditSaldoMetaMensal.Value := SaldoMetaMensal;
      CheckBoxCadastroFLVISIVEL.Checked := PainelStatusFinanceiroVisivel;
    end;
  except
    on E: Exception do
    begin
      fmPrincipal.manipulaExcecoes(Sender,E);
      Close;
    end;
  end;
end;

procedure TfmCadLimiteFinanceiro.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Exit;
end;

procedure TfmCadLimiteFinanceiro.FormResize(Sender: TObject);
var
  vEspacamentoEntre, vEspacamentoFinal: integer;
begin
  vEspacamentoEntre := fmPrincipal.EspacamentoEntreBotoes;
  vEspacamentoFinal := fmPrincipal.EspacamentoFinalBotao;

  BitBtnFechar.Left := PanelBotoes.Width - BitBtnFechar.Width - vEspacamentoFinal;
  BitBtnSalvar.Left := BitBtnFechar.Left - BitBtnSalvar.Width - vEspacamentoEntre;
end;

end.
