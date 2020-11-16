#!/usr/bin/env bash
set -euo pipefail

TARGETS=()
while [[ $# -gt 0 ]]; do
	TARGETS+=("$1")
	shift
done

echo "Cleaning and updating git repo"
git clean -fxq
git pull --rebase

echo "Applying patches"
git apply --ignore-whitespace /patches/*.patch

make -C src "${TARGETS[@]}"

echo
echo "Build finished successfully!"

echo
echo "Copying build artifacts:"
for bin in "${TARGETS[@]}"; do
	mkdir -p "$(dirname "/out/$bin")"
	cp -v "src/$bin" "/out/$bin"
done

echo
echo "Building tarball:"
tar czvf /out/ipxe-bundle.tar.gz -C src "${TARGETS[@]}"
