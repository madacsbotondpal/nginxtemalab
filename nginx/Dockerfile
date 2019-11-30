FROM nginx:latest
RUN mkdir -p /var/index

VOLUME /var/index
COPY ./index /var/index

RUN rm /etc/nginx/conf.d/default.conf
COPY ./conf/default.conf /etc/nginx/conf.d/default.conf

RUN chown --recursive www-data:www-data /var/index
RUN chmod --recursive 755 /var/index

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]
