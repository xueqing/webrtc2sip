#/bin/sh

./autogen.sh && ./configure --with-ssl --with-srtp --with-speexdsp --with-ffmpeg LDFLAGS='-ldl' LIBS='-ldl'
make clean && make
#sudo make install