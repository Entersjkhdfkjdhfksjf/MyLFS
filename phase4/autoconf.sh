# Autoconf Phase 4
sed -e 's/SECONDS|/&SHLVL|/'               \
    -e '/BASH_ARGV=/a\        /^SHLVL=/ d' \
    -i.orig tests/local.at

./configure --prefix=/usr

make

if $RUN_TESTS
then
    set +e
    make check TESTSUITEFLAGS=-j4
    set -e
fi

make install 

