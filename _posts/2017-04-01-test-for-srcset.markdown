---
layout: post
title: "test for `srcset`"
date: "2017-04-01 15:31:25 -0400"
excerpt: "testy testy"
tags: []
ogimage:
---
I got smart(?) and made a sample post for testing the way `srcset` works.

Some text goes here. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

### FLowers

#### included liquid tags

{% include _figures.html base_image_filename="2015-10-13-barbara-tozier-bored-ash.jpg"
title="Bored Ash" alt="paths of emerald ash borers in a diseased/dying tree"
caption="Bored Ash" %}

#### clock


<figure class="figure post-figure">
<img class="img-fluid post-image"
sizes="(min-width: 800px) 50vw, 100vw"
srcset="
/images/srcset/2014-btozier-clock-1200_hnoque_c_scale,w_300.jpg 300w,
/images/srcset/2014-btozier-clock-1200_hnoque_c_scale,w_579.jpg 579w,
/images/srcset/2014-btozier-clock-1200_hnoque_c_scale,w_794.jpg 794w,
/images/srcset/2014-btozier-clock-1200_hnoque_c_scale,w_960.jpg 960w"
src="/images/srcset/2014-btozier-clock-1200_hnoque_c_scale,w_579.jpg"
alt="">
<figcaption class="figcaption post-caption">TICK TOCK</figcaption>
</figure>

{% include _figures.html base_image_filename="2015-10-01-barbara-tozier-dahlia-hill.jpg"
title="Dahlia Hill" alt="dahlia flowers against a white background"
caption="A day with the Dahlias" %}

{% include _figures.html base_image_filename="2016-09-18-barbara-tozier-crowd.jpg"
title="Crowd" alt="black and white photo of a crowd at a skatepark"
caption="The crowd at the skatepark" %}
