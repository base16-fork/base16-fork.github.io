.POSIX:

all: get-builder build

get-builder:
	test -f ./builder/cbase16.cpp || git clone https://github.com/base16-fork/cbase16 ./builder
	make -C ./builder

build:
	./builder/cbase16 update -c ./builder
	./builder/cbase16 make -c ./builder -o ./
	echo "<html>" > index.html
	echo "  <meta http-equiv=\"content-type\" content=\"text/html\">" >> index.html
	echo "  <title>Base16 Preview</title>" >> index.html
	echo "</html>" >> index.html
	cat ./base16-fork.github/previews/*.html >> index.html

.PHONY: all get-builder build
