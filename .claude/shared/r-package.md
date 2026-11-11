<!-- Synced from pedrobtz/packages:claude/shared/r-package.md. Do not edit it
here: change it there, and the sync opens a pull request in every package. -->

# R package conventions

The commands, editing rules and testing conventions every package in this
portfolio shares. The package's own `CLAUDE.md` adds its own commands, helpers
and invariants, and wins where the two disagree.

## Commands

Run from the package root.

```sh
Rscript -e 'devtools::load_all()'                # compile src/ and load
Rscript -e 'devtools::document()'                # roxygen -> NAMESPACE, man/
Rscript -e 'devtools::test()'                    # full testthat suite
Rscript -e 'devtools::test(filter = "<name>")'   # one test file
Rscript -e 'devtools::test(shuffle = TRUE)'      # order independence
Rscript -e 'devtools::check()'                   # R CMD check
air format .                                     # format R sources
```

## Editing rules

- roxygen comments are the source. Never edit `man/` or `NAMESPACE` by hand.
- Edit `README.Rmd`, not the generated `README.md`.
- Keep prose simple and short. One idea per sentence.
- Wrap roxygen text at 80 characters and run `air format .` on R sources.
- Use `lower_snake_case`, and prefix internal native symbols with the
  package's own prefix.
- Keep hard runtime dependencies at zero unless a recorded design decision
  says otherwise.
- Export and document public functions. Do not create roxygen topics for
  internal ones.
- Never edit a file under `.claude/shared/`. It is synced from
  `pedrobtz/packages`, and a local edit is overwritten by the next sync.

## Testing conventions

- **Self-sufficient.** Every test builds its own inputs inside the
  `test_that()` block. No file-scope objects.
- **Self-contained.** Global state goes through `withr::local_*()`, randomised
  input through `withr::local_seed()`. Tests write only under `tempdir()`.
- **Assert on condition classes, never message text.** Use
  `expect_error(..., class = "<pkg>_<kind>_error")`. Wording belongs in
  snapshot tests.
- **Order independence.** `devtools::test(shuffle = TRUE)` is part of the
  definition of done.
- **Borrow a conformance suite before writing one.** Mainstream
  implementations in Python, Java, Go or Node usually ship a test corpus.
  Use it as an oracle rather than inventing cases by hand.
- **Helpers live in `tests/testthat/helper-*.R`.**
- **Keep the suite inside the CRAN time budget.**

## Keep scratch out of the tarball

`R CMD build` reads `.Rbuildignore`, not `.gitignore`. It must list
`^\.agents$`, `^\.superpowers$` (the Superpowers task ledger), `^\.worktrees$`
(if git worktrees are kept in the package directory; a sibling directory
avoids the question), `^\.claude$`, `^CLAUDE\.md$`, `^AGENTS\.md$`,
`^CRAN-SUBMISSION$` and `^cran-comments\.md$`. A stray top-level file is a
NOTE, and the pretest archives on NOTEs.
