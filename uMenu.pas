unit uMenu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.ControlList, System.Actions, Vcl.ActnList, System.ImageList, Vcl.ImgList,
  Vcl.Grids, Vcl.VirtualImage, Vcl.Menus, Vcl.TitleBarCtrls,
  Data.DB, Data.Win.ADODB, Vcl.DBCtrls, Vcl.DBGrids, Vcl.WinXCtrls,
  Vcl.WinXCalendars, Vcl.ComCtrls, Vcl.Buttons, Vcl.Imaging.jpeg,
  Vcl.VirtualImageList, AdvMenus, Vcl.Themes;

type
  TFormMenu = class(TForm)
    Panel1: TPanel;
    LabelPrefisso: TLabel;
    LabelUtente: TLabel;
    Bevel1: TBevel;
    ImageList1: TImageList;
    ActionList1: TActionList;
    ActionProgetti: TAction;
    ActionScaricoOre: TAction;
    MainMenu1: TMainMenu;
    progetti: TMenuItem;
    statistiche1: TMenuItem;
    log1: TMenuItem;
    NuovoProgetto: TMenuItem;
    ActionLOG: TAction;
    ADOQueryLOGIN: TADOQuery;
    dsADOQueryLOGIN: TDataSource;
    ADOQueryLOG: TADOQuery;
    dsADOQueryLOG: TDataSource;
    Bevel2: TBevel;
    LabelCurrency: TLabel;
    ADOQueryPROGETTI: TADOQuery;
    dsADOQueryPROGETTI: TDataSource;
    ADOQueryPROGETTIprefisso: TWideStringField;
    ADOQueryPROGETTIidprogetto: TAutoIncField;
    ADOQueryPROGETTINomeProgetto: TWideStringField;
    ADOQueryPROGETTIInizio: TDateField;
    ADOQueryPROGETTIFine: TDateField;
    ADOQueryPROGETTIBudget: TFMTBCDField;
    cancellaLOG1: TMenuItem;
    ActionCancellaLOG: TAction;
    ScaricoOre1: TMenuItem;
    ADOQueryScaricoOre: TADOQuery;
    dsScaricoOre: TDataSource;
    ActionStatistiche: TAction;
    ActionInfoConnessione: TAction;
    ActionInfoConnessione1: TMenuItem;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    TabSheet3: TTabSheet;
    DBGrid5: TDBGrid;
    TabSheet4: TTabSheet;
    DBMemo1: TDBMemo;
    Splitter1: TSplitter;
    DBGrid3: TDBGrid;
    DBNavigator1: TDBNavigator;
    ActionGestioneUtenti: TAction;
    gestioneutenti1: TMenuItem;
    TabSheet5: TTabSheet;
    ADOQueryScaricoOrePerUtente: TADOQuery;
    dsADOQueryScaricoOrePerUtente: TDataSource;
    DBGrid4: TDBGrid;
    DBNavigator2: TDBNavigator;
    ImageList2menu: TImageList;
    Panel2: TPanel;
    sbScaricoOre: TSpeedButton;
    sbStatistiche: TSpeedButton;
    sbProgetti: TSpeedButton;
    Image1: TImage;
    Panel3: TPanel;
    sbUtenti: TSpeedButton;
    sbCancellaLOG: TSpeedButton;
    sbInfoConnessione: TSpeedButton;
    VirtualImageList1: TVirtualImageList;
    Panel4: TPanel;
    ComboBoxStyleManager: TComboBox;
    bSetStyle: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ActionProgettiExecute(Sender: TObject);
    procedure stampaLOG1Click(Sender: TObject);
    procedure ActionCancellaLOGExecute(Sender: TObject);
    procedure ActionScaricoOreExecute(Sender: TObject);
    procedure ActionStatisticheExecute(Sender: TObject);
    procedure ActionInfoConnessioneExecute(Sender: TObject);
    procedure ActionGestioneUtentiExecute(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure bSetStyleClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid5DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid3DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid4DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
    procedure ElaboraQuery;
    procedure PopolaStyleManager;
  public
    { Public declarations }
  end;

var
  FormMenu: TFormMenu;
  mBoot: boolean;

implementation uses uDM, u_Ini, uLogin, pivotForm, pivotDate;

{$R *.dfm}

procedure TFormMenu.ActionGestioneUtentiExecute(Sender: TObject);
begin
  pivotForm.GestioneUtenti;
end;

procedure TFormMenu.ActionInfoConnessioneExecute(Sender: TObject);
var
  mConnection: string;
begin
  mConnection := DM.ADOConnectionDM.ConnectionString;
  mConnection := StringReplace( DM.ADOConnectionDM.ConnectionString, ';', #13#10, [rfReplaceAll, rfIgnoreCase] );
  mConnection := StringReplace( mConnection ,'Password='+DM.Get_password_DBMySQL, '', [rfReplaceAll, rfIgnoreCase] );
  mConnection := StringReplace( mConnection ,'PWD='+DM.Get_password_DBMySQL, '', [rfReplaceAll, rfIgnoreCase] );
  mConnection := StringReplace( mConnection ,'User ID='+DM.Get_utente_DBMySQL, '', [rfReplaceAll, rfIgnoreCase] );
  mConnection := StringReplace( mConnection ,'UID='+DM.Get_utente_DBMySQL, '', [rfReplaceAll, rfIgnoreCase] );
  mConnection := StringReplace( mConnection ,chr(13)+chr(10), chr(13), [rfReplaceAll, rfIgnoreCase] );
  ShowMessage( mConnection );
end;

procedure TFormMenu.ActionCancellaLOGExecute(Sender: TObject);
begin
  pivotForm.GestioneCancellaLOG;
  ElaboraQuery;
end;

procedure TFormMenu.ActionProgettiExecute(Sender: TObject);
begin
  pivotForm.GestioneProgetti;
  ElaboraQuery;
end;

procedure TFormMenu.ActionScaricoOreExecute(Sender: TObject);
begin
  pivotForm.ScaricoOre;
  ElaboraQuery;
end;

procedure TFormMenu.ActionStatisticheExecute(Sender: TObject);
begin
  pivotForm.GestioneStatistiche;
end;

procedure TFormMenu.bSetStyleClick(Sender: TObject);
begin
  TStyleManager.SetStyle( ComboBoxStyleManager.Text );
  puntoIni.writeString('STYLE', 'Appearance', ComboBoxStyleManager.Text);
end;

procedure TFormMenu.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  w: integer;
begin
  w := 5+DBGrid1.Canvas.TextExtent(Column.Field.DisplayText).cx;
  if w>column.Width then Column.Width := w;
end;

procedure TFormMenu.DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  w: integer;
begin
  w := 5+DBGrid1.Canvas.TextExtent(Column.Field.DisplayText).cx;
  if w>column.Width then Column.Width := w;
end;

procedure TFormMenu.DBGrid3DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  w: integer;
begin
  w := 5+DBGrid3.Canvas.TextExtent(Column.Field.DisplayText).cx;
  if w>column.Width then Column.Width := w;
end;

procedure TFormMenu.DBGrid4DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  w: integer;
begin
  w := 5+DBGrid4.Canvas.TextExtent(Column.Field.DisplayText).cx;
  if w>column.Width then Column.Width := w;
end;

procedure TFormMenu.DBGrid5DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  w: integer;
begin
  w := 5+DBGrid5.Canvas.TextExtent(Column.Field.DisplayText).cx;
  if w>column.Width then Column.Width := w;
end;

procedure TFormMenu.ElaboraQuery;
begin
  // ShowMessage( 'ElaboraQuery ['+DM.Get_Prefisso+']' );

  ADOQueryLOGIN.Close;
  ADOQueryLOG.Close;
  ADOQueryPROGETTI.Close;
  ADOQueryScaricoOre.Close;
  ADOQueryScaricoOrePerUtente.Close;

  with ADOQueryLOGIN do begin
    Active := True;
  end;
  ADOQueryLOG.Active := True;
  with ADOQueryPROGETTI do begin
    Close;
    Parameters[0].Value := DM.Get_Prefisso;
    ExecSQL;
    Open; First;
  end;
  with ADOQueryScaricoOre do begin
    Close;
    Parameters[0].Value := DM.Get_Prefisso;
    ExecSQL;
    Open; First;
  end;

  with ADOQueryScaricoOrePerUtente do begin
    Close;
    Parameters[0].Value := DM.Get_Prefisso;
    Parameters[1].Value := DM.Get_idlogin;
    ExecSQL;
    Open; First;
  end;
  // ShowMessage( 'ok' );
  DM.SistemazioneFormati( DBGrid1, ADOQueryLOGIN );
  DM.SistemazioneFormati( DBGrid3, ADOQueryLOG );
  DM.SistemazioneFormati( DBGrid2, ADOQueryPROGETTI );
  DM.SistemazioneFormati( DBGrid5, ADOQueryScaricoOre );
  DM.SistemazioneFormati( DBGrid4, ADOQueryScaricoOrePerUtente );
end;

procedure TFormMenu.FormActivate(Sender: TObject);
var
  mUserName, mPassword: string;
  myFormLogin: TFormLogin;
  mResult: integer;
  mDebug: boolean;
begin
  if mBoot then begin
    mBoot := False;

    DM.ConnettiAlServer;
    self.SendToBack;

    mDebug := False; // False fa la login
    if not mDebug then begin

      myFormLogin := TFormLogin.Create(self);
      try
        mResult := myFormLogin.ShowModal;
        if ( mResult = mrOK ) then begin
          mUserName := myFormLogin.EditUtente.Text;
          mPassword := myFormLogin.EditPassword.Text;
          if DM.onLogin( mUserName, mPassword ) then begin
            LabelPrefisso.Caption := glo_Prefisso;
            LabelUtente.Caption   := glo_Utente+' - '+DM.Get_avatar;
            if DM.Get_amministratore then begin
              LabelUtente.Caption := LabelUtente.Caption + ' (amministratore)';
            end;
            DM.Aggiungi_LOG( 'login', mUserName+' - '+mPassword );

          end else begin
            DM.Aggiungi_LOG( 'login errata',
                             myFormLogin.EditUtente.Text+' - '+
                             myFormLogin.EditPassword.Text );
            ShowMessage( 'Utente | Password SBAGLIATI !'+chr(13)+chr(10)+
                         'Consultare amministratore del DB progetti !' );
            Halt;
          end;
        end else begin
          // abbandonato
          Halt;
        end;
      finally
        myFormLogin.Free;
      end;

    end else begin
      // è pessimo va cambiato, ma è un demo
      DM.SetDebug( 'OK', 'c' );
      LabelPrefisso.Caption := glo_Prefisso;
      LabelUtente.Caption   := glo_Utente;

    end;

    DM.ApriTabelle;
    ElaboraQuery;
  end else begin
    DM.ApriTabelle;
    ElaboraQuery;
  end;

  gestioneutenti1.Visible        := DM.Get_amministratore;
  log1.Visible                   := DM.Get_amministratore;
  ActionInfoConnessione1.Visible := DM.Get_amministratore;
  statistiche1.Visible           := DM.Get_amministratore;
  NuovoProgetto.Visible          := DM.Get_amministratore;
  sbProgetti.Visible        := DM.Get_amministratore;
  sbStatistiche.Visible     := DM.Get_amministratore;
  sbUtenti.Visible          := DM.Get_amministratore;
  sbCancellaLOG.Visible     := DM.Get_amministratore;
  sbInfoConnessione.Visible := DM.Get_amministratore;

  //PageControl1.Visible := DM.Get_amministratore;
  TabSheet1.TabVisible := DM.Get_amministratore;
  TabSheet2.TabVisible := DM.Get_amministratore;
  TabSheet3.TabVisible := DM.Get_amministratore;
  TabSheet4.TabVisible := DM.Get_amministratore;
  TabSheet5.TabVisible := (Not DM.Get_amministratore);
  PopolaStyleManager;
  Self.Show;
end;

procedure TFormMenu.FormCreate(Sender: TObject);
begin
  mBoot := True;
end;

procedure TFormMenu.Image1Click(Sender: TObject);
begin
  pivotForm.ScaricoOre;
  ElaboraQuery;
end;

procedure TFormMenu.stampaLOG1Click(Sender: TObject);
begin
  pivotForm.GestioneCancellaLOG;
end;

procedure TFormMenu.PopolaStyleManager;
var
  StyleName, m: string;
begin
  ComboBoxStyleManager.Clear;
  for StyleName in TStyleManager.StyleNames do
    ComboBoxStyleManager.Items.Add(StyleName);

  m := puntoIni.readString('STYLE', 'Appearance'   ,'');
  if m <> '' then begin
    ComboBoxStyleManager.Text := m;
    TStyleManager.SetStyle( ComboBoxStyleManager.Text );
  end;
end;

end.
