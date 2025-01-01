#!/bin/bash

# See: <https://github.com/beautifier/js-beautify/issues/741#issuecomment-366722895>

APPDIR="$(realpath "$(dirname "$(dirname "$0")")")"
TMPDIR=$(mktemp -d)
cd "$APPDIR" || exit 1

for line in $(find . -name '*.html' -not -path "./_site/*"); do
  filepath=$(realpath "$line")
  file=${filepath/$APPDIR\//}
  mkdir -p "$TMPDIR"/"$(dirname "$file")"
  cp "$APPDIR"/"$file" "$TMPDIR"/"$file"
done

message=$(find "$TMPDIR" -type f | xargs ./node_modules/.bin/js-beautify --replace --config jsbeautifyrc --type html | grep -v unchanged || true)
if [[ $message ]]; then
  echo "$message" | sed "s#$TMPDIR##g" | sed "s#\.\.\/##g"
  rm -rf "$TMPDIR"
  exit 1
fi

rm -rf "$TMPDIR"

echo OK
