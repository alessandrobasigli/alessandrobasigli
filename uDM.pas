unit uDM;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB, Vcl.Dialogs,
  Vcl.DBGrids, Vcl.Graphics,
  Data.DBXMySQL, Data.SqlExpr;

type
  TDM = class(TDataModule)
    ADOConnectionDM: TADOConnection;
    ADOTableLOG: TADOTable;
    ADOTableLOGIN: TADOTable;
    ADOTableLOGINid: TAutoIncField;
    ADOTableLOGINUtente: TWideStringField;
    ADOTableLOGINPassword: TWideStringField;
    ADOTableLOGINprefisso: TWideStringField;
    ADOTablePROGETTO: TADOTable;
    ADOTablePROGETTOidprogetto: TAutoIncField;
    ADOTablePROGETTONomeProgetto: TWideStringField;
    ADOTablePROGETTOInizio: TDateField;
    ADOTablePROGETTOFine: TDateField;
    ADOTablePROGETTOprefisso: TWideStringField;
    ADOTablePROGETTOBudget: TFMTBCDField;
    ADOTablePROGETTO_DET: TADOTable;
    dsPROGETTO: TDataSource;
    dsPROGETTO_DET: TDataSource;
    ADOTablePROGETTO_DETidprogetto: TIntegerField;
    ADOTablePROGETTO_DETidprogettodettaglio: TWideStringField;
    ADOTablePROGETTO_DETdescrizione: TWideStringField;
    ADOTablePROGETTO_DETprefisso: TWideStringField;
    ADOTablePROGETTO_DETdatainizio: TDateField;
    ADOTablePROGETTO_DETdatafine: TDateField;
    ADOTablePROGETTO_DETBudgetDettaglio: TFMTBCDField;
    ADOTablePROGETTO_DETOreDettaglio: TIntegerField;
    ADOTableScaricoOre: TADOTable;
    dsScaricoOre: TDataSource;
    ADOTableScaricoOreprefisso: TWideStringField;
    ADOTableScaricoOreidora: TLargeintField;
    ADOTableScaricoOreidlogin: TIntegerField;
    ADOTableScaricoOredata: TDateField;
    ADOTableScaricoOreidprogetto: TIntegerField;
    ADOTableScaricoOreidprogettodettaglio: TWideStringField;
    ADOTableScaricoOreore: TBCDField;
    ADOTableScaricoOrenote: TWideMemoField;
    ADOTableProgettoRO: TADOTable;
    ADOTableProDETRO: TADOTable;
    ds1: TDataSource;
    ds2: TDataSource;
    ADOTableProgettoROprefisso: TWideStringField;
    ADOTableProgettoROidprogetto: TAutoIncField;
    ADOTableProgettoRONomeProgetto: TWideStringField;
    ADOTableProgettoROInizio: TDateField;
    ADOTableProgettoROFine: TDateField;
    ADOTableProgettoROBudget: TFMTBCDField;
    ADOTableLOGid: TAutoIncField;
    ADOTableLOGtablename: TWideStringField;
    ADOTableLOGrecordblob: TBlobField;
    ADOTableLOGdataora: TDateTimeField;
    ADOTablePROGETTO_DETattivo: TWideStringField;
    ADOTablePROGETTOAttivo: TWideStringField;
    ADOTableProgettoROAttivo: TWideStringField;
    ADOQueryRO: TADOQuery;
    SQLConnection1: TSQLConnection;
    ADOTableLOGINavatar: TWideStringField;
    ADOTableLOGavatar: TWideStringField;
    ADOTableLOGINmail: TWideStringField;
    ADOTableLOGINAmministratore: TIntegerField;
    ADOTableLOGINmailInviataIl: TDateTimeField;
    ADOTableLOGINdatachiusura: TWideStringField;
    procedure ADOTablePROGETTOAfterInsert(DataSet: TDataSet);
    procedure ADOTableScaricoOreAfterInsert(DataSet: TDataSet);
    procedure ADOConnectionDMWillExecute(Connection: TADOConnection;
      var CommandText: WideString; var CursorType: TCursorType;
      var LockType: TADOLockType; var CommandType: TCommandType;
      var ExecuteOptions: TExecuteOptions; var EventStatus: TEventStatus;
      const Command: _Command; const Recordset: _Recordset);
    procedure ADOConnectionDMAfterConnect(Sender: TObject);
    procedure ADOConnectionDMCommitTransComplete(Connection: TADOConnection;
      const Error: Error; var EventStatus: TEventStatus);
    procedure ADOConnectionDMBeginTransComplete(Connection: TADOConnection;
      TransactionLevel: Integer; const Error: Error;
      var EventStatus: TEventStatus);
    procedure ADOConnectionDMConnectComplete(Connection: TADOConnection;
      const Error: Error; var EventStatus: TEventStatus);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ConnettiAlServer;
    procedure ApriTabelle;
    procedure ChiudiTabelle;
    function onLogin( Username, Password: string ): boolean;
    procedure Aggiungi_LOG( pTable: string; pRecord: string );
    procedure SetDebug( pPrefisso, pUtente: string );
    procedure SistemazioneFormati( pDBGrid: TDBGrid; pQry: TADOQuery );

    function Get_utente_DBMySQL: string;
    function Get_password_DBMySQL: string;

    function Get_amministratore: boolean;
    function Get_idlogin: integer;
    function Get_password: string;
    function Get_avatar: string;
    function Get_Prefisso: string;
    function Get_DescrizioneProgetto( pPrefisso: string; pIdProgetto: longInt ): string;
    function Get_DescrizioneSottoProgetto( pPrefisso: string; pIdProgetto: longInt; pSubProgetto: string ): string;

  end;

