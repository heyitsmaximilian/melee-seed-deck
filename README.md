# Handoff: Melee Visual System — Styling Refactor

## Overview
This package captures the **Melee visual design system** as expressed in the seed deck
(`Melee Seed Deck.html`, included here as the reference artifact). Use it to refactor the
styling of the marketing/app client — specifically the `/full-landing` and
`/crypto-markets-ux` routes — so they share one coherent dark, high-contrast,
"mechanism/quant" aesthetic.

## About the Design Files
The bundled `Melee Seed Deck.html` is a **design reference authored in HTML** — it is the
source of truth for the *look* (color, type, spacing, component treatments), **not** code to
copy into the client. Recreate these tokens and patterns inside the client's existing
environment (React/Next + whatever CSS solution it already uses — CSS Modules, Tailwind,
styled-components). Map the values below onto the client's existing token layer rather than
hard-coding hex values per component.

## Fidelity
**High-fidelity.** Colors, typography, and spacing below are final. Match them exactly.

## Design Tokens

### Color
| Token | Value | Use |
|---|---|---|
| `--bg` | `#0a0b0d` | Page background (near-black) |
| `--bg-card` | `#0f1013` | Card / panel surface |
| `--bg-card-hover` | `#151619` | Card hover surface |
| `--primary` | `#a28cfc` | Brand accent (violet) — highlights, active states, CTAs |
| `--green` | `#34d399` | Positive / "good" state |
| `--cyan` | `#22d3ee` | Secondary accent (funnel end, gradients) |
| `--amber` | `#fbbf24` | Attention |
| `--red` | `#f87171` | Negative / "bad" state |
| `--text` | `#ffffff` | Primary text |
| text-secondary | `rgba(255,255,255,0.55)` | Body copy |
| text-tertiary | `rgba(255,255,255,0.40)` | Supporting |
| text-muted | `rgba(255,255,255,0.32)` | Labels, kickers |
| text-faint | `rgba(255,255,255,0.18)` | Watermark numerals |
| `--border` | `rgba(255,255,255,0.06)` | Hairline dividers, card borders |
| `--border-hover` | `rgba(255,255,255,0.12)` | Hover border |

**Accent usage rule:** violet `--primary` is used sparingly — one accented phrase per
headline, active/selected state, and primary CTA. Glows are `--primary` at low alpha with
large blur (e.g. `radial-gradient(circle, rgba(162,140,252,0.22), transparent 60%)`,
`filter: blur(80px)`).

### Typography
- **Sans:** `Inter`, weights 400/500/600/700/800. Used for all display + body.
- **Mono:** `JetBrains Mono`, weights 400/500/600. Used for kickers, labels, tags, metadata,
  numeric callouts — always uppercase with wide tracking.
- **Tracking:** base body `-0.01em`; large titles `-0.035em` to `-0.045em`; mono labels
  `+0.14em` to `+0.28em` (wider as size decreases).
- **Scale (deck @1920×1080, scale down proportionally for web):**
  hero `120–320px/700–800`; section title `~80px/700`; card title `~40px/700`;
  body `24–28px/400`; mono label `14–24px/500`.
- **Line-height:** display `0.9–1.05`; body `1.4–1.55`.

### Shape & depth
- Border radius: cards `16–24px`; pills/chips `999px`; small tiles `12–16px`.
- Borders: 1px hairlines at `--border`; accented panels use `1px` of
  `color-mix(in srgb, var(--primary) 28–40%, var(--border))` + a `2–3px` left accent bar.
- Accent panels get a faint tint: `color-mix(in srgb, var(--primary) 4–6%, transparent)` or
  a subtle top-to-bottom violet gradient.
- Shadows are used almost exclusively as **glows** on accent elements
  (`box-shadow: 0 0 20px var(--primary)`), not drop shadows.

### Spacing
- Generous. Frame padding ~88px top / 96px sides (deck). On web, translate to large section
  padding and 24–48px gaps between cards.
- Layout is **flex/grid with `gap`** throughout; multi-column comparison grids use hairline
  `--border` dividers between cells.

## Recurring Component Patterns (apply to both routes)
- **Kicker/eyebrow:** mono, uppercase, `--text-muted`, wide tracking, often prefixed with a
  short rule line or `—`.
- **Card:** `--bg-card` fill, 1px `--border`, 16–20px radius, 40–48px padding. Primary variant
  adds violet border tint + faint gradient/glow.
- **Stat block:** big sans number + mono uppercase label beneath, left-aligned with a 2px
  `--primary` left border.
- **Comparison table/matrix:** grid with hairline dividers; header row on `#0a0b0d`; the Melee
  column/row tinted violet with a left accent bar and `--primary` text.
- **Bullet list:** dot markers; active/highlighted context switches dots to `--primary` + glow.
- **Progression / timeline:** hairline connector line, node dots, the active node filled
  `--primary` with a glow.

## Route-specific notes
- **/full-landing** — hero should use the centered-headline + radial violet glow treatment
  (see deck slide 1 / slide 12). One violet accent phrase in the headline; mono metadata in
  the corners; CTA in `--primary`.
- **/crypto-markets-ux** — this maps to the "Wedge: crypto price markets" story. Lean on the
  comparison-grid and stat-block patterns; use `--cyan` as the secondary accent for
  market/price data and `--primary` for Melee's own affordances. Keep numeric/price data in
  `JetBrains Mono` with tabular numerals (`font-variant-numeric: tabular-nums`).

## Assets
- Fonts: Inter + JetBrains Mono (Google Fonts). The client should already load these or add
  them to its font pipeline.
- No raster brand assets required for the styling layer; team avatars in the deck
  (`assets/team-*.jpeg`) are content, not part of the system.

## Files
- `Melee Seed Deck.html` — full visual reference (all tokens and component patterns rendered).
  Open it and inspect the `:root` block + component CSS for exact values.
