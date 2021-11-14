all: install

install:
	cp -r .config ~/
	cp -r Scripts/* /usr/local/bin/
	cp -r chrome ~/.mozilla/firefox/*.default-release/