var
  DM: TDM;
  mErrore: boolean;
  glo_Utente, glo_Prefisso: string;
  glo_idlogin: integer;
  glo_password: string;
  glo_Utente_DB: string;
  glo_password_DB: string;
  glo_avatar: string;
  glo_amministratore: boolean;

implementation uses u_Ini;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

function TDM.Get_amministratore: boolean;
begin
  Result := glo_amministratore;
end;

function TDM.Get_idlogin: integer;
begin
  Result := glo_idlogin;
end;
function TDM.Get_password: string;
begin
  Result := glo_password;
end;

function TDM.Get_avatar: string;
begin
  Result := glo_avatar;
end;

function TDM.Get_Prefisso: string;
begin
  Result := glo_Prefisso;
end;

function TDM.Get_utente_DBMySQL: string;
begin
  Result := glo_Utente_DB;
end;

function TDM.Get_password_DBMySQL: string;
begin
  Result := glo_password_DB;
end;

procedure TDM.ConnettiAlServer;
var
  mConnessione: string;
  mServer, mDB, mUser, mPsw: string;
  mProvider, mPSI, mEP, mPort, mCS: string;
  mMode: string;
begin
  mServer := puntoIni.readString('DBMySQL', 'SERVER'   ,'127.0.0.1');
  mDB     := puntoIni.readString('DBMySQL', 'DATABASE' ,'progetti');
  mUser   := puntoIni.readString('DBMySQL', 'UID'      ,'abasigli');
  mPsw    := puntoIni.readPassword('DBMySQL', 'Password' ,'non funziona');

  glo_Utente_DB   := mUser;
  glo_password_DB := mPsw;

  mProvider := puntoIni.readString('DBMySQL', 'Provider', 'MSDASQL.1');
  mPSI      := puntoIni.readString('DBMySQL', 'Persist Security Info', 'True');
  mMode     := puntoIni.readString('DBMySQL', 'Mode', 'ReadWrite');
  mEP       := puntoIni.readString('DBMySQL', 'Extended Properties', '"DRIVER={MySQL ODBC 8.0 Unicode Driver');
  mPort     := puntoIni.readString('DBMySQL', 'PORT', '3306');
  mCS       := puntoIni.readString('DBMySQL', 'COLUMN_SIZE_S32', '1');
  //mConnessione :=
  //  'Provider=MSDASQL.1;'+
  //  'Password='+mPsw+';'+
  //  'Persist Security Info=True;'+
  //  'User ID='+mUser+';'+
  //  'Mode=ReadWrite;'+
  //  'Extended Properties="DRIVER={MySQL ODBC 8.0 Unicode Driver};'+
  //  'UID='+mUser+';'+
  //  'PWD='+mPsw+';'+
  //  'SERVER='+mServer+';'+
  //  'DATABASE='+mDB+';'+
  //  'PORT=3306;'+
  //  'COLUMN_SIZE_S32=1;";'+
  //  'Initial Catalog='+mDB+';';
  //
  mConnessione := 'Provider='+mProvider+';'+#13+#10+
                  'Password='+mPsw+';'+#13+#10+
                  'Persist Security Info='+mPSI+';'+#13+#10+
                  'Mode='+mMode+';'+#13+#10+
                  'User ID='+mUser+';'+#13+#10+
                  'Extended Properties='+mEP+';'+#13+#10+
                  'UID='+mUser+';'+#13+#10+
                  'PWD='+mPsw+';'+#13+#10+
                  'SERVER='+mServer+';'+#13+#10+
                  'DATABASE='+mDB+';'+#13+#10+
                  'PORT='+mPort+';'+#13+#10+
                  'COLUMN_SIZE_S32='+mCS+';'#13+#10+
                  'Initial Catalog='+mDB+';';

  //ShowMessage( mConnessione );
  try
    with ADOConnectionDM do begin
      Connected := False;
      ConnectionString := mConnessione;
      DefaultDataBase := mDB;
      mMode := puntoIni.readString('DBMySQL', 'Mode', 'ReadWrite');
      if (mMode = 'ReadWrite')      then  Mode := cmReadWrite;
      if (mMode = 'Read')           then  Mode := cmRead;
      if (mMode = 'Write')          then  Mode := cmWrite;
      if (mMode = 'ShareDenyNone')  then  Mode := cmShareDenyNone;
      if (mMode = 'ShareDenyRead')  then  Mode := cmShareDenyRead;
      if (mMode = 'ShareDenyWrite') then  Mode := cmShareDenyWrite;
      if (mMode = 'ShareExclusive') then  Mode := cmShareExclusive;
      if (mMode = 'Unknowm')        then  Mode := cmUnknown ;
      KeepConnection := True;

      mErrore := False;
      Connected := True;

    end;
  except
    on e: exception do begin
      ShowMessage('ERRORE ! '+e.Message );
      mErrore := True;
    end;
  end;
