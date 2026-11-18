#!/usr/bin/env bash
set -eu
here="$(cd "$(dirname "$0")" && pwd)"
cp -R "$here/../fixtures/home-basic/." .
if [ -d "$here/files" ]; then cp -R "$here/files/." .; fi
