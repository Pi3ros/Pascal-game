unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls;

type
  TVyprava = class(TForm)
    Enemy1: TImage;
    Postava1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Enemy2: TImage;
    Enemy3: TImage;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Vyprava: TVyprava;

implementation

uses Unit1;

{$R *.dfm}

procedure TVyprava.Button1Click(Sender: TObject);
begin

//životy - barva, dle kritérií

If StrToInt(Label8.Caption) >= StrToInt(Profil.Zivoty.Caption) then Label8.Color:=clLime;     //životy hráče
If StrToInt(Label8.Caption) < StrToInt(Profil.Zivoty.Caption) div 2 then Label8.Color:=clYellow;
If StrToInt(Label8.Caption) < StrToInt(Profil.Zivoty.Caption) div 4  then Label8.Color:=clRed;
If StrToInt(Label17.Caption) >= (100) then Label17.Color:=clLime;   //životy enemy
If StrToInt(Label17.Caption) < (69) then Label17.Color:=clYellow;
If StrToInt(Label17.Caption) < (29) then Label17.Color:=clRed;

//bojový systém
//část 1. útok

randomize;
Label8.Caption:=IntToStr(StrToInt(Label8.Caption)-StrToInt(Label15.Caption)*random(3)); //počet životů - hráč - útok
Label17.Caption:=IntToStr(StrToInt(Label17.Caption)-StrToInt(Label4.Caption)*random(3)); //počet životů - enemy - útok

//část 2. obrana

Label8.Caption:=IntToStr(StrToInt(Label8.Caption)+StrToInt(Label6.Caption)*random(2)); // počet životů - hráč - obrana
Label17.Caption:=IntToStr(StrToInt(Label17.Caption)+StrToInt(Label16.Caption)*random(2)); //počet životů - enemy - obrana

//část 3. konec boje

If StrToInt(Label8.Caption) <= 0 then begin
  Label2.Caption:=Label20.Caption;
  Button1.Hide;
  Button2.Show;
  //část 4. vyhodnocení - vítěz je enemy
  Profil.Stribro.Caption:=IntToStr(StrToInt(Profil.Stribro.Caption) - random(10)*StrToInt(Label18.Caption));
  Profil.Prohra.Caption:=IntToStr(StrToInt(Profil.Prohra.Caption)+1);
end else if StrToInt(Label17.Caption) <= 0 then begin
  Label2.Caption:=Label19.Caption;
  Button1.Hide;
  Button2.Show;
  //část 4. vyhodnocení - vítěz je hráč
  Profil.Stribro.Caption:=IntToStr(StrToInt(Profil.Stribro.Caption) + (random(10)+1)*(random(10)+1));
  Profil.Zlato.Caption:=IntToStr(StrToInt(Profil.Zlato.Caption) + StrToInt(Label18.Caption));
  Profil.ZK.Caption:=IntToStr(StrToInt(Profil.ZK.Caption)+random(10)+1);
  Profil.Vyhra.Caption:=IntToStr(StrToInt(Profil.Vyhra.Caption)+1);
end;


end;

procedure TVyprava.Button2Click(Sender: TObject);
begin

// obnovení herního prostřední po boji

randomize;
Vyprava.Label15.Caption:=IntToStr(random(10)+1); //Strenght - enemy
Vyprava.Label16.Caption:=IntToStr(random(10)+1); //Defense - enemy
Vyprava.Label18.Caption:=IntToStr(random(3)*StrToInt(Vyprava.Label14.Caption)+1); //Lvl - enemy

If Vyprava.Label18.Caption < Vyprava.Label14.Caption then begin      //Choose character - enemy
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

Label2.Caption:='XXX';
Label8.Caption:=Profil.Zivoty.Caption;
Label17.Caption:=Profil.Zivoty.Caption;
Button2.Hide;
Button1.Show;
Label8.Color:=clLime;
Label17.Color:=clLime;


end;

end.
