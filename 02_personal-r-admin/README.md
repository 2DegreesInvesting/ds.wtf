
# Installing R packages

### Before we start

Reproduce my computing environment:

``` bash
docker-compose up
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

#### From a private GitHub repository ([demo](https://youtu.be/LvzljgPrsjg))

Fails

``` r
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

Still fails.

``` r
devtools::install_github("2DegreesInvesting/pastax.data")
```

`install_github()` needs the token.

``` r
secret <- gh::gh_token()
devtools::install_github("2DegreesInvesting/pastax.data", auth_token = secret)
```

`pkg_install()` from the [pak](https://pak.r-lib.org/) package is
cleverer.

``` r
# install.packages("pak")
pak::pkg_install("2DegreesInvesting/pastax.data)
```

### Control where your packages go to

`?.libPaths()`:

> `.libPaths` gets/sets the library trees within which packages are
> looked for.

For an in-depth explanation see the section Details of `?.libPaths()`.

#### To the default user library

`?install.packages()`:

> `lib`: If missing, defaults to the first element of `.libPahts()`.

``` r
.libPaths()[[1]]
```

Note the installed packages:

``` r
list.files(.libPaths()[[1]])
```

#### To a temporary library

You may do this to test a package and leave your system untouched.

``` r
pak::pkg_install("2DegreesInvesting/r2dii.data", tempdir())
```

Then use your temporary library in `library()`.

``` r
library(r2dii.data, tempdir())
```

#### To a project-specific library

> The [renv](https://rstudio.github.io/renv/) package helps you create
> reproducible environments for your R projects. –
> <https://rstudio.github.io/renv/>

``` r
.libPaths()

# install.packages("renv")
renv::init()    
```

Note the user library is now project-specific.

``` r
.libPaths()
```

#### To a custom user library ([demo](https://youtu.be/sbp5Q8niTho))

##### Via `.libPaths()`

``` r
# usethis::edit_r_profile()
new <- "custom-lib"
if (!dir.exists(new)) dir.create(new, recursive = TRUE)
.libPaths(new)
```

##### Via `R_LIBS_USER`

You can set a custom user library via the environment variable
`R_LIBS_USER`.

``` bash
# usethis::edit_r_environ("project")
R_LIBS_USER="~/R/custom-lib/%v"
```

``` r
Sys.getenv("R_LIBS_USER")
```

But it won’t be used unless the directory actually exists:

``` r
dir.exists(Sys.getenv("R_LIBS_USER"))
dir.create(Sys.getenv("R_LIBS_USER"), recursive = TRUE)
dir.exists(Sys.getenv("R_LIBS_USER"))
```

Remember the argument `lib` to `install.packages()` defaults to using
the first element of `.libPaths()`.

``` r
.libPaths()
```

Move your custom library to the front with `.libPaths()` itself.

Edit .Rprofile to use your custom library in every R session.

``` r
# usethis::edit_r_profile("project")
.libPaths(Sys.getenv("R_LIBS_USER"))
```

! Restart R.

Confirm.

``` r
.libPaths()
install.packages("r2dii.data")
```
