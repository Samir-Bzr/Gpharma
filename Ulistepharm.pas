unit Ulistepharm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, Vcl.DBCtrls, Vcl.StdCtrls, ppCtrls,
  ppPrnabl, ppClass, ppBands, ppCache, ppDB, ppDesignLayer, ppParameter, ppProd,
  ppReport, ppComm, ppRelatv, ppDBPipe;

type
  TFlistepharm = class(TForm)
    Imagelistpharm: TImage;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Button1: TButton;
    DBNavigator1: TDBNavigator;
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
    ppLabel5: TppLabel;
    ppDBText4: TppDBText;
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    FSelectedNumph: Integer;
  public
    { Déclarations publiques }
     property Selectednumph: Integer read FSelectedNumph;
  end;

var
  Flistepharm: TFlistepharm;

implementation

{$R *.dfm}

uses Udata;

procedure TFlistepharm.Button1Click(Sender: TObject);
begin
      if not datamodule1.ADOQuerypharm.IsEmpty then
    FSelectedNumph := datamodule1.ADOQuerypharm.FieldByName('num_ph').AsInteger;

  ModalResult := mrOk; // Close the form and return 'mrOk' result
end;


procedure TFlistepharm.FormActivate(Sender: TObject);
begin
  datamodule1.ADOQueryPharm.Close;
  datamodule1.ADOQueryPharm.SQL.Clear;
  datamodule1.ADOQuerypharm.SQL.Text := 'SELECT * FROM pharmacien';
  // Open the query to retrieve data
  datamodule1.ADOQueryPharm.Open;
end;

procedure TFlistepharm.FormCreate(Sender: TObject);
begin
  WindowState := wsMaximized;
end;

end.
