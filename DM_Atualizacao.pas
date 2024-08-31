unit DM_Atualizacao;

interface

uses
  IniFiles,
  Variants,
  Constantes,
  Vcl.ComCtrls,
  Vcl.Forms,
  Vcl.StdCtrls,
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Phys.MySQLDef, FireDAC.Phys.MySQL,
  FireDAC.Phys.FBDef, FireDAC.Phys.IBBase, FireDAC.Phys.FB,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  JvMemoryDataset, FireDAC.Comp.DataSet, IdBaseComponent, IdAntiFreezeBase,
  IdAntiFreeze;

type
  TDMDAtualizacao = class(TDataModule)
    conProducao: TFDConnection;
    conAtualizacao: TFDConnection;
    Driver: TFDPhysFBDriverLink;
    QGeneratorProducao: TFDQuery;
    QGeneratorProducaoGENERATOR_NAME: TWideStringField;
    QGeneratorProducaoSYSTEM_FLAG: TSmallintField;
    QGeneratorProducaoDESCRIPTION: TMemoField;
    TGeneratorProducao: TJvMemoryData;
    TGeneratorProducaoSYSTEM_FLAG: TSmallintField;
    TGeneratorProducaoDESCRIPTION: TMemoField;
    TGeneratorProducaoGENERATOR_NAME: TStringField;
    QGeneratorAtualizacao: TFDQuery;
    WideStringField1: TWideStringField;
    SmallintField2: TSmallintField;
    MemoField2: TMemoField;
    TGeneratorAtualizacao: TJvMemoryData;
    TGeneratorAtualizacaoSYSTEM_FLAG: TSmallintField;
    TGeneratorAtualizacaoDESCRIPTION: TMemoField;
    TGeneratorAtualizacaoGENERATOR_NAME: TStringField;
    Transacao: TFDTransaction;
    QExecutaProducao: TFDQuery;
    QTabelaAtualizacao: TFDQuery;
    QTabelaAtualizacaoNM_TABELA: TWideStringField;
    QTabelaProducao: TFDQuery;
    QTabelaProducaoNM_TABELA: TWideStringField;
    TTabelaProducao: TJvMemoryData;
    TTabelaAtualizacao: TJvMemoryData;
    QTabelaProducaoNM_FIELD: TWideStringField;
    QTabelaProducaoTP_FIELD: TSmallintField;
    QTabelaProducaoNR_TAMANHO: TSmallintField;
    QTabelaProducaoNR_CASASDECIMAL: TSmallintField;
    QTabelaProducaoST_NULL: TSmallintField;
    QTabelaProducaoDS_VALORPADRAO: TMemoField;
    QTabelaProducaoDS_SUBTIPO: TSmallintField;
    QTabelaProducaoNR_CARACTERES: TSmallintField;
    QTabelaAtualizacaoNM_FIELD: TWideStringField;
    QTabelaAtualizacaoTP_FIELD: TSmallintField;
    QTabelaAtualizacaoNR_TAMANHO: TSmallintField;
    QTabelaAtualizacaoNR_CASASDECIMAL: TSmallintField;
    QTabelaAtualizacaoST_NULL: TSmallintField;
    QTabelaAtualizacaoDS_VALORPADRAO: TMemoField;
    QTabelaAtualizacaoDS_SUBTIPO: TSmallintField;
    QTabelaAtualizacaoNR_CARACTERES: TSmallintField;
    TTabelaProducaoNM_TABELA: TWideStringField;
    TTabelaProducaoNM_FIELD: TWideStringField;
    TTabelaProducaoTP_FIELD: TSmallintField;
    TTabelaProducaoNR_TAMANHO: TSmallintField;
    TTabelaProducaoNR_CASASDECIMAL: TSmallintField;
    TTabelaProducaoST_NULL: TSmallintField;
    TTabelaProducaoDS_VALORPADRAO: TMemoField;
    TTabelaProducaoDS_SUBTIPO: TSmallintField;
    TTabelaProducaoNR_CARACTERES: TSmallintField;
    TTabelaAtualizacaoNM_TABELA: TWideStringField;
    TTabelaAtualizacaoNM_FIELD: TWideStringField;
    TTabelaAtualizacaoTP_FIELD: TSmallintField;
    TTabelaAtualizacaoNR_TAMANHO: TSmallintField;
    TTabelaAtualizacaoNR_CASASDECIMAL: TSmallintField;
    TTabelaAtualizacaoST_NULL: TSmallintField;
    TTabelaAtualizacaoDS_VALORPADRAO: TMemoField;
    TTabelaAtualizacaoDS_SUBTIPO: TSmallintField;
    TTabelaAtualizacaoNR_CARACTERES: TSmallintField;
    TCriaTabela: TJvMemoryData;
    TCriaTabelaNM_TABELA: TWideStringField;
    TCriaTabelaNM_FIELD: TWideStringField;
    TCriaTabelaTP_FIELD: TSmallintField;
    TCriaTabelaNR_TAMANHO: TSmallintField;
    TCriaTabelaNR_CASASDECIMAL: TSmallintField;
    TCriaTabelaST_NULL: TSmallintField;
    TCriaTabelaDS_VALORPADRAO: TMemoField;
    TCriaTabelaDS_SUBTIPO: TSmallintField;
    TCriaTabelaNR_CARACTERES: TSmallintField;
    TCriaField: TJvMemoryData;
    TCriaFieldNM_TABELA: TWideStringField;
    TCriaFieldNM_FIELD: TWideStringField;
    TCriaFieldTP_FIELD: TSmallintField;
    TCriaFieldNR_TAMANHO: TSmallintField;
    TCriaFieldNR_CASASDECIMAL: TSmallintField;
    TCriaFieldST_NULL: TSmallintField;
    TCriaFieldDS_VALORPADRAO: TMemoField;
    TCriaFieldDS_SUBTIPO: TSmallintField;
    TCriaFieldNR_CARACTERES: TSmallintField;
    TCampoAlterado: TJvMemoryData;
    TCampoAlteradoNM_TABELA: TWideStringField;
    TCampoAlteradoNM_FIELD: TWideStringField;
    TCampoAlteradoTP_FIELD: TSmallintField;
    TCampoAlteradoNR_TAMANHO: TSmallintField;
    TCampoAlteradoNR_CASASDECIMAL: TSmallintField;
    TCampoAlteradoST_NULL: TSmallintField;
    TCampoAlteradoDS_VALORPADRAO: TMemoField;
    TCampoAlteradoDS_SUBTIPO: TSmallintField;
    TCampoAlteradoNR_CARACTERES: TSmallintField;
    TCampoAlteradoTP_CAMPOALTERADO: TStringField;
    TCriaGenerator: TJvMemoryData;
    TCriaGeneratorSYSTEM_FLAG: TSmallintField;
    TCriaGeneratorDESCRIPTION: TMemoField;
    TCriaGeneratorGENERATOR_NAME: TStringField;
    TTabela: TJvMemoryData;
    TTabelaNM_TABELA: TWideStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
    iArq: TIniFile;
    procedure ConectaBancoAtualizacao;
    procedure ConectaBancoProducao;
    procedure ConfiguraConexao(AConexao: TFDConnection; AIni: TIniFile; ABase: String);
    procedure PegaDiferencaGenerators;
    procedure CriaGenerator;
    procedure PegaDiferencaTabelas;
    function CriaTabela: Boolean;
    procedure CopiaTabelaInexistente(ATabela: String);
    function TipoCampoAlterado: Boolean;
    function TamanhoCampoAlterado: Boolean;
    function ConverteTipo(Tipo: Integer): String;
    procedure AtualizaField;
    procedure CriaField;
    procedure IncrementaProgresso;
    procedure IncrementaSubProgresso;
    procedure ResetaProgresso;
    { Private declarations }
  public
    Progresso: TProgressBar;
    SubProgresso: TProgressBar;
    function AtualizaBanco: Boolean;
    function TemAtualizacao: Boolean;
    { Public declarations }
  end;

