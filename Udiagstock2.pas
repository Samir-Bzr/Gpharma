unit Udiagstock2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VclTee.TeeGDIPlus, Data.DB,
  VCLTee.TeEngine, VCLTee.Series, Vcl.ExtCtrls, VCLTee.TeeProcs, VCLTee.Chart,
  VCLTee.DBChart;

type
  TFdiagstock2 = class(TForm)
    DBChart1: TDBChart;
    Series1: TBarSeries;
    Series2: TBarSeries;
    procedure FormActivate(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Fdiagstock2: TFdiagstock2;

implementation

{$R *.dfm}

uses Udata;

procedure TFdiagstock2.FormActivate(Sender: TObject);
begin
     datamodule1.ADOQuerystock.Close;
  datamodule1.ADOQuerystock.SQL.Clear;
  datamodule1.ADOQuerystock.SQL.Text := 'SELECT * FROM stock';
  // Open the query to retrieve data
  datamodule1.ADOQuerystock.Open;
end;

end.
