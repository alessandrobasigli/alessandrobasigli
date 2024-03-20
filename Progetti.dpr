program Progetti;

uses
  Vcl.Forms,
  uMenu in 'uMenu.pas' {FormMenu},
  uLogin in 'uLogin.pas' {FormLogin},
  uDM in 'uDM.pas' {DM: TDataModule},
  uGestioneProgetti in 'uGestioneProgetti.pas' {FormProgetti},
  pivotForm in 'pivotForm.pas',
  uCancellaLOG in 'uCancellaLOG.pas' {FormCancellaLOG},
  uScaricoOre in 'uScaricoOre.pas' {FormScaricoOre},
  uSceltaProgetto in 'uSceltaProgetto.pas' {FormSceltaProgetto},
  uSceltaSottoProgetto in 'uSceltaSottoProgetto.pas' {FormSceltaSottoProgetto},
  uStatistiche in 'uStatistiche.pas' {FormStatistiche},
  pivotDate in 'pivotDate.pas',
  uGestioneUtenti in 'uGestioneUtenti.pas' {FormGestioneUtenti},
  u_INI in 'u_INI.pas',
  uDeco in 'uDeco.pas',
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Sapphire Kamri');
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFormMenu, FormMenu);
  Application.Run;
end.
