FROM archlinux AS bare
WORKDIR /usr/local/bin
RUN  pacman -Sy --noconfirm ansible sudo

FROM bare AS kishan
ARG TAGS
RUN groupadd --gid 1000 kishan
RUN useradd --comment "kishan" --uid 1000 --gid 1000  -m --password "" kishan
RUN usermod -aG sudo kishan
RUN echo 'root:root' | chpasswd
USER kishan
WORKDIR /home/kishan

FROM kishan
COPY . .