end;

procedure TDM.ApriTabelle;
begin
  ADOTableLOG.Open;
  ADOTableLOGIN.Open;

  ADOTablePROGETTO.Open;
  ADOTablePROGETTO_DET.Open;
  //ADOTableScaricoOre.Open;
  //ADOTableProgettoRO.Open;
  //ADOTableProDETRO.Open;
end;

procedure TDM.ChiudiTabelle;
begin
  ADOTableProDETRO.Close;
  ADOTableProgettoRO.Close;
  ADOTableScaricoOre.Close;
  ADOTablePROGETTO_DET.Close;
  ADOTablePROGETTO.Close;
  ADOTableLOG.Close;
  ADOTableLOGIN.Close;

  ADOConnectionDM.Close;
end;

function TDM.onLogin( Username, Password: string ): boolean;
var
  mResult: boolean;
  // mUserConnessione, mPswConnessione: string;
  mUser, mPsw: string;

begin
  mResult := False;

  glo_Utente   := '';
  glo_Prefisso := '';
  glo_idlogin  := 0;
  glo_password := '';
  glo_avatar   := '';
  glo_amministratore := False;
  
  mUser := Username;
  mPsw  := Password;
  // mUserConnessione := 'abasigli';
  // mPswConnessione  := 'ishtar';
  // check se login e password sono èresenti nella tabella [login]

  if ((Trim(mUser) = '') or (Trim(mPsw) = '')) then begin
  end else begin
    with ADOTableLOGIN do begin
      if Not Active then Open;
      First;
      while Not EoF do begin
        if ((Trim(FieldByName('Utente').AsString) = mUser) and
            (Trim(FieldByName('Password').AsString) = mPsw)) then begin
          // Trovato
          glo_Utente   := mUser;
          glo_idlogin  := FieldByName('id').AsInteger;
          glo_password := FieldByName('password').AsString;
          glo_amministratore := (FieldByName('Amministratore').AsInteger=1);
          glo_Prefisso := FieldByName('Prefisso').AsString;
          glo_avatar   := Trim( FieldByName('avatar').AsString );
          mResult := True;
        end;

        Next;
      end;
      Close;
    end;
  end;
  Result := mResult;
