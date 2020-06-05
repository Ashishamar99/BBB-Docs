git clone these files while installing on a server - 
during installation, nodejs shell script, which we are using wget to fetch the contents, will not work and gitcloning the original repo will not work as well, put that in a public repo and git clone that. (make sure there are only shell scripts or text files, no images or any other server unsupported files)

while setting up the development environment, the apache flex zip file 
(wget http://download.macromedia.com/pub/flex/sdk/builds/flex4.6/flex_sdk_4.6.0.23201B.zip -P in/) will not work again if it fails once, put that in another repo and try to git clone that.



