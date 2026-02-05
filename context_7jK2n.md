Project Context & Rules: Voetberg Family Portal
1. User Profile

Name: Daniel Voetberg (Dad/Family Manager)
Role: Web Maintainer
Tone: Direct, work-focused, no apologies.

2. Architecture & Philosophy

Stack: Static HTML5 / CSS3 (Glassmorphism) / Vanilla JS.
Hosting: GitHub Pages.
Philosophy: "Security by Obscurity" (No database, no login, hidden filenames).
Core Truth: "Logs tell What, Intel tells Why."
Asset Rule: ALL images/videos must reside in the /images/ directory.

3. Mandatory Technical Standards (Strict)
A. The "Nuclear" Cache Buster
EVERY HTML page head must include:
HTML<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="0">
B. The Back-Button Fix
Dynamic pages (Training, Orders, Pantry) must include this script before </body>:
JavaScript<script>
window.onpageshow = function(event) {
if (event.persisted) { window.location.reload(); }
};
</script>
C. Calendar Standard

Add-to-calendar links must include a Backlink (🔗 CHECK UPDATES: [URL]) and emojis for readability.

D. Page Title Prefix (PDF / LM consumption)

Every HTML page `<title>` must be prefixed with a sortable code `00W1`, `00W2`, … `00WN` (zero-padded, no space between 00W and the number). This ensures saved/printed PDFs and exported documents sort together and are easy to find when consumed by LMs or in file lists. Format: `00Wn — Original Title` (e.g. `00W1 — Voetberg Family Login`). New pages get the next unused number. **Current sequence runs 00W1–00W38** (index → Pointers99 → events → strategy → orders → pantry → intel → wrestling hub → notebook → library → match 008 analysis → training → donald/tacie supplements → history → tacie profile → wrestling videos → lifts A–D → mobility → core → circuits A–B → armor → AIS → donald/tonya/brian/dan/wallace → donald venture → stocks → fun → garage heater → albert st cinema → 404).

4. Key File Map (Do not guess filenames)

Main Hub: Pointers99.html
Events: events_7x9B2.html
Strategy: excalibur_strategy_2kL9v.html
Orders/Tasks: orders_9sL2k.html
Pantry: pantry_restock_8kL2m.html
Intel Briefing: supplement_intel_5kM9p.html
Tacie Wrestling Hub: tacie_wrestling_5fH3pK.html
Coach's Notebook (match notes): wrestling_notes_3jX9s.html
Technique Library: wrestling_library_7hG4d.html
Wrestling match analyses: wrestling_matches/ (e.g. match_008_analysis_4kL9m.html)
Daily Log: tacie_training_2pX4v.html
Donald Supplements: donald_supplements_4kL2n.html
Donald's Venture (social/merch): donald_venture_8xK4m.html
Project Context (this file): context_7jK2n.md

5. Design System

Visuals: Dark Glass UI overlaid on looping .mp4 video backgrounds.
Video Backgrounds: Must be muted, loop, playsinline, and have a dark CSS overlay (rgba 0,0,0, 0.3 to 0.7).
Mobile First: All layouts must use Flexbox/Grid for phone screens.

6. Checkboxes, Checklist CSS & Copy-Paste Behaviour

Checklist pattern (e.g. Tacie/Donald supplement pages):
- One checkbox per line; use a wrapper class (e.g. `.check-row`) with `display: flex; align-items: center; gap: 12px`.
- Bind each checkbox with a unique `id` and pair it with a `<label for="id">` so clicking the label toggles the box.
- Do **not** set `user-select: none` on checklist labels. That blocks text selection and prevents users from copying label text; leave labels selectable so copy-paste works.
- Use `accent-color` (e.g. `var(--accent-gold)`) for checkbox colour; give inputs a consistent size (e.g. 22px) and `flex-shrink: 0` so the box doesn’t collapse.
- Optional: when `input:checked`, style the label (e.g. `color: var(--text-muted); text-decoration: line-through`) for visual feedback.
- Persist state in `localStorage` keyed by page + date; reset checks when the date changes so each day gets a fresh list.
- Use unique, stable `id`s (e.g. `bl_07_1`, `bn_11_2`) so persistence and any future scripting remain reliable.

