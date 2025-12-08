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
procedure initTiming;
function getTimer: double;
function getFullTimer: double;
{$endif}

procedure initDeltaTime;
procedure updateDeltaTime;


implementation

{$ifdef WIN64}
uses SDL2Wrapper, SysUtils;

{ type
  TDateTime = record
    year, month, day: word;
    hour, minute, second, msec: word;
  end;
}
{$endif}

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
  timingInitialised: boolean;
  perfFrequency: int64;
  startCounter: int64;
  midnightOffset: double;
  epochStart: TDateTime;

procedure initTiming;
begin
  perfFrequency := SDL_GetPerformanceFrequency;
  startCounter := SDL_GetPerformanceCounter;

  epochStart := EncodeDate(1970, 1, 1);

  timingInitialised := true
end;

function getTimer: double;
var
  now: int64;
begin
  { TODO: Update with midnight offset }
  if not timingInitialised then initTiming;
  now := SDL_GetPerformanceCounter;
  getTimer := (now - startCounter) / perfFrequency
end;

{ Return the time in seconds since epoch }
function getFullTimer: double;
var
  secondsSinceEpoch: double;
begin
  if not timingInitialised then initTiming;

  secondsSinceEpoch := (now - epochStart) * 86400.0;
  getFullTimer := secondsSinceEpoch
end;
{$endif}


end.