# seosaw.github.io — the SEOSAW website

This is the website for SEOSAW, served at https://seosaw.africa (`https://seosaw.github.io` still works too — GitHub Pages redirects it to the custom domain). The code is stored on Bitbucket and automatically published to GitHub Pages on every push to `master`.

This website uses the Jekyll-Pithy theme for Jekyll. The code follows the MIT License.

---

## Quick reference for content editors

Common tasks and which file to edit:

| Task | File to edit |
|---|---|
| Add a publication | `_bibliography/references.bib` — add a new `@article` entry |
| Add or update a person | `_data/people.csv` is generated, don't edit it — edit the DB instead, see [Updating data pulled from the database](#updating-data-pulled-from-the-database) |
| Update homepage statistics | `_data/tickers.csv` is generated, don't edit it — see [Updating data pulled from the database](#updating-data-pulled-from-the-database) |
| Add a newsletter or news item | `news.md` — add a link or paragraph |
| Add or update a protocol | `manuals.md` — add a link pointing to the PDF on Bitbucket |
| Update the navigation links | `_includes/header.html` |
| Update footer logos | `_includes/footer.html` |
| Update the plot locations map | `scripts/plots.json` is generated, don't edit it — see [Updating the plot locations map](#updating-the-plot-locations-map) |

---

## How the site works

