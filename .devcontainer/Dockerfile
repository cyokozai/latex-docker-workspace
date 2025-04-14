####################################################################################################################################
#                                                                                                                                  #
#                                                 Dockerfile for LaTeX environment                                                 #
#                                                                                                                                  #
####################################################################################################################################

FROM paperist/texlive-ja:latest

SHELL ["/bin/bash", "-c"]

ARG lang
ARG workdir
ARG username

USER ${username}

WORKDIR /home/${username}/${workdir}

ENV DEBIAN_FRONTEND=noninteractive
ENV LANG=${lang}
ENV TZ=Asia/Tokyo

RUN apt -y update &&\
    apt -y upgrade &&\
    apt -y install \
        tzdata \
        locales \
        nano \
        git \
        locales-all \
        libyaml-tiny-perl \
        libfile-homedir-perl \
        curl \
        wget &&\
    apt -y install texlive-fonts-recommended texlive-fonts-extra &&\
    kanji-config-updmap-sys auto &&\
    kanji-config-updmap-sys status &&\
    wget -P "/sty" "https://raw.githubusercontent.com/h-kitagawa/plistings/master/plistings.sty" &&\
    tlmgr update --self &&\
    tlmgr install algorithms algorithmicx algpseudocodex geometry latexindent &&\
    source ~/.bashrc

CMD [ "bash" ]
