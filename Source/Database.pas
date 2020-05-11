unit Database;

interface

uses
  Vcl.Graphics,
  Vcl.ExtCtrls,
  System.Types,
  SysUtils;

type
  TControlObjectProc = procedure(Sender: TObject; const X, Y: Integer);

  TControlObject = class
  protected
    FId: Integer;
    FIsVisible, FIsSelected: Boolean;
    FCanvas: TCanvas;
    FLeft, FTop: Integer;
    FWidth, FHeigth: Integer;
    FOnResize, FOnMove: TControlObjectProc;
    procedure SetCanvas(ACanvas: TCanvas);
  public
    constructor Create; overLoad;
    constructor Create(AObject: TControlObject); overload;
    destructor Destroy;
    procedure SetPosition(const X, Y: Integer);
    procedure Move(const DeltaX, DeltaY: Integer);
    procedure SetSize(const AWidth, AHeigth: Integer);
    procedure DrawControls;
    property Left: Integer read FLeft;
    property Top: Integer read FTop;
    property Width: Integer read FWidth;
    property Heigth: Integer read FHeigth;
    property OnResize: TControlObjectProc read FOnResize write FOnResize;
    property OnMove: TControlObjectProc read FOnMove write FOnMove;
    property Canvas: TCanvas read FCanvas write SetCanvas;
    property Visible: Boolean read FIsVisible write FIsVisible;
    property Selected: Boolean read FIsSelected write FIsSelected;
    property Id: Integer read FId;
    function GetCenter: TPoint;
  end;

  TText = class(TControlObject)
  private
    FCaption: String;
    FBrush: TBrush;
    FFont: TFont;
    FTextFormat: TTextFormat;
  public
    constructor Create; overload;
    constructor Create(AObject: TText); overload;
    destructor Destroy;
    procedure Draw;
    function IsInside(const X, Y: Integer): Boolean;
    property Brush: TBrush read FBrush write FBrush;
    property Caption: String read FCaption write FCaption;
    property Font: TFont read FFont write FFont;
    property TextFormat: TTextFormat read FTextFormat write FTextFormat;
  end;

  TElement = class(TControlObject)
  private
    FShape: TShapeType;
    FBrush: TBrush;
    FPen: TPen;
    FCaption: String;
    FFont: TFont;
    FTextFormat: TTextFormat;
  public
    constructor Create; overload;
    constructor Create(AObject: TElement); overload;
    destructor Destroy;

    function IsInside(const X, Y: Integer): Boolean;
    procedure Draw;

    property Brush: TBrush read FBrush write FBrush;
    property Caption: String read FCaption write FCaption;
    property Font: TFont read FFont write FFont;
    property TextFormat: TTextFormat read FTextFormat write FTextFormat;
    property Pen: TPen read FPen write FPen;
    property Shape: TShapeType read FShape write FShape;
  end;

  TConnector = record
    case BindToElement: Boolean of
      True:
        (Element: TElement);
      False:
        (Pos: TPoint);
  end;

  TLine = class
  private
    FStart, FFinish: TConnector;
    FText: TText;
    FIsSelected: Boolean;
    FPen: TPen;
    FCanvas: TCanvas;
    procedure SetCanvas(const ACanvas: TCanvas);
  public
    constructor Create;
    destructor Destroy;

    procedure Draw;

    function IsInside(const X, Y: Integer): Boolean;

    property Text: TText read FText write FText;
    property Selected: Boolean read FIsSelected write FIsSelected;
    property Pen: TPen read FPen write FPen;
    property Canvas: TCanvas read FCanvas write SetCanvas;
  end;

implementation

uses
  MainWindow;

const
  DefaultTextFormat: TTextFormat = [tfSingleLine, tfCenter, tfVerticalCenter];

  { TLine }

constructor TLine.Create;
begin
  FText := TText.Create;
  FText.FCaption := '';
  FPen := TPen.Create;
end;

destructor TLine.Destroy;
begin
  FText.Free;
  FPen.Free;
  Inherited;
end;

