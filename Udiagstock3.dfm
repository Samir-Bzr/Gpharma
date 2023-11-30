object Fdiagstock3: TFdiagstock3
  Left = 0
  Top = 0
  Caption = 'Fdiagstock3'
  ClientHeight = 524
  ClientWidth = 969
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnActivate = FormActivate
  TextHeight = 15
  object DBChart1: TDBChart
    Left = 0
    Top = 0
    Width = 969
    Height = 524
    Title.Text.Strings = (
      'diagram des entr'#233'es')
    Title.TextFormat = ttfHtml
    BottomAxis.Title.Caption = 'Quantit'#233
    LeftAxis.Title.Caption = 'Ann'#233'e'
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 965
    ExplicitHeight = 523
    DefaultCanvas = 'TGDIPlusCanvas'
    PrintMargins = (
      15
      23
      15
      23)
    ColorPaletteIndex = 13
    object Series1: TBarSeries
      HoverElement = []
      BarBrush.BackColor = clDefault
      BarPen.Color = 10708548
      ColorEachPoint = True
      DataSource = DataModule1.ADOQuerystockrep1
      Title = 'diagram des entr'#233'es'
      XLabelsSource = 'des_prod'
      XValues.Name = 'X'
      XValues.Order = loAscending
      XValues.ValueSource = 'stck_rest'
      YValues.Name = 'Bar'
      YValues.Order = loNone
      YValues.ValueSource = 'qte_ent'
    end
  end
end
