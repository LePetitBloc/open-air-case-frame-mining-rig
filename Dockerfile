FROM ubuntu:16.04

RUN apt-get update
RUN apt-get install -y software-properties-common sudo git
RUN add-apt-repository --enable-source ppa:freecad-maintainers/freecad-stable
RUN apt-get update
RUN useradd -lrUmd /freecad freecad
RUN adduser freecad sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER freecad

WORKDIR /freecad

# Install the dependencies needed to build FreeCAD
RUN sudo apt-get build-dep -y freecad

# Install the dependencies needed to run FreeCAD (and a build of FreeCAD itself)
RUN sudo apt-get install -y freecad

RUN mkdir -p ~/.FreeCAD/Mod
RUN cd ~/.FreeCAD/Mod
RUN git clone https://github.com/yorikvanhavre/Draft-dxf-importer.git

ENTRYPOINT ["freecadcmd"]
