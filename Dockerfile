####################################################################################################################################
#                                                                                                                                  #
#                                                 Dockerfile for LaTeX environment                                                 #
#                                                                                                                                  #
# Usage:                                                                                                                           #
#   docker compose up -d                                                                                                           #
#                                                                                                                                  #
# Export PDF with tex2pdf command:                                                                                                 #
#   tex2pdf <filename.tex>                                                                                                         #
#                                                                                                                                  #
####################################################################################################################################

FROM ghcr.io/being24/latex-docker:latest

SHELL ["/bin/bash", "-c"]

ARG lang
ARG t2p
ARG workdir

WORKDIR /root/${workdir}

USER root

ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm
ENV DISPLAY host.docker.internal:0.0

COPY ./tex2pdf ${t2p}

RUN apt -y update &&\
    apt -y upgrade &&\
    apt -y install \
        tzdata \
        locales \
        nano \
        git \
        curl \
        wget \
        unzip &&\
    apt -y install texlive-fonts-recommended texlive-fonts-extra &&\
    kanji-config-updmap-sys auto &&\
    kanji-config-updmap-sys status &&\
    chmod +x ${t2p}tex2pdf &&\
    export PATH=$PATH:~/bin &&\
    source ~/.bashrc &&\
    echo 'alias t2p="tex2pdf"' >> ~/.bashrc &&\
    source ~/.bashrc

ENV LANG ${lang}
ENV TZ Asia/Tokyo

CMD [ "bash" ]