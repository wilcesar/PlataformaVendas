unit uFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uDM, Vcl.ExtCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.WinXCtrls, Vcl.Buttons, uProdutosDAO,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.DApt, uComum, IniFiles,
  uCestaDAO;

type
  TFrmPrincipal = class(TForm)
    PanelPrincipal: TPanel;
    PanelTitulo: TPanel;
    PanelConteudo: TPanel;
    DSProdutos: TDataSource;
    EdtDespesas: TEdit;
    LDespesas: TLabel;
    SBAddCesta: TSpeedButton;
    SBRemoverCesta: TSpeedButton;
    SBOpenCesta: TSpeedButton;
    SVCesta: TSplitView;
    DBGridCestas: TDBGrid;
    DSCesta: TDataSource;
    LMargemLucro: TLabel;
    EdtMargemLucro: TEdit;
    SBNovoProduto: TSpeedButton;
    SBEditarProduto: TSpeedButton;
    DBGridProdutos: TDBGrid;
    FDMTProdutos: TFDMemTable;
    FDMTProdutosID: TIntegerField;
    FDMTProdutosNome: TStringField;
    FDMTProdutosDescricao: TStringField;
    FDMTProdutosCustoCompra: TFloatField;
    FDMTCesta: TFDMemTable;
    FDMTCestaID: TIntegerField;
    FDMTCestaNome: TStringField;
    FDMTCestaCustoCompra: TFloatField;
    FDMTCestaMargemLucro: TFloatField;
    FDMTCestaQuantidade: TFloatField;
    FDMTCestaPrecoVenda: TFloatField;
    SpeedButton1: TSpeedButton;
    Label1: TLabel;
    LTotal: TLabel;
    SBGravarCesta: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure SBAddCestaClick(Sender: TObject);
    procedure EdtDespesasKeyPress(Sender: TObject; var Key: Char);
    procedure EdtDespesasExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SBOpenCestaClick(Sender: TObject);
    procedure EdtMargemLucroExit(Sender: TObject);
    procedure EdtMargemLucroKeyPress(Sender: TObject; var Key: Char);
    procedure SBNovoProdutoClick(Sender: TObject);
    procedure SBEditarProdutoClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SBRemoverCestaClick(Sender: TObject);
    procedure SBGravarCestaClick(Sender: TObject);
  private
    ProdutosDAO: TProdutosDAO;
    CestaDao: TCestaDAO;
    Comum: TComum;
    procedure ListarProdutos;
    procedure ProcessaCesta;
  public
    ID: Integer;
    procedure LimpaCampos;
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

uses
  uFrmValores, uFrmProduto;

{$R *.dfm}

procedure TFrmPrincipal.ListarProdutos;
begin
  try
    ProdutosDAO.getProdutos();
  except
    on e: exception do
      raise exception.Create(e.Message);
  end;
end;

procedure TFrmPrincipal.LimpaCampos;
begin
  EdtDespesas.Text := '0,00';
  EdtMargemLucro.Text := '0,00';
  LTotal.Caption := '0,00';
  FDMTCesta.EmptyDataSet;

end;

procedure TFrmPrincipal.ProcessaCesta;
var
  despesasRateio, precoVenda, totalCesta: Currency;
begin
  totalCesta := 0;

  if not FDMTCesta.IsEmpty then
    if Trim(EdtDespesas.Text) <> '0,00' then
      despesasRateio := StrToCurr(Comum.RemoveEditMoeda(EdtDespesas.Text)) /
        FDMTCesta.RecNo
    else
      despesasRateio := 400 / FDMTCesta.RecNo;

  FDMTCesta.First;
  while not FDMTCesta.Eof do
  begin
    FDMTCesta.Edit;
    FDMTCestaMargemLucro.AsCurrency :=
      StrToCurr(Comum.RemoveEditMoeda(EdtMargemLucro.Text));
    precoVenda := FDMTCestaCustoCompra.AsCurrency + despesasRateio;

    if FDMTCestaMargemLucro.AsCurrency > 0 then
      precoVenda := precoVenda * (FDMTCestaQuantidade.AsCurrency +
        FDMTCestaMargemLucro.AsCurrency / 100);

    FDMTCestaPrecoVenda.AsCurrency := precoVenda;
    totalCesta := totalCesta + precoVenda;

    FDMTCesta.Post;
    FDMTCesta.Next;
  end;
  LTotal.Caption := FormatFloat('#,0.00', totalCesta);
