{ Entry point }

{$Mode TP}

uses
  Posit92;

type
  TGame = object(TPosit92)
  public
    procedure loadAssets;
  end;

procedure TGame.loadAssets;
begin
  { Load more assets here }
end;


var
  game: TGame;

begin
  game.init;
  game.draw;
  { TODO: Add the rest of the method calls }
  readln;
  game.cleanup;
end.
