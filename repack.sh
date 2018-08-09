#!/bin/bash
set -eu -o pipefail
set_dir(){ _dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; }; set_dir
safe_source () { source $1; set_dir; }
# end of bash boilerplate

for doc in $_dir/*.fcstd.d; do
    [ -d "$doc" ] || continue
    echo -n "Packing ${doc#$_dir/}"
    zip -q -3 -r $doc.fcstd $doc
    [[ $? -eq 0 ]] && echo " [OK]" || echo " [FAIL]"
done
