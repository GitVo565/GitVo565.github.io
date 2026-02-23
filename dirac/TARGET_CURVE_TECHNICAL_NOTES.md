# Albert St. Cinema — Dirac Live ART Target Curve Documentation

## System Overview

| Component | Detail |
|---|---|
| **Layout** | 9.5.6 Dolby Atmos |
| **Receiver** | Denon AVR-A1H (15.4 channel, dual-core 1GHz DSP) |
| **External Amp** | Outlaw 5000x — drives Front L/R, Center, Surround L/R |
| **Subwoofers** | 5x Klipsch RP-1600SW (16-inch drivers) |
| **Display** | Sony BRAVIA XR-83A80L 83" OLED |
| **Seating** | Row 1: Valencia Tuscany (5.5 ft) / Row 2: 3x Audio Advice Revelation on 7.75" Octane Riser |
| **Calibration** | 17-point wide-area Dirac ART sweep (both row headrest heights) |
| **Dirac Project (ART)** | `5 Subs 2 Rows Riser Level Cherry Gemini Active Support Recs.liveproject` (v3 support matrix: G9 removed from G6–G8, -24dB on G1/G2/G9-self) |
| **Dirac Project (DLBC)** | `5 Subs 2 Rows Riser Level Cherry Gemini Bass Control Opus Trauma.liveproject` |

---

## ART Speaker Group Map

| Group | Channels | Amplifier | Physical Position |
|---|---|---|---|
| G1 | Front Left & Right | Outlaw 5000x | Floor-standing towers, front wall |
| G2 | Center | Outlaw 5000x | Below display, front wall |
| G3 | Front Wide Left & Right | Denon internal | Bed layer, flanking front stage |
| G4 | Surround Left & Right | Outlaw 5000x | Side walls, ear level |
| G5 | Surround Back Left & Right | Denon internal | Rear wall, **mounted high** |
| G6 | Top Front Left & Right | Denon internal | Ceiling, forward |
| G7 | Top Middle Left & Right | Denon internal | Ceiling, overhead |
| G8 | Top Rear Left & Right | Denon internal | Ceiling, rear |
| G9 | Subwoofers 1–4 | Denon Sub Outs (5 physical units) | Front L+R (Y-split), Rear Center (wireless 5.8GHz), Rear Right, Rear Left |

### Sub Output Topology

- **Sub 1 Out:** Front Left & Front Right subs (Y-split to two physical units)
- **Sub 2 Out:** Rear Center sub (wireless via 5.8GHz link — ~20ms inherent latency)
- **Sub 3 Out:** Rear Right sub (wired)
- **Sub 4 Out:** Rear Left sub (wired)
- **LFE Reference:** Center (Group 2) — aligns LFE transients with on-screen action

---

## ART Support Matrix

Originally based on Gemini-recommended assignments, then revised (v3) to resolve cross-term exhaustion.

### v2 Support Matrix (Original — Caused Cross-Term Exhaustion)

G9 supported all 8 groups. This consumed **91 of 92 available cross-terms**, leaving no DSP headroom for accurate filter calculation. ART power-corrected the sub filters, capping the Harman +12dB target to roughly +5–8dB delivered.

| Target Group | Supported By | Issue |
|---|---|---|
| G1–G5 | (various) + G9 | Correct — bed layer benefits from sub support |
| G6 (Top Front L/R) | G6, G9 | Wasteful — tiny ceiling speakers don't need 16" sub cancellation |
| G7 (Top Middle L/R) | G7, G9 | Same — flat target, minimal benefit |
| G8 (Top Rear L/R) | G8, G9 | Same — flat target, minimal benefit |

### v3 Support Matrix (Current — Cross-Term Optimized)

Removed G9 support from height groups (G6, G7, G8). Cross-terms dropped from **91 → 67 of 92**, freeing 26% of the DSP budget. Sub filters now track target curves significantly more accurately.

