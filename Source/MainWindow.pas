unit MainWindow;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ExtCtrls, Vcl.StdCtrls,
  Database;

type
  TMainForm = class(TForm)
    Menu: TMainMenu;
    File1: TMenuItem;
    Open1: TMenuItem;
    Save1: TMenuItem;
    Edit1: TMenuItem;
    Help1: TMenuItem;
    About1: TMenuItem;
    Undo1: TMenuItem;
    Toolbar: TPanel;
    AddNodeRectangle: TButton;
    Status: TLabel;
    Workspace: TImage;
    View1: TMenuItem;
    Properties: TPanel;
    AddNodeEllipse: TButton;
    AddNodeCircle: TButton;
    AddLine: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure AddNodeRectangleClick(Sender: TObject);
    procedure WorkspaceMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure WorkspaceMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  TTools = (None, AddNode);

var
  MainForm: TMainForm;
  CurrentTool: TTools;

implementation

{$R *.dfm}

uses
  Vector;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  arElements := TVector<TElement>.Create;
  Workspace.Canvas.Brush.Color := clGreen;
end;

procedure TMainForm.FormPaint(Sender: TObject);
begin
  ToolBar.Refresh;
  ReDraw;
end;

procedure TMainForm.AddNodeRectangleClick(Sender: TObject);
begin
  CurrentTool := AddNode;
end;

procedure TMainForm.WorkspaceMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
  Template: TElement;
begin
  if ssLeft in Shift then
  begin
    Template := TElement.Create(X, Y, 200, 100, shRectangle);
//    Draw(Template);
    MainForm.Status.Caption := 'Drown an element at ' + IntToStr(X) + ' ' + IntToStr(Y);
  end;

end;

procedure TMainForm.WorkspaceMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  Template: TElement;
begin
  Template := TElement.Create(X, Y, 200, 50, shRectangle);
  arElements.PushBack(Template);
  Invalidate;
end;

initialization

end.
