unit Udiagstock4;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VclTee.TeeGDIPlus, Data.DB,
  VCLTee.TeEngine, VCLTee.Series, Vcl.ExtCtrls, VCLTee.TeeProcs, VCLTee.Chart,
  VCLTee.DBChart;

type
  TFdiagstock4 = class(TForm)
    DBChart1: TDBChart;
    Series1: TBarSeries;
    procedure FormActivate(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Fdiagstock4: TFdiagstock4;

implementation

{$R *.dfm}

uses Udata;

procedure TFdiagstock4.FormActivate(Sender: TObject);
begin
       datamodule1.adoquerydiag3.open;
end;

end.
