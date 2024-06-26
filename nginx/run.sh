echo "fastcgi_param HUB_SECRET \"${HUB_SECRET:-$(openssl rand -base64 32)}\";" > /etc/nginx/fastcgi_params_hub
service fcgiwrap start
chmod +x /deploy/nginx/cgi-bin/* 2> /dev/null
chown nginx /var/run/fcgiwrap.socket
chgrp nginx /var/run/fcgiwrap.socket

export FILE=/etc/nginx/nginx.conf.template
if [ -f "$FILE" ]; then
  envsubst '${SERVER_BASEPATH}' < $FILE > /etc/nginx/nginx.conf
fi

nginx -g 'daemon off;'
