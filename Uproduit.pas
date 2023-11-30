unit Uproduit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.Buttons, Vcl.DBActns, System.Actions,
  Vcl.ActnList, Data.DB, Vcl.Grids, Vcl.DBGrids, ppTableGrid, ppStrtch,
  ppPrnabl, ppClass, ppCtrls, ppBands, ppCache, ppDB, ppDesignLayer,
  ppParameter, ppDBPipe, ppComm, ppRelatv, ppProd, ppReport;

type
  TFproduit = class(TForm)
    Imageproduit: TImage;
    Panel1: TPanel;
    ActionList1: TActionList;
    DatasetPrior1: TDataSetPrior;
    DatasetNext1: TDataSetNext;
    DatasetInsert1: TDataSetInsert;
    DatasetDelete1: TDataSetDelete;
    DatasetEdit1: TDataSetEdit;
    DatasetPost1: TDataSetPost;
    DatasetCancel1: TDataSetCancel;
    DatasetRefresh1: TDataSetRefresh;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    DBNavigator1: TDBNavigator;
    EditFILTER: TEdit;
    Label3: TLabel;
    DBGrid1: TDBGrid;
    Button1: TButton;
    ppReport1: TppReport;
    ppDBPipeline1: TppDBPipeline;
    ppParameterList1: TppParameterList;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLabel4: TppLabel;
    ppTableGrid1: TppTableGrid;
    ppTableRow1: TppTableRow;
    ppTableCell1: TppTableCell;
    ppTableCell2: TppTableCell;
    ppTableCell3: TppTableCell;
    ppTableCell4: TppTableCell;
    ppTableCell5: TppTableCell;
    ppTableColumn1: TppTableColumn;
    ppTableColumn2: TppTableColumn;
    ppTableColumn3: TppTableColumn;
    ppTableColumn4: TppTableColumn;
    ppTableColumn5: TppTableColumn;
    ppTableGrid2: TppTableGrid;
    ppTableRow2: TppTableRow;
    ppTableCell6: TppTableCell;
    ppTableCell7: TppTableCell;
    ppTableCell8: TppTableCell;
    ppTableCell9: TppTableCell;
    ppTableCell10: TppTableCell;
    ppTableColumn6: TppTableColumn;
    ppTableColumn7: TppTableColumn;
    ppTableColumn8: TppTableColumn;
    ppTableColumn9: TppTableColumn;
    ppTableColumn10: TppTableColumn;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppTableColumn11: TppTableColumn;
    ppTableCell11: TppTableCell;
    ppTableColumn12: TppTableColumn;
    ppTableCell12: TppTableCell;
    ppLabel8: TppLabel;
    ppDBText6: TppDBText;
    procedure FormActivate(Sender: TObject);

    procedure FormResize(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure EditFILTERChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Fproduit: TFproduit;

implementation

{$R *.dfm}

uses Udata;

procedure TFproduit.Button1Click(Sender: TObject);
begin
ppreport1.Print;
end;

procedure TFproduit.EditFILTERChange(Sender: TObject);
begin
    // Get the text entered in the Edit component
  var
  filterText := '%' + EditFILTER.Text + '%';
  with datamodule1 do
  begin
    // Close the query if it's open
    if ADOQueryPRODUIT.Active then
      ADOQueryPRODUIT.Close;

    // Clear the previous SQL statement
    ADOQuerYPRODUIT.SQL.Clear;

    // Construct the SQL query with a WHERE clause to filter by des_prod
    ADOQueryPRODUIT.SQL.Text :=
      'SELECT * FROM PRODUIT WHERE des_prod LIKE :FilterText';

    // Set the parameter value for the filter text
    ADOQueryPRODUIT.Parameters.ParamByName('FilterText').Value := filterText;

    // Open the query to retrieve filtered data
    ADOQueryPRODUIT.Open;
  end;
end;

procedure TFproduit.FormActivate(Sender: TObject);
begin
     datamodule1.ADOQueryPRODUIT.Close;
  datamodule1.ADOQueryPRODUIT.SQL.Clear;
  datamodule1.ADOQueryPRODUIT.SQL.Text := 'SELECT * FROM PRODUIT';
  // Open the query to retrieve data
  datamodule1.ADOQueryPRODUIT.Open;
end;


procedure TFproduit.FormCreate(Sender: TObject);
begin
  WindowState := wsMaximized;
end;

procedure TFproduit.FormResize(Sender: TObject);
begin
  Panel1.Left := (ClientWidth - Panel1.Width) div 2;
  Panel1.Top := ((ClientHeight - Panel1.Height) div 2)-40;
end;

procedure TFproduit.Image1Click(Sender: TObject);
begin
  Fproduit.Close;
end;

end.
