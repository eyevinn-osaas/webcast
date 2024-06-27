FROM nginx:stable
ARG PORT=8080

RUN apt-get update
RUN apt-get install -y curl python3
RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash -
RUN apt-get install -y nodejs build-essential

WORKDIR /app

COPY . .
RUN npm install
RUN cd /app/node_modules/@eyevinn/whip-endpoint/dist && patch -u < /app/patches/api.js.patch
RUN cd /app/node_modules/@eyevinn/whip-endpoint/dist/wrtc && patch -u < /app/patches/broadcaster.js.patch
RUN cd /app/node_modules/@eyevinn/whip-endpoint/dist/broadcaster && patch -u < /app/patches/broadcaster.api.js.patch
RUN npm run build

COPY ./nginx/nginx.conf /etc/nginx/conf.d/default.conf
RUN chmod +x /app/scripts/entrypoint.sh

ENTRYPOINT [ "/app/scripts/entrypoint.sh" ]