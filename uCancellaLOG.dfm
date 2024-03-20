object FormCancellaLOG: TFormCancellaLOG
  Left = 0
  Top = 0
  Caption = 'cancella LOG'
  ClientHeight = 436
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -19
  Font.Name = 'Arial'
  Font.Style = []
  OnActivate = FormActivate
  OnCreate = FormCreate
  TextHeight = 22
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 628
    Height = 233
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 624
    object Label1: TLabel
      Left = 16
      Top = 11
      Width = 121
      Height = 22
      Caption = 'Nome Tabella:'
    end
    object Label2: TLabel
      Left = 16
      Top = 106
      Width = 91
      Height = 22
      Caption = 'Dalla Data:'
    end
    object Label3: TLabel
      Left = 16
      Top = 142
      Width = 80
      Height = 22
      Caption = 'Alla Data:'
    end
    object Label4: TLabel
      Left = 16
      Top = 59
      Width = 58
      Height = 22
      Caption = 'Avatar:'
    end
    object EditTABLENAME: TEdit
      Left = 152
      Top = 8
      Width = 297
      Height = 30
      TabOrder = 0
      OnChange = EditTABLENAMEChange
    end
    object ButtonCancella: TButton
      Left = 152
      Top = 178
      Width = 113
      Height = 41
      Caption = 'cancella'
      Enabled = False
      TabOrder = 3
      OnClick = ButtonCancellaClick
    end
    object DateTimePicker1: TDateTimePicker
      Left = 152
      Top = 98
      Width = 297
      Height = 30
      Date = 45355.000000000000000000
      Time = 0.668795277779281600
      Kind = dtkDateTime
      TabOrder = 1
    end
    object DateTimePicker2: TDateTimePicker
      Left = 152
      Top = 134
      Width = 297
      Height = 30
      Date = 45355.000000000000000000
      Time = 0.668795277779281600
      Kind = dtkDateTime
      TabOrder = 2
    end
    object ComboBox1: TComboBox
      Left = 152
      Top = 56
      Width = 297
      Height = 30
      TabOrder = 4
    end
  end
  object Memo: TMemo
    Left = 0
    Top = 233
    Width = 628
    Height = 203
    Align = alClient
    ScrollBars = ssVertical
    TabOrder = 1
    ExplicitWidth = 624
    ExplicitHeight = 202
  end
  object ADOQueryDELETE: TADOQuery
    Connection = DM.ADOConnectionDM
    Parameters = <>
    Left = 416
    Top = 240
  end
  object dsDELETE: TDataSource
    DataSet = ADOQueryDELETE
    Left = 424
    Top = 296
  end
end
