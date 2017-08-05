unit unCadImagem;

interface

uses
  Windows, Messages, ShellAPI, SysUtils, Variants, StrUtils, Math, Classes,
  Mask, Buttons, MaskUtils, Registry, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ToolWin, ImgList, jpeg, StdCtrls, Menus, ExtCtrls, Grids, DB,
  AdvObj, BaseGrid, AdvGrid, AdvCGrid, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, AdvAppStyler, Vcl.ExtDlgs, AdvGlowButton, AdvEdit, AdvPanel,
  unMaterial, unDocumento;

type
  TfmCadImagem = class(TForm)
    QueryGeral: TZQuery;
    OpenPictureDialog: TOpenPictureDialog;
    FormStyler: TAdvFormStyler;
    PanelGeral: TAdvPanel;
    LabelImagem: TLabel;
    LabelDescricao: TLabel;
    LabelAlterarDescricao: TLabel;
    ColumnGridImagens: TAdvColumnGrid;
    PanelBotoes: TAdvPanel;
    EditCadastroDEIMAGEM: TAdvEdit;
    EditCadastroNMIMAGEM: TAdvEdit;
    ButtonIncluirImagem: TAdvGlowButton;
    ButtonExcluirImagem: TAdvGlowButton;
    ButtonSelecionarImagem: TAdvGlowButton;
    ButtonFechar: TAdvGlowButton;
    ButtonSalvar: TAdvGlowButton;
    ButtonExcluir: TAdvGlowButton;
    ImageList: TImageList;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ButtonFecharClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure LabelAlterarDescricaoClick(Sender: TObject);
    procedure ButtonIncluirImagemClick(Sender: TObject);
    procedure ButtonExcluirImagemClick(Sender: TObject);
    procedure ColumnGridImagensClickCell(Sender: TObject; ARow, ACol: Integer);
    procedure ButtonSalvarClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure ButtonExcluirClick(Sender: TObject);
    procedure ButtonSelecionarImagemClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    pId: TGUID;
    pOpcao: char;
    pcdMaterial: integer;
    pUltimoLocalSelecionado: string;
    pMaterial: TMaterial;
    pDocumento: TDocumento;
    procedure limpaGrid;
    procedure limpaImagem;
    procedure desabilitaAcoes;
    procedure carregaImagensBotoes;
    procedure carregaImagensGrid;
  public
    { Public declarations }
    procedure setacdMaterial(prmcdMaterial: integer);
    procedure carregaImagensMaterial;
  end;

var
  fmCadImagem: TfmCadImagem;

implementation

uses undmPrincipal, unPrincipal, unAplVisualizaImagem, undmEstilo;

{$R *.dfm}

procedure TfmCadImagem.ButtonExcluirClick(Sender: TObject);
var
  vcdImagem: integer;
begin
  vcdImagem := 0;
  desabilitaAcoes;
  try
    with ColumnGridImagens do
    begin
      if Row > 0 then
        vcdImagem := ColumnByName['CDIMAGEM'].Ints[Row];
      if vcdImagem = 0 then
        Exit;

      // Valida se realmente o usuário quer realizar a exclusão.
      if MessageBox(fmPrincipal.Handle,
                    PWideChar('Deseja realmente realizar a exclusão da imagem?'),
                    cTituloMensagemConfirmacao,
                    MB_YESNO or MB_ICONQUESTION or MB_DEFBUTTON2) = IDNO then
        Exit;

      try
        pMaterial.Codigo := pcdMaterial;
        pMaterial.Documento := vcdImagem;
        if pMaterial.excluiMaterialImagem = 0 then
          raise exception.Create('Imagem do material a ser excluída não foi encontrada.');
        pDocumento.Codigo := vcdImagem;
        if pDocumento.exclui = 0 then
          raise exception.Create('Imagem ser excluída não foi encontrada.');
        // Exclui o documento fisicamente.
        SysUtils.DeleteFile(ColumnByName['NMIMAGEM'].Rows[Row]);

        carregaImagensMaterial;

        fmPrincipal.apresentaResultadoCadastro('Cadastro excluído com sucesso.');
      except
        on E: exception do
        begin
          fmPrincipal.apresentaResultadoCadastro(E.Message);
          fmPrincipal.manipulaExcecoes(Sender,E);
        end;
      end;
    end;
  finally
    ButtonSelecionarImagem.Enabled := true;
    ButtonSalvar.Enabled := true;
    ButtonExcluir.Enabled := true;
    ButtonFechar.Enabled := true;
    ActiveControl := ColumnGridImagens;
  end;
