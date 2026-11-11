<!-- Synced from pedrobtz/packages:claude/shared/workflow.md. Do not edit it
here: change it there, and the sync opens a pull request in every package. -->

# Portfolio workflow

How every package in this portfolio is planned, versioned, reviewed and
released. Package-specific facts are in the package's own `CLAUDE.md`, which
wins where the two disagree.

## Stage tracking

Progress toward the next version is tracked as GitHub sub-issues, so the
parent issue shows a progress bar such as "6 of 7".

- **One parent issue per target version**, titled with the bare version, for
  example `v0.1.0`. The package's `CLAUDE.md` links the current one.
- **One sub-issue per roadmap stage**, titled as the roadmap titles it, for
  example `Stage 3 — R interface`, and linking to that section. The number of
  stages is whatever the roadmap has; there is no fixed scale.
- **Every tracking issue carries the `stage` label**, so it can be told apart
  from bug and feature issues and left out of open-issue counts.
- **Close a stage by merging its pull request.** Put `Closes #<n>` in the
  body of the stage's pull request. Never close a stage whose exit criteria
  are not met; record a deviation in the roadmap first.
- **The roadmap stays authoritative.** The issues record which stages are
  done, not what a stage requires. Adding, removing or renaming a stage
  means editing the roadmap and the sub-issues in the same change.
- **Each stage has a CI tier, `quick` or `full`.** The roadmap sets it, and
  `quick` is the default. See `ci.md` for what each means. The
  second-to-last stage, `Full CI`, runs the full set and fixes what it finds
  before `v0.1.0 readiness`.
- Close the parent issue when CRAN accepts the version. Opening a parent
  issue implies at least one stage sub-issue; a parent with no sub-issues
  shows no progress on the board.

## Versioning

A new package develops at `0.0.0.9000` and targets `0.1.0` for its first CRAN
release. Set `Version: 0.1.0` and the matching `NEWS.md` heading when the
package enters `Pre-flight`. The `.9000` bump after a submission arrives as a
pull request from `cran-release.yaml` (see Releasing to CRAN); merge it only
once CRAN accepts. A `.9000` version above an unreleased `0.1.0` heading is
wrong.

Until the first release the R API may change freely. Sibling packages can
still depend on this one before CRAN does, through `Remotes:` or `LinkingTo:`,
and the package's `CLAUDE.md` lists them. A change to a C API, a header in
`inst/include/` or a static archive breaks them even before 0.1.0. A package
that others wait on should reach CRAN first.

## Definition of done

`devtools::document()` and `devtools::check()` clean, meaning 0 errors, 0
warnings and 0 notes. The one allowed note is "New submission" before the first
release. `devtools::test(shuffle = TRUE)` green. CI green at the change's
tier: the quick profile for a `quick` roadmap stage or an ordinary pull
request, the full profile for a `full` stage, `Full CI`, and every release.
A user-facing change also needs a test, roxygen documentation and a `NEWS.md`
entry.

## Releasing to CRAN

- **CI is the pre-submission check.** The `pedrobtz/r-actions` R CMD check runs
  `--as-cran` on the CRAN-like runners and containers, and it replaces
  win-builder, the macOS builder and R-hub. None of them is a release step,
  and `cran-comments.md` lists the CI legs as its test environments.
- **Entering `Pre-flight`.** The roadmap's feature stages are done, the
  version is set as in Versioning, `NEWS.md` and `cran-comments.md` are
  written, and CI is green. Only submission work remains.
- **Before submitting,** run `pkg-critical-review` once the roadmap is
  implemented and fix what it files, then `pkg-cran-review`, and resolve
  every finding. Both skills are in `pedrobtz/r-skills`.
- **The pretest is automated and does not read `cran-comments.md`.** A NOTE
  that is explained but not fixed gets the upload archived. Fix the NOTE
  instead of justifying it.
- **Commit `CRAN-SUBMISSION` after submitting.** `devtools::submit_cran()`
  writes it with the submitted version and commit. It belongs in
  `.Rbuildignore`, never in `.gitignore`. The push runs `cran-release.yaml`,
  which tags that commit with the bare version (`0.1.0`, no `v`), publishes
  the GitHub release from the version's `NEWS.md` section, and opens the
  `.9000` bump pull request. A resubmission of the same version writes a new
  commit into the file, and committing it moves the tag.
