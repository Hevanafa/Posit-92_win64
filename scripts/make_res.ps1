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
# E:\fpc-wasm\fpc\bin\x86_64-win64\windres.exe --preprocessor=type -O coff --input=game.rc --output=game.res
$arguments = ("--preprocessor=type", "-O", "coff", "--input=$rcname", "--output=$resname")
& $windresPath $arguments
