#!/usr/bin/bash

CSS="$(dirname $0)/phrack.css"
TMPFILE=$(mktemp /tmp/phrack.XXXXXX.html)

for txt in $(ls phrack*.txt); do
    base=${txt%.*};
    title=$(echo $base | sed -e 's/[0-9]/ \0/')
    title=${title^}  # uppercase first character

    cat > "$TMPFILE" <<EOF
<html>
<head>
    <title>$title</title>
</head>
<body>
<pre>
EOF

    cat "$txt" | recode UTF-8..html >> "$TMPFILE"

    cat >> "$TMPFILE" <<EOF
</pre>
</body>
EOF

    ebook-convert "$TMPFILE" "$base.epub" --extra-css="$CSS" --margin-left=0 --margin-right=0 --no-default-epub-cover --embed-all-fonts --disable-font-rescaling --title="$title"

done

rm "$TMPFILE"
