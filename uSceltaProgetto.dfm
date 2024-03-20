object FormSceltaProgetto: TFormSceltaProgetto
  Left = 0
  Top = 0
  Caption = 'seleziona un progetto'
  ClientHeight = 555
  ClientWidth = 1089
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Arial'
  Font.Style = []
  WindowState = wsMaximized
  TextHeight = 18
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1089
    Height = 81
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 1087
    object Label1: TLabel
      Left = 209
      Top = 8
      Width = 62
      Height = 18
      Caption = 'Prefisso:'
    end
    object Label2: TLabel
      Left = 209
      Top = 43
      Width = 43
      Height = 18
      Caption = 'Attivo:'
    end
    object Label3: TLabel
      Left = 385
      Top = 8
      Width = 64
      Height = 36
      Caption = 'Nome Progetto:'
      WordWrap = True
    end
    object ComboBoxPrefisso: TComboBox
      Left = 277
      Top = 8
      Width = 89
      Height = 26
      TabOrder = 0
      Text = 'OK'
      Items.Strings = (
        'TST'
        'OK')
    end
    object ComboBoxAttivo: TComboBox
      Left = 277
      Top = 40
      Width = 48
      Height = 26
      ItemIndex = 0
      TabOrder = 1
      Text = 'SI'
      Items.Strings = (
        'SI'
        'NO')
    end
    object EditNomeProgetto: TEdit
      Left = 471
      Top = 8
      Width = 498
      Height = 26
      TabOrder = 2
      TextHint = 'impostre il nome del progetto'
    end
    object ButtonQuery: TButton
      Left = 992
      Top = 1
      Width = 96
      Height = 79
      Align = alRight
      Caption = 'applica il filtro'
      Default = True
      TabOrder = 3
      WordWrap = True
      OnClick = ButtonQueryClick
      ExplicitLeft = 990
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
      TabOrder = 4
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
      TabOrder = 5
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 81
    Width = 1089
    Height = 474
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 1
    ExplicitWidth = 1087
    ExplicitHeight = 470
    object TabSheet1: TTabSheet
      Caption = 'progetti'
      object DBNavigator1: TDBNavigator
        Left = 0
        Top = 0
        Width = 1081
        Height = 25
        DataSource = dsPRO
        Align = alTop
        TabOrder = 0
        ExplicitWidth = 1079
      end
      object DBGrid1: TDBGrid
        Left = 0
        Top = 25
        Width = 1081
        Height = 416
        Align = alClient
        DataSource = dsPRO
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -16
        TitleFont.Name = 'Arial'
        TitleFont.Style = []
      end
    end
  end
  object ADOQueryPRO: TADOQuery
    Connection = DM.ADOConnectionDM
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'select prefisso, idprogetto, NomeProgetto, Inizio, Fine, Budget'
      ''
      'from progetto '
      ''
      'order by prefisso, NomeProgetto ')
    Left = 568
    Top = 224
    object ADOQueryPROprefisso: TWideStringField
      Alignment = taCenter
      FieldName = 'prefisso'
      Size = 3
    end
    object ADOQueryPROidprogetto: TIntegerField
      Alignment = taCenter
      FieldName = 'idprogetto'
    end
    object ADOQueryPRONomeProgetto: TWideStringField
      FieldName = 'NomeProgetto'
      Size = 200
    end
    object ADOQueryPROInizio: TDateField
      Alignment = taCenter
      FieldName = 'Inizio'
      DisplayFormat = 'dd-mm-yyyy'
    end
    object ADOQueryPROFine: TDateField
      Alignment = taCenter
      FieldName = 'Fine'
      DisplayFormat = 'dd-mm-yyyy'
    end
    object ADOQueryPROBudget: TFMTBCDField
      FieldName = 'Budget'
      DisplayFormat = ',#.00 '#8364
      currency = True
      Precision = 20
      Size = 2
    end
  end
  object dsPRO: TDataSource
    DataSet = ADOQueryPRO
    Left = 568
    Top = 280
  end
end
