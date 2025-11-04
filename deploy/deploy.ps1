param([Parameter(Mandatory=$true)][string]$ZipPath,[Parameter(Mandatory=$true)][string]$Destination,[string]$AppPool='')
$ErrorActionPreference='Stop'
if(!(Test-Path $ZipPath)){throw "Zip not found: $ZipPath"}
New-Item -ItemType Directory -Force -Path $Destination|Out-Null
Expand-Archive -LiteralPath $ZipPath -DestinationPath $Destination -Force
if($AppPool){try{Import-Module WebAdministration -ErrorAction Stop;Restart-WebAppPool $AppPool}catch{Write-Warning $_.Exception.Message}}
