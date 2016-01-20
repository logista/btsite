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

**IT IS REQUIRED** to date the post, because Jekyll will always default to the filename and I hope one day that we won't have to have filenames with dates in them.  Since I don't expect to post more than once a day, setting `date:` to the day level (without a time) should be enough. If I get antsy, I can always add the time in ad hoc.

`modified:` is only for a "big enough" change. Minor typo changes (and the stuff associated with revamping the YAML frontmatter) doesn't get it.



### Image posts

~~~ yaml
---
layout: post
title: "Textures for Fun"
excerpt: "Since I call myself a photographer, I suppose I should try to include some images in my posts."
tags: [photograph, texture, orange, gray]
date: 2015-08-03
modified: 2015-08-04
ogimage: '/images/posts/s/2015-08-03-barbara-tozier-square-orange-texture.jpg'
---
~~~

For now, I'm using the same layout for text-based and picture-based (and quote-based) posts. This may change, because I'm currently having to do lots of extra stuff to get images into a post. This includes creating a thumbnail for an image so too-large images don't overwhelm my RSS feed. This doesn't have a good resolution yet --- I need to make some more posts with images to get a feel for how I want to work with them in the future.

(added later:)

Images for posts are separated by size/type. `images/posts/s` is "small" or thumbnail sized, approximately 300px on the longest dimension. `images/posts/m` is "medium" sized, about 600px on the longest dimension. `images/posts/l` is "large" sized, 12-1500 px on the longest dimension. These should only ever be linked to in a post from one of the smaller versions, so the slideshow can pick it up. I'm currently (2015-08-11) thinking that only `s` images link to `l` versions, while `m` are standalones.

I've also added a 4th folder called `images/posts/ss`. This is for one-off screenshots.

This feels a little fiddly, but for now I'm going for it.

(added later:)

To get a nice "social media" promotable image, use the YAML `ogimage:` tag. Pick one of the images on the page and include the full URL.

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

#### screen captures

The `<figure>` element is used with `.image-ss` to style (small) screenshot images. It will put them in their own block in the center of the text where they appear. It can be styled further within the `<figure>` element.

I have made some Atom.snippets to help me remember this stuff. For example, typing `ssfm` and then `tab` *should* expand to

~~~ html

<figure class="image-ss">
 <img src="/images/posts/ss/~tab to here~.jpg">
</figure>

~tab again to start typing here~
~~~

#### small-sized images (linked to larger)

- The `<figure>` element is used with `.image-s` to style small-sized "digital works" images. Up to two small images can be placed within one `<figure>` element block. If the images link to a larger image (the most common mode), then a caption `<span class="image-s-caption">Click image to see larger</span>` should be placed within `<figcaption>` markup.

Typing `sfm1` and then `tab` will put one image in a single figure markup with a link to the larger size, like:

~~~ html
<figure class="image-s">
  <a href="/images/posts/l/~tab 1 to here~.jpg" title="~tab 2 here~">
    <img src="/images/posts/s/~copies filename above~.jpg">
  </a>
    <span class="image-s-caption">Click image to see larger</span>
</figure>

~tab again to start typing here~
~~~

To put two small images in the same figure, type `sfm2` and then `tab`

~~~ html
<figure class="image-s">
  <a href="/images/posts/l/~tab 1 to here~.jpg" title="~tab 2 here~">
    <img src="/images/posts/s/~copies filename 1~.jpg">
  </a>
  <a href="/images/posts/l/~tab 3 here~.jpg" title="~tab 4 here~">
    <img src="/images/posts/s/~copies filename 2~.jpg">
  </a>
    <span class="image-s-caption">Click image to see larger</span>
</figure>

~tab 5 to start typing here~
~~~


#### medium-sized images

The `<figure>` element is used with `.image-m` to style medium-sized "digital works" images. It will put the image in its own block in the center of the text. Added to that are two HTML span classes that can be used that will "attach" some explanatory text to the image. They need to go within `<figcaption>` markup.
    - `<span class="image-m-caption">title/caption of image</span>`
    - `<span class="image-m-credit">Barbara Tozier</span>`

To (I hope) make it easier, type `mfm` and then `tab` to get:

~~~ html
<figure class="image-m">
  <img src="/images/posts/m/~tab to here~.jpg">
  <figcaption>
    <span class="image-m-caption">~tab 2 goes here~</span>
    <span class="image-m-credit">Barbara Tozier</span>
  </figcaption>
</figure>

~final tab goes here~
~~~

#### large-size images

- Large images do not (currently) have any particular styling outside of the slideshow.


### asides

Asides, while they are now an HTML element, are called using `{: .aside}` markup. Longer asides require div markup that starts something like `<div class="aside" markdown="1">`. They can appear anywhere within an article. They weren't styled by the original designer, and I may end up changing it later.

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
