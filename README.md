# Tag 04 Praxis — CI Grundlagen mit GitHub Actions

> **Praxisauftraege.** Dieses Repository ist dein Arbeitsplatz fuer die
> Praxis-Uebungen von Tag 04. Es enthaelt bewusst nur das Geruest —
> jede Datei schreibst du selbst.

## Ausgangslage

Continuous Integration mit GitHub Actions. Die Auftraege bauen schrittweise
eine CI-Pipeline auf: Auftrag 1 liefert den ersten lauffaehigen Workflow,
Auftrag 2 ergaenzt Build und Tests, Auftrag 3 fuegt Linter und Docker-Build
hinzu.

## Ordnerstruktur

Die leeren Ordner geben die erwartete Struktur vor. Halte dich daran —
die automatische Pruefung sucht die Dateien genau dort.

```
tag04/auftrag01-hello-ci/.github/workflows/
tag04/auftrag02-build-test/.github/workflows/
tag04/auftrag03-lint-docker/.github/workflows/
```

## Aufgaben

### Auftrag 1 — Erste Schritte mit GitHub Actions (Hello CI)

Richte den ersten CI-Workflow ein, der bei jeder Code-Aenderung laeuft.

- Lege `tag04/auftrag01-hello-ci/.github/workflows/hello-ci.yml` an.
- Trigger: `on: [push]`, Runner: `runs-on: ubuntu-latest`.
- Schritte: `actions/checkout@v4` und ein `run`-Schritt, der
  `Hello Continuous Integration!` ausgibt.

### Auftrag 2 — Automatisierter Build und Test

Erweitere die Pipeline um einen echten Build- und Test-Lauf.

- Lege unter `tag04/auftrag02-build-test/` eine kleine Python-Anwendung an:
  `app.py` (z. B. eine Funktion `add`), `test_app.py` mit einem
  pytest-Testfall und `requirements.txt` mit `pytest`.
- Lege `tag04/auftrag02-build-test/.github/workflows/ci-build-test.yml` an:
  Checkout, `actions/setup-python@v5`,
  `pip install -r requirements.txt` und `pytest`.
- Probiere den roten Build aus: aendere die Erwartung im Test auf einen
  falschen Wert und beobachte den Fehlschlag.

### Auftrag 3 — Erweiterte CI-Pipeline: Linter und Docker-Build (optional)

Ergaenze unter `tag04/auftrag03-lint-docker/` Linter und Image-Build.

- `app.py`, `test_app.py`, `requirements.txt` (zusaetzlich `flake8`).
- Ein `Dockerfile`, das die Anwendung startet.
- Ein Workflow mit `flake8 .`, `pytest` und `docker build -t myapp:latest .`

Dieser Auftrag ist in der Tagesplanung als optional gekennzeichnet und wird
deshalb nicht automatisch bewertet.

## Abnahmekriterien

Diese Kriterien prueft die Pipeline bei jedem Push automatisch. **Die Haken
setzt die Pipeline selbst:** ein erfuelltes Kriterium wird abgehakt, und
sobald eine Aenderung es wieder bricht, verschwindet der Haken. Du musst hier
nichts von Hand pflegen — beim naechsten Push wird die Liste ueberschrieben.

<!-- c50:progress -->
**Fortschritt: 0 / 13 Kriterien erfüllt** ⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜ — Stand: 2026-08-23 22:08 UTC.
<!-- /c50:progress -->

- [ ] ⬜ Auftrag 1: Workflow vorhanden (tag04/auftrag01-hello-ci/.github/workflows/)
- [ ] ⬜ Auftrag 1: Trigger on: push konfiguriert
- [ ] ⬜ Auftrag 1: Runner ubuntu-latest gesetzt
- [ ] ⬜ Auftrag 1: Checkout-Action vorhanden (actions/checkout)
- [ ] ⬜ Auftrag 1: Ausgabe-Schritt vorhanden (echo)
- [ ] ⬜ Auftrag 2: app.py vorhanden
- [ ] ⬜ Auftrag 2: test_app.py vorhanden
- [ ] ⬜ Auftrag 2: test_app.py enthält einen pytest-Test (def test_)
- [ ] ⬜ Auftrag 2: requirements.txt enthält pytest
- [ ] ⬜ Auftrag 2: Workflow vorhanden (tag04/auftrag02-build-test/.github/workflows/)
- [ ] ⬜ Auftrag 2: Python-Setup im Workflow (actions/setup-python)
- [ ] ⬜ Auftrag 2: Abhängigkeiten werden installiert (pip install -r requirements.txt)
- [ ] ⬜ Auftrag 2: Tests werden ausgeführt (pytest)

Zusaetzlich manuell abgenommen (nicht automatisch geprueft):

- Auftrag 3 (optional): Linter- und Docker-Build-Pipeline umgesetzt
- Roten Build bewusst ausgeloest und wieder repariert

## Abnahmekriterien selber pruefen

**Lokal** — jederzeit, ohne Push:

```bash
bash .github/classroom/grade.sh
```

Das Skript liest die Tagesnummer aus `.classroom50.yaml`. Du kannst sie
auch erzwingen:

```bash
CLASSROOM_DAY=4 bash .github/classroom/grade.sh
```

Die Ausgabe listet jedes Kriterium mit ✅ oder ❌ und nennt bei jedem ❌
den konkreten Loesungshinweis. Sobald ein Kriterium fehlt, endet das
Skript mit Exit-Code 1.

**In GitHub** — bei jedem Push:

Der Workflow **🎓 Classroom Autograding** laeuft automatisch und hakt die
erfuellten Kriterien oben im README ab. Ergebnis im Tab **Actions** →
letzter Run → Job *Abnahmekriterien pruefen*.

## Musterloesung

Nach dem Unterricht findest du die Musterloesung im Repository
[`tbzdevops/musterloesungen-praxisauftraege`](https://github.com/tbzdevops/musterloesungen-praxisauftraege/tree/day_4_solution/tag04)
auf dem Branch `day_4_solution`.
