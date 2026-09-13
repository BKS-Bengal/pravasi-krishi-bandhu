param(
  [string]$Html  = "document.html",
  [string]$Pdf   = "Pravasi-Krishi-Bandhu.pdf",
  [string]$QaDir = "qa",
  [switch]$ShowChromeLog     # pass -ShowChromeLog to print Chrome's stderr for debugging
)
$ErrorActionPreference = "Stop"

$p      = "E:\krl-pravasi-krishi-bandhu"
$chrome = "C:\Program Files\Google\Chrome\Application\chrome.exe"

# Kill only headless leftovers (no main window), never the user's real Chrome
Get-Process chrome -ErrorAction SilentlyContinue |
  Where-Object { $_.MainWindowTitle -eq "" } |
  Stop-Process -Force -ErrorAction SilentlyContinue

$tmp    = Join-Path $env:TEMP "chr-krl-$(Get-Random)"
$outLog = Join-Path $env:TEMP "chr-out-$(Get-Random).log"
$errLog = Join-Path $env:TEMP "chr-err-$(Get-Random).log"

# --disable-default-apps + --no-first-run kill the mail.google.com installwebapp error.
# --log-level=3 and --disable-logging silence the GPU / video-device warnings.
# Chrome still writes "N bytes written to file" to stderr, so stderr is redirected regardless.
$chromeArgs = @(
  "--headless=new"
  "--disable-gpu"
  "--no-sandbox"
  "--no-first-run"
  "--no-default-browser-check"
  "--disable-default-apps"
  "--disable-extensions"
  "--disable-logging"
  "--log-level=3"
  "--mute-audio"
  "--no-pdf-header-footer"
  "--user-data-dir=$tmp"
  "--virtual-time-budget=6000"
  "--print-to-pdf=$p\$Pdf"
  "file:///E:/krl-pravasi-krishi-bandhu/$Html"
)

try {
  # RedirectStandardOutput/Error is what actually stops Chrome writing to the console.
  $proc = Start-Process -FilePath $chrome -ArgumentList $chromeArgs -PassThru `
            -WindowStyle Hidden -RedirectStandardOutput $outLog -RedirectStandardError $errLog
  if (-not $proc.WaitForExit(75000)) { $proc.Kill(); throw "chrome timed out after 75s" }

  if ($ShowChromeLog -and (Test-Path $errLog)) {
    "--- chrome stderr ---"; Get-Content $errLog | Select-Object -First 40
  }
  if (-not (Test-Path "$p\$Pdf")) {
    "--- chrome stderr ---"; Get-Content $errLog -ErrorAction SilentlyContinue | Select-Object -First 20
    throw "PDF not created: $Pdf"
  }
}
finally {
  Remove-Item $tmp, $outLog, $errLog -Recurse -Force -ErrorAction SilentlyContinue
}

New-Item -ItemType Directory -Force -Path "$p\$QaDir" | Out-Null
Get-ChildItem "$p\$QaDir\*.png" -ErrorAction SilentlyContinue | Remove-Item -Force

python -c @"
import fitz
d = fitz.open(r'$p\$Pdf')
print('PAGES:', d.page_count, '| SIZE:', round(d[0].rect.width/72*25.4), 'x', round(d[0].rect.height/72*25.4), 'mm')
for i, pg in enumerate(d):
    pg.get_pixmap(dpi=96).save(rf'$p\$QaDir\p{i+1:02d}.png')
"@

"OK -> $Pdf  ($((Get-Item "$p\$Pdf").Length) bytes)"
