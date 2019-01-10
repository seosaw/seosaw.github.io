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

<input class="filter" id='myInput' onkeyup='filterTable()' type='text' placeholder="Filter...">

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
<td><a href="https://www.geos.ed.ac.uk/people/person.html?indv=7358" target="_blank">John Godlee</a></td>
<td>University of Edinburgh</td>
<td>United Kingdom</td>
</tr>
<tr>
<td><a href="https://www.geos.ed.ac.uk/homes/cryan/" target="_blank">Casey Ryan</a></td>
<td>University of Edinburgh</td>
<td>United Kingdom</td>
</tr>
<tr>
<td><a href="http://www.geog.leeds.ac.uk/people/s.lewis/" target="_blank">Simon Lewis</a></td>
<td>Leeds University</td>
<td>United Kingdom</td>
</tr>
<tr>
<td><a href="https://www.geos.ed.ac.uk/homes/emitchar/" target="_blank">Ed Mitchard</a></td>
<td>University of Edinburgh</td>
<td>United Kingdom</td>
</tr>
<tr>
<td><a href="http://phylodiversity.net/kdexter/HOME.html" target="_blank">Kyle Dexter</a></td>
<td>University of Edinburgh</td>
<td>United Kingdom</td>
</tr>
<tr>
<td><a href="https://www.ed.ac.uk/geosciences/people?indv=3626" target="_blank">Caroline Lehmann</a></td>
<td>University of Edinburgh</td>
<td>United Kingdom</td>
</tr>
<tr>
<td><a href="https://www.geos.ed.ac.uk/homes/mwilliam" target="_blank">Mat Williams</a></td>
<td>University of Edinburgh</td>
<td>United Kingdom</td>
</tr>
<tr>
<td>Georgia Pickavance</td>
<td>Leeds University</td>
<td>United Kingdom</td>
</tr>
<tr>
<td><a href="http://www.linkedin.com/in/nicholasberry" target="_blank">Nicholas Berry</a></td>
<td>The Landscapes and Livelihoods Group</td>
<td>Mozambique</td>
</tr>
<tr>
<td><a href="https://uk.linkedin.com/in/rebecca-stedham-b12a4232" target="_blank">Rebecca Stedham</a></td>
<td>The Landscapes and Livelihoods Group</td>
<td>United Kingdom</td>
</tr>
<tr>
<td><a href="https://scholar.google.com/citations?user=puhRMP8AAAAJ&hl=en" target="_blank">Tony Swemmer</a></td>
<td>SAEON Ndlovu Node</td>
<td>South Africa</td>
</tr>
<tr>
<td><a href="http://www.biologicalsciences.uct.ac.za/bio/staff/academic/bond" target="_blank">William Bond</a></td>
<td>University of Cape Town</td>
<td>South Africa</td>
</tr>
<tr>
<td><a href="http://www.climate.be/modx/index.php?id=96" target="_blank">Patrick Meyfroidt</a></td>
<td>Global Land Project</td>
<td>Belgium</td>
</tr>
<tr>
<td><a href="http://www.cifor.org/scientific-staff-detail/1591/" target="_blank">Davison Gumbo</a></td>
<td>CIFOR</td>
<td>Zambia</td>
</tr>
<tr>
<td><a href="https://www.researchgate.net/profile/Natasha_Ribeiro" target="_blank">Natasha Ribeiro</a></td>
<td>Universidade Eduardo Mondlane</td>
<td>Mozambique</td>
</tr>
<tr>
<td><a href="https://www.researchgate.net/profile/Almeida_Sitoe" target="_blank">Almeida Sitoe</a></td>
<td>Universidade Eduardo Mondlane</td>
<td>Mozambique</td>
</tr>
<tr>
<td><a href="https://www.researchgate.net/profile/Steve_Makungwa" target="_blank">Steve Makungwa</a></td>
<td>Llongwe University of Agriculture</td>
<td>Malawi</td>
</tr>
<tr>
<td><a href="https://www.researchgate.net/profile/Isla_Grundy" target="_blank">Isla Grundy</a></td>
<td>University of Zimbabwe</td>
<td>Zimbabwe</td>
</tr>
<tr>
<td><a href="http://holdo.ecology.uga.edu" target="_blank">Ricardo Holdo</a></td>
<td>University of Georgia</td>
<td>USA</td>
</tr>
<tr>
<td><a href="https://www.researchgate.net/profile/Stephen_Syampungani" target="_blank">Stephen Syampungani</a></td>
<td>Copperbelt University</td>
<td>Zambia</td>
</tr>
<tr>
<td><a href="https://www.researchgate.net/profile/Emmanuel_Chidumayo" target="_blank">Emanuel Chidumayo</a></td>
<td>Makeni Savanna Research Project</td>
<td>Zambia</td>
</tr>
<tr>
<td><a href="https://www.ulb.ac.be/rech/inventaire/chercheurs/8/CH2958.html" target="_blank">Pierre Meerts</a></td>
<td>Universite Libre de Bruxelles</td>
<td>Belgium</td>
</tr>
<tr>
<td><a href="https://www.researchgate.net/profile/Francisco_Goncalves10?ev=hdr_xprf" target="_blank">Francisco Maiato Pedro Gonçalves</a></td>
<td>Herbarium of Lubango</td>
<td>Angola</td>
</tr>
<tr>
<td>António Valter Chisingui</td>
<td>Herbarium of Lubango</td>
<td>Angola</td>
</tr>
<tr>
<td><a href="https://www.researchgate.net/profile/Rasmus_Revermann" target="_blank">Rasmus Revermann</a></td>
<td>University of Hamburg</td>
<td>Germany</td>
</tr>
<tr>
<td><a href="http://www.biodiversity-plants.de/fb0a068/fb0a068_e.htm" target="_blank">Manfred Finckh</a></td>
<td>University of Hamburg</td>
<td>Germany</td>
</tr>
<tr>
<td><a href="https://www.researchgate.net/profile/Mylor_Ngoy_Shutcha3" target="_blank">Mylor Ngoy Shutcha</a></td>
<td>University of Lubumbashi</td>
<td>Germany</td>
</tr>
<tr>
<td><a href="https://www.researchgate.net/profile/Jonathan_Ilunga_Muledi2" target="_blank">Jonathan Ilunga Muledi</a></td>
<td>University of Lubumbashi</td>
<td>Democratic Republic of Congo</td>
</tr>
<tr>
<td><a href="https://www.ars.usda.gov/plains-area/fort-collins-co/center-for-agricultural-resources-research/rangeland-resources-systems-research/people/david-augustine/" target="_blank">David Augustine</a></td>
<td>US Department of Agriculture</td>
<td>USA</td>
</tr>
<tr>
<td><a href="https://www.researchgate.net/profile/Benjamin_Wigley" target="_blank">Benjamin Wigley</a></td>
<td>Skukuza</td>
<td>South Africa</td>
</tr>
<tr>
<td><a href="https://www.wits.ac.za/staff/academic-a-z-listing/a/sallyarchibaldwitsacza/" target="_blank">Sally Archibald</a></td>
<td>University of the Witwatersrand</td>
<td>South Africa</td>
</tr>
<tr>
<td><a href="https://www.researchgate.net/profile/Nicola_Stevens3" target="_blank">Nicola Stevens</a></td>
<td>University of Cape Town</td>
<td>South Africa</td>
</tr>
<tr>
<td><a href="http://staverlab.yale.edu/" target="_blank">Carla Staver</a></td>
<td>Yale University</td>
<td>USA</td>
</tr>
<tr>
<td><a href="https://www.wits.ac.za/staff/academic-a-z-listing/t/waynetwinewitsacza/" target="_blank">Wayne Twine</a></td>
<td>University of the Witwatersrand</td>
<td>South Africa</td>
</tr>
<tr>
<td><a href="https://scholar.google.com/citations?user=rAGgdBkAAAAJ&hl=en" target="_blank">Adia Bey</a></td>
<td>FAO</td>
<td>USA</td>
</tr>
<tr>
<td><a href="https://www.nmbu.no/emp/tron.eid" target="_blank">Tron Eid</a></td>
<td>Norwegian University of Life Sciences (NMBU)</td>
<td>Norway</td>
</tr>
<tr>
<td><a href="https://www.ncbs.res.in/faculty/mahesh" target="_blank">Mahesh Sankaran</a></td>
<td>National Centre for Biological Sciences</td>
<td>India</td>
</tr>
<tr>
<td><a href="https://www.researchgate.net/profile/Mariska_Beest" target="_blank">Mariska Te Beest</a></td>
<td>Umeå University</td>
<td>Sweden</td>
</tr>
<tr>
<td><a href="https://www.geos.ed.ac.uk/people/person.html?indv=4064" target="_blank">Iain McNicol</a></td>
<td>University of Edinburgh</td>
<td>United Kingdom</td>
</tr>
<tr>
<td><a href="" target="_blank">Anderson Muchawona</a></td>
<td>Zimbabwe Forestry Commission</td>
<td>Zimbabwe</td>
</tr>
<tr>
<td><a href="https://www.researchgate.net/profile/Josiah_Katani" target="_blank">Josiah Zephania Katani</a></td>
<td>Sokoine University of Agriculture</td>
<td>Tanzania</td>
</tr>
<tr>
<td><a href="https://www.researchgate.net/profile/Benard_Guedes2" target="_blank">Benard Guedes</a></td>
<td>Universidade Eduardo Mondlane</td>
<td>Mozambique</td>
</tr>
<tr>
<td><a href="https://www.researchgate.net/profile/Wilson_Mugasha" target="_blank">Wilson Mugasha</a></td>
<td>Sokoine University of Agriculture</td>
<td>Tanzania</td>
</tr>
<tr>
<td><a href="https://www.researchgate.net/profile/Adeline_Fayolle" target="_blank">Adeline Fayolle</a></td>
<td>University of Liege</td>
<td>Belgium</td>
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
      <img src="{{ site.baseurl }}/images/inst_logos/nerc.png" alt=""/>
      <div class="overlay">
			  <h2>Natural Environment Research Council</h2>
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
	<div class="grid-item">
		<div class="hovereffect">
			<img src="{{ site.baseurl }}/images/inst_logos/nmbu.png" alt=""/>
			<div class="overlay">
				<h2>Norwegian University of Life Sciences</h2>
			</div>
		</div>
	</div>
	<div class="grid-item">
		<div class="hovereffect">
			<img src="{{ site.baseurl }}/images/inst_logos/copperbelt.png" alt=""/>
			<div class="overlay">
				<h2>Copperbelt University</h2>
			</div>
		</div>
	</div>
	<div class="grid-item">
		<div class="hovereffect">
			<img src="{{ site.baseurl }}/images/inst_logos/leeds.png" alt=""/>
			<div class="overlay">
				<h2>University of Leeds</h2>
			</div>
		</div>
	</div>
    <div class="grid-item">
		<div class="hovereffect">
            <img src="{{ site.baseurl }}/images/inst_logos/ukri.png" alt=""/>
            <div class="overlay">
			  <h2>UK Research and Innovation</h2>
  	  </div>
    </div>
  </div>
    <div class="grid-item">
		<div class="hovereffect">
            <img src="{{ site.baseurl }}/images/inst_logos/gcrf.jpg" alt=""/>
            <div class="overlay">
			  <h2>Global Challenges Research Fund</h2>
  	  </div>
    </div>
  </div>
</div>
