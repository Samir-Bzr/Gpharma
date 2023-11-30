unit Udiagstock3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VclTee.TeeGDIPlus, Data.DB,
  VCLTee.TeEngine, Vcl.ExtCtrls, VCLTee.TeeProcs, VCLTee.Chart, VCLTee.DBChart,
  VCLTee.Series, Vcl.StdCtrls;

type
  TFdiagstock3 = class(TForm)
    DBChart1: TDBChart;
    Series1: TBarSeries;
    procedure FormActivate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Fdiagstock3: TFdiagstock3;

implementation

{$R *.dfm}

uses Udata;

procedure TFdiagstock3.Button1Click(Sender: TObject);
begin
dbchart1.Print;
end;

procedure TFdiagstock3.FormActivate(Sender: TObject);
begin
datamodule1.adoquerydiag3.open;
end;

end.
