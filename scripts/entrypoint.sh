#!/bin/bash

BC_ICE_SERVERS=$ICE_SERVERS
npm run build:app && cp -r /app/dist/* /usr/share/nginx/html/
nginx
npm start 