const
  C_TIPO: String = 'T';
  C_TAMANHO: string = 'N';

var
  DMDAtualizacao: TDMDAtualizacao;

implementation
uses Funcoes;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDMDAtualizacao }

procedure TDMDAtualizacao.AtualizaField;
var
  lvTabela, lvCampoTemp, lvCampo, lvTipoCampo: string;
begin
  if TCampoAlterado.IsEmpty then
    Exit;

  TCampoAlterado.First;
  while not TCampoAlterado.Eof do
  begin
    lvTabela    := TCampoAlteradoNM_TABELA.AsString;
    lvCampo     := TCampoAlteradoNM_FIELD.AsString;
    lvCampoTemp := lvCampo + '_TEMP ';

    if PesquisaOcorrencia(TCampoAlteradoTP_FIELD.AsInteger, [C_DECIMAL, C_NUMERIC]) then
      lvTipoCampo := ConverteTipo(TCampoAlteradoTP_FIELD.AsInteger) + '(' + TCampoAlteradoNR_TAMANHO.AsString + ',' + IntToStr(Abs(TCampoAlteradoNR_CASASDECIMAL.AsInteger)) + ')'
    else if TCampoAlteradoTP_FIELD.AsInteger = C_BLOB then
      lvTipoCampo := 'BLOB SUB_TYPE 0'
    else if TCampoAlteradoTP_FIELD.AsInteger = C_VARCHAR then
      lvTipoCampo := 'VARCHAR(' + TCampoAlteradoNR_CARACTERES.AsString + ')'
    else
      lvTipoCampo := ConverteTipo(TCampoAlteradoTP_FIELD.AsInteger);

    // 1. Adicionar uma nova coluna temporária
    QExecutaProducao.ExecSQL('ALTER TABLE ' + lvTabela + ' ADD ' + lvCampoTemp + ' ' + lvTipoCampo + ';');
    // 2. Converter e copiar os dados
    if PesquisaOcorrencia(TCampoAlteradoTP_FIELD.AsInteger, [C_BLOB, C_VARCHAR]) then
      QExecutaProducao.ExecSQL('UPDATE ' + lvTabela + ' SET ' + lvCampoTemp + ' = ' + lvCampo + ';')
    else
      QExecutaProducao.ExecSQL('UPDATE ' + lvTabela + ' SET ' + lvCampoTemp + ' = CAST(' + lvCampo + ' AS ' + lvTipoCampo + ');');
    // 3. Excluir a coluna antiga
    QExecutaProducao.ExecSQL('ALTER TABLE ' + lvTabela + ' DROP ' + lvCampo + ';');
    // 4. Renomear a nova coluna para o nome da coluna antiga
    QExecutaProducao.ExecSQL('ALTER TABLE ' + lvTabela + ' ALTER COLUMN ' + lvCampoTemp + ' TO ' + lvCampo + ';');
    TCampoAlterado.Delete;
  end;
