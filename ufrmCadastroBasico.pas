unit ufrmCadastroBasico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.ComCtrls, Vcl.ToolWin, Vcl.ActnMan, Vcl.ActnCtrls,
  Vcl.ExtCtrls, System.Actions, Vcl.ActnList, System.ImageList, Vcl.ImgList,
  Vcl.PlatformDefaultStyleActnCtrls, Datasnap.DBClient, Vcl.Buttons;

type
  TfrmCadastroBasico = class(TForm)
    dsTabela: TDataSource;
    ImageListCadastro: TImageList;
    StatusBar1: TStatusBar;
    actAcoes: TActionList;
    acInserir: TAction;
    acEditar: TAction;
    acExcluir: TAction;
    acSalvar: TAction;
    acCancelar: TAction;
    acImprimir: TAction;
    acFechar: TAction;
    acPesquisar: TAction;
    PageControl1: TPageControl;
    tbsCadastro: TTabSheet;
    btnInserir: TSpeedButton;
    btnEditar: TSpeedButton;
    btnSalvar: TSpeedButton;
    btnCancelar: TSpeedButton;
    btnPesquisar: TSpeedButton;
    btnImprimir: TSpeedButton;
    btnFechar: TSpeedButton;
    btnExcluir: TSpeedButton;
    tbsPesquisa: TTabSheet;
    Label2: TLabel;
    Button1: TButton;
    dbgDados: TDBGrid;
    EditPesquisar: TEdit;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    SpeedButton11: TSpeedButton;
    SpeedButton12: TSpeedButton;
    SpeedButton13: TSpeedButton;
    SpeedButton14: TSpeedButton;
    SpeedButton15: TSpeedButton;
    SpeedButton16: TSpeedButton;
    cbxFiltros: TComboBoxEx;
    Label5: TLabel;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbsPesquisarShow(Sender: TObject);
    procedure acInserirExecute(Sender: TObject);
    procedure acCancelarExecute(Sender: TObject);
    procedure acEditarExecute(Sender: TObject);
    procedure acExcluirExecute(Sender: TObject);
    procedure acSalvarExecute(Sender: TObject);
    procedure acPesquisarExecute(Sender: TObject);
    procedure acImprimirExecute(Sender: TObject);
    procedure acFecharExecute(Sender: TObject);
    procedure acInserirUpdate(Sender: TObject);
    procedure acEditarUpdate(Sender: TObject);
    procedure acExcluirUpdate(Sender: TObject);
    procedure acSalvarUpdate(Sender: TObject);
    procedure acCancelarUpdate(Sender: TObject);
    procedure acPesquisarUpdate(Sender: TObject);
    procedure acImprimirUpdate(Sender: TObject);
    procedure dbgDadosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);

  private
    { Private declarations }
    iModo : integer;
    procedure LimparTudo;
  public
    { Public declarations }
  end;

var
  frmCadastroBasico: TfrmCadastroBasico;

implementation

{$R *.dfm}

uses ModConexao, UFuncoes;

procedure TfrmCadastroBasico.acCancelarUpdate(Sender: TObject);
begin
TAction(acCancelar).Enabled:=TAction(acSalvar).Enabled = true;
end;

procedure TfrmCadastroBasico.acEditarExecute(Sender: TObject);
begin
iModo:=1;
  if PageControl1.ActivePage = tbsPesquisa then
    tbsCadastro.TabVisible := true;
    tbsPesquisa.TabVisible := false;
    PageControl1.Activepage := tbsCadastro;
    TClientDataSet(dsTabela.DataSet).Edit;
end;

procedure TfrmCadastroBasico.acEditarUpdate(Sender: TObject);
begin
if (not TclientDataSet(dsTabela.DataSet).IsEmpty) then
    acEditar.Enabled := true;
end;

