unit unAplOrdenaGrid;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, AdvObj, BaseGrid, AdvGrid, AdvCGrid, StrUtils, Vcl.ComCtrls,
  Vcl.ToolWin, AeroLabel, Vcl.ExtCtrls, AdvPanel, AdvAppStyler, AdvGlowButton,
  AdvToolBar;

type
  TfmAplOrdenaGrid = class(TForm)
    ColumnGridOrdenacao: TAdvColumnGrid;
    FormStyler: TAdvFormStyler;
    DockPaneOpcoes: TAdvDockPanel;
    ToolBarOpcoes: TAdvToolBar;
    ButtonSelecionarTodos: TAdvGlowButton;
    ButtonAplicar: TAdvGlowButton;
    ButtonCancelar: TAdvGlowButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ColumnGridOrdenacaoComboChange(Sender: TObject; ACol, ARow,
      AItemIndex: Integer; ASelection: string);
    procedure FormCreate(Sender: TObject);
    procedure ButtonSelecionarTodosClick(Sender: TObject);
    procedure ButtonAplicarClick(Sender: TObject);
    procedure ButtonCancelarClick(Sender: TObject);
  private
    { Private declarations }
    pId: TGUID;
    pCampos, pCamposRetorno: string;
    pSelecionarTodos, pSelecionado: boolean;
    procedure setaCampos(prmCampos: string);
    function obtemCampos: string;
    procedure setaCamposRetorno(prmCamposRetorno: string);
    procedure aplicarFiltro;
    function obtemCamposRetorno: string;
  public
    { Public declarations }
    function buscaId: cardinal;
    procedure carregaImagensBotoes;
    property Campos: string read obtemCampos write setaCampos;
    property CamposRetorno: string read obtemCamposRetorno write setaCamposRetorno;
  end;

var
  fmAplOrdenaGrid: TfmAplOrdenaGrid;

implementation

{$R *.dfm}

uses unPrincipal, undmEstilo;

procedure TfmAplOrdenaGrid.aplicarFiltro;
var
  i: integer;
  vRetorno: string;
  vFlag: char;
begin
  vRetorno := EmptyStr;
  vFlag := 'N';
  with ColumnGridOrdenacao do
    for i:= 1 to RowCount-1 do
    begin
      if IsChecked(0,i) = true then
      begin
        vRetorno := vRetorno + '|"' + ColumnByName['Campo'].Rows[i] + '":"S":"' + ColumnByName['Ordem'].Rows[i] + '"|;';
        vFlag := 'S';
      end
      else
        vRetorno := vRetorno + '|"' + ColumnByName['Campo'].Rows[i] + '":"N":"' + ColumnByName['Ordem'].Rows[i] + '"|;'
    end;

  if vFlag = 'N' then
  begin
    MessageBox(fmPrincipal.Handle,
               PWideChar('Nenhum Campo foi selecionado, a ordenação não poderá ser aplicada.'#13#10+
                         'A ordenação anterior será mantida para a listagem dos dados.'),
               cTituloMensagemInformacao,
               MB_OK or MB_ICONINFORMATION);
    CamposRetorno := Campos;
  end
  else
  begin
    pSelecionado := true;
    CamposRetorno := Copy(vRetorno,1,Length(vRetorno)-1);
  end;
end;

function TfmAplOrdenaGrid.buscaId: cardinal;
begin
  Result := pId.D1;
end;

procedure TfmAplOrdenaGrid.ButtonAplicarClick(Sender: TObject);
begin
  aplicarFiltro;
  Close;
end;

procedure TfmAplOrdenaGrid.ButtonCancelarClick(Sender: TObject);
begin
  setaCampos(Campos);
  CamposRetorno := Campos;
  Close;
end;

procedure TfmAplOrdenaGrid.ButtonSelecionarTodosClick(Sender: TObject);
begin
  if pSelecionarTodos = true then
    ColumnGridOrdenacao.CheckAll(0)
  else
    ColumnGridOrdenacao.UnCheckAll(0);
  pSelecionarTodos := not pSelecionarTodos;
end;

