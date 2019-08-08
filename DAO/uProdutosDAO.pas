unit uProdutosDAO;

interface

uses FireDAC.Comp.Client, System.SysUtils, uDM, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.DApt, BaseDAO, uComum;

type
  TProdutosDAO = class(TBaseDAO)
  private
  protected
    function VirgulaPorPonto(Valor: string): String;
  public
    destructor Destroy; override;
    function SelectQuery(SQL: String): TFDQuery;
    function ExecQuery(SQL: String): Boolean;
    procedure getProdutos();
    procedure CadastraProduto(ID: Integer);
  end;

const
  SELECTPRODUTOS
    : String =
    ' SELECT  ID, Nome, Descricao, CustoCompra FROM  Produtos WHERE CustoCompra > 0';
  SELECTPRODUTO
    : String =
    ' SELECT  ID, Nome, Descricao, CustoCompra FROM  Produtos WHERE WHERE ID=%s';
  INSERTPRODUTO
    : String =
    'INSERT INTO Produtos (Nome, Descricao, CustoCompra) VALUES(%s,%s,%s) ';
  UPDATEPRODUTO
    : String =
    'UPDATE Produtos SET Nome=%s, Descricao=%s, CustoCompra=%s WHERE ID=%s';

implementation

uses
  uFrmProduto, uFrmPrincipal;

{ TProdutosDAO }

{ TProdutosDAO }

procedure TProdutosDAO.CadastraProduto(ID: Integer);
var
  SQL: string;
begin
  if ID > 0 then
  begin
    SQL := Format(UPDATEPRODUTO, [QuotedStr(FrmProduto.EdtNome.Text),
      QuotedStr(FrmProduto.EdtDescricao.Text),
      VirgulaPorPonto(FrmProduto.EdtCusto.Text), IntToStr(ID)])
  end
  else
  begin
    SQL := Format(INSERTPRODUTO, [QuotedStr(FrmProduto.EdtNome.Text),
      QuotedStr(FrmProduto.EdtDescricao.Text),
      VirgulaPorPonto(FrmProduto.EdtCusto.Text)])
  end;
  ExecutarComando(SQL);

end;

destructor TProdutosDAO.Destroy;
begin

  inherited;
end;

function TProdutosDAO.ExecQuery(SQL: String): Boolean;
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

function TProdutosDAO.SelectQuery(SQL: String): TFDQuery;
begin
  DM.FDQuery.SQL.Text := SQL;
  DM.FDQuery.Active := True;
  Result := DM.FDQuery;
end;

function TProdutosDAO.VirgulaPorPonto(Valor: string): String;
var
  i: Integer;
begin
  if Valor <> '' then
  begin
    for i := 0 to Length(Valor) do
    begin
      if Valor[i] = ',' then
        Valor[i] := '.';

    end;
  end;
  Result := Valor;
end;

procedure TProdutosDAO.getProdutos();
var
  Query: TFDQuery;
begin
  FrmPrincipal.FDMTProdutos.EmptyDataSet;
  Query := SelectQuery(SELECTPRODUTOS);
  Query.First;
  while not Query.Eof do
  begin
    FrmPrincipal.FDMTProdutos.Append;
    FrmPrincipal.FDMTProdutos.FieldByName('ID').AsInteger :=
      Query.FieldByName('ID').AsInteger;
    FrmPrincipal.FDMTProdutos.FieldByName('Nome').AsString :=
      Query.FieldByName('Nome').AsString;
    FrmPrincipal.FDMTProdutos.FieldByName('Descricao').AsString :=
      Query.FieldByName('Descricao').AsString;
    FrmPrincipal.FDMTProdutos.FieldByName('CustoCompra').AsCurrency :=
      Query.FieldByName('CustoCompra').AsCurrency;
    FrmPrincipal.FDMTProdutos.Post;
    Query.next;
  end;
end;

end.
