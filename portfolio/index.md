---
layout: gallerypage
title: Portfolio Index
excerpt: "Index"
---

List of Galleries

<figure style="text-align:center;">

{% for gallery in site.data.gallerylist %}


<a href="/{{ gallery[0] }}/">{{ gallery[1].title}}
{% for image in gallery[1].images %}
{% if image.feature %}
  <img src="/{{gallery[0]}}/th/{{image.filename}}" /><br>
{% endif %}
{% endfor %}
</a>


{% endfor %}

</figure>
