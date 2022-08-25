FROM rocker/shiny:4.2

ARG DEBIAN_FRONTEND=noninteractive

# Install system requirements for index.R as needed
# source: https://github.com/analythium/covidapp-shiny
RUN apt-get update && apt-get install -y \
  --no-install-recommends \
  git-core \
  libssl-dev \
  libcurl4-gnutls-dev \
  curl \
  libsodium-dev \
  libxml2-dev \
  libicu-dev \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y \
  python3.10 \
  python3-pip

ENV _R_SHLIB_STRIP_=true
# COPY Rprofile.site /etc/R
RUN install2.r --error --skipinstalled \
  shiny.semantic \
  jsonlite \
  ggplot2 \
  plotly \
  remotes \
  reticulate

COPY ./app/* /srv/shiny-server/

USER shiny

EXPOSE 3838

CMD ["/usr/bin/shiny-server"]