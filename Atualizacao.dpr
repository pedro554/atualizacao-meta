program Atualizacao;

uses
  Vcl.Forms,
  F_Atualizacao in 'F_Atualizacao.pas' {Form1},
  DM_Atualizacao in 'DM_Atualizacao.pas' {DMDAtualizacao: TDataModule},
  Funcoes in 'F:\Projetos\Restaguarda e PDV\Comum\Funcoes.pas',
  Constantes in 'F:\Projetos\Restaguarda e PDV\Comum\Constantes.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDMDAtualizacao, DMDAtualizacao);
  Application.Run;
end.
