FROM ubuntu
MAINTAINER Alejandro Varas alej0varas@gmail.com

RUN apt-get -y update

RUN apt-get install -y python-setuptools python-pygame python-opengl
RUN apt-get install -y python-gst0.10 python-enchant gstreamer0.10-plugins-good python-dev
RUN apt-get install -y build-essential libgl1-mesa-dev libgles2-mesa-dev zlib1g-dev python-pip
RUN apt-get install -y git
RUN pip install --upgrade Cython==0.23

# Replace 1000 with your user / group id
RUN export uid=1000 gid=1000 && \
    mkdir -p /home/developer && \
    echo "developer:x:${uid}:${gid}:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
    echo "developer:x:${uid}:" >> /etc/group && \
    echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer && \
    chmod 0440 /etc/sudoers.d/developer && \
    chown ${uid}:${gid} -R /home/developer

RUN cd && git clone git://github.com/kivy/kivy.git
RUN cd && cd kivy && make
RUN cd && cd kivy && make install

USER developer