#!/bin/bash
# takes version.csv, iterates on every line and creates modpacks for each params set
set -e

[ -e "./artifacts" ] && rm -rf "./artifacts"

while IFS=, read -r mcV qV mN mV; do
  echo "Сreating modpack for args: $mcV $qV $mN $mV"

  ./create_base.sh "$mcV" "$qV" "$mN" "$mV" || \
    echo "Can't create modpack \"$(echo "$mN" | tr -d '\\') $mcV-$mV\"";
done < "./version.csv"
