unit Database;

interface

uses
  Vector;

type
  TShapes = (shRectangle, shEllipse);

  TCoordinates = record
    x, y: Integer;
  end;

  TElement = Class
    Pos: TCoordinates;
    Text: String[100];
    Shape: TShapes;
  End;

  TLine = Class
    Start, Finish: TCoordinates;
  End;

procedure ReDraw;

var
  arElements: TVector<TElement>;
  arLines: TVector<TLine>;

implementation

uses
  MainWindow;

procedure Draw(const a: TElement);
begin
  MainForm.WorkSpace.Canvas.Rectangle(a.Pos.x, a.Pos.y, a.Pos.x + 200, a.Pos.y + 50);
end;

procedure ReDraw;
var
  i: Integer;
begin
  for i := 0 to arElements.Size - 1 do
  begin
    Draw(arElements.Data[i]);
  end;
end;

initialization

end.
