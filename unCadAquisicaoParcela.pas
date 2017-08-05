unit unCadAquisicaoParcela;

interface

uses
  Windows, Messages, ShellAPI, SysUtils, Variants, StrUtils, Math, Classes,
  Mask, Buttons, MaskUtils, Registry, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, jpeg, StdCtrls, Menus, ExtCtrls,
  Grids, DB, AdvObj, BaseGrid, AdvGrid, AdvCGrid, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, AdvGlowButton, AdvPanel, AdvAppStyler, AdvEdit,
  AdvFontCombo, AdvEdBtn, PlannerDatePicker, AdvMoneyEdit, unAquisicao;

type
  TfmCadAquisicaoParcela = class(TForm)
    FormStyler: TAdvFormStyler;
    PanelBotoes: TAdvPanel;
    ButtonFechar: TAdvGlowButton;
    ButtonSalvar: TAdvGlowButton;
    ButtonExcluir: TAdvGlowButton;
    ButtonRestaurar: TAdvGlowButton;
    ButtonRecalculaParcelas: TAdvGlowButton;
    PanelCentral: TAdvPanel;
    ColumnGridParcelas: TAdvColumnGrid;
    PanelParcela: TAdvPanel;
    ButtonAtualizarTudo: TAdvGlowButton;
    ButtonCancelarEdicaoParcela: TAdvGlowButton;
    ButtonIncluirAlterarParcela: TAdvGlowButton;
    ComboBoxCadastroFLTIPOPARCELA: TAdvOfficeComboBox;
    ComboBoxCadastroNMFORMAPAGAMENTO: TAdvOfficeComboBox;
    DatePickerEditCadastroDTPAGAMENTO: TPlannerDatePicker;
    DatePickerEditCadastroDTVENCIMENTO: TPlannerDatePicker;
    EditCadastroNUPARCELA: TAdvEdit;
    LabelAcrescimo: TLabel;
    LabelDesconto: TLabel;
    LabelFormaPagamento: TLabel;
    LabelPagoEm: TLabel;
    LabelParcela: TLabel;
    LabelTaxaJuros: TLabel;
    LabelTipoParcela: TLabel;
    LabelValorExtra: TLabel;
    LabelValorParcela: TLabel;
    LabelValorTotal: TLabel;
    LabelVencimento: TLabel;
    EditCadastroVLACRESCIMO: TAdvMoneyEdit;
    EditCadastroVLDESCONTO: TAdvMoneyEdit;
    EditCadastroVLPARCELA: TAdvMoneyEdit;
    EditCadastroVLTAXAEXTRA: TAdvMoneyEdit;
    EditCadastroVLTAXAJUROS: TAdvMoneyEdit;
    EditCadastroVLTOTAL: TAdvMoneyEdit;
    PanelSumarizacao: TAdvPanel;
    PanelTotalRegistro: TAdvPanel;
    LabelTotalRegistrosParcela: TLabel;
    PanelValorTotalAquisicao: TAdvPanel;
    LabelValorTotalAquisicao: TLabel;
    PanelValorTotalParcela: TAdvPanel;
    LabelValorTotalParcela: TLabel;
    PanelValorTotalParcelaCalculado: TAdvPanel;
    LabelValorTotalParcelaCalculado: TLabel;
    PanelInfo: TAdvPanel;
    LabelCamposRequeridos: TLabel;
    ButtonAtualizarFormaPagamento: TAdvGlowButton;
    ButtonNovoFormaPagamento: TAdvGlowButton;
    ImageList: TImageList;
    procedure ButtonFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormResize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ButtonIncluirAlterarParcelaClick(Sender: TObject);
    procedure EditCadastroVLPARCELAExit(Sender: TObject);
    procedure EditCadastroVLDESCONTOExit(Sender: TObject);
    procedure EditCadastroVLACRESCIMOExit(Sender: TObject);
    procedure ButtonExcluirClick(Sender: TObject);
    procedure ButtonRestaurarClick(Sender: TObject);
    procedure ButtonSalvarClick(Sender: TObject);
    procedure ButtonCancelarEdicaoParcelaClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ButtonAtualizarFormaPagamentoClick(Sender: TObject);
    procedure ButtonRecalculaParcelasClick(Sender: TObject);
    procedure ButtonAtualizarTudoClick(Sender: TObject);
    procedure ButtonNovoFormaPagamentoClick(Sender: TObject);
    procedure ColumnGridParcelasClickCell(Sender: TObject; ARow, ACol: Integer);
  private
    { Private declarations }
    pId: TGUID;
    pOpcao: char;
    pCodigo: integer;
    pvlAquisicao: currency;
    pSomenteLeitura: boolean;
    plFormaPagamento: TStringList;
    pAquisicao: TAquisicao;
    procedure limpaCampos;
    procedure limpaGrid;
    procedure apresentaResultadoCadastro(prmMensagem: string);
    procedure setavlAquisicao(prmvlAquisicao: currency);
    procedure setaSomenteLeitura(prmSomenteLeitura: boolean);
    procedure atualizaRodapeTotalizacoes;
    procedure desabilitaBotoes;
    procedure habilitaBotoes;
    procedure carregaParcelasAquisicao;
    procedure carregaImagensBotoes;
  public
    { Public declarations }
    procedure consultaParcelasAquisicao(prmcdAquisicao: integer;
      prmvlAquisicao, prmvlTaxaExtra: currency; prmvlTaxaJuros: double;
      prmSomenteLeitura: boolean);
    property Opcao: char read pOpcao write pOpcao;
    property Codigo: integer read pCodigo write pCodigo;
  end;

var
  fmCadAquisicaoParcela: TfmCadAquisicaoParcela;

implementation

uses unPrincipal, undmPrincipal, unCadAquisicao, undmEstilo,
  unCadFormaPagamento;

{$R *.dfm}

procedure TfmCadAquisicaoParcela.apresentaResultadoCadastro(
  prmMensagem: string);
begin
  MessageBox(fmPrincipal.Handle,PWideChar(prmMensagem),cTituloMensagemInformacao,MB_OK or MB_ICONINFORMATION);
end;

