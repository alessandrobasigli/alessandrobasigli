unit u_INI;
{  >>> 17ott96: è IMPORTANTE leggersi attentamente la Inizialization part.

  Apre automaticamente un .INI con lo stesso nome del .EXE nella directory corrente
  creando l' oggetto puntoIni; se qui non c'è, lo cerca nella directory del .EXE;
  si può usare un altro nome per il .INI specificando sulla riga di comando del .EXE
  un parametro del tipo INI=<nomeDelPuntoIni>; se quest' ultimo comincia con un
  '\' (backSlash) oppure contiene ':' (duePunti) allora estrae la path e la usa al
  posto della directory corrente; se qui non c'è, lo cerca nella directory del .EXE;
  sulla riga di comando si possono specificare altri parametri del tipo
  [Section]Ident=XXX: questi valori avranno la priorità su quanto contenuto nel .INI.

  Questioni aperte:
  - OCCHIO che la riga di comando non può superare i 128 caratteri !!!
  - se apriamo altri .INI, i parametri del tipo [Section]Ident=XXX valgono per tutti !
  - le TPuntoIni.readXXX accedono sempre ai parametriDellExe, per cui le form che usano
    pesantemente i valori dovrebbero leggerli in creazione una volta per tutte;
  - bisogna ricordarsi di chiamare la fineDeiGiochi quando i .INI non servono più;
}
interface uses iniFiles, Classes, sysUtils,Dialogs,Forms;
type TPuntoIni = class(TIniFile)
  PathBmp: String;
  constructor create(pNome: string);
  function readInteger(const Section, Ident: string; default: longInt): longInt; {override}
  function readString(const Section, Ident: string; default: string): string; {override}
  function readBool(const Section, Ident: string; default: boolean): boolean; {override}
  function readPassword(const Section, Ident: string; default: string): string; {override}
end;
procedure fineDeiGiochi;
var
  pathDelPuntoIni, nomeDelPuntoIni: string;
  puntoIni: TPuntoIni;

implementation
var
  parametriDellExe: TStringList;
  puntiIni: TList;
  i: integer;

constructor TPuntoIni.create(pNome: string);
begin
  inherited create(pNome);
  puntiIni.add(self);
  PathBmp := ReadString('Sfondi','PathBmp','');
  if (PathBmp<>'') and (copy(PathBmp,length(PathBmp),1)<>'\') then
    PathBmp := PathBmp+'\';
end;
function TPuntoIni.readInteger(const Section, Ident: string; default: longInt): longInt;
var s: string;
begin
  s := parametriDellExe.values['[' + section + ']' + Ident];
  if s <> '' then try
    result := strToInt(s);
  except
    result := default;
  end else result := inherited readInteger(Section, Ident, default);
end;
function TPuntoIni.readString(const Section, Ident: string; default: string): string;
begin
  result := parametriDellExe.values['[' + section + ']' + Ident];
  if result = '' then result := inherited readString(Section, Ident, default);
end;
function TPuntoIni.readPassword(const Section, Ident: string; default: string): string; {override}
var
  o, mResult: string;
  i, l: integer;
begin
  result := parametriDellExe.values['[' + section + ']' + Ident];
  if result = '' then result := inherited readString(Section, Ident, default);

  if result <> '' then begin
    o := result;
    l := length(o);
    mResult := '';
    for i := l downto 1 do begin
      mResult := mResult + copy(o,i,1);
    end;
    //ShowMessage( 'mResult length='+IntToStr(l)+#13+#10+mResult );
    result := mResult;
  end;
end;

function TPuntoIni.readBool(const Section, Ident: string; default: boolean): boolean;
var s: string;
begin
  s := parametriDellExe.values['[' + section + ']' + Ident];
  if s <> '' then try
    result := not (compareText(s, 'NO') = 0);
  except
    result := default;
  end else result := inherited readBool(Section, Ident, default);
end;

procedure fineDeiGiochi;
var i: integer;
begin
  with puntiIni do begin
    for i := 0 to count - 1 do TPuntoIni(items[i]).free;
    clear; free;
  end;
  with parametriDellExe do begin
    clear; free;
  end;
end;

initialization
  puntiIni := TList.create;
  parametriDellExe := TStringList.create;
  for i := 1 to paramCount do parametriDellExe.add(paramStr(i));
  nomeDelPuntoIni := parametriDellExe.values['INI'];
  if nomeDelPuntoIni = '' then begin
    {per default il .INI si chiama come il .EXE}
    nomeDelPuntoIni := changeFileExt(extractFileName(application.ExeName), '.INI');
  end;
  if not ((nomeDelPuntoIni[1] = '\') or (pos(':', nomeDelPuntoIni) <> 0)) then begin
    {per default il .INI si sta nella directory corrente}
    getDir(0, pathDelPuntoIni);
  end else begin
    pathDelPuntoIni := extractFilePath(nomeDelPuntoIni); {\}
    nomeDelPuntoIni := extractFileName(nomeDelPuntoIni);
  end;
  if not fileExists(pathDelPuntoIni + nomeDelPuntoIni) then begin
    {se non sta nella directory corrente, cerchiamolo dov'è il .EXE}
    pathDelPuntoIni := extractFilePath(paramStr(0));
  end;
  if copy(pathDelPuntoIni,Length(pathDelPuntoIni),1)<>'\' then
    pathDelPuntoIni := pathDelPuntoIni+'\';

  //showMessage('CARICATO IL FILE :'+#13+#10+pathDelPuntoIni+nomeDelPuntoIni);
  
  puntoIni := TPuntoIni.create(pathDelPuntoIni + nomeDelPuntoIni);

finalization
  FineDeiGiochi;
end.
