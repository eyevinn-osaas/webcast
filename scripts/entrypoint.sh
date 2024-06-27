#!/bin/bash

BC_ICE_SERVERS=$ICE_SERVERS
API_KEY=whipit
npm run build:app && cp -r /app/dist/* /usr/share/nginx/html/
nginx
npm start 