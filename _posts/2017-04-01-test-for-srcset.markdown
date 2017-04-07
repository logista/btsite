---
layout: post
title: "test for `srcset`"
date: "2017-04-01 15:31:25 -0400"
excerpt: "testy testy"
tags: []
ogimage:
---

testing `ekko-lightbox`


I got smart(?) and made a sample post for testing the way `srcset` works. Now I'm going to add a bunch of text to see where the edges of the layout are.

{% include _figures.html base_image_filename="2015-10-13-barbara-tozier-bored-ash.jpg"
title="Bored Ash" alt="paths of emerald ash borers in a diseased/dying tree"
caption="Bored Ash" %}

{% include _figures.html base_image_filename="2015-10-01-barbara-tozier-dahlia-hill.jpg"
title="Dahlia Hill" alt="dahlia flowers against a white background"
caption="A day with the Dahlias" %}

{% include _figures.html base_image_filename="2016-09-18-barbara-tozier-crowd.jpg"
title="Crowd" alt="black and white photo of a crowd at a skatepark"
caption="The crowd at the skatepark" %}

I've moved the 2nd image for the `ekko-lightbox` far away from the first. Will the gallery & modal still work?

<img src="/images/posts/600/2015-10-01-barbara-tozier-dahlia-hill.jpg" data-toggle="lightbox" data-gallery="post-gallery" data-remote="/images/posts/l/2015-10-01-barbara-tozier-dahlia-hill.jpg" class="img-fluid">
