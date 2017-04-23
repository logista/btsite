There are two types of documents: posts and galleries. Posts are a Jekyll Collection by definition; Galleries are one because I said so.

Posts are markdown files that live in `_posts` and need to have a date at the beginning of the filename.

Galleries are markdown files that live in `_galleries` and should be named for the gallery.

Images can appear in posts only, in galleries only, and in posts AND galleries. Therefore some things are a bit complicated and I try to use the YAML headers to indicate where Jekyll should look for pictures.

I do not have a way to put video in a Gallery right now.

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

TODO: check RSS feed images. How does it handle srcset?

~~~ yaml
---
layout: post
title: "Textures for Fun"
excerpt: "Since I call myself a photographer, I suppose I should try to include some images in my posts."
tags: [photograph, texture, orange, gray]
date: 2015-08-03
modified: 2015-08-04
use-gallery-image: false
ogimage: '20150803-btozier-square-orange-texture.jpg'
---
~~~

If `use-gallery-image` is `false`, **OGIMAGE** points to the `og-image-dir` directory defined in `_config.yml`. If `use-gallery-image` is `true` (writing a post about a gallery image, say one that is being exhibited), then **OGIMAG** points to the `gog-image-dir` defined in `_config.yml`.


Nearly all images are handled the same: using the snippet `fmu` (figure mark up) makes this:

~~~ html
{% include _figures.html
  gallery=false
  base_image_filename=".jpg"
  title=""
  alt=""
  caption=""
%}
~~~

Similar to the `use-gallery-image` flag in the YAML header, the `gallery=` flag lets the `include` figure out which directory to look for.

`fmu` calls `_figures.html` which creates the `srcset` code based on the image directories defined in `_config.yml` at the `picserizer` tag.

Occasional images (like ones from other sources, screen captures, animated gifs, etc.) do *not* get this `_figures.html` treatment. They get marked up using standard `kramdown` syntax:

~~~ code
![alt-text](/images/adhoc/filename.ext 'title')
{: .image-adhoc}
~~~

### Videos

New this year! Well, not really, but anyway. There are two types of video: self-hosted and YouTube.

First is self-hosted. These should be stored in the `images/videos` folder. I'm not entirely sure the size is correct, but whatever...

I don't have a snippet for this, because I've only done it once. It's ok to copy/paste ;)

~~~ code
{% include _vid-embed.html
src='/images/videos/topsy_turvy_excerpt.mp4'
caption="Jim Broadbent as W.S. Gilbert in _Topsy-Turvy_" %}
~~~

There is an occasional YouTube video embed, too. Similar to the self-hosted version, I'm not sure the size is correct, but anyway... Note that the `id` is the YouTube `id` number.

~~~ code
{% include _yt-embed.html id='RTpdioaBoFo' caption="HD Video with sound: 5 minutes."%}
~~~

### Galleries

~~~ yaml
---
layout: gallery
title: "Stories"
excerpt: "Words and pictures, pictures and words."
tags: [photograph, abstract, color, digital, fine art, close up, books, stories]
date: 2015-07-31
use_gallery_img: true
ogimage: 20121105-btozier-science-fiction-shelf-poem.jpg
images:
  - filename: 20121105-btozier-science-fiction-shelf-poem.jpg
    title: Science Fiction Shelf Poem
    alt: A shelf of books, their spines making a poem (described in text). There is a small wind-up robot falling across the tops of the books
    description: Inkjet print, approximately 36\" × 12\"
~~~

The big change this year is in how Galleries/Projects/Portfolio stuff is organized. Galleries have been turned into a Jekyll Collection, so live in `_galleries` with a `gallery-name.md` page for each one. The images live in `images/galleries/[size]/filename.jpg`, similar to the post images. `srcset` is generated just like the post images (at the same time, in fact), and shouldn't need to be meddled with.

The gallery page exists as a file-template in Jekyll. Look under `Packages > File Templates > New File from Template > gallery.md`

`date:` isn't used in Jekyll with Pages, but *I* use it to bring the gallery pages in the front page flow with the posts. New galleries will appear on the front page without me having to do stupid stuff. All the stupid stuff is pre-done ;)

The list of images appear on the page in the order that they show up in the list, and can have their alt-text (for screen reader descriptions) and description (material format of the image) entered here.

If you want to use a gallery image in a post, it's probably best to copy over the information from this list and then edit as needed when you call `_figures.html`

## Special CSS classes

I have been trying to stick with the classes available in `Bootstrap 4` as much as possible, but there are some special ones (mostly leftover, but still).

### asides

Asides are called using `{: .aside}` markup. Longer asides require div markup that starts something like `<div markdown="1">`. (The `kramdown` notation goes after the closing `</div>` They can appear anywhere within an article. The styling extends Bootstrap's `.card-block`.

### attention conservation notice

Goes at the top of longer articles. Called using `{: .acn}` The styling extends Bootstrap's `.card-block`.

### text box highlight

Sometimes I want a "code style" block to have wrapping. This was the way I managed to make it happen. It comes after the final tildes of a code block as `{: .text-highlight}`.

### other dribs and drabs

`{: .code-snippet}` is a way to on occasion center a small bit of text --- code, usually.
