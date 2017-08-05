unit unCadDocumento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, Grids, DB, ShellApi,  ZAbstractRODataset,
  ZAbstractDataset, ZDataset, AdvObj, BaseGrid, AdvGrid, AdvCGrid, AdvAppStyler,
  AdvGlowButton, AdvPanel, unDocumento, unAquisicao, unDespesa, unReceita,
  Vcl.ImgList;

type
  TfmCadDocumento = class(TForm)
    OpenDialog: TOpenDialog;
    FormStyler: TAdvFormStyler;
    PanelCabecalho: TAdvPanel;
    LabelLocal: TLabel;
    LabelLocalDocumentos: TLabel;
    ButtonAbrirDiretorio: TAdvGlowButton;
    ButtonSelecionarArquivos: TAdvGlowButton;
    PanelBotoes: TAdvPanel;
    ButtonFechar: TAdvGlowButton;
    ButtonSalvar: TAdvGlowButton;
    ButtonExcluir: TAdvGlowButton;
    ButtonExcluirTudo: TAdvGlowButton;
    PanelGeral: TAdvPanel;
    ColumnGridDocumentos: TAdvColumnGrid;
    ImageList: TImageList;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ButtonFecharClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure ButtonSalvarClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure ButtonExcluirClick(Sender: TObject);
    procedure ButtonSelecionarArquivosClick(Sender: TObject);
    procedure ButtonAbrirDiretorioClick(Sender: TObject);
    procedure ButtonExcluirTudoClick(Sender: TObject);
    procedure ColumnGridDocumentosClickCell(Sender: TObject; ARow,
      ACol: Integer);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    pId: TGUID;
    pOpcao, pTipo: char;
    pCodigo: integer;
    pSomenteLeitura: boolean;
    pNomeDiretorio, pUltimoLocalSelecionado: string;
    pDocumento: TDocumento;
    pAquisicao: TAquisicao;
    pDespesa: TDespesa;
    pReceita: TReceita;
    procedure setaNomeDiretorio(prmnmDiretorio: string);
    procedure setaSomenteLeitura(prmSomenteLeitura: boolean);
    procedure limpaGrid;
    procedure carregaImagensBotoes;
  public
    { Public declarations }
    procedure preencheGrid;
    property Codigo: integer read pCodigo write pCodigo;
    property NomeDiretorio: string read pNomeDiretorio write setaNomeDiretorio;
    property Tipo: char read pTipo write pTipo;
    property SomenteLeitura: boolean read pSomenteLeitura write setaSomenteLeitura;
  end;

var
  fmCadDocumento: TfmCadDocumento;

implementation

uses undmPrincipal, unPrincipal, unAplVisualizaImagem, undmEstilo;

{$R *.dfm}

procedure TfmCadDocumento.ButtonAbrirDiretorioClick(Sender: TObject);
begin
  ShellExecute(Application.Handle, 'open', 'explorer.exe', PChar('"'+LabelLocalDocumentos.Caption+'"'), nil, SW_SHOWNORMAL);
end;

procedure TfmCadDocumento.ButtonExcluirClick(Sender: TObject);
var
  vDocumento: string;
  vcdDocumento: integer;
