#!/bin/bash

#  install_dependencies.sh
#
#  :description: post-build script to install wakatime python package
#
#  :maintainer: WakaTime <support@wakatime.com>
#  :license: BSD, see LICENSE for more details.
#  :website: https://wakatime.com/

set -e
set -x

url="https://dl.dropboxusercontent.com/s/ocp1m4ntqh4bw2g/wakatime-cli.zip?dl=0"
if [ -d "$INSTALL_DIR" ]; then
    extract_to="$INSTALL_DIR/$UNLOCALIZED_RESOURCES_FOLDER_PATH"
else
    extract_to="$HOME/Library/Application Support/Developer/Shared/Xcode/Plug-ins/WakaTime.xcplugin/Contents/Resources"
fi
zip_file="$extract_to/wakatime-cli.zip"
installed_package="$extract_to/wakatime-cli"

if [ -d "$installed_package" ]; then
    rm -rf "$installed_package"
fi

cd "$extract_to"

echo "Downloading wakatime package to $zip_file ..."
curl "$url" -o "$zip_file"

echo "Unzipping wakatime.zip to $installed_package ..."
unzip -q -o "$zip_file" || true

installed_binary="$installed_package/wakatime-cli"
chmod a+x "$installed_binary"

rm "$zip_file"

echo "Finished."

exit 0
