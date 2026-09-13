# Pravasi Krishi Bandhu — প্রবাসী কৃষি বন্ধু

NRB / diaspora supporter programme for the **Krishi Ratna League — Bengal, Season 1**.
Joint **Bharatiya Krishak Samaj** × **KarmYog for the 21st Century**.

> **Stand behind one young farmer in the district your family came from.**
> ₹1,00,000 for one season, in five monthly instalments, with a dashboard open the whole way.

**Live site:** https://pravasi-krishi-bandhu.vercel.app
**Vercel project:** `pravasi-krishi-bandhu` (scope `ram-badrinathans-projects`)

---

## 🔴 The PDFs are STALE — do not circulate them

**The website is at v2. `Pravasi-Krishi-Bandhu.pdf` and `Pravasi-Krishi-Bandhu-3page.pdf` are
still v1** and now contradict the site on material points: the money split, the qualification
gate, the awards date, the FCRA framing, the CTA, and Deshmukh's title. The Drive copies are the
same v1.

**Regenerate both from `FACTS.md` before any of them goes out.** Until then the website is the
only current artifact.

## Site v2 — 13 September 2026

**Palette.** v1 used a cream / warm-earth palette lifted from the BKS West Bengal site.
MahAcharyaJi's verdict (12 Sep): *"dull and boring, very Claude — the colours are the Claude
colours."* Fair — cream-and-warm-earth is Claude's own brand aesthetic, and it read as an annual
report rather than a league. v2 is built on the **KRL mark's own deep blue** (`#1B3A7A` /
`#0A1730`) with wheat gold (`#C8901F`) and leaf green (`#3E8E35`). Still worth a pass against
`BKS-Bengal/krl-bengal-launch` (*"Bengal's next great contest"*) so the two KRL properties
converge.

**Full Bengali.** EN/BN toggle in the header, every block translated, Bengali numerals in Bengali
mode, Noto Sans Bengali. Choice persists in `localStorage`; a `bn-*` browser locale defaults to
Bengali.

**Sammy's 13 Sep revisions, all in:** ₹1 Lakh stated explicitly with the USD equivalent · *vite* →
**bheete (ভিটে)** · "thirty years" → "many decades" · *aspiration* as the anchor word · 15 teams
stated firmly · "verification layer" → **Support & Verification** · Sthapana / BangaManthan /
RashtraManthan roadmap moved to the top · MahAcharyaJi credited as State President · entities
backgrounded to "We are 80G registered" · money split broken out 90 / 6 / 2 / 2 · Sundar tied to
agro-tourism and Samriddhi to Technology · gate reworded to **harmful** chemicals with local and
herbal solutions · awards moved to **before** Durga Puja 2027 · farm choice by bheete
(village / block / P.O. / P.S.) · failure reframed as **struggle** · FCRA reframed positively ·
CTA is now **Raise Your Hand** with the call as follow-up · five outbound links added.

**Two things still needed from you:** the **photographs** (two marked slots are live on the page —
an ancestral bheete, and the Munshi Bheri pandal on the working farm) and the **explanatory video
URLs**. Use real photographs, not stock or AI — this is a fundraising page about a real Puja and
real people.

---

## Repository contents

| Path | What it is |
|---|---|
| `FACTS.md` | **Read this first.** The locked fact sheet. Every number in every artifact comes from here, with its source and vintage. Do not introduce a figure that is not in this file. |
| `pravasi-krishi-bandhu/` | The deployed website (static `index.html` + two logo PNGs) |
| `document.html` | The 12-page A4 document, source |
| `three-pager.html` | The 3-page appeal, source |
| `copy-for-review.html` | Plain-text copy, staged into a Google Doc for the team to edit |
| `assets/` | `masthead-t.png`, `krl-logo-t.png` — white grounds already knocked out to transparent |
| `render.ps1` | Renders any of the HTML files to A4 PDF via headless Chrome, then rasterises pages for QA |

## Building the PDFs

```powershell
./render.ps1 -Html "document.html"    -Pdf "Pravasi-Krishi-Bandhu.pdf"       -QaDir "qa"
./render.ps1 -Html "three-pager.html" -Pdf "Pravasi-Krishi-Bandhu-3page.pdf" -QaDir "qa3"
```

