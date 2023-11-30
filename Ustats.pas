unit Ustats;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VclTee.TeeGDIPlus, Data.DB,
  VCLTee.TeEngine, VCLTee.Series, Vcl.ExtCtrls, VCLTee.TeeProcs, VCLTee.Chart,
  VCLTee.DBChart, Vcl.JumpList, Vcl.Imaging.pngimage, Vcl.AppAnalytics,
  Vcl.StdCtrls;

type
  TFstats = class(TForm)
    Image1: TImage;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure Label1Click(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure Label4Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Fstats: TFstats;

implementation

{$R *.dfm}

uses Udata, Udiagstock1, Udiagstock2, Udiagstock3, Udiagstock4;



procedure TFstats.Label1Click(Sender: TObject);
begin
Fdiagstock1 := Tfdiagstock1.Create(Self);
Fdiagstock1.ShowModal;
end;

procedure TFstats.Label2Click(Sender: TObject);
begin
Fdiagstock2 := Tfdiagstock2.Create(Self);
Fdiagstock2.ShowModal;
end;

procedure TFstats.Label3Click(Sender: TObject);
begin
Fdiagstock3 := Tfdiagstock3.Create(Self);
Fdiagstock3.ShowModal;
end;

procedure TFstats.Label4Click(Sender: TObject);
begin
Fdiagstock4 := Tfdiagstock4.Create(Self);
Fdiagstock4.ShowModal;
end;

end.
