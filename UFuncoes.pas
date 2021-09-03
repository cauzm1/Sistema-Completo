unit UFuncoes;

interface

uses
  Vcl.Forms, System.SysUtils, System.Classes, Data.DB, Data.SqlExpr,
  Vcl.DBGrids, Vcl.Grids, System.Types, System.Generics.Collections;

  function GetID(Campo,Tabela : String) : Integer;
  function GetLoginCadastrado (Login : String) : Boolean;
  function StringtoFloat (s : string) : Extended;
  procedure EditarDBGrid(DataSource : TDataSource; Sender : TDBGrid; State :TGridDrawState; Rect : TRect; Column : Tcolumn);

implementation

uses ModConexao, ufrmCadastroUsuarios;

function GetID(Campo,Tabela : String) : Integer;
  begin
    with
    TSQLQuery.Create(nil) do
      try
        SQLConnection := dmDados.SQLConnection;
        SQL.Add('SELECT '+Campo+' FROM '+Tabela+' ORDER BY '+Campo+' DESC LIMIT 1 ');
        Open;
        Result := Fields[0].AsInteger + 1;
      finally
        Close;
        Free;
    end;
  end;
function GetLoginCadastrado (Login : String) : Boolean;
  begin
  result := false;
      with
      TSQLQuery.Create(nil) do

        try
          SQLConnection := dmDados.SQLConnection;
          SQL.Add('SELECT ID FROM USUARIOS WHERE LOGIN = :LOGIN ');
          Params [0].AsString := Login;
          Open;
          if not IsEmpty then
            result := false;
        finally
        Close;
        Free;
        end;
  end;

  procedure EditarDBGrid(DataSource : TDataSource; Sender : TDBGrid; State :TGridDrawState; Rect : TRect; Column : Tcolumn);
  begin
    if not odd(DataSource.DataSet.RecNo) then
      begin
        if not (gdSelected in State) then
        begin
          Sender.Canvas.Brush.Color := $00FFEFDF;
          Sender.Canvas.FillRect(Rect);
          Sender.DefaultDrawDatacell(Rect,Column.Field, State);
        end;

      end;
  end;
  function StringToFloat(s : string) : Extended;
{ Filtra uma string qualquer, convertendo as suas partes
  numéricas para sua representação decimal, por exemplo:
  'R$ 1.200,00' para 1200,00 '1AB34TZ' para 134}
var
  i :Integer;
  t : string;
  SeenDecimal,SeenSgn : Boolean;
begin
   t := '';
   SeenDecimal := False;
   SeenSgn := False;
   {Percorre os caracteres da string:}
   for i := Length(s) downto 0 do
  {Filtra a string, aceitando somente números e separador decimal:}

     if (s[i] in ['0'..'9', '-','+',',']) then
     begin
        if (s[i] = ',') and (not SeenDecimal) then
        begin
           t := s[i] + t;
           SeenDecimal := True;
        end
        else if (s[i] in ['+','-']) and (not SeenSgn) and (i = 1) then
        begin
           t := s[i] + t;
           SeenSgn := True;
        end
        else if s[i] in ['0'..'9'] then
        begin
           t := s[i] + t;
        end;
     end;
   Result := StrToFloat(t);
end;
end.
