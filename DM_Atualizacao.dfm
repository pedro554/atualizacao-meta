object DMDAtualizacao: TDMDAtualizacao
  OnCreate = DataModuleCreate
  Height = 480
  Width = 861
  object conProducao: TFDConnection
    Params.Strings = (
      'Database=F:\git\atualizacao-meta\Win32\Debug\DADOS.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'DriverID=fB')
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
      'TABFIELD.RDB$RELATION_NAME    AS TABELA,'
      'TABFIELD.RDB$FIELD_NAME       AS CAMPO,'
      'TABFIELD.RDB$DEFAULT_SOURCE   AS DEFAULT_VALUE,'
      'TABFIELD.RDB$NULL_FLAG        AS NULL_FLAG,'
      'TABFIELD.RDB$FIELD_POSITION   AS POSICAO,'
      'TABFIELD.RDB$DESCRIPTION      AS ROTULO_CAMPO,'
      'FIELDDEF.RDB$CHARACTER_LENGTH AS TAMANHO,'
      'FIELDDEF.RDB$FIELD_PRECISION  AS PRECISAO,'
      'FIELDDEF.RDB$FIELD_TYPE       AS TIPO,'
      'FIELDDEF.RDB$FIELD_SUB_TYPE   AS SUBTIPO,'
      'FIELDDEF.RDB$FIELD_SCALE      AS CASASDECIMAL,'
      'FIELDDEF.RDB$FIELD_NAME       AS FIELD_CAMPO,'
      'TABDESC.RDB$DESCRIPTION       AS ROTULA_TABELA'
      ''
      'FROM'
      'RDB$RELATION_FIELDS TABFIELD'
      ''
      'JOIN RDB$FIELDS FIELDDEF ON'
      'TABFIELD.RDB$FIELD_SOURCE = FIELDDEF.RDB$FIELD_NAME'
      ''
      'JOIN RDB$RELATIONS TABDESC ON'
      'TABFIELD.RDB$RELATION_NAME = TABDESC.RDB$RELATION_NAME'
      ''
      'WHERE'
      'TABFIELD.RDB$SYSTEM_FLAG = 0 AND'
      'TABDESC.RDB$VIEW_SOURCE IS NULL'
      ''
      'ORDER BY'
      'TABFIELD.RDB$RELATION_NAME,'
      'TABFIELD.RDB$FIELD_POSITION')
    Left = 360
    Top = 160
    object QTabelaAtualizacaoTABELA: TWideStringField
      FieldName = 'TABELA'
      Origin = 'RDB$RELATION_NAME'
      FixedChar = True
      Size = 31
    end
    object QTabelaAtualizacaoCAMPO: TWideStringField
      FieldName = 'CAMPO'
      Origin = 'RDB$FIELD_NAME'
      FixedChar = True
      Size = 31
    end
    object QTabelaAtualizacaoDEFAULT_VALUE: TMemoField
      FieldName = 'DEFAULT_VALUE'
      Origin = 'RDB$DEFAULT_SOURCE'
      BlobType = ftMemo
    end
    object QTabelaAtualizacaoNULL_FLAG: TSmallintField
      FieldName = 'NULL_FLAG'
      Origin = 'RDB$NULL_FLAG'
    end
    object QTabelaAtualizacaoPOSICAO: TSmallintField
      FieldName = 'POSICAO'
      Origin = 'RDB$FIELD_POSITION'
    end
    object QTabelaAtualizacaoROTULO_CAMPO: TMemoField
      FieldName = 'ROTULO_CAMPO'
      Origin = 'RDB$DESCRIPTION'
      BlobType = ftMemo
    end
    object QTabelaAtualizacaoTAMANHO: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'TAMANHO'
      Origin = 'RDB$CHARACTER_LENGTH'
      ProviderFlags = []
      ReadOnly = True
    end
    object QTabelaAtualizacaoPRECISAO: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'PRECISAO'
      Origin = 'RDB$FIELD_PRECISION'
      ProviderFlags = []
      ReadOnly = True
    end
    object QTabelaAtualizacaoTIPO: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'TIPO'
      Origin = 'RDB$FIELD_TYPE'
      ProviderFlags = []
      ReadOnly = True
    end
    object QTabelaAtualizacaoSUBTIPO: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'SUBTIPO'
      Origin = 'RDB$FIELD_SUB_TYPE'
      ProviderFlags = []
      ReadOnly = True
    end
    object QTabelaAtualizacaoCASASDECIMAL: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'CASASDECIMAL'
      Origin = 'RDB$FIELD_SCALE'
      ProviderFlags = []
      ReadOnly = True
    end
    object QTabelaAtualizacaoFIELD_CAMPO: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'FIELD_CAMPO'
      Origin = 'RDB$FIELD_NAME'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 31
    end
    object QTabelaAtualizacaoROTULA_TABELA: TMemoField
      AutoGenerateValue = arDefault
      FieldName = 'ROTULA_TABELA'
      Origin = 'RDB$DESCRIPTION'
      ProviderFlags = []
      ReadOnly = True
      BlobType = ftMemo
    end
  end
  object QTabelaProducao: TFDQuery
    Connection = conProducao
    SQL.Strings = (
      'SELECT'
      'TABFIELD.RDB$RELATION_NAME    AS TABELA,'
      'TABFIELD.RDB$FIELD_NAME       AS CAMPO,'
      'TABFIELD.RDB$DEFAULT_SOURCE   AS DEFAULT_VALUE,'
      'TABFIELD.RDB$NULL_FLAG        AS NULL_FLAG,'
      'TABFIELD.RDB$FIELD_POSITION   AS POSICAO,'
      'TABFIELD.RDB$DESCRIPTION      AS ROTULO_CAMPO,'
      'FIELDDEF.RDB$CHARACTER_LENGTH AS TAMANHO,'
      'FIELDDEF.RDB$FIELD_PRECISION  AS PRECISAO,'
      'FIELDDEF.RDB$FIELD_TYPE       AS TIPO,'
      'FIELDDEF.RDB$FIELD_SUB_TYPE   AS SUBTIPO,'
      'FIELDDEF.RDB$FIELD_SCALE      AS CASASDECIMAL,'
      'FIELDDEF.RDB$FIELD_NAME       AS FIELD_CAMPO,'
      'TABDESC.RDB$DESCRIPTION       AS ROTULA_TABELA'
      ''
      'FROM'
      'RDB$RELATION_FIELDS TABFIELD'
      ''
      'JOIN RDB$FIELDS FIELDDEF ON'
      'TABFIELD.RDB$FIELD_SOURCE = FIELDDEF.RDB$FIELD_NAME'
      ''
      'JOIN RDB$RELATIONS TABDESC ON'
      'TABFIELD.RDB$RELATION_NAME = TABDESC.RDB$RELATION_NAME'
      ''
      'WHERE'
      'TABFIELD.RDB$SYSTEM_FLAG = 0 AND'
      'TABDESC.RDB$VIEW_SOURCE IS NULL'
      ''
      'ORDER BY'
      'TABFIELD.RDB$RELATION_NAME,'
      'TABFIELD.RDB$FIELD_POSITION')
    Left = 360
    Top = 48
    object QTabelaProducaoTABELA: TWideStringField
      FieldName = 'TABELA'
      Origin = 'RDB$RELATION_NAME'
      FixedChar = True
      Size = 31
    end
    object QTabelaProducaoCAMPO: TWideStringField
      FieldName = 'CAMPO'
      Origin = 'RDB$FIELD_NAME'
      FixedChar = True
      Size = 31
    end
    object QTabelaProducaoDEFAULT_VALUE: TMemoField
      FieldName = 'DEFAULT_VALUE'
      Origin = 'RDB$DEFAULT_SOURCE'
      BlobType = ftMemo
    end
    object QTabelaProducaoNULL_FLAG: TSmallintField
      FieldName = 'NULL_FLAG'
      Origin = 'RDB$NULL_FLAG'
    end
    object QTabelaProducaoPOSICAO: TSmallintField
      FieldName = 'POSICAO'
      Origin = 'RDB$FIELD_POSITION'
    end
    object QTabelaProducaoROTULO_CAMPO: TMemoField
      FieldName = 'ROTULO_CAMPO'
      Origin = 'RDB$DESCRIPTION'
      BlobType = ftMemo
    end
    object QTabelaProducaoTAMANHO: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'TAMANHO'
      Origin = 'RDB$CHARACTER_LENGTH'
      ProviderFlags = []
      ReadOnly = True
    end
    object QTabelaProducaoPRECISAO: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'PRECISAO'
      Origin = 'RDB$FIELD_PRECISION'
      ProviderFlags = []
      ReadOnly = True
    end
    object QTabelaProducaoTIPO: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'TIPO'
      Origin = 'RDB$FIELD_TYPE'
      ProviderFlags = []
      ReadOnly = True
    end
    object QTabelaProducaoSUBTIPO: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'SUBTIPO'
      Origin = 'RDB$FIELD_SUB_TYPE'
      ProviderFlags = []
      ReadOnly = True
    end
    object QTabelaProducaoCASASDECIMAL: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'CASASDECIMAL'
      Origin = 'RDB$FIELD_SCALE'
      ProviderFlags = []
      ReadOnly = True
    end
    object QTabelaProducaoFIELD_CAMPO: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'FIELD_CAMPO'
      Origin = 'RDB$FIELD_NAME'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 31
    end
    object QTabelaProducaoROTULA_TABELA: TMemoField
      AutoGenerateValue = arDefault
      FieldName = 'ROTULA_TABELA'
      Origin = 'RDB$DESCRIPTION'
      ProviderFlags = []
      ReadOnly = True
      BlobType = ftMemo
    end
  end
  object TTabelaProducao: TJvMemoryData
    FieldDefs = <>
    Left = 360
    Top = 104
    object TTabelaProducaoTABELA: TWideStringField
      FieldName = 'TABELA'
      Origin = 'RDB$RELATION_NAME'
      FixedChar = True
      Size = 31
    end
    object TTabelaProducaoCAMPO: TWideStringField
      FieldName = 'CAMPO'
      Origin = 'RDB$FIELD_NAME'
      FixedChar = True
      Size = 31
    end
    object TTabelaProducaoDEFAULT_VALUE: TMemoField
      FieldName = 'DEFAULT_VALUE'
      Origin = 'RDB$DEFAULT_SOURCE'
      BlobType = ftMemo
    end
    object TTabelaProducaoNULL_FLAG: TSmallintField
      FieldName = 'NULL_FLAG'
      Origin = 'RDB$NULL_FLAG'
    end
    object TTabelaProducaoPOSICAO: TSmallintField
      FieldName = 'POSICAO'
      Origin = 'RDB$FIELD_POSITION'
    end
    object TTabelaProducaoROTULO_CAMPO: TMemoField
      FieldName = 'ROTULO_CAMPO'
      Origin = 'RDB$DESCRIPTION'
      BlobType = ftMemo
    end
    object TTabelaProducaoTAMANHO: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'TAMANHO'
      Origin = 'RDB$CHARACTER_LENGTH'
      ProviderFlags = []
    end
    object TTabelaProducaoPRECISAO: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'PRECISAO'
      Origin = 'RDB$FIELD_PRECISION'
      ProviderFlags = []
    end
    object TTabelaProducaoTIPO: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'TIPO'
      Origin = 'RDB$FIELD_TYPE'
      ProviderFlags = []
    end
    object TTabelaProducaoSUBTIPO: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'SUBTIPO'
      Origin = 'RDB$FIELD_SUB_TYPE'
      ProviderFlags = []
    end
    object TTabelaProducaoCASASDECIMAL: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'CASASDECIMAL'
      Origin = 'RDB$FIELD_SCALE'
      ProviderFlags = []
    end
    object TTabelaProducaoFIELD_CAMPO: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'FIELD_CAMPO'
      Origin = 'RDB$FIELD_NAME'
      ProviderFlags = []
      FixedChar = True
      Size = 31
    end
    object TTabelaProducaoROTULA_TABELA: TMemoField
      AutoGenerateValue = arDefault
      FieldName = 'ROTULA_TABELA'
      Origin = 'RDB$DESCRIPTION'
      ProviderFlags = []
      BlobType = ftMemo
    end
  end
  object TTabelaAtualizacao: TJvMemoryData
    FieldDefs = <>
    Left = 360
    Top = 224
    object TTabelaAtualizacaoTABELA: TWideStringField
      FieldName = 'TABELA'
      Origin = 'RDB$RELATION_NAME'
      FixedChar = True
      Size = 31
    end
    object TTabelaAtualizacaoCAMPO: TWideStringField
      FieldName = 'CAMPO'
      Origin = 'RDB$FIELD_NAME'
      FixedChar = True
      Size = 31
    end
    object TTabelaAtualizacaoDEFAULT_VALUE: TMemoField
      FieldName = 'DEFAULT_VALUE'
      Origin = 'RDB$DEFAULT_SOURCE'
      BlobType = ftMemo
    end
    object TTabelaAtualizacaoNULL_FLAG: TSmallintField
      FieldName = 'NULL_FLAG'
      Origin = 'RDB$NULL_FLAG'
    end
    object TTabelaAtualizacaoPOSICAO: TSmallintField
      FieldName = 'POSICAO'
      Origin = 'RDB$FIELD_POSITION'
    end
    object TTabelaAtualizacaoROTULO_CAMPO: TMemoField
      FieldName = 'ROTULO_CAMPO'
      Origin = 'RDB$DESCRIPTION'
      BlobType = ftMemo
    end
    object TTabelaAtualizacaoTAMANHO: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'TAMANHO'
      Origin = 'RDB$CHARACTER_LENGTH'
      ProviderFlags = []
    end
    object TTabelaAtualizacaoPRECISAO: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'PRECISAO'
      Origin = 'RDB$FIELD_PRECISION'
      ProviderFlags = []
    end
    object TTabelaAtualizacaoTIPO: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'TIPO'
      Origin = 'RDB$FIELD_TYPE'
      ProviderFlags = []
    end
    object TTabelaAtualizacaoSUBTIPO: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'SUBTIPO'
      Origin = 'RDB$FIELD_SUB_TYPE'
      ProviderFlags = []
    end
    object TTabelaAtualizacaoCASASDECIMAL: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'CASASDECIMAL'
      Origin = 'RDB$FIELD_SCALE'
      ProviderFlags = []
    end
    object TTabelaAtualizacaoFIELD_CAMPO: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'FIELD_CAMPO'
      Origin = 'RDB$FIELD_NAME'
      ProviderFlags = []
      FixedChar = True
      Size = 31
    end
    object TTabelaAtualizacaoROTULA_TABELA: TMemoField
      AutoGenerateValue = arDefault
      FieldName = 'ROTULA_TABELA'
      Origin = 'RDB$DESCRIPTION'
      ProviderFlags = []
      BlobType = ftMemo
    end
  end
  object TCriaTabela: TJvMemoryData
    FieldDefs = <>
    Left = 360
    Top = 296
    object TCriaTabelaTABELA: TWideStringField
      FieldName = 'TABELA'
      Origin = 'RDB$RELATION_NAME'
      FixedChar = True
      Size = 31
    end
    object TCriaTabelaCAMPO: TWideStringField
      FieldName = 'CAMPO'
      Origin = 'RDB$FIELD_NAME'
      FixedChar = True
      Size = 31
    end
    object TCriaTabelaDEFAULT_VALUE: TMemoField
      FieldName = 'DEFAULT_VALUE'
      Origin = 'RDB$DEFAULT_SOURCE'
      BlobType = ftMemo
    end
    object TCriaTabelaNULL_FLAG: TSmallintField
      FieldName = 'NULL_FLAG'
      Origin = 'RDB$NULL_FLAG'
    end
    object TCriaTabelaPOSICAO: TSmallintField
      FieldName = 'POSICAO'
      Origin = 'RDB$FIELD_POSITION'
    end
    object TCriaTabelaROTULO_CAMPO: TMemoField
      FieldName = 'ROTULO_CAMPO'
      Origin = 'RDB$DESCRIPTION'
      BlobType = ftMemo
    end
    object TCriaTabelaTAMANHO: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'TAMANHO'
      Origin = 'RDB$CHARACTER_LENGTH'
      ProviderFlags = []
    end
    object TCriaTabelaPRECISAO: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'PRECISAO'
      Origin = 'RDB$FIELD_PRECISION'
      ProviderFlags = []
    end
    object TCriaTabelaTIPO: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'TIPO'
      Origin = 'RDB$FIELD_TYPE'
      ProviderFlags = []
    end
    object TCriaTabelaSUBTIPO: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'SUBTIPO'
      Origin = 'RDB$FIELD_SUB_TYPE'
      ProviderFlags = []
    end
    object TCriaTabelaCASASDECIMAL: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'CASASDECIMAL'
      Origin = 'RDB$FIELD_SCALE'
      ProviderFlags = []
    end
    object TCriaTabelaFIELD_CAMPO: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'FIELD_CAMPO'
      Origin = 'RDB$FIELD_NAME'
      ProviderFlags = []
      FixedChar = True
      Size = 31
    end
    object TCriaTabelaROTULA_TABELA: TMemoField
      AutoGenerateValue = arDefault
      FieldName = 'ROTULA_TABELA'
      Origin = 'RDB$DESCRIPTION'
      ProviderFlags = []
      BlobType = ftMemo
    end
  end
  object TCriaField: TJvMemoryData
    FieldDefs = <>
    Left = 360
    Top = 352
    object TCriaFieldTABELA: TWideStringField
      FieldName = 'TABELA'
      Origin = 'RDB$RELATION_NAME'
      FixedChar = True
      Size = 31
    end
    object TCriaFieldCAMPO: TWideStringField
      FieldName = 'CAMPO'
      Origin = 'RDB$FIELD_NAME'
      FixedChar = True
      Size = 31
    end
    object TCriaFieldDEFAULT_VALUE: TMemoField
      FieldName = 'DEFAULT_VALUE'
      Origin = 'RDB$DEFAULT_SOURCE'
      BlobType = ftMemo
    end
    object TCriaFieldNULL_FLAG: TSmallintField
      FieldName = 'NULL_FLAG'
      Origin = 'RDB$NULL_FLAG'
    end
    object TCriaFieldPOSICAO: TSmallintField
      FieldName = 'POSICAO'
      Origin = 'RDB$FIELD_POSITION'
    end
    object TCriaFieldROTULO_CAMPO: TMemoField
      FieldName = 'ROTULO_CAMPO'
      Origin = 'RDB$DESCRIPTION'
      BlobType = ftMemo
    end
    object TCriaFieldTAMANHO: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'TAMANHO'
      Origin = 'RDB$CHARACTER_LENGTH'
      ProviderFlags = []
    end
    object TCriaFieldPRECISAO: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'PRECISAO'
      Origin = 'RDB$FIELD_PRECISION'
      ProviderFlags = []
    end
    object TCriaFieldTIPO: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'TIPO'
      Origin = 'RDB$FIELD_TYPE'
      ProviderFlags = []
    end
    object TCriaFieldSUBTIPO: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'SUBTIPO'
      Origin = 'RDB$FIELD_SUB_TYPE'
      ProviderFlags = []
    end
    object TCriaFieldCASASDECIMAL: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'CASASDECIMAL'
      Origin = 'RDB$FIELD_SCALE'
      ProviderFlags = []
    end
    object TCriaFieldFIELD_CAMPO: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'FIELD_CAMPO'
      Origin = 'RDB$FIELD_NAME'
      ProviderFlags = []
      FixedChar = True
      Size = 31
    end
    object TCriaFieldROTULA_TABELA: TMemoField
      AutoGenerateValue = arDefault
      FieldName = 'ROTULA_TABELA'
      Origin = 'RDB$DESCRIPTION'
      ProviderFlags = []
      BlobType = ftMemo
    end
  end
  object TCampoAlterado: TJvMemoryData
    FieldDefs = <>
    Left = 360
    Top = 408
    object TCampoAlteradoTABELA: TWideStringField
      FieldName = 'TABELA'
      Origin = 'RDB$RELATION_NAME'
      FixedChar = True
      Size = 31
    end
    object TCampoAlteradoCAMPO: TWideStringField
      FieldName = 'CAMPO'
      Origin = 'RDB$FIELD_NAME'
      FixedChar = True
      Size = 31
    end
    object TCampoAlteradoDEFAULT_VALUE: TMemoField
      FieldName = 'DEFAULT_VALUE'
      Origin = 'RDB$DEFAULT_SOURCE'
      BlobType = ftMemo
    end
    object TCampoAlteradoNULL_FLAG: TSmallintField
      FieldName = 'NULL_FLAG'
      Origin = 'RDB$NULL_FLAG'
    end
    object TCampoAlteradoPOSICAO: TSmallintField
      FieldName = 'POSICAO'
      Origin = 'RDB$FIELD_POSITION'
    end
    object TCampoAlteradoROTULO_CAMPO: TMemoField
      FieldName = 'ROTULO_CAMPO'
      Origin = 'RDB$DESCRIPTION'
      BlobType = ftMemo
    end
    object TCampoAlteradoTAMANHO: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'TAMANHO'
      Origin = 'RDB$CHARACTER_LENGTH'
      ProviderFlags = []
    end
    object TCampoAlteradoPRECISAO: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'PRECISAO'
      Origin = 'RDB$FIELD_PRECISION'
      ProviderFlags = []
    end
    object TCampoAlteradoTIPO: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'TIPO'
      Origin = 'RDB$FIELD_TYPE'
      ProviderFlags = []
    end
    object TCampoAlteradoSUBTIPO: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'SUBTIPO'
      Origin = 'RDB$FIELD_SUB_TYPE'
      ProviderFlags = []
    end
    object TCampoAlteradoCASASDECIMAL: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'CASASDECIMAL'
      Origin = 'RDB$FIELD_SCALE'
      ProviderFlags = []
    end
    object TCampoAlteradoFIELD_CAMPO: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'FIELD_CAMPO'
      Origin = 'RDB$FIELD_NAME'
      ProviderFlags = []
      FixedChar = True
      Size = 31
    end
    object TCampoAlteradoROTULA_TABELA: TMemoField
      AutoGenerateValue = arDefault
      FieldName = 'ROTULA_TABELA'
      Origin = 'RDB$DESCRIPTION'
      ProviderFlags = []
      BlobType = ftMemo
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
    object TTabelaTABELA: TWideStringField
      FieldName = 'TABELA'
      Origin = 'RDB$RELATION_NAME'
      FixedChar = True
      Size = 31
    end
  end
  object QControlesisAtt: TFDQuery
    Connection = conAtualizacao
    SQL.Strings = (
      'SELECT'
      '*'
      ''
      'FROM'
      'CONTROLESIS')
    Left = 520
    Top = 168
    object QControlesisAttNM_TABELA: TStringField
      FieldName = 'NM_TABELA'
      Origin = 'NM_TABELA'
      Required = True
      Size = 50
    end
    object QControlesisAttDT_ATUALIZACAO: TSQLTimeStampField
      FieldName = 'DT_ATUALIZACAO'
      Origin = 'DT_ATUALIZACAO'
    end
  end
  object QControlesisProd: TFDQuery
    Connection = conProducao
    SQL.Strings = (
      'SELECT'
      '*'
      ''
      'FROM'
      'CONTROLESIS')
    Left = 520
    Top = 56
    object QControlesisProdNM_TABELA: TStringField
      FieldName = 'NM_TABELA'
      Origin = 'NM_TABELA'
      Required = True
      Size = 50
    end
    object QControlesisProdDT_ATUALIZACAO: TSQLTimeStampField
      FieldName = 'DT_ATUALIZACAO'
      Origin = 'DT_ATUALIZACAO'
    end
  end
  object TControlesis: TJvMemoryData
    FieldDefs = <>
    Left = 520
    Top = 112
    object TControlesisNM_TABELA: TWideStringField
      FieldName = 'NM_TABELA'
      Origin = 'RDB$RELATION_NAME'
      FixedChar = True
      Size = 31
    end
    object TControlesisDT_ATUALIZACAO: TDateTimeField
      FieldName = 'DT_ATUALIZACAO'
    end
  end
  object QAbreTabAtt: TFDQuery
    Connection = conAtualizacao
    SQL.Strings = (
      'SELECT'
      '*'
      ''
      'FROM'
      'CONTROLESIS')
    Left = 640
    Top = 168
  end
  object QAbreTabProd: TFDQuery
    Connection = conProducao
    SQL.Strings = (
      'SELECT'
      '*'
      ''
      'FROM'
      'CONTROLESIS')
    Left = 640
    Top = 56
  end
  object QRetornaPK: TFDQuery
    Connection = conAtualizacao
    SQL.Strings = (
      'SELECT '
      '    RDB$INDEX_SEGMENTS.RDB$FIELD_NAME AS NM_CAMPO,'
      '    RDB$INDICES.RDB$INDEX_NAME AS NM_INDICE'
      'FROM '
      '    RDB$INDEX_SEGMENTS'
      'JOIN '
      
        '    RDB$INDICES ON RDB$INDEX_SEGMENTS.RDB$INDEX_NAME = RDB$INDIC' +
        'ES.RDB$INDEX_NAME'
      'WHERE '
      '    RDB$INDICES.RDB$INDEX_TYPE = 0'
      '    AND RDB$INDICES.RDB$RELATION_NAME = :TABELA'
      'ORDER BY '
      '    RDB$INDEX_SEGMENTS.RDB$FIELD_POSITION;')
    Left = 72
    Top = 320
    ParamData = <
      item
        Name = 'TABELA'
        DataType = ftFixedWideChar
        ParamType = ptInput
        Size = 31
        Value = Null
      end>
    object QRetornaPKNM_CAMPO: TWideStringField
      FieldName = 'NM_CAMPO'
      Origin = 'RDB$FIELD_NAME'
      FixedChar = True
      Size = 31
    end
    object QRetornaPKNM_INDICE: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'NM_INDICE'
      Origin = 'RDB$INDEX_NAME'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 31
    end
  end
end
