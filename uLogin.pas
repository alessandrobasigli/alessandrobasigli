unit uLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.Imaging.jpeg;

type
  TFormLogin = class(TForm)
    Label1: TLabel;
    LabelUtente: TLabel;
    EditUtente: TEdit;
    Password_: TLabel;
    EditPassword: TEdit;
    ComboBoxPrefisso: TComboBox;
    ButtonAbbandona: TButton;
    ButtonAccedi: TButton;
    SpeedButtonMostra: TSpeedButton;
    Image1: TImage;
    procedure SpeedButtonMostraClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormLogin: TFormLogin;
  mBoot: boolean;

implementation

{$R *.dfm}

procedure TFormLogin.FormActivate(Sender: TObject);
begin
  if mBoot then begin
    mBoot := False;;
    Application.ProcessMessages;
    EditUtente.SetFocus;
    EditUtente.BringToFront;
  end;
end;

procedure TFormLogin.FormCreate(Sender: TObject);
begin
  mBoot := True;
end;

procedure TFormLogin.SpeedButtonMostraClick(Sender: TObject);
begin
  if ( EditPassword.PasswordChar = '*' ) then begin
    SpeedButtonMostra.Caption := 'nascondi';
    EditPassword.PasswordChar := #0;
  end else begin
    SpeedButtonMostra.Caption := 'mostra';
    EditPassword.PasswordChar := '*';
  end;
end;

end.
