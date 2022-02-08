
``` r
library(fs)
library(here)
#> here() starts at /home/mauro/git/ds.wtf
```

## [Saving source and blank slates](https://rstats.wtf/save-source.html#save-source)

### [Always start R with a blank slate](https://rstats.wtf/save-source.html#always-start-r-with-a-blank-slate)

-   Don’t reload the workspace from an .Rdata file.
-   Don’t save the workspace to an .Rdata file.

<img src="https://i.imgur.com/Z3r3e2V.png" align="center" height = 550 />

### [Restart R often (Ctrl+Shift+F10)](https://rstats.wtf/save-source.html#restart-r-often-during-development)

Other useful shortcuts:

-   In .R:

    -   Run selected line: Ctrl+Enter
    -   Run all code above: Ctrl+Alt+B
    -   Run all code: Ctrl+Shift+Enter

In .Rmd:

<img src=https://i.imgur.com/tRoHK69.png width=300>

### [What’s wrong with `rm(list = ls())`](https://rstats.wtf/save-source.html#rm-list-ls)

-   Problem: It makes your script vulnerable to hidden dependencies.
-   Solution: Write every script assuming it will be run in a fresh R
    process.

Details:

-   It only deletes user-created objects from the global workspace, but

-   Other changes persist invisibly and can have profound effects, e.g.:

    -   Packages that have ever been attached via `library()` are still
        available.
    -   Options that have been set to non-default values remain that
        way.
    -   The working directory is not affected.

## [Project-oriented workflow](https://rstats.wtf/project-oriented-workflow.html)

What if you want to shift focus from project A to project B, or have
both open?

### [We need to talk about `setwd("path/that/only/works/on/my/machine")`](https://rstats.wtf/project-oriented-workflow.html#setwd)

Bad

``` r
library(ggplot2)
setwd("/Users/jenny/cuddly_broccoli/verbose_funicular/foofy/data")
df <- read.delim("raw_foofy_data.csv")
p <- ggplot(df, aes(x, y)) + geom_point()
ggsave("../figs/foofy_scatterplot.png")
```

A little less bad:

-   Call `setwd()` is at the very start of a file (obvious and
    predictable).
-   Set the working directory to the project’s root (not a
    subdirectory).
-   Build subsequent paths relative to the root.

``` r
setwd("/Users/jenny/cuddly_broccoli/verbose_funicular/foofy")

library(ggplot2)
df <- read.delim("data/raw_foofy_data.csv")
p <- ggplot(df, aes(x, y)) + geom_point()
ggsave("figs/foofy_scatterplot.png")
```

But wait! There is something good.

### [Organize work into projects](https://rstats.wtf/project-oriented-workflow.html#work-in-a-project)

To make your projects portable follow this convention:

-   A “project” folder contains all related files.
-   The working directory is set to it.
-   All paths are relative to it.

### [Use projects and the here package](https://rstats.wtf/safe-paths.html#use-projects-and-the-here-package)

<https://here.r-lib.org/>

Good.

``` r
library(ggplot2)
library(here)

df <- read.delim(here("data", "raw_foofy_data.csv"))
p <- ggplot(df, aes(x, y)) + geom_point()
ggsave(here("figs", "foofy_scatterplot.png"))
```

In .Rmd files the default working directory is odd and thus error prone.

``` r
source(path("01_holistic-workflow", "shortcuts.R"))
#> Warning in file(filename, "r", encoding = encoding): cannot open file
#> '01_holistic-workflow/shortcuts.R': No such file or directory
#> Error in file(filename, "r", encoding = encoding): cannot open the connection

# WAT?
getwd()
#> [1] "/home/mauro/git/ds.wtf/01_holistic-workflow"
path_abs("01_holistic-workflow", "shortcuts.R")
#> /home/mauro/git/ds.wtf/01_holistic-workflow/shortcuts.R/01_holistic-workflow
```

<img src=https://i.imgur.com/UEOpACV.png width=400>

`here()` makes your paths relative to the project root (conventional).

``` r
here("01_holistic-workflow", "shortcuts.R")
#> [1] "/home/mauro/git/ds.wtf/01_holistic-workflow/shortcuts.R"
source(here("01_holistic-workflow", "shortcuts.R"), echo = TRUE)
#> 
#> > 1
#> [1] 1
#> 
#> > 2
#> [1] 2
#> 
#> > 3
#> [1] 3
```

### [IDE support for projects](https://rstats.wtf/project-oriented-workflow.html#ide-support-for-projects)

An IDE supports projects helps you do these things:

-   Launch the IDE in project A.
-   Switch from project A to project B.
-   Have both project A and project B open and running independent R
    sessions.

And when opening a project you IDE (e.g. RStudio) does this
automatically:

-   Restart R.
-   Set the working directory to the root.
-   Restore open files.

### [Tricks for opening Projects](https://rstats.wtf/project-oriented-workflow.html#tricks-for-opening-projects)

-   Have a dedicated folder for your Projects.

``` r
project_folders <- "/home/mauro/git"
project_pattern <- "[.]Rproj"

project_files <- dir_ls(project_folders, regexp = project_pattern, recurse = TRUE)
head(project_files)
#> /home/mauro/git/2degreesinvesting.github.io/2degreesinvesting.github.io.Rproj
#> /home/mauro/git/PACTA_analysis/PACTA_analysis.Rproj
#> /home/mauro/git/ReLTER/ReLTER.Rproj
#> /home/mauro/git/ST-App/ST-App.Rproj
#> /home/mauro/git/adminApp/adminApp.Rproj
#> /home/mauro/git/allodb/allodb.Rproj
```

-   RStudio knows about recently used Projects.

<img src=https://i.imgur.com/BR4V1M0.png width=300>

-   Find and Launch Projects with dedicated software.

<img src=https://i.imgur.com/AGoKfEI.png width=700>

## [How to name files](https://rstats.wtf/how-to-name-files.html)

<img src=https://i.imgur.com/zCwppDN.png width=400>

Principles:

-   Machine readable.
-   Human readable.
-   Plays well with default ordering.

Awesome:

<img src=https://i.imgur.com/dRN5zSd.png width=400>

## Organizing your project: [API for an analysis](https://rstats.wtf/api-for-an-analysis.html)

Code:

<img src=https://i.imgur.com/nbpjCrF.png width=700>

Inputs and outputs:

<img src=https://i.imgur.com/HkIcLQc.png width=700>

Summary:

<img src=https://i.imgur.com/rAThdu1.png width=700>

### [Objects that take a long time to create](https://rstats.wtf/save-source.html#objects-that-take-a-long-time-to-create)

Isolate each computationally demanding step in its own script:

-   Write the precious object to file with

``` r
saveRDS(my_precious, here("results", "my_precious.rds"))
```

-   Then do downstream work that reloads the precious object

``` r
via my_precious <- readRDS(here("results", "my_precious.rds"))
```

### [Automated workflows](https://rstats.wtf/save-source.html#automated-workflows)

If running multiple scripts from a “controller”, run each in its own R
session.:

-   Use the callr package to `source()` each .R file, or
-   Use `render()` to render each .Rmd in its own R session, or
-   Use the [targets](https://books.ropensci.org/targets/) package
    (search for [ds-incubator
    meetups](https://youtube.com/playlist?list=PLvgdJdJDL-APbB315sB3Lv_2VP2g0ioFO)
    about targets).
