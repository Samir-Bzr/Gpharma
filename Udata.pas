unit Udata;

interface

uses
  System.SysUtils, System.Classes, Data.DB, inifiles,Data.Win.ADODB ,dialogs,activex;

type
  TDataModule1 = class(TDataModule)
    ADOCNXPASS: TADOConnection;
    DSLOGIN: TDataSource;
    adotablestock: TADOTable;
    ADOConnectionGpharm: TADOConnection;
    Dsstock: TDataSource;
    ADOQUERYSTOCK: TADOQuery;
    adotablestockNum_code: TIntegerField;
    adotablestockDate_per: TWideStringField;
    adotablestockDate_ent: TWideStringField;
    adotablestockDate_srt: TWideStringField;
    adotablestockqte_ent: TIntegerField;
    adotablestockqte_srt: TIntegerField;
    adotablestockNum_f: TIntegerField;
    adotablestockNum_fac: TIntegerField;
    adotablestockNum_cmd: TIntegerField;
    adotablestockservice_dest: TWideStringField;
    adotablestockstck_rest: TIntegerField;
    ADOTableproduit: TADOTable;
    Dsproduit: TDataSource;
    ADOQueryproduit: TADOQuery;
    Dslisteprod: TDataSource;
    ADOTablecmd: TADOTable;
    ADOTablefour: TADOTable;
    ADOTablefact: TADOTable;
    Dscmd: TDataSource;
    Dsfournisseur: TDataSource;
    dsfact: TDataSource;
    ADOQueryfour: TADOQuery;
    ADOQuerycmd: TADOQuery;
    ADOQueryfact: TADOQuery;
    dsqueryfact: TDataSource;
    Dsquerycmd: TDataSource;
    Dsqueryfour: TDataSource;
    ADOTablefactNum_fac: TIntegerField;
    ADOTablefactdate_fac: TWideStringField;
    ADOTablefactnom_clt: TWideStringField;
    ADOTablefactadr_clt: TWideStringField;
    ADOTablefactdes_prod: TWideStringField;
    ADOTablefactqte_fact: TIntegerField;
    ADOTablefacttva: TWideStringField;
    ADOTablefactprix_u: TBCDField;
    ADOTablefactprix_ht: TBCDField;
    ADOTablefacttva_fact: TBCDField;
    ADOTablefactMTT: TBCDField;
    ADOTablefactNum_f: TIntegerField;
    dspharma: TDataSource;
    ADOTabledech: TADOTable;
    ADOTablebonliv: TADOTable;
    ADOQuerybonliv: TADOQuery;
    Dsdech: TDataSource;
    Dsbonliv: TDataSource;
    Dsqbonliv: TDataSource;
    dsqdech: TDataSource;
    ADOTabledechNum_dch: TIntegerField;
    ADOTabledechDes_prod: TWideStringField;
    ADOTabledechQte_demandé: TIntegerField;
    ADOTabledechQte_servie: TIntegerField;
    ADOTabledechNum_ph: TIntegerField;
    ADOTabledechdate_dech: TWideStringField;
    ADOQuerydech: TADOQuery;
    ADOQuerylogin: TADOQuery;
    ADOQuerycmdreport1: TADOQuery;
    Dsqcmdrep1: TDataSource;
    ADOQueryDECHREP1: TADOQuery;
    DSQ_DECH_REP: TDataSource;
    ADOQueryLIVREP1: TADOQuery;
    DSQLIVREP1: TDataSource;
    DSQPROD: TDataSource;
    ADOQueryfactrep: TADOQuery;
    dsqfactrep: TDataSource;
    ADOQuerybonlivNum_bl: TIntegerField;
    ADOQuerybonlivDate_bl: TWideStringField;
    ADOQuerybonlivnom_clt: TWideStringField;
    ADOQuerybonlivAdr_clt: TWideStringField;
    ADOQuerybonlivNum_ph: TIntegerField;
    ADOQuerybonlivNum_f: TIntegerField;
    ADOQuerybonlivnum_prod: TIntegerField;
    ADOQueryLIVREP1Num_bl: TIntegerField;
    ADOQueryLIVREP1Date_bl: TWideStringField;
    ADOQueryLIVREP1nom_clt: TWideStringField;
    ADOQueryLIVREP1Adr_clt: TWideStringField;
    ADOQueryLIVREP1Num_ph: TIntegerField;
    ADOQueryLIVREP1Num_f: TIntegerField;
    ADOQueryLIVREP1num_prod: TIntegerField;
    ADOQueryDECHREP1Num_dch: TIntegerField;
    ADOQueryDECHREP1Des_prod: TWideStringField;
    ADOQueryDECHREP1Qte_demandé: TIntegerField;
    ADOQueryDECHREP1Qte_servie: TIntegerField;
    ADOQueryDECHREP1Num_ph: TIntegerField;
    ADOQueryDECHREP1date_dech: TWideStringField;
    ADOQuerycmdNum_cmd: TIntegerField;
    ADOQuerycmddate_cmd: TWideStringField;
    ADOQuerycmdNum_f: TIntegerField;
    ADOQuerycmdnum_prod: TIntegerField;
    ADOQuerycmdDes_prod: TWideStringField;
    ADOQuerycmdU_C: TStringField;
    ADOQuerycmdstock_rest: TIntegerField;
    ADOQuerycmdQte_cmd: TIntegerField;
    ADOQuerycmdNum_ph: TIntegerField;
    ADOQueryfourNum_f: TIntegerField;
    ADOQueryfourNom_f: TWideStringField;
    ADOQueryfourprod_fourni: TWideStringField;
    ADOQueryfourtype_prod: TWideStringField;
    ADOQueryproduitNum_prod: TIntegerField;
    ADOQueryproduitnum_f: TIntegerField;
    ADOQueryproduitDes_prod: TWideStringField;
    ADOQueryproduitU_C: TWideStringField;
    ADOQueryproduitStock_res: TIntegerField;
    ADOQueryproduittype_prod: TStringField;
    ADOQuerycmdreport1Num_cmd: TIntegerField;
    ADOQuerycmdreport1date_cmd: TWideStringField;
    ADOQuerycmdreport1Num_f: TIntegerField;
    ADOQuerycmdreport1num_prod: TIntegerField;
    ADOQuerycmdreport1Des_prod: TWideStringField;
    ADOQuerycmdreport1U_C: TStringField;
    ADOQuerycmdreport1stock_rest: TIntegerField;
    ADOQuerycmdreport1Qte_cmd: TIntegerField;
    ADOQuerycmdreport1Num_ph: TIntegerField;
    ADOQueryfactNum_fac: TIntegerField;
    ADOQueryfactNum_f: TIntegerField;
    ADOQueryfactnum_prod: TIntegerField;
    ADOQueryfactdate_fac: TWideStringField;
    ADOQueryfactnom_clt: TWideStringField;
    ADOQueryfactadr_clt: TWideStringField;
    ADOQueryfactdes_prod: TWideStringField;
    ADOQueryfactqte_fact: TIntegerField;
    ADOQueryfacttva: TWideStringField;
    ADOQueryfactprix_u: TBCDField;
    ADOQueryfactprix_ht: TBCDField;
    ADOQueryfacttva_fact: TBCDField;
    ADOQueryfactrepNum_fac: TIntegerField;
    ADOQueryfactrepNum_f: TIntegerField;
    ADOQueryfactrepnum_prod: TIntegerField;
    ADOQueryfactrepdate_fac: TWideStringField;
    ADOQueryfactrepnom_clt: TWideStringField;
    ADOQueryfactrepadr_clt: TWideStringField;
    ADOQueryfactrepdes_prod: TWideStringField;
    ADOQueryfactrepqte_fact: TIntegerField;
    ADOQueryfactreptva: TWideStringField;
    ADOQueryfactrepprix_u: TBCDField;
    ADOQueryfactrepprix_ht: TBCDField;
    ADOQueryfactreptva_fact: TBCDField;
    ADOQuerydechNum_dch: TIntegerField;
    ADOQuerydechDes_prod: TWideStringField;
    ADOQuerydechQte_demandé: TIntegerField;
    ADOQuerydechQte_servie: TIntegerField;
    ADOQuerydechNum_ph: TIntegerField;
    ADOQuerydechdate_dech: TWideStringField;
    ADOQuerystockrep1: TADOQuery;
    Dsqstockrep: TDataSource;
    ADOTableproduitNum_prod: TIntegerField;
    ADOTableproduitnum_f: TIntegerField;
    ADOTableproduitDes_prod: TWideStringField;
    ADOTableproduitU_C: TWideStringField;
    ADOTableproduitStock_res: TIntegerField;
    ADOTableproduittype_prod: TStringField;
    ADOQuerydiag3: TADOQuery;
    dsdialog3: TDataSource;
    ADOQuerydiag3yearent: TIntegerField;
    ADOQuerydiag3yearsrt: TIntegerField;
    ADOQuerydiag3ent: TIntegerField;
    ADOQuerydiag3sort: TIntegerField;
    ADOQuerydiag3stock: TIntegerField;
    ADOQUERYSTOCKNum_stc: TIntegerField;
    ADOQUERYSTOCKnum_prod: TIntegerField;
    ADOQUERYSTOCKNum_f: TIntegerField;
    ADOQUERYSTOCKdes_prod: TWideStringField;
    ADOQUERYSTOCKDate_per: TWideStringField;
    ADOQUERYSTOCKDate_ent: TWideStringField;
    ADOQUERYSTOCKqte_ent: TIntegerField;
    ADOQUERYSTOCKDate_srt: TWideStringField;
    ADOQUERYSTOCKqte_srt: TIntegerField;
    ADOQUERYSTOCKstck_rest: TIntegerField;
    ADOQUERYSTOCKservice_dest: TWideStringField;
    ADOQUERYSTOCKNum_cmd: TIntegerField;
    ADOQUERYSTOCKCaseColor: TStringField;
    ADOQuerypharm: TADOQuery;
    ADOQuerypharmNum_ph: TIntegerField;
    ADOQuerypharmNom_ph: TWideStringField;
    ADOQuerypharmTel_ph: TWideStringField;
    ADOQuerypharmPoste: TWideStringField;
    ADOQuerybonlivmtt: TCurrencyField;
    ADOQueryLIVREP1mtt: TCurrencyField;
    ADOQueryfactrepmtt: TBCDField;
    ADOQueryloginUserID: TAutoIncField;
    ADOQueryloginUsername: TWideStringField;
    ADOQueryloginPasswordhash: TWideStringField;
    procedure ADOQuerycmdAfterScroll(DataSet: TDataSet);
    procedure ADOQuerybonlivAfterScroll(DataSet: TDataSet);
    procedure ADOQuerydechAfterScroll(DataSet: TDataSet);
    procedure ADOQueryfactCalcFields(DataSet: TDataSet);
    procedure ADOQueryfactAfterScroll(DataSet: TDataSet);
    procedure ADOQUERYSTOCKAfterScroll(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    



   
  private
    { Déclarations privées }
  public
    { Déclarations publiques }

  end;

var
  DataModule1: TDataModule1;
var
  ADOCNXPASS: TADOConnection;
  adoconnectionGpharm: TADOConnection;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses Uboncmd, Ustock,vcl.Graphics;
{$R *.dfm}





var
  Config: TIniFile;
  ConfigFileName: string;

procedure TDataModule1.DataModuleCreate(Sender: TObject);
begin
  // Prompt the user to choose the config file
  ConfigFileName := InputBox('Choose config file', 'Enter the full path of the config file:','');

  // Try to open the config file
  try
    Config := TIniFile.Create(ConfigFileName);
  except
    // Show an error message if the config file could not be opened
    ShowMessage('Could not open config file: ' + ConfigFileName);
    exit;
  end;

  // Read the connection string for the ADOCNXPASS connection from the INI file
  ADOCNXPASS.ConnectionString := Config.ReadString('Database_login', 'ConnectionString','');

  // Read the connection string for the ADOConnectionGpharm connection from the INI file
  ADOConnectionGpharm.ConnectionString := Config.ReadString('Database_Gpharm', 'ConnectionString','');

  // Connect to the ADOCNXPASS database
  ADOCNXPASS.Connected := True;

  // Connect to the ADOConnectionGpharm database
  ADOConnectionGpharm.Connected := True;

  // ...

  // Free the TIniFile object
  Config.Free;
end;





procedure TDataModule1.ADOQuerybonlivAfterScroll(DataSet: TDataSet);
begin
            var
  CurrentRecordNumber: Integer;
begin
if not ADOQuerybonliv.IsEmpty then
begin
  CurrentRecordNumber := ADOQUERYBONLIV.FieldByName('num_BL').AsInteger;
  DataModule1.ADOQueryLIVRep1.Close;
  DataModule1.ADOQueryLIVRep1.Parameters.ParamByName('RecordNumber').Value := CurrentRecordNumber;
  DataModule1.ADOQueryLIVRep1.Open;
end;
end;
end;

procedure TDataModule1.ADOQuerycmdAfterScroll(DataSet: TDataSet);
begin
      var
  CurrentRecordNumber: Integer;
begin
if not ADOQuerycmd.IsEmpty then
begin
  CurrentRecordNumber := ADOQUERYCMD.FieldByName('num_cmd').AsInteger;
  DataModule1.ADOQueryCmdReport1.Close;
  DataModule1.ADOQueryCmdReport1.Parameters.ParamByName('RecordNumber').Value := CurrentRecordNumber;
  DataModule1.ADOQueryCmdReport1.Open;
end;
end;
end;

procedure TDataModule1.ADOQuerydechAfterScroll(DataSet: TDataSet);
begin
        var
  CurrentRecordNumber: Integer;
begin
if not ADOQuerydech.IsEmpty then
begin
  CurrentRecordNumber := ADOQUERYDECH.FieldByName('num_DCH').ASINTEGER;
  DataModule1.ADOQueryDECHRep1.Close;
  DataModule1.ADOQueryDECHRep1.Parameters.ParamByName('RecordNumber').Value := CurrentRecordNumber;
  DataModule1.ADOQueryDECHRep1.Open;
end;
end;
end;

procedure TDataModule1.ADOQueryfactAfterScroll(DataSet: TDataSet);
begin

        var
  CurrentRecordNumber: Integer;
begin
if not ADOQueryfact.IsEmpty then
begin
  CurrentRecordNumber := ADOQUERYfacT.FieldByName('num_fac').AsInteger;
  DataModule1.ADOQueryfactrep.Close;
  DataModule1.ADOQueryfactRep.Parameters.ParamByName('RecordNumber').Value := CurrentRecordNumber;
  DataModule1.ADOQueryfactRep.Open;
end;
end;
end;

procedure TDataModule1.ADOQueryfactCalcFields(DataSet: TDataSet);
begin
adoQUERYFACT.FieldByName('MTT').Value:= adoQUERYFACT.FieldByName('prix_u').Value+adoQUERYfact.FieldByName('tva_fact').Value;
end;



procedure TDataModule1.ADOQUERYSTOCKAfterScroll(DataSet: TDataSet);
begin
          var
  CurrentRecordNumber: Integer;
begin
if not ADOQuerystock.IsEmpty then
begin
  CurrentRecordNumber := ADOQUERYstock.FieldByName('num_stc').AsInteger;
  ADOQuerystockrep1.Close;
  ADOQuerystockRep1.Parameters.ParamByName('RecordNumber').Value := CurrentRecordNumber;
  ADOQuerystockRep1.Open;
end;
end;
end;


end.
