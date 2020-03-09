UID=$(shell id -u)
GID=$(shell id -g)

install: docker-build

docker-build:
	docker build . -t freecad/stable

export:
	docker run -e HOME=/freecad/ -u : -v ${PWD}/projects/:/freecad/projects/ -v ${PWD}/exports/:/freecad/exports/ -v ${PWD}/macros/:/freecad/macros/ freecad/0.17 /freecad/macros/export.py
	sudo chown -R ${UID}:${GID} ${PWD}/exports/