---
layout: post
title: "Making a Portfolio in Jekyll"
excerpt: "A very long explanation of a (nearly brute force) way to present a portfolio in Jekyll."
tags: [jekyll, photography, portfolio, workflow, design, programming]
date: 2015-08-10
---

A large number of words to explain (at probably not the right level of detail for *any* reader) how I manage to show my portfolio on a Jekyll-powered website. Skip it if you don't use Jekyll.
{: .acn}

{% include _toc.html %}


## Preamble

[Jekyll][5a4cab1f] is a maturing static website generator, pretty smart and sophisticated, but generally easy enough for a relatively tech-savvy person to get up and running. That is not to say it's not without its issues. Primary is the deplorable state of the documentation. The documentation is written for people who have grown up with Jekyll and with Ruby, who already have some idea of what they're looking for. There's no search button, for instance, and the maintainers have a slavish devotion to DRY (Don't Repeat Yourself) so there is little to no explanation on *x* if you happen to be reading about *y* that depends on *x*.

  [5a4cab1f]: http://jekyllrb.com "Jekyll Website"

But that's neither here nor there. Jekyll has a facility called "Collections" that I thought would work for my portfolio, which consists of galleries of images grouped by project or theme. However, I can't quite seem to figure them out, no matter [how much][909e7040] I read about it.

  [909e7040]: http://ben.balter.com/2015/02/20/jekyll-collections/ "Ben Balter"

However, I do kind of understand the `_data` file. It's simply a list of related items, formatted in a way that is supposed to make sense to the user. If the user feels like a computer that expects lists to be sorted and marked up in a particular way. 😉 (You know, for somebody who isn't a coder, I do a lot of playing around with code-like things.)

All this preamble to get to the point... which is something I forgot.

`<time passes>`
{: .center}

Right. So I picked out a Jekyll theme called "Minimal Mistakes" which in itself doesn't have a way to do a portfolio. That's ok, because it takes care of other stuff that I don't want to deal with, like responsiveness to different screen dimensions.


## Design Considerations

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

This snippet of my `gallerylist.yml` file first gives the name of the gallery (`gallery-elemental`) which matches the name of the folder on the site. Each gallery I have (and I can have from 1 to as many as I can stand to create) uses a similar format. There's nothing special about the `gallery-` prefix --- I make it part of the name of the gallery folders simply so they get grouped together in my directory listing. The first line after the name of the gallery is its `title:`. This is the same as the title I've given the gallery on its own `index.md` page (more on that later) because I'm too lazy to figure out how to only type it once. *This* title is used on the `Portfolio` index page, the one that is accessible from the top navigation bar. It was just easier to find and use it this way.