begin
  // Garante que não esteja selecionado o cabeçalho.
  if ColumnGridDocumentos.Row = 0 then
    Exit;
  // Se não tiver nenhum documento, sai direto.
  if ColumnGridDocumentos.ColumnByName['NMDOCUMENTO'].Rows[1] = EmptyStr then
    Exit;

  with ColumnGridDocumentos do
  begin
    vcdDocumento := ColumnByName['CDDOCUMENTO'].Ints[Row];
    vDocumento := ColumnByName['NMDOCUMENTO'].Rows[Row];
    if vcdDocumento = 0 then
    begin
      // Remove da Grid.
      BeginUpdate;
      if RowCount > 2 then
        RemoveRows(Row,1)
      else
        ClearRows(Row,1);
      EndUpdate;
      Exit;
    end;

    // Valida se realmente o usuário quer realizar a exclusão.
    if MessageBox(fmPrincipal.Handle,
                  PWideChar('Confirma a exclusão do documento selecionado?'),
                  cTituloMensagemConfirmacao,
                  MB_YESNO or MB_ICONQUESTION or MB_DEFBUTTON2) = IDNO then
      Exit;

    try
      case Tipo of
        'R':
        begin
          pReceita.Codigo := Codigo;
          pReceita.Documento := vcdDocumento;
          if pReceita.excluiDocumento = 0 then
            raise exception.Create('Documento da receita a ser excluído não foi encontrado.');
        end;
        'D':
        begin
          pDespesa.Codigo := Codigo;
          pDespesa.Documento := vcdDocumento;
          if pDespesa.excluiDocumento = 0 then
            raise exception.Create('Documento da despesa a ser excluído não foi encontrado.');
        end
        else
        begin
          pAquisicao.Codigo := Codigo;
          pAquisicao.Documento := vcdDocumento;
          if pAquisicao.excluiDocumento = 0 then
            raise exception.Create('Documento da aquisição a ser excluído não foi encontrado.');
        end;
      end;

      pDocumento.Codigo := vcdDocumento;
      if pDocumento.exclui = 0 then
        raise exception.Create('Documento ser excluído não foi encontrado.');
      // Exclui o documento fisicamente.
      SysUtils.DeleteFile(LabelLocalDocumentos.Caption + vDocumento);

      // Remove da Grid.
      BeginUpdate;
      if RowCount > 2 then
        RemoveRows(Row,1)
      else
        ClearRows(Row,1);
      EndUpdate;

      fmPrincipal.apresentaResultadoCadastro('Documento excluído com sucesso.');

      // Se não sobrar mais documentos, então desabilita a exclusão de registros.
      if ColumnByName['NMDOCUMENTO'].Rows[RowCount -1] = EmptyStr then
      begin
        ButtonExcluir.Enabled := false;
        ButtonExcluirTudo.Enabled := false;
      end;

    except
      on E: exception do
        fmPrincipal.manipulaExcecoes(Sender,E);
    end;
  end;
end;

procedure TfmCadDocumento.ButtonExcluirTudoClick(Sender: TObject);
var
  i, j: integer;
  vcdDocumento: integer;
begin
  try
    with ColumnGridDocumentos do
    begin
      // Se não tiver nenhum documento, sai direto.
      if ColumnByName['NMDOCUMENTO'].Rows[1] = EmptyStr then
        Exit;
      // Valida se existem documentos salvos, isto é, com cddocumento identificado.
      if RowCount >= 2 then
        if ColumnByName['CDDOCUMENTO'].Ints[1] = 0 then
          Exit;

      // Valida se realmente o usuário quer realizar a exclusão.
      if MessageBox(fmPrincipal.Handle,
                    PWideChar('Confirma a exclusão de todos os documentos?'),
                    cTituloMensagemConfirmacao,
                    MB_YESNO or MB_ICONQUESTION or MB_DEFBUTTON2) = IDNO then
        Exit;

      fmPrincipal.Cursor := crHourGlass;
      j := RowCount -1;
      BeginUpdate;
      for i := 1 to j do
      begin
        try
          vcdDocumento := ColumnByName['CDDOCUMENTO'].Ints[1];

          // Se não salvou o registro apenas deleta da grid,
          if vcdDocumento > 0 then
          begin
            case Tipo of
              'R':
              begin
                pReceita.Codigo := Codigo;
                pReceita.Documento := vcdDocumento;
                if pReceita.excluiDocumento = 0 then
                  raise exception.Create('Documento da receita a ser excluído não foi encontrado.');
              end;
              'D':
              begin
                pDespesa.Codigo := Codigo;
                pDespesa.Documento := vcdDocumento;
                if pDespesa.exclui = 0 then
                  raise exception.Create('Documento da despesa a ser excluído não foi encontrado.');
              end
              else
              begin
                pAquisicao.Codigo := Codigo;
                pAquisicao.Documento := vcdDocumento;
                if pAquisicao.excluiDocumento = 0 then
                  raise exception.Create('Documento da aquisição a ser excluído não foi encontrado.');
              end;
            end;

            pDocumento.Codigo := vcdDocumento;
            if pDocumento.exclui = 0 then
              raise exception.Create('Documento ser excluído não foi encontrado.');
          end;

          // Remove da Grid.
          if RowCount > 2 then
            RemoveRows(1,1)
          else
            ClearRows(1,1);
        except
          on E: exception do
            fmPrincipal.manipulaExcecoes(Sender,E);
        end;
      end;
      EndUpdate;

      // Exclui todos os arquivos deste diretório de documentos.
      fmPrincipal.fnGeral.removeDiretorio(Application.MainForm.Handle,LabelLocalDocumentos.Caption);
      CreateDir(LabelLocalDocumentos.Caption);

      fmPrincipal.apresentaResultadoCadastro('Documentos excluídos com sucesso.');
    end;
  finally
    with ColumnGridDocumentos do
      if RowCount = 2 then
        if ColumnByName['NMDOCUMENTO'].Rows[1] = EmptyStr then
        begin
          ButtonExcluir.Enabled := false;
          ButtonExcluirTudo.Enabled := false;
        end;

    fmPrincipal.Cursor := crDefault;
  end;
