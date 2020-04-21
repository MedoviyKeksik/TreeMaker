unit MainWindow;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ExtCtrls, Vcl.StdCtrls,
  Database, Vcl.ToolWin, Vcl.ComCtrls, System.Actions, Vcl.ActnList,
  Vcl.StdActns, System.ImageList, Vcl.ImgList, Vector;

type
  TTools = (Mouse, Rectangle, Ellipse, Circle, Line, Text);

  TMainForm = class(TForm)
    Menu: TMainMenu;
    miFile: TMenuItem;
    MiOpen: TMenuItem;
    miSave: TMenuItem;
    miEdit: TMenuItem;
    miHelp: TMenuItem;
    miAbout: TMenuItem;
    miUndo: TMenuItem;
    ToolbarPanel: TPanel;
    Workspace: TImage;
    miView: TMenuItem;
    Properties: TPanel;
    StatusBar: TStatusBar;
    WorkSpacePanel: TPanel;
    ImageList: TImageList;
    ActionList: TActionList;
    FileOpen: TFileOpen;
    EditCut: TEditCut;
    EditCopy: TEditCopy;
    EditPaste: TEditPaste;
    EditSelectAll: TEditSelectAll;
    EditUndo: TEditUndo;
    EditDelete: TEditDelete;
    FileSaveAs: TFileSaveAs;
    FileExit: TFileExit;
    miExit: TMenuItem;
    miCut: TMenuItem;
    miCopy: TMenuItem;
    miPaste: TMenuItem;
    miSelectAll: TMenuItem;
    miDelete: TMenuItem;
    ToolBar: TToolBar;
    tlMouse: TToolButton;
    tlRectangle: TToolButton;
    tlEllipse: TToolButton;
    tlCircle: TToolButton;
    tlText: TToolButton;
    tlLine: TToolButton;
    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure tlMouseClick(Sender: TObject);
    procedure tlRectangleClick(Sender: TObject);
    procedure WorkspaceMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure WorkspaceMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure tlEllipseClick(Sender: TObject);
    procedure tlCircleClick(Sender: TObject);
    procedure tlLineClick(Sender: TObject);
  private
    CurrentTool: TTools;
    Elements: TVector<TElement>;
    Texts: TVector<TText>;
    Lines: TVector<TLine>;
    function IsClicked(const X, Y: Integer): Boolean;
    function IsClickedElements(const X, Y: Integer): Boolean;
    function IsClickedLines(const X, Y: Integer): Boolean;
    function IsClickedTexts(const X, Y: Integer): Boolean;
    procedure SetDefaultsElement(Element: TElement);
    procedure AddRectangle(const X, Y: Integer);
    procedure AddEllipse(const X, Y: Integer);
    procedure AddCircle(const X, Y: Integer);
    procedure AddText(const X, Y: Integer);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

procedure TMainForm.AddCircle(const X, Y: Integer);
var
  Element: TElement;
begin
  Element := TElement.Create;
  Element.Shape := shCircle;
  SetDefaultsElement(Element);
  Element.SetWidthHeigth(100, 100);
  Element.SetPosition(X - Element.Width shr 1, Y - Element.Heigth shr 1);
  Element.Draw;
  Elements.PushBack(Element);
end;

procedure TMainForm.AddEllipse(const X, Y: Integer);
var
  Element: TElement;
begin
  Element := TElement.Create;
  Element.Shape := shEllipse;
  SetDefaultsElement(Element);
  Element.SetPosition(X - Element.Width shr 1, Y - Element.Heigth shr 1);
  Element.Draw;
  Elements.PushBack(Element);
end;

procedure TMainForm.AddRectangle(const X, Y: Integer);
var
  Element: TElement;
begin
  StatusBar.Panels[0].Text := 'Element Created';
  Element := TElement.Create;
  Element.Shape := shRectangle;
  SetDefaultsElement(Element);
  Element.SetPosition(X - Element.Width shr 1, Y - Element.Heigth shr 1);
  Element.Draw;
  Elements.PushBack(Element);
end;

procedure TMainForm.AddText(const X, Y: Integer);
begin

end;

