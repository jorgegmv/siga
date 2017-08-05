unit unAplEditaTexto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, AdvPanel, AdvGlassButton, Xml.XMLDoc,
  System.Contnrs, AdvAppStyler, AdvGlowButton;

type
  TfmAplEditaTexto = class(TForm)
    PanelBotoes: TAdvPanel;
    PanelCentral: TAdvPanel;
    FormStyler: TAdvFormStyler;
    BitBtnFechar: TAdvGlowButton;
    BitBtnSalvar: TAdvGlowButton;
    BitBtnLimpar: TAdvGlowButton;
    BitBtnRestaurar: TAdvGlowButton;
    MemoEditor: TMemo;
    procedure BitBtnLimparClick(Sender: TObject);
    procedure BitBtnFecharClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtnSalvarClick(Sender: TObject);
    procedure BitBtnRestaurarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    pId: TGUID;
    pTexto: TStrings;
    pSomenteLeitura: boolean;
    procedure setaTexto(prmTexto: TStrings);
    procedure setaSomenteLeitura(prmSomenteLeitura: boolean);
    function obtemTexto: TStrings;
    function obtemSomenteLeitura: boolean;
  public
    { Public declarations }
    property Texto: TStrings read obtemTexto write setaTexto;
    property SomenteLeitura: boolean read obtemSomenteLeitura write setaSomenteLeitura;
  end;

var
  fmAplEditaTexto: TfmAplEditaTexto;

implementation

{$R *.dfm}

uses unPrincipal, undmEstilo;

procedure TfmAplEditaTexto.BitBtnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfmAplEditaTexto.BitBtnLimparClick(Sender: TObject);
begin
  MemoEditor.Lines.Clear;
end;

procedure TfmAplEditaTexto.BitBtnRestaurarClick(Sender: TObject);
begin
  MemoEditor.Lines.Text := Texto.Text;
end;

procedure TfmAplEditaTexto.BitBtnSalvarClick(Sender: TObject);
begin
  Texto := MemoEditor.Lines;
  Close;
end;

procedure TfmAplEditaTexto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfmAplEditaTexto.FormCreate(Sender: TObject);
begin
  try
    CreateGUID(pId);

    Color := Self.Color;
    FormStyler.AutoThemeAdapt := false;

    pTexto := TStringList.Create;
    Texto.Clear;

    FormResize(Sender);
  except
    on E: Exception do
    begin
      fmPrincipal.manipulaExcecoes(Sender,E);
      Close;
    end;
  end;
end;

procedure TfmAplEditaTexto.FormResize(Sender: TObject);
begin
  BitBtnFechar.Left := PanelBotoes.Width - BitBtnFechar.Width - fmPrincipal.EspacamentoFinalBotao;
  BitBtnRestaurar.Left := BitBtnFechar.Left - BitBtnRestaurar.Width - fmPrincipal.EspacamentoEntreBotoes;
  BitBtnLimpar.Left := BitBtnRestaurar.Left - BitBtnLimpar.Width - fmPrincipal.EspacamentoEntreBotoes;
  BitBtnSalvar.Left := BitBtnLimpar.Left - BitBtnSalvar.Width - fmPrincipal.EspacamentoEntreBotoes;
end;

procedure TfmAplEditaTexto.FormShow(Sender: TObject);
begin
  MemoEditor.Lines.Text := Texto.Text;
  BitBtnSalvar.Enabled := not SomenteLeitura;
  BitBtnLimpar.Enabled := not SomenteLeitura;
  BitBtnRestaurar.Enabled := not SomenteLeitura;
  MemoEditor.Enabled := not SomenteLeitura;
end;

function TfmAplEditaTexto.obtemSomenteLeitura: boolean;
begin
  Result := pSomenteLeitura;
end;

function TfmAplEditaTexto.obtemTexto: TStrings;
begin
  Result := pTexto;
end;

procedure TfmAplEditaTexto.setaSomenteLeitura(prmSomenteLeitura: boolean);
begin
  pSomenteLeitura := prmSomenteLeitura;
end;

procedure TfmAplEditaTexto.setaTexto(prmTexto: TStrings);
begin
  pTexto := prmTexto;
end;

end.
