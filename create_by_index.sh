#!/bin/bash
# takes version.csv, iterates on every line and creates modpacks for each params set
# $mcV - minecraft version
# $qV - quilt version
# $mN - modpack name
# $mV - modpack version
set -e

if [ -z "$1" ]
then
      echo "index is empty"
      exit 1
fi

[ -e "./artifacts" ] && rm -rf "./artifacts"

while IFS=','; read -r mcV qV mN mV; do
  echo "Сreating modpack for args: \"$mcV\" \"$qV\" \"$mN\" \"$mV\""

  ./create_base.sh "$mcV" "$qV" "$mN" "$mV" || \
    echo "Can't create modpack \"$(echo "$mN" | tr -d '\\') $mcV-$mV\"";
done <<< "$(./get_version_by_index.sh "$1")"
