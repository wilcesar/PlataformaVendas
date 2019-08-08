unit uFrmValores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons, Vcl.StdCtrls,
  Data.DB, uDM;

type
  TFrmValores = class(TForm)
    PanelPrincipal: TPanel;
    Label1: TLabel;
    EdtQuantidade: TEdit;
    SBSalvar: TSpeedButton;
    SBCancelar: TSpeedButton;
    procedure SBCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SBSalvarClick(Sender: TObject);
    procedure EdtQuantidadeKeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }
  public
  end;

var
  FrmValores: TFrmValores;

implementation

uses
  uFrmPrincipal;

{$R *.dfm}

procedure TFrmValores.EdtQuantidadeKeyPress(Sender: TObject; var Key: Char);
begin
  if ((key in ['0'..'9'] = false) and (word(key) <> vk_back)) then
    key := #0;
end;

procedure TFrmValores.FormCreate(Sender: TObject);
begin
  EdtQuantidade.Text := '1';
  if FrmPrincipal.FDMTCesta.State <> dsInactive then
    if FrmPrincipal.FDMTCesta.Locate('ID', FrmPrincipal.FDMTProdutosID.AsInteger) then
      EdtQuantidade.Text := FrmPrincipal.FDMTCestaQuantidade.AsString;
end;



procedure TFrmValores.SBCancelarClick(Sender: TObject);
begin
  EdtQuantidade.Text := '0,00';
  Close;
end;

procedure TFrmValores.SBSalvarClick(Sender: TObject);
begin
  if (EdtQuantidade.Text = '') OR (EdtQuantidade.Text = '0') then
  begin
    ShowMessage('A quantidade deve ser maior que zero!"');
    Exit;
  end;
  if (FrmPrincipal.FDMTCesta.State = dsInactive) then
    FrmPrincipal.FDMTCesta.CreateDataSet;
  if FrmPrincipal.FDMTCesta.Locate('ID', FrmPrincipal.FDMTProdutosID.AsInteger) then
  begin
    FrmPrincipal.FDMTCesta.Edit;
    FrmPrincipal.FDMTCestaQuantidade.AsCurrency := StrToCurr(EdtQuantidade.Text);
    FrmPrincipal.FDMTCesta.Post;
  end
  else
  begin
    FrmPrincipal.FDMTCesta.Append;
    FrmPrincipal.FDMTCestaID.AsInteger := FrmPrincipal.FDMTProdutosID.AsInteger;
    FrmPrincipal.FDMTCestaNome.AsString := FrmPrincipal.FDMTProdutosNome.AsString;
    FrmPrincipal.FDMTCestaCustoCompra.AsCurrency := FrmPrincipal.FDMTProdutosCustoCompra.AsCurrency;
    FrmPrincipal.FDMTCestaQuantidade.AsCurrency := StrToCurr(EdtQuantidade.Text);
    FrmPrincipal.FDMTCesta.Post;
  end;
  Close;
end;

end.
