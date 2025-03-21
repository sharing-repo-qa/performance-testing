$jmeterVersion = "5.6.3" 
$jmeterUrl = "https://archive.apache.org/dist/jmeter/binaries/apache-jmeter-$jmeterVersion.zip"
$destinationFolder = "C:\Tools\JMeter"

if (!(Test-Path -Path $destinationFolder)) {
   New-Item -ItemType Directory -Path $destinationFolder
}
$zipPath = "$destinationFolder\apache-jmeter-$jmeterVersion.zip"

Write-Host "Downloading JMeter version $jmeterVersion..."
Invoke-WebRequest -Uri $jmeterUrl -OutFile $zipPath
Write-Host "Extracting JMeter..."
Expand-Archive -Path $zipPath -DestinationPath $destinationFolder -Force
Remove-Item -Path $zipPath -Force
Write-Host "JMeter has been successfully installed at $destinationFolder\apache-jmeter-$jmeterVersion"