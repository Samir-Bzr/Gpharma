unit Ulistecmd;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Imaging.pngimage;

type
  TFlistecmd = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Button1: TButton;
    Image1: TImage;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    FSelectedNumcmd: Integer;
    FSelectedNumProd: Integer;
    FSelectedNumF: Integer;
  public
    { Déclarations publiques }
    property SelectedNumcmd: Integer read FSelectedNumcmd;
    property SelectedNumProd: Integer read FSelectedNumProd;
    property SelectedNumF: Integer read FSelectedNumF;
  end;

var
  Flistecmd: TFlistecmd;

implementation

{$R *.dfm}

uses Udata;

procedure TFlistecmd.Button1Click(Sender: TObject);
begin
  if not datamodule1.ADOQuerycmd.IsEmpty then
  BEGIN
    FSelectedNumcmd := datamodule1.ADOQuerycmd.FieldByName('num_cmd').AsInteger;
    FSelectedNumProd := datamodule1.ADOQueryCMD.FieldByName('Num_prod').AsInteger;
    FSelectedNumF := datamodule1.ADOQueryCMD.FieldByName('Num_F').AsInteger;
  ModalResult := mrOk; // Close the form and return 'mrOk' result
end;
end;

procedure TFlistecmd.DBGrid1DblClick(Sender: TObject);
begin
  if not datamodule1.ADOQuerycmd.IsEmpty then
    FSelectedNumcmd := datamodule1.ADOQuerycmd.FieldByName('num_cmd').AsInteger;
    FSelectedNumProd := datamodule1.ADOQueryProduit.FieldByName('Num_prod').AsInteger;
    FSelectedNumF := datamodule1.ADOQueryProduit.FieldByName('Num_F').AsInteger;
  ModalResult := mrOk; // Close the form and return 'mrOk' result
end;

procedure TFlistecmd.FormActivate(Sender: TObject);
begin
  datamodule1.ADOQuerycmd.Close;
  datamodule1.ADOQuerycmd.SQL.Clear;
  datamodule1.ADOQuerycmd.SQL.Text := 'SELECT * FROM bon_de_commande';
  // Open the query to retrieve data
  datamodule1.ADOQuerycmd.Open;
end;

procedure TFlistecmd.FormResize(Sender: TObject);
begin
  Panel1.Left := (ClientWidth - Panel1.Width) div 2;
  Panel1.Top := (ClientHeight - Panel1.Height) div 2;
end;

end.
