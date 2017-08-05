unit unAplEnviaEmail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, IdThreadComponent, IdIOHandler,
  IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL, IdMessage,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdExplicitTLSClientServerBase, IdMessageClient, IdSMTPBase, IdSMTP, DateUtils,
  IdText, AdvAppStyler, AdvOfficeStatusBar, AdvPanel;

type
  TfmAplEnviaEmail = class(TForm)
    IdSMTP: TIdSMTP;
    IdMessage: TIdMessage;
    IdSSLIOHandlerSocketOpenSSL: TIdSSLIOHandlerSocketOpenSSL;
    IdThreadComponent: TIdThreadComponent;
    FormStyler: TAdvFormStyler;
    PanelCentral: TAdvPanel;
    LabelStatus: TLabel;
    LabelTempoDecorrido: TLabel;
    StatusBar: TAdvOfficeStatusBar;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure IdSMTPStatus(ASender: TObject; const AStatus: TIdStatus;
      const AStatusText: string);
    procedure IdThreadComponentRun(Sender: TIdThreadComponent);
  private
    { Private declarations }
    pId: TGUID;
    fTempoInicio: TDateTime;
    fAssunto, fPara, fCC, fCCO: string;
    fPrioridade: integer;
    fConfirmacaoLeitura: boolean;
    fCorpo: TIdText;
    function calculaTempoGasto: string;
  public
    { Public declarations }
    procedure setaParametros(pAssunto, pPara, pCC, pCCO, pCorpo: string;
                             pPrioridade: integer = 1;
                             pConfirmacaoLeitura: boolean = false);
    procedure enviaEMailGMail;
  end;

var
  fmAplEnviaEmail: TfmAplEnviaEmail;

implementation

uses unPrincipal, undmEstilo;

{$R *.dfm}

{ TfmAplEnviaEmail }

function TfmAplEnviaEmail.calculaTempoGasto: string;
var
  vTempo: integer;
begin
  vTempo := SecondsBetween(Now,fTempoInicio);
  Result := IntToStr(vTempo);
end;

procedure TfmAplEnviaEmail.enviaEMailGMail;
begin
  try
    Screen.Cursor := crHourGlass;
    if not IdThreadComponent.Active then
      IdThreadComponent.Active := true;
    if IdThreadComponent.Stopped then
      IdThreadComponent.Start;
    Application.ProcessMessages;

    // Configura o SMTP.
    with fmPrincipal, IdSMTP do
    begin
      AuthType := satDefault;
      UseTLS := utUseImplicitTLS;
      Host := ServidorSMTP;
      Port := PortaSMTP;
      Username := UsuarioSMTP;
      Password := SenhaSMTP;
      ConnectTimeout := TempoEsperaSMTP;
      with IdSSLIOHandlerSocketOpenSSL.SSLOptions do
      begin
        Method := sslvTLSv1;
        Mode := sslmClient;
      end;
    end;

    // Configura a mensagem a ser enviada.
    try
      with fmPrincipal, IdMessage do
      begin
        Subject := fAssunto;
        From.Address := UsuarioEnvioSMTP;
        From.Name := NomeUsuarioEnvioSMTP;
        // Lista de remetentes.
        Recipients.EMailAddresses := fPara;
        if fCC <> EmptyStr then
          CCList.EMailAddresses := fCC;
        if fCCO <> EmptyStr then
          BccList.EMailAddresses := fCCO;
        // Trata a prioridade da mensagem.
        case fPrioridade of
          0: Priority := mpHigh;
          1: Priority := mpNormal;
          2: Priority := mpLow;
        end;
        // Trata a confirmação de leitura.
        if fConfirmacaoLeitura then
          ReceiptRecipient.Text := From.Text;
      end;

      // Envia o e-mail.
      with IdSMTP do
      begin
        if not Connected then
          Connect;
        Application.ProcessMessages;
        if Authenticate then
          Send(IdMessage)
        else
          raise Exception.Create('Erro ao realizar a autenticação.');
        Application.ProcessMessages;
      end;
    except
      on E: Exception do
      begin
        fmPrincipal.pLogSistema.Error('Erro em enviaEMailGMail.');
        fmPrincipal.pLogSistema.Error(E.Message);
        if E.StackTrace <> EmptyStr then
          fmPrincipal.pLogSistema.Trace(E.StackTrace);
        StatusBar.Panels[0].Text := 'Erro ao enviar e-mail.';
        LabelStatus.Caption := E.Message;
        Sleep(5000);
        Close;
      end;
    end;
  finally
    if IdSMTP.Connected then
      IdSMTP.Disconnect(true);
    if IdThreadComponent.Active then
      IdThreadComponent.Active := false;
    if not IdThreadComponent.Stopped then
      IdThreadComponent.Stop;
    if not IdThreadComponent.Terminated then
      IdThreadComponent.Terminate;
    StatusBar.Panels[0].Text := 'Envio de e-mail concluído.';
    Screen.Cursor := crDefault;
    Close;
  end;
