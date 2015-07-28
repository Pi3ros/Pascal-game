unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TMenu = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Timer1: TTimer;
    Label5: TLabel;
    Label6: TLabel;
    procedure Label3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Menu: TMenu;

implementation

uses Unit1, Unit3;

{$R *.dfm}

procedure TMenu.Label3Click(Sender: TObject);
begin
Label3.Caption:=Profil.Stribro.Caption;
end;

procedure TMenu.Button1Click(Sender: TObject);
begin
Profil.Show;
end;

procedure TMenu.Timer1Timer(Sender: TObject);
begin
Label3.Caption:=Profil.Stribro.Caption;
Label4.Caption:=Profil.Zlato.Caption;
Label5.Hide;

//Nick- repair n.4

if StrToInt(Label6.Caption) = 0 then begin
  Label6.Caption:=IntToStr(1);
  Profil.Nick.Caption:=inputbox('Zadej jméno','Jméno:','Neznámý');
  if Profil.Nick.Caption>IntToStr(10) then begin
    showmessage('CHYBA!');
    Profil.Nick.Caption:=inputbox('Zadej jméno','Jméno:','Neznámý');
    if Profil.Nick.Caption>IntToStr(10) then Profil.Nick.Caption:='Player';
  end;
end;

end;

procedure TMenu.Button6Click(Sender: TObject);
begin
Close;
end;

procedure TMenu.Button2Click(Sender: TObject);
begin

//First start - Fix n.3

if  Vyprava.Label2.Caption = 'XXX' then begin
  Vyprava.Show;
  Vyprava.Button2.Hide;
end;

//kontrola zneužití chyby č.1

if Vyprava.Label2.Caption = 'XXX' then begin
  Label5.Caption:=IntToStr(StrToInt(Label5.Caption)+1);
  if StrToInt(Label5.Caption) = 6 then begin
    showmessage('Zneužití chyb!');
    close;
  end;
end;

//Fix n.3

if Vyprava.Label2.Caption <> 'XXX' then begin
  Vyprava.Show;
  Button2.Show;
end;

//inicializace herního prostředí

randomize;
Vyprava.Label15.Caption:=IntToStr(random(10)+1); //síla - enemy
Vyprava.Label16.Caption:=IntToStr(random(10)+1); //obrana - enemy
Vyprava.Label18.Caption:=IntToStr(random(3)*StrToInt(Vyprava.Label14.Caption)+1); //úroveň - enemy
Vyprava.Label19.Caption:=Profil.Nick.Caption; //jméno přiřazení

//Choose character - enemy

If Vyprava.Label18.Caption < Vyprava.Label14.Caption then begin
  Vyprava.Enemy1.Show;
  Vyprava.Enemy2.Hide;
  Vyprava.Enemy3.Hide;
end;
If Vyprava.Label18.Caption = Vyprava.Label14.Caption then begin
  Vyprava.Enemy1.Hide;
  Vyprava.Enemy2.Show;
  Vyprava.Enemy3.Hide;
end;
If Vyprava.Label18.Caption > Vyprava.Label14.Caption then begin
  Vyprava.Enemy1.Hide;
  Vyprava.Enemy2.Hide;
  Vyprava.Enemy3.Show;
end;

end;

end.
