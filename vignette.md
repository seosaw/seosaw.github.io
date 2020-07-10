---
layout: default
---

<head>

<script>// Pandoc 2.9 adds attributes on both header and div. We remove the former (to
// be compatible with the behavior of Pandoc < 2.8).
document.addEventListener('DOMContentLoaded', function(e) {
  var hs = document.querySelectorAll("div.section[class*='level'] > :first-child");
  var i, h, a;
  for (i = 0; i < hs.length; i++) {
    h = hs[i];
    if (!/^h[1-6]$/i.test(h.tagName)) continue;  // it should be a header h1-h6
    a = h.attributes;
    while (a.length > 0) h.removeAttribute(a[0].name);
  }
});
</script>


<style type="text/css">code{white-space: pre;}</style>
<style type="text/css" data-origin="pandoc">
pre > code.sourceCode { white-space: pre; position: relative; }
pre > code.sourceCode > span { display: inline-block; line-height: 1.25; }
pre > code.sourceCode > span:empty { height: 1.2em; }
code.sourceCode > span { color: inherit; text-decoration: inherit; }
div.sourceCode { margin: 1em 0; }
pre.sourceCode { margin: 0; }
@media screen {
div.sourceCode { overflow: auto; }
}
@media print {
pre > code.sourceCode { white-space: pre-wrap; }
pre > code.sourceCode > span { text-indent: -5em; padding-left: 5em; }
}
pre.numberSource code
  { counter-reset: source-line 0; }
pre.numberSource code > span
  { position: relative; left: -4em; counter-increment: source-line; }
pre.numberSource code > span > a:first-child::before
  { content: counter(source-line);
    position: relative; left: -1em; text-align: right; vertical-align: baseline;
    border: none; display: inline-block;
    -webkit-touch-callout: none; -webkit-user-select: none;
    -khtml-user-select: none; -moz-user-select: none;
    -ms-user-select: none; user-select: none;
    padding: 0 4px; width: 4em;
    color: #aaaaaa;
  }
