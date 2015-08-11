---
layout: post
title: "Writing with Images"
excerpt: ""
tags: [lightroom, website, self-referential, photographs, jekyll]
date: 2015-08-11
---

Now that I've got the [writing environment](/setting-up-for-writing/) and the [website environment](/making-a-portfolio/) worked out, now's the time to work on how I use Lightroom in conjunction with making posts.

I am actually pretty good with Lightroom --- at least in the capacity of knowing where my images are, how to develop them, and how to view them on screen and in print. I also have figured out some basic [Lightroom Publish Services](https://helpx.adobe.com/lightroom/help/export-hard-drive-using-publish.html) even though I no longer use online photo services such as Flickr.

"Publishing" in Lightroom is a strange thing, because it's not the same as "Exporting" an image. "Exporting" is a one-off sort of mechanism: you export an image to your hard drive, and then you can do other things with it (such as email it, edit it in another program, or upload it to Flickr or Tumblr or whatever). Lightroom doesn't know nor care what happens to that exported image.

*Published* images, on the other hand, are somewhat managed by Lightroom. Lightroom manages what's at the destination. So this means if you've set up a Flickr Publish connection, if you delete an image from that collection in your Lightroom, Lightroom will *remove it* from Flickr. The first time this happened to me, I wasn't ready for it and it made me mad. Once I understood what was going on, I grew to like it. I now use Publish connections with several projects I'm doing that have continually updating images. It's fantastic to be able to edit images from within Lightroom and have them automatically update in my project folder.

Most of my Publish Services are hard drive based, so naturally I thought I'd be able to create a reasonable Publish Service for the photos I'd like to share here. It sounds great, doesn't it? I publish a photo, then if I edit it, it gets republished and automatically updated on my website. That's the theory, but the practice (as usual) is much different.

First is the filename issue. I can tell Lightroom to name a picture almost anything on export/publish, but I want it to draw from information in the Lightroom database. One bit of info is the picture title. I do not title images already "web safe," _i.e._ with no spaces and all lowercase. Lightroom does not have the ability (as far as I've been able to find) to export or publish photos with web safe names, short of using *its own* web gallery system, which I don't for *reasons*.

So this means I can't directly publish my file to my Jekyll site folder, because I'll likely have to change the filename of the image anyway.

(An aside: anybody reading this must realize that I write to think things through.)
