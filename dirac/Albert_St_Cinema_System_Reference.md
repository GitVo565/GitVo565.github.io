# Albert St. Cinema — Complete System Reference
### Target Curves, Technical Specifications & Calibration Documentation

---

![Albert St. Cinema — Room View](assets/albert_st_cinema_hero.jpg)

*Image: `dirac/assets/albert_st_cinema_hero.jpg` (from IMG_7108).*

---

## 1. Room & Acoustic Environment

| Parameter | Detail |
|---|---|
| **Room Name** | Albert St. Cinema |
| **Dimensions** | 315 sq ft — 14'2" W × 21'9" D × 7'0" H |
| **Ceiling Treatment** | USG Sandrift R808 acoustic ceiling panels |
| **Wall Treatment** | Dedicated acoustic panels (wall-mounted) |
| **Flooring** | DreamWeaver Malibu III Carpet — Smoke Key, 60oz |

### Seating Layout

| Row | Seats | Model | Position | Notes |
|---|---|---|---|---|
| Row 1 — Command Tier | 3 | Valencia Tuscany Power Recliners (Black Nappa Leather) | 5.5 ft from center channel | Shifted 1.0–1.5 ft closer to screen for max FOV |
| Row 2 — The Gallery | 3 | Audio Advice Revelation Recliners | Elevated on 7.75" Octane Riser | Riser hollow cavity exploited as natural tactile transducer for rear subs |

**Riser Platform:** Octane Layout E — 7.75" H × 102" W. The hollow structure resonates with rear sub output, transferring physical bass energy directly into Row 2 seating frames.

---

## 2. Video & Source Devices

| Component | Detail |
|---|---|
| **Display** | Sony BRAVIA XR-83A80L 83" OLED 4K UHD HDR Google TV |
| **Cinema Source** | Nvidia Shield Pro → Philips Hue Play HDMI Sync Box (HDMI 3, eARC) |
| **Gaming Source** | PlayStation 5 → TV HDMI 4 (direct, preserves 120Hz/VRR) |
| **Bias Lighting** | Philips Hue Gradient Lightstrip synced to Hue Sync Box |

**eARC Lip-Sync Settings:**

| Device | Setting | Value |
|---|---|---|
| Sony A80L | A/V Sync | On (video delays to match AVR processing) |
| Sony A80L | Pass Through Mode | Auto |
| Sony A80L | eARC Mode | Auto |
| Denon A1H | Auto Lip Sync | On |
| Denon A1H | Audio Delay | 0 ms |

For native TV apps (YouTube TV), use Night or Cherry profile with a non-ART Speaker Preset to minimize DSP latency.

---

## 3. Audio Processing & Amplification

| Component | Detail |
|---|---|
| **AV Receiver** | Denon AVR-A1H — 15.4 channel, dual-core 1GHz DSP, 150W/channel |
| **External Amplifier** | Outlaw Model 5000x — 5-channel, powers Front L/C/R and Side Surrounds via Denon pre-outs |
| **Calibration System** | Dirac Live Active Room Treatment (ART) — 17-point wide-area sweep, both row headrest heights |
| **Channel Designation** | System is physically **9.5.6** (9 main + 5 subs + 6 heights). Denon displays **9.4.6ch** because it has 4 sub outputs; Sub Out 1 runs a Y-split to two physical units. |

### Amp Assign Configuration

Verified via Denon AVR-A1H web interface (`Setup → Speakers → Speaker Layout`).

| Channel | Connection | Amplifier | Rationale |
|---|---|---|---|
| Front L/R | **Pre-out Only** | Outlaw 5000x | Internal amp disconnected — eliminates back-EMF/interference to preamp stage |
| Center | **Pre-out Only** | Outlaw 5000x | Same — clean pre-out signal to external amp |
| Surround L/R | **Pre-out Only** | Outlaw 5000x | Same — Outlaw drives all 5 channels with zero internal amp load |
| Surround Back L/R | Spkr + Pre-out | Denon internal | Denon powers directly; pre-out available but unused |
| Front Wide L/R | Spkr + Pre-out | Denon internal | Denon powers directly; pre-out available but unused |
| Top Front L/R | Spkr + Pre-out | Denon internal | Denon powers directly |
| Top Middle L/R | Spkr + Pre-out | Denon internal | Denon powers directly |
| Top Rear L/R | Spkr + Pre-out | Denon internal | Denon powers directly |

**Why Pre-out Only matters:** Setting the Outlaw-driven channels to `Pre-out Only` physically disconnects the A1H's internal power amplifier for those 5 channels. This:
1. **Eliminates signal-path interference** — no back-EMF from unused internal amp stages coupling into the preamplifier output
2. **Frees power supply headroom** — the A1H's toroidal transformer no longer reserves current for 5 channels it isn't driving, redirecting that capacity to the remaining 10 Denon-driven speakers (2× Surround Back, 2× Front Wide, 6× ceiling)
3. **Reduces thermal load** — 5 fewer internal amp channels generating heat improves long-session thermal stability

---

## 4. Speaker Configuration

### ART Speaker Group Map

| Group | Channels | Speaker Model | Amplifier | Physical Position / Notes |
|---|---|---|---|---|
| G1 | Front Left & Right | Polk Audio RTi A7 towers | Outlaw 5000x | Floor-standing, front wall. Custom 12" × 16" rigid OSB platforms under each. |
| G2 | Center | Polk Audio CSi A6 | Outlaw 5000x | Below display, front wall. LFE Reference channel. |
| G3 | Front Wide Left & Right | Polk Audio FXi A6 | Denon internal | Bed layer, flanking front stage |
| G4 | Surround Left & Right | Polk Audio FXi A6 (Bipole mode) | Outlaw 5000x | Side walls, ear level |
| G5 | Surround Back Left & Right | Klipsch R-40-SA II | Denon internal | Rear wall, **mounted high** — above typical ear level |
| G6 | Top Front Left & Right | Sonance Visual Performance VP60R | Denon internal | In-ceiling, forward position |
| G7 | Top Middle Left & Right | Sonance Visual Performance VP60R | Denon internal | In-ceiling, overhead |
| G8 | Top Rear Left & Right | Sonance Visual Performance VP60R | Denon internal | In-ceiling, rear |
| G9 | Subwoofers 1–5 | 5× Klipsch RP-1600SW | Denon Sub Outs 1–4 | Distributed — see sub topology below |

**Note on G3/G4:** The 4× Polk FXi A6 units split across Front Wide (G3) and Side Surround (G4). G4 runs in Bipole mode for diffuse side-wall surround effect.

---

## 5. Subwoofer Array — "Virtual Wall + Rear Stage"

All 5× Klipsch RP-1600SW (16-inch drivers) decoupled from carpet on custom **24" × 20" flat-black OSB platforms** to restore transient attack and eliminate cabinet wobble.

**Physical Settings (all subs):** Phase 0° — LPF set to LFE/Bypass (Dirac handles all filtering).

### Sub Output Topology

