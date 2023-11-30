unit UExport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, DBClient, Datasnap.Provider, Data.Win.ADODB, ComObj,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls;

type
  TFExport = class(TForm)

    ClientDataSetexport: TClientDataSet;
    Button1: TButton;
    DataSetProviderexport: TDataSetProvider;
    SaveDialog1: TSaveDialog;
    Image1: TImage;
    ComboBox1: TComboBox;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
   private

  public

  end;


var
  FExport: TFExport;

implementation

{$R *.dfm}

uses Udata;

procedure ExportDataToExcel(ClientDataSet: TClientDataSet;
  const FileName: string);
var
  ExcelApp: Variant;
  i, j: Integer;
begin
  ExcelApp := CreateOleObject('Excel.Application');
  ExcelApp.Workbooks.Add;
  ExcelApp.Visible := False;

  // Populate Excel cells with field names
  for i := 0 to ClientDataSet.FieldCount - 1 do
  begin
    ExcelApp.Cells[1, i + 1].Value := ClientDataSet.Fields[i].FieldName;
  end;

  // Populate Excel cells with data from ClientDataSet
  ClientDataSet.First;
  for i := 1 to ClientDataSet.RecordCount do
  begin
    for j := 0 to ClientDataSet.FieldCount - 1 do
    begin
      ExcelApp.Cells[i + 1, j + 1].Value := ClientDataSet.Fields[j].AsString;
    end;
    ClientDataSet.Next;
  end;

  ExcelApp.ActiveWorkbook.SaveAs(FileName);

  ExcelApp.Quit;
  ExcelApp := Unassigned;

  ShowMessage('Data exported to Excel file.');
end;

procedure TFExport.Button1Click(Sender: TObject);
var
  ExportFileName: string;
begin
  try
    if not ClientDataSetexport.Active then
      ClientDataSetexport.Active := True;

    if not ClientDataSetexport.IsEmpty then
    begin
      if SaveDialog1.Execute then
      begin
        ExportFileName := SaveDialog1.FileName;
        try
          ExportDataToExcel(ClientDataSetexport, ExportFileName);
        except
          on E: Exception do
            ShowMessage('Error exporting data: ' + E.Message);
        end;
      end;
    end
    else
      ShowMessage('No data to export.');
  except
    on E: Exception do
      ShowMessage('Error: ' + E.Message);
  end;
end;

procedure TFExport.ComboBox1Change(Sender: TObject);
begin
 case combobox1.ItemIndex of
 1 : fexport.DataSetProviderexport.DataSet:= datamodule1.ADOQuerySTOCK;
 2:  fexport.DataSetProviderexport.DataSet:= datamodule1.ADOQuerypharm;
 3:  fexport.DataSetProviderexport.DataSet:= datamodule1.ADOQuerycmd;
 4:  fexport.DataSetProviderexport.DataSet:= datamodule1.ADOQuerybonliv;
 5:  fexport.DataSetProviderexport.DataSet:= datamodule1.ADOQuerydech;
 6 :  fexport.DataSetProviderexport.DataSet:= datamodule1.ADOQueryfact;
 7 :  fexport.DataSetProviderexport.DataSet:= datamodule1.ADOQueryproduit;
 8:   fexport.DataSetProviderexport.DataSet:= datamodule1.ADOQueryfour;
 end;

end;

procedure TFExport.FormActivate(Sender: TObject);
begin
      datamodule1.ADOQuerystock.Close;
  datamodule1.ADOQuerystock.SQL.Clear;
  datamodule1.ADOQuerystock.SQL.Text := 'SELECT * FROM stock';
  // Open the query to retrieve data
  datamodule1.ADOQuerystock.Open;
  datamodule1.ADOTablefact.Open;
  datamodule1.ADOQueryfact.Close;
  datamodule1.ADOQueryfact.SQL.Clear;
  datamodule1.ADOQueryfact.SQL.Text := 'SELECT * FROM facture ';
  // Open the query to retrieve data
  datamodule1.ADOQueryfact.Open;
   datamodule1.ADOQuerycmd.Close;
  datamodule1.ADOQuerycmd.SQL.Clear;
  datamodule1.ADOQuerycmd.SQL.Text := 'SELECT * FROM bon_de_commande';
  // Open the query to retrieve data
  datamodule1.ADOQuerycmd.Open;
  datamodule1.ADOQueryPRODUIT.Close;
  datamodule1.ADOQueryPRODUIT.SQL.Clear;
  datamodule1.ADOQueryPRODUIT.SQL.Text := 'SELECT * FROM PRODUIT';
  // Open the query to retrieve data
  datamodule1.ADOQueryPRODUIT.Open;
    datamodule1.ADOQueryPharm.Close;
  datamodule1.ADOQueryPharm.SQL.Clear;
  datamodule1.ADOQuerypharm.SQL.Text := 'SELECT * FROM pharmacien';
  // Open the query to retrieve data
  datamodule1.ADOQueryPharm.Open;
        datamodule1.ADOQueryBONLIV.Close;
  datamodule1.ADOQueryBONLIV.SQL.Clear;
  datamodule1.ADOQueryBONLIV.SQL.Text := 'SELECT * FROM Bon_de_LIVRAISON';
  // Open the query to retrieve data
  datamodule1.ADOQueryBONLIV.Open;
  datamodule1.ADOQuerydech.Close;
  datamodule1.ADOQuerydech.SQL.Clear;
  datamodule1.ADOQuerydech.SQL.Text := 'SELECT * FROM DECHARGE';
  // Open the query to retrieve data
  datamodule1.ADOQuerydech.Open;
   datamodule1.ADOQueryFour.Close;
  datamodule1.ADOQueryFour.SQL.Clear;
  datamodule1.ADOQueryFour.SQL.Text := 'SELECT * FROM fournisseur';
  // Open the query to retrieve data
  datamodule1.ADOQueryFour.Open;
end;

procedure TFExport.FormCreate(Sender: TObject);
begin
  WindowState := wsMaximized;
end;

end.
