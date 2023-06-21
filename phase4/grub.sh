patch -Np1 -i ../$(basename $PATCH_GRUB)

./configure --prefix=/usr          \
            --sysconfdir=/etc      \
            --disable-efiemu       \
            --disable-werror

make

make install
mv /etc/bash_completion.d/grub /usr/share/bash-completion/completions

grub-install $LOOP --target i386-pc
