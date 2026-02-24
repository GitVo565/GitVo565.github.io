const fs = require('fs');
const path = require('path');

// Run from scripts_235v/; repo root is parent directory
const rootDir = path.resolve(__dirname, '..');

// List of pages to include (same as in the dynamic version)
const pagesToLoad = [
    { url: 'tacie_training_2pX4v.html', title: "Tacie's Training Directives" },
    { url: 'excalibur_strategy_2kL9v.html', title: 'Excalibur Strategy & Vision' },
    { url: 'supplement_intel_5kM9p.html', title: 'Nutrition Intel' },
    { url: 'tacie_supplements_3mX9z.html', title: 'Blood & Bone Protocol' },
    { url: 'tacie_lifta_8zK3m.html', title: 'Lift A: Posterior Chain' },
    { url: 'tacie_liftb_9sL4k.html', title: 'Lift B: Anterior' },
    { url: 'tacie_liftc_7jK2n.html', title: 'Lift C: Structural' },
    { url: 'tacie_liftd_3mP9q.html', title: 'Lift D: Power' },
    { url: 'tacie_circuit_a_4jK9m.html', title: 'Circuit A' },
    { url: 'tacie_circuit_b_5mL3k.html', title: 'Circuit B' },
    { url: 'tacie_armor_9kL2p.html', title: 'The Armor: Grip & Back' },
    { url: 'tacie_ais_4kL9m.html', title: 'AIS: Run Prep' },
    { url: 'tacie_mobility_5nB8v.html', title: 'Mobility & Drills' },
    { url: 'tacie_core_2jX9s.html', title: 'Core Routines: A, B, C' }
];

// Function to extract body content from HTML string
function extractBodyContent(html) {
    // Remove everything before <body> and after </body>
    const bodyMatch = html.match(/<body[^>]*>([\s\S]*?)<\/body>/i);
    if (!bodyMatch) {
        return '<p>Error: Could not extract body content</p>';
    }
    
    let bodyContent = bodyMatch[1];
    
    // Remove scripts
    bodyContent = bodyContent.replace(/<script[\s\S]*?<\/script>/gi, '');
    
    // Remove video backgrounds
    bodyContent = bodyContent.replace(/<video[\s\S]*?<\/video>/gi, '');
    bodyContent = bodyContent.replace(/<source[\s\S]*?>/gi, '');
    
    // Remove navigation bars and back buttons (common classes)
    bodyContent = bodyContent.replace(/<nav[\s\S]*?<\/nav>/gi, '');
    bodyContent = bodyContent.replace(/<div[^>]*class="[^"]*nav-bar[^"]*"[\s\S]*?<\/div>/gi, '');
    bodyContent = bodyContent.replace(/<a[^>]*class="[^"]*back-btn[^"]*"[\s\S]*?<\/a>/gi, '');
    
    return bodyContent;
}

// Read and process all pages
const sections = [];
let errorCount = 0;

for (const page of pagesToLoad) {
    try {
        const filePath = path.join(rootDir, page.url);
        if (!fs.existsSync(filePath)) {
            throw new Error(`File not found: ${page.url}`);
        }
        
        const html = fs.readFileSync(filePath, 'utf8');
        const content = extractBodyContent(html);
        
        sections.push({
            title: page.title,
            url: page.url,
            content: content
        });
        
        console.log(`✅ Loaded: ${page.title}`);
    } catch (error) {
        console.error(`❌ Error loading ${page.url}:`, error.message);
        sections.push({
            title: page.title,
            url: page.url,
            content: `<div style="color:red; padding:20px;">Error loading ${page.url}: ${error.message}</div>`
        });
        errorCount++;
    }
}

