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
    QTabelaProducao: TFDQuery;
    TTabelaProducao: TJvMemoryData;
    TTabelaAtualizacao: TJvMemoryData;
    TCriaTabela: TJvMemoryData;
    TCriaField: TJvMemoryData;
    TCampoAlterado: TJvMemoryData;
    TCriaGenerator: TJvMemoryData;
    TCriaGeneratorSYSTEM_FLAG: TSmallintField;
    TCriaGeneratorDESCRIPTION: TMemoField;
    TCriaGeneratorGENERATOR_NAME: TStringField;
    TTabela: TJvMemoryData;
    QControlesisAtt: TFDQuery;
    QControlesisProd: TFDQuery;
    TControlesis: TJvMemoryData;
    TControlesisNM_TABELA: TWideStringField;
    TControlesisDT_ATUALIZACAO: TDateTimeField;
    QControlesisAttNM_TABELA: TStringField;
    QControlesisAttDT_ATUALIZACAO: TSQLTimeStampField;
    QControlesisProdNM_TABELA: TStringField;
    QControlesisProdDT_ATUALIZACAO: TSQLTimeStampField;
    QTabelaProducaoTABELA: TWideStringField;
    QTabelaProducaoCAMPO: TWideStringField;
    QTabelaProducaoDEFAULT_VALUE: TMemoField;
    QTabelaProducaoNULL_FLAG: TSmallintField;
    QTabelaProducaoPOSICAO: TSmallintField;
    QTabelaProducaoROTULO_CAMPO: TMemoField;
    QTabelaProducaoTAMANHO: TSmallintField;
    QTabelaProducaoPRECISAO: TSmallintField;
    QTabelaProducaoTIPO: TSmallintField;
    QTabelaProducaoSUBTIPO: TSmallintField;
    QTabelaProducaoCASASDECIMAL: TSmallintField;
    QTabelaProducaoFIELD_CAMPO: TWideStringField;
    QTabelaProducaoROTULA_TABELA: TMemoField;
    QTabelaAtualizacaoTABELA: TWideStringField;
    QTabelaAtualizacaoCAMPO: TWideStringField;
    QTabelaAtualizacaoDEFAULT_VALUE: TMemoField;
    QTabelaAtualizacaoNULL_FLAG: TSmallintField;
    QTabelaAtualizacaoPOSICAO: TSmallintField;
    QTabelaAtualizacaoROTULO_CAMPO: TMemoField;
    QTabelaAtualizacaoTAMANHO: TSmallintField;
    QTabelaAtualizacaoPRECISAO: TSmallintField;
    QTabelaAtualizacaoTIPO: TSmallintField;
    QTabelaAtualizacaoSUBTIPO: TSmallintField;
    QTabelaAtualizacaoCASASDECIMAL: TSmallintField;
    QTabelaAtualizacaoFIELD_CAMPO: TWideStringField;
    QTabelaAtualizacaoROTULA_TABELA: TMemoField;
    TTabelaProducaoTABELA: TWideStringField;
    TTabelaProducaoCAMPO: TWideStringField;
    TTabelaProducaoDEFAULT_VALUE: TMemoField;
    TTabelaProducaoNULL_FLAG: TSmallintField;
    TTabelaProducaoPOSICAO: TSmallintField;
    TTabelaProducaoROTULO_CAMPO: TMemoField;
    TTabelaProducaoTAMANHO: TSmallintField;
    TTabelaProducaoPRECISAO: TSmallintField;
    TTabelaProducaoTIPO: TSmallintField;
    TTabelaProducaoSUBTIPO: TSmallintField;
    TTabelaProducaoCASASDECIMAL: TSmallintField;
    TTabelaProducaoFIELD_CAMPO: TWideStringField;
    TTabelaProducaoROTULA_TABELA: TMemoField;
    TTabelaAtualizacaoTABELA: TWideStringField;
    TTabelaAtualizacaoCAMPO: TWideStringField;
    TTabelaAtualizacaoDEFAULT_VALUE: TMemoField;
    TTabelaAtualizacaoNULL_FLAG: TSmallintField;
    TTabelaAtualizacaoPOSICAO: TSmallintField;
    TTabelaAtualizacaoROTULO_CAMPO: TMemoField;
    TTabelaAtualizacaoTAMANHO: TSmallintField;
    TTabelaAtualizacaoPRECISAO: TSmallintField;
    TTabelaAtualizacaoTIPO: TSmallintField;
    TTabelaAtualizacaoSUBTIPO: TSmallintField;
    TTabelaAtualizacaoCASASDECIMAL: TSmallintField;
    TTabelaAtualizacaoFIELD_CAMPO: TWideStringField;
    TTabelaAtualizacaoROTULA_TABELA: TMemoField;
    TCriaTabelaTABELA: TWideStringField;
    TCriaTabelaCAMPO: TWideStringField;
    TCriaTabelaDEFAULT_VALUE: TMemoField;
    TCriaTabelaNULL_FLAG: TSmallintField;
    TCriaTabelaPOSICAO: TSmallintField;
    TCriaTabelaROTULO_CAMPO: TMemoField;
    TCriaTabelaTAMANHO: TSmallintField;
    TCriaTabelaPRECISAO: TSmallintField;
    TCriaTabelaTIPO: TSmallintField;
    TCriaTabelaSUBTIPO: TSmallintField;
    TCriaTabelaCASASDECIMAL: TSmallintField;
    TCriaTabelaFIELD_CAMPO: TWideStringField;
    TCriaTabelaROTULA_TABELA: TMemoField;
    TCriaFieldTABELA: TWideStringField;
    TCriaFieldCAMPO: TWideStringField;
    TCriaFieldDEFAULT_VALUE: TMemoField;
    TCriaFieldNULL_FLAG: TSmallintField;
    TCriaFieldPOSICAO: TSmallintField;
    TCriaFieldROTULO_CAMPO: TMemoField;
    TCriaFieldTAMANHO: TSmallintField;
    TCriaFieldPRECISAO: TSmallintField;
    TCriaFieldTIPO: TSmallintField;
    TCriaFieldSUBTIPO: TSmallintField;
    TCriaFieldCASASDECIMAL: TSmallintField;
    TCriaFieldFIELD_CAMPO: TWideStringField;
    TCriaFieldROTULA_TABELA: TMemoField;
    TCampoAlteradoTABELA: TWideStringField;
    TCampoAlteradoCAMPO: TWideStringField;
    TCampoAlteradoDEFAULT_VALUE: TMemoField;
    TCampoAlteradoNULL_FLAG: TSmallintField;
    TCampoAlteradoPOSICAO: TSmallintField;
    TCampoAlteradoROTULO_CAMPO: TMemoField;
    TCampoAlteradoTAMANHO: TSmallintField;
    TCampoAlteradoPRECISAO: TSmallintField;
    TCampoAlteradoTIPO: TSmallintField;
    TCampoAlteradoSUBTIPO: TSmallintField;
    TCampoAlteradoCASASDECIMAL: TSmallintField;
    TCampoAlteradoFIELD_CAMPO: TWideStringField;
    TCampoAlteradoROTULA_TABELA: TMemoField;
    TTabelaTABELA: TWideStringField;
    QAbreTabAtt: TFDQuery;
    QAbreTabProd: TFDQuery;
    QRetornaPK: TFDQuery;
    QRetornaPKNM_CAMPO: TWideStringField;
    QRetornaPKNM_INDICE: TWideStringField;
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
    procedure PegaDiferencaControlesis;
    procedure AtualizaControlesis;
    function RetornaPK(ATabela: string; AConexao: TFDConnection): string;
    { Private declarations }
  public
    Progresso: TProgressBar;
    SubProgresso: TProgressBar;
    function AtualizaBanco: Boolean;
    function TemAtualizacao: Boolean;
    { Public declarations }
  end;

