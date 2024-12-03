FROM node:lts-slim
# 更新 apt 源并安装所需的包
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    tzdata \
    libcairo2-dev \
    libjpeg-dev \
    libpango1.0-dev \
    libfreetype6-dev \
    libgif-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# 设置时区
ENV TZ=Asia/Shanghai
WORKDIR /root/
COPY ./ /root
RUN npm install -g pm2
RUN npm install 
#RUN npm install --unsafe-perm --canvas_binary_host_mirror=https://registry.npmmirror.com/-/binary/canvas/
EXPOSE 8081
CMD ["pm2-docker", "start", "server.js"]