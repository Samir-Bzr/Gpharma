unit Ulisteprod;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids, adodb,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, Vcl.StdCtrls;

type
  TFlisteproduit = class(TForm)
    Imagelisteprod: TImage;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    OK: TButton;
    procedure FormResize(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure OKClick(Sender: TObject);

  private
    { Déclarations privées }
    FSelectedNumProd: Integer;
    FSelectedNumF: Integer;
   FSelectedProductNum: Integer;
  public
    { Déclarations publiques }
     property SelectedNumProd: Integer read FSelectedNumProd;
    property SelectedNumF: Integer read FSelectedNumF;
     property Selectedproductnum: Integer read FSelectedProductNum;
  end;

var
  Flisteproduit: TFlisteproduit;

implementation

{$R *.dfm}

uses Udata;

procedure TFlisteproduit.DBGrid1DblClick(Sender: TObject);
begin
    if not datamodule1.ADOQuerycmd.IsEmpty then
  begin
    // Capture the selected data
  FSelectedProductNum:= datamodule1.ADOQuerycmd.FieldByName('Num_cmd').AsInteger;


    // Close the form when OK button is clicked
    ModalResult := mrOK;
  end


end;

procedure TFlisteproduit.FormActivate(Sender: TObject);
begin
  datamodule1.ADOQueryProduit.Close;
  datamodule1.ADOQueryProduit.SQL.Clear;
  datamodule1.ADOQueryProduit.SQL.Text := 'SELECT * FROM produit';
  // Open the query to retrieve data
  datamodule1.ADOQueryProduit.Open;
end;

procedure TFlisteproduit.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  datamodule1.ADOQueryProduit.Close;
end;

procedure TFlisteproduit.FormResize(Sender: TObject);
begin
  Panel1.Left := (ClientWidth - Panel1.Width) div 2;
  Panel1.Top := (ClientHeight - Panel1.Height) div 2;
end;


procedure TFlisteproduit.OKClick(Sender: TObject);
begin
  if not datamodule1.ADOQueryproduit.IsEmpty then
  BEGIN
    FSelectedNumProd := datamodule1.ADOQueryproduit.FieldByName('Num_prod').AsInteger;
    FSelectedNumF := datamodule1.ADOQueryproduit.FieldByName('Num_F').AsInteger;
  ModalResult := mrOk; // Close the form and return 'mrOk' result
end;
end;

END.