| Sub Out | Physical Unit(s) | Connection | Notes |
|---|---|---|---|
| Sub Out 1 | Front Left sub + Front Right sub | Y-split via Arklove Shielded RCA | Unified "Virtual Front Wall" — two units driven as one |
| Sub Out 2 | Rear Center sub | Wireless — Dynasty ProAudio WSA-5TR-V2 (5.8GHz) | Introduces ~18–20ms transmission latency; Dirac corrects by delaying all wired channels to match |
| Sub Out 3 | Rear Right sub | Hardwired | |
| Sub Out 4 | Rear Left sub | Hardwired | |

**LFE Reference:** Center channel (G2) — aligns LFE transients with on-screen action.

**Wireless Sub Baseline Delay:** The ~18–20ms wireless latency (estimated from Dirac's measured compensation applied to wired speakers) establishes a high baseline delay across the entire system before room correction is layered on top.

---

## 6. Infrastructure & Power

| Component | Detail |
|---|---|
| **Dedicated Circuits** | 7 total — all audio gear on the same electrical phase to eliminate ground loops |
| **Sub Circuits** | Individual 20A lines for the 4 hardwired/Y-split subwoofers |
| **Amplifier Circuit** | Dedicated 20A line for Outlaw 5000x (1600W) |
| **AV Gear Circuit** | Dedicated circuit for AVR and source devices |
| **Snack Circuit** | Isolated rear-wall circuit — rear center wireless sub shares this circuit |
| **Cooling** | AC Infinity AIRCOM T9 top-exhaust active cooling units |
| **Automation** | Hubitat Elevation hub — local, zero-lag processing (e.g., "Hey Google, Activate Sync Box") |
| **Networking** | 5-node Wi-Fi Mesh with wired backhaul theater switch |

---

## 7. Dirac Live Calibration

### Project Files

| Project File | Engine | Profiles Included |
|---|---|---|
| `5 Subs 2 Rows Riser Level Cherry Gemini Active Support Recs.liveproject` | Dirac Live ART | Cherry, Harman +10, Night |
| `5 Subs 2 Rows Riser Level Cherry Gemini Bass Control Opus Trauma.liveproject` | Dirac Live Bass Control (DLBC) | Opus Trauma |

### Calibration Configuration

- **Sweep:** 17-point wide-area measurement, both row headrest heights
- **Sub Range:** All 5 subs run unrestricted Full Range (20Hz–150Hz) to support the full ART matrix and cancel longitudinal room modes
- **Sub Phase:** All subs at 0°, LPF set to LFE/Bypass

---

## 8. ART Support Matrix

Originally based on recommended assignments, then revised (v3) to resolve cross-term exhaustion.

### v2 Support Matrix (Original — Caused Cross-Term Exhaustion)

G9 supported all 8 groups. This consumed **91 of 92 available cross-terms**, leaving no DSP headroom for accurate filter calculation. ART power-corrected the sub filters, capping the Harman +12dB target to roughly +5–8dB delivered.

| Target Group | Supported By | Issue |
|---|---|---|
| G1–G5 | (various) + G9 | Correct — bed layer benefits from sub support |
| G6 (Top Front L/R) | G6, G9 | Wasteful — Sonance VP60R ceiling speakers don't need 16" sub cancellation |
| G7 (Top Middle L/R) | G7, G9 | Same — flat target, minimal benefit |
| G8 (Top Rear L/R) | G8, G9 | Same — flat target, minimal benefit |

### v3 Support Matrix (Current — Cross-Term Optimized)

Removed G9 support from height groups (G6, G7, G8). Cross-terms dropped from **91 → 67 of 92**, freeing 26% of the DSP budget.

| Target Group | Supported By | Rationale |
|---|---|---|
| G1 (Front L/R) | G1, G4, G9 | Self-support + same Outlaw amp (G4) + sub array |
| G2 (Center) | G1, G2, G9 | Same Outlaw amp (G1) + sub array. Isolated to protect vocal clarity |
| G3 (Front Wide L/R) | G3, G9 | Self-support + sub array. Both Denon internal — avoids cross-amp gain mismatch |
| G4 (Surround L/R) | G1, G4, G9 | Self-support + same Outlaw amp (G1) + sub array. G5 removed (Denon internal, gain mismatch) |
| G5 (Surround Back L/R) | G3, G5, G9 | Self-support + G3 (both Denon internal) + sub array |
| G6 (Top Front L/R) | G6 only | Sub support removed. Sonance VP60R ceiling speakers have flat targets and unobstructed paths |
| G7 (Top Middle L/R) | G7 only | Same logic as G6 |
| G8 (Top Rear L/R) | G8 only | Same logic as G6 |
| G9 (Subwoofers) | G9 only | Self-support. Dirac locked out G1 (insufficient acoustic power to cancel 5× 16" drivers). G2 excluded to protect vocals |

### G9 Frequency Support Range

G9's ART support operates within a defined frequency band:

| Parameter | Value | Significance |
|---|---|---|
| F Support Low | **20 Hz** | Lower bound of sub array support — covers the full audible sub-bass range |
| F Support High | **150 Hz** | Upper bound — aligns with all target curve taper endpoints (Cherry/Harman/Opus Trauma subs all taper to 0 dB at 150 Hz) |

This 20–150 Hz band defines where ART generates cross-group cancellation and support waves through the sub array. Above 150 Hz, the subs are not contributing ART corrections to any group.

### Support Level Settings

Dirac ART uses an **inverted dB scale** for support levels:
- **-24 dB** = more contribution (more aggressive cancellation/support)
- **-18 dB** = nominal (default)
- **-6 dB** = less contribution (lighter touch)

Targeted support levels applied after v3 matrix change:

| G9 Supporting... | Support Level | Rationale |
|---|---|---|
| G9 (self) | -24 dB | Maximize sub array self-optimization and forward bass output |
| G1 (Front L/R) | -24 dB | RTi A7 towers need the most sub support for bass shelf delivery |
| G2 (Center) | -24 dB | Dialogue body and LFE-to-center coherence |
| G3 (Front Wide L/R) | -18 dB | Nominal — FXi A6 smaller drivers, less bass demand |
| G4 (Surround L/R) | -18 dB | Nominal — side surrounds don't need aggressive bass fill |
| G5 (Surround Back L/R) | -18 dB | Nominal — R-40-SA II mounted high, flat target |

### Cross-Term Budget

The Denon AVR-A1H has a maximum of **92 cross-terms** for ART filter calculations.

| Configuration | Cross-Terms Used | Headroom |
|---|---|---|
| v2 (G9 supporting all groups) | 91 / 92 | 1 remaining — power correction aggressive |
| v3 (G9 removed from G6–G8) | 67 / 92 | 25 remaining — healthy headroom |

**Key lesson:** Having 5× 16-inch subwoofers generate cancellation waves for small in-ceiling Sonance VP60R speakers consumed massive DSP resources for virtually zero acoustic benefit. Those cross-terms are far better spent on accurate bass filter delivery for the front stage and sub array.

---

## 9. Acoustic Constraints

### Two-Row Acoustic Shadowing

The front-row Valencia Tuscany recliners have high seatbacks that physically block high-frequency dispersion from ear-level speakers to the elevated rear row.

- **Affected groups (obstructed):** G1, G2, G3, G4 — all ear-level bed-layer speakers below front-row headrests
- **Unaffected (clear line-of-sight):** G5 (R-40-SA II mounted high on rear wall), G6, G7, G8 (VP60R in-ceiling)
- **Compensation:** +3 dB treble boost from 4 kHz to 20 kHz on all obstructed bed-layer groups. Heights and G5 remain flat.

### Riser Platform Bass Interaction

The 7.75" Octane riser acts simultaneously as:
1. **Tactile transducer** — rear subs fire directly into the hollow platform, transferring physical vibration to Row 2 seats
2. **Broad-spectrum bass trap** — absorbs low-frequency acoustic energy, altering decay times

The 17-point Dirac ART sweep compensates for the riser's absorption. The Opus Trauma profile deliberately exploits the tactile transfer effect with its +20 dB sub shelf running on DLBC (natural room gain intact).

### Wireless Subwoofer Baseline Delay

Sub 2 (rear center, Dynasty ProAudio WSA-5TR-V2) introduces ~18–20ms transmission latency. Dirac detects this and delays all 14 wired speakers and 4 wired sub outputs by that margin to maintain full system time alignment. This sets a high baseline delay across the system before room correction is applied.

---

## 10. The Bass Problem (v1 Curves) and the Fix

### What Went Wrong

The original target curves (v1) specified:
- **0 dB flat bass** on all bed-layer groups (G1–G4)
- **+3 dB treble boost** on bed-layer groups for acoustic shadowing
- **0 dB flat** on Cherry subwoofers

Two compounding problems:

1. **No bass shelf on the bed layer.** Dirac aggressively flattens natural room gain. With a 0 dB target, all bass reinforcement is cut. The +3 dB treble boost made the effective bass-to-treble ratio **-3 dB** — the opposite of natural.

2. **ART cancellation overhead on subs.** G9 assigned as support for G1–G8, so all 5 subs generate phase-inverted cancellation waves for every other group. A significant portion of sub output is consumed as anti-bass.

### Research Basis

Dirac's official documentation:
> *"A strictly flat in-room response is usually perceived as overly bright, clinical, and lacking in bass."*

Recommended bass shelf: **+4 to +8 dB relative to midrange** (Harman target curve, Sean Olive 2012, validated via double-blind listening tests).

Fletcher-Munson equal-loudness contours: human hearing is less sensitive to bass at lower volumes, requiring a higher bass shelf for low-volume (nighttime) listening.

### The Fix (v2 Curves)

| Curve | v1 Bass | v2 Bass | Change |
|---|---|---|---|
| Cherry Subs (G9) | 0 dB flat | +6 dB shelf 10–80 Hz | Added reference-level sub shelf |
| Cherry Bed Layer (G1–4) | 0 dB flat | +4 dB shelf 10–80 Hz | Added Dirac-recommended minimum |
| Night Bed Layer (G1–4) | 0 dB flat | +6 dB shelf 10–80 Hz | Higher shelf for Fletcher-Munson at low volume |
| Night Subs (G9) | -10 dB shelf | -10 dB shelf (unchanged) | Structural isolation preserved |
| Harman Subs (G9) | +10 dB shelf | +12 dB shelf 10–80 Hz | +2 dB ART overhead compensation |
| Harman Bed Layer (G1–4) | 0 dB flat | +6 dB shelf 10–80 Hz | Matches Harman research |
| Opus Trauma Subs (G9) | +20 dB (50 Hz cutoff) | +20 dB (60 Hz cutoff) + 8 dB at 100 Hz | Extended shelf for full 808 + kick punch range |
| Opus Trauma Center (G2) | 0 dB bass | +6 dB shelf, -4 dB scoop | Full vocal body, deeper fatigue scoop |
| Opus Trauma Bed (G1–3–4) | 0 dB flat | +6 dB shelf 10–80 Hz | Maximum bed-layer warmth |

---

## 11. Target Curve Profiles

### Cherry — The Reference

Neutral, accurate listening. Moderate bass shelf for natural warmth. Acoustic shadowing compensated on bed layer.

| File | Groups | Curve Shape |
|---|---|---|
| `Cherry_Subwoofers_G9.targetcurve` | G9 | +6 dB shelf 10–80 Hz → taper to 0 dB at 150 Hz → flat |
| `Cherry_BedLayer_G1-G2-G3-G4.targetcurve` | G1, G2, G3, G4 | +4 dB shelf 10–80 Hz → taper to 0 dB at 200 Hz → flat 200–4k Hz → +3 dB boost 4k–20k Hz |
| `Cherry_Heights_G5-G6-G7-G8.targetcurve` | G5, G6, G7, G8 | Flat 0 dB |

### Night — Structural Isolation

Sub-bass killed to prevent structural transmission. Bed-layer bass shelf increased to compensate for Fletcher-Munson at reduced volume.

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

Opus Trauma runs on DLBC deliberately. ART's active room mode cancellation and decay reduction work against the raw, overwhelming bass impact this profile is designed to deliver. With DLBC:
- All 5 Klipsch RP-1600SW subs produce **100% forward-facing bass** — zero output consumed by phase-inverted cancellation
- Natural room gain and bass decay remain intact — the physical "wall of bass" sensation
- No cross-term budget constraint
- The +20 dB shelf stacks on top of room reinforcement, not against it

Designed for maximum tactile impact and demo-grade bass (tracks like "Taste" by Tyga). Redesigned in v4 with an extended sub shelf covering the full 808 range (30–60 Hz) AND kick punch (60–100 Hz). The wider shelf drives broader tactile energy into the Octane riser platform — Row 2 gets chest-slam AND kick punch, not just rumble.

| File | Groups | Curve Shape |
|---|---|---|
| `OpusTrauma_Subwoofers_G9.targetcurve` | G9 | +20 dB shelf 10–60 Hz → +8 dB at 100 Hz → taper to 0 dB at 150 Hz → flat |
| `OpusTrauma_Center_G2.targetcurve` | G2 only | +6 dB shelf 10–80 Hz → taper to 0 dB at 200 Hz → flat to 800 Hz → -4 dB scoop 1k–3k Hz → +3 dB boost 4k–20k Hz |
| `OpusTrauma_BedLayer_G1-G3-G4.targetcurve` | G1, G3, G4 | +6 dB shelf 10–80 Hz → taper to 0 dB at 200 Hz → flat 200–4k Hz → +3 dB boost 4k–20k Hz |
| `OpusTrauma_Heights_G5-G6-G7-G8.targetcurve` | G5, G6, G7, G8 | Flat 0 dB |

Note: Opus Trauma is the only profile where G2 (Center / CSi A6) gets a **different** curve from the rest of the bed layer.

**Sub curve design rationale:**
- 808 fundamentals: 30–50 Hz — +20 dB shelf covers completely
- Kick drum punch: 60–80 Hz — extended shelf maintains +20 dB through 60 Hz
- Mid-bass weight: +8 dB at 100 Hz preserves the physical impact of hip-hop and action movie transients
- Wider shelf drives more tactile spectrum into the Octane riser — felt as chest slam, not just floor rumble

---

## 12. Profile-to-Preset Mapping & Denon Integration

### Quick Select Mapping

| Quick Select | Profile | Engine | Use Case |
|---|---|---|---|
| QS1 | Cherry | ART | Daytime reference, music, casual |
| QS2 | Harman +10 | ART | Cinema, general movie watching |
| QS3 | Opus Trauma | **Bass Control** | Demo, action, hip-hop, maximum tactile impact |
| QS4 | Night | ART | Late-night, structural isolation |

### Gaming Consideration

See **Section 15** for the full PS5 Gaming Preset configuration and latency analysis.

### Denon Dynamic EQ

Dynamic EQ is located under **Setup → Audio → Restorer / Dynamic EQ** in the Denon receiver menu. It is **not accessible in the Denon web interface**. Dynamic EQ applies loudness compensation (boosting bass and treble) as master volume decreases, counteracting Fletcher-Munson roll-off. Recommended settings:

| Profile | Dynamic EQ | Notes |
|---|---|---|
| Cherry | Off or On | Personal preference at reference levels |
| Harman +10 | On | Enhances cinema feel at mid-volume |
| Opus Trauma | Off | Target curves are already at maximum; EQ on top is redundant |
| Night | On | Recommended — compensates for low-volume bass loss |

---

## 13. Impulse Response Analysis

Impulse response data captured from the Cherry ART project (`5 Subs 2 Rows Riser Level Cherry Gemini Active Support Recs`). All measurements taken in Filter Design → Impulse Response view with Separate Curves and Group Colours enabled.

### The Universal Finding: 116ms System Baseline

**Every corrected impulse across every group lands at approximately 116ms.** This is the system-wide baseline delay Dirac applied to time-align all wired speakers to Sub 2's wireless latency (~18–20ms transmission + acoustic path). The front RTi A7 towers sitting 5.5 feet in front of you are being held back ~50ms+ artificially. This is acoustically transparent during film/music playback but has direct implications for gaming — see Section 15.

### Group-by-Group Observations

| Group | Key Finding | Health |
|---|---|---|
| G1 — RTi A7 Towers | Front Left and Front Right traces overlap almost exactly. Room is acoustically symmetrical L/R. Outlaw 5000x delivers both channels with identical timing. Measured ringing is room-origin, not speaker. | Excellent |
| G2 — CSi A6 Center | Measured peak lands at same ms as G1 — confirming LFE reference alignment is working as intended. Cleaner impulse tail than G1 (single speaker, no L/R boundary interaction). | Excellent |
| G3 — FXi A6 Front Wide | Measured peak matches G1/G2 timing despite being on Denon internal amps (vs Outlaw for G1/G2). Confirms Denon pre-out path to Outlaw adds no meaningful delay. Front stage G1/G2/G3 is acoustically coherent before Dirac correction. | Excellent |
| G4 — FXi A6 Bipole Surrounds | Measured impulse is noticeably more diffuse and wide — this is the bipole design doing its job. Two driver arrays firing simultaneously in different directions create multiple arrival paths at the measurement mic. Dirac still corrects to a clean ~116ms peak. Do not attempt to "fix" this. | Expected / Normal |
| G5 — R-40-SA II Surround Back | **Cleanest corrected impulse in the entire set.** Near-zero tail oscillation. High rear-wall mounting position avoids floor/wall boundary interference that degrades typical ear-level surround impulses. These speakers are over-performing relative to their placement category. | Outstanding |
| G6 — Sonance VP60R Top Front | Measured peak arrives ~4ms earlier than bed-layer speakers (~60ms vs ~64ms). In-ceiling speakers are physically closer to both listening rows than front wall towers. Dirac adds a small delay to G6 to preserve Atmos height staging coherence. Peak amplitude lower (±0.3 vs ±0.5–0.6 for G1/G4) — expected for 6" in-ceiling drivers. | Normal / Expected |
| G9 — 5× RP-1600SW Subs | Sub 2 (red — wireless) shows distinctly different pre-ringing and oscillation tail vs. Subs 1, 3, 4. Wireless link introduces mild phase smearing in addition to fixed delay. Subs 1/3/4 (wired) track each other well. Corrected composite impulse is clean single-peak confirming Dirac's time-alignment is working. | Good |

### What The Data Confirms About the Room

1. **Room symmetry is healthy.** G1 L/R matching is tight — no major acoustic anomalies on either side.
2. **The Outlaw/Denon integration is clean.** No timing offset introduced by the pre-out chain — front stage speakers regardless of amp source arrive together.
3. **G5 high mounting was a good decision.** R-40-SA II placed above ear level on the rear wall avoids the boundary interference that ruins most surround-back impulses.
4. **Bipole G4 behavior is correct.** The diffuse measured impulse is intentional — FXi A6 in bipole mode creates the enveloping effect by design. Dirac handles it correctly.
5. **Sub 2 wireless is the latency anchor for the entire system.** Everything else pays the delay tax to synchronize with it.

---

## 14. Dirac Distance Registers (Cherry Preset)

Captured from the Denon AVR-A1H web interface (`Setup → Speakers → Distances`). These values represent per-channel delays (in milliseconds) that Dirac wrote into the Denon's speaker distance registers after calibration. All values are relative to the slowest source in the system.

| Speaker | Delay (ms) | Notes |
|---|---|---|
| Front L | 21.8 | |
| Front R | 22.0 | Δ from Front L: **0.2 ms** — confirms L/R room symmetry |
| Center | 22.6 | |
| Subwoofer 1 | 18.8 | Y-split front pair |
| **Subwoofer 2** | **0.0** | **Wireless — latency anchor.** All other speakers delayed to match this unit. |
| Subwoofer 3 | 17.9 | Rear Right — identical to Sub 4 |
| Subwoofer 4 | 17.9 | Rear Left — confirms symmetric rear sub placement |
| Surround L | 24.9 | |
| Surround R | 25.0 | Δ from Surround L: 0.1 ms |
| Surround Back L | 21.9 | |
| Surround Back R | 22.0 | Δ from SB L: 0.1 ms |
| Front Wide L | 23.5 | |
| Front Wide R | 23.5 | Δ: **0.0 ms** — perfectly symmetric |
| Top Front L | 26.6 | |
| Top Front R | 26.7 | Δ: 0.1 ms |
| Top Middle L | 27.5 | Highest delay — physically closest to MLP |
| Top Middle R | 27.5 | Δ: 0.0 ms |
| Top Rear L | 26.6 | |
| Top Rear R | 26.7 | Δ: 0.1 ms |

### Key Observations

1. **Subwoofer 2 at 0.0 ms confirms it as the system delay anchor.** The Dynasty ProAudio wireless link is the slowest path in the system. Dirac assigns it zero delay and pushes every other speaker later to compensate. This is the physical basis of the ~116ms system baseline observed in impulse data.

2. **L/R symmetry is extraordinary.** Maximum left-right delta across all 9 speaker pairs: **0.2 ms** (Front L/R). Front Wide and Top Middle pairs are at exactly 0.0 ms delta. The room's acoustic geometry is near-perfectly symmetric, confirming that manual per-sub phase alignment for the Y-split front pair was unnecessary (see FAQ Q9).

3. **Delay hierarchy tracks physical distance to MLP:**
   - Subs: 0–18.8 ms (furthest from ears, lowest delay)
   - Bed layer: 21.8–25.0 ms (ear level, mid-distance)
   - Heights: 26.6–27.5 ms (in-ceiling, physically closest to seated listeners, need the most delay)

4. **Sub 3 and Sub 4 at identical 17.9 ms** — independent confirmation that the rear left and rear right subs are equidistant from the MLP. Combined with the identical G1 L/R impulse data, this validates the room's bilateral symmetry across both the front and rear sub arrays.

5. **Subwoofer 1 (Y-split pair) at 18.8 ms** — 0.9 ms more delay than the rear subs (17.9 ms). The front pair is slightly closer to the MLP than the rear subs, so Dirac delays them more to compensate. This 0.9 ms differential corresponds to roughly 1 foot of acoustic path difference at the speed of sound.

### Level Trims (Cherry Preset)

Captured from Denon AVR-A1H web interface (`Setup → Speakers → Levels`). These values are **Dirac-managed and locked** — they cannot be manually edited because they are part of the calibrated Speaker Preset. Each trim represents Dirac's measured per-channel sensitivity correction: positive values boost speakers that are quieter at the MLP (further away, less boundary reinforcement, lower driver sensitivity); negative values cut speakers that are louder (closer, more direct path, higher raw output).

| Speaker | Trim (dB) | Speaker | Trim (dB) | L/R Δ |
|---|---|---|---|---|
| Front L | +1.0 | Front R | 0.0 | 1.0 dB |
| Center | +3.0 | — | — | — |
| Front Wide L | +0.5 | Front Wide R | +0.5 | **0.0 dB** |
| Surround L | 0.0 | Surround R | -0.5 | 0.5 dB |
| Surround Back L | +3.5 | Surround Back R | +3.5 | **0.0 dB** |
| Top Front L | -3.0 | Top Front R | -3.0 | **0.0 dB** |
| Top Middle L | -2.5 | Top Middle R | -2.5 | **0.0 dB** |
| Top Rear L | -3.5 | Top Rear R | -2.0 | 1.5 dB |
| Subwoofer 1 | -3.5 | Subwoofer 2 | -2.5 | — |
| Subwoofer 3 | -2.5 | Subwoofer 4 | -2.0 | — |

### Level Trim Observations

1. **Surround Back L/R at +3.5 dB — highest positive trim.** These R-40-SA II speakers are mounted high on the rear wall, giving them the cleanest impulse response in the system but also the longest acoustic path to MLP. Dirac compensates with the largest gain boost.

2. **Center at +3.0 dB — second-highest.** The CSi A6's below-display placement may create floor-reflection cancellation notches, or the speaker has slightly lower sensitivity than the flanking RTi A7 towers. Dirac boosts to match the front stage.

3. **All height speakers negative (-2.0 to -3.5 dB).** The Sonance VP60R in-ceiling units fire directly downward toward the MLP with minimal boundary interference. They're physically closest to listeners (confirmed by highest delay values in the distance table) and naturally louder. Dirac attenuates them to match the bed layer.

4. **All subwoofers negative (-2.0 to -3.5 dB).** Five 16-inch Klipsch RP-1600SW drivers in 315 sq ft produce enormous raw SPL. Dirac trims them down to prevent overwhelming the bed layer before target curve shaping is applied.

5. **L/R SPL symmetry confirms time-domain symmetry.** Four pairs show perfect 0.0 dB matching (Front Wide, Surround Back, Top Front, Top Middle). The room's bilateral symmetry is independently validated from both time-of-arrival and SPL perspectives. The Top Rear pair at 1.5 dB delta is the largest asymmetry — likely due to ceiling geometry or HVAC ductwork affecting one speaker's boundary loading differently.

6. **Locked trims are expected behavior.** Dirac writes these values into the Denon's Speaker Preset during calibration. They cannot be manually edited without invalidating the calibration. To change them, a new Dirac sweep must be run.

---

## 15. PS5 Gaming Preset

### Why Dirac ART Cannot Be Used for Gaming

The Cherry/Harman/Night Speaker Presets exported by Dirac contain ~116ms of artificial delay applied to every channel to align all speakers with Sub 2's wireless latency. Even with Dirac's frequency correction bypassed, if you are on a Dirac-generated preset the audio itself is delayed 116ms relative to the PS5's output. For competitive gaming and rhythm games this is disqualifying. Additionally:

- Dirac ART DSP processing adds computation latency on top of the baseline delay
- Dolby Atmos via eARC → Denon adds an additional 100–300ms of processing delay (documented on AVS Forum with Denon AVRs specifically)
- The wireless Sub 2 (Dynasty ProAudio WSA-5TR-V2) adds ~18–20ms even outside of Dirac

**Result: ART profiles are unusable for gaming. A purpose-built Gaming Preset is required.**

### PS5 Signal Path (Already Optimal for Video)

The PS5 is connected directly to TV HDMI 4, not through the AVR. This is the correct configuration — video never passes through the Denon, so Game Mode on the Sony A80L operates at full effect (<10ms video latency). Audio travels PS5 → TV → eARC → Denon AVR-A1H.

### PS5 Console Settings

| Setting | Value | Reason |
|---|---|---|
| Screen → Resolution | 4K | Sony A80L HDMI 4 supports 4K/120Hz |
| Screen → Enable 120Hz Output | On | PS5 supports 120Hz; A80L supports it on HDMI 4 |
| Screen → VRR | On | Variable Refresh Rate eliminates screen tearing with zero added latency |
| Screen → ALLM (Auto Low Latency Mode) | On | Signals TV to auto-engage Game Mode — eliminates manual switching |
| Sound → Output Device | TV | Audio goes TV → eARC → Denon (do not set to HDMI Out directly to AVR) |
| Sound → Audio Format (Priority) | **Linear PCM** | Critical: Dolby Atmos via eARC adds 100–300ms delay on Denon AVRs. Linear PCM bypasses this — you lose Atmos object rendering but gain ~150–250ms |
| Sound → 3D Audio for TV Speakers | Off | Irrelevant when using external AVR |

### Sony A80L Settings (Gaming)

| Setting | Value | Reason |
|---|---|---|
| Picture → Picture Mode | Game | Enables low-latency display mode (<10ms) |
| HDMI Input Settings → HDMI Signal Format (HDMI 4) | Enhanced format | Required for 4K/120Hz and VRR |
| A/V Sync | Off | No processing compensation needed; PS5 and Game Mode are in sync |
| ALLM | Auto | Let PS5 ALLM signal control Game Mode automatically |

### Denon AVR-A1H Gaming Speaker Preset

Create a dedicated Speaker Preset (separate from Cherry/Harman/Night/Opus Trauma) with the following:

**Step 1 — Create a fresh preset without Dirac:**
- In Denon Setup, create a new Speaker Preset based on a standard Audyssey or manual calibration — NOT from a Dirac export
- This eliminates the 116ms baseline delay entirely

**Step 2 — Disable Sub 2 (wireless):**
- Physically power off the Dynasty ProAudio WSA-5TR-V2 transmitter during gaming, or set Sub 2 trim to minimum in the Speaker Preset
- The wireless sub introduces ~18–20ms delay and its transient smearing is more noticeable in game audio than in film/music
- The 4 wired subs (front pair Y-split, rear right, rear left) are sufficient for gaming bass

**Step 3 — Audio Mode Settings:**

| Setting | Value |
|---|---|
| Sound Mode | Direct or Pure Direct |
| Dirac Live | Off (do not select a Dirac Speaker Preset) |
| ALLM | Enabled in Denon HDMI Setup |
| Dynamic EQ | Off |
| Dynamic Volume | Off |
| Restorer | Off |
| Audio Delay | 0 ms |

**Step 4 — eARC Configuration:**

| Setting | Value |
|---|---|
| Denon HDMI Control | On |
| ARC | On |
| eARC Mode | Auto |
| eARC Receiver | Enabled |

### Gaming Preset vs. Cinema Profile Comparison

| Factor | Cinema (Cherry/Harman) | Gaming Preset |
|---|---|---|
| Dirac Engine | ART or Bass Control | None |
| System Baseline Delay | ~116ms | <5ms |
| Sub 2 Wireless | Active | Disabled |
| Dolby Atmos | Full object rendering | Off (Linear PCM) |
| Audio Format | TrueHD / Atmos | 5.1 / 7.1 Linear PCM |
| Input Lag (audio) | ~120–300ms | <10ms |
| Subwoofers Active | All 5 | 4 (Sub 2 off) |
| Use Case | Film, music, demo | Competitive gaming, rhythm games, any 120Hz session |

### Quick Select Assignment Recommendation

| Quick Select | Profile | Use |
|---|---|---|
| QS1 | Cherry | Reference cinema / music |
| QS2 | Harman +10 | Cinema bass |
| QS3 | Opus Trauma | Demo / maximum impact |
| QS4 | Night | Late-night |
| QS5 | **Gaming Preset** | PS5 / all 120Hz gaming |

---

## 16. .targetcurve File Format Reference

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
- Load via: Filter Design tab → select group → menu (⋯) → Load target curve

---

## 17. Group Assignment Quick Reference

| Group Selected | Cherry | Night | Harman +10 | Opus Trauma |
|---|---|---|---|---|
| G1 (Front L/R — RTi A7) | Cherry_BedLayer | Night_BedLayer | Harman10_BedLayer | OpusTrauma_BedLayer |
| G2 (Center — CSi A6) | Cherry_BedLayer | Night_BedLayer | Harman10_BedLayer | **OpusTrauma_Center** |
| G3 (Front Wide — FXi A6) | Cherry_BedLayer | Night_BedLayer | Harman10_BedLayer | OpusTrauma_BedLayer |
| G4 (Surround L/R — FXi A6 Bipole) | Cherry_BedLayer | Night_BedLayer | Harman10_BedLayer | OpusTrauma_BedLayer |
| G5 (Surround Back — R-40-SA II) | Cherry_Heights | Night_Heights | Harman10_Heights | OpusTrauma_Heights |
| G6 (Top Front — VP60R) | Cherry_Heights | Night_Heights | Harman10_Heights | OpusTrauma_Heights |
| G7 (Top Middle — VP60R) | Cherry_Heights | Night_Heights | Harman10_Heights | OpusTrauma_Heights |
| G8 (Top Rear — VP60R) | Cherry_Heights | Night_Heights | Harman10_Heights | OpusTrauma_Heights |
| G9 (Subs — 5× RP-1600SW) | Cherry_Subwoofers | Night_Subwoofers | Harman10_Subwoofers | OpusTrauma_Subwoofers |

---

## 18. FAQ — Design Decisions & Technical Rationale

### Q1: Why is Opus Trauma on DLBC instead of ART? Won't ART give better correction?

ART's primary function is reducing room modes, standing waves, and bass decay. For Cherry and Harman +10, that precision is exactly what you want — tight, controlled, seat-to-seat consistent bass. But for Opus Trauma, those acoustic phenomena are the point. Lingering room gain, reinforced standing waves, and long bass decay are what make bass feel physically overwhelming.

With all 5 RP-1600SW subs assigned as ART support speakers, a significant portion of their output was consumed by phase-inverted cancellation waves actively fighting the room. We tested Opus Trauma on ART first and the result was technically clean but perceptually underwhelming — the +20 dB shelf was being partially eaten by cancellation overhead and power correction.

On DLBC, all 5 subs produce 100% forward-facing bass. The +20 dB shelf stacks on top of natural room reinforcement instead of fighting against it. The move to DLBC is permanent — there is no plan to migrate back.

### Q2: How does the Night profile work? Is it just Cherry with less bass?

No — it's more nuanced than a simple bass cut. Night makes two opposing changes simultaneously:

- **Sub curve (G9):** -10 dB shelf from 10–50 Hz, tapering to 0 dB at 100 Hz. This kills the sub-bass frequencies that transmit through walls and floors (structural isolation). Bass above 100 Hz is untouched.
- **Bed layer curve (G1–G4):** +6 dB shelf from 10–80 Hz — **higher than Cherry's +4 dB**, not lower. This compensates for the Fletcher-Munson effect: at reduced master volume, human hearing loses bass sensitivity disproportionately. The +6 dB shelf restores perceptually natural tonal balance at -30 to -40 dB listening levels.

The ART support matrix is unchanged from Cherry. All three ART profiles (Cherry, Harman +10, Night) share the same project file and the same v3 support matrix. Sub attenuation is handled entirely by the target curve, not by altering ART's support structure.

### Q3: Are the Side Surrounds (G4) grouped with the Front Stage or the Rear Surrounds in ART?

Neither, strictly speaking. The grouping strategy is **amplifier-topology-aware**, not position-based.

G4 (Side Surrounds, FXi A6, on Outlaw 5000x) is supported by **G1, G4, and G9**. G1 (Front L/R, RTi A7) is on the same Outlaw amp — this lets ART coordinate their cancellation waves without fighting different amplifier gain structures.

G5 (Surround Back, R-40-SA II, on Denon internal) does NOT support G4 despite being a "surround" speaker, because it's on a different amplifier. Instead, G5 is supported by G3 (Front Wide, FXi A6, also Denon internal) — same amp topology, clean coordination.

This amplifier-aware grouping was one of the key decisions in the v3 matrix revision that dropped cross-terms from 91 to 67 of 92.

### Q4: For the PS5 Gaming Preset, why not just build a Dirac profile that excludes the wireless sub?

Even without Sub 2, a Dirac-generated Speaker Preset still runs all audio through Dirac's DSP pipeline — filter convolution, group correction, room EQ. That processing adds latency. Additionally, the Denon stores the time-alignment delays Dirac calculated into the Speaker Preset itself. Even if Dirac correction is "bypassed," a Dirac-generated preset carries the embedded delay structure.

The only way to eliminate the ~116ms baseline delay is to use a Speaker Preset that was never built by Dirac. The Gaming Preset (QS5) is created fresh in the Denon's native calibration, runs in Direct mode (minimal DSP), with Sub 2 physically powered off and audio set to Linear PCM (Dolby Atmos via eARC adds an additional 100–300ms on Denon AVRs independently of Dirac). Result: audio latency drops from ~116–300ms to <10ms.

### Q5: Does the Opus Trauma center channel -4 dB scoop at 1k–3k Hz affect dialogue clarity?

The scoop is a deliberate listening fatigue countermeasure for sustained high-SPL playback, not a dialogue reduction. The 1k–3k Hz range is where human hearing is most sensitive (ear canal resonance peak). At Opus Trauma's intended demo-grade volumes, this region becomes physically painful within minutes without attenuation.

The -4 dB cut reduces perceived sharpness and sibilance without making dialogue sound muffled — it takes the edge off harsh transients (gunshots, impacts, vocal sibilants) while preserving intelligibility. The earlier v2 curve had -3 dB; we deepened to -4 dB in v4 because the extended +8 dB mid-bass at 100 Hz added enough center channel energy that the upper-mid contrast became harsher.

Cherry, Harman +10, and Night do not have this scoop — at their intended volumes, the natural 1k–3k Hz response is fine.

### Q6: Does pushing +8 dB at 100 Hz through the rear subwoofers cause bass to localize behind the listeners?

First, the curve is +20 dB from 10–60 Hz tapering to +8 dB at 100 Hz — not +20 dB at 100 Hz. By 150 Hz it's back to 0 dB. But the localization question is valid since 80 Hz is the commonly cited threshold.

Four factors prevent rear-biased localization in this room:

1. **Distributed array with front anchoring.** Sub Out 1 drives the front left + front right pair as a "Virtual Front Wall." The brain latches onto the earliest-arriving bass for localization (precedence effect), and the front subs are physically closest to both rows. The front pair anchors the soundstage forward.

2. **Riser energy is tactile, not auditory.** The hollow Octane platform vibrates at frequencies the body feels through the seat frame — this bypasses the auditory localization system entirely. The brain interprets spine-transmitted vibration as whole-body impact, not a directional sound source.

3. **Room modes destroy point-source localization.** At 100 Hz in a 14'2" × 21'9" room, standing waves create pressure distributions that have nothing to do with sub positions. With 5 distributed subs exciting different modes, the bass field is diffuse and omnidirectional.

4. **DLBC's less-precise timing helps.** Unlike ART, DLBC doesn't aggressively time-align each sub's output into a mathematically precise wavefront. The slightly less precise timing across the 5-sub array creates a more enveloping, spacious bass field — controlled chaos that works in Opus Trauma's favor.

Net result: the soundstage stays anchored to the screen. Row 2 guests feel bass through the riser and in their chest but perceive it as coming from the movie.

### Q7: How are the 6 Atmos ceiling speakers handled during PS5 gaming on LPCM 7.1?

LPCM 7.1 is a bed-layer format — it has no native height channel data. The 6 Sonance VP60R in-ceiling speakers have no content to play unless the Denon generates it. Two options are available within the Gaming Preset (same non-Dirac Speaker Preset, Sub 2 off, Linear PCM — just toggle the sound mode):

**Option A — Direct Mode (ceiling silent, absolute minimum latency):**
Set Denon Sound Mode to Direct. Zero DSP processing beyond volume. The VP60R speakers go silent. Use for competitive multiplayer, rhythm games, or any session where input responsiveness is the priority.

**Option B — Multi Ch In + Dolby Surround (ceiling active, ~5ms added):**
Set Denon Sound Mode to Multi Ch In, then enable the Dolby Surround upmixer. The Denon derives synthetic height content from the 7.1 bed and feeds it to the ceiling speakers. The upmixer is lightweight native DSP — it adds single-digit milliseconds, not the 100–300ms that Atmos-via-eARC decoding costs. Use for single-player cinematic games (God of War, Horizon, The Last of Us) where spatial immersion from rain, helicopters, and ambient effects is worth the negligible latency trade.

Both options stay on the same QS5 preset. Toggle via the Denon remote's Sound Mode button — no preset switching needed.

### Q8: Does the 116ms Dirac baseline delay cause lip-sync issues during movie playback?

No. With the Nvidia Shield Pro as the primary cinema source connected through the Philips Hue HDMI Sync Box to the Denon (not via TV eARC), lip sync has been verified as correct during normal movie playback on all ART profiles (Cherry, Harman +10, Night). The Denon's Auto Lip Sync communicates its total processing delay (including Dirac's time-alignment) and the system compensates automatically.

The eARC lip-sync chain (TV → Denon) has not yet been tested with native TV apps or PS5 Blu-ray playback. If lip-sync drift is observed on those paths, a manual Audio Delay offset in the Denon (positive or negative, a few ms) may be needed to fine-tune. This is a known consideration for eARC setups with high DSP delay — the eARC spec supports up to ~500ms of reported delay, so the protocol itself is not the limitation.

**Current status:** Shield Pro path = confirmed good. TV eARC path = untested. PS5 Blu-ray path = untested.

### Q9: Did the front Y-split subwoofers need manual alignment before Dirac sweeps?

No. The two front RP-1600SW subs (driven as one by Sub Out 1 via Y-split) required no manual gain-matching or time-alignment with REW or miniDSP.

Three conditions make manual alignment unnecessary:

1. **Identical signal.** The Arklove Shielded RCA Y-split sends the same signal, phase, and level to both units. There is no per-unit DSP channel — Dirac treats them as a single acoustic source.

2. **Symmetric placement.** The subs are positioned at mirror locations flanking the screen (front-left, front-right). In a symmetric room, both are equidistant from the MLP center. Equal path length = equal arrival time = constructive summation.

3. **Confirmed room symmetry.** The G1 (Front L/R) impulse response data shows Front Left and Front Right traces overlapping almost exactly. The room's boundary reflections and absorption characteristics are closely matched on both sides.

With identical signal + symmetric placement + symmetric room, the two subs sum as a coherent wavefront at the MLP. Dirac's 17-point sweep measures this combined output and corrects the composite response as a single source — which acoustically, it is.

If the room were asymmetric (one side opening to a hallway, the other hitting solid wall), or if the subs were at different distances from the MLP, comb filtering would appear in measurements and a miniDSP would be needed for per-unit delay correction.

### Q10: Why are the Outlaw channels set to "Pre-out Only" instead of "Spkr + Pre-out"?

The Denon AVR-A1H's Amp Assign settings allow each channel to be configured as `Spkr + Pre-out` (internal amp active, pre-out signal also sent) or `Pre-out Only` (internal amp physically disconnected, only pre-out signal sent).

Front L/R, Center, and Surround L/R are all set to **Pre-out Only** because they are driven exclusively by the Outlaw Model 5000x external amplifier via the Denon's pre-outs. Setting these to Pre-out Only provides three benefits:

1. **Signal path isolation.** Disconnecting the internal power amplifier for those 5 channels eliminates any possibility of back-EMF or parasitic coupling from unused output stages interfering with the preamplifier signal. The Outlaw receives the cleanest possible line-level feed.

2. **Power supply headroom.** The A1H's toroidal transformer no longer reserves current capacity for 5 channels it isn't driving. That freed headroom is available to the remaining 10 Denon-driven speakers: Surround Back L/R (G5), Front Wide L/R (G3), and all 6 in-ceiling Sonance VP60R height speakers (G6, G7, G8). During demanding Atmos peaks with simultaneous height activity across all 6 ceiling channels, the A1H has substantially more thermal and current headroom than it would with 15 internal channels active.

3. **Thermal stability.** Five fewer internal amplifier channels generating heat during sustained playback sessions (particularly Opus Trauma at demo levels) improves long-session thermal behavior of the remaining internal channels.

The 10 Denon-driven channels remain at `Spkr + Pre-out`. The pre-out jacks for those channels are available but not connected to anything — the Outlaw 5000x only has 5 input channels. This is the standard configuration when mixing an external multi-channel amp with the AVR's internal amplification.

### Q11: What was the "cross-term exhaustion" problem and how was it solved?

The Denon AVR-A1H has a hard DSP limit of **92 cross-terms** for ART filter calculations. Each support relationship between speaker groups consumes cross-terms proportional to the number of channels involved.

In the original v2 support matrix, G9 (5 subwoofers) was assigned to support all 8 other groups. This consumed 91 of 92 cross-terms, leaving virtually no DSP headroom. ART responded by "power correcting" the sub filters — capping the Harman +12 dB shelf to only +5–8 dB delivered. The subs were being asked to do so much cancellation work across so many groups that the DSP ran out of budget for accurate bass reproduction.

The fix (v3 matrix): removed G9 support from G6, G7, and G8 (the six Sonance VP60R ceiling speakers). These are small in-ceiling drivers with flat 0 dB targets — having five 16-inch subwoofers generate cancellation waves for them consumed massive DSP resources for virtually zero acoustic benefit. Cross-terms dropped from 91 to 67, freeing 26% of the DSP budget. Sub filters now track target curves accurately.

---

## 19. Version History

| Date | Version | Changes |
|---|---|---|
| 2026-02-21 | v1 | Initial target curves created. Bed-layer curves flat (0 dB bass). Sub curves per initial specs. |
| 2026-02-21 | v2 | **Bass fix.** Added +4–6 dB bass shelf to all bed-layer curves. Bumped Cherry subs to +6 dB. Bumped Harman subs to +12 dB. Added bass shelf to Opus Trauma center. Night bed layer set to +6 dB for Fletcher-Munson compensation. |
| 2026-02-21 | v3 | **Cross-term optimization.** Removed G9 support from G6, G7, G8. Cross-terms dropped 91→67 of 92. Set G9 support level to -24 dB for G1, G2, and G9-self; -18 dB for G3–G5. |
| 2026-02-21 | v4 | **Opus Trauma redesign.** Renamed Grok Trauma → Opus Trauma. Extended +20 dB shelf from 50→60 Hz. Added +8 dB at 100 Hz for kick punch. Center scoop deepened to -4 dB. Bed layer and center bass shelves increased to +6 dB. Old files deleted, new OpusTrauma files created. |
| 2026-02-21 | v5 | **Opus Trauma moved to DLBC.** Switched from ART to Dirac Live Bass Control. ART's active cancellation was eliminating the room gain that creates physical bass impact. On DLBC, 5 subs produce 100% forward-facing bass with natural room reinforcement intact. |
| 2026-02-22 | v6 | **Full system specification added.** Incorporated complete room, video, speaker, subwoofer, power, and infrastructure specs. Speaker models confirmed (RTi A7, CSi A6, FXi A6, R-40-SA II, VP60R, RP-1600SW). G3/G4 FXi A6 distribution clarified. Sub wireless unit identified (Dynasty ProAudio WSA-5TR-V2). File renamed from `TARGET_CURVE_TECHNICAL_NOTES.md` to `Albert_St_Cinema_System_Reference.md`. |
| 2026-02-23 | v7 | **Impulse response analysis added (Section 13).** Documented per-group findings: G5 R-40-SA II outstanding, G4 bipole diffuse (expected), G6 VP60R arrives 4ms earlier, 116ms universal baseline confirmed. **PS5 Gaming Preset added (Section 14).** Full latency analysis, PS5 console settings, Sony A80L Game Mode settings, dedicated Denon Speaker Preset instructions (no Dirac, Sub 2 off, Direct mode, Linear PCM). QS5 slot assigned to Gaming Preset. |
| 2026-02-23 | v8 | **FAQ section added (Section 17).** 10 Q&A entries covering: DLBC vs ART rationale, Night profile design, amp-topology-aware grouping, Gaming Preset bypass reasoning, center channel fatigue scoop, 100 Hz localization, cross-term exhaustion, sky layer during LPCM gaming (Direct vs Dolby Surround upmix options), 116ms lip-sync status (Shield confirmed good, eARC/Blu-ray untested), Y-split sub alignment (not needed — symmetric placement confirmed by impulse data). |
| 2026-02-23 | v9 | **Image reference added.** Hero image placeholder for `assets/albert_st_cinema_hero.png` (convert IMG_7108.HEIC). **Webpage overhaul.** `albert_st_cinema_9kL2z.html` rebuilt with full technical content: system metrics, speaker map, sub topology, ART support matrix grid, cross-term bar, profile cards, impulse summary, PS5 gaming preset, FAQ. Modern design (Outfit + JetBrains Mono, dark theme). Link to full MD reference. |
| 2026-02-23 | v10 | **Amp Assign configuration added (Section 3).** Documented Pre-out Only vs Spkr + Pre-out per channel from Denon web interface. **Dirac Distance Registers added (Section 14).** Full per-channel delay table from Cherry preset: Sub 2 at 0.0 ms confirms latency anchor, L/R symmetry max delta 0.2 ms, Sub 3/4 identical at 17.9 ms, height speakers 26.6–27.5 ms (closest = most delay). **FAQ Q10 added** — Amp Assign Pre-out Only rationale (signal isolation, PSU headroom, thermal stability). Old Q10 renumbered to Q11. Sections 15–19 renumbered (new Section 14 inserted). Gallery images added to webpage (room view + seating, click-to-expand lightbox). |
| 2026-02-23 | v11 | **Level trims added (Section 14).** Dirac-managed per-channel sensitivity corrections from Cherry preset: SB L/R highest boost (+3.5 dB, furthest path), all heights negative (-2 to -3.5 dB, closest), all subs negative (-2 to -3.5 dB, overpowered). 4 of 8 L/R pairs at perfect 0.0 dB SPL delta — independently confirms room symmetry from SPL perspective. Top Rear pair at 1.5 dB delta is largest asymmetry (possible ceiling geometry). Documented locked-trim expected behavior. Webpage updated with level trim table and summary cards. |
| 2026-02-23 | v12 | **v3 support matrix live-verified** against Dirac Live after recalculate — all 9 groups match documentation exactly, 67/92 cross-terms confirmed. **G9 frequency support range added (Section 8):** F Support Low 20 Hz, F Support High 150 Hz — defines the ART cross-group support band, aligns with all target curve sub taper endpoints. |
