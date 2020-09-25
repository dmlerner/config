ROOT=~/hgdiffs
mkdir -p "$ROOT"
hg diff -r p4head > "$ROOT/0hgdiff-p4head"
hg diff -r 'clroots(.)^' > "$ROOT/1hgdiff-change"
hg diff -c . > "$ROOT/2hgdiff-commit"
hg diff > "$ROOT/3hgdiff"
