program TreeMaker;

uses
  Vcl.Forms,
  MainWindow in 'MainWindow.pas',
  ComplementedCanvas in 'ComplementedCanvas.pas',
  Database in 'Database.pas',
  Vector in 'Vector.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
