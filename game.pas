{ Entry point }

uses
  Posit92;

{$Mode TP}

type
  TGame = object(TPosit92)
  end;

var
  game: TGame;

begin
  game.init
end.

