unit UnitUtils;

interface

uses
  Classes, Graphics, Data.DB, uniTreeView, uniGUIAbstractClasses;
function FindRootNode(ACaption: String; ATreeView: TUniTreeView): TUniTreeNode;

type
  TSArray = array of String;
  TIArray = array of Integer;

Procedure LoadBitmapFromBlob(Bitmap: TBitmap; Blob: TBlobField);
procedure DeleteS(var A: TSArray; const Index: Cardinal);
procedure InsertS(var A: TSArray; const Index: Cardinal; const Value: String);

implementation

procedure DeleteS(var A: TSArray; const Index: Cardinal);
var
  ALength: Cardinal;
  TailElements: Cardinal;
begin
  ALength := Length(A);
  Assert(ALength > 0);
  Assert(Index < ALength);
  Finalize(A[Index]);
  TailElements := ALength - Index;
  if TailElements > 0 then
    Move(A[Index + 1], A[Index], SizeOf(String) * TailElements);
  Initialize(A[ALength - 1]);
  SetLength(A, ALength - 1);
end;

procedure InsertS(var A: TSArray; const Index: Cardinal; const Value: String);
var
  ALength: Cardinal;
  TailElements: Cardinal;
begin
  ALength := Length(A);
  Assert(Index <= ALength);
  SetLength(A, ALength + 1);
  Finalize(A[ALength]);
  TailElements := ALength - Index;
  if TailElements > 0 then
  begin
    Move(A[Index], A[Index + 1], SizeOf(String) * TailElements);
    Initialize(A[Index]);
    A[Index] := Value;
  end;
end;

procedure DeleteI(var A: TIArray; const Index: Cardinal);
var
  ALength: Cardinal;
  TailElements: Cardinal;
begin
  ALength := Length(A);
  Assert(ALength > 0);
  Assert(Index < ALength);
  Finalize(A[Index]);
  TailElements := ALength - Index;
  if TailElements > 0 then
    Move(A[Index + 1], A[Index], SizeOf(Integer) * TailElements);
  Initialize(A[ALength - 1]);
  SetLength(A, ALength - 1);
end;

procedure InsertI(var A: TIArray; const Index: Cardinal; const Value: Integer);
var
  ALength: Cardinal;
  TailElements: Cardinal;
begin
  ALength := Length(A);
  Assert(Index <= ALength);
  SetLength(A, ALength + 1);
  Finalize(A[ALength]);
  TailElements := ALength - Index;
  if TailElements > 0 then
  begin
    Move(A[Index], A[Index + 1], SizeOf(Integer) * TailElements);
    Initialize(A[Index]);
    A[Index] := Value;
  end;
end;


Procedure LoadBitmapFromBlob(Bitmap: TBitmap; Blob: TBlobField);
var
  ms: TMemoryStream;
begin
  ms := TMemoryStream.Create;
  try
    Blob.SaveToStream(ms);
    ms.Position := 0;
    Bitmap.LoadFromStream(ms);
  finally
    ms.Free;
  end;
end;

function FindRootNode(ACaption: String; ATreeView: TUniTreeView): TUniTreeNode;
var
  LCount: Integer;
begin
  result := nil;
  LCount := 0;
  while (LCount < ATreeView.Items.Count) and (result = nil) do
  begin
    if (ATreeView.Items.Item[LCount].Text = ACaption) and
      (ATreeView.Items.Item[LCount].Parent = nil) then
      result := ATreeView.Items.Item[LCount];
    inc(LCount);
  end;
end;

end.
