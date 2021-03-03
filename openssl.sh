#!/usr/bin/env bash

# Update OpenSSL to avoid cURL error 35: error:1414D172:SSL routines:tls12_check_peer_sigalg:wrong signature type.
# @see https://askubuntu.com/questions/1102803/how-to-upgrade-openssl-1-1-0-to-1-1-1-in-ubuntu-18-04.

cd /tmp
wget https://www.openssl.org/source/openssl-1.1.1g.tar.gz
tar -zxf openssl-1.1.1g.tar.gz && cd openssl-1.1.1g
./config
make
# make test
mv /usr/bin/openssl ~/tmp
make install
ln -s /usr/local/bin/openssl /usr/bin/openssl
ldconfig
openssl version
