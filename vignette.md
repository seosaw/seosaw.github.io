---
layout: default
---

<head>

<meta charset="utf-8" />
<meta name="generator" content="pandoc" />
<meta http-equiv="X-UA-Compatible" content="IE=EDGE" />

<meta name="viewport" content="width=device-width, initial-scale=1" />

<meta name="author" content="John L. Godlee" />

<meta name="date" content="2020-11-07" />

<title>Cleaning and analysing SEOSAW data</title>

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



<style type="text/css">body {
background-color: #fff;
margin: 1em auto;
max-width: 100%;
overflow: visible;
padding-left: 2em;
padding-right: 2em;
font-family: "Open Sans", "Helvetica Neue", Helvetica, Arial, sans-serif;
font-size: 14px;
line-height: 1.35;
}
#TOC {
clear: both;
margin: 0 0 10px 10px;
padding: 4px;
width: 400px;
border: 1px solid #CCCCCC;
border-radius: 5px;
background-color: #f6f6f6;
font-size: 13px;
line-height: 1.3;
}
#TOC .toctitle {
font-weight: bold;
font-size: 15px;
margin-left: 5px;
}
#TOC ul {
padding-left: 40px;
margin-left: -1.5em;
margin-top: 5px;
margin-bottom: 5px;
}
#TOC ul ul {
margin-left: -2em;
}
#TOC li {
line-height: 16px;
}
table {
margin: 1em auto;
border-width: 1px;
border-color: #DDDDDD;
border-style: outset;
border-collapse: collapse;
}
table th {
border-width: 2px;
padding: 5px;
border-style: inset;
}
table td {
border-width: 1px;
border-style: inset;
line-height: 18px;
padding: 5px 5px;
}
table, table th, table td {
border-left-style: none;
border-right-style: none;
}
table thead, table tr.even {
background-color: #f7f7f7;
}
p {
margin: 0.5em 0;
}
blockquote {
background-color: #f6f6f6;
padding: 0.25em 0.75em;
}
hr {
border-style: solid;
border: none;
border-top: 1px solid #777;
margin: 28px 0;
}
dl {
margin-left: 0;
}
dl dd {
margin-bottom: 13px;
margin-left: 13px;
}
dl dt {
font-weight: bold;
}
ul {
margin-top: 0;
}
ul li {
list-style: circle outside;
}
ul ul {
margin-bottom: 0;
}
pre, code {
background-color: #f7f7f7;
border-radius: 3px;
color: #333;
white-space: pre-wrap; 
}
pre {
border-radius: 3px;
margin: 5px 0px 10px 0px;
padding: 10px;
}
pre:not([class]) {
background-color: #f7f7f7;
}
code {
font-family: Consolas, Monaco, 'Courier New', monospace;
font-size: 85%;
}
p > code, li > code {
padding: 2px 0px;
}
div.figure {
text-align: center;
}
img {
background-color: #FFFFFF;
padding: 2px;
border: 1px solid #DDDDDD;
border-radius: 3px;
border: 1px solid #CCCCCC;
margin: 0 5px;
}
h1 {
margin-top: 0;
font-size: 35px;
line-height: 40px;
}
h2 {
border-bottom: 4px solid #f7f7f7;
padding-top: 10px;
padding-bottom: 2px;
font-size: 145%;
}
h3 {
border-bottom: 2px solid #f7f7f7;
padding-top: 10px;
font-size: 120%;
}
h4 {
border-bottom: 1px solid #f7f7f7;
margin-left: 8px;
font-size: 105%;
}
h5, h6 {
border-bottom: 1px solid #ccc;
font-size: 105%;
}
a {
color: #0033dd;
text-decoration: none;
}
a:hover {
color: #6666ff; }
a:visited {
color: #800080; }
a:visited:hover {
color: #BB00BB; }
a[href^="http:"] {
text-decoration: underline; }
a[href^="https:"] {
text-decoration: underline; }

code > span.kw { color: #555; font-weight: bold; } 
code > span.dt { color: #902000; } 
code > span.dv { color: #40a070; } 
code > span.bn { color: #d14; } 
code > span.fl { color: #d14; } 
code > span.ch { color: #d14; } 
code > span.st { color: #d14; } 
code > span.co { color: #888888; font-style: italic; } 
code > span.ot { color: #007020; } 
code > span.al { color: #ff0000; font-weight: bold; } 
code > span.fu { color: #900; font-weight: bold; } 
code > span.er { color: #a61717; background-color: #e3d2d2; } 
</style>




</head>

<body>




<h1 class="title toc-ignore">Cleaning and analysing SEOSAW data</h1>
<h4 class="author">John L. Godlee</h4>
<h4 class="date">2020-11-07</h4>



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
</ul>
<p>Note that the SEOSAW dataset lives in a separate repository with limited private access, due to the sensitivity of some datasets.</p>
<p>To access the SEOSAW repository, use <code>git clone ...</code> or download the repository directly from BitBucket.</p>
</div>
<div id="seosaw-package-functions" class="section level1">
<h1>SEOSAW package functions</h1>
<p>Most of the functions in the SEOSAW package act on either one of or both the SEOSAW dataset tables, with the column names necessary for that function specified by additional arguments in the function. For example, the function to calculate aboveground biomass:</p>
<div class="sourceCode" id="cb1"><pre class="sourceCode r"><code class="sourceCode r"><span id="cb1-1"><a href="#cb1-1" aria-hidden="true"></a>mstems<span class="op">$</span>agb &lt;-<span class="st"> </span><span class="kw">agbGen</span>(<span class="dt">x =</span> mstems, <span class="dt">plot_data =</span> mplots, </span>
<span id="cb1-2"><a href="#cb1-2" aria-hidden="true"></a>  <span class="dt">species_name =</span> <span class="st">&quot;species_orig_binom&quot;</span>, </span>
<span id="cb1-3"><a href="#cb1-3" aria-hidden="true"></a>  <span class="dt">diam =</span> <span class="st">&quot;diam&quot;</span>, </span>
<span id="cb1-4"><a href="#cb1-4" aria-hidden="true"></a>  <span class="dt">stem_plot_id =</span> <span class="st">&quot;plot_id&quot;</span>, </span>
<span id="cb1-5"><a href="#cb1-5" aria-hidden="true"></a>  <span class="dt">plot_plot_id =</span> <span class="st">&quot;plot_id&quot;</span>,</span>
<span id="cb1-6"><a href="#cb1-6" aria-hidden="true"></a>  <span class="dt">latitude_of_centre =</span> <span class="st">&quot;latitude_of_centre&quot;</span>, </span>
<span id="cb1-7"><a href="#cb1-7" aria-hidden="true"></a>  <span class="dt">longitude_of_centre =</span> <span class="st">&quot;longitude_of_centre&quot;</span>, </span>
<span id="cb1-8"><a href="#cb1-8" aria-hidden="true"></a>  <span class="dt">allometry =</span> <span class="st">&quot;chave14&quot;</span>)</span></code></pre></div>
<p>The column name arguments default to the column names specified by the SEOSAW dataset, but can be altered by the user to allow for some flexibility.</p>
<p>Most top level functions specify a dataframe as the first argument (<code>x</code>). Depending on the function, the output is normally either a modified version of <code>x</code> with multiple columns added, or a simple vector with the same length as <code>nrow(x)</code> and the same row order as <code>x</code>. See the <code>agbGen()</code> example above for a function which returns a vector, and the species generator function <code>speciesGen()</code> for an example which returns a modified version of <code>x</code>:</p>
<div class="sourceCode" id="cb2"><pre class="sourceCode r"><code class="sourceCode r"><span id="cb2-1"><a href="#cb2-1" aria-hidden="true"></a>mstems_species &lt;-<span class="st"> </span><span class="kw">speciesGen</span>(mstems,</span>
<span id="cb2-2"><a href="#cb2-2" aria-hidden="true"></a>  <span class="dt">return_unknown =</span> <span class="ot">TRUE</span>, <span class="dt">return_unknown_cjb =</span> <span class="ot">TRUE</span>, <span class="dt">return_unknown_gnr =</span> <span class="ot">TRUE</span>) </span></code></pre></div>
</div>
<div id="the-seosaw-dataset" class="section level1">
<h1>The SEOSAW dataset</h1>
<div id="datasets-columns-and-units" class="section level2">
<h2>Datasets, columns and units</h2>
<p>The SEOSAW dataset contains data in two separate tables: <strong>plots</strong> and <strong>stems</strong>. The plots table contains information on plot location, environmental variables, and various plot metadata to describe any experimental manipulations and management conditions, in each plot. The stems has one row per stem measurement, and contains information on taxonomy, stem dimensions, and stem condition. Please see the following two tables for a breakdown of columns found in the <a href="https://seosaw.github.io/stem_columns.html">stems table</a> and <a href="https://seosaw.github.io/plot_columns.html">plots table</a>. The plots table and stem table are linked by the <code>plot_id</code> column, which serves as the primary key. All plot IDs are indexed in both the stem and plot tables. There are supplementary <a href="https://cran.r-project.org/web/packages/sf/index.html"><code>{sf}</code></a> tables which holds plot polygon and point data for those plots where this data is available. The stem and plot tables are available as <code>.csv</code> files, and the polygons/points data is available as <code>.shp</code> files.</p>
</div>
<div id="nested-plots" class="section level2">
<h2>Nested plots</h2>
<p>Some plots in the SEOSAW dataset are “nested”, meaning that the plot contains smaller subplots where the sampling effort is different from the larger plot. This is easiest to explain with a diagram. The figure below shows a schematic diagram of a nested subplot. In this example, there are three levels of nesting. Across the whole plot (0.2 ha) stems &gt;10 cm DBH are measured. Within the first level of nesting (N1, 0.1 ha), stems &gt;5 cm DBH are measured, within the second level (N2, 0.05 ha) stems &gt;2 cm DBH, and within the third level (N3, 0.025 ha) stems &gt;1 cm DBH.</p>
<div class="figure" style="text-align: center">
<img src="data:image/png;base64,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k0yt1Erq8q2x1iQEEEAAAQQQiCxAIB3ZhaMIIIAAAghYMJBWoPv888/bDz/84ILMHTt22OOPPx4SIN90002mVmqlbdu2+YKFChVyE3v5ByJslClTxj+qcdI5SQqEgxOXeWWEt4b369fPO+W/69qDDz7Y31c3cBICCCCAAAIIRBYgkI7swlEEEEAAAQRMY4w7derkXhpHrFmxveWrSpcu7cZGqxu01wV69+7ddv/99zu5UqVK+YLhS1P5JwIbwcA1u9brwGUhmzVr1vRblYMnNGbaS2pJV1fv7FI8dc6uDM4jgAACCCBQUAUYI11Qnyz3hQACCCCQa4HXXnst2zKaNm1q119/vd11110u78KFC927F3B7BShQDnbf9o5778Gu4FWqVPEOJ/Reu3btbPMr6A8G1tleQAYEEEAAAQQQyCJAi3QWEg4ggAACCCCQmICWk/LS119/7WbsVjAcHEcdDJS9vMF3jbP2Uk4Daa9l3CuHdwQQQAABBBDIGwEC6bxxpVQEEEAAgQwSCI4tLlasmOteXaRIEQsGxLHWhtZSWRs3bvTF4ul67WdmAwEEEEAAAQTyXYBAOt/J+UAEEEAAgXQQ+Oc//2knn3yye2XXxVut0F5q2LCh3xLdpk0b77DNnDnT3w7fePfdd23Xrl3ucPXq1a1ly5bhWdhHAAEEEEAAgRQSIJBOoYdBVRBAAAEEUkdg+/bt9p///Me9xowZE7NiY8eO9c8H12/W5GReevbZZ+3777/3dkPeX3zxRX+/f//+plm+SQgggAACCCCQugIE0qn7bKgZAggggMABFDjuuOP8T58zZ449/fTT/n5wQ7N067ySAuArrrjCP33iiSda2bJl3b6Wy7rkkkv8c97G+PHjbeLEid6unXbaaf42GwgggAACCCCQmgLM2p2az4VaIYAAAggcYIH27dvbUUcdZd7Y5vPPP99mzJhhPXv2tPr169vKlStdADxp0iS/pmeccYbpOi9piaxLL73UXxLrrbfecktpnX766Va5cmX75JNP3FrU3lJTffr0sV69enmX844AAggggAACKSpQ6L//896fonWjWggggAACCBxQgfXr11u7du1sw4YN2dbj6KOPtgkTJtghhxwSklcTiXXp0sXmzp0bcjx859BDD3WBep06dcJPxdzXOtZdu3Z1ebp3725Tp07Nkl9Lb1WoUMEd1/rW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n+HZZ5+177//3t8Pbrz44ov+bv/+/U2zfJMQQAABBBBAAAEEEEAg8wQIpDPvmXPHYQInnniilS1b1h3dsWOHXXLJJWE5zMaPH28TJ070j5922mn+NhsIIIAAAggggAACCCCQWQJFM+t2uVsEsgqULl3aLr30Urv//vvdybfeess6depkp59+ulWuXNk++eQTe/zxx81baqpPnz7Wq1evrAVxBAEEEEAAAQQQQAABBDJCgEA6Ix4zN5mdwMiRI23GjBk2d+5cl3X27NmmV3g69NBD7dFHHw0/zD4CCCCAAAIIIIAAAghkkABduzPoYXOr0QW0ZvO0adPsnHPOCVkOK3iFWqFnzZplderUCR6Oa7to0ey/s1IezSKuVLJkyajlxjoX9SJOIIAAAggggAACCCCAQNIECv23u+r+pJVGQQgUAIF169bZO++8Y2vXrrV9+/aZlrnq3LmztWjRogDcHbeAAAIIIIAAAggggAACuRUgkM6tINcjgAACCCCAAAIIIIAAAghklABduzPqcXOzCCCAAAIIIIAAAggggAACuRUgkM6tINcjgAACCCCAAAIIIIAAAghklACBdEY9bm4WAQQQQAABBBBAAAEEEEAgtwLZTyWc20/g+jwT+PLLL+0///mPrVy50kqVKmXt2rWzk08+2Q466KA8+0wKRuBACKxZs8YmTpxoy5YtM81uronfTj31VKtateqBqA6fiQACCCCAAAIIIJDhAkw2loY/ALt27bJLLrnExo8fb+GTrlepUsXGjh3rgow0vDWqjECIgGZNv+WWW2z06NG2Z8+ekHNlypSxu+66y6666qqQ4+wggAACCCCAAAIIIJDXAgTSeS2c5PIVTGg94+nTp0ctuVChQvbCCy/YmWeeGTUPJxBIB4HzzjvPnnnmmZhVveOOO+y2226LmYeTCCCAAAIIIIAAAggkU4BAOpma+VDWqFGj7IYbbsj2k9S9W12+K1eunG1eMiCQigKTJ0+2E044Iduq6YujRYsWWcuWLbPNSwYEEEAAAQQQQAABBJIhQCCdDMV8LKNu3bq2du3auD5RAbda9EgIpKOAfnZnz54dV9UvuOACe+KJJ+LKSyYEEEAAAQQQQAABBHIrQCCdW8F8vF4BtAJpEgIIhAo0atTITUQWepQ9BBBAAAEEEEAAAQTyRoDlr/LGNU9K3b59e56US6EIpLsAvxvp/gSpPwIIIIAAAgggkF4CLH+VRs+rRo0apvGg4TN1R7uFcuXKWc2aNaOd5jgCKS2wfPly06zd8aRatWrFk408CCCAAAIIIIAAAggkRYBAOimM+VNIpUqVrGPHjvbpp5/G9YGPPfaYnXHGGXHlJRMCqSYwbNgwe/bZZ+OqVr9+/eLKRyYEEEAAAQQQQAABBJIhwBjpZCjmYxkffPCBW/4qu49s1qyZLV682IoUKZJdVs4jkJICapHWTNy7d++OWT/NTK+8FStWjJmPkwgggAACCCCAAAIIJEuAMdLJksyncnr27Gl33313zE+rXr26TZw4kSA6phInU12gQYMGbg3pYsWKRa1q2bJlbcKECQTRUYU4gQACCCCAAAIIIJAXAgTSeaGax2X+9a9/tddff90aNmwY8klFixa1s846y+bPn28KQkgIpLuAhiZMnz7d2rdvH3Irmiugd+/eNnfuXOvatWvIOXYQQAABBBBAAAEEEMhrAbp257VwHpe/bNkyW7lypZUqVcpat25Ny1wee1P8gRNYvXq1W+JKwxWaN29u6nlBQgABBBBAAAEEEEDgQAgQSB8IdT4TAQQQQAABBBBAAAEEEEAgbQXo2p22j46KI4AAAggggAACCCCAAAIIHAgBlr86EOp8JgIIIIAAAggggAACCCCQRwJa9USTD8+cOdN++eUXq1Wrlmm5UOaWSR44XbuTZ0lJCCCAAAIIIIAAAggggMABFZg2bZoNHTrU1q9fn6Ue3bp1sxdffNGqVauW5RwHEhMgkE7Mi9wIIIAAAggggAACCCCAQEoKfPTRR9arVy/bu3dv1PrVr1/f5s2bxyTFUYXiO8EY6ficyIUAAggggAACCCCAAAIIpKzA77//bueee27MIFqVX7Fihf3lL39J2ftIl4rRIp0uTypKPR966CH77rvvopzlMAIFU6B8+fJWpkyZgnlz3BUCAQGNaWvatGngCJsIIIAAAuksUKxYMWvSpEme3MJrr71mgwYNiqvsEiVK2JYtW6xs2bJx5SdTVgEmG8tqklZHrrrqKtu/f39a1ZnKIoAAAggggAACCCCQiQI1atSIOHY5GRazZs2Kuxi1Xs+fP9+OPfbYuK8hY6gAXbtDPdhDAAEEEEAAAQQQQAABBNJOYPv27QnVOdH8CRWeAZlpkS5AD7lChQqmbhokBAqiwI4dO2zXrl3u1tS1+6CDDiqIt8k9IWA7d+60bdu2OQn9m964cWNUEEAAAQTSWEATfy1dujTP76BOnToJfUai+RMqPAMyM0Y6zR9y4cKF/a7dgwcPNs3CR0KgIApMmTLF5s6d625t4MCB1r1794J4m9wTAjZjxgx76aWXnESzZs1syZIlqCCAAAIIpLHAxo0brXr16u4O8rJrt7pqt23bNi6p2rVr25o1a6xQoUJx5SdTVgG6dmc14QgCCCCAAAIIIIAAAgggkFYCbdq0sRNOOCGuOt9xxx0E0XFJRc9EIB3dhjMIIIAAAggggAACCCCAQNoIPPPMM9aiRYuY9b388stt2LBhMfNwMnsBAunsjciBAAIIIIAAAggggAACCKS8QKVKlUyzd1933XVWunTpkPoedthhNm7cONPyuaTcCzDZWO4NKQEBBBBAAAEEEEAAAQQQSAkBrQ09atQoO+ecc/zWaQXRK1euTIn6FZRK0CJdUJ4k94EAAggggAACCCCAAAII/J9A8eLFfQtW9vEpkrZBIJ00SgpCAAEEEEAAAQQQQAABBBDIBAEC6Ux4ytwjAggggAACCCCAAAIIIIBA0gQIpJNGSUEIIIAAAggggAACCCCAAAKZIEAgnQlPmXtEAAEEEEAAAQQQQAABBBBImgCBdNIoKQgBBBBAAAEEEEAAAQQQQCATBAikM+Epc48IIIAAAggggAACCCCAAAJJEyCQTholBSGAAAIIIIAAAggggAACCGSCAIF0Jjxl7hEBBBBAAAEEEEAAAQQQQCBpAgTSSaOkIAQQQAABBBBAAAEEEEAAgUwQIJDOhKfMPSKAAAIIIIAAAggggAACCCRNgEA6aZQUhAACCCCAAAIIIIAAAgggkAkCBNKZ8JS5RwQQQAABBBBAAAEEEEAAgaQJEEgnjZKCEEAAAQQQQAABBBBAAAEEMkGAQDoTnjL3iAACCCCAAAIIIIAAAgggkDQBAumkUVIQAggggAACCCCAAAIIIIBAJggQSGfCU+YeEUAAAQQQQAABBBBAAAEEkiZAIJ00SgpCAAEEEEAAAQQQQAABBBDIBAEC6Ux4ytwjAggggAACCCCAAAIIIIBA0gQIpJNGSUEIIIAAAggggAACCCCAAAKZIEAgnQlPmXtEAAEEEEAAAQQQQAABBBBImgCBdNIoKQgBBBBAAAEEEEAAAQQQQCATBAikM+Epc48IIIAAAggggAACCCCAAAJJEyCQTholBSGAAAIIIIAAAggggAACCGSCAIF0Jjxl7hEBBBBAAAEEEEAAAQQQQCBpAgTSSaOkIAQQQAABBBBAAAEEEEAAgUwQIJDOhKfMPSKAAAIIIIAAAggggAACCCRNgEA6aZQUhAACCCCAAAIIIIAAAgggkAkCBNKZ8JS5RwQQQAABBBBAAAEEEEAAgaQJEEgnjZKCEEAAAQQQQAABBBBAAAEEMkGAQDoTnjL3iAACCCCAAAIIIIAAAgggkDQBAumkUVIQAggggAACCCCAAAIIIIBAJggUzYSb5B4RQAABBP4n8MADD9iOHTvcTqFCheziiy+2KlWqZMszefJkW7RokcvXpUsXO/bYY2Neo89Ys2aN/fnnn3bIIYdY5cqVrUiRIjGv4SQCCCCAAAIIIJAuAgTS6fKkqCcCCCCQBIFNmzbZtm3b/JJeeuklu/LKK/39aBu6ZsOGDe60F4iH5926datNmDDBVq1aZT///HPI6cKFC1vTpk3trLPOsooVK4acYwcBBBBAAAEEEEg3Abp2p9sTo74IIIBAEgW++uormz9/fq5L3LJli40ePdoWLFiQJYhW4WqZXrJkiY0YMcKWLl2a68+jAAQQQAABBBBA4EAKEEgfSH0+GwEEEEgBgVdffdV+++23HNdELdEKohVMK6n1uV69eta9e3fr06ePNWjQwC9bnzNu3DjbtWuXf4wNBBBAAAEEEEAg3QTo2p1uT4z6IoAAAkkW2L59u73++uuu23VOip4xY4YpmFbSuOsLL7zQWrduHVLUnDlz7Nlnn3XH1DX87bfftoEDB4bkYQcBBBBAAAEEEEgXAVqk0+VJUU8EEEAgyQKHHnqoX+Inn3xiK1eu9PcT2Zg3b56f/eSTT84SROtkhw4drGPHjn6+ZcuW+dtsIIAAAggggAAC6SZAIJ1uT4z6IoAAAkkSGDBggFWqVMmVtn//fnvhhRds3759CZX++++/+2Oi1RrdqVOnqNe3aNHCP7dx40bbu3evv88GAggggAACCCCQTgJ07U6np0Vdkybw3HPP2c6dO115+uP/jDPOiGsm4enTp5smZ1Jq27ate7mdCP9RYLJ582bX5bVcuXKu/JIlS0bIySEEDoxAiRIlXHfuhx9+2FVg/fr19uGHH1qvXr3irpDXpVsXHHTQQVa2bNmo1xYvXtw/p98PTUBGQgABBBBAAAEE0lGAQDodnxp1zrWAJkUKLuGj8Zpnn312tuVqLKmCY6Vff/01Yn7NSKxZkLVU0J49e0LyaNmfY445xlq2bOkmZAo5yQ4CB0CgWbNm1qZNG3/mbq0XfdRRR9nBBx8cV23Kly9vJ5xwgikwViAdKy1fvtw/rbWrg4G1f4INBBBAAAEEEEAgDQTo2p0GD4kq5r3Ad999l5QleRYtWmQTJ060NWvWZAmidRdqvXvzzTdt/PjxtMbl/WPlE+IUGDRokJUuXdrl1pc/Wls63lSqVCnr27ev9evXz7p06RL1srVr19rUqVP984cffri/zQYCCCCAAAIIIJBuAgTS6fbEqG+eCUyZMsV2796d4/LVEq0g2UsKTBo2bOhaoI888kgLdutevXq1aaZjEgKpIKChB6eccopfFf0saz3oZKUvvvjCHnjgAX/8tX43TjrppGQVTzkIIIAAAggggEC+C9C1O9/J+cBUFVBXbY0PVctaTlIwMK5WrZrrKl6mTBm/qJ49e9qLL75o69atc8cWLlxo3bp188+zgcCBFOjcubPNnTvXvv32W1cNrS3dpEkTU4tzTtMvv/xiEyZMsM8++8wvQmtMDx482NQlnIQAAggggAACCKSrAC3S6frkqHfSBGrUqOGXpbHN33//vb8f78amTZtM466VihQpYkOGDLFgEK3japEOtvppsrNo46yVn4RAfgpo0j3NE1C06P++X1UQ/MYbb+SoCpqN+7333rPbbrstJIiuUKGCXXPNNW4Mdo4K5iIEEEAAAQQQQCBFBAikU+RBUI0DJ6BW4WDrmCZbSnQ24eDMxYcddpg/3jT8rhRIeIGKzilYISGQKgKHHHKI9enTx6+OelloGEIiSfMN3HHHHfb666+blsZSUiv0cccdZ7fffrsdccQRiRRHXgQQQAABBBBAICUFCKRT8rFQqfwU0MzBwe7cP/74o82ePTuhKmjGYi0lpFfVqlWjXquAO7h2bjCAj3oRJxDIR4HevXtb9erV3Sfq51prS8fzxZLy6kuoUaNG+TPbqxDNCn7LLbeYJjQLzhOQj7fERyGAAAIIIIAAAkkXYIx00kkpMB0F1ErWtGlT+/LLL131tV609tWCHE9q3Lix6RUr7du3L2TWYi0vFN79O9b1nEMgPwTUY0JdvP/xj3+4j9OY/mnTpmX70WqBfv/99/18+t3RWOjmzZv7x9hAAAEEEEAAAQQKigCBdEF5ktxHrgWOP/54U7dUzdytVuN33nnHzjrrrByXu2vXLjex2B9//GE//PCDrVy50jSWWknjUdXyR0IgFQW0NJWWsvr4449d9dTSXK9evahV1dwCwSC6bdu27ncnNxOVRf0wTiCAAAIIIIAAAikgQCCdAg+BKqSGQNmyZU0zaytoUNLsxV999ZWbuTgnNdy8ebO9/PLLES9VgF6/fv2I5ziIQCoInHzyyfb555+7cfwa67xs2bKo1dLScV7SUm/nnXee+7LIO8Y7AggggAACCCBQ0AQYI13Qnij3kyuB1q1bW926df0y3n33XX/CJP9gEja0tNDXX3+dhJIoAoG8EVBr8hlnnJFt4Rs2bPBnutcY6KFDhxJEZ6tGBgQQQAABBBBIdwFapNP9CVL/pAqoy/WAAQNs7NixpjHNWqJKa0v37ds34c+pVauWm2BJrXk7duxw3cbXrFnjytmzZ48pmL7wwgv9iZ0S/gAuQCCPBfTFUsuWLV3LdLSPCrZUaxjDfffdFy1ryHHN5H3rrbeGHGMHAQQQQAABBBBIFwEC6XR5UtQz3wQ0CdgxxxxjmnBM6bPPPnPBRM2aNd1+vP/RetLBCchU5qpVq+z55593syBrluNPPvnEBdvxlkk+BPJbQK3S6j3hLWUV/vkawuAlze6t+QDiSQqkSQgggAACCCCAQLoK8JdMuj456p2nAkcffbRVqVLF/4y33norriWA/AuibGiNaZXtJc2ITEIgPwUSDWArVqxoJ510UkgVg2uhb9u2LeQcOwgggAACCCCAQCYI0CKdCU+Ze0xYQK3J6uL99NNPu2s3btxoc+fOjVrOc889Z+rWqqSgo3LlylHzqsu3l9R1XK14iQY33vW8I5CowN13353oJdatWzf3inThxRdfHOkwxxBAAAEEEEAAgQItQIt0gX683FxuBGrXrm1t2rTxi/joo4/cDMb+gcCGlrpav369eynojjdpciaC6Hi1yIcAAggggAACCCCAQGoIEEinxnOgFikq0KNHD9OyWEqaIExrQUdKwRboFStWRMriHwuer1Gjhn+cDQQQQAABBBBAAAEEEEgPAQLp9HhO1PIACZQoUSKuGbs19tlLS5cujbrm7jfffGPz5s3zsoYsteUfZAMBBBBAAAEEEEAAAQRSWoAx0in9eKhcKgho5u2GDRuaguBoScsEzZkzx7Zs2eKWzdLSVkcddZRpPHSFChVs+/btbubj4FJBmh28Y8eO0YrkOAIIIIAAAggggAACCKSoAIF0ij4YqpVaAlpHWktXeROKhddO45yV5+WXX/bzLFiwwPSKlDQ2+pRTTrFixYpFOs0xBBBAAAEEEEAAAQQQSGEBunan8MOhanknkOgEX+XKlbPu3buHVEgzeweTundrBmNNUhYrHXnkkXbFFVcY46NjKXEOAQQQQAABBBBAAIHUFaBFOnWfDTXLQ4Grr7464dLbtWtnesVKWnN32LBh9tNPP7lu3ps3b3aTlB100EFWqVIltza1gnISAggggAACCCCAAAIIpK8AgXT6PjtqnqIChQoVcutIaybvRo0apWgtqRYCCCCAAAIIIIAAAgjkVICu3TmV4zoEEEAAAQQQQAABBBBAAIGMFCCQzsjHzk0jgAACCCCAAAIIIIAAAgjkVIBAOqdyXIcAAggggAACCCCAAAIIIJCRAgTSGfnYuWkEEEAAAQQQQAABBBBAAIGcChBI51SO6xBAAAEEEEAAAQQQQAABBDJSgFm7M/Kxc9MIIIDA/wR27Nhha9assT///NMOOeQQN+N8+BrpWCGAAAIIIIAAAgiEChBIh3qwhwACCBR4ga1bt9qECRNs1apV9vPPP4fcb+HCha1p06Z21llnmdZFJyGAAAIIIIAAAghkFaBrd1YTjiCAAAIFVmDLli02evRoW7BgQZYgWjetluklS5bYiBEjbOnSpQXWgRtDAAEEEEAAAQRyI0AgnRs9rkUAAQTSSEAt0QqiFUwrqfW5Xr161r17d+vTp481aNDAv5vffvvNxo0bZ7t27fKPsYEAAggggAACCCDwPwG6dvOTgAACCGSIwIwZM0zBtFKhQoXswgsvtNatW4fc/Zw5c+zZZ591xzR++u2337aBAweG5GEHAQQQQAABBBDIdAEC6Uz/CeD+EUAgYwTmzZvn3+vJJ5+cJYjWyQ4dOtg333xjs2fPdnmXLVvmXxO+sW/fPlu/fr19//33pu1KlSpZ9erV3Xt4Xu3v37/fHVYQ7yWN0d6wYYP9/vvvbqKzWrVqWfhkZ7t377bVq1fbH3/8YYceeqiVK1fOu5x3BBBAAAEEEEDggAgQSB8Qdj4UAQQQiE/giSeecIFp586drVq1avFdFCGXAlVvYjEFsp06dYqQ63+HWrRo4QfSGzdutL1791rRov//fxcKmt944w2bNm2aOxcsSGUfddRRduKJJ1qVKlX8U99++63rVq4Dbdu2tUGDBtkLL7xgixcv9vNo4+CDD7azzz7bGjdubJs2bbJnnnnGzSruBeFenmHDhln9+vVDrmUHAQQQQAABBBDIL4H//5dRfn0in4NAigrs2bPHHzuqgCXYapaiVaZaGSCwbds2NzHYBx984AJHBdQKVIsXL57Q3XtdunXRQQcdZGXLlo16fbBsBbCagMxLv/zyiym4X7FihXco5F3558+fb99995397W9/i/g5CpDHjBljP/zwQ8i12vnpp5/sscces8GDB9vLL79sv/76a8Q8Dz/8sF1zzTVWt27dLOc5gAACCCCAAAII5LUAgXReC1N+2gh88cUX9tZbb7n6DhkyxE3ClDaVp6IZIaDgVa9XXnnF2rVrZ0cffbTVqVMnrnsvX768nXDCCa57tQLpWGn58uX+abUqBwNrfbYXROvLJi2VpVeZMmVMrc4zZ850n6HAXS3OF110kV+Wt7F27Vq3qS7c6kquL67URVzjs5XUlfupp55y25oQTS3YqoeCc3U7V2CvPBMnTrRrr73W5eM/CCCAAAIIIIBAfgoQSOenNp+V0gIKpL0U7EbqHeMdgQMhoJbZWbNmmcY3a/IvJQWRH3/8sXvVrl3bBdQKrEuVKhW1ijrXt2/fqOe9Ewpyp06d6u3a4Ycf7m+vXLnSFi5c6O8PGDAgpEzVoWbNmq4lWZm0jJZ6ehQrVsy/xttQMH/11Ve7/N4xdevW5GZeKlmypF1//fWmcdNe0rJdahFXUuAerXwvP+8IIIAAAggggEBeCLD8VV6oUmZaCShonj59unmtZGlVeSpb4AVq1KjhZs2+99577eKLL7aWLVu6Zau8G1+3bp299NJLduONN7rZtr3WYu98Iu/6MumBBx5wE4fputKlS9tJJ53kFzF58mR/u0mTJm7JLP/A/22o67lap5U0tlrBd6Sk1nEF3cGkLuvBpEA9GETrXKtWrfz71+/uzp07g5ewjQACCCCAAAII5IsALdL5wsyHpJqAZgnWJEo//vijff3116ZxnyQEUllA3aAVROqllum5c+fap59+6ma8Vr3VMquu0XodcsghrpVa3aaz68ata/XzP2HCBPvss8+065K6VKs1XF3CvaSZs72kZbMizSOg1mdNJKbWYiW1KocnlR1psrPwujZr1iz8UjejtwJ1r3Ve611XrFgxSz4OIIAAAggggAACeSlAIJ2XupSdsgJqWVMgnYykGYwVkGsCJW0r8NB4zmAAEvwcr9t4MAhRIKMyFAxVqFDBBULhSwBp6R8tM6RWPrVSxposKvh5bBc8AQWcPXr0cC/1pFBAra7fu3btcjern0WNH/7Pf/7jWrC7d+8e0kXbE9HP0ocffmjvvPOOW37KO66fwfPPP9+OOOII75Cb9EtBq5fCW5O943pv3769ewWPBbdVfvjPt84HZwbX74e6emeXvN+n7PJxHgEEEEAAAQQQSKYAgXQyNSkrzwTUWqa1Y4888ki31mxuPygYxOa0LE14pOV/1AKoADo8aQKm4447LmRN3TVr1rjut8qr1rbjjz/eTXCmVvFgUqChbq316tVzsxhPmjTJzXAcDBoUqJ9yyilxTzYVLJ/tgiOgycb0OvXUU01dsxVUf/XVV27CL/1cakyzfm6CY51195q469lnn7XNmzf7GGopPvbYY92kZOEtycF8ukBf5uQ0xdOCrKA6GFjn9LO4DgEEEEAAAQQQyAsBAum8UKXMpAts377dvvzyS7e2rYIGBdQaoxlpEqN4Pvz0008PaYHTNePHj497vKXGZb722msxx1Wrvhq/qlmLNdY0PGmZn3HjxoUEMl4eLXn06quvWv/+/V1rYbAl0MujVmzNinzOOefkKqjxyuM9vQX0u6D1nxU8a73oSEtL6Q4VVGt2erVCB7+Y0Rc7+mImWoDsdaVWGWoRDw+0dTzeRIAcrxT5EEAAAQQQQCBVBQikU/XJUK+oAurKqte7775rzZs3d0F19erVo+aPdCJSt2u1xsWbFIQEJyerX7++W+NXAbNanTWzsJK+AFDQojGj4ckLdPS5mkCqcuXKrnv3559/7rL+/vvvrnuudtSCrnutVKmS+1yNVVWLuLp7a31hBdOkzBVYtWqVa4nW+s3hX7qoC3Vwwq7XX3/d3n//fR9LvR80Flo/X7GSfva8pC7kCsKT0bPDK5N3BBBAAAEEEEAgnQQIpNPpaWVwXdXNWV1U1XXVGweqQFOBg15ah1at1AoGctNSFg+xxikvW7bMz9qtWzfr0qWLv686aLInBdtKWpNXY1EjtcIp8FYQXLVqVf96Bfla2shLJUqUsGHDhrkyvWPquqsWcSUF7tHK9/LzXvAE9CWNhhXMnj07YuuzvlzSDNqacMwbT6/flWAQrfWZzzrrrJjLZnlyGvfvJbV6q6t38OfWO6f3559/3pYuXeoOxROkB69lGwEEEEAAAQQQSAcBAul0eErU0U3e1bt3b+vZs6cLTBcvXuxmBVarrJImDlPgqiBBY5MVVKsLeF6kjz76yC9W406POeYYf9/b0IzGyqfWQQUd6uJ92GGHeaf9d42hDg9GVP9gIK0xqwrMg6lRo0auNVCtgnrpywWNIScVbAH9LHnjoDV0wPv59+66ePHipiWkjj766CxjopVnypQpXlb3O3LeeefF3aqsstVrYsuWLa4MrW198skn++V5G5roTOe8buPhP99ePt4RQAABBBBAAIF0FiCQTuenl4F1VzdoBZF6/frrry6oUFCtGa+V1DKrrtF6acZfBdTqNu2ta5sMsvXr1/vFNG7cOGIgotZnTSSm1mIltSqHJ3WLVcAdnsLrGpw52csrB7Vmy0Bp9+7dBNIeTgF8Vy8Ib2buSOsm161b1wXPamGO1iNDS76pHCXlGTp0aMSf3Vh8+iJLa1Yr6cseBe3hX1hpyIUXRCvwDv8SKFb5nEMAAQQQQAABBNJFgEA6XZ4U9cwioICzY8eO7qXxxosWLbIlS5a4oFKZNZmXxg9reZ+GDRu6fLVr185STiIH1MKsLuVeitXapomf9IqW1IIcaVx2+LJAGsNKylyBp556KmR9Z09CX6S0a9fOBdDBMdDe+fD34HAEja2/7777wrNE3NfP6K233urOqaVbv0/64kq/C2PGjHFfGB166KFu6TYF+/o99FKvXr28Td4RQAABBBBAAIECJUAgXaAeZ+bejMaD6qU/3L/55htTK7WW91HLmLq/ekFEbgNpzYYcTLEC6WC+SNvxdMVWy3Z4YB2pLI4VXIHwn7kGDRq4sc/qbZHIrPXB5av0O+FNdpedXPDLHv0san3psWPHmmaWV08IrVUdKSnID84dECkPxxBAAAEEEEAAgXQVIJBO1ydHvSMKKPBU67MCBS0PFQweIl6Q4EGvK7UuU4t4pC7b8RYZafKxeK8lX2YJ6EsX9b7Q5GE5/fJGgW8ykrqR33zzzaaWcn1pFZ60NFa/fv2yzB0QDMjDr/H2lUdDHvQFWKwvCWKd88riHQEEEEAAAQQQyEsBAum81KXsfBXQ2GV1K9VswcHu16qE/kBPxljN4LJZ6tqqP/hZAihfH3PGfZhagPVzl9ueCRdffHHS7BTYX3PNNW6MvpaBU+u2AmgF+eoZoonJwpMm5nv00UfDD4fs64sptXZnl+6+++7ssnAeAQQQQAABBBDIUwEC6TzlpfC8FtDES5rFWAG0N5tw8DM12ZE34ZjGlOY2BdfSVav31q1b3drOkcqdPHmym1lc57R8V6RJwyJdxzEEggLBn7ng8VTYVq8MTbinFwkBBBBAAAEEEMgkAQLpTHraBeRetQSQ1mb2lsDyZgj2bk/dPr0lsHI7Jtor03tX2RUrVnQBtI5pbesePXp4p/13TXSm4N6rWyoHQ36l2UAAAQQQQAABBBBAAIG4BAik42IiUyoIaH1aBaeamVvrJoenGjVquNbnZs2a5Wrscni54fsaq6o1q5Xmz5/vgnZ1Zw2mTz75xA+iFXhrKS4SAggggAACCCCAAAIIFAwBAumC8RwL/F1MnDjRjX0Ov1Gth6slptR9OxljoMPLj7SvtXPnzJljmk1ZY7HHjRvnliCqWbOmWwJILeXeLOG6vlOnTpGK4RgCCCCAAAIIIIAAAgikqQCBdJo+uEyrtmbgDibNHKzguUmTJpbfs19r4rJTTz3VXn75ZduxY4cLprW2bqTUvHlza9OmTaRTHEMAAQQQQACBNBTQHCkbNmxwk43qS3QSAghkpgCBdGY+97S8a01s1KpVKxdAH+gxx+pGPnz4cJs0aZKtWrUqi6cmNuvataup9TqYEl0CKNaXBLHOBT+TbQQQQACBzBDQ2u5t27aN62b1/6NatWpZ+/bt3UvL65UtWzauazM104IFC+ySSy5xQ8xkreTNhZKpJtw3ApksQCCdyU8/je5dLcBaXieeQDSnt6XlfBJJ+oNj6NChpmWwtPyP1qxWsK8gv0qVKhHXwdXkZ3//+99jfoyWDrrtttti5tHJq6++Ots8ZEAAAQQQyBwBtZRqCch4k1a98Ob8qF+/vttOxRUmNO/Id999525LE3zqC4D8Tvp8DdX6448/8vuj+TwEEEhRAQLpFH0wVCtUILh+c+iZA79XqlQpq1evnnsd+NpQAwQQQAABBBIXWLFihXXo0MG0dGOqze2hteOnTJniburtt98+IIH0G2+84QfRhQoVsp49e0Zd/jJxfa5AAIF0FCicjpWmzggggAACCCCAAAKxBWbOnOmCP7Wihr/WrFljb775pg0ePNgvRJNo3nHHHf4+G/9fYO3atf7OsGHD7L333rOXXnrJP8YGAghkngAt0pn3zLljBBBAAAEEEMgAAc2lUaxYsYh3WqdOHdNrwIABpnk9nnjiCZfv008/tb179+b7RJ4RK5lCB/fs2ePXpnHjxv42GwggkLkCBNKZ++y5cwQQQAABBBBAwC644AI/kN65c6ctXLjQ2rVrF1VGSz8uWbLEzQ/SqFEjS2RctSbp+uabb0xdybdu3WoNGjSwZs2aRewm7U3k5b2rQhoH7u2ri3VO0rZt20xLVX777bfuS4SWLVtaw4YNo37pEP4ZGtJFQgABBAik+RlAAAEEEEAAAQQyWEDBcDBFm9hz/vz5dtlll9miRYss2EJbrVo1O/bYY+2+++5zrdzBsrxttXI/+eSTdvvtt9umTZu8w/67WnlfeOEFa926tX+sadOmtmzZMn9fG2pBV9Ls5PPmzXPb8f5n+fLlNmTIkIjXabLQkSNH2lVXXRUysWnfvn1t9uzZbmJR73Muv/xyu/XWW61ChQq2cuVK7zDvCCCQYQKMkc6wB87tIoAAAggggAACQYHgMo7qCh6p6/KDDz5oWiJLwWswiFY5GzdutJdfftm1YkcLbrVslF6RgmiVoYC5Y8eO9vzzz2s36Un105KU0er366+/2rXXXusmWtuyZYv/+Tt27DC1YKsVPpjUmh50C55jGwEEMkOAFunMeM7cJQIIIIAAAgggEFHggQce8I+rpVets8Gk4FYttV5SV+jTTz/dLfWobuCatGz9+vUuSFbL9PTp00O6hr/77ruuNVrXq7X77LPPdi3YWsZKLboK0r/66isXrCrY7t27tyv7iiuuMAW1zz33nOsKrut1rbqD16hRQ7txJQXpum7fvn0uv7pxq2Vard+rV6+2GTNm2KuvvurOzZ0716677jobN26c29d2r169XICvFm0lLckpg5x2LXeF8B8EEEh7AQLptH+E3AACCCCAAAIIIBC/gMYYb9682QWv//73v23ChAn+xeecc46/rY3ffvvN/vrXv/rHLrroInvooYdCxhPffPPN1q1bNxfsKr/Ojx8/3r9m0qRJ/vaZZ57pB6neQc2C3aZNGzfuWmO0tQTXeeed51qwlUcToGlMtZKuV3frRNJNN93kB9FHHnmkvf/++3bwwQf7RVx66aXu82+88UZ3TIG7HI477jg76aST3Eut7l4gfeKJJ7pA3C+ADQQQyEgBunZn5GPnphFAAAEEEECgoAtoPWjN3B3pdcghh7jg1wuilefpp5+24cOHh7D885//tO+//94d05jl8CBaJ9SyrK7TXpo4caJt377d23WTi3k76l4dnooXL+5avNVSrJe6UycrqYVZgbmXtGRVMIj2jt9www12xhlneLv2yCOP+NtsIIAAApEECKQjqXAMAQQQQAABBBBIcwHNcK3uzOEvHQ9PtWvXth49eoQfto8++sg/pq7W0ZbTUkuvgnMltUpPnTrVv65+/fr+9m233WbPPPOM7dq1yz+mjfPPP9++/vpr9wp2Iw/JlIOdOXPm+FephVndwqOloUOH+qc0szgJAQQQiCVA1+5YOpxDAAEEEEAAAQTSVEDBcfXq1bPUXoH0L7/8YmvXrvUn0dLEWS1atHCBc6tWrfxrvO7MOqBZu//44w//XPhGcFkojT32krpHK3hWUtdtddtWsKzAvUuXLta9e3dr3ry5lz2p716XcBWqsc6xkr4M8JKuk1O0Gcy9fLwjgEDmChBIZ+6z584RQAABBBBAoAALvPbaa9a+ffuod6hW4VtuucW8ycY0O/Xo0aP98c1qWVaw7SUtXxVvUsDspRNOOMH+9a9/uVmxvQm/1H379ddfdy/lU/dwjX++5pprIgb/XlmJvgcD6Tp16sS8vHLlyv55rXf9ww8/WM2aNf1jbCCAAAJBAbp2BzXYRgABBBBAAAEEMkSgdOnSNmbMGOvZs6d/x0uWLPG3FVhrYrKcpPDloq688ko3WZeWmAp29fbK1jjsf/zjH26JqmDw7p3P6ftPP/3kX3rQQQf525E2wsdmV6xYMVI2jiGAACVQp5MAAEAASURBVAJOgECaHwQEEEAAAQQQQCCDBYJdntUK66Vq1apZsLv2559/nmW8dfj4a2//zjvv9Irx3+vVq+davL/99lu37JS6ew8ePDhk8i99/sUXX+xfk9uNunXr+kVoia5YyZtUTXk03ltfNJAQQACBaAIE0tFkOI4AAggggAACCGSAgGbK9pK6c3tJ6yQfccQR3q4pANaY4WivpUuXujWktY601xKsMdXTpk1zLwXiXlKAe+6557r1mTds2BCyxFZwgjAvf07fg/UPtrZHKi84sZqCfhICCCAQS4BAOpYO5xBAAAEEEEAAgQIuULZsWf8Og4G0DgaD7HHjxvn5wjc2bdpknTt3dhOHafKwLVu2uCxqYda+Xr1793YTeIVfq+WvRo4caUWKFHGntm7d6iYlC8+Xk/3gLN3PP/98zHK1NJaXOnbs6G3yjgACCEQUIJCOyMJBBBBAAAEEEEAgMwSCY4f37t0bsgb05Zdf7iNoPeYpU6b4+96GrtHYZ2+CsdatW1ujRo3cabU8e5N4KdgOLovlXa/3BQsWuG7j2j788MMtGNyrZdxLar1OJJ166qn+slyaqfz666+PGMw/+OCDNnv2bFd0iRIl7LrrrkvkY8iLAAIZKEAgnYEPnVtGAAEEEEAAAQQ8gWAgrWPByb60PJXGMXupf//+bqbvGTNm2FdffWWaGbxTp0724osvuizq9n3//fd72d37aaed5u9rKSxNcKZrNbnXzJkz7a677rJ+/fr5eYLbOti0aVP/nPJqlvGJEyf6x2Jt6N7uuOMOP8tjjz1mqsMbb7zh1qx+//337YYbbrCrr77az3PBBRdYjRo1/H02EEAAgUgCLH8VSYVjCCCAAAIIIIBAhghUqFAh5E5HjBhhr776qn9s1KhRpvHFX3zxhWs1VjCrV6R02223ufWhg+fuvvtut8yVWqTVdVytvdFafNUVO7xszSquOihpfWq1frdt29bU2hxPUmCsgHnSpEkuu1rW9YqU+vbta5EmSouUl2MIIJDZArRIZ/bz5+4RQAABBBBAoIAIqAu0WoS9VLJkSW8z5nvVqlX97tfKqFbmlStX+tdo9u558+a5ADbYzdrP8N+NZs2aufWn//73vwcPu20tI6UWbAW/0ZLKHTJkiGnCr2C3buVXq3ifPn2iXZrtcY29Vgv2ww8/bOq2HSnJTV8CKMAO/2JB+aNdF6ksjiGAQGYI0CKdGc+Zu0QAAQQQQACBAi6gpaq0/FSiSUHs5s2bY16mQHL06NF20003ufHMCxcutF27dlnNmjWtefPmdswxx8S8XpOWzZ0717VqK6hWy/Lu3btdF2qNiW7VqpU1btw4Yhn6QuCdd94xjY9etWqVaXKy4GzcES+KcPCyyy6zs88+2zR7+KJFi2zdunWmFvCWLVu6e4i13JW6o+tFQgABBDwBAmlPgncEEEAAAQQQQACBmAJqvVbrcE5aiBWwK2jVKydJ45ZzO3a5fPnyroVbrdwkBBBAIDcC/7//T25K4VoEEEAAAQQQQAABBBBAAAEEMkSAQDpDHjS3iQACCCCAAAIIIIAAAgggkBwBAunkOFIKAggggAACCCCAAAIIIIBAhggQSGfIg+Y2EUAAAQQQQAABBBBAAAEEkiNAIJ0cR0pBAAEEEEAAAQQQQAABBBDIEAEC6Qx50NwmAggggAACCCCAAAIIIIBAcgQIpJPjSCkIIIAAAggggAACCCCAAAIZIkAgnSEPmttEAAEEEEAAAQQQQAABBBBIjgCBdHIcKQUBBBBAAAEEEEAAAQQQQCBDBAikM+RBc5sIIIAAAggggAACCCCAAALJESCQTo4jpSCAAAIIIIAAAggggAACCGSIAIF0hjxobhMBBBBAAAEEEEAAAQQQQCA5AkWTUwylIIAAAggggAACCCAQXeC6666z999/32V48MEHrVu3btEzcwYBBNJGYO/evbZ06VJbvny51apVyxo1amSVKlWKu/579uyxlStX2o8//milSpWyunXrWpUqVeK+/kBlJJA+UPJ8LgIIIIAAAgggkEECa9eudX9s65a3b9+e9Dv/5JNP7LvvvnPl9ujRw/1Bn/QPoUAEEPAFHn30UXvuueds8eLF9ttvv/nHtVGtWjW766677Lzzzgs5HtzZsmWL3XPPPfbII4/Y7t27g6esa9eudsstt5h+l1M10bU7VZ8M9UIAAQQQQAABBBCIW+Duu++2YcOGudcXX3wR93VkRACBxAVGjhxpl1xyic2ePTtLEK3SNm7caOeff76dcMIJ9scff2T5gE2bNlmnTp1szJgxWYJoZZ4xY4b17t3bHnjggSzXpsoBAulUeRLUAwEEEEAAAQQQQAABBBBIcYERI0bYbbfd5teyRo0aNmjQINPxiy66KKRb9+TJk23UqFF+Xm3s37/fBgwYYN9++61/vHnz5nbFFVfYKaecYhUqVHDH//zzT7v++uvto48+8vOl0gZdu1PpaVAXBBBAAAEEEEAAAQQQQCBFBTQs49577/Vr17lzZzf3QenSpf1jCqhPPvlk+/TTT90xr4u3unsrTZw40T777DO3rf/o/M033+zv//LLL3bkkUe6cdNeML1gwQL/fKps0CKdyyexa9cuGz16tHXs2NENitcA+xNPPNH07QsJAQQQQAABBBAoyALqQq0/il999VVbsWJFUm5Vfzh//fXX9tJLL9nj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igACCCCAAAII5JPA2rVrbdiwYXF/mlqvBwwYYN9++61/TfPmze2KK66wU045xSpUqOCO//nnn3b99debgnQSAgggkK4CjJFO1ydHvRFAAAEEEEAAgSQKaBz09OnT7ZtvvrGZM2fae++9ZxrnHG+aOHGiffbZZ372u+66y26++WZ//5dffrEjjzzSjZv2gukFCxb459lAAAEE0kmAQDqdnhZ1RQABBBBAAAEE8kjg448/tpNPPjnHpd9///3+taeeempIEK0T5cuXt1deecXatWtnar1euHCha70+4ogj/OsS3di4caPNnz/f1q1bZxUrVrR69epZq1atrHjx4lmK0md6qVChQm7zjz/+sMWLF9vq1avd9U2bNo04odry5cvt888/t8MPP9xatGhhRYvyJ7RnyTsCmSpA1+5MffLcNwIIIIAAAgiktcAXX3xhPXr0sJdeesl+//33XN9L4cI5/7Pw559/dgGtV4mLLrrI2wx5b9OmjQtEvYMKrHOSFNQ2a9bMqlev7rqTX3rppXbmmWda+/btTYH5448/7oL1YNndu3c33aOC4K+//trGjx/vAm9do4nUevXqZbVr13bd2RVgK91+++1upvGGDRvaoEGD3KRrmkTt3HPPtXjGjAc/n20EEChYAnydVrCeJ3eDAAIIIIAAAhkisHnzZvvwww/dq1KlSjZkyBC74IILXICZE4KePXvakiVLQi599dVXbeTIkSHHIu2oNdtr8T3ooIPcTN+R8umYZu5WIKykruS33HKL2473P0899ZRdfvnlESczUxka261AXl3Jb7jhhizFqlv5PffcY88991zEc88++6xbrktfTjz99NNZ8vz22282btw427t3rwvGvdbtLBk5gAACBVqAQLpAP15uDgEEEEAAAQQyQUAtwv/617/cSy2sF154oWtlLVu2bNy3X6JEiSxBeHDMc6yCgmOdO3ToELFrtXe96uclrTGdSFIr/PDhw03BsFKdOnXspJNOss6dO5tmDH/ooYf8yc40PltfDqird3jygmid0/VKL7zwgn/t2LFj/UvU3fuEE06wHTt22OTJk23NmjV+ftWlS5cufl42EEAgcwRy3ocnc4y4UwQQQAABBBBAIOUEFDwqIDzuuOMs2Co6d+5c1zKtbs8KqLWf10lrR3tJ60XHSpUrV/ZPK/hNJN10001+EF2zZk03uZm+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" alt="Schematic diagram of a nested plot with three levels of nesting." width="400px" />
<p class="caption">
Schematic diagram of a nested plot with three levels of nesting.
</p>
</div>
<p>If plots are nested, with variation in sampling effort for trees of different sizes, you must include the Fractional Probability of Inclusion in the <code>fpc</code> column of the stem table. In the example, stems &gt;10 cm DBH are measured across the whole plot, so their <code>fpc</code> is 1. Stems &gt;5 cm DBH are measured in an area 20x25 m (0.1 ha), which is half the total plot area, so their <code>fpc</code> is 0.5. Stems &gt;2cm are measured over 0.05 ha, which is a quarter of the total plot area, so their <code>fpc</code> is 0.25, and so on. At present, the SEOSAW database only allows up to three levels of nesting, but contact us if you have data with more levels.</p>
<p>It is important to distinguish between nesting and subplots. Nested plots, as demonstrated above, are smaller parcels within a plot which denote variation in sampling effort. In contrast, subplots are merely administrative sub-divisions of a plot which can help with relocating stems for future censuses, for example. Sampling effort should be the same across all subplots. Below is an example of a plot with four 20x25 m subplots.</p>
<div class="figure" style="text-align: center">
<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAA7YAAAHCCAYAAADb1lVmAAABJ2lDQ1BrQ0dDb2xvclNwYWNlQWRvYmVSR0IxOTk4AAAokWNgYFJILCjIYRJgYMjNKykKcndSiIiMUmB/wsDNwM4gwMDPoJeYXFzgGBDgwwAEMBoVfLvGwAiiL+uCzMKUxwu4UlKLk4H0HyDOTi4oKmFgYMwAspXLSwpA7B4gWyQpG8xeAGIXAR0IZG8BsdMh7BNgNRD2HbCakCBnIPsDkM2XBGYzgeziS4ewBUBsqL0gIOiYkp+UqgDyvYahpaWFJol+IAhKUitKQLRzfkFlUWZ6RomCIzCkUhU885L1dBSMDIwMGBhA4Q5R/TkQHJ6MYmcQYgiAEJsjwcDgv5SBgeUPQsykl4FhgQ4DA/9UhJiaIQODgD4Dw745yaVFZVBjGJmMGRgI8QEhXEpVy5vHOQAAAGxlWElmTU0AKgAAAAgABAEaAAUAAAABAAAAPgEbAAUAAAABAAAARgEoAAMAAAABAAIAAIdpAAQAAAABAAAATgAAAAAAAACWAAAAAQAAAJYAAAABAAKgAgAEAAAAAQAAA7agAwAEAAAAAQAAAcIAAAAAOkW+OAAAAAlwSFlzAAAXEgAAFxIBZ5/SUgAAQABJREFUeAHt3Qm8XdO9OPAVgghiiEjErCpiJmZiFkJMfTU+HtXWUDW811ZfX00try1aniltKeqZKX2GoDxTzcQ8hojEGMQQMUvk77df9/6fc3PPvffc3Jucfe93fT7H2cPae6/9XTfH+Z219lo9pn+dkkSAAAECBAgQIECAAAECBEoqMEdJy63YBAgQIECAAAECBAgQIEAgExDY+kMgQIAAAQIECBAgQIAAgVILCGxLXX0KT4AAAQIECBAgQIAAAQICW38DBAgQIECAAAECBAgQIFBqAYFtqatP4QkQIECAAAECBAgQIEBAYOtvgAABAgQIECBAgAABAgRKLdCz1KVXeAIECBAgMBsEPvvss/TSSy+lt99+O/Xq1Sstu+yyafHFF58NJXFJAgQIECBAIAS02Po7IECAAIEuL3DOOeekBRZYoE2vlVdeuaZHBLJHHHFEWmihhdKqq66attxyy7TRRhulgQMHpo033jjddNNNNY+1gwABAgQIEOg8AS22nWfrzAQIECDQIALPP/98+uijj9pUmlr5Jk6cmDbZZJOspba5E913331phx12SL/+9a/TT3/60+ay2EaAAAECBAh0koDAtpNgnZYAAQIEGkdg7NixRWH69OlTLDe3EC27TdP06dPTiBEjqoLatdZaK2222WbpjTfeSLfddlt69913U+T72c9+lmLfsGHDmp7GOgECBAgQINBJAj2+/p/w9E46t9MSIECAAIGGEBg8eHCKVtullloqvfLKK3WX6aqrrkq77757cdyvfvWrLIDNN0yZMiUNGTIkvfjii9mm1VdfPT3xxBP5bu8ECBAgQIBAJwsIbDsZ2OkJECBAYPYKfPXVV6l3797p888/T1tvvXW69dZb6y7Quuuum0aPHp0d9+1vfztFoNs0PfbYY2mdddZJcb1Izz77bIqAuq0pjps2bVqWvWfPnqlHjx5ZmR999NE0fvz4tPDCC6d4/nfppZeuOmX8Pj1mzJj0+OOPp+WWWy6tueaaaZ555qnKY4UAAQIECHR1AYNHdfUadn8ECBDo5gKvvvpqFiAGw6BBg+rWiC7GjzzySHHcgQceWCxXLkT34wgq83T55Zfni21633777dPcc8+dvSKIvvDCC7NANQan2nvvvdPw4cOz0Zf32WefFKMyRzruuOPSoosumgXQe+21V9pggw1SdLWO/F9++WWbrisTAQIECBDoCgKese0KtegeCBAgQKCmQOXzte0JbO++++7s2dm4QDx/G8/V1kpbbLFFihbWSH//+99rZWt2+xdffFFsP+OMM9LFF19crOcL0Tp7ySWXZFMMRQvvBRdckO8q3uM8l112WZo6dWqK4HqOOfyGXeBYIECAAIEuKyCw7bJV68YIECBAIAQqA9sFF1wwxfOx8fzrU089lQHFtD3xTGy0xC622GIzoFW21kaLaLSq1krrrbdeseutt94qlutdyIPaaAX+1re+lXVLjm3xnHCk8847rzhllH+XXXZJ8Zzv9ddfn8aNG5fti+7SBx10UNpqq62KvBYIECBAgEBXFRDYdtWadV8ECBAgkAnkAzrFyn777TeDynPPPZc9M3vqqaemk08+OX33u9/NAsk846RJk/LF1K9fv2K5uYXoFpynmPN2ZlLMl/u73/0uzTnnnNlpDj744KzL8TvvvFOc9vvf/34aOXJkimdyI0X+DTfcMD388MPZ+i233CKwzST8hwABAgS6uoD+SV29ht0fAQIEurlAZYttJUW0zuZBY2x///33UwSKp512WmW29N577xXriyyySLHc3EIM8JSnOC66A7cnxSBQJ510UlX5+vbtm7bccsvidAMHDszKmge1sSPuZ+eddy7yxNy7EgECBAgQ6A4CAtvuUMvukQABAt1YoDKwjcDz0ksvTdFNOF4fffRR1q23sqU15qGNEYbz9MEHH+SLqbXAdr755ivyxvOwn3zySbFez8K+++7b7MjGlV2lhw4dmiqvl5+/f//++WKaPHlysWyBAAECBAh0ZQGBbVeuXfdGgAABAmmVVVZJm2yySfa69957U4wenAeIvXr1SgcccEA20NO8886bacXgS9ElOU8xVVCe8ql88vWm75WBZLSkxmBT7UnLLrtss4fNNddcxfbll1++WK61YKr6WjK2EyBAgEBXE/CMbVerUfdDgAABAlUCV1xxRdV6cysx3+xPfvKT9Mtf/jLbHXPS5mnAgAH5YqstoDE1UJ6iFTjmom1PWmqppVo9rL1Bc6snloEAAQIECJRQQIttCStNkQkQIECg4wU23njj4qQvvPBCMVdsZdfeyudti8wVC5WBbWsDTVUcNsPiPPPMM8M2GwgQIECAAIHaAgLb2jb2ECBAgEA3Eqh8fja6EeeDMlW22FZO/dMczYQJE4rNyyyzTLFsgQABAgQIEOhcAYFt5/o6OwECBAjMRoEY4TjmeI1Xa12Sx4wZU5R0xRVXLALbddZZp9ge88hWTv9T7PjHwtVXX11sGj58eLFsgQABAgQIEOhcAYFt5/o6OwECBAjMRoEpU6aka6+9Nns1ncanabHOPvvsYtOqq65aLEdgO2jQoGL9xBNPLJYrFyIwfvTRR4tNI0aMKJYtECBAgAABAp0rILDtXF9nJ0CAAIHZKFA57+uDDz6YTe3TXHF++9vfpvvvv7/YdfjhhxfLsbDPPvsU62eeeWaKc1WmmBJov/32Kzatv/76aemlly7WLRAgQIAAAQKdK2BU5M71dXYCBAgQmI0CEWAOGTIk5c/Gfu9730t33XVXGjZsWFphhRXSuHHj0jXXXJMquxDvscceacMNN6wqdUwJdOqpp6b3338/xZQ/2223Xdptt93SFltskd588810/vnnp2eeeSY7JkZCjrwSAQIECBAgMOsEBLazztqVCBAgQGAWC8S8r9ddd11ab7310uuvv55d/aKLLkrxai7FyMjNdVkeOHBg1tobwey0adNStNCee+652avpeY499ti00UYbNd1snQABAgQIEOhEAV2ROxHXqQkQIEBg9gtEUPrAAw+kAw88MEWg21yKEZB/8YtfZK25iy++eHNZ0q677ppuvvnmVGuO2b59+6aRI0em448/vtnjW9uYj8LcWr58f69evfLFmu9tyVPzYDsIECBAgECJBHpM/zqVqLyKSoAAAQIE2i3wxhtvZAM8xTy1H330UTYo1ODBg7P3ts4dGy22t9xyS3rqqafSxIkTU8xXG92ad9hhh9S7d+92l82BBAgQIECAQPsFBLbtt3MkAQIECBAgQIAAAQIECDSAgK7IDVAJikCAAAECBAgQIECAAAEC7RcQ2LbfzpEECBAgQIAAAQIECBAg0AACAtsGqARFIECAAAECBAgQIECAAIH2C5jup/12HXLk5MmT00033ZTGjBmTjda55pprpq233jrNPffcHXJ+JyFAgAABAgQIECBAYOYEvvjii3T77benxx57LMXyiiuumIYPH54WWmihmTuxoztMQGDbYZT1n+jUU0/NpoWYMmVK1cExlcTZZ5+ddtxxx6rtVggQIECAAAECBAgQmLUCN954Y/rBD36QJkyYUHXh+eefP8Xc5T/5yU+qtluZPQJGRZ497unII49Mp59+es2r9+jRI/33f/932meffWrmsYMAAQIECBAgQIAAgc4TuPzyy9M///M/p6+++qrmRQ499NB01lln1dxvx6wRENjOGueqq0TX4+23375qW3Mr8847b4q5FpdccsnmdttGgAABAgQIECBAgEAnCbz55pvZPOWffPJJq1e47rrr9LZsValzM+iK3Lm+zZ79t7/9bbPbm2789NNP02mnnZZOOOGEprusEyBAgAABAgQIECDQiQLRu7ItQW0U4ZRTThHYdmJdtOXUWmzbotSBeaZNm5Z69eqVpk6d2oFndSoCBAgQIECAAAECBGaXwJxzzpkFwQaAnV01kJLpfmaxfYyCLKidxeguR4AAAQIECBAgQKATBaLx6v333+/EKzh1awJabFsT6uD98eB579690+eff96mM88xxxwpnrWVCBAgQIAAAQIECBCYdQLxWGBLg0ZVlmSuueZKH3/8cTZ9Z+V2y7NOwDO2s846u1IEqltuuWU2d21bLn3MMcdkUwK1Ja88BAgQIECAAAECBAh0jMCJJ56Y4rt4W9Lmm28uqG0LVCfm0WLbibi1Tn333XenzTbbLE2fPr1Wlmx7nz590tixY1O/fv1azGcnAQIECBAgQIAAAQIdK/Duu+9moyJ/8MEHrZ749ttvT1tssUWr+WToPAHP2Haebc0zDx06NP3yl7+suT92RHeGSy65RFDbopKdBAgQIECAAAECBDpHoG/fvunSSy9NrQ0IddxxxwlqO6cK6jqrwLYuro7LfPTRR6eLLrooLb744jOcdLXVVkt33HFHGjFixAz7bCBAgAABAgQIECBAYNYIDB8+PN11111pjTXWmOGCAwYMSH/+8589NjiDzOzZoCvy7HEvrvrll1+m6Jo8ZsyYrJV2zTXXTEOGDEk9evQo8lggQIAAAQIECBAgQGD2CjzyyCPpscceS/H9fcUVV0zRC7O11tzZW+LudXWBbfeqb3dLgAABAgQIECBAgACBLiegK3KXq1I3RIAAAQIECBAgQIAAge4lILDtXvXtbgkQIECAAAECBAgQINDlBAS2Xa5K3RABAgQIECBAgAABAgS6l4DAtnvVt7slQIAAAQIECBAgQIBAlxMQ2Ha5KnVDBAgQIECAAAECBAgQ6F4CAtvuVd/ulgABAgQIECBAgAABAl1OQGDb5arUDREgQIAAAQIECBAgQKB7CQhsu1d9u1sCBAgQIECAAAECBAh0OQGBbZerUjdEgAABAgQIECBAgACB7iUgsO1e9e1uCRAgQIAAAQIECBAg0OUEBLZdrkrdEAECBAgQIECAAAECBLqXgMC2e9W3uyVAgAABAgQIECBAgECXExDYdrkqdUMECBAgQIAAAQIECBDoXgIC2+5V3+6WAAECBAgQIECAAAECXU5AYNvlqtQNESBAgAABAgQIECBAoHsJCGy7V327WwIECBAgQIAAAQIECHQ5gZ5d7o7cEAECBAgQIECAAAECBLqAwCeffJJuuumm9MQTT6SpU6emQYMGpREjRqS+fft2gbvr2FsQ2Hasp7MRIECAAAECBAgQIEBgpgWuvPLKdPjhh6e33nqr6lzzzTdfOuaYY9JRRx2VevToUbWvO6/0mP516s4A7p0AAQIECBAgQIAAAQKNJHDOOeekgw46qMUiHXrooemss85qMU932imw7U617V4JECBAgAABAgQIEGhogXHjxqXBgwenL774otVyjho1Km2//fat5usOGXRFboBa/vjjj9Pnn3/eACVRBAIECBDoKIH333+/ONXCCy9cLFsgQIAAgfILzDPPPCm6BHdGilbYtgS1ce1TTz1VYPuPStBi2xl/jXWe88ADD0znnntunUfJToAAAQIECBAgQIDA7BD43ve+12nf39dee+302GOPtem25pprrvTZZ5+lOeYw2Q2BNv3JyESAAAECBAgQIECAAIH/Exg7dmynUbz33nttPveXX36ZpkyZ0ub8XTmjrsgNVrtzzz13il9eJAIECBAot0A8ZpKnzuqulp/fOwECBAh0vkAEkXkX4TfeeKPTLjhgwIA0YcKENp2/d+/eqU+fPm3K29UzCWwbrIZ33333tMkmmzRYqRSHAAECBOoVOPjgg4tDfve73xXLFggQIECgnAL33HNPuvjiizu98Ntuu2168MEH23SdYcOGmfLnH1K6IrfpT0YmAgQIECBAgAABAgQIdL7AD3/4w7Tgggu2eqF4rvZnP/tZq/m6SwaBbXepafdJgAABAgQIECBAgEDDC/Tr1y9ddtllKUZebin99re/Teutt15LWbrVPoFtt6puN0uAAAECBAgQIECAQKMLDB8+PN11111pyJAhMxR12WWXTVdffXX613/91xn2decNAtvuXPvunQABAgQIECBAgACBhhRYf/310+jRo9PRRx9dlG/XXXdNL730UvrWt75VbLPwfwICW38JBAgQIECAAAECBAgQaFCBJZZYoihZjJhsztqCo2pBYFvFYYUAAQIECBAgQIAAAQIEyiYgsC1bjSkvAQIECBAgQIAAAQIECFQJCGyrOKwQIECAAAECBAgQIECAQNkEBLZlqzHlJUCAAAECBAgQIECAAIEqAYFtFYcVAgQIECBAgAABAgQIECibgMC2bDWmvAQIECBAgAABAgQIECBQJSCwreKwQoAAAQIECBAgQIAAAQJlExDYlq3GlJcAAQIECBAgQIAAAQIEqgQEtlUcVggQIECAAAECBAgQIECgbAIC27LVmPISIECAAAECBAgQIECAQJWAwLaKwwoBAgQIECBAgAABAgQIlE1AYFu2GlNeAgQIECBAgAABAgQIEKgSENhWcVghQIAAAQIECBAgQIAAgbIJCGzLVmPKS4AAAQIECBAgQIAAAQJVAgLbKg4rBAgQIECAAAECBAgQIFA2AYFt2WpMeQkQIECAAAECBAgQIECgSkBgW8VhhQABAgQIECBAgAABAgTKJiCwLVuNKS8BAgQIECBAgAABAgQIVAkIbKs4rBAgQIAAAQIECBAgQIBA2QQEtmWrMeUlQIAAAQIECBAgQIAAgSoBgW0VhxUCBAgQIECAAAECBAgQKJuAwLZsNaa8BAgQIECAAAECBAgQIFAlILCt4rBCgAABAgQIECBAgAABAmUTENiWrcaUlwABAgQIECBAgAABAgSqBAS2VRxWCBAgQIAAAQIECBAgQKBsAgLbstWY8hIgQIAAAQIECBAgQIBAlYDAtorDCgECBAgQIECAAAECBAiUTUBgW7YaU14CBAgQIECAAAECBAgQqBIQ2FZxWCFAgAABAgQIECBAgACBsgkIbMtWY8pLgAABAgQIECBAgAABAlUCAtsqDisECBAgQIAAAQIECBAgUDYBgW3Zakx5CRAgQIAAAQIECBAgQKBKQGBbxWGFAAECBAgQIECAAAECBMomILAtW40pLwECBAgQIECAAAECBAhUCQhsqzisECBAgAABAgQIECBAgEDZBAS2Zasx5SVAgAABAgQIECBAgACBKgGBbRWHFQIECBAgQIAAAQIECBAom4DAtmw1prwECBAgQIAAAQIECBAgUCUgsK3isEKAAAECBAgQIECAAAECZRMQ2JatxpSXAAECBAgQIECAAAECBKoEBLZVHFYIECBAgAABAgQIECBAoGwCAtuy1ZjyEiBAgAABAgQIECBAgECVgMC2isMKAQIECBAgQIAAAQIECJRNQGBbthpTXgIECBAgQIAAAQIECBCoEhDYVnFYIUCAAAECBAgQIECAAIGyCQhsy1ZjykuAAAECBAgQIECAAAECVQIC2yoOKwQIECBAgAABAgQIECBQNgGBbdlqTHkJECBAgAABAgQIECBAoEpAYFvFYYUAAQIECBAgQIAAAQIEyiYgsC1bjSkvAQIECBAgQIAAAQIECFQJCGyrOKwQIECAAAECBAgQIECAQNkEBLZlqzHlJUCAAAECBAgQIECAAIEqAYFtFYcVAgQIECBAgAABAgQIECibgMC2bDWmvAQIECBAgAABAgQIECBQJSCwreKwQoAAAQIECBAgQIAAAQJlE+hZtgIrLwECjScwbdq0NGnSpPTOO++kKVOmpIUXXjgtuuiiaZFFFklzzOH3s8arMSUiQIBA6wIfffRR9rken+1zzTVX6tu3b+rXr1+ad955Wz9YDgIECMxiAYHtLAZ3OQJdSSC+7Fx99dXpySefTF999dUMtxZfhDbaaKO0zTbbZIHuDBla2PDFF1+k119/PcsxYMAAX6RasLKLAAECHSUQn+X33Xdfuv7669PkyZObPe2SSy6Ztt122zRkyJA2/3g5derU7DN94sSJ2Y+f8bnep0+fZs9vIwECBNojILBtj5pjCBBIt912W/rrX/+a4stKrfTll1+mu+66K919991pl112ScOGDauVdYbtDz30ULr44ouz7YcddlhaZZVVZshjAwECBAh0nMAHH3yQzj777PTqq6+2eNLXXnstnXfeeemGG25IP/rRj1oMUO+44470wAMPZEFt0/9fzDfffGnnnXdOm266aYvXs5MAAQJtERDYtkVJHgIEqgSef/759Je//CVNnz49296jR4+00korZa2yc889d3r77bfTm2++mXVPjgzRAnDNNddkXdjWWmutqnPVWokvQhIBAgQIzBqB+Jw+//zzq4La6Hq83HLLZS2s0S05WlujJ030qIn01ltvpZEjR2bBbfTQaZqi1XfUqFFNNxfrH3/8cbr00kvT448/ng455JCsu3Ox0wIBAgTqFBDY1gkmO4HuLhBffi644IIiqF166aXTAQcckKJbWdN07733piuvvDJ9/vnn2a740nTSSSel3r17N81arEewHK0AY8eOLbZZIECAAIHOFbjnnnvSCy+8UFxkt912S5tvvnmac845i22xEK26F154YXruueey7ePHj8+C1+iVU5maBrULLbRQ+uY3v5kGDhyYnWP06NEpAttIzz77bPrb3/6WRowYUXkKywQIEKhLQGBbF5fMBAjEr/X5c1fROnvwwQdng0Q1J7PxxhtnAe8pp5yS7Y6uydHFbdCgQVXZX3755Wz7G2+8kZ544on0/vvvV+23QoAAAQKdK/DMM88UF4iAdquttirWKxciQD388MPTmWeemQWksa/pD5GffvppFqjmx62wwgrZMfH/jDztuOOO6Q9/+ENx7M0335zi/xkx+KBEgACB9ggYrrQ9ao4h0I0FXnrppeLuo4tajHzcUvrGN76R4pWn5p7diq5o8brzzjsFtTmUdwIECMxCgcrgdJ111mnxyvH4SeWYCfHMbf5oShz42GOPFeMvLLjggunQQw9NlUFt5Jl//vnT/vvvX7QIx/O3lf9/iTwSAQIE6hHQYluPlrwECKRPPvmkUPjss8+K5ZYW4rnavDty025tcVx8SZIIECBAYPYIRFAarax5qlzOtzV9X3755dNSSy2VBbQ9e/bMPuN79eqVZYsxFvIUn/+1pgeKaeGia3L+g2cEyK0F1fl5vRMgQKCpgMC2qYh1AgRaFFhiiSWK/a+88kq6//7704Ybblhsa25h6623TvGqlWLQkKZB8n/9138VXZ5rHWc7AQIECMy8QPy4GJ/teYAZ4xxE4BqjFtdK0QL785//vNndlY+TRODaUqocdCrmRJcIECDQXgGBbXvlHEegmwpE9+M8xa/8MYhIjGC87rrrFiMj5/vb+t7cM1XRAiARIECAwKwRiM/2PLCdMGFCOv7449N6662XVl999SzIrQxAWyvRGmuskQXKkW/FFVesmT0Gj4pW2jzF/LgSAQIE2ivgm2N75RxHoJsK9OnTJ+26667ZHLY5wZgxY1K8IsX0EDFQSP5sbfxar6txLuWdAAECjSmwww47pBhA6t13380KOGXKlGy+8pizPH5ojBbc+FyP99Zac+OHztZS/DAaYyvkUwfF/yfivBIBAgTaKyCwba+c4wh0Y4Ftt902GxjkpptuKgYIyTniS1G8HnzwwWxTDByy2WabpU033TQbLCTP550AAQIEGkcgPquPOOKIdM4551S1okYJY2CnmAoonw4ogtBVV101Gzk55jCvN8VYDRdddFE2yFR+7DbbbJPNdZ6veydAgEC9AgLbesXkJ0AgE4hf94cOHZoefvjh7Ff+F198McV0Pk1TTA103XXXpRtvvDHtueeeaZNNNmmaxToBAgQINIDAYostlo4++uhsjtqYei1acN95550ZShatrU899VT2irnMjzzyyBbnJ688QcxfG/Obf/jhh8XmZZddNsX0PxIBAgRmRkBgOzN6jiXQzQWiW3LMdRivCGpjMKmYriFezz//fDEScjDFL/7R7axfv34zzGPbzRndPgECBBpKYPDgwSlekd577700bty47HM9HjmJ+cYrU3zun3vuuemwww5Lc8xRexbJeH73iiuuKOatzc8RP3buscceqZ5nePNjvRMgQKBSQGBbqWGZAIF2C8SXkvy52jhJjG4ZX4JuvfXW7Nf/2PbVV19lX2yOPfbYWJUIECBAoMEFYq7yeOXT8MSIxzEafjx7G4M/RXruuedStPDG1D5NU/zoec0112TzlEdLb54GDBiQ9tprLz905iDeCRCYaQGB7UwTOgGB7iMQz0W9/PLL2Q3HYCKDBg2qefMxX+3KK6+cvS6//PLsS01kjvkNY7CQmCpCIkCAAIHZL/D666+nDz74ICvI4osvngWytUoVo9hvv/32WaD7m9/8ppjbfPz48TMEttG6G625lfPaxhRC8ShLjL3Q3Lzmta5rOwECBFoTENi2JmQ/AQKFQHzxOfPMM4v1k08+OUV35NbSdtttVwS28Yt9fImqnDaotePtJ0CAAIHOE7j55puz8RLiCjHQ3957793qxeJ53LXXXjvdc889Wd58qqD8wBhE8LTTTksxunKeNtpoo/Ttb3+7zc/j5sd5J0CAQFsEBLZtUZKHAIFMoH///tm0D/G8bKSnn346xReV1lLTOWnnmWee1g6xnwABAgRmkUBMy5an+Fxva6psce3Vq1dxWDyKcvbZZxdBbbTSfuc738lGUi4yWSBAgEAHC9R+yr+DL+R0BAiUXyC+xEQ3tTw9+uijqfKZqXx70/d49ipPMbhIBMgSAQIECDSGQGVgG4NF5Y+ctFS6+Ox/8skniyyV/2+IEZPzQaZi/IUf/vCHgtpCygIBAp0lILDtLFnnJdBFBfIBROL24pf9P/zhD+mzzz6rebePP/54uvbaa4v9Sy65pOeqCg0LBAgQmP0C3/zmN1PMY5un008/vSpozbfn7x999FG64IILUgwklaeYsidPDz30UL6YYt5zj54UHBYIEOhEAV2ROxHXqQl0RYFtttkmm7tw7Nix2e1Fa+yJJ56Y/Rofv/pHa2w8UzVx4sRsiohnn322imGXXXapWrdCgAABArNXoHfv3mn//fdPEdBGih8rR44cmdZcc8201FJLpfhsj67Gb731VvbZHnPRRnCbpxgRf7XVVstXi5HwY8Pf//739MgjjxT7WlrYfPPNs0GlWspjHwECBGoJCGxrydhOgECzAtGVOJ6VOuOMM7IvOZFp0qRJxeBQzR709cY4LqZ2iJGSJQIECBBoLIGYt3annXZKN9xwQzY1W5QuetzEq6UUrbEHHnhgkSUC3k8//bRY//DDD1O82pIqB5pqS355CBAgUCkgsK3UsEyAQJsE+vbtm2Iu2jvvvDONGjWqmO6huYPjV/4NN9ww+xU+5i2UCBAgQKAxBWIan2il/ctf/pKa9rZpWuIIaGPKnng8pXKAwMmTJzfNap0AAQKzREBgO0uYXYRA1xOIgaS22mqrtPHGG6fXXnstvfPOO+ntt99O8aUmpgBaZJFFUgTA8exWe+as/c///M+uh+aOCBAg0OAC0e348MMPz3rkRNfj+FyPz/dI8bkeryWWWCLrntzcrcS+GHtBIkCAwKwWENjOanHXI9DFBKJFdoUVVsheXezW3A4BAgS6rUCMl2AE+25b/W6cQCkFjIpcympTaAIECBAgQIAAAQIECBDIBQS2uYR3AgQIECBAgAABAgQIECilgMC2lNWm0AQIECBAgAABAgQIECCQCwhscwnvBAgQIECAAAECBAgQIFBKAYFtKatNoQkQIECAAAECBAgQIEAgFxDY5hLeCRAgQIAAAQIECBAgQKCUAgLbUlabQhMgQIAAAQIECBAgQIBALiCwzSW8EyBAgAABAgQIECBAgEApBQS2paw2hSZAgAABAgQIECBAgACBXEBgm0t4J0CAAAECBAgQIECAAIFSCghsS1ltCk2AAAECBAgQIECAAAECuYDANpfwToAAAQIECBAgQIAAAQKlFBDYlrLaFJoAAQIECBAgQIAAAQIEcgGBbS7hnQABAgQIECBAgAABAgRKKSCwLWW1KTQBAgQIECBAgAABAgQI5AIC21zCOwECBAgQIECAAAECBAiUUkBgW8pqU2gCBAgQIECAAAECBAgQyAUEtrmEdwIECBAgQIAAAQIECBAopYDAtpTVptAECBAgQIAAAQIECBAgkAsIbHMJ7wQIECBAgAABAgQIECBQSgGBbSmrTaEJECBAgAABAgQIECBAIBcQ2OYS3gkQIECAAAECBAgQIECglAIC21JWm0ITIECAAAECBAgQIECAQC4gsM0lvBMgQIAAAQIECBAgQIBAKQUEtqWsNoUmQIAAAQIECBAgQIAAgVxAYJtLeCdAgAABAgQIECBAgACBUgoIbEtZbQpNgAABAgQIECBAgAABArmAwDaX8E6AAAECBAgQIECAAAECpRQQ2Jay2hSaAAECBAgQIECAAAECBHIBgW0u4Z0AAQIECBAgQIAAAQIESikgsC1ltSk0AQIECBAgQIAAAQIECOQCAttcwjsBAgQIECBAgAABAgQIlFJAYFvKalNoAgQIECBAgAABAgQIEMgFBLa5hHcCBAgQIECAAAECBAgQKKWAwLaU1abQBAgQIECAAAECBAgQIJALCGxzCe8ECBAgQIAAAQIECBAgUEoBgW0pq02hCRAgQIAAAQIECBAgQCAXENjmEt4JECBAgAABAgQIECBAoJQCAttSVptCEyBAgAABAgQIECBAgEAuILDNJbwTIECAAAECBAgQIECAQCkFBLalrDaFJkCAAAECBAgQIECAAIFcQGCbS3gnQIAAAQIECBAgQIAAgVIKCGxLWW0KTYAAAQIECBAgQIAAAQK5gMA2l/BOgAABAgQIECBAgAABAqUUENiWstoUmgABAgQIECBAgAABAgRyAYFtLuGdAAECBAgQIECAAAECBEopILAtZbUpNAECBAgQIECAAAECBAjkAgLbXMI7AQIECBAgQIAAAQIECJRSQGBbympTaAIECBAgQIAAAQIECBDIBQS2uYR3AgQIECBAgAABAgQIECilgMC2lNWm0AQIECBAgAABAgQIECCQC/TMF7wTIECAAAECBAgQIECAQHkFvvjii/Tkk0+mMWPGpCWXXDKttNJKqX///m2+oc8++yy99NJL6e233069evVKyy67bFp88cXbfPzszKjFdnbquzYBAgQIECBAgAABAgRmUuCss85K6623XurTp09ad9110z777JM233zzNGDAgLToooumP/zhDy1eIQLZI444Ii200EJp1VVXTVtuuWXaaKON0sCBA9PGG2+cbrrpphaPb4SdAttGqAVlIECAAAECBAgQIECAQDsEjjvuuHTYYYelhx9+OH3++ecznOHdd99NhxxySNpuu+1StMg2TRMnTsyC2DPOOKPZ4++77760ww47pJNOOqnpoQ21LrBtqOpQGAIECBAgQIAAAQIECLRNIILaX/7yl0Xm6H689957p1/96lfp0EMPzVpr851/+9vfZghOp0+fnkaMGJF1P87zrbXWWunII49Mu+++e+rbt2+2OfL97Gc/S7fcckuereHePWPbcFWiQAQIECBAgAABAgQIEGhZYPLkyenkk08uMg0dOjTdfPPNqXfv3sW2X/ziF2nXXXdNd999d7btN7/5Tfre976XllhiiWz9L3/5S3rkkUeK/BEQRwCbpylTpqQhQ4akF198MUVw+5Of/CQNGzYs391Q7wLbf1THE088ka644or0/PPPpznnnDOtscYa2a8dyy+/fENVmMIQIECAAAECBAgQIEDgmmuuKboWx7OwN9xwQ1VQG0LR4nrhhRdmg0jFwFLRFfmee+5Je+yxRwZYGRh/+9vfrgpqI8MCCyyQxUjrrLNO+uqrr7KBqZ577rk0ePDg7Pi2/CeOmzZtWpa1Z8+eqUePHlmX50cffTSNHz8+LbzwwmnllVdOSy+9dNXpIpCOQbAef/zxtNxyy6U111wzzTPPPFV5Kle6fVfk6If+3e9+N0WT+69//ev017/+NcUvF8ccc0z2BxDN+4EqESBAgAABAgQIECBAoFEEnn322aIo//RP/5QNHFVsqFiIoHCVVVYptsSoyZHi2dvK1toDDzywyFO5EHFSBJV5uvzyy/PFNr1vv/32ae65585eo0ePzgLtKFMMThXdpocPH56NvhwDXuXPAEcMFoNeRQC91157pQ022CC7v8j/5ZdfNnvdbt1iGwFr/Fpx7bXXNosTaNFn/aOPPkq/+93vms1jIwECBAgQIECAAAECBGa1wGuvvVZcsjJwLTZWLMw777zFWrTcRoruyXkDXrTMbrbZZkWepgtbbLFFihbWSH//+9+b7m5xPb9eZIoBqi6++OIZ8kc5LrnkkmyKoWjhveCCC2bIE+e57LLL0tSpU1ME13PMUd1G260D20svvbRmUFspeeqpp2YBcAyhLREgQIAAAQIECBAgQGB2C+y8885ptdVWy4oRU/vUSu+//36Kxy7zFI9cRqpsrY0W0WhVrZUq46C33nqrVrZWt+dBbbQCf+tb38q6Jce2eBw00nnnnVecI6Yd2mWXXVI853v99dencePGZfuuuuqqdNBBB6WtttqqyBsL3TqwHTlyZBVGSyu///3vs7mhWsrT3n0ffvhhcegLL7yQ9V8vNlggQIAAgdIL1Pvrdulv2A0QIECgCwqMHTu2uKvKVshi4yxe2HPPPVu9YrSEHnzwwenjjz/O8kYr54YbbpgtT5o0qTi+X79+xXJzC9EtOE8x5+3MpJgvN3rDxrhGkaJ80eX4nXfeKU77/e9/P0WsFs/kRor8Ue6Y0ihSjM4ssM0oUhY8PvTQQ/9Ya/3t/vvvbz1TO3NU/oISZaqnXO28pMMIECBAYBYKRA8hiQABAgS6jsB7773X8DfzwQcfZCMgX3311UVZf/zjH6dvfOMb2XrlPSyyyCJFnuYWYoCnPMVx0R04Dzrz7W15j2drYz7cPKiNY2KAqy233DIbpCrWYyCs0047rer8kT9aqPPANubebZqqOyY33duF12PQqKiQtqZ4zlYiQIAAAQIECBAgQIBAowvEbC/RCloZ1EZ34so5byPwzVNrge18882XZ82ey/3kk0+K9XoW9t1332ZHNl5sscWK08S0RZXXy3f0798/X0wx1VHT1G27IscD1AHY1qb0ZZddtqldh6336dOnOFd0A6hcL3ZYIECAAIFSCbz00ktFefNfx4sNFggQIECgdALx+GDeXbal51Fn543F1DjR1bfpIzDRtTcGbqqcLqdyvtsYsKmlVBlIRkttDDbVnlQrppprrrmK07VlutV80KvioK8Xum1gGwg77bRT+tOf/lTpUXM58nZWige48+7H2267bdpkk00661LOS4AAAQKzSCCeGcpTTGgvESBAgEC5BWL+13zwo9ZaOGf1ncY0OT/96U/TWWedVTVeT7Tann322SlGNW6aBgwYUGyqDFyLjRULMTVQnuJ525iLtj1pqaWWavWw9gbN3bYrcoj+x3/8R7PN3E21l1hiifSDH/yg6WbrBAgQIECAAAECBAgQmK0CzzzzTFpnnXWyFtm85TWeWz399NOz0ZCbC2qjwJVdeyuft23uZioD29YGmmru+HxbZYtxvq2j3rt1YBsPL8dcSL169arpGX8UMc/t/PPPXzOPHQQIECBAgAABAgQIEJjVAhMmTMgGXorgNk8HHHBAihGcDz/88FTZxTffn79XtthWTv2T7698j+vkaZlllskXG+q9Wwe2URM77rhjeuCBB1J0Aa5MMfLWXnvtlc3vNGTIkMpdlgkQIECAAAECBAgQIDBbBb788ssslsnHDIouwjfeeGM2F+xCCy3UatmilTdPMY9s5fQ/+fb8vXIQquHDh+ebG+q92we2URvxjOvNN9+cDYed104MQx3TMzTqLxJ5Ob0TIECAAAECBAgQIND9BEaNGpWeeuqp7MZjIKgbbrgh1RN0RmA7aNCgAu7EE08slisXxowZkx599NFi04gRI4rlRloQ2FbURoyUnKfO7P+dX8M7AQIECBAgQIAAAQIE2iNQOUf6UUcdldZff/26T7PPPvsUx5x55pnpwQcfLNZjIaYE2m+//YptcY2ll166WG+khW49KnIjVYSyECBAgAABAgQIECBAoK0Ct956a5H1j3/8Y7ryyiuL9ZYWfvjDH6ZDDjkkyxLP45566qnp/fffz0ZT3m677dJuu+2WjaL85ptvpvPPPz/lz+/GSMiRt1GTwLZRa0a5CBAgQIAAAQIECBAg0IxAjFIcral5iiA0Xm1J+Vy8kXfgwIHZM7kRzE6bNi0757nnnpvi1TQde+yxaaONNmq6uWHWdUVumKpQEAIECBAgQIAAAQIECLQu8MYbb7SeqY05dt1112y8oVpzzMYsMSNHjkzHH398G89Yna1nz/raUluasSY/c3N56rtKfibvBAgQIECAAAECBAgQIDBbBFZbbbU0ffr0Drv21ltvnV5++eV0yy23ZANSTZw4McV8tSussELaYYcdUgxO1d4U52wt/e53v0vxail973vfqxrst2legW1TEesECBAgQIAAAQIECBDoZgIx3WmMqlzPyMqNRKQrciPVhrIQIECAAAECBAgQIECAQN0CAtu6yRxAgAABAgQIECBAgAABAo0kILBtpNpQFgIECBAgQIAAAQIECBCoW0BgWzeZAwgQIECAAAECBAgQIECgkQQEto1UG8pCgAABAgQIECBAgAABAnULCGzrJnMAAQIECBAgQIAAAQIECDSSgMC2kWpDWQgQIECAAAECBAgQIECgbgGBbd1kDiBAgAABAgQIECBAgACBRhIQ2DZSbSgLAQIECBAgQIAAAQIECNQtILCtm8wBBAgQIECAAAECBAgQINBIAgLbRqoNZSFAgAABAgQIECBAgACBugUEtnWTOYAAAQIECBAgQIAAAQIEGklAYNtItaEsBAgQIECAAAECBAgQIFC3gMC2bjIHECBAgAABAgQIECBAgEAjCQhsG6k2lIUAAQIECBAgQIAAAQIE6hYQ2NZN5gACBAgQIECAAAECBAgQaCQBgW0j1YayECBAgAABAgQIECBAgEDdAgLbuskcQIAAAQIECBAgQIAAAQKNJCCwbaTaUBYCBAgQIECAAAECBAgQqFtAYFs3mQMIECBAgAABAgQIECBAoJEEBLaNVBvKQoAAAQIECBAgQIAAAQJ1Cwhs6yZzAAECBAgQIECAAAECBAg0koDAtpFqQ1kIECBAgAABAgQIECBAoG4BgW3dZA4gQIAAAQIECBAgQIAAgUYSENg2Um0oCwECBAgQIECAAAECBAjULSCwrZvMAQQIECBAgAABAgQIECDQSAIC20aqDWUhQIAAAQIECBAgQIAAgboFBLZ1kzmAAAECBAgQIECAAAECBBpJQGDbSLWhLAQIECBAgAABAgQIECBQt4DAtm4yBxAgQIAAAQIECBAgQIBAIwkIbBupNpSFAAECBAgQIECAAAECBOoWENjWTeYAAgQIECBAgAABAgQIEGgkAYFtI9WGshAgQIAAAQIECBAgQIBA3QIC27rJHECAAAECBAgQIECAAAECjSQgsG2k2lAWAgQIECBAgAABAgQIEKhbQGBbN5kDCBAgQIAAAQIECBAgQKCRBAS2jVQbykKAAAECBAgQIECAAAECdQsIbOsmcwABAgQIECBAgAABAgQINJKAwLaRakNZCBAgQIAAAQIECBAgQKBuAYFt3WQOIECAAAECBAgQIECAAIFGEhDYNlJtKAsBAgQIECBAgAABAgQI1C0gsK2bzAEECBAgQIAAAQIECBAg0EgCAttGqg1lIUCAAAECBAgQIECAAIG6BQS2dZM5gAABAgQIECBAgAABAgQaSUBg20i1oSwECBAgQIAAAQIECBAgULeAwLaCbOGFF65Ys0iAAAECBAgQIECAAAECZRAQ2FbU0mqrrVaxZpEAAQIECBAgQIAAAQIEyiAgsC1DLSkjAQIECBAgQIAAAQIECNQUENjWpLGDAAECBAgQIECAAAECBMogILAtQy0pIwECBAgQIECAAAECBAjUFOhZc48dBAgQaKPAtGnT0qRJk9I777yTpkyZkmIgtkUXXTQtssgiaY45/H7WRkbZCBAg0FACH330Ufa5Hp/tc801V+rbt2/q169fmnfeeRuqnApDgACBEGg1sP3000/TU089lWkNGjQoLbjggm2We/PNN9NLL72U4ktvfBB+4xvfSPPMM0+bj5eRAIHGFogvO1dffXV68skn01dffTVDYeOL0EYbbZS22WabLNCdIUMzG+Lz4o033sgC5YUWWig7boEFFmgmp00ECBAg0NEC8Vl+3333peuvvz5Nnjy52dMvueSSadttt01Dhgxp14+X06dPT4888kj2/TA+31deeeVmr2MjAQIE6hFoNbC95JJL0ve///3snDfddFPabrvtWj3/ddddl4455pjsy25l5mjF2XfffdMJJ5yQ+vTpU7nLMgECJRO47bbb0l//+tc0derUmiX/8ssv01133ZXuvvvutMsuu6Rhw4bVzPvQQw9leV955ZUUx1Wm+OwYPnx42njjjdOcc85ZucsyAQIECHSQwAcffJDOPvvs9Oqrr7Z4xtdeey2dd9556YYbbkg/+tGP6v5Od/vtt6errroqu8YKK6wgsG1R204CBNoq0Gofwf/+7/9u67myfKecckraeeedZwhqY+f777+fzjjjjLTeeuu1+qFZ10VlJkBglgo8//zz6S9/+UsR1Pbo0SMNHjw4DR06NG211VYpps6Krsh5ihaAa665Jj322GP5pqr3e+65J51//vlZD4+mQW1kjM+OSy+9NJ122mnZL/xVB1shQIAAgZkWiM/p+ByuDGqj6/E666yT9brZcMMN03LLLZfmnnvu4lpvvfVWGjly5Aw/RhYZmlmI88ePohIBAgQ6WqBmi210Ezn++OOzlpa2XvTaa69NRx11VJE9uhHGl9xlllkma4l59NFHU5x3zJgx6Z//+Z/TnXfe2a4uLMUFLBAgMMsF4svPBRdckP1bjosvvfTS6YADDkgDBgyYoSz33ntvuvLKK9Pnn3+e7YsvTSeddFLq3bt3kTdaai+++OJiPbqlffOb30yLL754iue7Ro8enT7++ONs/9ixY1P0CNl1112L/BYIECBAYOYF4gfGF154oTjRbrvtljbffPMZeslEq+6FF16YnnvuuSzv+PHj06hRo7JeOcXBNRa++OKLrKW3pZ4+NQ61mQABAq0KVAW2Dz74YHr88cfTM888k/7nf/6n6le71s4UAevRRx9dZIsvu/GFtX///sW2P/zhD+mQQw7J1qNrYgTCvqAWPBYIlELg9ddfL567il/uDz744GyQqOYKH12HI+CNnhyRojU2fq2P5/XzFF+I8hSfG4cffniaf/75803Zl6VoEXjxxRezbREs+9woeCwQIECgQwTiu1+eIqCNhonmUjRaxOf0mWeemZ599tksS/zo2JYU3Y8nTpzYlqzyECBAoG6Bqq7IEXTGl9T4sKrsitKWs954443p6aefzrLGKKgx6EBlUBs74tyVX0gvv/zytpy6Kk/8yhdfjmOAmTzFr4XxnMcVV1yRIjiPXwSbpg8//DDdeuutWcAeX8wlAgTaJxADwuUpuqXFyMctpRg0Ll55qvxsiee0oitbpJ49e6YjjjiiKqiN7TH65ne+851YzFK04tYa0CTP450AAQIE6hOoDE6j+3FLKR4/qRwzIT7Lo4GjpRSPokSjhkSAAIHOEqgKbGdmWo5bbrmlKOMGG2yQVl999WK9cqHyC2oEo3kXw8o8tZYfeOCBbLj5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o48+uuoHyBpZs2dw4/vej370o6puzLXy19oec91KBAgQ6AiBVlts8zkr23qx+JIbz11E6+2NN96YXnnllWxajvgyutFGG6U11lijraeaIV8cXzky6gwZvt4Qz/m2lieOywesae4cthEg0LpA/Hi11VZbpQg449/TO++8k95+++00efLkbAqgGOUyAuB4dqu1FtaYCzu+HMXx0c0tn+s2nvmKrscxKEmMtCkRIECAQOcKRLfjww8/POuRE12P43M5Pt8j5aMXx3yzlQNO1VuieNwkxmeQCBAg0JECrQa27b1YjIh80EEHtfdwxxEgUBKBaJGNeatrzV3d1tuIrsoDBgzIXvFcl0SAAAECs08gxkvIR7CffaVwZQIECLRdoEO7Irf9snISIECAAAECBAgQIECAAIGOERDYdoyjsxAgQIAAAQIECBAgQIDAbBIQ2M4meJclQIAAAQIECBAgQIAAgY4RENh2jKOzECBAgAABAgQIECBAgMBsEhDYziZ4lyVAgAABAgQIECBAgACBjhEQ2HaMo7MQIECAAAECBAgQIECAwGwSENhWwOfztFVsskiAAAECBAgQIECAAAECDS4gsK2ooOeee65izSIBAgQIECBAgAABAgQIlEFAYFuGWlJGAgQIECBAgAABAgQIEKgpILCtSWMHAQIECBAgQIAAAQIECJRBQGBbhlpSRgIECBAgQIAAAQIECBCoKSCwrUljBwECBAgQIECAAAECBAiUQUBgW4ZaUkYCBAgQIECAAAECBAgQqCkgsK1JYwcBAgQIECBAgAABAgQIlEFAYFuGWlJGAgQIECBAgAABAgQIEKgpILCtSWMHAQIECBAgQIAAAQIECJRBQGBbhlpSRgIECBAgQIAAAQIECBCoKSCwrUljBwECBAgQIECAAAECBAiUQUBgW4ZaUkYCBAgQIECAAAECBAgQqCkgsK1JYwcBAgQIECBAgAABAgQIlEFAYFuGWlJGAgQIECBAgAABAgQIEKgpILCtSWMHAQIECBAgQIAAAQIECJRBQGBbhlpSRgIECBAgQIAAAQIECBCoKSCwrUljBwECBAgQIECAAAECBAiUQUBgW4ZaUkYCBAgQIECAAAECBAgQqCkgsK1JYwcBAgQIECBAgAABAgQIlEFAYFuGWlJGAgQIECBAgAABAgQIEKgpILCtSWMHAQIECBAgQIAAAQIECJRBQGBbhlpSRgIECBAgQIAAAQIECBCoKSCwrUljBwECBAgQIECAAAECBAiUQUBgW4ZaUkYCBAgQIECAAAECBAgQqCkgsK1JYwcBAgQIECBAgAABAgQIlEFAYFuGWlJGAgQIECBAgAABAgQIEKgpILCtSWMHAQIECBAgQIAAAQIECJRBQGBbhlpSRgIECBAgQIAAAQIECBCoKSCwrUljBwECBAgQIECAAAECBAiUQUBgW4ZaUkYCBAgQIECAAAECBAgQqCkgsK1JYwcBAgQIECBAgAABAgQIlEFAYFuGWlJGAgQIECBAgAABAgQIEKgpILCtSWMHAQIECBAgQIAAAQIECJRBQGBbhlpSRgIECBAgQIAAAQIECBCoKSCwrUljBwECBAgQIECAAAECBAiUQUBgW4ZaUkYCBAgQIECAAAECBAgQqCkgsK1JYwcBAgQIECBAgAABAgQIlEFAYFuGWlJGAgQIECBAgAABAgQIEKgpILCtSWMHAQIECBAgQIAAAQIECJRBQGBbhlpSRgIECBAgQIAAAQIECBCoKSCwrUljBwECBAgQIECAAAECBAiUQUBgW4ZaUkYCBAgQIECAAAECBAgQqCkgsK1JYwcBAgQIECBAgAABAgQIlEFAYFuGWlJGAgQIECBAgAABAgQIEKgpILCtSWMHAQIECBAgQIAAAQIECJRBQGBbhlpSRgIECBAgQIAAAQIECBCoKSCwrUljBwECBAgQIECAAAECBAiUQUBgW4ZaUkYCBAgQIECAAAECBAgQqCkgsK1JYwcBAgQIECBAgAABAgQIlEFAYPt1LU2fPj1dccUVadSoUUWd/fnPf0633nprsW6BAAECBAgQIECAAAECs1LgtttuSxdccEFxyZtuuilddtll6auvviq2Wfg/gW4f2L799ttp0003TXvuuWcaN25c8XfxyCOPpGHDhqXdd989ffLJJ8V2CwQIECBAgAABAgQIEOhMgc8++yztvffeaeutt04PPfRQcanx48dn2zfZZJP01ltvFdstpNStA9vPP/88jRgxIt1zzz01/xauuuqq9C//8i8199tBgAABAgQIECBAgACBjhTYf//9s5bZWue8//770/Dhw1MEwNL/CXTrwPb3v/99evjhh1v9W7j66qvTjTfe2Go+GQgQIECAAAECBAgQIDAzArfcckv2mGRr53jsscfSWWed1Vq2brO/Z7e502ZutLK/ejO7qzadf/75afvtt6/a1hkrY8eO7YzTOicBAgQIzEaBlnoGzcZiuTQBAgQI1CEwq76n1xOjRN4f//jHddxF183abQPbqVOnpqeffrrNNfv444+3Oe/MZHzggQdSvCQCBAgQ6DoCF198cde5GXdCgAABAp0qEC2xbU3PPvtsiscr55lnnrYe0mXzdduuyNOmTatrNLEvv/yyy/4RuDECBAgQIECAAAECBBpDoN64IxrspJS6bYtt/KqxzDLLpAkTJrTp72DFFVdsU772ZBo6dGj24HfliGftOY9jCBAgQKBxBCZOnFgUZsCAAcWyBQIECBAov0B8f++sNGjQoKrZWlq6zsCBA9N8883XUpZus6/bBrZRwzGVzymnnNKmyo68nZX23XffFC+JAAECBAgQIECAAIHuLRBxR8xX25a0xx57tCVbt8jTY/rXqVvcaTM3OWnSpLT66qunN998s5m9/3/TGmuskY2ePNdcc/3/jZYIECBAgAABAgQIECDQwQLRtXj99ddPjz76aItn7t+/f3ryySfTYost1mK+7rKz2z5jGxW86KKLphtuuCG11EVs8ODB6brrrkuC2u7yT8J9EiBAgAABAgQIEJh9Aj179kzXXnttWmWVVWoWIoLZ66+/XlBbIdStA9twWHvttdMTTzyRjjzyyKoAd/nll0+/+MUvUjz3uvTSS1eQWSRAgAABAgQIECBAgEDnCSy55JLpwQcfTCeccEL6xje+UVwoWmkPP/zwrKV23XXXLbZbSKlbd0Vu7g9g8uTJac4550zzzz9/c7ttI0CAAAECBAgQIECAwCwV+Pjjj1OMlrzQQgvN0uuW6WIC2zLVlrISIECAAAECBAgQIECAwAwC3b4r8gwiNhAgQIAAAQIECBAgQIBAqQQEtqWqLoUlQIAAAQIECBAgQIAAgaYCAtumItYJECBAgAABAgQIECBAoFQCAttSVZfCEiBAgAABAgQIECBAgEBTAYFtUxHrBAgQIECAAAECBAgQIFAqAYFtqapLYQkQIECAAAECBAgQIECgqYDAtqmIdQIECBAgQIAAAQIECBAolYDAtlTVpbAECBAgQIAAAQIECBAg0FRAYNtUxDoBAgQIECBAgAABAgQIlEpAYFuq6lJYAgQIECBAgAABAgQIEGgqILBtKmKdAAECBAgQIECAAAECBEolILAtVXUpLAECBAgQIECAAAECBAg0FRDYNhWxToAAAQIECBAgQIAAAQKlEhDYlqq6FJYAAQIECBAgQIAAAQIEmgoIbJuKWCdAgAABAgQIECBAgACBUgkIbEtVXQpLgAABAgQIECBAgAABAk0FBLZNRWbR+gsvvJAOO+ywtPrqq6ellloqrb/++um4445LkyZNmkUlcBkCBAgQ6AyBV199NR111FFp7bXXzj7f4/0nP/lJiu0SAQIECBAg0DkCPaZ/nTrn1M5aS+D0009PP/7xj9PUqVNnyLLQQgulyy+/PG277bYz7LOBAAECBBpb4LLLLkvf/e5306effjpDQeedd970pz/9Ke29994z7LOBAAECBAgQmDkBge3M+dV99IUXXpj233//Fo/r1atXuueee9KQIUNazGcnAQIECDSOwN/+9re0/fbbp6+++qpmoeaYY440atSotN1229XMYwcBAgQIECBQv4DAtn6zdh/x4YcfpuWWWy699957rZ5jgw02SPfff3+r+WQgQIAAgdkvED1wVlpppfTSSy+1Wpjll18+jRkzJvXs2bPVvDIQIECAAAECbRPwf9W2OXVIruuvv75NQW1c7IEHHkjHHnts6t+/f4dc20kIECBAoPMEYtyEtgS1UYJx48alu+++O22xxRadVyBnJkCAAAEC3UxAYDsLK/yJJ56o62onnHBCXfllJkCAAIFyCMT/DwS25agrpSRAgACBcggYFXkW1lNzg0XNwsu7FAECBAg0iID/HzRIRSgGAQIECHQZAS22s7Aq4/mretIee+yR+vXrV88h8hIgQIDAbBAYP358uuGGG9p85Xr/f9DmE8tIgAABAgS6qYDBo2Zhxb/11lvZ4FHNTQPRtBiDBg1Kzz//fNPN1gkQIECgAQXic32ZZZZJ77zzTqulix8sJ0yYkGL6H4kAAQIECBDoGAFdkTvGsU1niYGgfvazn7Wat0ePHunUU09tNZ8MBAgQINAYAhGk/uY3v2lTYX79618LatskJRMBAgQIEGi7wJzHf53anl3OmRXYdNNNU7Tcjh49utlTxfQPZ599dtprr72a3W8jAQIECDSmwFprrZXih8k777yzZgGPO+649G//9m8199tBgAABAgQItE9AV+T2uc30UaNGjUqnnXZaNuXDF198kfr06ZO22267rEV3zTXXnOnzOwEBAgQIzB6BmMrn5JNPTrfffnv65JNPUu/evdOWW26ZjjrqqDR06NDZUyhXJUCAAAECXVxAYDubK3j69Onp448/TvPPP/9sLonLEyBAgEBHC3z00Uc+3zsa1fkIECBAgEAzAgLbZlBsIkCAAAECBAgQIECAAIHyCBg8qjx1paQECBAgQIAAAQIECBAg0IyAwLYZFJsIECBAgAABAgQIECBAoDwCAtvy1JWSEiBAgAABAgQIECBAgEAzAgLbZlBsIkCAAAECBAgQIECAAIHyCAhsy1NXSkqAAAECBAgQIECAAAECzQgIbJtBsYkAAQIECBAgQIAAAQIEyiMgsC1PXSkpAQIECBAgQIAAAQIECDQjILBtBsUmAgQIECBAgAABAgQIECiPQM/yFFVJCRDobIE333wzjR49On355Zdp0KBB6Zvf/Gaae+65O/uyzk+AAAECBAgQIEBgpgQEtjPF52AC5Rd49dVX05FHHpkefPDB9Prrr1fd0Jxzzpm22mqrdM4556Rlllmmal++stxyy6VJkyblqy2+jxw5Mu27774t5rGTAAECBAgQIECAQL0CAtt6xeQn0IUEXn755bTlllum8ePHN3tX06ZNS7fccktaffXV00UXXZR22mmnqnwffvhhzWOrMv5jJVqCJQIECBAgQIAAAQIdLSCw7WhR5yNQEoFoqd10003Ta6+9lpW4Z8+eacMNN8xe8847b7rvvvvSrbfemu2LAPaAAw5IY8aMSX379i3ucOzYscXyPPPMk+LVUtKtuSUd+wgQIECAAAECBNorILBtr5zjCJRc4Pe//30R1EaX4yuvvDLtuuuuVXd1xRVXpL322itNnz49vfvuu+n4449PZ555ZpHnxRdfLJajm3EEvxIBAgQIECBAgACBWS0gsJ3V4q5HoEEELrnkkqIkJ5100gxBbezcY4890m233ZbOPffcLO///u//FsfEQmWLbQw21Rlp6tSpWWA9xxxzpAjAI43/uuv0008/nT7++OO07LLLprXWWmuGQa6ilTmeG4486667blpiiSU6o3jOSYAAAQIECBAg0AACpvtpgEpQBAKzWiCCvVdeeSW7bI8ePdJ+++1XswgjRowo9kUL7aefflqsd3Zg+8ADD6S55porC1rj+d6333477bLLLmn55ZdPO+64Y9pzzz3TBhtskI3efPPNN2fliu7SEcguvPDCadiwYVnAvuSSS6Z43XHHHUXZLRAgQIAAAQIECHQdAYFt16lLd0KgzQL5c7VxQP/+/dOiiy5a89h43jZPX331VYoBpfKUB7bx3G1L58jz1/v+xRdfFIdMnDgxbbHFFunaa6/NWnCLHV8vRJC+++67p4svvjhtsskm2ZRFUdbKFCM+RzB8//33V262TIAAAQIECBAg0AUEdEXuApXoFgjUKzD//POn//zP/8wO69evX4uHV7ZyRktpHJunPLBdccUVs4Azui0/+eSTKUZbji7Cq622WtZq2nQ05fz4et4fffTRLHsMUBUtzIMHD866I59//vlZoDtlypRiKqFo5d17772zltwYBCvK9fnnn2fdko866qh0991313NpeQkQIECAAAECBBpcoMfXg8JMb/AyKh4BArNJ4LHHHsu6+uYtpxFQ/vnPf85K89FHH6UFFligTSXbYYcd0tlnn11zLtxaJ/n73/+eNttss2L3Yostlm6//fa0yiqrFNtOOOGEdOyxxxbrffr0yQLXmKIoT9ddd13aeeeds9V4Vjeev51vvvny3d4JECBAgAABAgRKLqArcskrUPEJdJbA9ddfn81xmwe18czqr371q+JyeWttseEfC717904LLrhg1eZRo0aloUOHpg8++KBqe70rEcRWBrVx/G677VZ1mhi5uTKojZ3xnHA+FVF0UY5ndSUCBAgQIECAAIGuIyCw7Tp16U4IdIhAPMsa3Xij+3AeiMYct3/84x/TwIEDi2s0DWxjIKfRo0enyZMnZ8fFIE55K2kcFPPmHnTQQcXx9S7EiMjNTScUrbiVafjw4ZWr2XK00lY+AxxllAgQIECAAAECBLqOgMC269SlOyEwUwLxDGpM+xPPy1522WXFuWKanOj+27RlNFpAt95662wE4p///Ofp0ksvTUOGDEkRBEeK8/zP//xP1YjLMVfuCy+8UJy7noUoR37uyuPiedo8xQjPyy23XL5a890TGDVp7CBAgAABAgQIlFLA4FGlrDaFJtCxAvfee2/af//9q+aljSDysMMOS7/4xS+afZY2RhiOV2vpjDPOSFdffXWKZ3IjxXO7EfTWm5ZaaqlWD4kgN+9y3GpmGQgQIECAAAECBLqMgBbbLlOVboRA/QLRcnncccdlAzRVdi3efvvt0xNPPJFOPfXUZoPaeq4UgznF6Mh5ivO2JwlY26PmGAIECBAgQIBA9xDQYts96tldEmhW4N///d/TySefXOxbcskl0znnnJOae061yNSOhUUWWaQ4qnJe3GKjBQIECBAgQIAAAQIzISCwnQk8hxIos8AVV1xRFdTGgFEjR46cYUTj5u7xzTffTIcccki2a+65586er23u+df82BhIKk8rr7xyvuidAAECBAgQIECAQIcICGw7hNFJCJRP4Ne//nVR6BgY6qKLLkoxenBbUrTA3nLLLenTTz/Nssdoxdttt12zh0a+ym7Oq666arP5bCRAgAABAgQIECDQXoG2fYtt79kdR4BAQwo8++yz2TO0Ubh4Bva8885rc1Abx8TzrhtttFEsZunoo49udm7YmOLniCOOyLOlbbfdNg0aNKhYt0CAAAECBAgQIECgIwS02HaEonMQKJnArbfeWpT4k08+SRtssEGx3tJCTKfz9NNPZ1l+8IMfZNMAxQBUjzzySFpvvfVSbFt77bVT5IvRj2P6oEmTJmX5Yx7a3/72ty2d3j4CBAgQIECAAAEC7RIQ2LaLzUEEyi1Q2TV46tSpKVpw25IiYM3Tt771rWxE5eOPPz7bNGHChPTTn/4031313qtXr3T66acn3ZCrWKwQIECAAAECBAh0kICuyB0E6TQEyiTwxhtvdEhxjz322HTZZZellVZaqeb5Vl999TR69Oh04IEH1sxTa0dLA1I1d0wE0G1Jbc3XlnPJQ4AAAQIECBAgMPsFenzdjXD67C+GEhAgUGaBadOmpYcffjjF6Mfjxo1L/fr1SzH68eDBg9Piiy9e5ltTdgIECBAgQIAAgRIICGxLUEmKSIAAAQIECBAgQIAAAQK1BXRFrm1jDwECBAgQIECAAAECBAiUQEBgW4JKUkQCBAgQIECAAAECBAgQqC0gsK1tYw8BAgQIECBAgAABAgQIlEBAYFuCSlJEAgQIECBAgAABAgQIEKgtILCtbWMPAQIECBAgQIAAAQIECJRAQGBbgkpSRAIECBAgQIAAAQIECBCoLSCwrW1jDwECBAgQIECAAAECBAiUQEBgW4JKUkQCBAgQIECAAAECBAgQqC0gsK1tYw8BAgQIECBAgAABAgQIlEBAYFuCSlJEAgQIECBAgAABAgQIEKgt8P8Asc8jeTUE2pUAAAAASUVORK5CYII=" alt="Schematic diagram of a plot with subplots, each occupying 25% of the total plot space." width="400px" />
<p class="caption">
Schematic diagram of a plot with subplots, each occupying 25% of the total plot space.
</p>
</div>
</div>
<div id="biomass" class="section level2">
<h2>Biomass</h2>
<p>Biomass, specifically aboveground woody biomass, is calculated in the SEOSAW dataset by default using an allometric equation devised by Chave et al. (2014), but there are a number of other allometric equations available in the SEOSAW package which the user can use at their discretion. There is also the option for the user to use their own allometric equation on the SEOSAW dataset.</p>
<p>The SEOSAW dataset also contains a column at the plot level which allows data originators to suggest their own local allometry, though these allometries aren’t available as functions in the SEOSAW package as they are numerous and varied. Table 3 contains information on the available biomass allometries and their original publication.</p>
<table>
<colgroup>
<col width="28%" />
<col width="21%" />
<col width="17%" />
<col width="32%" />
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
<div class="sourceCode" id="cb3"><pre class="sourceCode r"><code class="sourceCode r"><span id="cb3-1"><a href="#cb3-1" aria-hidden="true"></a>agb_mugasha14 &lt;-<span class="st"> </span><span class="kw">agbGen</span>(mstems, <span class="dt">diam =</span> <span class="st">&quot;diam&quot;</span>, <span class="dt">allometry =</span> <span class="st">&quot;mugasha14&quot;</span>)</span>
<span id="cb3-2"><a href="#cb3-2" aria-hidden="true"></a></span>
<span id="cb3-3"><a href="#cb3-3" aria-hidden="true"></a><span class="kw">head</span>(agb_mugasha14)</span></code></pre></div>
<pre><code>## [1] 0.06055915 0.27459733 0.13316657 0.16240458 0.14444704 0.26898097</code></pre>
<div class="sourceCode" id="cb5"><pre class="sourceCode r"><code class="sourceCode r"><span id="cb5-1"><a href="#cb5-1" aria-hidden="true"></a>mstems<span class="op">$</span>agb &lt;-<span class="st">  </span><span class="kw">agbGen</span>(mstems, mplots, <span class="dt">allometry =</span> <span class="st">&quot;chave14&quot;</span>)</span>
<span id="cb5-2"><a href="#cb5-2" aria-hidden="true"></a></span>
<span id="cb5-3"><a href="#cb5-3" aria-hidden="true"></a><span class="kw">head</span>(mstems<span class="op">$</span>agb)</span></code></pre></div>
<pre><code>## [1] 0.05487611 0.25373184 0.12951177 0.14169675 0.12576906 0.20001031</code></pre>
<p>You can generate the wood density data used by <code>chave14()</code> and <code>chave05()</code> separately using <code>woodDensityQuery()</code>, which is a wrapper around <code>BIOMASS::getWoodDensity()</code>:</p>
<div class="sourceCode" id="cb7"><pre class="sourceCode r"><code class="sourceCode r"><span id="cb7-1"><a href="#cb7-1" aria-hidden="true"></a><span class="kw">head</span>(<span class="kw">woodDensityQuery</span>(mstems, <span class="dt">species_name =</span> <span class="st">&quot;species_orig_binom&quot;</span>,</span>
<span id="cb7-2"><a href="#cb7-2" aria-hidden="true"></a>  <span class="dt">plot_id =</span> <span class="st">&quot;plot_id&quot;</span>, <span class="dt">region =</span> <span class="st">&quot;AfricaTrop&quot;</span>))</span></code></pre></div>
<pre><code>## [1] 0.7175000 0.7089666 0.7580000 0.6710000 0.6710000 0.5600000</code></pre>
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
<div class="sourceCode" id="cb9"><pre class="sourceCode r"><code class="sourceCode r"><span id="cb9-1"><a href="#cb9-1" aria-hidden="true"></a>species_unk &lt;-<span class="st"> </span><span class="kw">speciesGen</span>(mstems, <span class="dt">lookup_list =</span> <span class="kw">list</span>(<span class="kw">get</span>(<span class="kw">data</span>(acacia)), <span class="kw">get</span>(<span class="kw">data</span>(rhus))), </span>
<span id="cb9-2"><a href="#cb9-2" aria-hidden="true"></a>  <span class="dt">species_name =</span> <span class="st">&quot;species_orig_binom&quot;</span>, </span>
<span id="cb9-3"><a href="#cb9-3" aria-hidden="true"></a>  <span class="dt">return_unknown =</span> <span class="ot">FALSE</span>, <span class="dt">return_unknown_gnr =</span> <span class="ot">FALSE</span>, <span class="dt">return_unknown_cjb =</span> <span class="ot">TRUE</span>,</span>
<span id="cb9-4"><a href="#cb9-4" aria-hidden="true"></a>  <span class="dt">sanitize =</span> <span class="ot">TRUE</span>)</span></code></pre></div>
<pre><code>## Warning: species(x_final_syn$confer_clean):400/400 NAs</code></pre>
<pre><code>## Warning: subspecies(x_final_syn$subspecies_clean):400/400 NAs</code></pre>
<pre><code>## Warning: variety(x_final_syn$variety_clean):400/400 NAs</code></pre>
<pre><code>## Warning: Some species not matched by gnr_resolve:
##    Indet indet</code></pre>
<pre><code>## Warning: Some species not matched by CJB:
##    Combretum_indet
##    Cryptosepalum_indet
##    Indet_indet
##    Markhamia_indet
##    Millettia_indet
##    Ochna_indet
##    Psidium_indet
##    Terminalia_indet</code></pre>
<div class="sourceCode" id="cb15"><pre class="sourceCode r"><code class="sourceCode r"><span id="cb15-1"><a href="#cb15-1" aria-hidden="true"></a><span class="co">#lookup_table &lt;- data.frame(</span></span>
<span id="cb15-2"><a href="#cb15-2" aria-hidden="true"></a><span class="co">#  original = species_unk,</span></span>
<span id="cb15-3"><a href="#cb15-3" aria-hidden="true"></a><span class="co">#  corrected = c(&quot;Marquesia macroura&quot;, &quot;Pseudolachnostylis maprouneifolia&quot;))</span></span>
<span id="cb15-4"><a href="#cb15-4" aria-hidden="true"></a></span>
<span id="cb15-5"><a href="#cb15-5" aria-hidden="true"></a><span class="co"># speciesGen(mstems, lookup_ortho = lookup_table, </span></span>
<span id="cb15-6"><a href="#cb15-6" aria-hidden="true"></a><span class="co">#   return_unknown = FALSE, return_unknown_gnr = FALSE, return_unknown_cjb = TRUE)</span></span></code></pre></div>
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
<col width="12%" />
<col width="18%" />
<col width="69%" />
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
<div class="sourceCode" id="cb16"><pre class="sourceCode r"><code class="sourceCode r"><span id="cb16-1"><a href="#cb16-1" aria-hidden="true"></a><span class="kw">diversityGen</span>(mstems) </span></code></pre></div>
<pre><code>##   plot_id richness   rarefy  shannon simpson invsimpson  evenness
## 1   ABC_1       45 19.12330 3.572153  0.9650   28.57143 0.6349206
## 2   ABC_2       39 18.26891 3.437372  0.9604   25.25253 0.6475006
## 3   ABC_3       41 19.28829 3.557419  0.9672   30.48780 0.7436050
## 4   ABC_4       45 19.17816 3.578257  0.9652   28.73563 0.6385696</code></pre>
<div class="sourceCode" id="cb18"><pre class="sourceCode r"><code class="sourceCode r"><span id="cb18-1"><a href="#cb18-1" aria-hidden="true"></a><span class="kw">diversityGen</span>(mstems, <span class="dt">index =</span> <span class="st">&quot;shannon&quot;</span>)</span></code></pre></div>
<pre><code>##   plot_id  shannon
## 1   ABC_1 3.572153
## 2   ABC_2 3.437372
## 3   ABC_3 3.557419
## 4   ABC_4 3.578257</code></pre>
<div class="sourceCode" id="cb20"><pre class="sourceCode r"><code class="sourceCode r"><span id="cb20-1"><a href="#cb20-1" aria-hidden="true"></a><span class="kw">diversityGen</span>(mstems, <span class="dt">index =</span> <span class="st">&quot;simpson&quot;</span>, <span class="dt">abundance =</span> <span class="st">&quot;agb&quot;</span>, <span class="dt">plot_id =</span> <span class="st">&quot;plot_id&quot;</span>)</span></code></pre></div>
<pre><code>##   plot_id   simpson
## 1   ABC_1 0.9579702
## 2   ABC_2 0.9512320
## 3   ABC_3 0.9592143
## 4   ABC_4 0.9529993</code></pre>
<p>Additionally, a dataframe of each plot’s most dominant species, estimated simply by tree abundance, can be returned using <code>domSpeciesGen()</code>:</p>
<div class="sourceCode" id="cb22"><pre class="sourceCode r"><code class="sourceCode r"><span id="cb22-1"><a href="#cb22-1" aria-hidden="true"></a><span class="kw">domSpeciesGen</span>(mstems, <span class="dt">tree_id =</span> <span class="st">&quot;tree_id&quot;</span>, <span class="dt">plot_id =</span> <span class="st">&quot;plot_id&quot;</span>, <span class="dt">n =</span> <span class="dv">2</span>)</span></code></pre></div>
<pre><code>##       plot_id              dom_1                       dom_2 prop_1 prop_2
## ABC_1   ABC_1 Hymenocardia acida                 Indet indet   0.09   0.06
## ABC_2   ABC_2 Hymenocardia acida          Marquesia macroura   0.10   0.06
## ABC_3   ABC_3        Indet indet Diplorhynchus condylocarpon   0.08   0.05
## ABC_4   ABC_4        Indet indet       Colophospermum mopane   0.09   0.06</code></pre>
<p>The values returned are the proportional abundance of the corresponding species, within the plot.</p>
<div id="abundance-matrices" class="section level3">
<h3>Abundance matrices</h3>
<p>The function <code>abMatGen()</code> can be used to create an abundance matrix from a stem measurements table. An abundance matrix is a table where each column is a species, each row is a plot, and each cell contains abundance values for each species in each plot. The most basic use of <code>abMatGen()</code> uses tree abundance as a measure of abundance, but other columns can be used as alternative abundance measures, such as aboveground biomass (<code>agb</code>) or basal area (<code>ba</code>). The function also accounts for variation in sampling effort across nested plots using the <code>fpc</code> columns.</p>
<div class="sourceCode" id="cb24"><pre class="sourceCode r"><code class="sourceCode r"><span id="cb24-1"><a href="#cb24-1" aria-hidden="true"></a><span class="kw">abMatGen</span>(mstems, <span class="dt">plot_id =</span> <span class="st">&quot;plot_id&quot;</span>, <span class="dt">tree_id =</span> <span class="st">&quot;tree_id&quot;</span>, </span>
<span id="cb24-2"><a href="#cb24-2" aria-hidden="true"></a>  <span class="dt">species_name =</span> <span class="st">&quot;species_orig_binom&quot;</span>, <span class="dt">fpc =</span> <span class="st">&quot;fpc&quot;</span>)[,<span class="dv">1</span><span class="op">:</span><span class="dv">4</span>]</span></code></pre></div>
<pre><code>##       Strychnos cocculoides Androstachys johnsonii Marquesia macroura
## ABC_1                     1                      3                  2
## ABC_2                     0                      3                  6
## ABC_3                     1                      3                  3
## ABC_4                     2                      5                  3
##       Diplorhynchus condylocarpon
## ABC_1                           5
## ABC_2                           4
## ABC_3                           5
## ABC_4                           2</code></pre>
</div>
</div>
<div id="spatial-datasets" class="section level2">
<h2>Spatial datasets</h2>
<p>The SEOSAW package contains generic functions for extracting plot level data from arbitrary raster (<code>rasterExtract()</code>) and vector (<code>vecExtract()</code>) spatial objects.</p>
<p><code>rasterExtract()</code> can be used to extract field values from other user supplied raster datasets, with an optional circular buffer around the point of interest. <code>rasterExtract()</code> also allows for extraction from factor rasters using the <code>Mode()</code> function, which returns the modal value from raster cells within the buffer radius.</p>
<p>The SEOSAW region is provided as a spatial data object in the package (<code>data(seosaw_region)</code>), along with a useful outline of all countries in Africa (<code>data(africa)</code>).</p>
<p><code>vecExtract()</code> is a similar function for extracting attributes from spatial vector datasets for points of interest.</p>
<div class="sourceCode" id="cb26"><pre class="sourceCode r"><code class="sourceCode r"><span id="cb26-1"><a href="#cb26-1" aria-hidden="true"></a>africa &lt;-<span class="st"> </span><span class="kw">get</span>(<span class="kw">data</span>(africa))</span>
<span id="cb26-2"><a href="#cb26-2" aria-hidden="true"></a></span>
<span id="cb26-3"><a href="#cb26-3" aria-hidden="true"></a>mplots_africa &lt;-<span class="st"> </span><span class="kw">vecExtract</span>(mplots, africa, <span class="dt">attrib =</span> <span class="st">&quot;iso3&quot;</span>)</span>
<span id="cb26-4"><a href="#cb26-4" aria-hidden="true"></a></span>
<span id="cb26-5"><a href="#cb26-5" aria-hidden="true"></a><span class="kw">head</span>(mplots_africa)</span></code></pre></div>
<pre><code>##   plot_id iso3
## 1   ABC_1  AGO
## 2   ABC_2  AGO
## 3   ABC_3  AGO
## 4   ABC_4  AGO</code></pre>
<div id="transforming-plot-or-stem-coordinates" class="section level3">
<h3>Transforming plot or stem coordinates</h3>
<p>The SEOSAW package also contains various convenience functions for manipulating spatial data. The SEOSAW package primarily uses <code>sf</code> spatial data objects, as this is likely the future of spatial analysis in R, but some functions such as <code>reprojectPoints()</code> will alternatively return a <code>SpatialPoints*</code> object if requested.</p>
<p>A common scenario is that data originators like to store their plot coordinates as cartesian UTM coordinates for analysis in their local region, but SEOSAW requires all coordinates as WGS84 decimal latitude/longitude values (EPSG:4326). As an example, imagine a dataset where plot coordinates straddle both UTM 37S and UTM 38S. We want to convert the plot coordinates to WGS84 latitude/longitude:</p>
<div class="sourceCode" id="cb28"><pre class="sourceCode r"><code class="sourceCode r"><span id="cb28-1"><a href="#cb28-1" aria-hidden="true"></a>mplots<span class="op">$</span>utm_zone &lt;-<span class="st"> </span><span class="kw">latLong2UTM</span>(mplots<span class="op">$</span>longitude_of_centre, mplots<span class="op">$</span>latitude_of_centre)</span>
<span id="cb28-2"><a href="#cb28-2" aria-hidden="true"></a></span>
<span id="cb28-3"><a href="#cb28-3" aria-hidden="true"></a>mplots_list &lt;-<span class="st"> </span><span class="kw">split</span>(mplots, mplots<span class="op">$</span>utm_zone)</span>
<span id="cb28-4"><a href="#cb28-4" aria-hidden="true"></a></span>
<span id="cb28-5"><a href="#cb28-5" aria-hidden="true"></a>utm_crs &lt;-<span class="st"> </span><span class="kw">unlist</span>(<span class="kw">lapply</span>(mplots_list, <span class="cf">function</span>(x) {</span>
<span id="cb28-6"><a href="#cb28-6" aria-hidden="true"></a>  <span class="kw">UTMProj4</span>(<span class="kw">unique</span>(x<span class="op">$</span>utm_zone))</span>
<span id="cb28-7"><a href="#cb28-7" aria-hidden="true"></a>}))</span>
<span id="cb28-8"><a href="#cb28-8" aria-hidden="true"></a></span>
<span id="cb28-9"><a href="#cb28-9" aria-hidden="true"></a>mplots_list_wgs &lt;-<span class="st"> </span><span class="kw">lapply</span>(<span class="dv">1</span><span class="op">:</span><span class="kw">length</span>(mplots_list), <span class="cf">function</span>(x) {</span>
<span id="cb28-10"><a href="#cb28-10" aria-hidden="true"></a>  <span class="kw">reprojectPoints</span>(mplots_list[[x]]<span class="op">$</span>longitude_of_centre, mplots_list[[x]]<span class="op">$</span>latitude_of_centre, </span>
<span id="cb28-11"><a href="#cb28-11" aria-hidden="true"></a>    <span class="dt">from =</span> utm_crs[[x]], <span class="dt">to =</span> <span class="dv">4326</span>)</span>
<span id="cb28-12"><a href="#cb28-12" aria-hidden="true"></a>})</span>
<span id="cb28-13"><a href="#cb28-13" aria-hidden="true"></a></span>
<span id="cb28-14"><a href="#cb28-14" aria-hidden="true"></a>mplots_wgs &lt;-<span class="st"> </span><span class="kw">do.call</span>(rbind, mplots_list_wgs)</span></code></pre></div>
</div>
<div id="plot-polygons" class="section level3">
<h3>Plot polygons</h3>
<p>Plot outline polygons for each plot with such data in the canonical SEOSAW dataset are provided in <code>data_out/polys.shp</code>. For rectangular plots, these polygons are normally created from GPS coordinates taken at each corner and used as vertices when transforming to a closed spatial polygon. Plot polygons can be automatically generated using the <code>polyGen()</code> function, which uses the plot centre coordinates, plot shape, and plot dimensions to create an approximate polygon:</p>
<div class="sourceCode" id="cb29"><pre class="sourceCode r"><code class="sourceCode r"><span id="cb29-1"><a href="#cb29-1" aria-hidden="true"></a>circle_plots &lt;-<span class="st"> </span>mplots <span class="op">%&gt;%</span></span>
<span id="cb29-2"><a href="#cb29-2" aria-hidden="true"></a><span class="st">  </span><span class="kw">mutate</span>(<span class="dt">plot_shape =</span> <span class="st">&quot;circle&quot;</span>, </span>
<span id="cb29-3"><a href="#cb29-3" aria-hidden="true"></a>    <span class="dt">plot_diameter =</span> <span class="dv">40</span>)</span>
<span id="cb29-4"><a href="#cb29-4" aria-hidden="true"></a></span>
<span id="cb29-5"><a href="#cb29-5" aria-hidden="true"></a>circle_plots_polys &lt;-<span class="st"> </span><span class="kw">polyGen</span>(circle_plots)</span>
<span id="cb29-6"><a href="#cb29-6" aria-hidden="true"></a></span>
<span id="cb29-7"><a href="#cb29-7" aria-hidden="true"></a><span class="kw">plot</span>(circle_plots_polys, <span class="dt">key.pos=</span><span class="ot">NULL</span>)</span></code></pre></div>
<p><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAASAAAAEgCAYAAAAUg66AAAAEGWlDQ1BrQ0dDb2xvclNwYWNlR2VuZXJpY1JHQgAAOI2NVV1oHFUUPrtzZyMkzlNsNIV0qD8NJQ2TVjShtLp/3d02bpZJNtoi6GT27s6Yyc44M7v9oU9FUHwx6psUxL+3gCAo9Q/bPrQvlQol2tQgKD60+INQ6Ium65k7M5lpurHeZe58853vnnvuuWfvBei5qliWkRQBFpquLRcy4nOHj4g9K5CEh6AXBqFXUR0rXalMAjZPC3e1W99Dwntf2dXd/p+tt0YdFSBxH2Kz5qgLiI8B8KdVy3YBevqRHz/qWh72Yui3MUDEL3q44WPXw3M+fo1pZuQs4tOIBVVTaoiXEI/MxfhGDPsxsNZfoE1q66ro5aJim3XdoLFw72H+n23BaIXzbcOnz5mfPoTvYVz7KzUl5+FRxEuqkp9G/Ajia219thzg25abkRE/BpDc3pqvphHvRFys2weqvp+krbWKIX7nhDbzLOItiM8358pTwdirqpPFnMF2xLc1WvLyOwTAibpbmvHHcvttU57y5+XqNZrLe3lE/Pq8eUj2fXKfOe3pfOjzhJYtB/yll5SDFcSDiH+hRkH25+L+sdxKEAMZahrlSX8ukqMOWy/jXW2m6M9LDBc31B9LFuv6gVKg/0Szi3KAr1kGq1GMjU/aLbnq6/lRxc4XfJ98hTargX++DbMJBSiYMIe9Ck1YAxFkKEAG3xbYaKmDDgYyFK0UGYpfoWYXG+fAPPI6tJnNwb7ClP7IyF+D+bjOtCpkhz6CFrIa/I6sFtNl8auFXGMTP34sNwI/JhkgEtmDz14ySfaRcTIBInmKPE32kxyyE2Tv+thKbEVePDfW/byMM1Kmm0XdObS7oGD/MypMXFPXrCwOtoYjyyn7BV29/MZfsVzpLDdRtuIZnbpXzvlf+ev8MvYr/Gqk4H/kV/G3csdazLuyTMPsbFhzd1UabQbjFvDRmcWJxR3zcfHkVw9GfpbJmeev9F08WW8uDkaslwX6avlWGU6NRKz0g/SHtCy9J30o/ca9zX3Kfc19zn3BXQKRO8ud477hLnAfc1/G9mrzGlrfexZ5GLdn6ZZrrEohI2wVHhZywjbhUWEy8icMCGNCUdiBlq3r+xafL549HQ5jH+an+1y+LlYBifuxAvRN/lVVVOlwlCkdVm9NOL5BE4wkQ2SMlDZU97hX86EilU/lUmkQUztTE6mx1EEPh7OmdqBtAvv8HdWpbrJS6tJj3n0CWdM6busNzRV3S9KTYhqvNiqWmuroiKgYhshMjmhTh9ptWhsF7970j/SbMrsPE1suR5z7DMC+P/Hs+y7ijrQAlhyAgccjbhjPygfeBTjzhNqy28EdkUh8C+DU9+z2v/oyeH791OncxHOs5y2AtTc7nb/f73TWPkD/qwBnjX8BoJ98VQNcC+8AAAA4ZVhJZk1NACoAAAAIAAGHaQAEAAAAAQAAABoAAAAAAAKgAgAEAAAAAQAAASCgAwAEAAAAAQAAASAAAAAAq0AljQAAFHhJREFUeAHtnXlwVWWaxt+wLwJGRhggBgIOEg22IC4g5RJKWqlx3KtmlOqmTTc4f7iMTangaGlNCYNCi1Y7NWoN6IhV2tIwilIWAhJgpJsGg4pRFoNsNVIoyhZIBDLnO1ZOxyyXm9zknvO+3+9UhZx7z7nne57fkzycLffm1ASTMEEAAhCIgUC7GMZkSAhAAAIhAQqIHwQIQCA2AhRQbOgZGAIQoID4GYAABGIjQAHFhj6+gZ966ikpLi4Ov06dOpWRkB07dsjBgwdbtI3m6qi7PtdOWoQ8cS/qkDhFCGpzAp9//rl88MEH4Tgt/UU+evSozJw5U+bMmSOffvqp9OrVq9m6m6uj/vo5OTnNHpMXJIsABZSsPNSomT17tjz55JMZ6R0xYoQcOHAg3AZlkhFKtS/mEExtdKmFnzx5Unbu3Ckt3cNxr3eHV+57W0333nuvvPXWW+FXu3YNfxRPnDghX331lWR6mNhW+tlu5gQapp75NtlClgls2rRJzjjjjPBr+fLlcvfdd8tZZ50lgwYNCr8/++yzaSt677335Prrr5fc3FwZPHiwdO/eXa699lrZunVrtI1bb731J3s/F154ofTr1y9anu6M01mru27RVVZWyuTJk6VHjx5SUFAgZ555psyYMYMiShespvWC/yGZlBPYuHGju5s9/ApKI/zesWPH6Dm3LPgFjlxOmjQpWhbsZUTPL126tKZTp07Rstptuu9du3atWb16dbjuhAkTGqzTs2fPaDvpzjSl47rrrou2Hxya1QRFFD7u3Llz9HxQWOkOw3oJJsAeUPDbZWlyh03PPPNMeG5l8eLFkpeXF9pzexD79+9v0uru3bvllltukerqajnnnHNk/vz5sm/fPpk1a1a4l3Ls2DEpKSkR9/2ll16Se+65J9rW+++/L2VlZdHjTGZWrlwpbi/MTaNHj5bNmzfL3r175bHHHpOqqqpMNs1rE0iAAkpgKJlIGjlypNx///1hadx0003yyCOPhJs7cuSIfPjhh01u2h26HT9+PFz+wAMPSLB3In369JEHH3wwLCa3YNu2bRLsBUn//v2ld+/e0bbcoZ47XGuNqfbqnNuWK7nzzz8/PBR74oknpLCwsDWGYBsJIkABJSiM1pDizt/UnS666KLo4fbt26P5+jOrVq2KnrrxxhujeTdT97G75N6WU0VFRbT58ePHR/NuxpURky0CFJCtPKVLly5NOmrsSlPtysE5ntpZad++fTTvZrJ5ibzuWO4EeN3p+++/r/uQeQMEKCADIda1sGHDhroPpby8PHp87rnnRvP1Z9z5ltrJXRqvO7399tvRw+HDh0fztTPBOc7a2Yy/19Xozv/UTu7K2Nq1a2sf8t0IAQrISJC1NlxZvPnmm+FDd1jlTj67yV3Srlsy4ZN1/hk7dqzU7iHNnTs33Mbhw4fl+eefl0WLFoVrunK48sorw/ngKlv06j179sjXX38dPc5kpu5hlzsX5fZ63Nf06dM5CZ0J2KS+NsFX6JCWJoG6l+GDQ7DwUnXwpxHRJevgZy+ty/CvvvpqTXD4Fb2u7ry7BF5aWhopev3116P13KXyoLxqgito0fJ0Zpq6DH/bbbdF2+7QoUNNcCgWPh44cGD0PJfh0yGc/HXYA0rq/wwt1PX444+Hl8vd3oubunXrJk8//bRMmzbttFucOHGiLFy4UMaMGSPB/UDhXdDufJDbO/roo4+ivR+3oRtuuCF6HPyYhzcsfvvtt6cdI50VFixYEN6IGJSPuLuh3Z6Z+7szd3WPyRaBHNeRtiz558aVw8UXXxwad4dP9913n7gCcvf2DB06VNwvcnMnd0neXTUbMmSI1D1BXX87u3btCu8dcuvVPYFcf72WPHb3HLn7mlrqoSVj8prsEmj+T2Z29TFaCwm4cz6ZXLZ2V9OKiopOO3p+fv5p12npCq74MvHQ0nF5XfYIUEDZY21+JHen9LvvvpuWzzfeeEOuuuqqtNZlJbsEKCAD2br7ZS699NLQSd++fWNz5O6Odn/Gkc6U6n6ldF7POjYIcA7IRo64gIBKAlwFUxkboiFggwAFZCNHXEBAJQEKSGVsiIaADQIUkI0ccQEBlQQoIJWxIRoCNghQQDZyxAUEVBKggFTGhmgI2CDAjYg2cjTnwn0UT/DX9+EfwboPPQzeqD56f2tzZj02xI2IHoefVOvr16+Xyy67LJR3wd/2lsNVP8iu7w7J7bfcLH/444/vTZRU7ehqHgEKqHm8WLuNCbg3vnd//T5lRIE89/OfRaMdPP6D9Jn7rvzLP0+R2b//j+jN06IVmFFJgAJSGZtd0e4tPW4+r7+8fvOPf9tW32nnf/+f8N0RM/1Y6Prb5XE8BDgJHQ93Rm2EwLp168Jnmyoft/DFCSPEfS49kw0CFJCNHE24+Pjjj2Vw714pvVw98OzwDdBSrsRCNQQoIDVR2RfqrnYdrv4hpVF3LojJDgEKyE6W6p2MGzdO9h+ulAPHqpv0MmPdVrkwjXdqbHIDLEgUAQooUXH4LcZ9FHThsGHS79mljYL4Q/keWfzFXpn73HONLudJfQS4CqYvM9OKg4/bkT5nny0HvvtOFtw4Stw5n++Cw67fb6iQFz6qEHeP0CWXXGKagU/muBPap7QVeHUfA/RN8PE+U6dOlYm/+12k+O+CT91YtmwZ5RMRsTHDHpCNHHEBAZUEOAekMjZEQ8AGAQrIRo64gIBKAhSQytgQDQEbBCggGzniAgIqCVBAKmNDNARsEKCAbOSICwioJEABqYwN0RCwQYACspEjLiCgkgAFpDI2REPABgEKyEaOuICASgIUkMrYEA0BGwQoIBs54gICKglQQCpjQzQEbBCggGzkiAsIqCRAAamMDdEQsEGAArKRIy4goJIABaQyNkRDwAYBCshGjriAgEoCFJDK2BANARsEKCAbOeICAioJUEAqY0M0BGwQoIBs5IgLCKgkQAGpjA3RELBBgAKykSMuIKCSAAWkMjZEQ8AGAQrIRo64gIBKAhSQytgQDQEbBCggGzniAgIqCVBAKmNDNARsEKCAbOSICwioJEABqYwN0RCwQYACspEjLiCgkgAFpDI2REPABgEKyEaOuICASgIUkMrYEA0BGwQoIBs54gICKglQQCpjQzQEbBCggGzkiAsIqCRAAamMDdEQsEGAArKRIy4goJIABaQyNkRDwAYBCshGjriAgEoCFJDK2BANARsEKCAbOeICAioJUEAqY0M0BGwQoIBs5IgLCKgkQAGpjA3RELBBgAKykSMuIKCSAAWkMjZEQ8AGAQrIRo64gIBKAhSQytgQDQEbBCggGzniAgIqCVBAKmNDNARsEKCAbOSICwioJEABqYwN0RCwQYACspEjLiCgkgAFpDI2REPABgEKyEaOuICASgIUkMrYEA0BGwQoIBs54gICKglQQCpjQzQEbBCggGzkiAsIqCRAAamMDdEQsEGAArKRIy4goJIABaQyNkRDwAYBCshGjriAgEoCFJDK2BANARsEKCAbOeICAioJUEAqY0M0BGwQoIBs5IgLCKgkQAGpjA3RELBBgAKykSMuIKCSAAWkMjZEQ8AGAQrIRo64gIBKAhSQytgQDQEbBCggGzniAgIqCVBAKmNDNARsEKCAbOSICwioJEABqYwN0RCwQYACspEjLiCgkgAFpDI2REPABgEKyEaOuICASgIUkMrYEA0BGwQoIBs54gICKglQQCpjQzQEbBCggGzkiAsIqCRAAamMDdEQsEGAArKRIy4goJIABaQyNkRDwAYBCshGjriAgEoCFJDK2BANARsEKCAbOeICAioJUEAqY0M0BGwQoIBs5IgLCKgkQAGpjA3RELBBgAKykSMuIKCSAAWkMjZEQ8AGAQrIRo64gIBKAhSQytgQDQEbBCggGzniAgIqCVBAKmNDNARsEKCAbOSICwioJEABqYwN0RCwQYACspEjLiCgkgAFpDI2REPABgEKyEaOuICASgIUkMrYEA0BGwQoIBs54gICKglQQCpjQzQEbBCggGzkiAsIqCRAAamMDdEQsEGAArKRIy4goJIABaQyNkRDwAYBCshGjriAgEoCFJDK2BANARsEKCAbOeICAioJUEAqY0M0BGwQoIBs5IgLCKgkQAGpjA3RELBBgAKykSMuIKCSAAWkMjZEQ8AGAQrIRo64gIBKAhSQytgQDQEbBCggGzniAgIqCVBAKmNDNARsEKCAbOSICwioJEABqYwN0RCwQYACspEjLiCgkgAFpDI2REPABgEKyEaOuGghgWPHjsmWLVvkyJEjLdwCL8uEAAWUCT1eq5bAhg0bpEfPntKtWzcZNmyY9OjRQ3JycuSdd95R60mj8JyaYNIoHM0QaCmBvXv3Sl5engwad6mMuu+fpH2njlJz6pSUvfBH2fZWqaxZs0bGjh3b0s3zumYQoICaAYtV9RNwh1pubyf/6otl9MO/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" style="display: block; margin: auto;" /></p>
</div>
</div>
<div id="dataset-caveats" class="section level2">
<h2>Dataset caveats</h2>
<p>The SEOSAW dataset is aggregated from many individual datasets contributed by researchers around the world. While effort has been made to ensure that datasets are compatible with each other, particularly with respect to stem-level data like stem diameter (<code>diam</code>) and <code>height</code>, some pieces of metadata should not be compared between datasets. For example, <code>canopy_cover</code> is collected with hemispherical photos, different types of densitometer, aerial photos and many other methods. Due to the subjectivity of all these methods, it is not recommended to use this data as a variable in statistical analysis; it should be used only as metadata. Below is a nonexhaustive list of fields we recommend not to compare between sites in analyses:</p>
<ul>
<li><code>plot_slope</code> - Variable accuracy and recording techniques</li>
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
<p>The following example outlines a generic data cleaning process for a small fictional dataset of two plots, each with 50 stems each (<code>mplots_bad</code>, <code>mstems_bad</code>). Real datasets are likely to be much larger than this, but the cleaning process should be functionally similar. Note that the fake dataset also does fill some columns of metadata which are desirable in data incorporated into SEOSAW dataset. These columns are omitted for brevity of code. For a flow diagram of the recommended cleaning process, which outlines the functions used and their order, <a href="https://seosaw.github.io/files/cleaning_process.png">see the external file here</a>.</p>
<div id="example-workflow-for-data-cleaning" class="section level2">
<h2>Example workflow for data cleaning</h2>
<p>First, clean the plot data. Rename, remove and create columns based on the accepted names found in <code>plotColClass()</code>. This function contains a named list, where the names of each list item are the names of columns in the SEOSAW dataset, and the list item is a column constructor function which provides checks and conservatively fixes common errors. While <code>{dplyr}</code> isn’t necessary for this workflow, it excels at dataframe manipulation and makes some parts of the process much more concise to write and easier to interpret by the reader. The function <code>colGen()</code> can be used to generate empty columns to remind you which data fields should be provided:</p>
<div class="sourceCode" id="cb30"><pre class="sourceCode r"><code class="sourceCode r"><span id="cb30-1"><a href="#cb30-1" aria-hidden="true"></a>plots_clean &lt;-<span class="st"> </span>mplots_bad <span class="op">%&gt;%</span></span>
<span id="cb30-2"><a href="#cb30-2" aria-hidden="true"></a><span class="st">  </span>dplyr<span class="op">::</span><span class="kw">rename</span>(</span>
<span id="cb30-3"><a href="#cb30-3" aria-hidden="true"></a>    <span class="dt">plot_id =</span> plotcode,</span>
<span id="cb30-4"><a href="#cb30-4" aria-hidden="true"></a>    <span class="dt">prinv =</span> pi, </span>
<span id="cb30-5"><a href="#cb30-5" aria-hidden="true"></a>    <span class="dt">first_census =</span> year) <span class="op">%&gt;%</span></span>
<span id="cb30-6"><a href="#cb30-6" aria-hidden="true"></a><span class="st">  </span>dplyr<span class="op">::</span><span class="kw">select</span>(</span>
<span id="cb30-7"><a href="#cb30-7" aria-hidden="true"></a>    <span class="op">-</span>water_table, </span>
<span id="cb30-8"><a href="#cb30-8" aria-hidden="true"></a>    <span class="op">-</span>soil_carbon) <span class="op">%&gt;%</span></span>
<span id="cb30-9"><a href="#cb30-9" aria-hidden="true"></a><span class="st">  </span><span class="kw">colGen</span>(., <span class="dt">colClass =</span> <span class="kw">plotColClass</span>())</span></code></pre></div>
<p>Then, replace some values which are incompatible with the SEOSAW dataset’s column rules:</p>
<div class="sourceCode" id="cb31"><pre class="sourceCode r"><code class="sourceCode r"><span id="cb31-1"><a href="#cb31-1" aria-hidden="true"></a>plots_clean_val &lt;-<span class="st"> </span>plots_clean <span class="op">%&gt;%</span><span class="st"> </span></span>
<span id="cb31-2"><a href="#cb31-2" aria-hidden="true"></a><span class="st">  </span><span class="kw">mutate</span>(</span>
<span id="cb31-3"><a href="#cb31-3" aria-hidden="true"></a>    <span class="dt">plot_shape =</span> <span class="kw">case_when</span>(</span>
<span id="cb31-4"><a href="#cb31-4" aria-hidden="true"></a>      plot_shape <span class="op">==</span><span class="st"> &quot;square&quot;</span> <span class="op">~</span><span class="st"> &quot;rectangle&quot;</span>,</span>
<span id="cb31-5"><a href="#cb31-5" aria-hidden="true"></a>      <span class="ot">TRUE</span> <span class="op">~</span><span class="st"> </span>plot_shape),</span>
<span id="cb31-6"><a href="#cb31-6" aria-hidden="true"></a>    <span class="dt">min_diam_thresh =</span> <span class="kw">case_when</span>(</span>
<span id="cb31-7"><a href="#cb31-7" aria-hidden="true"></a>      min_diam_thresh <span class="op">==</span><span class="st"> &quot;&lt;5cm&quot;</span> <span class="op">~</span><span class="st"> &quot;5&quot;</span>,</span>
<span id="cb31-8"><a href="#cb31-8" aria-hidden="true"></a>      min_diam_thresh <span class="op">==</span><span class="st"> &quot;&lt;10cm&quot;</span> <span class="op">~</span><span class="st"> &quot;10&quot;</span>, </span>
<span id="cb31-9"><a href="#cb31-9" aria-hidden="true"></a>      <span class="ot">TRUE</span> <span class="op">~</span><span class="st"> </span>min_diam_thresh),</span>
<span id="cb31-10"><a href="#cb31-10" aria-hidden="true"></a>    <span class="dt">last_census =</span> first_census,</span>
<span id="cb31-11"><a href="#cb31-11" aria-hidden="true"></a>    <span class="dt">all_dates =</span> first_census</span>
<span id="cb31-12"><a href="#cb31-12" aria-hidden="true"></a>    )</span></code></pre></div>
<p>Use <code>colValCheck()</code> to check whether column names and contents are SEOSAW compatible. This checking function can be used iteratively with the cleaning process above until the function returns no errors:</p>
<div class="sourceCode" id="cb32"><pre class="sourceCode r"><code class="sourceCode r"><span id="cb32-1"><a href="#cb32-1" aria-hidden="true"></a>plots_check &lt;-<span class="st"> </span><span class="kw">colValCheck</span>(plots_clean_val, <span class="dt">colClass =</span> <span class="kw">plotColClass</span>())</span></code></pre></div>
<p>Next, check that plot level columns are consistent with each other using <code>plotTableCheck()</code>. This function runs a number of checking functions to ensure that values are logically consistent between columns. For example, <code>fireCheck()</code> ensures that the columns <code>fire_exclusion</code>, <code>fire_exclusion_success</code>, <code>fire_treatment</code>, <code>fire_treatment_season</code> and <code>fire_return_interval</code> are consistent, e.g. if <code>fire_treatment = TRUE</code>, <code>fire_treatment_season</code> should also contain a non-NA value. As there are always exceptions to perfect data collection practise, these functions return warnings rather than errors, indicating which rows are logically inconsistent. For the default checking functions (<code>nestedCheck()</code>, <code>paCheck()</code>, <code>shapeCheck()</code>, <code>fireCheck()</code>, <code>isoCheck()</code>) if <code>output = TRUE</code> (default) a list of row index vectors are returned, which can then be used to subset the original data to locate potential errors. The user is encouraged to consider the warnings and check whether these columns are legitimately inconsistent, or if there has been an error during data entry.</p>
<div class="sourceCode" id="cb33"><pre class="sourceCode r"><code class="sourceCode r"><span id="cb33-1"><a href="#cb33-1" aria-hidden="true"></a><span class="kw">plotTableCheck</span>(plots_check, <span class="dt">output =</span> <span class="ot">TRUE</span>)</span></code></pre></div>
<pre><code>## Running:nestedCheck</code></pre>
<pre><code>## Running:paCheck</code></pre>
<pre><code>## Running:shapeCheck</code></pre>
<pre><code>## Running:fireCheck</code></pre>
<pre><code>## Running:isoCheck</code></pre>
<pre><code>## although coordinates are longitude/latitude, st_intersects assumes that they are planar
## although coordinates are longitude/latitude, st_intersects assumes that they are planar</code></pre>
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
<li>If a nesting level is FALSE (e.g. <code>nested_1 = FALSE</code>), make sure nesting descriptors (e.g. <code>n1_min_diam_thresh</code>) are NAs, and vice versa.</li>
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
<p>Finally, generate extra columns in the plot level dataset using <code>plotExtraColGen()</code>, which calculates values such as <code>plot_area</code>, using <code>plot_shape</code>, <code>plot_diameter</code>, <code>plot_length</code> and <code>plot_width</code> which have been entered by the user.</p>
<div class="sourceCode" id="cb41"><pre class="sourceCode r"><code class="sourceCode r"><span id="cb41-1"><a href="#cb41-1" aria-hidden="true"></a>plots_table &lt;-<span class="st"> </span><span class="kw">plotExtraColGen</span>(plots_check)</span></code></pre></div>
<p>The default functions called by <code>plotExtraColGen()</code> are:</p>
<ul>
<li><code>plot_area()</code> - Generate the area of the plot in hectares using <code>plot_shape</code>, <code>plot_diameter</code>, <code>plot_length</code> and <code>plot_width</code></li>
<li><code>subplot_area()</code> - Generate the area of each subplot, in hectares, using <code>subplot_shape</code>, <code>subplot_diameter</code>, <code>subplot_length</code> and <code>subplot_width</code></li>
<li><code>plot_perimeter()</code> - Generate the perimeter of the plot in metres using <code>plot_shape</code>, <code>plot_diameter</code>, <code>plot_length</code> and <code>plot_width</code></li>
</ul>
<p>At this point, it is recommended to clean the stem data, using a similar procedure to above:</p>
<div class="sourceCode" id="cb42"><pre class="sourceCode r"><code class="sourceCode r"><span id="cb42-1"><a href="#cb42-1" aria-hidden="true"></a><span class="co"># names(plotColClass())</span></span>
<span id="cb42-2"><a href="#cb42-2" aria-hidden="true"></a>stems_clean &lt;-<span class="st"> </span>mstems_bad <span class="op">%&gt;%</span></span>
<span id="cb42-3"><a href="#cb42-3" aria-hidden="true"></a><span class="st">  </span>dplyr<span class="op">::</span><span class="kw">rename</span>(<span class="dt">plot_id =</span> plotcode,</span>
<span id="cb42-4"><a href="#cb42-4" aria-hidden="true"></a>    <span class="dt">tree_id =</span> tree,</span>
<span id="cb42-5"><a href="#cb42-5" aria-hidden="true"></a>    <span class="dt">stem_id =</span> stem) <span class="op">%&gt;%</span></span>
<span id="cb42-6"><a href="#cb42-6" aria-hidden="true"></a><span class="st">  </span><span class="kw">mutate</span>(<span class="dt">height =</span> height <span class="op">/</span><span class="st"> </span><span class="dv">100</span>,</span>
<span id="cb42-7"><a href="#cb42-7" aria-hidden="true"></a>    <span class="dt">alive =</span> <span class="kw">case_when</span>(</span>
<span id="cb42-8"><a href="#cb42-8" aria-hidden="true"></a>      alive <span class="op">==</span><span class="st"> &quot;alive&quot;</span> <span class="op">~</span><span class="st"> &quot;A&quot;</span>, </span>
<span id="cb42-9"><a href="#cb42-9" aria-hidden="true"></a>      alive <span class="op">==</span><span class="st"> &quot;dead&quot;</span> <span class="op">~</span><span class="st"> &quot;D&quot;</span>,</span>
<span id="cb42-10"><a href="#cb42-10" aria-hidden="true"></a>      <span class="ot">TRUE</span> <span class="op">~</span><span class="st"> </span>alive),</span>
<span id="cb42-11"><a href="#cb42-11" aria-hidden="true"></a>    <span class="dt">fpc =</span> <span class="dv">1</span>,</span>
<span id="cb42-12"><a href="#cb42-12" aria-hidden="true"></a>    <span class="dt">diam_method =</span> <span class="st">&quot;dbh_tape&quot;</span>)</span>
<span id="cb42-13"><a href="#cb42-13" aria-hidden="true"></a></span>
<span id="cb42-14"><a href="#cb42-14" aria-hidden="true"></a>stems_clean_check &lt;-<span class="st"> </span>seosawr<span class="op">:::</span><span class="kw">colValCheck</span>(stems_clean,</span>
<span id="cb42-15"><a href="#cb42-15" aria-hidden="true"></a>  <span class="dt">colClass =</span> seosawr<span class="op">:::</span><span class="kw">stemColClass</span>())</span></code></pre></div>
<pre><code>## Warning: subplot_id:300/400 NAs</code></pre>
<pre><code>## Warning: measurement_id:400/400 NAs</code></pre>
<pre><code>## Warning: species_orig_local:400/400 NAs</code></pre>
<pre><code>## Warning: notes_stem:400/400 NAs</code></pre>
<pre><code>## Warning: longitude:400/400 NAs</code></pre>
<pre><code>## Warning: latitude:400/400 NAs</code></pre>
<pre><code>## Warning: angle:400/400 NAs</code></pre>
<pre><code>## Warning: distance:400/400 NAs</code></pre>
<pre><code>## Warning: broken_per_remain:400/400 NAs</code></pre>
<pre><code>## Warning: broken_height:400/400 NAs</code></pre>
<pre><code>## Warning: stem_decay:400/400 NAs</code></pre>
<pre><code>## Warning: voucher_id:400/400 NAs</code></pre>
<p>For consistency between datasets, it is recommended (though not necessary), to simplify <code>stem_id</code> and <code>tree_id</code> values using the <code>idClean()</code> function:</p>
<div class="sourceCode" id="cb55"><pre class="sourceCode r"><code class="sourceCode r"><span id="cb55-1"><a href="#cb55-1" aria-hidden="true"></a>stems_clean_check &lt;-<span class="st"> </span><span class="kw">idClean</span>(stems_clean_check)</span></code></pre></div>
<p>See the table below for an example of the changes <code>idClean()</code> makes. Note that <code>tag_id</code> should be reserved for physical tags that allow re-measurement of permanent plots.</p>
<table>
<colgroup>
<col width="9%" />
<col width="18%" />
<col width="18%" />
<col width="18%" />
<col width="17%" />
<col width="17%" />
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
<div class="sourceCode" id="cb56"><pre class="sourceCode r"><code class="sourceCode r"><span id="cb56-1"><a href="#cb56-1" aria-hidden="true"></a><span class="kw">stemTableCheck</span>(stems_clean_check)</span></code></pre></div>
<pre><code>## Running:diamHeightCheck</code></pre>
<pre><code>## Running:deathCheck</code></pre>
<pre><code>## Warning in FUN(X[[i]], ...): Dead but missing death information, rows: 2, 15,
## 21, 22, 31, 34, 35, 42, 45, 49, 56, 61, 65, 66, 75, 77, 80, 94, 97, 101, 103,
## 105, 110, 119, 121 ...</code></pre>
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
<div class="sourceCode" id="cb62"><pre class="sourceCode r"><code class="sourceCode r"><span id="cb62-1"><a href="#cb62-1" aria-hidden="true"></a><span class="kw">tagTreeStemIdMatch</span>(new_data, old_data</span>
<span id="cb62-2"><a href="#cb62-2" aria-hidden="true"></a>  <span class="dt">new_plot_id =</span> <span class="st">&quot;plot_id&quot;</span>, <span class="dt">new_tree_id =</span> <span class="st">&quot;tree_id&quot;</span>,</span>
<span id="cb62-3"><a href="#cb62-3" aria-hidden="true"></a>  <span class="dt">new_stem_id =</span> <span class="st">&quot;stem_id&quot;</span>, <span class="dt">new_tag_id =</span> <span class="st">&quot;tag_id&quot;</span>,</span>
<span id="cb62-4"><a href="#cb62-4" aria-hidden="true"></a>  <span class="dt">old_plot_id =</span> <span class="st">&quot;plot_id&quot;</span>, <span class="dt">old_tree_id =</span> <span class="st">&quot;tree_id&quot;</span>,</span>
<span id="cb62-5"><a href="#cb62-5" aria-hidden="true"></a>  <span class="dt">old_stem_id =</span> <span class="st">&quot;stem_id&quot;</span>, <span class="dt">old_tag_id =</span> <span class="st">&quot;tag_id&quot;</span>)</span></code></pre></div>
<p>Next, fix the species names. This can often be the most time consuming part of the cleaning process. First, run <code>speciesGen()</code> to try and catch any species not recognised by either the larger SEOSAW dataset, <code>taxize::gnr_resolve()</code>, or CJB. The lookup tables called by default by <code>speciesGen()</code> will try to correct as many genuine taxonomic synonymy issues as possible, but most often the data originator is the most knowledgeable on their own species naming shorthand:</p>
<div class="sourceCode" id="cb63"><pre class="sourceCode r"><code class="sourceCode r"><span id="cb63-1"><a href="#cb63-1" aria-hidden="true"></a>stems_species &lt;-<span class="st"> </span><span class="kw">speciesGen</span>(stems_clean_check, </span>
<span id="cb63-2"><a href="#cb63-2" aria-hidden="true"></a>  <span class="dt">return_unknown =</span> <span class="ot">TRUE</span>, <span class="dt">return_unknown_cjb =</span> <span class="ot">TRUE</span>, <span class="dt">return_unknown_gnr =</span> <span class="ot">TRUE</span>) </span></code></pre></div>
<pre><code>## Warning: species(x_final_syn$confer_clean):400/400 NAs</code></pre>
<pre><code>## Warning: subspecies(x_final_syn$subspecies_clean):400/400 NAs</code></pre>
<pre><code>## Warning: variety(x_final_syn$variety_clean):400/400 NAs</code></pre>
<pre><code>## Warning: Some species not matched by gnr_resolve:
##    Indet indet</code></pre>
<pre><code>## Warning: Some species not matched by CJB:
##    Combretum_indet
##    Cryptosepalum_indet
##    Indet_indet
##    Markhamia_indet
##    Millettia_indet
##    Ochna_indet
##    Psidium_indet
##    Terminalia_indet</code></pre>
<p>If species names are not found, <code>stems_species</code> will contain a vector of species names not matched. The user can then use this vector to create a lookup table which corrects the species names. If you are sure the species name is correct, just replace the old name with the same name in the lookup table:</p>
<div class="sourceCode" id="cb69"><pre class="sourceCode r"><code class="sourceCode r"><span id="cb69-1"><a href="#cb69-1" aria-hidden="true"></a><span class="co"># lookup_table &lt;- data.frame(</span></span>
<span id="cb69-2"><a href="#cb69-2" aria-hidden="true"></a><span class="co">#   original = stems_species,</span></span>
<span id="cb69-3"><a href="#cb69-3" aria-hidden="true"></a><span class="co">#   corrected = c(&quot;Lannea discolor&quot;, &quot;Marquesia macroura&quot;, &quot;Syzygium cordatum&quot;))</span></span></code></pre></div>
<p>Then run <code>speciesGen()</code> for a second time, this time passing the lookup table as an argument. This will replace the species name with the corrected version before they are passed to the checking routines.</p>
<div class="sourceCode" id="cb70"><pre class="sourceCode r"><code class="sourceCode r"><span id="cb70-1"><a href="#cb70-1" aria-hidden="true"></a><span class="co"># stems_species &lt;- speciesGen(stems_clean_check, </span></span>
<span id="cb70-2"><a href="#cb70-2" aria-hidden="true"></a><span class="co">#   return_unknown = FALSE, return_unknown_cjb = FALSE, </span></span>
<span id="cb70-3"><a href="#cb70-3" aria-hidden="true"></a><span class="co">#   return_unknown_gnr = FALSE, lookup_ortho = lookup_table)</span></span></code></pre></div>
<p>If <code>speciesGen()</code> is successful, <code>stems_species</code> will now be filled with the stem level dataframe with extra columns appended by <code>speciesGen()</code>.</p>
<p>Next, add extra stem columns using <code>stemExtraColGen()</code>:</p>
<div class="sourceCode" id="cb71"><pre class="sourceCode r"><code class="sourceCode r"><span id="cb71-1"><a href="#cb71-1" aria-hidden="true"></a>stems_extra &lt;-<span class="st"> </span><span class="kw">stemExtraColGen</span>(stems_species)</span></code></pre></div>
<pre><code>## Running:crown_area</code></pre>
<pre><code>## Running:ba</code></pre>
<pre><code>## Running:diam_adj</code></pre>
<p><code>stemExtraColGen()</code> runs a number of functions to create new columns:</p>
<ul>
<li><code>crown_area()</code> - Crown area modelled as an ellipse if both <code>crown_x</code> and <code>crown_y</code> are provided, otherwise modelled as a circle if only one provided. In square metres.</li>
<li><code>ba()</code> - Stem basal area in square metres, calculated using DBH measurements (<code>diam</code>), assuming a circular trunk cross-section.</li>
<li><code>diam_adj()</code> - If the DBH was taken at a POM (<code>pom</code>) other than 1.3 m, an estimated DBH at 1.3 m, assuming a degree of stem taper with height.</li>
</ul>
<p>This function also re-creates <code>tree_id</code>, <code>stem_id</code> and <code>measurement_id</code> as uniquely identifying columns. See the table below for an example:</p>
<table>
<colgroup>
<col width="7%" />
<col width="15%" />
<col width="15%" />
<col width="17%" />
<col width="15%" />
<col width="14%" />
<col width="14%" />
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
<div class="sourceCode" id="cb75"><pre class="sourceCode r"><code class="sourceCode r"><span id="cb75-1"><a href="#cb75-1" aria-hidden="true"></a>stems_extra<span class="op">$</span>agb &lt;-<span class="st"> </span><span class="kw">agbGen</span>(stems_extra, plots_table, </span>
<span id="cb75-2"><a href="#cb75-2" aria-hidden="true"></a>  <span class="dt">species_name =</span> <span class="st">&quot;species_name_clean&quot;</span>) </span></code></pre></div>
<p>Next, we are in a position to compare the logical consistency of the stem table with the plot table. Much like <code>stemTableCheck()</code>, this function conducts a number of checking procedures and flags rows in the stems table which don’t agree with the plot level data, such as if a stem diameter is smaller than the minimum diameter threshold recorded for the plot.</p>
<div class="sourceCode" id="cb76"><pre class="sourceCode r"><code class="sourceCode r"><span id="cb76-1"><a href="#cb76-1" aria-hidden="true"></a><span class="kw">stemPlotTableCheck</span>(stems_extra, plots_table)</span></code></pre></div>
<p>The functions run by <code>stemPlotTableCheck()</code> are:</p>
<ul>
<li><code>stemDiamThreshCheck()</code> - Are there stem measurements outside of the minimum or maximum stem diameter thresholds. Note that if a plot is nested with diameter thresholds, the most extreme (highest/lowest) of these thresholds is used.</li>
</ul>
<p>Then, you can calculate plot level statistics from the stems table and add them to the plots table. This includes calculations like the plot level aboveground biomass, the number of stems at different size thresholds, and the most dominant species in each plot:</p>
<div class="sourceCode" id="cb77"><pre class="sourceCode r"><code class="sourceCode r"><span id="cb77-1"><a href="#cb77-1" aria-hidden="true"></a>plots_table_stat &lt;-<span class="st"> </span><span class="kw">plotStemColumnGen</span>(stems_extra, plots_table)</span></code></pre></div>
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
<li><code>n_diam</code> - Number of stems with diameter measurements</li>
<li><code>n_height</code> - Number of stems with height measurements</li>
<li><code>lorey_height</code> - Lorey height</li>
<li><code>ba</code>- Total basal area</li>
<li><code>agb</code> - Total aboveground biomass</li>
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
<div class="sourceCode" id="cb78"><pre class="sourceCode r"><code class="sourceCode r"><span id="cb78-1"><a href="#cb78-1" aria-hidden="true"></a>mstems_analysis &lt;-<span class="st"> </span><span class="kw">plotToStem</span>(stems_extra, plots_table_stat, <span class="dt">cols =</span> <span class="kw">c</span>(<span class="st">&quot;agb_ha&quot;</span>, <span class="st">&quot;ba_ha&quot;</span>), </span>
<span id="cb78-2"><a href="#cb78-2" aria-hidden="true"></a>  <span class="dt">stem_plot_id =</span> <span class="st">&quot;plot_id&quot;</span>,  <span class="dt">plot_plot_id =</span> <span class="st">&quot;plot_id&quot;</span>)</span></code></pre></div>
<p><strong>FINALLY</strong>, the data is now in the SEOSAW format, with all metadata attached and some preliminary analysis already completed. You can export the cleaned data to the SEOSAW <code>data_clean</code> directory, or some other directory:</p>
<div class="sourceCode" id="cb79"><pre class="sourceCode r"><code class="sourceCode r"><span id="cb79-1"><a href="#cb79-1" aria-hidden="true"></a><span class="kw">exportData</span>(<span class="st">&quot;data_clean/example_data&quot;</span>, <span class="dt">stems =</span> stems_extra, </span>
<span id="cb79-2"><a href="#cb79-2" aria-hidden="true"></a>  <span class="dt">plots =</span> plots_table_stat, <span class="dt">polys =</span> <span class="ot">NULL</span>, <span class="dt">overwrite =</span> <span class="ot">FALSE</span>,</span>
<span id="cb79-3"><a href="#cb79-3" aria-hidden="true"></a>  <span class="dt">files =</span> <span class="kw">c</span>(<span class="st">&quot;stems_csv&quot;</span>, <span class="st">&quot;plots_csv&quot;</span>, <span class="st">&quot;points_shp&quot;</span>))</span></code></pre></div>
</div>
</div>
<div id="whole-dataset-compiling" class="section level1">
<h1>Whole dataset compiling</h1>
<p>Once multiple datasets have been cleaned according to the process outlined above, they can be compiled to a single dataset using <code>compileAll()</code>:</p>
<div class="sourceCode" id="cb80"><pre class="sourceCode r"><code class="sourceCode r"><span id="cb80-1"><a href="#cb80-1" aria-hidden="true"></a><span class="kw">compileAll</span>(<span class="dt">dirs =</span> <span class="kw">c</span>(<span class="st">&quot;data_1&quot;</span>, <span class="st">&quot;data_2&quot;</span>), </span>
<span id="cb80-2"><a href="#cb80-2" aria-hidden="true"></a>  <span class="dt">files =</span> <span class="kw">c</span>(<span class="st">&quot;stems_csv&quot;</span>, <span class="st">&quot;plots_csv&quot;</span>, <span class="st">&quot;points_shp&quot;</span>, </span>
<span id="cb80-3"><a href="#cb80-3" aria-hidden="true"></a>    <span class="st">&quot;polys_shp&quot;</span>), <span class="dt">out_dir =</span> <span class="st">&quot;../path/to/out/dir&quot;</span>)</span></code></pre></div>
<p>There are also two functions for extracting subsets of a compiled dataset. The first, <code>subsetLatest()</code> extracts the most recent census data for each plot, and <code>subsetMulti()</code> extracts measurements only for those plots which have multiple censuses:</p>
<div class="sourceCode" id="cb81"><pre class="sourceCode r"><code class="sourceCode r"><span id="cb81-1"><a href="#cb81-1" aria-hidden="true"></a><span class="kw">subsetLatest</span>(compiled_data, <span class="dt">plot_id =</span> <span class="st">&quot;plot_id&quot;</span>, <span class="dt">diam =</span> <span class="st">&quot;diam&quot;</span>, </span>
<span id="cb81-2"><a href="#cb81-2" aria-hidden="true"></a>  <span class="dt">measurement_date =</span> <span class="st">&quot;measurement_date&quot;</span>, <span class="dt">alive =</span> <span class="st">&quot;alive&quot;</span>)</span></code></pre></div>
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
<p>Dinerstein, E., Olson, D., Joshi, A., Vynne, C., Burgess, N. D., Wikramanayake, E., Hahn, N., Palminteri, S., Hedao, P., Noss, R., Hansen, M., Locke, H., Ellis, E. C., Jones, B., Barber, C. V., Hayes, R., Kormos, C., Martin, V., Crist, E., Sechrest, W., Price, L., Baillie, J. E. M., Weeden, D., Suckling, K., Davis, C., Sizer, N., Moore, R., Thau, D., Birch, T., Potapov, P., Turubanova, S., Tyukavina, A., de Souza, N., Pintea, L., Brito, J. C., Llewellyn, O. A., Miller, A. G., Patzelt, A., Ghazanfar, S. A., Timberlake, J., Klöser, H., Shennan-Farpón, Y., Kindt, R., Lillesø, J.-P. B., van Breugel, P., Graudal, L., Voge, M., Al-Shammari, K. F. and Saleem, M. (2017), ‘An ecoregion-based approach to protecting half the terrestrial realm’, BioScience 67(6), 534–545.</p>
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
