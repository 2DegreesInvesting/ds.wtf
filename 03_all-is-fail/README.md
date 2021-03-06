
# [Debugging R code](https://rstats.wtf/debugging-r-code.html)

-   Locate the bug with `traceback()`

-   Enter the debugger mode with a breakpoint or `browser()`

-   Navigate in debugger mode with the keyboard

-   Reduce the size of the problem with a binary search

-   Reproduce the bug as simply as possible and share it with the
    package reprex

-   Get feedback with `str()` and `message()`

-   Step into deeper functions in a pipe with `debugonce()`

-   Debug loops `on.exit(browser())` or `options(recover)`

### Discuss workflow strategies to iterate fast over slow processes

-   Self-contain the problem.

-   Iterate as fast as possible: Reuse computations, reduce code and
    data.

-   Get feedback.

### Takeaways

-   Be systematic. `traceback()` and a binary search can take you a long
    way.

-   Iterate as fast as possible: Reduce the code, computations, and
    data.

-   Learn how to use the debugger.
