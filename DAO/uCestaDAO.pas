unit uCestaDAO;

interface

uses
  BaseDAO, FireDAC.Comp.Client;

type
  TCestaDAO = class(TBaseDAO)
  private
  protected
    function VirgulaPorPonto(Valor: string): String;
  public
    destructor Destroy; override;
    function SelectQuery(SQL: String): TFDQuery;
    function ExecQuery(SQL: String): Boolean;
    function GravaCesta: String;
    procedure GravaCestaItens(IDCesta: String);

  end;

const
  INSERTCESTA
    : String = 'INSERT INTO cesta (DataCompra, ValorTotal)VALUES(%s,%s);';
  LASTIDCESTA: String = ' SELECT MAX(ID) AS ID FROM cesta';
  INSERTCESTAITENS
    : String =
    'INSERT INTO cesta_itens (cesta_ID, produto_ID, quantidade, valorTotal)VALUES(%s,%s,%s,%s)';

implementation

uses
  uDM, System.SysUtils, uFrmPrincipal;

{ TCestaDAO }

destructor TCestaDAO.Destroy;
begin

  inherited;
end;

function TCestaDAO.ExecQuery(SQL: String): Boolean;
begin
  try
    DM.FDConnection.StartTransaction;
    DM.FDQuery.SQL.Text := SQL;
    DM.FDQuery.ExecSQL;
    Result := DM.FDQuery.RowsAffected > 0;
  Except
    Result := False;
  end;
end;

function TCestaDAO.GravaCesta: String;
var
  SQL: string;
  Query: TFDQuery;
begin
  SQL := format(INSERTCESTA,
    ['Curdate()', VirgulaPorPonto(FrmPrincipal.LTotal.Caption)]);
  ExecutarComando(SQL);
  Query := SelectQuery(LASTIDCESTA);
  Result := Query.FieldByName('ID').AsString;
end;

procedure TCestaDAO.GravaCestaItens(IDCesta: String);
var
  SQL: string;
begin
  FrmPrincipal.FDMTCesta.First;
  while not FrmPrincipal.FDMTCesta.Eof do
  begin
    SQL := format(INSERTCESTAITENS, [IDCesta, FrmPrincipal.FDMTCestaID.AsString,
      FrmPrincipal.FDMTCestaQuantidade.AsString,
      VirgulaPorPonto(FrmPrincipal.FDMTCestaPrecoVenda.AsString)]);
    ExecutarComando(SQL);
    FrmPrincipal.FDMTCesta.Next;
  end;
end;

function TCestaDAO.SelectQuery(SQL: String): TFDQuery;
begin
  DM.FDQuery.SQL.Text := SQL;
  DM.FDQuery.Active := True;
  Result := DM.FDQuery;
end;

function TCestaDAO.VirgulaPorPonto(Valor: string): String;
var
  i: Integer;
  vlrSemPonto: String;
begin
  vlrSemPonto := StringReplace(Valor, '.', '', [rfReplaceAll, rfIgnoreCase]);
  if vlrSemPonto <> '' then
  begin
    for i := 0 to Length(vlrSemPonto) do
    begin
      if vlrSemPonto[i] = ',' then
        vlrSemPonto[i] := '.';
    end;
  end;
  Result := vlrSemPonto;
end;

end.
