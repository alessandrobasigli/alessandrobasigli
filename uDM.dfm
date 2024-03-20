object DM: TDM
  Height = 480
  Width = 640
  object ADOConnectionDM: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=MSDASQL.1;Password=ishtar;Persist Security Info=True;Us' +
      'er ID=abasigli;Extended Properties="Driver=MySQL ODBC 8.0 Unicod' +
      'e Driver;SERVER=localhost;UID=abasigli;PWD=ishtar;DATABASE=proge' +
      'tti;PORT=3306;COLUMN_SIZE_S32=1";Initial Catalog=progetti'
    CursorLocation = clUseServer
    IsolationLevel = ilReadUncommitted
    LoginPrompt = False
    AfterConnect = ADOConnectionDMAfterConnect
    OnBeginTransComplete = ADOConnectionDMBeginTransComplete
    OnCommitTransComplete = ADOConnectionDMCommitTransComplete
    OnConnectComplete = ADOConnectionDMConnectComplete
    OnWillExecute = ADOConnectionDMWillExecute
    Left = 40
    Top = 8
  end
  object ADOTableLOG: TADOTable
    Connection = ADOConnectionDM
    CursorType = ctStatic
    TableName = 'log'
    Left = 72
    Top = 128
    object ADOTableLOGid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
    object ADOTableLOGtablename: TWideStringField
      FieldName = 'tablename'
      Size = 32
    end
    object ADOTableLOGrecordblob: TBlobField
      FieldName = 'recordblob'
    end
    object ADOTableLOGdataora: TDateTimeField
      FieldName = 'dataora'
    end
    object ADOTableLOGavatar: TWideStringField
      FieldName = 'avatar'
      Size = 45
    end
  end
  object ADOTableLOGIN: TADOTable
    Connection = ADOConnectionDM
    CursorType = ctStatic
    TableName = 'login'
    Left = 168
    Top = 128
    object ADOTableLOGINid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
    object ADOTableLOGINUtente: TWideStringField
      FieldName = 'Utente'
      Size = 45
    end
    object ADOTableLOGINPassword: TWideStringField
      FieldName = 'Password'
      Size = 45
    end
    object ADOTableLOGINprefisso: TWideStringField
      FieldName = 'prefisso'
      Size = 3
    end
    object ADOTableLOGINavatar: TWideStringField
      FieldName = 'avatar'
      Size = 45
    end
    object ADOTableLOGINmail: TWideStringField
      FieldName = 'mail'
      Size = 200
    end
    object ADOTableLOGINAmministratore: TIntegerField
      FieldName = 'Amministratore'
    end
    object ADOTableLOGINmailInviataIl: TDateTimeField
      FieldName = 'mailInviataIl'
    end
    object ADOTableLOGINdatachiusura: TWideStringField
      FieldName = 'datachiusura'
      Size = 32
    end
  end
  object ADOTablePROGETTO: TADOTable
    Connection = ADOConnectionDM
    CursorType = ctStatic
    AfterInsert = ADOTablePROGETTOAfterInsert
    TableName = 'progetto'
    Left = 56
    Top = 232
    object ADOTablePROGETTOprefisso: TWideStringField
      FieldName = 'prefisso'
      Size = 3
    end
    object ADOTablePROGETTOidprogetto: TAutoIncField
      FieldName = 'idprogetto'
      ReadOnly = True
    end
    object ADOTablePROGETTONomeProgetto: TWideStringField
      FieldName = 'NomeProgetto'
      Size = 200
    end
    object ADOTablePROGETTOInizio: TDateField
      FieldName = 'Inizio'
    end
    object ADOTablePROGETTOFine: TDateField
      FieldName = 'Fine'
    end
    object ADOTablePROGETTOBudget: TFMTBCDField
      FieldName = 'Budget'
      currency = True
      Precision = 20
      Size = 2
    end
    object ADOTablePROGETTOAttivo: TWideStringField
      FieldName = 'Attivo'
      Size = 2
    end
  end
  object ADOTablePROGETTO_DET: TADOTable
    Connection = ADOConnectionDM
    CursorType = ctStatic
    IndexFieldNames = 'prefisso;idprogetto'
    MasterFields = 'prefisso;idprogetto'
    MasterSource = dsPROGETTO
    TableName = 'progettodettaglio'
    Left = 144
    Top = 328
    object ADOTablePROGETTO_DETprefisso: TWideStringField
      FieldName = 'prefisso'
      Required = True
      Size = 3
    end
    object ADOTablePROGETTO_DETidprogetto: TIntegerField
      FieldName = 'idprogetto'
      Required = True
    end
    object ADOTablePROGETTO_DETidprogettodettaglio: TWideStringField
      FieldName = 'idprogettodettaglio'
      Required = True
      Size = 45
    end
    object ADOTablePROGETTO_DETdescrizione: TWideStringField
      FieldName = 'descrizione'
      Required = True
      Size = 132
    end
    object ADOTablePROGETTO_DETdatainizio: TDateField
      FieldName = 'datainizio'
    end
    object ADOTablePROGETTO_DETdatafine: TDateField
      FieldName = 'datafine'
    end
    object ADOTablePROGETTO_DETBudgetDettaglio: TFMTBCDField
      FieldName = 'BudgetDettaglio'
      currency = True
      Precision = 20
      Size = 2
    end
    object ADOTablePROGETTO_DETOreDettaglio: TIntegerField
      FieldName = 'OreDettaglio'
    end
    object ADOTablePROGETTO_DETattivo: TWideStringField
      FieldName = 'attivo'
      Size = 2
    end
  end
  object dsPROGETTO: TDataSource
    DataSet = ADOTablePROGETTO
    Left = 48
    Top = 296
  end
  object dsPROGETTO_DET: TDataSource
    DataSet = ADOTablePROGETTO_DET
    Left = 144
    Top = 392
  end
  object ADOTableScaricoOre: TADOTable
    Connection = ADOConnectionDM
    CursorType = ctStatic
    AfterInsert = ADOTableScaricoOreAfterInsert
    TableName = 'scaricoore'
    Left = 408
    Top = 256
    object ADOTableScaricoOreprefisso: TWideStringField
      Alignment = taCenter
      FieldName = 'prefisso'
      Size = 3
    end
    object ADOTableScaricoOreidora: TLargeintField
      Alignment = taCenter
      FieldName = 'idora'
    end
    object ADOTableScaricoOreidlogin: TIntegerField
      FieldName = 'id-login'
    end
    object ADOTableScaricoOredata: TDateField
      FieldName = 'data'
    end
    object ADOTableScaricoOreidprogetto: TIntegerField
      Alignment = taCenter
      FieldName = 'idprogetto'
    end
    object ADOTableScaricoOreidprogettodettaglio: TWideStringField
      Alignment = taCenter
      FieldName = 'idprogettodettaglio'
      Size = 45
    end
    object ADOTableScaricoOreore: TBCDField
      FieldName = 'ore'
      Precision = 6
      Size = 2
    end
    object ADOTableScaricoOrenote: TWideMemoField
      FieldName = 'note'
      BlobType = ftWideMemo
    end
  end
  object dsScaricoOre: TDataSource
    DataSet = ADOTableScaricoOre
    Left = 408
    Top = 312
  end
  object ADOTableProgettoRO: TADOTable
    Connection = ADOConnectionDM
    CursorType = ctStatic
    LockType = ltReadOnly
    IndexFieldNames = 'prefisso;idprogetto'
    MasterFields = 'prefisso;idprogetto'
    MasterSource = dsScaricoOre
    TableName = 'progetto'
    Left = 520
    Top = 288
    object ADOTableProgettoROprefisso: TWideStringField
      FieldName = 'prefisso'
      Size = 3
    end
    object ADOTableProgettoROidprogetto: TAutoIncField
      Alignment = taCenter
      FieldName = 'idprogetto'
      ReadOnly = True
    end
    object ADOTableProgettoRONomeProgetto: TWideStringField
      FieldName = 'NomeProgetto'
      Size = 200
    end
    object ADOTableProgettoROInizio: TDateField
      FieldName = 'Inizio'
    end
    object ADOTableProgettoROFine: TDateField
      FieldName = 'Fine'
    end
    object ADOTableProgettoROAttivo: TWideStringField
      FieldName = 'Attivo'
      Size = 2
    end
    object ADOTableProgettoROBudget: TFMTBCDField
      FieldName = 'Budget'
      Precision = 20
      Size = 2
    end
  end
  object ADOTableProDETRO: TADOTable
    Connection = ADOConnectionDM
    CursorType = ctStatic
    LockType = ltReadOnly
    IndexFieldNames = 'prefisso;idprogetto;idprogettodettaglio'
    MasterFields = 'prefisso;idprogetto;idprogettodettaglio'
    MasterSource = dsScaricoOre
    TableName = 'progettodettaglio'
    Left = 520
    Top = 344
  end
  object ds1: TDataSource
    DataSet = ADOTableProgettoRO
    Left = 584
    Top = 272
  end
  object ds2: TDataSource
    DataSet = ADOTableProDETRO
    Left = 584
    Top = 392
  end
  object ADOQueryRO: TADOQuery
    Connection = ADOConnectionDM
    LockType = ltReadOnly
    Parameters = <>
    Left = 488
    Top = 128
  end
  object SQLConnection1: TSQLConnection
    ConnectionName = 'MySQLConnection'
    DriverName = 'MySQL'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=MySQL'
      'HostName=127,0,0,1'
      'Database=progetti'
      'User_Name=abasigli'
      'Password=ishtar'
      'ServerCharSet='
      'BlobSize=-1'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'Compressed=False'
      'Encrypted=False'
      'ConnectTimeout=60'
      'ConnectionName=MySQLConnection')
    Left = 272
    Top = 48
  end
end
