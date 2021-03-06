unit ufrmCadastroPagar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmCadastroBasico, Data.DB,
  System.Actions, Vcl.ActnList, System.ImageList, Vcl.ImgList, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Datasnap.DBClient, tpEdit;

type
  TfrmCadastroPagar = class(TfrmCadastroBasico)
    Label1: TLabel;
    EditDocumento: TEdit;
    Label3: TLabel;
    EditDescricao: TEdit;
    Label4: TLabel;
    EditQtdParcelas: TEdit;
    Label6: TLabel;
    EditValorCompra: TtpEdit;
    EditDataCompra: TtpEdit;
    Label7: TLabel;
    EditVariacao: TEdit;
    Label8: TLabel;
    cdsParcelas: TClientDataSet;
    DBGrid1: TDBGrid;
    dsParcelas: TDataSource;
    BtnGerarParcelas: TBitBtn;
    cdsParcelasParcela: TIntegerField;
    cdsParcelasValor: TCurrencyField;
    cdsParcelasVencimento: TDateField;
    BtnLimparParcelas: TBitBtn;
    //procedure dsTabelaDataChange(Sender: TObject; Field: TField);
    procedure BtnLimparParcelasClick(Sender: TObject);
    procedure BtnGerarParcelasClick(Sender: TObject);
    procedure dbgDadosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure acSalvarExecute(Sender: TObject);
    procedure acEditarExecute(Sender: TObject);
    procedure acPesquisarExecute(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure acExcluirExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroPagar: TfrmCadastroPagar;

implementation

{$R *.dfm}

uses ModConexao, UFuncoes;


procedure TfrmCadastroPagar.acEditarExecute(Sender: TObject);
begin
Application.MessageBox('Preencha o campo Documento','Aten??o',MB_OK+MB_ICONWARNING);

end;

procedure TfrmCadastroPagar.acExcluirExecute(Sender: TObject);
begin
  //inherited;
if Application.MessageBox('Deseja realmente cancelar o documento?','Pergunta',
MB_YESNO+MB_IconQuestion) = MRYES then
  begin
    try
      TClientDataSet(dsTabela.DataSet).Edit;
      dmDados.cdscontas_pagarStatus.AsString :='C';
      TClientDataSet(dsTabela.DataSet).ApplyUpdates(0);

      Application.MessageBox('Registro cancelado com sucesso','Informa??o',0+64);
      TClientDataSet(dsTabela.DataSet).Open;

        Except on E : Exception do
        raise  Exception.Create('Erro ao cancelar registro:'+E.Message);
  end;
end
end;

procedure TfrmCadastroPagar.acPesquisarExecute(Sender: TObject);
begin
  inherited;
dmDados.cdscontas_pagar.Close;
dmDados.cdscontas_pagar.CommandText := 'SELECT * FROM CONTAS_PAGAR';
dmDados.cdscontas_pagar.Open;

end;

procedure TfrmCadastroPagar.acSalvarExecute(Sender: TObject);
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
      dmDados.CDScontas_pagar.Insert;
      dmDados.CDScontas_pagarid.AsInteger := GetID('ID','CONTAS_PAGAR');
      dmDados.CDScontas_pagarnumero_doc.AsString := Trim(editDocumento.Text);
      dmDados.CDScontas_pagardescricao.AsString := Trim(editDescricao.Text);
      dmDados.CDScontas_pagarValor_Compra.AsCurrency := StringToFloat(editValorCompra.Text);
      dmDados.CDScontas_pagarParcelas.AsInteger := cdsParcelasParcela.AsInteger;
      dmDados.CDScontas_pagarValor_Parcelas.AsCurrency := cdsParcelasValor.AsInteger;
      dmDados.CDScontas_pagarDt_Compra.AsDateTime := StrToDate(editDataCompra.Text);
      dmDados.CDScontas_pagarDt_Vencimento.AsDateTime := cdsParcelasVencimento.AsDateTime;
      dmDados.CDScontas_pagarStatus.AsString := 'A';
      dmDados.CDScontas_pagarValor_Abatido.AsCurrency := 0 ;
      dmDados.CDScontas_pagarDt_cadastro.AsDateTime := now;
      dmDados.CDScontas_pagarDt_pagamento.asDatetime := now;
      dmDados.CDScontas_pagar.Post;
      dmDados.CDScontas_pagar.ApplyUpdates(0);
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


   // inherited;
end;

procedure TfrmCadastroPagar.BtnGerarParcelasClick(Sender: TObject);
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

procedure TfrmCadastroPagar.BtnLimparParcelasClick(Sender: TObject);
begin
  cdsParcelas.EmptyDataSet;
end;

procedure TfrmCadastroPagar.Button1Click(Sender: TObject);
begin
inherited;
begin
if EditPesquisar.Text = '' then

begin
  Application.MessageBox('Informe um valor a ser pesquisado','Aten??o',MB_OK+MB_ICONWARNING);
  EditPesquisar.SetFocus;
  Abort;
end;


  dmDados.cdscontas_pagar.Close;
  case cbxFiltros.ItemIndex of
    0: dmDados.cdscontas_pagar.CommandText := 'SELECT * FROM CONTAS_PAGAR WHERE DOCUMENTO LIKE '+QuotedStr('%'+editPesquisar.Text+'%');
    1: dmDados.cdscontas_pagar.CommandText := 'SELECT * FROM CONTAS_PAGAR WHERE DESCRICAO LIKE '+QuotedStr('%'+editPesquisar.Text+'%');
  end;
  dmDados.cdscontas_pagar.Open;


  inherited;

  end;
end;

procedure TfrmCadastroPagar.dbgDadosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin

editarDbgrid(dsParcelas, Dbgrid1, State, Rect, Column);

end;

end.
