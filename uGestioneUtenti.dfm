object FormGestioneUtenti: TFormGestioneUtenti
  Left = 0
  Top = 5
  Caption = 'Gestione Utenti'
  ClientHeight = 502
  ClientWidth = 1157
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -19
  Font.Name = 'Arial'
  Font.Style = []
  Position = poDesigned
  OnActivate = FormActivate
  OnCreate = FormCreate
  TextHeight = 22
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 482
    Height = 502
    Align = alLeft
    TabOrder = 0
    ExplicitHeight = 501
    object SpeedButton2: TSpeedButton
      Left = 336
      Top = 200
      Width = 23
      Height = 22
    end
    object DBNavigator1: TDBNavigator
      Left = 1
      Top = 1
      Width = 480
      Height = 25
      DataSource = ds
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
      Align = alTop
      TabOrder = 0
    end
    object DBGrid1: TDBGrid
      Left = 1
      Top = 26
      Width = 480
      Height = 475
      Align = alClient
      DataSource = ds
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -19
      TitleFont.Name = 'Arial'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'prefisso'
          Title.Alignment = taCenter
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Id'
          Title.Alignment = taCenter
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Utente'
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'avatar'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'mail'
          Width = 300
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Amministratore'
          Title.Alignment = taCenter
          Title.Caption = 'amministratore'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'mailInviataIl'
          Title.Alignment = taCenter
          Title.Caption = 'mail Inviata il'
          Width = 205
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'datachiusura'
          Title.Caption = 'utente chiuso il'
          Visible = True
        end>
    end
  end
  object Panel3: TPanel
    Left = 482
    Top = 0
    Width = 675
    Height = 502
    Align = alClient
    TabOrder = 1
    ExplicitWidth = 671
    ExplicitHeight = 501
    object Label1: TLabel
      Left = 16
      Top = 43
      Width = 76
      Height = 22
      Caption = 'Prefisso;'
    end
    object Label2: TLabel
      Left = 16
      Top = 79
      Width = 60
      Height = 22
      Alignment = taCenter
      Caption = 'Utente:'
    end
    object Label3: TLabel
      Left = 16
      Top = 115
      Width = 89
      Height = 22
      Alignment = taCenter
      Caption = 'Password:'
    end
    object Label4: TLabel
      Left = 16
      Top = 151
      Width = 58
      Height = 22
      Alignment = taCenter
      Caption = 'Avatar:'
    end
    object Label5: TLabel
      Left = 16
      Top = 187
      Width = 49
      Height = 22
      Alignment = taCenter
      Caption = 'eMail:'
    end
    object Label6: TLabel
      Left = 16
      Top = 223
      Width = 124
      Height = 22
      Alignment = taCenter
      Caption = 'eMail inviata il::'
    end
    object Label7: TLabel
      Left = 16
      Top = 259
      Width = 138
      Height = 22
      Alignment = taCenter
      Caption = 'Utente chiuso il::'
    end
    object DBEdit2: TDBEdit
      Left = 160
      Top = 76
      Width = 505
      Height = 30
      DataField = 'Utente'
      DataSource = ds
      TabOrder = 0
    end
    object DBEdit3: TDBEdit
      Left = 160
      Top = 112
      Width = 505
      Height = 30
      DataField = 'Password'
      DataSource = ds
      TabOrder = 1
    end
    object DBEdit4: TDBEdit
      Left = 160
      Top = 148
      Width = 505
      Height = 30
      DataField = 'avatar'
      DataSource = ds
      TabOrder = 2
    end
    object DBEdit5: TDBEdit
      Left = 160
      Top = 184
      Width = 505
      Height = 30
      DataField = 'mail'
      DataSource = ds
      TabOrder = 3
    end
    object DBEdit6: TDBEdit
      Left = 160
      Top = 220
      Width = 505
      Height = 30
      DataField = 'mailInviataIl'
      DataSource = ds
      TabOrder = 4
    end
    object DBCheckBox1: TDBCheckBox
      Left = 160
      Top = 300
      Width = 193
      Height = 17
      Caption = 'amministratore'
      DataField = 'Amministratore'
      DataSource = ds
      TabOrder = 6
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object DBComboBox1: TDBComboBox
      Left = 159
      Top = 40
      Width = 82
      Height = 30
      DataField = 'prefisso'
      DataSource = ds
      Items.Strings = (
        'OK'
        'TST')
      TabOrder = 7
    end
    object DBNavigator2: TDBNavigator
      Left = 1
      Top = 1
      Width = 673
      Height = 25
      DataSource = ds
      Align = alTop
      TabOrder = 8
      ExplicitWidth = 669
    end
    object ButtonEMail: TButton
      Left = 160
      Top = 336
      Width = 145
      Height = 49
      Caption = 'invia eMail'
      TabOrder = 9
      Visible = False
      OnClick = ButtonEMailClick
    end
    object DBEdit7: TDBEdit
      Left = 160
      Top = 256
      Width = 217
      Height = 30
      DataField = 'datachiusura'
      DataSource = ds
      TabOrder = 5
    end
  end
  object ADOQueryRO: TADOQuery
    Connection = DM.ADOConnectionDM
    CursorType = ctStatic
    AfterPost = ADOQueryROAfterPost
    Parameters = <>
    SQL.Strings = (
      
        'SELECT Id, Utente, Password, prefisso, avatar, mail, Amministrat' +
        'ore, mailInviataIl , datachiusura '
      'FROM login'
      'ORDER BY id ')
    Left = 272
    Top = 224
    object ADOQueryROId: TAutoIncField
      Alignment = taCenter
      DisplayWidth = 3
      FieldName = 'Id'
      ReadOnly = True
    end
    object ADOQueryROUtente: TWideStringField
      DisplayWidth = 45
      FieldName = 'Utente'
      Size = 45
    end
    object ADOQueryROPassword: TWideStringField
      DisplayWidth = 45
      FieldName = 'Password'
      Size = 45
    end
    object ADOQueryROprefisso: TWideStringField
      Alignment = taCenter
      DisplayWidth = 6
      FieldName = 'prefisso'
      Size = 3
    end
    object ADOQueryROavatar: TWideStringField
      DisplayWidth = 45
      FieldName = 'avatar'
      Size = 45
    end
    object ADOQueryROmail: TWideStringField
      DisplayWidth = 200
      FieldName = 'mail'
      Size = 200
    end
    object ADOQueryROAmministratore: TIntegerField
      Alignment = taCenter
      DisplayWidth = 11
      FieldName = 'Amministratore'
    end
    object ADOQueryROmailInviataIl: TDateTimeField
      Alignment = taCenter
      DisplayWidth = 18
      FieldName = 'mailInviataIl'
    end
    object ADOQueryROdatachiusura: TWideStringField
      FieldName = 'datachiusura'
      Size = 32
    end
  end
  object ds: TDataSource
    DataSet = ADOQueryRO
    Left = 272
    Top = 297
  end
  object IdSMTPServer1: TIdSMTPServer
    Bindings = <>
    IOHandler = IdServerIOHandlerSSLOpenSSL1
    CommandHandlers = <>
    ExceptionReply.Code = '500'
    ExceptionReply.Text.Strings = (
      'Unknown Internal Error')
    Greeting.Code = '220'
    Greeting.Text.Strings = (
      'Welcome to the INDY SMTP Server')
    HelpReply.Code = ''
    MaxConnectionReply.Code = '300'
    MaxConnectionReply.Text.Strings = (
      'Too many connections. Try again later.')
    ReplyTexts = <>
    ReplyUnknownCommand.Code = '500'
    ReplyUnknownCommand.Text.Strings = (
      'Syntax Error')
    ReplyUnknownCommand.EnhancedCode.StatusClass = 5
    ReplyUnknownCommand.EnhancedCode.Subject = 5
    ReplyUnknownCommand.EnhancedCode.Details = 2
    ReplyUnknownCommand.EnhancedCode.Available = True
    ReplyUnknownCommand.EnhancedCode.ReplyAsStr = '5.5.2'
    ServerName = 'Indy SMTP Server'
    Left = 842
    Top = 369
  end
  object IdServerIOHandlerSSLOpenSSL1: TIdServerIOHandlerSSLOpenSSL
    SSLOptions.Mode = sslmUnassigned
    SSLOptions.VerifyMode = []
    SSLOptions.VerifyDepth = 0
    Left = 864
    Top = 440
  end
end
