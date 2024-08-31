program Atualizacao;

uses
  Vcl.Forms,
  F_Atualizacao in 'F_Atualizacao.pas' {FAtualizadorOphera},
  DM_Atualizacao in 'DM_Atualizacao.pas' {DMDAtualizacao: TDataModule},
  Funcoes in 'F:\Projetos\Restaguarda e PDV\Comum\Funcoes.pas',
  Constantes in 'F:\Projetos\Restaguarda e PDV\Comum\Constantes.pas',
  uFormulario in 'F:\Projetos\Restaguarda e PDV\View\Comum\uFormulario.pas' {Formulario};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFAtualizadorOphera, FAtualizadorOphera);
  Application.CreateForm(TDMDAtualizacao, DMDAtualizacao);
  Application.Run;
end.
