unit uModalResolution;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Samples.Spin;

type
  TformResolution = class(TForm)
    spinWidth: TSpinEdit;
    spinHeigth: TSpinEdit;
    lblHeader: TLabel;
    lblWidth: TLabel;
    lblHeigth: TLabel;
    btnOk: TButton;
    btnCancel: TButton;
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    function GetHeight: Integer;
    function GetWidth: Integer;
  public
    property Width: Integer read GetWidth;
    property Heigth: Integer read GetHeight;
    function ChangeResolution(const AWidth, AHeight: Integer): TModalResult;
  end;

var
  formResolution: TformResolution;

implementation

{$R *.dfm}

procedure TformResolution.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TformResolution.btnOkClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

function TformResolution.ChangeResolution(const AWidth,
  AHeight: Integer): TModalResult;
begin
  spinWidth.Value := AWidth;
  spinHeigth.Value := AHeight;
  Result := ShowModal;
end;

function TformResolution.GetHeight: Integer;
begin
  Result := spinHeigth.Value;
end;

function TformResolution.GetWidth: Integer;
begin
  Result := spinWidth.Value;
end;

end.
