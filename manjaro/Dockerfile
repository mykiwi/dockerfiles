FROM jonathonf/manjaro

# based on zalox/manjaro
RUN set -xe \
 && mkdir -p /root/.gnupg /root/.gnupg/dirmngr-cache.d \
 && touch /root/.gnupg/dirmngr_ldapservers.conf \
 && pacman -Sy \
 && gpg -k \
 && pacman-key --init \
 && pacman-key --populate archlinux \
 && pacman-key --populate manjaro \
 && dirmngr < /dev/null \
 && pacman -S --noconfirm pacman-mirrors libusb ca-certificates \
 && pacman -Su --noconfirm \
 && pacman -Sc --noconfirm

# mine
RUN set -xe \
 && pacman --noconfirm --noprogressbar -Syyu \
 && pacman --noconfirm --noprogressbar -Syyu \
 && pacman --noconfirm --noprogressbar -S pamac sudo \
 && useradd --create-home --password=foo --groups=wheel mykiwi \
 && echo '%wheel ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers \
 && echo 'Set disable_coredump false' >> /etc/sudo.conf

WORKDIR /home/mykiwi
USER mykiwi
