unit Ustock;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.Buttons, Vcl.DBActns, System.Actions,
  Vcl.ActnList, Data.DB, Vcl.Grids,dateutils, Vcl.DBGrids, Vcl.ComCtrls, ppProd,
  ppClass, ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, ppCtrls, ppPrnabl,
  ppBands, ppCache, ppDesignLayer, ppParameter,math;

type
  TFstock = class(TForm)
    ActionList1: TActionList;
    Action1: TAction;
    Action2: TAction;
    DatasetPrior1: TDataSetPrior;
    DatasetNext1: TDataSetNext;
    DatasetInsert1: TDataSetInsert;
    DatasetDelete1: TDataSetDelete;
    DatasetEdit1: TDataSetEdit;
    DatasetPost1: TDataSetPost;
    DatasetCancel1: TDataSetCancel;
    DatasetRefresh1: TDataSetRefresh;
    Panel1: TPanel;
    SpeedButton5: TSpeedButton;
    DBNavigator1: TDBNavigator;
    Imagestock: TImage;
    DBGrid1: TDBGrid;
    DateTimePicker2: TDateTimePicker;
    Button3: TButton;
    Button2: TButton;
    EditFILTER: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    DateTimePicker1: TDateTimePicker;
    Label1: TLabel;
    Image1: TImage;
    Image2: TImage;
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
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppDBText5: TppDBText;
    ppLabel9: TppLabel;
    ppDBText6: TppDBText;
    ppLabel10: TppLabel;
    ppDBText7: TppDBText;
    ppLabel11: TppLabel;
    ppDBText8: TppDBText;
    ppLabel12: TppLabel;
    ppDBText9: TppDBText;
    ppLabel13: TppLabel;
    ppDBText10: TppDBText;
    procedure FormActivate(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);

    procedure Image1Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure DBGrid1EditButtonClick(Sender: TObject);
    procedure EditFILTERChange(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);


  private { Déclarations privées }

  public
    { Déclarations publiques }
  end;

var
  Fstock: TFstock;

implementation

{$R *.dfm}

uses Udata, Ulistecmd, Ulistefact, Ulisteprod, Ulistfour;



procedure TFstock.Button2Click(Sender: TObject);
begin
    // Close the query if it's open
  if datamodule1.ADOQuerystock.Active then
    datamodule1.ADOQuerystock.Close;

  // Clear the previous SQL statement
  datamodule1.ADOQuerystock.SQL.Clear;

  // Construct a SQL query to retrieve all records without filtering
  datamodule1.ADOQuerystock.SQL.Text := 'SELECT * FROM stock';

  // Open the query to retrieve all records
  datamodule1.ADOQuerystock.Open;
end;

procedure TFstock.Button3Click(Sender: TObject);
begin
   ppreport1.Print;
end;



procedure TFstock.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  CaseColor: string;
begin
  if (DataCol = DataModule1.ADOQUERYSTOCK.FieldByName('CaseColor').Index) and not (gdSelected in State) then
  begin
    CaseColor := DataModule1.ADOQUERYSTOCK.FieldByName('CaseColor').AsString;

    if CaseColor = 'expired' then
      DBGrid1.Canvas.Font.Color := clRed
    else if CaseColor = 'nearing' then
      DBGrid1.Canvas.Font.Color := clYellow
    else
      DBGrid1.Canvas.Font.Color := clLime;  // Default text color

    // Draw the text with the desired color
    DBGrid1.Canvas.TextRect(Rect, Rect.Left + 2, Rect.Top + 2, DataModule1.ADOQUERYSTOCK.FieldByName('CaseColor').AsString);
  end;
end;

