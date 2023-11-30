unit Ulistefact;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, ppDB, ppDBPipe, ppComm, ppRelatv, ppProd, ppClass, ppReport,
  Vcl.StdCtrls, Vcl.Imaging.pngimage, ppBands, ppCache, ppDesignLayer,
  ppParameter, ppCtrls, ppPrnabl, Vcl.DBCtrls, raCodMod, ppModule, ppVar,
  ppStrtch, ppPageBreak, ppSubRpt;

type
  TFlistefact = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Image1: TImage;
    Button1: TButton;
    ppReport1: TppReport;
    ppParameterList1: TppParameterList;
    ppDBPipeline1: TppDBPipeline;
    DBNavigator1: TDBNavigator;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppShape1: TppShape;
    ppLabel2: TppLabel;
    ppDBText1: TppDBText;
    ppLabel3: TppLabel;
    ppDBText2: TppDBText;
    ppLabel4: TppLabel;
    ppDBText3: TppDBText;
    ppLabel5: TppLabel;
    ppDBText4: TppDBText;
    ppLabel6: TppLabel;
    ppDBText5: TppDBText;
    ppLabel15: TppLabel;
    ppLabel13: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText13: TppDBText;
    ppDBText12: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppLabel14: TppLabel;
    ppSummaryBand1: TppSummaryBand;
    ppLabel9: TppLabel;
    ppDBText8: TppDBText;
    raCodeModule1: TraCodeModule;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Déclarations privées }
    FSelectedNumFact: Integer;
  public
    { Déclarations publiques }
    property SelectedNumfact: Integer read FSelectedNumFact;
  end;

var
  Flistefact: TFlistefact;

implementation

{$R *.dfm}

uses Udata;

procedure TFlistefact.Button1Click(Sender: TObject);
begin
ppreport1.Print;
end;

procedure TFlistefact.DBGrid1DblClick(Sender: TObject);
begin
  if not datamodule1.ADOQueryFour.IsEmpty then
    FSelectedNumFact := datamodule1.ADOQueryfact.FieldByName('num_fac')
      .AsInteger; // Assuming 'num_f' is the field name

  ModalResult := mrOk; // Close the form and return 'mrOk' result
end;

procedure TFlistefact.FormActivate(Sender: TObject);
begin
datamodule1.ADOTablefact.Open;
  datamodule1.ADOQueryfact.Close;
  datamodule1.ADOQueryfact.SQL.Clear;
  datamodule1.ADOQueryfact.SQL.Text := 'SELECT * FROM facture ';
  // Open the query to retrieve data
  DATAMODULE1.ADOQueryfact.Open;
  datamodule1.ADOQueryfactrep.Close;
  datamodule1.ADOQueryfactrep.SQL.Clear;
   datamodule1.ADOQueryFactRep.SQL.Text :=
    'SELECT num_fac, num_f, num_prod, date_fac, nom_clt, adr_clt, ' +
    'des_prod, qte_fact, tva, prix_u, prix_ht, tva_fact, ' +
    '(prix_u * qte_fact) + tva_fact AS mtt ' +
    'FROM facture ' +
    'WHERE num_fac = :RecordNumber ' +
    'GROUP BY num_fac, num_f, num_prod, date_fac, nom_clt, adr_clt, ' +
    'des_prod, qte_fact, tva, prix_u, prix_ht, tva_fact';
    datamodule1.ADOQueryfactrep.Open;
end;

procedure TFlistefact.FormCreate(Sender: TObject);
begin
     WindowState := wsMaximized;
end;

procedure TFlistefact.FormResize(Sender: TObject);
begin
  Panel1.Left := (ClientWidth - Panel1.Width) div 2;
  Panel1.Top := ((ClientHeight - Panel1.Height) div 2);
end;

end.
