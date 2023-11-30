unit Ubonliv;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.DBCtrls,
  Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids,DATEUTILS, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  ppCtrls, ppPrnabl, ppClass, ppBands, ppCache, ppDB, ppDesignLayer,
  ppParameter, ppProd, ppReport, ppComm, ppRelatv, ppDBPipe;

type
  TFbonliv = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    DBGrid1: TDBGrid;
    DateTimePicker1: TDateTimePicker;
    DBNavigator1: TDBNavigator;
    DateTimePicker2: TDateTimePicker;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    EditFILTER: TEdit;
    Label3: TLabel;
    Image1: TImage;
    ppDBPipeline1: TppDBPipeline;
    ppReport1: TppReport;
    ppParameterList1: TppParameterList;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLabel1: TppLabel;
    ppShape1: TppShape;
    ppLabel2: TppLabel;
    ppDBText1: TppDBText;
    ppLabel3: TppLabel;
    ppDBText2: TppDBText;
    ppLabel4: TppLabel;
    ppDBText3: TppDBText;
    ppShape2: TppShape;
    ppLabel5: TppLabel;
    ppDBText4: TppDBText;
    ppLabel6: TppLabel;
    ppDBText5: TppDBText;
    ppLabel8: TppLabel;
    ppDBText7: TppDBText;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure DBGrid1EditButtonClick(Sender: TObject);
    procedure EditFILTERChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Fbonliv: TFbonliv;

implementation

{$R *.dfm}

uses Udata, Ulistepharm, Ulistfour, Ulisteprod;

procedure TFbonliv.Button1Click(Sender: TObject);
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
    if ADOQuerybonliv.Active then
      ADOQuerybonliv.Close;

    // Clear the previous SQL statement
    ADOQuerybonliv.SQL.Clear;

    // Construct the SQL query with a WHERE clause to filter by date range
    ADOQuerybonliv.SQL.Text :=
      'SELECT * FROM Bon_de_livraison WHERE (Date_bl >= :StartDate) AND (Date_bl <= :EndDate)';

    // Set the parameter values for the start and end dates
    ADOQuerybonliv.Parameters.ParamByName('StartDate').Value := startDate;
    ADOQuerybonliv.Parameters.ParamByName('EndDate').Value := endDate;

    // Open the query to retrieve filtered data
    ADOQuerybonliv.Open;
  end;
end;

procedure TFbonliv.Button2Click(Sender: TObject);
begin
   // Close the query if it's open
  if datamodule1.ADOQuerybonliv.Active then
    datamodule1.ADOQuerybonliv.Close;

  // Clear the previous SQL statement
  datamodule1.ADOQuerybonliv.SQL.Clear;

  // Construct a SQL query to retrieve all records without filtering
  datamodule1.ADOQuerybonliv.SQL.Text := 'SELECT * FROM Bon_de_livraison';

  // Open the query to retrieve all records
  datamodule1.ADOQuerybonliv.Open;
end;

procedure TFbonliv.Button3Click(Sender: TObject);
begin
ppreport1.Print;
end;

procedure TFbonliv.DBGrid1EditButtonClick(Sender: TObject);
begin
      if( DBGrid1.SelectedIndex = 6)  then
  begin
     if (datamodule1.ADOQuerybonliv.State = dsEDIT) OR (datamodule1.ADOquerybonliv.State = dsinsert) then
    begin
      // Create the FListeProduit form
      FListeproduit := TFListeproduit.Create(Self);
      try

        // Show the form as a modal dialog
        if FListeproduit.ShowModal = mrOK then
        begin

          datamodule1.ADOQuerybonliv.FieldByName('Num_prod').Value := FListeproduit.SelectedNumProd;
          datamodule1.ADOQuerybonliv.FieldByName('Num_F').Value := FListeproduit.SelectedNumF;
        end;
      finally
        FListeproduit.Free;
      end;
    end
    else
    begin
      ShowMessage('Please start editing the receipe record before selecting a product.');
    end;
  end;
   if( DBGrid1.SelectedIndex = 5)  then
  begin
     if (datamodule1.ADOQuerybonliv.State = dsEDIT) OR (datamodule1.ADOquerybonliv.State = dsinsert) then
    begin
      // Create the FListeProduit form
      FListepharm := TFListepharm.Create(Self);
      try

        // Show the form as a modal dialog
        if FListepharm.ShowModal = mrOK then

          datamodule1.ADOQuerybonliv.FieldByName('Num_ph').Value := FListepharm.Selectednumph;


      finally
        FListepharm.Free;
      end;
    end
    else
    begin
      ShowMessage('Please start editing the receipe record before selecting a product.');
    end;
  end;
end;



procedure TFbonliv.EditFILTERChange(Sender: TObject);
begin
        // Get the text entered in the Edit component
  var
  filterText := '%' + EditFILTER.Text + '%';
  with datamodule1 do
  begin
    // Close the query if it's open
    if ADOQueryBONLIV.Active then
      ADOQueryBONLIV.Close;

    // Clear the previous SQL statement
    ADOQueryBONLIV.SQL.Clear;

    // Construct the SQL query with a WHERE clause to filter by des_prod
    ADOQueryBONLIV.SQL.Text :=
      'SELECT * FROM bon_de_LIVRAISON WHERE ADR_CLT LIKE :FilterText';

    // Set the parameter value for the filter text
    ADOQueryBONLIV.Parameters.ParamByName('FilterText').Value := filterText;

    // Open the query to retrieve filtered data
    ADOQueryBONLIV.Open;
  end;
end;

procedure TFbonliv.FormActivate(Sender: TObject);
begin
      datamodule1.ADOQueryBONLIV.Close;
  datamodule1.ADOQueryBONLIV.SQL.Clear;
  datamodule1.ADOQueryBONLIV.SQL.Text := 'SELECT * FROM Bon_de_LIVRAISON';
  // Open the query to retrieve data
  datamodule1.ADOQueryBONLIV.Open;
end;

procedure TFbonliv.FormCreate(Sender: TObject);
begin
      WindowState := wsMaximized;
end;

procedure TFbonliv.FormResize(Sender: TObject);
begin
        Panel1.Left := (ClientWidth - Panel1.Width) div 2;
  Panel1.Top := ((ClientHeight - Panel1.Height) div 2)+40;

end;

end.
