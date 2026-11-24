#!/bin/bash
set -eux
WIN="/mnt/c/Users/Dr. Ghaleb Faour/Downloads/Lab11_435L"
WORKDIR="$HOME/lab11_deb"

rm -rf "$WORKDIR"
mkdir -p "$WORKDIR/myapp/DEBIAN" \
         "$WORKDIR/myapp/usr/local/bin" \
         "$WORKDIR/myapp/usr/share/doc/helloworld-line-faour"

gcc -o "$WORKDIR/helloworld" "$WIN/source/helloworld.c"
"$WORKDIR/helloworld"

cp "$WORKDIR/helloworld" "$WORKDIR/myapp/usr/local/bin/helloworld"
cp "$WIN/docs/README.md" "$WORKDIR/myapp/usr/share/doc/helloworld-line-faour/README.md"
cp "$WIN/docs/user_guide.txt" "$WORKDIR/myapp/usr/share/doc/helloworld-line-faour/user_guide.txt"
cp "$WIN/deb/control" "$WORKDIR/myapp/DEBIAN/control"

chmod 755 "$WORKDIR/myapp/usr/local/bin/helloworld"
chmod 755 "$WORKDIR/myapp/DEBIAN"
chmod 644 "$WORKDIR/myapp/DEBIAN/control"

cd "$WORKDIR"
dpkg-deb --build myapp helloworld_Line_Faour.deb
dpkg-deb -I helloworld_Line_Faour.deb
dpkg-deb -c helloworld_Line_Faour.deb

mkdir -p "$WIN/packages"
cp helloworld_Line_Faour.deb "$WIN/packages/"
cp "$WORKDIR/helloworld" "$WIN/packages/helloworld_linux"
cp "$WIN/deb/control" "$WIN/packages/control"
ls -la "$WIN/packages"
echo DEB_OK
