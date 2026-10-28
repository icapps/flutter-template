---
name: pr-description
description: "PR description preparation: builds `.ai/<TICKET>-pr-description.md` from the branch, the Jira ticket and the diff, using `.bitbucket/pull_request_template.md`, and reports gaps for the author. Use when a branch is ready for a pull request, or when the PR description must be refreshed after more commits."
metadata:
  domain: "delivery"
  version: "0.2"
---

# PR description

Prepare the pull request description so the reviewer can spend time on what matters. The skill fills what the repository can prove and leaves what only the author knows as `TODO`. It never presents a guess as evidence.

`.bitbucket/pull_request_template.md` is the single source of the structure: a risk size (S, M, L), "What changed and why", and an evidence table. Read it every run; never copy its sections into this skill or into a generated file from memory. The `tool/hooks/pre-push` hook and the pipeline check the finished file.

## 1. Resolve the ticket and the output path

1. Read the branch with `git branch --show-current`.
2. Take the first match of `[A-Z][A-Z0-9]+-[0-9]+` (uppercase only, so `fix/dark-mode-2` is not a ticket).
3. The output path is `.ai/<TICKET>-pr-description.md`.

No match, or a detached HEAD: stop and ask the author for the ticket key and to rename the branch. Do not invent one.

Done when the ticket key and the output path are known.

## 2. Gather evidence

- **Diff**: base is `git merge-base HEAD origin/<default-branch>`; read the commit list and `git diff --stat` for the range.
- **Ticket**: the description and acceptance criteria from Jira through the `tracker` skill when it is configured. Otherwise ask the author to paste the acceptance criteria. Do not reconstruct criteria from the diff.
- **Tests**: the test files the diff adds or changes, with the test names (`test(`, `testWidgets(`, `group(`).

Done when each of the three is read, or marked unavailable with the reason.

## 3. Propose the risk size

Apply the criteria in the template's risk comment to the diff. State the size and the criterion that decided it. One **L** criterion makes it L, whatever the line count. The author may raise the size, never lower it below what a criterion demands.

## 4. Fill the template

Fill only what the evidence supports. Everything else keeps its `TODO`.

| Field | Rule |
|---|---|
| Risk and "Why this size?" | The proposal from step 3, naming the criterion. |
| "Where should the reviewer look, and what am I unsure about?" | Keep `TODO`. You may add one `<!-- hint: ... -->` comment naming the largest or most unusual change. |
| Jira | The ticket link. |
| What changed and why | Keep `TODO`. It must be the author's own words. |
| Acceptance criteria rows | Copy each criterion verbatim. Fill "Evidence" with a test file and test name only when a test in the diff covers it, and mark "Covered?" **Yes** only then. Otherwise keep `TODO`. |
| Edge cases, "Tested on", recordings, Maestro | Keep `TODO`. Only the author ran them. |

For size S, the evidence minimum is a test or screenshot per criterion; for M and L the template asks for more. Do not weaken the template's minimum.

If the output file already exists, keep every line the author changed and update only the lines derived from evidence. Show the author what changed.

Done when the file exists at the output path and every remaining `TODO` is a field only the author can answer.

## 5. Report the gaps

End with a short list in the chat, not only in the file:

- acceptance criteria no test in the diff covers
- remaining `TODO` fields, grouped by section
- evidence the chosen size still requires (recording, Maestro flow, second platform)
- a diff that is unusually large or mixes unrelated changes; suggest splitting it

Do not push, open the pull request, or edit the ticket.
