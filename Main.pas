unit Main;
{$mode objfpc}{$H+}
interface
uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  Interfaces;
type
// ----------------------- TForm1 class declaration

  { TForm1 }
  TForm1 = class(TForm)
    // UI Objects
    ResetButton: TButton;
    Label1: TLabel;
    XLabel: TLabel;
    OLabel: TLabel;
    XLabelCount: TLabel;
    OLabelCount: TLabel;
    PlayAgainButton: TButton;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    ResultLabel: TLabel;
    TurnLabel: TLabel;

    // Functions and procedures
    procedure ButtonClick(Sender: TButton);
    procedure DisableButtons();
    procedure EnableButtons();
    procedure FormCreate(Sender: TObject);
    procedure ShowGameOverPanel(result: String);
    procedure HideGameOverPanel();
    procedure ChangeTurn();
    procedure UpdateWinCountLabels();
    procedure ResetGame(Sender: TObject);
    function CheckWin(): Boolean;
    function CheckDraw(): Boolean;
  private
  public
end;

// ----------------------- Variables
var
  Form: TForm1;
  turn: char = 'X';
  turnCount: integer = 0;
  XWinCount: integer = 0;
  OWinCount: integer = 0;

implementation
{$R *.lfm}

// ----------------------- TForm1 functions' and procedures' implementations
{ TForm1 }
procedure TForm1.FormCreate(Sender: TObject);
begin

end;

procedure TForm1.ChangeTurn();
begin
     if turn = 'X' then turn := 'O'
     else turn := 'X';

     // Switch TurnLabel caption
     TurnLabel.caption := 'Turn: ' + turn;
end;

procedure TForm1.ResetGame(Sender: TObject);
begin
     turnCount := 0;
     turn := 'X';
     TurnLabel.caption := 'Turn: ' + turn;

     // Reset buttons' caption
     Button1.caption := '';
     Button2.caption := '';
     Button3.caption := '';
     Button4.caption := '';
     Button5.caption := '';
     Button6.caption := '';
     Button7.caption := '';
     Button8.caption := '';
     Button9.caption := '';

     EnableButtons();

     HideGameOverPanel();
end;

procedure TForm1.ButtonClick(Sender: TButton);
begin
     if (Length(Sender.caption) = 0) then begin
       Sender.caption := turn;
       turnCount := turnCount + 1;

       if (CheckWin() = true) then begin
           DisableButtons();

           // Update win count variables and labels
           if (turn = 'X') then XWinCount := XWinCount + 1;
           if (turn = 'O') then OWinCount := OWinCount + 1;
           UpdateWinCountLabels();

           ShowGameOverPanel(turn + ' has won!');
       end
       else begin
           if (CheckDraw() = true) then begin
             DisableButtons();
             ShowGameOverPanel('Draw!');
           end
           else ChangeTurn();
       end
     end
end;

function TForm1.CheckDraw(): Boolean;
begin
    if turnCount >= 9 then CheckDraw := true
    else CheckDraw := false;
end;

function TForm1.CheckWin(): Boolean;
begin
     if ((Button1.caption <> '') and (Button1.caption = Button2.caption) and (Button2.caption = Button3.caption)) or
     ((Button4.caption <> '') and (Button4.caption = Button5.caption) and (Button5.caption = Button6.caption)) or
     ((Button7.caption <> '') and (Button7.caption = Button8.caption) and (Button8.caption = Button9.caption)) then begin
           // Win horizontally
           CheckWin := true;
     end else begin
          if ((Button1.caption <> '') and (Button1.caption = Button4.caption) and (Button4.caption = Button7.caption)) or
          ((Button2.caption <> '') and (Button2.caption = Button5.caption) and (Button5.caption = Button8.caption)) or
          ((Button3.caption <> '') and (Button3.caption = Button6.caption) and (Button6.caption = Button9.caption)) then begin
               // Win vertically
               CheckWin := true;
          end else begin
               if ((Button1.caption <> '') and (Button1.caption = Button5.caption) and (Button5.caption = Button9.caption)) or
               ((Button3.caption <> '') and (Button3.caption = Button5.caption) and (Button5.caption = Button7.caption)) then begin
                   // Win diagonally
                   CheckWin := true;
               end else begin
                   // There is no win
                   CheckWin := false;
               end
          end
     end
end;

procedure TForm1.UpdateWinCountLabels();
begin
     XLabelCount.caption := IntToStr(XWinCount);
     OLabelCount.caption := IntToStr(OWinCount);
end;

procedure TForm1.ShowGameOverPanel(result: String);
begin
   ResultLabel.caption := result;
   ResultLabel.Show();

   PlayAgainButton.Show();
end;

procedure TForm1.HideGameOverPanel();
begin
   ResultLabel.Hide();
   PlayAgainButton.Hide();
end;

procedure TForm1.DisableButtons();
begin
  Button1.Enabled := false;
  Button2.Enabled := false;
  Button3.Enabled := false;
  Button4.Enabled := false;
  Button5.Enabled := false;
  Button6.Enabled := false;
  Button7.Enabled := false;
  Button8.Enabled := false;
  Button9.Enabled := false;
end;

procedure TForm1.EnableButtons();
begin
  Button1.Enabled := true;
  Button2.Enabled := true;
  Button3.Enabled := true;
  Button4.Enabled := true;
  Button5.Enabled := true;
  Button6.Enabled := true;
  Button7.Enabled := true;
  Button8.Enabled := true;
  Button9.Enabled := true;
end;

end.

