ROOT=~/hgdiffs
mkdir -p "$ROOT"
hg diff > "$ROOT/hgdiff"
hg diff -c . > "$ROOT/hgdiff-revision"
hg diff -r p4head > "$ROOT/hgdiff-p4head"
