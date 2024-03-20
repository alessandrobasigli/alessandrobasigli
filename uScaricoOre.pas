unit uScaricoOre;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.DBCtrls, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Mask, Data.DB, Data.Win.ADODB, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls,
  Vcl.WinXPickers, Data.SqlExpr, Data.DBXMySQL, VCLTee.TeCanvas,
  VCLTee.TeeEdiGrad;

type
  TFormScaricoOre = class(TForm)
    ADOQueryPROGETTI: TADOQuery;
    dsADOQueryPROGETTI: TDataSource;
    ADOQuery1PROGETTIDET: TADOQuery;
    dsDET: TDataSource;
    ADOQuery1PROGETTIDETprefisso: TWideStringField;
    ADOQuery1PROGETTIDETidprogetto: TIntegerField;
    ADOQuery1PROGETTIDETidprogettodettaglio: TWideStringField;
    ADOQuery1PROGETTIDETdescrizione: TWideStringField;
    ADOQuery1PROGETTIDETdatainizio: TDateField;
    ADOQuery1PROGETTIDETdatafine: TDateField;
    ADOQuery1PROGETTIDETBudgetDettaglio: TFMTBCDField;
    ADOQuery1PROGETTIDETOreDettaglio: TIntegerField;
    ADOQuery1PROGETTIDETattivo: TWideStringField;
    EditIDPROGETTO: TEdit;
    EditSOTTOPROGETTO: TEdit;
    EditORE: TEdit;
    MemoNOTE: TMemo;
    DatePicker: TDatePicker;
    bNuovoInserimento: TButton;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    LabelDescProgetto: TLabel;
    LabelDescrizioneSottoProgetto: TLabel;
    Label1: TLabel;
    ADOQueryNUOVO: TADOQuery;
    Label2: TLabel;
    LabelAvatar: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure EditIDPROGETTOKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditSOTTOPROGETTOKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditSOTTOPROGETTOExit(Sender: TObject);
    procedure bNuovoInserimentoClick(Sender: TObject);
    procedure EditIDPROGETTOExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure NuovoScaricoOre;
  end;

var
  FormScaricoOre: TFormScaricoOre;
  mBoot: boolean;

implementation uses uDM, uSceltaProgetto, uSceltaSottoProgetto;

{$R *.dfm}

procedure TFormScaricoOre.NuovoScaricoOre;
begin
  //EditPREFISSO.Text := DM.Get_Prefisso;
  //EditIDORA.Text := '';
  //EditIDORA.TextHint := 'assegnato automaticamente';

  DatePicker.Date := Now;

  EditIDPROGETTO.Text := '';
  EditSOTTOPROGETTO.Text := '';

  EditORE.Text := '';

  MemoNOTE.Lines.Clear;

  LabelDescProgetto.Caption := '';
end;

procedure TFormScaricoOre.bNuovoInserimentoClick(Sender: TObject);
var
  mQry, mQryNote, mData: string;
  i, f: integer;
  newBT: integer;
  //mLCID: Integer; mFS: TFormatSettings; mDC, mTS: char;
