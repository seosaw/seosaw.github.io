---
layout: default
---

<script src="{{ site.baseurl }}/scripts/filter_table.js"></script>
<script src="{{ site.baseurl }}/scripts/jquery.tablesorter.js"></script>
<script src="{{ site.baseurl }}/scripts/masonry.pkgd.min.js"></script>

<script>
    $(function(){
      $("#myTable").tablesorter({ sortList: [[0,0]],
     		headerTemplate: '{content}{icon}' });
    });
</script>

<script>
$('.grid').masonry({
  // options
  itemSelector: '.grid-item',
	percentPosition: true,
	columnWidth: '.grid-sizer'
});
</script>

# People

<input class="filter" id='myInput' onkeyup='filterTable()' type='text', placeholder="Filter...">

<table class="people tablesorter" id="myTable">
	<thead>
	<tr id='tableHeader'>
		 <th>Name</th>
		 <th>Insitution</th>
		 <th>Location</th>
	 </tr>
	</thead>
	<tbody id='tableBody'>
	 <tr>
		 <td>John Godlee</td>
		 <td>University of Edinburgh</td>
		 <td>United Kingdom</td>
	 </tr>
	 <tr>
		 <td>Casey Ryan</td>
		 <td>University of Edinburgh</td>
		 <td>United Kingdom</td>
	 </tr>
	 <tr>
		 <td>Simon Lewis</td>
		 <td>Leeds University</td>
		 <td>United Kingdom</td>
	 </tr>
	 <tr>
		 <td>Ed Mitchard</td>
		 <td>University of Edinburgh</td>
		 <td>United Kingdom</td>
	 </tr>
	 <tr>
		 <td>Kyle Dexter</td>
		 <td>University of Edinburgh</td>
		 <td>United Kingdom</td>
	 </tr>
	 <tr>
		 <td>Caroline Lehmann</td>
		 <td>University of Edinburgh</td>
		 <td>United Kingdom</td>
	 </tr>
	 <tr>
		 <td>Mat Williams</td>
		 <td>University of Edinburgh</td>
		 <td>United Kingdom</td>
	 </tr>
	 <tr>
		 <td>Georgia Pickavance</td>
		 <td>Leeds University</td>
		 <td>United Kingdom</td>
	 </tr>
	 <tr>
		 <td><a href="https://www.linkedin.com/in/nicholasberry" target=_blank>Nicholas Berry</a></td>
		 <td>The Landscapes and Livelihoods Group</td>
		 <td>Mozambique</td>
	 </tr>
	 <tr>
		 <td>Rebecca Stedham</td>
		 <td>The Landscapes and Livelihoods Group</td>
		 <td>United Kingdom</td>
	 </tr>
	 <tr>
		 <td>Tony Swemmer</td>
		 <td>SAEON Ndlovu Node</td>
		 <td>South Africa</td>
	 </tr>
	 <tr>
		 <td>William Bond</td>
		 <td>University of Cape Town</td>
		 <td>South Africa</td>
	 </tr>
	 <tr>
		 <td><a href="http://www.climate.be/modx/index.php?id=96" target=_blank>Patrick Meyfroidt</a></td>
		 <td>Global Land Project</td>
		 <td>Belgium</td>
	 </tr>
	 <tr>
		 <td>Davidson Gumbo</td>
		 <td>CIFOR</td>
		 <td>Zambia</td>
	 </tr>
	 <tr>
		 <td>Natasha Ribeiro</td>
		 <td>Universidade Eduardo Mondlane</td>
		 <td>Mozambique</td>
	 </tr>
	 <tr>
		 <td>Almida Sitoe</td>
		 <td>Universidade Eduardo Mondlane</td>
		 <td>Mozambique</td>
	 </tr>
	 <tr>
		 <td>Steve Makungwa</td>
		 <td>Llongwe University of Agriculture</td>
		 <td>Malawi</td>
	 </tr>
	 <tr>
		 <td>Isla Grundy</td>
		 <td>University of Zimbabwe</td>
		 <td>Zimbabwe</td>
	 </tr>
	 <tr>
		 <td>Ricardo Holdo</td>
		 <td>University of Georgia</td>
		 <td>USA</td>
	 </tr>
	 <tr>
		 <td>Stephen Syampungani</td>
		 <td>Copperbelt University</td>
		 <td>Zambia</td>
	 </tr>
	 <tr>
		 <td>Emanuel Chidumayo</td>
		 <td>Makeni Savanna Research Project</td>
		 <td>Zambia</td>
	 </tr>
	 <tr>
		 <td>Pierre Meerts</td>
		 <td>Universite Libre de Bruxelles</td>
		 <td>Belgium</td>
	 </tr>
	 <tr>
		 <td><a href="https://www.researchgate.net/profile/Francisco_Goncalves10?ev=hdr_xprf" target=_blank>Francisco Maiato Pedroi Gonçalves</a></td>
		 <td>Herbarium of Lubango</td>
		 <td>Angola</td>
	 </tr>
	 <tr>
		 <td>Valter Chisingui</td>
		 <td>Herbarium of Lubango</td>
		 <td>Angola</td>
	 </tr>
	 <tr>
		 <td>Rasmus Revermann</td>
		 <td>University of Hamburg</td>
		 <td>Germany</td>
	 </tr>
	 <tr>
		 <td>Manfred Finckh</td>
		 <td>University of Hamburg</td>
		 <td>Germany</td>
	 </tr>
	 <tr>
		 <td>Mylor Ngoy Shutcha</td>
		 <td>University of Lubumbashi</td>
		 <td>Germany</td>
	 </tr>
	 <tr>
		 <td>Jonathan Ilunga Muledi</td>
		 <td>University of Lubumbashi</td>
		 <td>Democratic Republic of Congo</td>
	 </tr>
	 <tr>
		 <td>David Augustine</td>
		 <td>US Department of Agriculture</td>
		 <td>USA</td>
	 </tr>
	 <tr>
		 <td>Benjamin Wigley</td>
		 <td>Skukuza</td>
		 <td>South Africa</td>
	 </tr>
	 <tr>
		 <td><a href="https://www.wits.ac.za/staff/academic-a-z-listing/a/sallyarchibaldwitsacza/" target=_blank>Sally Archibald</a></td>
		 <td>University of the Witwatersrand</td>
		 <td>South Africa</td>
	 </tr>
	 <tr>
		 <td>Nicola Stevens</td>
		 <td>University of Cape Town</td>
		 <td>South Africa</td>
	 </tr>
	 <tr>
		 <td><a href="http://staverlab.yale.edu/" target=_blank>Carla Staver</a></td>
		 <td>Yale University</td>
		 <td>USA</td>
	 </tr>
	 <tr>
		 <td>Wayne Twine</td>
		 <td>University of the Witwatersrand</td>
		 <td>South Africa</td>
	 </tr>
	 <tr>
		 <td>Adia Bey</td>
		 <td>FAO</td>
		 <td>USA</td>
	 </tr>
	 <tr>
		 <td>Tron Eid</td>
		 <td>Norwegian University of Life Sciences (NMBU)</td>
		 <td>Norway</td>
	 </tr>
	 <tr>
		 <td>Mahesh Sankaran</td>
		 <td>National Centre for Biological Sciences</td>
		 <td>India</td>
	 </tr>
	 <tr>
		 <td>Mariska Te Beest</td>
		 <td>Umeå University</td>
		 <td>Sweden</td>
	 </tr>
	</tbody>
 </table>

