---
layout: gallerypage
title: Gallery 2
gallery: gallery02
---

<figure markdown="0">
<ul>
{% for picture in site.data.galleries %}
{% if picture.gallery == page.gallery %}
	<li><a href="{{ picture.filename }}"><img src="th/{{ picture.filename }}"></a></li>
{% endif %}
{% endfor %}
</ul>
</figure>
