unit uSceltaProgetto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Data.Win.ADODB,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, Vcl.Mask, Vcl.DBCtrls,
  Vcl.ComCtrls;

type
  TFormSceltaProgetto = class(TForm)
    Panel1: TPanel;
    ADOQueryPRO: TADOQuery;
    dsPRO: TDataSource;
    Label1: TLabel;
    ComboBoxPrefisso: TComboBox;
    Label2: TLabel;
    ComboBoxAttivo: TComboBox;
    Label3: TLabel;
    EditNomeProgetto: TEdit;
    ButtonQuery: TButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    DBNavigator1: TDBNavigator;
    ADOQueryPROprefisso: TWideStringField;
    ADOQueryPROidprogetto: TIntegerField;
    ADOQueryPRONomeProgetto: TWideStringField;
    ADOQueryPROInizio: TDateField;
    ADOQueryPROFine: TDateField;
    ADOQueryPROBudget: TFMTBCDField;
    ButtonOK: TButton;
    ButtonCANCEL: TButton;
    DBGrid1: TDBGrid;
    procedure ButtonQueryClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function GetPrefisso: string;
    function GetIdProgetto: integer;
    function GetNomeProgetto: string;

    procedure set_qry( pPrefisso: string; pidprogetto: longint );
  end;

var
  FormSceltaProgetto: TFormSceltaProgetto;

implementation uses uDM;

{$R *.dfm}

procedure TFormSceltaProgetto.set_qry( pPrefisso: string; pidprogetto: longint );
var
  mQry: string;
  i: integer;
begin
  if Trim(pPrefisso) <> '' then begin

    with ADOQueryPRO do begin
      Close;

      mQry := 'select prefisso, idprogetto, NomeProgetto, Inizio, Fine, Budget '+#13+#10+
              'from progetto '+#13+#10;
      mQry := mQry +'where prefisso = '+''''+pPrefisso+''''+#13+#10;
      if pidprogetto > 0 then begin
        mQry := mQry +' and idprogetto = '+IntToStr(pidprogetto)+' '+#13+#10;
      end;
      mQry := mQry + 'order by prefisso, NomeProgetto';

      SQL.Clear; SQL.Add(mQry );
      // Parameters[0].Value := pPrefisso;

      ExecSQL;
      Open; First;
    end;
    // inizializzo le colonne con la larghezza minima poi le sistemo con la
    // DBGrid1DrawColumnCell
    for i := 0 to DBGrid1.Columns.Count - 1 do begin
      DBGrid1.Columns[i].Width := 5 + DBGrid1.Canvas.TextWidth(DBGrid1.Columns[i].title.caption);
      if ((DBGrid1.Columns[i].FieldName = 'recordblob') or
          (DBGrid1.Columns[i].FieldName = 'note')) then begin
        DBGrid1.Columns[i].Visible := False;
      end;
    end;
    DM.SistemazioneFormati( DBGrid1, ADOQueryPRO );
  end;
end;

function TFormSceltaProgetto.GetPrefisso: string;
begin
  Result := ADOQueryPRO.FieldByName('prefisso').AsString;
end;

function TFormSceltaProgetto.GetIdProgetto: integer;
begin
  Result := ADOQueryPRO.FieldByName('idprogetto').AsInteger;
end;

function TFormSceltaProgetto.GetNomeProgetto: string;
begin
  Result := Trim( ADOQueryPRO.FieldByName('NomeProgetto').AsString );
end;

procedure TFormSceltaProgetto.ButtonQueryClick(Sender: TObject);
var
  mPrefisso, mNome, mAttivo: string;
  mQry: string;

  mIdProgetto: integer;
begin
  mPrefisso := ComboBoxPrefisso.Text; //  [ ComboBoxPrefisso.ItemIndex ];
  mNome     := '%'+Trim( EditNomeProgetto.Text )+'%';
  if (ComboBoxAttivo.Text = 'SI') then begin
    mAttivo := 'SI';
  end else begin
    mAttivo := 'NO';
  end;

  with ADOQueryPRO do begin
    Close;
    mQry := 'select prefisso, idprogetto, NomeProgetto, Inizio, Fine, Budget '+#13+#10+
            'from progetto '+#13+#10+
            'where prefisso = '+''''+mPrefisso+''''+' and '+#13+#10+
            'Attivo = '+''''+mAttivo+''''+#13+#10;
    if mNome <> '%%' then begin
      mQry := mQry + ' and nomeprogetto like '+''''+mNome+''''+#13+#10;
    end;

    mQry := mQry +  'order by prefisso, NomeProgetto';

    SQL.Clear;
    SQL.Add( mQry );

    //Parameters[0].Value := mPrefisso;
    //Parameters[1].Value := mAttivo;
    //Parameters[2].Value := mNome;

    ExecSQL;
    Open; First;
  end;

end;

end.
