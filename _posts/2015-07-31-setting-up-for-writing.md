---
layout: post
title: 'Setting up *for* Academic Writing'
excerpt: 'To get Pixie (my laptop) ready for academic editing work, I need to get it setup more like Pig (my desktop).'
---

{% include _toc.html %}

## Preamble

To get Pixie (my laptop) ready for academic editing work, I need to get it setup more like Pig (my desktop). I expect to keep a reference library in BibDesk, edit everything in a text editor, and use some flavor of Markdown (in this case, Pandoc-Markdown). Eventually I expect to use git (GitHub) to track changes in my files.

## Software

Some things that I already have installed on each computer:

1. [GitHub for Mac][49bec0d3] (not sure yet how I'm going to use this, but...)
2. [DropBox][3962a1ed]
3. [BibDesk][66160a76][^1]

  [66160a76]: http://bibdesk.sourceforge.net "BibDesk sourceforge site (when it works)"
  [49bec0d3]: https://mac.github.com "Download page"
  [3962a1ed]: https://db.tt/NZ8aQjx "My referral link to DropBox"
  [^1]: not on Pixie, but I don't need it there. The `.bib` file is in my DropBox

Next comes the downloads:

1. download and install [Pandoc][18c5ad05]
2. download and install [BasicTeX][526259f9]
3. download and install [Atom][c7c8ccee]

  [18c5ad05]: http://pandoc.org "pandoc site"
  [526259f9]: http://www.tug.org/mactex/morepackages.html "smaller MacTeX package"
  [c7c8ccee]: http://atom.io "atom website"

Note: installation of BasicTeX and Pandoc will require administrator privileges. I do not know if there are any other (command line type) requirements, because I've downloaded so much stuff for my computers over the years that I don't know what's relevant and what isn't.

Do not make any settings adjustments yet. [As far as I remember, no changes have to be made to either Pandoc or BasicTeX in order to get some basic functionality.]

### A digression

Atom is a new(ish) text editor, open-source and highly configurable. This is both a blessing and a curse. As an open-source project backed by GitHub, it's pretty popular and likely to stick around a while. (I previously used TextMate and Sublime Text and Text Wrangler and they each have their plusses and minuses.)

Atom's extensibility, however, means there are lots of ways of doing similar things, not all of which are exactly what you're looking for. However, that's neither here nor there. Let's move on.

Atom has a nice package manager, once you get used to it. For the type of writing I'm doing, I need minimal-to-no support for the zillions of programming languages in existence -- basically I'm just looking for ways to connect my Markdown file to my BibDesk references and display the Markdown formatting in a reasonably sensible way.

Luckily, some people are ahead of me.

So where do I start? I first considered simply moving my Atom config files to DropBox, but I was concerned that I would have issues without already having the various packages installed. Then I thought about using [Atom Sync Settings][1c348e8e]. I think in the end I will set this up so that my settings are in sync between the two computers, but I wanted to step through the setup all again just to be sure I've got it. I did a lot of thrashing to get Pig setup, so I don't want to lose that memory. 😉

  [1c348e8e]: https://github.com/Hackafe/atom-sync-settings "GitHub page"


## Setting up Atom

This involves a few steps. First, open Atom and then open Settings. If you see the Welcome Guide, `Choose a Theme` and then `Open the theme picker` to expose the Settings pane. Start at the top panel, which is `Settings` (which includes `Core Settings` and `Editor Settings`). If you don't see the Welcome Guide, choose `Packages > Settings View > Open` or type `⌘,`.

The only things I've changed from default is I've turned on `Scroll Past End` and set the `Scroll Sensitivity` to 1. I also turn on `Soft Wrap` and `Zoom Font When Ctrl Scrolling`.

Next, the fun part -- Packages and Themes! I'm using the UI Theme `One Light` (part of the default download) with a Syntax Theme of `Pen Paper Coffee` that I downloaded from the offical site. Third-party Themes and Packages are downloaded via the `Install` panel. It's a bit clunky, but once everything is set up there's little need to revisit.

The separation of UI and Syntax themes makes a lot of sense. Why would I need to specify Every. Little. Thing. if I simply wanted to change up some colors?

Packages are where all the extended functionality comes from. It's super confusing, though, to figure out which ones will do what you want. I've downloaded five "Community Packages", of which three are really necessary to meet my requirements.

First, and for me most important is `autocomplete-bibtex`. This is the package that looks at your (already existing) `.bib` file and helps you write a proper Pandoc citation. Setting it up was confusing, because the [documentation at Atom.io][e32a3e5b] doesn't quite match what's actually in Atom. However, with some putzing about, I managed to get it to see my `.bib` file! 😀

  [e32a3e5b]: https://atom.io/packages/autocomplete-bibtex "Atom.io package page"

Here's how:

1. Install `autocomplete-bibtex`
2. Go to `Settings` and then `Packages` and `autocomplete-bibtex` `Settings`
3. Type in the FULL PATH to your BibTeX file (I keep mine in Dropbox, so it's the same path from either computer)
4. Go to `Settings` and then `Packages` and `autocomplete-plus` `Settings`
5. [this is where I get confused] `autocomplete-bibtex` suggests setting `autocomplete-plus` `File Blacklist` to `.*`. By accident/trial I set the `Scope Blacklist` to `.md` and it worked. I also deleted all changes to `autocomplete-plus` and it still works. So try it, I guess, and hope for the best?

To continue with the rest of the setup:

1. By default, Atom makes Markdown documents into GitHub Flavored Markdown. I want Pandoc Markdown, so I installed the `language-pfm` package.
2. In order to override the GitHub Flavored Markdown, you need to disable `language-gfm` that comes with Atom. As far as I can tell, there is no real consequence to this.
3. For some nice Markdown-related tasks (such as renumbering numbered lists), I've installed `Markdown-writer`. In the future (once I get my static 'blogging-not-blogging' site set up) this will be very useful.
4. To see a nicely rendered Pandoc-aware version of my document, I've installed `Markdown-preview-plus` (this takes a couple of minutes because it's installing MathJax).
5. Open the `Markdown-preview-plus` `Settings` and `Enable Pandoc Parser` and tell it the path to Pandoc. If you let Pandoc install wherever it wanted, this is likely `/usr/local/bin/pandoc`.
6. I haven't got `Pandoc Options: Citations` working yet, but that's for another day.
7. Disable the built-in `Markdown-preview`.
8. And finally, for fun, I've installed `autocomplete-emojis` because why not?

Now to test. Write a `testfile.md` and save it. Make sure there's a citation in it, say Jeff Wall, [-@wall2012conceptual], said **blah-di-blah** and that was that.

Open up `Terminal` and type

```
pandoc input.md -t latex --filter pandoc-citeproc --bibliography=ref.bib -o output.pdf
```

where `input.md`, `ref.bib`, and `output.pdf` are your own files (complete with paths).

What do you get?

`<...time passes...>`

Well, you get an error, because LaTeX doesn't know emoji!
