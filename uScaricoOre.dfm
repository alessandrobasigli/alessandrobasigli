object FormScaricoOre: TFormScaricoOre
  Left = 0
  Top = 0
  Align = alCustom
  Caption = 'Scarico Ore'
  ClientHeight = 424
  ClientWidth = 826
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -19
  Font.Name = 'Arial'
  Font.Style = []
  OnActivate = FormActivate
  OnCreate = FormCreate
  TextHeight = 22
  object Label6: TLabel
    Left = 0
    Top = 88
    Width = 139
    Height = 22
    Caption = 'Progetto <F12>:'
  end
  object Label7: TLabel
    Left = 100
    Top = 165
    Width = 37
    Height = 22
    Caption = 'Ore:'
  end
  object Label8: TLabel
    Left = 92
    Top = 198
    Width = 45
    Height = 22
    Caption = 'Note:'
  end
  object LabelDescProgetto: TLabel
    Left = 299
    Top = 88
    Width = 195
    Height = 22
    Caption = '<descrizione progetto>'
  end
  object LabelDescrizioneSottoProgetto: TLabel
    Left = 299
    Top = 127
    Width = 243
    Height = 22
    Caption = '<descrizione sotto-progetto>'
  end
  object Label1: TLabel
    Left = 93
    Top = 44
    Width = 44
    Height = 22
    Caption = 'Data:'
  end
  object Label2: TLabel
    Left = 74
    Top = 8
    Width = 63
    Height = 22
    Caption = 'Avatar::'
  end
  object LabelAvatar: TLabel
    Left = 143
    Top = 8
    Width = 264
    Height = 22
    Caption = '<descrizione avarar dalla login>'
    Color = clRed
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -19
    Font.Name = 'Arial'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object EditIDPROGETTO: TEdit
    Left = 143
    Top = 88
    Width = 150
    Height = 30
    TabStop = False
    TabOrder = 1
    Text = '4'
    OnExit = EditIDPROGETTOExit
    OnKeyDown = EditIDPROGETTOKeyDown
  end
  object EditSOTTOPROGETTO: TEdit
    Left = 143
    Top = 124
    Width = 150
    Height = 30
    TabStop = False
    TabOrder = 2
    Text = 'PRO'
    OnExit = EditSOTTOPROGETTOExit
    OnKeyDown = EditSOTTOPROGETTOKeyDown
  end
  object EditORE: TEdit
    Left = 143
    Top = 166
    Width = 150
    Height = 30
    TabStop = False
    NumbersOnly = True
    TabOrder = 3
    Text = '8'
  end
  object MemoNOTE: TMemo
    Left = 143
    Top = 202
    Width = 722
    Height = 155
    Lines.Strings = (
      'note prima riga'
      'note seconda riga'
      'note terza riga'
      'note ultima riga.')
    ScrollBars = ssVertical
    TabOrder = 4
  end
  object DatePicker: TDatePicker
    Left = 143
    Top = 50
    Date = 45348.000000000000000000
    DateFormat = 'dd-mm-yyyy'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    TabOrder = 0
  end
  object bNuovoInserimento: TButton
    Left = 143
    Top = 375
    Width = 202
    Height = 41
    Caption = 'nuovo inserimento'
    Default = True
    TabOrder = 5
    OnClick = bNuovoInserimentoClick
  end
  object ADOQueryPROGETTI: TADOQuery
    Connection = DM.ADOConnectionDM
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'pPrefisso'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 36
        Precision = 255
        Size = 255
        Value = 'OK'
      end>
    SQL.Strings = (
      'select prefisso, idprogetto, nomeprogetto, inizio, fine, budget'
      ''
      'from progetto'
      ''
      'where Prefisso = :pPrefisso and Attivo = 1 ')
    Left = 616
    Top = 136
  end
  object dsADOQueryPROGETTI: TDataSource
    DataSet = ADOQueryPROGETTI
    Left = 608
    Top = 200
  end
  object ADOQuery1PROGETTIDET: TADOQuery
    Connection = DM.ADOConnectionDM
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'pPrefisso'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 36
        Precision = 255
        Size = 255
        Value = 'OK'
      end
      item
        Name = 'pIdProgetto'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 36
        Precision = 255
        Size = 255
        Value = '1'
      end>
    SQL.Strings = (
      'select * '
      ''
      'from progettodettaglio'
      ''
      'where prefisso = :pPrefisso and idprogetto = :pIdProgetto '
      ''
      'order by descrizione'
      '')
    Left = 576
    Top = 280
    object ADOQuery1PROGETTIDETprefisso: TWideStringField
      FieldName = 'prefisso'
      Size = 3
    end
    object ADOQuery1PROGETTIDETidprogetto: TIntegerField
      FieldName = 'idprogetto'
    end
    object ADOQuery1PROGETTIDETidprogettodettaglio: TWideStringField
      FieldName = 'idprogettodettaglio'
      Size = 45
    end
    object ADOQuery1PROGETTIDETdescrizione: TWideStringField
      FieldName = 'descrizione'
      Size = 132
    end
    object ADOQuery1PROGETTIDETdatainizio: TDateField
      FieldName = 'datainizio'
    end
    object ADOQuery1PROGETTIDETdatafine: TDateField
      FieldName = 'datafine'
    end
    object ADOQuery1PROGETTIDETBudgetDettaglio: TFMTBCDField
      FieldName = 'BudgetDettaglio'
      Precision = 20
      Size = 2
    end
    object ADOQuery1PROGETTIDETOreDettaglio: TIntegerField
      FieldName = 'OreDettaglio'
    end
    object ADOQuery1PROGETTIDETattivo: TWideStringField
      FieldName = 'attivo'
      Size = 2
    end
  end
  object dsDET: TDataSource
    DataSet = ADOQuery1PROGETTIDET
    Left = 632
    Top = 328
  end
  object ADOQueryNUOVO: TADOQuery
    Connection = DM.ADOConnectionDM
    CursorLocation = clUseServer
    CursorType = ctDynamic
    LockType = ltBatchOptimistic
    ParamCheck = False
    Parameters = <>
    Left = 472
    Top = 48
  end
end
