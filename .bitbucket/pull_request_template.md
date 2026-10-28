<!--
Compact PR-template (pilot: flutter-template)
1. Kies eerst je risico-maat (sectie 1). Die bepaalt hoeveel bewijs je levert.
2. Vervang elke TODO. Niet van toepassing? Schrijf "n.v.t." met een korte reden.
3. Haal deze commentaarblokken er niet uit; ze zijn onzichtbaar in de PR.
-->

## 1. Risico: TODO (S / M / L)

<!--
L: minstens één van
   - auth, sessies, secure storage of tokens
   - betalingen of persoonlijke data
   - database-schema of migratie (lib/database)
   - navigatie, routes of deeplinks (lib/navigator)
   - nieuwe dependency in pubspec, of nieuwe permissie (Info.plist, AndroidManifest)
   - gedeelde kern: lib/styles, lib/widget, lib/di, lib/webservice
   - flavors, signing of fastlane
M: nieuw gedrag of een nieuwe flow binnen één feature, of platformspecifiek gedrag
S: copy, styling, interne refactor met bestaande tests, kleine bugfix met regressietest
De reviewer mag de maat verhogen, nooit verlagen.
-->

**Waarom deze maat?** TODO (1 zin, noem het criterium)

**Kijk vooral naar / hier ben ik onzeker over:** TODO

## 2. What changed and why

**Jira:** TODO (link)

TODO (2 tot 4 zinnen, in eigen woorden. Wat verandert er voor de gebruiker, wat voor de code, en waarom zo?)

## 3. Evidence: Flow / Proof of Delivery

<!--
Eén rij per acceptance criterium uit het ticket. "Bewijs" is een link of testnaam, geen bewering.
Minimaal bewijs per maat:
  S: een test of screenshot per criterium
  M: S + een screen recording of Maestro-flow van de hoofdflow + de belangrijkste edge cases
  L: M + getest op iOS én Android (toestel/emulator + OS-versie)
-->

| Acceptance criterium | Bewijs (test / screenshot / recording / Maestro) | Gedekt? |
|---|---|---|
| TODO | TODO | Ja / Nee / Gedeeltelijk |

**Edge cases getest (M en L):** TODO (bv. geen netwerk, lege staat, foutmelding, lange tekst, rotatie)

**Getest op (M en L):** TODO (toestel/emulator + OS-versie)

**Wijkt iets af van het ticket?** TODO (zo niet: "Nee")

---

<!-- Klaar om te reviewen als alle velden zijn ingevuld. De pre-push hook en de pipeline controleren dit. -->