end;

procedure TFrmPrincipal.SBAddCestaClick(Sender: TObject);
begin
  try
    FrmValores := TFrmValores.Create(Self);
    FrmValores.ShowModal;
  finally
    FreeAndNil(FrmValores);
    ProcessaCesta;
    DBGridCestas.Refresh;
  end;
end;

procedure TFrmPrincipal.SBEditarProdutoClick(Sender: TObject);
begin
  try
    ID := FDMTProdutosID.AsInteger;
    FrmProduto := TFrmProduto.Create(Self);
    FrmProduto.PanelProduto.Caption := 'Produto ' + FDMTProdutosID.AsString;
    FrmProduto.ShowModal;
  finally
    FreeAndNil(FrmProduto);
    ProcessaCesta;
    ListarProdutos;
  end;
end;

procedure TFrmPrincipal.SBGravarCestaClick(Sender: TObject);
var
  IDCesta: String;
begin
  ProcessaCesta;
  IDCesta := CestaDao.GravaCesta();
  if IDCesta <> '' then
    CestaDao.GravaCestaItens(IDCesta);
  ShowMessage('Compra realizada com sucesso!');
  LimpaCampos;
end;

procedure TFrmPrincipal.SBNovoProdutoClick(Sender: TObject);
begin
  try
    FrmProduto := TFrmProduto.Create(Self);
    FrmProduto.PanelProduto.Caption := 'Novo produto';
    FrmProduto.ShowModal;
  finally
    FreeAndNil(FrmProduto);
    ProcessaCesta;
    ListarProdutos;
  end;
end;

procedure TFrmPrincipal.SBOpenCestaClick(Sender: TObject);
begin
  ProcessaCesta;
  SVCesta.Open;

end;

procedure TFrmPrincipal.SBRemoverCestaClick(Sender: TObject);
begin
  FDMTCesta.Delete;
  ProcessaCesta;
end;

procedure TFrmPrincipal.SpeedButton1Click(Sender: TObject);
begin
  SVCesta.Close;
end;

procedure TFrmPrincipal.EdtDespesasExit(Sender: TObject);
begin
  Comum.ExitEditMoeda(EdtDespesas);
  ProcessaCesta;
end;

procedure TFrmPrincipal.EdtDespesasKeyPress(Sender: TObject; var Key: Char);
begin
  Comum.FormatEditMoeda(EdtDespesas, Key, 20);
end;

procedure TFrmPrincipal.EdtMargemLucroExit(Sender: TObject);
begin
  Comum.ExitEditMoeda(EdtMargemLucro);
  ProcessaCesta;
end;

procedure TFrmPrincipal.EdtMargemLucroKeyPress(Sender: TObject; var Key: Char);
begin
  Comum.FormatEditMoeda(EdtMargemLucro, Key, 20);
end;

procedure TFrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(FDMTProdutos);
  FreeAndNil(FDMTCesta);
end;

procedure TFrmPrincipal.FormCreate(Sender: TObject);
var
  arquivoINI: TIniFile;
begin
  DM := TDM.Create(Self);

  // arquivoINI := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'conexao.ini');
  // DM.FDConnection.Params.Add('Server='+arquivoINI.ReadString('conexao','SERVIDOR', ''));
  // DM.FDConnection.Params.UserName := arquivoINI.ReadString('conexao','USUARIO', '');
  // DM.FDConnection.Params.Password := arquivoINI.ReadString('conexao','SENHA', '');
  // DM.FDConnection.Params.Add('Port=' + arquivoINI.ReadString('conexao','PORTA', ''));
  // DM.FDConnection.Params.Database :=arquivoINI.ReadString('conexao','BANCO', '');

  Comum := TComum.Create;
  ProdutosDAO := TProdutosDAO.Create;
  FDMTProdutos.CreateDataSet;
  FDMTCesta.CreateDataSet;
  ListarProdutos;
  ID := 0;
end;

end.
