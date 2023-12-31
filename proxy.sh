# Reverse Proxy
# nginx, haproxy, apache, traefik, squid
sudo apt install nginx
sudo tee /etc/nginx/sites-available/proxy.conf <<< "
server {
	listen 80;
	location /images {     <-- examples.com/images/dog.jpg, examples.com/images/animals/cat.jpg
		proxy_pass https://1.1.1.1;   <-- proxies to this webserver
	}
}
"
cat /etc/nginx/proxy_params
ls /etc/nginx/sites-enabled/  # all symlinks
sudo ln -s /etc/nginx/sites-available/proxy.conf /etc/nginx/sites-enabled/proxy.conf
sudo rm /etc/nginx/sites-enabled/default  # symlink
sudo nginx -t
sudo systemctl reload nginx.service

# Load Balancer
sudo tee /etc/nginx/sites-available/lb.conf <<< "
upstream mywebservers {
	least_conn;
	server 1.2.3.4 weight=3 down;
	server 5.6.7.8;
	server 15.16.17.18:8081;
	server 10.20.30.40 backup;
}
server {
	listen 80;
	location / {
		proxy_pass http://mywebservers;
	}
}
"
sudo ln -s /etc/nginx/sites-available/lb.conf /etc/nginx/sites-enabled/lb.conf
sudo nginx -t
sudo systemctl reload nginx.service
