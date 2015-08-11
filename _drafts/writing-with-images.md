---
layout: post
title: "Writing with Images"
excerpt: ""
tags: [lightroom, website, self-referential, photographs, jekyll]
date: 2015-08-11
---

wordy wordy
{: .acn}

{% include _toc.html %}


## Preamble

Now that I've got the [writing environment](/setting-up-for-writing/) and the [website environment](/making-a-portfolio/) worked out, now's the time to work on how I use Lightroom in conjunction with making posts.

I am actually pretty good with Lightroom --- at least in the capacity of knowing where my images are, how to develop them, and how to view them on screen and in print. I also have figured out some basic [Lightroom Publish Services](https://helpx.adobe.com/lightroom/help/export-hard-drive-using-publish.html) even though I no longer use online photo services such as Flickr.


## Lightroom Publishing _vs._ Exporting

"Publishing" in Lightroom is a strange thing, because it's not the same as "Exporting" an image. *Exporting* is a one-off sort of mechanism: you export an image to your hard drive, and then you can do other things with it (such as email it, edit it in another program, or upload it to Flickr or Tumblr or whatever). Lightroom doesn't know nor care what happens to that exported image.

*Published* images, on the other hand, are somewhat managed by Lightroom. Lightroom manages what's at the destination. So this means if you've set up a Flickr Publish connection, if you delete an image from that collection in your Lightroom, Lightroom *will remove it* from Flickr. The first time this happened to me, I wasn't ready for it and it made me mad. Once I understood what was going on, I grew to like it. I now use Publish connections with several projects I'm doing that have continually updating images. It's fantastic to be able to edit images from within Lightroom and have them automatically update in my project folder.

Most of my Publish Services are hard drive based, so naturally I thought I'd be able to create a reasonable Publish Service for the photos I'd like to share here. It sounds great, doesn't it? I publish a photo, then if I edit it, it gets republished and automatically updated on my website. That's the theory, but the practice (as usual) is much different.


## File Name, file-name

First is the filename issue. I can tell Lightroom to name a picture almost anything on export/publish, but I want it to draw from information in the Lightroom database. One bit of info is the picture title. I do not title images already "web safe," _i.e._ with no spaces and all lowercase. Lightroom does not have the ability (as far as I've been able to find) to export or publish photos with web safe names, short of using *its own* web gallery system, which I don't for *reasons*.

Second is the filename issue. No, really. Lightroom *says* it will publish an updated picture if all you changed was the title, but it *won't*. Even if you make Develop changes or whatever, it *won't change the filename it gave the very first time it published it.* One of the many irritations with Lightroom, which seems like it'll be so nice until it isn't. I can sort of understand why it works this way (it doesn't want to break links on an external site), but it's not the way *I* want it to work.

So this means I can't directly publish my file to my Jekyll site folder, because I'll likely have to change the filename of the image anyway. [I've discussed this previously.](/more-shadow-texture/)

Anybody reading this must realize that I write to think things through.
{: .aside}


## Setting up the Service

OK, asides aside, I've decided to try using Publish Services to create three(!) versions of each _ad hoc_ photo. Three because I can then decide when I use them what would be the best for the post. I will still need to websafe-ify the names, and then move them into the appropriate folders. Why don't I just use an Export Preset? Well, mostly because I have a terrible memory. Which of these 15 export presets is the right one? Did I export that one Large or only Medium?

![Screenshot of Lightroom Publish Service Panel](/images/posts/ss/2015-08-11-collections.png)
{: .image-pull-right}

So while I'm not using the Publish Service as intended by God and Adobe, I have figured out a way to use the best parts of it. First, I created a Collection called `ad hoc on website` where I put the image(s) I want to share here. (This doesn't include screenshots which are even more *ad-hoc*ier.) Then, I made three Hard Drive Publish Services (each service can have only one group of settings 😦), with *Smart Collections* inside them. The Smart Collection sees what's in `ad hoc on website` and automatically brings it into itself. If it has never published it before, it says "New Photos to Publish" --- which indicates *to me* that I need to push the "Publish" button. How cool is that‽ I made three smart collections, one for each size, so all I have to do is push the Publish button. Three. Times. I hope one day to get a "Publish All" button, but I'm not holding my breath.

These three images (assuming I'm only adding one image to my post) go to a fixed place on my computer. I can rename and move them into their proper places, which by definition breaks the Publish link, but I don't care. Lightroom won't care, either. It won't notice that I've done something else with the image, it'll just think it's still there unless I tell it different.

## Using the Images

Whew! All that texty-text and I haven't even posted a photo. Here's a small one, linked to the large one.

[![White on White](/images/posts/s/2015-08-10-barbara-tozier-white-on-white.jpg)](/images/posts/l/2015-08-10-barbara-tozier-white-on-white.jpg "White on White")

That's not bad, but it seems a little... blah. I don't mean the image! 😉 It is currently styled however the original designer of this theme said `article img` should look.

<div class="aside" markdown="1">
Here is one of the perils of a slavish devotion to writing in Markdown (of any flavor). This is the code for the image above.

~~~
[![White on White](/images/posts/s/2015-08-10-barbara-tozier-white-on-white.jpg)](/images/posts/l/2015-08-10-barbara-tozier-white-on-white.jpg "White on White")
~~~
{: .text-highlight}

I suppose I could write some sort of automagical liquid thing that would make it a bit easier? I dunno.
</div>

I think the "small" image will work if I have several on a page, because I don't want to overwhelm anyone, least of all myself, when I look at this online or in my RSS reader. I think I still need to figure out a nice style for it, because just sitting there on the left is kind of boring.


## The Overthinking

The third size (Medium) I think will be for images that will stand on their own. And now I realize that by having everything be the same name, I should put them in different folders... Hrm. The way my site is set up right now, there's a folder for post images: `images/posts` and post thumbnail images: `images/posts/th` with no place for a third size (with the same name). But I *like* having them the same name, so I suppose I need a third folder. And --- likely overthinking this --- perhaps I want to restructure this area entirely, say into `images/posts/small`, `images/posts/medium`, `images/posts/large` and maybe even `images/posts/screenshots`. Is this too much organization too soon? But if I do it now, when I have fewer than 20 images altogether, then I won't have to worry about it later.

I'm not going to change the way I do the galleries, except maybe make the thumbnails bigger than what they are now. That won't be restructured. Actually, this brings home to me how *prescient* I was to separate out the galleries in the first place. Go me!

Excuse me for a while as I go off to make a new git-branch to take care of this restructure.

`<time passes`
{: .center}

OMG how cool was that! You can't see what I did, unless you go to my [GitHub repository](https://github.com/logista/btsite2015) and poke around [this pull request](https://github.com/logista/btsite2015/pull/64). I'm really liking this branch-off-to-do-a-thing capability in git. I'm still just a neophyte, but I think I'm starting to get the hang of it.

## Back to Images

Ok, so that distraction is taken care of, and I can put my medium sized image in the proper folder, and post it here:

![White on White](/images/posts/m/2015-08-10-barbara-tozier-white-on-white.jpg)
{: .center}

This one I did *not* link to a large version. I think I kind of like that distinction. A small image you can look at closer if you'd like, and a medium-sized image stands on its own. Since it's nearly as wide as the text column (depending on the size of the window, of course), I'll center it and call it done.

Now I'm left with figuring out how to make a small image pretty. With screenshots I use an `.image-pull-right` class to float them to the right. Medium images use a `.center` class. Large images are hidden until called for by the slideshow.

The Jekyll template as written includes some markup and CSS for the HTML5 `<figure>` element, but to use it I have to remember the actual markup. Recall that I have a "slavish devotion" to Markdown, so that's not really going to happen. Plus, I don't really care about the semantics of the page (sorry, librarian and archivist friends!). Therefore, I'm going to just use `<img>` until I can't anymore.[^1]

[^1]: I have been informed there is also an `<aside>` element, and I don't care. I'm old and stuck in my ways.

But how to style a small image? If there's one, I suppose I could center it, and two could be side-by-side.

Let's see:

![White on White](/images/posts/s/2015-08-10-barbara-tozier-white-on-white.jpg)  
One centered small image
{: .center}

that (at the moment of writing) has a caption that is just some words that follow the image with a line break in between. The whole thing has a `.center` class attached to it.

Here are two small images:

![White on White](/images/posts/s/2015-08-10-barbara-tozier-white-on-white.jpg)![White on White](/images/posts/s/2015-08-10-barbara-tozier-white-on-white.jpg)  
Two small images, not centered or anything.

They are snugged up to each other, either side-by-side or top/bottom depending on how wide the window is. Ick. Time to do some design work...
