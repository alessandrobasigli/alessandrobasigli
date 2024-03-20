unit uDeco;

interface uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.ControlList, System.Actions, Vcl.ActnList, System.ImageList, Vcl.ImgList,
  Vcl.Grids, Vcl.VirtualImage, Vcl.Menus, Vcl.TitleBarCtrls,
  Data.DB, Data.Win.ADODB, Vcl.DBCtrls, Vcl.DBGrids, Vcl.WinXCtrls,
  Vcl.WinXCalendars, Vcl.ComCtrls, Vcl.Buttons, Vcl.Imaging.jpeg;

type

  TElemento = class
  private
    fId, fIdSUp, fKind: longInt;
    fDesc: String;
    constructor create(Id, IdSup, Kind: longInt; Desc: string);
    destructor Destroy; override;
  public
    property Id: longInt read fId;
    property IdSup: longInt read fIdSup;
    property Kind: longInt read fKind write fKind;
    property Desc: string read fDesc write fDesc;
  end;
  TRamDeco = class
  private
    fReady: boolean;
    xId: TList;
    // xIdSupDesc: TList;
    xDesc: TStringList;
    function findId(Id: longInt; var index: longInt): boolean;
  public
    constructor create;
    destructor Destroy; override;
    procedure clear;
    procedure add(Id, IdSup, Kind: longInt; Desc: string);
    procedure sort;
    function IdSupOfId(Id: longInt): longInt;
    function DescOfId(Id: longInt): string;
    function IdOfDesc(Desc: String): longInt;
    procedure allDescs(ss: TStrings);
    procedure DescsOfIdSup(IdSup: longInt; ss: TStrings);
    procedure setKind(Id, Kind: longInt);
    procedure setAllKind(Kind: longInt);
    function getKind(Id: longInt): longInt;
    procedure DescsOfKind(kind: longInt; ss: TStrings);
    procedure refreshOrAdd(Id, IdSup, Kind: longInt; Desc: string);
  end;

procedure ComboCerca(Sender: TObject; var key: word);
procedure QuickenCerca(Sender: TObject; var key: char);

implementation

function compareByImmediateId(Item1: Pointer; Id2: longInt): integer;
var Id1: longInt;
begin
  Id1 := TElemento(Item1).Id;
  if Id1 > Id2 then result := 1 else if Id1 < Id2 then result := -1 else result := 0;
end;
function compareById(Item1, Item2: Pointer): integer;
var Id2: longInt;
begin
  Id2 := TElemento(Item2).Id;
  result := compareByImmediateId(Item1, Id2);
end;
function compareByIdSupDesc(Item1, Item2: Pointer): integer;
var Id1, Id2: longInt; s1, s2: string;
begin
  with TElemento(Item1) do begin Id1 := IdSup; s1 := Desc; end;
  with TElemento(Item2) do begin Id2 := IdSup; s2 := Desc; end;
  if Id1 > Id2 then result := 1 else if Id1 < Id2 then result := -1 else begin
    result := AnsiCompareText(s1, s2);
  end;
end;

// TElemento

constructor TElemento.create(Id, IdSup, Kind: longInt; Desc: string);
begin
  inherited create; fId := Id; fIdSup := IdSup; fKind := Kind; fDesc := Desc;
end;

destructor TElemento.Destroy;
begin
  fDesc := ''; inherited destroy;
end;

// TRamDeco

constructor TRamDeco.create;
begin
  inherited create;
  fReady := false;
  xId := TList.create;
  // xIdSupDesc := TList.create;
  xDesc := TStringList.create;   xDesc.sorted := false;
end;

destructor TRamDeco.Destroy;
begin
  clear; xId.free;
  // xIdSupDesc.free;
  xDesc.free;
end;

procedure TRamDeco.Clear;
var i: longInt;
begin
  if xId <> nil then xId.clear;
  // if xIdSupDesc <> nil then xIdSupDesc.clear;
  if xDesc <> nil then with xDesc do begin
    sorted := False; {7lug97}
    for i := 0 to count - 1 do TRamDeco(objects[i]).free;
    clear;
  end;
end;

procedure TRamDeco.add(Id, IdSup, Kind: longInt; Desc: string);
var mE: TElemento;
begin fReady := false;
  mE := TElemento.create(Id, IdSup, Kind, Desc);
  xId.add(mE);
  // xIdSupDesc.add(mE);
  xDesc.addObject(Desc, mE);
end;

procedure TRamDeco.sort;
begin
  try
    xId.sort(compareById);
    // xIdSupDesc.sort(compareByIdSupDesc);
    xDesc.sort;
    fReady := true;
  except
    fReady := false;
  end;
end;

