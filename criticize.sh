#!/bin/sh

OS=`uname`
if [ "$OS" = "Darwin" ] ; then
    MYFULL="$0"
else
    MYFULL=`readlink -sm $0`
fi
BINDIR=`dirname $MYFULL`
MYDIR=`( cd $BINDIR ; pwd )`

check_ruby_syntax() {
  echo "Ruby syntax ..."
  find "${MYDIR}" -type f -name '*.rb' | while read rb ; do
    ruby -c $rb > /dev/null
    if [ "$?" != 0 ] ; then
      exit 1
    fi
  done

  if [ "$?" != 0 ] ; then
    echo "Ruby syntax is not happy"
    exit 1
  fi
  echo "Ruby syntax is happy."
}

run_foodcritic() {
  echo "Foodcritic ..."
  foodcritic  -I "${MYDIR}"/foodcritic/customink-rules.rb \
              -I "${MYDIR}"/foodcritic/etsy-rules.rb \
              -f correctness \
              -f ~ETSY004 -t ~ETSY004 \
              -f ~CINK001 -t ~CINK001 \
              -f ~FC033   -t ~FC033 \
              -f ~FC037   -t ~FC037 \
              "${MYDIR}/attributes" \
              "${MYDIR}/definitions" \
              "${MYDIR}/files" \
              "${MYDIR}/libraries" \
              "${MYDIR}/providers" \
              "${MYDIR}/recipes" \
              "${MYDIR}/resources" \
              "${MYDIR}/templates"

  if [ "$?" != 0 ] ; then
    echo "Foodcritic is not happy"
    exit 1
  fi
  echo "Foodcritic is happy."
}

check_ruby_syntax
run_foodcritic

echo "-------------------------"
echo "------- ALL HAPPY -------"
echo "-------------------------"