end;

procedure TfmCadDocumento.ButtonFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfmCadDocumento.ButtonSalvarClick(Sender: TObject);
var
  i, vStatus, vcdDocumento: integer;
  vlcDocumentoOriginal, vnmDocumentoOriginal, vDocumentoOriginal,
  vnmDocumentoSalvar, vcsDocumento, vDocumentoSalvar: string;
  vExecutado: boolean;
begin
  // Se não tiver nenhum documento, sai direto.
  if ColumnGridDocumentos.ColumnByName['NMDOCUMENTO'].Rows[1] = EmptyStr then
    Exit;

  fmPrincipal.Cursor := crHourGlass;
  vExecutado := false;
  try
    try
      with ColumnGridDocumentos do
      begin
        BeginUpdate;
        for i := 1 to RowCount -1 do
        begin
          if ColumnByName['NMDOCUMENTO'].Rows[i] <> EmptyStr then
          begin
            // Para novos registros.
            if ColumnByName['CDDOCUMENTO'].Ints[i] = 0 then
            begin
              vExecutado := true;
              vlcDocumentoOriginal := ColumnByName['LCDOCUMENTO'].Rows[i];
              vnmDocumentoOriginal := ColumnByName['NMDOCUMENTO'].Rows[i];
              vDocumentoOriginal := vlcDocumentoOriginal + vnmDocumentoOriginal;
              // Obtém o checksum do arquivo.
              vcsDocumento := fmPrincipal.fnGeral.obtemCheckSumArquivo(vDocumentoOriginal);
              vnmDocumentoSalvar := fmPrincipal.fnGeral.obtemnmDocumentoSalvar(vnmDocumentoOriginal);
              vDocumentoSalvar := LabelLocalDocumentos.Caption + vnmDocumentoSalvar;

              // Transfere o arquivo para o local de destino.
              fmPrincipal.fnGeral.transfereArquivo(vDocumentoOriginal,LabelLocalDocumentos.Caption,vnmDocumentoSalvar);

              pDocumento.Nome := vnmDocumentoSalvar;
              pDocumento.Descricao := ColumnByName['DEDOCUMENTO'].Rows[i];
              pDocumento.Tipo := 'T'; // Padrão para Documento.
              pDocumento.Documento := vDocumentoSalvar;
              pDocumento.Checksum := vcsDocumento;
              vcdDocumento := pDocumento.insere;
              if vcdDocumento = 0 then
                raise exception.Create('Não foi possível incluir o Documento.');

              ColumnByName['NMDOCUMENTO'].Rows[i] := vnmDocumentoSalvar;
              ColumnByName['CSDOCUMENTO'].Rows[i] := vcsDocumento;
              ColumnByName['CDDOCUMENTO'].Ints[i] := vcdDocumento;

              case Tipo of
                'R':
                begin
                  pReceita.Codigo := Codigo;
                  pReceita.Documento := vcdDocumento;
                  pReceita.DocumentoPadrao := 'N';
                  vStatus := pReceita.insereDocumento;
                end;
                'D':
                begin
                  pDespesa.Codigo := Codigo;
                  pDespesa.Documento := vcdDocumento;
                  pDespesa.DocumentoPadrao := 'N';
                  vStatus := pDespesa.insereDocumento;
                end
                else
                begin
                  pAquisicao.Codigo := Codigo;
                  pAquisicao.Documento := vcdDocumento;
                  pAquisicao.DocumentoPadrao := 'N';
                  vStatus := pAquisicao.insereDocumento;
                end;
              end;

              if vStatus = 0 then
              begin
                // Se não puder associar, exclui o documento cadastrado.
                pDocumento.Codigo := vcdDocumento;
                pDocumento.exclui;
                raise exception.Create('Não foi possível realizar a associação de documento.');
              end;

              AddImageIdx(1,i,2,haCenter,vaCenter);
              AddImageIdx(7,i,0,haCenter,vaCenter);
            end;
          end;
          EndUpdate;
        end;
      end;

      // Se inseriu corretamente, muda a imagem de status.
      if vExecutado then
      begin
        ButtonExcluir.Enabled := true;
        ButtonExcluirTudo.Enabled := true;
        fmPrincipal.apresentaResultadoCadastro('Documentos vinculados a aquisição com sucesso.');
      end;
    except
      on E: Exception do
        fmPrincipal.manipulaExcecoes(Sender,E);
    end;
  finally
    ActiveControl := ButtonFechar;
    fmPrincipal.Cursor := crDefault;
  end;
