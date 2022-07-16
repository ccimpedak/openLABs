unit UnitEmail;

interface

uses
  SysUtils, IdSMTP, IdSSLOpenSSL, IdMessage, IdText, IdAttachmentFile,
  IdExplicitTLSClientServerBase, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdMessageClient, IdSMTPBase;

function kirim(host: string; port: integer; username: string; password: string;
  name: string; receipt: string; subject: string; body: string;
  attach_file: string): string;

implementation

uses MainModule, uniGUIApplication, ServerModule;

function kirim(host: string; port: integer; username: string; password: string;
  name: string; receipt: string; subject: string; body: string;
  attach_file: string): string;
var
  IdSSLIOHandlerSocket: TIdSSLIOHandlerSocketOpenSSL;
  IdSMTP: TIdSMTP;
  IdMessage: TIdMessage;
  IdText: TIdText;
  sAnexo: string;
  Attachment: TIdAttachmentFile;
begin
  // instance
  IdSSLIOHandlerSocket := TIdSSLIOHandlerSocketOpenSSL.Create();
  IdSMTP := TIdSMTP.Create();
  IdMessage := TIdMessage.Create();

  try
    // Konfigurasi SSL
    IdSSLIOHandlerSocket.SSLOptions.Method := sslvSSLv23;
    IdSSLIOHandlerSocket.SSLOptions.Mode := sslmClient;

    // Konfigurasi SMPT
    IdSMTP.IOHandler := IdSSLIOHandlerSocket;
    IdSMTP.UseTLS := utUseImplicitTLS;
    IdSMTP.AuthType := satDefault;
    IdSMTP.port := port;
    IdSMTP.host := host;
    IdSMTP.username := username;
    IdSMTP.password := password;

    // konfigurasi
    IdMessage.From.Address := username;
    IdMessage.From.name := name;
    IdMessage.ReplyTo.EMailAddresses := IdMessage.From.Address;
    IdMessage.Recipients.Add.Text := receipt;
    IdMessage.subject := subject;
    IdMessage.Encoding := meMIME;

    // attachment
    Attachment := TIdAttachmentFile.Create(IdMessage.MessageParts, attach_file);

    // konfig isi pesan
    IdText := TIdText.Create(IdMessage.MessageParts);
    IdText.body.Add(body);
    // IdText.ContentType := 'text/plain; charset=iso-8859-1';
    IdText.ContentType := 'text/html';

    // koneksi auth
    try
      IdSMTP.Connect;
      IdSMTP.Authenticate;
    except
      on E: Exception do
      begin
        Result := 'Cannot authenticate: ' + E.Message;
        Exit;
      end;
    end;

    // kriim pesan
    try
      IdSMTP.Send(IdMessage);
      Result := 'Message sent successfully!';
    except
      On E: Exception do
      begin
        Result := 'Error while sending a message: ' + E.Message;
      end;
    end;
  finally
    // librate
    FreeAndNil(IdMessage);
    FreeAndNil(IdSSLIOHandlerSocket);
    FreeAndNil(IdSMTP);
  end;
end;

end.
