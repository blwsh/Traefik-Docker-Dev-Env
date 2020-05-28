# Traefik Docker Dev Env

Traefik can be used as a reverse proxy for your docker containers. It enables to automatically create virtual hosts and SSL certificates for environments.

## Setup

1. Duplicate the .env.example file and call it .env. Replace the example credentials with your Cloudflare credentials.
2. Add 127.0.0.1 to your systems DNS.
3. Run `docker-compose up -d`

## General Debugging

### Mac

* `nslookup <domain>` - Looks up DNS for domain
* `sudo killall -HUP mDNSResponder` - Reset the DNS cache in OS X v10.10.4 or later:

# Add DNS Server

To use custom domains (I.E domains not ending in .localhost) you need to tell your machine to use your local DNS server. The gif below shows how to do this on Mac. In future releases there will be an install scrit that configures local DNS for you.

![](resources/dns-mac.gif)

## Clear browser dns cache
* Navigate to chrome://net-internals/#dns and click "Clear Host Cache"
* Navigate to chrome://net-internals/#sockets and click "Flush Socket Pools"

## Issues

* There seems to be some problems with dnsmasq hosted in docker and browser caches if you visit a dnsmasq domain (for example: \*.local.blw.sh) a work round for this would be to install dnsmasq on your local machine instead of using the docker service. A disadvantage for this method is no support for windows. Another alternative would be configuring domain DNS to point to a local host.
* A weird SSL error occurs when visiting a wildcard domain for the first time when using Cloudflare Proxy service. A workaround is to visit the site in incognito while cache clears or point a domain to localhost via Cloudflare DNS.

# Resources

* https://support.apple.com/en-us/HT202516