end;

//***********************************************************
procedure TDMDAtualizacao.ConectaBancoAtualizacao;
begin
  ConfiguraConexao(conAtualizacao, iArq, 'BDAtt');
  try
    conAtualizacao.Connected := true;
  Except
    MyMessage('Não foi possivel conectar na base de dados!' + sLineBreak +
              'Verifique e pasta ' + conAtualizacao.Params.Values['Database'] + sLineBreak +
              'Se não encontrar esse arquivo restaure um backup. ' + sLineBreak +
              'Ou contate o suporte do sistema!');
  end;
end;

 //***********************************************************
procedure TDMDAtualizacao.ConectaBancoProducao;
begin
  ConfiguraConexao(conProducao, iArq, 'Path');
  try
    conProducao.Connected := true;
  Except
    MyMessage('Não foi possivel conectar na base de dados!' + sLineBreak +
              'Verifique e pasta ' + conProducao.Params.Values['Database'] + sLineBreak +
              'Se não encontrar esse arquivo restaure um backup. ' + sLineBreak +
              'Ou contate o suporte do sistema!');
  end;
end;

 //***********************************************************
procedure TDMDAtualizacao.ConfiguraConexao(AConexao: TFDConnection; AIni: TIniFile; ABase: String);
begin
  AConexao.Params.Values['User_Name']   := AIni.ReadString('BD', 'USER', 'SYSDBA');
  AConexao.Params.Values['Password']    := AIni.ReadString('BD', 'PASS', 'masterkey');
  AConexao.Params.Values['Port']        := AIni.ReadString('BD', 'PORT', '3050');
  AConexao.Params.Values['DriverID']    := 'FB';
  AConexao.Params.Values['Server']      := AIni.ReadString('BD', 'IP', '');
  AConexao.Params.Values['Database']    := AIni.ReadString('BD', ABase, '');
  Driver.VendorLib                      := GetCurrentDir + '\fbclient.dll';
