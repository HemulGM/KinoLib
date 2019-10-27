object FormImportExcel: TFormImportExcel
  Left = 0
  Top = 0
  Caption = #1048#1084#1087#1086#1088#1090' '#1080#1079' MS Excel'
  ClientHeight = 601
  ClientWidth = 905
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 19
  object StringGridXL: TStringGrid
    AlignWithMargins = True
    Left = 10
    Top = 51
    Width = 885
    Height = 499
    Margins.Left = 10
    Margins.Top = 10
    Margins.Right = 10
    Margins.Bottom = 10
    Align = alClient
    FixedCols = 0
    TabOrder = 0
    ColWidths = (
      64
      64
      64
      64
      64)
    RowHeights = (
      24
      24
      24
      24
      24)
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 905
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    Color = 10114859
    ParentBackground = False
    TabOrder = 1
    object Label1: TLabel
      Left = 206
      Top = 0
      Width = 699
      Height = 32
      Align = alRight
      Caption = 
        #1053#1077#1086#1073#1093#1086#1076#1080#1084' '#1092#1072#1081#1083' Excel '#1089#1086' '#1089#1083#1077#1076#1091#1102#1097#1080#1084#1080' '#1089#1090#1086#1083#1073#1094#1072#1084#1080' '#1087#1086' '#1087#1086#1088#1103#1076#1082#1091': '#1085#1072#1079#1074#1072#1085#1080 +
        #1077' '#1092#1080#1083#1100#1084#1072', '#1075#1086#1076' ('#1043#1043#1043#1043'), '#1078#1072#1085#1088#1099' ('#1086#1076#1080#1085' '#1080#1083#1080' '#1095#1077#1088#1077#1079' '#1079#1072#1087#1103#1090#1091#1102'), '#1088#1077#1081#1090#1080#1085#1075' ('#1094 +
        #1077#1083#1086#1077' '#1095#1080#1089#1083#1086' 1-10), '#1076#1072#1090#1072' '#1076#1086#1073#1072#1074#1083#1077#1085#1080#1103' '#1092#1080#1083#1100#1084#1072' ('#1044#1044'.'#1052#1052'.'#1043#1043#1043#1043' '#1063#1063':'#1052#1052')'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
      WordWrap = True
    end
    object ButtonFlatOpen: TButtonFlat
      Left = 0
      Top = 0
      Width = 161
      Height = 41
      Align = alLeft
      Caption = #1042#1099#1073#1088#1072#1090#1100' '#1092#1072#1081#1083'...'
      ColorNormal = 10114859
      ColorOver = 9062169
      ColorPressed = 11889982
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      FontOver.Charset = DEFAULT_CHARSET
      FontOver.Color = clWindowText
      FontOver.Height = -13
      FontOver.Name = 'Tahoma'
      FontOver.Style = []
      FontDown.Charset = DEFAULT_CHARSET
      FontDown.Color = clWindowText
      FontDown.Height = -13
      FontDown.Name = 'Tahoma'
      FontDown.Style = []
      ImageIndentRight = 3
      RoundRectParam = 0
      ShowFocusRect = False
      TabOrder = 0
      TabStop = True
      TextFormat = [tfCenter, tfSingleLine, tfVerticalCenter]
      SubTextFont.Charset = DEFAULT_CHARSET
      SubTextFont.Color = clWhite
      SubTextFont.Height = -13
      SubTextFont.Name = 'Tahoma'
      SubTextFont.Style = []
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 560
    Width = 905
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    Color = 10114859
    ParentBackground = False
    TabOrder = 2
    object ButtonFlatImport: TButtonFlat
      Left = 656
      Top = 0
      Width = 249
      Height = 41
      Align = alRight
      Caption = #1048#1084#1087#1086#1088#1090#1080#1088#1086#1074#1072#1090#1100' '#1074#1089#1077' '#1079#1072#1087#1080#1089#1080
      ColorNormal = 10114859
      ColorOver = 9062169
      ColorPressed = 11889982
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      FontOver.Charset = DEFAULT_CHARSET
      FontOver.Color = clWindowText
      FontOver.Height = -13
      FontOver.Name = 'Tahoma'
      FontOver.Style = []
      FontDown.Charset = DEFAULT_CHARSET
      FontDown.Color = clWindowText
      FontDown.Height = -13
      FontDown.Name = 'Tahoma'
      FontDown.Style = []
      ImageIndentRight = 3
      RoundRectParam = 0
      ShowFocusRect = False
      TabOrder = 0
      TabStop = True
      TextFormat = [tfCenter, tfSingleLine, tfVerticalCenter]
      SubTextFont.Charset = DEFAULT_CHARSET
      SubTextFont.Color = clWhite
      SubTextFont.Height = -13
      SubTextFont.Name = 'Tahoma'
      SubTextFont.Style = []
    end
  end
  object FileOpenDialogXLS: TFileOpenDialog
    FavoriteLinks = <>
    FileTypes = <
      item
        DisplayName = #1042#1089#1077' '#1092#1072#1081#1083#1099' (*.*)'
        FileMask = '*.*'
      end
      item
        DisplayName = #1060#1072#1081#1083#1099' MS Excel (*.xls, *.xlsx)'
        FileMask = '*.xls; *.xlsx'
      end>
    FileTypeIndex = 2
    Options = []
    Left = 472
    Top = 240
  end
end
