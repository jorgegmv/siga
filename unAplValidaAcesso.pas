unit unAplValidaAcesso;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, StdCtrls, Buttons, ExtCtrls, pngimage, ZDataset, ImgList,
  jpeg, JvFormWallpaper, JvComponentBase, JvBalloonHint, acPNG, AdvAppStyler,
  AdvPanel, AdvEdit, AdvOfficeImage, AdvOfficeButtons, AdvGroupBox, unUsuario,
  AdvGlowButton;

type
  TfmAplValidaAcesso = class(TForm)
    FormStyler: TAdvFormStyler;
    PanelCentral: TAdvPanel;
    LabelUsuario: TLabel;
    LabelSenha: TLabel;
    LabelEnviarSenhaEmail: TLabel;
    PanelImagemLogin: TAdvPanel;
    ImageLogin: TImage;
    GroupBoxOpcoes: TAdvGroupBox;
    CheckBoxMostrarSenha: TAdvOfficeCheckBox;
    CheckBoxLembrarUsuario: TAdvOfficeCheckBox;
    GroupBoxDicaSenha: TAdvGroupBox;
    LabelDicaSenha: TLabel;
    PanelVersao: TAdvPanel;
    EditUsuario: TAdvEdit;
    EditSenha: TAdvEdit;
    ButtonDicaSenha: TAdvGlowButton;
    ButtonEnviarSenhaEmail: TAdvGlowButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CheckBoxMostrarSenhaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure EditSenhaChange(Sender: TObject);
    procedure EditUsuarioExit(Sender: TObject);
    procedure EditUsuarioKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure LabelEnviarSenhaEmailClick(Sender: TObject);
    procedure EditSenhaKeyPress(Sender: TObject; var Key: Char);
    procedure ButtonDicaSenhaClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    pId: TGUID;
    pcdUsuario: integer;
    pstrSenha: string;
    pUsuario: TUsuario;
    procedure visualizaDicaSenha;
    procedure validar;
    procedure carregaImagensBotoes;
  public
    { Public declarations }
    pAcessoValido: Boolean;
  end;

var
  fmAplValidaAcesso: TfmAplValidaAcesso;

implementation

uses unPrincipal, undmPrincipal, undmEstilo;

{$R *.dfm}

procedure TfmAplValidaAcesso.carregaImagensBotoes;
begin
  ImageLogin.Picture.LoadFromFile(fmPrincipal.LocalAplicacao + 'Images\login-128.png');
  ButtonDicaSenha.Picture.LoadFromFile(fmPrincipal.LocalIcones + 'decision-e-16.png');
  ButtonDicaSenha.HotPicture.LoadFromFile(fmPrincipal.LocalIcones + 'decision-h-16.png');
  ButtonDicaSenha.DisabledPicture.LoadFromFile(fmPrincipal.LocalIcones + 'decision-d-16.png');
  ButtonEnviarSenhaEmail.Picture.LoadFromFile(fmPrincipal.LocalIcones + 'message-e-16.png');
  ButtonEnviarSenhaEmail.HotPicture.LoadFromFile(fmPrincipal.LocalIcones + 'message-h-16.png');
  ButtonEnviarSenhaEmail.DisabledPicture.LoadFromFile(fmPrincipal.LocalIcones + 'message-d-16.png');
end;

procedure TfmAplValidaAcesso.CheckBoxMostrarSenhaClick(Sender: TObject);
var
  vEmBranco: char;
begin
  vEmBranco := #0;
  if CheckBoxMostrarSenha.Checked = false then
    EditSenha.PasswordChar := '●'
  else
    EditSenha.PasswordChar := vEmBranco;
end;

procedure TfmAplValidaAcesso.EditSenhaChange(Sender: TObject);
var
  vSenha: string;
begin
  // Se digitou a senha correta loga automaticamente.
  if EditSenha.Text <> EmptyStr then
  begin
    vSenha := fmPrincipal.fnGeral.criptografaSenha(EditSenha.Text);
    if pstrSenha = vSenha then
      validar;
  end;
end;

procedure TfmAplValidaAcesso.EditSenhaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    validar;
end;

procedure TfmAplValidaAcesso.EditUsuarioExit(Sender: TObject);
var
  vQuery: TZQuery;
  vSistema: string;
