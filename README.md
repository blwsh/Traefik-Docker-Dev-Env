## Debugging

* `nslookup <domain>` - Looks up DNS for domain
* `sudo killall -HUP mDNSResponder` - Reset the DNS cache in OS X v10.10.4 or later:

# Add DNS Server

![](resources/dns-mac.gif)

## Clear browser dns cache
* Navigate to chrome://net-internals/#dns and click "Clear Host Cache"
* Navigate to chrome://net-internals/#sockets and click "Flush Socket Pools"

## Issues

* There seems to be some probelms with dnsmasq hosted in docker and browser caches if you visit a dnsmasq domain (for exmple: \*.local.blw.sh) a work round for this would be to install DNSMasq on your local machine instead of using the docker service. A disadvantage for this method is no support for windows. Another alternative would be configuring domain DNS to point to a local host.
* A weird SSL error occurs when visiting a wildcard domiain for the first time when using Cloudflare Proxy service. A workaround is to visit the site in incognito while cache clears or point a domain to loacalhost via Cloudflare DNS.

# Resources

* https://support.apple.com/en-us/HT202516
