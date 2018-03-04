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
		 <td class="paper_authors_title">  </td>
		 <td class="paper_authors_title">  </td>
		 <td class="paper_journal">  </td>
		 <td class="paper_year"> </td>
	 </tr>
	 </tbody>
 </table>
