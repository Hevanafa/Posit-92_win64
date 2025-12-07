unit SDL2Wrapper;

{$Mode TP}

interface

const 
  SDL_INIT_VIDEO = $00000020;
  SDL_WINDOWPOS_CENTERED = $2FFF0000;
  SDL_WINDOW_SHOWN = $00000004;

type
  PSDL_Window = pointer;
  PSDL_Renderer = pointer;

function SDL_Init(const flags: longword): longint; cdecl; external 'SDL2.dll';
function SDL_CreateWindow(const title: PChar; const x, y, w, h: longint; const flags: longword); cdecl; external 'SDL2.dll';
function SDL_CreateRenderer(const window: PSDL_Window; const index: longint; const flags: longword); cdecl; external 'SDL2.dll';
procedure SDL_DestroyRenderer(const renderer: PSDL_Renderer); cdecl; external 'SDL2.dll';
procedure SDL_DestroyWindow(const window: PSDL_Window); cdecl; external 'SDL2.dll';
procedure SDL_Quit; cdecl; external 'SDL2.dll';
procedure SDL_Delay(const ms: longword); cdecl; external 'SDL2.dll';

implementation

end.