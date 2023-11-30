unit Upharmacien;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  Vcl.DBCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TFpharma = class(TForm)
    Image1: TImage;
    Panel1: TPanel;
    DBNavigator1: TDBNavigator;
    DBGrid1: TDBGrid;
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Fpharma: TFpharma;

implementation

{$R *.dfm}

uses Udata;

procedure TFpharma.FormActivate(Sender: TObject);
begin
  datamodule1.ADOQueryPharm.Close;
  datamodule1.ADOQueryPharm.SQL.Clear;
  datamodule1.ADOQuerypharm.SQL.Text := 'SELECT * FROM pharmacien';
  // Open the query to retrieve data
  datamodule1.ADOQueryPharm.Open;
end;

procedure TFpharma.FormCreate(Sender: TObject);
begin
      WindowState := wsMaximized;
end;

end.
