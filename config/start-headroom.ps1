$ErrorActionPreference = "Stop"

# Starts the Headroom proxy in the background and returns its PID.
#
# Usage:
#   powershell -File start-headroom.ps1
#
# Notes:
#   - Listens on port 8787 (`http://127.0.0.1:8787/health`).
#   - Logs go to $env:USERPROFILE\.headroom\
#   - If the proxy is already up on port 8787, this is a no-op.

$logDir = "$env:USERPROFILE\.headroom"
$logFile = "$logDir\headroom.log"
New-Item -ItemType Directory -Force -Path $logDir | Out-Null

$existing = Get-Process -Name "headroom" -ErrorAction SilentlyContinue | Where-Object { $_.MainWindowTitle -eq "" }
if ($existing) {
    $procs = Get-NetTCPConnection -LocalPort 8787 -State Listen -ErrorAction SilentlyContinue
    if ($procs) {
        Write-Host "Headroom proxy already running on port 8787 (PID $($existing.Id))"
        exit 0
    }
}

Write-Host "Starting Headroom proxy on port 8787..."
$proc = Start-Process -FilePath "headroom" `
    -ArgumentList "proxy","--port","8787" `
    -WindowStyle Hidden `
    -RedirectStandardOutput $logFile `
    -RedirectStandardError "$logDir\headroom.err.log" `
    -PassThru

# Wait for the health endpoint (up to 30s)
$deadline = (Get-Date).AddSeconds(30)
$ok = $false
while ((Get-Date) -lt $deadline) {
    Start-Sleep -Milliseconds 500
    try {
        $null = Invoke-RestMethod -Uri "http://127.0.0.1:8787/health" -TimeoutSec 2
        $ok = $true
        break
    } catch {}
    if ($proc.HasExited) { break }
}

if ($ok) {
    Write-Host "[OK] Headroom proxy responding on port 8787 (PID $($proc.Id))"
} else {
    Write-Host "[FAIL] Proxy did not respond. Logs in $logDir"
    if (Test-Path $logFile) { Get-Content $logFile -Tail 20 }
    if (Test-Path "$logDir\headroom.err.log") { Get-Content "$logDir\headroom.err.log" -Tail 20 }
}