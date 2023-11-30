object Fdiagstock4: TFdiagstock4
  Left = 0
  Top = 0
  Caption = 'Fdiagstock4'
  ClientHeight = 503
  ClientWidth = 950
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
    Width = 950
    Height = 503
    Title.Text.Strings = (
      'diagram des sorties ')
    BottomAxis.Title.Caption = 'Quantit'#233
    LeftAxis.Title.Caption = 'Ann'#233'e'
    Legend.Symbol.Gradient.EndColor = 10708548
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 946
    ExplicitHeight = 502
    DefaultCanvas = 'TGDIPlusCanvas'
    ColorPaletteIndex = 13
    object Series1: TBarSeries
      HoverElement = []
      BarBrush.BackColor = clDefault
      BarPen.Color = 10708548
      ColorEachPoint = True
      DataSource = DataModule1.ADOQuerystockrep1
      Title = 'diagram des sorties '
      XLabelsSource = 'des_prod'
      XValues.Name = 'X'
      XValues.Order = loAscending
      XValues.ValueSource = 'stck_rest'
      YValues.Name = 'Bar'
      YValues.Order = loNone
      YValues.ValueSource = 'qte_srt'
    end
  end
end
