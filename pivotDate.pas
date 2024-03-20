unit pivotDate;

interface uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ComCtrls;

  function FormattaDataQry( pData: TDateTime ): string;
  function FormattaDataQryData( pData: TDate ): string;

  function PrimoDelMese( pData: TDateTime ): TDateTime;
  function UltimoDelMese( pData: TDateTime ): TDateTime;

  function PrimoVenerdi( pData: TDate ): TDate;
  function PrimoGiovedi( pData: TDate ): TDate;
  function PrimoMercoledi( pData: TDate ): TDate;

  function GiorniAnno( pData: TDate ): integer;
  function GiorniDalPrimoDellAnno( pData: TDate ): integer;

  function GetData( pAnno, pNumeroDelGiorno: word ): string;
  function GetMese( pAnno, pNumeroDelGiorno: word ): string;
  function GetGiorno( pAnno, pNumeroDelGiorno: word ): string;

implementation uses DateUtils;
var
  gloFormatSettings: TFormatSettings;
  mFSID: Integer;

function FormattaDataQryData( pData: TDate ): string;
var
  mFormatSettings: TFormatSettings;
  m1: Integer;
begin
  // showMessage( DateToStr( pData ) + #13+#10 + TimeToStr(pData) );
  SysUtils.GetLocaleFormatSettings(m1,mFormatSettings);
  mFormatSettings.DateSeparator   := '-';
  mFormatSettings.TimeSeparator   := ':';
  mFormatSettings.LongDateFormat  := 'yyyy-mm-dd';
  mFormatSettings.LongTimeFormat  := 'hh:NN:ss';
  mFormatSettings.ShortDateFormat := 'yyyy-mm-dd';
  mFormatSettings.ShortTimeFormat := 'hh:NN:ss';

  // va bene per sqlserver
  Result := 'CONVERT(DATETIME, '''+FormatDateTime('yyyy-mm-dd',pData,mFormatSettings)+''', 120)';
end;

function FormattaDataQry( pData: TDateTime ): string;
var
  mFormatSettings: TFormatSettings;
  m1: Integer;
begin
  // showMessage( DateToStr( pData ) + #13+#10 + TimeToStr(pData) );
  SysUtils.GetLocaleFormatSettings(m1,mFormatSettings);
  mFormatSettings.DateSeparator   := '-';
  mFormatSettings.TimeSeparator   := ':';
  mFormatSettings.LongDateFormat  := 'yyyy-mm-dd';
  mFormatSettings.LongTimeFormat  := 'hh:NN:ss';
  mFormatSettings.ShortDateFormat := 'yyyy-mm-dd';
  mFormatSettings.ShortTimeFormat := 'hh:NN:ss';

  // MySql
  Result := ''+FormatDateTime('yyyy/mm/dd hh:NN:ss', pData)+'';
  // va bene per sqlserver
  //Result := 'CONVERT(DATETIME, '''+FormatDateTime('yyyy-mm-dd hh:NN:ss',pData,mFormatSettings)+''', 120)';
end;

function GetData( pAnno, pNumeroDelGiorno: word ): string;
var
  currData, tmpData: TDateTime;
  mR: string;
begin
  tmpData :=  DateUtils.StartOfADay(pAnno,pNumeroDelGiorno);
  mR := gloFormatSettings.ShortDayNames[ DateUtils.DayOfTheWeek( tmpData ) ];
  Result := mR;
end;

function GetMese( pAnno, pNumeroDelGiorno: word ): string;
var
  currData, tmpData: TDateTime;
  mYear: word;
  mGG: word;
  myYear, myMonth, myDay: word;
  mR: string;
begin
  tmpData := Now;
  mGG := 1;
  mYear := pAnno;
  currData := System.SysUtils.EncodeDate( pAnno,1,1 );
  while DateUtils.YearOf( currData ) = mYear do begin
    if mGG = pNumeroDelGiorno then begin
      tmpData := currData;
      break;
    end else begin
      currData := DateUtils.IncDay( currData, 1 );
      mGG := mGG + 1;
    end;
  end;
  System.SysUtils.DecodeDate(tmpData, myYear, myMonth, myDay );
  mR := gloFormatSettings.ShortMonthNames[ myMonth ];
  Result := mR;
end;

function GetGiorno( pAnno, pNumeroDelGiorno: word ): string;
var
  currData, tmpData: TDateTime;
  mYear: word;
  mGG: word;
  myYear, myMonth, myDay: word;
  mR: string;
begin
  tmpData := System.SysUtils.EncodeDate( pAnno,1,1 );
  mGG := 1;
  mYear := pAnno;
  currData := System.SysUtils.EncodeDate( pAnno,1,1 );
  while DateUtils.YearOf( currData ) = mYear do begin
    if mGG = pNumeroDelGiorno then begin
      tmpData := currData;
      break;
    end else begin
      currData := DateUtils.IncDay( currData, 1 );
      mGG := mGG + 1;
    end;
  end;
  System.SysUtils.DecodeDate(tmpData, myYear, myMonth, myDay );
  mR := copy(IntToStr(100+myDay),2,2)+'&#8729;'+
        copy(IntToStr(100+myMonth),2,2)+'&#8729;'+
        copy(IntToStr(myYear),3,2);
  Result := mR;
end;

function PrimoDelMese( pData: TDateTime ): TDateTime;
var
  m: TDateTime;
begin
  m := pData;
  m := DateUtils.StartOfTheMonth( m );
  Result := m;
end;

function UltimoDelMese( pData: TDateTime ): TDateTime;
var
  m: TDateTime;
begin
  m := pData;
  m := DateUtils.EndOfTheMonth( m );
  Result := m;
end;

function PrimoVenerdi( pData: TDate ): TDate;
var
  m: TDate;
begin
  m := pData;
  while 5 <> DateUtils.DayOfTheWeek( m ) do begin
    m := DateUtils.IncDay( m );
  end;
  Result := m;
end;

function PrimoGiovedi( pData: TDate ): TDate;
var
  m: TDate;
begin
  m := pData;
  while 4 <> DateUtils.DayOfTheWeek( m ) do begin
    m := DateUtils.IncDay( m );
  end;
  Result := m;
end;

function PrimoMercoledi( pData: TDate ): TDate;
var
  m: TDate;
begin
  m := pData;
  while 3 <> DateUtils.DayOfTheWeek( m ) do begin
    m := DateUtils.IncDay( m );
  end;
  Result := m;
end;

function GiorniAnno( pData: TDate ): integer;
var
  mYear: word;
  mDay, mGG: integer;
  currData: TDateTime;
begin
  mGG := 0;
  mYear := DateUtils.YearOf( pData );
  currData := System.SysUtils.EncodeDate( mYear,1,1 );
  while DateUtils.YearOf( currData ) = mYear do begin
    currData := DateUtils.IncDay( currData, 1 );
    mGG := mGG + 1;
  end;

  Result := mGG;
end;

function GiorniDalPrimoDellAnno( pData: TDate ): integer;
var
  mYear: word;
  mDay, mGG: integer;
  currData: TDateTime;
begin
  mGG := 0;
  mYear := DateUtils.YearOf( pData );
  currData := System.SysUtils.EncodeDate( mYear,1,1 );
  while currData <= pData do begin
    currData := DateUtils.IncDay( currData, 1 );
    mGG := mGG + 1;
  end;

  Result := mGG;
end;

initialization
  SysUtils.GetLocaleFormatSettings(mFSID,gloFormatSettings);
  gloFormatSettings.DateSeparator   := '-';
  gloFormatSettings.TimeSeparator   := ':';
  gloFormatSettings.LongDateFormat  := 'dd-mm-yyyy dddd';
  gloFormatSettings.LongTimeFormat  := 'hh:nn:ss';
  gloFormatSettings.ShortDateFormat := 'dd-mm-yyyy';
  gloFormatSettings.ShortTimeFormat := 'hh:nn:ss';

  gloFormatSettings.ShortDayNames[1] := 'lun'; gloFormatSettings.LongDayNames[1] := 'domenica';
  gloFormatSettings.ShortDayNames[2] := 'mar'; gloFormatSettings.LongDayNames[2] := 'lunedi';
  gloFormatSettings.ShortDayNames[3] := 'mer'; gloFormatSettings.LongDayNames[3] := 'martedi';
  gloFormatSettings.ShortDayNames[4] := 'gior'; gloFormatSettings.LongDayNames[4] := 'mercoledi';
  gloFormatSettings.ShortDayNames[5] := 'ven'; gloFormatSettings.LongDayNames[5] := 'giovedi';
  gloFormatSettings.ShortDayNames[6] := 'sab'; gloFormatSettings.LongDayNames[6] := 'venerdi';
  gloFormatSettings.ShortDayNames[7] := 'dom'; gloFormatSettings.LongDayNames[7] := 'sabato';
  gloFormatSettings.ShortMonthNames[1] := 'gen';
  gloFormatSettings.ShortMonthNames[2] := 'feb';
  gloFormatSettings.ShortMonthNames[3] := 'mar';
  gloFormatSettings.ShortMonthNames[4] := 'apr';
  gloFormatSettings.ShortMonthNames[5] := 'mag';
  gloFormatSettings.ShortMonthNames[6] := 'giu';
  gloFormatSettings.ShortMonthNames[7] := 'lug';
  gloFormatSettings.ShortMonthNames[8] := 'ago';
  gloFormatSettings.ShortMonthNames[9] := 'set';
  gloFormatSettings.ShortMonthNames[10]:= 'ott';
  gloFormatSettings.ShortMonthNames[11]:= 'nov';
  gloFormatSettings.ShortMonthNames[12]:= 'dic';

end.

