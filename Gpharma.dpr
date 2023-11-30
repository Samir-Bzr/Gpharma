program Gpharma;

uses
  Vcl.Forms,
  Ulogib in 'Ulogib.pas' {Flogin},
  Uprincipal in 'Uprincipal.pas' {Fprincipal},
  Udata in 'Udata.pas' {DataModule1: TDataModule},
  Uexport in 'Uexport.pas' {Fexport},
  Ustock in 'Ustock.pas' {Fstock},
  Uproduit in 'Uproduit.pas' {Fproduit},
  Ulisteprod in 'Ulisteprod.pas' {Flisteproduit},
  Ulistecmd in 'Ulistecmd.pas' {Flistecmd},
  Ulistefact in 'Ulistefact.pas' {Flistefact},
  Ulistfour in 'Ulistfour.pas' {Flistefour},
  Ubondech in 'Ubondech.pas' {Fbondech},
  Uboncmd in 'Uboncmd.pas' {Fboncmd},
  Ubonliv in 'Ubonliv.pas' {Fbonliv},
  Ulistepharm in 'Ulistepharm.pas' {Flistepharm},
  UDECH in 'UDECH.pas' {Fdech},
  Ustats in 'Ustats.pas' {Fstats},
  Udiagstock1 in 'Udiagstock1.pas' {Fdiagstock1},
  Udiagstock2 in 'Udiagstock2.pas' {Fdiagstock2},
  Udiagstock3 in 'Udiagstock3.pas' {Fdiagstock3},
  Udiagstock4 in 'Udiagstock4.pas' {Fdiagstock4},
  UQueryselectorcombobox in '..\..\Documents\Embarcadero\Studio\code_templates\UQueryselectorcombobox.pas',
  Upharmacien in 'Upharmacien.pas' {Fpharma},
  Usecurité in 'Usecurité.pas' {Fsecurité},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Windows11 Dark');
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TFlogin, Flogin);
  Application.CreateForm(TFprincipal, Fprincipal);
  Application.CreateForm(TFexport, Fexport);
  Application.CreateForm(TFstock, Fstock);
  Application.CreateForm(TFproduit, Fproduit);
  Application.CreateForm(TFlisteproduit, Flisteproduit);
  Application.CreateForm(TFlistecmd, Flistecmd);
  Application.CreateForm(TFlistefact, Flistefact);
  Application.CreateForm(TFlistefour, Flistefour);
  Application.CreateForm(TFbondech, Fbondech);
  Application.CreateForm(TFboncmd, Fboncmd);
  Application.CreateForm(TFbonliv, Fbonliv);
  Application.CreateForm(TFlistepharm, Flistepharm);
  Application.CreateForm(TFdech, Fdech);
  Application.CreateForm(TFstats, Fstats);
  Application.CreateForm(TFdiagstock1, Fdiagstock1);
  Application.CreateForm(TFdiagstock2, Fdiagstock2);
  Application.CreateForm(TFdiagstock3, Fdiagstock3);
  Application.CreateForm(TFdiagstock4, Fdiagstock4);
  Application.CreateForm(TFpharma, Fpharma);
  Application.CreateForm(TFsecurité, Fsecurité);
  Application.Run;

end.