procedure TMainForm.FormCreate(Sender: TObject);
var
  Element1, Element2: TElement;
  Line: TLine;
begin
  CurrentTool := Mouse;
  Elements := TVector<TElement>.Create;
  Texts := TVector<TText>.Create;
  Lines := TVector<TLine>.Create;

  // Some
//  Element1 := TElement.Create;
//  Element1.SetCanvas(Workspace.Canvas);
//  Element1.SetPosition(10, 10);
//  Element1.SetWidthHeigth(200, 100);
//  Element1.Text.Font.Size := 30;
//  Element1.Text.Caption := 'Cursa4';
//  Element1.Brush.Color := $c4c4c4;
//  Element1.Pen.Width := 5;
//
//
//  Element2 := TElement.Create;
//  Element2.SetCanvas(Workspace.Canvas);
//  Element2.SetPosition(200, 300);
//  Element2.SetWidthHeigth(200, 100);
//  Element2.Text.Font.Size := 17;
//  Element2.Text.Caption := '������, �� �����';
//  Element2.Brush.Color := $c4c4c4;
//  Element2.Pen.Width := 5;
//
//  Line := TLine.Create;
//  Line.SetCanvas(Workspace.Canvas);
//  Line.Start.BindToElement := True;
//  Line.Start.Element := Element1;
//  Line.Pen.Width := 3;
//  Line.Finish.BindToElement := True;
//  Line.Finish.Element := Element2;
//  Line.Text.Font.Size := 13;
//
//  Line.Draw;
//  Element1.Draw;
//  Element2.Draw;
end;

procedure TMainForm.FormPaint(Sender: TObject);
begin
//  Refresh

//  ToolBarPanel.Refresh;
end;

function TMainForm.IsClicked(const X, Y: Integer): Boolean;
begin
  Result := IsClickedLines(X, Y) or IsClickedTexts(X, Y) or IsClickedElements(X, Y);
end;

function TMainForm.IsClickedElements(const X, Y: Integer): Boolean;
var
  I: Integer;
begin
  Result := False;
  for I := 0 to Elements.Size - 1 do
    if Elements.Data[i].IsInside(X, Y) then
    begin
      Result := True;
      Break;
    end;
end;

function TMainForm.IsClickedLines(const X, Y: Integer): Boolean;
var
  I: Integer;
begin
  Result := False;
  for I := 0 to Lines.Size - 1 do
    if Lines.Data[I].IsInside(X, Y) then
    begin
      Result := True;
      Break;
    end;
end;

function TMainForm.IsClickedTexts(const X, Y: Integer): Boolean;
var
  I: Integer;
begin
  Result := False;
  for I := 0 to Texts.Size - 1 do
    if Texts.Data[i].IsInside(X, Y) then
    begin
      Result := True;
      Break;
    end;
end;

procedure TMainForm.SetDefaultsElement(Element: TElement);
begin
  Element.SetCanvas(Workspace.Canvas);
  Element.SetWidthHeigth(200, 100);
  Element.Text.Font.Size := 10;
  Element.Text.Caption := 'Cursa4';
  Element.Brush.Color := $c4c4c4;
  Element.Pen.Width := 2;
end;

procedure TMainForm.tlCircleClick(Sender: TObject);
begin
  CurrentTool := Circle;
end;

procedure TMainForm.tlEllipseClick(Sender: TObject);
begin
  CurrentTool := Ellipse;
end;

procedure TMainForm.tlLineClick(Sender: TObject);
begin
  CurrentTool := Line;
end;

procedure TMainForm.tlMouseClick(Sender: TObject);
begin
  CurrentTool := Mouse;
end;

procedure TMainForm.tlRectangleClick(Sender: TObject);
begin
  CurrentTool := Rectangle;
end;

procedure TMainForm.WorkspaceMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
   StatusBar.Panels[1].Text := 'X: ' + IntToStr(X) + ' Y: ' + IntToStr(Y);
end;

procedure TMainForm.WorkspaceMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  case CurrentTool of
    Mouse: ;
    Rectangle: AddRectangle(X, Y);
    Ellipse: AddEllipse(X, Y);
    Circle: AddCircle(X, Y);
  end;
end;

initialization

end.
