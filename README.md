# Pravasi Krishi Bandhu — প্রবাসী কৃষি বন্ধু

NRB / diaspora supporter programme for the **Krishi Ratna League — Bengal, Season 1**.
Joint **Bharatiya Krishak Samaj** × **KarmYog for the 21st Century**.

> **Stand behind one young farmer in the district your family came from.**
> ₹1,00,000 for one season, in five monthly instalments, with a dashboard open the whole way.

**Live site:** https://pravasi-krishi-bandhu.vercel.app
**Vercel project:** `pravasi-krishi-bandhu` (scope `ram-badrinathans-projects`)

---

## ⚠️ Known issue — the site needs a visual redesign

The current site uses a warm cream / earth palette (`#f6f1e4` paper, `#163a26` green,
`#c98a1f` gold) lifted from the BKS West Bengal site. **MahAcharyaJi's verdict (12 Sep 2026):
"dull and boring, very Claude — the colours are the Claude colours."** That is a fair call —
cream-and-warm-earth is Claude's own brand aesthetic, and it reads as a quiet institutional
document rather than a *league*.

**Direction for whoever picks this up:**

- The reference to match is **`BKS-Bengal/krl-bengal-launch`** (live at
  https://krl-bengal-launch.vercel.app/en — tagline *"Bengal's next great contest"*).
  There is already a KRL visual identity in production. Match it; do not invent a third.
- The KRL logo is **deep blue + gold wheat + green leaf**. A palette built from that blue
  would be far more distinctive than the current cream, and would sit correctly next to the
  logo instead of fighting it.
- This should feel like a **sports league** — contest energy, a table that moves, teams — not
  like an annual report. The copy already carries that; the design does not yet.
- What must survive any redesign: the honesty of the money table (90/10 split visible), the
  FCRA notice, and the "what we do not promise" section. Those are the credibility of the
  whole piece.

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
