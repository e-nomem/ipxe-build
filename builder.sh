#!/usr/bin/env bash
set -euo pipefail

if [[ $# -eq 0 ]]; then
	echo "#----------------------------------------------------------#"
	echo "# To use this script, pass a list of make targets as args. #"
	echo "# They can be added to the command array inside the        #"
	echo "# docker-compose.yml file. See the README for more info    #"
	echo "#----------------------------------------------------------#"
	exit 1
fi

TARGETS=()
while [[ $# -gt 0 ]]; do
	TARGETS+=("$1")
	shift
done

# Use the arbitrary config name here
# TODO: Pass config name in to script from docker-compose.yml?
CONFIG="homelab"

# If there is an embed script with the named config, use it
if [[ -f "config/$CONFIG/embed.ipxe" ]]; then
	EMBED="config/$CONFIG/embed.ipxe"
else
	EMBED=""
fi

echo "Cleaning and updating git repo"
git clean -fxq
git pull --rebase

for target in "${TARGETS[@]}"; do
	buildopts=("CONFIG=$CONFIG")
	if [[ -n "$EMBED" ]]; then
		buildopts+=("EMBED=$EMBED")
	fi
	if [[ "$target" =~ ^bin-arm32-efi/.*$ ]]; then
		buildopts+=("CROSS_COMPILE=arm-linux-gnueabi-" "ARCH=arm32")
	elif [[ "$target" =~ ^bin-arm64-efi/.*$ ]]; then
		buildopts+=("CROSS_COMPILE=aarch64-linux-gnu-" "ARCH=arm64")
	fi

	echo "make ${buildopts[@]} $target"
	make "${buildopts[@]}" "$target"
done

echo
echo "Build finished successfully!"

echo
echo "Copying build artifacts:"
for bin in "${TARGETS[@]}"; do
	mkdir -p "$(dirname "/out/$bin")"
	cp -v "$bin" "/out/$bin"
done

echo
echo "Building tarball:"
tar czvf /out/ipxe-bundle.tar.gz "${TARGETS[@]}"
