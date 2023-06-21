patch -Np1 -i ../grub-2.06-upstream_fixes-1.patch

./configure --prefix=/usr          \
            --sysconfdir=/etc      \
            --disable-efiemu       \
            --disable-werror

make

make install
mv /etc/bash_completion.d/grub /usr/share/bash-completion/completions

grub-install $LOOP --target i386-pc
