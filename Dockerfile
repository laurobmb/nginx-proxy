FROM nginx:latest

COPY default.conf /etc/nginx/conf.d/

#COPY app6.w0rm30.seg.br.crt /etc/ssl/app6.w0rm30.seg.br.pem
#COPY app6.w0rm30.seg.br.key /etc/ssl/app6.w0rm30.seg.br.key

COPY build_cert.sh /root

RUN cd /etc/ssl/ &&\
    bash /root/build_cert.sh