var
  DMDAtualizacao: TDMDAtualizacao;

implementation
uses Funcoes;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDMDAtualizacao }

procedure TDMDAtualizacao.PegaDiferencaControlesis;
begin
  QControlesisAtt.Close;
  QControlesisAtt.Open;
  QControlesisProd.Close;
  QControlesisProd.Open;

  TControlesis.Close;
  TControlesis.Open;

  QControlesisAtt.First;
  while not QControlesisAtt.Eof do
  begin
    // Se a controlesis atualizacao estiver com data maior que a da produção, então deve atualizar os registros da tabela
    // ou Se não encontrar a tabela na controlesis de producao deve adicionar na tabela de memoria pois é uma tabela nova
    if ((QControlesisProd.Locate('NM_TABELA', QControlesisAttNM_TABELA.AsString, [])) and
       (QControlesisProdDT_ATUALIZACAO.AsDateTime < QControlesisAttDT_ATUALIZACAO.AsDateTime)) or
       (not QControlesisProd.Locate('NM_TABELA', QControlesisAttNM_TABELA.AsString, [])) then
    begin
      GravaLog('Controlesis: ' + QControlesisAttNM_TABELA.AsString + ' ' + QControlesisAttDT_ATUALIZACAO.AsString);
      CopiaRegistro(QControlesisAtt, TControlesis);
    end;

    QControlesisAtt.Next;
  end;
