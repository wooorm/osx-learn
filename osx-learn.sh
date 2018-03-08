#!/bin/sh

#
# Usage.
#

usage () {
cat << EOF

  Usage: learn [options] <word> [language]

  Options:

    -h, --help     output usage information
    -p, --print    output dictionary (default LocalDictionary)
    -v, --version  output version

  Examples:

    $ learn npm
    $ learn stringification en_GB
    $ learn --print
    npm
    $ learn --print en_GB
    stringification

  See also: man 1 learn
EOF
}

#
# Version.
#

version () {
  echo "1.1.0"
}

#
# Print.
#

print () {
  readonly lang=${1-"LocalDictionary"}

  database=~/Library/Spelling/$lang

  cat "$database"
}

#
# Options.
#

case $1 in
  "")           usage; exit 1 ;;
  -h|--help)    usage; exit ;;
  -p|--print)   print $2; exit ;;
  -v|--version) version; exit ;;
  *)            readonly replace=$1 ; readonly lang=${2-"LocalDictionary"} ;;
esac

#
# Find list.
#

database=~/Library/Spelling/$lang

touch "$database"

echo "$1" >> $database

data=$(cat $database | sort)

echo "$data" > $database

#
# Restart AppleSpell.
#

launchctl stop com.apple.applespell; launchctl start com.apple.applespell
