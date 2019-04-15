curl https://www.openssl.org/source/openssl-1.1.1b.tar.gz | tar xz
cd openssl-1.1.1b
./config shared --prefix=/usr/local/
make
make install
