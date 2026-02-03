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

4. Key File Map (Do not guess filenames)

Main Hub: Pointers99.html
Events: events_7x9B2.html
Strategy: excalibur_strategy_2kL9v.html
Orders/Tasks: orders_9sL2k.html
Pantry: pantry_restock_8kL2m.html
Intel Briefing: supplement_intel_5kM9p.html
Tacie Wrestling Hub: tacie_wrestling_5fH3pK.html
Daily Log: tacie_training_2pX4v.html
Donald Supplements: donald_supplements_4kL2n.html
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
