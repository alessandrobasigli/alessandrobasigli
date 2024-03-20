unit uGestioneProgetti;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.DBCtrls, Winapi.WebView2, Winapi.ActiveX, Vcl.ComCtrls,
  Vcl.Edge, Web.DBWeb, Web.DBXpressWeb, Web.HTTPApp, Web.HTTPProd, Vcl.StdCtrls,
  Web.DSProd, Vcl.OleCtrls, SHDocVw, Vcl.ExtDlgs, System.ImageList, Vcl.ImgList,
  Vcl.Mask, Data.Win.ADODB, Vcl.ColorGrd, AdvUtil, AdvObj, BaseGrid, AdvGrid,
  DBAdvGrid, AdvCustomComponent, AdvPDFIO, AdvGridPDFIO, AdvDateTimePicker,
  AdvDBDateTimePicker, IdBaseComponent, IdComponent, IdCustomTCPServer,
  IdCustomHTTPServer, IdHTTPServer, ShellAPI, uDeco;

type
  TFormProgetti = class(TForm)
    EdgeBrowser1: TEdgeBrowser;
    PageControl2: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel1: TPanel;
    DBNavigator1: TDBNavigator;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    DBNavigator2: TDBNavigator;
    DBGrid2: TDBGrid;
    Panel3: TPanel;
    ButtonEXCEL: TButton;
    SaveDialogSuExcel: TSaveDialog;
    TabSheet3: TTabSheet;
    Panel4: TPanel;
    Button1: TButton;
    MemoORE: TMemo;
    ADOQueryA: TADOQuery;
    DBGrid3: TDBGrid;
    dsADOQueryDETRO: TDataSource;
    ADOQueryDETRO: TADOQuery;
    StringGrid1: TStringGrid;
    Splitter1: TSplitter;
    TabSheet4: TTabSheet;
    AdvGridPDFIO1: TAdvGridPDFIO;
    Panel5: TPanel;
    DBNavigator3: TDBNavigator;
    DBGrid4: TDBGrid;
    ADOTableScaricoOre: TADOTable;
    DataSource1: TDataSource;
    ADOTableScaricoOreidora: TLargeintField;
    ADOTableScaricoOreprefisso: TWideStringField;
    ADOTableScaricoOreidlogin: TIntegerField;
    ADOTableScaricoOredata: TDateField;
    ADOTableScaricoOreidprogetto: TIntegerField;
    ADOTableScaricoOreidprogettodettaglio: TWideStringField;
    ADOTableScaricoOreore: TBCDField;
    DBMemo1: TDBMemo;
    ADOTableScaricoOrenote: TWideMemoField;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DateTimePicker: TDateTimePicker;
    Panel6: TPanel;
    DataSetTableProducer1: TDataSetTableProducer;
    Button2: TButton;
    PrinterSetupDialog1: TPrinterSetupDialog;
    WebBrowser1: TWebBrowser;
    EditURL: TEdit;
    ADOQueryHTML: TADOQuery;
    ADOQueryHTMLprefisso: TWideStringField;
    ADOQueryHTMLidprogetto: TAutoIncField;
    ADOQueryHTMLNomeProgetto: TWideStringField;
    ADOQueryHTMLInizio: TDateField;
    ADOQueryHTMLFine: TDateField;
    ADOQueryHTMLAttivo: TWideStringField;
    ADOQueryHTMLBudget: TFMTBCDField;
    dsADOQueryHTML: TDataSource;
    WebDispatcher1: TWebDispatcher;
    PageProducer1: TPageProducer;
    ADOQueryHTMLDettaglioOre: TADOQuery;
    ADOQueryHTMLDettaglioOreprefisso: TWideStringField;
    ADOQueryHTMLDettaglioOreidprogetto: TIntegerField;
    ADOQueryHTMLDettaglioOreNomeProgetto: TWideStringField;
    ADOQueryHTMLDettaglioOreidprogettodettaglio: TWideStringField;
    ADOQueryHTMLDettaglioOreDescProgettoDettaglio: TWideStringField;
    ADOQueryHTMLDettaglioOreOreDettaglio: TIntegerField;
    ADOQueryHTMLDettaglioOreavatar: TWideStringField;
    ADOQueryHTMLDettaglioOreTotaleOre: TFMTBCDField;
    DateTimePickerINIZIO: TDateTimePicker;
    DateTimePickerDETINIZIO: TDateTimePicker;
    DateTimePickerFINE: TDateTimePicker;
    DateTimePickerDETFINE: TDateTimePicker;
    ADOTableScaricoOredescIDLOGIN: TStringField;
    ImageList1: TImageList;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure ButtonEXCELClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DBGrid3DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure TabSheet3Enter(Sender: TObject);
    procedure DBGrid4DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid4KeyPress(Sender: TObject; var Key: Char);
    procedure DateTimePickerChange(Sender: TObject);
    procedure DateTimePickerDropDown(Sender: TObject);
    procedure DBGrid4ColEnter(Sender: TObject);
    procedure ADOTableScaricoOreAfterDelete(DataSet: TDataSet);
    procedure ADOTableScaricoOreAfterPost(DataSet: TDataSet);
    procedure ADOTableScaricoOreBeforeEdit(DataSet: TDataSet);
    procedure DataSetTableProducer1FormatCell(Sender: TObject; CellRow,
      CellColumn: Integer; var BgColor: THTMLBgColor; var Align: THTMLAlign;
      var VAlign: THTMLVAlign; var CustomAttrs, CellData: string);
    procedure Button2Click(Sender: TObject);
    procedure DataSetPageProducer1HTMLTag(Sender: TObject; Tag: TTag;
      const TagString: string; TagParams: TStrings; var ReplaceText: string);
    procedure WebDispatcher1BeforeDispatch(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure WebDispatcher1AfterDispatch(Sender: TObject; Request: TWebRequest;
      Response: TWebResponse; var Handled: Boolean);
    procedure WebDispatcher1Create(Sender: TObject);
    procedure PageProducer1HTMLTag(Sender: TObject; Tag: TTag;
      const TagString: string; TagParams: TStrings; var ReplaceText: string);
    procedure DBGrid1ColEnter(Sender: TObject);
    procedure DBGrid2ColEnter(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid2KeyPress(Sender: TObject; var Key: Char);
    procedure DateTimePickerINIZIOChange(Sender: TObject);
    procedure DateTimePickerINIZIODropDown(Sender: TObject);
    procedure DateTimePickerDETINIZIODropDown(Sender: TObject);
    procedure DateTimePickerFINEChange(Sender: TObject);
    procedure DateTimePickerFINEDropDown(Sender: TObject);
    procedure DateTimePickerDETINIZIOChange(Sender: TObject);
    procedure DateTimePickerDETFINEChange(Sender: TObject);
    procedure DateTimePickerDETFINEDropDown(Sender: TObject);
    procedure ADOTableScaricoOreCalcFields(DataSet: TDataSet);
    procedure FormDestroy(Sender: TObject);
    procedure PageControl2Change(Sender: TObject);
  private
    { Private declarations }
    function CreaHTML( pQuery, pQueryDettaglioOre: TADOQuery ): boolean;
    procedure CreaListaUtenti;
    function descrizioneAvatar( pId: integer ): string;
  public
    { Public declarations }
  end;

var
  FormProgetti: TFormProgetti;
  mBoot: boolean;
  elencoUtenti: TRamDeco; //TStringList;

implementation uses uDM;

{$R *.dfm}

procedure TFormProgetti.ADOTableScaricoOreAfterDelete(DataSet: TDataSet);
var
  mRecord: string;
  mNote: string;
begin
  mRecord := 'idora = '+Trim( DataSet.FieldByName('idora').AsString )+chr(13)+chr(10)+
             'prefisso = '+Trim( DataSet.FieldByName('prefisso').AsString )+chr(13)+chr(10)+
             'id-login = '+Trim( DataSet.FieldByName('id-login').AsString )+chr(13)+chr(10)+
             'data = '+Trim( DataSet.FieldByName('data').AsString )+chr(13)+chr(10)+
             'idprogetto = '+Trim( DataSet.FieldByName('idprogetto').AsString )+chr(13)+chr(10)+
             'idprogettodettaglio = '+Trim( DataSet.FieldByName('idprogettodettaglio').AsString )+chr(13)+chr(10)+
             'ore = '+Trim( DataSet.FieldByName('ore').AsString )+chr(13)+chr(10);
  mNote := DataSet.FieldByName('note').AsString;

  mRecord := mRecord+'note = '+mNote;

  DM.Aggiungi_LOG( 'scaricoore DEL',mRecord );
end;

procedure TFormProgetti.ADOTableScaricoOreAfterPost(DataSet: TDataSet);
var
  mRecord: string;
  mNote: string;
begin
  mRecord := 'idora = '+Trim( DataSet.FieldByName('idora').AsString )+chr(13)+chr(10)+
             'prefisso = '+Trim( DataSet.FieldByName('prefisso').AsString )+chr(13)+chr(10)+
             'id-login = '+Trim( DataSet.FieldByName('id-login').AsString )+chr(13)+chr(10)+
             'data = '+Trim( DataSet.FieldByName('data').AsString )+chr(13)+chr(10)+
             'idprogetto = '+Trim( DataSet.FieldByName('idprogetto').AsString )+chr(13)+chr(10)+
             'idprogettodettaglio = '+Trim( DataSet.FieldByName('idprogettodettaglio').AsString )+chr(13)+chr(10)+
             'ore = '+Trim( DataSet.FieldByName('ore').AsString )+chr(13)+chr(10);
  mNote := DataSet.FieldByName('note').AsString;

  mRecord := mRecord+'note = '+mNote;

  DM.Aggiungi_LOG( 'scaricoore POST DOPO',mRecord );
end;

procedure TFormProgetti.ADOTableScaricoOreBeforeEdit(DataSet: TDataSet);
var
  mRecord: string;
  mNote: string;
begin
  mRecord := 'idora = '+Trim( DataSet.FieldByName('idora').AsString )+chr(13)+chr(10)+
             'prefisso = '+Trim( DataSet.FieldByName('prefisso').AsString )+chr(13)+chr(10)+
             'id-login = '+Trim( DataSet.FieldByName('id-login').AsString )+chr(13)+chr(10)+
             'data = '+Trim( DataSet.FieldByName('data').AsString )+chr(13)+chr(10)+
             'idprogetto = '+Trim( DataSet.FieldByName('idprogetto').AsString )+chr(13)+chr(10)+
             'idprogettodettaglio = '+Trim( DataSet.FieldByName('idprogettodettaglio').AsString )+chr(13)+chr(10)+
             'ore = '+Trim( DataSet.FieldByName('ore').AsString )+chr(13)+chr(10);
  mNote := DataSet.FieldByName('note').AsString;

  mRecord := mRecord+'note = '+mNote;

  DM.Aggiungi_LOG( 'scaricoore POST PRIMA',mRecord );
end;

procedure TFormProgetti.ADOTableScaricoOreCalcFields(DataSet: TDataSet);
begin
  with DataSet do begin
    FieldByName('descIDLOGIN').asString := descrizioneAvatar( FieldByName('id-login').asInteger );
  end;
end;

procedure TFormProgetti.Button1Click(Sender: TObject);
var
  tOre, tAGENTI: integer;
  mSQL, mSQLA, m: string;
  mPrefisso: string;
  mIdProgetto, i, iRiga: integer;
  mLCID: Integer; mFS: TFormatSettings; mDC: char;
begin
  GetLocaleFormatSettings(mLCID, mFS);
  mDC := '.';
  mFS.DecimalSeparator := mDC;
  mFS.ThousandSeparator := ',';

  mPrefisso   := DM.ADOTablePROGETTO.FieldByName('prefisso').asString;
  mIdProgetto := DM.ADOTablePROGETTO.FieldByName('idprogetto').asInteger;
  MemoORE.Lines.Clear;
  tOre := 0;

  with ADOQueryDETRO do begin
    Close;
    SQL.Clear;
    mSQL := 'SELECT SCA.idprogettodettaglio, '+
            ' DET.descrizione AS DescProgettoDettaglio, '+
            ' LOG.avatar, SUM( SCA.ore ) AS TotaleOre '+

            'FROM progetti.scaricoore SCA '+
            'LEFT OUTER JOIN progetti.login LOG ON LOG.id = SCA.`id-login` '+
            'LEFT OUTER JOIN progetti.progetto PRO ON PRO.prefisso = SCA.prefisso AND PRO.idprogetto = SCA.idprogetto '+
            'LEFT OUTER JOIN progetti.progettodettaglio DET ON DET.prefisso = SCA.prefisso AND DET.idprogetto = SCA.idprogetto AND SCA.idprogettodettaglio  = DET.idprogettodettaglio '+

            'WHERE SCA.idprogetto = '+IntToStr(mIdProgetto)+' '+

            'GROUP BY SCA.idprogettodettaglio, DET.descrizione, LOG.avatar '+

            'ORDER BY LOG.avatar, SCA.idprogettodettaglio, DET.descrizione ';

    SQL.Add( mSQL );
    ExecSQL;
    Open; First;
  end;

  with ADOQueryA do begin
    Close;
    SQL.Clear;
    mSQLA := 'SELECT LOG.avatar, SUM( SCA.ore ) AS TotaleOre '+

             'FROM progetti.scaricoore SCA '+
             'LEFT OUTER JOIN progetti.login LOG ON LOG.id = SCA.`id-login` '+
             'LEFT OUTER JOIN progetti.progetto PRO ON PRO.prefisso = SCA.prefisso AND PRO.idprogetto = SCA.idprogetto '+
             'LEFT OUTER JOIN progetti.progettodettaglio DET ON DET.prefisso = SCA.prefisso AND DET.idprogetto = SCA.idprogetto AND SCA.idprogettodettaglio  = DET.idprogettodettaglio '+

             'WHERE SCA.idprogetto = '+IntToStr(mIdProgetto)+' '+

             'GROUP BY LOG.avatar '+

             'ORDER BY LOG.avatar ';

    SQL.Add( mSQLA );
    ExecSQL;
    Open; First;
  end;
  for i := 0 to DBGrid3.Columns.Count - 1 do begin
    DBGrid3.Columns[i].Width := 5 + DBGrid3.Canvas.TextWidth(DBGrid3.Columns[i].title.caption);
    if ((DBGrid3.Columns[i].FieldName = 'recordblob') or
        (DBGrid3.Columns[i].FieldName = 'note')) then begin
      DBGrid3.Columns[i].Visible := False;
    end;
  end;

  MemoORE.Lines.Add( 'prefisso [ '+DM.ADOTablePROGETTO.FieldByName('prefisso').asString+' ] '+
                     'id [ '+DM.ADOTablePROGETTO.FieldByName('idprogetto').asString+' ]' );
  MemoORE.Lines.Add( 'Nome Progetto: '+DM.ADOTablePROGETTO.FieldByName('NomeProgetto').asString +' - ' +
                      'Attivo: '+DM.ADOTablePROGETTO.FieldByName('Attivo').asString );
  MemoORE.Lines.Add( 'Inizio: '+DM.ADOTablePROGETTO.FieldByName('Inizio').asString+' - '+
                     'Fine: '+DM.ADOTablePROGETTO.FieldByName('Fine').asString );

  m := Format('%25.2n' , [DM.ADOTablePROGETTO.FieldByName('Budget').asFloat ]);
  MemoORE.Lines.Add( 'Bubget: '+Trim(m)+' €'  );
  MemoORE.Lines.Add( ' ');

  StringGrid1.ColCount := 2;
  StringGrid1.RowCount := 2;
  StringGrid1.ColWidths[0] := 500;
  StringGrid1.ColWidths[1] := 80;

  StringGrid1.Cells[0,0] := 'avatar';
  StringGrid1.Cells[1,0] := 'ore';

  tAGENTI := 0; iRiga := 1;
  with ADOQueryA do begin
    First;
    while Not EoF do begin
      tAGENTI := tAGENTI + FieldByName('TotaleOre').asInteger;
      m := Trim(FieldByName('avatar').asString);

      StringGrid1.RowCount := StringGrid1.RowCount +1;

      StringGrid1.Cells[0,iRiga] := m;
      StringGrid1.Cells[1,iRiga] := FieldByName('TotaleOre').asString;
      iRiga := iRiga + 1;

      Next;
    end;
    Close;
  end;
  MemoORE.Lines.Add( 'Totale: '+IntToStr(tAGENTI) );

  StringGrid1.Cells[0,iRiga] := 'totale';
  StringGrid1.Cells[1,iRiga] := IntToStr(tAGENTI);
end;

procedure TFormProgetti.Button2Click(Sender: TObject);
var
  url: string;
begin
  CreaHTML( ADOQueryHTML, ADOQueryHTMLDettaglioOre );

  WebBrowser1.Navigate( EditURL.Text ); // EditURL.Text )

  if MessageDlg('Vuoi aprire il browser ?', mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then begin
    url := EditURL.Text;
    ShellExecute(HInstance, 'open', PChar(url), nil, nil, SW_NORMAL);
  end;
end;

procedure TFormProgetti.ButtonEXCELClick(Sender: TObject);
var
  i,t: integer;
  mField,mFieldName,mValore: string;
  sl: TStringList; m,n: string;
  mOK, mApice: boolean;

  function EliminaCRLF( pStringa: string ): string;
  var
    m, mCRLF: string;
  begin
    mCRLF := chr(13)+chr(10);
    m := pStringa;
    m := StringReplace(m,mCRLF,' ',[rfReplaceAll]);
    Result := m;
  end;

begin
  sl := TStringList.Create;
  t := DM.ADOTablePROGETTO.Fields.Count-1;
  n := '';

  for i := 0 to t do begin
    mFieldName := trim(DM.ADOTablePROGETTO.Fields[i].FieldName);
    mField := trim(DM.ADOTablePROGETTO.Fields[i].FieldName);
    n := n + mField + CHAR(VK_TAB);
  end;
  sl.Add( n );

  with DM.ADOTablePROGETTO do begin
    First;
    while not EOF do begin
      Application.ProcessMessages;
      n := '';
      for i := 0 to t do begin
        mFieldName := trim(DM.ADOTablePROGETTO.Fields[i].FieldName);

        mValore := trim(DM.ADOTablePROGETTO.Fields[i].AsString);
        //if mFieldName = 'NoteUscita' then mValore := EliminaCRLF( mValore );
        //if mFieldName = 'Note' then mValore := EliminaCRLF( mValore );

        mApice := false;
        if mFieldName = 'NomeProgetto' then mApice := true;
        if mFieldName = 'Prefisso' then mApice := true;
        if mFieldName = 'Attivo' then mApice := true;

        if (mApice=true) then mValore := '' + mValore;
        n := n + mValore + CHAR(VK_TAB);
      end;
      sl.Add( n );

      Next;
    end;
    First;
  end;

  if SaveDialogSuExcel.Execute then begin
    sl.SaveToFile( SaveDialogSuExcel.FileName );
    sl.Clear; sl.Free;
    showMessage( 'File pronto per essere importato su excel: '+#13+#10+
                  SaveDialogSuExcel.FileName );
  end;
end;

procedure TFormProgetti.DataSetPageProducer1HTMLTag(Sender: TObject; Tag: TTag;
  const TagString: string; TagParams: TStrings; var ReplaceText: string);
begin
  if (TagString = 'DataSetTableProducer1') then
    ReplaceText := 'ciao';
end;

procedure TFormProgetti.DataSetTableProducer1FormatCell(Sender: TObject;
  CellRow, CellColumn: Integer; var BgColor: THTMLBgColor;
  var Align: THTMLAlign; var VAlign: THTMLVAlign; var CustomAttrs,
  CellData: string);
begin

  if (CellColumn = 0) and (CellRow <> 0) then begin
    CellData := '<a ' +ADOQueryHTML.Fields[CellRow].Value + ' </a>';
  end;
  if (CellData = '') then CellData := '&nbsp;';

  // ShowMessage( CellData );
end;

procedure TFormProgetti.DateTimePickerINIZIOChange(Sender: TObject);
begin
  if DBGrid1.DataSource.State in [dsEdit, dsInsert] then
    DM.ADOTablePROGETTOInizio.Value := DateTimePickerINIZIO.Date;
end;

procedure TFormProgetti.DateTimePickerINIZIODropDown(Sender: TObject);
begin
  DBGrid1.DataSource.Edit;
end;

procedure TFormProgetti.DateTimePickerDETFINEChange(Sender: TObject);
begin
  if DBGrid2.DataSource.State in [dsEdit, dsInsert] then
    DM.ADOTablePROGETTO_DETdatafine.Value := DateTimePickerDETFINE.Date;
end;

procedure TFormProgetti.DateTimePickerDETFINEDropDown(Sender: TObject);
begin
  DBGrid2.DataSource.Edit;
end;

procedure TFormProgetti.DateTimePickerDETINIZIOChange(Sender: TObject);
begin
  if DBGrid2.DataSource.State in [dsEdit, dsInsert] then
    DM.ADOTablePROGETTO_DETdatainizio.Value := DateTimePickerDETINIZIO.Date;
end;

procedure TFormProgetti.DateTimePickerDETINIZIODropDown(Sender: TObject);
begin
  DBGrid2.DataSource.Edit;
end;

procedure TFormProgetti.DateTimePickerChange(Sender: TObject);
begin
  if DBGrid4.DataSource.State in [dsEdit, dsInsert] then
    ADOTableScaricoOredata.Value := DateTimePicker.Date;
end;

procedure TFormProgetti.DateTimePickerDropDown(Sender: TObject);
begin
  DBGrid4.DataSource.Edit;
end;

procedure TFormProgetti.DateTimePickerFINEChange(Sender: TObject);
begin
  if DBGrid1.DataSource.State in [dsEdit, dsInsert] then
    DM.ADOTablePROGETTOFine.Value := DateTimePickerFINE.Date;
end;

procedure TFormProgetti.DateTimePickerFINEDropDown(Sender: TObject);
begin
  DBGrid1.DataSource.Edit;
end;

procedure TFormProgetti.DBGrid1ColEnter(Sender: TObject);
begin
  DateTimePickerINIZIO.Visible := (DBGrid1.SelectedField.FieldName = 'Inizio');
  DateTimePickerFINE.Visible   := (DBGrid1.SelectedField.FieldName = 'Fine');
end;

procedure TFormProgetti.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  w: integer;
begin
  w := 5+DBGrid1.Canvas.TextExtent(Column.Field.DisplayText).cx;
  if w>column.Width then Column.Width := w;
  if (gdFocused in State) then begin
    if (Column.FieldName = 'Inizio') then begin
      with DateTimePickerINIZIO do begin
        Date   := DBGrid1.SelectedField.AsDateTime;
        Left   := Rect.Left + DBGrid1.Left + 1;
        Top    := Rect.Top + DBGrid1.Top + 1;
        Width  := Rect.Right - Rect.Left + 2;
        Height := Rect.Bottom - Rect.Top + 2;
        Visible := True;
      end;
    end;
    if (Column.FieldName = 'Fine') then begin
      with DateTimePickerFINE do begin
        Date   := DBGrid1.SelectedField.AsDateTime;
        Left   := Rect.Left + DBGrid1.Left + 1;
        Top    := Rect.Top + DBGrid1.Top + 1;
        Width  := Rect.Right - Rect.Left + 2;
        Height := Rect.Bottom - Rect.Top + 2;
        Visible := True;
      end;
    end;
  end;

end;



procedure TFormProgetti.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  // TAB - chr(9)
  if (key = chr(9)) then Exit;

  if DBGrid1.SelectedField.FieldName = 'Inizio' then begin
    DateTimePickerINIZIO.SetFocus;
    SendMessage(DateTimePickerINIZIO.Handle, WM_Char, word(Key), 0);
  end;
  if DBGrid1.SelectedField.FieldName = 'Fine' then begin
    DateTimePickerFINE.SetFocus;
    SendMessage(DateTimePickerFINE.Handle, WM_Char, word(Key), 0);
  end;
end;

procedure TFormProgetti.DBGrid2ColEnter(Sender: TObject);
begin
  DateTimePickerDETINIZIO.Visible := (DBGrid2.SelectedField.FieldName = 'datainizio');
  DateTimePickerDETFINE.Visible   := (DBGrid2.SelectedField.FieldName = 'datafine');
end;

procedure TFormProgetti.DBGrid2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  w: integer;
begin
  w := 5+DBGrid2.Canvas.TextExtent(Column.Field.DisplayText).cx;
  if w>column.Width then Column.Width := w;
  if (gdFocused in State) then begin
    if Column.FieldName = 'datainizio' then begin
      with DateTimePickerDETINIZIO do begin
        Date   := DBGrid2.SelectedField.AsDateTime;
        Left   := Rect.Left + DBGrid2.Left + 1;
        Top    := Rect.Top + DBGrid2.Top + 1;
        Width  := Rect.Right - Rect.Left + 2;
        Height := Rect.Bottom - Rect.Top + 2;
        Visible := True;
      end;
    end;
    if Column.FieldName = 'datafine' then begin
      with DateTimePickerDETFINE do begin
        Date   := DBGrid2.SelectedField.AsDateTime;
        Left   := Rect.Left + DBGrid2.Left + 1;
        Top    := Rect.Top + DBGrid2.Top + 1;
        Width  := Rect.Right - Rect.Left + 2;
        Height := Rect.Bottom - Rect.Top + 2;
        Visible := True;
      end;
    end;
  end;
end;

procedure TFormProgetti.DBGrid2KeyPress(Sender: TObject; var Key: Char);
begin
  // TAB - chr(9)
  if (key = chr(9)) then Exit;

  if DBGrid2.SelectedField.FieldName = 'datainizio' then begin
    DateTimePickerDETINIZIO.SetFocus;
    SendMessage(DateTimePickerDETINIZIO.Handle, WM_Char, word(Key), 0);
  end;
  if DBGrid2.SelectedField.FieldName = 'datafine' then begin
    DateTimePickerDETFINE.SetFocus;
    SendMessage(DateTimePickerDETFINE.Handle, WM_Char, word(Key), 0);
  end;
end;

procedure TFormProgetti.DBGrid3DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  w: integer;
begin
  w := 5+DBGrid3.Canvas.TextExtent(Column.Field.DisplayText).cx;
  if w>column.Width then Column.Width := w;
end;

procedure TFormProgetti.DBGrid4ColEnter(Sender: TObject);
begin
  DateTimePicker.Visible := (DBGrid4.SelectedField.FieldName = 'data');
end;

procedure TFormProgetti.DBGrid4DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  w: integer;
begin
  w := 5+DBGrid4.Canvas.TextExtent(Column.Field.DisplayText).cx;
  if w>column.Width then Column.Width := w;
  if (gdFocused in State) then begin
    if (Column.FieldName = 'data') then begin
      with DateTimePicker do begin
        Date   := DBGrid4.SelectedField.AsDateTime;
        Left   := Rect.Left + DBGrid4.Left + 1;
        Top    := Rect.Top + DBGrid4.Top + 1;
        Width  := Rect.Right - Rect.Left + 2;
        Height := Rect.Bottom - Rect.Top + 2;
        Visible := True;
      end;
    end;
  end;
  //Panel6.Caption := 'Left='+IntToStr(Rect.Left)+' Top='+IntToStr(Rect.top)+
  //                  'Width='+IntToStr(Rect.Width)+' Height='+IntToStr(Rect.Height);
  //Panel6.Repaint;;
end;

procedure TFormProgetti.DBGrid4KeyPress(Sender: TObject; var Key: Char);
begin
  // TAB - chr(9)
  if (key = chr(9)) then Exit;

  if (DBGrid4.SelectedField.FieldName = 'data') then begin
    DateTimePicker.SetFocus;
    SendMessage(DateTimePicker.Handle, WM_Char, word(Key), 0);
  end;
end;

procedure TFormProgetti.FormActivate(Sender: TObject);
var
  i: integer;
  mPath, m: string;
begin
  if mBoot then begin
    mBoot := False;

    PageControl2.ActivePage := TabSheet1;

    //DM.ApriTabelle;

    // DM progetti
    for i := 0 to DBGrid1.Columns.Count - 1 do begin
      DBGrid1.Columns[i].Width := 5 + DBGrid1.Canvas.TextWidth(DBGrid1.Columns[i].title.caption);
      if ((DBGrid1.Columns[i].FieldName = 'recordblob') or
          (DBGrid1.Columns[i].FieldName = 'note')) then begin
        DBGrid1.Columns[i].Visible := False;
      end;
      if ((DBGrid1.Columns[i].FieldName = 'Inizio') or
          (DBGrid1.Columns[i].FieldName = 'Fine')) then begin
        DBGrid1.Columns[i].Width := 160;
      end;
    end;

    // DM progetti - det
    for i := 0 to DBGrid2.Columns.Count - 1 do begin
      DBGrid2.Columns[i].Width := 5 + DBGrid2.Canvas.TextWidth(DBGrid2.Columns[i].title.caption);
      if ((DBGrid2.Columns[i].FieldName = 'recordblob') or
          (DBGrid2.Columns[i].FieldName = 'note')) then begin
        DBGrid2.Columns[i].Visible := False;
      end;
      if ((DBGrid2.Columns[i].FieldName = 'datainizio') or
          (DBGrid2.Columns[i].FieldName = 'datafine')) then begin
        DBGrid2.Columns[i].Width := 160;
      end;
    end;

    for i := 0 to DBGrid4.Columns.Count - 1 do begin
      DBGrid4.Columns[i].Width := 5 + DBGrid4.Canvas.TextWidth(DBGrid4.Columns[i].title.caption);
      if ((DBGrid4.Columns[i].FieldName = 'recordblob') or
          (DBGrid4.Columns[i].FieldName = 'note')) then begin
        DBGrid4.Columns[i].Visible := False;
      end;
      if ((DBGrid4.Columns[i].FieldName = 'data')) then begin
        DBGrid4.Columns[i].Width := 160;
      end;
    end;

    mPath := ExtractFilePath( Application.ExeName );
    mPath := mPath + 'elencoprogetti.html';
    EditURL.Text := 'file:////'+mPath;

    CreaListaUtenti;
  end;
end;

procedure TFormProgetti.FormCreate(Sender: TObject);
var
  m: string;
begin
  mBoot := True;
end;

procedure TFormProgetti.FormDestroy(Sender: TObject);
begin
  elencoUtenti.Free;
end;

procedure TFormProgetti.PageControl2Change(Sender: TObject);
begin
  if PageControl2.ActivePage = TabSheet4 then begin
    //ShowMessage( 'ADOTableScaricoOre.Open;' );
    ADOTableScaricoOre.Open;
  end else begin
    ADOTableScaricoOre.Close;
  end;
end;

procedure TFormProgetti.PageProducer1HTMLTag(Sender: TObject; Tag: TTag;
  const TagString: string; TagParams: TStrings; var ReplaceText: string);
begin
  ReplaceText := 'data da codice';
end;

procedure TFormProgetti.TabSheet3Enter(Sender: TObject);
begin
  Button1Click( Button1 );
end;


procedure TFormProgetti.WebDispatcher1AfterDispatch(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
var
  m: string;
  i: integer;
begin
  m := '';
  for i := 0 to Request.ContentFields.Count-1 do begin
    m := m + Request.ContentFields[i]+#13+#10;
  end;
  ShowMessage( 'after'+#13+#10+m );
end;


procedure TFormProgetti.WebDispatcher1BeforeDispatch(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
var
  m: string;
  i: integer;
begin
  m := '';
  for i := 0 to Request.ContentFields.Count-1 do begin
    m := m + Request.ContentFields[i]+#13+#10;
  end;
  ShowMessage( 'before'+#13+#10+m );
  Response.Content := DataSetTableProducer1.Content;
end;

procedure TFormProgetti.WebDispatcher1Create(Sender: TObject);
begin
  ShowMessage( 'WebDispatcher1Create' );
end;

function TFormProgetti.CreaHTML( pQuery, pQueryDettaglioOre: TADOQuery ): boolean;
var
  sl: TStringList;
  old_Prefisso: string;
  old_idprogetto: integer;
  old_idprogettodettaglio: string;
  mEvidenzia: string;
  mTotaleOre, mTotaleOreProgetto: integer;
begin
  pQuery.Close;
  pQuery.Parameters[0].Value := DM.Get_Prefisso;
  pQuery.ExecSQL; pQuery.Open;

  pQueryDettaglioOre.Close;
  pQueryDettaglioOre.Parameters[0].Value := DM.Get_Prefisso;
  pQueryDettaglioOre.ExecSQL;
  pQueryDettaglioOre.Open;
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
          '<h2>elenco progetti elaborato il '+FormatDateTime('dd-mm-yyyy hh:MM:ss', Now)+'</h2>'+#13+#10+
          '<table>' );

  with pQuery do begin
    First;
    sl.Add('<tr>');
      sl.Add('<th class="centrato">'); sl.Add('prefisso'); sl.Add('</th>');
      sl.Add('<th class="centrato">'); sl.Add('id'); sl.Add('</th>');
      sl.Add('<th class="centrato">');; sl.Add('attivo'); sl.Add('</th>');
      sl.Add('<th>'); sl.Add('progetto'); sl.Add('</th>');
      sl.Add('<th class="centrato">' ); sl.Add('inizio'); sl.Add('</th>');
      sl.Add('<th class="centrato">' ); sl.Add('fine'); sl.Add('</th>');
      sl.Add('<th class="valuta">' ); sl.Add('Budget'); sl.Add('</th>');
    sl.Add('</tr>');
    while Not EoF do begin
      sl.Add( '<tr>' );
      sl.Add( '<td class="centrato">' );  sl.Add( FieldByName('prefisso').AsString ); sl.Add( '</td>' );
      sl.Add( '<td class="centrato">' );  sl.Add( FieldByName('idprogetto').AsString ); sl.Add( '</td>' );
      sl.Add( '<td class="centrato">' );  sl.Add( FieldByName('attivo').AsString ); sl.Add( '</td>' );
      sl.Add( '<td>' );  sl.Add( FieldByName('NomeProgetto').AsString ); sl.Add( '</td>' );
      sl.Add( '<td class="centrato">' );
        sl.Add( FormatDateTime('dd-mm-yyyy', FieldByName('inizio').AsDateTime ) );
      sl.Add( '</td>' );

      sl.Add( '<td class="centrato">' );
        sl.Add( FormatDateTime('dd-mm-yyyy', FieldByName('fine').AsDateTime ) );
      sl.Add( '</td>' );
      sl.Add( '<td class="valuta">' );
        //sl.Add( FieldByName('Budget').Value );
        sl.Add( FormatFloat(',#0', FieldByName('Budget').asFloat )+' €' );
      sl.Add( '</td>' );
      sl.Add( '</tr>' );
      Next;
    end;
  end;
  sl.Add('</table>');
  sl.Add('<br>');

  sl.Add( '<style>' );
  sl.Add( 'tr:nth-child(even) {}' );
  sl.Add( 'tr:nth-child(odd) {}' );
  sl.Add( '</style>' );

  mTotaleOre := 0;
  mTotaleOreProgetto := 0;
  sl.Add('<table>');
  with pQueryDettaglioOre do begin
    First;
    sl.Add('<tr>');
      sl.Add('<th class="centrato">'); sl.Add('prefisso'); sl.Add('</th>');
      sl.Add('<th class="centrato">'); sl.Add('id'); sl.Add('</th>');
      //sl.Add('<th>'); sl.Add('progetto'); sl.Add('</th>');
      sl.Add('<th>'); sl.Add('idprogettodettaglio'); sl.Add('</th>');
      sl.Add('<th>'); sl.Add('Descrizione Dettaglio Progetto'); sl.Add('</th>');
      sl.Add('<th class="centrato">' ); sl.Add('Ore a Budget'); sl.Add('</th>');
      sl.Add('<th>' ); sl.Add('Avatar'); sl.Add('</th>');
      sl.Add('<th class="valuta">' ); sl.Add('Totale Ore Erogate'); sl.Add('</th>');
    sl.Add('</tr>');

    old_Prefisso := '';
    old_idprogetto := 0;
    old_idprogettodettaglio := '';
    while Not EoF do begin
      if ((old_Prefisso <> FieldByName('prefisso').AsString) or
          (old_idprogetto <> FieldByName('idprogetto').AsInteger) or
          (old_idprogettodettaglio <> FieldByName('idprogettodettaglio').AsString)) then begin
        old_Prefisso           := FieldByName('prefisso').AsString;
        old_idprogetto         := FieldByName('idprogetto').AsInteger;
        old_idprogettodettaglio:= FieldByName('idprogettodettaglio').AsString;
        mEvidenzia := ' class="evidenzia"';
      end else begin
        mEvidenzia := '';
      end;
      sl.Add( '<tr'+mEvidenzia+'>' );
      if mEvidenzia = '' then begin
        sl.Add( '<td>&nbsp</td>' );
        sl.Add( '<td>&nbsp</td>' );
        sl.Add( '<td>&nbsp</td>' );
        sl.Add( '<td>&nbsp</td>' );
        sl.Add( '<td>&nbsp</td>' );
      end else begin
        sl.Add( '<td class="centrato">' ); sl.Add( FieldByName('prefisso').AsString ); sl.Add( '</td>' );
        sl.Add( '<td class="centrato">' ); sl.Add( FieldByName('idprogetto').AsString ); sl.Add( '</td>' );
        sl.Add( '<td>' );  sl.Add( FieldByName('idprogettodettaglio').AsString ); sl.Add( '</td>' );
        sl.Add( '<td>' );  sl.Add( FieldByName('DescProgettoDettaglio').AsString ); sl.Add( '</td>' );
        sl.Add( '<td class="valuta">' ); sl.Add( FormatFloat(',#0', FieldByName('OreDettaglio').asFloat ) ); sl.Add( '</td>' );
      end;
      sl.Add( '<td>' ); sl.Add( FieldByName('avatar').AsString ); sl.Add( '</td>' );
      sl.Add( '<td class="valuta">' ); sl.Add( FormatFloat(',#0', FieldByName('TotaleOre').asFloat ) ); sl.Add( '</td>' );

      sl.Add( '</tr>' );
      mTotaleOreProgetto := mTotaleOreProgetto + FieldByName('TotaleOre').asInteger;

      mTotaleOre := mTotaleOre + mTotaleOreProgetto;

      Next;
      if ((old_Prefisso <> FieldByName('prefisso').AsString) or
          (old_idprogetto <> FieldByName('idprogetto').AsInteger) or
          EoF) then begin
      // mi chiedo se devo stampare il totale progetto
        sl.Add( '<tr'+mEvidenzia+'>' );
        sl.Add( '<td>&nbsp</td>' );
        sl.Add( '<td>&nbsp</td>' );
        sl.Add( '<td>&nbsp</td>' );
        sl.Add( '<td>&nbsp</td>' );
        sl.Add( '<td>&nbsp</td>' );
        sl.Add( '<td class="valuta">Totale Progetto ['+IntToStr(old_idprogetto)+']</td>' );
        sl.Add( '<td class="valuta">' ); sl.Add( FormatFloat(',#0', mTotaleOreProgetto ) ); sl.Add( '</td>' );
        sl.Add( '</tr>' );
        mTotaleOreProgetto := 0;
      end;
    end;
    mEvidenzia := ' class="evidenzia"';
    sl.Add( '<tr'+mEvidenzia+'>' );
    sl.Add( '<td>&nbsp</td>' );
    sl.Add( '<td>&nbsp</td>' );
    sl.Add( '<td>&nbsp</td>' );
    sl.Add( '<td>&nbsp</td>' );
    sl.Add( '<td>&nbsp</td>' );
    sl.Add( '<td class="totalegenerale">Totale Generale</td>' );
    sl.Add( '<td class="totalegenerale">' ); sl.Add( FormatFloat(',#0', mTotaleOre ) ); sl.Add( '</td>' );
    sl.Add( '</tr>' );
  end;
  sl.Add('</table>');
  sl.Add('</body>');
  sl.Add('</html>');
  sl.SaveToFile( 'elencoprogetti.html' );
  sl.Free;
  pQuery.Close;
  pQueryDettaglioOre.Close;
end;

procedure TFormProgetti.CreaListaUtenti;
var
  m: string;
  mId: integer;
begin
  elencoUtenti := TRamDeco.create;
  with DM.ADOTableLOGIN do begin
    if Not Active then Open;
    First;
    while Not EoF do begin
      m := Trim( FieldByName('avatar').asString );
      if (Trim(FieldByName('datachiusura').asString) <> '') then begin
        m := m + ' ('+Trim(FieldByName('datachiusura').asString)+' )';
      end;
      mId := FieldByName('id').asInteger;
      // ShowMessage( 'elencoUtenti.Add '+m );
      // elencoUtenti.Add(  m );
      elencoUtenti.add( mId, 0, 0, m );
      Next;
    end;
    Close;
  end;
  elencoUtenti.sort;
end;

function TFormProgetti.descrizioneAvatar( pId: integer ): string;
begin
  Result := elencoUtenti.DescOfId( pId );
end;

end.
