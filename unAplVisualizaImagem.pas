unit unAplVisualizaImagem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ImgList, AdvPanel, AdvAppStyler;

type
  TfmAplVisualizaImagem = class(TForm)
    FormStyler: TAdvFormStyler;
    PanelBarraInferior: TAdvPanel;
    PanelCentral: TAdvPanel;
    Image: TImage;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ImageClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    pId: TGUID;
  public
    { Public declarations }
    procedure setaImagem(prmImagem, prmDescricao: string);
  end;

var
  fmAplVisualizaImagem: TfmAplVisualizaImagem;

implementation

uses unPrincipal, undmEstilo;

{$R *.dfm}

procedure TfmAplVisualizaImagem.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfmAplVisualizaImagem.FormCreate(Sender: TObject);
begin
  try
    CreateGUID(pId);

    Color := Self.Color;
    FormStyler.AutoThemeAdapt := false;
  except
    on E: Exception do
    begin
      fmPrincipal.manipulaExcecoes(Sender,E);
      Close;
    end;
  end;
end;

procedure TfmAplVisualizaImagem.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Exit;
end;

procedure TfmAplVisualizaImagem.ImageClick(Sender: TObject);
begin
  Close;
end;

procedure TfmAplVisualizaImagem.setaImagem(prmImagem, prmDescricao: string);
var
  vNomeImagem: string;
  vFigura: TPicture;
begin
  vNomeImagem := ExtractFileName(prmImagem);
  PanelBarraInferior.Caption.Text := ' ' + prmDescricao;
  Image.Picture.LoadFromFile(prmImagem);

  // Redimensionando o form de acordo com o tamanho da imagem.
  try
    vFigura := TPicture.Create;
    vFigura.LoadFromFile(prmImagem);
    Width := vFigura.Width + 22;
    Height := vFigura.Height + 68;
    if Width > 800 then
      Width := 600;
    if Height > 600 then
      Height := 600;
  finally
    FreeAndNil(vFigura);
  end;
end;

end.