// Generate the static HTML
const staticHTML = `<!DOCTYPE html>
<html lang="en">
<head>
    <title>00W41 — ExcaliburExport · v000</title>
    
    <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate">
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Expires" content="0">
    <meta name="robots" content="noindex, nofollow, noarchive, nosnippet, noimageindex">
    <meta name="googlebot" content="noindex, nofollow">
    <meta name="google-extended" content="noindex, nofollow">
    <meta name="gptbot" content="noindex, nofollow">
    <meta name="CCBot" content="noindex, nofollow">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="UTF-8">
    
    <style>
        :root {
            --bg-dark: #0a0a0a;
            --text-light: #ecf0f1;
            --accent-gold: #f39c12;
            --accent-blue: #3498db;
            --accent-red: #e74c3c;
            --divider: #333;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            padding: 20px;
            line-height: 1.6;
            max-width: 1400px;
            margin: 0 auto;
            color: var(--text-light);
            background: var(--bg-dark);
        }

        .export-header {
            text-align: center;
            padding: 30px 20px;
            border-bottom: 3px solid var(--accent-gold);
            margin-bottom: 40px;
        }

        .export-header h1 {
            margin: 0;
            font-size: 2.5em;
            color: white;
            text-transform: uppercase;
            letter-spacing: 2px;
            text-shadow: 0 2px 10px rgba(0,0,0,0.8);
        }

        .export-header p {
            margin: 10px 0 0 0;
            color: #aaa;
            font-size: 1.1em;
        }

        .ready-indicator {
            text-align: center;
            padding: 20px;
            background: rgba(39, 174, 96, 0.2);
            border: 2px solid #27ae60;
            border-radius: 8px;
            color: #27ae60;
            font-size: 1.2em;
            font-weight: bold;
            margin: 20px 0;
        }

        .page-section {
            margin-bottom: 60px;
            page-break-inside: avoid;
            border-top: 2px solid var(--divider);
            padding-top: 30px;
        }

        .page-section:first-of-type {
            border-top: none;
            padding-top: 0;
        }

        .page-section-header {
            background: rgba(52, 152, 219, 0.15);
            border-left: 5px solid var(--accent-blue);
            padding: 15px 20px;
            margin-bottom: 20px;
            border-radius: 4px;
        }

        .page-section-header h2 {
            margin: 0;
            font-size: 1.8em;
            color: white;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .page-section-header .source-url {
            margin-top: 5px;
            font-size: 0.85em;
            color: #aaa;
            font-family: monospace;
        }

        .embedded-content {
            background: rgba(28, 28, 28, 0.5);
            padding: 20px;
            border-radius: 8px;
            border: 1px solid var(--divider);
        }

        .embedded-content * {
            max-width: 100%;
        }

        .bg-video {
            display: none !important;
        }

        @media print {
            body {
                background: white;
                color: black;
            }
            .export-header {
                margin-bottom: 20px;
                padding: 20px 0;
                page-break-after: avoid;
            }
            .ready-indicator {
                display: block !important;
                background: #e8f5e9;
                border: 2px solid #27ae60;
                color: #27ae60;
            }
            .page-section {
                page-break-inside: avoid;
                border-top: 1px solid #ccc;
                margin-bottom: 30px;
            }
            .page-section:first-of-type {
                page-break-before: auto;
            }
            .embedded-content {
                background: white;
                border: 1px solid #ddd;
            }
        }
    </style>
</head>
<body>

    <div class="export-header">
        <h1>Excalibur Export</h1>
        <p>Complete Protocol Library & Training Documentation</p>
        <p style="font-size:0.9em; color:#888; margin-top:5px;">Generated for LM data dump / PDF export</p>
    </div>

    <div class="ready-indicator">
        ✅ Static Export Ready — ${sections.length} pages included
    </div>

    <div id="content-container">
${sections.map(section => `
        <div class="page-section">
            <div class="page-section-header">
                <h2>${section.title}</h2>
                <div class="source-url">Source: ${section.url}</div>
            </div>
            <div class="embedded-content">
                ${section.content}
            </div>
        </div>
`).join('\n')}
    </div>

    <script>
        // Back-Button Fix (Spec 3.2)
        window.onpageshow = function(event) {
            if (event.persisted) { window.location.reload(); }
        };
    </script>
</body>
</html>`;

// Write the static file
const outputPath = path.join(rootDir, 'excalibur_export_static_9mL4x.html');
fs.writeFileSync(outputPath, staticHTML, 'utf8');

console.log(`\n✅ Static export generated: ${outputPath}`);
console.log(`📄 ${sections.length} pages included`);
if (errorCount > 0) {
    console.log(`⚠️  ${errorCount} errors encountered`);
} else {
    console.log(`✨ All pages loaded successfully!`);
}
