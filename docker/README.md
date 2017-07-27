# Dockerfile for Caffe-CPU
This image can be found on [Docker Hub](https://hub.docker.com/r/alfpark/caffe/).

You must agree to the [Caffe License](https://github.com/BVLC/caffe/blob/master/LICENSE)
prior to use.

Step 1: create docker image
* cd docker; 
* sudo docker build -t daisyazcopy .; 
* docker images
* sudo docker run --name docker -it daisyazcopy
step 2: publish image to azure container registry
sudo docker login [account].azurecr.io -u [user] -p [passowrd]

sudo docker tag  daisy [].azurecr.io/example/daisy

sudo docker push [account].azurecr.io/example/daisy

step 3: create azure batch pool


python ./shipyard.py pool add --configdir ./config

step 4: submit job

python ./shipyard.py jobs  add --configdir ./config --tail stderr.txt


step 5: delete pool

python ./shipyard.py pool del --configdir ./config
