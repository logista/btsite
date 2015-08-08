Most "posts" are going to be text-related with or without photographs.

I am unclear on what needs quote marks (either double or single) and what doesn't. As far as I can tell, YAML doesn't care. The important part is for the Jekyll parser to understand it. I'm writing this little file to remind myself to be consistent.

## Text posts

Here's a big yaml header for a text-only post:

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

**IT IS REQUIRED** to include `layout:`. I could set a `default` in Jekyll, but I want to get used to adding it (in the event I make a different layout for images, for instance), so I won't. Since this is only ever used internally, it doesn't need quote marks.

**IT IS REQUIRED** to include `title:`. No quotes around the title, no matter how short. If using quote marks *within* the title, be sure to use `'single quotes'`.

**IT IS REQUIRED** to include an excerpt, because I don't like/trust Jekyll to do it the way I want. Mostly this can be the first sentence of the first paragraph, or a super-brief logline for the post. Syntax similar to `title:`

`tags:` are not required, they're only used in the HTML header for SEO purposes, as if that mattered. They are a comma-delimited list, inside of brackets. `Two or more word items` do not seem to need quotes.

**IT IS REQUIRED** to date the post, because Jekyll will always default to the filename and I hope one day that we won't have to have filenames with dates in them.  Since I don't expect to post more than once a day, setting `date:` to the day level (without a time) should be enough. If I get antsy, I can always add the time in ad hoc.

`modified:` is only for a "big enough" change. Minor typo changes (and the stuff associated with revamping the YAML frontmatter) doesn't get it.

## Pages
