FROM nginx:latest
COPY default.conf /etc/nginx/conf.d/
ENV host=app6.w0rm30.seg.br
COPY build_cert.sh /root
RUN cd /etc/ssl/ &&\
    bash /root/build_cert.sh $host