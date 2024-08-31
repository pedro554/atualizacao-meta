unit DM_Atualizacao;

interface

uses
  IniFiles,
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Phys.MySQLDef, FireDAC.Phys.MySQL,
  FireDAC.Phys.FBDef, FireDAC.Phys.IBBase, FireDAC.Phys.FB,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  JvMemoryDataset, FireDAC.Comp.DataSet;

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
    procedure DataModuleCreate(Sender: TObject);
  private
    iArq: TIniFile;
    procedure ConectaBancoAtualizacao;
    procedure ConectaBancoProducao;
    procedure ConfiguraConexao(AConexao: TFDConnection; AIni: TIniFile; ABase: String);
    procedure AtualizaGenerators;
    procedure CriaGenerator;
    { Private declarations }
  public
    procedure AtualizaBanco;
    { Public declarations }
  end;

var
  DMDAtualizacao: TDMDAtualizacao;

implementation
uses Funcoes;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDMDAtualizacao }

procedure TDMDAtualizacao.ConectaBancoAtualizacao;
begin
  ConfiguraConexao(conAtualizacao, iArq, 'Path');
  try
    conAtualizacao.Connected := true;
  Except
    MyMessage('Não foi possivel conectar na base de dados!' + sLineBreak +
              'Verifique e pasta ' + conAtualizacao.Params.Values['Database'] + sLineBreak +
              'Se não encontrar esse arquivo restaure um backup. ' + sLineBreak +
              'Ou contate o suporte do sistema!');
  end;
end;

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

procedure TDMDAtualizacao.AtualizaBanco;
begin
  AtualizaGenerators;
end;

procedure TDMDAtualizacao.CriaGenerator;
begin
  TGeneratorAtualizacao.First;
  while not TGeneratorAtualizacao.Eof do
  begin
    if TGeneratorProducao.Locate('GENERATOR_NAME', TGeneratorAtualizacaoGENERATOR_NAME.AsString, []) then
    begin
      TGeneratorAtualizacao.Next;
      Continue;
    end;

    Transacao.StartTransaction;
    try
      GravaLog('criando generator ' + TGeneratorAtualizacaoGENERATOR_NAME.AsString);
      QExecutaProducao.ExecSQL('CREATE SEQUENCE ' + TGeneratorAtualizacaoGENERATOR_NAME.AsString + ' START WITH 1');
      Transacao.Commit;
    except
      on e: exception do
      begin
        Transacao.Rollback;
        GravaLog('Falha ao atualizar generator: ' + TGeneratorAtualizacaoGENERATOR_NAME.AsString + sLineBreak + e.Message);
        Abort;
      end;
    end;

    TGeneratorAtualizacao.Next;
  end;
end;

procedure TDMDAtualizacao.AtualizaGenerators;
begin
  TGeneratorProducao.Close;
  TGeneratorProducao.Open;
  QGeneratorProducao.Close;
  QGeneratorProducao.Open;
  GravaLog('Carregando generators producao');
  while not QGeneratorProducao.Eof do
  begin
    CopiaRegistro(QGeneratorProducao, TGeneratorProducao);
    QGeneratorProducao.Next;
  end;

  TGeneratorAtualizacao.Close;
  TGeneratorAtualizacao.Open;
  QGeneratorAtualizacao.Close;
  QGeneratorAtualizacao.Open;
  GravaLog('Carregando generators atualizacao');
  while not QGeneratorAtualizacao.Eof do
  begin
    CopiaRegistro(QGeneratorAtualizacao, TGeneratorAtualizacao);
    QGeneratorAtualizacao.Next;
  end;

  CriaGenerator;
end;

end.
