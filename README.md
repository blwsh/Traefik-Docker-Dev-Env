## Debugging

* `nslookup <domain>` - Looks up DNS for domain
* `sudo killall -HUP mDNSResponder` - Reset the DNS cache in OS X v10.10.4 or later:

# Add DNS Server

![](resources/dns-mac.gif)

## Clear browser dns cache
* Navigate to chrome://net-internals/#dns and click "Clear Host Cache"
* Navigate to chrome://net-internals/#sockets and click "Flush Socket Pools"

# Resources

* https://support.apple.com/en-us/HT202516
