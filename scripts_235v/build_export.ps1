# Excalibur Export - Static Build Script (Located in scripts_235v)
$outputFile = "../excalibur_export_static_9mL4x.html" # Outputs to root for GitHub Pages
$dynamicFile = "../excalibur_export_9mL4x.html" # Also update dynamic version
$rootDir = ".." # Parent directory (repo root)

# Files to exclude from export (export files themselves, login page, etc.)
$excludeFiles = @(
    "excalibur_export_9mL4x.html",
    "excalibur_export_static_9mL4x.html",
    "index.html" # Login page, not needed in export
)

# Function to extract page title from HTML
function Get-PageTitle {
    param([string]$filePath)
    
    if (-not (Test-Path $filePath)) {
        return $null
    }
    
    $content = Get-Content $filePath -Raw -ErrorAction SilentlyContinue
    if ($content -match '<title>(.*?)</title>') {
        $title = $Matches[1]
        # Remove version suffix if present (e.g., " · v001")
        $title = $title -replace '\s·\s*v\d{3,}', ''
        $title = $title -replace '\s·\s*v[a-z]{3,}', ''
        return $title.Trim()
    }
    
    # Fallback: use filename without extension
    return [System.IO.Path]::GetFileNameWithoutExtension($filePath)
}

# Scan for all HTML files recursively
Write-Host "Scanning for HTML files..." -ForegroundColor Cyan
$rootPath = (Resolve-Path $rootDir).Path
$allHtmlFiles = Get-ChildItem -Path $rootDir -Filter "*.html" -Recurse -File | Where-Object {
    $fileName = $_.Name
    $relativePath = $_.FullName.Replace($rootPath + '\', '').Replace('\', '/')
    $notExcluded = -not ($excludeFiles -contains $fileName)
    $notInScripts = -not ($relativePath -like "scripts_235v/*")
    return ($notExcluded -and $notInScripts)
} | Sort-Object {
    $content = Get-Content $_.FullName -Raw -ErrorAction SilentlyContinue
    if ($content -match 'title>00W(\d+)') {
        [int]$Matches[1]
    } else {
        9999
    }
}

$pages = @()
foreach ($file in $allHtmlFiles) {
    $relativePath = $file.FullName.Replace((Resolve-Path $rootDir).Path + '\', '').Replace('\', '/')
    $relativePath = "../" + $relativePath
    $title = Get-PageTitle -filePath $file.FullName
    
    $pages += @{
        Path = $relativePath
        FullPath = $file.FullName
        Title = $title
        Name = $file.Name
    }
}

Write-Host "Found $($pages.Count) HTML files to include" -ForegroundColor Green

# Version Check & Auto-Increment Function
function Increment-Version {
    param([string]$currentVersion)
    
    # Remove 'v' prefix if present and trim whitespace
    $version = ($currentVersion -replace '^v', '').Trim()
    
    if ($version.Length -ne 3) { return "v001" }
    
    $chars = $version.ToCharArray()
    # Ensure this array is explicitly strings
    $allChars = @('0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z')
    
    $carry = $true
    for ($i = 2; $i -ge 0 -and $carry; $i--) {
        # Force the current char to a string for the IndexOf lookup
        $currentCharStr = [string]$chars[$i]
        $index = [array]::IndexOf($allChars, $currentCharStr)
        
        if ($index -eq -1) {
            Write-Host "  Debug: Fixed character '$currentCharStr' at position $i" -ForegroundColor Yellow
            $chars[$i] = '0'
            $carry = $true
        } elseif ($index -eq $allChars.Count - 1) {
            $chars[$i] = '0'
            $carry = $true
        } else {
            $chars[$i] = $allChars[$index + 1]
            $carry = $false
        }
    }
    return "v" + ($chars -join '')
}

# Check for existing static export and extract current version
$currentVersion = "v000"
if (Test-Path $outputFile) {
    $existingContent = Get-Content $outputFile -Raw -ErrorAction SilentlyContinue
    # Try multiple regex patterns to catch different title formats
    if ($existingContent -match 'title>00W41[^<]*[·•]\s*v(\d{3}|[a-z]{3})') {
        $extractedVersion = $Matches[1]
        $currentVersion = "v" + $extractedVersion.Trim()
        Write-Host "Found existing version: $currentVersion" -ForegroundColor Cyan
    } elseif ($existingContent -match '<title>00W41[^<]*v(\d{3}|[a-z]{3})') {
        $extractedVersion = $Matches[1]
        $currentVersion = "v" + $extractedVersion.Trim()
        Write-Host "Found existing version: $currentVersion" -ForegroundColor Cyan
    } else {
        Write-Host "Could not extract version from existing file, starting at v000" -ForegroundColor Yellow
    }
} else {
    Write-Host "No existing export found, starting at v000" -ForegroundColor Cyan
}

# Increment version
$newVersion = Increment-Version -currentVersion $currentVersion
Write-Host "Incrementing to: $newVersion" -ForegroundColor Green

# Update dynamic export file version if it exists
if (Test-Path $dynamicFile) {
    $dynamicContent = Get-Content $dynamicFile -Raw -ErrorAction SilentlyContinue
    if ($dynamicContent) {
        # Update version in dynamic file title
        $dynamicContent = $dynamicContent -replace '(title>00W41[^<]*·\s*)v\d{3}', "`$1$newVersion"
        $dynamicContent = $dynamicContent -replace '(title>00W41[^<]*·\s*)v[a-z]{3}', "`$1$newVersion"
        Set-Content -Path $dynamicFile -Value $dynamicContent -Encoding UTF8 -NoNewline
        Write-Host "Updated dynamic export version to $newVersion" -ForegroundColor Green
    }
}

$header = @"
<!DOCTYPE html>
<html>
<head>
    <title>00W41 — Excalibur Export · $newVersion</title>
    <meta name="robots" content="noindex, nofollow">
    <style>
        body { font-family: sans-serif; line-height: 1.6; padding: 40px; color: #333; max-width: 900px; margin: auto; }
        .page-break { page-break-after: always; border-bottom: 2px solid #eee; margin-bottom: 50px; padding-bottom: 20px; }
        h1 { color: #2c3e50; border-bottom: 2px solid #2c3e50; }
        h2 { color: #2980b9; margin-top: 30px; }
        nav, script, video, .back-button { display: none !important; } /* Hide interactive elements for clean PDF/LM import */
    </style>
</head>
<body>
    <h1>Excalibur Protocol Library - Static Export</h1>
    <p>Generated: $(Get-Date -Format "yyyy-MM-dd HH:mm")</p>
"@

$header | Out-File -FilePath $outputFile -Encoding utf8

$processedCount = 0
foreach ($pageInfo in $pages) {
    $pagePath = $pageInfo.FullPath
    $pageTitle = $pageInfo.Title
    $pageName = $pageInfo.Name
    
    if (Test-Path $pagePath) {
        Write-Host "Processing: $pageName" -ForegroundColor Cyan
        $content = Get-Content $pagePath -Raw -Encoding UTF8
        
        # Extract content between <body> tags
        if ($content -match "(?s)<body[^>]*>(.*?)</body>") {
            $bodyOnly = $Matches[1]
            
            # Remove scripts, videos, and navigation elements
            $bodyOnly = $bodyOnly -replace '(?s)<script[^>]*>.*?</script>', ''
            $bodyOnly = $bodyOnly -replace '(?s)<video[^>]*>.*?</video>', ''
            $bodyOnly = $bodyOnly -replace '(?s)<source[^>]*>', ''
            $bodyOnly = $bodyOnly -replace '(?s)<nav[^>]*>.*?</nav>', ''
            $bodyOnly = $bodyOnly -replace '(?s)<a[^>]*class="[^"]*back-btn[^"]*"[^>]*>.*?</a>', ''
            $bodyOnly = $bodyOnly -replace '(?s)<a[^>]*class="[^"]*nav-bar[^"]*"[^>]*>.*?</a>', ''
            
            # Use page title if available, otherwise use filename
            $displayTitle = if ($pageTitle) { $pageTitle } else { $pageName }
            $displayPath = $pageInfo.Path -replace '^\.\./', ''
            
            "<div class='page-break'><h2>$displayTitle</h2><p style='color:#666; font-size:0.9em; margin-bottom:20px;'>Source: $displayPath</p>$bodyOnly</div>" | Out-File -FilePath $outputFile -Append -Encoding utf8
            $processedCount++
        } else {
            Write-Host "  Warning: Could not extract body content from $pageName" -ForegroundColor Yellow
        }
    } else {
        Write-Host "  Warning: File not found - $pagePath" -ForegroundColor Yellow
    }
}

"</body></html>" | Out-File -FilePath $outputFile -Append -Encoding utf8
Write-Host ""
Write-Host "Static Export Created: $outputFile" -ForegroundColor Green
Write-Host "Version: $newVersion (was $currentVersion)" -ForegroundColor Cyan
Write-Host "Pages processed: $processedCount of $($pages.Count)" -ForegroundColor Cyan
Write-Host "Ready for NotebookLM import or PDF export" -ForegroundColor Green