end;

//***********************************************************
procedure TDMDAtualizacao.AtualizaControlesis;
var
  lvTabela: string;
begin
  if TControlesis.IsEmpty then
    Exit;

  TControlesis.First;
  while not TControlesis.Eof do
  begin
    lvTabela := TControlesisNM_TABELA.AsString;
    QAbreTabAtt.Close;
    QAbreTabAtt.Open('SELECT * FROM ' + lvTabela);

    QAbreTabProd.Close;
    QAbreTabProd.Open('SELECT * FROM ' + lvTabela);

    QAbreTabAtt.First;
    while not QAbreTabAtt.Eof do
    begin
      if not QAbreTabProd.Locate(RetornaPK(lvTabela, conProducao), RetornaPK(lvTabela, conAtualizacao), []) then
      begin
        // se não achar a chave primaria ele deve inserir o valor do banco atualizacao no banco producao
      end;

      QAbreTabAtt.Next;
    end;


    TControlesis.Delete;
  end;
end;

//***********************************************************
function TDMDAtualizacao.RetornaPK(ATabela: string; AConexao: TFDConnection): string;
begin
  QRetornaPK.Close;
  QRetornaPK.Connection := AConexao;
  QRetornaPK.ParamByName('TABELA').AsString := ATabela;
  QRetornaPK.Open;

  Result := QRetornaPKNM_CAMPO.AsString;
end;

//***********************************************************
procedure TDMDAtualizacao.AtualizaField;
var
  lvTabela, lvCampoTemp, lvCampo, lvTipoCampo: string;
begin
  if TCampoAlterado.IsEmpty then
    Exit;

  TCampoAlterado.First;
  while not TCampoAlterado.Eof do
  begin
    lvTabela    := TCampoAlteradoTABELA.AsString;
    lvCampo     := TCampoAlteradoCAMPO.AsString;
    lvCampoTemp := lvCampo + '_TEMP ';

    if PesquisaOcorrencia(TCampoAlteradoTIPO.AsInteger, [C_DECIMAL, C_NUMERIC]) then
      lvTipoCampo := ConverteTipo(TCampoAlteradoTIPO.AsInteger) + '(' + TCampoAlteradoPRECISAO.AsString + ',' + IntToStr(Abs(TCampoAlteradoCASASDECIMAL.AsInteger)) + ')'
    else if TCampoAlteradoTIPO.AsInteger = C_BLOB then
      lvTipoCampo := 'BLOB SUB_TYPE 0'
    else if TCampoAlteradoTIPO.AsInteger = C_VARCHAR then
      lvTipoCampo := 'VARCHAR(' + TCampoAlteradoTAMANHO.AsString + ')'
    else
      lvTipoCampo := ConverteTipo(TCampoAlteradoTIPO.AsInteger);

    // 1. Adicionar uma nova coluna temporária
    QExecutaProducao.ExecSQL('ALTER TABLE ' + lvTabela + ' ADD ' + lvCampoTemp + ' ' + lvTipoCampo + ';');
    // 2. Converter e copiar os dados
    if PesquisaOcorrencia(TCampoAlteradoTIPO.AsInteger, [C_BLOB, C_VARCHAR]) then
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
    if PesquisaOcorrencia(TCriaFieldTIPO.AsInteger, [C_DECIMAL, C_NUMERIC]) then
      lvTipoCampo := ConverteTipo(TCriaFieldTIPO.AsInteger) + '(' + TCriaFieldPRECISAO.AsString + ',' + IntToStr(Abs(TCriaFieldCASASDECIMAL.AsInteger)) + ')'
    else if TCriaFieldTIPO.AsInteger = C_BLOB then
      lvTipoCampo := 'BLOB SUB_TYPE 0'
    else if TCriaFieldTIPO.AsInteger = C_VARCHAR then
      lvTipoCampo := 'VARCHAR(' + TCriaFieldTAMANHO.AsString + ')'
    else
      lvTipoCampo := ConverteTipo(TCriaFieldTIPO.AsInteger);

    GravaLog('Criando Field ' + TCriaFieldCAMPO.AsString + ' na tabela ' + TCriaFieldTABELA.AsString);
    QExecutaProducao.ExecSQL('ALTER TABLE ' + TCriaFieldTABELA.AsString + ' ADD ' + TCriaFieldCAMPO.AsString + ' ' + lvTipoCampo + ';');
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
    lvTabela := TTabelaAtualizacaoTABELA.AsString;
    if not TTabelaProducao.Locate('TABELA', TTabelaAtualizacaoTABELA.AsString, []) then
    begin
      CopiaTabelaInexistente(lvTabela);
      Continue;
    end
    else if not TTabelaProducao.Locate('TABELA;CAMPO', VarArrayOf([TTabelaAtualizacaoTABELA.AsString, TTabelaAtualizacaoCAMPO.AsString]), []) then
      CopiaRegistro(TTabelaAtualizacao, TCriaField)
    else if TipoCampoAlterado then
      CopiaRegistro(TTabelaAtualizacao, TCampoAlterado)
    else if TamanhoCampoAlterado then
      CopiaRegistro(TTabelaAtualizacao, TCampoAlterado);

    TTabelaAtualizacao.Next;
  end;
