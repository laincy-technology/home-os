FROM debian:stable-slim



RUN apt update && \
    apt upgrade && \
    apt install -y which sed make binutils build-essential diffutils gcc g++ patch gzip bzip2 perl tar cpio unzip rsync file bc findutils wget libncurses5-dev git locales && \
    useradd -m builder && \
    echo 'en_US.UTF-8 UTF-8' >> /etc/locale.gen && \
    locale-gen && \
    git clone https://github.com/buildroot/buildroot /home/builder/buildroot/ && \
    chown -R builder /home/builder/
ENV LANG=en_US.UTF-8

USER builder

WORKDIR /home/builder/

COPY --chown=builder ./ /home/builder/

WORKDIR /home/builder/