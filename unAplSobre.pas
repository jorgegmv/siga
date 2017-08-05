unit unAplSobre;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, AdvAppStyler, AdvPanel, AdvMemo,
  AdvGroupBox, AdvGlowButton;

type
  TfmAplSobre = class(TForm)
    PanelBotoes: TAdvPanel;
    FormStyler: TAdvFormStyler;
    PanelCentral: TAdvPanel;
    LabelCriador: TLabel;
    LabelDireitosAutorais: TLabel;
    LabelVersao: TLabel;
    LabelUso: TLabel;
    LabelDetalhes: TLabel;
    LabelLicenca: TLabel;
    GroupBoxHistoricoVersoes: TAdvGroupBox;
    GroupBoxNotasVersoesAnteriores: TAdvGroupBox;
    GroupBoxNotasVersoesAtuais: TAdvGroupBox;
    MemoNotasVersoesAnteriores: TAdvMemo;
    MemoNotasVersoesAtuais: TAdvMemo;
    BitBtnFechar: TAdvGlowButton;
    procedure BitBtnFecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    pId: TGUID;
  public
    { Public declarations }
  end;

var
  fmAplSobre: TfmAplSobre;

implementation

uses unPrincipal, undmEstilo;

{$R *.dfm}

procedure TfmAplSobre.BitBtnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfmAplSobre.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfmAplSobre.FormCreate(Sender: TObject);
begin
  CreateGUID(pId);

  Color := Self.Color;

  Caption := 'Sobre o ' + fmPrincipal.NomeSistema;
  LabelVersao.Caption := LabelVersao.Caption + ' ' + fmPrincipal.fnGeral.obtemVersaoSistema;

  BitBtnFechar.Left := PanelBotoes.Width - 80;
end;

procedure TfmAplSobre.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Exit;
end;

end.
