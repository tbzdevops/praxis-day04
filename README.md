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

Alle Dateien gehoeren ins **Wurzel-Verzeichnis** dieses Repos bzw. in
`.github/workflows/` — nur dort fuehrt GitHub Actions Workflows aus. Lege
keine Unterordner pro Auftrag an; die automatische Pruefung sucht die
Dateien genau hier.

```
.github/workflows/hello-ci.yml        # Auftrag 1
.github/workflows/ci-build-test.yml   # Auftrag 2, in Auftrag 3 erweitert
app.py                                # Auftrag 2
test_app.py                           # Auftrag 2
requirements.txt                      # Auftrag 2 (+ flake8 in Auftrag 3)
Dockerfile                            # Auftrag 3
```

## Aufgaben

### Auftrag 1 — Erste Schritte mit GitHub Actions (Hello CI)

Richte den ersten CI-Workflow ein, der bei jeder Code-Aenderung laeuft.

- Lege `.github/workflows/hello-ci.yml` an.
- Trigger: `on: [push]`, Runner: `runs-on: ubuntu-latest`.
- Schritte: `actions/checkout@v4` und ein `run`-Schritt, der
  `Hello Continuous Integration!` ausgibt.

### Auftrag 2 — Automatisierter Build und Test

Erweitere die Pipeline um einen echten Build- und Test-Lauf.

- Lege im Wurzel-Verzeichnis eine kleine Python-Anwendung an:
  `app.py` (z. B. eine Funktion `add`), `test_app.py` mit einem
  pytest-Testfall und `requirements.txt` mit `pytest`.
- Lege `.github/workflows/ci-build-test.yml` an:
  Checkout, `actions/setup-python@v5`,
  `pip install -r requirements.txt` und `pytest`.
- Probiere den roten Build aus: aendere die Erwartung im Test auf einen
  falschen Wert und beobachte den Fehlschlag.

### Auftrag 3 — Erweiterte CI-Pipeline: Linter und Docker-Build (optional)

Erweitere die Pipeline aus Auftrag 2 um Linter und Image-Build — in
derselben Workflow-Datei `.github/workflows/ci-build-test.yml`.

- `requirements.txt` zusaetzlich um `flake8` ergaenzen.
- Ein `Dockerfile` im Wurzel-Verzeichnis, das die Anwendung startet.
- Im Workflow `flake8 .` vor und `docker build -t myapp:latest .` nach den Tests.

Dieser Auftrag ist in der Tagesplanung als optional gekennzeichnet und wird
deshalb nicht automatisch bewertet.

## Abnahmekriterien

Diese Kriterien prueft die Pipeline bei jedem Push automatisch. **Die Haken
setzt die Pipeline selbst:** ein erfuelltes Kriterium wird abgehakt, und
sobald eine Aenderung es wieder bricht, verschwindet der Haken. Du musst hier
nichts von Hand pflegen — beim naechsten Push wird die Liste ueberschrieben.

<!-- c50:progress -->
**Fortschritt: 0 / 13 Kriterien erfüllt** ⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜ — Stand: 2026-08-24 21:16 UTC.
<!-- /c50:progress -->

- [ ] ⬜ Auftrag 1: Hello-CI-Workflow vorhanden (.github/workflows/)
- [ ] ⬜ Auftrag 1: Trigger on: push konfiguriert
- [ ] ⬜ Auftrag 1: Runner ubuntu-latest gesetzt
- [ ] ⬜ Auftrag 1: Checkout-Action vorhanden (actions/checkout)
- [ ] ⬜ Auftrag 1: Ausgabe-Schritt vorhanden (echo)
- [ ] ⬜ Auftrag 2: app.py vorhanden
- [ ] ⬜ Auftrag 2: test_app.py vorhanden
- [ ] ⬜ Auftrag 2: test_app.py enthält einen pytest-Test (def test_)
- [ ] ⬜ Auftrag 2: requirements.txt enthält pytest
- [ ] ⬜ Auftrag 2: Build/Test-Workflow vorhanden (.github/workflows/)
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

Die Punktzahl ist **anteilig**: jedes erfuellte Abnahmekriterium zaehlt einen
Punkt (z. B. `Points 8/13`). Gruen wird der Lauf erst, wenn alle Kriterien
erfuellt sind — Teilpunkte gibt es aber ab dem ersten.

## Musterloesung

Nach dem Unterricht findest du die Musterloesung im Repository
[`tbzdevops/musterloesungen-praxisauftraege`](https://github.com/tbzdevops/musterloesungen-praxisauftraege/tree/day_4_solution)
auf dem Branch `day_4_solution`.
