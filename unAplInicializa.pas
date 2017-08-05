unit unAplInicializa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  AdvCircularProgress, Vcl.StdCtrls, AdvGroupBox, Vcl.ExtCtrls, AdvPanel,
  AdvAppStyler;

type
  TfmAplInicializa = class(TForm)
    PanelCentral: TAdvPanel;
    GroupBoxOperacao: TAdvGroupBox;
    LabelOperacao: TLabel;
    ProgressInicializacao: TAdvCircularProgress;
    FormStyler: TAdvFormStyler;
    Label1: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmAplInicializa: TfmAplInicializa;

implementation

uses unPrincipal, undmPrincipal, undmEstilo;

{$R *.dfm}

procedure TfmAplInicializa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfmAplInicializa.FormCreate(Sender: TObject);
begin
  Color := Self.Color;
  FormStyler.AutoThemeAdapt := false;
end;

end.
