unit Database;

interface

uses
  Vcl.Graphics,
  Vector;

type
  TShapes = (shRectangle, shEllipse, shCirkle);

  TCoordinates = record
    X, Y: Integer;
  end;

  TElement = Class
    PosLU, PosRB: TCoordinates;
    Text: String; // [100];
    Shape: TShapes;
    IsSelected: Boolean;
    constructor Create(const Center: TCoordinates; const Size: TCoordinates;
      const ElementShape: TShapes); overload;
    constructor Create(const CenterX, CenterY, SizeX, SizeY: Integer;
      const ElementShape: TShapes); overload;
    procedure Draw(const Canvas: TCanvas);
    function IsInside(const Point: TCoordinates): Boolean;
  end;

  TLine = Class
    Start, Finish: TCoordinates;
    Text: String; // [100];
    IsSelected: Boolean;
  end;

procedure ReDraw;
procedure Draw(const a: TElement);

var
  arElements: TVector<TElement>;
  arLines: TVector<TLine>;

implementation

uses
  System.Types,
  MainWindow;

procedure Draw(const a: TElement);
begin
  // MainForm.WorkSpace.Canvas.Rectangle();
end;

procedure ReDraw;
var
  i: Integer;
begin
  for i := 0 to arElements.Size - 1 do
  begin
    arElements.Data[i].Draw(MainForm.Workspace.Canvas);
  end;
end;

{ TElement }

constructor TElement.Create(const Center: TCoordinates;
  const Size: TCoordinates; const ElementShape: TShapes);
begin
  Text := 'Some Text';
  IsSelected := True;
  Shape := ElementShape;
  PosLU.X := Center.X - Size.X div 2;
  PosLU.Y := Center.Y - Size.Y div 2;
  PosRB.X := Center.X + Size.X div 2;
  PosRB.Y := Center.Y + Size.Y div 2;
end;

constructor TElement.Create(const CenterX, CenterY, SizeX, SizeY: Integer;
  const ElementShape: TShapes);
begin
  Text := 'Some Text';
  IsSelected := True;
  Shape := ElementShape;
  PosLU.X := CenterX - SizeX div 2;
  PosLU.Y := CenterY - SizeY div 2;
  PosRB.X := CenterX + SizeX div 2;
  PosRB.Y := CenterY + SizeY div 2;
end;

procedure TElement.Draw(const Canvas: TCanvas);
begin
  Canvas.Rectangle(PosLU.X, PosLU.Y, PosRB.X, PosRB.Y);
end;

function TElement.IsInside(const Point: TCoordinates): Boolean;
begin
  Result := (Point.X >= PosLU.X) and (Point.Y >= PosLU.Y) and
    (Point.X <= PosRB.X) and (Point.Y <= PosRB.Y);
end;

initialization

end.