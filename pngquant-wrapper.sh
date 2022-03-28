#!/bin/bash

# According to pre-commit docs: "The hook must exit nonzero on failure or modify files."

# But pngquant:
# * exits with 0 on modify files,
# * exits with non-zero when the file is skipped,

# This scripts changes that to the codes expected by pre-commit.

tmpfile=$(mktemp)

pngquant --force --verbose --ext .png --skip-if-larger "$1" 2>&1 | tee "$tmpfile"

exit_code=${PIPESTATUS[0]}

if [[ $exit_code -eq 0 ]] && grep -qs 'Quantized 1 image.' "$tmpfile" ; then
  wrapped_exit_code=1
fi
if [[ $exit_code -ne 0 ]] && grep -qs 'Skipped 1 file out of a total of 1 file.' "$tmpfile" ; then
  wrapped_exit_code=0
fi

rm -rf "$tmpfile"

exit $wrapped_exit_code
