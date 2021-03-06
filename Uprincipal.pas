unit Uprincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Buttons;

type
  TfrmPrincipal = class(TForm)
    LabelCadastros: TLabel;
    imgUsuarios: TImage;
    imgPagar: TImage;
    imgReceber: TImage;
    imgCaixa: TImage;
    imgConsulReceber: TImage;
    imgConsulPagar: TImage;
    LabelUsuarios: TLabel;
    LabelPagar: TLabel;
    LabelReceber: TLabel;
    LabelCaixa: TLabel;
    LabelContasReceber: TLabel;
    LabelContasPagar: TLabel;
    LabelRelatórios: TLabel;
    LabelSistema: TLabel;
    imgConfigSistema: TImage;
    imgNavegador: TImage;
    LabelConfigSistema: TLabel;
    LabelNavegador: TLabel;
    imgRelPagamentos: TImage;
    LabelRelPagamentos: TLabel;
    imgRelRecebimentos: TImage;
    LabelRelRecebimentos: TLabel;
    imgRelCaixa: TImage;
    LabelRelCaixa: TLabel;
    BalloonHint1: TBalloonHint;
    StatusBar1: TStatusBar;
    Timer1: TTimer;
    BitBtn1: TBitBtn;
    procedure Timer1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure imgUsuariosClick(Sender: TObject);
    procedure imgCaixaClick(Sender: TObject);
    procedure imgPagarClick(Sender: TObject);
    procedure imgReceberClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses ufrmCadastroBasico, ufrmCadastroUsuarios, ufrmCadastroCaixa,
  ufrmCadastroPagar, ufrmCadastroReceber, ModConexao, UFuncoes;

procedure TfrmPrincipal.BitBtn1Click(Sender: TObject);
begin
  frmcadastrobasico := Tfrmcadastrobasico.Create(nil);
  try
    frmcadastrobasico.ShowModal;
  finally
    FreeAndNil(frmcadastrobasico);
  end;
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Application.MessageBox('Deseja realmente sair?','Informaç?o',MB_YESNO +MB_ICONQUESTION)= mrYes then
    Application.Terminate
  else
    Abort;
end;

procedure TfrmPrincipal.imgCaixaClick(Sender: TObject);
begin
  frmCadastroCaixa := TfrmCadastroCaixa.Create(nil);
  try
    frmCadastroCaixa.ShowModal;
  finally
    FreeAndNil(frmCadastroCaixa);
  end;
end;

procedure TfrmPrincipal.imgReceberClick(Sender: TObject);
begin
    frmCadastroReceber := TfrmCadastroReceber.Create(nil);
  try
    frmCadastroReceber.ShowModal;
  finally
    FreeAndNil(frmCadastroReceber);
  end;
end;

procedure TfrmPrincipal.imgPagarClick(Sender: TObject);
begin
  frmCadastroPagar := TfrmCadastroPAgar.Create(nil);
  try
    frmCadastroPagar.ShowModal;
  finally
    FreeAndNil(frmCadastroPagar);
  end;
end;

procedure TfrmPrincipal.imgUsuariosClick(Sender: TObject);
begin
  frmCadastroUsuarios := TfrmCadastroUsuarios.Create(nil);
  try
    frmCadastroUsuarios.ShowModal;
  finally
    FreeAndNil(frmCadastroUsuarios);
  end;
end;

procedure TfrmPrincipal.Timer1Timer(Sender: TObject);
begin
  StatusBar1.Panels.Items[0].Text := DateTimeToStr(now);
end;

end.