procedure TLine.Draw;
var
  StartPoint, FinishPoint: TPoint;
begin
  case FStart.BindToElement of
    True:
      StartPoint := FStart.Element.GetCenter;
    False:
      StartPoint := FStart.Pos;
  end;
  FCanvas.MoveTo(StartPoint.X, StartPoint.Y);
  FCanvas.Pen := FPen;
  case FFinish.BindToElement of
    True:
      FinishPoint := FFinish.Element.GetCenter;
    False:
      FinishPoint := FFinish.Pos;
  end;
  FCanvas.LineTo(FinishPoint.X, FinishPoint.Y);
  FText.FLeft := StartPoint.X;
  FText.FTop := StartPoint.Y;
  FText.FWidth := FinishPoint.X - StartPoint.X;
  FText.FHeigth := FinishPoint.Y - StartPoint.Y;
  FText.Draw;
end;

function TLine.IsInside(const X, Y: Integer): Boolean;
begin
  Result := False;

end;

procedure TLine.SetCanvas(const ACanvas: TCanvas);
begin
  Self.FCanvas := ACanvas;
  FText.Canvas := ACanvas;
end;

{ TText }

constructor TText.Create;
begin
  FBrush := TBrush.Create;
  FFont := TFont.Create;
  FTextFormat := DefaultTextFormat;
  FCaption := 'Some text';
end;

constructor TText.Create(AObject: TText);
begin
  FCaption := AObject.Caption;
  FBrush := TBrush.Create;
  FFont := TFont.Create;
  FBrush.Assign(AObject.Brush);
  FFont.Assign(AObject.Font);
  FTextFormat := AObject.TextFormat;
  FCanvas := AObject.Canvas;
end;

destructor TText.Destroy;
begin
  FFont.Destroy;
  Inherited;
end;

procedure TText.Draw;
var
  Rect: TRect;
begin
  Rect := TRect.Create(FLeft, FTop, FLeft + FWidth, FTop + FHeigth);
  FCanvas.Font := FFont;
  FCanvas.Brush := FBrush;
  FCanvas.TextRect(Rect, FCaption, FTextFormat);
end;

function TText.IsInside(const X, Y: Integer): Boolean;
begin
  Result := (X >= FLeft) and (Y >= FTop) and (X <= FLeft + FWidth) and
    (Y <= FTop + FHeigth);
end;

{ TElement }

constructor TElement.Create;
begin
  Inherited;
  FTextFormat := DefaultTextFormat;
  FFont := TFont.Create;
  FBrush := TBrush.Create;
  FPen := TPen.Create;
end;

constructor TElement.Create(AObject: TElement);
begin
  Inherited Create(AObject);
  FShape := AObject.Shape;
  FBrush := TBrush.Create;
  FCaption := AObject.Caption;
  FFont := TFont.Create;
  FFont.Assign(AObject.Font);
  FPen := TPen.Create;
  FBrush.Assign(AObject.Brush);
  FPen.Assign(AObject.Pen);
  FTextFormat := AObject.TextFormat;
end;

destructor TElement.Destroy;
begin
  FFont.Free;
  FBrush.Free;
  FPen.Free;
  Inherited;
end;

procedure TElement.Draw;
var
  Rect: TRect;
begin
  if FIsVisible then
  begin
    FCanvas.Pen := FPen;
    FCanvas.Brush := FBrush;
    FCanvas.Font := FFont;
    case FShape of
      stRectangle, stSquare:
        Canvas.Rectangle(FLeft, FTop, FLeft + FWidth, FTop + FHeigth);
      // stRoundRect: ;
      // stRoundSquare: ;
      stEllipse, stCircle:
        Canvas.Ellipse(FLeft, FTop, FLeft + FWidth, FTop + FHeigth);
    end;
