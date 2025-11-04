param([Parameter(Mandatory=$true)][string]$Url,[string]$Expect='',[int]$Retries=5,[int]$DelaySec=5)
$ok=$false
for($i=1;$i -le $Retries;$i++){
  try{$r=Invoke-WebRequest -Uri $Url -UseBasicParsing -TimeoutSec 10;$status=($r.StatusCode -eq 200);$content=($Expect -eq '' -or ($r.Content -match [regex]::Escape($Expect)));if($status -and $content){$ok=true;break}}catch{}
  Start-Sleep -Seconds $DelaySec
}
if(-not $ok){throw "Health check failed: $Url"}
