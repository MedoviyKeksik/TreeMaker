unit Database;

interface

uses
  Vcl.Graphics,
  System.Types,
  SysUtils;

type
  TText = class
  public
    Left, Top: Integer;
    Width, Heigth: Integer;
    Caption: String;
    Font: TFont;
    TextFormat: TTextFormat;
    Brush: TBrush;

    constructor Create;
    destructor Destroy;

    procedure SetCanvas(const Canvas: TCanvas);

    procedure Draw;

  private
    Canvas: TCanvas;
  end;

  TShapes = (shRectangle, shEllipse, shCirkle);

  TElement = class
  public
    Left, Top: Integer;
    Width, Heigth: Integer;
    Text: TText;
    Shape: TShapes;
    IsSelected: Boolean;
    Brush: TBrush;
    Pen: TPen;

    constructor Create;
    destructor Destroy;
    procedure SetCanvas(const Canvas: TCanvas);
    function IsInside(const X, Y: Integer): Boolean;
    procedure Move(const X, Y: Integer);
    procedure Draw;
    procedure SetPosition(const X, Y: Integer);
    procedure SetWidthHeigth(const Width, Heigth: Integer);
    function GetCenter: TPoint;
  private
    Canvas: TCanvas;
  end;

  TConnector = record
    case BindToElement: Boolean of
    True: (Element: TElement);
    False: (Pos: TPoint);
  end;

  TLine = class
  public
    Start, Finish: TConnector;
    Text: TText;
    IsSelected: Boolean;
    Pen: TPen;

    constructor Create;
    destructor Destroy;
    procedure Move;
    procedure Draw;
    function IsInside: Boolean;
    procedure SetCanvas(const Canvas: TCanvas);
  private
    Canvas: TCanvas;
  end;

implementation

uses
  MainWindow;

const
  DefaultTextFormat: TTextFormat = [tfSingleLine, tfCenter, tfVerticalCenter];


{ TLine }

constructor TLine.Create;
begin
  Text := TText.Create;
  Pen := TPen.Create;
end;

destructor TLine.Destroy;
begin
  Text.Destroy;
  Pen.Destroy;
  Inherited;
end;

procedure TLine.Draw;
var
  StartPoint, FinishPoint: TPoint;
begin
  case Start.BindToElement of
  True:
    StartPoint := Start.Element.GetCenter;
  False: 
    StartPoint := Start.Pos;
  end;
  Canvas.MoveTo(StartPoint.X, StartPoint.Y);
  Canvas.Pen := Pen;
  case Finish.BindToElement of
  True:
    FinishPoint := Finish.Element.GetCenter;
  False:  
    FinishPoint := Finish.Pos;
  end;
  Canvas.LineTo(FinishPoint.X, FinishPoint.Y);
  Text.Left := StartPoint.X;
  Text.Top := StartPoint.Y;
  Text.Width := FinishPoint.X - StartPoint.X;
  Text.Heigth := FinishPoint.Y - StartPoint.Y;
  Text.Font.Orientation := Trunc(-FinishPoint.Angle(StartPoint) * 180 / Pi * 10);
  MainForm.Status.Caption := IntToStr(-Trunc(FinishPoint.Angle(StartPoint) * 180 / Pi * 10));
  Text.Draw;
end;

function TLine.IsInside: Boolean;
begin

end;

procedure TLine.Move;
begin

end;

procedure TLine.SetCanvas(const Canvas: TCanvas);
begin
  Self.Canvas := Canvas;
  Text.SetCanvas(Canvas);
end;

{ TText }

constructor TText.Create;
begin
  Brush := TBrush.Create;
  Font := TFont.Create;
  TextFormat := DefaultTextFormat;
  Caption := 'Some text';
end;

destructor TText.Destroy;
begin
  Font.Destroy;
  Inherited;
end;

procedure TText.Draw;
var
  Rect: TRect;
begin
  Rect := TRect.Create(Left, Top, Left + Width, Top + Heigth);
  Canvas.Font := Font;
  Canvas.Brush := Brush;
  Canvas.TextRect(Rect, Caption, TextFormat);
end;

procedure TText.SetCanvas(const Canvas: TCanvas);
begin
  Self.Canvas := Canvas;
end;

{ TElement }

constructor TElement.Create;
begin
  Text := TText.Create;
  Brush := TBrush.Create;
  Pen := TPen.Create;
end;

destructor TElement.Destroy;
begin
  Text.Destroy;
  Brush.Destroy;
  Pen.Destroy;
  Inherited;
end;

procedure TElement.Draw;
begin
  Canvas.Pen := Pen;
  Canvas.Brush := Brush;
  // TEMP SOLUTION
  Text.Brush := Brush;
  Canvas.Rectangle(Left, Top, Left + Width, Top + Heigth);
  Text.Draw;
end;

function TElement.GetCenter: TPoint;
begin
  Result.X := Left + Width shr 1;
  Result.Y := Top + Heigth shr 1;
end;

function TElement.IsInside(const X, Y: Integer): Boolean;
begin
  Result := (X >= Left) and (Y >= Top) and (X <= Left + Width) and (Y <= Top + Heigth);
end;

procedure TElement.Move(const X, Y: Integer);
begin
  Left := X;
  Top := Y;
  Text.Left := X;
  Text.Width := Y;
end;

procedure TElement.SetCanvas(const Canvas: TCanvas);
begin
  Self.Canvas := Canvas;
  Text.SetCanvas(Canvas);
end;

procedure TElement.SetPosition(const X, Y: Integer);
begin
  Left := X;
  Top := Y;
  Text.Left := X;
  Text.Top := Y;
end;

procedure TElement.SetWidthHeigth(const Width, Heigth: Integer);
begin
  Self.Width := Width;
  Self.Heigth := Heigth;
  Text.Width := Width;
  Text.Heigth := Heigth;
end;

initialization

end.
