unit ufrmCadastroReceber;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmCadastroBasico, Data.DB,
  System.Actions, Vcl.ActnList, System.ImageList, Vcl.ImgList, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, tpEdit, Datasnap.DBClient;

type
  TfrmCadastroReceber = class(TfrmCadastroBasico)
    Label1: TLabel;
    EditDocumento: TEdit;
    EditVariacao: TEdit;
    Label8: TLabel;
    Label3: TLabel;
    EditDescricao: TEdit;
    Label4: TLabel;
    EditQtdParcelas: TEdit;
    Label6: TLabel;
    EditValorCompra: TtpEdit;
    Label7: TLabel;
    EditDataCompra: TtpEdit;
    BtnGerarParcelas: TBitBtn;
    BtnLimparParcelas: TBitBtn;
    DBGrid1: TDBGrid;
    cdsParcelas: TClientDataSet;
    cdsParcelasParcela: TIntegerField;
    cdsParcelasValor: TCurrencyField;
    cdsParcelasVencimento: TDateField;
    dsParcelas: TDataSource;
    procedure dbgDadosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BtnLimparParcelasClick(Sender: TObject);
    procedure BtnGerarParcelasClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure acSalvarExecute(Sender: TObject);
    procedure acPesquisarExecute(Sender: TObject);
    procedure acEditarExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroReceber: TfrmCadastroReceber;

implementation

{$R *.dfm}

uses ModConexao, UFuncoes;

procedure TfrmCadastroReceber.acEditarExecute(Sender: TObject);
begin

Application.MessageBox('Preencha o campo Documento','Aten??o',MB_OK+MB_ICONWARNING);

end;

procedure TfrmCadastroReceber.acPesquisarExecute(Sender: TObject);
begin
  inherited;
dmDados.cds_contas_receber.Close;
dmDados.cds_contas_receber.CommandText := 'SELECT * FROM CONTAS_RECEBER';
dmDados.cds_contas_receber.Open;

end;

procedure TfrmCadastroReceber.acSalvarExecute(Sender: TObject);
  var i : integer;
begin
  if editDocumento.Text = '' then
    begin
      Application.MessageBox('Preencha o campo Documento','Aten??o',MB_OK+MB_ICONWARNING);
      editDocumento.SetFocus;
      Abort;
    end;

    if editDescricao.Text = '' then
    begin
      Application.MessageBox('Preencha o campo Descri??o','Aten??o',MB_OK+MB_ICONWARNING);
      editDescricao.SetFocus;
      Abort;
    end;

    if editQtdParcelas.Text = '' then
    begin
      Application.MessageBox('Preencha o campo N? de Parcelas','Aten??o',MB_OK+MB_ICONWARNING);
      editQtdParcelas.SetFocus;
      Abort;
    end;

    if StringToFloat(editValorCompra.Text) = 0 then
    begin
      Application.MessageBox('Preencha o Valor da Compra','Aten??o',MB_OK+MB_ICONWARNING);
      editValorCompra.SetFocus;
      Abort;
    end;

    if editDataCompra.Text = '' then
    begin
      Application.MessageBox('Preencha o campo Data da Compra','Aten??o',MB_OK+MB_ICONWARNING);
      editDataCompra.SetFocus;
      Abort;
    end;


    //bot?o salvar
    try


      cdsParcelas.First;
      while not cdsParcelas.Eof do
        if dsTabela.State in [dsBrowse, dsInsert] then
      begin
      dmDados.CDS_contas_receber.Insert;
      dmDados.CDS_contas_receberid.AsInteger := GetID('ID','CONTAS_RECEBER');
      dmDados.CDS_contas_receberdocumento.AsString := Trim(editDocumento.Text);
      dmDados.CDS_contas_receberdescricao.AsString := Trim(editDescricao.Text);
      dmDados.CDS_contas_receberValor_Compra.AsCurrency := StringToFloat(editValorCompra.Text);
      dmDados.CDS_contas_receberParcelas.AsInteger := cdsParcelasParcela.AsInteger;
      dmDados.CDS_contas_receberValor_Parcelas.AsCurrency := cdsParcelasValor.AsInteger;
      dmDados.CDS_contas_receberDt_Compra.AsDateTime := StrToDate(editDataCompra.Text);
      dmDados.CDS_contas_receberDt_Vencimento.AsDateTime := cdsParcelasVencimento.AsDateTime;
      dmDados.CDS_contas_receberStatus.AsString := 'A';
      dmDados.CDS_contas_receberValor_Abatido.AsCurrency := 0 ;
      dmDados.CDS_contas_receberDt_cadastro.AsDateTime := now;
      dmDados.CDS_contas_receberDt_pagamento.asDatetime := now;
      dmDados.CDS_contas_receber.Post;
      dmDados.CDS_contas_receber.ApplyUpdates(0);
      cdsParcelas.Next;
    end;


      application.MessageBox('Registro inserido com sucesso.','Informa??o',MB_OK);
      TClientDataSet(dsTabela.DataSet).Open;

        for i := 0 to ComponentCount -1  do
    begin
      if Components[i] is TCustomEdit then
        TCustomEdit(Components[i]).Clear;
    end;
    if PageControl1.ActivePAge = tbsCadastro then
      begin
      tbsCadastro.TabVisible := false;
      PageControl1.ActivePage := tbsPesquisa;
      end;
      editPesquisar.SetFocus;


      cdsParcelas.EmptyDataSet;

    Except on E: Exception do
      raise Exception.Create('Erro ao Salvar Registro' + E.Message);

