<!-- Synced from pedrobtz/packages:claude/shared/assurance.md. Do not edit it
here: change it there, and the sync opens a pull request in every package. -->

# Assurance: what every package must check, and where it says so

`correctness.md` says why: the bug families and the tests they call for.
This file says what is required. Each package records how it meets the
requirements in `.agents/assurance.md`, from
`pedrobtz/packages:templates/assurance.md`. CI checks that file, and a
weekly audit reads it across the portfolio.

The rule behind it comes from a measurement. Fourteen of the 16 bugs in
zuhttp's 2026-11-09 reviews were in code the tests already ran. The tests
reached the code but never checked its output. A requirement here is
therefore never "this code runs". It is "this output is checked against
something that knows the answer".

## Kinds

A package declares every kind it is. The kinds decide what it needs.

<!-- markdownlint-disable MD013 -->
| Kind              | The package…                                                                                                           |
| ----------------- | ---------------------------------------------------------------------------------------------------------------------- |
| `compiled`        | has a `src/` directory                                                                                                 |
| `untrusted-input` | parses bytes it did not produce: a wire protocol, a file, a decoder's input                                            |
| `spec`            | implements a published format, protocol or algorithm                                                                   |
| `lifecycle`       | returns objects that outlive the call that made them: streams, handles, connections, external pointers, ALTREP vectors |
| `emits`           | sends or writes bytes that another program reads                                                                       |
<!-- markdownlint-enable MD013 -->

## Required checks

These are workflows. Each one is a row in the package's "Required checks"
table, marked `done`, `gap #<issue>` or `n/a: <reason>`.

<!-- markdownlint-disable MD013 -->
| Kind              | Check           | What it is                                                                                              |
| ----------------- | --------------- | ------------------------------------------------------------------------------------------------------- |
| `compiled`        | `sanitizers`    | ASan and UBSan over the R suite                                                                         |
| `compiled`        | `valgrind`      | memcheck over the R suite                                                                               |
| `compiled`        | `rchk`          | static PROTECT analysis                                                                                 |
| `compiled`        | `gctorture`     | collections at every allocation                                                                         |
| `compiled`        | `analyzers`     | compiler static analysers                                                                               |
| `compiled`        | `alloc-failure` | fails each allocation in turn, R's included: native memory held across an R allocation that can longjmp |
| `compiled`        | `mutation`      | mutation testing of the C: the mutants no test kills. Reported, read, never gated.                      |
| `untrusted-input` | `fuzz`          | coverage-guided fuzzing, every harness with an oracle (below)                                           |
| `untrusted-input` | `fuzz-reach`    | what the corpus reaches, with the gap lists, against a floor                                            |
<!-- markdownlint-enable MD013 -->

A row is `done` when a workflow in `.github/workflows/` calls the
r-actions workflow of that name. It is also `done` when the row names a
workflow of the package's own and says `(own)`. An `n/a` needs a reason a
reviewer would accept. "Not yet" is a gap, and a gap needs an issue.

## Required tables

Workflows are not enough on their own. The bugs live in what a test
compares against.

- **Boundaries** (`untrusted-input`, `spec`, `emits`). One row per boundary
  the package crosses: a protocol, a format, a codec, an encoding. Each row
  names its oracle, and the test or harness that carries it. An oracle
  knows the answer:
  - a borrowed conformance suite or its test vectors;
  - a comparison with a reference implementation, in both directions where
    there are two;
  - a round trip;
  - a differential between inputs the specification calls equivalent;
  - the bytes the other side received.

  "No crash", "the test passes" and a coverage figure are not oracles.
- **Objects** (`lifecycle`). One row per long-lived object. Each row names
  the test of its out-of-order sequences, a model-based fuzz target or
  a state-transition test, and each guard: fork, unwind and owner. A guard
  that a sibling object has is required here too (family 2). A guard that
  cannot apply says why.
- **Limits.** One row per limit the package enforces, with its unit
  (decoded bytes, wire bytes, count) and the test that straddles it at
  `limit - 1`, `limit` and `limit + 1` under every framing or path that
  reaches it.

A missing oracle or test is written `gap #<issue>`. The table stays honest
about what is not covered yet, and the gap is tracked.

## When

- **A new package** gets `.agents/assurance.md` from its design in
  `pkg-roadmap`. Each stage that adds a boundary, an object or a limit adds
  its row, and its exit criteria include that row's test.
- **An existing package** gets one from `pkg-assurance`, which files an
  issue for each gap.
- **`pkg-critical-review`** fills in the rows the code has and the file
  lacks. It also reads the mutation survivors and the coverage gap lists.
- **CI** runs r-actions' `assurance.yml`. It fails on a malformed file, a
  `done` that no workflow backs, or a gap with no issue. It does not fail
  on a tracked gap.
