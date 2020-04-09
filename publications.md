---
layout: default
---

<!--- scripts --->
<script src="{{ site.baseurl }}/scripts/filter_table.js"></script>
<script src="{{ site.baseurl }}/scripts/jquery.tablesorter.js"></script>
<script>
    $(function(){
      $("#myTable").tablesorter({ sortList: [[3,1]],
     		headerTemplate: '{content}{icon}' });
    });
</script>

# Publications

<!--- table starts --->
<input class="filter" id='myInput' onkeyup='filterTable()' type='text' placeholder="Filter...">

 <table class="publications tablesorter" id="myTable">
	 <thead>
	 <tr id='tableHeader'>
		 <th>Authors</th>
		 <th>Title</th>
		 <th>Journal</th>
		 <th>Year</th>
	 </tr>
	 </thead>
	 <tbody id='tableBody'>
	 <tr>
		 <td class="paper_authors_title">Godlee J. L., Gonçalves F. M., Tchamba J. J., Chisingui A. V., Muledi J. I., Shutcha M. N., Ryan C. M., Brade T. K. & Dexter K. G.</td>
		 <td class="paper_authors_title"><a href="https://dx.doi.org/10.3390/d12040140" target="_blank">Diversity and structure of an arid woodland in southwest Angola, with comparison to the wider miombo ecoregion</a></td>
		 <td class="paper_journal">Diversity</td>
		 <td class="paper_year">2020</td>
	 </tr>
	 <tr>
		 <td class="paper_authors_title">McNicol I. M., Ryan C. M. & Mitchard E. T. A.</td>
		 <td class="paper_authors_title"><a href="https://www.nature.com/articles/s41467-018-05386-z" target="_blank">Carbon losses from deforestation and widespread degradation offset by extensive growth in African woodlands</a></td>
		 <td class="paper_journal">Nature Communications</td>
		 <td class="paper_year">2018</td>
	 </tr>
	 <tr>
		 <td class="paper_authors_title">Nieto-Quintano P., Mitchard E. T. A, Odende R., Mouwembe M. A. B., Rayden T. & Ryan C. M.</td>
		 <td class="paper_authors_title"><a href="https://doi.org/10.1111/btp.12606" target="_blank">The mesic savannas of the Bateke Plateau: carbon stocks and floristic composition</a></td>
		 <td class="paper_journal">Biotropica</td>
		 <td class="paper_year">2018</td>
	 </tr>
	 <tr>
		 <td class="paper_authors_title">Fayolle A., Swaine M. D., Aleman J., Azihou A. F., Bauman D., te Beest M., Chidumayo E. N., Cromsigt J. P. G. M., Dessard H., Finckh M., Gonçalves F. M. P., Gillet J., Gorel A., Hick A., Holdo R., Kirunda B., Mahy G., McNicol I., Ryan C. M., Revermann R., Plumptre A., Pritchard R., Nieto-Quintano P., Schmitt C. B., Seghieri J., Swemmer A. , Talila H. & Woollen E.</td> 
		 <td class="paper_authors_title"><a href="https://doi.org/10.1111/jbi.13475" target="_blank">A sharp floristic discontinuity revealed by the biogeographic regionalization of African savannas</a></td>
		 <td class="paper_journal">Journal of Biogeography</td>
		 <td class="paper_year">2018</td>
	 </tr>
	 <tr>
		 <td class="paper_authors_title"></td>
		 <td class="paper_authors_title"></td>
		 <td class="paper_journal"></td>
		 <td class="paper_year"></td>
	 </tr>
	 </tbody>
 </table>
