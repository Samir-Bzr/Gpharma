unit Udiagstock1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VclTee.TeeGDIPlus, Data.DB,
  VCLTee.TeEngine, VCLTee.Series, Vcl.ExtCtrls, VCLTee.TeeProcs, VCLTee.Chart,
  VCLTee.DBChart, Vcl.StdCtrls;

type
  TFdiagstock1 = class(TForm)
    DBChart1: TDBChart;
    Series1: TPieSeries;
    procedure FormResize(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Fdiagstock1: TFdiagstock1;

implementation

{$R *.dfm}

uses Udata;



procedure TFdiagstock1.FormActivate(Sender: TObject);
begin
   datamodule1.ADOQueryPRODUIT.Close;
  datamodule1.ADOQueryPRODUIT.SQL.Clear;
  datamodule1.ADOQueryPRODUIT.SQL.Text := 'SELECT * FROM PRODUIT';
  // Open the query to retrieve data
  datamodule1.ADOQueryPRODUIT.Open;
end;

procedure TFdiagstock1.FormResize(Sender: TObject);
begin
    WindowState := wsMaximized;
end;

end.
