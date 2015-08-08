Most "posts" are going to be text-related with or without photographs.

I am unclear on what needs quote marks (either double or single) and what doesn't. As far as I can tell, YAML doesn't care. The important part is for the Jekyll parser to understand it. I'm writing this little file to remind myself to be consistent.

## YAML headers

### Text posts

Here's a big yaml header for a text-only post:

~~~ yaml
---
layout: post
title: YANS
excerpt: Another summer, another new website
tags: [self-referential, website, workflow]
date: 2015-08-01
modified: 2015-08-04
---
~~~

**IT IS REQUIRED** to include `layout:`. I could set a `default` in Jekyll, but I want to get used to adding it (in the event I make a different layout for images, for instance), so I won't. Since this is only ever used internally, it doesn't need quote marks.

**IT IS REQUIRED** to include `title:`. No quotes around the title, no matter how short. If using quote marks *within* the title, be sure to use `'single quotes'`. Ah, and if there are backticks in the title (like, for `jekyll` or `atom`), you have to double quote the whole thing.

**IT IS REQUIRED** to include an excerpt, because I don't like/trust Jekyll to do it the way I want. Mostly this can be the first sentence of the first paragraph, or a super-brief logline for the post. Syntax similar to `title:`

`tags:` are not required, they're only used in the HTML header for SEO purposes, as if that mattered. They are a comma-delimited list, inside of brackets. `Two or more word items` do not seem to need quotes.

**IT IS REQUIRED** to date the post, because Jekyll will always default to the filename and I hope one day that we won't have to have filenames with dates in them.  Since I don't expect to post more than once a day, setting `date:` to the day level (without a time) should be enough. If I get antsy, I can always add the time in ad hoc.

`modified:` is only for a "big enough" change. Minor typo changes (and the stuff associated with revamping the YAML frontmatter) doesn't get it.



### Image posts

~~~ yaml
---
layout: post
title: Textures for Fun
excerpt: Since I call myself a photographer, I suppose I should try to include some images in my posts.
tags: [photograph, texture, orange, gray]
date: 2015-08-03
modified: 2015-08-04
---
~~~

For now, I'm using the same layout for text-based and picture-based (and quote-based) posts. This may change, because I'm currently having to do lots of extra stuff to get images into a post. This includes creating a thumbnail for an image so too-large images don't overwhelm my RSS feed. This doesn't have a good resolution yet --- I need to make some more posts with images to get a feel for how I want to work with them in the future.



### Pages

~~~ yaml
---
layout: gallerypage
title: Stories
gallery: gallery-stories
excerpt: Words and pictures, pictures and words.
tags: [photograph, abstract, color, digital, fine art, close up, books, stories]
date: 2015-08-01
---
~~~

Most Pages are galleries. However, the "no quotes" thing seems to be suitable. Follow the guidelines from above.

`date:` isn't used in Jekyll with Pages, but I now realize it might be a good thing to have for keeping track of when things have been changed. So I'm including it.

The images in the galleries are 300px thumbnails, linking to a larger (1500px) copy used for the slideshow. They are listed in `_data/gallerylist.yml` in the order they are to appear on the page. A single "feature" image is also noted --- this is the image used to represent the gallery on the Portfolio Index page.
