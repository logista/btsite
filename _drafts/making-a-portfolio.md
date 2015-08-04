---
layout: post
title: "Making a Portfolio in Jekyll"
tags: jekyll, photography, portfolio, workflow
excerpt: "A (nearly brute force) way to present a portfolio in Jekyll"
---

{% include _toc.html %}

##Preamble

[Jekyll][5a4cab1f] is a maturing static website generator, pretty smart and sophisticated, but generally easy enough for a relatively tech-savvy person to get up and running. That is not to say it's not without its issues. Primary is the deplorable state of the documentation. The documentation is written for people who have grown up with Jekyll and with Ruby, who already have some idea of what they're looking for. There's no search button, for instance, and the maintainers have a slavish devotion to DRY (Don't Repeat Yourself) so there is little to no explanation on *x* if you happen to be reading about *y* that depends on *x*.

  [5a4cab1f]: http://jekyllrb.com "Jekyll Website"

But that's neither here nor there. Jekyll has a facility called "Collections" that I thought would work for my portfolio, which consists of galleries of images grouped by project or theme. However, I can't quite seem to figure them out, no matter [how much][909e7040] I read about it.

  [909e7040]: http://ben.balter.com/2015/02/20/jekyll-collections/ "Ben Balter"

However, I do kind of understand the `_data` file. It's simply a list of related items, formatted in a way that is supposed to make sense to the user. If the user feels like a computer that expects lists to be sorted and marked up in a particular way. 😉 (You know, for somebody who isn't a coder, I do a lot of playing around with code-like things.)

All this preamble to get to the point... which is something I forgot.

`<time passes>`

Right. So I picked out a Jekyll theme called "Minimal Mistakes" which in itself doesn't have a way to do a portfolio. That's ok, because it takes care of other stuff that I don't want to deal with, like responsiveness to different screen dimensions.

##Design Considerations

I knew from previous versions of my site that I wanted to have my portfolio galleries completely independent from each other, and completely independent from any "website" or "post/writing" images. This means I don't put my portfolio images in an `images` folder, but in a folder specific to a gallery. The way that I have Jekyll set up, each page of my site is actually held within a little folder with the post or page name on it.

![Segment of Site Structure](/images/posts/2015-08-04-screen-shot-site-structure.png)
{: .image-pull-right}

This means that I can have a folder for each gallery, and I can have it hold all of the images associated with that gallery. Yay! But now, how do I actually tell Jekyll about those images I put there, without having to type a new `index.html` every time I make a change?

Well, this is why computers.

## The `_data` File

With Jekyll you can say "I have this info that doesn't belong to a particular post, and I want it to be accessible in more than one place." Cue the `_data` folder and its associated `.yml` files.

{% highlight yaml %}
gallery-elemental:
  title: "West and East"
  images:
    - filename: "01-barbara-tozier-tetrahedron-fire.jpg"
      title: "Tetrahedron Fire"
    - filename: "02-barbara-tozier-cube-stone.jpg"
      title: "Cube Stone"
      feature: true
{% endhighlight %}

This snippet of my `gallerylist.yml` file first gives the name of the gallery (`gallery-elemental`) which matches the name of the folder on the site. Each gallery I have (and I can have from 1 to as many as I can stand to create) uses a similar format. They don't even need to have the `gallery-` prefix --- I include that simply so they get grouped together in my directory listing. The first line after the name of the gallery is its `title`. This is the same as the title I've given the gallery on its own `index.html` page (more on that later) because I'm to lazy to figure out how to only type it once. *This* title is used on the `Portfolio` index page, accessible from the top navigation bar. It was just easier to access it that way.

After the title, we have a list of images, each with a filename and title. I have Lightroom set up to export the large and the small images to separate folders on my hard drive, but with the same names. (The filename is created by Lightroom, and then massaged with a little Automator action to make sure it's web-friendly.) I double-check that each image filename matches between the large and the small images, and then move them into my Jekyll folder. The large image folder is named `gallery-xxxx`, the small image folder is put *into* `gallery-xxxx` and renamed `th`. Then I create a new gallery `index.html` and put it in the same `gallery-xxxx` folder.

## The Gallery Index Page

Here's what the frontmatter looks like:

{% highlight yaml %}
---
layout: gallerypage
title: West and East
gallery: gallery-elemental
excerpt: "Western mathematical beauty meets Eastern process"
tags: photograph, abstract, color, digital, fine art, close up, 3D, platonic solids
---
{% endhighlight %}

At a minimum, the body of the file looks like:

`{% raw %}{% include _gallery.html %}{% endraw %}`

but I can include more information if I'd like.

Aha. Another part of the path is that `_gallery.html` include.
