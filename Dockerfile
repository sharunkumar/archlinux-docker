# Use an official Arch Linux image as a base
FROM archlinux:latest

RUN pacman -Syu --noconfirm
RUN pacman -S --needed base-devel --noconfirm
RUN pacman -Syu --noconfirm neofetch which git cargo

RUN echo "%sharun ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
RUN useradd -m -s /bin/bash sharun
USER sharun
WORKDIR /home/sharun/repos
RUN git clone https://aur.archlinux.org/paru.git && cd paru && makepkg -si --noconfirm
COPY paru.conf /etc/paru.conf

WORKDIR /home/sharun
CMD ["bash", "-l"]
