#!/bin/bash#
docker build -t backend-contact-machine-app:1.0 -f dev.Dockerfile .

# run container
#sudo docker run -p 8000:8000 backend-contact-machine-app:1.0

# zip images
# docker save backend-contact-machine-app:1.0 > backend-contact-machine-app:1.0.tar

# unzip images
# docker load -i backend-contact-machine-app:1.0.tar