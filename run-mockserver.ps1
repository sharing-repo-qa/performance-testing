# Define variables
$ContainerName = "mockserver"
$Port = 1080
$InitializerPath = "${PWD}/mockserver_initializer.json" # Use ${} for better clarity with path manipulation
# Ensure the initializer file exists
if (!(Test-Path -Path $InitializerPath)) {
   Write-Host "Error: MockServer initializer file '${InitializerPath}' not found!" -ForegroundColor Red
   exit 1
}
# Check if the container is already running
$RunningContainer = docker ps -q -f "name=${ContainerName}"
if ($RunningContainer) {
   Write-Host "MockServer container is already running." -ForegroundColor Yellow
   exit 0
}
# Run the MockServer container
Write-Host "Starting MockServer container..." -ForegroundColor Green
docker run --rm -d --name ${ContainerName} -p ${Port}:1080 -v ${InitializerPath}:/config/mockserver_initializer.json mockserver/mockserver:latest
# Verify if the container started successfully
Start-Sleep -Seconds 3
$RunningContainer = docker ps -q -f "name=${ContainerName}"
if ($RunningContainer) {
   Write-Host "MockServer is now running at http://localhost:${Port}" -ForegroundColor Green
} else {
   Write-Host "Error: Failed to start MockServer container." -ForegroundColor Red
}