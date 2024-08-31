object DMDAtualizacao: TDMDAtualizacao
  OnCreate = DataModuleCreate
  Height = 480
  Width = 640
  object conProducao: TFDConnection
    Params.Strings = (
      'Database=F:\git\atualizacao-meta\Win32\Debug\DADOS.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'DriverID=fB')
    Connected = True
    LoginPrompt = False
    Left = 72
    Top = 40
  end
  object conAtualizacao: TFDConnection
    Params.Strings = (
      'Database=F:\git\atualizacao-meta\Win32\Debug\atualizacao.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'DriverID=fB')
    Connected = True
    LoginPrompt = False
    Left = 72
    Top = 96
  end
  object Driver: TFDPhysFBDriverLink
    Left = 72
    Top = 152
  end
  object QGeneratorProducao: TFDQuery
    Connection = conProducao
    SQL.Strings = (
      'SELECT'
      '    RDB$GENERATOR_NAME AS GENERATOR_NAME,'
      '    RDB$SYSTEM_FLAG AS SYSTEM_FLAG,'
      '    RDB$DESCRIPTION AS DESCRIPTION'
      'FROM'
      '    RDB$GENERATORS'
      'WHERE'
      '    (RDB$SYSTEM_FLAG <> 1) OR (RDB$SYSTEM_FLAG IS NULL)'
      'ORDER BY'
      '    RDB$GENERATOR_NAME;')
    Left = 216
    Top = 48
    object QGeneratorProducaoGENERATOR_NAME: TWideStringField
      FieldName = 'GENERATOR_NAME'
      Origin = 'RDB$GENERATOR_NAME'
      FixedChar = True
      Size = 31
    end
    object QGeneratorProducaoSYSTEM_FLAG: TSmallintField
      FieldName = 'SYSTEM_FLAG'
      Origin = 'RDB$SYSTEM_FLAG'
      Required = True
    end
    object QGeneratorProducaoDESCRIPTION: TMemoField
      FieldName = 'DESCRIPTION'
      Origin = 'RDB$DESCRIPTION'
      BlobType = ftMemo
    end
  end
  object TGeneratorProducao: TJvMemoryData
    FieldDefs = <>
    Left = 216
    Top = 104
    object TGeneratorProducaoSYSTEM_FLAG: TSmallintField
      FieldName = 'SYSTEM_FLAG'
      Origin = 'RDB$SYSTEM_FLAG'
    end
    object TGeneratorProducaoDESCRIPTION: TMemoField
      FieldName = 'DESCRIPTION'
      Origin = 'RDB$DESCRIPTION'
      BlobType = ftMemo
    end
    object TGeneratorProducaoGENERATOR_NAME: TStringField
      FieldName = 'GENERATOR_NAME'
      Size = 100
    end
  end
  object QGeneratorAtualizacao: TFDQuery
    Connection = conAtualizacao
    SQL.Strings = (
      'SELECT'
      '    RDB$GENERATOR_NAME AS GENERATOR_NAME,'
      '    RDB$SYSTEM_FLAG AS SYSTEM_FLAG,'
      '    RDB$DESCRIPTION AS DESCRIPTION'
      'FROM'
      '    RDB$GENERATORS'
      'WHERE'
      '    (RDB$SYSTEM_FLAG <> 1) OR (RDB$SYSTEM_FLAG IS NULL)'
      'ORDER BY'
      '    RDB$GENERATOR_NAME;')
    Left = 216
    Top = 160
    object WideStringField1: TWideStringField
      FieldName = 'GENERATOR_NAME'
      Origin = 'RDB$GENERATOR_NAME'
      FixedChar = True
      Size = 31
    end
    object SmallintField2: TSmallintField
      FieldName = 'SYSTEM_FLAG'
      Origin = 'RDB$SYSTEM_FLAG'
      Required = True
    end
    object MemoField2: TMemoField
      FieldName = 'DESCRIPTION'
      Origin = 'RDB$DESCRIPTION'
      BlobType = ftMemo
    end
  end
  object TGeneratorAtualizacao: TJvMemoryData
    FieldDefs = <>
    Left = 216
    Top = 216
    object TGeneratorAtualizacaoSYSTEM_FLAG: TSmallintField
      FieldName = 'SYSTEM_FLAG'
      Origin = 'RDB$SYSTEM_FLAG'
    end
    object TGeneratorAtualizacaoDESCRIPTION: TMemoField
      FieldName = 'DESCRIPTION'
      Origin = 'RDB$DESCRIPTION'
      BlobType = ftMemo
    end
    object TGeneratorAtualizacaoGENERATOR_NAME: TStringField
      FieldName = 'GENERATOR_NAME'
      Size = 100
    end
  end
  object Transacao: TFDTransaction
    Connection = conProducao
    Left = 72
    Top = 208
  end
  object QExecutaProducao: TFDQuery
    Connection = conProducao
    Transaction = Transacao
    SQL.Strings = (
      '')
    Left = 72
    Top = 264
  end
  object QTabelaAtualizacao: TFDQuery
    Connection = conAtualizacao
    SQL.Strings = (
      'SELECT'
      '    RDB$RELATIONS.RDB$RELATION_NAME AS NM_TABELA,'
      '    RDB$RELATION_FIELDS.RDB$FIELD_NAME AS NM_FIELD,'
      '    RDB$FIELDS.RDB$FIELD_TYPE AS TP_FIELD,'
      '    RDB$FIELDS.RDB$FIELD_LENGTH AS NR_TAMANHO,'
      '    RDB$FIELDS.RDB$FIELD_SCALE AS NR_CASASDECIMAL,'
      '    RDB$RELATION_FIELDS.RDB$NULL_FLAG AS ST_NULL,'
      '    RDB$FIELDS.RDB$DEFAULT_SOURCE AS DS_VALORPADRAO,'
      '    RDB$FIELDS.RDB$FIELD_SUB_TYPE AS DS_SUBTIPO,'
      '    RDB$FIELDS.RDB$CHARACTER_LENGTH AS NR_CARACTERES'
      'FROM'
      '    RDB$RELATIONS'
      'JOIN'
      
        '    RDB$RELATION_FIELDS ON RDB$RELATIONS.RDB$RELATION_NAME = RDB' +
        '$RELATION_FIELDS.RDB$RELATION_NAME'
      'JOIN'
      
        '    RDB$FIELDS ON RDB$RELATION_FIELDS.RDB$FIELD_SOURCE = RDB$FIE' +
        'LDS.RDB$FIELD_NAME'
      'WHERE'
      '    RDB$RELATIONS.RDB$SYSTEM_FLAG = 0'
      '    AND RDB$RELATIONS.RDB$VIEW_BLR IS NULL'
      'ORDER BY'
      '    RDB$RELATIONS.RDB$RELATION_NAME,'
      '    RDB$RELATION_FIELDS.RDB$FIELD_POSITION;'
      '')
    Left = 360
    Top = 160
    object QTabelaAtualizacaoNM_TABELA: TWideStringField
      FieldName = 'NM_TABELA'
      Origin = 'RDB$RELATION_NAME'
      FixedChar = True
      Size = 31
    end
    object QTabelaAtualizacaoNM_FIELD: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'NM_FIELD'
      Origin = 'RDB$FIELD_NAME'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 31
    end
    object QTabelaAtualizacaoTP_FIELD: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'TP_FIELD'
      Origin = 'RDB$FIELD_TYPE'
      ProviderFlags = []
      ReadOnly = True
    end
    object QTabelaAtualizacaoNR_TAMANHO: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'NR_TAMANHO'
      Origin = 'RDB$FIELD_LENGTH'
      ProviderFlags = []
      ReadOnly = True
    end
    object QTabelaAtualizacaoNR_CASASDECIMAL: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'NR_CASASDECIMAL'
      Origin = 'RDB$FIELD_SCALE'
      ProviderFlags = []
      ReadOnly = True
    end
    object QTabelaAtualizacaoST_NULL: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'ST_NULL'
      Origin = 'RDB$NULL_FLAG'
      ProviderFlags = []
      ReadOnly = True
    end
    object QTabelaAtualizacaoDS_VALORPADRAO: TMemoField
      AutoGenerateValue = arDefault
      FieldName = 'DS_VALORPADRAO'
      Origin = 'RDB$DEFAULT_SOURCE'
      ProviderFlags = []
      ReadOnly = True
      BlobType = ftMemo
    end
    object QTabelaAtualizacaoDS_SUBTIPO: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'DS_SUBTIPO'
      Origin = 'RDB$FIELD_SUB_TYPE'
      ProviderFlags = []
      ReadOnly = True
    end
    object QTabelaAtualizacaoNR_CARACTERES: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'NR_CARACTERES'
      Origin = 'RDB$CHARACTER_LENGTH'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object QTabelaProducao: TFDQuery
    Connection = conProducao
    SQL.Strings = (
      'SELECT'
      '    RDB$RELATIONS.RDB$RELATION_NAME AS NM_TABELA,'
      '    RDB$RELATION_FIELDS.RDB$FIELD_NAME AS NM_FIELD,'
      '    RDB$FIELDS.RDB$FIELD_TYPE AS TP_FIELD,'
      '    RDB$FIELDS.RDB$FIELD_LENGTH AS NR_TAMANHO,'
      '    RDB$FIELDS.RDB$FIELD_SCALE AS NR_CASASDECIMAL,'
      '    RDB$RELATION_FIELDS.RDB$NULL_FLAG AS ST_NULL,'
      '    RDB$FIELDS.RDB$DEFAULT_SOURCE AS DS_VALORPADRAO,'
      '    RDB$FIELDS.RDB$FIELD_SUB_TYPE AS DS_SUBTIPO,'
      '    RDB$FIELDS.RDB$CHARACTER_LENGTH AS NR_CARACTERES'
      'FROM'
      '    RDB$RELATIONS'
      'JOIN'
      
        '    RDB$RELATION_FIELDS ON RDB$RELATIONS.RDB$RELATION_NAME = RDB' +
        '$RELATION_FIELDS.RDB$RELATION_NAME'
      'JOIN'
      
        '    RDB$FIELDS ON RDB$RELATION_FIELDS.RDB$FIELD_SOURCE = RDB$FIE' +
        'LDS.RDB$FIELD_NAME'
      'WHERE'
      '    RDB$RELATIONS.RDB$SYSTEM_FLAG = 0'
      '    AND RDB$RELATIONS.RDB$VIEW_BLR IS NULL'
      'ORDER BY'
      '    RDB$RELATIONS.RDB$RELATION_NAME,'
      '    RDB$RELATION_FIELDS.RDB$FIELD_POSITION;'
      '')
    Left = 360
    Top = 48
    object QTabelaProducaoNM_TABELA: TWideStringField
      FieldName = 'NM_TABELA'
      Origin = 'RDB$RELATION_NAME'
      FixedChar = True
      Size = 31
    end
    object QTabelaProducaoNM_FIELD: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'NM_FIELD'
      Origin = 'RDB$FIELD_NAME'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 31
    end
    object QTabelaProducaoTP_FIELD: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'TP_FIELD'
      Origin = 'RDB$FIELD_TYPE'
      ProviderFlags = []
      ReadOnly = True
    end
    object QTabelaProducaoNR_TAMANHO: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'NR_TAMANHO'
      Origin = 'RDB$FIELD_LENGTH'
      ProviderFlags = []
      ReadOnly = True
    end
    object QTabelaProducaoNR_CASASDECIMAL: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'NR_CASASDECIMAL'
      Origin = 'RDB$FIELD_SCALE'
      ProviderFlags = []
      ReadOnly = True
    end
    object QTabelaProducaoST_NULL: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'ST_NULL'
      Origin = 'RDB$NULL_FLAG'
      ProviderFlags = []
      ReadOnly = True
    end
    object QTabelaProducaoDS_VALORPADRAO: TMemoField
      AutoGenerateValue = arDefault
      FieldName = 'DS_VALORPADRAO'
      Origin = 'RDB$DEFAULT_SOURCE'
      ProviderFlags = []
      ReadOnly = True
      BlobType = ftMemo
    end
    object QTabelaProducaoDS_SUBTIPO: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'DS_SUBTIPO'
      Origin = 'RDB$FIELD_SUB_TYPE'
      ProviderFlags = []
      ReadOnly = True
    end
    object QTabelaProducaoNR_CARACTERES: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'NR_CARACTERES'
      Origin = 'RDB$CHARACTER_LENGTH'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object TTabelaProducao: TJvMemoryData
    FieldDefs = <>
    Left = 360
    Top = 104
    object TTabelaProducaoNM_TABELA: TWideStringField
      FieldName = 'NM_TABELA'
      Origin = 'RDB$RELATION_NAME'
      FixedChar = True
      Size = 31
    end
    object TTabelaProducaoNM_FIELD: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'NM_FIELD'
      Origin = 'RDB$FIELD_NAME'
      ProviderFlags = []
      FixedChar = True
      Size = 31
    end
    object TTabelaProducaoTP_FIELD: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'TP_FIELD'
      Origin = 'RDB$FIELD_TYPE'
      ProviderFlags = []
    end
    object TTabelaProducaoNR_TAMANHO: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'NR_TAMANHO'
      Origin = 'RDB$FIELD_LENGTH'
      ProviderFlags = []
    end
    object TTabelaProducaoNR_CASASDECIMAL: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'NR_CASASDECIMAL'
      Origin = 'RDB$FIELD_SCALE'
      ProviderFlags = []
    end
    object TTabelaProducaoST_NULL: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'ST_NULL'
      Origin = 'RDB$NULL_FLAG'
      ProviderFlags = []
    end
    object TTabelaProducaoDS_VALORPADRAO: TMemoField
      AutoGenerateValue = arDefault
      FieldName = 'DS_VALORPADRAO'
      Origin = 'RDB$DEFAULT_SOURCE'
      ProviderFlags = []
      BlobType = ftMemo
    end
    object TTabelaProducaoDS_SUBTIPO: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'DS_SUBTIPO'
      Origin = 'RDB$FIELD_SUB_TYPE'
      ProviderFlags = []
    end
    object TTabelaProducaoNR_CARACTERES: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'NR_CARACTERES'
      Origin = 'RDB$CHARACTER_LENGTH'
      ProviderFlags = []
    end
  end
  object TTabelaAtualizacao: TJvMemoryData
    FieldDefs = <>
    Left = 360
    Top = 224
    object TTabelaAtualizacaoNM_TABELA: TWideStringField
      FieldName = 'NM_TABELA'
      Origin = 'RDB$RELATION_NAME'
      FixedChar = True
      Size = 31
    end
    object TTabelaAtualizacaoNM_FIELD: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'NM_FIELD'
      Origin = 'RDB$FIELD_NAME'
      ProviderFlags = []
      FixedChar = True
      Size = 31
    end
    object TTabelaAtualizacaoTP_FIELD: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'TP_FIELD'
      Origin = 'RDB$FIELD_TYPE'
      ProviderFlags = []
    end
    object TTabelaAtualizacaoNR_TAMANHO: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'NR_TAMANHO'
      Origin = 'RDB$FIELD_LENGTH'
      ProviderFlags = []
    end
    object TTabelaAtualizacaoNR_CASASDECIMAL: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'NR_CASASDECIMAL'
      Origin = 'RDB$FIELD_SCALE'
      ProviderFlags = []
    end
    object TTabelaAtualizacaoST_NULL: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'ST_NULL'
      Origin = 'RDB$NULL_FLAG'
      ProviderFlags = []
    end
    object TTabelaAtualizacaoDS_VALORPADRAO: TMemoField
      AutoGenerateValue = arDefault
      FieldName = 'DS_VALORPADRAO'
      Origin = 'RDB$DEFAULT_SOURCE'
      ProviderFlags = []
      BlobType = ftMemo
    end
    object TTabelaAtualizacaoDS_SUBTIPO: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'DS_SUBTIPO'
      Origin = 'RDB$FIELD_SUB_TYPE'
      ProviderFlags = []
    end
    object TTabelaAtualizacaoNR_CARACTERES: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'NR_CARACTERES'
      Origin = 'RDB$CHARACTER_LENGTH'
      ProviderFlags = []
    end
  end
  object TCriaTabela: TJvMemoryData
    FieldDefs = <>
    Left = 360
    Top = 296
    object TCriaTabelaNM_TABELA: TWideStringField
      FieldName = 'NM_TABELA'
      Origin = 'RDB$RELATION_NAME'
      FixedChar = True
      Size = 31
    end
    object TCriaTabelaNM_FIELD: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'NM_FIELD'
      Origin = 'RDB$FIELD_NAME'
      ProviderFlags = []
      FixedChar = True
      Size = 31
    end
    object TCriaTabelaTP_FIELD: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'TP_FIELD'
      Origin = 'RDB$FIELD_TYPE'
      ProviderFlags = []
    end
    object TCriaTabelaNR_TAMANHO: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'NR_TAMANHO'
      Origin = 'RDB$FIELD_LENGTH'
      ProviderFlags = []
    end
    object TCriaTabelaNR_CASASDECIMAL: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'NR_CASASDECIMAL'
      Origin = 'RDB$FIELD_SCALE'
      ProviderFlags = []
    end
    object TCriaTabelaST_NULL: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'ST_NULL'
      Origin = 'RDB$NULL_FLAG'
      ProviderFlags = []
    end
    object TCriaTabelaDS_VALORPADRAO: TMemoField
      AutoGenerateValue = arDefault
      FieldName = 'DS_VALORPADRAO'
      Origin = 'RDB$DEFAULT_SOURCE'
      ProviderFlags = []
      BlobType = ftMemo
    end
    object TCriaTabelaDS_SUBTIPO: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'DS_SUBTIPO'
      Origin = 'RDB$FIELD_SUB_TYPE'
      ProviderFlags = []
    end
    object TCriaTabelaNR_CARACTERES: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'NR_CARACTERES'
      Origin = 'RDB$CHARACTER_LENGTH'
      ProviderFlags = []
    end
  end
  object TCriaField: TJvMemoryData
    FieldDefs = <>
    Left = 360
    Top = 352
    object TCriaFieldNM_TABELA: TWideStringField
      FieldName = 'NM_TABELA'
      Origin = 'RDB$RELATION_NAME'
      FixedChar = True
      Size = 31
    end
    object TCriaFieldNM_FIELD: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'NM_FIELD'
      Origin = 'RDB$FIELD_NAME'
      ProviderFlags = []
      FixedChar = True
      Size = 31
    end
    object TCriaFieldTP_FIELD: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'TP_FIELD'
      Origin = 'RDB$FIELD_TYPE'
      ProviderFlags = []
    end
    object TCriaFieldNR_TAMANHO: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'NR_TAMANHO'
      Origin = 'RDB$FIELD_LENGTH'
      ProviderFlags = []
    end
    object TCriaFieldNR_CASASDECIMAL: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'NR_CASASDECIMAL'
      Origin = 'RDB$FIELD_SCALE'
      ProviderFlags = []
    end
    object TCriaFieldST_NULL: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'ST_NULL'
      Origin = 'RDB$NULL_FLAG'
      ProviderFlags = []
    end
    object TCriaFieldDS_VALORPADRAO: TMemoField
      AutoGenerateValue = arDefault
      FieldName = 'DS_VALORPADRAO'
      Origin = 'RDB$DEFAULT_SOURCE'
      ProviderFlags = []
      BlobType = ftMemo
    end
    object TCriaFieldDS_SUBTIPO: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'DS_SUBTIPO'
      Origin = 'RDB$FIELD_SUB_TYPE'
      ProviderFlags = []
    end
    object TCriaFieldNR_CARACTERES: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'NR_CARACTERES'
      Origin = 'RDB$CHARACTER_LENGTH'
      ProviderFlags = []
    end
  end
  object TCampoAlterado: TJvMemoryData
    FieldDefs = <>
    Left = 360
    Top = 408
    object TCampoAlteradoNM_TABELA: TWideStringField
      FieldName = 'NM_TABELA'
      Origin = 'RDB$RELATION_NAME'
      FixedChar = True
      Size = 31
    end
    object TCampoAlteradoNM_FIELD: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'NM_FIELD'
      Origin = 'RDB$FIELD_NAME'
      ProviderFlags = []
      FixedChar = True
      Size = 31
    end
    object TCampoAlteradoTP_FIELD: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'TP_FIELD'
      Origin = 'RDB$FIELD_TYPE'
      ProviderFlags = []
    end
    object TCampoAlteradoNR_TAMANHO: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'NR_TAMANHO'
      Origin = 'RDB$FIELD_LENGTH'
      ProviderFlags = []
    end
    object TCampoAlteradoNR_CASASDECIMAL: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'NR_CASASDECIMAL'
      Origin = 'RDB$FIELD_SCALE'
      ProviderFlags = []
    end
    object TCampoAlteradoST_NULL: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'ST_NULL'
      Origin = 'RDB$NULL_FLAG'
      ProviderFlags = []
    end
    object TCampoAlteradoDS_VALORPADRAO: TMemoField
      AutoGenerateValue = arDefault
      FieldName = 'DS_VALORPADRAO'
      Origin = 'RDB$DEFAULT_SOURCE'
      ProviderFlags = []
      BlobType = ftMemo
    end
    object TCampoAlteradoDS_SUBTIPO: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'DS_SUBTIPO'
      Origin = 'RDB$FIELD_SUB_TYPE'
      ProviderFlags = []
    end
    object TCampoAlteradoNR_CARACTERES: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'NR_CARACTERES'
      Origin = 'RDB$CHARACTER_LENGTH'
      ProviderFlags = []
    end
    object TCampoAlteradoTP_CAMPOALTERADO: TStringField
      FieldName = 'TP_CAMPOALTERADO'
      Size = 1
    end
  end
  object TCriaGenerator: TJvMemoryData
    FieldDefs = <>
    Left = 216
    Top = 272
    object TCriaGeneratorSYSTEM_FLAG: TSmallintField
      FieldName = 'SYSTEM_FLAG'
      Origin = 'RDB$SYSTEM_FLAG'
    end
    object TCriaGeneratorDESCRIPTION: TMemoField
      FieldName = 'DESCRIPTION'
      Origin = 'RDB$DESCRIPTION'
      BlobType = ftMemo
    end
    object TCriaGeneratorGENERATOR_NAME: TStringField
      FieldName = 'GENERATOR_NAME'
      Size = 100
    end
  end
  object TTabela: TJvMemoryData
    FieldDefs = <>
    Left = 440
    Top = 296
    object TTabelaNM_TABELA: TWideStringField
      FieldName = 'NM_TABELA'
      Origin = 'RDB$RELATION_NAME'
      FixedChar = True
      Size = 31
    end
  end
end