procedure TfrmCadastroBasico.acExcluirExecute(Sender: TObject);
begin
if Application.MessageBox('Deseja realmente excluir o registro?','Pergunta',
MB_YESNO+MB_IconQuestion) = MRYES then
  begin
    try
      TClientDataSet(dsTabela.DataSet).Delete;
      TClientDataSet(dsTabela.DataSet).ApplyUpdates(0);
    
      Application.MessageBox('Registro excluido com sucesso','Informação',0+64);
      TClientDataSet(dsTabela.DataSet).Open;

        Except on E : Exception do
        raise  Exception.Create('Erro ao excluir registro:'+E.Message);
  end;
end;
end;

procedure TfrmCadastroBasico.acExcluirUpdate(Sender: TObject);
begin
  if (dsTabela.State in [dsBrowse]) and (not TclientDataSet(dsTabela.DataSet).IsEmpty) then
    AcExcluir.Enabled := dsTabela.State in [dsBrowse];
end;

procedure TfrmCadastroBasico.acFecharExecute(Sender: TObject);
begin
close;
end;

procedure TfrmCadastroBasico.acImprimirExecute(Sender: TObject);
begin
showmessage('a');
end;

procedure TfrmCadastroBasico.acImprimirUpdate(Sender: TObject);
begin
if (dsTabela.State in [dsBrowse]) and (not TclientDataSet(dsTabela.DataSet).IsEmpty) then
    AcImprimir.Enabled := dsTabela.State in [dsBrowse];
end;

procedure TfrmCadastroBasico.acInserirExecute(Sender: TObject);
begin
iModo :=  0;
 if PageControl1.ActivePage = tbsPesquisa then
  tbsCadastro.TabVisible := true;
  tbsPesquisa.TabVisible := false;
  PageControl1.ActivePage := tbsCadastro;
    if not TClientDataSet(dsTabela.DataSet).Active then
      TClientDataSet(dsTabela.DataSet).Open;
      TClientDataSet(dsTabela.DataSet).Insert;
end;

procedure TfrmCadastroBasico.acInserirUpdate(Sender: TObject);
begin
AcInserir.Enabled := dsTabela.State in [dsBrowse, dsInactive];
end;

procedure TfrmCadastroBasico.acSalvarExecute(Sender: TObject);
begin
  try
    TClientDataSet(dsTabela.DataSet).Post;
    TClientDataSet(dsTabela.DataSet).ApplyUpdates(0);

  case iModo of
    0 : application.MessageBox('Registro inserido com sucesso.','Informação',MB_OK);
    1 : application.MessageBox('Registro atualizado com sucesso.','Informação',MB_OK);
  end;

    //limpar os campos
      LimparTudo;
      TClientDataSet(dsTabela.DataSet).Open

    Except on E: Exception do
      raise Exception.Create('Erro ao Salvar Registro' + E.Message);

end;
end;

procedure TfrmCadastroBasico.acCancelarExecute(Sender: TObject);
begin
  LimparTudo;
  TClientDataSet(dsTabela.DataSet).Cancel;
end;

procedure TfrmCadastroBasico.acSalvarUpdate(Sender: TObject);
begin
AcSalvar.Enabled := dsTabela.State in [dsinsert,dsedit];
end;

procedure TfrmCadastroBasico.dbgDadosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
EditarDBGrid(dsTabela,dbgDados,State,Rect,Column);
end;

procedure TfrmCadastroBasico.acPesquisarExecute(Sender: TObject);
begin
  PageControl1.ActivePage := tbsPesquisa;
  editpesquisar.clear;
end;

procedure TfrmCadastroBasico.acPesquisarUpdate(Sender: TObject);
begin
//
end;

procedure TfrmCadastroBasico.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  TClientDataSet(dsTabela.DataSet).Close;
  TClientDataSet(dsTabela.DataSet).Cancel;
end;

procedure TfrmCadastroBasico.FormKeyPress(Sender: TObject; var Key: Char);
begin
if key = #27 then
  close;

  if key=#13 then
    Perform(WM_NEXTDLGCTL,0,0);
end;
procedure TfrmCadastroBasico.LimparTudo;
var i : integer;
begin
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
end;
procedure TfrmCadastroBasico.tbsPesquisarShow(Sender: TObject);
begin
Pagecontrol1.Activepage := tbsPesquisa;
end;

end.
