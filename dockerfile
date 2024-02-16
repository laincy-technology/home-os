FROM debian:stable-slim



RUN apt update && \
    apt upgrade && \
    apt install -y gawk wget git diffstat unzip texinfo gcc build-essential chrpath socat cpio python3 python3-pip python3-pexpect xz-utils debianutils iputils-ping python3-git python3-jinja2 libegl1-mesa libsdl1.2-dev python3-subunit mesa-common-dev zstd liblz4-tool file locales libacl1 pipx && \
    useradd -m builder && \
    echo 'en_US.UTF-8 UTF-8' >> /etc/locale.gen && \
    locale-gen

ENV LANG=en_US.UTF-8

USER builder

WORKDIR /home/builder/

COPY --chown=builder ./ /home/builder/

RUN bash init.sh