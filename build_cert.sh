#!/bin/bash
host=$1
openssl genrsa -out rootCA.key 2048
openssl req -out rootCA.pem -key rootCA.key -new -x509 -days 3650 -subj "/C=BR/ST=Pernambuco/L=Recife/O=Suporte Avancado/O=Security/CN=root.$host"
openssl genrsa -out $host.key 2048
openssl req -out $host.req -key $host.key -new -subj "/C=BR/ST=Pernambuco/L=Recife/O=Suporte Avancado/O=Security/CN=$host"
openssl x509 -in $host.req -out $host.pem -days 365 -req -CA rootCA.pem -CAkey rootCA.key -CAcreateserial
openssl verify -CAfile rootCA.pem -purpose sslserver $host.pem
rm -f $host.req $host.csr $host.key.sem.senha rootCA.srl