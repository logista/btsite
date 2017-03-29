---
permalink: /portfolio/
layout: gallerypage
title: "Portfolio Index"
excerpt: "Index of Galleries"
tags: [photograph, photography, color, digital, fine art, abstract, alternative processes]
date: 2015-08-01
---

{% for gallery in site.data.gallerylist %}
{% for image in gallery[1].images %}
{% if image.feature %}

<h3 markdown="1" style="margin-bottom:2em; text-align:center;">
[![{{image.title}}](/{{gallery[0]}}/th/{{image.filename}}){: .thumbnail}  
{{ gallery[1].title}} ](/{{ gallery[0] }}/ "Go to {{ gallery[1].title}} gallery")
</h3>

{% endif %}
{% endfor %}
{% endfor %}
