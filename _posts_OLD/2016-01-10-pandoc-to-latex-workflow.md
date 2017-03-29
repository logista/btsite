---
layout: post
title: "Pandoc to LaTeX workflow for MLA-style"
excerpt: "A progress report on semi-automatic creation of an academic paper from a Markdown document"
tags: [workflow, academia, pandoc, latex, mla]
date: 2016-01-10
ogimage: ""
---

One thing I learned last semester was that my MLA-style paper wasn't really in MLA-style. It was close, and I wasn't *required* to make it MLA-style, but if I go further I need to be more careful about the formatting.

I decided to take the semester break to sort this out, and after many false starts and other procrastinations, I finally have something closer to what I want.

My idea is to write a paper in Markdown (in Atom), and then convert it to an MLA-style PDF using Pandoc's LaTeX tools. There are many, *many*, **many** posts talking about how to do this, and none have been completely sufficient for me. Therefore, I've made my own system (with the help of my husband, who has a ton more LaTeX experience than me).

The idea isn't much different from the [plan I had in July](/setting-up-for-writing/), but it is fleshed out a bit more, with additions especially to deal with the MLA idiosyncrasies.

Since I don't actually have a copy of any "official" MLA style guides, I'm working with the information created by [Purdue](https://owl.english.purdue.edu/owl/resource/747/1/). Thanks, Purdue!

First, download all the things. [Pandoc](http://pandoc.org) and `pandoc-citeproc` and [MacTeX](http://www.tug.org/mactex/morepackages.html) (or your favorite XeLaTeX source) to begin with. Then you need the [MLA citation file](https://github.com/citation-style-language/styles) which Pandoc uses to correctly format your citations. If you don't specify a citation style, you'll get Chicago style. Note that the Github repository for the cls styles is *huge*, so you may just want to find and copy the one(s) you're interested in rather than fork the whole repo. Here's a [link to the MLA one](https://raw.githubusercontent.com/citation-style-language/styles/7116881001d4e494c7f56140b177b99492255517/modern-language-association.csl).

While you're at Github, download the LaTeX file [mla13.sty](https://github.com/jackson13info/mla13). The instructions are aimed at someone who knows how to use LaTeX, and is doing stuff on the command line. However, the installation script will do a nice thing for you: it will put the `mla13.sty` file in a place where TeX can see it. At least it did for me...

Anyway, if you let `Pandoc` and `MacTeX` and `mla13.sty` go where they want, then all you have to do is put `mla.cls` where it needs to go. ("All you have to do," she says, as though she didn't spend hours trying to figure this stuff out.)

Here's where I've put everything:

* `pandoc` and `pandoc-citeproc` self-installed in `/usr/local/bin/` (To be honest, I think there was some `homebrew` stuff happening, but now I don't remember. Sorry.)
* `MacTeX` installed itself in `/Applications`
* `mla13.sty` created a directory `/Library/texmf/tex/` and put `mla13.sty` in it. (If it didn't create the directory, then make the directory for yourself and put the file in it.)
* I created a directory `~/.pandoc` and inside that are two directories: `cls` and `templates`
* In `~/.pandoc/cls/` is `modern-language-association.csl` (which I renamed to `mla.csl` because it's shorter).
* In `~/.pandoc/templates/` is the LaTeX template file I tell `pandoc` to look at, called `mla-template.tex`. I found one somewhere on the internet (sorry that I can't quite recall where) and edited it to suit me.
* In `atom` I have a paper-writing template with a bunch a boilerplate that I have stored using the `[File Templates](https://atom.io/packages/file-templates)` package.

We spent the afternoon editing various and sundry of these files trying to get the layout to look more like an MLA paper.[^intention] It works, mostly, but feels quite fragile --- particularly the bibliography stuff. Unfortunately, if I add math to a paper then it will also break. This system is currently for words only. I don't even know if it will work with an image.

[^intention]: I had the intention of making a little repository for these files, but until I figure out the symbolic link question, any benefit from version control will be lost due to me never actually updating the files in their locations.

Here's what needs to be done:

* symbolic links so I don't have everything hard-coded
* macro for invoking the `Pandoc` command in `Terminal`
* refactor the files so they make more sense
* get rid of the code in the body of my paper
* how do images look --- do they work at all?

---

However, not to leave everything hanging, here's my `File Template`

{% highlight yaml %}
---
firstname: myfirstname
lastname: mylastname
class: awesomeclass
title: awesometitle
professor: Prof.
date: dd Month yyyy
---

<write paper here>

% this converts footnotes into endnotes
\def\enotesize{\normalsize}
\renewcommand\enoteformat{\theenmark.~}
\makeendnotes

% this makes the Works Cited section use hanging indents
\noindent
\vspace{-2em}
\setlength{\parindent}{-0.25in}
\setlength{\leftskip}{0.25in}
\makeworkscited

{% endhighlight %}


To create the `tex` file (which you can then look over in `TeXShop`), in `Terminal` use this command (all on one line):

```
pandoc -s ThisPaper.md  --latex-engine=xelatex --bibliography=/full/path/to/bib.bib --template=mla-template.tex --csl=/full/path/to/mla.csl -o ThisPaper.tex
```{: .text-highlight}

Where you fill in the proper paths and the name of your document. If you want a `PDF` version, just replace `ThisPaper.tex` with `ThisPaper.pdf`


Once I figure out how to get my templates &c. into a working repository, I'll let you know.
