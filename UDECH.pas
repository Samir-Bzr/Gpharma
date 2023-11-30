unit UDECH;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.Imaging.pngimage, Vcl.DBCtrls,
  ppCtrls, ppPrnabl, ppClass, ppBands, ppCache, ppDB, ppDesignLayer,
  ppParameter, ppDBPipe, ppComm, ppRelatv, ppProd, ppReport;

type
  TFdech = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Editfilter: TEdit;
    Image1: TImage;
    DBNavigator1: TDBNavigator;
    Button3: TButton;
    ppReport1: TppReport;
    ppDBPipeline1: TppDBPipeline;
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
    ppShape1: TppShape;
    ppLabel4: TppLabel;
    ppDBText3: TppDBText;
    ppLabel5: TppLabel;
    ppDBText4: TppDBText;
    ppLabel6: TppLabel;
    ppDBText5: TppDBText;
    ppLabel7: TppLabel;
    ppDBText6: TppDBText;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure DBGrid1EditButtonClick(Sender: TObject);
    procedure EditfilterChange(Sender: TObject);
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
  Fdech: TFdech;

implementation

{$R *.dfm}

uses Udata, Ulistepharm;

procedure TFdech.Button1Click(Sender: TObject);
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
    if ADOQuerydech.Active then
      ADOQuerydech.Close;

    // Clear the previous SQL statement
    ADOQuerydech.SQL.Clear;

    // Construct the SQL query with a WHERE clause to filter by date range
    ADOQuerydech.SQL.Text :=
      'SELECT * FROM DECHARGE WHERE (Date_dech >= :StartDate) AND (Date_dech <= :EndDate)';

    // Set the parameter values for the start and end dates
    ADOQuerydech.Parameters.ParamByName('StartDate').Value := startDate;
    ADOQuerydech.Parameters.ParamByName('EndDate').Value := endDate;

    // Open the query to retrieve filtered data
    ADOQuerydech.Open;
  end;
end;

procedure TFdech.Button2Click(Sender: TObject);
begin
     // Close the query if it's open
  if datamodule1.ADOQueryDECH.Active then
    datamodule1.ADOQueryDECH.Close;

  // Clear the previous SQL statement
  datamodule1.ADOQueryDECH.SQL.Clear;

  // Construct a SQL query to retrieve all records without filtering
  datamodule1.ADOQueryDECH.SQL.Text := 'SELECT * FROM DECHARGE';

  // Open the query to retrieve all records
  datamodule1.ADOQueryDECH.Open;
end;

procedure TFdech.Button3Click(Sender: TObject);
begin
PPREPORT1.Print;
end;

procedure TFdech.DBGrid1EditButtonClick(Sender: TObject);

begin
 if( DBGrid1.SelectedIndex = 5)  then
  begin
     if (datamodule1.ADOQuerydech.State = dsEDIT) OR (datamodule1.ADOquerydech.State = dsinsert) then
    begin
      // Create the FListeProduit form
      FListepharm := TFListepharm.Create(Self);
      try

        // Show the form as a modal dialog
        if FListepharm.ShowModal = mrOK then

          datamodule1.ADOQuerydech.FieldByName('Num_ph').Value := FListepharm.Selectednumph;


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

procedure TFdech.EditfilterChange(Sender: TObject);
begin
  // Get the text entered in the Edit component
  var
  filterText := '%' + EditFILTER.Text + '%';
  with datamodule1 do
  begin
    // Close the query if it's open
    if ADOQuerydech.Active then
      ADOQuerydech.Close;

    // Clear the previous SQL statement
    ADOQuerydech.SQL.Clear;

    // Construct the SQL query with a WHERE clause to filter by des_prod
    ADOQuerydech.SQL.Text :=
      'SELECT * FROM decharge WHERE des_prod LIKE :FilterText';

    // Set the parameter value for the filter text
    ADOQuerydech.Parameters.ParamByName('FilterText').Value := filterText;

    // Open the query to retrieve filtered data
    ADOQuerydech.Open;
  end;
end;

procedure TFdech.FormActivate(Sender: TObject);
begin
    datamodule1.ADOQuerydech.Close;
  datamodule1.ADOQuerydech.SQL.Clear;
  datamodule1.ADOQuerydech.SQL.Text := 'SELECT * FROM DECHARGE';
  // Open the query to retrieve data
  datamodule1.ADOQuerydech.Open;
end;

procedure TFdech.FormCreate(Sender: TObject);
begin
       WindowState := wsMaximized;
end;

procedure TFdech.FormResize(Sender: TObject);
begin
    Panel1.Left := (ClientWidth - Panel1.Width) div 2;
  Panel1.Top := ((ClientHeight - Panel1.Height) div 2)+ 120;
end;

end.