end;

  //fim do bot?o salvar

  //inherited;

end;

procedure TfrmCadastroReceber.BtnGerarParcelasClick(Sender: TObject);
var i : integer;
begin

  if editDocumento.Text = '' then
    begin
      Application.MessageBox('Preencha o campo Documento','Aten??o',MB_OK+MB_ICONWARNING);
      editDocumento.SetFocus;
      Abort;
    end;

    if editDescricao.Text = '' then
    begin
      Application.MessageBox('Preencha o campo Descri??o','Aten??o',MB_OK+MB_ICONWARNING);
      editDescricao.SetFocus;
      Abort;
    end;

    if editQtdParcelas.Text = '' then
    begin
      Application.MessageBox('Preencha o campo N? de Parcelas','Aten??o',MB_OK+MB_ICONWARNING);
      editQtdParcelas.SetFocus;
      Abort;
    end;

    if StringToFloat(editValorCompra.Text) = 0 then
    begin
      Application.MessageBox('Preencha o Valor da Compra','Aten??o',MB_OK+MB_ICONWARNING);
      editValorCompra.SetFocus;
      Abort;
    end;

    if editDataCompra.Text = '' then
    begin
      Application.MessageBox('Preencha o campo Data da Compra','Aten??o',MB_OK+MB_ICONWARNING);
      editDataCompra.SetFocus;
      Abort;
    end;

    cdsParcelas.EmptyDataSet;

  for I := 1 to StrToInt(editQtdParcelas.Text) do
    begin
      cdsParcelas.Insert;
      cdsParcelasParcela.AsInteger := i;
      cdsParcelasValor.AsCurrency := StringToFloat(editValorCompra.Text)/ StrtoInt(editQtdParcelas.Text);
      cdsParcelasVencimento.AsDateTime := StrToDate(editDataCompra.Text) + (StrToInt(EditVariacao.Text)* i);
      cdsParcelas.Post;

    end;

end;

procedure TfrmCadastroReceber.BtnLimparParcelasClick(Sender: TObject);
begin
  cdsParcelas.EmptyDataSet;
end;

procedure TfrmCadastroReceber.Button1Click(Sender: TObject);
begin
  inherited;
begin
if EditPesquisar.Text = '' then

begin
  Application.MessageBox('Informe um valor a ser pesquisado','Aten??o',MB_OK+MB_ICONWARNING);
  EditPesquisar.SetFocus;
  Abort;
end;


  dmDados.cds_contas_receber.Close;
  case cbxFiltros.ItemIndex of
    0: dmDados.cdscontas_pagar.CommandText := 'SELECT * FROM CONTAS_RECEBER WHERE DOCUMENTO LIKE '+QuotedStr('%'+editPesquisar.Text+'%');
    1: dmDados.cdscontas_pagar.CommandText := 'SELECT * FROM CONTAS_RECEBER WHERE DESCRICAO LIKE '+QuotedStr('%'+editPesquisar.Text+'%');
  end;
  dmDados.cdscontas_pagar.Open;


  inherited;

  end;

end;

procedure TfrmCadastroReceber.dbgDadosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin

  editarDbgrid(dsParcelas, Dbgrid1, State, Rect, Column);
end;

end.
