$JMeterHome = "C:\Tools\JMeter\apache-jmeter-5.6.3"
$env:Path = "$JMeterHome\bin;$env:Path"
$TestPlan = Join-Path -Path $PSScriptRoot -ChildPath "example.jmx"
$ResultsFile = Join-Path -Path $PSScriptRoot -ChildPath "results.jtl"

Write-Host "Running JMeter test..."
jmeter -n -t $TestPlan -l $ResultsFile
Write-Host "JMeter test completed. Results saved to $ResultsFile."