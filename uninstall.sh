#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

echo "Uninstalling Icon codecs from local Application Support."

# Only delete the files we have installed by iterating our install folders
# The codec
cd ${DIR}/Codecs/Lua\ Codecs/Icon
for filename in * ;
do
	rm -f ~/Library/Application\ Support/Propellerhead\ Software/Remote/Codecs/Lua\ Codecs/Icon/${filename}
done
# The mapping
cd ${DIR}/Maps/Icon
for filename in * ;
do
	rm -f ~/Library/Application\ Support/Propellerhead\ Software/Remote/Maps/Icon/${filename}
done
