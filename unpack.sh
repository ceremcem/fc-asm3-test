#!/bin/bash
set -eu -o pipefail
set_dir(){ _dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; }; set_dir
safe_source () { source $1; set_dir; }
# end of bash boilerplate

for file in $_dir/*.fcstd; do
    [ -e "$file" ] || continue
    echo -n "Extracting ${file#$_dir/}"
    unzip -qq -o $file -d ${file}.d
    [[ $? -eq 0 ]] && echo " [OK]" || echo " [FAIL]"
done
