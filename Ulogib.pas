unit Ulogib;

interface

uses
	Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
	System.Classes, Vcl.Graphics,
	Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls, Vcl.Mask, db,
	Vcl.DBCtrls, adodb, hash, idhash, math, idhashsha, StrUtils, Vcl.ExtCtrls,
	Vcl.Imaging.pngimage,
	Vcl.ToolWin, Vcl.ComCtrls;

type
	TFlogin = class(TForm)
		Image1: TImage;
		Panel1: TPanel;
		Label1: TLabel;
		Label2: TLabel;
		// Change the type and name of the control from DBEdit to Edit.
		EditHashPassword: TEdit;
		// Change the type and name of the control from DBEdit to Edit.
		SpeedButton1: TSpeedButton;
		Editusername: TEdit;
		procedure SpeedButton1Click(Sender: TObject);
		procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure EditusernameKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdithashpasswordKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);

	private
		function GetHash(Password: string): string;
		procedure HandleError(Error: Exception);
		procedure CheckCredentials;
	end;

var
	Flogin: TFlogin;

implementation

{$R *.dfm}

uses Uprincipal, Udata;

procedure TFlogin.SpeedButton1Click(Sender: TObject);
begin
	CheckCredentials;
end;

procedure TFlogin.EdithashpasswordKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
       If  (Key = 10)   Then speedbutton1.Click ;
end;

procedure TFlogin.EditusernameKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If  (Key = 13) Or (Key = Vk_Down )   Then Edithashpassword.SetFocus ;
end;

procedure TFlogin.FormActivate(Sender: TObject);
begin
    Editusername.SetFocus;
end;

procedure TFlogin.FormCreate(Sender: TObject);
begin

	try

  try
    // Open the database query.
    datamodule1.ADOQueryLOGIN.Open;
  except
    on E: Exception do
      // Call the HandleError procedure to display the error message.
      HandleError(E);
  end;
except
  on E: Exception do
    // Handle any exceptions related to creating the datamodule1.
    HandleError(E);
end;

end;

function TFlogin.GetHash(Password: string): string;
begin
	// Use a class function from TIdHashSHA1 to compute the SHA1 hash of a string without creating an instance.
	result := TIdHashSHA1.Create.HashStringAsHex(Password);
end;

procedure TFlogin.HandleError(Error: Exception);
begin
	ShowMessage(Error.Message);
end;

procedure TFlogin.CheckCredentials;
var
	UserName: string;
	PasswordHash: string;
begin
	UserName := Editusername.Text;
	// Change the way you access the text value of the control from DBEdit to Edit.
	PasswordHash := GetHash(EditHashPassword.Text);
	// Change the way you access the text value of the control from DBEdit to Edit.

	// Use the try except method to handle any errors when checking the credentials.
	try
		// Check if the dataset is empty.
		begin
			datamodule1.ADOQueryLOGIN.Open;
			if not datamodule1.ADOQueryLOGIN.IsEmpty then

			begin
				// Locate the record with the matching username using a case-insensitive comparison.
				if datamodule1.ADOQueryLOGIN.Locate('Username', UserName,
					[loCaseInsensitive]) then
				begin
					// If a record is found, check if the passwordhash matches using a case-insensitive comparison.
					if AnsiCompareText
						(GetHash(datamodule1.ADOQueryLOGIN.Fields.Fieldbyname
						('Passwordhash').Value), PasswordHash) = 0 then

					begin
						// If the passwordhash matches, disable the login button and show the main form.
						SpeedButton1.Enabled := false;
						Fprincipal.Show;
						Flogin.HIDE;

					end
					else

						// If the passwordhash does not match, display an error message.
						ShowMessage('Invalid password');
				end
				else

					// If no record is found, display an error message.
					ShowMessage('Username not found')
			END
			else

				// If the dataset is empty, display an error message.
				ShowMessage('No users in database');
		END
	except
		on E: Exception do
			// Call the HandleError procedure to display the error message.
			HandleError(E);
	end;
end;

end.
