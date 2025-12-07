unit Timing;

{$Mode TP}

interface

var
  dt, lastFrameTime, currentTime: double;

{$ifdef WASM}
function getTimer: double; external 'env' name 'getTimer';
function getFullTimer: double; external 'env' name 'getFullTimer';
{$endif}
{$ifdef WIN64}
function getTimer: double;
function getFullTimer: double;
{$endif}

procedure initDeltaTime;
procedure updateDeltaTime;


implementation

procedure initDeltaTime;
begin
  dt := 0.0;
  lastFrameTime := getTimer;
  currentTime := lastFrameTime;
end;

procedure updateDeltaTime;
begin
  currentTime := getTimer;
  dt := currentTime - lastFrameTime;
  lastFrameTime := currentTime
end;


{$ifdef WIN64}
var
  perfFrequency: int64;
  startCounter: int64;

function getTimer: double;
var
  now: int64;
begin
  now := SDL_GetPerformanceCounter;
  getTimer := (now - startCounter) / perfFrequency
end;

function getFullTimer: double;
begin
  getFullTimer := SDL_GetPerformanceCounter / perfFrequency
end;
{$endif}


end.