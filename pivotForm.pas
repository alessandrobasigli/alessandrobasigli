unit pivotForm;

interface uses Vcl.Dialogs;

  procedure GestioneProgetti;
  procedure GestioneCancellaLOG;
  procedure ScaricoOre;
  procedure GestioneStatistiche;
  procedure GestioneUtenti;

implementation uses uDM, uGestioneProgetti, uCancellaLOG, uScaricoOre,
                         uStatistiche, uGestioneUtenti;

procedure GestioneProgetti;
var
  myFormProgetti: TFormProgetti;
begin
  myFormProgetti := TFormProgetti.Create( nil );
  with myFormProgetti do try
    ShowModal;
  finally
    free;
  end;
end;

procedure GestioneCancellaLOG;
var
  myForm: TFormCancellaLOG;
begin
  myForm := TFormCancellaLOG.Create( nil );
  with myForm do try
    ShowModal;
  finally
    free;
  end;
end;

procedure ScaricoOre;
var
  myForm: TFormScaricoOre;
begin
  myForm := TFormScaricoOre.Create( nil );
  with myForm do try
    ShowModal;
  finally
    free;
  end;
end;

procedure GestioneStatistiche;
var
  myForm: TFormStatistiche;
begin
  myForm := TFormStatistiche.Create( nil );
  with myForm do try
    ShowModal;
  finally
    free;
  end;
end;

procedure GestioneUtenti;
var
  myForm: TFormGestioneUtenti;
begin
  myForm := TFormGestioneUtenti.Create( nil );
  with myForm do try
    ShowModal;
  finally
    free;
  end;
end;

end.