function TRamDeco.findId(Id: longInt; var index: longInt): boolean;
var L, H, I, C: longInt;
begin result := false;
  if not fReady then raise Exception.create('Elenco non pronto.');
  L := 0;
  H := xDesc.count - 1;
  while L <= H do begin
    I := (L + H) shr 1;
    C := compareByImmediateId(xId.items[i], Id);
    if C < 0 then L := I + 1 else begin
      H := I - 1;
      if C = 0 then begin
        result := true; L := I; { se non accetta duplicati }
      end;
    end;
  end;
  index := L;
end;

function TRamDeco.IdSupOfId(Id: longInt): longInt;
var i: longInt;
begin result := 0;
  if findId(Id, i) then result := TElemento(xId.items[i]).IdSup;
end;
function TRamDeco.DescOfId(Id: longInt): string;
var i: longInt;
begin result := '';
  if findId(Id, i) then result := TElemento(xId.items[i]).Desc;
end;

function TRamDeco.IdOfDesc(Desc: String): longInt;
var i: Integer; trovato: boolean;
begin result := -1; trovato := xDesc.find(Desc, i);
  if {(i >=0) and (i < xDesc.count)} trovato then result := TElemento(xDesc.objects[i]).Id;
end;

procedure TRamDeco.allDescs(ss: TStrings);
var i: longInt; mE: TElemento;
begin
  with ss do begin
    clear;
    for i := 0 to xDesc.count - 1 do begin
      mE := TElemento(xDesc.objects[i]);
      addObject(mE.desc, mE);
    end;
  end;
end;

procedure TRamDeco.DescsOfIdSup(IdSup: longInt; ss: TStrings);
var i: longInt; mE: TElemento;
begin
  with ss do begin
    clear;
    for i := 0 to xDesc.count - 1 do begin
      mE := TElemento(xDesc.objects[i]);
      if mE.IdSup = IdSup then addObject(mE.Desc, mE);
    end;
  end;
end;

procedure TRamDeco.setKind(Id, Kind: longInt);
var i: longInt;
begin
  if findId(Id, i) then TElemento(xId.items[i]).kind := kind;
end;
procedure TRamDeco.setAllKind(Kind: longInt);
var i: longInt;
begin
  for i := 0 to xId.count - 1 do begin
    TElemento(xId.items[i]).Kind := Kind;
  end;
end;

function TRamDeco.getKind(Id: longInt): longInt;
var i: longInt;
begin result := 0;
  if findId(Id, i) then result := TElemento(xId.items[i]).kind;
end;
procedure TRamDeco.DescsOfKind(kind: longInt; ss: TStrings);
var i: longInt; mE: TElemento;
begin
  with ss do begin
    clear;
    for i := 0 to xDesc.count - 1 do begin
      mE := TElemento(xDesc.objects[i]);
      if mE.kind = kind then addObject(mE.Desc, mE);
    end;
  end;
end;

procedure TRamDeco.refreshOrAdd(Id, IdSup, Kind: longInt; Desc: string);
var index:longInt; i: integer; mE: TElemento;
begin
  if findId(Id, index) then begin // refresh
    mE := TElemento(xId.items[index]);
    if xDesc.find(mE.desc, i) then begin
      xDesc.sorted := false;
      xDesc.strings[i] := desc;
      xDesc.sort;
      mE.desc := desc;
    end else raise Exception.create('TRamDeco.refreshOrAdd: xDesc non trova ' + mE.desc);
  end else begin // add
    xDesc.sorted := false;
    add(Id, IdSup, Kind, Desc);
    sort;
  end;
end;

// ComboCerca

procedure ComboCerca(Sender: TObject; var key: word);
var sText: string;
  function ciclo(inizio, fine: longInt): boolean;
  var i,k, startPos, endPos: longInt;
  begin result := false;
    with Sender as TComboBox do for i := inizio to fine do begin
      k := pos(sText, upperCase(items.strings[i]));
      if k <> 0 then begin
        result := true; itemIndex := i; setFocus;
        startPos := k - 1; endPos := startPos + length(sText);
        SendMessage(Handle, CB_SETEDITSEL, 0, MAKELPARAM(StartPos, EndPos));
        break;
      end;
    end;
  end;
begin
  if Key = vk_return then with Sender as TComboBox do begin
    sText := upperCase(selText);
    if sText = '' then sText := upperCase(text);
    if sText <> '' then begin
      if not ciclo(itemIndex + 1, items.count - 1) then begin
        ciclo(0, itemIndex);
      end;
    end;
  end;
end;

// QuickenCerca

procedure QuickenCerca(Sender: TObject; var key: char);
var s: string;
begin
  if key >= ' ' then with Sender as TComboBox do begin
    selText := key; key := chr(0); s := text;
    SendMessage(Handle, CB_SELECTSTRING, itemIndex, longInt(pchar(s)));
    if text = '' then text := s;
    SendMessage(Handle, CB_SETEDITSEL, 0, MAKELPARAM(length(s), length(text)));
  end;
end;

end.
