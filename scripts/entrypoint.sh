#!/bin/bash

export BC_ICE_SERVERS=$ICE_SERVERS
export API_KEY=whipit
export ICE_TRICKLE_TIMEOUT=2000
npm run build:app && cp -r /app/dist/* /usr/share/nginx/html/
nginx
npm start 