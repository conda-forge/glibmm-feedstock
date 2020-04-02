#!/usr/bin/env bash
set -ex

# configure, make, install, check
sed -e '/^libdocdir =/ s/$(book_name)/glibmm-'"${PKG_VERSION}"'/' \
    docs/Makefile.in > docs/Makefile.in.new
mv docs/Makefile.in.new docs/Makefile.in

./configure --prefix="${PREFIX}" --exec-prefix="${PREFIX}" \
  --disable-dependency-tracking \
  || { cat config.log; exit 1; }

make -j${CPU_COUNT}
make install
