---
layout: post
title: "Image-in-Post Design"
excerpt: "A long document working through how I want images to be presented in posts."
tags: [self-referential, jekyll, images, planning]
date: 2015-08-12
---

{% include _toc.html %}

Sixteen hundred words, more or less, working through how I want images to be presented in posts. Sausage making at its most boring.
{: .acn}

## Cogitatin'

Let's start with one small image.

![White on White](/images/posts/s/2015-08-10-barbara-tozier-white-on-white.jpg)

It's left aligned, with whatever the `article img` markup CSS is (with some `p` added because Markdown).

I'm going to add some Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.... and then add the image *inline* ![White on White](/images/posts/s/2015-08-10-barbara-tozier-white-on-white.jpg) Wow, is that ever ugly. That's because an inline image is just thrown in there without any style.

Now, let's do it again: Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.... and then add the image *inline* ![White on White](/images/posts/s/2015-08-10-barbara-tozier-white-on-white.jpg){: .image-pull-right} and make it `.image-pull-right`.

Not bad unless it's the last paragraph of the post, in which it gets yucky.

I'm adding an `hr`

***

to break things up.

Let's stop for a moment and think about the kinds of images that will likely be in these posts.

1. Screenshots
2. In process photos of works (such as behind-the-scenes stuff)
3. Actual digital works
4. Digital photos of physical works
5. What else is there? I suppose I may put in examples of other people's work, especially if I am critiquing them or writing about them in some other way.

How much do I want to in advance (_i.e._ now)? Concurrent with all this cogitatin' I'm developing a posting guide for myself to remind myself of all the various doodads I've added to the CSS for various parts of this website.

Given how I've been working with Jekyll and GitHub, I'm thinking that I should probably do this now for whatever types of images I already have, and put off developing "systems" for other types of images and posts until I make that kind of post. Sounds like a plan!

Therefore, I need to deal with items **1** and **3** right now.

## Screenshots

I am mainly using screenshots to show the state of my (desktop) machine. So far they're pretty small, and I'm not doing any additional processing on them except for changing the filename. I don't have a fixed size for them --- I can imagine that some will be pretty big, but they aren't so far, so I'm not going to worry about it yet. It could well be that I won't use too many after I get past this technical setup stuff.

That said, I really dislike using positional class names, like `.image-pull-right` or `.center`. These feel... wrong, sort of like I'm eating an ear of corn the wrong way. It's not *really* wrong, but it feels weird.[^1] So I'm going to go right now and change the couple of screenshots I have to something made just for them.

[^1]: I nibble the ends clear so I have room for my fingers, then go mostly in rows from a cleared area.

Here's an example that I have put in it's own paragraph:

![Screenshot of Site Structure](/images/posts/ss/2015-08-04-screen-shot-site-structure.png){: .image-pull-right}

*As long as it is not at the end of the post it will work OK.* Floats are weird anyway, and I probably shouldn't use them as much as I do, I kinda like them.

Actually, no, I don't want to have to play around with figuring out how much more text I need to add to make the thing work right. I have gotten rid of the float (buh-bye!) and just centered the thing.

Let's try it inline: ![Screenshot of Site Structure](/images/posts/ss/2015-08-04-screen-shot-site-structure.png){: .image-ss} Is that interesting at all? Um... no.

So for my personal style sheet, "screenshot images" will be centered in their own block, mainly because I won't know how big any particular one will be. Here's the final look:

<figure class="image-ss">
  <img src="/images/posts/ss/2015-08-04-screen-shot-site-structure.png"/>
</figure>


## Actual digital works

I have more or less [settled](/writing-with-images/) on three sizes of "digital works" images --- only two of which will actually be "on" the page (the largest is in reserve to be called on by the slideshow).

### Large images

