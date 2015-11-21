docker run -ti --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v $(pwd):/home/developer/src alej0/kivy /usr/bin/env python /home/developer/src/tests.py
