program TreeMaker;

uses
  Vcl.Forms,
  MainWindow in 'MainWindow.pas' {,
  ComplementedCanvas in 'ComplementedCanvas.pas',
  Database in 'Database.pas',
  Vector in 'Vector.pas';

{$R *.res},
  Database in 'Database.pas',
  Vector in 'Vector.pas',
  uModalResolution in 'uModalResolution.pas' {formResolution},
  uAbout in 'uAbout.pas' {frmAbout};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Icon.LoadFromFile('TreeMaker.ico');
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TformResolution, formResolution);
  Application.CreateForm(TfrmAbout, frmAbout);
  Application.Run;
end.
