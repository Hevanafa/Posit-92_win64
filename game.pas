{ Entry point }

{$Mode TP}

uses
  Posit92;

type
  TGame = object(TPosit92)
  public
    procedure loadAssets;
  private
    done: boolean;

    procedure init;
    procedure afterInit;
    procedure cleanup;
    procedure update;
    procedure draw;
  end;

procedure TGame.loadAssets;
begin
  { Load more assets here }
end;

procedure TGame.init;
begin
  inherited init;

  initBuffer;
end;

procedure TGame.afterInit;
begin
  loadAssets
end;

procedure TGame.cleanup;
begin
  inherited cleanup;


end;

procedure TGame.update;
begin

end;

procedure TGame.draw;
begin

end;


var
  game: TGame;
  done: boolean;

begin
  game.init;
  game.afterInit;

  game.draw;
  { TODO: Add the rest of the method calls }
  readln;
  game.cleanup;
end.
