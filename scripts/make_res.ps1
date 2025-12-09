$resname = "game.res"
$rcname = "game.rc"
$windresPath = "E:\fpc-wasm\fpc\bin\x86_64-win64\windres.exe";

if (test-path $resname) {
  remove-item $resname
}

if (!(test-path $rcname)) {
  write-host "Missing $rcname!" -foregroundColor magenta
  exit
}

# use `cat` instead of `type` for Linux systems
$arguments = ($rcname, "--preprocessor=type", "-O", "coff", "-o", $resname)
& $windresPath $arguments
