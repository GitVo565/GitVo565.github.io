# Project context & standards

Reference for AI and maintainers. Aligned with **Voetberg Family Portal Master Protocol (v3.5)**. Cursor rules in `.cursor/rules/` enforce these where applicable.

---

## 1. Philosophy & architecture

- **Security by obscurity:** Static site, no database, no login. Internal URLs are hidden (opaque filenames). If it’s on the site, it’s the source of truth.
- **Visual standard:** “Dark Glass” UI (glassmorphism) over dynamic video backgrounds (.mp4) or static images. All video backgrounds must have a dark CSS overlay for text readability.
- **Deep Link standard (v3.2+):** “Logs tell What, Intel tells Why.” Execution logs (e.g. Daily Log, Pantry) link to intelligence briefings (e.g. `supplement_intel_5kM9p.html`) via anchors (e.g. `#potato`, `#beef-stick`). Consumable items in logs should link to their definition card in the Intel Briefing.
- **Performance:** Mandatory “Nuclear” cache busting on every HTML page so mobile browsers load fresh assets.

---

## 2. Internal HTML naming (security by obscurity)

**Rule:** Family/internal pages use **opaque filenames** so URLs are not guessable.

- **Pattern:** `name_descriptor_randomId.html`
  - `name` = person or domain (e.g. `donald`, `tacie`, `wrestling`, `excalibur`)
  - `descriptor` = short, generic label (e.g. `track`, `supplements`, `venture`, `training`, `duffel`)
  - `randomId` = **5–6 character mixed alphanumeric** (e.g. `3vN7q`, `2yR5j`, `2pX4v`). No semantic meaning.

- **Do NOT** put in the filename: years (e.g. `track_2026`), or full topic names that make the page obvious.
- **Do** keep **link text / card titles** human-readable (e.g. "Track 2026"). Only the URL/filename is obscured.

**Examples (correct):** `donald_track_3vN7q.html`, `tacie_training_2pX4v.html`, `events_7x9B2.html`  
**Examples (wrong):** `donald_track_2026.html`, `tacie_2025_training.html`

---

## 3. Hub and file registry (summary)

- **Main hub:** `Pointers99.html` — central navigation / family portal. New internal pages for a person’s “management” area are linked from the relevant Athlete Management section and from that person’s profile page.
- **Core:** `orders_9sL2k.html`, `events_7x9B2.html`, `excalibur_strategy_2kL9v.html`, `pantry_restock_8kL2m.html`.
- **Excalibur / Tacie:** `tacie_training_2pX4v.html` (Daily Log), `supplement_intel_5kM9p.html` (Intel Briefing), `tacie_supplements_3mX9z.html`, wrestling hub/videos/library/notebook — all use obscure IDs. Protocol sub-pages: circuits (e.g. `tacie_circuit_a_4jK9m.html`), lifts (e.g. `tacie_liftc_7jK2n.html`), support (e.g. `tacie_ais_4kL9m.html`, `tacie_mobility_5nB8v.html`).
- **Profiles:** `dan_3mP9L.html`, `donald_2yR5j.html`, `tonya_9vK2x.html`, `brian_H4z8W.html`, `tacie_6nQ1s.html`, `wallace_8xL4p.html`.
- **Lifestyle / other:** `albert_st_cinema_9kL2z.html`, `fun_4aW8x.html`, `history_8kL9m.html`, etc.

---

## 4. Global technical standards (HTML)

### 4.1 Cache control (mandatory)

Every HTML page must include in `<head>`:

```html
<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="0">
```

### 4.2 Search and bot protection (mandatory)

Every HTML page must include the **full bot block** so search engines and AI crawlers do not index or archive content. Use this exact block in `<head>`:

```html
<meta name="robots" content="noindex, nofollow, noarchive, nosnippet, noimageindex">
<meta name="googlebot" content="noindex, nofollow">
<meta name="google-extended" content="noindex, nofollow">
<meta name="gptbot" content="noindex, nofollow">
<meta name="CCBot" content="noindex, nofollow">
```

- **robots:** General crawlers; `noarchive`/`nosnippet`/`noimageindex` prevent caching and snippets.
- **googlebot:** Google search.
- **google-extended:** Google’s AI/LLM crawler.
- **gptbot:** OpenAI crawler.
- **CCBot:** Common Crawl (used by many AI tools). Do not remove or shorten this block on any family page.

