# Web Stack Debugging #1

## 0. Nginx likes port 80

This task fixes an issue where Nginx is not running and therefore is not listening on port 80.

The Bash script `0-nginx_likes_port_80` starts the Nginx service using `service nginx start`.