After the title, we have a list of images, each with a filename and title. I have Lightroom set up to export the large and the small images to separate folders on my hard drive, but with the same names. (The filename is created by Lightroom, and then massaged with a little Automator action to make sure it's web-friendly.) I double-check that each image filename matches between the large and the small images, and then move them into my Jekyll folder. The large image folder is named `gallery-xxxx`, the small image folder is put *into* `gallery-xxxx` and renamed `th`. Then I create a new gallery `index.html` and put it in the same `gallery-xxxx` folder.

Here's a rough idea of the directory structure:

~~~
my-site |  
        | - gallery-elemental  
          | - 01-barbara-tozier-tetrahedron-fire.jpg  
          | - 02-barbara-tozier-cube-stone.jpg  
          | - <etc>  
          | - th  
            | - 01-barbara-tozier-tetrahedron-fire.jpg  
            | - 02-barbara-tozier-cube-stone.jpg  
            | - <etc>  
          | - index.md  
~~~


## The Gallery Index Page

The Gallery Index page is a YAML + Markdown document that is later converted to HTML by Jekyll. Here's what the front matter looks like:

{% highlight yaml %}
---
layout: gallerypage
gallery: gallery-elemental
title: "West and East"
excerpt: "Western mathematical beauty meets Eastern process"
tags: [photograph, abstract, color, digital, fine art, close up, 3D, platonic solids]
date: 2015-08-01
---
{% endhighlight %}

At a minimum, the body of the file looks like:

`{% raw %}{% include _gallery.html %}{% endraw %}`
{: .center}

but I can include more information if I'd like, and it will become part of the gallery page. So for this particular gallery, I have a little bit of explanatory text that describes the ideas behind the project.

~~~
This project combines a Western idea of "mathematical beauty" with an Eastern idea of Process. Specifically, it blends Platonic Solids (tetrahedron, cube, octahedron, dodecahedron, icosahedron) and the Wu Xing (five elements or phases -- wood, fire, earth, metal, water).
{: .acn}
~~~
{: .text-highlight}

(`{: .acn}` is a class in my CSS that creates a special paragraph style. It's called `acn` because it is an "Attention Conservation Notice," introduced to me by a [friend](http://bactra.org/weblog/).)

## The `_gallery.html` include

The nice thing about templates: once you've identified a recurring bit of text or functionality, you can separate it out into its own file that you only have to write once. Easier to change, maintain, and use. Insert it on a page when you need it, ignore it when you don't.

Jekyll does this by using an "include" file. Include files typically do only one thing: fill out one part of a web page. For instance, that bit on the left of my page (as it exists today, 2015-08-10), is from an include called `_author-bio.html`. I only need to put the info in that page once, and it appears everywhere on my site that I ask for it to appear.

The gallery pages have a similar mini-template (a subroutine, if you're a programmer of a certain age) that reads the `gallerylist.yml` file and uses the information there to decide what to show on the `gallery-xxxx` page.

Here's the code:

{% highlight html %}
{% raw %}
{% for gallery in site.data.gallerylist %}
{% for image in gallery[1].images %}
{% if gallery[0] == page.gallery %}
<a href="{{ image.filename }}" title="{{ image.title}}"><img src="th/{{ image.filename }}"  class="thumbnail"></a>
{% endif %}
{% endfor %}
{% endfor %}
{% endraw %}
{% endhighlight %}

This is the "brute force" portion of the whole thing. Because it's my site, and I expect to only have a few galleries going at a time, *and* the site is generated here on my own computer before it's uploaded to the web... I'm willing to go with it. To quote [some](http://ronjeffries.com) [folks](http://www.hendricksonxp.com) I know, I'm doing the simplest thing that could possibly work. In my case, this is to get my [husband](http://williamtozier.com) to cobble a little program together for me in a few minutes.

Basically, this looks at `gallerylist.yml` and looks at everything in it to decide what to present on the page. The structure of the html there in the middle (the remainder are [liquid elements](https://github.com/Shopify/liquid/wiki/Liquid-for-Designers)) is why I make sure the name of the full-sized and thumbnail-sized images are the same.

The [Portfolio](/portfolio/) page is constructed using a similar logic, but since it's slightly different, it lives in the `portfolio/index.md` file.

But wait, there's more!


## Navigating between galleries

The last bit to having galleries is being able to navigate between them. Jekyll has built-in navigation between *posts*, but not between *pages*. So my husband made another little on-page program for me that handles this and references the pre-existing navigation styles. The logic for this lives in an include called `_gallery-nav.html` and I leave it as an exercise to the reader to find it in my [GitHub repository](https://github.com/logista/btsite2015) for this site.


## Conclusion

All in all, this system is rather flexible. As I add and remove galleries, I simply need to put the images into the proper places and then tell Jekyll about them. I don't need to worry about how to link to them and between them, because that's taken care of in the code written on the page.

Is it the most efficient way to do it from a programmer's point of view? I doubt it, but I don't really care. It works for me, I don't need to make sure I have extra programs available to my Jekyll install, and I kind of understand how it all goes together. That's good enough for me, and I hope if you've read this far you've found something useful.
