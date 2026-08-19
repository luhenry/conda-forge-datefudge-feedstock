#!/usr/bin/bash
set -ex

make install VERSION=${PKG_VERSION}

# The in-tree `make test` LD_PRELOADs the freshly built (target-arch)
# datefudge.so into `date`. When cross-compiling, `date` is the
# build-platform binary, so the preload is silently ignored and the test
# fails even when an emulator is configured. Functional testing of
# cross-built packages is handled by the recipe's `test:` section instead.
if [[ "${CONDA_BUILD_CROSS_COMPILATION:-}" != "1" ]]; then
  make test
fi