### 4.3 Back-button fix (dynamic pages)

For dynamic pages (Training, Orders, Pantry, Supplements), place before `</body>` to avoid stale state on back navigation:

```html
<script>
window.onpageshow = function(event) {
  if (event.persisted) { window.location.reload(); }
};
</script>
```

### 4.4 Media

- **Video backgrounds:** `object-fit: cover` (or `contain` for portrait); `muted` `loop` `playsinline`. Dark overlay (e.g. `rgba(0,0,0,0.3)`–`0.7`) for readability.
- **Assets:** All images and video must live under `/images/` (or project-equivalent). No assets in repo root.

### 4.5 Calendar integration (event pages)

For pages with “Add to Calendar” links (e.g. Events): event description body must include a backlink (“CHECK UPDATES: https://gitvo565.github.io/[filename].html”), full details (alerts, logistics, links, teams), and use `%0A` for newlines and URL-encode special characters. Keep under ~1000 chars for compatibility. See Master Protocol §4.4 for full formatting and provider-specific params.

### 4.6 Event tiles — updated timestamp

Event cards/tiles must show when details were last modified. Place a **small grey date/time** in the **lower right** of each tile.

- **CSS:** `.event-updated { font-size: 0.75em; color: #666; text-align: right; margin: 8px 0 0 0; display: block; }`
- **HTML:** `<p class="event-updated"></p>` as the last child of each event card's `.card-body`.
- **Script:** Populate via `document.lastModified` with prefix "Last Update: " (e.g. `"Last Update: " + date.toLocaleDateString() + " " + date.toLocaleTimeString([], {hour: '2-digit', minute:'2-digit'})`). Use the same script that sets footer "Last Updated" to also populate all `.event-updated` elements.

---

## 5. Styling consistency

- Pages tied to a person use that person’s profile theme (e.g. MSUB dark + glass for Donald, Excalibur theme for Tacie).
- Shared assets under `images/`; paths relative to repo root.

---

## 6. Logic engines & protocols (reference)

- **Wrestling filter:** Training adjustment by practice type (Grinder → cancel run >3mi; Drill → green light; Bump → modify; Injury → full stop).
- **Blood & Bone v11:** Dinner determines stack; Blood phase (Iron night) vs Bone phase; Nitric Oxide rule (beet juice lunch only); Magnesium mandate (no Cal-Mag stack); Sickness protocol. Source: `tacie_supplements_3mX9z.html` + `supplement_intel_5kM9p.html`.
- **Pantry / Intel:** Consumables in logs link to Intel Briefing anchors. Banned list (e.g. Ashwagandha, AG1, Nature Made Iron) — see Master Protocol §5.5.
- **Deep Link:** Logs link to Intel via anchors; links should have distinct style (e.g. dotted underline or icon).

---

## 7. Maintenance checklist (before commit)

- [ ] **Header:** Nuclear cache control meta tags present.
- [ ] **Search/bot protection:** Full bot block present (robots, googlebot, google-extended, gptbot, CCBot).
- [ ] **Assets:** Images/videos in `/images/` (not root).
- [ ] **Naming:** New internal HTML uses `name_descriptor_randomId.html` (no year or guessable topic in filename).
- [ ] **Logic:** Page aligns with Blood/Bone v11 and protocol refs where applicable.
- [ ] **Deep links:** New consumable items in Daily Log have corresponding anchor in Intel Briefing and link to it.
- [ ] **Footer:** “Last Updated” script present where applicable.
- [ ] **Calendar:** Event pages with add-to-calendar have formatted bodies with backlink and full details.
- [ ] **Event tiles:** Each event card shows small grey date/time (lower right) via `.event-updated` + `document.lastModified`.

---

## 8. Cursor rules

| Rule file | Purpose |
|-----------|---------|
| `internal-html-naming.mdc` | Enforce opaque filenames for internal HTML (`**/*.html`). |
| `global-html-standards.mdc` | Cache headers, noindex/nofollow, assets in `/images/`, back-button fix. |
| `excalibur-training.mdc` | AIS/Activation before Run in day cards; Deep Link to Intel for consumables. |

Full Master Protocol (file registry, asset mapping, calendar encoding, logic engines): see `000_Master_Docs_Spec` (external doc, v3.5).

---

*Last updated from Master Protocol v3.5; context doc and Cursor rules aligned.*
