unit ufrmCadastroCaixa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmCadastroBasico, Data.DB,
  System.Actions, Vcl.ActnList, System.ImageList, Vcl.ImgList, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Vcl.ExtCtrls, tpEdit;

type
  TfrmCadastroCaixa = class(TfrmCadastroBasico)
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    EditDescricaoCaixa: TEdit;
    EditNumeroDoc: TEdit;
    RadioGroup: TRadioGroup;
    editValorCaixa: TtpEdit;
    procedure acSalvarExecute(Sender: TObject);
    procedure acPesquisarExecute(Sender: TObject);
    procedure acEditarExecute(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroCaixa: TfrmCadastroCaixa;

implementation

{$R *.dfm}

uses ModConexao, UFuncoes, Uprincipal, System.Math;

procedure TfrmCadastroCaixa.acEditarExecute(Sender: TObject);
begin
  inherited;
  editNumeroDoc.Text := dmDados.CDSCaixaNumero_doc.AsString;
  editDescricaoCaixa.Text := dmDados.CDSCaixaDescricao.AsString;
  editValorCaixa.Text := FormatFloat(',#0.00',dmDados.CdsCaixaValor.AsCurrency);
  RadioGroup.ItemIndex := ifthen(dmDados.cdsCaixaTipo.AsString = 'C', 0, 1);
end;

procedure TfrmCadastroCaixa.acPesquisarExecute(Sender: TObject);
begin
  inherited;
dmDados.cdsCaixa.Close;
dmDados.cdsCaixa.CommandText := 'SELECT * FROM CAIXA';
dmDados.cdsCaixa.Open;
end;

procedure TfrmCadastroCaixa.acSalvarExecute(Sender: TObject);
begin

if Trim(EditNumeroDoc.Text) = '' then
    begin
      Application.MessageBox('Preencha o campo "Numero do Documento"','Aten??o',MB_OK+MB_ICONWARNING);
      EditNumeroDoc.SetFocus;
      Abort;
    end;

    if Trim(EditDescricaoCaixa.Text) = '' then
    begin
      Application.MessageBox('Preencha o campo "Descri??o"','Aten??o',MB_OK+MB_ICONWARNING);
      EditDescricaoCaixa.SetFocus;
      Abort;
    end;

    if StringToFloat(editValorCaixa.Text)<= 0 then
    begin
      Application.MessageBox('Insira um valor positivo','Aten??o',MB_OK+MB_ICONWARNING);
      editValorCaixa.SetFocus;
      Abort;
    end;

    if dsTabela.State in [dsInsert] then
    dmDados.CDScaixaid.AsInteger := GetID('ID','CAIXA');
    dmDados.CDScaixanumero_doc.AsString := Trim(editNumeroDoc.Text);
    dmDados.CDScaixadescricao.AsString := Trim(editDescricaoCaixa.Text);
    dmDados.CDScaixavalor.AsCurrency := StringToFloat(editValorCaixa.Text);
    dmDados.CDScaixaDt_cadastro.AsDateTime := now;

    case RadioGroup.ItemIndex of
      0 : dmDados.cdsCaixatipo.AsString := 'C';
      1 : dmDados.cdsCaixatipo.AsString := 'D';
    end;
   inherited;

end;

procedure TfrmCadastroCaixa.Button1Click(Sender: TObject);
begin
if EditPesquisar.Text = '' then

begin
  Application.MessageBox('Informe um valor a ser pesquisado','Aten??o',MB_OK+MB_ICONWARNING);
  EditPesquisar.SetFocus;
  Abort;
end;


  dmDados.cdsCaixa.Close;
  case cbxFiltros.ItemIndex of
    0: dmDados.cdsCaixa.CommandText := 'SELECT * FROM CAIXA WHERE DOCUMENTO LIKE '+QuotedStr('%'+editPesquisar.Text+'%');
    1: dmDados.cdsCaixa.CommandText := 'SELECT * FROM CAIXA WHERE DESCRICAO LIKE '+QuotedStr('%'+editPesquisar.Text+'%');
  end;
  dmDados.cdsCaixa.Open;


  inherited;

  end;


end.
