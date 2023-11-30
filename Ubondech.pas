unit Ubondech;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  Vcl.StdCtrls;

type
  TFbondech = class(TForm)
    Image1: TImage;
    Panel1: TPanel;
    Imagebcmd: TImage;
    Imagebnliv: TImage;
    Imagedech: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure ImagebcmdClick(Sender: TObject);
    procedure ImagebnlivClick(Sender: TObject);
    procedure ImagedechClick(Sender: TObject);

  private
    { D�clarations priv�es }
  public
    { D�clarations publiques }
  end;

var
  Fbondech: TFbondech;

implementation

{$R *.dfm}

uses Uboncmd, Ubonliv, UDECH, Udata;

procedure TFbondech.FormCreate(Sender: TObject);
begin
  WindowState := wsMaximized;
end;

procedure TFbondech.FormResize(Sender: TObject);
begin
  Panel1.Left := (ClientWidth - Panel1.Width) div 2;
  Panel1.Top := ((ClientHeight - Panel1.Height) div 2) - 20;
end;

procedure TFbondech.ImagebcmdClick(Sender: TObject);
begin
  Fboncmd := Tfboncmd.Create(Self);
  try
    // On affiche la deuxi�me forme de fa�on modale
    Fboncmd.ShowModal;
  finally
    // On lib�re la deuxi�me forme
    Fboncmd.Free;
  end;
end;

procedure TFbondech.ImagebnlivClick(Sender: TObject);
begin
  Fbonliv := Tfbonliv.Create(Self);
  try
    // On affiche la deuxi�me forme de fa�on modale
    Fbonliv.ShowModal;
  finally
    // On lib�re la deuxi�me forme
    Fbonliv.Free;
  end;
end;

procedure TFbondech.ImagedechClick(Sender: TObject);
begin
  Fdech := Tfdech.Create(Self);
  try
    // On affiche la deuxi�me forme de fa�on modale
    Fdech.ShowModal;
  finally
    // On lib�re la deuxi�me forme
    Fdech.Free;
  end;
end;

end.