begin
  // qry di inserimento su ScaricoOre
  //GetLocaleFormatSettings(mLCID, mFS);
  //mDC := '.';
  //mFS.DecimalSeparator := mDC;

  //mData := 'CONVERT(DATETIME, '+''''+FormatDateTime('yyyy/mm/dd',DatePicker.Date)+''''+', 102)';
  mData := ''''+FormatDateTime('yyyy/mm/dd',DatePicker.Date)+'''';
  // mQry := 'INSERT INTO `progetti`.`scaricoore` '+
  mQry := 'INSERT INTO scaricoore '+
          '(`prefisso`, '+'`id-login`,'+'`data`,'+
          '`idprogetto`,'+'`idprogettodettaglio`,'+
          '`ore`,'+'`note`) '+
          'VALUES ';
  mQry := mQry + '('+''''+DM.Get_Prefisso+''''+','+
                    IntToStr(DM.Get_idlogin)+','+
                    mData+','+
                    EditIDPROGETTO.Text+','+
                    ''''+EditSOTTOPROGETTO.Text+''''+','+
                    EditORE.Text+',';
  mQryNote := '';
  for i := 0 to MemoNOTE.Lines.Count-1 do begin
    mQryNote := mQryNote + MemoNOTE.Lines[i];
    if i <> MemoNOTE.Lines.Count-1 then begin
      mQryNote := mQryNote + chr(13)+chr(10);
    end;
  end;
  mQry := mQry + '''' + mQryNote + '''' +')';
  f := 0;

  //newBT := DM.ADOConnectionDM.BeginTrans;
  //ShowMessage('BeginTrans = '+IntToStr(newBT));
  try
    //DM.SQLConnection1.Execute('SET AUTOCOMMIT=0', nil);
    with ADOQueryNUOVO do begin
      Close;
      SQL.Clear;
      SQL.Add( mQry );
      f := ExecSQL;
      Close;
      SQL.Clear;
    end;
    //DM.ADOConnectionDM.CommitTrans;
    //DM.SQLConnection1.Execute('COMMIT', nil);
    //DM.SQLConnection1.Close;

    if (f<>1) then begin
      ShowMessage('inserimento non effettuato |');
    end else begin
      // ShowMessage( 'inserimento ok' );
      DM.Aggiungi_LOG( 'scaricoore', mQry);
      ModalResult := mrOK;
    end;
  except
    on e: exception do begin
      ShowMessage(mQry+#13+#10+e.Message);
      //DM.ADOConnectionDM.RollBackTrans; {on failure, undo the changes};
    end;
  end;
end;

procedure TFormScaricoOre.EditIDPROGETTOExit(Sender: TObject);
begin
  LabelDescProgetto.Caption := DM.Get_DescrizioneProgetto( DM.Get_Prefisso, StrToIntDef( EditIDPROGETTO.Text,0 ) );
end;

procedure TFormScaricoOre.EditIDPROGETTOKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  myForm: TFormSceltaProgetto;
  mPrefisso: string;
  mIdProgetto: longInt;
  mR: integer;
begin
  if Key = VK_F12 then begin
    mPrefisso   := DM.Get_Prefisso;
    mIdProgetto := StrToIntDef(EditIDPROGETTO.Text,0);

    myForm := TFormSceltaProgetto.Create(self);
    with myForm do begin
      //ShowMessage( mPrefisso+#13+#10+IntToStr(mIdProgetto));
      myForm.set_qry( mPrefisso, mIdProgetto );
      mR := ShowModal;
      if mR = mrOK then begin
        mPrefisso   := myForm.GetPrefisso;
        mIdProgetto := myForm.GetIdProgetto;
        LabelDescProgetto.Caption := myForm.GetNomeProgetto;

        EditIDPROGETTO.Text := IntToStr( mIdProgetto );
      end;
      free;
    end;
  end;
end;

procedure TFormScaricoOre.EditSOTTOPROGETTOExit(Sender: TObject);
begin
  LabelDescrizioneSottoProgetto.Caption := DM.Get_DescrizioneSottoProgetto( DM.Get_Prefisso, StrToIntDef( EditIDPROGETTO.Text,0 ), EditSOTTOPROGETTO.Text );
end;

procedure TFormScaricoOre.EditSOTTOPROGETTOKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  myForm: TFormSceltaSottoProgetto;
  mPrefisso: string;
  mIdProgetto: longInt;
  mIdProgettoDettaglio: string;
  mR: integer;
begin
  if Key = VK_F12 then begin
    mPrefisso            := DM.Get_Prefisso;
    mIdProgetto          := StrToIntDef(EditIDPROGETTO.Text,0);
    mIdProgettoDettaglio := EditSOTTOPROGETTO.Text;

    myForm := TFormSceltaSottoProgetto.Create(self);
    with myForm do begin
      //ShowMessage( 'FormSceltaSottoProgetto'+#13+#10+mPrefisso+#13+#10+IntToStr(mIdProgetto)+#13+#10+mIdProgettoDettaglio);
      myForm.set_qry( mPrefisso, mIdProgetto, mIdProgettoDettaglio );
      myForm.set_progetto( LabelDescProgetto.Caption );
      mR := ShowModal;
      if mR = mrOK then begin
        // mPrefisso            := myForm.GetPrefisso;
        // mIdProgetto          := myForm.GetIdProgetto;
        mIdProgettoDettaglio := myForm.GetSubProgetto;

        // DBEditIdProgetto.EditText := IntToStr( mIdProgetto );
        EditSOTTOPROGETTO.Text := mIdProgettoDettaglio;
      end;
      free;
    end;
  end;
end;

procedure TFormScaricoOre.FormActivate(Sender: TObject);
begin
  if mBoot then begin
    mBoot := False;

    //with ADOQueryPROGETTI do begin
    //  Close;
    //  Parameters[0].Value := DM.Get_Prefisso;
    //  Open; First;
    //end;
    //with ADOQuery1PROGETTIDET do begin
    //  Close;
    //  Parameters[0].Value := DM.Get_Prefisso;
    //  Parameters[1].Value := DM.ADOTableScaricoOreidprogetto.asInteger;
    //  Open; First;
    //end;

    LabelAvatar.Caption := DM.Get_avatar;
    NuovoScaricoOre;
  end;
end;

procedure TFormScaricoOre.FormCreate(Sender: TObject);
begin
  mBoot := True;
end;

end.
