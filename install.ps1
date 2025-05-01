$jmeterVersion = "5.6.3"
$jmeterUrl = "https://archive.apache.org/dist/jmeter/binaries/apache-jmeter-$jmeterVersion.zip"
$destinationFolder = "C:\Tools\JMeter"

# Check if Java is installed
if (-not (Get-Command java -ErrorAction SilentlyContinue)) {
    Write-Host "Java is not installed. Installing Java..."
    $javaUrl = "https://javadl.oracle.com/webapps/download/AutoDL?BundleId=244058_89d678f2be164f5aa5b2c7c8e1a0e4c8"
    $javaInstaller = "$destinationFolder\java_installer.exe"
    Invoke-WebRequest -Uri $javaUrl -OutFile $javaInstaller
    Start-Process -FilePath $javaInstaller -ArgumentList "/s" -Wait
    Remove-Item -Path $javaInstaller -Force
    Write-Host "Java has been successfully installed."
} else {
    Write-Host "Java is already installed."
}

# Check if Docker is installed
if (-not (Get-Command docker -ErrorAction SilentlyContinue)) {
    Write-Host "Docker is not installed. Installing Docker..."
    $dockerUrl = "https://desktop.docker.com/win/stable/Docker%20Desktop%20Installer.exe"
    $dockerInstaller = "$destinationFolder\docker_installer.exe"
    Invoke-WebRequest -Uri $dockerUrl -OutFile $dockerInstaller
    Start-Process -FilePath $dockerInstaller -ArgumentList "/install" -Wait
    Remove-Item -Path $dockerInstaller -Force
    Write-Host "Docker has been successfully installed."
} else {
    Write-Host "Docker is already installed."
}

# Check if JMeter destination folder exists
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