The site is built with [Jekyll](https://jekyllrb.com/), a static site generator. Page content is written in Markdown (`.md`) or HTML (`.html`) files. Jekyll processes these files — applying layouts and includes — and outputs a folder of plain HTML that can be served by any web server.

**Where the code lives:** Bitbucket — `bitbucket.org/miombo/seosaw_website`

**Where the site is served:** GitHub Pages — `github.com/seosaw/seosaw.github.io`, custom domain `seosaw.africa`

These are two separate repositories. You edit the source code on Bitbucket. Pushing to `master` on Bitbucket triggers a pipeline (see [Deployment](#deployment)) that builds the site and pushes the output to the GitHub repository, where GitHub Pages publishes it automatically.

You do not need to edit the GitHub repository directly.

---

## Site pages

| File | URL | Contents |
|---|---|---|
| `index.html` | `/` | Homepage: counters (plots, countries, trees, researchers), SEOSAW description, links to contact and mailing list |
| `about.md` | `/about.html` | Network overview, key publication, science plan, protocols summary, recent news highlights |
| `people.md` | `/people.html` | Steering committee, staff, fellows, student liaisons, data contributors, institutional logos |
| `publications.md` | `/publications.html` | Preferred citation for SEOSAW, table of peer-reviewed papers, working papers |
| `data.md` | `/data.html` | Interactive map of plot locations, information about the dataset, data request process, link to sample data |
| `data_users.md` | `/data_users.html` | List of researchers currently using SEOSAW data, with affiliations |
| `manuals.md` | `/manuals.html` | Links to field protocols (trees/plots, small stems, coarse woody debris, soil, ground layer, traits, social) in multiple languages |
| `manual_versions.md` | `/manual_versions.html` | Archive of all past versions of the field manuals |
| `news.md` | `/news.html` | Current newsletter (Microsoft Sway embed), archive of past newsletters and announcements |
| `contact.md` | `/contact.html` | Contact form (powered by Formspree) |
| `404.html` | (error route) | Custom page not found page |

---

## Editing content pages

All pages use `layout: default` in their frontmatter. Content is written in Markdown, but several pages embed raw HTML for tables and special formatting — both approaches work side by side.

### Updating data pulled from the database

**`_data/people.csv`, `_data/tickers.csv` and `scripts/plots.json` are all generated — do not edit them directly.**

They're produced from the `seosaw_db_v4` database repo (versioned CSVs, normally on the mounted `/Volumes/cryan/General/seosaw_database` volume) by a single script:

```
cd seosaw_db_v4
Rscript produce_outputs/03_export_website.R
```

This resolves the latest DB version automatically, writes the three files straight into this repo's working tree (`_data/people.csv`, `_data/tickers.csv`, `scripts/plots.json`), and prints a summary of what changed. Nothing is committed automatically — check `git diff` here and commit/push when you're happy with it.

**To add or update a person specifically:**
1. Open `00_people.csv` for the current DB version, on the mounted network volume — `/Volumes/cryan/General/seosaw_database/<version>/00_people.csv`. This is *not* a file in this repo, or even in the `seosaw_db_v4` repo itself; `seosaw_db_v4` only holds the R scripts that read it. If you're not sure which `<version>` is current, run the export script (the `Rscript` command above) without an argument — it resolves and prints the latest one automatically.
2. Find the person's row (or add a new one if they are not yet in the DB)
3. Edit the relevant `web_*` columns:
   - `web_url` — profile link (ResearchGate, institutional page, ORCID, etc.)
   - `web_institution` — institution name as it should appear on the website
   - `web_location` — country or location
   - `web_category` — which section they appear in; one of `steering_committee_cochair`, `steering_committee`, `staff`, `past_steering_committee`, `lead_contributors`, `other_contributors`. Use semicolons for multiple sections (e.g. `steering_committee;lead_contributors`)
   - `web_notes` — optional; shown in brackets after the name where `category` is `staff` (e.g. `co-chair`, `Project Scientist`). Co-chairs get their own section (`steering_committee_cochair`) rather than a notes field
   - Leave `web_category` as `NA` (blank) for people who should not appear on the website
4. Run the export script (the `Rscript` command above), then commit and push `_data/people.csv` in this repo to publish the change

`tickers.csv`'s `n_oneoff` counter is derived from the legacy one-off plots extract (see below), not the v4 DB.

### Updating the publications list

Publications are driven by `_bibliography/references.bib`. The page is rendered automatically by the [jekyll-scholar](https://github.com/inukshuk/jekyll-scholar) plugin using APA citation style, sorted by year (newest first). You do not need to edit `publications.md` itself.

To add a new peer-reviewed paper, add an entry to `references.bib`:

```bibtex
@article{citekey,
  author   = {Lastname, F. and Lastname, F.},
  title    = {{Full paper title}},
  journal  = {Journal Name},
  year     = {2025},
  doi      = {10.xxxx/xxxxx},
  keywords = {peer-reviewed}
}
```

The `keywords = {peer-reviewed}` field is required — it controls which section of the page the entry appears in. Working papers use `keywords = {working-paper}` instead.

Use `doi` when available. For papers without a DOI, use `url = {https://...}` instead. The DOI appears as a link at the end of the rendered citation.

For a book chapter, use `@incollection` with an added `booktitle` and `editor` field. For a technical report, use `@techreport` with an `institution` field. Both still need `keywords = {peer-reviewed}` to appear in the peer-reviewed section.

### Updating the homepage statistics

The counters in `index.html` are **not** hardcoded — they're pulled from `_data/tickers.csv` via Liquid (`{{ site.data.tickers[0].n_psp }}`, `.n_oneoff`, `.n_countries`, `.n_stem_measurements`, `.n_researchers`). Update them by regenerating `tickers.csv` through the DB export script — see [Updating data pulled from the database](#updating-data-pulled-from-the-database) — rather than editing `index.html` directly.

### Updating news

`news.md` is a standard Markdown page. Add links, headings, and paragraphs as needed. The current newsletter is embedded via a Microsoft Sway URL. To update the newsletter link, replace the Sway URL in the page.

### Updating manuals and protocols

`manuals.md` contains Markdown links pointing to PDFs hosted on Bitbucket. To add a new version or translation, add a link in the format:

```markdown
[English]({{ site.baseurl }}/manuals/...)
```

---

## Structural changes

### Layouts

Layouts live in `_layouts/`. The site uses two:

- `default.html` — the main wrapper used by all content pages; includes head, header, content, footer
- `bib.html` — used implicitly by jekyll-scholar (`bibliography_template: bib` in `_config.yml`) to render each entry on `publications.md`

Every content page uses `layout: default` directly. (Two other layouts, `page.html` and `redirect.html`, existed but were unused by any page and were removed 2026-08-04.)

### Includes

Reusable HTML fragments live in `_includes/`:

- `head.html` — `<head>` tag contents: meta, stylesheet link, Leaflet (conditional), favicon
- `header.html` — site title, motto, navigation menu
- `footer.html` — institutional logos (Miombo Network, University of Edinburgh LANDteam, Wits APES, NUST)
- `mailing-list-card.html` — mailing list signup card, used on `index.html` and `contact.md`
- `protocols-cards.html` — the field protocols/datasheets card grid, used on `manuals.md`

### Editing the navigation

The navigation links are defined in `_includes/header.html` as a list of `<a>` tags. To add, remove, or reorder pages in the nav, edit that list. Current order: Home, About, People, Publications, Data, Manuals, News, Contact.

### Editing the footer

`_includes/footer.html` contains the institutional logos displayed at the bottom of every page. Add or remove logo `<img>` tags here.

### Conditional page features via frontmatter

The Leaflet mapping library (CSS and JS) is only loaded on pages that need it. To enable it on a page, add `map: true` to the page's frontmatter:

```yaml
---
layout: default
map: true
---
```

This is checked in `_includes/head.html` and keeps Leaflet from loading on every page.

### CSS

Styles are in `_sass/_base.scss`, imported by `css/main.scss`. Edit `_base.scss` for layout, colour, typography, and component styles. The colour scheme and font variables are defined at the top of `main.scss`.

---

## Updating the plot locations map

The map on the Data page (`data.md`) is driven by files in `scripts/`:

- `plots.json` — site/plot point locations and metadata
- `Ecoregions2017.geojson` — the ecoregion polygons currently drawn on the map (colour-coded by `BIOME_NAME`, see the legend in `plotmap.js`)
- `region.json` — the old SEOSAW core region polygon. Still fetched by `plotmap.js`, but its rendering call is commented out since the ecoregions layer replaced it (August 2026) — it's currently dead weight (an unused network request) rather than something you need to edit. Worth removing the fetch, or reinstating the layer, next time someone's in this file.

`plots.json` is generated from the database along with `_data/people.csv` and `_data/tickers.csv` — see [Updating data pulled from the database](#updating-data-pulled-from-the-database). Run `Rscript produce_outputs/03_export_website.R` in `seosaw_db_v4`; don't hand-edit `plots.json`.

**Exact permanent-plot locations are never shipped to the browser.** The export script aggregates before writing the file:
- Permanent plots (PSPs) are grouped by `site_code` into one feature per site, at the site's mean location rounded to 1 decimal place (~10km). Properties: `site_code`, `n_psp`, `max_census`, `country`, `pi`, `permanent: true`. If every plot at a site is still missing coordinates in the DB, the export falls back to a manually-set placeholder (a `site_coord_overrides` table in `03_export_website.R`, e.g. Hwedza town for site `ZHZ`) so the site still shows up rather than being silently dropped — remove the override once real coordinates are added.
- One-off plots stay as individual features at native 2dp coordinates. These come from the legacy v3.2 database, not v4 — v4 only holds long-term (permanent) plots. See `seosaw_db_v4/produce_outputs/00_build_legacy_oneoff_extract.R` and `oneoff_legacy_2dp.csv`. Properties: `plot_id`, `country_iso3`, `prinv`, `n_census`, `permanent: false`, `plot_area`.

`plotmap.js` just splits the array on `permanent` and renders it — it no longer does any location averaging client-side. For example:

```json
[
  { "type": "Feature", "properties": { "site_code": "ABG", "n_psp": 12, "max_census": 2, "country": "AGO", "pi": "John L. Godlee", "permanent": true }, "geometry": { "type": "Point", "coordinates": [ 14.8, -15.1 ] } },
  { "type": "Feature", "properties": { "plot_id": "XYZ_1", "country_iso3": "ZMB", "prinv": "Jane Doe", "n_census": 1, "permanent": false, "plot_area": 0.5 }, "geometry": { "type": "Point", "coordinates": [ 26.4, -13.2 ] } }
]
```

`scripts/plots.geojson` and `scripts/region.geojson` (leftovers from the old synchronous-script-tag approach, see below) were removed 2026-08-04 — they were unused but still built into `_site/` and publicly servable, and `plots.geojson` held raw unaggregated plot coordinates, defeating the point of the aggregation above. Don't recreate them.

---

## Deployment

Pushing to `master` on Bitbucket triggers the Bitbucket Pipelines CI/CD process defined in `bitbucket-pipelines.yml`:

1. A Ruby Docker container installs gem dependencies (`bundle install`)
2. Jekyll builds the site (`bundle exec jekyll build`), outputting static HTML to `_site/`
3. The `_site/` output is force-pushed to `github.com/seosaw/seosaw.github.io`
4. GitHub Pages detects the push and publishes the new site automatically

The live site at https://seosaw.africa is typically updated within a minute or two of pushing to Bitbucket.

### Preview deployments

Pushing to the `dev` branch runs a separate step in the same pipeline: Jekyll builds the site with `--baseurl /preview` (so all links resolve under a subpath instead of the domain root), then the `_site/` output is force-pushed to a second GitHub repo, `github.com/seosaw/preview`. GitHub Pages serves that repo as a project page, which automatically appears at:

**https://seosaw.africa/preview/**

Any push to `dev` updates the preview within a minute or two — no need to merge to `master` first. Other branches (e.g. feature branches) only run the default `bundle exec jekyll build` check and aren't deployed anywhere.

(This replaced a Netlify preview deployment in August 2026 — Netlify is no longer used for this site.)

---

## Map slow loading fix (May 2026)

The Data page was loading very slowly. The cause was that `tinyworldmap.com` was included as an external script in `_includes/head.html`, which meant it was called on every page of the site, not just the map page. Additionally, the plot data was embedded directly as JavaScript global variables in `.geojson` files loaded synchronously as `<script>` tags, and the Leaflet library was loaded on every page regardless of whether a map was present.

The fix involved several changes:

- Removed `tinyworldmap.com` entirely and switched to OpenStreetMap tiles
- Made the Leaflet CSS/JS conditional in `_includes/head.html` so it only loads on pages with `map: true` set in their frontmatter
- Replaced the two `.geojson` script files with pure JSON files (`plots.json`, `region.json`) fetched asynchronously at runtime
- Changed `plotmap.js` to wrap all map initialisation in a `Promise.all()` fetch, so the map loads after the page rather than blocking it
- Added `defer` to the `plotmap.js` script tag in `data.md`

## data_users.md source data

`data_users.md` is a hand-maintained, cleaned-up copy of a spreadsheet tracked in SharePoint under Office > Data Use > Data Use Tracking. It is not data-driven — updates mean editing the page directly. Could be made data-driven in future, but the source spreadsheet would need cleaning first.

## Publications source data

The master list of SEOSAW publications (a superset of what's in `_bibliography/references.bib`) is tracked in [this Google Sheet](https://docs.google.com/spreadsheets/d/1lJcZrSE1Gv3x41eiRwzRUFFJ9t4WAY8V/edit?gid=350601356#gid=350601356). Use it as the source of truth when deciding what to add to `references.bib` — see [Updating the publications list](#updating-the-publications-list).

