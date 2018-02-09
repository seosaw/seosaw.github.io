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
		 <td class="paper_authors_title">Flvarez-Dávila E, Cayuela L, González-Caro S, Aldana AM, Stevenson PR, Phillips O, Cogollo A, Peñuela MC, von Hildebrand P, Jiménez E, Melo O, Londoño-Vega AC, Mendoza I, Velásquez O, Fernández F, Serna M, Velázquez-Rua C, Benítez D & Rey-Benayas JM.</td>
		 <td class="paper_authors_title">Forest biomass density across large climate gradients in northern South America is related to water availability but not with temperature.</td>
		 <td class="paper_journal">PLOS ONE 12 (3)</td>
		 <td class="paper_year">1999</td>
	 </tr>
	 <tr>
		 <td class="paper_authors_title">Cayuela L, González-Caro S, Aldana AM, Stevenson PR, Phillips O, Cogollo A, Peñuela MC, von Hildebrand P, Jiménez E, Melo O, Londoño-Vega AC, Mendoza I, Velásquez O, Fernández F, Serna M, Velázquez-Rua C, Benítez D & Rey-Benayas JM.</td>
		 <td class="paper_authors_title">Forest biomass density across large climate gradients in northern South America is related to water availability but not with temperature.</td>
		 <td class="paper_journal">PLOS ONE 12 (3)</td>
		 <td class="paper_year">2002</td>
	 </tr>
	 </tbody>
 </table>
