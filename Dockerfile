FROM minddocdev/node-alpine:14.11.0
RUN echo -e 'http://mirrors.aliyun.com/alpine/v3.9/main/' > /etc/apk/repositories
RUN apk update 
RUN apk add build-base tzdata  cairo-dev jpeg-dev pango-dev freetype-dev giflib-dev&& \
  cp -r -f /usr/share/zoneinfo/Asia/Chongqing /etc/localtime 
WORKDIR /root/
COPY ./ /root
RUN npm install -g pm2
RUN npm install --unsafe-perm --canvas_binary_host_mirror=https://registry.npmmirror.com/-/binary/canvas/
EXPOSE 8081
CMD ["pm2-docker", "start", "server.js"]