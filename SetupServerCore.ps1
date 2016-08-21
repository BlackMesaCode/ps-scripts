netsh interface ip set address Ethernet0 static <ipAddress>
<subnetMask> <gatewayAddress> 1
netsh interface ipv4 add dnsserver Ethernet0 address=<dnsServerAddress> index=1; 
Rename-Computer -NewName <computerName> -Force; 
sleep 5; 
Add-Computer -domainname <domainName> -credential <domain>\<username> -force -options JoinWithNewName,AccountCreate -restart