end;

procedure TfmCadImagem.ButtonExcluirImagemClick(Sender: TObject);
begin
  with ColumnGridImagens do
    if Enabled then
      if RowCount > 2 then
        RemoveRows(Row,1)
      else
        ClearRows(Row,1);
end;

procedure TfmCadImagem.ButtonFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfmCadImagem.ButtonIncluirImagemClick(Sender: TObject);
var
  i: integer;
  vlcImagem: string;
begin
  // Realiza validações.
  if EditCadastroNMIMAGEM.Text = EmptyStr then
    Exit;

  vlcImagem := StringReplace(EditCadastroNMIMAGEM.Text,'"',EmptyStr,[rfReplaceAll]);


  if not FileExists(vlcImagem) then
  begin
    fmPrincipal.apresentaResultadoCadastro('Imagem inexistente, favor verificar o nome ou local da Imagem informada.');
    Exit;
  end;

  try
    // Validação dos itens antes de inserir na grid.
    with ColumnGridImagens do
      if Enabled then
        for i := 1 to RowCount -1 do
        begin
          if AnsiCompareText(ColumnByName['NMIMAGEM'].Rows[i],vlcImagem) = 0 then
          begin
            fmPrincipal.apresentaResultadoCadastro('Esta Imagem já foi inserida na tabela, favor informar uma outra imagem.');
            Exit;
          end;
        end;

    try
      with ColumnGridImagens do
      begin
        BeginUpdate;
        if Enabled then
        begin
          if ColumnByName['DEIMAGEM'].Rows[RowCount-1] <> EmptyStr then
          begin
            AddRow;
            Row := RowCount -1;
          end;

          ColumnByName['NMIMAGEM'].Rows[Row] := vlcImagem;
          if RowCount = 2 then
            AddRadioButton(1,Row,true)
          else
            AddRadioButton(1,Row,false);
          ColumnByName['DEIMAGEM'].Rows[Row] := EditCadastroDEIMAGEM.Text;
          AddImageIdx(3,RowCount-1,1,haCenter,vaCenter);
          AddImageIdx(4,Row,2,haCenter,vaCenter);
          ColumnByName['CDIMAGEM'].Ints[Row] := 0;
        end
        else
        begin
          Enabled := true;
          ColumnByName['NMIMAGEM'].Rows[Row] := vlcImagem;
          ColumnByName['DEIMAGEM'].Rows[Row] := EditCadastroDEIMAGEM.Text;
          AddImageIdx(3,RowCount-1,1,haCenter,vaCenter);
          AddImageIdx(4,Row,2,haCenter,vaCenter);
        end;
        EndUpdate;
      end;
    except
      on E: exception do
        fmPrincipal.manipulaExcecoes(Sender,E);
    end;
  finally
    limpaImagem;
  end;
end;

procedure TfmCadImagem.ButtonSalvarClick(Sender: TObject);
var
  i, vStatus, vcdImagem: integer;
  vImagem, vcsImagem, vflPadrao: string;
