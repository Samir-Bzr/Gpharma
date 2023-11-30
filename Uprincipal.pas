unit Uprincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, DB,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.Menus, Vcl.StdCtrls;

type
  TFprincipal = class(TForm)
    MainMenu1: TMainMenu;
    FICHIER1: TMenuItem;
    EDITION1: TMenuItem;
    INSERER1: TMenuItem;
    Image1: TImage;
    Ajouterunbondecommande1: TMenuItem;
    Imageexport: TImage;
    Imagestock: TImage;
    Imageproduit: TImage;
    Imagequit: TImage;
    Listedesproduits1: TMenuItem;
    Listedesfourniseurs1: TMenuItem;
    listedesfactures1: TMenuItem;
    Imagebons: TImage;
    Listedesproduits2: TMenuItem;
    InventaireduStock1: TMenuItem;
    Bondecommande1: TMenuItem;
    Bondelivraison1: TMenuItem;
    Decharge1: TMenuItem;
    Listesdespharmacien1: TMenuItem;
    Listedesfournisseur1: TMenuItem;
    facture1: TMenuItem;
    Label2: TLabel;
    Stock: TLabel;
    Produits: TLabel;
    Quitter: TLabel;
    Bons: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Securité: TLabel;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Ajouterunbon1: TMenuItem;
    Ajouterunefacture1: TMenuItem;
    Diagramdes1: TMenuItem;
    Diagramedestock1: TMenuItem;
    Diagramedesentre1: TMenuItem;
    Diagramedessorties1: TMenuItem;
    diagrameStockbesoins1: TMenuItem;
    procedure ImageimportClick(Sender: TObject);
    procedure ImageexportClick(Sender: TObject);
    procedure ImagestockClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ImageproduitClick(Sender: TObject);
    procedure ImagequitClick(Sender: TObject);
    procedure Listedesproduits1Click(Sender: TObject);
    procedure Listedesfourniseurs1Click(Sender: TObject);
    procedure listedesfactures1Click(Sender: TObject);
    procedure ImagebonsClick(Sender: TObject);
    procedure Listedesproduits2Click(Sender: TObject);
    procedure Bondecommande1Click(Sender: TObject);
    procedure Bondelivraison1Click(Sender: TObject);
    procedure Decharge1Click(Sender: TObject);
    procedure facture1Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure InventaireduStock1Click(Sender: TObject);
    procedure Listesdespharmacien1Click(Sender: TObject);
    procedure Listedesfournisseur1Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure Ajouterunefacture1Click(Sender: TObject);
    procedure Ajouterunbon1Click(Sender: TObject);
    procedure Diagramedestock1Click(Sender: TObject);
    procedure Diagramedesentre1Click(Sender: TObject);
    procedure Diagramedessorties1Click(Sender: TObject);
    procedure diagrameStockbesoins1Click(Sender: TObject);
    procedure Ajouterunbondecommande1Click(Sender: TObject);

  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Fprincipal: TFprincipal;

implementation

{$R *.dfm}

uses Uimport, Uexport, Ustock, Uproduit, Ulisteprod, Ulistfour, Ulistefact,
  Ubondech, Udata, Uboncmd, Ubonliv, UDECH, Ustats, Ulistepharm, Upharmacien,
  Usecurité, Udiagstock1, Udiagstock2, Udiagstock3, Udiagstock4;



procedure TFprincipal.Ajouterunbon1Click(Sender: TObject);
begin
        Fbondech := Tfbondech.Create(Self);
  try
    // On affiche la deuxième forme de façon modale
    Fbondech.ShowModal;
  finally
    // On libère la deuxième forme
    Fbondech.Free;
  end;
end;

procedure TFprincipal.Ajouterunbondecommande1Click(Sender: TObject);
begin
               FlisteFOUR := TflistEFOUR.Create(Self);
  try
    // On affiche la deuxième forme de façon modale
    FlisteFOUR.ShowModal;
  finally
    // On libère la deuxième forme
    FlisteFOUR.Free;
  end;
end;

procedure TFprincipal.Ajouterunefacture1Click(Sender: TObject);
begin
            Flistefact := Tflistefact.Create(Self);
  try
    // On affiche la deuxième forme de façon modale
    Flistefact.ShowModal;
  finally
    // On libère la deuxième forme
    Flistefact.Free;
  end;
end;

procedure TFprincipal.Bondecommande1Click(Sender: TObject);
begin
     Fboncmd := Tfboncmd.Create(Self);
  try
    // On affiche la deuxième forme de façon modale
    Fboncmd.ShowModal;
  finally
    // On libère la deuxième forme
    Fboncmd.Free;
  end;
end;

procedure TFprincipal.Bondelivraison1Click(Sender: TObject);
begin
     Fbonliv := Tfbonliv.Create(Self);
  try
    // On affiche la deuxième forme de façon modale
    Fbonliv.ShowModal;
  finally
    // On libère la deuxième forme
    Fbonliv.Free;
  end;
end;

procedure TFprincipal.Decharge1Click(Sender: TObject);
begin
   Fdech := Tfdech.Create(Self);
  try
    // On affiche la deuxième forme de façon modale
    Fdech.ShowModal;
  finally
    // On libère la deuxième forme
    Fdech.Free;
  end;
end;

procedure TFprincipal.Diagramedesentre1Click(Sender: TObject);
begin
Fdiagstock3.DBChart1.Print;
end;

procedure TFprincipal.Diagramedessorties1Click(Sender: TObject);
begin
     Fdiagstock4.DBChart1.Print;
end;

procedure TFprincipal.Diagramedestock1Click(Sender: TObject);
begin
Fdiagstock1.DBChart1.Print;
end;