//    FText.Draw;

    Rect.Create(FLeft, FTop, FLeft + FWidth, FTop + FHeigth);;
    FCanvas.TextRect(Rect, FCaption, FTextFormat);

    if FIsSelected then
    begin

      Canvas.Brush.Style := bsClear;
      Canvas.Pen.Color := clBlue;
      Canvas.Pen.Width := 3;
      case FShape of
      stRectangle, stSquare:
        Canvas.Rectangle(FLeft, FTop, FLeft + FWidth, FTop + FHeigth);
      // stRoundRect: ;
      // stRoundSquare: ;
      stEllipse, stCircle:
        Canvas.Ellipse(FLeft, FTop, FLeft + FWidth, FTop + FHeigth);
    end;
    end;
  end;
end;

function TElement.IsInside(const X, Y: Integer): Boolean;

  function IsInEllipse(const X, Y, a2, b2: Integer): Boolean;
  begin
    if (a2 = 0) or (b2 = 0) then
      Result := False
    else
      Result := (Sqr(X) / Sqr(a2) + Sqr(Y) / Sqr(b2)) <= 2.0;
  end;

begin
  case FShape of
    stRectangle, stSquare:
      Result := (X >= FLeft) and (Y >= FTop) and (X <= FLeft + FWidth) and
        (Y <= FTop + FHeigth);
    // stRoundRect: ;
    // stRoundSquare: ;
    stEllipse, stCircle:
      Result := IsInEllipse(X - FLeft, Y - FTop, FWidth, FHeigth);
  end;
end;

{ TControlObject }

constructor TControlObject.Create;
begin
  FIsVisible := True;
  Inherited;
end;

constructor TControlObject.Create(AObject: TControlObject);
begin
  Self.FIsVisible := AObject.Visible;
  Self.FIsSelected := False;
  Self.FCanvas := AObject.Canvas;
  Self.FLeft := Aobject.Left;
  Self.FTop := AObject.Top;
  Self.FWidth := AObject.Width;
  Self.FHeigth := AObject.Heigth;
end;

destructor TControlObject.Destroy;
begin
  Inherited;
end;

procedure TControlObject.DrawControls;

const
  DotSize = 3;

  procedure DrawDot(const X, Y: Integer);
  begin
    FCanvas.Rectangle(X - DotSize, Y - DotSize, X + DotSize, Y + DotSize);
  end;

begin
  if FIsVisible then
  begin
    FCanvas.Brush.Style := bsClear;
    FCanvas.Pen.Style := psDash;
    FCanvas.Pen.Color := clBlue;
    FCanvas.Rectangle(FLeft, FTop, FLeft + FWidth, FTop + FHeigth);
    FCanvas.Brush.Style := bsSolid;
    FCanvas.Brush.Color := clGreen;
    FCanvas.Pen.Style := psSolid;
    FCanvas.Pen.Color := clBlack;
    DrawDot(FLeft, FTop); // 0
    DrawDot(FLeft + FWidth shr 1, FTop); // 1
    DrawDot(FLeft + FWidth, FTop); // 2
    DrawDot(FLeft + FWidth, FTop + FHeigth shr 1); // 3
    DrawDot(FLeft + FWidth, FTop + FHeigth); // 4
    DrawDot(FLeft + FWidth shr 1, FTop + FHeigth); // 5
    DrawDot(FLeft, FTop + FHeigth); // 6
    DrawDot(FLeft, FTop + FHeigth shr 1); // 7
  end;
end;

function TControlObject.GetCenter: TPoint;
begin
  Result.X := FLeft + FWidth shr 1;
  Result.Y := FTop + FHeigth shr 1;
end;

procedure TControlObject.Move(const DeltaX, DeltaY: Integer);
begin
  Inc(FLeft, DeltaX);
  Inc(FTop, DeltaY);
end;

procedure TControlObject.SetCanvas(ACanvas: TCanvas);
begin
  Self.FCanvas := ACanvas;
end;

procedure TControlObject.SetPosition(const X, Y: Integer);
begin
  FLeft := X;
  FTop := Y;
end;

procedure TControlObject.SetSize(const AWidth, AHeigth: Integer);
begin
  FWidth := AWidth;
  FHeigth := AHeigth;
end;

initialization

end.