begin
  try
    try
      with ColumnGridImagens do
      begin
        BeginUpdate;
        for i := 1 to RowCount -1 do
        begin
          // Associa a imagem cadastrada ao material.
          if IsRadioButtonChecked(1,i) then
            vflPadrao := 'S'
          else
            vflPadrao := 'N';

          if ColumnByName['NMIMAGEM'].Rows[i] <> EmptyStr then
          begin
            // Para novos registros.
            if ColumnByName['CDIMAGEM'].Ints[i] = 0 then
            begin
              vImagem := ExtractFileName(ColumnByName['NMIMAGEM'].Rows[i]);
              // Obtem o checksum do arquivo.
              vcsImagem := fmPrincipal.fnGeral.obtemCheckSumArquivo(ColumnByName['NMIMAGEM'].Rows[i]);
              pDocumento.Nome := vImagem;
              pDocumento.Descricao := ColumnByName['DEIMAGEM'].Rows[i];
              pDocumento.Tipo := 'I'; // Padrão para Imagem.
              pDocumento.Documento := ColumnByName['NMIMAGEM'].Rows[i];
              pDocumento.Checksum := vcsImagem;
              vcdImagem := pDocumento.insere;
              if vcdImagem = 0 then
                raise exception.Create('Não foi possível incluir a imagem.');

              ColumnByName['CSIMAGEM'].Rows[i] := vcsImagem;
              ColumnByName['CDIMAGEM'].Ints[i] := vcdImagem;

              pMaterial.Codigo := pcdMaterial;
              pMaterial.Documento := vcdImagem;
              pMaterial.ImagemPadrao := vflPadrao;
              vStatus := pMaterial.insereMaterialImagem;

              if vStatus = 0 then
              begin
                // Se não puder associar, exclui a imagem cadastrada.
                pDocumento.Codigo := vcdImagem;
                pDocumento.exclui;
                raise exception.Create('Não foi possível associar a imagem ao material.');
              end;
            end
            else
            begin
              pDocumento.Codigo := ColumnByName['CDIMAGEM'].Ints[i];
              pDocumento.Descricao := ColumnByName['DEIMAGEM'].Rows[i];
              if pDocumento.atualiza = 0 then
                raise exception.Create('Imagem a ser atualizada não foi encontrada.');
              pMaterial.Codigo := pcdMaterial;
              pMaterial.Documento := ColumnByName['CDIMAGEM'].Ints[i];
              pMaterial.ImagemPadrao := vflPadrao;
              if pMaterial.atualizaMaterialImagem = 0 then
                raise exception.Create('Imagem do material a ser atualizada não foi encontrada.');
            end;
          end;
        end;
        EndUpdate;
      end;

      fmPrincipal.apresentaResultadoCadastro('Cadastro realizado com sucesso.');
      carregaImagensMaterial;
      ButtonExcluir.Enabled := true;
    except
      on E: exception do
      begin
        fmPrincipal.apresentaResultadoCadastro(E.Message);
        fmPrincipal.manipulaExcecoes(Sender,E);
      end;
    end;
  finally
    ButtonSelecionarImagem.Enabled := true;
    ButtonSalvar.Enabled := true;
    ButtonExcluir.Enabled := true;
    ButtonFechar.Enabled := true;
    ActiveControl := ButtonFechar;
  end;
end;

procedure TfmCadImagem.carregaImagensBotoes;
begin
  ButtonSelecionarImagem.Picture.LoadFromFile(fmPrincipal.LocalIcones + 'browser-e-16.png');
  ButtonSelecionarImagem.HotPicture.LoadFromFile(fmPrincipal.LocalIcones + 'browser-h-16.png');
  ButtonSelecionarImagem.DisabledPicture.LoadFromFile(fmPrincipal.LocalIcones + 'browser-d-16.png');
  ButtonIncluirImagem.Picture.LoadFromFile(fmPrincipal.LocalIcones + 'add-image-e-16.png');
  ButtonIncluirImagem.HotPicture.LoadFromFile(fmPrincipal.LocalIcones + 'add-image-h-16.png');
  ButtonIncluirImagem.DisabledPicture.LoadFromFile(fmPrincipal.LocalIcones + 'add-image-d-16.png');
  ButtonExcluirImagem.Picture.LoadFromFile(fmPrincipal.LocalIcones + 'remove-image-e-16.png');
  ButtonExcluirImagem.HotPicture.LoadFromFile(fmPrincipal.LocalIcones + 'remove-image-h-16.png');
  ButtonExcluirImagem.DisabledPicture.LoadFromFile(fmPrincipal.LocalIcones + 'remove-image-d-16.png');
end;

procedure TfmCadImagem.carregaImagensGrid;
begin
  fmPrincipal.fnGeral.insereImageList(ImageList,fmPrincipal.LocalIcones + 'picture-e-16.png');
  fmPrincipal.fnGeral.insereImageList(ImageList,fmPrincipal.LocalIcones + 'picture-d-16.png');
  fmPrincipal.fnGeral.insereImageList(ImageList,fmPrincipal.LocalIcones + 'edit-image-e-16.png');
  fmPrincipal.fnGeral.insereImageList(ImageList,fmPrincipal.LocalIcones + 'edit-image-d-16.png');
  fmPrincipal.fnGeral.insereImageList(ImageList,fmPrincipal.LocalIcones + 'edit-image-green-16.png');
  ColumnGridImagens.GridImages := ImageList;
end;

procedure TfmCadImagem.carregaImagensMaterial;
var
  vQuery: TZQuery;