<div class="grid">
  <div class="grid-item">
		<div class="hovereffect">
      <img src="{{ site.baseurl }}/images/inst_logos/uoe.png" alt=""/>
      <div class="overlay">
			  <h2>The University of Edinburgh</h2>
  	  </div>
    </div>
  </div>
	<div class="grid-item">
		<div class="hovereffect">
      <img src="{{ site.baseurl }}/images/inst_logos/usda.png" alt=""/>
      <div class="overlay">
			  <h2>US Department of Agriculture</h2>
  	  </div>
    </div>
  </div>
	<div class="grid-item">
		<div class="hovereffect">
      <img src="{{ site.baseurl }}/images/inst_logos/sasscal.png" alt=""/>
      <div class="overlay">
			  <h2>Sasscal centre</h2>
  	  </div>
    </div>
  </div>
	<div class="grid-item">
		<div class="hovereffect">
      <img src="{{ site.baseurl }}/images/inst_logos/uga.png" alt=""/>
      <div class="overlay">
			  <h2>University of Georgia</h2>
  	  </div>
    </div>
  </div>
	<div class="grid-item">
		<div class="hovereffect">
      <img src="{{ site.baseurl }}/images/inst_logos/uham.png" alt=""/>
      <div class="overlay">
			  <h2>University of Hamburg</h2>
  	  </div>
    </div>
  </div>
	<div class="grid-item">
		<div class="hovereffect">
      <img src="{{ site.baseurl }}/images/inst_logos/uz.jpg" alt=""/>
      <div class="overlay">
			  <h2>University of Zimbabwe</h2>
  	  </div>
    </div>
  </div>
	<div class="grid-item">
		<div class="hovereffect">
      <img src="{{ site.baseurl }}/images/inst_logos/wits.png" alt=""/>
      <div class="overlay">
			  <h2>University of the Witwatersrand</h2>
  	  </div>
    </div>
  </div>
	<div class="grid-item">
		<div class="hovereffect">
      <img src="{{ site.baseurl }}/images/inst_logos/yale.png" alt=""/>
      <div class="overlay">
			  <h2>Yale University</h2>
  	  </div>
    </div>
  </div>
	<div class="grid-item">
		<div class="hovereffect">
      <img src="{{ site.baseurl }}/images/inst_logos/makeni.png" alt=""/>
      <div class="overlay">
			  <h2>Makeni Savannah Research</h2>
  	  </div>
    </div>
  </div>
	<div class="grid-item">
		<div class="hovereffect">
      <img src="{{ site.baseurl }}/images/inst_logos/isced.png" alt=""/>
      <div class="overlay">
			  <h2>Huila Institute of Science</h2>
  	  </div>
    </div>
  </div>
	<div class="grid-item">
		<div class="hovereffect">
			<img src="{{ site.baseurl }}/images/inst_logos/luanar.png" alt=""/>
			<div class="overlay">
				<h2>Llongwe University</h2>
			</div>
		</div>
	</div>
	<div class="grid-item">
		<div class="hovereffect">
			<img src="{{ site.baseurl }}/images/inst_logos/saeon.jpg" alt=""/>
			<div class="overlay">
				<h2>SAEON Network</h2>
			</div>
		</div>
	</div>
	<div class="grid-item">
		<div class="hovereffect">
			<img src="{{ site.baseurl }}/images/inst_logos/glp.png" alt=""/>
			<div class="overlay">
				<h2>The Global Land Programme</h2>
			</div>
		</div>
	</div>
	<div class="grid-item">
		<div class="hovereffect">
			<img src="{{ site.baseurl }}/images/inst_logos/uem.jpg" alt=""/>
			<div class="overlay">
				<h2>Universidade Eduardo Mondlane</h2>
			</div>
		</div>
	</div>
	<div class="grid-item">
		<div class="hovereffect">
			<img src="{{ site.baseurl }}/images/inst_logos/ulb.jpg" alt=""/>
			<div class="overlay">
				<h2>Université Libre de Bruxelles</h2>
			</div>
		</div>
	</div>
	<div class="grid-item">
		<div class="hovereffect">
			<img src="{{ site.baseurl }}/images/inst_logos/ncbs.png" alt=""/>
			<div class="overlay">
				<h2>National Centre for Biological Sciences</h2>
			</div>
		</div>
	</div>
</div>
