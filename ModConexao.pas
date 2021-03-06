unit ModConexao;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.SqlExpr, Data.DBXMySQL,
  Data.FMTBcd, Datasnap.DBClient, Datasnap.Provider;

type
  TdmDados = class(TDataModule)
    SQLConnection: TSQLConnection;
    DScaixa: TSQLDataSet;
    DSPcaixa: TDataSetProvider;
    CDScaixa: TClientDataSet;
    DScontas_pagar: TSQLDataSet;
    DSPcontas_pagar: TDataSetProvider;
    CDScontas_pagar: TClientDataSet;
    DScontas_receber: TSQLDataSet;
    DSPcontas_receber: TDataSetProvider;
    CDS_contas_receber: TClientDataSet;
    DSusuarios: TSQLDataSet;
    DSPusuarios: TDataSetProvider;
    CDSusuarios: TClientDataSet;
    CDScaixaid: TIntegerField;
    CDScaixanumero_doc: TStringField;
    CDScaixadescricao: TStringField;
    CDScaixavalor: TFMTBCDField;
    CDScaixatipo: TStringField;
    CDScaixadt_cadastro: TDateField;
    CDScontas_pagarid: TIntegerField;
    CDScontas_pagarnumero_doc: TStringField;
    CDScontas_pagardescricao: TStringField;
    CDScontas_pagarparcelas: TIntegerField;
    CDScontas_pagarvalor_parcelas: TFMTBCDField;
    CDScontas_pagarvalor_compra: TFMTBCDField;
    CDScontas_pagarvalor_abatido: TFMTBCDField;
    CDScontas_pagardt_compra: TDateField;
    CDScontas_pagardt_cadastro: TDateField;
    CDScontas_pagardt_vencimento: TDateField;
    CDScontas_pagardt_pagamento: TDateField;
    CDScontas_pagarstatus: TStringField;
    CDS_contas_receberid: TIntegerField;
    CDS_contas_receberdocumento: TStringField;
    CDS_contas_receberdescricao: TStringField;
    CDS_contas_receberparcelas: TIntegerField;
    CDS_contas_recebervalor_parcelas: TFMTBCDField;
    CDS_contas_recebervalor_compra: TFMTBCDField;
    CDS_contas_recebervalor_abatido: TFMTBCDField;
    CDS_contas_receberdt_compra: TDateField;
    CDS_contas_receberdt_vencimento: TDateField;
    CDS_contas_receberdt_cadastro: TDateField;
    CDS_contas_receberstatus: TStringField;
    CDS_contas_receberdt_pagamento: TStringField;
    CDSusuariosid: TIntegerField;
    CDSusuariosnome: TStringField;
    CDSusuarioslogin: TStringField;
    CDSusuariossenha: TStringField;
    CDSusuariosstatus: TStringField;
    CDSusuariosdt_cadastro: TDateField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmDados: TdmDados;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
