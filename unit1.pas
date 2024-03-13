unit Unit1;
{$mode objfpc}{$H+}
interface
uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;
type
// ------------------ Klasa TicTacToe

  { TForm1 }
  TForm1 = class(TForm)
    // buttons
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    // click button
    procedure ButtonClick(Sender: TButton);
    // inne
    procedure FormCreate(Sender: TObject);
  private
  public
end;

// ------------------ Deklaracja funkcji i zmiennych
var
  Form: TForm1;
  tura: char = 'X';

// ------------------ Implementacja funkcji
implementation
{$R *.lfm}

// ------------------ Inne funkcje
procedure zmienTure();
begin
     if tura = 'X' then tura := 'O'
     else tura := 'X';
end;

// ------------------ Funkcje TForm
{ TForm1 }
procedure TForm1.FormCreate(Sender: TObject);
begin

end;

procedure TForm1.ButtonClick(Sender: TButton);
begin
     Sender.caption := tura;
     zmienTure();
end;

end.

