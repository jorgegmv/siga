unit unAplConfiguracoes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Vcl.Imaging.pngimage, AdvAppStyler, AdvEdit,
  AdvMoneyEdit, AdvPanel, AdvOfficeImage, Vcl.ExtCtrls, AdvOfficeButtons,
  AdvGlowButton, AdvGroupBox;

type
  TfmAplConfiguracoes = class(TForm)
    FormStyler: TAdvFormStyler;
    PanelBotoes: TAdvPanel;
    BitBtnFechar: TAdvGlowButton;
    BitBtnAplicar: TAdvGlowButton;
    PanelCampos: TAdvPanel;
    PanelGeral: TAdvPanel;
    GroupBoxNotificacaoEmail: TAdvGroupBox;
    CheckBoxCadastroReceita: TAdvOfficeCheckBox;
    CheckBoxCadastroDespesa: TAdvOfficeCheckBox;
    CheckBoxCadastroAquisicao: TAdvOfficeCheckBox;
    CheckBoxCadastroInvestimento: TAdvOfficeCheckBox;
    GroupBoxIntegracaoWindows: TAdvGroupBox;
    CheckBoxIniciarWindows: TAdvOfficeCheckBox;
    CheckBoxIniciarMaximizado: TAdvOfficeCheckBox;
    CheckBoxIconeBandeja: TAdvOfficeCheckBox;
    CheckBoxExibirImagemMaterial: TAdvOfficeCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtnFecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BitBtnAplicarClick(Sender: TObject);
  private
    { Private declarations }
    pId: TGUID;
    FAplicar: boolean;
  public
    { Public declarations }
    property Aplicar: boolean read FAplicar write FAplicar;
  end;

var
  fmAplConfiguracoes: TfmAplConfiguracoes;

implementation

{$R *.dfm}

uses unPrincipal, undmPrincipal, undmEstilo;

procedure TfmAplConfiguracoes.BitBtnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfmAplConfiguracoes.BitBtnAplicarClick(Sender: TObject);
begin
  Aplicar := true;
  fmPrincipal.apresentaResultadoCadastro('Configurações atualizadas com sucesso.');
end;

procedure TfmAplConfiguracoes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfmAplConfiguracoes.FormCreate(Sender: TObject);
begin
  try
    CreateGUID(pId);

    Color := Self.Color;
    FormStyler.AutoThemeAdapt := false;

    with fmPrincipal do
    begin
      CheckBoxCadastroReceita.Checked := SempreEnviaEmailCadastroReceita;
      CheckBoxCadastroDespesa.Checked := SempreEnviaEmailCadastroDespesa;
      CheckBoxCadastroAquisicao.Checked := SempreEnviaEmailCadastroAquisicao;
      CheckBoxCadastroInvestimento.Checked := SempreEnviaEmailCadastroInvestimento;

      CheckBoxIniciarWindows.Checked := IniciarComSistema;
      CheckBoxIniciarMaximizado.Checked := IniciarMaximizado;
      CheckBoxIconeBandeja.Checked := TrayIcon.Active;

      CheckBoxExibirImagemMaterial.Checked := ExibirImagemMaterial;
    end;

    Aplicar := false;
  except
    on E: Exception do
    begin
      fmPrincipal.manipulaExcecoes(Sender,E);
      Close;
    end;
  end;
end;

procedure TfmAplConfiguracoes.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Exit;
end;

procedure TfmAplConfiguracoes.FormResize(Sender: TObject);
var
  vEspacamentoEntre, vEspacamentoFinal: integer;
begin
  vEspacamentoEntre := fmPrincipal.EspacamentoEntreBotoes;
  vEspacamentoFinal := fmPrincipal.EspacamentoFinalBotao;

  BitBtnFechar.Left := PanelBotoes.Width - BitBtnFechar.Width - vEspacamentoFinal;
  BitBtnAplicar.Left := BitBtnFechar.Left - BitBtnAplicar.Width - vEspacamentoEntre;
end;

end.
