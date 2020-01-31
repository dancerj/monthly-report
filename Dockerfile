FROM debian:buster

RUN apt-get clean && \
    apt-get update && \
    apt-get install -yq \
    git \
    locales \
    lv \
    make \
    poppler-data \
    python3-pygments \
    texlive-lang-japanese \
    texlive-latex-extra \
    texlive-latex-recommended && \
    apt-get clean && \
    echo "ja_JP.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen
COPY . .
RUN kanji-config-updmap-sys ipaex && \
    mkdir -p .git/hooks/pre-commit && \
    cp git-pre-commit.sh .git/hooks/pre-commit && \
    make clean && make -j16