end;

procedure TDM.ADOConnectionDMAfterConnect(Sender: TObject);
begin
  // ShowMessage('AfterConnect');
end;

procedure TDM.ADOConnectionDMBeginTransComplete(Connection: TADOConnection;
  TransactionLevel: Integer; const Error: Error; var EventStatus: TEventStatus);
begin
  // ShowMessage('TransComplete');
end;

procedure TDM.ADOConnectionDMCommitTransComplete(Connection: TADOConnection;
  const Error: Error; var EventStatus: TEventStatus);
begin
  // ShowMessage('CommitTransComplete');
end;

procedure TDM.ADOConnectionDMConnectComplete(Connection: TADOConnection;
  const Error: Error; var EventStatus: TEventStatus);
begin
  // ShowMessage('ConnectComplete');
end;

procedure TDM.ADOConnectionDMWillExecute(Connection: TADOConnection;
  var CommandText: WideString; var CursorType: TCursorType;
  var LockType: TADOLockType; var CommandType: TCommandType;
  var ExecuteOptions: TExecuteOptions; var EventStatus: TEventStatus;
  const Command: _Command; const Recordset: _Recordset);
begin
  // ShowMessage('OnWillExecute'+#13+#10+CommandText);
end;

procedure TDM.ADOTablePROGETTOAfterInsert(DataSet: TDataSet);
begin
  with DataSet do begin
    FieldByName('prefisso').AsString := glo_Prefisso;
  end;
end;

procedure TDM.ADOTableScaricoOreAfterInsert(DataSet: TDataSet);
begin
  with DataSet do begin
    FieldByName('prefisso').AsString  := glo_Prefisso;
    FieldByName('id-login').AsInteger := glo_idlogin;
  end;
end;

procedure TDM.Aggiungi_LOG( pTable: string; pRecord: string );
begin
  with ADOTableLOG do begin
    if Not Active then Open;

    Append;
    FieldByName('tablename').AsString  := pTable;
    FieldByName('recordblob').AsString := pRecord;
    FieldByName('dataora').AsDateTime  := Now;
    FieldByName('avatar').AsString     := Get_avatar;

    Post;

    Close;
  end;
end;

procedure TDM.SetDebug( pPrefisso, pUtente: string );
begin
  glo_Utente   := pUtente;
  glo_Prefisso := pPrefisso;
end;

function TDM.Get_DescrizioneProgetto( pPrefisso: string; pIdProgetto: longInt ): string;
var
  mQry: string;
  mResult: string;
begin
  mResult := '';
  with ADOQueryRO do begin
    Close;
    SQL.Clear;

    mQry := 'SELECT prefisso, idprogetto, NomeProgetto, Inizio, Fine, Budget '+#13+#10+
            'from progetto '+#13+#10+

            'where prefisso = '+''''+pPrefisso+''''+
            ' and idprogetto = '+IntToStr(pIdProgetto)+' '+#13+#10+

            'order by prefisso, idprogetto';

    SQL.Clear; SQL.Add(mQry );

    ExecSQL;
    Open;  First;

    mResult := Trim( FieldByName('NomeProgetto').AsString );

    Close;
    SQL.Clear;
  end;
  Result := mResult;
end;

function TDM.Get_DescrizioneSottoProgetto( pPrefisso: string; pIdProgetto: longInt; pSubProgetto: string ): string;
var
  mQry: string;
  mResult: string;