These are the *easiest* because most of the effort goes into making sure the link exists and points at the correct image. The title is part of the `gallerylist.yml` data file already, so the slideshow can pick it up. The slideshow ([Magnific Popup](https://github.com/dimsemenov/Magnific-Popup)) takes care of the rest.

### Medium images

The "medium" size image is about as big as my text column is, so I think I just need to center it in the space. Hmmm.. should I add the ability to have a caption?

Let's see.

Here's a medium-sized image:

![White on White](/images/posts/m/2015-08-10-barbara-tozier-white-on-white.jpg)

With no special classes involved. (It is in its own paragraph because I really don't care to have inline images.)

But I would really like to have a caption, at the very least to give the name of the image, especially for this size image that won't get linked to the larger size.

![White on White](/images/posts/m/2015-08-10-barbara-tozier-white-on-white.jpg)
White on White

If the browser window is wide, the text will go up next to the image, unless I remember to put a break after the image tag. I dunno. Maybe I should just go with the built-in `<figure>` markup.

<figure>
<img src="/images/posts/m/2015-08-10-barbara-tozier-white-on-white.jpg"/>
<figcaption>White on White</figcaption>
</figure>

Hm. It's ok, but it also feels weird because it's mixing explicit HTML in the markdown text. I don't know why it's ok for me to call out explicit styles using the kramdown markup, but not to type HTML. Plus the styling is all weird, and I'd have to go changing it around.

Well, after hours of messing about (after I realized I had only styled a horizontal image), I've given in and gone for a modified version of the `<figure>` HTML markup.

{% highlight html %}
<figure class="image-m">
  <img src="/images/posts/m/2015-08-10-barbara-tozier-white-on-white.jpg">
  <figcaption>
    <span class="image-m-caption">White on White</span>
    <span class="image-m-credit">Barbara Tozier</span>
  </figcaption>
</figure>
{% endhighlight %}

And here's the final image:

<figure class="image-m">
  <img src="/images/posts/m/2015-08-10-barbara-tozier-white-on-white.jpg">
  <figcaption>
    <span class="image-m-caption">White on White</span>
    <span class="image-m-credit">Barbara Tozier</span>
  </figcaption>
</figure>

<figure class="image-m">
    <img src="/images/posts/m/2015-02-15-barbara-tozier-frost.jpg">
    <figcaption>
      <span class="image-m-caption">Frost</span>
      <span class="image-m-credit">Barbara Tozier</span>
    </figcaption>
</figure>

I wish I'd remembered the vertical images about 6 hours ago. I thought I was nearly done!

### Small images

This is the issue that started this whole branch/post. Leaving a 300 pixel image just hanging out there wherever it falls (and they won't always be 300 wide, sometimes they'll be 300 tall) seems... ill-considered.

I have two options that I can think of right here at this moment: treat the small image like the medium image, and center it and make sure it has room for a caption; or, since I expect the small images to only ever link to a large image, ignore the caption and just plop the image down wherever. I'm inclined to that treatment. I might want to add some sort of indicator *saying* the image links to a larger one.

Let's see how that might go. First, let me go get a vertical image to play with, too. Ah, here it is:

<figure>
  <img src="/images/posts/s/2015-02-15-barbara-tozier-frost.jpg">
</figure>

<div class="aside" markdown="1">
Oh hey, that reminds me I should check vertical images in the medium-sized style, too.

Oooh, ick. Back shortly. (one step forward, one and a half steps back...) The problem I have is that my HTML/CSS knowledge is about 6 years out of date, plus using someone else's template, plus trying to add in the automated generation I get from Jekyll (and SASS) just adds a level of complexity.

And... now I'm going to try the figure markup again. Screw it. Figure markup it is. Even though it's ugly.

And now I've gone back and changed out the screenshot code to a `<figure>`-based one.
</div>

Let's add a horizontal one, too:

<figure>
  <img src="/images/posts/s/2015-08-10-barbara-tozier-white-on-white.jpg">
</figure>

Given all the hassle, I'm going to go straight to using the `<figure>` markup, with tweaks for smaller images.

Now, if I put two images together, I get:

<figure>
  <img src="/images/posts/s/2015-02-15-barbara-tozier-frost.jpg">
</figure>
<figure>
  <img src="/images/posts/s/2015-08-10-barbara-tozier-white-on-white.jpg">
</figure>

Right. As blah as I thought. Using the built-in `.half` class is even worse, because it increases the size the vertical image because it's *supposed* to take up half of the (horizontal) space.

<figure class="half">
  <img src="/images/posts/s/2015-08-10-barbara-tozier-white-on-white.jpg">
  <img src="/images/posts/s/2015-02-15-barbara-tozier-frost.jpg">
</figure>

I suppose the question I have to ask myself: am I going to put two small images right next to each other? Well... maybe?

<figure class="image-s">
  <img src="/images/posts/s/2015-02-15-barbara-tozier-frost.jpg">
  <img src="/images/posts/s/2015-08-10-barbara-tozier-white-on-white.jpg">
</figure>

<figure class="image-s">
  <img src="/images/posts/s/2015-02-15-barbara-tozier-frost.jpg">
  <img src="/images/posts/s/2015-02-15-barbara-tozier-frost.jpg">
</figure>

<figure class="image-s">
  <img src="/images/posts/s/2015-08-10-barbara-tozier-white-on-white.jpg">
  <img src="/images/posts/s/2015-08-10-barbara-tozier-white-on-white.jpg">
</figure>

It seems my markup is limited to two across. I could go three across with the vertical images, but changing the browser width causes too much jumping around.

However, it seems to work ok --- with some stupid CSS tricks, that is.

Last thing for this type of image: how to indicate the image links to a larger one?

<figure class="image-s">
  <a href="/images/posts/l/2015-02-15-barbara-tozier-frost.jpg" title="Frost"><img src="/images/posts/s/2015-02-15-barbara-tozier-frost.jpg"></a>
  <span class="image-s-caption">Click image to see larger</span>
</figure>

That's not too bad. Straight to the point, I think. I played around with coloring borders and so forth, but it just wasn't working for me. If I want to (on occasion) float any of these, I suppose I should just consider adding that style in when I want it.

Stick a fork in it, I think it's done! One of us is, at any rate.
