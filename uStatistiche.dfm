object FormStatistiche: TFormStatistiche
  Left = 0
  Top = 0
  Caption = 'statistiche'
  ClientHeight = 620
  ClientWidth = 1076
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Arial'
  Font.Style = []
  WindowState = wsMaximized
  TextHeight = 16
  object Splitter1: TSplitter
    Left = 0
    Top = 512
    Width = 1076
    Height = 8
    Cursor = crVSplit
    Align = alTop
    ExplicitLeft = -32
    ExplicitTop = 526
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1076
    Height = 137
    Align = alTop
    TabOrder = 0
    object sbQuery: TSpeedButton
      Left = 259
      Top = 1
      Width = 70
      Height = 135
      Align = alLeft
      Caption = 'q u e r y'
      ImageIndex = 0
      Images = ImageList1
      Layout = blGlyphBottom
      OnClick = sbQueryClick
    end
    object Label1: TLabel
      Left = 505
      Top = 16
      Width = 51
      Height = 16
      Caption = 'Prefisso:'
    end
    object Label2: TLabel
      Left = 505
      Top = 51
      Width = 36
      Height = 16
      Caption = 'Attivo:'
    end
    object Label3: TLabel
      Left = 681
      Top = 16
      Width = 91
      Height = 16
      Caption = 'Nome Progetto:'
      WordWrap = True
    end
    object sbHTML: TSpeedButton
      Left = 329
      Top = 1
      Width = 58
      Height = 135
      Align = alLeft
      Caption = 'html'
      ImageIndex = 1
      Images = ImageList1
      Layout = blGlyphBottom
      OnClick = sbHTMLClick
    end
    object sb2livelliHTML: TSpeedButton
      Left = 387
      Top = 1
      Width = 112
      Height = 135
      Align = alLeft
      Caption = 'html 365 giorni'
      ImageIndex = 1
      Images = ImageList1
      Layout = blGlyphBottom
      OnClick = sb2livelliHTMLClick
    end
    object rg: TRadioGroup
      Left = 1
      Top = 1
      Width = 258
      Height = 135
      Align = alLeft
      Caption = 'statictica'
      ItemIndex = 0
      Items.Strings = (
        'scarico ore'
        'progetti'
        'log'
        'login errata'
        'scarico ore per progetto'
        'scarico ore per utente')
      TabOrder = 0
      ExplicitHeight = 79
    end
    object ComboBoxPrefisso: TComboBox
      Left = 573
      Top = 16
      Width = 89
      Height = 24
      TabOrder = 1
      Text = 'OK'
      Items.Strings = (
        'TST'
        'OK')
    end
    object ComboBoxAttivo: TComboBox
      Left = 573
      Top = 48
      Width = 48
      Height = 24
      ItemIndex = 0
      TabOrder = 2
      Text = 'SI'
      Items.Strings = (
        'SI'
        'NO')
    end
    object EditNomeProgetto: TEdit
      Left = 681
      Top = 37
      Width = 432
      Height = 24
      TabOrder = 3
      TextHint = 'impostre il nome del progetto'
    end
  end
  object DBNavigatorRO: TDBNavigator
    Left = 0
    Top = 137
    Width = 1076
    Height = 25
    DataSource = dsRO
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
    Align = alTop
    TabOrder = 3
    ExplicitTop = 81
    ExplicitWidth = 1074
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 162
    Width = 1076
    Height = 350
    Align = alTop
    Color = clSkyBlue
    DataSource = dsRO
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    TabOrder = 1
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'Arial'
    TitleFont.Style = [fsBold]
    OnDrawColumnCell = DBGrid1DrawColumnCell
    OnTitleClick = DBGrid1TitleClick
  end
  object DBMemoRO: TDBMemo
    Left = 0
    Top = 520
    Width = 1076
    Height = 100
    Align = alClient
    DataSource = dsRO
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 2
    ExplicitLeft = 1
    ExplicitTop = 518
  end
  object ADOQueryRO: TADOQuery
    Connection = DM.ADOConnectionDM
    LockType = ltReadOnly
    Parameters = <>
    Left = 480
    Top = 232
  end
  object dsRO: TDataSource
    DataSet = ADOQueryRO
    Left = 480
    Top = 288
  end
  object ImageList1: TImageList
    Left = 632
    Top = 304
    Bitmap = {
      494C010102000800040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A7A7F9FFA7A7
      F9FF00000000B7777DF5A7A7F9FFA7A7F9FF00000000A7A7F9FFA7A7F9FF5328
      1668C1603AF4A7A7F9FFA7A7F9FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000A658E5000000510000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A7A7F9FFA7A7
      F9FF00000000B7777DF5A7A7F9FFA7A7F9FF00000000A7A7F9FFA7A7F9FF5328
      1668C1603AF4A7A7F9FFA7A7F9FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000C061FFD2F9E7FFE6FAEFFF000F077000000000000000000000
      0000000000000000000000000000000000000000000000000000A7A7F9FFA7A7
      F9FF00000000B7777DF5A7A7F9FFA7A7F9FF00000000A7A7F9FFA7A7F9FF5328
      1668C1603AF4A7A7F9FFA7A7F9FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000200B655FF97F2C4FF77EFABFFA2F8CEFFEAFDF3FF007637CB000000000000
      0000000000000000000000000000000000000000000000000000A7A7F9FFA7A7
      F9FF00000000B7777DF5A7A7F9FFA7A7F9FF00000000A7A7F9FFA7A7F9FF5328
      1668C1603AF4A7A7F9FFA7A7F9FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000800AB
      4AFF0CDA5FFF2AE173FF59EA96FF79F0AEFF84F2B6FFC0F8DEFF00AB4AFF0000
      0000000000000000000000000000000000000000000000000000A7A7F9FFA7A7
      F9FF00000000B7777DF5A7A7F9FFA7A7F9FF00000000A7A7F9FFA7A7F9FF5328
      1668C1603AF4A7A7F9FFA7A7F9FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000001300A13EFF00CC
      4CFF00D453FF00DA5BFF2BE175FF47E688FF4EE78DFF41E584FF4FE690FF00A1
      3DFF000000020000000000000000000000000000000000000000B9644DEEB964
      4DEE00000000B7777DF5A7A7F9FFA7A7F9FF00000000A7A7F9FFA7A7F9FF5328
      1668C1603AF4A7A7F9FFA7A7F9FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000008009630FF00C03EFF00C7
      47FF00CE4DFF40DC78FF56E38AFF58E58CFF5CE68FFF11DC62FF00D858FF00D2
      52FF009630FF0000000700000000000000000000000000000000000000000000
      000000000000B7777DF5A7A7F9FFA7A7F9FF00000000A7A7F9FFA7A7F9FF5328
      1668C1603AF4A7A7F9FFA7A7F9FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000A00B330FF00BA38FF78DA
      92FF78DE95FF78E098FF00D050FF00D353FF78E59CFF78E59BFF78E39AFF78DF
      98FF00C644FF008A21FF000000120000000000000000000000009E5A38CC0B06
      040E00000000B7777DF5A7A7F9FFA7A7F9FF0000000052271666522716660000
      0000C1603AF4A7A7F9FFA7A7F9FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000AD2AFF96DBA4FF96DF
      A7FF96E1A9FF00C443FF000000000000000000CA4AFF96E5ADFF96E5ACFF96E3
      ABFF96E0A9FF00B937FF007E12FF000000240000000000000000000000006339
      23802E1A103B160A061B442112553C1D104B0000000000000000000000000000
      0000C1603AF4A7A7F9FFA7A7F9FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000AB29FFB3E5
      BDFF005C1A870000000000000000000000000000000000C13FFFB3E9C1FFB3E8
      C0FFB3E6BEFFB3E5BDFF00AB27FF007500FF0000000000000000000000000000
      0000301B113E6A3C258800000000000000007E482CA2C06D43F9BD6B43F40000
      000028130B32A2543ACDA2543ACD000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000009328D3D0EF
      D6FFD0EED5FFD0EDD4FFD0ECD4FF009E18FF0000000000000000000000000000
      0000000000000D080511A8603AD8C47146FE000000000000000000000000C671
      46FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000016
      0527ECF8EEFFECF7EDFFC7E6C9FF000000050000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C67146FF4326185600000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000021AA025FF00000001000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C36E45FBC67146FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000}
  end
end
