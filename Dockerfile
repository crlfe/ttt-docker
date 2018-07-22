FROM debian:buster

RUN apt-get update -q \
    && apt-get install -qy build-essential jekyll pandoc python3 \
                           python-bibtexparser texlive-bibtex-extra \
                           texlive-latex-extra

ENTRYPOINT /usr/local/sbin/docker-entry.sh
WORKDIR /mnt

COPY docker-entry.sh /usr/local/sbin/
RUN chmod +x /usr/local/sbin/docker-entry.sh
