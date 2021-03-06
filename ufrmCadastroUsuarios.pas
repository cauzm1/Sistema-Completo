unit ufrmCadastroUsuarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmCadastroBasico, Data.DB,
  System.Actions, Vcl.ActnList, System.ImageList, Vcl.ImgList, Vcl.ComCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.ToolWin, Vcl.ActnMan,
  Vcl.ActnCtrls;

type
  TfrmCadastroUsuarios = class(TfrmCadastroBasico)
    Label3: TLabel;
    Label4: TLabel;
    EditLogin: TEdit;
    EditSenha: TEdit;
    EditNome: TEdit;
    Label1: TLabel;
    Action1: TAction;
    procedure acSalvarExecute(Sender: TObject);
    procedure acEditarExecute(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure acPesquisarExecute(Sender: TObject);
    procedure acImprimirExecute(Sender: TObject);
  { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroUsuarios: TfrmCadastroUsuarios;

implementation

{$R *.dfm}

uses ModConexao, UFuncoes, udmRelatorios;

procedure TfrmCadastroUsuarios.acEditarExecute(Sender: TObject);
begin
  inherited;
  editNome.Text := dmDados.CDSUsuariosNome.AsString;
  editLogin.Text := dmDados.CDSUsuariosLogin.AsString;
  editSenha.Text := dmDados.CDSUsuariosSenha.AsString;

end;

procedure TfrmCadastroUsuarios.acImprimirExecute(Sender: TObject);
begin

dmrelatorios := tDmRelatorios.Create(nil);
try
dmrelatorios.frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+'relatorios\relCadUsuarios.fr3');
dmrelatorios.frxReport.ShowReport(true);
finally
Freeandnil(dmrelatorios);
end;
end;

procedure TfrmCadastroUsuarios.acPesquisarExecute(Sender: TObject);
begin
  inherited;
dmDados.cdsUsuarios.Close;
dmDados.cdsUsuarios.CommandText := 'SELECT * FROM USUARIOS';
dmDados.cdsUsuarios.Open;
end;

procedure TfrmCadastroUsuarios.acSalvarExecute(Sender: TObject);
begin

  if (dsTabela.State in [dsInsert]) and (GetLoginCadastrado(trim(editLogin.Text))) then
    begin
      Application.MessageBox('Login em uso','Aten??o',MB_OK+MB_ICONWARNING);
      editLogin.Setfocus;
      Abort
    end;
  if Trim(EditNome.Text) = '' then
    begin
      Application.MessageBox('Preencha o campo "Nome"','Aten??o',MB_OK+MB_ICONWARNING);
      EditNome.SetFocus;
      Abort;
    end;

  if Trim(EditLogin.Text) = '' then
    begin
      Application.MessageBox('Preencha o campo "Login"','Aten??o',MB_OK+MB_ICONWARNING);
      EditLogin.SetFocus;
      Abort;
    end;

    if Trim(EditSenha.Text) = '' then
    begin
      Application.MessageBox('Preencha o campo "Senha"','Aten??o',MB_OK+MB_ICONWARNING);
      EditSenha.SetFocus;
      Abort;
    end;

    if dsTabela.State in [dsInsert] then


    dmDados.CDSusuariosID.AsInteger := GetID ('ID','Usuarios');
    dmDados.CDSusuariosNome.AsString := trim(editNome.Text);
    dmDados.CDSusuariosLogin.AsString := trim(editLogin.Text);
    dmDados.CDSusuariosSenha.AsString := trim(editSenha.Text);
    dmDados.CDSusuariosStatus.AsString := 'A';
    dmDados.CDSusuariosDt_cadastro.AsDateTime := now;
  inherited;

end;

procedure TfrmCadastroUsuarios.Button1Click(Sender: TObject);
begin
  if EditPesquisar.Text = '' then

    begin
    Application.MessageBox('Informe um valor a ser pesquisado','Aten??o',MB_OK+MB_ICONWARNING);
    EditPesquisar.SetFocus;
    Abort;
    end;

  inherited;
    dmDados.cdsUsuarios.Close;
  case cbxFiltros.ItemIndex of
    0: dmDados.cdsUsuarios.CommandText := 'SELECT * FROM USUARIOS WHERE NOME LIKE '+QuotedStr('%'+editPesquisar.Text+'%');
    1: dmDados.cdsUsuarios.CommandText := 'SELECT * FROM USUARIOS WHERE LOGIN LIKE '+QuotedStr('%'+editPesquisar.Text+'%');
  end;
  dmDados.cdsUsuarios.Open;
end;

end.
