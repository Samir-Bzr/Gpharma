unit Uimport;

interface

uses
  Windows, Messages, SysUtils,System.Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBGrids, DB, DBClient, DBCtrls,COMOBJ,
  Vcl.Grids, Vcl.ExtCtrls, Datasnap.Provider, System.StrUtils, Vcl.ExtDlgs,
  Data.Win.ADODB, Vcl.Imaging.pngimage ,EXCEL2000, Vcl.ComCtrls;

type
  TFimport = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    Button1: TButton;
    Button2: TButton;
    Image1: TImage;
    Label1: TLabel;
    OpenDialog1: TOpenDialog;
    ClientDataSet1: TClientDataSet;
    DataSource1: TDataSource;
    Panel2: TPanel;
    Panel3: TPanel;
    ProgressBar1: TProgressBar;
    Button3: TButton;
    DBNavigator2: TDBNavigator;
    DBGrid2: TDBGrid;
    ComboBox1: TComboBox;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fimport: TFimport;

implementation

{$R *.dfm}

uses Udata;





procedure TFImport.Button2Click(Sender: TObject);
var
  ExcelApp: OleVariant;
  ExcelWorkbook: OleVariant;
  ExcelWorksheet: OleVariant;
  ExcelRange: OleVariant;
  ImportFileName: string;
  i, j: Integer;
  VarTypeValue: Integer;
begin
  if OpenDialog1.Execute then
  begin
    ImportFileName := OpenDialog1.FileName;

    try
      ExcelApp := CreateOleObject('Excel.Application');
      ExcelWorkbook := ExcelApp.Workbooks.Open(ImportFileName);
      ExcelWorksheet := ExcelWorkbook.Worksheets[1];
      ExcelRange := ExcelWorksheet.UsedRange;

      // Clear any existing data in the ClientDataSet
      ClientDataSet1.Close;
      ClientDataSet1.FieldDefs.Clear;

      // Dynamically add field definitions based on column names in Excel
      for j := 1 to ExcelRange.Columns.Count do
      begin
        // Determine the appropriate field type based on the data in the Excel column
        VarTypeValue := VarType(ExcelRange.Cells[2, j].Value);
        case VarTypeValue of
          varSmallint, varInteger, varShortInt, varByte, varWord, varLongWord:
            ClientDataSet1.FieldDefs.Add(ExcelRange.Cells[1, j].Value, ftInteger);
          varSingle, varDouble, varCurrency:
            ClientDataSet1.FieldDefs.Add(ExcelRange.Cells[1, j].Value, ftFloat);
          varDate:
            ClientDataSet1.FieldDefs.Add(ExcelRange.Cells[1, j].Value, ftDateTime);
          else
            ClientDataSet1.FieldDefs.Add(ExcelRange.Cells[1, j].Value, ftWideString);
        end;
      end;

      ClientDataSet1.CreateDataSet;
      ClientDataSet1.Open;

      // Populate ClientDataSet with data
      for i := 2 to ExcelRange.Rows.Count do
      begin
        ClientDataSet1.Append;
        for j := 1 to ExcelRange.Columns.Count do
        begin
          if not VarIsNull(ExcelRange.Cells[i, j].Value) then
            ClientDataSet1.FieldByName(ExcelRange.Cells[1, j].Value).Value :=
              ExcelRange.Cells[i, j].Value;
        end;
        ClientDataSet1.Post;
      end;

      ShowMessage('Data imported from Excel file.');
    finally
      ExcelApp.Quit;
      ExcelApp := Unassigned;
    end;
  end;
end;
    procedure InsertRecord(SourceDataset: TDataSet; TargetQuery: TADOQuery);
var
  Field: TField;
begin
  TargetQuery.Insert; // Start inserting a new record
  for Field in SourceDataset.Fields do
  begin
    if TargetQuery.FindField(Field.FieldName) <> nil then
      TargetQuery.FieldByName(Field.FieldName).Value := Field.Value;
  end;
  TargetQuery.Post; // Post the new record
end;


function ArePrimaryKeyFieldsAvailableInDataset(
  PrimaryKeyFields: TStringList; Dataset: TClientDataSet): Boolean;
var
  FieldName: string;
  Field: TField;
begin
  Result := True;
  for FieldName in PrimaryKeyFields do
  begin
    Field := Dataset.FindField(FieldName);
    if Field = nil then
    begin
      Result := False;
      Break;
    end;
  end;
