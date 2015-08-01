---
layout: post
title: 'Jekyll, Atom, Learning'
---

(alternate title) **Jekyll in Atom, or Explorations in a Foreign Language for which you only have the Slimmest of Guidebooks**

I am doing a bunch of different new things all at once, starting with learning the idiosyncrasies of a new text editor.

{% include _toc.html %}

## Spelling

For instance, I misspelled `idiosyncrasies` just then, but there's no spell check. Well, that's not true. There is, because I get a tiny dotted red line under the suspect word, but my standard contextual menu giving me my accustomed access to the system spell checker isn't available. So now I'm going off to see what packages there are that will let me use the speller I'd like to use.

`<time passes>`

---

OK. So it's using the system spell-checker, but giving me a yucky interface for it. Hrm. It appears there are [people requesting an improvement](https://github.com/atom/spell-check/issues/54) in this area.

## Configuration

### Conflicts

It seems as though just about everything in Atom is pluggable, and you can disable default packages in favor of one that works better for you. Unfortunately, sometimes the packages conflict, either in their expected behaviors or in their activation keys. This leads to some (currently minor, but we'll see) annoyances. For instance, to use `autocomplete-bibtex` with academic papers, I need to override the portion of `autocomplete-plus` that doesn't work in Markdown files. This is so `autocomplete-bibtex` can automatically make suggestions for citation entries. However, when I'm typing *prose* (like now), I get a "suggestion" for nearly every word I type.

The fix for this is to turn of the *automatic* suggestion in `autocomplete-plus` to only work when you type a smash-key of `shift-control-space`. Klunky.

### Documentation

I realize that I'm not exactly the target audience for this software -- it's intended to be used by people who write code for a living. But when confronted with an instruction to do something to configure a package "in the usual way" I tend to get cross.

For example, the could-be-so-lovely `jekyll` package includes a jekyll server! So you can develop locally from within Atom and check changes with the browser of your choice. Sure, you could open a `terminal` window, but this saves steps and typing! I was so excited to get it working on Pig (with some assistance from my husband), but I am unable to make it go on Pixie. I get an error

```
The Jekyll binary jekyll is not valid.
Please go into Settings and change it
```

WTF? Not exactly a clear statement of what is wrong, and what should I change "it" to?

`<time passes>`

OK. We've got it working, after a long period of "Huh?" and googling and typing things in `terminal`. Here's how:

1. For some reason my installation of Atom only sees my system `ruby` instead of the one in `rvm`.
2. But then I installed a script runner package (`atom-runner`) to check a few things, and then `jekyll` worked.
3. So I uninstalled `atom-runner` and restarted Atom and `jekyll` stopped working.
4. Reinstalled `atom-runner` and `jekyll` works again

The implication: `atom-runner` does something to my global Atom path that gets lost when it's taken away, and `jekyll` uses that. I don't think this is necessarily the fault of `jekyll` but I don't know how to fix Atom.
