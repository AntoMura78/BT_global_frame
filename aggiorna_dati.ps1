$ErrorActionPreference = 'Stop'

$projectFolder = Split-Path -Parent $MyInvocation.MyCommand.Path
$csvPath = Join-Path $projectFolder 'data\df_global.csv'
$jsPath = Join-Path $projectFolder 'data\df_global.js'

if (-not (Test-Path -LiteralPath $csvPath)) {
    throw "File non trovato: $csvPath"
}

$stream = New-Object System.IO.FileStream(
    $csvPath,
    [System.IO.FileMode]::Open,
    [System.IO.FileAccess]::Read,
    [System.IO.FileShare]::ReadWrite
)
try {
    $reader = New-Object System.IO.StreamReader($stream, [System.Text.Encoding]::UTF8, $true)
    $csv = $reader.ReadToEnd()
} finally {
    if ($reader) { $reader.Dispose() } else { $stream.Dispose() }
}

if ([string]::IsNullOrWhiteSpace($csv) -or -not $csv.StartsWith('period;correction;')) {
    throw 'Il CSV non sembra valido: deve iniziare con period;correction;'
}

$json = ConvertTo-Json -InputObject $csv -Compress
$javascript = "window.__CSV_DATA__=$json;`n"
$utf8WithoutBom = New-Object System.Text.UTF8Encoding($false)
[System.IO.File]::WriteAllText($jsPath, $javascript, $utf8WithoutBom)

$dataRows = ([regex]::Matches($csv.TrimEnd(), "`n")).Count
Write-Host ''
Write-Host 'Dati locali aggiornati correttamente.' -ForegroundColor Green
Write-Host "Righe dati: $dataRows"
Write-Host "Creato: $jsPath"
Write-Host ''
Write-Host 'Ora ricarica index.html con Ctrl+F5.'
