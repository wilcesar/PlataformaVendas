program PlataformaVendas;

uses
  Vcl.Forms,
  uFrmPrincipal in 'uFrmPrincipal.pas' {FrmPrincipal},
  uDM in 'uDM.pas' {DM: TDataModule},
  uProdutosDAO in 'DAO\uProdutosDAO.pas',
  BaseDAO in 'DAO\BaseDAO.pas',
  uFrmValores in 'uFrmValores.pas' {FrmValores},
  uComum in 'uComum.pas',
  uCestaDAO in 'DAO\uCestaDAO.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
