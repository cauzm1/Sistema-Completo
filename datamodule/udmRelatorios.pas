unit udmRelatorios;

interface

uses
  System.SysUtils, System.Classes, frxClass, frxDBSet, frxExportBaseDialog,
  frxExportPDF;

type
  TdmRelatorios = class(TDataModule)
    frxReport: TfrxReport;
    frxDBdsUsuarios: TfrxDBDataset;
    frxPDFExport1: TfrxPDFExport;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmRelatorios: TdmRelatorios;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses ModConexao;

{$R *.dfm}

end.
