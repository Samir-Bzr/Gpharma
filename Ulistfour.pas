unit Ulistfour;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, ppCtrls, ppPrnabl, ppClass, ppBands,
  ppCache, ppDB, ppDesignLayer, ppParameter, ppProd, ppReport, ppComm, ppRelatv,
  ppDBPipe, Vcl.DBCtrls;

type
  TFlistefour = class(TForm)
    Image1: TImage;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    ppDBPipeline1: TppDBPipeline;
    ppReport1: TppReport;
    ppParameterList1: TppParameterList;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppDBText1: TppDBText;
    ppLabel3: TppLabel;
    ppDBText2: TppDBText;
    ppLabel4: TppLabel;
    ppDBText3: TppDBText;
    DBNavigator1: TDBNavigator;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);

    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Déclarations privées }
    FSelectedNumFour: Integer;
  public
    { Déclarations publiques }
    property SelectedNumfour: Integer read FSelectedNumFour;
  end;

var
  Flistefour: TFlistefour;

implementation

{$R *.dfm}

uses Udata;

procedure TFlistefour.DBGrid1DblClick(Sender: TObject);
begin
  if not datamodule1.ADOQueryFour.IsEmpty then
    FSelectedNumFour := datamodule1.ADOQueryFour.FieldByName('num_f').AsInteger;
  // Assuming 'num_f' is the field name

  ModalResult := mrOk; // Close the form and return 'mrOk' result
end;

procedure TFlistefour.FormActivate(Sender: TObject);
begin

  datamodule1.ADOQueryFour.Close;
  datamodule1.ADOQueryFour.SQL.Clear;
  datamodule1.ADOQueryFour.SQL.Text := 'SELECT * FROM fournisseur';
  // Open the query to retrieve data
  datamodule1.ADOQueryFour.Open;
end;

procedure TFlistefour.FormCreate(Sender: TObject);
begin
     WindowState := wsMaximized;
end;


procedure TFlistefour.FormResize(Sender: TObject);
begin
     Panel1.Left := (ClientWidth - Panel1.Width) div 2;
  Panel1.Top := ((ClientHeight - Panel1.Height) div 2)+100;
end;

end.