| Target Group | Supported By | Rationale |
|---|---|---|
| G1 (Front L/R) | G1, G4, G9 | Self-support + same Outlaw amp (G4) + sub array |
| G2 (Center) | G1, G2, G9 | Same Outlaw amp (G1) + sub array. G2 removed from supporting others to protect vocal clarity |
| G3 (Front Wide L/R) | G3, G9 | Self-support + sub array. Both on Denon internal amps — avoids cross-amp gain mismatch |
| G4 (Surround L/R) | G1, G4, G9 | Self-support + same Outlaw amp (G1) + sub array. G5 removed (Denon internal, gain mismatch) |
| G5 (Surround Back L/R) | G3, G5, G9 | Self-support + G3 (both Denon internal) + sub array |
| G6 (Top Front L/R) | G6 only | Self-support only. Sub support removed to free cross-terms — ceiling speakers have flat target and unobstructed paths |
| G7 (Top Middle L/R) | G7 only | Same logic as G6 |
| G8 (Top Rear L/R) | G8 only | Same logic as G6 |
| G9 (Subwoofers) | G9 only | Self-support. Dirac locked out G1 (insufficient acoustic power to cancel 5x 16" drivers). G2 excluded to protect vocals |

### Support Level Settings

Dirac ART uses an **inverted dB scale** for support levels:

- **-24 dB** = more contribution (more aggressive cancellation/support)
- **-18 dB** = nominal (default)
- **-6 dB** = less contribution (lighter touch)

Targeted support levels applied after v3 matrix change:

| G9 Supporting... | Support Level | Rationale |
|---|---|---|
| G9 (self) | -24 dB | Maximize sub array self-optimization and forward bass output |
| G1 (Front L/R) | -24 dB | Front towers need the most sub support for bass shelf delivery |
| G2 (Center) | -24 dB | Dialogue body and LFE-to-center coherence |
| G3 (Front Wide L/R) | -18 dB | Nominal — smaller speakers, less bass demand |
| G4 (Surround L/R) | -18 dB | Nominal — side surrounds don't need aggressive bass fill |
| G5 (Surround Back L/R) | -18 dB | Nominal — mounted high, flat target |

### Cross-Term Budget

The Denon AVR-A1H has a maximum of **92 cross-terms** for ART filter calculations. Each support relationship between groups consumes cross-terms based on the number of channels involved.

| Configuration | Cross-Terms Used | Headroom |
|---|---|---|
| v2 (G9 supporting all groups) | 91 / 92 | 1 remaining — power correction aggressive |
| v3 (G9 removed from G6–G8) | 67 / 92 | 25 remaining — healthy headroom |

**Key lesson:** Having 5x 16-inch subwoofers generate cancellation waves for small ceiling-mounted Atmos speakers consumed massive DSP resources for virtually zero acoustic benefit. Those cross-terms are far better spent on accurate bass filter delivery for the front stage and sub array.

---

## Acoustic Constraints

### Two-Row Acoustic Shadowing

The front-row Valencia Tuscany recliners have high seatbacks that physically block high-frequency dispersion from ear-level speakers to the elevated rear row.

**Affected groups (obstructed):** G1, G2, G3, G4 — all ear-level bed-layer speakers below the front-row headrests.

**Unaffected groups (clear line-of-sight):** G5 (mounted high on rear wall), G6, G7, G8 (ceiling-mounted).

**Compensation:** +3 dB treble boost from 4 kHz to 20 kHz on all obstructed bed-layer groups. Heights and G5 remain flat to prevent overly bright overhead/rear effects.

### Riser Platform Bass Interaction

The 7.75-inch Octane riser platform acts as both:
1. **Tactile transducer** — rear subs fire directly into the platform, transferring physical vibration to Row 2 seats
2. **Broad-spectrum bass trap** — absorbs low-frequency acoustic energy, altering decay times

The 17-point Dirac ART sweep compensates for the riser's absorption. The Opus Trauma profile specifically exploits the tactile transfer effect with its +20 dB sub shelf.

### Wireless Subwoofer Baseline Delay

Sub 2 (rear center) uses a 5.8 GHz wireless link introducing ~20 ms transmission latency. Dirac ART detects this and delays all 14 wired speakers and 4 wired subs by that margin to maintain time alignment. This establishes a high base delay before room correction algorithms are applied.

---

## The Bass Problem (v1 Curves) and the Fix

### What Went Wrong

The original target curves (v1) followed Gemini's recommendations directly, which specified:
- **0 dB flat bass** on all bed-layer groups (G1–G4)
- **+3 dB treble boost** on bed-layer groups for acoustic shadowing
- **0 dB flat** on Cherry subwoofers

This created two compounding problems:

1. **No bass shelf on the bed layer.** Dirac room correction aggressively flattens natural room gain. With a 0 dB target, Dirac cuts all bass reinforcement to achieve flat response. The +3 dB treble boost made the effective bass-to-treble ratio **-3 dB** — the opposite of what sounds natural.

2. **ART cancellation overhead on subs.** Group 9 is assigned as a support speaker for Groups 1–8. All 5 subwoofers generate phase-inverted cancellation waves for every other group. A significant portion of sub output is literally anti-bass. Even a +10 dB Harman shelf gets partially consumed.

### What the Research Says

Dirac's official target curve documentation states:

> *"A strictly flat in-room response is usually perceived as overly bright, clinical, and lacking in bass."*

Recommended bass shelf: **+4 dB to +8 dB relative to midrange**. The Harman target curve (Sean Olive, 2012) validated this through double-blind listener testing.

Fletcher-Munson equal-loudness contours further confirm that human hearing is less sensitive to bass at lower volumes, requiring even more bass shelf for low-volume (nighttime) listening.

### The Fix (v2 Curves)

Every bed-layer curve now includes a proper bass shelf. Sub curves bumped to compensate for ART overhead.

| Curve | v1 Bass | v2 Bass | Change |
|---|---|---|---|
| Cherry Subs (G9) | 0 dB flat | +6 dB shelf 10–80 Hz | Added reference-level sub shelf |
| Cherry Bed Layer (G1–4) | 0 dB flat | +4 dB shelf 10–80 Hz | Added Dirac-recommended minimum |
| Night Bed Layer (G1–4) | 0 dB flat | +6 dB shelf 10–80 Hz | Higher shelf for Fletcher-Munson compensation at low volume |
| Night Subs (G9) | -10 dB shelf | -10 dB shelf (unchanged) | Structural isolation preserved |
| Harman Subs (G9) | +10 dB shelf | +12 dB shelf 10–80 Hz | +2 dB ART overhead compensation |
| Harman Bed Layer (G1–4) | 0 dB flat | +6 dB shelf 10–80 Hz | Matches Harman research recommendations |
| Opus Trauma Subs (G9) | +20 dB shelf (50 Hz cutoff) | +20 dB shelf (60 Hz cutoff, +8 dB at 100 Hz) | Extended shelf for 808 + kick punch range |
| Opus Trauma Center (G2) | 0 dB bass | +6 dB shelf 10–80 Hz, -4 dB scoop | Full vocal body, deeper fatigue scoop |
| Opus Trauma Bed (G1–3–4) | 0 dB flat | +6 dB shelf 10–80 Hz | Maximum bed-layer warmth |

---

## Target Curve Profiles

### Cherry — The Reference

Neutral, accurate listening for daytime use. Acoustic shadowing compensated. Moderate bass shelf for natural warmth.

| File | Groups | Curve Shape |
|---|---|---|
| `Cherry_Subwoofers_G9.targetcurve` | G9 | +6 dB shelf 10–80 Hz → taper to 0 dB at 150 Hz → flat |
| `Cherry_BedLayer_G1-G2-G3-G4.targetcurve` | G1, G2, G3, G4 | +4 dB shelf 10–80 Hz → taper to 0 dB at 200 Hz → flat 200–4k Hz → +3 dB boost 4k–20k Hz |
| `Cherry_Heights_G5-G6-G7-G8.targetcurve` | G5, G6, G7, G8 | Flat 0 dB (unobstructed line-of-sight, no correction needed) |

### Night — Structural Isolation (Cherry for Nighttime)

Sub-bass killed to prevent wall/floor transmission. Bed-layer bass shelf increased to compensate for Fletcher-Munson effect at reduced master volume.

| File | Groups | Curve Shape |
|---|---|---|
| `Night_Subwoofers_G9.targetcurve` | G9 | -10 dB shelf 10–50 Hz → taper to 0 dB at 100 Hz → flat |
| `Night_BedLayer_G1-G2-G3-G4.targetcurve` | G1, G2, G3, G4 | +6 dB shelf 10–80 Hz → taper to 0 dB at 200 Hz → flat 200–4k Hz → +3 dB boost 4k–20k Hz |
| `Night_Heights_G5-G6-G7-G8.targetcurve` | G5, G6, G7, G8 | Flat 0 dB |

### Harman +10 — The Standard (Cinema)

Aggressive cinema bass shelf on subs (+12 dB to compensate for ART cancellation overhead). Full Harman-grade bed-layer warmth.

| File | Groups | Curve Shape |
|---|---|---|
| `Harman10_Subwoofers_G9.targetcurve` | G9 | +12 dB shelf 10–80 Hz → taper to 0 dB at 150 Hz → flat |
| `Harman10_BedLayer_G1-G2-G3-G4.targetcurve` | G1, G2, G3, G4 | +6 dB shelf 10–80 Hz → taper to 0 dB at 200 Hz → flat 200–4k Hz → +3 dB boost 4k–20k Hz |
| `Harman10_Heights_G5-G6-G7-G8.targetcurve` | G5, G6, G7, G8 | Flat 0 dB |

### Opus Trauma — The Abyss

**Correction engine: Dirac Live Bass Control (DLBC) — NOT ART.**

Opus Trauma deliberately runs on DLBC instead of ART. ART's active room mode cancellation and decay reduction work against the raw, overwhelming bass impact this profile is designed to deliver. With DLBC:

- All 5 subs produce **100% forward-facing bass** — zero energy wasted on phase-inverted cancellation waves
- Natural room gain and bass decay remain intact — this is what creates the physical "wall of bass" sensation
- No cross-term budget constraint — DLBC doesn't use the ART support matrix
- The +20 dB shelf is delivered on top of room reinforcement, not fighting against cancellation overhead

Maximum tactile impact and demo-grade bass for tracks like "Taste" by Tyga. Redesigned in v4 with an extended sub shelf that covers the full 808 range (30–60 Hz) AND kick punch (60–100 Hz), instead of dropping off steeply at 50 Hz. The wider shelf drives broader tactile energy into the riser platform — not just rumble, but physical punch felt through the seats. Center channel presence scoop deepened to -4 dB for fatigue-free reference+ SPL. Bed layer bass shelf increased to +6 dB for full-body warmth from towers and surrounds.

| File | Groups | Curve Shape |
|---|---|---|
| `OpusTrauma_Subwoofers_G9.targetcurve` | G9 | +20 dB shelf 10–60 Hz → +8 dB at 100 Hz → taper to 0 dB at 150 Hz → flat |
| `OpusTrauma_Center_G2.targetcurve` | G2 only | +6 dB shelf 10–80 Hz → taper to 0 dB at 200 Hz → flat to 800 Hz → -4 dB scoop 1k–3k Hz → +3 dB boost 4k–20k Hz |
| `OpusTrauma_BedLayer_G1-G3-G4.targetcurve` | G1, G3, G4 | +6 dB shelf 10–80 Hz → taper to 0 dB at 200 Hz → flat 200–4k Hz → +3 dB boost 4k–20k Hz |
| `OpusTrauma_Heights_G5-G6-G7-G8.targetcurve` | G5, G6, G7, G8 | Flat 0 dB |

**Why DLBC instead of ART for this profile:**

ART's core function is reducing room modes, standing waves, and bass decay — the exact acoustic phenomena that make bass feel physically massive and overwhelming. With 5 subs all assigned as ART support speakers for multiple groups, a large portion of their output was phase-inverted cancellation energy. Testing with ART showed the Opus Trauma curves delivered technically clean but perceptually underwhelming bass. Switching to DLBC lets the room reinforcement work FOR the experience rather than against it.

Cherry and Harman +10 remain on ART where precision, decay control, and seat-to-seat consistency matter for cinema and reference listening.

**Design rationale for Opus Trauma sub curve:**
- 808 sub-bass fundamentals sit at 30–50 Hz — the +20 dB shelf covers this completely
- Kick drum punch lives at 60–80 Hz — the extended shelf maintains +20 dB through 60 Hz (was dropping off at 50 Hz in v2)
- The gentler rolloff (+8 dB at 100 Hz instead of 0 dB) preserves mid-bass energy that gives hip-hop and action movie impacts their physical weight
- The wider shelf drives a broader spectrum of tactile energy into the Octane riser platform — Row 2 guests feel chest-slam AND kick punch, not just low rumble
- On DLBC, this shelf stacks on top of natural room gain instead of fighting ART cancellation

---

## .targetcurve File Format Reference

```
NAME
<Display name shown in Dirac Live>
DEVICENAME
Unnamed
BREAKPOINTS
<frequency_hz> <level_db>
<frequency_hz> <level_db>
...
LOWLIMITHZ
10
HIGHLIMITHZ
24000
```

- Frequency/dB pairs are space-separated, one per line
- Dirac interpolates linearly between breakpoints
- LOWLIMITHZ and HIGHLIMITHZ define the valid frequency range
- Load via Filter Design tab → select group → menu (⋮) → Load target curve

---

## Group Assignment Quick Reference

When loading curves in Dirac Live, select the group in the right-hand panel, then load the corresponding file:

| Group Selected | Cherry | Night | Harman +10 | Opus Trauma |
|---|---|---|---|---|
| G1 (Front L/R) | Cherry_BedLayer | Night_BedLayer | Harman10_BedLayer | OpusTrauma_BedLayer |
| G2 (Center) | Cherry_BedLayer | Night_BedLayer | Harman10_BedLayer | **OpusTrauma_Center** |
| G3 (Front Wide L/R) | Cherry_BedLayer | Night_BedLayer | Harman10_BedLayer | OpusTrauma_BedLayer |
| G4 (Surround L/R) | Cherry_BedLayer | Night_BedLayer | Harman10_BedLayer | OpusTrauma_BedLayer |
| G5 (Surround Back L/R) | Cherry_Heights | Night_Heights | Harman10_Heights | OpusTrauma_Heights |
| G6 (Top Front L/R) | Cherry_Heights | Night_Heights | Harman10_Heights | OpusTrauma_Heights |
| G7 (Top Middle L/R) | Cherry_Heights | Night_Heights | Harman10_Heights | OpusTrauma_Heights |
| G8 (Top Rear L/R) | Cherry_Heights | Night_Heights | Harman10_Heights | OpusTrauma_Heights |
| G9 (Subwoofers) | Cherry_Subwoofers | Night_Subwoofers | Harman10_Subwoofers | OpusTrauma_Subwoofers |

Note: Opus Trauma is the only profile where G2 gets a **different** curve than the rest of the bed layer.

---

## Denon AVR-A1H Integration Notes

### Profile-to-Preset Mapping

Each Dirac filter project exports to a Speaker Preset slot on the Denon. Map these to Quick Select buttons for instant switching:

| Quick Select | Profile | Correction Engine | Use Case |
|---|---|---|---|
| QS1 | Cherry | ART | Daytime reference listening, music, casual viewing |
| QS2 | Harman +10 | ART | Cinema night, general movie watching |
| QS3 | Opus Trauma | **Bass Control** | Demo material, action movies, hip-hop, maximum tactile impact |
| QS4 | Night | ART | Late-night viewing, structural isolation |

### Gaming Consideration

For PS5 sessions via HDMI 4 → TV → eARC, Dirac ART should be **disabled** entirely. The heavy DSP processing + wireless sub delay introduces input lag that negates Game Mode's low-latency advantage. Configure a dedicated Speaker Preset with Dirac bypassed and Sub 2 (wireless) disabled.

### eARC Lip-Sync Settings

| Device | Setting | Value |
|---|---|---|
| Sony A80L | A/V Sync | On (forces video delay to match AVR audio processing) |
| Sony A80L | Pass through mode | Auto |
| Sony A80L | eARC Mode | Auto |
| Denon A1H | Auto Lip Sync | On |
| Denon A1H | Audio Delay | 0 ms |

For native TV apps (YouTube TV), use the Night or Cherry profile with a non-ART Speaker Preset to minimize DSP latency.

---

## Version History

| Date | Version | Changes |
|---|---|---|
| 2026-02-21 | v1 | Initial target curves created from Gemini conversation. Bed-layer curves flat (0 dB bass). Sub curves per Gemini specs. |
| 2026-02-21 | v2 | **Bass fix.** Added +4–6 dB bass shelf to all bed-layer curves. Bumped Cherry subs from 0 dB to +6 dB. Bumped Harman subs from +10 dB to +12 dB. Added +4 dB bass shelf to Opus Trauma center contour. Night bed layer set to +6 dB for Fletcher-Munson compensation. |
| 2026-02-21 | v3 | **Cross-term optimization.** Removed G9 (subs) as support for G6, G7, G8 (height groups). Cross-terms dropped from 91→67 of 92. Set G9 support level to -24 dB for G1, G2, and G9-self; kept -18 dB for G3–G5. Sub filters now track target curves significantly more accurately. Applied to all three active profiles (Harman +10, Grok Trauma, Night). |
| 2026-02-21 | v4 | **Opus Trauma.** Renamed Gemini Trauma → Opus Trauma. Redesigned sub curve: extended +20 dB shelf from 50→60 Hz to cover full 808 range, added +8 dB sustain at 100 Hz for kick punch (was 0 dB). Center scoop deepened from -3→-4 dB. Bed layer and center bass shelves increased from +4→+6 dB. Old GeminiTrauma files deleted, new OpusTrauma files created. |
| 2026-02-21 | v5 | **Opus Trauma moved to DLBC.** Switched Opus Trauma from ART to Dirac Live Bass Control. ART's active cancellation was consuming sub output and eliminating the room gain/decay that creates physical bass impact. On DLBC, all 5 subs produce 100% forward-facing bass with natural room reinforcement intact. Cherry and Harman +10 remain on ART for precision. |
