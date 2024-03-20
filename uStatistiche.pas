unit uStatistiche;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  Data.DB, Data.Win.ADODB, Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls,
  System.ImageList, Vcl.ImgList, ShellAPI;

type
  TFormStatistiche = class(TForm)
    Panel1: TPanel;
    rg: TRadioGroup;
    ADOQueryRO: TADOQuery;
    sbQuery: TSpeedButton;
    dsRO: TDataSource;
    DBNavigatorRO: TDBNavigator;
    DBGrid1: TDBGrid;
    DBMemoRO: TDBMemo;
    ImageList1: TImageList;
    Splitter1: TSplitter;
    Label1: TLabel;
    ComboBoxPrefisso: TComboBox;
    Label2: TLabel;
    ComboBoxAttivo: TComboBox;
    Label3: TLabel;
    EditNomeProgetto: TEdit;
    sbHTML: TSpeedButton;
    sb2livelliHTML: TSpeedButton;
    procedure sbQueryClick(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure sbHTMLClick(Sender: TObject);
    procedure sb2livelliHTMLClick(Sender: TObject);
  private
    { Private declarations }
    procedure CreaHTML( pTitoloHTML, pPath: string; pDBGrid: TDBGrid; pADOQuery: TADOQuery );
    procedure CreaHTML2Livelli( pTitoloHTML, pPath: string; pDBGrid: TDBGrid; pADOQuery: TADOQuery; pLivello: integer );
  public
    { Public declarations }
  end;

var
  FormStatistiche: TFormStatistiche;

implementation uses uDM, DateUtils, pivotDate;

{$R *.dfm}

procedure TFormStatistiche.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  w: integer;
begin
  w := 5+DBGrid1.Canvas.TextExtent(Column.Field.DisplayText).cx;
  if w>column.Width then Column.Width := w;
end;

procedure TFormStatistiche.DBGrid1TitleClick(Column: TColumn);
var
  mFieldOrder: string;
begin
  with Column do begin
    mFieldOrder := Column.FieldName+' DESC';
    //ShowMessage( mFieldOrder );
    ADOQueryRO.Sort := mFieldOrder;
  end;
end;

procedure TFormStatistiche.sbQueryClick(Sender: TObject);
var
  mQry: string;
  rc, i: integer;
  mPrefisso, mAttivo, mNomeProgetto: string;
begin
  with ADOQueryRO do begin
    Close;
    SQL.Clear;
    mQry := '';
    DBMemoRO.Visible := False;
    DBMemoRO.DataField := '';
    mPrefisso := ComboBoxPrefisso.Text;
    mAttivo   := ComboBoxAttivo.Text;
    mNomeProgetto := '%'+EditNomeProgetto.Text+'%';

    if rg.ItemIndex = 0 then begin // scarico ore
      mQry := 'select SCAORE.* , PROG.NomeProgetto, PROGDET.descrizione AS SubProgetto, LOGIN .avatar '+#13+#10+
              'from scaricoore SCAORE '+#13+#10+
              'left outer join login LOGIN ON LOGIN.id = SCAORE.`id-login`'+#13+#10+
              'left outer join progetto PROG ON '+
                'PROG.prefisso = SCAORE.prefisso AND '+
                'PROG.idprogetto = SCAORE.idprogetto'+#13+#10+
              'left outer join progettodettaglio PROGDET ON '+
                'PROGDET.prefisso = SCAORE.prefisso AND '+
                'PROGDET.idprogetto = SCAORE.idprogetto AND '+
                'PROGDET.idprogettodettaglio = SCAORE.idprogettodettaglio'+#13+#10+
              'where SCAORE.prefisso = '+''''+mPrefisso+''''+' ';
      if mNomeProgetto<>'%%' then begin
        mQry := mQry + ' AND PROG.NomeProgetto LIKE '+''''+mNomeProgetto+''''+' '+#13+#10;
      end;

      mQry := mQry + ' order by SCAORE.idora DESC';
      DBMemoRO.DataField := 'note';
      DBMemoRO.Visible := True;
    end;
    if rg.ItemIndex = 1 then begin // progetti
      mQry := 'select prefisso, idprogetto, NomeProgetto, Inizio, Fine, attivo, Budget '+#13+#10+
              'from progetto '+#13+#10+
              'where prefisso = '+''''+mPrefisso+''''+' AND attivo = '+''''+mAttivo+''''+' '+#13+#10;
      if mNomeProgetto<>'%%' then begin
        mQry := mQry + ' AND NomeProgetto LIKE '+''''+mNomeProgetto+''''+' '+#13+#10;
      end;
      mQry := mQry +' order by prefisso, NomeProgetto ';
    end;
    if rg.ItemIndex = 2 then begin // log
      mQry := 'SELECT id, tablename, recordblob, dataora, avatar '+#13+#10+
              'FROM log  '+#13+#10+
              'ORDER BY id ';
      DBMemoRO.DataField := 'recordblob';
      DBMemoRO.Visible := True;
    end;
    if rg.ItemIndex = 3 then begin // log : 'login errata'
      mQry := 'SELECT id, tablename, recordblob, dataora, avatar '+#13+#10+
              'FROM log  '+#13+#10+
              'WHERE tablename = '+''''+'login errata'+''''+#13+#10+
              'ORDER BY tablename, dataora DESC ';
      DBMemoRO.DataField := 'recordblob';
      DBMemoRO.Visible := True;
    end;
    if rg.ItemIndex = 4 then begin // scarico ore per progetto
      mQry := 'select SCAORE.* , PROG.NomeProgetto, PROGDET.descrizione AS SubProgetto, LOGIN.avatar '+#13+#10+
              'from scaricoore SCAORE '+#13+#10+
              'left outer join login LOGIN ON LOGIN.id = SCAORE.`id-login`'+#13+#10+
              'left outer join progetto PROG ON '+
                'PROG.prefisso = SCAORE.prefisso AND '+
                'PROG.idprogetto = SCAORE.idprogetto'+#13+#10+
              'left outer join progettodettaglio PROGDET ON '+
                'PROGDET.prefisso = SCAORE.prefisso AND '+
                'PROGDET.idprogetto = SCAORE.idprogetto AND '+
                'PROGDET.idprogettodettaglio = SCAORE.idprogettodettaglio'+#13+#10+
              'where SCAORE.prefisso = '+''''+mPrefisso+''''+' ';
      if mNomeProgetto<>'%%' then begin
        mQry := mQry + ' AND PROG.NomeProgetto LIKE '+''''+mNomeProgetto+''''+' '+#13+#10;
      end;

      mQry := mQry + ' order by SCAORE.idprogetto, SCAORE.`id-login`, SCAORE.idora DESC';
      DBMemoRO.DataField := 'note';
      DBMemoRO.Visible := True;
    end;
    if rg.ItemIndex = 5 then begin // scarico ore per utente
      mQry := 'select SCAORE.* , PROG.NomeProgetto, PROGDET.descrizione AS SubProgetto, LOGIN.avatar '+#13+#10+
              'from scaricoore SCAORE '+#13+#10+
              'left outer join login LOGIN ON LOGIN.id = SCAORE.`id-login`'+#13+#10+
              'left outer join progetto PROG ON '+
                'PROG.prefisso = SCAORE.prefisso AND '+
                'PROG.idprogetto = SCAORE.idprogetto'+#13+#10+
              'left outer join progettodettaglio PROGDET ON '+
                'PROGDET.prefisso = SCAORE.prefisso AND '+
                'PROGDET.idprogetto = SCAORE.idprogetto AND '+
                'PROGDET.idprogettodettaglio = SCAORE.idprogettodettaglio'+#13+#10+
              'where SCAORE.prefisso = '+''''+mPrefisso+''''+' ';
      if mNomeProgetto<>'%%' then begin
        mQry := mQry + ' AND PROG.NomeProgetto LIKE '+''''+mNomeProgetto+''''+' '+#13+#10;
      end;

      mQry := mQry + ' order by SCAORE.`id-login`, SCAORE.idprogetto, SCAORE.idora DESC';
      DBMemoRO.DataField := 'note';
      DBMemoRO.Visible := True;
    end;
    SQL.Add( mQry );
    //if ((rg.ItemIndex <> 2) and (rg.ItemIndex <> 3)) then begin
    //  Parameters[0].Value := DM.Get_Prefisso;
    //end;
    rc := ExecSQL;
    Open;

    DM.SistemazioneFormati( DBGrid1, ADOQueryRO );
    // inizializzo le colonne con la larghezza minima poi le sistemo con la
    // DBGrid1DrawColumnCell
    for i := 0 to DBGrid1.Columns.Count - 1 do begin
      DBGrid1.Columns[i].Width := 5 + DBGrid1.Canvas.TextWidth(DBGrid1.Columns[i].title.caption);
      if ((DBGrid1.Columns[i].FieldName = 'recordblob') or
          (DBGrid1.Columns[i].FieldName = 'note')) then begin
        DBGrid1.Columns[i].Visible := False;
      end;
      if ((DBGrid1.Columns[i].FieldName = 'Budget')) then begin
        DBGrid1.Columns[i].Alignment := taRightJustify;
        DBGrid1.Columns[i].Font.Color := clBlue;
      end;
    end;

    First;

  end;

  DBGrid1.DataSource.DataSet.First;
  DBNavigatorRO.DataSource.DataSet.First;
  ADOQueryRO.First;
  DBGrid1.SetFocus;
  //ShowMessage( 'record count = '+IntToStr(rc) );
end;

procedure TFormStatistiche.sb2livelliHTMLClick(Sender: TObject);
var
  mPath, url, mTitoloHTML: string;
begin
  sbQuery.Click;

  mPath := ExtractFilePath( Application.ExeName )+'statitica';
  case rg.itemindex of
  4: begin
       mTitoloHTML := 'scarico ore per progetto';
       mPath := mPath + 'scaricooreperprogetto.html';
     end;
  5: begin
       mTitoloHTML := 'scarico ore per utente';
       mPath := mPath + 'scaricooreperutente.html';
     end;
  else
    mTitoloHTML := 'statistica';
    mPath := mPath + 'statistica.html';
  end;

  url := 'file:////'+mPath;

  CreaHTML2Livelli( mTitoloHTML, mPath, DBGrid1, ADOQueryRO, rg.itemindex );

  if MessageDlg('Vuoi aprire il browser ?'+#13+#10+url,
     mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then begin

    ShellExecute(HInstance, 'open', PChar(url), nil, nil, SW_NORMAL);
  end;
end;

procedure TFormStatistiche.sbHTMLClick(Sender: TObject);
var
  mPath, url, mTitoloHTML: string;
begin
  mPath := ExtractFilePath( Application.ExeName )+'statitica';
  case rg.itemindex of
  0: begin
       mTitoloHTML := 'scarico ore';
       mPath := mPath + 'scaricoore.html';
     end;
  1: begin
       mTitoloHTML := 'progetti';
       mPath := mPath + 'progetti.html';
     end;
  2: begin
       mTitoloHTML := 'log';
       mPath := mPath + 'log.html';
     end;
  3: begin
       mTitoloHTML := 'login errata';
       mPath := mPath + 'log-errata.html';
     end;
  4: begin
       mTitoloHTML := 'scarico ore per progetto';
       mPath := mPath + 'scaricooreperprogetto.html';
     end;
  5: begin
       mTitoloHTML := 'scarico ore per utente';
       mPath := mPath + 'scaricooreperutente.html';
     end;
  else
    mTitoloHTML := 'statistica';
    mPath := mPath + 'statistica.html';
  end;

  url := 'file:////'+mPath;

  CreaHTML( mTitoloHTML, mPath, DBGrid1, ADOQueryRO );

  if MessageDlg('Vuoi aprire il browser ?'+#13+#10+url,
     mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then begin

    ShellExecute(HInstance, 'open', PChar(url), nil, nil, SW_NORMAL);
  end;
end;

procedure TFormStatistiche.CreaHTML( pTitoloHTML, pPath: string; pDBGrid: TDBGrid; pADOQuery: TADOQuery );
var
  sl: TStringList;
  mField: string;
  old_Prefisso: string;
  old_idprogetto: integer;
  old_idprogettodettaglio: string;
  mEvidenzia: string;
  mTotaleOre, mTotaleOreProgetto: integer;
  i, t: integer;
begin

  sl := TStringList.Create;
  sl.Add( '<!DOCTYPE html> '+#13+#10+
          ' <html>'+#13+#10+
          ' <head>'+#13+#10+
          ' <style>'+#13+#10+
          ' table {'+#13+#10+
          '   font-family: arial, sans-serif;'+#13+#10+
          '   border-collapse: collapse;'+#13+#10+
          '   width: 100%;'+#13+#10+
          ' }'+#13+#10+
          'td, th {'+#13+#10+
          '  border: 1px solid #dddddd;'+#13+#10+
          '  text-align: left;'+#13+#10+
          '  padding: 8px;'+#13+#10+
          '}'+#13+#10+
          'tr:nth-child(even) {'+#13+#10+
          '  background-color: #dddddd;'+#13+#10+
          '}'+#13+#10+
          'td.centrato, tr.centrato , th.centrato{'+#13+#10+
          '  text-align: center;'+#13+#10+
          '}'+#13+#10+
          'td.valuta, tr.valuta, th.valuta {'+#13+#10+
          '  text-align: right;'+#13+#10+
          '}'+#13+#10+
          'tr.evidenzia {'+#13+#10+
          '  color: red;'+#13+#10+
          '}'+#13+#10+
          'td.totalegenerale {'+#13+#10+
          '  background-color: yellow;'+#13+#10+
          '  text-align: right;'+#13+#10+
          '  color: blue;'+#13+#10+
          '}'+#13+#10+
          '</style>'+#13+#10+
          '</head>'+#13+#10+
          '<body>'+#13+#10+
          '<h2>'+pTitoloHTML+' elaborato il '+FormatDateTime('dd-mm-yyyy hh:MM:ss', Now)+'</h2>'+#13+#10+
          '<table>' );

  with pADOQuery do begin
    First;
    sl.Add('<tr>');

    t := pDBGrid.Columns.Count-1;
    for i := 0 to t do begin
      if ((LowerCase(pDBGrid.Columns[i].Title.Caption) = 'nomeprogetto') or
          (LowerCase(pDBGrid.Columns[i].Title.Caption) = 'subprogetto')) then begin
        sl.Add('<th>');
      end else begin
        if LowerCase(pDBGrid.Columns[i].Title.Caption) = 'budget' then begin
          sl.Add('<th class="valuta">');
        end else begin
          sl.Add('<th class="centrato">');
        end;
      end;
      sl.Add( pDBGrid.Columns[i].Title.Caption );
      sl.Add('</th>');
    end;

    {*
      sl.Add('<th class="centrato">'); sl.Add('id'); sl.Add('</th>');
      sl.Add('<th class="centrato">');; sl.Add('attivo'); sl.Add('</th>');
      sl.Add('<th>'); sl.Add('progetto'); sl.Add('</th>');
      sl.Add('<th class="centrato">' ); sl.Add('inizio'); sl.Add('</th>');
      sl.Add('<th class="centrato">' ); sl.Add('fine'); sl.Add('</th>');
      sl.Add('<th class="valuta">' ); sl.Add('Budget'); sl.Add('</th>');
    ^}

    sl.Add('</tr>');
    while Not EoF do begin
      sl.Add( '<tr>' );

      for i := 0 to FieldCount-1 do begin
        mField := LowerCase( Fields[i].FieldName );
        if ((mField = 'data') or
            (mField = 'inizio') or
            (mField = 'fine') or
            (mField = 'datainizio') or
            (mField = 'datafine')) then begin
          sl.Add( '<td class="centrato">' );
          sl.Add( FormatDateTime('dd-mm-yyyy', FieldByName( Fields[i].FieldName ).AsDateTime ) );
        end else if ((mField = 'nomeprogetto') or
                     (mField = 'subprogetto')) then begin
          sl.Add( '<td>'+Fields[i].AsString );
        end else if (mField = 'budget') then begin
          sl.Add( '<td class="valuta">' );
          sl.Add( FormatFloat(',#0', FieldByName('Budget').asFloat )+' €' );
        end else if (mField = 'note') then begin
          sl.Add( '<td>'+Fields[i].AsString );
        end else begin
          sl.Add( '<td class="centrato">'+Fields[i].AsString );
        end;

        sl.Add( '</td>' );
      end;
      sl.Add( '</td>' );
      sl.Add( '</tr>' );
      Next;
    end;
  end;
  sl.Add('</table>');


  //sl.Add('<br>');
  //sl.Add( '<style>' );
  //sl.Add( 'tr:nth-child(even) {}' );
  //sl.Add( 'tr:nth-child(odd) {}' );
  //sl.Add( '</style>' );

  //mTotaleOre := 0;
  //mTotaleOreProgetto := 0;
  //sl.Add('<table>');
  //with pQueryDettaglioOre do begin
  //  First;
  //  sl.Add('<tr>');
  //    sl.Add('<th class="centrato">'); sl.Add('prefisso'); sl.Add('</th>');
  //    sl.Add('<th class="centrato">'); sl.Add('id'); sl.Add('</th>');
  //    //sl.Add('<th>'); sl.Add('progetto'); sl.Add('</th>');
  //    sl.Add('<th>'); sl.Add('idprogettodettaglio'); sl.Add('</th>');
  //    sl.Add('<th>'); sl.Add('Descrizione Dettaglio Progetto'); sl.Add('</th>');
  //    sl.Add('<th class="centrato">' ); sl.Add('Ore a Budget'); sl.Add('</th>');
  //    sl.Add('<th>' ); sl.Add('Avatar'); sl.Add('</th>');
  //    sl.Add('<th class="valuta">' ); sl.Add('Totale Ore Erogate'); sl.Add('</th>');
  //  sl.Add('</tr>');

  //  old_Prefisso := '';
  //  old_idprogetto := 0;
  //  old_idprogettodettaglio := '';
  //  while Not EoF do begin
  //    if ((old_Prefisso <> FieldByName('prefisso').AsString) or
  //        (old_idprogetto <> FieldByName('idprogetto').AsInteger) or
  //        (old_idprogettodettaglio <> FieldByName('idprogettodettaglio').AsString)) then begin
  //      old_Prefisso           := FieldByName('prefisso').AsString;
  //      old_idprogetto         := FieldByName('idprogetto').AsInteger;
  //      old_idprogettodettaglio:= FieldByName('idprogettodettaglio').AsString;
  //      mEvidenzia := ' class="evidenzia"';
  //    end else begin
  //      mEvidenzia := '';
  //    end;
  //    sl.Add( '<tr'+mEvidenzia+'>' );
  //    if mEvidenzia = '' then begin
  //      sl.Add( '<td>&nbsp</td>' );
  //      sl.Add( '<td>&nbsp</td>' );
  //      sl.Add( '<td>&nbsp</td>' );
  //      sl.Add( '<td>&nbsp</td>' );
  //      sl.Add( '<td>&nbsp</td>' );
  //    end else begin
  //      sl.Add( '<td class="centrato">' ); sl.Add( FieldByName('prefisso').AsString ); sl.Add( '</td>' );
  //      sl.Add( '<td class="centrato">' ); sl.Add( FieldByName('idprogetto').AsString ); sl.Add( '</td>' );
  //      sl.Add( '<td>' );  sl.Add( FieldByName('idprogettodettaglio').AsString ); sl.Add( '</td>' );
  //      sl.Add( '<td>' );  sl.Add( FieldByName('DescProgettoDettaglio').AsString ); sl.Add( '</td>' );
  //      sl.Add( '<td class="valuta">' ); sl.Add( FormatFloat(',#0', FieldByName('OreDettaglio').asFloat ) ); sl.Add( '</td>' );
  //    end;
  //    sl.Add( '<td>' ); sl.Add( FieldByName('avatar').AsString ); sl.Add( '</td>' );
  //    sl.Add( '<td class="valuta">' ); sl.Add( FormatFloat(',#0', FieldByName('TotaleOre').asFloat ) ); sl.Add( '</td>' );
  //
  //    sl.Add( '</tr>' );
  //    mTotaleOreProgetto := mTotaleOreProgetto + FieldByName('TotaleOre').asInteger;
  //
  //    mTotaleOre := mTotaleOre + mTotaleOreProgetto;
  //
  //    Next;
  //    if ((old_Prefisso <> FieldByName('prefisso').AsString) or
  //        (old_idprogetto <> FieldByName('idprogetto').AsInteger) or
  //        EoF) then begin
  //    // mi chiedo se devo stampare il totale progetto
  //      sl.Add( '<tr'+mEvidenzia+'>' );
  //      sl.Add( '<td>&nbsp</td>' );
  //      sl.Add( '<td>&nbsp</td>' );
  //      sl.Add( '<td>&nbsp</td>' );
  //      sl.Add( '<td>&nbsp</td>' );
  //      sl.Add( '<td>&nbsp</td>' );
  //      sl.Add( '<td class="valuta">Totale Progetto ['+IntToStr(old_idprogetto)+']</td>' );
  //      sl.Add( '<td class="valuta">' ); sl.Add( FormatFloat(',#0', mTotaleOreProgetto ) ); sl.Add( '</td>' );
  //      sl.Add( '</tr>' );
  //      mTotaleOreProgetto := 0;
  //    end;
  //  end;
  //  mEvidenzia := ' class="evidenzia"';
  //  sl.Add( '<tr'+mEvidenzia+'>' );
  //  sl.Add( '<td>&nbsp</td>' );
  //  sl.Add( '<td>&nbsp</td>' );
  //  sl.Add( '<td>&nbsp</td>' );
  //  sl.Add( '<td>&nbsp</td>' );
  //  sl.Add( '<td>&nbsp</td>' );
  //  sl.Add( '<td class="totalegenerale">Totale Generale</td>' );
  //  sl.Add( '<td class="totalegenerale">' ); sl.Add( FormatFloat(',#0', mTotaleOre ) ); sl.Add( '</td>' );
  //  sl.Add( '</tr>' );
  //end;

  //sl.Add('</table>');
  sl.Add('</body>');
  sl.Add('</html>');
  sl.SaveToFile( pPath ); // 'elencoprogetti.html' );
  sl.Free;
end;

procedure TFormStatistiche.CreaHTML2Livelli( pTitoloHTML, pPath: string; pDBGrid: TDBGrid; pADOQuery: TADOQuery; pLivello: integer );
var
  mTitoloHTML: string;
  sl: TStringList;
  mKey, mKeyNome, mKeyId, mFieldm, n, x: string;
  mKeyField: string;
  old_Prefisso: string;
  old_idprogetto: integer;
  old_idprogettodettaglio: string;
  mEvidenzia: string;
  mTotaleOre, mTotaleOreProgetto: integer;
  i, e, t, giorniNellAnno: integer;
  mGiornoDellaSettimana, mRigaGiorno: string;
  arrayOre: Array[0..367] of string;
  currAnno, dataAnno, dataMese, dataGiorno: word;
  indiceGiornoArray: word;
begin
  // 4 per progetto/sottoprogetto / avatar
  // 5 per avatar ovvero id-login / progetto/sottoprogetto
  mTitoloHTML := pTitoloHTML+' elaborato il '+FormatDateTime('dd-mm-yyyy hh:MM:ss', Now);
  sl := TStringList.Create;
  //        'tr:nth-child(even) {'+#13+#10+
  //        '  background-color: #dddddd;'+#13+#10+
  //        '}'+#13+#10+
  sl.Add( '<!DOCTYPE html> '+#13+#10+
          '<html>' );

  sl.Add( '<head>' );

  //sl.Add( '<link rel="preconnect" href="https://fonts.googleapis.com">' );
  //sl.Add( '<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>' );
  //sl.Add( '<link href="https://fonts.googleapis.com/css2?family=Foldit:wght@100..900&display=swap" rel="stylesheet">' );

  sl.Add( '<link rel="preconnect" href="https://fonts.googleapis.com">');
  sl.Add( '<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>');
  sl.Add( '<link href="https://fonts.googleapis.com/css2?family=Foldit:wght@100..900&family=Port+Lligat+Slab&family=Tektur:wght@400..900&display=swap" rel="stylesheet">');

  sl.Add( '<style>' );

  sl.Add( '#tabella { ' );
  sl.Add( '  font-family: Tektur, Monserrat, Raleway, Roboto, Open Sans;' );
  //sl.Add( '  font-family: Arial, Helvetica, sans-serif;' );
  //sl.Add( '  font-family: Monserrat, Raleway, Roboto, Open Sans;' );

  sl.Add( '  border-collapse: collapse;' );
  sl.Add( '  width: 100%;' );
  sl.Add( '}' );

  sl.Add( '#tabella td, #tabella th {' );
  sl.Add( '  border: 1px solid #ddd;' );
  sl.Add( '  padding: 8px;' );
  sl.Add( '}' );

  sl.Add( '#tabella tr:nth-child(even){background-color: #f2f2f2;}' );

  sl.Add( '#tabella tr:hover {background-color: #ddd;}' );
  sl.Add( '#tabella td.multi { background-color: yellow; text-align: center; }' );

  sl.Add( '#tabella td.valuta, #tabella tr.valuta, #tabella th.valuta { text-align: right; }' );
  sl.Add( '#tabella tr.evidenzia { color: red; }' );
  sl.Add( '#tabella td.totalegenerale {' );
  sl.Add( '  background-color: yellow;' );
  sl.Add( '  text-align: right;' );
  sl.Add( '  color: blue;' );
  sl.Add( '}' );

  sl.Add( '#tabella th.centrato {' );
  sl.Add( '  padding-top: 12px;' );
  sl.Add( '  padding-bottom: 12px;' );
  sl.Add( '  text-align: center;' );
  sl.Add( '  background-color: #04AA6D;' );
  sl.Add( '  color: white;' );
  sl.Add( '  font-size: 300%;' );
  sl.Add( '}' );

  sl.Add( '#tabella td.centrato, #tabella tr.centrato { text-align: center; }' );




  //        '<style>'+#13+#10+
  //        'table {'+#13+#10+
  //        '  font-family: arial, sans-serif;'+#13+#10+
  //        '  border-collapse: collapse;'+#13+#10+
  //        '  width: 100%;'+#13+#10+
  //        '}'+#13+#10+
  //        'td, th {'+#13+#10+
  //        '  border: 1px solid #dddddd;'+#13+#10+
  //        '  text-align: left;'+#13+#10+
  //        '  padding: 8px;'+#13+#10+
  //        '}'+#13+#10+
  //        'tr:nth-child(odd) { background-color: #dddddd; }'+#13+#10+


  sl.Add( '</style>' );
  sl.Add( '</head>' );

  sl.Add( '<body' );
  sl.Add( '<title><h2>'+mTitoloHTML+'</h2></title>' );

  giorniNellAnno := pivotDate.GiorniAnno( date );
  currAnno := DateUtils.YearOf( date );

  sl.Add( '<table id="tabella">' );

      sl.Add('<tr>');
      if pLivello = 4 then begin
        sl.Add( '<th class="centrato">progetto</th>' ); //'+'('+mKey+') '+FieldByName('nomeprogetto').AsString+'</td>' );
      end;
      if pLivello = 5 then begin
        sl.Add( '<th class="centrato">avatar</th>' ); // '<td>'+'('+mKey+') '+FieldByName('avatar').AsString+'</td>' );
      end;
      sl.Add( '<th class="centrato">id</th>' );

      n := '';
      n := '<td class="centrato">'+IntToStr(currAnno-1)+'</td>';

      mRigaGiorno := '';
      for i := 1 to giorniNellAnno do begin
        mRigaGiorno := mRigaGiorno + '<td class="centrato">'; // n := n + '<td class="centrato">';
        mRigaGiorno := mRigaGiorno + '<p>'+pivotDate.GetGiorno(currAnno, i)+'</p>';
        e := (1000+i);
        mRigaGiorno := mRigaGiorno + '<p>'+copy(IntToStr(e),2,3) + '</p>';
        mGiornoDellaSettimana := pivotDate.GetData(currAnno, i);
        if ((mGiornoDellaSettimana='sab') or
            (mGiornoDellaSettimana='dom')) then begin
          mRigaGiorno := mRigaGiorno + '<p>&nbsp;';
        end else begin
          mRigaGiorno := mRigaGiorno + '<p>'+mGiornoDellaSettimana+',';
        end;
        mRigaGiorno := mRigaGiorno + pivotDate.GetMese(currAnno, i)+'</p>';
        mRigaGiorno := mRigaGiorno + '</td>';

        n := n + mRigaGiorno;
        mRigaGiorno := '';
      end;
      n := n + '<td class="centrato">'+IntToStr(currAnno+1)+'</td>';
      n := n + '</tr>';
      sl.Add( n );
  n := '';

  // ShowMessage( 'giorniNellAnno='+IntToStr(giorniNellAnno) );
  with pADOQuery do begin
    First;
    while Not EoF do begin
        // pLivello = 4 - progetto
      for i := 0 to 367 do begin
        arrayOre[i] := '';
      end;
      if pLivello = 4 then begin
        mKey := IntToStr( FieldByName('idprogetto').asInteger );
        mKeyNome := FieldByName('nomeprogetto').asString;
        mKeyField := 'idprogetto';
      end;
      // pLivello = 5 - avatar
      if pLivello = 5 then begin
        mKey := IntToStr( FieldByName('id-login').asInteger );
        mKeyNome := FieldByName('avatar').asString;
        mKeyField := 'id-login';
      end;
      mKeyId := mKey;


      while ((mKey = IntToStr( FieldByName(mKeyField).asInteger )) and (Not EoF)) do begin
        decodeDate( FieldByName('data').asDateTime, dataAnno, dataMese, dataGiorno );

        if dataAnno < currAnno then begin
          arrayOre[0] := 'X';
        end;
        if dataAnno > currAnno then begin
          arrayOre[giorniNellAnno+1] := 'X';
        end;
        if dataAnno = currAnno then begin
          indiceGiornoArray := GiorniDalPrimoDellAnno( FieldByName('data').asDateTime );
          x := Trim(arrayOre[indiceGiornoArray]);
          if (x='') then begin
            arrayOre[indiceGiornoArray] := 'X';
          end else if (arrayOre[indiceGiornoArray] <> 'M') then begin
            arrayOre[indiceGiornoArray] := 'M';
          end;

          //if ((mKey='5') and
          //   (FieldByName('idora').asInteger=35)) then begin
          //  ShowMessage( 'idora='+FieldByName('idora').asString+
          //               ' data='+FieldByName('data').asString+
          //               ' indiceGiornoArray='+IntToStr(indiceGiornoArray) );
          //end;
          //-sl.Add( '<tr>' );
          //for i := 0 to FieldCount-1 do begin
            //-mField := LowerCase( Fields[i].FieldName );
            //-if ((mField = 'data') or
            //-    (mField = 'inizio') or
            //-    (mField = 'fine') or
            //-    (mField = 'datainizio') or
            //-    (mField = 'datafine')) then begin
            //-  sl.Add( '<td class="centrato">' );
            //-  sl.Add( FormatDateTime('dd-mm-yyyy', FieldByName( Fields[i].FieldName ).AsDateTime ) );
            //-end else if ((mField = 'nomeprogetto') or
            //-             (mField = 'subprogetto')) then begin
            //-  sl.Add( '<td>'+Fields[i].AsString );
            //-end else if (mField = 'budget') then begin
            //-  sl.Add( '<td class="valuta">' );
            //-  sl.Add( FormatFloat(',#0', FieldByName('Budget').asFloat )+' €' );
            //-end else if (mField = 'note') then begin
            //-  sl.Add( '<td>'+Fields[i].AsString );
            //-end else begin
            //-  sl.Add( '<td class="centrato">'+Fields[i].AsString );
            //-end;
            //-sl.Add( '</td>' );
          //end;
          //-sl.Add( '</td>' );
          //-sl.Add( '</tr>' );
        end;
        Next;
      end;
      // altro progetto o utente
      n := '<tr>';
      n := n + '<td>'+mKeyNome+'</td>';
      n := n + '<td class="centrato">'+mKeyId+'</td>';

      //n := n + '<td>'+'&nbsp;'+'</td>';
      for i := 0 to 367 do begin
        if Trim(arrayOre[i]) = '' then begin
          n := n + '<td class="centrato">'+'&nbsp;'+'</td>';// IntToStr(i)
        end else if Trim(arrayOre[i]) = 'M' then begin
          n := n + '<td class="multi">M</td>'; // n := n + '<td class="centrato">'+'X'+'<td>';
        end else if Trim(arrayOre[i]) = 'X' then begin
          n := n + '<td class="centrato">X</td>'; // n := n + '<td class="centrato">'+'X'+'<td>';
        end;
      end;
      n := n + '</tr>';

      sl.Add( n );

    end;
  end;

  sl.Add('</table>');

  sl.Add('</body>');
  sl.Add('</html>');
  sl.SaveToFile( pPath ); // 'elencoprogetti.html' );
  sl.Free;
end;

end.
