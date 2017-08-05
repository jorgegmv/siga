unit unCadUsuarioAlteraSenha;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, ZAbstractRODataset, PerlRegEx,
  ZAbstractDataset, ZDataset, ComCtrls, StrUtils, pngimage, AdvAppStyler,
  AdvEdit, AdvOfficeButtons, AdvGlowButton, AdvPanel, unUsuario;

type
  TfmCadUsuarioAlteraSenha = class(TForm)
    FormStyler: TAdvFormStyler;
    PanelBotoes: TAdvPanel;
    BitBtnFechar: TAdvGlowButton;
    BitBtnAlterarSenha: TAdvGlowButton;
    PanelCentral: TAdvPanel;
    CheckBoxEnviarEmail: TAdvOfficeCheckBox;
    CheckBoxSenhaComplexa: TAdvOfficeCheckBox;
    EditSenhaAtual: TAdvEdit;
    EditSenhaConfirmacao: TAdvEdit;
    EditSenhaNova: TAdvEdit;
    LabelDicaSenha: TLabel;
    LabelNovaSenha: TLabel;
    LabelRedigite: TLabel;
    LabelSenhaAtual: TLabel;
    LabelUsuario: TLabel;
    MemoDicaSenha: TMemo;
    procedure BitBtnFecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BitBtnAlterarSenhaClick(Sender: TObject);
    procedure EditSenhaNovaKeyPress(Sender: TObject; var Key: Char);
    procedure EditSenhaAtualExit(Sender: TObject);
    procedure EditSenhaNovaExit(Sender: TObject);
    procedure EditSenhaConfirmacaoExit(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
    //pWindowsNetAPI: NET_API_STATUS;
    pId: TGUID;
    ppreValidacao: TPerlRegEx;
    pUsuario: TUsuario;
    pstrSenhaAnterior: string;
    procedure obtemInformacoesUsuario;
    function validaCadastro: boolean;
  public
    { Public declarations }
  end;

var
  fmCadUsuarioAlteraSenha: TfmCadUsuarioAlteraSenha;

const
  cRegExp = '(?=^[A-Z])(?=^[!-~]{8,}$)(?=.*[a-z])(?=.*[A-Z])(?=.*[^A-Za-z0-9])(?=^.*[^\s].*$)(?=.*[\d]).*$';
  cCaractesEspeciaisProibidos = ['�','�','~','^','�','`','�','�','�','�','�','�',
                                 '�','�','�','�','�','�','�','�','�','�','�','�',
                                 '�','�','�','�','�','�','�','�','�','�','�','�',
                                 '�','�','�','�','�','�','�','�','�','�','�','�',
                                 '�','�','�','�','�','�','�','�','�','�','�','�'];
  cValidaEMail = '\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b';

implementation

uses unPrincipal, undmPrincipal, undmEstilo;

{$R *.dfm}

procedure TfmCadUsuarioAlteraSenha.BitBtnAlterarSenhaClick(Sender: TObject);
var
  vEmail: string;
  vRetorno: integer;
begin
  try
    vRetorno := 0;
    BitBtnAlterarSenha.Enabled := false;
    // Valida se a nova senha est� ok.
    // Valida a for�a da Senha;
    if not validaCadastro then
      Exit;

    try
      try
        with pUsuario do
        begin
          Codigo := fmPrincipal.CodigoUsuarioLogado;
          Senha := fmPrincipal.fnGeral.criptografaSenha(EditSenhaNova.Text);
          DicaSenha := MemoDicaSenha.Lines.Text;
          vRetorno := atualizaSenhaUsuario;
        end;

        if vRetorno <> 0 then
        begin
          fmPrincipal.SenhaComplexa := CheckBoxSenhaComplexa.Checked;
          fmPrincipal.apresentaResultadoCadastro('Senha de acesso atualizada com sucesso.');
        end
        else
        begin
          fmPrincipal.apresentaResultadoCadastro('N�o foi poss�vel atualizar a senha de acesso.');
          Exit;
        end;

        if CheckBoxEnviarEmail.Checked = true then
        begin
          vEmail := '<div align="left">'+
                    'Prezado '+fmPrincipal.LoginUsuarioLogado+','+
                    '</div>'+
                    '<br>'+
                    '<div align="left">'+
                    'Sua senha de acesso foi alterada em '+FormatDateTime('dd/mm/yyy hh:nn:ss',Now())+'.'+
                    '<br>'+
                    'A sua nova senha de acesso �: "'+EditSenhaNova.Text+'".'+
                    '<br>'+
                    'A dica da sua nova senha de acesso �: "'+MemoDicaSenha.Lines.Text+'".'+
                    '</div>';
          fmPrincipal.enviaEmail('Altera��o de senha de acesso',
                                 fmPrincipal.EmailUsuarioLogado,
                                 EmptyStr,
                                 EmptyStr,
                                 vEmail);
        end;

        fmPrincipal.pLogSistema.Debug('O usu�rio ' + fmPrincipal.LoginUsuarioLogado +
                                      ' atualizou sua senha de acesso.');
      finally
        if vRetorno <> 0 then
        begin
          fmPrincipal.SenhaUsuarioLogado := EditSenhaNova.Text;
          EditSenhaAtual.Enabled := false;
          EditSenhaNova.Enabled := false;
          MemoDicaSenha.Enabled := false;
          CheckBoxEnviarEmail.Enabled := false;
          BitBtnAlterarSenha.Enabled := false;
        end;
      end;
    except
      on E: exception do
        fmPrincipal.manipulaExcecoes(Sender,E);
    end;
  finally
    BitBtnAlterarSenha.Enabled := false;
  end;
end;

procedure TfmCadUsuarioAlteraSenha.BitBtnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfmCadUsuarioAlteraSenha.EditSenhaAtualExit(Sender: TObject);
begin
  if Trim(EditSenhaAtual.Text) = EmptyStr then
    Exit;

  if fmPrincipal.SenhaUsuarioLogado <> EditSenhaAtual.Text then
  begin
     fmPrincipal.apresentaResultadoCadastro('A senha informada n�o confere com a senha atual do usu�rio.');
     EditSenhaAtual.SetFocus;
  end;

end;

procedure TfmCadUsuarioAlteraSenha.EditSenhaConfirmacaoExit(Sender: TObject);
begin
  if Trim(EditSenhaConfirmacao.Text) = EmptyStr then
    Exit;

  if AnsiUpperCase(EditSenhaConfirmacao.Text) <> AnsiUpperCase(EditSenhaNova.Text) then
  begin
     fmPrincipal.apresentaResultadoCadastro('A senha de confirma��o precisa ser igual a senha nova informada.');
     EditSenhaConfirmacao.SetFocus;
     Exit;
  end;

  BitBtnAlterarSenha.Enabled := true;
end;

procedure TfmCadUsuarioAlteraSenha.EditSenhaNovaExit(Sender: TObject);
begin
  if Trim(EditSenhaNova.Text) = EmptyStr then
    Exit;

  if AnsiUpperCase(EditSenhaAtual.Text) = AnsiUpperCase(EditSenhaNova.Text) then
  begin
     fmPrincipal.apresentaResultadoCadastro('A senha nova precisa ser diferente da senha atual.');
     EditSenhaNova.SetFocus;
  end
  else
  begin
    EditSenhaConfirmacao.Enabled := true;
    EditSenhaConfirmacao.SetFocus;
  end;

end;

procedure TfmCadUsuarioAlteraSenha.EditSenhaNovaKeyPress(Sender: TObject;
  var Key: Char);
begin
   if (CharInSet(Key,cCaractesEspeciaisProibidos)) or (Key = '''') Then
   begin
     fmPrincipal.apresentaResultadoCadastro('Este caractere especial n�o pode ser utilizado na nova senha de acesso,'+
                                            ' favor utilizar outro caractere especial.');
     Key := #0;
   end;
end;

procedure TfmCadUsuarioAlteraSenha.FormCreate(Sender: TObject);
var
  i: integer;
begin
  try
    CreateGUID(pId);

    Color := Self.Color;
    FormStyler.AutoThemeAdapt := false;

    ppreValidacao := TPerlRegEx.Create;
    pUsuario := TUsuario.Create;

    LabelUsuario.Caption := 'Usu�rio: ' + fmPrincipal.LoginUsuarioLogado;

    CheckBoxSenhaComplexa.Checked := fmPrincipal.SenhaComplexa;
    CheckBoxEnviarEmail.Checked := true;

    for i := Self.ComponentCount -1 downto 0 do
      if (Self.Components[i] is TAdvOfficeCheckBox) then
        (Self.Components[i] as TAdvOfficeCheckBox).Themed := true;

    obtemInformacoesUsuario;

    FormResize(Sender);
  except
    on E: Exception do
    begin
      fmPrincipal.manipulaExcecoes(Sender,E);
      Close;
    end;
  end;
end;

procedure TfmCadUsuarioAlteraSenha.FormDestroy(Sender: TObject);
begin
  FreeAndNil(ppreValidacao);
  FreeAndNil(pUsuario);
end;

procedure TfmCadUsuarioAlteraSenha.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Exit;
end;

procedure TfmCadUsuarioAlteraSenha.FormResize(Sender: TObject);
begin
  BitBtnFechar.Left := PanelBotoes.Width - BitBtnFechar.Width - fmPrincipal.EspacamentoFinalBotao;
  BitBtnAlterarSenha.Left := BitBtnFechar.Left - BitBtnAlterarSenha.Width - fmPrincipal.EspacamentoEntreBotoes;
end;

procedure TfmCadUsuarioAlteraSenha.obtemInformacoesUsuario;
var
  vQuery: TZQuery;
begin
  fmPrincipal.pLogSistema.Debug('O usu�rio solicitou a informa��o da dica da senha.');

  vQuery := pUsuario.lista;
  try
    with vQuery do
    begin
      SQL.Add('WHERE NMLOGIN = ' + QuotedStr(fmPrincipal.LoginUsuarioLogado));
      dmPrincipal.executaConsulta(vQuery);

      if RecordCount > 0 then
      begin
        MemoDicaSenha.Lines.Text := FieldByName('DEDICASENHA').AsString;
        pstrSenhaAnterior := FieldByName('DESENHANTERIOR').AsString;
      end;
    end;
  finally
    vQuery.Active := false;
    FreeAndNil(vQuery);
  end;
end;

function TfmCadUsuarioAlteraSenha.validaCadastro: boolean;
var
  vMensagem: TStringList;
  vSenha: string;
begin
  vMensagem := TStringList.Create;

  // Para a Senha Atual.
  if fmPrincipal.SenhaUsuarioLogado <> EditSenhaAtual.Text then
  begin
    vMensagem.Add('- A senha informada n�o confere com a senha atual do usu�rio.');
  end;
  if AnsiUpperCase(EditSenhaAtual.Text) = AnsiUpperCase(EditSenhaNova.Text) then
    vMensagem.Add('- A senha nova precisa ser diferente da senha atual.');
  vSenha := fmPrincipal.fnGeral.criptografaSenha(EditSenhaNova.Text);
  if vSenha = pstrSenhaAnterior then
    vMensagem.Add('- A senha nova precisa ser diferente da �ltima senha utilizada pelo usu�rio.');
  // Se for definido que vai validar a complexidade das senha, executa o processo abaixo.
  if CheckBoxSenhaComplexa.Checked = true then
  begin
    // Para a Senha Atual.
    with ppreValidacao do
    begin
      RegEx := cRegExp;
      Subject := UTF8String(EditSenhaNova.Text);
      if not Match then
        vMensagem.Add(
      'A nova senha informada n�o respeita os requisitos m�nimos para uma senha forte e segura.'+#13+#10+
      'Requisitos:'+#13+#10+
      '- Iniciar com letra mai�scula;'+#13+#10+
      '- Possuir no m�nimo ter 8 caracteres;'+#13+#10+
      '- Possuir no m�nimo 1 letra min�scula;'+#13+#10+
      '- Possuir no m�nimo 1 caracter especial;'+#13+#10+
      '- Possuir no m�nimo 1 n�mero;'+#13+#10+
      '- N�o possuir espa�os em branco.'+#13+#10+
      'Favor revisar a senha informada.');
    end;
  end;

  Result := (vMensagem.Count = 0);

  if vMensagem.Count > 0 then
  begin
    MessageBox(fmPrincipal.Handle,
               PWideChar('A altera��o da sua senha n�o poder� ser executada devido as seguintes pend�ncias:'+#13#10+
                         vMensagem.Text+
                         'Por favor, revise os pontos de pend�ncia identificados.'),
               cTituloMensagemErro,
               MB_OK or MB_ICONERROR);
    EditSenhaAtual.Clear;
    EditSenhaNova.Clear;
    EditSenhaConfirmacao.Clear;
    EditSenhaConfirmacao.Enabled := false;
    BitBtnAlterarSenha.Enabled := false;
    ActiveControl := EditSenhaAtual;
  end;
end;

end.
