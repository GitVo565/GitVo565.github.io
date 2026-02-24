# Extract text from a .docx (Word) file. Usage: .\extract_docx.ps1 "path\to\file.docx"
param([Parameter(Mandatory)]$DocxPath)
$DocxPath = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($DocxPath)
if (-not (Test-Path $DocxPath)) { Write-Error "File not found: $DocxPath"; exit 1 }
Add-Type -AssemblyName System.IO.Compression.FileSystem
$zip = [System.IO.Compression.ZipFile]::OpenRead($DocxPath)
$entry = $zip.Entries | Where-Object { $_.FullName -eq 'word/document.xml' }
if (-not $entry) { Write-Error "word/document.xml not in zip"; $zip.Dispose(); exit 1 }
$stream = $entry.Open()
$reader = New-Object System.IO.StreamReader($stream)
$xmlContent = $reader.ReadToEnd()
$reader.Close(); $stream.Close(); $zip.Dispose()
$doc = [xml]$xmlContent
$ns = New-Object System.Xml.XmlNamespaceManager($doc.NameTable)
$ns.AddNamespace('w', 'http://schemas.openxmlformats.org/wordprocessingml/2006/main')
$nodes = $doc.SelectNodes('//w:t', $ns)
$text = ($nodes | ForEach-Object { $_.InnerText }) -join ''
$text -replace '\s+', "`n" -split "`n" | ForEach-Object { $_.Trim() } | Where-Object { $_ }
