#!/bin/bash
# PRAXIS Tag 04 — nicht zu verwechseln mit dem gleichnamigen Projekt-Check
# im Repository techstyle. Geprüft wird der Praxis-Ordner tag04/.
source .github/classroom/grade.sh

# Überschreibt die generischen Hinweise aus grade.sh mit Praxis-Hinweisen.
solution_for_id() {
  case "$1" in
    hello-ci) echo "Lege tag04/auftrag01-hello-ci/.github/workflows/hello-ci.yml an" ;;
    hello-trigger) echo "Ergänze im Workflow den Trigger 'on: [push]'" ;;
    hello-runner) echo "Setze 'runs-on: ubuntu-latest' im Job" ;;
    hello-checkout) echo "Ergänze den Schritt 'uses: actions/checkout@v4'" ;;
    hello-echo) echo "Ergänze einen run-Schritt mit 'echo Hello Continuous Integration!'" ;;
    build-app) echo "Lege tag04/auftrag02-build-test/app.py mit einer Funktion an (z. B. add)" ;;
    build-test) echo "Lege tag04/auftrag02-build-test/test_app.py mit einem pytest-Test an" ;;
    build-reqs) echo "Lege tag04/auftrag02-build-test/requirements.txt mit pytest an" ;;
    build-workflow) echo "Lege tag04/auftrag02-build-test/.github/workflows/ci-build-test.yml an" ;;
    build-install) echo "Ergänze 'pip install -r requirements.txt' im Workflow" ;;
    build-pytest) echo "Ergänze einen pytest-Schritt im Workflow" ;;
    build-python) echo "Ergänze 'uses: actions/setup-python@v5' im Workflow" ;;
    *) echo "Überprüfe die Aufgabenstellung im README" ;;
  esac
}

echo "🔍 Prüfe Abnahmekriterien für Tag 04 Praxis — CI Grundlagen mit GitHub Actions"
echo ""

A1=tag04/auftrag01-hello-ci
A2=tag04/auftrag02-build-test

# Erster gefundener Workflow im jeweiligen Auftragsordner. /dev/null haengt
# hinten an, damit ein leeres Ergebnis fehlschlaegt statt auf stdin zu warten.
a1_wf() { ls $A1/.github/workflows/*.yml $A1/.github/workflows/*.yaml 2>/dev/null; }
a2_wf() { ls $A2/.github/workflows/*.yml $A2/.github/workflows/*.yaml 2>/dev/null; }
A1_FILES="$(a1_wf | tr '\n' ' ')/dev/null"
A2_FILES="$(a2_wf | tr '\n' ' ')/dev/null"

echo "── Auftrag 1: Erste Schritte mit GitHub Actions (Hello CI) ──"

check "hello-ci" \
  "Auftrag 1: Workflow vorhanden (tag04/auftrag01-hello-ci/.github/workflows/)" \
  "a1_wf | grep -q ."

check "hello-trigger" \
  "Auftrag 1: Trigger on: push konfiguriert" \
  "grep -qE '^[[:space:]]*on:' $A1_FILES && grep -qE '(^|[^a-z])push' $A1_FILES"

check "hello-runner" \
  "Auftrag 1: Runner ubuntu-latest gesetzt" \
  "grep -qE 'runs-on:[[:space:]]*ubuntu-latest' $A1_FILES"

check "hello-checkout" \
  "Auftrag 1: Checkout-Action vorhanden (actions/checkout)" \
  "grep -q 'actions/checkout' $A1_FILES"

check "hello-echo" \
  "Auftrag 1: Ausgabe-Schritt vorhanden (echo)" \
  "grep -qiE 'echo' $A1_FILES"

echo ""
echo "── Auftrag 2: Automatisierter Build und Test ──"

check_file_exists "build-app" \
  "Auftrag 2: app.py vorhanden" \
  "$A2/app.py"

check_file_exists "build-test" \
  "Auftrag 2: test_app.py vorhanden" \
  "$A2/test_app.py"

check "build-test" \
  "Auftrag 2: test_app.py enthält einen pytest-Test (def test_)" \
  "grep -qE '^def test_' $A2/test_app.py 2>/dev/null"

check "build-reqs" \
  "Auftrag 2: requirements.txt enthält pytest" \
  "grep -qiE '^pytest' $A2/requirements.txt 2>/dev/null"

check "build-workflow" \
  "Auftrag 2: Workflow vorhanden (tag04/auftrag02-build-test/.github/workflows/)" \
  "a2_wf | grep -q ."

check "build-python" \
  "Auftrag 2: Python-Setup im Workflow (actions/setup-python)" \
  "grep -q 'actions/setup-python' $A2_FILES"

check "build-install" \
  "Auftrag 2: Abhängigkeiten werden installiert (pip install -r requirements.txt)" \
  "grep -qiE 'pip install.*requirements\.txt' $A2_FILES"

check "build-pytest" \
  "Auftrag 2: Tests werden ausgeführt (pytest)" \
  "grep -qiE 'pytest' $A2_FILES"

summary 4
