import sys
# /usr/share/red5/webapps/sip/WEB-INF/bigbluebutton-sip.properties
try:
	myip = str(sys.argv[1])
	myprevip = '192.168.'
	myfile = open("/usr/share/red5/webapps/sip/WEB-INF/bigbluebutton-sip.properties","r")
	mynewfile = open("mynewfile.txt","w")
	for line in myfile:
		if myprevip in line:
			mynewline = line.split("=")[0]+"="+myip
			mynewfile.write(mynewline)
			mynewfile.write("\n")
		else:
			mynewfile.write(line)
			mynewfile.write("\n")
except:
	print("Error")