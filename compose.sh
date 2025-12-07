#!/usr/bin/env bash
set -e
set -u
set -o pipefail

# [ -d weiterleitung ] || mkdir weiterleitung
# command cp header.md page.md

while IFS='' read -r LINE; do
    defn="${LINE#* }"
    term="${LINE% *}"
    printf "\n<https://pvh.schule/%s>\n: _leitet aktuell weiter auf_ <%s>\n" "$term" "$defn" >> page.md
done < body.txt

# sed 's/$/ 301/' body.txt > weiterleitung/_redirects
pandoc page.md -o weiterleitung/index.html --template=template.html

# command rm page.md