end;

procedure TfmCadDocumento.ButtonSelecionarArquivosClick(Sender: TObject);
var
  i,j, vPosicao: integer;
  vlcDocumento, vnmDocumento, vexDocumento, vdeDocumento: string;
begin
  try
    with OpenDialog do
    begin
      Title := 'Selecionar Documento(s)';
      Options := [ofHideReadOnly,ofAllowMultiSelect,ofEnableSizing];
      if pUltimoLocalSelecionado = EmptyStr then
        InitialDir := GetCurrentDir
      else
        InitialDir := pUltimoLocalSelecionado;
      //FilterIndex := 1;

      if Execute() then
      begin
        try
          fmPrincipal.Cursor := crHourGlass;
          // Insere na Grid.
          ColumnGridDocumentos.BeginUpdate;
          for i := 0 to Files.Count -1 do
          begin
            with ColumnGridDocumentos do
            begin
              // Valida se já foi inserido o documento anteriormente.
              for j := 1 to RowCount -1 do
                if AnsiCompareText(Files.Strings[i],ColumnByName['NMDOCUMENTO'].Rows[j]) = 0 then
                  Exit;

              // Formata os dados.
              vlcDocumento := ExtractFilePath(Files.Strings[i]);
              vnmDocumento := ExtractFileName(Files.Strings[i]);
              vexDocumento := ExtractFileExt(vnmDocumento);
              vdeDocumento := vnmDocumento;

              // Monta a Descrição do Arquivo com base no Nome do Documento de origem.
              if vexDocumento <> EmptyStr then
              begin
                vPosicao := Pos(vexDocumento,vdeDocumento);
                if vPosicao > 0 then
                  Delete(vdeDocumento,vPosicao,Length(vexDocumento));
              end;

              // Insere na grid.
              if ColumnByName['NMDOCUMENTO'].Rows[RowCount-1] <> EmptyStr then
              begin
                AddRow;
                Row := RowCount -1;
              end;

              AddImageIdx(1,RowCount-1,1,haCenter,vaCenter);
              ColumnByName['CDDOCUMENTO'].Ints[RowCount-1] := 0;
              ColumnByName['NMDOCUMENTO'].Rows[RowCount-1] := vnmDocumento;
              ColumnByName['DEDOCUMENTO'].Rows[RowCount-1] := vdeDocumento;
              ColumnByName['CSDOCUMENTO'].Rows[RowCount-1] := EmptyStr;
              ColumnByName['LCDOCUMENTO'].Rows[RowCount-1] := vlcDocumento;
            end;
          end;
          ColumnGridDocumentos.EndUpdate;
          pUltimoLocalSelecionado := vlcDocumento;
        finally
          fmPrincipal.Cursor := crDefault;
        end;
      end;
    end;
  except
    on E: Exception do
      fmPrincipal.manipulaExcecoes(Sender,E);
  end;
end;

