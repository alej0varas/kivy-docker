===========
Kivy docker
===========

Build
-----
::

    docker build --rm --tag alej0/kivy .

Test
----
To check if the docker is working::

    bash Dockertest.sh

You should see a window with a "Hello world"

Run
---
::

    docker run --tty --rm --env DISPLAY=$DISPLAY --volume /tmp/.X11-unix:/tmp/.X11-unix --volume /path/to/project-root:/home/developer/src alej0/kivy /usr/bin/env python /home/developer/src/<script-name>
