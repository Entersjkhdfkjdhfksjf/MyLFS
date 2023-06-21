# MPFR Phase 4
sed -e 's/+01,234,567/+1,234,567 /' \
    -e 's/13.10Pd/13Pd/'            \
    -i tests/tsprintf.c

./configure --prefix=/usr        \
            --disable-static     \
            --enable-thread-safe \
            --docdir=/usr/share/doc/mpfr-4.2.0

make
make html

if $RUN_TESTS
then
    set +e
    make check
    set -e
fi

make install
make install-html

