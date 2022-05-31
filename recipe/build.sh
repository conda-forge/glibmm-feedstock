#!/usr/bin/env bash
set -ex

# The giom_simple_test unit test will fail
# if /etc/fstab does not exist.
#
# Meson does not have the ability to skip
# tests (https://github.com/mesonbuild/meson/issues/6999),
# so in order to skip this test, we remove
# it from the build config
sed -i.bk "s/^.*giomm_simple.*$//g" tests/meson.build

rm -r tests/giomm_simple


meson setup                \
      --prefix="${PREFIX}" \
      --buildtype=release  \
      ./builddir .

cd builddir

ninja
ninja install
ninja test
