#!/usr/bin/env bash
set -ex

meson setup                \
      --prefix="${PREFIX}" \
      --buildtype=release  \
      ./builddir .

cd builddir
ninja
ninja install
ninja test