end;

//***********************************************************
procedure TDMDAtualizacao.DataModuleCreate(Sender: TObject);
begin
  iArq := TIniFile.Create(GetCurrentDir + '\Banco.ini');
  try
    ConectaBancoProducao;
    ConectaBancoAtualizacao;
  finally
    FreeAndNil(iArq);
  end;
end;

//***********************************************************
function TDMDAtualizacao.AtualizaBanco: Boolean;
begin
  Result := False;
  try
    CriaTabela;
    CriaGenerator;
    CriaField;
    AtualizaField;
    MyMessage('Banco de dados atualizado!');
    Result := True;
  except
    on e: exception do
    begin
      GravaLog('Falha ao atualizar o banco de dados: ' + e.Message);
      MyMessage('Falha ao atualizar banco de dados.');
    end;
  end;
end;

 //***********************************************************
procedure TDMDAtualizacao.CriaField;
var
  lvTipoCampo: string;
begin
  if TCriaField.IsEmpty then
    Exit;

  ResetaProgresso;
  Progresso.Max := TCriaField.RecordCount;
  SubProgresso.Max := TCriaField.RecordCount;

  TCriaField.First;
  while not TCriaField.Eof do
  begin
    if PesquisaOcorrencia(TCriaFieldTP_FIELD.AsInteger, [C_DECIMAL, C_NUMERIC]) then
      lvTipoCampo := ConverteTipo(TCriaFieldTP_FIELD.AsInteger) + '(' + TCriaFieldNR_TAMANHO.AsString + ',' + IntToStr(Abs(TCriaFieldNR_CASASDECIMAL.AsInteger)) + ')'
    else if TCriaFieldTP_FIELD.AsInteger = C_BLOB then
      lvTipoCampo := 'BLOB SUB_TYPE 0'
    else if TCriaFieldTP_FIELD.AsInteger = C_VARCHAR then
      lvTipoCampo := 'VARCHAR(' + TCriaFieldNR_CARACTERES.AsString + ')'
    else
      lvTipoCampo := ConverteTipo(TCriaFieldTP_FIELD.AsInteger);

    GravaLog('Criando Field ' + TCriaFieldNM_FIELD.AsString + ' na tabela ' + TCriaFieldNM_TABELA.AsString);
    QExecutaProducao.ExecSQL('ALTER TABLE ' + TCriaFieldNM_TABELA.AsString + ' ADD ' + TCriaFieldNM_FIELD.AsString + ' ' + lvTipoCampo + ';');
    IncrementaProgresso;
    IncrementaSubProgresso;
    TCriaField.Delete;
  end;
end;

//***********************************************************
procedure TDMDAtualizacao.CriaGenerator;
begin
  if TCriaGenerator.IsEmpty then
    Exit;

  ResetaProgresso;
  Progresso.Max := TCriaGenerator.RecordCount;
  SubProgresso.Max := TCriaGenerator.RecordCount;

  TCriaGenerator.First;
  while not TCriaGenerator.Eof do
  begin
    GravaLog('criando generator ' + TGeneratorAtualizacaoGENERATOR_NAME.AsString);
    QExecutaProducao.ExecSQL('CREATE SEQUENCE ' + TCriaGeneratorGENERATOR_NAME.AsString + ' START WITH 1');
    IncrementaProgresso;
    IncrementaSubProgresso;
    TCriaGenerator.Delete;
  end;
end;

 //***********************************************************