procedure TFstock.DBGrid1EditButtonClick(Sender: TObject);
begin

  if( DBGrid1.SelectedIndex = 1)  then
  begin
     if (datamodule1.ADOQuerystock.State = dsEDIT) OR (datamodule1.ADOQuerySTOCK.State = dsinsert) then
    begin
      // Create the FListeProduit form
      FListecmd := TFListecmd.Create(Self);
      try

        // Show the form as a modal dialog
        if FListecmd.ShowModal = mrOK then
        begin
          // Get the selected values from FListeProduit
          datamodule1.ADOQuerySTOCK.FieldByName('Num_cmd').Value := FListecmd.SelectedNumcmd;
           // Get the selected values from FListeProduit
          datamodule1.ADOQuerySTOCK.FieldByName('Num_prod').Value := FListeCMD.SelectedNumProd;
          datamodule1.ADOQuerySTOCK.FieldByName('Num_F').Value := FListeCMD.SelectedNumF;
        end;
      finally
        FListecmd.Free;
      end;
    end
    else
    begin
      ShowMessage('Please start editing the STOCK record before selecting a product.');
    end;
  end;
end;


procedure TFstock.EditFILTERChange(Sender: TObject);
begin
       var
  filterText := '%' + EditFILTER.Text + '%';
  with datamodule1 do
  begin
    // Close the query if it's open
    if ADOQuerystock.Active then
      ADOQuerystock.Close;

    // Clear the previous SQL statement
    ADOQuerystock.SQL.Clear;

    // Construct the SQL query with a WHERE clause to filter by des_prod
    ADOQuerystock.SQL.Text :=
      'SELECT * FROM stock WHERE des_prod LIKE :FilterText';

    // Set the parameter value for the filter text
    ADOQuerystock.Parameters.ParamByName('FilterText').Value := filterText;

    // Open the query to retrieve filtered data
    ADOQuerystock.Open;
  end;
end;

procedure TFstock.FormActivate(Sender: TObject);
begin
   datamodule1.ADOQuerystock.Close;
  datamodule1.ADOQuerystock.SQL.Clear;
  datamodule1.ADOQuerystock.SQL.Text := 'SELECT * FROM stock';
  // Open the query to retrieve data
  datamodule1.ADOQuerystock.Open;


end;

procedure TFstock.FormCreate(Sender: TObject);
begin
  WindowState := wsMaximized;
end;

procedure TFstock.FormResize(Sender: TObject);
begin
      Panel1.Left := (ClientWidth - Panel1.Width) div 2;
  Panel1.Top := ((ClientHeight - Panel1.Height) div 2)+80;
end;

procedure TFstock.Image1Click(Sender: TObject);

begin
      var
   startDate :=datetostr( DateTimePicker1.Date);

  with datamodule1 do
  begin
    // Close the query if it's open
    if ADOQuerystock.Active then
      ADOQuerystock.Close;

    // Clear the previous SQL statement
    ADOQuerystock.SQL.Clear;

    // Construct the SQL query with a WHERE clause to filter by date range
    ADOQuerystock.SQL.Text :=
      'SELECT * FROM stock WHERE Date_ent >= :StartDate ';

    // Set the parameter values for the start and end dates
    ADOQuerystock.Parameters.ParamByName('StartDate').Value := startDate;


    // Open the query to retrieve filtered data
    ADOQuerystock.Open;
  end;
end;

procedure TFstock.Image2Click(Sender: TObject);
begin
        var
  endDate := DateToStr(DateTimePicker2.Date);

  with datamodule1 do
  begin
    // Close the query if it's open
    if ADOQuerystock.Active then
      ADOQuerystock.Close;

    // Clear the previous SQL statement
    ADOQuerystock.SQL.Clear;

    // Construct the SQL query with a WHERE clause to filter by date range
    ADOQuerystock.SQL.Text :=
      'SELECT * FROM stock WHERE Date_ent <= :endDate ';

    // Set the parameter values for the start and end dates
    ADOQuerystock.Parameters.ParamByName('endDate').Value := endDate;


    // Open the query to retrieve filtered data
    ADOQuerystock.Open;
  end;
end;



procedure TFstock.SpeedButton5Click(Sender: TObject);
begin
  Fstock.Close;
end;

end.
