---
layout: post
title: Build Errors using the `jekyll` package in Atom
excerpt: "`atom-runner` does something to my Atom environment that gets lost when it's taken away, and `jekyll` uses whatever it is."
tags: [website, jekyll, atom]
date: 2015-07-31
---

<!-- Writing this in preparation for opening an issue on the `jekyll` package. -->

**tl;dr:**  `atom-runner` does something to my Atom environment that gets lost when it's taken away, and `jekyll` uses whatever it is. I don't think this is necessarily the fault of `jekyll` but I'm not sure where else to report it.
{: .acn}

Caveat: I'm no coder.

- System: Mac OS X 10.10.4 [XCode not installed, though it may have been at one time]
- Atom: Version 1.0.2
- Jekyll: 1.0.0
- Atom-Runner: 2.4.1


1. For some reason I couldn't get `jekyll` to build my site.
2. I installed a script runner package (`atom-runner`) to check a few things from within Atom, and then `jekyll` worked.
3. So I uninstalled `atom-runner` and restarted Atom and `jekyll` stopped working.
4. Reinstalled `atom-runner` and `jekyll` works again

More details:

- Try 1
    - Install `jekyll`
    - Set Build Command to `jekyll, build, --drafts`
    - Start Server
    - Response: `Jekyll Binary Incorrect`
    - Build doesn't work, but server runs
- Try 2
    - Set Build Command to my explicit path (gotten from running `which jekyll` and copying it over)
    - Start Server
    - Response: `Jekyll site build failed!`
    - Build doesn't work, but server runs
- Try 3
    - Set Build Command to my explicit path, with `/gems/` replaced by `/wrappers/` (gotten from Issue #2)
    - Start Server
    - Response: `Jekyll Binary Incorrect`
    - Build doesn't work, but server runs
- Try 4
    - Install `atom-runner`
    - Start Server
    - Response: `Jekyll site build complete!`
    - Everything works, including `--drafts` and build-on-save
- Check
    - Disable `atom-runner`
    - Start Server
    - Response: `Jekyll site build complete!`
    - Everything works, including `--drafts` and build-on-save
    - RESTART ATOM
    - Start Server
    - Response: `Jekyll Binary Incorrect`
    - Reenable `atom-runner`
    - Start Server
    - Response: `Jekyll site build complete!`
