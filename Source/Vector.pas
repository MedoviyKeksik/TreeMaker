unit Vector;

interface

type
  TVector<T> = class
  private type
    TDynArray = array of T;
  var
    DataSize: Integer;
    ReservedSize: Integer;
  public
    Data: TDynArray;
    constructor Create;
    destructor Destroy;
    function Front: T;
    function Back: T;
    function Size: Integer;
    function Empty: Boolean;
    procedure Clear;
    procedure Reserve(const X: Integer);
    procedure PushBack(const X: T);
    procedure Erase(const Id: Integer);
  end;

implementation

{ TVector<T> }

function TVector<T>.Back: T;
begin
  Result := Data[DataSize - 1];
end;

procedure TVector<T>.Clear;
begin
  DataSize := 0;
  ReservedSize := 1;
  SetLength(Data, ReservedSize);
end;

constructor TVector<T>.Create;
begin
  DataSize := 0;
  ReservedSize := 1;
  SetLength(Data, ReservedSize);
end;

destructor TVector<T>.Destroy;
begin
  ReservedSize := 0;
  SetLength(Data, ReservedSize);
  inherited;
end;

function TVector<T>.Empty: Boolean;
begin
  Result := DataSize = 0;
end;

procedure TVector<T>.Erase(const Id: Integer);
var
  I: Integer;
begin
  Dec(DataSize);
  for I := Id to DataSize - 1 do
    Data[I] := Data[I + 1];
end;

function TVector<T>.Front: T;
begin
  Result := Data[0];
end;

procedure TVector<T>.PushBack(const X: T);
begin
  if DataSize = ReservedSize then
  begin
    ReservedSize := ReservedSize shl 1;
    SetLength(Data, ReservedSize);
  end;
  Data[DataSize] := X;
  Inc(DataSize);
end;

procedure TVector<T>.Reserve(const X: Integer);
begin
  ReservedSize := X;
  SetLength(Data, ReservedSize);
end;

function TVector<T>.Size: Integer;
begin
  Result := DataSize;
end;

end.
