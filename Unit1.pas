unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, jpeg, StdCtrls;

type
  TProfil = class(TForm)
    Postava1: TImage;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Label1: TLabel;
    Sila: TLabel;
    Label3: TLabel;
    Lvl: TLabel;
    Label5: TLabel;
    ZK: TLabel;
    Label7: TLabel;
    PZK: TLabel;
    Label9: TLabel;
    Obrana: TLabel;
    Label11: TLabel;
    Zivoty: TLabel;
    Label13: TLabel;
    Stribro: TLabel;
    Label15: TLabel;
    Zlato: TLabel;
    Timer1: TTimer;
    Label2: TLabel;
    Vyhra: TLabel;
    Label6: TLabel;
    Prohra: TLabel;
    Nick: TLabel;
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Profil: TProfil;

implementation

{$R *.dfm}

procedure TProfil.Timer1Timer(Sender: TObject);
begin

  //zkušenosti - úrovně

  If ZK.Caption = PZK.Caption then begin
    Lvl.Caption:=IntToStr(StrToInt(Lvl.Caption)+1);
    ZK.Caption:=IntToStr(StrToInt(PZK.Caption) - StrToInt(ZK.Caption));
    PZK.Caption:=FloatToStr(StrToFloat(PZK.Caption)+100);
  end;

  //přepočet peněz

  If StrToInt(Stribro.Caption)>=100 then begin
    Zlato.Caption:=IntToStr(StrToInt(Zlato.Caption)+1);
    Stribro.Caption:=IntToStr(StrToInt(Stribro.Caption)-100);
  end;

  //oprava chyby č.2

  If StrToInt(Stribro.Caption)<0 then begin
    Zlato.Caption:=IntToStr(StrToInt(Zlato.Caption)-1);
    Stribro.Caption:=IntToStr(StrToInt(Stribro.Caption)+100);
  end;
end;
end.
