Most "posts" are going to be text-related with or without photographs.

I am unclear on what needs quote marks (either double or single) and what doesn't. As far as I can tell, YAML doesn't care. The important part is for the Jekyll parser to understand it. I'm writing this little file to remind myself to be consistent.

## YAML headers

### Text posts

Here's a big yaml header for a text-only post:

~~~ yaml
---
layout: post
title: "YANS"
excerpt: "Another summer, another new website"
tags: [self-referential, website, workflow]
date: 2015-08-01
modified: 2015-08-04
---
~~~

**IT IS REQUIRED** to include `layout:`. I could set a `default` in Jekyll, but I want to get used to adding it (in the event I make a different layout for images, for instance), so I won't. Since this is only ever used internally, it doesn't need quote marks.

**IT IS REQUIRED** to include `title:`. Double quotes around the title, no matter how short. If using quote marks *within* the title, be sure to use `'single quotes'`.

**IT IS REQUIRED** to include an excerpt, because I don't like/trust Jekyll to do it the way I want. Mostly this can be the first sentence of the first paragraph, or a super-brief logline for the post. Syntax similar to `title:`

`tags:` are not required, they're only used in the HTML header for SEO purposes, as if that mattered. They are a comma-delimited list, inside of brackets. `Two or more word items` do not seem to need quotes.

**IT IS REQUIRED** to date the post, because Jekyll will always default to the filename and I hope one day that we won't have to have filenames with dates in them.  Since I don't expect to post more than once a day, setting `date:` to the day level (without a time) should be enough. If I get antsy, I can always add the time in _ad hoc_.

`modified:` is only for a "big enough" change. Minor typo changes (and the stuff associated with revamping the YAML frontmatter) doesn't get it.



### Image posts

**2017-04-01:** I am completely redoing this, because I finally *read* the [Jekyll docs on includes](https://jekyllrb.com/docs/includes/). I can make a `_figures.html` template that I fill with information in my markdown-based post document, and *future* me will be happier when I go to update the site again.

There are a couple of issues remaining (besides the actual design and implementation): what to do about the RSS feed images -- how do I make sure I don't send "too big" files? And do I want a Jekyll plugin to convert a single image to the other sizes, or continue with sizing from Lightroom?

TODO: check RSS feed images. How does it handle srcset?

~~~ yaml
---
layout: post
title: "Textures for Fun"
excerpt: "Since I call myself a photographer, I suppose I should try to include some images in my posts."
tags: [photograph, texture, orange, gray]
date: 2015-08-03
modified: 2015-08-04
ogimage: '20150803-btozier-square-orange-texture.jpg'
---
~~~

**OGIMAGE** points to the `default-src` directory defined in `_config.yml` Make sure you have a corresponding image there, or take the line out completely.

Nearly all images are handled the same: using the snippet `fmu` (figure mark up) you will get this:

~~~ html
{% include _figures.html
  base_image_filename=".jpg"
  title=""
  alt=""
  caption=""
%}
~~~

This calls `_figures.html` which creates the `srcset` code based on the image directories defined in `_config.yml` at the `picserizer` tag.

Occasional images (like ones from other sources) do *not* get this treatment. Screen captures, animated gifs, etc. also go here.

They get marked up using standard `kramdown` syntax:

~~~ code
![alt-text](/images/adhoc/filename.ext)
{: .i cant remember}
~~~

TODO: make a snippet for this

### Videos

New this year! Well, not really, but anyway. There are two types of video: self-hosted and YouTube.

TODO: fill in what the includes are and how they are used

### Pages

~~~ yaml
---
layout: gallerypage
gallery: gallery-stories
title: "Stories"
excerpt: "Words and pictures, pictures and words."
tags: [photograph, abstract, color, digital, fine art, close up, books, stories]
date: 2015-08-01
---
~~~

Most Pages are galleries. However, the "no quotes" thing seems to be suitable. Follow the guidelines from above.

`date:` isn't used in Jekyll with Pages, but I now realize it might be a good thing to have for keeping track of when things have been changed. So I'm including it.

The images in the galleries are 300px thumbnails, linking to a larger (1500px) copy used for the slideshow. They are listed in `_data/gallerylist.yml` in the order they are to appear on the page. A single "feature" image is also noted --- this is the image used to represent the gallery on the Portfolio Index page.


## Special CSS classes

### images

### asides

Asides, while they are now an HTML5 element, are called using `{: .aside}` markup. Longer asides require div markup that starts something like `<div class="aside" markdown="1">`. They can appear anywhere within an article. They weren't styled by the original designer, and I may end up changing it later.

You know, now that I know how to make snippets, I've done it with `asdiv`:

~~~ html
<div class="aside" markdown="1">
~start writing~
</div>

~tab out~
~~~

This assumes that the aside isn't written yet. A similar snippet is for the kramdown markup: `asd` makes `{: .aside}` with some extra newlines.

### attention conservation notice

Goes at the top of longer articles. At the rate I'm going, it will go at the top of EVERY article ;) Called using `{: .acn}`, its snippet is `acn` (unsurprising)

### text box highlight

Sometimes I want a "code style" block to have wrapping. This was the way I managed to make it happen. It comes after the final tildes of a code block as `{: .text-highlight}`. Snippet `thb`.

### other dribs and drabs

`{: .code-snippet}` is a way to on occasion center a small bit of text --- code, usually. Its snippet code is `scs`.