procedure TfmCadAquisicaoParcela.atualizaRodapeTotalizacoes;
begin
  with ColumnGridParcelas do
  begin
    LabelTotalRegistrosParcela.Caption := 'Total parcelas: ' + IntToStr(RowCount -1);
    if ColumnByName['NUPARCELA'].Rows[1] = EmptyStr then
      LabelTotalRegistrosParcela.Caption := 'Total parcelas: 0';
    LabelValorTotalParcela.Caption := 'Valor parcelas: ' + FormatFloat('"R$ ",0.00',ColumnSum(6,1,RowCount -1));
    LabelValorTotalParcelaCalculado.Caption := 'Valor total: ' + FormatFloat('"R$ ",0.00',ColumnSum(9,1,RowCount -1));
  end;
end;

procedure TfmCadAquisicaoParcela.ButtonAtualizarTudoClick(Sender: TObject);
var
  i: integer;
  vAux: string;
begin
  // Valida a ação.
  if MessageBox(fmPrincipal.Handle,
                PWideChar('Deseja realmente atualizar a forma de pagamento de todas as parcelas?'+#13#10+
                          'Atenção: Será necessário salvar os registros para efetivar o recálculo.'),
                cTituloMensagemConfirmacao,
                MB_YESNO or MB_ICONQUESTION or MB_DEFBUTTON2) = IDNO then
    Exit;
  // Fim Valida a ação.

  with ColumnGridParcelas do
  begin
    BeginUpdate;
      for i := 1 to RowCount -1 do
      begin
        if ComboBoxCadastroNMFORMAPAGAMENTO.ItemIndex > -1 then
        begin
          with ComboBoxCadastroNMFORMAPAGAMENTO do
            vAux := Items.Strings[ItemIndex];
          ColumnByName['CDFORMAPAGAMENTO'].Ints[i] := StrToInt(plFormaPagamento.Strings[ComboBoxCadastroNMFORMAPAGAMENTO.ItemIndex-1]);
          ColumnByName['NMFORMAPAGAMENTO'].Rows[i] := vAux;
        end
        else
        begin
          ColumnByName['CDFORMAPAGAMENTO'].Ints[i] := 0;
          ColumnByName['NMFORMAPAGAMENTO'].Rows[i] := EmptyStr;
        end;
        ColumnByName['FLOPCAO'].Rows[i] := 'A';
      end;
    EndUpdate;
  end;
end;

procedure TfmCadAquisicaoParcela.ButtonNovoFormaPagamentoClick(
  Sender: TObject);
var
  vcdFormaPagamento: integer;
