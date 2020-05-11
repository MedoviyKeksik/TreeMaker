unit MainWindow;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ExtCtrls, Vcl.StdCtrls,
  Database, Vcl.ToolWin, Vcl.ComCtrls, System.Actions, Vcl.ActnList,
  Vcl.StdActns, System.ImageList, Vcl.ImgList, Vector, Vcl.ActnMan,
  Vcl.ActnColorMaps;

type
  TTools = (toolMouse, toolRectangle, toolEllipse, toolCircle, toolLine, toolText);

  TPanels = (tplNone, tplRectangle, tplEllipse, tplCircle, tplLine, tplText);

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
    miView: TMenuItem;
    Properties: TPanel;
    StatusBar: TStatusBar;
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
    MainProperties: TPanel;
    lblPosition: TLabel;
    edtX: TEdit;
    lblX: TLabel;
    lblY: TLabel;
    edtY: TEdit;
    ScrollBox: TScrollBox;
    Workspace: TImage;
    WorkSpacePanel: TPanel;
    ScrollBoxProperties: TScrollBox;
    lblWidth: TLabel;
    edtWidth: TEdit;
    lblHeigth: TLabel;
    edtHeigth: TEdit;
    TextProperties: TPanel;
    FontDialog: TFontDialog;
    lblFont: TLabel;
    btnFont: TButton;
    BorderPanel: TPanel;
    lblBorder: TLabel;
    lblColor: TLabel;
    lblBorderWidth: TLabel;
    ColorDialog: TColorDialog;
    BackGroundPanel: TPanel;
    lblBackground: TLabel;
    btnBackgroundColor: TButton;
    lblBackgroundColor: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure toolButtonClick(Sender: TObject);
    procedure WorkspaceMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure WorkspaceMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure WorkspaceMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure EditSelectAllExecute(Sender: TObject);
  private
    CurrentTool: TTools;
    CurrentPanel: TPanels;
    StartPoint, FinishPoint, Delta: TPoint;
    IsSelectedClickedElement: Boolean;
    Elements: TVector<TElement>;
    Texts: TVector<TText>;
    Lines: TVector<TLine>;
    function IsClickedAll(const X, Y: Integer): Boolean;
    function IsClickedElements(const X, Y: Integer): Boolean;
    function IsClickedLines(const X, Y: Integer): Boolean;
    function IsClickedTexts(const X, Y: Integer): Boolean;
    procedure SetDefaultsElement(Element: TElement);
    procedure AddRectangle(const X, Y: Integer);
    procedure AddEllipse(const X, Y: Integer);
    procedure AddCircle(const X, Y: Integer);
    procedure AddText(const X, Y: Integer);
    procedure SelectAll;
    procedure DeselectAll;
    procedure ReDraw;
    procedure ShowPanel;
    procedure ClearWorkspace;
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

procedure ElementOnMove(Sender: TObject; const X, Y: Integer);
var
  Tmp: TElement;
begin
  Tmp := TElement.Create(Sender as TElement);
  Tmp.SetPosition(Tmp.Left + X, Tmp.Top + Y);
  Tmp.Draw;
  Tmp.Free;
end;

procedure TMainForm.AddCircle(const X, Y: Integer);
var
  Element: TElement;
begin
  DeselectAll;
  Element := TElement.Create;
  Element.Shape := stCircle;
  SetDefaultsElement(Element);
  Element.SetSize(100, 100);
  Element.SetPosition(X - Element.Width shr 1, Y - Element.Heigth shr 1);
  Element.Draw;
  Elements.PushBack(Element);
end;

procedure TMainForm.AddEllipse(const X, Y: Integer);
var
  Element: TElement;
begin
  DeselectAll;
  Element := TElement.Create;
  Element.Shape := stEllipse;
  SetDefaultsElement(Element);
  Element.SetPosition(X - Element.Width shr 1, Y - Element.Heigth shr 1);
  Element.Draw;
  Elements.PushBack(Element);
end;

procedure TMainForm.AddRectangle(const X, Y: Integer);
var
  Element: TElement;
begin
  DeselectAll;
  StatusBar.Panels[0].Text := 'Element Created';
  Element := TElement.Create;
  Element.Shape := stRectangle;
  SetDefaultsElement(Element);
  Element.SetPosition(X - Element.Width shr 1, Y - Element.Heigth shr 1);
  Element.Draw;
  Elements.PushBack(Element);
end;

procedure TMainForm.SetDefaultsElement(Element: TElement);
begin
  Element.Canvas := Workspace.Canvas;
  Element.SetSize(200, 100);
  Element.Font.Size := 10;
  Element.Caption := 'Cursa4';
  Element.Brush.Color := $C4C4C4;
  Element.Pen.Width := 2;
  Element.Selected := True;
  Element.OnMove := ElementOnMove;
end;

procedure TMainForm.AddText(const X, Y: Integer);
var
  Tmp: TText;
begin
  Tmp := TText.Create;
  Tmp.SetPosition(X, Y);
  Tmp.SetSize(200, 100);
  Tmp.Canvas := Workspace.Canvas;
  StatusBar.Panels[0].Text := 'Called AddTEXT';
  Tmp.Caption := 'Some text';
  Texts.PushBack(Tmp);
end;

