# Developing Teaching Tech Together in Docker

Docker provides a simple and reproducible container for all of the
tools and libraries used to build Teaching Tech Together.

## Install Docker

See: https://docs.docker.com/install/

## Use a prebuilt Docker image

Open a terminal in your `teachtogether.tech` directory and run:

    docker run --rm -i -t -p 127.0.0.1:4000:4000 -v `pwd`:/mnt crlfe/ttt-docker

The terminal will switch to Linux bash with a builder@docker prompt.

    cd host
    make lang=en site
    jekyll serve -I --host 0.0.0.0   # Instead of `make serve`

Browse to http://127.0.0.1:4000 to see the in-development site.

## Build a custom Docker image

This is only needed if you modify files in the `ttt-docker` directory.

Open a terminal in your `ttt-docker` directory and run:

    docker build --tag ttt-docker .

To run the custom image, use the `docker run` command above without `crlfe/`.
