
The goal of this series it to build “holistic and project-oriented
workflows that address the most common sources of friction in data
analysis, outside of doing the statistical analysis itself”
(<https://rstats.wtf/>).

At the end of this series you will be able to do things like these:

-   Setup R to always start with a blank slate.
-   Understand why restarting R is better than `rm(list = ls())`.
-   Understand why a project-oriented workflow is better than `setwd()`.
-   Control R’s startup and manage sensitive information with .Rprofile
    and .Renviron.
-   Manage your R-package library through time, and across increasing
    versions of R.
-   Try a new R package from a temporary library, without changing your
    main library.
-   Debug code with `browser()` and friends.

## Who is the audience?

Verbatim from <https://rstats.wtf/>, the target learner:

-   Has a moderate amount of R and RStudio experience.
-   Is largely self-taught.
-   Suspects they have drifted into some idiosyncratic habits that may
    slow them down or make their work products more brittle.
-   Is interested in (re)designing their R lifestyle, to be more
    effective and more self-sufficient.

## Why is this important?

By addressing the main causes of friction your data analyses will become
faster, more effective, and more robust.

## Syllabus

### A holistic workflow

This meetup covers most topics from the section I, *A holistic
workflow*, of the book [What They Forgot to teach you about
R](https://rstats.wtf/).

Objectives:

-   Setup R to always start with a blank slate.
-   Understand why restarting R is better than `rm(list = ls())`.
-   Understand why a project-oriented workflow is better than `setwd()`.
-   Understand why the here package is useful, particularly for .Rmd
    documents.
-   Learn how to benefit from the IDE support for projects.
-   Name files so that they order nicely, and humans and machines can
    read them.
-   Organize you analysis inputs, outputs, and code sensibly.
-   Learn some tools to work with objects that take a long time to
    create.

### Installing R packages

This meetup covers controlling where your packages come from and go to.

Objectives:

-   Understand the default behavior of `install.packages()`.
-   Control where packages come from: RStudio’s package manager, and
    GitHub.
-   Control where packages go to: A default, temporary, and custom
    library.

### Debugging R code

This meetup covers selected topics form section III: All is fail. If
focuses on [debugging R code](https://rstats.wtf/debugging-r-code.html),
particularly long-running processes.

Objectives:

-   Locate the bug with `traceback()`.
-   Reduce the size of the problem with a binary search.
-   Reproduce the bug as simply as possible and share it with the
    package reprex.
-   Enter the debugger mode with a breakpoint or `browser()`.
-   Get feedback with `str()` and `message()`.
-   Navigate in debugger mode with the keyboard.
-   Step into deeper functions in a pipe with `debugonce()`.
-   Debug loops `on.exit(browser())` or `options(recover)`.
-   Discuss workflow strategies to iterate fast over slow processes.
    -   Self-contain the problem.
    -   Iterate as fast as possible: Reuse computations, reduce code and
        data.
    -   Get feedback.

## Resources

-   YouTube [playlist](https://bit.ly/ds-incubator-videos).
-   The
    [ds-incubator](https://github.com/2DegreesInvesting/ds-incubator#ds-incubator)
    project.
-   [Ideas](https://bit.ly/dsi-ideas) for future meetups.
-   [What they forgot to teach you about R (book)](https://rstats.wtf/).
-   Materials
    ([ds.wtf/releases](https://github.com/2DegreesInvesting/ds.wtf/releases)).
