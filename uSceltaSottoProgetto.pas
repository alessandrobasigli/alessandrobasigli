unit uSceltaSottoProgetto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask,
  Vcl.DBCtrls, Data.DB, Data.Win.ADODB, Vcl.Grids, Vcl.DBGrids;

type
  TFormSceltaSottoProgetto = class(TForm)
    Panel1: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    ComboBoxAttivo: TComboBox;
    EditNomeSottoProgetto: TEdit;
    ButtonQuery: TButton;
    ButtonOK: TButton;
    ButtonCANCEL: TButton;
    DBEdit1: TDBEdit;
    ADOQueryDET: TADOQuery;
    ADOQueryDETprefisso: TWideStringField;
    ADOQueryDETidprogetto: TIntegerField;
    ADOQueryDETidprogettodettaglio: TWideStringField;
    ADOQueryDETdescrizione: TWideStringField;
    ADOQueryDETdatainizio: TDateField;
    ADOQueryDETdatafine: TDateField;
    ADOQueryDETBudgetDettaglio: TFMTBCDField;
    ADOQueryDETOreDettaglio: TIntegerField;
    dsDET: TDataSource;
    DBNavigator1: TDBNavigator;
    DBGrid2: TDBGrid;
    EditPROGETTO: TEdit;
    ADOQueryDETattivo: TWideStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ButtonQueryClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function GetPrefisso: string;
    function GetIdProgetto: integer;
    function GetSubProgetto: string;

    procedure set_qry( pPrefisso: string; pidprogetto: longint; pidprogettodettaglio: string );
    procedure set_progetto( pDescProgetto: string );
  end;

var
  FormSceltaSottoProgetto: TFormSceltaSottoProgetto;
  mBoot: boolean;
  mPrefisso: string;
  mIdProgetto: longint;

implementation uses uDM;

{$R *.dfm}

procedure TFormSceltaSottoProgetto.set_progetto( pDescProgetto: string );
begin
  EditPROGETTO.Text := pDescProgetto;
end;

function TFormSceltaSottoProgetto.GetPrefisso: string;
begin
  Result := ADOQueryDET.FieldByName('prefisso').AsString;
end;

function TFormSceltaSottoProgetto.GetIdProgetto: integer;
begin
  Result := ADOQueryDET.FieldByName('idprogetto').AsInteger;
end;

function TFormSceltaSottoProgetto.GetSubProgetto: string;
begin
  Result := ADOQueryDET.FieldByName('idprogettodettaglio').AsString;
end;

procedure TFormSceltaSottoProgetto.ButtonQueryClick(Sender: TObject);
var
  mNome, mAttivo: string;
  mQry: string;
begin

  mNome := '%'+Trim( EditNomeSottoProgetto.Text )+'%';
  mAttivo := ComboBoxAttivo.Text;

  with ADOQueryDET do begin
    Close;
    mQry := 'SELECT prefisso, idprogetto, idprogettodettaglio, descrizione, datainizio, datafine, BudgetDettaglio, OreDettaglio, attivo '+
            'from progettodettaglio '+
            'where prefisso = '+''''+mPrefisso+'''' +
            ' and idprogetto = '+IntToStr(mIdProgetto)+' and '+
            ' attivo = '+''''+mAttivo+''''+#13+#10;
    if mNome <> '%%' then begin
      mQry := mQry + ' and descrizione like '+''''+mNome+''''+#13+#10;
    end;
    mQry := mQry + 'order by prefisso, idprogetto, descrizione';

    SQL.Clear; SQL.Add(mQry );

    ExecSQL;
    Open;
  end;

end;


procedure TFormSceltaSottoProgetto.FormActivate(Sender: TObject);
begin
  if mBoot then begin
    mBoot := False;

  end;
end;

procedure TFormSceltaSottoProgetto.FormCreate(Sender: TObject);
begin
  mBoot := True;
end;

procedure TFormSceltaSottoProgetto.set_qry( pPrefisso: string; pidprogetto: longint; pidprogettodettaglio: string );
var
  mQry: string;
  i: integer;
begin
  mPrefisso   := Trim(pPrefisso);
  mIdProgetto := pidprogetto;

  if mPrefisso <> '' then begin
    if mIdProgetto > 0 then begin
      with ADOQueryDET do begin
        Close;

        mQry := 'SELECT prefisso, idprogetto, idprogettodettaglio, descrizione, datainizio, datafine, BudgetDettaglio, OreDettaglio, attivo '+#13+#10+
                'from progettodettaglio '+#13+#10+

                'where prefisso = '+''''+mPrefisso+''''+
                ' and idprogetto = '+IntToStr(mIdProgetto)+' '+#13+#10+

                'order by prefisso, idprogetto, descrizione';

        SQL.Clear; SQL.Add(mQry );

        ExecSQL;
        Open;  First;

        // ShowMessage( mQry+#13+#10+'trovati sotto-progetto : '+IntToStr(recordCount) );

        if Trim(pidprogettodettaglio)<>'' then begin
          while Not EoF do begin
            if Trim(FieldByName('idprogettodettaglio').asString) =  Trim(pidprogettodettaglio) then begin
              Exit;
            end;
            Next;
          end;
        end;

        for i := 0 to DBGrid2.Columns.Count - 1 do begin
          DBGrid2.Columns[i].Width := 5 + DBGrid2.Canvas.TextWidth(DBGrid2.Columns[i].title.caption);
          if ((DBGrid2.Columns[i].FieldName = 'recordblob') or
              (DBGrid2.Columns[i].FieldName = 'note')) then begin
            DBGrid2.Columns[i].Visible := False;
          end;
        end;

      end;
    end;
  end;
end;

end.