begin
  GroupBoxDicaSenha.Visible := false;

  // Sai se não houver um usuário selecionado.
  if Trim(EditUsuario.Text) = EmptyStr then
    Exit;

  pcdUsuario := 0;
  EditUsuario.IsError := false;

  Screen.Cursor := crSQLWait;
  vQuery := pUsuario.lista;
  try
    with vQuery do
    begin
      SQL.Add('WHERE NMLOGIN = ' + QuotedStr(EditUsuario.Text));
      dmPrincipal.executaConsulta(vQuery);

      if RecordCount = 0 then
      begin
        fmPrincipal.pLogSistema.Debug('Login inexistente: ' + EditUsuario.Text);
        MessageBox(fmPrincipal.Handle, PWideChar('O usuário informado é inexistente.'), cTituloMensagemAlerta, MB_OK or MB_ICONEXCLAMATION);
        EditUsuario.Clear;
        EditUsuario.IsError := true;
        EditUsuario.SetFocus;
      end
      else
        if Fields.FieldByName('FLATIVO').AsString = 'N' then
        begin
          fmPrincipal.pLogSistema.Debug('Usuário inativo: ' + EditSenha.Text);
          MessageBox(fmPrincipal.Handle, PWideChar('O usuário informado está inativo.'), cTituloMensagemAlerta, MB_OK or MB_ICONEXCLAMATION);
          EditUsuario.Clear;
          EditUsuario.SetFocus;
          EditUsuario.IsError := true;
        end
        else
        begin
          pstrSenha := Fields.FieldByName('DESENHA').AsString;
          pcdUsuario := Fields.FieldByName('CDUSUARIO').AsInteger;
          LabelDicaSenha.Caption := FieldByName('DEDICASENHA').AsString;
          try
            vSistema := cSistema + '.' + EditUsuario.Text;
            CheckBoxLembrarUsuario.Checked := fmPrincipal.pArquivoConfig.ReadBoolean(vSistema, cSalvarLoginSecao, false);
          except
          end;
        end;
    end;
  finally
    vQuery.Active := false;
    FreeAndNil(vQuery);
    Screen.Cursor := crDefault;
  end;
end;

procedure TfmAplValidaAcesso.EditUsuarioKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
  begin
    EditUsuario.Clear;
    EditSenha.SetFocus;
  end
  else
  begin
    GroupBoxDicaSenha.Visible := false;
    EditSenha.Clear;
  end;
end;

procedure TfmAplValidaAcesso.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfmAplValidaAcesso.FormCreate(Sender: TObject);
var
  i: integer;
begin
  try
    CreateGUID(pId);

    Color := Self.Color;
    FormStyler.AutoThemeAdapt := false;

    pUsuario := TUsuario.Create;

    PanelVersao.Text := '<b>  Versão: ' + fmPrincipal.fnGeral.obtemVersaoSistema + '</b>';
    PanelVersao.TextVAlign := tvaCenter;
    EditSenha.OnChange := nil;
    EditUsuario.Clear;
    EditSenha.Clear;

    carregaImagensBotoes;

    CheckBoxMostrarSenha.Checked := false;
    CheckBoxLembrarUsuario.Checked := false;

    for i := Self.ComponentCount -1 downto 0 do
      if (Self.Components[i] is TAdvOfficeCheckBox) then
        (Self.Components[i] as TAdvOfficeCheckBox).Themed := true;

    if fmPrincipal.LoginUsuarioLogado <> EmptyStr then
    begin
      EditUsuario.Text := fmPrincipal.LoginUsuarioLogado;
      EditUsuarioExit(EditUsuario);
      ActiveControl := EditSenha;
    end;
    pAcessoValido := false;
    EditSenha.OnChange := EditSenhaChange;
  except
    on E: Exception do
    begin
      fmPrincipal.manipulaExcecoes(Sender,E);
      Close;
    end;
  end;
end;

procedure TfmAplValidaAcesso.FormDestroy(Sender: TObject);
begin
  FreeAndNil(pUsuario);
end;

procedure TfmAplValidaAcesso.ButtonDicaSenhaClick(Sender: TObject);
begin
  // Somente após validar o nome de usuário.
  if pcdUsuario = 0 then
    Exit;

  visualizaDicaSenha;
end;

procedure TfmAplValidaAcesso.LabelEnviarSenhaEmailClick(Sender: TObject);
var
  vEmail, vSenha, vTextoEmail: string;
