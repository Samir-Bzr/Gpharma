unit Uboncmd;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, DATEUTILS, math,
  Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, Vcl.DBCtrls, Vcl.ComCtrls, Vcl.StdCtrls,
  ppStrtch, ppTableGrid, ppCtrls, ppPrnabl, ppClass, ppDB, ppDBPipe, ppBands,
  ppCache, ppDesignLayer, ppParameter, ppComm, ppRelatv, ppProd, ppReport,
  Data.Win.ADODB, ppVar;

type
  TFboncmd = class(TForm)
    Image1: TImage;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    Label2: TLabel;
    EditFILTER: TEdit;
    Label3: TLabel;
    ppReport1: TppReport;
    ppParameterList1: TppParameterList;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppDBPipeline1: TppDBPipeline;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
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
    ppLabel7: TppLabel;
    ppDBText6: TppDBText;
    ppLabel8: TppLabel;
    ppDBText7: TppDBText;
    ppLabel9: TppLabel;
    ppDBText8: TppDBText;
    ppShape1: TppShape;
    ppSystemVariable1: TppSystemVariable;
    Button3: TButton;
    ppLabel10: TppLabel;
    ppDBText9: TppDBText;
    DBNavigator1: TDBNavigator;
    procedure FormResize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1EditButtonClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure EditFILTERChange(Sender: TObject);

    procedure Button3Click(Sender: TObject);


  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Fboncmd: TFboncmd;

implementation

{$R *.dfm}

uses Udata, Ulistepharm, Ulistfour, Ulisteprod;

procedure TFboncmd.Button1Click(Sender: TObject);
begin
  // Get the selected start and end dates from the DateTimePicker controls
  var
  startDate := DateToStr(DateTimePicker1.Date);
  var
  endDate := DateToStr(DateTimePicker2.Date);
  // Check if the start date is earlier than or equal to the end date
  if strtODATE(startDate) > strtODATE(endDate) then
  begin
    ShowMessage('Start date must be earlier than or equal to end date.');
    Exit; // Exit the function if the dates are not valid
  end;

  with datamodule1 do
  begin
    // Close the query if it's open
    if ADOQuerycmd.Active then
      ADOQuerycmd.Close;

    // Clear the previous SQL statement
    ADOQuerycmd.SQL.Clear;

    // Construct the SQL query with a WHERE clause to filter by date range
    ADOQuerycmd.SQL.Text :=
      'SELECT * FROM Bon_de_commande WHERE (Date_cmd >= :StartDate) AND (Date_cmd <= :EndDate)';

    // Set the parameter values for the start and end dates
    ADOQuerycmd.Parameters.ParamByName('StartDate').Value := startDate;
    ADOQuerycmd.Parameters.ParamByName('EndDate').Value := endDate;

    // Open the query to retrieve filtered data
    ADOQuerycmd.Open;
  end;
end;

procedure TFboncmd.Button2Click(Sender: TObject);
begin
  // Close the query if it's open
  if datamodule1.ADOQuerycmd.Active then
    datamodule1.ADOQuerycmd.Close;

  // Clear the previous SQL statement
  datamodule1.ADOQuerycmd.SQL.Clear;

  // Construct a SQL query to retrieve all records without filtering
  datamodule1.ADOQuerycmd.SQL.Text := 'SELECT * FROM Bon_de_commande';

  // Open the query to retrieve all records
  datamodule1.ADOQuerycmd.Open;
end;

procedure TFboncmd.Button3Click(Sender: TObject);
begin
ppreport1.print;
end;






procedure TFboncmd.DBGrid1EditButtonClick(Sender: TObject);
begin
  if( DBGrid1.SelectedIndex = 8)  then
  begin
     if (datamodule1.ADOQuerycmd.State = dsEDIT) OR (datamodule1.ADOquerycmd.State = dsinsert) then
    begin
      // Create the FListeProduit form
      FListepharm := TFListepharm.Create(Self);
      try

        // Show the form as a modal dialog
        if FListepharm.ShowModal = mrOK then

          datamodule1.ADOQuerycmd.FieldByName('Num_ph').Value := FListepharm.Selectednumph;


      finally
        FListepharm.Free;
      end;
    end
    else
    begin
      ShowMessage('Please start editing the receipe record before selecting a product.');
    end;
  end;

  if( DBGrid1.SelectedIndex = 2)  then
  begin
     if (datamodule1.ADOQuerycmd.State = dsEDIT) OR (datamodule1.ADOQuerycmd.State = dsinsert) then
    begin
      // Create the FListeProduit form
      FListeproduit := TFListeproduit.Create(Self);
      try
        // Show the form as a modal dialog
        if FListeproduit.ShowModal = mrOK then
        begin
          // Get the selected values from FListeProduit

           // Get the selected values from FListeProduit
          datamodule1.ADOQuerycmd.FieldByName('Num_prod').Value := FListeproduit.SelectedNumProd;
          datamodule1.ADOQuerycmd.FieldByName('Num_F').Value := FListeproduit.SelectedNumF;
        end;
      finally
        FListeproduit.Free;
      end;
    end
    else
    begin
      ShowMessage('Please start editing the STOCK record before selecting a product.');
    end;
  end;
end;



procedure TFboncmd.EditFILTERChange(Sender: TObject);
begin
  // Get the text entered in the Edit component
  var
  filterText := '%' + EditFILTER.Text + '%';
  with datamodule1 do
  begin
    // Close the query if it's open
    if ADOQuerycmd.Active then
      ADOQuerycmd.Close;

    // Clear the previous SQL statement
    ADOQuerycmd.SQL.Clear;

    // Construct the SQL query with a WHERE clause to filter by des_prod
    ADOQuerycmd.SQL.Text :=
      'SELECT * FROM bon_de_commande WHERE des_prod LIKE :FilterText';

    // Set the parameter value for the filter text
    ADOQuerycmd.Parameters.ParamByName('FilterText').Value := filterText;

    // Open the query to retrieve filtered data
    ADOQuerycmd.Open;
  end;
end;

procedure TFboncmd.FormActivate(Sender: TObject);
begin
  datamodule1.ADOQuerycmd.Close;
  datamodule1.ADOQuerycmd.SQL.Clear;
  datamodule1.ADOQuerycmd.SQL.Text := 'SELECT * FROM Bon_de_commande';
  // Open the query to retrieve data
  datamodule1.ADOQuerycmd.Open;
end;

procedure TFboncmd.FormCreate(Sender: TObject);
begin
  WindowState := wsMaximized;
end;

procedure TFboncmd.FormResize(Sender: TObject);
begin
  Panel1.Left := (ClientWidth - Panel1.Width) div 2;
  Panel1.Top := (ClientHeight - Panel1.Height) div 2;
end;

end.