7. Wrestling Subsystem (Notes ↔ Library)

- **Linking preference:** In commentary (wrestling_notes_3jX9s.html), favor links to the technique library over external URLs when the concept is the same. Use fragment IDs (e.g. `wrestling_library_7hG4d.html#vid-snowplow`, `#top-base`). Technique links use class `move-link`; Buck15-specific links use class `buck15-text`.
- **Library structure:** wrestling_library_7hG4d.html has Top / Bottom / Neutral / Specific Counters; a sticky index in the sidebar; video cards with stable `id`s (e.g. `vid-snowplow`, `vid-tight-waist`); Buck15 cards use class `buck15-card` and badge. At the end, a **Reference list** (no preview boxes): techniques mentioned in the notebook that don’t yet have a library card, each with a short description and “Referenced from: Match XXX, timestamp.”
- **Notes structure:** Cheat sheet (e.g. Grandpa’s 3 Focus Areas) in a sticky sidebar; match cards with `outcome-win` / `outcome-loss` / `outcome-pending`; timestamp lists (`.timestamp-list`, `.ts` for time links); match IDs for deep links (e.g. `id="match009"`).
- **When adding notebook commentary:** Add inline library links where a technique has a card. If a technique is mentioned but has no library card, add an entry to the library’s Reference list with description and “Referenced from” so it can be added to the library later.
- **When adding a library card:** Consider adding or updating links from wrestling_notes where that technique is discussed.

8. Quality & Cross-Page Checks (Wide View)

Before making changes that affect links or structure, run these checks so updates stay consistent across the site:

- **Link and ID stability:** Before renaming a file or changing a fragment `id` used in links (e.g. library card IDs, match section IDs), search the repo for that filename or `#fragment` so all references (notes, library, hub, events, history, etc.) can be updated or confirmed.
- **Notes ↔ Library interplay:** When adding or editing match notes, ask: (1) Which techniques are named? (2) Do they have a library card? If yes, add a `move-link` to it. If no, add a Reference list entry with “Referenced from: Match N, timestamp.” When adding a library card, ask: is this technique referenced in the notebook? If yes, add or fix the inline link there.
- **Nav and hub consistency:** Wrestling hub (tacie_wrestling_5fH3pK.html) should link to both Notebook and Library. Library and Notebook should link to each other (nav + Reference section intro) and back to the hub. Events and history recaps that mention matches should link to the hub or notebook where appropriate.
- **CSS and class conventions:** Use existing classes for consistency: `.move-link` (technique/library links in notes), `.buck15-text` (Buck15 callouts), `.ts` (timestamp links), `.timestamp-list`, `.match-card`, `.outcome-win` / `.outcome-loss` / `.outcome-pending`. Don’t introduce duplicate patterns for the same purpose.
- **New wrestling pages:** If adding a new wrestling-related page (e.g. another analysis or drill list), add it to this context’s Key File Map and ensure the hub (and any relevant nav) links to it; consider whether it should link to the library or notebook for techniques.

- **Events ↔ Kids’ pages (avoid data rot):** events_7x9B2.html is the canonical schedule. Other pages that reference events (e.g. donald_2yR5j.html “What’s Happening,” tacie_6nQ1s.html, tacie_wrestling_5fH3pK.html “next event” or season summary) can drift out of date. **Maintenance checks:** (1) When adding or removing events, update the **What’s Happening?** box on the events page so the one-line summary for each kid (sport, season, key date) stays accurate. (2) When editing a kid’s profile or hub, confirm any event dates, “next up,” or season wording matches events_7x9B2.html—or replace inline dates with a link to the events page so the schedule lives in one place. (3) Prefer linking to events_7x9B2.html for “see full schedule” or “what’s next” rather than re-listing dates on multiple pages. (4) If a kid’s page has its own “What’s Happening” or timeline (e.g. Donald), keep it high-level and use events for authoritative dates; when seasons change, update both the events What’s Happening? and any timeline on the kid’s page so they don’t contradict.
