object Fdiagstock2: TFdiagstock2
  Left = 0
  Top = 0
  Caption = 'Fdiagstock2'
  ClientHeight = 498
  ClientWidth = 897
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
    Width = 897
    Height = 498
    Title.Text.Strings = (
      'Diagram de rapport stock/besoins')
    BottomAxis.Title.Caption = 'STOCK'
    LeftAxis.Title.Caption = 'Quantit'#233' de produit'
    Legend.Symbol.Gradient.EndColor = 12503391
    Legend.Title.Text.Strings = (
      'cl'#233'es')
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 893
    ExplicitHeight = 497
    DefaultCanvas = 'TGDIPlusCanvas'
    ColorPaletteIndex = 13
    object Series2: TBarSeries
      HoverElement = []
      BarBrush.Gradient.Direction = gdLeftRight
      BarBrush.Gradient.EndColor = 12503391
      Marks.Visible = False
      DataSource = DataModule1.ADOQUERYSTOCK
      SeriesColor = 12503391
      Title = 'Quantit'#233' sortie par raport au stock'
      XLabelsSource = 'des_prod'
      Gradient.Direction = gdLeftRight
      Gradient.EndColor = 12503391
      Sides = 34
      XValues.Name = 'X'
      XValues.Order = loAscending
      XValues.ValueSource = 'stck_rest'
      YValues.Name = 'Bar'
      YValues.Order = loNone
      YValues.ValueSource = 'qte_srt'
    end
    object Series1: TBarSeries
      HoverElement = []
      Marks.Visible = False
      Marks.Callout.Length = 8
      Marks.Tail.Margin = 2
      DataSource = DataModule1.ADOQUERYSTOCK
      Title = 'Quantit'#233' entr'#233' par raport au stock'
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