- **After acceptance,** merge the bump pull request, then run
  `pkg-post-cran` for the rest: close the version's parent issue, open the
  next one, move the board card and open the six-week reminder.

## Commits and pull requests

Short, imperative, sentence-case commit subjects, optionally scoped. Keep each
commit focused and do not sweep in unrelated files. A pull request explains the
user-visible outcome and the rationale, links related issues, lists the checks
that were run and the tests that were skipped, and flags platform-sensitive or
vendored changes. Performance claims need evidence.

Open a pull request with its CI label, chosen from the table in `ci.md`
(Labels): `gh pr create --label ci:docs` for a prose-only change. An
unlabelled documentation pull request takes one runner per workflow to
learn that nothing runs.

Never commit or push to the default branch. Work on a branch, open a pull
request, and leave it for review. Do not merge a pull request unless you are
told to.

One pull request per batch of related work, not one per issue. Fixes found
by one review or one pass go on one branch, with a `Closes #<n>` line for
each issue. Split only what is large and independent of the rest. Every pull
request runs the quick CI set, and the account's runners are shared by every
package (see `ci.md`): six pull requests from one zuhttp pass, opened at once,
queued each other for hours, were cancelled for want of a macOS runner, and
conflicted in the test files they all touched. They were folded into one.

A cancelled check is not a passed one. Re-run it and wait; merge only when
every check passed or was skipped.

When you find a defect, in this package or in an upstream tool, open an issue
for it rather than only working around it.

## Working with skills

The portfolio's workflow skills live in `pedrobtz/r-skills` (`pkg-init`,
`pkg-roadmap`, `pkg-implement`, `pkg-assurance`, `pkg-bug-hunt`,
`pkg-critical-review`, `pkg-cran-review`, `pkg-post-cran`, `pkg-readme`); the
general process skills are [Superpowers](https://github.com/obra/superpowers).
`building-a-package.md` in `pedrobtz/packages` walks through them in order.
Both sets defer to these files where they overlap, so the settlements are
recorded here.

- **One design.** The specification is `.agents/design.md`, adopted from the
  package's RFC in `pedrobtz/packages/rfcs`. A package with an adopted design
  is past `brainstorming`; a design change goes through the RFC, not a new
  spec. Superpowers' default `docs/superpowers/specs/` is not used.
- **Plans at two levels.** `.agents/roadmap.md` holds the stages, one
  mergeable pull request each, with exit criteria, a CI tier and a
  `**Tests.**` list: each behaviour the stage adds, the oracle that knows its
  answer and the test file (`pkg-roadmap`). Inside a stage, `writing-plans`
  breaks the work into tasks of one test cycle each, saved as
  `.agents/plans/stage-<n>.md`. The roadmap stays authoritative; a plan is
  scratch and is not kept in sync.
- **Build and merge.** `pkg-implement` runs the stage loop: branch
  `stage-<n>-<slug>` from the stage issue, implement the plan with
  `test-driven-development` (`Rscript -e 'devtools::test(filter = "<name>")'`
  is the red/green command), open the pull request, merge on green at the
  stage's CI tier. The pull request body carries a `Tests` table, one row per
  behaviour added: the test, its oracle, and how it was seen to fail. A row
  with an empty cell does not merge. The confirmation the user gives at the
  start of that loop is the "told to merge" that Commits and pull requests
  requires, so the `finishing-a-development-branch` menu is not presented for
  stage pull requests. Any other pull request still waits for review.
- **Failures and claims.** A failing check or test goes through
  `systematic-debugging` before a fix. "Green", "done" and "ready for CRAN"
  are claimed only after `verification-before-completion`: run the command,
  read the output.
- **Review.** `requesting-code-review` gates tasks inside a stage.
  `pkg-critical-review` reviews the whole package once the roadmap is
  implemented, with Posit's reviewers, and files issues; its tests pass
  audits the test framework too (skips, CI legs, helpers, vacuous
  checks). `pkg-bug-hunt` attacks a package at any point in its life,
  released or not: independent hunters run it against counterparts they
  script, the R layer first, and every claim is re-run before it is
  filed. CRAN's reviewer
  email and GitHub review threads go through `receiving-code-review`.
