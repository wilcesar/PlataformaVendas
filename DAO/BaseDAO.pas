unit BaseDAO;

interface

uses FireDAC.Comp.Client, System.SysUtils, uDM, Data.DB, Vcl.Dialogs,
  System.Classes, FireDAC.DApt;

type
  TBaseDAO = Class(TObject)
  private

  protected
    constructor Create;
    destructor Destroy; override;
    function RetornarDataSet(pSQL: String): TFDQuery;
    function ExecutarComando(pSQL: String): Integer;
  end;

implementation

{ TBaseDAO }

constructor TBaseDAO.Create;
begin
  inherited Create;
end;

destructor TBaseDAO.Destroy;
begin

end;

function TBaseDAO.ExecutarComando(pSQL: String): Integer;
begin
  try
    DM.FDConnection.StartTransaction;
    DM.FDQuery.SQL.Text := pSQL;
    DM.FDQuery.ExecSQL;
    Result := DM.FDQuery.RowsAffected;
    DM.FDConnection.Commit;
  except
    DM.FDConnection.Rollback;
  end;
end;

function TBaseDAO.RetornarDataSet(pSQL: String): TFDQuery;
begin
  DM.FDQuery.SQL.Text := pSQL;
  DM.FDQuery.Active := True;
  Result := DM.FDQuery;
end;

end.
