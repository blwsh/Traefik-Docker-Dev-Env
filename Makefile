install:
	docker network create traefik
	sudo networksetup -setdnsservers Wi-Fi 127.0.0.1 192.168.1.1 8.8.8.8