begin
  fmPrincipal.pLogSistema.Info('>> Carregando a tela de Cadastro de Forma de Pagamento.');
  vcdFormaPagamento := 0;
  try
    fmCadFormaPagamento := TfmCadFormaPagamento.Create(Self);
    with fmCadFormaPagamento do
    begin
      try
        Tag := 1;
        ShowModal;

        vcdFormaPagamento := fmCadFormaPagamento.Codigo;
      except
        on E: exception do
          raise exception.Create('Não foi possível abrir a tela de Cadastro de Forma de Pagamento.'+#13#10+E.Message);
      end;
    end;
  finally
    // Verifica se foi cadastrada uma forma de pagamento.
    if vcdFormaPagamento > 0 then
      ButtonAtualizarFormaPagamentoClick(Sender);
  end;
  fmPrincipal.pLogSistema.Info('>> Tela de Cadastro de Forma de Pagamento carregada com sucesso.');
end;

procedure TfmCadAquisicaoParcela.ButtonCancelarEdicaoParcelaClick(
  Sender: TObject);
begin
  limpaCampos;
  LabelPagoEm.Visible := false;
  DatePickerEditCadastroDTPAGAMENTO.Visible := false;
  ButtonIncluirAlterarParcela.Caption := '&Adicionar';
  habilitaBotoes;
  with ColumnGridParcelas do
  begin
    BeginUpdate;
    AddImageIdx(12,Row,0,haCenter,vaCenter);
    if ColumnByName['FLOPCAO'].Rows[Row] = 'A' then
      ColumnByName['FLOPCAO'].Rows[Row] := 'S';
    Enabled := true;
    EndUpdate;
    EditCadastroNUPARCELA.Text := IntToStr(ColumnByName['NUPARCELA'].Ints[RowCount-1]+1);
  end;

  if ComboBoxCadastroFLTIPOPARCELA.Enabled then
    ActiveControl := ComboBoxCadastroFLTIPOPARCELA;
end;

procedure TfmCadAquisicaoParcela.ButtonExcluirClick(Sender: TObject);
var
  i: integer;
  vRetorno: integer;
  vOpcaoAnterior: char;
begin
  vOpcaoAnterior := Opcao;
  Opcao := 'E';

  try
    try
      with ColumnGridParcelas do
      begin
        // Realiza validações.
        if Row = 0 then
          Exit;

        if (ColumnByName['FLOPCAO'].Rows[Row] = 'S') and
           (ColumnByName['DTPAGAMENTO'].Rows[Row] <> EmptyStr) then
        begin
          MessageBox(fmPrincipal.Handle,
                     PWideChar('Parcelas já pagas não podem ser excluídas.'),
                     cTituloMensagemInformacao,
                     MB_OK or MB_ICONINFORMATION);
          Exit;
        end;
        if ColumnByName['FLOPCAO'].Rows[Row] = 'A' then
        begin
          MessageBox(fmPrincipal.Handle,
                     PWideChar('Este registro foi alterado. Até ser salvo, não poderá ser excluído.'#13#10+
                               'Para excluir este registro sem salvá-lo, acione a opção Restaurar, assim os registros retornarão para seu estado anterior.'),
                     cTituloMensagemInformacao,
                     MB_OK or MB_ICONINFORMATION);
          Exit;
        end;
        // Fim realiza validações.

        if ColumnByName['FLOPCAO'].Rows[Row] <> 'I' then
          if MessageBox(fmPrincipal.Handle,
                        PWideChar('Deseja realmente excluir a parcela ' + ColumnByName['NUPARCELA'].Rows[Row] + ' da aquisição?'#13#10+
                                  'Atenção: Esta operação não poderá ser desfeita.'),
                        cTituloMensagemConfirmacao,
                        MB_YESNO or MB_ICONQUESTION or MB_DEFBUTTON2) = IDYES then
            try
              pAquisicao.Parcela := ColumnByName['NUPARCELA'].Ints[Row];
              vRetorno := pAquisicao.excluiParcela;

              ButtonRestaurarClick(Sender);

              if vRetorno <> 0 then
                fmPrincipal.apresentaResultadoCadastro('Parcela excluída com sucesso.')
              else
                raise Exception.Create('Não foi possível excluir a parcela.');
            except
              on E: Exception do
                fmPrincipal.manipulaExcecoes(Sender,E);
            end;

        // Para registro incluído na Grid, mas não salvo, apenas remove a linha e
        // reorganiza os números da parcelas
        BeginUpdate;
        if ColumnByName['FLOPCAO'].Rows[Row] = 'I' then
        begin
          RemoveRows(Row,1);
          for i := 1 to RowCount -1 do
            ColumnByName['NUPARCELA'].Ints[i] := i;
          EditCadastroNUPARCELA.Text := IntToStr(RowCount);
        end;
        EndUpdate;
      end;

      // Atualiza a tabela de Usuário Saldo.
      //fmPrincipal.atualizaUsuarioSaldo;
    except
      on E: Exception do
        fmPrincipal.manipulaExcecoes(Sender,E);
    end;
  finally
    Opcao := vOpcaoAnterior;

    if ComboBoxCadastroFLTIPOPARCELA.Enabled then
      ActiveControl := ComboBoxCadastroFLTIPOPARCELA;
  end;
end;

procedure TfmCadAquisicaoParcela.ButtonFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfmCadAquisicaoParcela.ButtonIncluirAlterarParcelaClick(Sender: TObject);
var
  vMensagem, vAux: string;
  vvlTotal: currency;
begin
  // Validações.
  if AnsiCompareText(DatePickerEditCadastroDTVENCIMENTO.Text,EmptyStr) = 0 then
    vMensagem := vMensagem + #13#10'- O campo Vencimento é requerido.';
  if EditCadastroVLPARCELA.Value = 0 then
    vMensagem := vMensagem + #13#10'- O campo Vl. Parcela deve ser maior que zero.';
  if EditCadastroVLDESCONTO.Value >= EditCadastroVLPARCELA.Value then
    vMensagem := vMensagem + #13#10'- O Vl. Desconto deve ser menor que o Vl. Despesa.';
  if ComboBoxCadastroFLTIPOPARCELA.ItemIndex = 0 then
    if AnsiCompareText(DatePickerEditCadastroDTPAGAMENTO.Text,EmptyStr) = 0 then
      vMensagem := vMensagem + #13#10'- Para a parcela de entrada é requerido informar uma Data de Pagamento.';

  if vMensagem <> EmptyStr then
  begin
    MessageBox(fmPrincipal.Handle,
               PWideChar('A parcela não poderá ser inserida devido as seguintes pendências:' + vMensagem),
               cTituloMensagemAlerta,
               MB_OK or MB_ICONWARNING);
    Exit;
  end;

  if EditCadastroVLTOTAL.Value = 0 then
    EditCadastroVLPARCELAExit(Sender);

  try
    with ColumnGridParcelas do
    begin
      BeginUpdate;
      if Enabled then
      begin
        RowCount := RowCount +1;
        Row := RowCount -1;
        Opcao := 'I';
      end;

      Enabled := true;
      if ColumnByName['FLOPCAO'].Rows[Row] <> 'A' then
        ColumnByName['NUPARCELA'].Ints[Row] := StrToInt(EditCadastroNUPARCELA.Text);
      if ComboBoxCadastroFLTIPOPARCELA.ItemIndex > -1 then
      begin
        with ComboBoxCadastroFLTIPOPARCELA do
          vAux := Items.Strings[ItemIndex];
        ColumnByName['FLTIPOPARCELA'].Rows[Row] := vAux;
      end
      else
        ColumnByName['FLTIPOPARCELA'].Rows[Row] := EmptyStr;
      if ComboBoxCadastroNMFORMAPAGAMENTO.ItemIndex > -1 then
      begin
        with ComboBoxCadastroNMFORMAPAGAMENTO do
          vAux := Items.Strings[ItemIndex];
        ColumnByName['CDFORMAPAGAMENTO'].Ints[Row] := StrToInt(plFormaPagamento.Strings[ComboBoxCadastroNMFORMAPAGAMENTO.ItemIndex-1]);
        ColumnByName['NMFORMAPAGAMENTO'].Rows[Row] := vAux;
      end
      else
      begin
        ColumnByName['CDFORMAPAGAMENTO'].Ints[Row] := 0;
        ColumnByName['NMFORMAPAGAMENTO'].Rows[Row] := EmptyStr;
      end;
      ColumnByName['DTVENCIMENTO'].Dates[Row] := DatePickerEditCadastroDTVENCIMENTO.Date;
      ColumnByName['VLPARCELA'].Floats[Row] := EditCadastroVLPARCELA.Value;
      ColumnByName['VLDESCONTO'].Floats[Row] := EditCadastroVLDESCONTO.Value;
      ColumnByName['VLACRESCIMO'].Floats[Row] := EditCadastroVLACRESCIMO.Value;
      vvlTotal := (ColumnByName['VLPARCELA'].Floats[Row] + ColumnByName['VLACRESCIMO'].Floats[Row]) - ColumnByName['VLDESCONTO'].Floats[Row];
      ColumnByName['VLTOTAL'].Floats[Row] := vvlTotal;
      if DatePickerEditCadastroDTPAGAMENTO.Text <> EmptyStr then
        ColumnByName['DTPAGAMENTO'].Dates[Row] := DatePickerEditCadastroDTPAGAMENTO.Date
      else
        ColumnByName['DTPAGAMENTO'].Rows[Row] := EmptyStr;
      if ColumnByName['DTPAGAMENTO'].Rows[Row] <> EmptyStr then
        AddImageIdx(10,Row,2,haCenter,vaCenter)
      else
        RemoveImageIdx(10,Row);
      AddImageIdx(12,Row,0,haCenter,vaCenter);
      if ColumnByName['FLOPCAO'].Rows[Row] <> 'A' then
        ColumnByName['FLOPCAO'].Rows[Row] := 'I';
      EndUpdate;
    end;
  finally
    limpaCampos;
    LabelPagoEm.Visible := false;
    DatePickerEditCadastroDTPAGAMENTO.Visible := false;
    ButtonIncluirAlterarParcela.Caption := '&Adicionar';
    habilitaBotoes;
    with ColumnGridParcelas do
      EditCadastroNUPARCELA.Text := IntToStr(ColumnByName['NUPARCELA'].Ints[RowCount-1]+1);
    atualizaRodapeTotalizacoes;

    if ComboBoxCadastroFLTIPOPARCELA.Enabled then
      ActiveControl := ComboBoxCadastroFLTIPOPARCELA;
  end;
end;

procedure TfmCadAquisicaoParcela.ButtonRecalculaParcelasClick(Sender: TObject);
//var
//  i, j, vnumParcelasFixas: integer;
//  vvlAquisicao, vvlParcela, vvlParcelasFixas, vvlAtualizado, x, y, vvlParcela1: currency;
begin
//  try
//    // Valida a ação.
//    if MessageBox(fmPrincipal.Handle,
//                  PWideChar('Deseja realmente recalcular todas as Parcelas?'+#13+#10+
//                            'As Parcelas de Tipo Entrada e Reforço não serão afetados.'#13+#10+
//                            'Atenção: Será necessário Salvar os registros para efetivar o recálculo.'),
//                  cTituloMensagemConfirmacao,
//                  MB_YESNO or MB_ICONQUESTION or MB_DEFBUTTON2) = IDNO then
//      Exit;
//
//    with ColumnGridParcelas do
//    begin
//      // Validações.
//      for i := 1 to RowCount -1 do
//      begin
//        if ColumnByName['FLOPCAO'].Rows[i] <> 'S' then
//        begin
//          MessageBox(fmPrincipal.Handle,
//                     PWideChar('Identificados registros que não foram salvos.'#13#10 +
//                               'Para realizar o recálculo, todos os registros devem estar salvos.'),
//                     cTituloMensagemInformacao,
//                     MB_OK or MB_ICONEXCLAMATION);
//          Exit;
//        end;
//        if ColumnByName['FLTIPOPARCELA'].Rows[i] = 'Parcela' then
//          if ColumnByName['DTPAGAMENTO'].Rows[i] <> EmptyStr then
//          begin
//            MessageBox(fmPrincipal.Handle,
//                       PWideChar('Identificadas Parcelas que já constam como pagas.'#13#10 +
//                                 'Para realizar o recálculo das Parcelas, não podem existir Parcelas já pagas.'),
//                       cTituloMensagemInformacao,
//                       MB_OK or MB_ICONEXCLAMATION);
//            Exit;
//          end;
//      end;
//      // Fim validações.
//
//      // Realiza os cálculos.
//      try
//        Screen.Cursor := crHourGlass;
//        vvlParcelasFixas := 0;
//        vnumParcelasFixas := 0;
//        // Regra:
//        // Descobre o somatório das parcelas fixas, através disto recalcula as
//        // as parcelas de acordo com o valor total - valor parcelas fixas.
//        for i := 1 to RowCount -1 do
//          if ColumnByName['FLTIPOPARCELA'].Rows[i] <> 'Parcela' then
//            vvlParcelasFixas := vvlParcelasFixas + ColumnByName['VLPARCELA'].Floats[i]
//          else
//            Inc(vnumParcelasFixas);
//
//
//        // Regras:
//        //  1) Se a divisão for um valor com mais de 2 casas decimais, a primeira
//        //     parcela receberá o restante do valor, as outras parcelas receberão
//        //     o valor arredondado em 2 casas decimais (as dos centavos).
//
//        // Calcula o valor das Parcelas.
//        vvlAquisicao := pvlAquisicao - vvlParcelasFixas;
//        vvlParcela := fmPrincipal.fnGeral.obtemValorParcela(vvlAquisicao,
//                                                            EditCadastroVLTAXAJUROS.Value,
//                                                            vnumParcelasFixas);
//        // Cálculo para ver se há um desdobramento, se houve, joga na primeira prestação.
//        x := RoundTo(vvlParcela, -2);
//        y := (vvlParcela - x) * vnumParcelasFixas;
//        y := RoundTo(y, -2);
//        if vvlParcela > x then
//          vvlParcela1 := x + y + EditCadastroVLTAXAEXTRA.Value
//        else
//          vvlParcela1 := x + EditCadastroVLTAXAEXTRA.Value;
//
//        // Atualiza na grid.
//        j := 0;
//        BeginUpdate;
//        for i := 1 to RowCount -1 do
//          if ColumnByName['FLTIPOPARCELA'].Rows[i] = 'Parcela' then
//          begin
//            Inc(j);
//            if j = 1 then
//              vvlAtualizado := vvlParcela1
//            else
//              vvlAtualizado := vvlParcela;
//            ColumnByName['VLPARCELA'].Floats[i] := vvlAtualizado;
//            ColumnByName['FLOPCAO'].Rows[i] := 'A';
//          end;
//        EndUpdate;
//      finally
//        Screen.Cursor := crDefault;
//      end;
//      // Fim Realiza os cálculos.
//    end;
//  except
//    on E: Exception do
//      fmPrincipal.manipulaExcecoes(Sender,E);
//  end;
end;

procedure TfmCadAquisicaoParcela.ButtonRestaurarClick(Sender: TObject);
begin
  limpaCampos;
  carregaParcelasAquisicao;

  if ComboBoxCadastroFLTIPOPARCELA.Enabled then
    ActiveControl := ComboBoxCadastroFLTIPOPARCELA;
end;

procedure TfmCadAquisicaoParcela.ButtonSalvarClick(Sender: TObject);
var
  i, vRetorno, vFlag: integer;
  vOpcaoAnterior: char;
begin
  vOpcaoAnterior := Opcao;
  Opcao := 'I';

  try
    try
      vFlag := 0;
      with ColumnGridParcelas do
        for i := 1 to RowCount -1 do
        begin
          // Se já está salvo, pula pro próximo registro.
          if ColumnByName['FLOPCAO'].Rows[i] = 'S' then
            Continue;

          pAquisicao.Parcela := ColumnByName['NUPARCELA'].Ints[i];
          pAquisicao.TipoParcela := Copy(ColumnByName['FLTIPOPARCELA'].Rows[i],1,1);
          pAquisicao.DataVencimento := ColumnByName['DTVENCIMENTO'].Dates[i];
          pAquisicao.ValorParcela := ColumnByName['VLPARCELA'].Floats[i];
          pAquisicao.ValorDesconto := ColumnByName['VLDESCONTO'].Floats[i];
          pAquisicao.ValorJuros := ColumnByName['VLACRESCIMO'].Floats[i];
          pAquisicao.FormaPagamento := ColumnByName['CDFORMAPAGAMENTO'].Ints[i];
          if ColumnByName['DTPAGAMENTO'].Rows[i] = EmptyStr then
            pAquisicao.DataPagamento := -1
          else
            pAquisicao.DataPagamento := ColumnByName['DTPAGAMENTO'].Dates[i];
          if ColumnByName['FLOPCAO'].Rows[i] = 'I' then
            vRetorno := pAquisicao.insereParcela
          else
            vRetorno := pAquisicao.atualizaParcela;

          if vRetorno = 1 then
          begin
            vFlag := 1;
            ColumnByName['FLOPCAO'].Rows[i] := 'S';
          end
          else
            apresentaResultadoCadastro('Não foi possível salvar a parcela ' + ColumnByName['NUPARCELA'].Rows[i] + ' da aquisição.');
        end;

        // Atualiza a tabela de Usuário Saldo.
        //fmPrincipal.atualizaUsuarioSaldo;

        ButtonRestaurarClick(ButtonRestaurar);

        if vFlag = 1 then
          fmPrincipal.apresentaResultadoCadastro('Cadastro realizado com sucesso.');
    except
      on E: Exception do
        fmPrincipal.manipulaExcecoes(Sender,E);
    end;
  finally
    Opcao := vOpcaoAnterior;

    if ComboBoxCadastroFLTIPOPARCELA.Enabled then
      ActiveControl := ComboBoxCadastroFLTIPOPARCELA;
  end;
end;

procedure TfmCadAquisicaoParcela.carregaImagensBotoes;
begin
  EditCadastroVLPARCELA.Button.Glyph.Assign(fmPrincipal.fnGeral.obtemImagemCalculadora);
  EditCadastroVLTAXAJUROS.Button.Glyph.Assign(fmPrincipal.fnGeral.obtemImagemCalculadora);
  EditCadastroVLACRESCIMO.Button.Glyph.Assign(fmPrincipal.fnGeral.obtemImagemCalculadora);
  EditCadastroVLDESCONTO.Button.Glyph.Assign(fmPrincipal.fnGeral.obtemImagemCalculadora);
  EditCadastroVLTAXAEXTRA.Button.Glyph.Assign(fmPrincipal.fnGeral.obtemImagemCalculadora);
  EditCadastroVLTOTAL.Button.Glyph.Assign(fmPrincipal.fnGeral.obtemImagemCalculadora);

  ButtonAtualizarFormaPagamento.Picture.LoadFromFile(fmPrincipal.LocalIcones + 'refresh-2-e-16.png');
  ButtonAtualizarFormaPagamento.HotPicture.LoadFromFile(fmPrincipal.LocalIcones + 'refresh-2-h-16.png');
  ButtonAtualizarFormaPagamento.DisabledPicture.LoadFromFile(fmPrincipal.LocalIcones + 'refresh-2-d-16.png');
  ButtonAtualizarTudo.Picture.LoadFromFile(fmPrincipal.LocalIcones + 'arrow-212-e-16.png');
  ButtonAtualizarTudo.HotPicture.LoadFromFile(fmPrincipal.LocalIcones + 'arrow-212-h-16.png');
  ButtonAtualizarTudo.DisabledPicture.LoadFromFile(fmPrincipal.LocalIcones + 'arrow-212-d-16.png');
  ButtonNovoFormaPagamento.Picture.LoadFromFile(fmPrincipal.LocalIcones + 'new-e-16.png');
  ButtonNovoFormaPagamento.HotPicture.LoadFromFile(fmPrincipal.LocalIcones + 'new-h-16.png');
  ButtonNovoFormaPagamento.DisabledPicture.LoadFromFile(fmPrincipal.LocalIcones + 'new-d-16.png');
end;

procedure TfmCadAquisicaoParcela.carregaParcelasAquisicao;
var
  vQuery: TZQuery;
  vvlTotal: currency;
begin
  Opcao := 'C';

  try
    ColumnGridParcelas.BeginUpdate;
    limpaGrid;

    vQuery := pAquisicao.listaParcela;
    with vQuery do
    begin
      SQL.Add('WHERE cdaquisicao = :CDAQUISICAO');
      SQL.Add('ORDER BY 2');
      Params.ParamByName('CDAQUISICAO').AsInteger := Codigo;
      dmPrincipal.executaConsulta(vQuery);

      while not Eof do
      begin
        with ColumnGridParcelas do
        begin
          ColumnByName['NUPARCELA'].Ints[RowCount-1] := Fields.FieldByName('NUPARCELA').AsInteger;
          if Fields.FieldByName('FLTIPOPARCELA').AsString = 'P' then
            ColumnByName['FLTIPOPARCELA'].Rows[RowCount-1] := 'Parcela'
          else
            if Fields.FieldByName('FLTIPOPARCELA').AsString = 'E' then
              ColumnByName['FLTIPOPARCELA'].Rows[RowCount-1] := 'Entrada'
            else
              ColumnByName['FLTIPOPARCELA'].Rows[RowCount-1] := 'Reforço';
          ColumnByName['DTVENCIMENTO'].Dates[RowCount-1] := Fields.FieldByName('DTVENCIMENTO').AsDateTime;
          ColumnByName['VLPARCELA'].Floats[RowCount-1] := Fields.FieldByName('VLPARCELA').AsFloat;
          if not Fields.FieldByName('VLDESCONTO').IsNull then
            ColumnByName['VLDESCONTO'].Floats[RowCount-1] := Fields.FieldByName('VLDESCONTO').AsFloat
          else
            ColumnByName['VLDESCONTO'].Floats[RowCount-1] := 0;
          if not Fields.FieldByName('CDFORMAPAGAMENTO').IsNull then
          begin
            ColumnByName['CDFORMAPAGAMENTO'].Ints[RowCount-1] := Fields.FieldByName('CDFORMAPAGAMENTO').AsInteger;
            ColumnByName['NMFORMAPAGAMENTO'].Rows[RowCount-1] := ComboBoxCadastroNMFORMAPAGAMENTO.Items.Strings[plFormaPagamento.IndexOf(Fields.FieldByName('CDFORMAPAGAMENTO').AsString)+1];
          end
          else
          begin
            ColumnByName['CDFORMAPAGAMENTO'].Ints[RowCount-1] := 0;
            ColumnByName['NMFORMAPAGAMENTO'].Rows[RowCount-1] := EmptyStr;
          end;
          if not Fields.FieldByName('VLJUROS').IsNull then
            ColumnByName['VLACRESCIMO'].Floats[RowCount-1] := Fields.FieldByName('VLJUROS').AsFloat
          else
            ColumnByName['VLACRESCIMO'].Floats[RowCount-1] := 0;
          vvlTotal := (ColumnByName['VLPARCELA'].Floats[RowCount-1] +
                       ColumnByName['VLACRESCIMO'].Floats[RowCount-1]) -
                       ColumnByName['VLDESCONTO'].Floats[RowCount-1];
          ColumnByName['VLTOTAL'].Floats[RowCount-1] := vvlTotal;
          if not Fields.FieldByName('DTPAGAMENTO').IsNull then
            ColumnByName['DTPAGAMENTO'].Dates[RowCount-1] := Fields.FieldByName('DTPAGAMENTO').AsDateTime
          else
            ColumnByName['DTPAGAMENTO'].Rows[RowCount-1] := EmptyStr;
          if not Fields.FieldByName('DTPAGAMENTO').IsNull then
            AddImageIdx(10,RowCount-1,2,haCenter,vaCenter);
          if pSomenteLeitura = false then
            AddImageIdx(12,RowCount-1,0,haCenter,vaCenter);
          ColumnByName['FLOPCAO'].Rows[RowCount-1] := 'S';

          Next;
          if not Eof then
            RowCount := RowCount +1;
        end;
      end;
      Active := false;
    end;
  finally
    with ColumnGridParcelas do
    begin
      EndUpdate;
      Row := 1;
      EditCadastroNUPARCELA.Text := IntToStr(ColumnByName['NUPARCELA'].Ints[RowCount-1]+1);
    end;
    atualizaRodapeTotalizacoes;

    FreeAndNil(vQuery);
  end;
end;

procedure TfmCadAquisicaoParcela.ColumnGridParcelasClickCell(Sender: TObject;
  ARow, ACol: Integer);
begin
  with ColumnGridParcelas do
  begin
    // Se está editando, só executa se for atualizado via botão atualizar.
    if not Enabled then
      Exit;
    // Valida se é a coluna de edição.
    if ARow = 0 then
      Exit;
    if ACol = 0 then
      Exit;
    // A linha precisa estar completa.
    if (ColumnByName['NUPARCELA'].Rows[ARow] = EmptyStr) or (ARow = 0) then
      Exit;
    // Se já foi salvo e pago, não deixa mais editar.
    // Removido em 23/07/2014 - Jorge Valladão.
    {if ColumnByName['FLOPCAO'].Rows[ARow] = 'S' then
      if ColumnByName['DTPAGAMENTO'].Rows[ARow] <> EmptyStr then
        Exit;}
    // Fim validações.

    limpaCampos;

    BeginUpdate;
    Opcao := 'A';
    ButtonIncluirAlterarParcela.Caption := '&Alterar';
    desabilitaBotoes;

    EditCadastroNUPARCELA.Text := ColumnByName['NUPARCELA'].Rows[ARow];
    if ColumnByName['FLTIPOPARCELA'].Rows[ARow] <> EmptyStr then
      with ComboBoxCadastroFLTIPOPARCELA do
        ItemIndex := Items.IndexOf(ColumnByName['FLTIPOPARCELA'].Rows[ARow]);
    if ColumnByName['NMFORMAPAGAMENTO'].Rows[ARow] <> EmptyStr then
      with ComboBoxCadastroNMFORMAPAGAMENTO do
        ItemIndex := Items.IndexOf(ColumnByName['NMFORMAPAGAMENTO'].Rows[ARow]);
    DatePickerEditCadastroDTVENCIMENTO.Date := ColumnByName['DTVENCIMENTO'].Dates[ARow];
    EditCadastroVLPARCELA.Value := ColumnByName['VLPARCELA'].Floats[ARow];
    EditCadastroVLDESCONTO.Value := ColumnByName['VLDESCONTO'].Floats[ARow];
    EditCadastroVLACRESCIMO.Value := ColumnByName['VLACRESCIMO'].Floats[ARow];
    EditCadastroVLTOTAL.Value := ColumnByName['VLTOTAL'].Floats[ARow];
    EditCadastroVLPARCELAExit(EditCadastroVLPARCELA);
    // 1) Somente em registros salvos é possível inserir uma data de pagamento.
    // 2) Se a data de pagamento foi inserida, mas o registro ainda não foi salvo,
    //    é possível ajustá-la.
    if (ColumnByName['FLOPCAO'].Rows[ARow] = 'S') or
       ((ColumnByName['FLOPCAO'].Rows[ARow] = 'A') and (ColumnByName['DTPAGAMENTO'].Rows[ARow] <> EmptyStr)) then
    begin
      LabelPagoEm.Visible := true;
      DatePickerEditCadastroDTPAGAMENTO.Visible := true;
      if ColumnByName['DTPAGAMENTO'].Rows[ARow] <> EmptyStr then
        DatePickerEditCadastroDTPAGAMENTO.Date := ColumnByName['DTPAGAMENTO'].Dates[ARow];
    end;
    AddImageIdx(12,Row,1,haCenter,vaCenter);
    ColumnByName['FLOPCAO'].Rows[ARow] := 'A';
    Enabled := false;
    ButtonCancelarEdicaoParcela.Enabled := true;
    EndUpdate;
  end;
end;

procedure TfmCadAquisicaoParcela.consultaParcelasAquisicao(
  prmcdAquisicao: integer; prmvlAquisicao, prmvlTaxaExtra: currency;
  prmvlTaxaJuros: double; prmSomenteLeitura: boolean);
begin
  pSomenteLeitura := prmSomenteLeitura;
  Codigo := prmcdAquisicao;
  pAquisicao.Codigo := Codigo;
  setavlAquisicao(prmvlAquisicao);
  setaSomenteLeitura(prmSomenteLeitura);
  EditCadastroVLTAXAJUROS.Value := prmvlTaxaJuros;
  EditCadastroVLTAXAEXTRA.Value := prmvlTaxaExtra;
  if prmSomenteLeitura = true then
    ColumnGridParcelas.OnClickCell := nil;
  carregaParcelasAquisicao;
  if prmSomenteLeitura = true then
    EditCadastroNUPARCELA.Clear;
end;

procedure TfmCadAquisicaoParcela.desabilitaBotoes;
begin
  ButtonSalvar.Enabled := false;
  ButtonExcluir.Enabled := false;
  ButtonRestaurar.Enabled := false;
  //ButtonRecalculaParcelas.Enabled := false;
  ButtonAtualizarTudo.Enabled := false;
  ButtonAtualizarFormaPagamento.Enabled := false;
  ButtonNovoFormaPagamento.Enabled := false;
end;

procedure TfmCadAquisicaoParcela.EditCadastroVLDESCONTOExit(Sender: TObject);
var
  vValorTotal: currency;
begin
  try
    vValorTotal := (EditCadastroVLPARCELA.Value - EditCadastroVLDESCONTO.Value) + EditCadastroVLACRESCIMO.Value;
    EditCadastroVLTOTAL.Value := fmPrincipal.fnGeral.Arredonda(vValorTotal,-2);
  except
    on E: EDivByZero do
      apresentaResultadoCadastro('Ocorreu um erro de divisão por zero, favor verificar os valores informados.');
    on E: Exception do
      apresentaResultadoCadastro('Ocorreu um erro de cálculo: '+E.Message);
  end;
end;

procedure TfmCadAquisicaoParcela.EditCadastroVLACRESCIMOExit(Sender: TObject);
var
  vValorTotal: double;
begin
  try
    vValorTotal := (EditCadastroVLPARCELA.Value - EditCadastroVLDESCONTO.Value) + EditCadastroVLACRESCIMO.Value;
    EditCadastroVLTOTAL.Value := fmPrincipal.fnGeral.Arredonda(vValorTotal,-2);
  except
    on E: EDivByZero do
      apresentaResultadoCadastro('Ocorreu um erro de divisão por zero, favor verificar os valores informados.');
    on E: Exception do
      apresentaResultadoCadastro('Ocorreu um erro de cálculo: '+E.Message);
  end;
end;

procedure TfmCadAquisicaoParcela.EditCadastroVLPARCELAExit(Sender: TObject);
var
  vValorTotal: double;
begin
  try
    vValorTotal := (EditCadastroVLPARCELA.Value - EditCadastroVLDESCONTO.Value) + EditCadastroVLACRESCIMO.Value;
    EditCadastroVLTOTAL.Value := fmPrincipal.fnGeral.Arredonda(vValorTotal,-2);
  except
    on E: EDivByZero do
      apresentaResultadoCadastro('Ocorreu um erro de divisão por zero, favor verificar os valores informados.');
    on E: Exception do
      apresentaResultadoCadastro('Ocorreu um erro de cálculo: '+E.Message);
  end;
end;

procedure TfmCadAquisicaoParcela.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfmCadAquisicaoParcela.FormCreate(Sender: TObject);
var
  i: integer;
begin
  try
    CreateGUID(pId);

    Color := Self.Color;
    FormStyler.AutoThemeAdapt := false;

    plFormaPagamento := TStringList.Create;

    pAquisicao := TAquisicao.Create;

    // Configura a Grid.
    with ColumnGridParcelas do
    begin
      DrawingStyle := gdsThemed;
      AutoThemeAdapt := false;
      for i := 0 to ColCount -1 do
        Columns[i].ShowBands := true;
      Bands.Active := true;
    end;

    for i := Self.ComponentCount -1 downto 0 do
      if (Self.Components[i] is TAdvOfficeComboBox) then
        (Self.Components[i] as TAdvOfficeComboBox).AutoThemeAdapt := false;

    EditCadastroVLPARCELA.Button.Flat := true;
    EditCadastroVLTAXAJUROS.Button.Flat := true;
    EditCadastroVLACRESCIMO.Button.Flat := true;
    EditCadastroVLDESCONTO.Button.Flat := true;
    EditCadastroVLTAXAEXTRA.Button.Flat := true;
    EditCadastroVLTOTAL.Button.Flat := true;

    carregaImagensBotoes;

    fmPrincipal.fnGeral.insereImageList(ImageList,fmPrincipal.LocalIcones + 'edit-e-16.png');
    fmPrincipal.fnGeral.insereImageList(ImageList,fmPrincipal.LocalIcones + 'edit-h-16.png');
    fmPrincipal.fnGeral.insereImageList(ImageList,fmPrincipal.LocalIcones + 'banknotes-e-16.png');
    ColumnGridParcelas.GridImages := ImageList;

    limpaGrid;
    limpaCampos;

    pSomenteLeitura := false;
    ButtonCancelarEdicaoParcela.Enabled := false;

    if ComboBoxCadastroFLTIPOPARCELA.Enabled then
      ActiveControl := ComboBoxCadastroFLTIPOPARCELA;

    FormResize(Sender);
  except
    on E: Exception do
    begin
      fmPrincipal.manipulaExcecoes(Sender,E);
      Close;
    end;
  end;
end;

procedure TfmCadAquisicaoParcela.FormDestroy(Sender: TObject);
begin
  FreeAndNil(plFormaPagamento);
  FreeAndNil(pAquisicao);
end;

procedure TfmCadAquisicaoParcela.FormResize(Sender: TObject);
begin
  ButtonFechar.Left := PanelBotoes.Width - ButtonFechar.Width - fmPrincipal.EspacamentoFinalBotao;
  ButtonRestaurar.Left := ButtonFechar.Left - ButtonRestaurar.Width - fmPrincipal.EspacamentoEntreBotoes;
  ButtonExcluir.Left := ButtonRestaurar.Left - ButtonExcluir.Width - fmPrincipal.EspacamentoEntreBotoes;
  ButtonSalvar.Left := ButtonExcluir.Left - ButtonSalvar.Width - fmPrincipal.EspacamentoEntreBotoes;

  ButtonIncluirAlterarParcela.Left := EditCadastroVLTOTAL.Left + EditCadastroVLTOTAL.Width + fmPrincipal.EspacamentoEntreBotoes;
  ButtonCancelarEdicaoParcela.Left := ButtonIncluirAlterarParcela.Left + ButtonIncluirAlterarParcela.Width + fmPrincipal.EspacamentoEntreBotoes;
end;

procedure TfmCadAquisicaoParcela.habilitaBotoes;
begin
  ButtonSalvar.Enabled := true;
  ButtonExcluir.Enabled := true;
  ButtonRestaurar.Enabled := true;
  ButtonAtualizarTudo.Enabled := true;
  ButtonRecalculaParcelas.Enabled := true;
  ButtonAtualizarFormaPagamento.Enabled := true;
  ButtonNovoFormaPagamento.Enabled := true;
end;

procedure TfmCadAquisicaoParcela.limpaCampos;
begin
  EditCadastroNUPARCELA.Text := '1';
  ComboBoxCadastroFLTIPOPARCELA.ItemIndex := -1;
  ComboBoxCadastroNMFORMAPAGAMENTO.ItemIndex := -1;
  ButtonAtualizarFormaPagamentoClick(Self);
  DatePickerEditCadastroDTPAGAMENTO.Clear;
  DatePickerEditCadastroDTVENCIMENTO.Clear;
  EditCadastroVLDESCONTO.Value := 0;
  EditCadastroVLPARCELA.Value := 0;
  EditCadastroVLTOTAL.Value := 0;
  ButtonCancelarEdicaoParcela.Enabled := false;
end;

procedure TfmCadAquisicaoParcela.limpaGrid;
begin
  with ColumnGridParcelas do
  begin
    ClearRows(1,RowCount-1);
    Row := 1;
    RowCount := 2;
    ColumnByName['VLPARCELA'].FloatFormat := '%.2f';
    ColumnByName['VLPARCELA'].SortPrefix := 'R$';
    ColumnByName['VLDESCONTO'].FloatFormat := '%.2f';
    ColumnByName['VLDESCONTO'].SortPrefix := 'R$';
    ColumnByName['VLACRESCIMO'].FloatFormat := '%.2f';
    ColumnByName['VLACRESCIMO'].SortPrefix := 'R$';
    ColumnByName['VLTOTAL'].FloatFormat := '%.2f';
    ColumnByName['VLTOTAL'].SortPrefix := 'R$';
  end;
end;

procedure TfmCadAquisicaoParcela.setaSomenteLeitura(prmSomenteLeitura: boolean);
begin
  // Se for somente leitura, congela todos os botões, menos o de fechar.
  ComboBoxCadastroFLTIPOPARCELA.Enabled := (not prmSomenteLeitura);
  ComboBoxCadastroNMFORMAPAGAMENTO.Enabled := (not prmSomenteLeitura);
  DatePickerEditCadastroDTPAGAMENTO.Enabled := (not prmSomenteLeitura);
  DatePickerEditCadastroDTVENCIMENTO.Enabled := (not prmSomenteLeitura);
  EditCadastroVLDESCONTO.Enabled := (not prmSomenteLeitura);
  EditCadastroVLACRESCIMO.Enabled := (not prmSomenteLeitura);
  EditCadastroVLPARCELA.Enabled := (not prmSomenteLeitura);
  EditCadastroVLTOTAL.Enabled := (not prmSomenteLeitura);
  ButtonIncluirAlterarParcela.Enabled := (not prmSomenteLeitura);
  ButtonRestaurar.Enabled := (not prmSomenteLeitura);
  ButtonAtualizarTudo.Enabled := (not prmSomenteLeitura);
  ButtonRecalculaParcelas.Enabled := (not prmSomenteLeitura);
  ButtonExcluir.Enabled := (not prmSomenteLeitura);
  ButtonSalvar.Enabled := (not prmSomenteLeitura);
  ButtonAtualizarFormaPagamento.Enabled := (not prmSomenteLeitura);
  ButtonNovoFormaPagamento.Enabled := (not prmSomenteLeitura);
end;

procedure TfmCadAquisicaoParcela.setavlAquisicao(prmvlAquisicao: currency);
begin
  pvlAquisicao := prmvlAquisicao;
  LabelValorTotalAquisicao.Caption := 'Valor aquisição: ' + FormatFloat('"R$ ",0.00',pvlAquisicao);
end;

procedure TfmCadAquisicaoParcela.ButtonAtualizarFormaPagamentoClick(
  Sender: TObject);
var
  vQuery: TZQuery;
begin
  try
    plFormaPagamento.Clear;
    ComboBoxCadastroNMFORMAPAGAMENTO.Items.Clear;

    vQuery := TZQuery.Create(Self);
    with vQuery do
    begin
      SQL.Text := 'SELECT cdformapagamento, nmformapagamento';
      SQL.Add('FROM ' + cSchema + '.formapagamento');
      SQL.Add('WHERE flativo = ''S''');
      SQL.Add('ORDER BY 1 ASC');
      dmPrincipal.executaConsulta(vQuery);

      if Eof then
        MessageBox(fmPrincipal.Handle,
                   PWideChar('Não existem formas de pagamento cadastradas no Sistema.'#13#10 +
                             'Para cadastrar formas de pagamento: Menu > Cadastros > Cadastrar Forma de Pagamento'),
                   cTituloMensagemInformacao,
                   MB_OK or MB_ICONINFORMATION)
      else
      begin
        ComboBoxCadastroNMFORMAPAGAMENTO.Items.Add(EmptyStr);
        while not Eof do
        begin
          plFormaPagamento.Add(Fields.FieldByName('CDFORMAPAGAMENTO').AsString);
          ComboBoxCadastroNMFORMAPAGAMENTO.Items.Add(Fields.FieldByName('NMFORMAPAGAMENTO').AsString);
          Next;
        end;
      end;
    end;
  finally
    vQuery.Active := false;
    FreeAndNil(vQuery);
    ComboBoxCadastroNMFORMAPAGAMENTO.ItemIndex := -1;
  end;
end;

end.
