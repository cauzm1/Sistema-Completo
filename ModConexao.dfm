object dmDados: TdmDados
  OldCreateOrder = False
  Height = 511
  Width = 411
  object SQLConnection: TSQLConnection
    ConnectionName = 'financeiro'
    DriverName = 'MySQL'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=MySQL'
      'DriverUnit=Data.DBXMySQL'
      
        'DriverPackageLoader=TDBXDynalinkDriverLoader,DbxCommonDriver270.' +
        'bpl'
      
        'DriverAssemblyLoader=Borland.Data.TDBXDynalinkDriverLoader,Borla' +
        'nd.Data.DbxCommonDriver,Version=24.0.0.0,Culture=neutral,PublicK' +
        'eyToken=91d62ebb5b0d1b1b'
      
        'MetaDataPackageLoader=TDBXMySqlMetaDataCommandFactory,DbxMySQLDr' +
        'iver270.bpl'
      
        'MetaDataAssemblyLoader=Borland.Data.TDBXMySqlMetaDataCommandFact' +
        'ory,Borland.Data.DbxMySQLDriver,Version=24.0.0.0,Culture=neutral' +
        ',PublicKeyToken=91d62ebb5b0d1b1b'
      'LibraryName=dbxmys.dll'
      'LibraryNameOsx=libsqlmys.dylib'
      'VendorLib=LIBMYSQL.dll'
      'VendorLibWin64=libmysql.dll'
      'VendorLibOsx=libmysqlclient.dylib'
      'HostName=localhost'
      'Database=financeiro'
      'User_Name=root'
      'Password=123'
      'MaxBlobSize=-1'
      'LocaleCode=0000'
      'Compressed=False'
      'Encrypted=False'
      'BlobSize=-1'
      'ErrorResourceFile=')
    Connected = True
    Left = 64
    Top = 8
  end
  object DScaixa: TSQLDataSet
    CommandText = 'SELECT* FROM caixa'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection
    Left = 40
    Top = 80
  end
  object DSPcaixa: TDataSetProvider
    DataSet = DScaixa
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 168
    Top = 80
  end
  object CDScaixa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPcaixa'
    Left = 296
    Top = 80
    object CDScaixaid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object CDScaixanumero_doc: TStringField
      FieldName = 'numero_doc'
      Required = True
    end
    object CDScaixadescricao: TStringField
      FieldName = 'descricao'
      Size = 200
    end
    object CDScaixavalor: TFMTBCDField
      FieldName = 'valor'
      Required = True
      currency = True
      Precision = 20
      Size = 2
    end
    object CDScaixatipo: TStringField
      FieldName = 'tipo'
      Required = True
      FixedChar = True
      Size = 1
    end
    object CDScaixadt_cadastro: TDateField
      FieldName = 'dt_cadastro'
      Required = True
    end
  end
  object DScontas_pagar: TSQLDataSet
    CommandText = 'SELECT* FROM contas_pagar'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection
    Left = 40
    Top = 168
  end
  object DSPcontas_pagar: TDataSetProvider
    DataSet = DScontas_pagar
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 168
    Top = 168
  end
  object CDScontas_pagar: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPcontas_pagar'
    Left = 296
    Top = 168
    object CDScontas_pagarid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object CDScontas_pagarnumero_doc: TStringField
      FieldName = 'numero_doc'
      Required = True
    end
    object CDScontas_pagardescricao: TStringField
      FieldName = 'descricao'
      Size = 200
    end
    object CDScontas_pagarparcelas: TIntegerField
      FieldName = 'parcelas'
      Required = True
    end
    object CDScontas_pagarvalor_parcelas: TFMTBCDField
      FieldName = 'valor_parcelas'
      Required = True
      Precision = 20
      Size = 2
    end
    object CDScontas_pagarvalor_compra: TFMTBCDField
      FieldName = 'valor_compra'
      Required = True
      Precision = 20
      Size = 2
    end
    object CDScontas_pagarvalor_abatido: TFMTBCDField
      FieldName = 'valor_abatido'
      Required = True
      Precision = 20
      Size = 2
    end
    object CDScontas_pagardt_compra: TDateField
      FieldName = 'dt_compra'
      Required = True
    end
    object CDScontas_pagardt_cadastro: TDateField
      FieldName = 'dt_cadastro'
      Required = True
    end
    object CDScontas_pagardt_vencimento: TDateField
      FieldName = 'dt_vencimento'
      Required = True
    end
    object CDScontas_pagardt_pagamento: TDateField
      FieldName = 'dt_pagamento'
    end
    object CDScontas_pagarstatus: TStringField
      FieldName = 'status'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object DScontas_receber: TSQLDataSet
    CommandText = 'SELECT * FROM contas_receber'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection
    Left = 40
    Top = 248
  end
  object DSPcontas_receber: TDataSetProvider
    DataSet = DScontas_receber
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 168
    Top = 248
  end
  object CDS_contas_receber: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPcontas_receber'
    Left = 296
    Top = 248
    object CDS_contas_receberid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object CDS_contas_receberdocumento: TStringField
      FieldName = 'documento'
      Required = True
    end
    object CDS_contas_receberdescricao: TStringField
      FieldName = 'descricao'
      Size = 200
    end
    object CDS_contas_receberparcelas: TIntegerField
      FieldName = 'parcelas'
      Required = True
    end
    object CDS_contas_recebervalor_parcelas: TFMTBCDField
      FieldName = 'valor_parcelas'
      Required = True
      Precision = 20
      Size = 2
    end
    object CDS_contas_recebervalor_compra: TFMTBCDField
      FieldName = 'valor_compra'
      Required = True
      Precision = 20
      Size = 2
    end
    object CDS_contas_recebervalor_abatido: TFMTBCDField
      FieldName = 'valor_abatido'
      Required = True
      Precision = 20
      Size = 2
    end
    object CDS_contas_receberdt_compra: TDateField
      FieldName = 'dt_compra'
      Required = True
    end
    object CDS_contas_receberdt_vencimento: TDateField
      FieldName = 'dt_vencimento'
      Required = True
    end
    object CDS_contas_receberdt_cadastro: TDateField
      FieldName = 'dt_cadastro'
      Required = True
    end
    object CDS_contas_receberstatus: TStringField
      FieldName = 'status'
      Required = True
      FixedChar = True
      Size = 10
    end
    object CDS_contas_receberdt_pagamento: TStringField
      FieldName = 'dt_pagamento'
      FixedChar = True
      Size = 10
    end
  end
  object DSusuarios: TSQLDataSet
    CommandText = 'SELECT * FROM usuarios'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection
    Left = 40
    Top = 320
  end
  object DSPusuarios: TDataSetProvider
    DataSet = DSusuarios
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 168
    Top = 320
  end
  object CDSusuarios: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPusuarios'
    Left = 296
    Top = 320
    object CDSusuariosid: TIntegerField
      FieldName = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CDSusuariosnome: TStringField
      FieldName = 'nome'
      Required = True
      Size = 50
    end
    object CDSusuarioslogin: TStringField
      FieldName = 'login'
      Required = True
    end
    object CDSusuariossenha: TStringField
      FieldName = 'senha'
      Required = True
    end
    object CDSusuariosstatus: TStringField
      FieldName = 'status'
      Required = True
      FixedChar = True
      Size = 1
    end
    object CDSusuariosdt_cadastro: TDateField
      FieldName = 'dt_cadastro'
    end
  end
end
