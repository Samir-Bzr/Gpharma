�
 TDATAMODULE1 0P>  TPF0TDataModule1DataModule1OnCreateDataModuleCreateHeightWidth TADOConnection
ADOCNXPASSConnectionString6  Provider=SQLOLEDB.1;Password=1234;Persist Security Info=True;User ID=ADMIN;Initial Catalog=login_db;Data Source=DESKTOP-6U8Q84P\SQLEXPRESS;Use Procedure for Prepare=1;Auto Translate=True;Packet Size=4096;Workstation ID=DESKTOP-6U8Q84P;Use Encryption for Data=False;Tag with column collation when possible=FalseLoginPromptProvider
SQLOLEDB.1Left@Top  TDataSourceDSLOGINDataSetADOQueryloginLeftTop  	TADOTableadotablestock
ConnectionADOConnectionGpharm
CursorTypectStatic	TableNamestockLeft Top` TIntegerFieldadotablestockNum_code	FieldNameNum_code  TWideStringFieldadotablestockDate_per	FieldNameDate_perSize
  TWideStringFieldadotablestockDate_ent	FieldNameDate_entSize
  TWideStringFieldadotablestockDate_srt	FieldNameDate_srtSize
  TIntegerFieldadotablestockqte_ent	FieldNameqte_ent  TIntegerFieldadotablestockqte_srt	FieldNameqte_srt  TIntegerFieldadotablestockNum_f	FieldNameNum_f  TIntegerFieldadotablestockNum_fac	FieldNameNum_fac  TIntegerFieldadotablestockNum_cmd	FieldNameNum_cmd  TWideStringFieldadotablestockservice_dest	FieldNameservice_destSize  TIntegerFieldadotablestockstck_rest	FieldName	stck_rest   TADOConnectionADOConnectionGpharmConnectionString�Provider=SQLOLEDB.1;Password=1234;Persist Security Info=True;User ID=ADMIN;Initial Catalog=Gpharm;Data Source=DESKTOP-6U8Q84P\SQLEXPRESSLoginPromptProvider
SQLOLEDB.1Left� Toph  TDataSourceDsstockDataSetADOQUERYSTOCKLeft�Top�   	TADOQueryADOQUERYSTOCK
ConnectionADOConnectionGpharm
CursorTypectStaticAfterScrollADOQUERYSTOCKAfterScroll
Parameters SQL.StringsSELECT * FROM STOCK Left�Top�  TIntegerFieldADOQUERYSTOCKNum_stc	FieldNameNum_stcProviderFlags
pfInUpdate	pfInWherepfInKey   TIntegerFieldADOQUERYSTOCKnum_prod	FieldNamenum_prodProviderFlags
pfInUpdate	pfInWherepfInKey   TIntegerFieldADOQUERYSTOCKNum_f	FieldNameNum_fProviderFlags
pfInUpdate	pfInWherepfInKey   TWideStringFieldADOQUERYSTOCKdes_prod	FieldNamedes_prodSize2  TWideStringFieldADOQUERYSTOCKDate_per	FieldNameDate_perSize
  TWideStringFieldADOQUERYSTOCKDate_ent	FieldNameDate_entSize
  TIntegerFieldADOQUERYSTOCKqte_ent	FieldNameqte_ent  TWideStringFieldADOQUERYSTOCKDate_srt	FieldNameDate_srtSize
  TIntegerFieldADOQUERYSTOCKqte_srt	FieldNameqte_srt  TIntegerFieldADOQUERYSTOCKstck_rest	FieldName	stck_rest  TWideStringFieldADOQUERYSTOCKservice_dest	FieldNameservice_destSize  TIntegerFieldADOQUERYSTOCKNum_cmd	FieldNameNum_cmd  TStringFieldADOQUERYSTOCKCaseColor	FieldName	CaseColorReadOnly	Size   	TADOTableADOTableproduit
ConnectionADOConnectionGpharm
CursorTypectStatic	TableNameproduitLeftTopX TIntegerFieldADOTableproduitNum_prod	FieldNameNum_prod  TIntegerFieldADOTableproduitnum_f	FieldNamenum_f  TWideStringFieldADOTableproduitDes_prod	FieldNameDes_prodSize(  TWideStringFieldADOTableproduitU_C	FieldNameU_CSize  TIntegerFieldADOTableproduitStock_res	FieldName	Stock_res  TStringFieldADOTableproduittype_prod	FieldName	type_prod   TDataSource	DsproduitDataSetADOTableproduitLeftPToph  	TADOQueryADOQueryproduit
ConnectionADOConnectionGpharm
CursorTypectStatic
Parameters SQL.Stringsselect * from produit LeftTop�  TIntegerFieldADOQueryproduitNum_prod	FieldNameNum_prodProviderFlags
pfInUpdate	pfInWherepfInKey   TIntegerFieldADOQueryproduitnum_f	FieldNamenum_fProviderFlags
pfInUpdate	pfInWherepfInKey   TWideStringFieldADOQueryproduitDes_prod	FieldNameDes_prodSize(  TWideStringFieldADOQueryproduitU_C	FieldNameU_CSize  TIntegerFieldADOQueryproduitStock_res	FieldName	Stock_res  TStringFieldADOQueryproduittype_prod	FieldName	type_prod   TDataSourceDslisteprodDataSetADOQueryproduitLeft�Top�   	TADOTableADOTablecmd
ConnectionADOConnectionGpharm
CursorTypectStatic	TableNamebon_de_commandeLeft@Top�   	TADOTableADOTablefour
ConnectionADOConnectionGpharm	TableNamefournisseurLeft�Top�   	TADOTableADOTablefact
ConnectionADOConnectionGpharm
CursorTypectStatic	TableNamefactureLeftXTop�  TIntegerFieldADOTablefactNum_fac	FieldNameNum_fac  TWideStringFieldADOTablefactdate_fac	FieldNamedate_facSize
  TWideStringFieldADOTablefactnom_clt	FieldNamenom_cltSize  TWideStringFieldADOTablefactadr_clt	FieldNameadr_cltSize  TWideStringFieldADOTablefactdes_prod	FieldNamedes_prodSize  TIntegerFieldADOTablefactqte_fact	FieldNameqte_fact  TWideStringFieldADOTablefacttva	FieldNametvaSize
  	TBCDFieldADOTablefactprix_u	FieldNameprix_u	Precision  	TBCDFieldADOTablefactprix_ht	FieldNameprix_ht	Precision  	TBCDFieldADOTablefacttva_fact	FieldNametva_fact	Precision  	TBCDFieldADOTablefactMTT	FieldKindfkCalculated	FieldNameMTT	Precision
Calculated	  TIntegerFieldADOTablefactNum_f	FieldNameNum_f   TDataSourceDscmdDataSetADOTablecmdLeft8TopH  TDataSourceDsfournisseurDataSetADOTablefourLeft�TopP  TDataSourcedsfactDataSetADOTablefactLeft�Top�   	TADOQueryADOQueryfour
ConnectionADOConnectionGpharm
CursorTypectStatic
Parameters SQL.Stringsselect * from fournisseur Left�Top  TIntegerFieldADOQueryfourNum_f	FieldNameNum_fProviderFlags
pfInUpdate	pfInWherepfInKey   TWideStringFieldADOQueryfourNom_f	FieldNameNom_fSize(  TWideStringFieldADOQueryfourprod_fourni	FieldNameprod_fourniSize(  TWideStringFieldADOQueryfourtype_prod	FieldName	type_prod   	TADOQueryADOQuerycmd
ConnectionADOConnectionGpharm
CursorTypectStaticAfterScrollADOQuerycmdAfterScroll
Parameters SQL.Stringsselect * from bon_de_commande LeftpTop( TIntegerFieldADOQuerycmdNum_cmd	FieldNameNum_cmdProviderFlags
pfInUpdate	pfInWherepfInKey   TWideStringFieldADOQuerycmddate_cmd	FieldNamedate_cmdSize
  TIntegerFieldADOQuerycmdNum_f	FieldNameNum_fProviderFlags
pfInUpdate	pfInWherepfInKey   TIntegerFieldADOQuerycmdnum_prod	FieldNamenum_prodProviderFlags
pfInUpdate	pfInWherepfInKey   TWideStringFieldADOQuerycmdDes_prod	FieldNameDes_prodSize(  TStringFieldADOQuerycmdU_C	FieldNameU_C	FixedChar	Size  TIntegerFieldADOQuerycmdstock_rest	FieldName
stock_rest  TIntegerFieldADOQuerycmdQte_cmd	FieldNameQte_cmd  TIntegerFieldADOQuerycmdNum_ph	FieldNameNum_ph   	TADOQueryADOQueryfact
ConnectionADOConnectionGpharm
CursorTypectStaticAfterScrollADOQueryfactAfterScrollOnCalcFieldsADOQueryfactCalcFields
Parameters SQL.Stringsselect * from facture Left�TopP TIntegerFieldADOQueryfactNum_fac	FieldNameNum_facProviderFlags
pfInUpdate	pfInWherepfInKey   TIntegerFieldADOQueryfactNum_f	FieldNameNum_f  TIntegerFieldADOQueryfactnum_prod	FieldNamenum_prod  TWideStringFieldADOQueryfactdate_fac	FieldNamedate_facSize
  TWideStringFieldADOQueryfactnom_clt	FieldNamenom_cltSize  TWideStringFieldADOQueryfactadr_clt	FieldNameadr_cltSize  TWideStringFieldADOQueryfactdes_prod	FieldNamedes_prodSize  TIntegerFieldADOQueryfactqte_fact	FieldNameqte_fact  TWideStringFieldADOQueryfacttva	FieldNametvaSize
  	TBCDFieldADOQueryfactprix_u	FieldNameprix_u	Precision  	TBCDFieldADOQueryfactprix_ht	FieldNameprix_ht	Precision  	TBCDFieldADOQueryfacttva_fact	FieldNametva_fact	Precision   TDataSourcedsqueryfactDataSetADOQueryfactLeft8TopX  TDataSource
DsquerycmdDataSetADOQuerycmdLeft`Top`  TDataSourceDsqueryfourDataSetADOQueryfourLeftTop   TDataSourcedspharmaDataSetADOQuerypharmLeft�Top(  	TADOTableADOTabledech
ConnectionADOConnectionGpharm
CursorTypectStatic	TableNamedechargeLeft@Top TIntegerFieldADOTabledechNum_dch	FieldNameNum_dch  TWideStringFieldADOTabledechDes_prod	FieldNameDes_prodSize(  TIntegerFieldADOTabledechQte_demandé	FieldName   Qte_demandé  TIntegerFieldADOTabledechQte_servie	FieldName
Qte_servie  TIntegerFieldADOTabledechNum_ph	FieldNameNum_ph  TWideStringFieldADOTabledechdate_dech	FieldName	date_dechSize
   	TADOTableADOTablebonliv
ConnectionADOConnectionGpharm	TableNamebon_de_livraisonLeft� Top   	TADOQueryADOQuerybonliv
ConnectionADOConnectionGpharm
CursorTypectStaticAfterScrollADOQuerybonlivAfterScroll
Parameters SQL.Stringsselect * from bon_de_livraison Left� TopX TIntegerFieldADOQuerybonlivNum_bl	FieldNameNum_blProviderFlags
pfInUpdate	pfInWherepfInKey   TWideStringFieldADOQuerybonlivDate_bl	FieldNameDate_blSize
  TWideStringFieldADOQuerybonlivnom_clt	FieldNamenom_cltSize  TWideStringFieldADOQuerybonlivAdr_clt	FieldNameAdr_cltSize  TIntegerFieldADOQuerybonlivNum_ph	FieldNameNum_ph  TIntegerFieldADOQuerybonlivNum_f	FieldNameNum_f  TIntegerFieldADOQuerybonlivnum_prod	FieldNamenum_prod  TCurrencyFieldADOQuerybonlivmtt	FieldKindfkCalculated	FieldNamemtt
Calculated	   TDataSourceDsdechDataSetADOTabledechLeftTop  TDataSourceDsbonlivDataSetADOTablebonlivLeft� Top  TDataSource	DsqbonlivDataSetADOQuerybonlivLeftTopX  TDataSourcedsqdechDataSetADOQuerydechLeftTop@  	TADOQueryADOQuerydech
ConnectionADOConnectionGpharm
CursorTypectStaticAfterScrollADOQuerydechAfterScroll
Parameters SQL.Stringsselect * from decharge Left`TopP TIntegerFieldADOQuerydechNum_dch	FieldNameNum_dchProviderFlags
pfInUpdate	pfInWherepfInKey   TWideStringFieldADOQuerydechDes_prod	FieldNameDes_prodSize(  TIntegerFieldADOQuerydechQte_demandé	FieldName   Qte_demandé  TIntegerFieldADOQuerydechQte_servie	FieldName
Qte_servie  TIntegerFieldADOQuerydechNum_ph	FieldNameNum_ph  TWideStringFieldADOQuerydechdate_dech	FieldName	date_dechSize
   	TADOQueryADOQuerylogin
Connection
ADOCNXPASS
CursorTypectStatic
ParametersNameUSERNAMEDataTypeftStringSize�Value  NamePASSWORDDataTypeftStringSize�Value   SQL.Stringsselect * from users Left� Top TAutoIncFieldADOQueryloginUserID	FieldNameUserIDReadOnly	  TWideStringFieldADOQueryloginUsername	FieldNameUsernameSize2  TWideStringFieldADOQueryloginPasswordhash	FieldNamePasswordhashSize@   	TADOQueryADOQuerycmdreport1
ConnectionADOConnectionGpharm
CursorTypectStatic
ParametersNameRecordNumber
AttributespaSigned DataType	ftInteger	Precision
SizeValue   SQL.StringsSELECT *FROM Bon_de_commandeWHERE num_cmd = :RecordNumber; Left� Top�  TIntegerFieldADOQuerycmdreport1Num_cmd	FieldNameNum_cmd  TWideStringFieldADOQuerycmdreport1date_cmd	FieldNamedate_cmdSize
  TIntegerFieldADOQuerycmdreport1Num_f	FieldNameNum_f  TIntegerFieldADOQuerycmdreport1num_prod	FieldNamenum_prod  TWideStringFieldADOQuerycmdreport1Des_prod	FieldNameDes_prodSize(  TStringFieldADOQuerycmdreport1U_C	FieldNameU_C	FixedChar	Size  TIntegerFieldADOQuerycmdreport1stock_rest	FieldName
stock_rest  TIntegerFieldADOQuerycmdreport1Qte_cmd	FieldNameQte_cmd  TIntegerFieldADOQuerycmdreport1Num_ph	FieldNameNum_ph   TDataSource
Dsqcmdrep1DataSetADOQuerycmdreport1Left� Top�   	TADOQueryADOQueryDECHREP1
ConnectionADOConnectionGpharm
CursorTypectStatic
ParametersNameRecordNumber
AttributespaSigned DataType	ftInteger	Precision
SizeValue   SQL.StringsSELECT *FROM DECHARGEWHERE num_DCH= :RecordNumber; Left� Top� TIntegerFieldADOQueryDECHREP1Num_dch	FieldNameNum_dch  TWideStringFieldADOQueryDECHREP1Des_prod	FieldNameDes_prodSize(  TIntegerFieldADOQueryDECHREP1Qte_demandé	FieldName   Qte_demandé  TIntegerFieldADOQueryDECHREP1Qte_servie	FieldName
Qte_servie  TIntegerFieldADOQueryDECHREP1Num_ph	FieldNameNum_ph  TWideStringFieldADOQueryDECHREP1date_dech	FieldName	date_dechSize
   TDataSourceDSQ_DECH_REPDataSetADOQueryDECHREP1LeftTop�  	TADOQueryADOQueryLIVREP1
ConnectionADOConnectionGpharm
CursorTypectStatic
ParametersNameRECORDNUMBER
AttributespaSigned DataType	ftInteger	Precision
SizeValue   SQL.StringsSELECT *FROM Bon_de_LIVRAISONWHERE num_BL = :RecordNumber; LeftHTop� TIntegerFieldADOQueryLIVREP1Num_bl	FieldNameNum_bl  TWideStringFieldADOQueryLIVREP1Date_bl	FieldNameDate_blSize
  TWideStringFieldADOQueryLIVREP1nom_clt	FieldNamenom_cltSize  TWideStringFieldADOQueryLIVREP1Adr_clt	FieldNameAdr_cltSize  TIntegerFieldADOQueryLIVREP1Num_ph	FieldNameNum_ph  TIntegerFieldADOQueryLIVREP1Num_f	FieldNameNum_f  TIntegerFieldADOQueryLIVREP1num_prod	FieldNamenum_prod  TCurrencyFieldADOQueryLIVREP1mtt	FieldKindfkCalculated	FieldNamemtt
Calculated	   TDataSource
DSQLIVREP1DataSetADOQueryLIVREP1LefthTop�  TDataSourceDSQPRODDataSetADOQueryproduitLeft8Top�   	TADOQueryADOQueryfactrep
ConnectionADOConnectionGpharm
CursorTypectStatic
ParametersNameRecordNumber
AttributespaSigned DataType	ftInteger	Precision
SizeValue   SQL.StringsSELECT
  num_fac,  num_f,  num_prod,  date_fac,
  nom_clt,
  adr_clt,  des_prod,  qte_fact,  tva,	  prix_u,
  prix_ht,  tva_fact,'  (prix_u * qte_fact )+ tva_fact AS mttFROM	  factureWHERE  num_fac = :RecordNumberGROUP BY
  num_fac,  num_f,  num_prod,  date_fac,
  nom_clt,
  adr_clt,  des_prod,  qte_fact,  tva,	  prix_u,
  prix_ht,
  tva_fact Left Top� TIntegerFieldADOQueryfactrepNum_fac	FieldNameNum_fac  TIntegerFieldADOQueryfactrepNum_f	FieldNameNum_f  TIntegerFieldADOQueryfactrepnum_prod	FieldNamenum_prod  TWideStringFieldADOQueryfactrepdate_fac	FieldNamedate_facSize
  TWideStringFieldADOQueryfactrepnom_clt	FieldNamenom_cltSize  TWideStringFieldADOQueryfactrepadr_clt	FieldNameadr_cltSize  TWideStringFieldADOQueryfactrepdes_prod	FieldNamedes_prodSize  TIntegerFieldADOQueryfactrepqte_fact	FieldNameqte_fact  TWideStringFieldADOQueryfactreptva	FieldNametvaSize
  	TBCDFieldADOQueryfactrepprix_u	FieldNameprix_u	Precision  	TBCDFieldADOQueryfactrepprix_ht	FieldNameprix_ht	Precision  	TBCDFieldADOQueryfactreptva_fact	FieldNametva_fact	Precision  	TBCDFieldADOQueryfactrepmtt	FieldNamemttReadOnly		Precision   TDataSource
dsqfactrepDataSetADOQueryfactrepLeftXTop�  	TADOQueryADOQuerystockrep1
ConnectionADOConnectionGpharm
CursorTypectStatic
ParametersNameRecordNumber
AttributespaSigned DataType	ftInteger	Precision
SizeValue   SQL.StringsSELECT *
FROM stockWHERE num_STC = :RecordNumber; Left Top�   TDataSourceDsqstockrepDataSetADOQuerystockrep1Left8Top�   	TADOQueryADOQuerydiag3
ConnectionADOConnectionGpharm
CursorTypectStatic
Parameters SQL.StringsSELECT     YEAR(date_ent) AS yearent,    YEAR(date_srt) AS yearsrt,     SUM(qte_ent) AS ent,    SUM(qte_srt) AS sort,    stck_rest AS stock
FROM stockGROUP BY    YEAR(date_ent),    YEAR(date_srt),        stck_rest; Left�Top� TIntegerFieldADOQuerydiag3yearent	FieldNameyearentReadOnly	  TIntegerFieldADOQuerydiag3yearsrt	FieldNameyearsrtReadOnly	  TIntegerFieldADOQuerydiag3ent	FieldNameentReadOnly	  TIntegerFieldADOQuerydiag3sort	FieldNamesortReadOnly	  TIntegerFieldADOQuerydiag3stock	FieldNamestock   TDataSource	dsdialog3DataSetADOQuerydiag3Left�Top�  	TADOQueryADOQuerypharm
ConnectionADOConnectionGpharm
CursorTypectStatic
Parameters SQL.Stringsselect * from pharmacien Left�Top TIntegerFieldADOQuerypharmNum_ph	FieldNameNum_phProviderFlags
pfInUpdate	pfInWherepfInKey   TWideStringFieldADOQuerypharmNom_ph	FieldNameNom_phSize  TWideStringFieldADOQuerypharmTel_ph	FieldNameTel_phSize  TWideStringFieldADOQuerypharmPoste	FieldNamePosteSize
    