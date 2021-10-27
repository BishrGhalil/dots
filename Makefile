all: install

install:
	cp -r .config Scripts ~/
	cp -r chrome ~/.mozilla/firefox/*.default-release/