procedure TDMDAtualizacao.PegaDiferencaGenerators;
begin
  TGeneratorProducao.Close;
  TGeneratorProducao.Open;
  QGeneratorProducao.Close;
  QGeneratorProducao.Open;
  while not QGeneratorProducao.Eof do
  begin
    CopiaRegistro(QGeneratorProducao, TGeneratorProducao);
    QGeneratorProducao.Next;
  end;

  TGeneratorAtualizacao.Close;
  TGeneratorAtualizacao.Open;
  QGeneratorAtualizacao.Close;
  QGeneratorAtualizacao.Open;
  while not QGeneratorAtualizacao.Eof do
  begin
    CopiaRegistro(QGeneratorAtualizacao, TGeneratorAtualizacao);
    QGeneratorAtualizacao.Next;
  end;

  TCriaGenerator.Close;
  TCriaGenerator.Open;

  TGeneratorAtualizacao.First;
  while not TGeneratorAtualizacao.Eof do
  begin
    if not TGeneratorProducao.Locate('GENERATOR_NAME', TGeneratorAtualizacaoGENERATOR_NAME.AsString, []) then
      CopiaRegistro(TGeneratorAtualizacao, TCriaGenerator);

    TGeneratorAtualizacao.Next;
  end;
end;

//***********************************************************
procedure TDMDAtualizacao.PegaDiferencaTabelas;
var
  lvTabela: String;
begin
  QTabelaAtualizacao.Close;
  QTabelaAtualizacao.Open;

  TTabelaAtualizacao.Close;
  TTabelaAtualizacao.Open;
  CopiaTabela(QTabelaAtualizacao, TTabelaAtualizacao);

  QTabelaProducao.Close;
  QTabelaProducao.Open;

  TTabelaProducao.Close;
  TTabelaProducao.Open;
  CopiaTabela(QTabelaProducao, TTabelaProducao);

  TTabela.Close;
  TTabela.Open;

  TCriaTabela.Close;
  TCriaTabela.Open;

  TCriaField.Close;
  TCriaField.Open;

  TCampoAlterado.Close;
  TCampoAlterado.Open;

  TTabelaAtualizacao.First;
  while not TTabelaAtualizacao.Eof do
  begin
    lvTabela := TTabelaAtualizacaoNM_TABELA.AsString;
    if not TTabelaProducao.Locate('NM_TABELA', TTabelaAtualizacaoNM_TABELA.AsString, []) then
    begin
      CopiaTabelaInexistente(lvTabela);
      Continue;
    end
    else if not TTabelaProducao.Locate('NM_TABELA;NM_FIELD', VarArrayOf([TTabelaAtualizacaoNM_TABELA.AsString, TTabelaAtualizacaoNM_FIELD.AsString]), []) then
      CopiaRegistro(TTabelaAtualizacao, TCriaField)
    else if TipoCampoAlterado then
    begin
      CopiaRegistro(TTabelaAtualizacao, TCampoAlterado, True, False);
      TCampoAlteradoTP_CAMPOALTERADO.AsString := C_TIPO;
      TCampoAlterado.Post;
    end
    else if TamanhoCampoAlterado then
    begin
      CopiaRegistro(TTabelaAtualizacao, TCampoAlterado, True, False);
      TCampoAlteradoTP_CAMPOALTERADO.AsString := C_TAMANHO;
      TCampoAlterado.Post;
    end;

    TTabelaAtualizacao.Next;
  end;
end;

//***********************************************************
function TDMDAtualizacao.TamanhoCampoAlterado: Boolean;
begin
  if TTabelaProducaoTP_FIELD.AsInteger = C_DECIMAL then
    Result := (TTabelaProducaoNR_TAMANHO.AsInteger <> TTabelaAtualizacaoNR_TAMANHO.AsInteger) or
              (TTabelaProducaoNR_CASASDECIMAL.AsInteger <> TTabelaAtualizacaoNR_CASASDECIMAL.AsInteger)
  else
    Result := TTabelaProducaoNR_TAMANHO.AsInteger <> TTabelaAtualizacaoNR_TAMANHO.AsInteger;
end;

//***********************************************************
 function TDMDAtualizacao.TemAtualizacao: Boolean;
begin
  PegaDiferencaGenerators;
  PegaDiferencaTabelas;
  Result := not (TCriaGenerator.IsEmpty and TCriaTabela.IsEmpty and TCampoAlterado.IsEmpty and TCriaField.IsEmpty);
end;

//***********************************************************
function TDMDAtualizacao.TipoCampoAlterado: Boolean;
begin
  Result := TTabelaProducaoTP_FIELD.AsInteger <> TTabelaAtualizacaoTP_FIELD.AsInteger;
end;

