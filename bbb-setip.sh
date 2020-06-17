sudo bbb-conf --setip $1
sudo bbb-conf --clean
: '
If you have an error in the bbb-sip.properties file

Execute the below commands - 

chmod +x replace_ip_bbb_sip_properties.py 
python3 replace_ip_bbb_sip_properties.py $1
sudo mv mynewfile.txt /usr/share/red5/webapps/sip/WEB-INF/bigbluebutton-sip.properties
sudo yq w -i /usr/local/bigbluebutton/bbb-webrtc-sfu/config/default.yml freeswitch.sip_ip $1
sudo chown bigbluebutton:bigbluebutton /usr/local/bigbluebutton/bbb-webrtc-sfu/config/default.yml
sudo bbb-conf --clean
'