begin
  mResult := '';
  with ADOQueryRO do begin
    Close;
    SQL.Clear;

    mQry := 'SELECT prefisso, idprogetto, idprogettodettaglio, descrizione, datainizio, datafine, BudgetDettaglio, OreDettaglio, attivo '+#13+#10+
            'from progettodettaglio '+#13+#10+

            'where prefisso = '+''''+pPrefisso+''''+
            ' and idprogetto = '+IntToStr(pIdProgetto)+' '+#13+#10+
            ' and idprogettodettaglio = '+''''+pSubProgetto+''''+' '+#13+#10+

            'order by prefisso, idprogetto, idprogettodettaglio';

    SQL.Clear; SQL.Add(mQry );

    ExecSQL;
    Open;  First;

    mResult := Trim( FieldByName('descrizione').AsString );

    Close;
    SQL.Clear;
  end;
  Result := mResult;
end;

procedure TDM.SistemazioneFormati( pDBGrid: TDBGrid; pQry: TADOQuery );
var i,t, w: integer;
begin
  for i := 0 to pDBGrid.Columns.Count - 1 do begin
    pDBGrid.Columns[i].Width := 5 +
    pDBGrid.Canvas.TextWidth(pDBGrid.Columns[i].title.caption);

    if ((pDBGrid.Columns[i].FieldName = 'recordblob') or
        (pDBGrid.Columns[i].FieldName = 'note')) then begin
      pDBGrid.Columns[i].Visible := False;
    end;
    if ((pDBGrid.Columns[i].FieldName = 'Budget')) then begin
      pDBGrid.Columns[i].Alignment := taRightJustify;
      pDBGrid.Columns[i].Font.Color := clBlue;
    end;
  end;

  with pQry do begin
    t := ComponentCount-1;
    for i := 0 to t do begin
      if Components[i].ClassType = TDateField then begin
        TDateField( Components[i] ).DisplayFormat := 'dd-mm-yyyy';
        TDateField(Components[i] ).Alignment := taCenter;
      end;
      if Components[i].ClassType = TDateTimeField then begin
        if UpperCase( TDateTimeField( Components[i] ).FieldName )=UpperCase('dataora') then begin
          TDateTimeField( Components[i] ).DisplayFormat := 'dd-mm-yyyy hh:MM:ss';
        end else begin
          if UpperCase(pQry.Name)=UpperCase('data') then begin
            TDateTimeField( Components[i] ).DisplayFormat := 'dd-mm-yyyy  dddd';
          end else begin
            TDateTimeField( Components[i] ).DisplayFormat := 'dd-mm-yyyy';
          end;
        end;
      end;
      if Components[i].ClassType = TFloatField then begin
        TFloatField( Components[i] ).DisplayFormat := ',#0.00000';
      end;
      if Components[i].ClassType = TBCDField then begin
        TBCDField( Components[i] ).DisplayFormat := ',#0';
      end;
      if Components[i].ClassType = TFMTBCDField then begin
        // TFMTBCDField( Components[i] ).DisplayFormat := ',#0.00';
        TFMTBCDField( Components[i] ).currency := True;
      end;
      if Components[i].ClassType = TWideStringField then begin
        TWideStringField(Components[i] ).Alignment := taCenter;
      end;

      if Components[i].ClassType = TIntegerField then begin
        TIntegerField( Components[i] ).Alignment := taCenter;
      end;

      if Components[i].ClassType = TWideStringField then begin
        if ((TWideStringField( Components[i] ).FieldName = 'NomeProgetto') or
            (TWideStringField( Components[i] ).FieldName = 'SubProgetto') or
            (TWideStringField( Components[i] ).FieldName = 'tablename') or
            (TWideStringField( Components[i] ).FieldName = 'avatar') or
            (TWideStringField( Components[i] ).FieldName = 'idprogettodettaglio')
            )then begin
          TWideStringField( Components[i] ).Alignment := taLeftJustify;
        end;
      end;
    end;
  end;
end;


end.