pre.numberSource { margin-left: 3em; border-left: 1px solid #aaaaaa;  padding-left: 4px; }
div.sourceCode
  {   }
@media screen {
pre > code.sourceCode > span > a:first-child::before { text-decoration: underline; }
}
code span.al { color: #ff0000; font-weight: bold; } /* Alert */
code span.an { color: #60a0b0; font-weight: bold; font-style: italic; } /* Annotation */
code span.at { color: #7d9029; } /* Attribute */
code span.bn { color: #40a070; } /* BaseN */
code span.bu { } /* BuiltIn */
code span.cf { color: #007020; font-weight: bold; } /* ControlFlow */
code span.ch { color: #4070a0; } /* Char */
code span.cn { color: #880000; } /* Constant */
code span.co { color: #60a0b0; font-style: italic; } /* Comment */
code span.cv { color: #60a0b0; font-weight: bold; font-style: italic; } /* CommentVar */
code span.do { color: #ba2121; font-style: italic; } /* Documentation */
code span.dt { color: #902000; } /* DataType */
code span.dv { color: #40a070; } /* DecVal */
code span.er { color: #ff0000; font-weight: bold; } /* Error */
code span.ex { } /* Extension */
code span.fl { color: #40a070; } /* Float */
code span.fu { color: #06287e; } /* Function */
code span.im { } /* Import */
code span.in { color: #60a0b0; font-weight: bold; font-style: italic; } /* Information */
code span.kw { color: #007020; font-weight: bold; } /* Keyword */
code span.op { color: #666666; } /* Operator */
code span.ot { color: #007020; } /* Other */
code span.pp { color: #bc7a00; } /* Preprocessor */
code span.sc { color: #4070a0; } /* SpecialChar */
code span.ss { color: #bb6688; } /* SpecialString */
code span.st { color: #4070a0; } /* String */
code span.va { color: #19177c; } /* Variable */
code span.vs { color: #4070a0; } /* VerbatimString */
code span.wa { color: #60a0b0; font-weight: bold; font-style: italic; } /* Warning */

</style>

<script>
// apply pandoc div.sourceCode style to pre.sourceCode instead
(function() {
  var sheets = document.styleSheets;
  for (var i = 0; i < sheets.length; i++) {
    if (sheets[i].ownerNode.dataset["origin"] !== "pandoc") continue;
    try { var rules = sheets[i].cssRules; } catch (e) { continue; }
    for (var j = 0; j < rules.length; j++) {
      var rule = rules[j];
      // check if there is a div.sourceCode rule
      if (rule.type !== rule.STYLE_RULE || rule.selectorText !== "div.sourceCode") continue;
      var style = rule.style.cssText;
      // check if color or background-color is set
      if (rule.style.color === '' && rule.style.backgroundColor === '') continue;
      // replace div.sourceCode by a pre.sourceCode rule
      sheets[i].deleteRule(j);
      sheets[i].insertRule('pre.sourceCode{' + style + '}', j);
    }
  }
})();
</script>

</head>

<body>

<h1 class="title toc-ignore">Cleaning and analysing SEOSAW data</h1>
<h4 class="date">2020-06-14</h4>


<div id="introduction" class="section level1">
<h1>Introduction</h1>
<p><strong>seosawR</strong> is a package for working with data in the <a href="https://seosaw.github.io/data.html">SEOSAW</a> dataset. The package serves two main purposes:</p>
<ol style="list-style-type: decimal">
<li>Format data for inclusion into the SEOSAW dataset, or for comparison with the existing SEOSAW dataset.</li>
<li>Provide convenience functions for further analysis and manipulation of the SEOSAW dataset.</li>
</ol>
</div>
<div id="repository-structure" class="section level1">
<h1>Repository structure</h1>
<p>The <a href="https://bitbucket.org/miombo/seosaw/">SEOSAW code repository</a> is currently hosted on BitBucket. It contains the SEOSAW R package, reproducible code used to format data from each site, and code for further SEOSAW analyses. Below is a breakdown of directories in the repository and what they contain:</p>
<ul>
<li><code>cleaning</code> - site level R scripts which clean data so it follows the SEOSAW format</li>
<li><code>analysis</code> - directories containing analyses conducted by SEOSAW members</li>
<li><code>seosawr</code> - the SEOSAW R package</li>
<li><code>web</code> - Code and outputs for the <a href="https://seosaw.github.io/">SEOSAW website</a></li>
<li><code>manuals</code> - Instructions and advice on collecting and analysing SEOSAW data</li>
</ul>
<p>Note that the SEOSAW dataset lives in a separate repository with limited private access, due to the sensitivity of some datasets.</p>
<p>To access the SEOSAW repository, use <code>git clone ...</code> or download the repository directly from BitBucket.</p>
</div>
<div id="seosaw-package-functions" class="section level1">
<h1>SEOSAW package functions</h1>
<p>Most of the functions in the SEOSAW package act on either one of or both the SEOSAW dataset tables, with the column names necessary for that function specified by additional arguments in the function. For example, the function to calculate aboveground biomass:</p>
<div class="sourceCode" id="cb1"><pre class="sourceCode r"><code class="sourceCode r"><span id="cb1-1"><a href="#cb1-1"></a>mstems<span class="op">$</span>agb &lt;-<span class="st"> </span><span class="kw">agbGen</span>(<span class="dt">x =</span> mstems, <span class="dt">plot_data =</span> mplots, </span>
<span id="cb1-2"><a href="#cb1-2"></a>  <span class="dt">species_name =</span> <span class="st">&quot;species_orig_binom&quot;</span>, </span>
<span id="cb1-3"><a href="#cb1-3"></a>  <span class="dt">diam =</span> <span class="st">&quot;diam&quot;</span>, </span>
<span id="cb1-4"><a href="#cb1-4"></a>  <span class="dt">stem_plot_id =</span> <span class="st">&quot;plot_id&quot;</span>, </span>
<span id="cb1-5"><a href="#cb1-5"></a>  <span class="dt">plot_plot_id =</span> <span class="st">&quot;plot_id&quot;</span>,</span>
<span id="cb1-6"><a href="#cb1-6"></a>  <span class="dt">latitude_of_centre =</span> <span class="st">&quot;latitude_of_centre&quot;</span>, </span>
<span id="cb1-7"><a href="#cb1-7"></a>  <span class="dt">longitude_of_centre =</span> <span class="st">&quot;longitude_of_centre&quot;</span>, </span>
<span id="cb1-8"><a href="#cb1-8"></a>  <span class="dt">allometry =</span> <span class="st">&quot;chave14&quot;</span>)</span></code></pre></div>
<p>The column name arguments default to the column names specified by the SEOSAW dataset, but can be altered by the user to allow for some flexibility.</p>
<p>Most top level functions specify a dataframe as the first argument (<code>x</code>). Depending on the function, the output is normally either a modified version of <code>x</code> with multiple columns added, or a simple vector with the same length as <code>nrow(x)</code> and the same row order as <code>x</code>. See the <code>agbGen()</code> example above for a function which returns a vector, and the species generator function <code>speciesGen()</code> for an example which returns a modified version of <code>x</code>:</p>
<div class="sourceCode" id="cb2"><pre class="sourceCode r"><code class="sourceCode r"><span id="cb2-1"><a href="#cb2-1"></a>mstems_species &lt;-<span class="st"> </span><span class="kw">speciesGen</span>(mstems,</span>
<span id="cb2-2"><a href="#cb2-2"></a>  <span class="dt">return_unknown =</span> <span class="ot">TRUE</span>, <span class="dt">return_unknown_cjb =</span> <span class="ot">TRUE</span>, <span class="dt">return_unknown_gnr =</span> <span class="ot">TRUE</span>) </span></code></pre></div>
<pre><code>## Correcting taxonomy</code></pre>
<pre><code>## Checking if species are new to SEOSAW</code></pre>
</div>
<div id="the-seosaw-dataset" class="section level1">
<h1>The SEOSAW dataset</h1>
<div id="datasets-columns-and-units" class="section level2">
<h2>Datasets, columns and units</h2>
<p>The SEOSAW dataset contains data in two separate tables: <strong>plots</strong> and <strong>stems</strong>. The plots table contains information on plot location, environmental variables, and various plot metadata to describe any experimental manipulations and management conditions, in each plot. The stems has one row per stem measurement, and contains information on taxonomy, stem dimensions, and stem condition. Please see the following two tables for a breakdown of columns found in the <a href="https://seosaw.github.io/stem_columns.html">stems table</a> and <a href="seosaw.github.io/plot_columns.html">plots table</a>. The plots table and stem table are linked by the <code>plot_id</code> column, which serves as the primary key. All plot IDs are indexed in both the stem and plot tables. There is a supplementary <a href="https://cran.r-project.org/web/packages/sf/index.html"><code>{sf}</code></a> table which holds plot polygon data for those plots where this data is available. For convenience, the stem and plot tables are available as <code>.csv</code> and <code>.rds</code> files, and the polygons data is available as <code>.shp</code> and <code>.rds</code> files.</p>
</div>
<div id="nested-plots" class="section level2">
<h2>Nested plots</h2>
<p>Some plots in the SEOSAW dataset are “nested”, meaning that the plot contains smaller subplots where the sampling effort is different from the larger plot. This is easiest to explain is with a diagram. The figure below shows a schematic diagram of a nested subplot. The larger plot is a 20x50 m rectangle, while the nested subplot is a 10x25 m rectangle. Stems above 10 cm diameter are measured within the entire 20x50 m plot, but stems 5-10 cm diameter are only measured in the smaller 10x25 m subplot. This means that the sampling effort of 5-10 cm stems is a quarter of the sampling effort of stems &gt;10 cm. Variation in sampling effort must be accounted for when calculating plot level statistics like aboveground biomass. The true biomass of 5-10 cm stems in the plot will be 4x the recorded biomass. In the SEOSAW dataset, this variation is stored in the <code>fpc</code> (Fractional Proportion of Inclusion) column. In this example, the <code>fpc</code> of 5-10 cm stems will be 0.25, while the <code>fpc</code> of &gt;10 cm stems will be 1. Plots are nested up to three levels deep.</p>
<div class="figure" style="text-align: center">
<img src="data:image/png;base64,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qVPnjjvuuOGGG3LkIEJydSKNAAIIIIBA1hDIgIBj/fr1/fv3//HHH69evSqkJk2alClTJjLyv0dy8eLF3r17v/nmmykpKUZx5syZ+fLlW7JkScuWLRWjZA1ajhIBBBBAAAEE/hSwtcPg7Nmzf//73++6664dO3aYaOPPw/if/z700EOu0YbZdubMmU6dOm3fvt3Pjv9TCx8QQAABBBBAINMI/LdfwYZDevvtt2fPnn3p0iU/be3du/fdd981fRsDBw4cPnz4d99917VrVwUcFy5cWLZsWeXKlaOjo/3UwKYMF/jtt98+/fTTb7755viJExosq1CuXJOmTes3aJArKkrHlpiY+M7KlSdPnixZsuTdrVoVKlTIOuDTp09/8eWX2779Ni4+/rbbbqterZruhL179ny8fv3lP2+b6JiYwoULly1T5qabbsqVK5e179UrV/YfPKiRuAvnz5vMyKioQgUL3lSlSuUqVayOMVWosHXdBx9oDK9GjRoKf60aXBMqtmvXrq3ffquuuP379+ePi7vhxhsrV6p0++23586dWyVVQJt0mq57uaVjY2Pvvffe66+/3i2fjwgggIADBWwNOIxvmzZthgwZ0q5dO3V4eIovXLgwOTlZ+eXKlXv66afz589funTp9u3bazzl8uXLK1asUAjiGXC89957a9eu1bNNW3/99VfFJRs3btSDoW3btj169MibN+/KlStV84EDBypUqHDffffpMRMTE+PZOjlBCqj/6Z133pk4ceLOn392rWreggV//etfn37qKWXu2bPnySefVOLGG2/UxW3apIlVUrGIhs82bNigKOTsmTMKOI4ePTr7tddemzPHKmMSGoOrVrXqwEGD7r3nHpNzRCVnz9bcILeSUVFR5cuVe+Kf/7yrRQtt0vyhFW+/PX36dIUgtWrV8hpwHDt2TKcwZ+5ct+407VK1atWnRo9u0KCBwprlb7318ssvuzXn+rFgwYLFixf32oRrMdIIIICAEwRsDThat26tSaAVK1Y8fvy4r+mf+rNYM0ZF36hRIz0qzDVo2LDh0qVLFXD8/PPPZqvbtdHWN954Q88SPSrUQXLq1ClTYM2aNVu2bDl37pyegtqqzC+++GLx4sV6nGiaiP4AdauHj0EKfP7554oP3KIN1aneqUOHDl1D5brcF/8IQN32VQfDd9u2Pf/885pT3KhhQ21V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+SOAAAIIIGCDAAGHDcg0gQACCCCAgNMFCDicfgdw/ggggAACCNggQMBhAzJNIIAAAggg4HQBAg6n3wGcPwIIIIAAAjYIEHDYgEwTCCCAAAIIOF2AgMPpdwDnjwACCCCAgA0CBBw2INMEAggggAACThcg4HD6HcD5I4AAAgggYIMAAYcNyDSBAAIIIICA0wUIOJx+B3D+CCCAAAII2CBAwGEDMk0ggAACCCDgdAECDqffAZw/AggggAACNggQcNiATBMIIIAAAgg4XYCAw+l3AOePAAIIIICADQIEHDYg0wQCCCCAAAJOFyDgcPodwPkjgAACCCBggwABhw3INIEAAggggIDTBQg4nH4HcP4IIIAAAgjYIEDAYQMyTSCAAAIIIOB0AQIOp98BnD8CCCCAAAI2CBBw2IBMEwgggAACCDhdINLpAJw/AggggAACdglcunRp06ZNa9as+fnnny9evFiuXLk6dercd999MTExroeQkpKiAh9//PGWLVuSkpJq1apVr169O++8M2fOnK7FslaagCNrXS+OFgEEEEAgSwqkpqbu2rWrR48eGzdudD0BxRCTJ09etGhRxYoVTb4CkWXLlv3tb387f/68ydHHqKioLl26zJw5UwnX3bNQmiGVLHSxOFQEEEAAgawqoDBi/fr1btGGTubKlSvbtm0bOnSoOTF1gaj/o3fv3la0YfIvX768ZMmSESNGZNXzv+46Ao6se+04cgQQQACBrCQQERGh/oxq1aqNGjXqxRdfbN68uTl6BRnffffd0aNH9fH06dPz589XjkrWrFnzq6++2r179x133KFNyly6dGlycnJWOmeXY2VIxQXDW/LIkSMKP80WpUuVKpWlh9C8nSJ5CCCAAAJhF4iOjm7RosXChQs7dOiQK1cutadE48aNDx48qLQeNEpcf/31hw8fXrVqlXLi4+P/+c9/aobH1atXx4wZ06hRI2WeOHHiww8/vOeee5R2/dHj6ZlnnlEvyL333tugQQONvHzyySdnz57V7oMHDy5TpoyilkmTJmlGSKFChVTVwIEDY2NjXWuwIU3A4Q9ZseSQIUN+++03U6hJkyZjx47VuFrevHn97cY2BBBAAAEE/lcgR44cevDrx8rWbIzChQubgENbCxYsqD6MnTt3XrhwQWU0jVShgxLapE6R/Pnznzp1SnGJJpNaNZiEIpK9e/cq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" alt="Schematic diagram of nested plot, with subplot occupying 25% of total plot space." width="400px" />
<p class="caption">
Schematic diagram of nested plot, with subplot occupying 25% of total plot space.
</p>
</div>
</div>
<div id="biomass" class="section level2">
<h2>Biomass</h2>
<p>Biomass, specifically aboveground woody biomass, is calculated in the SEOSAW dataset by default using an allometric equation devised by Chave et al. (2014), but there are a number of other allometric equations available in the SEOSAW package which the user can use at their discretion. There is also the option for the user to use their own allometric equation on the SEOSAW dataset.</p>
<p>The SEOSAW dataset also contains a column at the plot level which allows data originators to suggest their own local allometry, though these allometries aren’t available as functions in the SEOSAW package as they are numerous and varied. Table 3 contains information on the available biomass allometries and their original publication.</p>
<table>
<colgroup>
<col width="28%">
<col width="21%">
<col width="17%">
<col width="32%">
</colgroup>
<thead>
<tr class="header">
<th>Function</th>
<th>Inputs</th>
<th>Usage</th>
<th>Reference</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><code>ryan11()</code></td>
<td>Diameter</td>
<td>Generic miombo woodland</td>
<td>Ryan, C. M., Williams, M. and Grace, J. (2011) Above- and belowground carbon stocks in a miombo woodland landscape of Mozambique, Biotropica, 43(4), pp. 423-432. doi: 10.1111/j.1744-7429.2010.00713.x.</td>
</tr>
<tr class="even">
<td><code>mugasha14()</code></td>
<td>Diameter</td>
<td>Tanzanian miombo woodland</td>
<td>Mugasha, W. A., Eid, T., Bollandsas, O. M., Malimbwi, R. E., Chamshama, S. A. O., Zahabu, E., Katani, J. Z. (2013) Allometric models for prediction of above- and belowground biomass of trees in the miombo woodlands of Tanzania, Forest Ecology and Management, 310, 87-101. doi: 10.1016/j.foreco.2013.08.003</td>
</tr>
<tr class="odd">
<td><code>chidumayo90()</code></td>
<td>Diameter</td>
<td>Zambian woodlands</td>
<td>Chimudayo, E.N. (1990). Above-ground woody biomass structure and productivity in a Zambezian woodland. Forest Ecology and Management 36, 33-46.</td>
</tr>
<tr class="even">
<td><code>mutakele09()</code></td>
<td>Diameter</td>
<td>Mopane woodlands in Botswana</td>
<td>Mutakela, P. S. (2009) ‘Biomass prediction models for Colophospermum mopane (Mopane) in Botswana’, MSc Thesis in Forestry submitted to Stellenbosche University, South Africa</td>
</tr>
<tr class="odd">
<td><code>chamshama04()</code></td>
<td>Diameter</td>
<td>Tanzanian miombo woodlands</td>
<td>Chamshama, S.A.O. Mugasha, A.G., Zahabu, E. (2004). ‘Biomass and volume estimation for miombo woodlands at Kitulangalo, Morogoro, Tanzania’. Southern African Forestry Journal 200, 49-60.</td>
</tr>
<tr class="even">
<td><code>tietema93()</code></td>
<td>Diameter</td>
<td>Mopane woodlands in Botswana</td>
<td>Tietema, T. (1993) ‘Biomass determination of fuelwood trees and bushes of Botswana, Southern Africa’. Forest Ecology and Management 60, 257-269.</td>
</tr>
<tr class="odd">
<td><code>chave05()</code></td>
<td>Diameter, <br>wood density, height</td>
<td>Global dry forests/woodlands</td>
<td>Chave, J. et al. (2005) ‘Tree allometry and improved estimation of carbon stocks and balance in tropical forests’, Oecologia, 145, pp. 87-99. doi: 10.1007/s00442-005-0100-x.</td>
</tr>
<tr class="even">
<td><code>chave14()</code></td>
<td>Diameter, <br>wood density, <br>longitude, <br>latitude</td>
<td>Global dry forests/woodlands</td>
<td>Chave, J. et al. (2014) ‘Improved allometric models to estimate the aboveground biomass of tropical trees’, Global Change Biology, 20(10), pp. 3177-3190. doi: 10.1111/gcb.12629.</td>
</tr>
</tbody>
</table>
<p>The SEOSAW package relies on functions from the <code>BIOMASS</code> package to calculate the <code>chave14()</code> and <code>chave05()</code> allometries, which uses wood density data from Chave et al. 2009, Zanne et al. 2009.</p>
<p>Aboveground woody biomass can be calculated using the <code>agb()</code> function, which returns aboveground biomass per stem in tonnes of carbon (tC).</p>
<div class="sourceCode" id="cb5"><pre class="sourceCode r"><code class="sourceCode r"><span id="cb5-1"><a href="#cb5-1"></a>agb_mugasha14 &lt;-<span class="st"> </span><span class="kw">agbGen</span>(mstems, <span class="dt">diam =</span> <span class="st">&quot;diam&quot;</span>, <span class="dt">allometry =</span> <span class="st">&quot;mugasha14&quot;</span>)</span>
<span id="cb5-2"><a href="#cb5-2"></a></span>
<span id="cb5-3"><a href="#cb5-3"></a><span class="kw">head</span>(agb_mugasha14)</span></code></pre></div>
<pre><code>## [1] 0.06056 0.27460 0.13317 0.16240 0.14445 0.26898</code></pre>
<div class="sourceCode" id="cb7"><pre class="sourceCode r"><code class="sourceCode r"><span id="cb7-1"><a href="#cb7-1"></a>mstems<span class="op">$</span>agb &lt;-<span class="st">  </span><span class="kw">agbGen</span>(mstems, mplots, <span class="dt">allometry =</span> <span class="st">&quot;chave14&quot;</span>)</span>
<span id="cb7-2"><a href="#cb7-2"></a></span>
<span id="cb7-3"><a href="#cb7-3"></a><span class="kw">head</span>(mstems<span class="op">$</span>agb)</span></code></pre></div>
<pre><code>## [1] 0.05423 0.32071 0.12169 0.10191 0.09045 0.31077</code></pre>
<p>You can generate the wood density data used by <code>chave14()</code> and <code>chave05()</code> separately using <code>woodDensityQuery()</code>, which is a wrapper around <code>BIOMASS::getWoodDensity()</code>:</p>
<div class="sourceCode" id="cb9"><pre class="sourceCode r"><code class="sourceCode r"><span id="cb9-1"><a href="#cb9-1"></a><span class="kw">head</span>(<span class="kw">woodDensityQuery</span>(mstems, <span class="dt">species_name =</span> <span class="st">&quot;species_orig_binom&quot;</span>,</span>
<span id="cb9-2"><a href="#cb9-2"></a>  <span class="dt">plot_id =</span> <span class="st">&quot;plot_id&quot;</span>, <span class="dt">region =</span> <span class="st">&quot;AfricaTrop&quot;</span>))</span></code></pre></div>
<pre><code>## [1] 0.7084 0.9145 0.7084 0.4690 0.4690 0.9040</code></pre>
</div>
<div id="taxonomy" class="section level2">
<h2>Taxonomy</h2>
<p>The taxonomic ‘backbone’ of the SEOSAW dataset is the <a href="https://www.ville-ge.ch/musinfo/bd/cjb/africa/index.php?langue=an">CJB African plants database</a>, with some notable exceptions, which are discussed below. The dataset also uses the <code>taxize::gnr_resolve()</code> utility to query multiple databases to check species names and provide higher taxonomic rank information. The queried databases are:</p>
<ul>
<li><a href="https://tree.opentreeoflife.org/">Open Tree of Life Reference Taxonomy</a></li>
<li><a href="https://www.ipni.org/">The International Plant Names Index</a></li>
<li><a href="https://www.tropicos.org/">Tropicos - Missouri Botanical Garden</a></li>
<li><a href="https://www.gbif.org/dataset/d7dddbf4-2cf0-4f39-9b2a-bb099caae36c">GBIF Backbone Taxonomy</a></li>
<li><a href="https://www.ncbi.nlm.nih.gov/taxonomy">NCBI</a></li>
</ul>
<p><code>speciesGen()</code> is the top level function for generating species names and querying both CJB and <code>taxize::gnr_resolve()</code>. Firstly the function checks whether a species has been observed in the larger SEOSAW dataset. Given that the SEOSAW dataset contains in excess of 500,000 stem measurements, if a species is new to the dataset it is likely to be a mistake. Secondly the function checks <code>taxize::gnr_resolve()</code> using the <code>gnrQuery()</code> wrapper function, and thirdly it checks the CJB database using <code>cjbQuery()</code>. At any of these three steps it is possible for the user to specify that the function should return unmatched species names. This is especially useful when cleaning a new dataset where species names may be misspelled or misclassified.</p>
<div class="sourceCode" id="cb11"><pre class="sourceCode r"><code class="sourceCode r"><span id="cb11-1"><a href="#cb11-1"></a>species_unk &lt;-<span class="st"> </span><span class="kw">speciesGen</span>(mstems, <span class="dt">lookup_list =</span> <span class="kw">list</span>(<span class="kw">get</span>(<span class="kw">data</span>(acacia)), <span class="kw">get</span>(<span class="kw">data</span>(rhus))), </span>
<span id="cb11-2"><a href="#cb11-2"></a>  <span class="dt">species_name =</span> <span class="st">&quot;species_orig_binom&quot;</span>, </span>
<span id="cb11-3"><a href="#cb11-3"></a>  <span class="dt">return_unknown =</span> <span class="ot">FALSE</span>, <span class="dt">return_unknown_gnr =</span> <span class="ot">FALSE</span>, <span class="dt">return_unknown_cjb =</span> <span class="ot">TRUE</span>,</span>
<span id="cb11-4"><a href="#cb11-4"></a>  <span class="dt">sanitize =</span> <span class="ot">TRUE</span>)</span></code></pre></div>
<pre><code>## Warning: Species not present in larger SEOSAW dataset:
##    Marquesia macoura</code></pre>
<pre><code>## Warning in na_catch(x, warn = TRUE, ...): species(x_final_syn$confer_clean):
## 400/400 NAs</code></pre>
<pre><code>## Warning in na_catch(x, warn = TRUE, ...):
## subspecies(x_final_syn$subspecies_clean):400/400 NAs</code></pre>
<pre><code>## Warning in na_catch(x, warn = TRUE, ...): variety(x_final_syn$variety_clean):
## 400/400 NAs</code></pre>
<pre><code>## Warning: Some species not matched by gnr_resolve:
##    Indet indet</code></pre>
<pre><code>## Warning: Some species not matched by CJB:
##    Combretum_indet
##    Deinbollia_indet
##    Indet_indet
##    Marquesia_macoura
##    Psuedolachnostylis_maprouneifolia</code></pre>
<div class="sourceCode" id="cb18"><pre class="sourceCode r"><code class="sourceCode r"><span id="cb18-1"><a href="#cb18-1"></a>species_unk</span></code></pre></div>
<pre><code>## [1] &quot;Marquesia_macoura&quot;                 &quot;Psuedolachnostylis_maprouneifolia&quot;</code></pre>
<div class="sourceCode" id="cb20"><pre class="sourceCode r"><code class="sourceCode r"><span id="cb20-1"><a href="#cb20-1"></a>lookup_table &lt;-<span class="st"> </span><span class="kw">data.frame</span>(</span>
<span id="cb20-2"><a href="#cb20-2"></a>  <span class="dt">original =</span> species_unk,</span>
<span id="cb20-3"><a href="#cb20-3"></a>  <span class="dt">corrected =</span> <span class="kw">c</span>(<span class="st">&quot;Marquesia macroura&quot;</span>, <span class="st">&quot;Pseudolachnostylis maprouneifolia&quot;</span>))</span>
<span id="cb20-4"><a href="#cb20-4"></a></span>
<span id="cb20-5"><a href="#cb20-5"></a><span class="co"># speciesGen(mstems, lookup_ortho = lookup_table, </span></span>
<span id="cb20-6"><a href="#cb20-6"></a><span class="co">#   return_unknown = FALSE, return_unknown_gnr = FALSE, return_unknown_cjb = TRUE)</span></span></code></pre></div>
<div id="acacia-spp." class="section level3">
<h3>Acacia spp.</h3>
<p>The breakup of the <em>Acacia</em> genus has been well documented by Kyalangalilwa et al. 2013. SEOSAW uses their list of synonyms to provide a lookup table in <code>data(acacia)</code>, which can be called by <code>synonymyFix()</code> to replace <em>Acacia</em> sp. with their newly defined <em>Vachellia</em> and <em>Senegalia</em> species. The CJB database does not currently acknowledge the <em>Acacia</em> split, so queries to CJB retain the <em>Acacia</em> name.</p>
</div>
<div id="rhus-spp." class="section level3">
<h3>Rhus spp.</h3>
<p>All <em>Rhus</em> species in SEOSAW’s study region belong to <em>Searsia</em> and are transferred in this way. All recent phylogenetic results point to this, but the formal taxonomic work to transfer African species of <em>Rhus</em> is incomplete. SEOSAW provides a lookup table in <code>data(rhus)</code>.</p>
</div>
<div id="marquesia-spp." class="section level3">
<h3>Marquesia spp.</h3>
<p>Previously, <em>Marquesia</em> species were placed in the <em>Trillesanthus</em> genus, however this has since been reverted. SEOSAW moves all <em>Trillesanthus</em> to <em>Marquesia</em> using the lookup table in <code>data(trillesanthus)</code>.</p>
</div>
<div id="maytenus-spp." class="section level3">
<h3>Maytenus spp.</h3>
<p>The latest taxonomy states that <em>Maytenus</em> is a strictly Neotropical genus, while acknowledging that African <em>Maytenus</em> are a “problem”. The latest taxonomic literature doesn’t tell us what to do with African <em>Maytenus</em>. SEOSAW defaults to the CJB taxonomy on <em>Gymnosporia</em> / <em>Maytenus</em>, and provides a lookup table in <code>data(maytenus)</code>, but this may change in the future.</p>
</div>
<div id="miscellaneous" class="section level3">
<h3>Miscellaneous</h3>
<p><code>data(synonymy)</code> contains many miscellaneous species synonym corrections which are maintained throughout the canonical SEOSAW dataset. The vast majority of these corrections reflect previously debunked names which still appear in older datasets.</p>
</div>
</div>
<div id="estimating-diversity" class="section level2">
<h2>Estimating diversity</h2>
<p>The SEOSAW package provides slim wrappers around existing functions in the <code>vegan</code> package to calculate biodiversity metrics at the plot level. Diversity metrics are calculated with <code>diversityGen()</code>. Possible diversity metrics are:</p>
<table>
<colgroup>
<col width="12%">
<col width="18%">
<col width="69%">
</colgroup>
<thead>
<tr class="header">
<th>Argument</th>
<th>Metric</th>
<th>Equation</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><code>richness</code></td>
<td>Species richness</td>
<td>NA</td>
</tr>
<tr class="even">
<td><code>rarefy</code></td>
<td>Rarefied species richness</td>
<td><code>vegan::rarefy()</code></td>
</tr>
<tr class="odd">
<td><code>shannon</code></td>
<td>Shannon-Wiener index</td>
<td><span class="math inline">\(H&#39; = - \sum_{i = 1}^{s} p_i \ln{p_i}\)</span></td>
</tr>
<tr class="even">
<td><code>simpson</code></td>
<td>Simpson’s index</td>
<td><span class="math inline">\(D = \sum_{i = 1}^{S} p_i^2 = \sum_{i = 1}^{S} (n / N)^2 = \frac{\sum_{i = 1}^{s} n(n -1)}{N(N - 1)}\)</span></td>
</tr>
<tr class="odd">
<td><code>invsimpson</code></td>
<td>Inverse Simpson’s index</td>
<td><span class="math inline">\(^2\!D = 1 / D\)</span></td>
</tr>
<tr class="even">
<td><code>evenness</code></td>
<td>Simpson’s evenness</td>
<td><span class="math inline">\((1/D) / N\)</span></td>
</tr>
</tbody>
</table>
<div class="sourceCode" id="cb21"><pre class="sourceCode r"><code class="sourceCode r"><span id="cb21-1"><a href="#cb21-1"></a><span class="kw">diversityGen</span>(mstems) </span></code></pre></div>
<pre><code>##   plot_id richness rarefy shannon simpson invsimpson evenness
## 1   ABC_1       40  20.04   3.504  0.9625      26.69   0.6674
## 2   ABC_2       37  19.81   3.415  0.9580      23.82   0.6438
## 3   ABC_3       36  19.45   3.367  0.9540      21.76   0.6045
## 4   ABC_4       39  20.44   3.522  0.9656      29.03   0.7444</code></pre>
<div class="sourceCode" id="cb23"><pre class="sourceCode r"><code class="sourceCode r"><span id="cb23-1"><a href="#cb23-1"></a><span class="kw">diversityGen</span>(mstems, <span class="dt">index =</span> <span class="st">&quot;shannon&quot;</span>)</span></code></pre></div>
<pre><code>##   plot_id shannon
## 1   ABC_1   3.504
## 2   ABC_2   3.415
## 3   ABC_3   3.367
## 4   ABC_4   3.522</code></pre>
<div class="sourceCode" id="cb25"><pre class="sourceCode r"><code class="sourceCode r"><span id="cb25-1"><a href="#cb25-1"></a><span class="kw">diversityGen</span>(mstems, <span class="dt">index =</span> <span class="st">&quot;simpson&quot;</span>, <span class="dt">abundance =</span> <span class="st">&quot;agb&quot;</span>, <span class="dt">plot_id =</span> <span class="st">&quot;plot_id&quot;</span>)</span></code></pre></div>
<pre><code>##   plot_id simpson
## 1   ABC_1  0.9409
## 2   ABC_2  0.9257
## 3   ABC_3  0.9204
## 4   ABC_4  0.9595</code></pre>
<p>Additionally, a dataframe of each plot’s most dominant species, estimated simply by tree abundance, can be returned using <code>domSpeciesGen()</code>:</p>
<div class="sourceCode" id="cb27"><pre class="sourceCode r"><code class="sourceCode r"><span id="cb27-1"><a href="#cb27-1"></a><span class="kw">domSpeciesGen</span>(mstems, <span class="dt">tree_id =</span> <span class="st">&quot;tree_id&quot;</span>, <span class="dt">plot_id =</span> <span class="st">&quot;plot_id&quot;</span>, <span class="dt">n =</span> <span class="dv">2</span>)</span></code></pre></div>
<pre><code>##       plot_id                       dom_1                  dom_2  prop_1
## ABC_1   ABC_1 Diplorhynchus condylocarpon Androstachys johnsonii 0.09677
## ABC_2   ABC_2 Diplorhynchus condylocarpon  Colophospermum mopane 0.10909
## ABC_3   ABC_3 Diplorhynchus condylocarpon  Colophospermum mopane 0.12727
## ABC_4   ABC_4      Androstachys johnsonii  Colophospermum mopane 0.06667
##        prop_2
## ABC_1 0.06452
## ABC_2 0.07273
## ABC_3 0.09091
## ABC_4 0.06667</code></pre>
<p>The values returned are the proportional abundance of the corresponding species, within the plot.</p>
<div id="abundance-matrices" class="section level3">
<h3>Abundance matrices</h3>
<p>The function <code>abMatGen()</code> can be used to create an abundance matrix from a stem measurements table. An abundance matrix is a table where each column is a species, each row is a plot, and each cell contains abundance values for each species in each plot. The most basic use of <code>abMatGen()</code> uses tree abundance as a measure of abundance, but other columns can be used as alternative abundance measures, such as aboveground biomass (<code>agb</code>) or basal area (<code>ba</code>). The function also accounts for variation in sampling effort across nested plots using the <code>fpc</code> columns.</p>
<div class="sourceCode" id="cb29"><pre class="sourceCode r"><code class="sourceCode r"><span id="cb29-1"><a href="#cb29-1"></a><span class="kw">abMatGen</span>(mstems, <span class="dt">plot_id =</span> <span class="st">&quot;plot_id&quot;</span>, <span class="dt">tree_id =</span> <span class="st">&quot;tree_id&quot;</span>, </span>
<span id="cb29-2"><a href="#cb29-2"></a>  <span class="dt">species_name =</span> <span class="st">&quot;species_orig_binom&quot;</span>, <span class="dt">fpc =</span> <span class="st">&quot;fpc&quot;</span>)</span></code></pre></div>
<pre><code>##       Aganope stuhlmannii Albizia antunesiana Albizia petersiana
## ABC_1                   1                   0                  1
## ABC_2                   0                   1                  1
##       Androstachys johnsonii Brachystegia boehmii Brachystegia longifolia
## ABC_1                      4                    1                       2
## ABC_2                      3                    1                       2
##       Burkea africana Colophospermum mopane Combretum apiculatum
## ABC_1               0                     4                    3
## ABC_2               1                     4                    3
##       Combretum collinum Combretum indet Combretum molle Deinbollia indet
## ABC_1                  1               3               2                1
## ABC_2                  0               1               0                1
##       Diospyros batocana Diospyros dichrophylla Diospyros lycioides
## ABC_1                  1                      1                   1
## ABC_2                  1                      0                   1
##       Diplorhynchus condylocarpon Grewia flava Guibourtia conjugata
## ABC_1                           6            1                    1
## ABC_2                           6            1                    1
##       Gymnosporia heterophylla Hippobromus pauciflorus Hymenocardia acida
## ABC_1                        2                       1                  3
## ABC_2                        1                       1                  4
##       Hymenocardia ulmoides Indet indet Julbernardia paniculata
## ABC_1                     1           1                       2
## ABC_2                     1           2                       2
##       Kraussia floribunda Lannea discolor Lannea schweinfurthii
## ABC_1                   1               0                     2
## ABC_2                   0               1                     1
##       Markhamia zanzibarica Marquesia macoura Marquesia macroura
## ABC_1                     1                 1                  0
## ABC_2                     1                 1                  1
##       Melanodiscus oblongus Pericopsis angolensis Piliostigma thonningii
## ABC_1                     1                     0                      1
## ABC_2                     1                     1                      1
##       Pseudolachnostylis maprouneifolia Psuedolachnostylis maprouneifolia
## ABC_1                                 1                                 1
## ABC_2                                 1                                 0
##       Pterocarpus angolensis Sclerocarya birrea Senegalia caffra
## ABC_1                      1                  1                1
## ABC_2                      1                  1                1
##       Senna petersiana Sterculia africana Strychnos madagascariensis
## ABC_1                1                  1                          1
## ABC_2                1                  0                          1
##       Syzygium cordatum Tarchonanthus camphoratus Uapaca nitida
## ABC_1                 1                         1             1
## ABC_2                 1                         1             0
##  [ reached &#39;max&#39; / getOption(&quot;max.print&quot;) -- omitted 2 rows ]</code></pre>
</div>
</div>
<div id="spatial-datasets" class="section level2">
<h2>Spatial datasets</h2>
<p>The SEOSAW package contains generic functions for extracting plot level data from arbitrary raster and vector spatial objects. There are also functions to extract data from a number of default spatial data layers, which are provided either through API interfaces or data objects within the SEOSAW package. The table below lists the functions available to extract from particular spatial data sources.</p>
<table>
<colgroup>
<col width="16%">
<col width="33%">
<col width="50%">
</colgroup>
<thead>
<tr class="header">
<th>Data</th>
<th>Function</th>
<th>Data sources</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>Frost</td>
<td><code>frostQuery()</code></td>
<td>Harris, I., … (2020), ‘Version 4 of the CRU TS monthly high-resolution gridded multivariate climate dataset’, Scientific Data 7(1).</td>
</tr>
<tr class="even">
<td>Phenology</td>
<td><code>phenologyQuery()</code></td>
<td>Didan, K., Barreto, A. (2016). NASA MEaSUREs Vegetation Index and Phenology (VIP) Phenology EVI2 Yearly Global 0.05Deg CMG [Data set]. NASA EOSDIS Land Processes DAAC</td>
</tr>
<tr class="odd">
<td>Administrative areas</td>
<td><code>adminQuery()</code></td>
<td><code>rnaturalearth::ne_states()</code> Made with Natural Earth. Free vector and raster map data @ naturalearthdata.com.</td>
</tr>
<tr class="even">
<td>Herbivory</td>
<td><code>herbivoryQuery()</code></td>
<td>Hempson, G. P., … (2017), ‘The consequences of replacing wildlife with livestock in africa’, Scientific Reports 7(1).</td>
</tr>
<tr class="odd">
<td>Soil</td>
<td><code>soilQuery()</code></td>
<td><a href="SoilGrids%20REST%20API">https://rest.soilgrids.org/</a></td>
</tr>
<tr class="even">
<td>Climate</td>
<td><code>climateQuery()</code></td>
<td>Fick, S.E. and R.J. Hijmans, 2017. WorldClim 2: new 1km spatial resolution climate surfaces for global land areas. International Journal of Climatology 37 (12): 4302-4315.</td>
</tr>
<tr class="odd">
<td>Fire</td>
<td><code>fireQuery()</code></td>
<td></td>
</tr>
<tr class="even">
<td>Elevation</td>
<td><code>elevationQuery()</code></td>
<td>NASA JPL (2013). NASA Shuttle Radar Topography Mission Global 3 arc second [Data set]. NASA EOSDIS Land Processes DAAC.</td>
</tr>
<tr class="odd">
<td>Terrestrial ecoregions</td>
<td><code>teowQuery()</code></td>
<td>Olson, D. M., … (2001), ‘Terrestrial ecoregions of the world: A new map of life on earth’, BioScience 51(11), 933.</td>
</tr>
<tr class="even">
<td>White’s vegetation map</td>
<td><code>whiteQuery()</code></td>
<td>White, F. (1983), The Vegetation of Africa: A descriptive memoir to accompany the UNESCO/AETFAT/UNSO vegetation map of Africa., UNESCO, Paris, France.</td>
</tr>
</tbody>
</table>
<p><code>rasterExtract()</code> can be used to extract field values from other user supplied raster datasets, with an optional circular buffer around the point of interest.</p>
<div class="sourceCode" id="cb31"><pre class="sourceCode r"><code class="sourceCode r"><span id="cb31-1"><a href="#cb31-1"></a>elev &lt;-<span class="st"> </span><span class="kw">get</span>(<span class="kw">data</span>(elev_srtm))</span>
<span id="cb31-2"><a href="#cb31-2"></a></span>
<span id="cb31-3"><a href="#cb31-3"></a><span class="kw">head</span>(<span class="kw">rasterExtract</span>(mplots, elev))</span></code></pre></div>
<pre><code>## Warning in proj4string(x): CRS object has comment, which is lost in output</code></pre>
<pre><code>##   plot_id      srtm
## 1   ABC_1 1264.8582
## 2   ABC_2 1281.9723
## 3   ABC_3 1264.8582
## 4   ABC_4 1264.8582</code></pre>
<div class="sourceCode" id="cb34"><pre class="sourceCode r"><code class="sourceCode r"><span id="cb34-1"><a href="#cb34-1"></a><span class="kw">head</span>(<span class="kw">rasterExtract</span>(mplots, elev, <span class="dt">buffer_radius =</span> <span class="dv">50</span>))</span></code></pre></div>
<pre><code>## Warning in proj4string(x): CRS object has comment, which is lost in output

## Warning in proj4string(x): CRS object has comment, which is lost in output

## Warning in proj4string(x): CRS object has comment, which is lost in output

## Warning in proj4string(x): CRS object has comment, which is lost in output

## Warning in proj4string(x): CRS object has comment, which is lost in output

## Warning in proj4string(x): CRS object has comment, which is lost in output

## Warning in proj4string(x): CRS object has comment, which is lost in output

## Warning in proj4string(x): CRS object has comment, which is lost in output

## Warning in proj4string(x): CRS object has comment, which is lost in output</code></pre>
<pre><code>##   plot_id        V2
## 1   ABC_1 1264.8582
## 2   ABC_2 1281.9723
## 3   ABC_3 1264.8582
## 4   ABC_4 1264.8582</code></pre>
<p><code>vecExtract()</code> is a similar function for extracting attributes from spatial vector datasets for points of interest.</p>
<div class="sourceCode" id="cb37"><pre class="sourceCode r"><code class="sourceCode r"><span id="cb37-1"><a href="#cb37-1"></a>white &lt;-<span class="st"> </span><span class="kw">get</span>(<span class="kw">data</span>(whites_veg))</span>
<span id="cb37-2"><a href="#cb37-2"></a></span>
<span id="cb37-3"><a href="#cb37-3"></a>mplots_white_region &lt;-<span class="st"> </span><span class="kw">vecExtract</span>(mplots, white, <span class="dt">attrib =</span> <span class="st">&quot;DESCRIPTIO&quot;</span>)</span>
<span id="cb37-4"><a href="#cb37-4"></a></span>
<span id="cb37-5"><a href="#cb37-5"></a><span class="kw">head</span>(mplots_white_region)</span></code></pre></div>
<pre><code>##   plot_id              DESCRIPTIO
## 1   ABC_1 Moist-infertile savanna
## 2   ABC_2 Moist-infertile savanna
## 3   ABC_3 Moist-infertile savanna
## 4   ABC_4 Moist-infertile savanna</code></pre>
<div id="transforming-plot-or-stem-coordinates" class="section level3">
<h3>Transforming plot or stem coordinates</h3>
<p>The SEOSAW package also contains various convenience functions for manipulating spatial data. The SEOSAW package primarily uses <code>sf</code> spatial data objects, as this is likely the future of spatial analysis in R, but some functions such as <code>reprojectPoints()</code> will alternatively return a <code>SpatialPoints*</code> object if requested.</p>
<p>A common scenario is that data originators like to store their plot coordinates as cartesian UTM coordinates for analysis in their local region, but SEOSAW requires all coordinates as WGS84 decimal latitude/longitude values (EPSG:4326). As an example, imagine a dataset where plot coordinates straddle both UTM 37S and UTM 38S. We want to convert the plot coordinates to WGS84 latitude/longitude:</p>
<div class="sourceCode" id="cb39"><pre class="sourceCode r"><code class="sourceCode r"><span id="cb39-1"><a href="#cb39-1"></a>mplots<span class="op">$</span>utm_zone &lt;-<span class="st"> </span><span class="kw">latLong2UTM</span>(mplots<span class="op">$</span>longitude_of_centre, mplots<span class="op">$</span>latitude_of_centre)</span>
<span id="cb39-2"><a href="#cb39-2"></a></span>
<span id="cb39-3"><a href="#cb39-3"></a>mplots_list &lt;-<span class="st"> </span><span class="kw">split</span>(mplots, mplots<span class="op">$</span>utm_zone)</span>
<span id="cb39-4"><a href="#cb39-4"></a></span>
<span id="cb39-5"><a href="#cb39-5"></a>utm_crs &lt;-<span class="st"> </span><span class="kw">unlist</span>(<span class="kw">lapply</span>(mplots_list, <span class="cf">function</span>(x) {</span>
<span id="cb39-6"><a href="#cb39-6"></a>  <span class="kw">UTMProj4</span>(<span class="kw">unique</span>(x<span class="op">$</span>utm_zone))</span>
<span id="cb39-7"><a href="#cb39-7"></a>}))</span>
<span id="cb39-8"><a href="#cb39-8"></a></span>
<span id="cb39-9"><a href="#cb39-9"></a>mplots_list_wgs &lt;-<span class="st"> </span><span class="kw">lapply</span>(<span class="dv">1</span><span class="op">:</span><span class="kw">length</span>(mplots_list), <span class="cf">function</span>(x) {</span>
<span id="cb39-10"><a href="#cb39-10"></a>  <span class="kw">reprojectPoints</span>(mplots_list[[x]]<span class="op">$</span>longitude_of_centre, mplots_list[[x]]<span class="op">$</span>latitude_of_centre, </span>
<span id="cb39-11"><a href="#cb39-11"></a>    <span class="dt">from =</span> utm_crs[[x]], <span class="dt">to =</span> <span class="dv">4326</span>)</span>
<span id="cb39-12"><a href="#cb39-12"></a>})</span>
<span id="cb39-13"><a href="#cb39-13"></a></span>
<span id="cb39-14"><a href="#cb39-14"></a>mplots_wgs &lt;-<span class="st"> </span><span class="kw">do.call</span>(rbind, mplots_list_wgs)</span></code></pre></div>
</div>
<div id="plot-polygons" class="section level3">
<h3>Plot polygons</h3>
<p>Plot outline polygons for each plot with such data in the canonical SEOSAW dataset are provided in <code>data_out/polygons.rds</code>. For rectangular plots, these polygons are normally created from GPS coordinates taken at each corner and used as vertices when transforming to a closed spatial polygon. Circle plot polygons are automatically generated using the <code>circlePolyGen()</code> function, which uses the plot centre coordinates and plot diameter to create a polygon:</p>
<div class="sourceCode" id="cb40"><pre class="sourceCode r"><code class="sourceCode r"><span id="cb40-1"><a href="#cb40-1"></a>circle_plots &lt;-<span class="st"> </span>mplots <span class="op">%&gt;%</span></span>
<span id="cb40-2"><a href="#cb40-2"></a><span class="st">  </span><span class="kw">mutate</span>(<span class="dt">plot_shape =</span> <span class="st">&quot;circle&quot;</span>, </span>
<span id="cb40-3"><a href="#cb40-3"></a>    <span class="dt">plot_diameter =</span> <span class="dv">40</span>)</span>
<span id="cb40-4"><a href="#cb40-4"></a></span>
<span id="cb40-5"><a href="#cb40-5"></a>circle_plots_polys &lt;-<span class="st"> </span><span class="kw">circlePolyGen</span>(circle_plots)</span>
<span id="cb40-6"><a href="#cb40-6"></a></span>
<span id="cb40-7"><a href="#cb40-7"></a><span class="kw">plot</span>(circle_plots_polys, <span class="dt">key.pos=</span><span class="ot">NULL</span>)</span></code></pre></div>
<p><img src="data:image/png;base64,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QAGpjA3RELBBgAKykSMuIKCSAAWkMjZEQ8AGAQrIRo64gIBKAhSQytgQDQEbBCggGzniAgIqCVBAKmNDNARsEKCAbOSICwioJEABqYwN0RCwQYACspEjLiCgkgAFpDI2REPABgEKyEaOuICASgIUkMrYEA0BGwQoIBs54gICKglQQCpjQzQEbBCggGzkiAsIqCRAAamMDdEQsEGAArKRIy4goJIABaQyNkRDwAYBCshGjriAgEoCFJDK2BANARsEKCAbOeICAioJUEAqY0M0BGwQoIBs5IgLCKgkQAGpjA3RELBBgAKykSMuIKCSAAWkMjZEQ8AGAQrIRo64gIBKAhSQytgQDQEbBCggGzniAgIqCVBAKmNDNARsEKCAbOSICwioJEABqYwN0RCwQYACspEjLiCgkgAFpDI2REPABgEKyEaOuICASgIUkMrYEA0BGwQoIBs54gICKglQQCpjQzQEbBCggGzkiAsIqCRAAamMDdEQsEGAArKRIy4goJIABaQyNkRDwAYBCshGjriAgEoCFJDK2BANARsEKCAbOeICAioJUEAqY0M0BGwQoIBs5IgLCKgkQAGpjA3RELBBgAKykSMuIKCSAAWkMjZEQ8AGAQrIRo64gIBKAhSQytgQDQEbBCggGzniAgIqCVBAKmNDNARsEKCAbOSICwioJEABqYwN0RCwQYACspEjLiCgkgAFpDI2REPABgEKyEaOuICASgIUkMrYEA0BGwQoIBs54gICKglQQCpjQzQEbBCggGzkiAsIqCRAAamMDdEQsEGAArKRIy4goJIABaQyNkRDwAYBCshGjriAgEoCFJDK2BANARsEKCAbOeICAioJUEAqY0M0BGwQoIBs5IgLCKgkQAGpjA3RELBBgAKykSMuIKCSAAWkMjZEQ8AGAQrIRo64gIBKAhSQytgQDQEbBCggGzniAgIqCVBAKmNDNARsEKCAbOSICwioJEABqYwN0RCwQYACspEjLiCgkgAFpDI2REPABgEKyEaOuGghgWPHjsmWLVvkyJEjLdwCL8uEAAWUCT1eq5bAhg0bpEfPntKtWzcZNmyY9OjRQ3JycuSdd95R60mj8JyaYNIoHM0QaCmBvXv3Sl5engwad6mMuu+fpH2njlJz6pSUvfBH2fZWqaxZs0bGjh3b0s3zumYQoICaAYtV9RNwh1pubyf/6otl9MO/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" style="display: block; margin: auto;" /></p>
</div>
</div>
<div id="dataset-caveats" class="section level2">
<h2>Dataset caveats</h2>
<p>The SEOSAW dataset is aggregated from many individual datasets contributed by researchers around the world. While effort has been made to ensure that datasets are compatible with each other, particularly with respect to stem-level data like stem diameter (<code>diam</code>) and <code>height</code>, some pieces of metadata should not be compared between datasets. For example, <code>canopy_cover</code> is collected with hemispherical photos, different types of densitometer, aerial photos and many other methods. Due to the subjectivity of all these methods, it is not recommended to use this data as a variable in statistical analysis; it should be used only as metadata. Below is an unexhaustive list of fields we recommend not to compare between sites in analyses:</p>
<ul>
<li><code>mean_plot_slope</code> - Variable accuracy and recording techniques</li>
<li><code>rain_gauge_amount</code> - We recommend using the BioClim variables to estimate mean annual precipitation</li>
<li><code>catenal_position</code> - Subject to human bias</li>
<li><code>canopy_cover</code> - Variable accuracy and recording techniques</li>
<li><code>local_community_rights</code> - Subject to human bias, sparse data</li>
<li><code>other_user_rights</code> - Subject to human bias, sparse data</li>
<li><code>timber_harvesting</code> - Subject to human bias, sparse data</li>
<li><code>high_graded_100_years</code> - Subject to human bias, sparse data</li>
<li><code>fuel_wood_harvesting</code> - Subject to human bias, sparse data</li>
<li><code>charcoal_harvesting</code> - Subject to human bias, sparse data</li>
<li><code>other_woody_product_harvesting</code> - Subject to human bias, sparse data</li>
<li><code>ntfp_harvesting</code> - Subject to human bias, sparse data</li>
<li><code>farmed_30_years</code> - Subject to human bias, sparse data</li>
<li><code>fire_exclusion_success</code> - Subject to human bias</li>
<li><code>elephant_density</code> - Variable accuracy</li>
</ul>
<p>Additionally, SEOSAW takes the stance that metadata should be left blank if it is not known, rather than guessed at. This means that many metadata columns consist mainly of <code>NA</code> values. For example, <code>charcoal_harvesting</code> is left mostly blank because most data originators did not record whether wood collection for charcoal harvesting had occurred in the plot. This also applies to stem data. If, for example, the data originator did not specify whether a stem was standing or fallen, <code>standing_fallen</code> is left as <code>NA</code>, even if it is more likely that the stem was in fact standing.</p>
</div>
</div>
<div id="formatting-your-own-data-for-seosaw" class="section level1">
<h1>Formatting your own data for SEOSAW</h1>
<p>Read the data collection manuals before setting up new plots and collecting data in the field. Follow their protocol to maximise compatibility of newly collected data with existing SEOSAW data. The SEOSAW manuals can be found <a href="https://seosaw.github.io/manuals.html">here</a>.</p>
<p>It is suggested that wherever possible you refrain from directly editing raw spreadsheets collected in the field. Instead, use R to create a reproducible script which transforms the raw data into a format which is compatible with the larger SEOSAW dataset. Editing spreadsheets directly is likely to introduce more errors due to mis-typing, and your future self will be unsure of the exact data cleaning procedure, which may be important for future analysis and scientific writing.</p>
<p>The following example outlines a generic data cleaning process for a small fictional dataset of two plots, each with 50 stems each (<code>mplots_bad</code>, <code>mstems_bad</code>). Real datasets are likely to be much larger than this, but the cleaning process should be functionally similar. Note that the fake dataset also does fill some columns of metadata which are desirable in data incorporated into SEOSAW dataset. These columns are omitted for brevity of code. For a flow diagram of the recommended cleaning process, which outlines the functions used and their order, <a href="https://seosaw.github.io/cleaning_process.html">see the external file here</a>.</p>
<div id="example-workflow-for-data-cleaning" class="section level2">
<h2>Example workflow for data cleaning</h2>
<p>First, clean the plot data. Rename, remove and create columns based on the accepted names found in <code>plotColClass()</code>. This function contains a named list, where the names of each list item are the names of columns in the SEOSAW dataset, and the list item is a column constructor function which provides checks and conservatively fixes common errors. While <code>{dplyr}</code> isn’t necessary for this workflow, it excels at dataframe manipulation and makes some parts of the process much more concise to write and easier to interpret by the reader. The function <code>colGen()</code> can be used to generate empty columns to remind you which data fields should be provided:</p>
<div class="sourceCode" id="cb41"><pre class="sourceCode r"><code class="sourceCode r"><span id="cb41-1"><a href="#cb41-1"></a>plots_clean &lt;-<span class="st"> </span>mplots_bad <span class="op">%&gt;%</span></span>
<span id="cb41-2"><a href="#cb41-2"></a><span class="st">  </span>dplyr<span class="op">::</span><span class="kw">rename</span>(</span>
<span id="cb41-3"><a href="#cb41-3"></a>    <span class="dt">plot_id =</span> plotcode,</span>
<span id="cb41-4"><a href="#cb41-4"></a>    <span class="dt">prinv =</span> pi, </span>
<span id="cb41-5"><a href="#cb41-5"></a>    <span class="dt">first_census_date =</span> year) <span class="op">%&gt;%</span></span>
<span id="cb41-6"><a href="#cb41-6"></a><span class="st">  </span>dplyr<span class="op">::</span><span class="kw">select</span>(</span>
<span id="cb41-7"><a href="#cb41-7"></a>    <span class="op">-</span>water_table, </span>
<span id="cb41-8"><a href="#cb41-8"></a>    <span class="op">-</span>soil_carbon) <span class="op">%&gt;%</span></span>
<span id="cb41-9"><a href="#cb41-9"></a><span class="st">  </span><span class="kw">colGen</span>(., <span class="dt">colClass =</span> <span class="kw">plotColClass</span>())</span></code></pre></div>
<p>Then, replace some values which are incompatible with the SEOSAW dataset’s column rules:</p>
<div class="sourceCode" id="cb42"><pre class="sourceCode r"><code class="sourceCode r"><span id="cb42-1"><a href="#cb42-1"></a>plots_clean_val &lt;-<span class="st"> </span>plots_clean <span class="op">%&gt;%</span><span class="st"> </span></span>
<span id="cb42-2"><a href="#cb42-2"></a><span class="st">  </span><span class="kw">mutate</span>(</span>
<span id="cb42-3"><a href="#cb42-3"></a>    <span class="dt">plot_shape =</span> <span class="kw">case_when</span>(</span>
<span id="cb42-4"><a href="#cb42-4"></a>      plot_shape <span class="op">==</span><span class="st"> &quot;square&quot;</span> <span class="op">~</span><span class="st"> &quot;rectangle&quot;</span>,</span>
<span id="cb42-5"><a href="#cb42-5"></a>      <span class="ot">TRUE</span> <span class="op">~</span><span class="st"> </span>plot_shape),</span>
<span id="cb42-6"><a href="#cb42-6"></a>    <span class="dt">min_diam_thresh =</span> <span class="kw">case_when</span>(</span>
<span id="cb42-7"><a href="#cb42-7"></a>      min_diam_thresh <span class="op">==</span><span class="st"> &quot;&lt;5cm&quot;</span> <span class="op">~</span><span class="st"> &quot;5&quot;</span>,</span>
<span id="cb42-8"><a href="#cb42-8"></a>      min_diam_thresh <span class="op">==</span><span class="st"> &quot;&lt;10cm&quot;</span> <span class="op">~</span><span class="st"> &quot;10&quot;</span>, </span>
<span id="cb42-9"><a href="#cb42-9"></a>      <span class="ot">TRUE</span> <span class="op">~</span><span class="st"> </span>min_diam_thresh),</span>
<span id="cb42-10"><a href="#cb42-10"></a>    <span class="dt">last_census_date =</span> first_census_date,</span>
<span id="cb42-11"><a href="#cb42-11"></a>    <span class="dt">all_dates =</span> first_census_date</span>
<span id="cb42-12"><a href="#cb42-12"></a>    )</span></code></pre></div>
<p>Use <code>colValCheck()</code> to check whether column names and contents are SEOSAW compatible. This checking function can be used iteratively with the cleaning process above until the function returns no errors:</p>
<div class="sourceCode" id="cb43"><pre class="sourceCode r"><code class="sourceCode r"><span id="cb43-1"><a href="#cb43-1"></a>plots_check &lt;-<span class="st"> </span><span class="kw">colValCheck</span>(plots_clean_val, <span class="dt">colClass =</span> <span class="kw">plotColClass</span>())</span></code></pre></div>
<p>Next, check that plot level columns are consistent with each other using <code>plotTableCheck()</code>. This function runs a number of checking functions to ensure that values are logically consistent between columns. For example, <code>fireCheck()</code> ensures that the columns <code>fire_exclusion</code>, <code>fire_exclusion_success</code>, <code>fire_treatment</code>, <code>fire_treatment_season</code> and <code>fire_treatment_return_interval</code> are consistent, e.g. if <code>fire_treatment = TRUE</code>, <code>fire_treatment_season</code> should also contain a non-NA value. As there are always exceptions to perfect data collection practise, these functions return warnings rather than errors, indicating which rows are logically inconsistent. For the default checking functions (<code>nestedCheck()</code>, <code>paCheck()</code>, <code>shapeCheck()</code>, <code>fireCheck()</code>, <code>isoCheck()</code>) if <code>output = TRUE</code> (default) a list of row index vectors are returned, which can then be used to subset the original data to locate potential errors. The user is encouraged to consider the warnings and check whether these columns are legitimately incosistent, or if there has been an error during data entry.</p>
<div class="sourceCode" id="cb44"><pre class="sourceCode r"><code class="sourceCode r"><span id="cb44-1"><a href="#cb44-1"></a><span class="kw">plotTableCheck</span>(plots_check, <span class="dt">output =</span> <span class="ot">TRUE</span>)</span></code></pre></div>
<pre><code>## Running:nestedCheck</code></pre>
<pre><code>## Running:paCheck</code></pre>
<pre><code>## Running:shapeCheck</code></pre>
<pre><code>## Running:fireCheck</code></pre>
<pre><code>## Running:isoCheck</code></pre>
<pre><code>## [[1]]
## list()
## 
## [[2]]
## integer(0)
## 
## [[3]]
## list()
## 
## [[4]]
## list()
## 
## [[5]]
## integer(0)</code></pre>
<p>The default checking functions, and their checks, are shown below:</p>
<ul>
<li><code>nestedCheck()</code>
<ul>
<li>If a nesting level is FALSE (e.g. <code>nested_1 = FALSE</code>), make sure nesting descriptors (e.g. <code>n1_min_diam_thresh</code>) are left empty.</li>
<li>If a lower level of nesting is TRUE (e.g. <code>nested_2 = TRUE</code>), make sure higher levels are also TRUE (e.g. <code>nested_1 = TRUE</code>).</li>
</ul></li>
<li><code>paCheck()</code>
<ul>
<li>If a plot is in a protected area (i.e. <code>pa = TRUE</code>), make sure protected area name (<code>pa_name</code>) and type (<code>pa_type</code>) are filled in.</li>
</ul></li>
<li><code>shapeCheck()</code>
<ul>
<li>If a plot is a circle or rectangle (e.g. <code>plot_shape = &quot;circle&quot;</code>), are the corresponding plot dimension columns filled (i.e. <code>plot_diameter</code>, <code>plot_length</code>, <code>plot_width</code>).</li>
</ul></li>
<li><code>fireCheck()</code>
<ul>
<li>If a plot has a fire treatment or fire exclusion protocol (e.g. <code>fire_treatment = TRUE</code> or <code>fire_exclusion = TRUE</code>), are the descriptor fields for those treatments filled (e.g. <code>fire_treatment_season</code>, <code>fire_treatment_success</code>).</li>
</ul></li>
<li><code>isoCheck()</code>
<ul>
<li>Does the country described in <code>country_iso3</code> agree with the plot coordinates provided in <code>longitude_of_centre</code> and <code>latitude_of_centre</code>.</li>
</ul></li>
</ul>
<p>Finally, generate extra columns in the plot level dataset using <code>plotExtraColGen()</code>, which calculates values such as <code>plot_area</code>, using <code>plot_shape</code>, <code>plot_diameter</code>, <code>plot_length</code> and <code>plot_width</code> which have been entered by the user. <code>spatialDefaults()</code> is used to extract values from various external spatial datasets which are useful for further analysis:</p>
<div class="sourceCode" id="cb51"><pre class="sourceCode r"><code class="sourceCode r"><span id="cb51-1"><a href="#cb51-1"></a>plots_table &lt;-<span class="st"> </span><span class="kw">plotExtraColGen</span>(plots_check)</span>
<span id="cb51-2"><a href="#cb51-2"></a>plots_table &lt;-<span class="st"> </span><span class="kw">spatialDefaultsQuery</span>(plots_table)</span></code></pre></div>
<p>The default functions called by <code>plotExtraColGen()</code> are:</p>
<ul>
<li><code>country()</code> - Generate the long-form country name from <code>country_iso3</code></li>
<li><code>plot_area()</code> - Generate the area of the plot in hectares using <code>plot_shape</code>, <code>plot_diameter</code>, <code>plot_length</code> and <code>plot_width</code></li>
<li><code>plot_perimeter()</code> - Generate the perimeter of the plot in metres using <code>plot_shape</code>, <code>plot_diameter</code>, <code>plot_length</code> and <code>plot_width</code></li>
</ul>
<p>At this point, it is recommended to clean the stem data, using a similar procedure to above:</p>
<div class="sourceCode" id="cb52"><pre class="sourceCode r"><code class="sourceCode r"><span id="cb52-1"><a href="#cb52-1"></a><span class="co"># names(plotColClass())</span></span>
<span id="cb52-2"><a href="#cb52-2"></a>stems_clean &lt;-<span class="st"> </span>mstems_bad <span class="op">%&gt;%</span></span>
<span id="cb52-3"><a href="#cb52-3"></a><span class="st">  </span>dplyr<span class="op">::</span><span class="kw">rename</span>(<span class="dt">plot_id =</span> plotcode,</span>
<span id="cb52-4"><a href="#cb52-4"></a>    <span class="dt">tree_id =</span> tree,</span>
<span id="cb52-5"><a href="#cb52-5"></a>    <span class="dt">stem_id =</span> stem) <span class="op">%&gt;%</span></span>
<span id="cb52-6"><a href="#cb52-6"></a><span class="st">  </span><span class="kw">mutate</span>(<span class="dt">height =</span> height <span class="op">/</span><span class="st"> </span><span class="dv">100</span>,</span>
<span id="cb52-7"><a href="#cb52-7"></a>    <span class="dt">alive =</span> <span class="kw">case_when</span>(</span>
<span id="cb52-8"><a href="#cb52-8"></a>      alive <span class="op">==</span><span class="st"> &quot;alive&quot;</span> <span class="op">~</span><span class="st"> &quot;A&quot;</span>, </span>
<span id="cb52-9"><a href="#cb52-9"></a>      alive <span class="op">==</span><span class="st"> &quot;dead&quot;</span> <span class="op">~</span><span class="st"> &quot;D&quot;</span>,</span>
<span id="cb52-10"><a href="#cb52-10"></a>      <span class="ot">TRUE</span> <span class="op">~</span><span class="st"> </span>alive),</span>
<span id="cb52-11"><a href="#cb52-11"></a>    <span class="dt">fpc =</span> <span class="dv">1</span>,</span>
<span id="cb52-12"><a href="#cb52-12"></a>    <span class="dt">method_diam =</span> <span class="st">&quot;dbh_tape&quot;</span>)</span>
<span id="cb52-13"><a href="#cb52-13"></a></span>
<span id="cb52-14"><a href="#cb52-14"></a>stems_clean_check &lt;-<span class="st"> </span>seosawr<span class="op">:::</span><span class="kw">colValCheck</span>(stems_clean,</span>
<span id="cb52-15"><a href="#cb52-15"></a>  <span class="dt">colClass =</span> seosawr<span class="op">:::</span><span class="kw">stemColClass</span>())</span></code></pre></div>
<pre><code>## Warning in na_catch(x, warn = TRUE, ...): subplot_id:300/400 NAs</code></pre>
<pre><code>## Warning in na_catch(x, warn = TRUE, ...): species_orig_local:400/400 NAs</code></pre>
<pre><code>## Warning in na_catch(x, warn = TRUE, ...): notes_stem:400/400 NAs</code></pre>
<pre><code>## Warning in na_catch(x, warn = TRUE, ...): latitude:400/400 NAs</code></pre>
<pre><code>## Warning in na_catch(x, warn = TRUE, ...): longitude:400/400 NAs</code></pre>
<pre><code>## Warning in na_catch(x, warn = TRUE, ...): broken_per_remain:400/400 NAs</code></pre>
<pre><code>## Warning in na_catch(x, warn = TRUE, ...): broken_height:400/400 NAs</code></pre>
<pre><code>## Warning in na_catch(x, warn = TRUE, ...): stem_decay:400/400 NAs</code></pre>
<pre><code>## Warning in na_catch(x, warn = TRUE, ...): voucher_id:400/400 NAs</code></pre>
<p>For consistency between datasets, it is recommended (though not necessary), to simplify <code>stem_id</code> and <code>tree_id</code> values using the <code>stemTreeIDClean()</code> function:</p>
<div class="sourceCode" id="cb62"><pre class="sourceCode r"><code class="sourceCode r"><span id="cb62-1"><a href="#cb62-1"></a>stems_clean_check &lt;-<span class="st"> </span><span class="kw">stemTreeIDClean</span>(stems_clean_check)</span></code></pre></div>
<pre><code>## stem_id and tree_id values changed</code></pre>
<p>See the table below for an example of the changes <code>stemTreeIDClean()</code> makes. Note that <code>tag_id</code> should be reserved for physical tags that allow re-measurement of permanent plots.</p>
<table>
<colgroup>
<col width="9%">
<col width="18%">
<col width="18%">
<col width="18%">
<col width="17%">
<col width="17%">
</colgroup>
<thead>
<tr class="header">
<th>plot_id</th>
<th>tree_id before</th>
<th>stem_id before</th>
<th>measurement_id</th>
<th>tree_id after</th>
<th>stem_id after</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>ABC_1</td>
<td>Aa1</td>
<td>Aa1_1</td>
<td>2019</td>
<td>1</td>
<td>1</td>
</tr>
<tr class="even">
<td>ABC_1</td>
<td>Aa1</td>
<td>Aa1_2</td>
<td>2019</td>
<td>1</td>
<td>2</td>
</tr>
<tr class="odd">
<td>ABC_1</td>
<td>Aa3</td>
<td>1</td>
<td>2018</td>
<td>2</td>
<td>1</td>
</tr>
<tr class="even">
<td>ABC_2</td>
<td>Aa2</td>
<td>1</td>
<td>2019</td>
<td>2</td>
<td>1</td>
</tr>
<tr class="odd">
<td>ABC_2</td>
<td>Aa</td>
<td>2</td>
<td>2019</td>
<td>1</td>
<td>1</td>
</tr>
<tr class="even">
<td>ABC_2</td>
<td>Aa3</td>
<td>3</td>
<td>2019</td>
<td>3</td>
<td>1</td>
</tr>
</tbody>
</table>
<div class="sourceCode" id="cb64"><pre class="sourceCode r"><code class="sourceCode r"><span id="cb64-1"><a href="#cb64-1"></a><span class="kw">stemTableCheck</span>(stems_clean_check)</span></code></pre></div>
<pre><code>## Running:diamHeightCheck</code></pre>
<pre><code>## Running:deathCheck</code></pre>
<pre><code>## Warning in FUN(X[[i]], ...): Dead but missing death information at rows: 10, 23,
## 28, 29, 37, 40, 41, 48, 51, 55, 62, 65, 69, 70, 78, 80, 83, 96, 99, 101, 104,
## 111, 113, 115, 120, 129, 131, 138, 149, 157, 159, 186, 193, 197, 198, 202, 203,
## 214, 217, 221, 224, 228, 232, 233, 243, 245, 246, 251, 262, 265, 266, 267, 270,
## 271, 278, 280, 282, 288, 297, 301, 303, 310, 324, 325, 330, 332, 334, 336, 350,
## 353, 357, 364, 365, 374, 377, 381, 384, 385, 386, 389, 391, 394, 395, 398, 400</code></pre>
<pre><code>## Running:diamDecCheck</code></pre>
<pre><code>## [[1]]
## NULL
## 
## [[2]]
## NULL
## 
## [[3]]
## NULL</code></pre>
<p>If the stem data is from the re-measurement of a previously measured plot, you will want to match up the tree IDs and stem IDs with the older dataset, using the tag IDs as a way to match the two datasets. To make this process easier, use <code>tagTreeStemIDMatch()</code>:</p>
<div class="sourceCode" id="cb70"><pre class="sourceCode r"><code class="sourceCode r"><span id="cb70-1"><a href="#cb70-1"></a><span class="kw">tagTreeStemIdMatch</span>(new_data, old_data</span>
<span id="cb70-2"><a href="#cb70-2"></a>  <span class="dt">new_plot_id =</span> <span class="st">&quot;plot_id&quot;</span>, <span class="dt">new_tree_id =</span> <span class="st">&quot;tree_id&quot;</span>,</span>
<span id="cb70-3"><a href="#cb70-3"></a>  <span class="dt">new_stem_id =</span> <span class="st">&quot;stem_id&quot;</span>, <span class="dt">new_tag_id =</span> <span class="st">&quot;tag_id&quot;</span>,</span>
<span id="cb70-4"><a href="#cb70-4"></a>  <span class="dt">old_plot_id =</span> <span class="st">&quot;plot_id&quot;</span>, <span class="dt">old_tree_id =</span> <span class="st">&quot;tree_id&quot;</span>,</span>
<span id="cb70-5"><a href="#cb70-5"></a>  <span class="dt">old_stem_id =</span> <span class="st">&quot;stem_id&quot;</span>, <span class="dt">old_tag_id =</span> <span class="st">&quot;tag_id&quot;</span>)</span></code></pre></div>
<p>Next, fix the species names. This can often be the most time consuming part of the cleaning process. Try to provide a precise species name if possible. If only the genus is known use "Genus indet" (e.g. "Brachystegia indet"). If only the family is known, use "family indet" (e.g. "Fabaceae indet").</p>
<p>First, run <code>speciesGen()</code> to try and catch any species not recognised by either the larger SEOSAW dataset, <code>taxize::gnr_resolve()</code>, or CJB. The lookup tables called by default by <code>speciesGen()</code> will try to correct as many genuine taxonomic synonymy issues as possible, but most often the data originator is the most knowledgeable on their species naming shorthand:</p>
<div class="sourceCode" id="cb71"><pre class="sourceCode r"><code class="sourceCode r"><span id="cb71-1"><a href="#cb71-1"></a>stems_species &lt;-<span class="st"> </span><span class="kw">speciesGen</span>(stems_clean_check, </span>
<span id="cb71-2"><a href="#cb71-2"></a>  <span class="dt">return_unknown =</span> <span class="ot">TRUE</span>, <span class="dt">return_unknown_cjb =</span> <span class="ot">TRUE</span>, <span class="dt">return_unknown_gnr =</span> <span class="ot">TRUE</span>) </span></code></pre></div>
<pre><code>## Correcting taxonomy</code></pre>
<pre><code>## Checking if species are new to SEOSAW</code></pre>
<pre><code>## Warning: Species not present in larger SEOSAW dataset:
##    Zyzy cordat
##    Marquesia macoura
##    Lannea disscolor</code></pre>
<p>If species names are not found, <code>stems_species</code> will contain a vector of species names not matched. The user can then use this vector to create a lookup table which corrects the species names. If you are sure the species name is correct, just replace the old name with the same name in the lookup table:</p>
<div class="sourceCode" id="cb75"><pre class="sourceCode r"><code class="sourceCode r"><span id="cb75-1"><a href="#cb75-1"></a>lookup_table &lt;-<span class="st"> </span><span class="kw">data.frame</span>(</span>
<span id="cb75-2"><a href="#cb75-2"></a>  <span class="dt">original =</span> stems_species,</span>
<span id="cb75-3"><a href="#cb75-3"></a>  <span class="dt">corrected =</span> <span class="kw">c</span>(<span class="st">&quot;Lannea discolor&quot;</span>, <span class="st">&quot;Marquesia macroura&quot;</span>, <span class="st">&quot;Syzygium cordatum&quot;</span>))</span></code></pre></div>
<p>Then run <code>speciesGen()</code> for a second time, this time passing the lookup table as an argument. This will replace the species name with the corrected version before they are passed to the checking routines.</p>
<div class="sourceCode" id="cb76"><pre class="sourceCode r"><code class="sourceCode r"><span id="cb76-1"><a href="#cb76-1"></a>stems_species &lt;-<span class="st"> </span><span class="kw">speciesGen</span>(stems_clean_check, </span>
<span id="cb76-2"><a href="#cb76-2"></a>  <span class="dt">return_unknown =</span> <span class="ot">FALSE</span>, <span class="dt">return_unknown_cjb =</span> <span class="ot">FALSE</span>, </span>
<span id="cb76-3"><a href="#cb76-3"></a>  <span class="dt">return_unknown_gnr =</span> <span class="ot">FALSE</span>, <span class="dt">lookup_ortho =</span> lookup_table)</span></code></pre></div>
<pre><code>## Warning in na_catch(x, warn = TRUE, ...): species(x_final_syn$confer_clean):
## 400/400 NAs</code></pre>
<pre><code>## Warning in na_catch(x, warn = TRUE, ...):
## subspecies(x_final_syn$subspecies_clean):400/400 NAs</code></pre>
<pre><code>## Warning in na_catch(x, warn = TRUE, ...): variety(x_final_syn$variety_clean):
## 400/400 NAs</code></pre>
<pre><code>## Warning: Some species not matched by gnr_resolve:
##    Indet indet</code></pre>
<pre><code>## Warning: Some species not matched by CJB:
##    Combretum_indet
##    Deinbollia_indet
##    Indet_indet
##    Psuedolachnostylis_maprouneifolia</code></pre>
<p>If <code>speciesGen()</code> is successful, <code>stems_species</code> will now be filled with the stem level dataframe with extra columns appended by <code>speciesGen()</code>.</p>
<p>Next, add extra stem columns using <code>stemExtraColGen()</code>:</p>
<div class="sourceCode" id="cb82"><pre class="sourceCode r"><code class="sourceCode r"><span id="cb82-1"><a href="#cb82-1"></a>stems_extra &lt;-<span class="st"> </span><span class="kw">stemExtraColGen</span>(stems_species)</span></code></pre></div>
<pre><code>## Running:measurement_id</code></pre>
<pre><code>## Running:tree_id</code></pre>
<pre><code>## Running:stem_id</code></pre>
<pre><code>## Running:crown_area</code></pre>
<pre><code>## Running:ba</code></pre>
<pre><code>## Running:stem_vol</code></pre>
<pre><code>## Running:diam_adj</code></pre>
<p><code>stemExtraColGen()</code> runs a number of functions to create new columns:</p>
<ul>
<li><code>crown_area()</code> - Crown area modelled as an ellipse if both <code>crown_x</code> and <code>crown_y</code> are provided, otherwise modelled as a circle if only one provided. In square metres.</li>
<li><code>ba()</code> - Stem basal area in square metres, calculated using DBH measurements (<code>diam</code>), assuming a circular trunk cross-section.</li>
<li><code>stem_vol()</code> - Stem volume in cubic metres, calculated using <code>diam</code> and <code>height</code> if both given</li>
<li><code>diam_adj()</code> - If the DBH was taken at a POM (<code>pom</code>) other than 1.3 m, an estimated DBH at 1.3 m, assuming a degree of stem taper with height.</li>
</ul>
<p>This function also re-creates <code>tree_id</code>, <code>stem_id</code> and <code>measurement_id</code> as uniquely identifying columns. See the table below for an example:</p>
<table>
<colgroup>
<col width="7%">
<col width="15%">
<col width="15%">
<col width="17%">
<col width="15%">
<col width="14%">
<col width="14%">
</colgroup>
<thead>
<tr class="header">
<th>plot_id</th>
<th>tree_id before</th>
<th>stem_id before</th>
<th>measurement_date</th>
<th>measurement_id</th>
<th>tree_id after</th>
<th>stem_id after</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>ABC_1</td>
<td>1</td>
<td>1</td>
<td>2019</td>
<td>ABC_1_1_1_2019</td>
<td>ABC_1_1</td>
<td>ABC_1_1_1</td>
</tr>
<tr class="even">
<td>ABC_1</td>
<td>1</td>
<td>2</td>
<td>2019</td>
<td>ABC_1_1_2_2019</td>
<td>ABC_1_1</td>
<td>ABC_1_1_2</td>
</tr>
<tr class="odd">
<td>ABC_1</td>
<td>2</td>
<td>1</td>
<td>2018</td>
<td>ABC_1_2_1_2018</td>
<td>ABC_1_2</td>
<td>ABC_1_2_1</td>
</tr>
<tr class="even">
<td>ABC_2</td>
<td>2</td>
<td>1</td>
<td>2019</td>
<td>ABC_2_2_1_2019</td>
<td>ABC_2_2</td>
<td>ABC_2_2_1</td>
</tr>
<tr class="odd">
<td>ABC_2</td>
<td>1</td>
<td>1</td>
<td>2019</td>
<td>ABC_2_1_1_2019</td>
<td>ABC_2_1</td>
<td>ABC_2_1_1</td>
</tr>
<tr class="even">
<td>ABC_2</td>
<td>3</td>
<td>1</td>
<td>2019</td>
<td>ABC_2_3_1_2019</td>
<td>ABC_2_3</td>
<td>ABC_2_3_1</td>
</tr>
</tbody>
</table>
<p>Calculate aboveground biomass using the Chave et al. (2014) <code>chave14()</code> equation, which requires both plot level longitude (<code>longitude_of_centre</code>) and latitude (<code>latitude_of_centre</code>) as well as stem diameter (<code>diam</code>) and species names. Use <code>species_name_clean</code> which was generated by <code>speciesGen()</code> rather than the original <code>species_orig_binom</code> if calculating AGB at this stage.</p>
<div class="sourceCode" id="cb90"><pre class="sourceCode r"><code class="sourceCode r"><span id="cb90-1"><a href="#cb90-1"></a>stems_extra<span class="op">$</span>agb &lt;-<span class="st"> </span><span class="kw">agbGen</span>(stems_extra, plots_table, <span class="dt">species_name =</span> <span class="st">&quot;species_name_clean&quot;</span>) </span></code></pre></div>
<p>Next, we are in a position to compare the logical consistency of the stem table with the plot table. Much like <code>stemTableCheck()</code>, this function conducts a number of checking procedures and flags rows in the stems table which don’t agree with the plot level data, such as if a stem diameter is smaller than the minimum diameter threshold recorded for the plot.</p>
<div class="sourceCode" id="cb91"><pre class="sourceCode r"><code class="sourceCode r"><span id="cb91-1"><a href="#cb91-1"></a><span class="kw">stemPlotTableCheck</span>(stems_extra, plots_table)</span></code></pre></div>
<p>The functions run by <code>stemPlotTableCheck()</code> are:</p>
<ul>
<li><code>stemDiamThreshCheck()</code> - Are there stem measurements outside of the minimum or maximum stem diameter thresholds. Note that if a plot is nested with diameter thresholds, the most extreme (highest/lowest) of these thresholds is used.</li>
</ul>
<p>Then, you can calculate plot level statistics from the stems table and add them to the plots table. This includes calculations like the plot level aboveground biomass, the number of stems at different size thresholds, and the most dominant species in each plot:</p>
<div class="sourceCode" id="cb92"><pre class="sourceCode r"><code class="sourceCode r"><span id="cb92-1"><a href="#cb92-1"></a>plots_table_stat &lt;-<span class="st"> </span><span class="kw">plotStemColumnGen</span>(stems_extra, plots_table)</span></code></pre></div>
<p>The statistics calculated are:</p>
<ul>
<li><code>diam_max</code> - Maximum stem diameter</li>
<li><code>diam_min</code> - Minimum stem diameter</li>
<li><code>diam_mean</code> - Mean stem diameter</li>
<li><code>diam_median</code> - Median stem diameter</li>
<li><code>diam_sd</code> - Standard deviation of stem diameter distribution</li>
<li><code>height_max</code> - Maximum height</li>
<li><code>height_min</code> - Minimum height</li>
<li><code>height_mean</code> - Mean height</li>
<li><code>height_median</code> - Median height</li>
<li><code>height_sd</code> - Standard deviation of height</li>
<li><code>n_stems</code> - Number of stems</li>
<li><code>n_height</code> - Number of stems with height measurements</li>
<li><code>lorey_height</code> - Lorey height</li>
<li><code>ba</code>- Total basal area</li>
<li><code>agb</code> - Total aboveground biomass</li>
<li><code>stem_vol_mean</code> - Mean stem volume</li>
<li><code>stem_vol_sd</code> - Standard deviation of stem volume</li>
<li><code>n_determ_genus</code> - Number of successfully determined genera</li>
<li><code>n_determ_species</code> - Number of successfully determined species</li>
</ul>
<p>Many of the above are replicated with subsets of data at various minimum stem diameter thresholds: &gt;0, &gt;5, &gt;10, &gt;20, &gt;40, &gt;60 cm.</p>
<p>Additionally, diversity statistics are calculated using <code>diversityGen()</code> and the dominant species are identified using <code>domSpeciesGen()</code>:</p>
<ul>
<li><code>richness</code> - Species richness</li>
<li><code>rarefy</code> - Rarefied species richness</li>
<li><code>shannon</code> - Shannon-Wiener diversity index <span class="math inline">\(H&#39;\)</span></li>
<li><code>simpson</code> - Simpson diversity index <span class="math inline">\(D\)</span></li>
<li><code>invsimpson</code>- Inverse Simpson diversity index</li>
<li><code>evenness</code> - Species abundance evenness</li>
</ul>
<p>A number of statistics are recalculated as per-hectare variants:</p>
<ul>
<li><code>n_stems_ha</code></li>
<li><code>ba_ha</code></li>
<li><code>agb_ha</code></li>
</ul>
<p>If you want to add any column from the plot data into the stem data, to facilitate analyses, use <code>plotToStem()</code>:</p>
<div class="sourceCode" id="cb93"><pre class="sourceCode r"><code class="sourceCode r"><span id="cb93-1"><a href="#cb93-1"></a>mstems_analysis &lt;-<span class="st"> </span><span class="kw">plotToStem</span>(stems_extra, plots_table_stat, <span class="dt">cols =</span> <span class="kw">c</span>(<span class="st">&quot;agb_ha&quot;</span>, <span class="st">&quot;ba_ha&quot;</span>), </span>
<span id="cb93-2"><a href="#cb93-2"></a>  <span class="dt">stem_plot_id =</span> <span class="st">&quot;plot_id&quot;</span>,  <span class="dt">plot_plot_id =</span> <span class="st">&quot;plot_id&quot;</span>)</span></code></pre></div>
<p><strong>FINALLY</strong>, the data is now in the SEOSAW format, with all metadata attached and some preliminary analysis already completed. You can export the cleaned data to the SEOSAW <code>data_clean</code> directory, or some other directory:</p>
<div class="sourceCode" id="cb94"><pre class="sourceCode r"><code class="sourceCode r"><span id="cb94-1"><a href="#cb94-1"></a><span class="kw">exportData</span>(<span class="st">&quot;data_clean/example_data&quot;</span>, <span class="dt">stems =</span> stems_extra, </span>
<span id="cb94-2"><a href="#cb94-2"></a>  <span class="dt">plots =</span> plots_table_stat, <span class="dt">polys =</span> <span class="ot">NULL</span>, <span class="dt">overwrite =</span> <span class="ot">FALSE</span>,</span>
<span id="cb94-3"><a href="#cb94-3"></a>  <span class="dt">files =</span> <span class="kw">c</span>(<span class="st">&quot;stems_csv&quot;</span>, <span class="st">&quot;stems_rds&quot;</span>, <span class="st">&quot;plots_csv&quot;</span>, <span class="st">&quot;plots_rds&quot;</span>, <span class="st">&quot;points_shp&quot;</span>, </span>
<span id="cb94-4"><a href="#cb94-4"></a>    <span class="st">&quot;points_rds&quot;</span>))</span></code></pre></div>
</div>
</div>
<div id="whole-dataset-compiling" class="section level1">
<h1>Whole dataset compiling</h1>
<p>Once multiple datasets have been cleaned according to the process outlined above, they can be compiled to a single dataset using <code>compileAll()</code>:</p>
<div class="sourceCode" id="cb95"><pre class="sourceCode r"><code class="sourceCode r"><span id="cb95-1"><a href="#cb95-1"></a><span class="kw">compileAll</span>(<span class="dt">dirs =</span> <span class="kw">c</span>(<span class="st">&quot;data_1&quot;</span>, <span class="st">&quot;data_2&quot;</span>), </span>
<span id="cb95-2"><a href="#cb95-2"></a>  <span class="dt">files =</span> <span class="kw">c</span>(<span class="st">&quot;stems_csv&quot;</span>, <span class="st">&quot;plots_csv&quot;</span>, <span class="st">&quot;points_shp&quot;</span>, </span>
<span id="cb95-3"><a href="#cb95-3"></a>    <span class="st">&quot;polys_shp&quot;</span>), <span class="dt">out_dir =</span> <span class="st">&quot;../path/to/out/dir&quot;</span>)</span></code></pre></div>
<p>There are also two functions for extracting subsets of a compiled dataset. The first, <code>subsetLatest()</code> extracts the most recent census data for each plot, and <code>subsetMulti()</code> extracts measurements only for those plots which have multiple censuses:</p>
<div class="sourceCode" id="cb96"><pre class="sourceCode r"><code class="sourceCode r"><span id="cb96-1"><a href="#cb96-1"></a><span class="kw">subsetLatest</span>(compiled_data, <span class="dt">plot_id =</span> <span class="st">&quot;plot_id&quot;</span>, <span class="dt">diam =</span> <span class="st">&quot;diam&quot;</span>, </span>
<span id="cb96-2"><a href="#cb96-2"></a>  <span class="dt">measurement_date =</span> <span class="st">&quot;measurement_date&quot;</span>, <span class="dt">alive =</span> <span class="st">&quot;alive&quot;</span>)</span></code></pre></div>
</div>
<div id="bibliography" class="section level1">
<h1>Bibliography</h1>
<p>Kyalangalilwa, B., Boatwright, J. S., Daru, B. H., Maurin, O., van der Bank, M., 2013. Phylogenetic position and revised classification of Acacia s.l. (Fabaceae: Mimosoideae) in Africa, including new combinations in Vachellia and Senegalia. Bot. J. Linn. Soc., 172 (4): 500–523</p>
<p>Ryan, C. M., Williams, M. and Grace, J. (2011) Above- and belowground carbon stocks in a miombo woodland landscape of Mozambique, Biotropica, 43(4), pp. 423-432. doi: 10.1111/j.1744-7429.2010.00713.x.</p>
<p>Mugasha, W. A., Eid, T., Bollandsas, O. M., Malimbwi, R. E., Chamshama, S. A. O., Zahabu, E., Katani, J. Z. (2013) Allometric models for prediction of above- and belowground biomass of trees in the miombo woodlands of Tanzania, Forest Ecology and Management, 310, 87-101. doi: 10.1016/j.foreco.2013.08.003</p>
<p>Chimudayo, E.N. (1990). Above-ground woody biomass structure and productivity in a Zambezian woodland. Forest Ecology and Management 36, 33-46.:w</p>
<p>Mutakela, P. S. (2009) ‘Biomass prediction models for Colophospermum mopane (Mopane) in Botswana’, MSc Thesis in Forestry submitted to Stellenbosche University, South Africa</p>
<p>Chamshama, S.A.O. Mugasha, A.G., Zahabu, E. (2004). ‘Biomass and volume estimation for miombo woodlands at Kitulangalo, Morogoro, Tanzania’. Southern African Forestry Journal 200, 49-60.</p>
<p>Tietema, T. (1993) ‘Biomass determination of fuelwood trees and bushes of Botswana, Southern Africa’. Forest Ecology and Management 60, 257-269.</p>
<p>Chave, J., Andalo, C., Brown, S., Cairns, M. A., Chambers, J. Q., Eamus, D., Fölster, H., Fromard, F., Higuchi, N., Kira, T., Lescure, J.-P., Nelson, B. W., Ogawa, H., Puig, H., Riéra, B. and Yamakura, T. (2005), ‘Tree allometry and improved estimation of carbon stocks and balance in tropical forests’, Oecologia 145(1), 87–99.</p>
<p>Chave, J., Réjou-Méchain, M., Búrquez, A., Chidumayo, E., Colgan, M. S., Delitti, W. B. C., Duque, A., Eid, T., Fearnside, P. M., Goodman, R. C., Henry, M., Martínez-Yrízar, A., Mugasha, W. A., Muller-Landau, H. C., Mencuccini, M., Nelson, B. W., Ngomanda, A., Nogueira, E. M., Ortiz-Malavassi, E., Pélissier, R., Ploton, P., Ryan, C. M., Saldarriaga, J. G. and Vieilledent, G. (2014), ‘Improved allometric models to estimate the aboveground biomass of tropical trees’, Global Change Biology 20(10), 3177–3190.</p>
<p>Harris, I., Osborn, T. J., Jones, P. and Lister, D. (2020), ‘Version 4 of the CRU TS monthly high-resolution gridded multivariate climate dataset’, Scientific Data 7(1).</p>
<p>Didan, K., Barreto, A. (2016). NASA MEaSUREs Vegetation Index and Phenology (VIP) Phenology EVI2 Yearly Global 0.05Deg CMG [Data set]. NASA EOSDIS Land Processes DAAC</p>
<p>Hempson, G. P., Archibald, S. and Bond, W. J. (2017), ‘The consequences of replacing wildlife with livestock in Africa’, Scientific Reports 7(1).</p>
<p>Fick, S.E. and R.J. Hijmans, 2017. WorldClim 2: new 1km spatial resolution climate surfaces for global land areas. International Journal of Climatology 37 (12): 4302-4315.</p>
<p>NASA JPL (2013). NASA Shuttle Radar Topography Mission Global 3 arc second [Data set]. NASA EOSDIS Land Processes DAAC.</p>
<p>Olson, D. M., Dinerstein, E., Wikramanayake, E. D., Burgess, N. D., Powell, G. V. N., Underwood, E. C., D’amico, J. A., Itoua, I., Strand, H. E., Morrison, J. C., Loucks, C. J., Allnutt, T. F., Ricketts, T. H., Kura, Y., Lamoreux, J. F., Wettengel, W. W., Hedao, P. and Kassem, K. R. (2001), ‘Terrestrial ecoregions of the world: A new map of life on earth’, BioScience 51(11), 933.</p>
<p>White, F. (1983), The Vegetation of Africa: A descriptive memoir to accompany the UNESCO/AETFAT/UNSO vegetation map of Africa., UNESCO, Paris, France.</p>
</div>



<!-- code folding -->


<!-- dynamically load mathjax for compatibility with self-contained -->
<script>
  (function () {
    var script = document.createElement("script");
    script.type = "text/javascript";
    script.src  = "https://mathjax.rstudio.com/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML";
    document.getElementsByTagName("head")[0].appendChild(script);
  })();
</script>

</body>
