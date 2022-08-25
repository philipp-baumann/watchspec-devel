## Overview

Our aim here is to template a shiny app that can read and plot spectra whilst
measurement are being made.

## Principles

watchdog is a python module that features the following components:

- Watcher:
- Handler:

## Docker setup

We want run a dockerized shiny app. Therefore, we use `rocker/shiny:4.2` as
a base image. This image exposes port 3838.

To name, run and test the image:

```
export IMAGE="spectral-cockpit/watchspec-devel"
# build image
docker build -t $IMAGE .
```

## Credits