begin
  // Somente após validar o nome de usuário.
  if pcdUsuario = 0 then
    Exit;

  vEmail := InputBox('Aqueloo - SIGA :: Envio de senha do usuário.', 'Informe um endereço de e-mail:', EmptyStr);
  if Trim(vEmail) = EmptyStr then
  begin
    MessageBox(fmPrincipal.Handle, PWideChar('O endereço de e-mail precisa ser informado.'), cTituloMensagemInformacao, MB_OK or MB_ICONEXCLAMATION);
    Exit;
  end;

  try
    // Atualiza com uma nova senha de acesso.
    pUsuario.Codigo := pcdUsuario;
    with fmPrincipal.fnGeral do
    begin
      vSenha := geraSenha;
      pUsuario.Senha := criptografaSenha(vSenha);
    end;
    pUsuario.DicaSenha := 'Senha de acesso temporário.';

    if pUsuario.atualizaSenhaUsuario <> 0 then
    begin
      pstrSenha := pUsuario.Senha;
      MessageBox(fmPrincipal.Handle, PWideChar('Senha de acesso atualizada com sucesso.'), cTituloMensagemInformacao, MB_OK or MB_ICONEXCLAMATION);
    end
    else
    begin
      MessageBox(fmPrincipal.Handle, PWideChar('Não foi possível atualizar a senha de acesso.'), cTituloMensagemInformacao, MB_OK or MB_ICONEXCLAMATION);
      Exit;
    end;

    // Envia por e-mail.
    vTextoEmail := '<div align="left">Prezado ' + EditUsuario.Text + ',</div>'+
                   '<br>' +
                   '<div align="left">A sua senha de acesso ao sistema é: "'+vSenha+'".</div>';
    fmPrincipal.enviaEmail('Envio de senha de acesso', vEmail, EmptyStr, EmptyStr, vTextoEmail);
  except
    on E: exception do
      fmPrincipal.manipulaExcecoes(Sender,E);
  end;
end;

procedure TfmAplValidaAcesso.validar;
var
  vQuery: TZQuery;
  vSenha: string;
begin
  try
    EditSenha.IsError := false;
    Screen.Cursor := crSQLWait;

    vQuery := pUsuario.lista;
    with fmPrincipal do
    begin
      with vQuery do
      begin
        SQL.Add('WHERE NMLOGIN = ' + QuotedStr(EditUsuario.Text));
        dmPrincipal.executaConsulta(vQuery);
        if RecordCount > 0 then
        begin
          if Fields.FieldByName('FLATIVO').AsString = 'N' then
          begin
            fmPrincipal.pLogSistema.Debug('Usuário inativo: ' + EditSenha.Text);
            MessageBox(fmPrincipal.Handle, PWideChar('O login de usuário informado está inativo.'), cTituloMensagemAlerta, MB_OK or MB_ICONEXCLAMATION);
            pAcessoValido := false;
            EditUsuario.SetFocus;
          end
          else
          begin
            Active := false;
            vSenha := fmPrincipal.fnGeral.criptografaSenha(EditSenha.Text);
            SQL.Add('  AND DESENHA = ' + QuotedStr(vSenha));
            dmPrincipal.executaConsulta(vQuery);
            if RecordCount > 0 then
            begin
              pAcessoValido := true;
              LoginUsuarioLogado := EditUsuario.Text;
              CodigoUsuarioLogado := Fields.FieldByName('CDUSUARIO').AsInteger;
              NomeUsuarioLogado := Fields.FieldByName('NMUSUARIO').AsString;
              SenhaUsuarioLogado := EditSenha.Text;
              EmailUsuarioLogado := Fields.FieldByName('DEEMAIL').AsString;
              SalvarLoginSecaoUsuarioLogado := CheckBoxLembrarUsuario.Checked;
            end
            else
            begin
              fmPrincipal.pLogSistema.Debug('Senha inválida: ' + EditSenha.Text);
              MessageBox(fmPrincipal.Handle, PWideChar('A senha informada é inválida.'), cTituloMensagemAlerta, MB_OK or MB_ICONEXCLAMATION);
              pAcessoValido := false;
              EditSenha.IsError := true;
              EditSenha.SetFocus;
              visualizaDicaSenha;
            end;
          end;
        end
        else
        begin
          apresentaResultadoCadastro('O login de usuário informado é inexistente.');
          pAcessoValido := false;
          EditUsuario.Clear;
          EditSenha.Clear;
          EditUsuario.SetFocus;
        end;
      end;
    end;
  finally
    Screen.Cursor := crDefault;
    vQuery.Active := false;
    FreeAndNil(vQuery);
  end;
  if pAcessoValido = True then
    Close;
end;

procedure TfmAplValidaAcesso.visualizaDicaSenha;
begin
  GroupBoxDicaSenha.Visible := true;
end;

end.
