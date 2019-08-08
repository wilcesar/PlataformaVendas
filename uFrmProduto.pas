unit uFrmProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  uProdutosDAO, uDM, uComum;

type
  TFrmProduto = class(TForm)
    PanelPrincipal: TPanel;
    PanelProduto: TPanel;
    EdtNome: TEdit;
    EdtDescricao: TEdit;
    EdtCusto: TEdit;
    LNome: TLabel;
    LDescricao: TLabel;
    LCusto: TLabel;
    SBSalvar: TSpeedButton;
    SBCancelar: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure SBSalvarClick(Sender: TObject);
    procedure SBCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EdtCustoExit(Sender: TObject);
    procedure EdtCustoKeyPress(Sender: TObject; var Key: Char);
  private
    Comum: TComum;
    ProdutosDAO: TProdutosDAO;
    procedure LimparCampos;
  public
    idUpdate: Integer;
  end;

var
  FrmProduto: TFrmProduto;

implementation

uses
  uFrmPrincipal;

{$R *.dfm}

procedure TFrmProduto.EdtCustoExit(Sender: TObject);
begin
  Comum.ExitEditMoeda(EdtCusto);
end;

procedure TFrmProduto.EdtCustoKeyPress(Sender: TObject; var Key: Char);
begin
  Comum.FormatEditMoeda(EdtCusto, Key, 20);
end;

procedure TFrmProduto.FormCreate(Sender: TObject);
begin
  idUpdate := FrmPrincipal.ID;
  Comum := TComum.Create;
end;

procedure TFrmProduto.FormShow(Sender: TObject);
begin
  if FrmPrincipal.ID > 0 then
    if FrmPrincipal.FDMTProdutos.Locate('ID', FrmPrincipal.ID) then
    begin
      EdtNome.Text := FrmPrincipal.FDMTProdutosNome.AsString;
      EdtDescricao.Text := FrmPrincipal.FDMTProdutosDescricao.AsString;
      EdtCusto.Text := FrmPrincipal.FDMTProdutosCustoCompra.AsString;
    end;
end;

procedure TFrmProduto.LimparCampos;
begin
  EdtNome.Text := '';
  EdtDescricao.Text := '';
  EdtCusto.Text := '';
end;

procedure TFrmProduto.SBCancelarClick(Sender: TObject);
begin
  LimparCampos;
  close;
end;

procedure TFrmProduto.SBSalvarClick(Sender: TObject);
begin
  if EdtNome.Text = '' then
  begin
    ShowMessage('O campo Nome é obrigatório!');
    EdtNome.SetFocus;
    Exit;
  end;
  ProdutosDAO.CadastraProduto(idUpdate);
  LimparCampos;
  close;
end;

end.
