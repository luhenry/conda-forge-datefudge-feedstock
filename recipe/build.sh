#!/usr/bin/bash
set -ex

make install VERSION=${PKG_VERSION}
if [[ "${CONDA_BUILD_CROSS_COMPILATION:-}" != "1" || "${CROSSCOMPILING_EMULATOR:-}" != "" ]]; then
make test
fi
