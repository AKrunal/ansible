FROM archlinux AS bare
WORKDIR /usr/local/bin
RUN  pacman -Sy --noconfirm ansible

FROM bare AS kishan
ARG TAGS
RUN groupadd  kishan
RUN useradd  -g kishan  -m --password "kishan" kishan

FROM kishan
COPY . .
CMD ["sh", "-c", "ansible-playbook  first.yml"]
