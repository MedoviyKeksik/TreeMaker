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
    miFile: TMenuItem;
    MiOpen: TMenuItem;
    miSave: TMenuItem;
    miEdit: TMenuItem;
    miHelp: TMenuItem;
    miAbout: TMenuItem;
    miUndo: TMenuItem;
    Toolbar: TPanel;
    AddNodeRectangle: TButton;
    Status: TLabel;
    Workspace: TImage;
    miView: TMenuItem;
    Properties: TPanel;
    AddNodeEllipse: TButton;
    AddNodeCircle: TButton;
    AddLine: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  TTools = (None, AddNode);

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

uses
  Vector;

procedure TMainForm.FormCreate(Sender: TObject);
var
  Element1, Element2: TElement;
  Line: TLine;
begin
  // Some
  Element1 := TElement.Create;
  Element1.SetCanvas(Workspace.Canvas);
  Element1.SetPosition(10, 10);
  Element1.SetWidthHeigth(200, 100);
  Element1.Text.Font.Size := 30;
  Element1.Text.Caption := 'Cursa4';
  Element1.Brush.Color := $c4c4c4;
  Element1.Pen.Width := 5;


  Element2 := TElement.Create;
  Element2.SetCanvas(Workspace.Canvas);
  Element2.SetPosition(200, 300);
  Element2.SetWidthHeigth(200, 100);
  Element2.Text.Font.Size := 30;
  Element2.Text.Caption := 'Bored';
  Element2.Brush.Color := $c4c4c4;
  Element2.Pen.Width := 5;

  Line := TLine.Create;
  Line.SetCanvas(Workspace.Canvas);
  Line.Start.BindToElement := True;
  Line.Start.Element := Element1;
  Line.Pen.Width := 3;
  Line.Finish.BindToElement := True;
  Line.Finish.Element := Element2;
  Line.Text.Font.Size := 13;

  Line.Draw;
  Element1.Draw;
  Element2.Draw;
end;

procedure TMainForm.FormPaint(Sender: TObject);
begin
  ToolBar.Refresh;
end;

initialization

end.
