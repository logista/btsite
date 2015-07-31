---
layout: gallerypage
title: Portfolio Index
excerpt: "Index"
---

{% for gallery in site.data.gallerylist %}
{% for image in gallery[1].images %}
{% if image.feature %}

<h3 markdown="1" style="text-align:center;margin-bottom:2em;" class="half">
[![](/{{gallery[0]}}/th/{{image.filename}})  
{{ gallery[1].title}} ](/{{ gallery[0] }}/)
</h3>

{% endif %}
{% endfor %}
{% endfor %}