//***********************************************************
procedure TDMDAtualizacao.CopiaTabelaInexistente(ATabela: String);
begin
  TTabela.Append;
  TTabelaNM_TABELA.AsString := TTabelaAtualizacaoNM_TABELA.AsString;
  TTabela.Post;

  while TTabelaAtualizacaoNM_TABELA.AsString = ATabela do
  begin
    CopiaRegistro(TTabelaAtualizacao, TCriaTabela);
    TTabelaAtualizacao.Next;
  end;
end;

//***********************************************************
function TDMDAtualizacao.CriaTabela: Boolean;
var
    i, lvTipoCampo: Integer;
    Tamanho, Virgula: String;
    NaoNulo: String;
begin
  if TCriaTabela.IsEmpty then
    Exit;

  ResetaProgresso;
  Progresso.Max         := TTabela.RecordCount;
  SubProgresso.Max      := TCriaTabela.RecordCount;

  Result := False;
  TTabela.First;
  while not TTabela.Eof do
  begin
    TCriaTabela.Filtered  := False;
    TCriaTabela.Filter    := 'NM_TABELA = ' + QuotedStr(TTabelaNM_TABELA.AsString);
    TCriaTabela.Filtered  := True;

    i         := 0;
    Virgula   := '';

    QExecutaProducao.SQL.Clear;
    QExecutaProducao.SQL.Add('CREATE TABLE ' + TTabelaNM_TABELA.AsString + '(');

    TCriaTabela.First;
    while not TCriaTabela.Eof do
    begin
      Inc(i);
      if i > 1 then
        Virgula := ',';

      lvTipoCampo := TCriaTabelaTP_FIELD.AsInteger;

      if PesquisaOcorrencia(lvTipoCampo, [C_VARCHAR, C_CHAR]) then
        Tamanho := '(' + TCriaTabelaNR_CARACTERES.AsString + ')'
      else if  PesquisaOcorrencia(lvTipoCampo, [C_NUMERIC, C_DECIMAL]) then
        Tamanho := '(' + TCriaTabelaNR_TAMANHO.AsString + ', ' + IntToStr(abs(TCriaTabelaNR_CASASDECIMAL.AsInteger)) + ')'
      else if (lvTipoCampo = C_BLOB) then
        Tamanho := ' SUB_TYPE 0'
      else
        Tamanho := TCriaTabelaNR_CARACTERES.AsString;

      if TCriaTabelaST_NULL.AsInteger = 1 then
        NaoNulo := ' NOT NULL '
      else
        NaoNulo := '';

      QExecutaProducao.SQL.Add(Virgula + TCriaTabelaNM_FIELD.AsString + ' ' + ConverteTipo(lvTipoCampo) + ' ' + Tamanho + ' ' + TCriaTabelaDS_VALORPADRAO.AsString + NaoNulo);
      IncrementaSubProgresso;
      TCriaTabela.Delete;
    end;

    QExecutaProducao.SQL.Add(')');
    GravaLog('Executando SQL: ' + sLineBreak + QExecutaProducao.SQL.Text);
    QExecutaProducao.ExecSQL;
    IncrementaProgresso;
    TTabela.Delete;
  end;

  Result := True;
end;

//***********************************************************
function TDMDAtualizacao.ConverteTipo(Tipo: Integer): String;
begin
  case Tipo of
    37  :  Result := 'VARCHAR';
    8   :  Result := 'INTEGER';
    7   :  Result := 'NUMERIC';
    16  :  Result := 'DECIMAL';
    261 :  Result := 'BLOB';
    12  :  Result := 'DATE';
    35  :  Result := 'TIMESTAMP';
    14  :  Result := 'CHAR';
  else
    Result := 'UNKNOWN';
  end;
end;

//***********************************************************
procedure TDMDAtualizacao.IncrementaProgresso;
begin
  Progresso.Position := Progresso.Position + 1;
  Application.ProcessMessages;
end;

//***********************************************************
procedure TDMDAtualizacao.IncrementaSubProgresso;
begin
  SubProgresso.Position := SubProgresso.Position + 1;
  Application.ProcessMessages;
end;

//***********************************************************
procedure TDMDAtualizacao.ResetaProgresso;
begin
  SubProgresso.Position := 0;
  Progresso.Position    := 0;
  Application.ProcessMessages;
end;

//***********************************************************

end.
