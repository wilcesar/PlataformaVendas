object FrmValores: TFrmValores
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'FrmValores'
  ClientHeight = 159
  ClientWidth = 236
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PanelPrincipal: TPanel
    Left = 0
    Top = 0
    Width = 236
    Height = 159
    Align = alClient
    Color = clMoneyGreen
    ParentBackground = False
    TabOrder = 0
    object Label1: TLabel
      Left = 74
      Top = 25
      Width = 81
      Height = 21
      Caption = 'Quantidade'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object SBCancelar: TSpeedButton
      Left = 120
      Top = 110
      Width = 113
      Height = 33
      Caption = 'Cancelar'
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD7D7D78787875F
        5F5F606060888888D9D9D9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFF0F0F05C5C5C0101011A1A1A4949494949491919190101015F5F5FF2F2
        F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEF2E2E2E1A1A1AAFAFAFFEFEFEFF
        FFFFFFFFFFFDFDFDACACAC101010303030F2F2F2FFFFFFFFFFFFFFFFFFFFFFFF
        5858581B1B1BE2E2E2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F8F0101011010
        105F5F5FFFFFFFFFFFFFFFFFFFD4D4D4000000B3B3B3FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFF8F8F8F0101018F8F8FACACAC010101D9D9D9FFFFFFFFFFFF828282
        1E1E1EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F8F0101018F8F8FFFFFFFFDFD
        FD191919888888FFFFFFFFFFFF5B5B5B4F4F4FFFFFFFFFFFFFFFFFFFFFFFFF8F
        8F8F0101018F8F8FFFFFFFFFFFFFFFFFFF494949606060FFFFFFFFFFFF5B5B5B
        4F4F4FFFFFFFFFFFFFFFFFFF8F8F8F0101018F8F8FFFFFFFFFFFFFFFFFFFFFFF
        FF4949495F5F5FFFFFFFFFFFFF8181811F1F1FFFFFFFFFFFFF8F8F8F0101018F
        8F8FFFFFFFFFFFFFFFFFFFFFFFFFFEFEFE1A1A1A878787FFFFFFFFFFFFD2D2D2
        000000B6B6B68F8F8F0101018F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFAF
        AF010101D7D7D7FFFFFFFFFFFFFFFFFF5555551313130101018F8F8FFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFE2E2E21A1A1A5C5C5CFFFFFFFFFFFFFFFFFFFFFFFF
        EDEDED292929131313B6B6B6FFFFFFFFFFFFFFFFFFFFFFFFB3B3B31B1B1B2E2E
        2EF0F0F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDEDED5555550000001F1F1F4F
        4F4F4F4F4F1E1E1E000000585858EFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFD2D2D28181815B5B5B5B5B5B828282D4D4D4FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      OnClick = SBCancelarClick
    end
    object SBSalvar: TSpeedButton
      Left = 3
      Top = 110
      Width = 113
      Height = 33
      Caption = 'Confirmar'
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        6060600101010000000000000000000000000000000000000000000000000101
        01646464FFFFFFFFFFFFFFFFFFFFFFFF0101010000000000000000001A1A1A91
        9191909090181818000000000000000000010101FFFFFFFFFFFFFFFFFFFFFFFF
        000000000000000000000000C9C9C9FFFFFFFFFFFFC7C7C70000000000000000
        00000000FFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000F9F9F9FF
        FFFFFFFFFFF8F8F8000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF
        000000000000000000000000989898FFFFFFFFFFFF9595950000000000000000
        00000000FFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000000001010142
        4242414141010101000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF
        0000000000000000000000000000000000000000000000000000000000000000
        00000000FFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000
        0000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF
        000000ABABABFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000
        00000000FFFFFFFFFFFFFFFFFFFFFFFF000000ABABABFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF000000000000000000373737FFFFFFFFFFFFFFFFFFFFFFFF
        010101737373ABABABABABABABABABABABABABABABABABAB0000000000003838
        38F1F1F1FFFFFFFFFFFFFFFFFFFFFFFF5E5E5E01010100000000000000000000
        0000000000000000000000393939F1F1F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      OnClick = SBSalvarClick
    end
    object EdtQuantidade: TEdit
      Left = 58
      Top = 49
      Width = 113
      Height = 29
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Text = '1'
      OnKeyPress = EdtQuantidadeKeyPress
    end
  end
end