procedure TfmCadDocumento.carregaImagensBotoes;
begin
  ButtonAbrirDiretorio.Picture.LoadFromFile(fmPrincipal.LocalIcones + 'documents-e-16.png');
  ButtonAbrirDiretorio.HotPicture.LoadFromFile(fmPrincipal.LocalIcones + 'documents-h-16.png');
  ButtonAbrirDiretorio.DisabledPicture.LoadFromFile(fmPrincipal.LocalIcones + 'documents-d-16.png');
  ButtonSelecionarArquivos.Picture.LoadFromFile(fmPrincipal.LocalIcones + 'browser-e-16.png');
  ButtonSelecionarArquivos.HotPicture.LoadFromFile(fmPrincipal.LocalIcones + 'browser-h-16.png');
  ButtonSelecionarArquivos.DisabledPicture.LoadFromFile(fmPrincipal.LocalIcones + 'browser-d-16.png');
end;

procedure TfmCadDocumento.ColumnGridDocumentosClickCell(Sender: TObject; ARow,
  ACol: Integer);
var
  vDocumento: string;
begin
  if (ARow > 0) and (ACol = 3) then
    with ColumnGridDocumentos do
    begin
      if ColumnByName['CDDOCUMENTO'].Rows[ARow] <> EmptyStr then
      begin
        fmPrincipal.Cursor := crHourGlass;
        vDocumento := fmPrincipal.LocalTemporario + ColumnByName['NMDOCUMENTO'].Rows[ARow];
        pDocumento.Codigo := ColumnByName['CDDOCUMENTO'].Ints[ARow];
        if pDocumento.salvaDocumentoDisco(vDocumento) then
          ShellExecute(Handle, 'open', PChar(vDocumento), nil, nil, SW_SHOWMAXIMIZED);
        fmPrincipal.Cursor := crDefault;
      end;
    end;
end;

procedure TfmCadDocumento.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfmCadDocumento.FormCreate(Sender: TObject);
var
  i: integer;
begin
  try
    CreateGUID(pId);

    Color := Self.Color;
    FormStyler.AutoThemeAdapt := false;

    pOpcao := 'I';
    Tipo := 'A';

    pDocumento := TDocumento.Create;
    pAquisicao := TAquisicao.Create;
    pDespesa := TDespesa.Create;
    pReceita := TReceita.Create;

    carregaImagensBotoes;

    fmPrincipal.fnGeral.insereImageList(ImageList,fmPrincipal.LocalIcones + 'file-e-16.png');
    fmPrincipal.fnGeral.insereImageList(ImageList,fmPrincipal.LocalIcones + 'add-file-e-16.png');
    fmPrincipal.fnGeral.insereImageList(ImageList,fmPrincipal.LocalIcones + 'ok-green-16.png');
    with ColumnGridDocumentos do
    begin
      GridImages := ImageList;
      ClearRows(1,RowCount -1);
      RowCount := 2;
      DrawingStyle := gdsThemed;
      AutoThemeAdapt := false;
      for i := 0 to ColCount -1 do
        Columns[i].ShowBands := true;
      Bands.Active := true;
      Columns[0].Width := 20;
      Columns[1].Width := 30;
      Columns[2].Width := 0;
      Columns[3].Width := 575;
      Columns[4].Width := 20;
      Columns[5].Width := 20;
      Columns[6].Width := 20;
      Columns[7].Width := 30;
      HideColumn(2);
      HideColumns(4,6);
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

procedure TfmCadDocumento.FormDestroy(Sender: TObject);
begin
  FreeAndNil(pDocumento);
  FreeAndNil(pAquisicao);
  FreeAndNil(pDespesa);
  FreeAndNil(pReceita);
end;

procedure TfmCadDocumento.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Exit;
end;

procedure TfmCadDocumento.FormResize(Sender: TObject);
begin
  ButtonSalvar.Left := fmPrincipal.EspacamentoInicialBotao;
  ButtonExcluir.Left := ButtonSalvar.Left + ButtonSalvar.Width + fmPrincipal.EspacamentoEntreBotoes;
  ButtonExcluirTudo.Left := ButtonExcluir.Left + ButtonExcluir.Width + fmPrincipal.EspacamentoEntreBotoes;

  ButtonSelecionarArquivos.Left := PanelCabecalho.Width - ButtonSelecionarArquivos.Width - fmPrincipal.EspacamentoFinalBotao;
  ButtonAbrirDiretorio.Left := ButtonSelecionarArquivos.Left - ButtonAbrirDiretorio.Width - 2;

  ButtonFechar.Left := PanelBotoes.Width - ButtonFechar.Width - fmPrincipal.EspacamentoFinalBotao;

  ButtonFechar.Left := PanelBotoes.Width - ButtonFechar.Width - fmPrincipal.EspacamentoFinalBotao;
  ButtonExcluirTudo.Left := ButtonFechar.Left - ButtonExcluirTudo.Width - fmPrincipal.EspacamentoEntreBotoes;
  ButtonExcluir.Left := ButtonExcluirTudo.Left - ButtonExcluir.Width - fmPrincipal.EspacamentoEntreBotoes;
  ButtonSalvar.Left := ButtonExcluir.Left - ButtonSalvar.Width - fmPrincipal.EspacamentoEntreBotoes;
