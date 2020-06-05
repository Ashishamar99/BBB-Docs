<ip_addr> -> 192.168.43.81 (find under the output of ifconfig)

<user_name> -> ashish-amar

<ip_addr> and <user-name> are both variables here, replace them with their respective values according to your machine.
  
----------------------------------------------------------------------------------------------------------------------------------------

In this whole doc, we are searching for ip address which was written in the installation files when the VM was setup using NAT configuration

**Execute the steps as follows to fetch a connection between host OS and server running on VM and make sure that bbb server runs successfully.**

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
