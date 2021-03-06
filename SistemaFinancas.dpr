program SistemaFinancas;

uses
  Vcl.Forms,
  Uprincipal in 'Uprincipal.pas' {frmPrincipal},
  ModConexao in 'ModConexao.pas' {dmDados: TDataModule},
  ufrmCadastroBasico in 'ufrmCadastroBasico.pas' {frmCadastroBasico},
  ufrmCadastroUsuarios in 'ufrmCadastroUsuarios.pas' {frmCadastroUsuarios},
  UFuncoes in 'classes\UFuncoes.pas',
  ufrmCadastroCaixa in 'ufrmCadastroCaixa.pas' {frmCadastroCaixa},
  ufrmCadastroPagar in 'ufrmCadastroPagar.pas' {frmCadastroPagar},
  ufrmCadastroReceber in 'ufrmCadastroReceber.pas' {frmCadastroReceber},
  udmRelatorios in 'datamodule\udmRelatorios.pas' {dmRelatorios: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TdmDados, dmDados);
  Application.Run;
end.