end;

procedure TfmCadDocumento.limpaGrid;
begin
  with ColumnGridDocumentos do
  begin
    ClearRows(1,RowCount-1);
    Row := 1;
    RowCount := 2;
  end;
end;

procedure TfmCadDocumento.preencheGrid;
var
  vQuery: TZQuery;
  vTipo: string;
begin
  try
    try
      // Ajusta a consulta.
      case Tipo of
        'R': vTipo := 'receita';
        'D': vTipo := 'despesa';
        else vTipo := 'aquisicao';
      end;

      limpaGrid;
      vQuery := TZQuery.Create(Self);
      with vQuery do
      begin
        SQL.Text := 'SELECT documento.cddocumento, documento.nmdocumento, documento.dedocumento, documento.csdocumento';
        SQL.Add('FROM ' + cSchema + '.documento');
        SQL.Add('INNER JOIN ' + cSchema + '.' + vTipo + 'documento ON documento.cddocumento = ' + vTipo + 'documento.cddocumento');
        SQL.Add('WHERE ' + vTipo + 'documento.cd' + vTipo + ' = :CODIGO');
        Params.Items[0].AsInteger := Codigo;
        dmPrincipal.executaConsulta(vQuery);

        // Libera o botão de excluir se houver documentos salvos.
        ButtonExcluir.Enabled := (not Eof);
        ButtonExcluirTudo.Enabled := (not Eof);

        ColumnGridDocumentos.BeginUpdate;
        while not Eof do
        begin
          with ColumnGridDocumentos do
          begin
            AddImageIdx(1,RowCount-1,2,haCenter,vaCenter);
            ColumnByName['CDDOCUMENTO'].Ints[RowCount-1] := Fields.FieldByName('CDDOCUMENTO').AsInteger;
            ColumnByName['NMDOCUMENTO'].Rows[RowCount-1] := Fields.FieldByName('NMDOCUMENTO').AsString;
            ColumnByName['DEDOCUMENTO'].Rows[RowCount-1] := Fields.FieldByName('DEDOCUMENTO').AsString;
            ColumnByName['CSDOCUMENTO'].Rows[RowCount-1] := Fields.FieldByName('CSDOCUMENTO').AsString;
            ColumnByName['LCDOCUMENTO'].Rows[RowCount-1] := EmptyStr;
            AddImageIdx(7,RowCount-1,0,haCenter,vaCenter);

            Next;

            if not Eof then
            begin
              AddRow;
              Row := RowCount -1;
            end;
          end;
        end;
        ColumnGridDocumentos.EndUpdate;
      end;
    except
      on E: exception do
        raise;
    end;
  finally
    vQuery.Active := false;
    FreeAndNil(vQuery);
  end;
end;

procedure TfmCadDocumento.setaNomeDiretorio(prmnmDiretorio: string);
begin
  pNomeDiretorio := prmnmDiretorio + '\';
  LabelLocalDocumentos.Caption := fmPrincipal.DiretorioSVN + Tipo + '.' + pNomeDiretorio;

  // Se não existir o diretório, o cria.
  if not DirectoryExists(LabelLocalDocumentos.Caption) then
    CreateDir(LabelLocalDocumentos.Caption);
end;

procedure TfmCadDocumento.setaSomenteLeitura(prmSomenteLeitura: boolean);
begin
  pSomenteLeitura := prmSomenteLeitura;

  if pSomenteLeitura then
  begin
    ButtonSelecionarArquivos.Enabled := false;
    ButtonSalvar.Enabled := false;
    ButtonExcluir.Enabled := false;
    ButtonExcluirTudo.Enabled := false;
    ColumnGridDocumentos.OnDblClickCell := nil;
  end;
end;

end.
