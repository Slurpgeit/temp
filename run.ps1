# Fix TLS
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$wc = New-Object System.Net.WebClient

# URLs
$SysInternals = "https://download.sysinternals.com/files/SysinternalsSuite.zip"
$hashcat = "https://github.com/Slurpgeit/temp/raw/master/hashcat-5.1.0.zip"
$Geth = "https://gethstore.blob.core.windows.net/builds/geth-windows-amd64-1.8.26-cdae1c59.exe"

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

$wc.DownloadFile($hashcat,"c:\temp\hashcat.zip")
Unzip -File "c:\temp\hashcat.zip" -Destination "c:\temp"

$wc.DownloadFile($Geth,"c:\temp\geth.exe")
