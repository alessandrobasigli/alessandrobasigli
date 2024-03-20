unit uCancellaLOG;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Winapi.WebView2, Winapi.ActiveX,
  Web.HTTPApp, Web.HTTPProd, Vcl.Edge, Vcl.OleCtrls, SHDocVw,
  Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls, Data.DB, Data.Win.ADODB, Vcl.Grids,
  Vcl.DBGrids;

type
  TFormCancellaLOG = class(TForm)
    Panel1: TPanel;
    EditTABLENAME: TEdit;
    Label1: TLabel;
    ButtonCancella: TButton;
    DateTimePicker1: TDateTimePicker;
    Label2: TLabel;
    Label3: TLabel;
    DateTimePicker2: TDateTimePicker;
    Memo: TMemo;
    ADOQueryDELETE: TADOQuery;
    dsDELETE: TDataSource;
    Label4: TLabel;
    ComboBox1: TComboBox;
    procedure ButtonCancellaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure EditTABLENAMEChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCancellaLOG: TFormCancellaLOG;
  mBoot: boolean;

implementation uses uDM, pivotDate, DateUtils;

{$R *.dfm}

procedure TFormCancellaLOG.ButtonCancellaClick(Sender: TObject);
var
  mQry, mData1, mData2: string;
  r, i: integer;
begin
  with ADOQueryDELETE do begin
    Close;
    SQL.Clear;
    mQry := 'DELETE FROM log WHERE ';
    if Trim(EditTABLENAME.Text) <> '' then begin
      mQry := mQry +#13+#10+ ' tablename like '+''''+Trim(EditTABLENAME.Text)+'%'+'''';
    end;
    mQry := mQry +#13+#10+' AND avatar = '+''''+ComboBox1.Text+'''';

    mData1 := ''''+pivotDate.FormattaDataQry( DateTimePicker1.DateTime )+'''';
    mData2 := ''''+pivotDate.FormattaDataQry( DateTimePicker2.DateTime )+'''';
    mQry := mQry +#13+#10+' AND dataora >= '+mData1+#13+#10+' AND dataora <= '+mData2;
    SQL.Add( mQry );

    Memo.Lines.Clear;
    Memo.Lines.Add( mQry );

    ExecSql;
  end;
end;

procedure TFormCancellaLOG.EditTABLENAMEChange(Sender: TObject);
begin
  ButtonCancella.Enabled := (EditTABLENAME.Text <> '');
end;

procedure TFormCancellaLOG.FormActivate(Sender: TObject);
var
  mData, mData1, mData2: TDateTime;
  m: string;
begin
  if mBoot then begin
    mData := System.SysUtils.IncMonth(Now,-1);

    mBoot := False;
    (*
    ComboBox1.Items.Clear;
    // tutti gli utenti
    with ADOQueryDELETE do begin
      Close;
      SQL.Clear;
      m := 'SELECT avatar FROM login ORDER BY avatar';
      SQL.Add( m );
      ExecSQL; Open; First;
      while Not EoF do begin
        ComboBox1.Items.Add( Trim(FieldByName('avatar').AsString) );
        Next;
      end;
      Close;
      SQL.Clear;
    end;
    *)
    // solo gli utenti presenti nel log
    ComboBox1.Items.Clear;
    with ADOQueryDELETE do begin
      Close;
      SQL.Clear;
      m := 'SELECT DISTINCT avatar FROM log ORDER BY avatar';
      SQL.Add( m );
      ExecSQL; Open; First;
      while Not EoF do begin
        ComboBox1.Items.Add( Trim(FieldByName('avatar').AsString) );
        Next;
      end;
      Close;
      SQL.Clear;
    end;

    ComboBox1.ItemIndex := 0;
    mData1 := pivotDate.PrimoDelMese( mData );
    mData2 := pivotDate.UltimoDelMese( mData );

    DateTimePicker1.DateTime := mData1;
    DateTimePicker2.DateTime := mData2;
  end;
end;

procedure TFormCancellaLOG.FormCreate(Sender: TObject);
begin
  mBoot := True;
end;

end.
