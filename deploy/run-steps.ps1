param([string]$StepsDir="$(Build.SourcesDirectory)\steps",[string]$LogsDir="$(Pipeline.Workspace)\logs",[string]$ZipPath="",[string]$DeployPath="",[string]$AppPool="")
$ErrorActionPreference='Stop'
New-Item -ItemType Directory -Force -Path $LogsDir|Out-Null
$env:ZIP_PATH=$ZipPath;$env:DEPLOY_PATH=$DeployPath;$env:APP_POOL=$AppPool
$steps=Get-ChildItem -Path $StepsDir -Filter '*.ps1'|Sort-Object Name
if(-not $steps){throw "No step scripts in $StepsDir"}
foreach($s in $steps){Write-Host ">>> RUN $($s.Name)";& $s.FullName}
Write-Host "All step scripts completed."