begin
  try
    ColumnGridImagens.BeginUpdate;
    limpaGrid;

    vQuery := TZQuery.Create(Self);
    with vQuery do
    begin
      SQL.Text := 'SELECT cddocumento,nmdocumento,dedocumento,flpadrao';
      SQL.Add('FROM ' + cSchema + '.vw_materialimagem');
      SQL.Add('WHERE cdmaterial = :CDMATERIAL');
      Params.ParamByName('CDMATERIAL').AsInteger := pcdMaterial;
      dmPrincipal.executaConsulta(vQuery);

      while not Eof do
      begin
        with ColumnGridImagens do
        begin
          if Fields.FieldByName('FLPADRAO').AsString = 'S' then
            AddRadioButton(1,RowCount-1,true)
          else
            AddRadioButton(1,RowCount-1,false);
          ColumnByName['DEIMAGEM'].Rows[RowCount-1] := Fields.FieldByName('DEDOCUMENTO').AsString;
          AddImageIdx(3,RowCount-1,0,haCenter,vaCenter);
          AddImageIdx(4,RowCount-1,3,haCenter,vaCenter);
          ColumnByName['NMIMAGEM'].Rows[RowCount-1] := Fields.FieldByName('NMDOCUMENTO').AsString;
          ColumnByName['CDIMAGEM'].Ints[RowCount-1] := Fields.FieldByName('CDDOCUMENTO').AsInteger;

          Next;
          if not Eof then
            RowCount := RowCount +1;
        end;
      end;
      Active := false;
    end;
  finally
    ColumnGridImagens.EndUpdate;
    ColumnGridImagens.Row := 1;

    FreeAndNil(vQuery);

    pOpcao := 'A';
    ButtonExcluir.Enabled := true;
  end;
end;

procedure TfmCadImagem.ColumnGridImagensClickCell(Sender: TObject; ARow,
  ACol: Integer);
var
  vImagem: string;
begin
  with ColumnGridImagens do
  begin
    // Realiza validações
    if (ColumnByName['NMIMAGEM'].Rows[ARow] = EmptyStr) or (ARow = 0) then
      Exit;
    if not Enabled then
      Exit;

    // Se clicou na coluna de visualizar a imagem.
    if ACol = 3 then
      if ColumnByName['CDIMAGEM'].Ints[Row] > 0 then
      begin
        vImagem := fmPrincipal.LocalTemporario + ColumnByName['NMIMAGEM'].Rows[Row];
        pDocumento.Codigo := ColumnByName['CDIMAGEM'].Ints[Row];
        if not pDocumento.salvaDocumentoDisco(vImagem) then
        begin
          fmPrincipal.pLogSistema.Error('A imagem ' + vImagem + ' não pode ser obtida da tabela. A imagem não será apresentada.');
          Exit;
        end;
        fmAplVisualizaImagem := TfmAplVisualizaImagem.Create(Self);
        with fmAplVisualizaImagem do
        begin
          setaImagem(vImagem, ColumnByName['DEIMAGEM'].Rows[ARow]);
          ShowModal;
        end;
      end;

    // Se clicou na coluna de editar seta para edição.
    if ACol = 4 then
      if ColumnByName['CDIMAGEM'].Ints[Row] = 0 then
      begin
        limpaImagem;
        EditCadastroNMIMAGEM.Text := ColumnByName['NMIMAGEM'].Rows[Row];
        EditCadastroDEIMAGEM.Text := ColumnByName['DEIMAGEM'].Rows[Row];
        AddImageIdx(3,RowCount-1,2,haCenter,vaCenter);
        AddImageIdx(4,ARow,4,haCenter,vaCenter);
        Enabled := false;
      end;
  end;
end;

procedure TfmCadImagem.desabilitaAcoes;
begin
  ButtonSelecionarImagem.Enabled := false;
  ButtonIncluirImagem.Enabled := false;
  ButtonExcluirImagem.Enabled := false;
  ButtonSalvar.Enabled := false;
  ButtonExcluir.Enabled := false;
  ButtonFechar.Enabled := false;
end;

procedure TfmCadImagem.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfmCadImagem.FormCreate(Sender: TObject);
var
  i: integer;
begin
  try
    CreateGUID(pId);

    Color := Self.Color;
    FormStyler.AutoThemeAdapt := false;

    pOpcao := 'I';

    pMaterial := TMaterial.Create;
    pDocumento := TDocumento.Create;

    carregaImagensBotoes;
    carregaImagensGrid;

    limpaGrid;
    ActiveControl := ButtonSelecionarImagem;

    // Configura a Grid.
    with ColumnGridImagens do
    begin
      DrawingStyle := gdsThemed;
      AutoThemeAdapt := false;
      for i := 0 to ColCount -1 do
        Columns[i].ShowBands := true;
      Bands.Active := true;
    end;

    FormResize(Sender);
  except
    on E: Exception do
    begin
      fmPrincipal.manipulaExcecoes(Sender,E);
      Close;
    end;
  end;