procedure TFprincipal.diagrameStockbesoins1Click(Sender: TObject);
begin
        Fdiagstock2.DBChart1.Print;
end;

procedure TFprincipal.facture1Click(Sender: TObject);
begin
      Flistefact := Tflistefact.Create(Self);
  try
    // On affiche la deuxième forme de façon modale
    Flistefact.ShowModal;
  finally
    // On libère la deuxième forme
    Flistefact.Free;
  end;
end;

procedure TFprincipal.FormCreate(Sender: TObject);
begin
  WindowState := wsMaximized;
end;

procedure TFprincipal.Image2Click(Sender: TObject);
begin
   Fstats := Tfstats.Create(Self);
  try
    // On affiche la deuxième forme de façon modale
    Fstats.ShowModal;
  finally
    // On libère la deuxième forme
    Fstats.Free;
  end;
end;

procedure TFprincipal.Image3Click(Sender: TObject);
begin
   begin
   Fpharma := Tfpharma.Create(Self);
  try
    // On affiche la deuxième forme de façon modale
    Fpharma.ShowModal;
  finally
    // On libère la deuxième forme
    Fpharma.Free;
  end;
end;


end;

procedure TFprincipal.Image4Click(Sender: TObject);
var
   Username, Password: string;
begin
  // Prompt the user for their username
  Username := InputBox('Login', 'Enter your username:', '');

  // Prompt the user for their password (masked)
  Password := InputBox('Login', 'Enter your password:', '');

  try

     with datamodule1 do
     begin
    // Build the SQL query to check if the user exists and the password is correct
    ADOQuerylogin.SQL.Text :=
      'SELECT * FROM users WHERE username = :Username AND passwordHASH = :Password';
    ADOQuerylogin.Parameters.ParamByName('Username').Value := Username;
    ADOQuerylogin.Parameters.ParamByName('Password').Value := Password;

    // Open the query to execute it
    ADOQuerylogin.Open;

    // Check if a record was found (user authenticated)
    if not ADOQuerylogin.IsEmpty then
    begin
      // User authenticated, allow access to the main form
       Fsecurité := Tfsecurité.Create(Self);
  try
    // On affiche la deuxième forme de façon modale
    Fsecurité.ShowModal;
  finally
    // On libère la deuxième forme
    Fsecurité.Free;
  end;// Replace 'MainForm' with the name of your main form
      Close; // Close the login form
    end
    else
    begin
      // User not found or invalid credentials
      ShowMessage('Invalid username or password.');
    end;
      end;
  finally
    datamodule1.ADOQuerylogin.Free;

  end;
  end;


procedure TFprincipal.ImagebonsClick(Sender: TObject);
begin
  Fbondech := Tfbondech.Create(Self);
  try
    // On affiche la deuxième forme de façon modale
    Fbondech.ShowModal;
  finally
    // On libère la deuxième forme
    Fbondech.Free;
  end;
end;

procedure TFprincipal.ImageexportClick(Sender: TObject);
begin
  begin
    // On crée une instance de la deuxième forme
    Fexport := Tfexport.Create(Self);
    try
      // On affiche la deuxième forme de façon modale
      Fexport.ShowModal;
    finally
      // On libère la deuxième forme
      Fexport.Free;
    end;
  end;
end;

procedure TFprincipal.ImageimportClick(Sender: TObject);
begin
  begin
    // On crée une instance de la deuxième forme
    Fimport := Tfimport.Create(Self);
    try
      // On affiche la deuxième forme de façon modale
      Fimport.ShowModal;
    finally
      // On libère la deuxième forme
      Fimport.Free;
    end;
  end;
end;

procedure TFprincipal.ImageproduitClick(Sender: TObject);
begin
  Fproduit := Tfproduit.Create(Self);
  try
    // On affiche la deuxième forme de façon modale
    Fproduit.ShowModal;
  finally
    // On libère la deuxième forme
    Fproduit.Free;
  end;
end;

procedure TFprincipal.ImagequitClick(Sender: TObject);
begin
  application.Terminate;
end;

procedure TFprincipal.ImagestockClick(Sender: TObject);
begin
  Fstock := Tfstock.Create(Self);
  try
    // On affiche la deuxième forme de façon modale
    Fstock.ShowModal;

  finally
    // On libère la deuxième forme
    Fstock.Free


  end;
end;

procedure TFprincipal.InventaireduStock1Click(Sender: TObject);
begin
       Fstock := Tfstock.Create(Self);
  try
    // On affiche la deuxième forme de façon modale
    Fstock.ShowModal;
  finally
    // On libère la deuxième forme
    Fstock.Free;
  end;

end;

procedure TFprincipal.listedesfactures1Click(Sender: TObject);
begin
  Flistefact.ShowModal;
end;

procedure TFprincipal.Listedesfourniseurs1Click(Sender: TObject);
begin
  FLISTEFOUR.ShowModal;
  flistefour.DBNavigator1.Hide;
end;

procedure TFprincipal.Listedesfournisseur1Click(Sender: TObject);
begin
Flistefour := Tflistefour.Create(Self);
flistefour.ppReport1.print;
end;

procedure TFprincipal.Listedesproduits1Click(Sender: TObject);
begin
  Flisteproduit.ShowModal;
end;

procedure TFprincipal.Listedesproduits2Click(Sender: TObject);
begin
Fproduit := Tfproduit.Create(Self);
fproduit.Button1.Click;
end;

procedure TFprincipal.Listesdespharmacien1Click(Sender: TObject);
begin
Flistepharm := Tflistepharm.Create(Self);
flistepharm.ppReport1.print;
end;

end.