end;

procedure TfmAplEnviaEmail.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Screen.Cursor := crDefault;

  if IdSMTP.Connected then
    IdSMTP.Disconnect(true);
  if IdThreadComponent.Active then
    IdThreadComponent.Terminate;

  Action := caFree;
end;

procedure TfmAplEnviaEmail.FormCreate(Sender: TObject);
begin
  try
    CreateGUID(pId);

    Color := Self.Color;
    FormStyler.AutoThemeAdapt := false;

    fmPrincipal.pLogSistema.Info('Iniciando o envio de e-mail.');

    fTempoInicio := Now;
    fCorpo := TIdText.Create(IdMessage.MessageParts, nil);
    fCorpo.ContentType := 'text/html';
    fCorpo.ContentTransfer := '7bit';
    IdMessage.ContentType := 'multipart/alternative';
  except
    on E: exception do
    begin
      StatusBar.Panels[0].Text := 'Erro ao enviar e-mail.';
      LabelStatus.Caption := E.Message;
      // Salva no log do sistema.
      fmPrincipal.pLogSistema.Warn('Erro em: ' + Sender.ClassName);
      fmPrincipal.pLogSistema.Warn(E.Message);
      if E.StackTrace <> EmptyStr then
        fmPrincipal.pLogSistema.Trace(E.StackTrace);
      Sleep(1000);
      Close;
    end;
  end;
  fmPrincipal.pLogSistema.Info('Envio de e-mail concluído com sucesso.');
end;

procedure TfmAplEnviaEmail.FormDestroy(Sender: TObject);
begin
  FreeAndNil(fCorpo);
end;

procedure TfmAplEnviaEmail.IdSMTPStatus(ASender: TObject;
  const AStatus: TIdStatus; const AStatusText: string);
var
  vMensagem: string;
begin
  case AStatus of
    hsResolving: vMensagem := 'Resolvendo conexão.';
    hsConnecting: vMensagem := 'Conectando ao servidor de e-mail.';
    hsConnected: vMensagem := 'Conectado ao servidor de e-mail.';
    hsDisconnecting: vMensagem := 'Desconectando do servidor de e-mail.';
    hsDisconnected: vMensagem := 'Desconectado do servidor de e-mail.';
    hsStatusText: vMensagem := 'Codificando o e-mail.';
    else vMensagem := AStatusText;
  end;

  StatusBar.Panels[0].Text := vMensagem;
  Application.ProcessMessages;
end;

procedure TfmAplEnviaEmail.IdThreadComponentRun(Sender: TIdThreadComponent);
begin
  LabelTempoDecorrido.Caption := 'Tempo decorrido: ' + calculaTempoGasto + ' segundos.';
  Application.ProcessMessages;
end;

procedure TfmAplEnviaEmail.setaParametros(pAssunto, pPara, pCC, pCCO, pCorpo: string;
  pPrioridade: integer; pConfirmacaoLeitura: boolean);
begin
  fAssunto := pAssunto;
  fPara := pPara;
  fCC := pCC;
  fCCO := pCCO;
  fPrioridade := pPrioridade;
  fConfirmacaoLeitura := pConfirmacaoLeitura;
  fCorpo.Body.Append(pCorpo);
end;

end.
