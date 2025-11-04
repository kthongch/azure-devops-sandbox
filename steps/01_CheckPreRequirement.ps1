$ErrorActionPreference='Stop'
if(-not(Test-Path $env:ZIP_PATH)){throw "ZIP not found: $env:ZIP_PATH"}
if(-not(Test-Path $env:DEPLOY_PATH)){New-Item -ItemType Directory -Force -Path $env:DEPLOY_PATH|Out-Null}
