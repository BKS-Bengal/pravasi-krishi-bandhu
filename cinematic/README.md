# Cinematic build — Pravasi Krishi Bandhu

A film-led treatment of the appeal page: full-bleed video hero, warm gold / dark-ground
alternation, heavy display type. **Built on the corrected v2 content** (13 September 2026
revisions), not the superseded v1.

## Provenance

The design originated with **Aryan Singh** —
`github.com/aryansingh173173-lab/pravasi-krishi-bandhu-cinematic`, live at
`pravasi-krishi-bandhu-cinematic-tau.vercel.app`. His build forked commit `da81a10`, which was
**v1**, so it carried every error Samarpita's 13 September review corrected: "one hundred thousand
rupees" in the hero, *vite* rather than *bheete*, "thirty years", the quote ending on *prestige*,
Deshmukh as "first Union Agriculture Minister", the old `100% chemical free` gate, no Bengali
toggle, no three-year roadmap, and **no FCRA notice at all**.

MahAcharyaJi's instruction, 14 September: *"This has been made, BUT on the version that was
rendered obsolete by the next version. Should make it with the corrected version of the website."*

So this folder is: **Aryan's cinematic language, driven by the corrected content.**

## What was kept from Aryan's build

- The full-bleed video hero (`media/krl-intro.mp4`, 20 MB, with `krl-poster.jpg` fallback)
- `cinema.js` — autoplay that respects `prefers-reduced-motion`, `saveData`, and tab visibility.
  Unchanged.
- `serve.cjs` — the local static server with byte-range support. Unchanged.
- The light/dark section rhythm, the amber offer band, the warm gold palette

## What changed

`index.html` is now the corrected v2 page. `cinema.css` was rewritten to drive **v2's token set**
rather than v1's, and to style the components v2 added that v1 never had:

| v2-only component | Class |
|---|---|
| Three-year roadmap | `.roadmap` / `.phase` |
| Outbound link cards | `.linksec` / `.lk` |
| East Kolkata Wetlands photo + caption | `.photo` / `.shots` |
| Remaining photo slot | `.shot` |
| Language switcher | `.langsw` |
| Money rows: farm highlight, sub-rows | `.money .r.farm`, `.money .r.sub` |
| Bengali sub-labels on the grading cards | `.dim .nb` |
| Roadmap phase labels in the timeline | `.tl .d .ph` |

Section classes were added to the v2 markup so Aryan's selectors keep working: `.roadmap`,
`.return`, `.league`, `.credentials`, `.linksec`, `.transparency`, `.journey`.

**One deliberate departure from Aryan's design:** his header was `position:absolute` and
transparent, so it scrolled away. v2 puts the **language toggle** in the header, and a reader who
scrolls past it can no longer switch to Bengali. The header here stays sticky, with a dark
translucent ground so it still reads as cinematic over the film.

## Running it

```
node serve.cjs
```
→ http://127.0.0.1:8000

## Verified

29 content checks run against the served HTML — every 13 September correction present, every v1
error absent. Rendered and inspected at 1440px across the full page.

## Still open

- **The ancestral *bheete* photograph.** The slot is live and visible.
- **Explanatory video URLs.** The card says "coming shortly".
- The East Kolkata Wetlands image is an **AI rendering**, captioned as such. It should be replaced
  with a real Munshi Bheri photograph when one exists, and the caption dropped.

Content authority is `../FACTS.md`. Do not introduce a number that is not in it.
