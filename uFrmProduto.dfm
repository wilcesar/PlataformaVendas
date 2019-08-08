object FrmProduto: TFrmProduto
  Left = 0
  Top = 0
  BorderStyle = bsSizeToolWin
  Caption = 'Cadastro de produto'
  ClientHeight = 286
  ClientWidth = 363
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PanelPrincipal: TPanel
    Left = 0
    Top = 0
    Width = 363
    Height = 286
    Align = alClient
    TabOrder = 0
    object LNome: TLabel
      Left = 16
      Top = 67
      Width = 43
      Height = 21
      Caption = 'Nome'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object LDescricao: TLabel
      Left = 16
      Top = 136
      Width = 67
      Height = 21
      Caption = 'Descri'#231#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object LCusto: TLabel
      Left = 16
      Top = 204
      Width = 118
      Height = 21
      Caption = 'Custo de compra'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object SBSalvar: TSpeedButton
      Left = 143
      Top = 232
      Width = 90
      Height = 29
      Caption = 'Salvar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      OnClick = SBSalvarClick
    end
    object SBCancelar: TSpeedButton
      Left = 239
      Top = 232
      Width = 90
      Height = 29
      Caption = 'Cancelar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      OnClick = SBCancelarClick
    end
    object PanelProduto: TPanel
      Left = 1
      Top = 1
      Width = 361
      Height = 56
      Align = alTop
      Caption = 'Produto: 1'
      Color = clMoneyGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
    end
    object EdtNome: TEdit
      Left = 16
      Top = 96
      Width = 313
      Height = 29
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object EdtDescricao: TEdit
      Left = 16
      Top = 160
      Width = 313
      Height = 29
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object EdtCusto: TEdit
      Left = 16
      Top = 232
      Width = 121
      Height = 29
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      Text = '0,00'
      OnExit = EdtCustoExit
      OnKeyPress = EdtCustoKeyPress
    end
  end
end
