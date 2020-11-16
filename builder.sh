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

for target in "${TARGETS[@]}"; do
	buildopts=("CONFIG=homelab")
	if [[ "$target" =~ ^bin-arm32-efi/.*$ ]]; then
		buildopts+=("CROSS_COMPILE=arm-linux-gnueabi-" "ARCH=arm32")
	elif [[ "$target" =~ ^bin-arm64-efi/.*$ ]]; then
		buildopts+=("CROSS_COMPILE=aarch64-linux-gnu-" "ARCH=arm64")
	fi

	make -C src "${buildopts[@]}" "$target"
done

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
