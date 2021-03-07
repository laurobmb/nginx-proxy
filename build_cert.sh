#!/bin/bash

host="app6.w0rm30.seg.br"

openssl genrsa -out $host.key 2048

openssl rsa -in $host.key -out $host.key.sem.senha

openssl req -new -key $host.key -out $host.csr -subj "/C=BR/ST=Pernambuco/L=Recife/O=sv/O=TRF5/CN=$host"

openssl x509 -req -days 365 -in $host.csr -signkey $host.key -out $host.crt

rm -f $host.csr $host.key.sem.senha