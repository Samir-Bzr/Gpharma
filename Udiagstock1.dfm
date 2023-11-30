object Fdiagstock1: TFdiagstock1
  Left = 0
  Top = 0
  Caption = 'Fdiagstock1'
  ClientHeight = 476
  ClientWidth = 1097
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnActivate = FormActivate
  OnResize = FormResize
  TextHeight = 15
  object DBChart1: TDBChart
    Left = 0
    Top = 0
    Width = 1097
    Height = 476
    Title.Text.Strings = (
      'diagrame du Stock ')
    BottomAxis.Title.Caption = 'listing des medicaments'
    LeftAxis.Title.Caption = 'Quantit'#233' restante'
    Legend.Symbol.Gradient.EndColor = 7028779
    View3DOptions.Elevation = 315
    View3DOptions.Orthogonal = False
    View3DOptions.Perspective = 0
    View3DOptions.Rotation = 360
    Align = alClient
    Color = clWhite
    TabOrder = 0
    ExplicitLeft = 8
    ExplicitTop = -48
    DefaultCanvas = 'TGDIPlusCanvas'
    PrintMargins = (
      15
      28
      15
      28)
    ColorPaletteIndex = 13
    object Series1: TPieSeries
      HoverElement = []
      Marks.Callout.Length = 20
      DataSource = DataModule1.ADOQueryproduit
      XLabelsSource = 'Des_prod'
      XValues.Order = loAscending
      XValues.ValueSource = 'Num_prod'
      YValues.Name = 'Pie'
      YValues.Order = loNone
      YValues.ValueSource = 'Stock_res'
      Frame.InnerBrush.BackColor = clRed
      Frame.InnerBrush.Gradient.EndColor = clGray
      Frame.InnerBrush.Gradient.MidColor = clWhite
      Frame.InnerBrush.Gradient.StartColor = 4210752
      Frame.InnerBrush.Gradient.Visible = True
      Frame.MiddleBrush.BackColor = clYellow
      Frame.MiddleBrush.Gradient.EndColor = 8553090
      Frame.MiddleBrush.Gradient.MidColor = clWhite
      Frame.MiddleBrush.Gradient.StartColor = clGray
      Frame.MiddleBrush.Gradient.Visible = True
      Frame.OuterBrush.BackColor = clGreen
      Frame.OuterBrush.Gradient.EndColor = 4210752
      Frame.OuterBrush.Gradient.MidColor = clWhite
      Frame.OuterBrush.Gradient.StartColor = clSilver
      Frame.OuterBrush.Gradient.Visible = True
      Frame.Width = 4
      OtherSlice.Legend.Visible = False
    end
  end
end
