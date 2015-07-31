---
layout: gallerypage
title: Portfolio Index
excerpt: "Index"
---

{% for gallery in site.data.gallerylist %}
{% for image in gallery[1].images %}
{% if image.feature %}

<h3 markdown="1" style="margin-bottom:2em; text-align:center;">
[![](/{{gallery[0]}}/th/{{image.filename}}){: .thumbnail}  
{{ gallery[1].title}} ](/{{ gallery[0] }}/)
</h3>

{% endif %}
{% endfor %}
{% endfor %}
