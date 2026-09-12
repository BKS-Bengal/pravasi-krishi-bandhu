param([string]$Html="document.html",[string]$Pdf="Pravasi-Krishi-Bandhu.pdf",[string]$QaDir="qa")
$ErrorActionPreference="Stop"
$p="E:\krl-pravasi-krishi-bandhu"
$chrome="C:\Program Files\Google\Chrome\Application\chrome.exe"
Get-Process chrome -ErrorAction SilentlyContinue | Where-Object { $_.MainWindowTitle -eq "" } | Stop-Process -Force -ErrorAction SilentlyContinue
$tmp="$env:TEMP\chr-krl-$(Get-Random)"
$a=@("--headless=new","--disable-gpu","--no-sandbox","--no-pdf-header-footer",
     "--user-data-dir=$tmp","--virtual-time-budget=6000",
     "--print-to-pdf=$p\$Pdf","file:///E:/krl-pravasi-krishi-bandhu/$Html")
$proc=Start-Process -FilePath $chrome -ArgumentList $a -PassThru -WindowStyle Hidden
if(-not $proc.WaitForExit(75000)){ $proc.Kill(); throw "chrome timed out" }
Remove-Item $tmp -Recurse -Force -ErrorAction SilentlyContinue
if(-not (Test-Path "$p\$Pdf")){ throw "PDF not created" }
New-Item -ItemType Directory -Force -Path "$p\$QaDir" | Out-Null
Get-ChildItem "$p\$QaDir\*.png" -ErrorAction SilentlyContinue | Remove-Item -Force
python -c "
import fitz
d=fitz.open(r'$p\$Pdf')
print('PAGES:',d.page_count,'SIZE:',round(d[0].rect.width/72*25.4),'x',round(d[0].rect.height/72*25.4),'mm')
for i,pg in enumerate(d): pg.get_pixmap(dpi=96).save(rf'$p\$QaDir\p{i+1:02d}.png')
"
"OK -> $Pdf  ($((Get-Item "$p\$Pdf").Length) bytes)"
