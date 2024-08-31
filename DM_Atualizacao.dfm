object DMDAtualizacao: TDMDAtualizacao
  OnCreate = DataModuleCreate
  Height = 480
  Width = 640
  object conProducao: TFDConnection
    LoginPrompt = False
    Left = 72
    Top = 40
  end
  object conAtualizacao: TFDConnection
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
      Required = True
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
      Required = True
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
end
