#!/bin/sh

#
# Usage.
#

usage () {
cat << EOF

  Usage: learn [options] <word> [language]

  Options:

    -h, --help     output usage information
    -v, --version  output version

  Examples:

    $ learn npm
    $ learn stringification en_GB

  See also: man 1 learn
EOF
}

#
# Version.
#

version () {
  echo "1.0.0"
}

#
# Options.
#

case $1 in
  "")           usage; exit 1 ;;
  -h|--help)    usage; exit ;;
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

killall -e AppleSpell &> /dev/null
