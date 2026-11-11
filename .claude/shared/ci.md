<!-- Synced from pedrobtz/packages:claude/shared/ci.md. Do not edit it here:
change it there, and the sync opens a pull request in every package. -->

# Continuous integration

Workflows come from `pedrobtz/r-actions`. Call those reusable workflows instead
of writing bespoke ones, and pin a released tag rather than `main`. Pin a
workflow that holds a write token, such as `coverage.yml` or
`cran-release.yml`, to a commit, with the tag in a comment. The `R-CMD-check`
workflow must call `r-cmd-check.yml`, because a hand-rolled one does not count
as the pre-submission check. Copy the callers from r-actions' `examples/`:
they pass `profile: auto` and carry `workflow_dispatch:` and a weekly
`schedule:`, the only events besides a `full-ci` pull request that run the
full set. The package's `CLAUDE.md` lists the shared
workflows it calls and any of its own.

## What a change runs

The shared workflows' `changes` gate looks at the files a pull request
changes, compared with its merge base:

- **Documentation and housekeeping only** skips every check; only coverage
  and the pkgdown site run. That covers top-level Markdown (`README.md`,
  `NEWS.md`, `cran-comments.md`), Markdown under dot directories,
  `_pkgdown.yml`, `CRAN-SUBMISSION`, `.gitignore`, issue and pull request
  templates, and any workflow file other than the calling workflow's own.
- **`DESCRIPTION` or `README.Rmd` as well**, and nothing else, adds one R CMD
  check on Ubuntu R-release.
- **Any other file** runs everything.

So put a README or `DESCRIPTION` touch-up in its own pull request. Once a pull
request changes code, every later push to it runs every workflow.

A package's own workflows gate the same way by calling `changes.yml` rather
than carrying a `paths-ignore` list.

## A package's own workflows

A workflow a package writes for itself, an ABI probe, a fuzz-corpus replay or
a live-network slice, follows three rules.

- **Gate it** by calling `changes.yml` and testing its `docs-only` and
  `profile` outputs, never with a `paths-ignore` list. Every job a pull
  request starts has `needs: changes` and an `if:` beginning
  `${{ !cancelled() && needs.changes.outputs.docs-only != 'true'`, unless it
  calls an r-actions workflow or only runs on other events; see Labels for
  the label test that comes before it. A job that must
  run on every change says why, with `# ungated: <reason>` on the line above
  its key. r-actions' `assurance.yml` reports any other job (`ungated-jobs:
  warn`, or `fail` once the package is clean).
- **One job per OS.** Per-OS checks are steps of r-actions' `platforms.yml`,
  which runs the package's `tools/ci/platform.sh <os>` once on each runner. A
  pull request runs at most one macOS job and one Windows job beyond
  `r-cmd-check.yml`'s own. A free account gets about five macOS runners at a
  time, and eight one-minute macOS jobs a pull request queued four open pull
  requests behind each other in zuhttp, then cancelled some of them ("The job
  was not acquired by Runner of type hosted").
- **Slow extras wait for `full`.** A libFuzzer run longer than a minute, a
  coverage leg on macOS, a corpus replay on a second OS: test
  `R_ACTIONS_PROFILE` in the script, or the `profile` output in a workflow,
  so they run on the weekly schedule, on dispatch and under `full-ci`.

## Labels

A label on a pull request can ask for more checking, or for less:

| Label | Effect on that pull request's runs |
|---|---|
| `full-ci` | the full profile; overrides the three labels below |
| `ci:docs` | nothing gated runs, R CMD check included; only the pkgdown site builds |
| `ci:minimal` | one quick R CMD check, every other gated job skipped |
| `skip-ci:<workflow>` | that workflow's jobs skipped, for example `skip-ci:fuzz` or `skip-ci:valgrind` |

**Choose the label from what the diff can reach**, whoever opens the pull
request, a skill or not:

| The pull request changes | Label |
|---|---|
| only prose: top-level Markdown, Markdown under a dot directory, articles, `_pkgdown.yml`, housekeeping | `ci:docs` |
| CI configuration or repository housekeeping, or files no check reads | `ci:minimal` |
| `R/`, `src/`, `tests/`, `DESCRIPTION`, `README.Rmd` or anything else a check reads | none |
| the last pull request of a milestone, or a `full` stage | `full-ci` |

**Label the pull request at creation.** `gh pr create --label ci:docs` puts
the label in the first run; one added later starts a new run. Use
`ci:docs` for a change only to prose (README, NEWS, articles, comments in
Markdown), `ci:minimal` for one the checks cannot see, such as CI
configuration or repository housekeeping, and never either to get code past
a failing check. Labels change pull request runs only. The push to the
default branch after merge carries none, so whatever a label skipped still
runs there, at the quick profile.

**A label skips without a runner.** The `changes` gate is a job, so on its
own it takes one runner per workflow to decide that nothing runs: twelve for
a README edit in zuhttp, queued behind every other package's work. GitHub
evaluates a job's `if:` without a runner, and the labels are in the event,
so every job a pull request can start tests them first. On a call to an
r-actions workflow and on a package's own `changes` job:

```yaml
    if: >-
      github.event_name != 'pull_request'
      || contains(github.event.pull_request.labels.*.name, 'full-ci')
      || !(contains(github.event.pull_request.labels.*.name, 'ci:docs')
        || contains(github.event.pull_request.labels.*.name, 'ci:minimal')
        || contains(github.event.pull_request.labels.*.name, 'skip-ci:<name>'))
```

The R CMD check caller leaves out `ci:minimal`, which still runs it, and
pkgdown tests only `ci:minimal` and its own `skip-ci`. A job that needs a
label-gated `changes` adds `needs.changes.result != 'skipped' &&` to its
`if:`: a skipped `changes` has empty outputs, so `docs-only != 'true'`
alone would run it on exactly the pull requests the label skipped. r-actions'
`assurance.yml` fails a job that leaves it out. A pull request with no label
is still classified by its files, which takes the gate's runners.

## Quick by default, full by exception

The full profile is slow. gctorture at step 20 alone has taken 36 to 107
minutes on sibling packages. Waiting on it between roadmap stages was the
main thing slowing roadmaps down, so:

- **Pull requests and pushes to the default branch run the quick profile**
  (`profile: auto` in the callers). A merge never starts the full set. It
  should finish in under five minutes. If it doesn't, raise gctorture's
  `quick-step` or trim `quick-containers` in the caller workflows; never cut
  the full profile.
- **A `full` roadmap stage takes the `full-ci` label** and merges only on a
  green full run. The roadmap gives the reason in the stage's `**CI.**`
  line, for example first compiled code, a `PROTECT` or finalizer change, a
  vendored library, or a Windows-only path.
- **The full set runs on demand and weekly.** Dispatch it on the default
  branch with `gh workflow run R-CMD-check.yml --ref main` and
  `gh workflow run native-checks.yml --ref main` (the callers' file names),
  and the callers' weekly `schedule:` runs it anyway. Don't dispatch it after
  every merge: run it once at the end of a series of merges, on the last
  merge commit.
- **A failure only the full set shows** goes on the `Full CI` stage issue as
  a comment with the run link, and is fixed there. A failure the quick
  profile also shows is fixed now.
- **`Full CI` and `v0.1.0 readiness` wait** for a green dispatched full run
  on their merge commit, and the release commit always needs one.
- Locally, run `gctorture(TRUE)` on the code a C change touches when it is
  cheap; the full run is the authority.
