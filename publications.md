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
		 <td class="paper_authors_title">Iain M. McNicol, Casey M. Ryan & Edward T. A. Mitchard</td>
		 <td class="paper_authors_title">a href="https://www.nature.com/articles/s41467-018-05386-z" target="_blank">Carbon losses from deforestation and widespread degradation offset by extensive growth in African woodlands</a></td>
		 <td class="paper_journal">Nature Communications</td>
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
