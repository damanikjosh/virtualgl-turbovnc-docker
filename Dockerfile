ARG UBUNTU_VERSION=22.04

FROM nvidia/opengl:1.2-glvnd-runtime-ubuntu${UBUNTU_VERSION}
LABEL authors="Joshua J. Damanik"

ARG VIRTUALGL_VERSION=3.1
ARG TURBOVNC_VERSION=3.1
ENV DEBIAN_FRONTEND noninteractive

# Install some basic dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    wget \
    xorg \
    xauth \
    x11-xserver-utils \
    libegl1-mesa \
    libgl1-mesa-glx \
    lubuntu-desktop \
    xterm \
    && rm -rf /var/lib/apt/lists/*

# Install virtualgl and turbovnc
RUN wget -qO /tmp/virtualgl_${VIRTUALGL_VERSION}_amd64.deb https://sourceforge.net/projects/virtualgl/files/${VIRTUALGL_VERSION}/virtualgl_${VIRTUALGL_VERSION}_amd64.deb/download \
    && wget -qO /tmp/turbovnc_${TURBOVNC_VERSION}_amd64.deb https://sourceforge.net/projects/turbovnc/files/${TURBOVNC_VERSION}/turbovnc_${TURBOVNC_VERSION}_amd64.deb/download \
    && dpkg -i /tmp/virtualgl_${VIRTUALGL_VERSION}_amd64.deb \
    && dpkg -i /tmp/turbovnc_${TURBOVNC_VERSION}_amd64.deb \
    && rm -rf /tmp/*.deb


ENV PATH ${PATH}:/opt/VirtualGL/bin:/opt/TurboVNC/bin

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/bin/bash"]
