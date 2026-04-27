#!/usr/bin/bash

CSS="$(dirname $0)/phrack.css"

for txt in $(ls phrack*.txt); do
    base=${txt%.*};
    title=$(echo $base | sed -e 's/[0-9]/ \0/')
    title=${title^}  # uppercase first character

    ebook-convert "$txt" "$base.epub" --paragraph-type=off --preserve-spaces --extra-css="$CSS" --formatting-type=plain --paragraph-type=single --remove-paragraph-spacing --remove-paragraph-spacing-indent-size=-1 --margin-left=0 --margin-right=0 --no-default-epub-cover --embed-all-fonts --disable-font-rescaling --title="$title"

done
