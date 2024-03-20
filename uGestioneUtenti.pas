unit uGestioneUtenti;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.StdCtrls,
  Vcl.DBCtrls, Vcl.Mask, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids,
  IdSMTP, IdMessage, IdSSLOpenSSL, IdServerIOHandler, IdSSL, IdBaseComponent,
  IdComponent, IdCustomTCPServer, IdTCPServer, IdCmdTCPServer,
  IdExplicitTLSClientServerBase, IdSMTPServer, Vcl.Buttons;

type
  TFormGestioneUtenti = class(TForm)
    ADOQueryRO: TADOQuery;
    Panel2: TPanel;
    DBNavigator1: TDBNavigator;
    ds: TDataSource;
    ADOQueryROId: TAutoIncField;
    ADOQueryROUtente: TWideStringField;
    ADOQueryROPassword: TWideStringField;
    ADOQueryROprefisso: TWideStringField;
    ADOQueryROavatar: TWideStringField;
    ADOQueryROmail: TWideStringField;
    ADOQueryROAmministratore: TIntegerField;
    ADOQueryROmailInviataIl: TDateTimeField;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    DBComboBox1: TDBComboBox;
    DBNavigator2: TDBNavigator;
    ButtonEMail: TButton;
    IdSMTPServer1: TIdSMTPServer;
    IdServerIOHandlerSSLOpenSSL1: TIdServerIOHandlerSSLOpenSSL;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    SpeedButton2: TSpeedButton;
    ADOQueryROdatachiusura: TWideStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ADOQueryROAfterPost(DataSet: TDataSet);
    procedure ButtonEMailClick(Sender: TObject);
  private
    { Private declarations }
    procedure InviaEmail;
  public
    { Public declarations }
  end;

var
  FormGestioneUtenti: TFormGestioneUtenti;
  mBoot: boolean;

implementation uses uDM;

{$R *.dfm}

procedure TFormGestioneUtenti.InviaEmail;
var
  IdSMTP: TIdSMTP;
  IdMessage: TIdMessage;
begin
  IdSMTP := TIdSMTP.Create(nil);
  IdMessage := TIdMessage.Create(nil);
  try
    IdSMTP.Host := 'smtp.gmail.com';
    IdSMTP.Port := 25; // Porta del server SMTP
    IdSMTP.Username := 'a.basigli@gmail.com';
    IdSMTP.Password := 'xxxxxxxx';
    IdSMTP.UseTLS := utUseExplicitTLS; // Utilizza TLS

    IdMessage.From.Address := 'a.basigli@gmail.com';
    IdMessage.Recipients.EMailAddresses := 'a.basigli@gmail.com';
    IdMessage.Subject := 'Oggetto della mail';
    IdMessage.Body.Text := 'Testo del messaggio coordinate di accesso';

    try
      IdSMTP.Connect;
      IdSMTP.Send(IdMessage);
    except
      on e: exception do begin
        ShowMessage( e.Message );
      end;
    end;
  finally
    IdSMTP.Disconnect;
    IdSMTP.Free;
    IdMessage.Free;
  end;
end;

procedure TFormGestioneUtenti.ADOQueryROAfterPost(DataSet: TDataSet);
var
  mRecord: string;
  mNote: string;
begin
  mRecord := 'id = '+Trim( DataSet.FieldByName('id').AsString )+chr(13)+chr(10)+
             'prefisso = '+Trim( DataSet.FieldByName('prefisso').AsString )+chr(13)+chr(10)+
             'Utente = '+Trim( DataSet.FieldByName('Utente').AsString )+chr(13)+chr(10)+
             'Password = '+Trim( DataSet.FieldByName('Password').AsString )+chr(13)+chr(10)+
             'Prefisso = '+Trim( DataSet.FieldByName('prefisso').AsString )+chr(13)+chr(10)+
             'Avatar = '+Trim( DataSet.FieldByName('Avatar').AsString )+chr(13)+chr(10)+
             'Mail = '+Trim( DataSet.FieldByName('Amministratore').AsString )+chr(13)+chr(10)+
             'Amministratore = '+Trim( DataSet.FieldByName('idprogetto').AsString )+chr(13)+chr(10)+
             'mailinviatail = '+Trim( DataSet.FieldByName('mailinviatail').AsString );

  DM.Aggiungi_LOG( 'login POST DOPO',mRecord );
end;

procedure TFormGestioneUtenti.ButtonEMailClick(Sender: TObject);
begin
  InviaEmail;
end;

procedure TFormGestioneUtenti.FormActivate(Sender: TObject);
begin
  if mBoot then begin
    mBoot := False;
    ADOQueryRO.Active := True;
  end;
end;

procedure TFormGestioneUtenti.FormCreate(Sender: TObject);
begin
  mBoot := True;
end;

end.
