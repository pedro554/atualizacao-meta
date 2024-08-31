unit F_Atualizacao;

interface

uses
  DM_Atualizacao,
  Funcoes,
  uFormulario,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, JvExDBGrids, JvDBGrid, JvDBUltimGrid, IdBaseComponent,
  IdAntiFreezeBase, IdAntiFreeze, Vcl.ComCtrls, Vcl.ExtCtrls;

type
  TFAtualizadorOphera = class(TFormulario)
    pnl1: TPanel;
    pbProgresso: TProgressBar;
    btnAtualizar: TButton;
    pbSubProgresso: TProgressBar;
    btnSair: TButton;
    procedure btnAtualizarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FAtualizadorOphera: TFAtualizadorOphera;

implementation

{$R *.dfm}

procedure TFAtualizadorOphera.btnAtualizarClick(Sender: TObject);
begin
//  DMDAtualizacao.TemAtualizacao;
  DMDAtualizacao.Progresso := pbProgresso;
  DMDAtualizacao.SubProgresso := pbSubProgresso;
  if DMDAtualizacao.AtualizaBanco then
    Self.Close;
end;

procedure TFAtualizadorOphera.btnSairClick(Sender: TObject);
begin
  Self.Close;
end;

end.
