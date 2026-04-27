#!/usr/bin/bash
# Run this on dir with .tar.gz of the Phrack issues.

find . -name 'phrack*.tar.gz' -exec sh -c 'mkdir -p "${0%.tar.gz}" && tar -C "${0%.tar.gz}" -xzvf "$0"' {} \;

for p in $(find -type d -path './phrack*'); do
    find "$p" -type f | sort -V | xargs -n1 cat > "$p.txt"
done
