object DM: TDM
  OldCreateOrder = False
  Height = 161
  Width = 197
  object FDConnection: TFDConnection
    Params.Strings = (
      'DriverID=MySQL'
      'User_Name=root'
      'Database=plataformavendas'
      'Password=1234')
    Left = 32
    Top = 16
  end
  object FDPhysMySQLDriverLink: TFDPhysMySQLDriverLink
    Left = 104
    Top = 16
  end
  object FDGUIxWaitCursor: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 104
    Top = 104
  end
  object FDQuery: TFDQuery
    Connection = FDConnection
    Left = 40
    Top = 104
  end
end
