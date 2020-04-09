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
    Solution: TButton;
    Status: TLabel;
    Workspace: TImage;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;
  Template: TElement;

implementation

{$R *.dfm}

uses
  Vector;
//
procedure TMainForm.FormCreate(Sender: TObject);
begin
  arElements := TVector<TElement>.Create;
  Template := TElement.Create;
  Template.Pos.x := 100;
  Template.Pos.y := 200;
  arElements.PushBack(Template);
  Workspace.Canvas.Brush.Color := clGreen;
  ReDraw;
end;

initialization


end.