end;
procedure TFimport.Button3Click(Sender: TObject);
var
 SelectedQuery: TADOQuery;
  PrimaryKeyFields: TStringList;
  MatchFound: Boolean;
  SQLWhereClause: string;
  field : tfield;
   FieldIndex: Integer;
begin
  // Get the selected query manually from the ComboBox
  case ComboBox1.ItemIndex of
    1: BEGIN
        SelectedQuery := datamodule1.ADOQuerystock;
        selectedquery.Name := 'stock';
      END;
    2: begin
       SelectedQuery := datamodule1.ADOQuerypharm;
       selectedquery.Name := 'pharmacien';
    end;
    3: begin
    SelectedQuery := datamodule1.ADOQuerycmd;
     selectedquery.Name := 'bon_de_commande';
    end;
    4:begin
    SelectedQuery := datamodule1.ADOQuerybonliv;
      selectedquery.Name := 'Bon_de_livraison';
    end;
    5: begin
        SelectedQuery := datamodule1.ADOQuerydech;
        selectedquery.Name := 'decharge';
       end;
    6: begin
        SelectedQuery := datamodule1.ADOQueryfact;
         selectedquery.Name := 'facture';
         end;
    7: begin
        SelectedQuery := datamodule1.ADOQueryproduit;
         selectedquery.Name := 'produit';
        end;
    8:  begin
         SelectedQuery := datamodule1.ADOQueryfour;
         selectedquery.Name := 'fournisseur';
         end
  else
    SelectedQuery := nil;
  end;

  if SelectedQuery = nil then
  begin
    ShowMessage('Selected ADOQuery not found.');
    Exit;
  end;
  // Create a TStringList to store the primary key field names
  PrimaryKeyFields := TStringList.Create;
  try
    // Populate PrimaryKeyFields with the names of the primary key fields in the selected query
    for Field in SelectedQuery.Fields do
    begin
      if pfInKey in Field.ProviderFlags then
        PrimaryKeyFields.Add(Field.FieldName);
    end;

    // Check if any primary key fields were detected
    if PrimaryKeyFields.Count = 0 then
    begin
      ShowMessage('No primary key fields detected in the selected query.');
      Exit;
    end;

    // Iterate through the records in the dataset
    ClientDataSet1.First;
    while not ClientDataSet1.Eof do
    begin
      // Check if a record with matching primary key values exists in the query
      MatchFound := False;

      // Build a WHERE clause dynamically based on primary key fields
      SQLWhereClause := '';
      for FieldIndex := 0 to PrimaryKeyFields.Count - 1 do // Use an index
      begin
        if SQLWhereClause <> '' then
          SQLWhereClause := SQLWhereClause + ' AND ';
        SQLWhereClause := SQLWhereClause + PrimaryKeyFields[FieldIndex] + ' = :' + PrimaryKeyFields[FieldIndex];
      end;

      // Set the WHERE clause in the query
      SelectedQuery.Close;
      SelectedQuery.SQL.Clear;
      SelectedQuery.SQL.Add('SELECT * FROM ' + SelectedQuery.Name + ' WHERE ' + SQLWhereClause);

      // Set parameter values based on the current dataset record
      for FieldIndex := 0 to PrimaryKeyFields.Count - 1 do // Use an index
      begin
        SelectedQuery.Parameters.ParamByName(PrimaryKeyFields[FieldIndex]).Value :=
          ClientDataSet1.FieldByName(PrimaryKeyFields[FieldIndex]).Value;
      end;

      // Open the query to locate the record
      SelectedQuery.Open;

      // Check if a match was found in the query
      if not SelectedQuery.IsEmpty then
        MatchFound := True;

      // Handle MatchFound as needed

      ClientDataSet1.Next;
    end;
  finally
    PrimaryKeyFields.Free;
  end;
end;