procedure TMainForm.ClearWorkspace;
begin
  Workspace.Canvas.Brush.Style := bsSolid;
  Workspace.Canvas.Brush.Color := clWhite;
  Workspace.Canvas.FillRect(TRect.Create(0, 0, Workspace.Width,
    Workspace.Height));
end;

procedure TMainForm.DeselectAll;
var
  I: Integer;
begin
  for I := 0 to Elements.Size - 1 do
    Elements.At[I].Selected := False;
  for I := 0 to Lines.Size - 1 do
    Lines.At[I].Selected := False;
  for I := 0 to Texts.Size - 1 do
    Texts.At[I].Selected := False;
end;

procedure TMainForm.EditSelectAllExecute(Sender: TObject);
begin
  SelectAll;
  ClearWorkspace;
  ReDraw;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  CurrentTool := toolMouse;
  CurrentPanel := tplNone;
  ShowPanel;
  Elements := TVector<TElement>.Create;
  Texts := TVector<TText>.Create;
  Lines := TVector<TLine>.Create;
  ClearWorkspace;
end;


function TMainForm.IsClickedAll(const X, Y: Integer): Boolean;
begin
  Result := IsClickedLines(X, Y) or IsClickedTexts(X, Y) or
    IsClickedElements(X, Y);
end;

function TMainForm.IsClickedElements(const X, Y: Integer): Boolean;
var
  I: Integer;
begin
  Result := False;
  for I := 0 to Elements.Size - 1 do
    if Elements.At[I].IsInside(X, Y) then
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
    if Lines.At[I].IsInside(X, Y) then
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
    if Texts.At[I].IsInside(X, Y) then
    begin
      Result := True;
      Break;
    end;
end;

procedure TMainForm.ReDraw;
var
  I: Integer;
begin
  for I := 0 to Lines.Size - 1 do
    Lines.At[I].Draw;
  for I := 0 to Elements.Size - 1 do
    Elements.At[I].Draw;
  for I := 0 to Texts.Size - 1 do
    Texts.At[I].Draw;
end;

procedure TMainForm.SelectAll;
var
  I: Integer;
begin
  for I := 0 to Elements.Size - 1 do
    Elements.At[I].Selected := True;;
  for I := 0 to Lines.Size - 1 do
    Lines.At[I].Selected := True;
  for I := 0 to Texts.Size - 1 do
    Texts.At[I].Selected := True;
end;

procedure TMainForm.ShowPanel;
begin
  MainProperties.Visible := False;
  case CurrentPanel of
    tplNone:
      Properties.Visible := False;
    tplRectangle:
      begin
        Properties.Visible := True;
        MainProperties.Visible := True;
      end;
    tplEllipse:
      begin
      end;
    tplCircle:
      begin
      end;
    tplLine:
      begin
      end;
    tplText:
      begin
      end;
  end;
end;

procedure TMainForm.toolButtonClick(Sender: TObject);
begin
  CurrentTool := TTools((Sender as TToolButton).Tag);
end;

procedure TMainForm.WorkspaceMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  I: Integer;
begin

  if Button = mbLeft then
  begin
    StartPoint.Create(X, Y);
    for I := Elements.Size - 1 downto 0 do
    begin
      if Elements.At[I].IsInside(X, Y) then
      begin
        IsSelectedClickedElement := Elements.At[I].Selected;
        Elements.At[I].Selected := True;
        Break;
      end;
    end;
  end;
  ClearWorkspace;
  ReDraw;
end;

procedure TMainForm.WorkspaceMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
var
  I: Integer;
begin
  StatusBar.Panels[1].Text := 'X: ' + IntToStr(X) + ' Y: ' + IntToStr(Y);
  if (CurrentTool = toolMouse) and (ssLeft in Shift) then
  begin
    ClearWorkspace;
    ReDraw;
    for I := Elements.Size - 1 downto 0 do
    begin
      if Elements.At[I].Selected then
        Elements.At[I].OnMove(Elements.At[I], X - StartPoint.X,
          Y - StartPoint.Y);
    end;
  end;
end;

procedure TMainForm.WorkspaceMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  I: Integer;
  IsAny: Boolean;
begin
  case CurrentTool of
    toolMouse:
      begin
        if (Button = mbLeft) then
        begin
          if (StartPoint.X = X) and (StartPoint.Y = Y) then
          begin
            IsAny := False;
            if not (ssCtrl in Shift) then 
              DeselectAll;
            for I := Elements.Size - 1 downto 0 do
            begin
              if Elements.At[I].IsInside(X, Y) then
              begin
                IsAny := True;
                Elements.At[I].Selected := not Elements.At[I].Selected;
                Break;
              end;
            end;
            if (ssCtrl in Shift) and (not IsAny) then
              DeselectAll;
          end
          else 
          begin
            for I := Elements.Size - 1 downto 0 do
              if Elements.At[I].Selected then
                Elements.At[I].Move(X - StartPoint.X, Y - StartPoint.Y);
          end;
        end;
      end;
    toolRectangle:
      AddRectangle(X, Y);
    toolEllipse:
      AddEllipse(X, Y);
    toolCircle:
      AddCircle(X, Y);
    toolText:
      AddText(X, Y);
  end;

  ClearWorkspace;
  ReDraw;
end;

initialization

end.