end;

procedure TfmCadImagem.FormDestroy(Sender: TObject);
begin
  FreeAndNil(pMaterial);
  FreeAndNil(pDocumento);
end;

procedure TfmCadImagem.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Exit;
end;

procedure TfmCadImagem.FormResize(Sender: TObject);
begin
  ButtonFechar.Left := PanelBotoes.Width - ButtonFechar.Width - fmPrincipal.EspacamentoFinalBotao;
  ButtonExcluir.Left := ButtonFechar.Left - ButtonExcluir.Width - fmPrincipal.EspacamentoEntreBotoes;
  ButtonSalvar.Left := ButtonExcluir.Left - ButtonSalvar.Width - fmPrincipal.EspacamentoEntreBotoes;
end;

procedure TfmCadImagem.LabelAlterarDescricaoClick(Sender: TObject);
begin
  if EditCadastroDEIMAGEM.Text <> EmptyStr then
    EditCadastroDEIMAGEM.Text := InputBox('Alterar a Descrição da Imagem',
                                   'Informe uma nova descrição para a imagem:',
                                   EditCadastroDEIMAGEM.Text);
end;

procedure TfmCadImagem.limpaGrid;
begin
  with ColumnGridImagens do
  begin
    ClearRows(1,RowCount-1);
    Row := 1;
    RowCount := 2;
    Columns[0].Width := 0;
    Columns[1].Width := 40;
    Columns[2].Width := 500;
    Columns[3].Width := 30;
    Columns[4].Width := 35;
    Columns[5].Width := 0;
    Columns[6].Width := 0;
    Columns[7].Width := 0;
    HideColumns(5,7);
  end;
end;

procedure TfmCadImagem.limpaImagem;
begin
  EditCadastroNMIMAGEM.Clear;
  EditCadastroDEIMAGEM.Clear;
end;

procedure TfmCadImagem.setacdMaterial(prmcdMaterial: integer);
begin
  pcdMaterial := prmcdMaterial;
end;

procedure TfmCadImagem.ButtonSelecionarImagemClick(Sender: TObject);
var
  vNomeArquivo, vExtensao: string;
  vPosicao: integer;
begin
  try
    Screen.Cursor := crHourGlass;
    desabilitaAcoes;

    with OpenPictureDialog do
    begin
      Title := 'Abrir Imagem';
      DefaultExt := EmptyStr;
      if pUltimoLocalSelecionado = EmptyStr then
        InitialDir := fmPrincipal.fnGeral.obtemDiretorioUsuario('My Pictures')
      else
        InitialDir := pUltimoLocalSelecionado;
      Filter := 'Todos (*.png;*.jpeg;*.jpg;*.bmp;*.tif;*.tiff)|*.png;*.jpeg;*.jpg;*.bmp;*.tif;*.tiff|';
      Filter := Filter + 'Imagens PNG (*.png)|*.png|';
      Filter := Filter + 'Imagens JPEG (*.jpeg;*.jpg)|*.jpeg;*.jpg|';
      Filter := Filter + 'Bitmaps (*.bmp)|*.bmp|';
      Filter := Filter + 'Imagens TIFF (*.tiff;*.tif)|*.tiff;*.tif';
      FilterIndex := 1;
      if Execute then
      begin
        pUltimoLocalSelecionado := ExtractFilePath(FileName);
        EditCadastroNMIMAGEM.Text := FileName;
        vNomeArquivo := ExtractFileName(FileName);
        vExtensao := ExtractFileExt(FileName);
        // Monta o nome da Imagem com base no nome do arquivo da Imagem.
        if vExtensao <> EmptyStr then
        begin
          vPosicao := Pos(vExtensao,vNomeArquivo);
          if vPosicao > 0 then
            Delete(vNomeArquivo,vPosicao,Length(vExtensao));
        end;

        EditCadastroDEIMAGEM.Text := vNomeArquivo;

        ButtonIncluirImagem.Enabled := true;
        ButtonExcluirImagem.Enabled := true;
      end;
    end;
  finally
    ButtonSelecionarImagem.Enabled := true;
    ButtonSalvar.Enabled := true;
    ButtonExcluir.Enabled := true;
    ButtonFechar.Enabled := true;

    Screen.Cursor := crDefault;
  end;
end;

end.