procedure TfmAplOrdenaGrid.carregaImagensBotoes;
begin
  ButtonSelecionarTodos.Picture.LoadFromFile(fmPrincipal.LocalIcones + 'view-details-e-16.png');
  ButtonSelecionarTodos.HotPicture.LoadFromFile(fmPrincipal.LocalIcones + 'view-details-h-16.png');
  ButtonSelecionarTodos.DisabledPicture.LoadFromFile(fmPrincipal.LocalIcones + 'view-details-d-16.png');
  ButtonAplicar.Picture.LoadFromFile(fmPrincipal.LocalIcones + 'ok-e-16.png');
  ButtonAplicar.HotPicture.LoadFromFile(fmPrincipal.LocalIcones + 'ok-h-16.png');
  ButtonAplicar.DisabledPicture.LoadFromFile(fmPrincipal.LocalIcones + 'ok-d-16.png');
  ButtonCancelar.Picture.LoadFromFile(fmPrincipal.LocalIcones + 'cancel-e-16.png');
  ButtonCancelar.HotPicture.LoadFromFile(fmPrincipal.LocalIcones + 'cancel-h-16.png');
  ButtonCancelar.DisabledPicture.LoadFromFile(fmPrincipal.LocalIcones + 'cancel-d-16.png');
end;

procedure TfmAplOrdenaGrid.ColumnGridOrdenacaoComboChange(Sender: TObject; ACol,
  ARow, AItemIndex: Integer; ASelection: string);
begin
  ColumnGridOrdenacao.ColumnByName['Ordem'].Rows[ARow] := ASelection;
end;

procedure TfmAplOrdenaGrid.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  // Se somente saiu, sem aplicar alterações, retorna com o padrão anterior.
  if not pSelecionado then
    CamposRetorno := Campos;

  Action := caFree;
end;

procedure TfmAplOrdenaGrid.FormCreate(Sender: TObject);
var
  i: integer;
begin
  try
    CreateGUID(pId);

    Color := Self.Color;
    FormStyler.AutoThemeAdapt := false;

    // Configura a Grid.
    with ColumnGridOrdenacao do
    begin
      DrawingStyle := gdsThemed;
      AutoThemeAdapt := false;
      for i := 0 to ColCount -1 do
        Columns[i].ShowBands := true;
      Bands.Active := true;
    end;

    carregaImagensBotoes;

    pSelecionarTodos := true;
    CamposRetorno := Campos;
  except
    on E: Exception do
    begin
      fmPrincipal.manipulaExcecoes(Sender,E);
      Close;
    end;
  end;
end;

function TfmAplOrdenaGrid.obtemCampos: string;
begin
  Result := pCampos;
end;

function TfmAplOrdenaGrid.obtemCamposRetorno: string;
begin
  Result := pCamposRetorno;
end;

procedure TfmAplOrdenaGrid.setaCampos(prmCampos: string);
var
  i: integer;
  vAux, vAux2: TStringList;
begin
  pCampos := prmCampos;

  // Passa para a Grid.
  vAux := TStringList.Create;
  vAux2 := TStringList.Create;
  try
    with ColumnGridOrdenacao do
    begin
      BeginUpdate;
      ClearRows(1,RowCount-1);

      vAux.Delimiter := ';';
      vAux.QuoteChar := '|';
      vAux2.Delimiter := ':';
      vAux2.QuoteChar := '"';

      vAux.DelimitedText := pCampos;
      RowCount := vAux.Count+1;

      // Preenche a Grid.
      for i := 0 to vAux.Count-1 do
      begin
        vAux2.Clear;
        vAux2.DelimitedText := vAux[i];

        if vAux2[1] = 'S' then
          AddCheckBox(0,i+1,true,false)
        else
          AddCheckBox(0,i+1,false,false);
        ColumnByName['Campo'].Rows[i+1] := vAux2[0];
        ColumnByName['Ordem'].Rows[i+1] := vAux2[2];
      end;
      EndUpdate;
    end;
  finally
    FreeAndNil(vAux);
    FreeAndNil(vAux2);
  end;
end;

procedure TfmAplOrdenaGrid.setaCamposRetorno(prmCamposRetorno: string);
begin
  pCamposRetorno := prmCamposRetorno;
end;

end.

