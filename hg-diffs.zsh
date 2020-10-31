ROOT=~/hgdiffs
mkdir -p "$ROOT"
rm -f $ROOT/*
hg diff -r p4head > "$ROOT/hgdiff-p4head"
hg diffexported > "$ROOT/hgdiff-exported"
hg diff -r 'clroots(.)^' > "$ROOT/hgdiff-change"
hg diff -c . > "$ROOT/hgdiff-commit"
hg diff > "$ROOT/hgdiff"