procedure TFimport.ComboBox1Change(Sender: TObject);
begin
     case combobox1.ItemIndex of
 1 :begin
        fimport.DBGrid2.DataSource:= datamodule1.Dsstock;
        dbnavigator2.DataSource:=datamodule1.Dsstock;
        datamodule1.ADOQuerystock.Close;
        datamodule1.ADOQuerystock.SQL.Clear;
        datamodule1.ADOQuerystock.SQL.Text := 'SELECT * FROM stock';
         // Open the query to retrieve data
        datamodule1.ADOQuerystock.Open;

     end;
 2:  begin
        fimport.DBGrid2.DataSource:= datamodule1.dspharma;
        dbnavigator2.DataSource:=datamodule1.Dspharma;
             datamodule1.ADOQueryPharm.Close;
  datamodule1.ADOQueryPharm.SQL.Clear;
  datamodule1.ADOQuerypharm.SQL.Text := 'SELECT * FROM pharmacien';
  // Open the query to retrieve data
  datamodule1.ADOQueryPharm.Open;

     end;
 3:
     begin
        fimport.DBGrid2.DataSource:= datamodule1.Dsquerycmd;
        dbnavigator2.DataSource:=datamodule1.Dsquerycmd;
        datamodule1.ADOQuerycmd.Close;
  datamodule1.ADOQuerycmd.SQL.Clear;
  datamodule1.ADOQuerycmd.SQL.Text := 'SELECT * FROM bon_de_commande';
  // Open the query to retrieve data
  datamodule1.ADOQuerycmd.Open;
     end;
 4:  begin
        fimport.DBGrid2.DataSource:= datamodule1.Dsqbonliv;
        dbnavigator2.DataSource:=datamodule1.Dsqbonliv;
        datamodule1.ADOQueryBONLIV.Close;
      datamodule1.ADOQueryBONLIV.SQL.Clear;
      datamodule1.ADOQueryBONLIV.SQL.Text := 'SELECT * FROM Bon_de_LIVRAISON';
     // Open the query to retrieve data
     datamodule1.ADOQueryBONLIV.Open;

     end;
 5:  begin
        fimport.DBGrid2.DataSource:= datamodule1.Dsqdech;
        dbnavigator2.DataSource:=datamodule1.Dsqdech;
      datamodule1.ADOQuerydech.Close;
      datamodule1.ADOQuerydech.SQL.Clear;
      datamodule1.ADOQuerydech.SQL.Text := 'SELECT * FROM DECHARGE';
     // Open the query to retrieve data
      datamodule1.ADOQuerydech.Open;
     end;
 6 :  begin
        fimport.DBGrid2.DataSource:= datamodule1.Dsqueryfact;
        dbnavigator2.DataSource:=datamodule1.Dsqueryfact;
        datamodule1.ADOQueryfact.SQL.Clear;
      datamodule1.ADOQueryfact.SQL.Text := 'SELECT * FROM facture ';
     // Open the query to retrieve data
     datamodule1.ADOQueryfact.Open;
     end;
 7 : begin
        fimport.DBGrid2.DataSource:= datamodule1.DSQPROD;
        dbnavigator2.DataSource:=datamodule1.Dsqprod;
         datamodule1.ADOQueryPRODUIT.Close;
        datamodule1.ADOQueryPRODUIT.SQL.Clear;
        datamodule1.ADOQueryPRODUIT.SQL.Text := 'SELECT * FROM PRODUIT';
        // Open the query to retrieve data
        datamodule1.ADOQueryPRODUIT.Open;

     end;
 8:  begin
        fimport.DBGrid2.DataSource:= datamodule1.Dsqueryfour;
        dbnavigator2.DataSource:=datamodule1.Dsqueryfour;
        datamodule1.ADOQueryFour.Close;
        datamodule1.ADOQueryFour.SQL.Clear;
        datamodule1.ADOQueryFour.SQL.Text := 'SELECT * FROM fournisseur';
        // Open the query to retrieve data
        datamodule1.ADOQueryFour.Open;
     end;
 end;
end;

procedure TFimport.FormCreate(Sender: TObject);
begin
  WindowState := wsMaximized;
end;

procedure TFimport.FormResize(Sender: TObject);
begin
  Panel1.Left := 0;
  Panel1.Top := (ClientHeight - Panel1.Height) div 2;
   Panel2.Left := ( panel1.LEFT+PANEL1.Width+40 );
  Panel2.Top := (Clientheight - Panel2.Height) div 2;
   Panel3.Left := ( PANEL2.LEFT+PANEL2.Width+40);
  Panel3.Top := (ClientHeight - Panel3.Height) div 2;
end;

procedure TFimport.Button1Click(Sender: TObject);
begin
  Close;
end;

end.



