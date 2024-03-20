object FormSceltaSottoProgetto: TFormSceltaSottoProgetto
  Left = 0
  Top = 0
  Caption = 'selezione del sotto-progetto'
  ClientHeight = 648
  ClientWidth = 1032
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Arial'
  Font.Style = []
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnCreate = FormCreate
  TextHeight = 18
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1032
    Height = 81
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 1028
    object Label2: TLabel
      Left = 291
      Top = 48
      Width = 43
      Height = 18
      Caption = 'Attivo:'
    end
    object Label3: TLabel
      Left = 177
      Top = 16
      Width = 149
      Height = 18
      Caption = 'Nome sotto-Progetto:'
      WordWrap = True
    end
    object ComboBoxAttivo: TComboBox
      Left = 340
      Top = 48
      Width = 48
      Height = 26
      ItemIndex = 0
      TabOrder = 0
      Text = 'SI'
      Items.Strings = (
        'SI'
        'NO')
    end
    object EditNomeSottoProgetto: TEdit
      Left = 340
      Top = 16
      Width = 260
      Height = 26
      TabOrder = 1
      TextHint = 'impostre il nome del sotto-progetto'
    end
    object ButtonQuery: TButton
      Left = 935
      Top = 1
      Width = 96
      Height = 79
      Align = alRight
      Caption = 'applica il filtro'
      Default = True
      TabOrder = 2
      WordWrap = True
      OnClick = ButtonQueryClick
      ExplicitLeft = 931
    end
    object ButtonOK: TButton
      Left = 1
      Top = 1
      Width = 75
      Height = 79
      Align = alLeft
      Caption = 'torna'
      Default = True
      ModalResult = 1
      TabOrder = 3
    end
    object ButtonCANCEL: TButton
      Left = 76
      Top = 1
      Width = 75
      Height = 79
      Align = alLeft
      Caption = 'esci'
      Default = True
      ModalResult = 2
      TabOrder = 4
    end
  end
  object DBEdit1: TDBEdit
    AlignWithMargins = True
    Left = 3
    Top = 84
    Width = 1026
    Height = 26
    Align = alTop
    AutoSelect = False
    Color = clInactiveCaption
    DataField = 'NomeProgetto'
    ReadOnly = True
    TabOrder = 1
    ExplicitWidth = 1022
  end
  object DBNavigator1: TDBNavigator
    Left = 0
    Top = 139
    Width = 1032
    Height = 25
    DataSource = dsDET
    Align = alTop
    TabOrder = 2
    ExplicitWidth = 1028
  end
  object DBGrid2: TDBGrid
    Left = 0
    Top = 164
    Width = 1032
    Height = 484
    Align = alClient
    DataSource = dsDET
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 3
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -16
    TitleFont.Name = 'Arial'
    TitleFont.Style = []
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'prefisso'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'idprogetto'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'idprogettodettaglio'
        Title.Caption = 'sub-progetto'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'descrizione'
        Width = 500
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'OreDettaglio'
        Title.Alignment = taCenter
        Title.Caption = 'Ore sotto-progetto'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'datainizio'
        Title.Alignment = taCenter
        Title.Caption = 'data inizio'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'datafine'
        Title.Alignment = taCenter
        Title.Caption = 'data fine'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BudgetDettaglio'
        Title.Caption = 'Budget sotto-progetto'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'attivo'
        Title.Alignment = taCenter
        Width = 90
        Visible = True
      end>
  end
  object EditPROGETTO: TEdit
    Left = 0
    Top = 113
    Width = 1032
    Height = 26
    Align = alTop
    Alignment = taCenter
    TabOrder = 4
    Text = 'EditPROGETTO'
    ExplicitWidth = 1028
  end
  object ADOQueryDET: TADOQuery
    Connection = DM.ADOConnectionDM
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      
        'SELECT prefisso, idprogetto, idprogettodettaglio, descrizione, d' +
        'atainizio, datafine, BudgetDettaglio, OreDettaglio, attivo '
      ''
      'from progettodettaglio '
      ''
      'order by prefisso, idprogetto, descrizione')
    Left = 644
    Top = 374
    object ADOQueryDETprefisso: TWideStringField
      FieldName = 'prefisso'
      Size = 3
    end
    object ADOQueryDETidprogetto: TIntegerField
      FieldName = 'idprogetto'
    end
    object ADOQueryDETidprogettodettaglio: TWideStringField
      FieldName = 'idprogettodettaglio'
    end
    object ADOQueryDETdescrizione: TWideStringField
      FieldName = 'descrizione'
      Size = 132
    end
    object ADOQueryDETdatainizio: TDateField
      Alignment = taCenter
      FieldName = 'datainizio'
      DisplayFormat = 'dd-mm-yyyyy'
    end
    object ADOQueryDETdatafine: TDateField
      Alignment = taCenter
      FieldName = 'datafine'
      DisplayFormat = 'dd-mm-yyyyy'
    end
    object ADOQueryDETBudgetDettaglio: TFMTBCDField
      FieldName = 'BudgetDettaglio'
      currency = True
      Precision = 20
      Size = 2
    end
    object ADOQueryDETOreDettaglio: TIntegerField
      FieldName = 'OreDettaglio'
    end
    object ADOQueryDETattivo: TWideStringField
      FieldName = 'attivo'
      Size = 2
    end
  end
  object dsDET: TDataSource
    DataSet = ADOQueryDET
    Left = 656
    Top = 440
  end
end
