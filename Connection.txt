<ip_addr> -> 192.168.43.81 (find under the output of ifconfig)
<user-name> -> ashish-amar

<ip_addr> and <user-name> are both variables here, replace them with their respective values according to your machine.

In this whole doc, we are searching for ip address which was written in the installation files when the VM was setup using NAT configuration

1) change to bridged adapter under VM
2) take snapshot
3) ifconfig - note down ip addr
4) check if inet addr is reachable, use ping or python3 server (in host)
5) Stop bbb servers
6) cd /home/<user-name> (navigate to home directory)
7) cd /etc
8) cd nginx/sites-available/
9) ll
10) cd /home/<user-name>
11) sudo bbb-conf --setip <ip_addr>
12) sudo bbb-conf --status
13) sudo bbb-conf --secret - check the links on host OS
14) sudo bbb-conf --clean
15) cat /usr/share/red5/webapps/sip/WEB-INF/bigbluebutton-sip.properties | grep -n "10."
16) sudo vi +2 /usr/share/red5/webapps/sip/WEB-INF/bigbluebutton-sip.properties 
17) replace 

bbb.sip.app.ip=10.0.2.15
freeswitch.ip=10.0.2.15 (both ip addresses with inet address)

18) sudo bbb-conf --clean
19) cat /etc/bigbluebutton/nginx/sip.nginx | grep -n "10."
20) sudo vi /etc/bigbluebutton/nginx/sip.nginx 

(replace inet address at proxy_pass http://10.0.2.15:5066;), replace 10.0.2.15 with <ip_addr> LEAVE THE PORT NUMBER UNCHANGED.

21) sudo bbb-conf --clean
22) cat /opt/freeswitch/etc/freeswitch/vars.xml | grep -n "10.0.2.15"
23) sudo vi +60 /opt/freeswitch/etc/freeswitch/vars.xml
(61st line contains the ip addr, replace that with <ip_addr>)

24) sudo bbb-conf --clean

25)  sudo yq w -i /usr/local/bigbluebutton/bbb-webrtc-sfu/config/default.yml freeswitch.sip_ip <ip_addr>
26) sudo chown bigbluebutton:bigbluebutton /usr/local/bigbluebutton/bbb-webrtc-sfu/config/default.yml
27) sudo bbb-conf --clean

Links - 
https://www.google.com/search?q=change+ip+address+in+bigbluebutton&oq=change+ip+address+in+bigbluebutton+&aqs=chrome..69i64j69i57.9844j0j7&sourceid=chrome&ie=UTF-8

https://github.com/ehomework/bigbluebutton-fork/wiki/Instructions-for-changing-IP

https://duckduckgo.com/?q=bigbluebutton-client%2Fsrc%2Fconf%2Fconfig.xml&ia=web

https://docs.bigbluebutton.org/client-configuration.html#configxml

https://duckduckgo.com/?q=rebuild+bob-client+bigbluebutton&ia=web

https://duckduckgo.com/?q=bigbluebutton-web%2Fgrails-app%2Fconf%2Fbigbluebutton.properties&ia=web

https://docs.bigbluebutton.org/admin/configuration-files.html

https://stackoverflow.com/questions/57615368/you-did-not-pass-the-checksum-security-check-in-bbb

https://duckduckgo.com/?q=refresh+bigbluebutton+secret+key&ia=web

https://docs.bigbluebutton.org/admin/bbb-conf.html

https://duckduckgo.com/?q=log+file+too+short+bigbluebutton&ia=web

https://duckduckgo.com/?q=log+file+too+short+(less+than+100+lines)%3A+%2Fusr%2Fshare%2Fred5%2Flog%2Fbigbluebutton.log&ia=web