end;

//***********************************************************
function TDMDAtualizacao.TamanhoCampoAlterado: Boolean;
begin
  if TTabelaProducaoTIPO.AsInteger = C_DECIMAL then
    Result := (TTabelaProducaoTAMANHO.AsInteger <> TTabelaAtualizacaoTAMANHO.AsInteger) or
              (TTabelaProducaoCASASDECIMAL.AsInteger <> TTabelaAtualizacaoCASASDECIMAL.AsInteger)
  else
    Result := TTabelaProducaoTAMANHO.AsInteger <> TTabelaAtualizacaoTAMANHO.AsInteger;
end;

//***********************************************************
 function TDMDAtualizacao.TemAtualizacao: Boolean;
begin
  PegaDiferencaGenerators;
  PegaDiferencaTabelas;
//  PegaDiferencaControlesis;
  Result := not (TCriaGenerator.IsEmpty and TCriaTabela.IsEmpty and TCampoAlterado.IsEmpty and TCriaField.IsEmpty and
                 TControlesis.IsEmpty);
end;

//***********************************************************
function TDMDAtualizacao.TipoCampoAlterado: Boolean;
begin
  Result := TTabelaProducaoTIPO.AsInteger <> TTabelaAtualizacaoTIPO.AsInteger;
end;

//***********************************************************
procedure TDMDAtualizacao.CopiaTabelaInexistente(ATabela: String);
begin
  TTabela.Append;
  TTabelaTABELA.AsString := TTabelaAtualizacaoTABELA.AsString;
  TTabela.Post;

  while TTabelaAtualizacaoTABELA.AsString = ATabela do
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
    TCriaTabela.Filter    := 'TABELA = ' + QuotedStr(TTabelaTABELA.AsString);
    TCriaTabela.Filtered  := True;

    i         := 0;
    Virgula   := '';

    QExecutaProducao.SQL.Clear;
    QExecutaProducao.SQL.Add('CREATE TABLE ' + TTabelaTABELA.AsString + '(');

    TCriaTabela.First;
    while not TCriaTabela.Eof do
    begin
      Inc(i);
      if i > 1 then
        Virgula := ',';

      lvTipoCampo := TCriaTabelaCAMPO.AsInteger;

      if PesquisaOcorrencia(lvTipoCampo, [C_VARCHAR, C_CHAR]) then
        Tamanho := '(' + TCriaTabelaTAMANHO.AsString + ')'
      else if  PesquisaOcorrencia(lvTipoCampo, [C_NUMERIC, C_DECIMAL]) then
        Tamanho := '(' + TCriaTabelaPRECISAO.AsString + ', ' + IntToStr(abs(TCriaTabelaCASASDECIMAL.AsInteger)) + ')'
      else if (lvTipoCampo = C_BLOB) then
        Tamanho := ' SUB_TYPE 0'
      else
        Tamanho := TCriaTabelaTAMANHO.AsString;

      if TCriaTabelaNULL_FLAG.AsInteger = 1 then
        NaoNulo := ' NOT NULL '
      else
        NaoNulo := '';

      QExecutaProducao.SQL.Add(Virgula + TCriaTabelaTABELA.AsString + ' ' + ConverteTipo(lvTipoCampo) + ' ' + Tamanho + ' ' + TCriaTabelaDEFAULT_VALUE.AsString + NaoNulo);
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
