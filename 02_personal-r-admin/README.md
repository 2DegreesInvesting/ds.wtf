
# Installing R packages

### Before we start

Reproduce my computing environment:

``` bash
docker run --rm -d \
  -e PASSWORD=123 \
  -p 8787:8787 \
  -v $(pwd):/home/rstudio/ds.wtf \
  rocker/verse
```

Packages

``` r
library(usethis)
library(devtools)
library(gitcreds)
library(gh)
```

### Understand the defaults

``` r
install.packages("r2dii.data")
```

The message informs where your packages come from and go to by default:

> Installing package into …

> trying URL …

Reproduce the default behavior with explicit arguments:

``` r
install.packages(
  "r2dii.data", 
  lib = "/usr/local/lib/R/____________", 
  repos = "https://packagemanager.rstudio.com/___________________/latest"
)
```

See also `?install.packages()`.

### Control where packages come from

#### From RStudio’s package manager

Set up: <https://packagemanager.rstudio.com/client/#/repos/1/overview>

Example:

``` r
# install.packages("usethis")
# usethis::edit_r_profile("project")

options(repos = c(REPO_NAME = "https://packagemanager.rstudio.com/all/__linux__/focal/latest"))
```

> Only put things in your .Rprofile that you run interactively in the R
> terminal. If it ever appears in a R script or R Markdown file it
> should not be in your .Rprofile. –
> <https://rstats.wtf/r-startup.html#reproducibility>

! Restart R.

``` r
options("repos")
```

#### From a public GitHub repository

``` r
# install.packages("devtools")
devtools::install_github("2DegreesInvesting/r2dii.data")
```

#### From a private GitHub repository

``` r
# Fails
devtools::install_github("2DegreesInvesting/pastax.data")
```

[Managing Git(Hub)
Credentials](https://usethis.r-lib.org/articles/git-credentials.html)

``` r
usethis::gh_token_help()

usethis::create_github_token()

# Set up your system to use the token you just created
gitcreds::gitcreds_set()

# Confirm
usethis::gh_token_help()
```

Retry, now using the GitHub token.

``` r
secret <- gh::gh_token()
devtools::install_github("2DegreesInvesting/pastax.data", auth_token = secret)
```

! Delete the demo token <https://github.com/settings/tokens>

### Control where your packages go to

#### To the default user library

In `?install.packages()` the argument `lib` “defaults to the first
element of `.libPaths()`”.

``` r
.libPaths()[[1]]
```

Study your default library.

``` r
browseURL(.libPaths()[[1]])
```

#### To a temporary library

You may do this to test a package and leave your system untouched.

``` r
devtools::install_github("2DegreesInvesting/r2dii.data", lib = tempdir())
```

Then use the version you want:

-   Using the development version:

``` r
library(here, lib.loc = tempdir())
packageVersion("r2dii.data")
```

``` r
detach("package:here")
```

-   Using the CRAN version:

``` r
library(here)
packageVersion("r2dii.data")
```

#### To a custom user library

The default user library is controlled via the environmnt variable
`R_LIBS_USER`.

``` r
Sys.getenv("R_LIBS_USER")
```

Use a custom library:

``` bash
# usethis::edit_r_environ("project")
R_LIBS_USER="~/R/custom-lib/%v"
```

The directory must exist.

``` r
dir.create(Sys.getenv("R_LIBS_USER"), recursive = TRUE)
```

The default `lib` is the fist one. See `?install.packages()` .

``` r
.libPaths()
```

Push your user library to the front.

``` r
# usethis::edit_r_profile("project")
.libPaths(Sys.getenv("R_LIBS_USER"))
```

! Restart R.

Confirm.

``` r
.libPaths()
```

Install new packages.

``` r
install.packages("r2dii.data")
```