Requires Chrome and Python with PyMuPDF + Pillow. The script prints page count and page
dimensions, and writes one PNG per page into the QA directory. **Always check the QA PNGs for
content spilling into the footer** — four pages overflowed on the first pass.

## Delivered artifacts

| | Link |
|---|---|
| 12-page document (PDF) | https://drive.google.com/file/d/1B5ZIWlnQ9II5i1clNi68Ovek8Ztfgsea/view |
| 3-page appeal (PDF) | https://drive.google.com/file/d/1EEj1utJvZff1G__Q4VKXUXuD39S3R5gB/view |
| Copy for review (Google Doc) | https://docs.google.com/document/d/1_Ae7wKzgjmjKlrwJ7WCmRmNy8Zws5fGAy9NYdr4rzeA/edit |

---

## The offer, in one table

| | |
|---|---|
| Support per farm, per season | **₹1,00,000** |
| Structure | **5 monthly instalments of ₹20,000** |
| To the farm | **₹90,000** |
| To the League (verification, mentoring, platform, prizes) | **₹10,000 — 10%** |
| Choice | Supporter is shown **3 applicants**, picks one |
| Before Durga Puja 2026 | **₹10 crore = 1,000 farms** |
| Full Season 1 | ₹50 crore = 5,000 farms |

## Editorial rules baked into these files

- **Never print "75 years" for BKS.** Founded **3 April 1955** by Dr Panjabrao S. Deshmukh →
  71 years. Printed as *"Since 1955 — seven decades for the Indian farmer."*
- **"nearly five decades"**, not "60 years", for centre–state alignment (last aligned 1972–77).
- **"Safe Drive Save Life"** — not "Safe Drive Safe Live".
- **"Mrs Rinku Majumder Ghosh"** — with an *e*. The BKS WB website's "Majumdar" is wrong.
- **"Smart Integrated Farm"** — not "Integrated Farm Experience".
- Programme name is **Pravasi Krishi Bandhu**; "Vite Alumni Network" is retired as a label,
  *vite / bati* kept as the emotional vocabulary inside it.
- Figures the source briefing marked *not final* (farms per constituency, team count, farms per
  team, marking rubric, jury) are labelled as such wherever they appear. Keep them labelled.

## ⚠️ FCRA — read before changing the "who may give" copy

KarmYog for the 21st Century Foundation holds **80G**. It does **not** hold **FCRA**.

Under FCRA an **OCI cardholder or foreign passport holder is a foreign source**, regardless of
where they were born — so most "Bengali in Chicago" readers cannot lawfully give today.

**In print, the invitation is limited to resident Indians and NRIs holding Indian passports.**
OCI / foreign-passport readers are asked to *register interest* while FCRA is pursued.

Nothing about routing foreign contributions through a resident or NRI relative appears in any
artifact, and it must not be added. That is a conversation for a call, never for a published
document under a masthead carrying a sitting MSP Committee member's name.

## Open items awaiting MahAcharyaJi's ruling

1. **"Dudh Kumar Mondal"** — verified from public record (sworn in 1 Jun 2026, MLA Mayureswar).
   The brief said "Dutt Kumar Mondal". Confirm before print.
2. **"Munshi Bheri"** — three spellings across sources (Munsibheri / Munshi Bheri / Munshibari).
   Using *Munshi Bheri* (*bheri* is the correct East Kolkata Wetlands term).
3. **Signatory** — currently Mahacharya Sourabh J. Sarkar alone. Add Krishan Bir Chaudhary?
4. **Instalment cadence** — 5 × ₹20,000 monthly (five months). Should it span the full season?
5. **The 90/10 split** — the 10% is taken *out of* the ₹1,00,000, so the farm receives ₹90,000.
   The source briefing says a "₹1,00,000 seed grant". If the farmer must receive the full lakh,
   the ask becomes ₹1,11,000 and three pages change.

---

Vault: `01_projects/krishi-ratna-league/status.md` in the KarmYog vault.
