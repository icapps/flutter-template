<!--
Compact PR template (pilot: flutter-template)
1. Pick your risk size first (section 1). It decides how much evidence you provide.
2. Replace every TODO. Not applicable? Write "n/a" with a short reason.
3. Do not remove these comment blocks; they are invisible in the rendered PR.
-->

## 1. Risk: TODO (S / M / L)

<!--
L: at least one of
   - auth, sessions, secure storage or tokens
   - payments or personal data
   - database schema or migration (lib/database)
   - navigation, routes or deeplinks (lib/navigator)
   - new dependency in pubspec, or new permission (Info.plist, AndroidManifest)
   - shared core: lib/styles, lib/widget, lib/di, lib/webservice
   - flavors, signing or fastlane
M: new behaviour or a new flow inside one feature, or platform-specific behaviour
S: copy, styling, internal refactor with existing tests, small bugfix with a regression test
The reviewer may raise the size, never lower it.
-->

**Why this size?** TODO (1 sentence, name the criterion)

**Where should the reviewer look, and what am I unsure about?** TODO

## 2. What changed and why

**Jira:** TODO (link)

TODO (2 to 4 sentences, in your own words. What changes for the user, what changes in the code, and why this way?)

## 3. Evidence: Flow / Proof of Delivery

<!--
One row per acceptance criterion from the ticket. "Evidence" is a link or a test name, not a claim.
Minimum evidence per size:
  S: a test or screenshot per criterion
  M: S + a screen recording or Maestro flow of the main flow + the key edge cases
  L: M + tested on both iOS and Android (device/emulator + OS version)
-->

| Acceptance criterion | Evidence (test / screenshot / recording / Maestro) | Covered? |
|---|---|---|
| TODO | TODO | Yes / No / Partial |

**Edge cases tested (M and L):** TODO (e.g. no network, empty state, error message, long text, rotation)

**Tested on (M and L):** TODO (device/emulator + OS version)

**Does anything deviate from the ticket?** TODO (if not: "No")

<!-- Ready for review when every field is filled in. The pre-push hook and the pipeline check this. -->
